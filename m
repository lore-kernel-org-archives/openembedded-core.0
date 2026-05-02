Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A447CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9376.1777739413851151876
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rx+vdUM8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso28034115e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739412; x=1778344212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cq5TE4xBK9brYX0fHVZuFH8WCmJ/dmRqcg4bXi4cLOk=;
        b=Rx+vdUM8WcwaRR1beZsxik+cmTsj67ub3ZF36tva9m7D6UFM5+58jV/LU/thFfl1sX
         vc7XJ0zKISNtpSbg7WQTm/3VHzQhWT0hu/xp34sr6iOK6ICimVlsb4kHkGwqkDhf5dzr
         q2IB0p1hlx/ExOaLV1HTDbQ/f1R5j8ney1h/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739412; x=1778344212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cq5TE4xBK9brYX0fHVZuFH8WCmJ/dmRqcg4bXi4cLOk=;
        b=nK0BjUtpH86XwyMoultUrVsRFiTiifowjxg5Rfr1rAXx4KdxHLUaaZc/h6r5sDa3fD
         UHui6DOesIdRGxaAkzBzWY7g8bdCyXrEHSDgB1EfD0PkX6yRBLxHpkjPV5Xbz84yAp1b
         vl7aAyaipZUBQVBnULR0J04VABgdDm6uUjmhOKG8xg2BPvLysJhV84mf3LQ1/KhzfDS4
         YrIbG/iTDgvONBlrt4cX4AJNLYOoQULFNwEhS+tNxImMmxSOmxBWdNTXe2KOh5uUXFpc
         IU1TVBTp4KoAFqKvUO1RbDb6Plg7JDDdH11CvW+DQG6PECuGqk9cg2a1E9e1WqvRmH66
         lXLQ==
X-Gm-Message-State: AOJu0YxpbO8kXxeddJMnF1JUredPyS0qosP2zF9b0KKU/DaWBk8h07Xd
	p/8XowgbS9cAVL7eXQsykP5h7vuQEKIhqIFU0B1fBwfZOcxHuFXNzeyq1VowR86XhrXviBhRXfR
	sH/oSgNsFLAKaSrJbu8sYSQZCzfSVzjJ4tJuSBUQLft/bufWC9O4B+hSDUzvn/iQGDfzRzIf/yz
	P5kZWZPHN9NxfcXdY=
X-Gm-Gg: AeBDiesNi2j7nhpEovnF6mSQtJoAFK6dK7T4Em+8hc4gBRhj2PRIk9FQYiIDZ4HoLEp
	7e7tWj842wVZ1KqlhIlbrqATGHbq7zBfutporIypuxYgX0nSPpuvbe6mRuIA4WoqBxiqtvwvOCl
	zgq0fnkWQU4BKUh0m11UIVIX1AJD4aW23/RX/BJxRgXIVsFr3NICZiBUTp2OS0OVoGPOxZQqcsn
	DCPUhRnAnpxxdTQPpvh9W82xjrcxPiiT7s2e+OUH7as52lkiR9VM8TiEE0h9fSlBuUQkIatBYha
	p/uieb4EC1jqdtZ+miSN71QrOZ5yTpJHy8+/iOLcwqFG2nDQHeNTliKH6nukpnEEsUQuxIOCvir
	BSOFPlhMFEa9VHwj7KX9Tzl4yMzQzHzxbm+ibGXoxxKM1vLWIuOrB1RjdlXP0RDs6ESalnI07n5
	AO4Q91qNmnU3pYjiwwTrEI2ON5TdMG79llsR8dbAooyRnTrz30AzQw+cW5HtXkjUvMrjmtgLYD6
	Q==
X-Received: by 2002:a05:6000:1acb:b0:43d:1bf6:30f7 with SMTP id ffacd0b85a97d-44bb4442d00mr6318194f8f.18.1777739411629;
        Sat, 02 May 2026 09:30:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/62] libxml2: upgrade 2.15.2 -> 2.15.3
Date: Sat,  2 May 2026 17:28:42 +0100
Message-ID: <20260502162929.1377831-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236331

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 99560f4b243..5c2896d907d 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
            "
 
-SRC_URI[archive.sha256sum] = "c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d"
+SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"

