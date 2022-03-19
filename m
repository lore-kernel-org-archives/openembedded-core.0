Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1850C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.4770.1647674178977697989
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I11WzPaL;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id h16so5367292wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cpgW70Ro+nwJDzJNUIYiSdV1FXFUUrz/SHcFNMHs8zQ=;
        b=I11WzPaLT0tAgaagrkkHLHS0TglVIIb8lAZ3FLZW56CYkThvZbWMXLFXFEtmMDRh6z
         Uez6BVB1uViwPkkX9NkfxBClBZAuyEoktJBOwpSN67tOMZPEAaYfsX9Ah63TMFCj2rjA
         aiLp/leinWQDJF01Y2LOHzG1plwvoDsEQgtUhNPaS77wHkqqGi+c4DMq9y/C36iyZQGS
         IguB8UqSPwJL4YzxumMLAAZ33AsME6ve/6URGHFJkbUn0QyKw3EJEcghWiP7E9sbS5YV
         YE3YxybwI+vZgCbrtLE5ukvIzr4pKW9pyhcRIPIRnPxZ/uzEJHR6GxGMaoDMji0hFJm5
         dA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cpgW70Ro+nwJDzJNUIYiSdV1FXFUUrz/SHcFNMHs8zQ=;
        b=sFGAn9pNBKXq83sio17zx0XYB+dqtYRtlLNbgQe4jXJndOUJ9Uo2X7RtuwRVAlPUjx
         flfh4SRTNwL72UynINv4+ErM/ffHnPoSPvxejnLPiBD1lhiEHcb6+w8Y00S//1RyO/wh
         NtlVkM/8om/rqBmBbtCyIVYR5Iy0+fcME0fjea2ifoX3pUff7hsXIrLoK4YUW5KtEFOU
         7Dy49fvrtTiC9yMKantvHhr/1S5Q3PbkiOgP/WXzyy6k1KgrKO2z1HxsrbRstqex7aMa
         J3mxLi1a7veCRWIcopEXU8hQCUr/IcP24uej7iDGVv26vS1lFt/yNmdhNSNyIHTceKtb
         DdTw==
X-Gm-Message-State: AOAM533HvDKa3AOtBrqI5OdC+tcnYunBL0F0g48cCxlR13Ro30pknjnS
	4MaYcBCLLR6V3tLfmIb/Jx6I2R/ajk8=
X-Google-Smtp-Source: 
 ABdhPJx8eQCP2krmQGLf+bXHaGoVHb16P0oAx3WRZUfbKtXiKPbArV6PyY2DhR0ILgF5XXxzL+zYyg==
X-Received: by 2002:a05:600c:3482:b0:38c:40:9b30 with SMTP id
 a2-20020a05600c348200b0038c00409b30mr17082751wmq.68.1647674177425;
        Sat, 19 Mar 2022 00:16:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/11] bind: update 9.16.26 -> 9.18.1
Date: Sat, 19 Mar 2022 08:15:58 +0100
Message-Id: <20220319071605.152904-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163460

Drop removed python/libtool options.

isc/platform.h is no longer installed.

