Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id BA2EF619AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 16:05:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v4so5027976wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 08:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5sCleK8e9f5wdc55+GzWZ9LVzexWY0P9FFJXPhcJAwA=;
	b=BNqfS1AKis+/LD5mUdg+z/7cBtbGuAbfI8OnfhEFfK82Hnq1P2nFvSrR7GJkZfjxTg
	d1gKeTcYWi/Sls6ofrZ7W1UDFvFWSsTQ+1Mxk+h/RLXsAarbG7xkEGcWFORUwzCf5FPY
	4hHI7oFl+8z9jszdb0PzeTdHlwZULLKKJsGkEtn/FKWa7mIuwqNT6ZQIl5AcvZYkxxz7
	gMpkVgFRNYTSAE1oIfjP36csqE887jWAUffx6eBmWO1GmWvGnY6MxCM37ytsOVtSxPpL
	jx83UURHBchiTAssRIrVpborl6z/uQu3IgPiNEN7EXh4Ymfr2oiqRHZlSLhJl63rLY58
	KCxg==
X-Gm-Message-State: ANhLgQ0dcIrJFJISgF8vKBHf5+HDv15n5aBxhWFvyNQZyXW4rRUI8krj
	6Zh1lV3Nu9uHF5M+FOvQHSQCZYH6
X-Google-Smtp-Source: ADFU+vvEU/n5J9/1ezoVrBiawvopotvCIGBuAgpIGnXndcaU9qrA9pVZMQ2K/Ml6hzOEEb/PhJAoPQ==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr5779295wrp.97.1583251517071;
	Tue, 03 Mar 2020 08:05:17 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e8sm35335861wrr.69.2020.03.03.08.05.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 08:05:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 16:05:12 +0000
Message-Id: <20200303160513.17645-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200303160513.17645-1-git@andred.net>
References: <20200303160513.17645-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 3/4] bitbake.conf: omit XZ threads and RAM from sstate signatures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2020 16:05:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The number of threads used, and the amount of memory allowed
to be used, should not affect sstate signatures, as they
don't affect the outcome of the compression if xz operates
in multi-threaded mode [1].

Otherwise, it becomes impossible to re-use sstate from
automated builders on developer's machines (as the former
might execute bitbake with certain constraints different
compared to developer's machines).

This is in particular a problem with the opkg package writing
backend, as the OPKGBUILDCMD depends on XZ_DEFAULTS. Without
the vardepexclude, there is no re-use possible of the
package_write_ipk sstate.

Whitelist the maximum number of threads and the memory limit
given assumptions outlined in [2] below.

Signed-off-by: André Draszik <git@andred.net>

[1] When starting out in multi-threaded mode, the output is always
deterministic, as even if xz scales down to single-threaded later,
the archives are still split into blocks and size information is
still added, thus keeping them compatible with multi-threaded mode.
Also, when starting out in multi-threaded mode, xz never scales
down the compression level to accomodate memory usage restrictions,
it just scales down the number of threads and errors out if it
can not accomodate the memory limit.

[2] Assumptions
* We only support multi-threaded mode (threads >= 2), builds
  should not try to use xz in single-threaded mode
* The thread limit should be set via XZ_THREADS, not via
  modifying XZ_DEFAULTS or XZ_OPTS, or any other way
* The thread limit should not be set to xz's magic value
  zero (0), as that will lead to single-threaded mode on
  single-core systems.
---
 meta/conf/bitbake.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 131ba296d3..4b544a22cd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -795,7 +795,10 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 
 # Default parallelism and resource usage for xz
-XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count(at_least=2)}"
+XZ_MEMLIMIT ?= "50%"
+XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
+XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
+XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
 ##################################################################
 # Magic Cookie for SANITY CHECK
-- 
2.23.0.rc1


