Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3BAD8600A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 12:59:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m10so10645452wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 04:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XPyAMPPJUMEWEy7Q8Ra7jR/RhSAZYd4/N07QocLKjHw=;
	b=AvLe3+fdkhJNYYZzT6FcBFTbaLX42jJV+lW4eZFzTGZPhMul6NN/F5945ndWqfL0AQ
	0r/gkRge7X3h44LL/OJMHSpQV9rKyONj3UErYR//zp9SH2hK1Mkp3ne7kv59kZayDR5r
	hhuMeFYhqrSXBj5BTK6Hb7Qn3RAjcah8uY3j2dYYUBh1eeE21nXGgdZ8TuAzd5UZfXUP
	7rqc4qkrputcF7jJAKJ6eMBtX8UHLs6wzmDrSfO/4tydd/pm8/joZ5AxPtubRQX8kvAH
	B1/TPO9Nv1rR7lSrn+ZdfdH0IBWyy1iGV+d98a5xbXg9Bx9OozY6JKRWVh0l9yvNQ5fW
	WEiA==
X-Gm-Message-State: APjAAAUWJNoJhNunKraIFzIDdGdgzJ19q/uYBQQgQBdHl1tEoZQY//RU
	/pjwbSNvKwQUjK9msmOyXhpWuDKx
X-Google-Smtp-Source: APXvYqwzOWZqcXxtHeb/QufVdsRSiJ/JBZ3d9b14aIoO33WcJyGQajKC458Cf1vJIbjnnkAPgLPgWQ==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr22666739wme.21.1582549196684; 
	Mon, 24 Feb 2020 04:59:56 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b13sm19993147wrq.48.2020.02.24.04.59.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 04:59:55 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 12:59:55 +0000
Message-Id: <20200224125955.26771-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 12:59:56 -0000
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

Signed-off-by: André Draszik <git@andred.net>

---
v2: remove Gerrit Change-Id line
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


