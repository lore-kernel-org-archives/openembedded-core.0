Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 09DBA74FAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 15:42:10 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t11-v6so3875847wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 08:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LF//e9I0tAfV4FAa2TKcZmAP+y8f8/WX9pMcerH6KxY=;
	b=lpQ0nKoKK9BB8DiUX9bIdsS4NZjIM0WY9iY+6TFneazHvKvgJSaJWXxpuDE8vsm5Fo
	9XeVBMDJ5NPWBuqoVUzynU8tHK2GwWI7l7ACIn9tt/oUTTNimGgyM6WJRp0Gd8KGA/RR
	MrIl9O9Ujmr6+/dKi8qoygKlnIpVvyN21aWUUWzNI5h5FeiUUbZepi+yNdDjraVWJPyJ
	4vX23IKpo+gyA7c339E5lrdA135DPxsZEERddhQg9b7zJINFQ/wUCA5ng9p09igvbUA1
	3eGoKqxwMXn3oaZjp27FGT66NL9/9zLE84WmQTmqIXIzEw3DwCJdlERCKYkkGdomPojA
	9JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LF//e9I0tAfV4FAa2TKcZmAP+y8f8/WX9pMcerH6KxY=;
	b=QvkJbna3KpjDBTELgm9zjR4A+N538ffaCem8V51x6+BlcnJ4hY1WTChmlDJfIi6NaZ
	PBaLUPl6EDk8RNnWjwoqXGToplzfpZmwwiIhAcsXgv6s2ljmsSB8Xvcv9b24DACTvI0j
	gwHut+Dxz8jqvZUsv8tMffkbBxRuKFQttZnFPebAzrzbIt2Xxmfxhy72d6hmn2wb2OzA
	rk3HZS/K0szSCtY6hNMqWIceVy18/WR5yQehsj77uhYm+i444anfaOH/HAc+O0SNyRHK
	5oRaQI5+CD6CCc3BLBnjldN1+2sM5VllG8HZv2kF9RW4OCktENFSYYmugzfcsGT3dFRI
	eqYg==
X-Gm-Message-State: ALKqPwebidpGfCyJ7Hb2qm70cYUeBz6wJKJneafisRdNIK/njh7xZaKU
	sIBN76sp6v41uSB79x6wkexAfQ==
X-Google-Smtp-Source: ADUXVKLIOpHwhNYhCUmuiM1GC07YcyPsRTrbapuMbZIG48HP4nsokqhq3xvQuiR57aIPLnRhUXR5Wg==
X-Received: by 2002:a1c:f714:: with SMTP id
	v20-v6mr3187135wmh.73.1527867731259; 
	Fri, 01 Jun 2018 08:42:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w15-v6sm5839098wro.52.2018.06.01.08.42.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jun 2018 08:42:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 15:42:09 +0000
Message-Id: <20180601154209.673-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] systemd: fix build with gcc8
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
X-List-Received-Date: Fri, 01 Jun 2018 15:42:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ild-with-gcc8-Werror-format-truncati.patch | 53 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch

diff --git a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
new file mode 100644
index 0000000000..e44f431073
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
@@ -0,0 +1,53 @@
+From f9fd4546c25a15629544bc4642a74d7909cc0840 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 1 Jun 2018 15:22:28 +0000
+Subject: [PATCH] time-util: fix build with gcc8 -Werror=format-truncation=
+
+* it fails with gcc8 when -O1 or -Os is used (and -ftree-vrp which is added by -O2 and higher isn't used)
+
+../git/src/basic/time-util.c: In function 'format_timespan':
+../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX' [-Werror=format-truncation=]
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+                                              ^~~~
+../git/src/basic/time-util.c:508:60: note: format string is defined here
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+../git/src/basic/time-util.c:508:46: note: directive argument in the range [0, 18446744073709551614]
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+                                              ^~~~
+../git/src/basic/time-util.c:507:37: note: 'snprintf' output 4 or more bytes (assuming 2147483651) into a destination of size 4294967295
+                                 k = snprintf(p, l,
+                                     ^~~~~~~~~~~~~~
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+                                              p > buf ? " " : "",
+                                              ~~~~~~~~~~~~~~~~~~~
+                                              a,
+                                              ~~
+                                              j,
+                                              ~~
+                                              b,
+                                              ~~
+                                              table[i].suffix);
+                                              ~~~~~~~~~~~~~~~~
+cc1: some warnings being treated as errors
+
+Upstream-Status: Submitted https://github.com/systemd/systemd/pull/9156
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/basic/time-util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index 0601d4fa9..db5a9cd78 100644
+--- a/src/basic/time-util.c
++++ b/src/basic/time-util.c
+@@ -484,7 +484,7 @@ char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
+                 /* Let's see if we should shows this in dot notation */
+                 if (t < USEC_PER_MINUTE && b > 0) {
+                         usec_t cc;
+-                        int j;
++                        char j;
+ 
+                         j = 0;
+                         for (cc = table[i].usec; cc > 1; cc /= 10)
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 2e6558ded1..0113c2dc72 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -54,6 +54,7 @@ SRC_URI += "file://touchscreen.rules \
            file://libmount.patch \
            file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
            file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
+           file://0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.17.0