Rewrite reproducibility patch to fix the problem at the source.

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...d-V-and-start-log-hide-build-options.patch | 37 -------------------
 ...1-avoid-start-failure-with-bind-user.patch |  0
 ...d-V-and-start-log-hide-build-options.patch | 35 ++++++++++++++++++
 ...ching-for-json-headers-searches-sysr.patch | 28 +++++++-------
 .../bind/{bind-9.16.26 => bind-9.18.1}/bind9  |  0
 .../{bind-9.16.26 => bind-9.18.1}/conf.patch  |  0
 .../generate-rndc-key.sh                      |  0
 ...t.d-add-support-for-read-only-rootfs.patch |  0
 .../make-etc-initd-bind-stop-work.patch       |  0
 .../named.service                             |  0
 .../bind/{bind_9.16.26.bb => bind_9.18.1.bb}  | 14 +++----
 11 files changed, 55 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.16.26/0001-named-lwresd-V-and-start-log-hide-build-options.patch
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/0001-avoid-start-failure-with-bind-user.patch (100%)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/bind-ensure-searching-for-json-headers-searches-sysr.patch (73%)
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.26 => bind-9.18.1}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.26.bb => bind_9.18.1.bb} (89%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.26/0001-named-lwresd-V-and-start-log-hide-build-options.patch
deleted file mode 100644
index 4dc6a5a2ae..0000000000
--- a/meta/recipes-connectivity/bind/bind-9.16.26/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f5761bbaf743d291f3e7e859e69ebe61a1718cbf Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 27 Aug 2018 21:24:20 +0800
-Subject: [PATCH] `named/lwresd -V' and start log hide build options
-
-The build options expose build path directories, so hide them.
-[snip]
-$ named -V
-|built by make with *** (options are hidden)
-[snip]
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Refreshed for 9.16.0
-Signed-off-by: Armin Kuster <akuster@mvista.com>
----
- bin/named/include/named/globals.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bin/named/include/named/globals.h b/bin/named/include/named/globals.h
-index 0572154..3147e04 100644
---- a/bin/named/include/named/globals.h
-+++ b/bin/named/include/named/globals.h
-@@ -69,7 +69,7 @@ EXTERN const char *named_g_version	  INIT(VERSION);
- EXTERN const char *named_g_product	  INIT(PRODUCT);
- EXTERN const char *named_g_description	  INIT(DESCRIPTION);
- EXTERN const char *named_g_srcid	  INIT(SRCID);
--EXTERN const char *named_g_configargs	  INIT(CONFIGARGS);
-+EXTERN const char *named_g_configargs	  INIT("*** (options are hidden)");
- EXTERN const char *named_g_builder	  INIT(BUILDER);
- EXTERN in_port_t named_g_port		  INIT(0);
- EXTERN isc_dscp_t named_g_dscp		  INIT(-1);
--- 
-2.20.1
-
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.26/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch
new file mode 100644
index 0000000000..4c10f33f04
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -0,0 +1,35 @@
+From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 27 Aug 2018 21:24:20 +0800
+Subject: [PATCH] `named/lwresd -V' and start log hide build options
+
+The build options expose build path directories, so hide them.
+[snip]
+$ named -V
+|built by make with *** (options are hidden)
+[snip]
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Refreshed for 9.16.0
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index bf20690..c5d330f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
+ AC_DEFINE([PACKAGE_DESCRIPTION], [m4_ifnblank(bind_DESCRIPTION, [" ]bind_DESCRIPTION["], [])], [An extra string to print after PACKAGE_STRING])
+ AC_DEFINE([PACKAGE_SRCID], ["][bind_SRCID]["], [A short hash from git])
+ 
+-bind_CONFIGARGS="${ac_configure_args:-default}"
++bind_CONFIGARGS="(removed for reproducibility)"
+ AC_DEFINE_UNQUOTED([PACKAGE_CONFIGARGS], ["$bind_CONFIGARGS"], [Either 'defaults' or used ./configure options])
+ 
+ AC_DEFINE([PACKAGE_BUILDER], ["make"], [make or Visual Studio])
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 73%
rename from meta/recipes-connectivity/bind/bind-9.16.26/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch
index f9cdc7ca4d..f1abd179e8 100644
--- a/meta/recipes-connectivity/bind/bind-9.16.26/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 2001
+From 246087f89e9434b726c7884e4c0964f71084f091 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,16 +32,16 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: bind-9.16.4/configure.ac
-===================================================================
---- bind-9.16.4.orig/configure.ac
-+++ bind-9.16.4/configure.ac
-@@ -1232,7 +1232,7 @@ case "$use_lmdb" in
- 		LMDB_LIBS=""
- 		;;
- 	auto|yes)
--		for d in /usr /usr/local /opt/local
-+		for d in "${STAGING_INCDIR}"
- 		do
- 			if test -f "${d}/include/lmdb.h"
- 			then
+diff --git a/configure.ac b/configure.ac
+index 10e8bf6..bf20690 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -814,7 +814,7 @@ AS_CASE([$with_lmdb],
+ 	[no],[],
+ 	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
+ 				       [ac_lib_lmdb_found=yes],
+-				       [for ac_lib_lmdb_path in /usr /usr/local /opt /opt/local; do
++				       [for ac_lib_lmdb_path in "${STAGING_INCDIR}"; do
+ 						AX_LIB_LMDB([$ac_lib_lmdb_path],
+ 							    [ac_lib_lmdb_found=yes
+ 							     break])
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/bind9 b/meta/recipes-connectivity/bind/bind-9.18.1/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.26/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.1/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.1/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.26/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.1/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.26/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.26/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.26/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.26/named.service b/meta/recipes-connectivity/bind/bind-9.18.1/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.26/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.1/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.26.bb b/meta/recipes-connectivity/bind/bind_9.18.1.bb
similarity index 89%
rename from meta/recipes-connectivity/bind/bind_9.16.26.bb
rename to meta/recipes-connectivity/bind/bind_9.18.1.bb
index aa64a11b9c..6aa832f8f5 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e7b3c52170a348459a4ff3f5ce95e37"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9a4a897f202c0710e07f2f2836bc2b62"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "70b39a5eb71650358ec9ba41da3050d32aeac0aeb4a466684b23f35affa7fb45"
+SRC_URI[sha256sum] = "57c7afd871694d615cb4defb1c1bd6ed023350943d7458414db8d493ef560427"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
@@ -35,11 +35,11 @@ inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-a
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
 PACKAGECONFIG ?= "readline"
 PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
-PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
-PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
-PACKAGECONFIG[python3] = "--with-python=yes --with-python-install-dir=${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
+PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
+PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
+PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
 
-EXTRA_OECONF = " --with-libtool --disable-devpoll --disable-auto-validation --enable-epoll \
+EXTRA_OECONF = " --disable-devpoll --disable-auto-validation --enable-epoll \
                  --with-gssapi=no --with-lmdb=no --with-zlib \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
@@ -90,8 +90,6 @@ do_install:append() {
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
 	fi
-
-    oe_multilib_header isc/platform.h
 }
 
 CONFFILES:${PN} = " \
-- 
2.30.2


