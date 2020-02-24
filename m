Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E07976027C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 12:35:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s10so8830530wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 04:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RGME0C7TA4r0afU/1Z5KlKqNPJQZMBK1m0c+Qlh5cJU=;
	b=K1GLMdn6vkmcQkfuybTJf72afiwhAFLuZcCxZK85JGiiGxvucLHza5LCpEFJ5a0shE
	Hsc9oqnBekTePpsd2yHQj3EOZhQM+ikjcS64qkIwlcrPihkqhDPy1hKTsWPDYSasNuXq
	8+a2Ecb0NGpOZLZDrEg2cm+w5APAm62YiOALzMgs8W1xb+EB71+o259vGswqU39W394T
	nIrXLjMjj8hzxgQt/vgNAdiFmkLj0XhtuuIdni43aSDPNIs+eQBY0rwzcXwJvSp7SS3O
	oIpYwkKB3ahHES6I+xBfIucQvcC9tdf015xJ4XVOG4nSdDvtCBTjmVuW1mwnvoleLjkI
	0HQQ==
X-Gm-Message-State: APjAAAVF7H9bTxT2n+ti9S+UT7TCFw4xCsMYeSP3QumaQWI2qsQ9DNgF
	gHfO6pFlTqRMDBGZ9CYXjRM7ua+Z
X-Google-Smtp-Source: APXvYqzzVZhQFtNdGV5+6O4oTMf0fPsJhyTefLric6pxS+SjPdWRO4KW9yT5Z6rhAmdQzm+5SY2Ucw==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr23088374wmi.10.1582547721258; 
	Mon, 24 Feb 2020 04:35:21 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id v8sm18167242wrw.2.2020.02.24.04.35.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 04:35:20 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 12:35:19 +0000
Message-Id: <20200224123519.26348-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 12:35:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The number of threads used, and the amount of memory allowed
to be used, should not affect sstate signatures, as they
don't affect the result.

Otherwise, it becomes impossible to re-use sstate from
automated builders on developer's machines (as the former
might execute bitbake with certain constraints different
compared to developer's machines).

This is in particular a problem with the opkg package writing
backend, as the OPKGBUILDCMD depends on XZ_DEFAULTS. Without
the vardepexclude, there is no re-use possible of the
package_write_ipk sstate.

The reason XZ_DEFAULTS as a whole isn't being whitelisted as
such here is that some arguments can affect the outcome of
the xz operation, so the approach taken is to only
whitelist the safe flags memlimit and # of threads.

Change-Id: I20d6ee5485d59a6a0d45fb679c503b035cbe1c40
Signed-off-by: André Draszik <git@andred.net>
---
 meta/conf/bitbake.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 954c06b313..d5a1a2471d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -794,7 +794,10 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 
 # Default parallelism and resource usage for xz
-XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count()}"
+XZ_MEMLIMIT ?= "50%"
+XZ_THREADS ?= "${@oe.utils.cpu_count()}"
+XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
+XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
 ##################################################################
 # Magic Cookie for SANITY CHECK
-- 
2.23.0.rc1


