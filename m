Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B7BC61DE0
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2990.1787945907217626236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ysU7CSI6;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b965570d7so10687025e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945905; x=1788550705; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzyG/QnLjPOGzobMw8GxTtEL9IMgJlCbNiqmTh6NyFI=;
        b=ysU7CSI6AGCP5XmAHbtcKkIs1kXFvFk/1ILLUAE5dfcbUK2+bYvgVm34MqwhFdGfjk
         GxzlXsB0Mt8hfsE3LkUCbV2mKCd1/U1P17UPPCVaRMcr5R+AVxXqF+D/wEc11lg+mtao
         SNVkKVziKjowmN9W57bGEoyclx2LghptY1Rt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945905; x=1788550705;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzyG/QnLjPOGzobMw8GxTtEL9IMgJlCbNiqmTh6NyFI=;
        b=Mx7wTD56QiXfZS/XIqI4PJiqapnvyw9pEWZzDMQ6Dp0U/nP9i5kTgaULoAtC00gCWX
         XsnDXZA/lXwbpKNzX0pVTX6TEvATYSmk9YNIuBNF7p33e4pxgkrx04qo9/SxN5pV43cW
         CBkwpcAt3AdPL0Vfhfbq2DzDTmKARdPJoBKlUS9vAP+6PuNLQjZ1yYun7RWxPTjMSArl
         05uENjKZUE6hjCO+se3RD4zqk/zOfx4Md/Jdbee507AKuLMVcrNBTOijIfDozYRPIlJp
         IwujDEBp0rixBWaEjYFVT9urP7YfwlzKMwxQ2IvrpLVJmOiQEFX18tiNefanVkK3RUHf
         Mg4Q==
X-Gm-Message-State: AFuF++leLID6hAkjW3ADXDzP50cN9nt85nnV/76lM/5nBJdx50mOeQ2Z
	tPm1en4Nf1cutNZMLwrNW+u8amQaHgllBJwltW1UPFrAwtTKIcNepEmLJqVYgJlNSmkfX5m5P9a
	TH1dzdOo=
X-Gm-Gg: AR+sD10jjIYmYm7VFw0rXBcR+w0EIRmhzlD7EzVaDdq7pj3v1nHv8eRnbVGRR47sW7i
	GmPf+IGW/O4RgMxy8Ny6UDkTzw93RcIcEmegUnPLohavkENSiganVKALe+qy/F0sI9s2IJMdVZN
	fKnsRGQ+CokvexazO2rgN+gojlgIza7NI5G0JpMiR1nzPRdof7oYD2NBUA0HOzHWHIM9niIZrJt
	FWQwKNIwVD/S5Yux82svYXr0yenoVQ4UtVmooyfVaWX+o//AyH67kBDMrl7JXJSxMIXk8uent32
	GfPTBu2HE423OCVX5adnM7S4MgdsPgzlTEwzKjD2JQCBiwlusTqbwu7smo5KcnV84SCUTznf0uq
	gKSnozKf89u0Ry8ZyT4m4fRxdbdtHPLSLWvE0jAioq7j1I2vL6HxJbieZRaoE+gEZoQbkvD4AV3
	L+tX++GjbFgE5uSe6laQOi7L6OiPsi1bl/w/ls6r1hnsJo9EQQ8hqa+5ZEgoCP6IF0DGpBAvY6n
	KAsec5GD6XQjUI8R7X4cwxCJRveKR5uvq766IB3YKZ5PN0GDCkcnUFV4eR3FvlH
X-Received: by 2002:a05:600c:3103:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49b91c4fa9amr136573055e9.9.1787945905339;
        Fri, 28 Aug 2026 12:38:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 37/56] diffutils: patch CVE-2026-53910
Date: Fri, 28 Aug 2026 21:35:47 +0200
Message-ID: <0dff976ee5732e6fa97c70dd367a08a22a5f6acd.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244598

From: Peter Marko <peter.marko@siemens.com>

Pick patches mentioned in NVD CVE report.

Adapt NEWS file to apply one of the patches.
Add special code to prevent build error dues to rebuild of manpage.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3406d85634e5d793eb5c4f5ec9b7f03774a86d65)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../diffutils/CVE-2026-53910-01.patch         | 67 +++++++++++++++++++
 .../diffutils/CVE-2026-53910-02.patch         | 35 ++++++++++
 .../diffutils/diffutils_3.12.bb               |  9 +++
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch

