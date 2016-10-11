Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 645E471A24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:32:41 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id z190so30946139qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=nOM+NlhmoDecafEGJH7VuX+LItfniONeGIFYuM0e7io=;
	b=jADgoRvez6VwKrNseKifopLcl8JK8Tfl0BLrs+UevoqqzChvUCLvMucdMqD9faEcC2
	qpNHMpst4KM8X8FceAsDRwF7+seQ9ORglgvPpdBDxaJk0iqrDHSwgB7OrTlPA2JwsJKg
	AOM6nVuuqBX1cO47akeUDMAhDvJTZXDS58XN/qXBsDMrrd9aH572rpYnsurfxf+xPLGv
	phJ4tPlozfs72z3cgQc0vjH0D+qtHffkcQSLCxwiWt5Odv0yy8CKgExdyRkALlVDhZXK
	NLf4CMhnTpt1ww5bkm7c1PsyBmuf38EHrWnM5dqL+KPWUeLOgGO0nZ1L10KuGpG7o/wx
	5Lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nOM+NlhmoDecafEGJH7VuX+LItfniONeGIFYuM0e7io=;
	b=FfCoQ+88BnVjP64Y/LU2W+VRGrNyDDf1IOoqQ18yYpW1IfSislUN8mwsrfHZuVPWwY
	wrUjHFaCpYUC2i/Iq/uvTfVVSvq9lz0URXOpZ8m8JY98dAxTZtCxFJUTCiKKqwDeJQ1D
	y1fNs57/Z7Vzfa0NC+3R3FKgRxuNgMzewLSiQ0/pK0wSJPRg6P7aAHKQ/2c7el0GHQxe
	SXan0Yy+3kZhfwfQ9PhcIcEhQ+pgQVJu3HY0N7Xx5Zos9H/Agun6V01UbUx3gw6F5yAz
	PKQpJZVZAhcZDcYe3ysh55qms2BZ66UdrhxoYAkOD909JHzb3THM/r10Fk/RNFtemCOn
	O5HA==
X-Gm-Message-State: AA6/9RkzqPNnc4+osfNiQfuk4Targ7wQ76NxMIBiMI+/rSU+3pv+g4eFp9E3BvilIygJ8Ikv
X-Received: by 10.194.118.131 with SMTP id km3mr4588002wjb.173.1476189163052; 
	Tue, 11 Oct 2016 05:32:43 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p3sm6049320wjr.31.2016.10.11.05.32.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 05:32:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 13:32:40 +0100
Message-Id: <1476189160-17339-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] cmake: improve CMAKE_SYSTEM_PROCESSOR assignment in nativesdk
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
X-List-Received-Date: Tue, 11 Oct 2016 12:32:42 -0000

The previous string manipulations would result in the wrong string being used
for machines such as intel-corei7-64 as the sysroot was split at the first
hyphen (so would result in corei7 instead of corei7-64).

Change the logic so that it looks for processor-distro-os and uses the whole of
the processor field.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 0ce6573..6518408 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -10,8 +10,10 @@ set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 
-string(REGEX MATCH "sysroots/([a-zA-Z0-9]+)" CMAKE_SYSTEM_PROCESSOR $ENV{SDKTARGETSYSROOT})
-string(REGEX REPLACE "sysroots/" "" CMAKE_SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR})
+# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
+if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
+  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
+endif()
 
 # Include the toolchain configuration subscripts
 file( GLOB toolchain_config_files "${CMAKE_TOOLCHAIN_FILE}.d/*.cmake" )
-- 
2.8.1


