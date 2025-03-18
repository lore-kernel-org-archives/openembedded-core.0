Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95472C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 11:52:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9842.1742298757073773254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 04:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UtAnncWN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so18783965e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742298754; x=1742903554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtV766Z9WH5tIfsY7i3ImamSH4VWyefQh3mc9TP5FQs=;
        b=UtAnncWNF6Jg5Kt6GDsPVey+O2K6IM3BZ6308L8oU9npBXtwBqOi1tZDM7P5f1+Bb1
         n0zfmbwmJ1Nu233RmRLb0qns9QdopQUVDbfgiWRTZecCKCZQSoixb3jYWGjMFTFThndR
         AxPOM+uWa9GgBLZxLpC7vknV8O1qQha/ZRJKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742298754; x=1742903554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtV766Z9WH5tIfsY7i3ImamSH4VWyefQh3mc9TP5FQs=;
        b=eWtNm+okV6KMFd6h9qU62AIuFAeciEyKV4EhAY4AzNmjarUDWhOTlCmUm2zEuKyq3e
         gd5q4Xzf/JJQdYv3rnJL8v0ktQLLwuMRZm74YtsNTm+ZrQn+DT4G6ggYywZHyBJ4Hl89
         Nm0jxvEww/ZaXQ4v7T7PIGHvXtB1Yh+65ZPcPXP1+Q+08tXt1CGBQkVvu0PF0/Bstx77
         DGe2vNDAJQaEacBNJJbLntF64jaoYKTgkz2GygUpc3FajyNauy5YBJ+EgZ1rh6iBB0OF
         nWDW05qvEKtCnpYRtpPgy3Dqt1JceGkaY6NX4LxYHd3XUA0Mai3/JGUmohQvpxqM6vMt
         py9w==
X-Gm-Message-State: AOJu0Yx9SAKC37fZn0CWczPbLeQRf1xc3G7yjxwUs9EWCO9sDGI6JL8G
	BB/kgYfHMtemL5C08LFd1Xk3bpZqB+ThI1KXnAobBy500Tc4HrY+c7OCc/7mD4UHUj1B/BXJYda
	A
X-Gm-Gg: ASbGncs5Cc4kffsP+bQooatoAA8CC41YuA5ox7qvhQUTAlwcf2a8144+MoTNt4zG9SX
	Vvs6/bd8SGXUCbA70l0dMo3LJdImCNpMwsNV+K9YBVKo2N/+n5RTRtcM6VhLgKK78J34VFI3jOC
	b87BhqjopXBqxvpYQ36f0oWE6RZfeaBDHvGWOipH/0GfwKbpPYdQoFvEDB+xUvV+qcZLFLMR3m3
	CM1PZjIWWfi3vOFNu8v84T4oFnTfQ7+C/XHjh59ME9v1cppFRmg5hDbwKry8S+Z9DsvBq/vZNZw
	J7YEBzItSGAHrauxDlyd7i7xUQqCFAa/zWDh24vFaXOZGGv2vo6rqrFby+MviD5bP3WH6ga4+w=
	=
X-Google-Smtp-Source: AGHT+IGxUoUGEw0/qztjCXUqLJxSRyghNikMHHQ66gp9v5nbt9hNHpxPw43v2Yi9HhleZSgjVE0G/Q==
X-Received: by 2002:a05:600c:1389:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-43d3b98e23bmr21492275e9.11.1742298754164;
        Tue, 18 Mar 2025 04:52:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:791f:f4e7:28a8:7096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a8bsm18300170f8f.66.2025.03.18.04.52.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 04:52:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dbus-glib: Upgrade 0.112 -> 0.114
Date: Tue, 18 Mar 2025 11:52:32 +0000
Message-ID: <20250318115232.4119461-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213208

License-Update: Upstream added SPDX tags and more license information. The
main license is AFL-2.1 | GPL-2.0-or-later however some files are
LGPL-2.1-or-later or MIT licensed. The bash completiion plugin is
GPL-2.0-or-later only.

Therefore:
* Add checksums for the separated license files
* Update the main LICENSE
* Specify the correct license for the bash completion plugin

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../dbus/dbus-glib/no-examples.patch            | 16 +++++++++++-----
 .../dbus/dbus-glib/test-install-makefile.patch  | 17 +++++++++--------
 .../{dbus-glib_0.112.bb => dbus-glib_0.114.bb}  | 15 ++++++++++-----
 3 files changed, 30 insertions(+), 18 deletions(-)
 rename meta/recipes-core/dbus/{dbus-glib_0.112.bb => dbus-glib_0.114.bb} (64%)

diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
index 32e76117188..3e2fa41c59d 100644
--- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
+++ b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
@@ -1,14 +1,20 @@
-Disable compiling examples
+From 8bb06c2f0929a4b878fd9abdb63c177a7c308b9d Mon Sep 17 00:00:00 2001
+From: Kevin Tian <kevin.tian@intel.com>
+Date: Tue, 21 Nov 2006 14:20:37 +0000
+Subject: [PATCH] Disable compiling examples
 
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Kevin Tian <kevin.tian@intel.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ dbus/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: dbus-glib-0.108/dbus/Makefile.am
-===================================================================
---- dbus-glib-0.108.orig/dbus/Makefile.am
-+++ dbus-glib-0.108/dbus/Makefile.am
+diff --git a/dbus/Makefile.am b/dbus/Makefile.am
+index 2e8cb27..a86df30 100644
+--- a/dbus/Makefile.am
++++ b/dbus/Makefile.am
 @@ -1,4 +1,4 @@
 -SUBDIRS = . examples
 +SUBDIRS = .
diff --git a/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
index 027c82b27e4..0b1b712dd9d 100644
--- a/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
+++ b/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
@@ -1,4 +1,8 @@
-Change Makefile.am to install regression tests for test package purpose.
+From 4dbb1a459c281eeb716b4f0ce2fc01e8034c3e20 Mon Sep 17 00:00:00 2001
+From: Yao Zhao <yao.zhao@windriver.com>
+Date: Tue, 17 Jul 2012 16:46:30 -0400
+Subject: [PATCH] Change Makefile.am to install regression tests for test
+ package purpose.
 
 Upstream-Status: Inappropriate [test not install is for purpose from upstream]
 
@@ -11,7 +15,7 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  3 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/test/Makefile.am b/test/Makefile.am
-index 379c8c3..6580927 100644
+index 7393bed..1c25d5d 100644
 --- a/test/Makefile.am
 +++ b/test/Makefile.am
 @@ -48,7 +48,8 @@ TESTS = \
@@ -25,10 +29,10 @@ index 379c8c3..6580927 100644
  	$(test_related_programs) \
  	$(NULL)
 diff --git a/test/core/Makefile.am b/test/core/Makefile.am
-index e4bceb4..54b077d 100644
+index 35defa9..295202f 100644
 --- a/test/core/Makefile.am
 +++ b/test/core/Makefile.am
-@@ -64,7 +64,8 @@ endif
+@@ -57,7 +57,8 @@ if DBUS_BUILD_TESTS
  
  ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
  ## build even when not doing "make check"
@@ -39,7 +43,7 @@ index e4bceb4..54b077d 100644
  	test-error-mapping \
  	test-service-glib \
 diff --git a/test/interfaces/Makefile.am b/test/interfaces/Makefile.am
-index a94d08d..707dcac 100644
+index f3f62e4..f034b95 100644
 --- a/test/interfaces/Makefile.am
 +++ b/test/interfaces/Makefile.am
 @@ -57,7 +57,8 @@ if DBUS_BUILD_TESTS
@@ -52,6 +56,3 @@ index a94d08d..707dcac 100644
  
  test_service_SOURCES = \
  	test-interfaces.c \
--- 
-1.9.1
-
diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.114.bb
similarity index 64%
rename from meta/recipes-core/dbus/dbus-glib_0.112.bb
rename to meta/recipes-core/dbus/dbus-glib_0.114.bb
index 4753997d3d2..ff7c2d6613a 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -2,9 +2,14 @@ SUMMARY = "High level language (GLib) binding for D-Bus"
 DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
 HOMEPAGE = "https://www.freedesktop.org/Software/dbus"
-LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c31c73c1d8f5d06784b2ccd22e42d641 \
-                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=c374833bd817988323f3a8fda0dc7f48"
+LICENSE = "(AFL-2.1 & LGPL-2.0-or-later & MIT) | (GPL-2.0-or-later & LGPL-2.0-or-later & MIT)"
+LIC_FILES_CHKSUM = "file://COPYING;md5=267b04646da5ce3ea2df7a38a07c3f0b \
+                    file://LICENSES/AFL-2.1.txt;md5=f3ad2f482ec639b440413665cfb9e714 \
+                    file://LICENSES/GPL-2.0-or-later.txt;md5=3d26203303a722dedc6bf909d95ba815 \
+                    file://LICENSES/LGPL-2.1-or-later.txt;md5=41890f71f740302b785c27661123bff5 \
+                    file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
+                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=c374833bd817988323f3a8fda0dc7f48 \
+                    "
 SECTION = "base"
 
 DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
@@ -14,8 +19,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.g
            file://no-examples.patch \
            file://test-install-makefile.patch \
 "
-SRC_URI[md5sum] = "021e6c8a288df02c227e4aafbf7e7527"
-SRC_URI[sha256sum] = "7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a"
+SRC_URI[sha256sum] = "c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814d61b5e8fc2827a7c"
 
 inherit autotools pkgconfig gettext bash-completion gtk-doc
 
@@ -30,6 +34,7 @@ PACKAGES += "${PN}-tests"
 
 FILES:${PN} = "${libdir}/lib*${SOLIBS}"
 FILES:${PN}-bash-completion += "${libexecdir}/dbus-bash-completion-helper"
+LICENSE:${PN}-bash-completion = "GPL-2.0-or-later"
 FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES:${PN}-dev += "${bindir}/dbus-binding-tool"
 

