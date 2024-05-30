Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C035C41513
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:24:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.658.1717086258661353730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 09:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MnVqXVOx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35b6467754cso717374f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717086256; x=1717691056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcnamiATWUNn2lzGMt1RCeKO+NvUHCc3XGXwRjp9kOs=;
        b=MnVqXVOxO/CdNHKBEd9+14BLe5eKCk30MCmU+opw3OmQiBpBQX7WzE7qoghQ3mvkzc
         oaILI4vqvGO9U2jGl2QNjQJfExc0LzS+5M2rHfuy8PBr13a/EdBP5AzXyo2O+B934f2a
         juB6eKJNUdFyfSUc+uZY+XBHZ/qieIhe7l8bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086256; x=1717691056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcnamiATWUNn2lzGMt1RCeKO+NvUHCc3XGXwRjp9kOs=;
        b=RATb2m5AVzB/vG+CPewCC3cR15RPJC6LkX+LCTLnAcyuCj1vQr431TA7RVvvaFZxxx
         EE/kbSaJYFUk72195sF6AmQJtU1qDtdCsuqTPCvTYt4bL4x1UBPD+g5wzqHu3uGZBNaF
         rKuqLSnBHXUIIlmI9GQY0zEOaErlWwpKUFqcGdEOVyFaMqi4ATQy7ARKQFAdCj0jrppA
         /L4M5RvgRIpCogiR93eD3dDVQajjciXIvVDqqhpDpSMF3FDFlkZL1H4S38j3sPUkHNX6
         UvklsLEhmT9e5f3ayz0JHnhnWMJre44ZUtgtKRUbKuDTBCR2Cd96A7lmheJSMU1brJ9X
         9jrg==
X-Gm-Message-State: AOJu0YxRCYjG9CB/bbUNo4ijtq0Tjisg+W7JDp7zx4NvjXyzlDBPgHk3
	gNk39QoZlkSmcRjglTvmd5f1qm0Odwj8PCBmg8omqyvvEXY40kR1bcEi7PUoskYX/+2BihlzumP
	J
X-Google-Smtp-Source: AGHT+IGxhCxTugvFS02PsfdG+RwqjaoL37UAt5X/yy1TaHy5mOknrG1PD6LvzYqzgN+fKFXhNvKcJQ==
X-Received: by 2002:adf:f709:0:b0:357:1931:f2b with SMTP id ffacd0b85a97d-35dc00904a6mr1545454f8f.17.1717086256073;
        Thu, 30 May 2024 09:24:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2db:3695:26f3:1f11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3587724c6f4sm12914650f8f.28.2024.05.30.09.24.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:24:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] siteconfig: Drop siteconfig class/code/support
Date: Thu, 30 May 2024 17:24:11 +0100
Message-Id: <20240530162414.3111406-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 16:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200030

The siteconfig code was only used for 5 cache values. The complexity added to sstate
to support this code was considerable and the runtime much more significant than
any benefit the cache files would have added. Drop the support for this which
was only used minimally for ncurses and zlib.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/autotools.bbclass         |  2 -
 meta/classes-recipe/siteinfo.bbclass          | 16 +------
 meta/classes-recipe/toolchain-scripts.bbclass |  7 ---
 meta/classes/siteconfig.bbclass               | 39 -----------------
 meta/recipes-core/ncurses/ncurses.inc         |  2 -
 meta/recipes-core/ncurses/site_config/headers |  5 ---
 meta/recipes-core/zlib/site_config/headers    |  1 -
 scripts/gen-site-config                       | 43 -------------------
 8 files changed, 1 insertion(+), 114 deletions(-)
 delete mode 100644 meta/classes/siteconfig.bbclass
 delete mode 100644 meta/recipes-core/ncurses/site_config/headers
 delete mode 100644 meta/recipes-core/zlib/site_config/headers
 delete mode 100755 scripts/gen-site-config

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 9359c9b4e19..7ee1b0d9c74 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -254,8 +254,6 @@ autotools_do_install() {
 	fi
 }
 
-inherit siteconfig
-
 EXPORT_FUNCTIONS do_configure do_compile do_install
 
 B = "${WORKDIR}/build"
diff --git a/meta/classes-recipe/siteinfo.bbclass b/meta/classes-recipe/siteinfo.bbclass
index 68aefb8eda6..25b53d929a7 100644
--- a/meta/classes-recipe/siteinfo.bbclass
+++ b/meta/classes-recipe/siteinfo.bbclass
@@ -221,20 +221,6 @@ def siteinfo_get_files(d, sysrootcache=False):
         # This would show up as breaking sstatetests.SStateTests.test_sstate_32_64_same_hash for example
         searched = []
 
-    if not sysrootcache:
-        return sitefiles, searched
-
-    # Now check for siteconfig cache files in sysroots
-    path_siteconfig = d.getVar('SITECONFIG_SYSROOTCACHE')
-    if path_siteconfig and os.path.isdir(path_siteconfig):
-        for i in os.listdir(path_siteconfig):
-            if not i.endswith("_config"):
-                continue
-            filename = os.path.join(path_siteconfig, i)
-            sitefiles.append(filename)
     return sitefiles, searched
 
