Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10111C61DDA
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3063.1787945911296484041
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qenkgZH0;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so10537065e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945909; x=1788550709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FqzOvDkGkTHGqORmDjOlrxaaZsA3r3eNDezxxuaQtGQ=;
        b=qenkgZH0PCCAmAvggyzkZhxMsBgotwp8oT19DMMMYcdl7B6k/qWrDjXzdiSBSpmP/d
         98GX+JdsnlFjb0DN5QdcJuy9coSMHW04MArvNkkVm5xwSzK44gqCVC7T4RY+iZzx0Yky
         iI1Y7lLrrjI9ZSMCqyuw6Pie+mb5WvJuY0wyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945909; x=1788550709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FqzOvDkGkTHGqORmDjOlrxaaZsA3r3eNDezxxuaQtGQ=;
        b=Nie8k5Rrv9ZRy7CoO0G6V9JgXtjV+/J0K5texcfheesbhZk5Cc0oXZVuwrfdm2QwIr
         lmno5MeWdpzyiXVN7/bdE5C/eVTwvmfMh5LKedSX01fdVEevFOTJyiGdjJ4c7+jtLrXA
         pX29frOGqsfBbg5sRxy5EZgGKcELGEZ/RxKL9MQ145wWMqC2xy1NwUX+1StSMn0v9/K4
         HssqFNvV8NBaYHxw2GhuOVzseiGD8fykZQnkwDPKYuUBiw6bC6xFdaRakfvAD7uJVGRv
         8B9kATLT5P9aerMirlJiJqAxR41zaMsGR0KPpYw2ZgZYzHT0GcPQ+LgKCLmOskEQBEMM
         79NQ==
X-Gm-Message-State: AFuF++kZhAmwsyctM9Gzw5uX4jedJ5PVTN08hos/G80cBMh3xQdzkM1W
	o4Sb6pkB40gLAnHSVT+F4OQazJHpmWnaQfBtERZ4k4k84b89+XATT8Vyfmh02/MOCeQe8ewLPS0
	VnmDHUrA=
X-Gm-Gg: AR+sD13zlIvODpzh8ObU2p/wMTSUw75aBUbgUUKkZBy0PGjSy6ijwdvuisHkyVpoBhc
	eKzPv9ES58G+wKyh4BuquTc57j4cU6U+NXGzev6EAQ1Skrr64tRvtLMLeidJCMgJcC3vCojlq2L
	UzNNKHaGOq/yXVl4kCQxE7vTCi15Y6fZYAJjg9maGwfS87gPmlTlDfArNldCodl0YBZs/LeaG2W
	J6qellyNWTcQK2GCmTEh0kg3ouLw5mJAh3k5YgbA+/0PzdptqlL58PNQGugHVMOkHMMlpkkD/Bx
	B+ZDMesaG1hQZNQcie+EOuivEuehKSFxBWslSy84bSNcH2DOFwSvs7lYLLY9chnIeNtsRfB9Mq1
	QTiw+UhCG3h1xdBLlKbqg7i6cM87QXUvCMuHv71MXzBp1QwNRXiGI4AKYke4yu/2Q1WHrfBUgWI
	buTH5Qax4ynpMnRtW/RH4ba4MFxIlq9rxKv98gRSAFe94O4ZuFpcLVx+dGME7gODumTX9nsND/E
	qMGaa+sIEv0l8wAAI+MhPrsFSsjXwbdlJB1317kwpvRjfUG9afm6HwjobLO2/4+
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr137591675e9.5.1787945909542;
        Fri, 28 Aug 2026 12:38:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 44/56] libxml2: upgrade 2.15.2 -> 2.15.3
Date: Fri, 28 Aug 2026 21:35:54 +0200
Message-ID: <97429a947e85d742699eaff56afdcd7337fda533.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244605

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: fd9928e49da740d11f402e13b00cf5401c81d5cd)

Release Notes:
* https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.15.3/NEWS#L3
  * Security
    * parser: Pass userData to SAX text callbacks in xmlParseReference (type-confusion)
    * entities: copy children in xmlCopyEntity
    * c14n: Fix Type confusion in xmlC14NProcessAttrsAxis
    * python: Do not decref string after adding to the list (double-free / use-after-free)
    * c14n: Reuse tmp_str, xmlStrcat reallocates *cur (double-free)
   * Improvements
     * schemas: Fix relative schemaLocation resolution in XSI assembly in streaming mode
     * xmlreader: propagate reader resource loaders to validator parsers
     * python: Make python bindings python2 compatible
     * xmlregexp: Fix escape-sequence character range matching
     * xmlreader: Free input in xmlReaderForFd (memory-leak)
     * xmlstring: Free cur on every error for xmlStrncat (memory-leak)
     * catalog: Free xmlCatalogResolveCache on cleanup (memory leak)
     * Fix nanohttp.c build when --without-output
     * test: fix mismatched signed/unsigned comparison

Signed-off-by: Peter Marko <peter.marko@siemens.com>
[YC: fixed the changelog. Note: those "improvements" are bugfixes]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ake-Fix-installation-directories-in-libxml2.patch | 12 ++++++------
 meta/recipes-core/libxml/libxml2/install-tests.patch |  9 +++------
 .../libxml/{libxml2_2.15.2.bb => libxml2_2.15.3.bb}  |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.15.2.bb => libxml2_2.15.3.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 627f8472c38..d19b284866d 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
+From 803e6f21d3d7ef6399f6ffe58cd28fa6dc7b94e9 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -15,10 +15,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 7 insertions(+), 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aaa02e3..fb241bb 100644
+index d8dc4e1..633334a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1065,17 +1065,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1008,17 +1008,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -37,7 +37,7 @@ index aaa02e3..fb241bb 100644
  AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
                     [System configuration directory (/etc)])
 diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
-index e040a75..dc0d6b8 100644
+index ff6433f..b775cfe 100644
 --- a/libxml2-config.cmake.in
 +++ b/libxml2-config.cmake.in
 @@ -24,17 +24,20 @@
@@ -66,10 +66,10 @@ index e040a75..dc0d6b8 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 98bc6e3..3ef0bd0 100644
+index 2cfecb6..f78da31 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -599,9 +599,6 @@ config_cmake = configuration_data()
+@@ -593,9 +593,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 9269536af00..996ade614e2 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3381232bab7217b9cb47e7cc765c8380192069b0 Mon Sep 17 00:00:00 2001
+From c6b547e06beb0f0ba99e30d036f055eaed9ec4dc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 19ec305..64bf28a 100644
+index 0a2a729..7ca5bad 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -29,6 +29,14 @@ check_PROGRAMS = \
+@@ -30,6 +30,14 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
@@ -33,6 +33,3 @@ index 19ec305..64bf28a 100644
  bin_PROGRAMS = xmllint
  
  bin_SCRIPTS = xml2-config
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2_2.15.2.bb b/meta/recipes-core/libxml/libxml2_2.15.3.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.15.2.bb
rename to meta/recipes-core/libxml/libxml2_2.15.3.bb
index 9181949ea54..02507d80422 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-11979.patch \
            "
 
-SRC_URI[archive.sha256sum] = "c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d"
+SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"