diff --git a/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch
new file mode 100644
index 00000000000..b2da72b04c5
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch
@@ -0,0 +1,67 @@
+From 73ed7ce85cc78effb94daf028c9af6b4e5252e50 Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Mon, 20 Apr 2026 23:43:51 -0700
+Subject: [PATCH] diff3: check for integer overflows when reading line numbers
+ from diff
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported by Michał Majchrowicz.
+* NEWS: Mention the bug fix.
+* src/diff3.c (readnum): Return nullptr if the line number would
+overflow.
+
+CVE: CVE-2026-53910
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/diffutils.git/commit/?id=73ed7ce85cc78effb94daf028c9af6b4e5252e50]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS        | 8 ++++++++
+ THANKS      | 1 +
+ src/diff3.c | 3 ++-
+ 3 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index a8115f7..bfe20d4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,13 @@
+ GNU diffutils NEWS                                    -*- outline -*-
+ 
++ * Noteworthy changes in release ?.? (????-??-??) [?]
++
++** Bug fixes
++
++  diff3 no longer overflows integers when reading line numbers from the
++  diff program.
++  [bug present since "the beginning"]
++
+ * Noteworthy changes in release 3.12 (2025-04-08) [stable]
+ 
+ ** Bug fixes
+diff --git a/THANKS b/THANKS
+index a96b68d..a372954 100644
+--- a/THANKS
++++ b/THANKS
+@@ -13,6 +13,7 @@ Chris Hanson <cph@gnu.org>
+ Jim Kingdon  <kingdon@panix.com>
+ Tom Lord  <lord@gnu.org>
+ David J. MacKenzie  <djm@gnu.org>
++Michał Majchrowicz  <mmajchrowicz@afine.com>
+ Roland McGrath  <roland@redhat.com>
+ Jim Meyering  <jim@meyering.net>
+ Gene Myers  <gene@eecs.berkeley.edu>
+diff --git a/src/diff3.c b/src/diff3.c
+index 1dfba37..1a74407 100644
+--- a/src/diff3.c
++++ b/src/diff3.c
+@@ -1020,7 +1020,8 @@ readnum (char *s, lin *pnum)
+ 
+   do
+     {
+-      num = c - '0' + num * 10;
++      if (ckd_mul (&num, num, 10) || ckd_add (&num, num, c - '0'))
++        return nullptr;
+       c = *++s;
+     }
+   while (c_isdigit (c));
diff --git a/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch
new file mode 100644
index 00000000000..7f87893f516
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch
@@ -0,0 +1,35 @@
+From 9ff04d5b84743e331e80b589335a52c5480d1815 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 00:30:50 -0700
+Subject: [PATCH] diff3: prevent overflow in line offsets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/diff3.c (readnum): Limit line numbers to LIN_MAX / 2.
+
+CVE: CVE-2026-53910
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/diffutils.git/commit/?id=9ff04d5b84743e331e80b589335a52c5480d1815]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/diff3.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/diff3.c b/src/diff3.c
+index 4fed6a8..d32e6ad 100644
+--- a/src/diff3.c
++++ b/src/diff3.c
+@@ -1026,6 +1026,12 @@ readnum (char *s, lin *pnum)
+     }
+   while (c_isdigit (c));
+ 
++  /* Simplify overflow checking later, so that we can always add a
++     line number and a line count, or subtract two line numbers and
++     add 1 to the result, without worrying about overflow.  */
++  if (LIN_MAX / 2 < num)
++    return nullptr;
++
+   *pnum = num;
+   return s;
+ }
diff --git a/meta/recipes-extended/diffutils/diffutils_3.12.bb b/meta/recipes-extended/diffutils/diffutils_3.12.bb
index d00dd772ad7..5bf0540eabf 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.12.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.12.bb
@@ -6,6 +6,8 @@ require diffutils.inc
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
+           file://CVE-2026-53910-01.patch \
+           file://CVE-2026-53910-02.patch \
            "
 
 SRC_URI[sha256sum] = "7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd"
@@ -21,6 +23,13 @@ inherit ptest
 
 RDEPENDS:${PN}-ptest += "make perl"
 
+# patch for CVE-2026-53910 touches source file, so build is trying to
+# refresh the manual, which is failing in cross-compile environment;
+# remove this code on next upgrade
+do_compile:prepend() {
+    touch ${S}/man/diff3.1
+}
+
 do_install_ptest() {
 	t=${D}${PTEST_PATH}
 	install -D ${S}/build-aux/test-driver $t/build-aux/test-driver