-#
-# Make some information available via variables
-#
-SITECONFIG_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
+
diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index cbef412e796..b59a295abcc 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -201,7 +201,6 @@ EOF
 
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@' '.join(siteinfo_get_files(d)[0])}"
-TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
 DEPENDS += "${TOOLCHAIN_NEED_CONFIGSITE_CACHE}"
 
@@ -223,14 +222,8 @@ toolchain_create_sdk_siteconfig () {
 			sitefile=`echo $sitefile | tr / _`
 			sitefile=`cat ${STAGING_DIR_TARGET}/sysroot-providers/$sitefile`
 		esac
-
-		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; then
-			cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $siteconfig
-		fi
 	done
 }
-# The immediate expansion above can result in unwanted path dependencies here
-toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
 
 python __anonymous () {
     import oe.classextend
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
deleted file mode 100644
index 953cafd285e..00000000000
--- a/meta/classes/siteconfig.bbclass
+++ /dev/null
@@ -1,39 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-python siteconfig_do_siteconfig () {
-    shared_state = sstate_state_fromvars(d)
-    if shared_state['task'] != 'populate_sysroot':
-        return
-    if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME'), 'site_config')):
-        bb.debug(1, "No site_config directory, skipping do_siteconfig")
-        return
-    sstate_install(shared_state, d)
-    bb.build.exec_func('do_siteconfig_gencache', d)
-    sstate_clean(shared_state, d)
-}
-
-EXTRASITECONFIG ?= ""
-
-siteconfig_do_siteconfig_gencache () {
-	mkdir -p ${WORKDIR}/site_config_${MACHINE}
-	gen-site-config ${FILE_DIRNAME}/site_config \
-		>${WORKDIR}/site_config_${MACHINE}/configure.ac
-	cd ${WORKDIR}/site_config_${MACHINE}
-	autoconf
-	rm -f ${BPN}_cache
-	CONFIG_SITE="" ${EXTRASITECONFIG} ./configure ${CONFIGUREOPTS} --cache-file ${BPN}_cache
-	sed -n -e "/ac_cv_c_bigendian/p" -e "/ac_cv_sizeof_/p" \
-		-e "/ac_cv_type_/p" -e "/ac_cv_header_/p" -e "/ac_cv_func_/p" \
-		< ${BPN}_cache > ${BPN}_config
-	mkdir -p ${SYSROOT_DESTDIR}${datadir}/${TARGET_SYS}_config_site.d
-	cp ${BPN}_config ${SYSROOT_DESTDIR}${datadir}/${TARGET_SYS}_config_site.d
-
-}
-
-do_populate_sysroot[sstate-interceptfuncs] += "do_siteconfig "
-
-EXPORT_FUNCTIONS do_siteconfig do_siteconfig_gencache
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 2a3fd4f2c5d..f5e37b94da6 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -20,8 +20,6 @@ EXTRA_AUTORECONF = "-I m4"
 CACHED_CONFIGUREVARS = "cf_cv_func_nanosleep=yes"
 CACHED_CONFIGUREVARS:append:linux = " cf_cv_working_poll=yes"
 
-EXTRASITECONFIG = "CFLAGS='${CFLAGS} -I${SYSROOT_DESTDIR}${includedir}'"
-
 # Whether to enable separate widec libraries; must be 'true' or 'false'
 #
 # TODO: remove this variable when widec is supported in every setup?
diff --git a/meta/recipes-core/ncurses/site_config/headers b/meta/recipes-core/ncurses/site_config/headers
deleted file mode 100644
index 087b7bfd5e4..00000000000
--- a/meta/recipes-core/ncurses/site_config/headers
+++ /dev/null
@@ -1,5 +0,0 @@
-curses.h
-ncurses/curses.h
-ncurses.h
-ncurses/termcap.h
-
diff --git a/meta/recipes-core/zlib/site_config/headers b/meta/recipes-core/zlib/site_config/headers
deleted file mode 100644
index 50268918aa9..00000000000
--- a/meta/recipes-core/zlib/site_config/headers
+++ /dev/null
@@ -1 +0,0 @@
-zlib.h
diff --git a/scripts/gen-site-config b/scripts/gen-site-config
deleted file mode 100755
index 727b809c0f2..00000000000
--- a/scripts/gen-site-config
+++ /dev/null
@@ -1,43 +0,0 @@
-#! /bin/sh
-#  Copyright (c) 2005-2008 Wind River Systems, Inc.
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-cat << EOF
-AC_PREREQ(2.57)
-AC_INIT([site_wide],[1.0.0])
-
-EOF
-
-# Disable as endian is set in the default config
-#echo AC_C_BIGENDIAN
-#echo
-
-if [ -e $1/types ] ; then
-  while read type ; do
-    echo "AC_CHECK_SIZEOF([$type])"
-  done < $1/types
-
-  echo
-fi
-
-if [ -e $1/funcs ]; then
-  while read func ; do
-    echo "AC_CHECK_FUNCS([$func])"
-  done < $1/funcs
-
-  echo
-fi
-
-if [ -e $1/headers ]; then
-  while read header ; do
-    echo "AC_CHECK_HEADERS([$header])"
-  done < $1/headers
-
-  echo
-fi
-
-cat << EOF
-AC_OUTPUT
-EOF

