Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9BCC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 09:56:13 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.11744.1721210168713684234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 02:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=Sad9DJa8;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4971; q=dns/txt; s=iport;
  t=1721210168; x=1722419768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/lM49H0b00vq7Ub15ynmxCYlrwywsxZ6oBiMnA5SmUY=;
  b=Sad9DJa84PP2f2uTcXPXH/b3Oi8aGm14N7PeD3tZwM2tvnVwlOozcjrS
   6I3GXx4d3vrOmyw3hdgsQOejVpZeeN7Fnkuv296wMvYgGSUzW6/7ILHs6
   SGYM5/KSD4jHNoMVoNbg6ydlBXk6MDcRFtIFW04aUtN2c03zGRE8b04VE
   g=;
X-CSE-ConnectionGUID: AAek+dSvRbCKvXa1r8O8+A==
X-CSE-MsgGUID: RgPNhm/eRr+p6KG6tG39rg==
X-IPAS-Result: =?us-ascii?q?A0DtAAD4k5dmmJhdJa1agliEGkJIlB2gM4ElA1YPAQEBD?=
 =?us-ascii?q?0QEAQGFBgKJKwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQUBAQUBAQECAQcFF?=
 =?us-ascii?q?AEBAQEBAQEBNwUOO4YChl4CAQMyATMjRgtWGYMAgmUCAa5pgiyBAd4xgWyBS?=
 =?us-ascii?q?I0LhWQnG4FJRIJQgTd2iwcEilKLUheFMIhnfSYLjTtKgSEDWSECEQFVEw0KC?=
 =?us-ascii?q?z4dAhYDGxQEMA8JCyYpBjkCEgwGBgZZMgkEIwMIBANCAyBxEQMEGgQLB3eDJ?=
 =?us-ascii?q?QQTRAOBN4FSiA+CBIEtghqBDIMNhTOBawxhiGKBCi2BEYEjPoIJgUBLhTRKQ?=
 =?us-ascii?q?AMLGA1IESw1FBsGPm4HrSOBD4FuOkCSbi6Re6BzhB6hNBozqjyYa6QohGWBZ?=
 =?us-ascii?q?zqBWzMaCBsVgyJSGQ+OOh/PQSM1OwIHCwEBAwmKagEB?=
IronPort-Data: A9a23:QOkWDq7GI6KSHMqBf2wnggxRtCLHchMFZxGqfqrLsTDasY5as4F+v
 jZLX2uBOP/YZTD3LYp3Pd7i8h5S6MeAz4NlSgBoqCtkZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyKa+1H0dOC88BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wq8qUzBHf/g2Qoaj1NtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFKQV+aV7On90/
 9c7NgAENwrToLL16efuIgVsrpxLwMjDJogTvDRryivUSK9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxIMnw2MU6ojx5nYj/7DLo5nOGhmnjicBVTqUmeouw85G27IAlZi+GybYqIJYLQLSlTtnyXn
 kTG+iP0OAtZLIK85mSZ3Sn9nOCayEsXX6pJSeXnraQ16LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj6HT+QvcXy4PTyVKb5ots8peqSEWO
 kGhtvrkBn9ji6OvQ1m+6Ied9CniHnhWBDpXDcMbdjct797mqYA1qxvASNd/DaK45uEZ/xmum
 FhmSwBg3N0uYd436kmtwbzQb9uRSnXhVAU54EDcWXioq1o/b4++bIvu4l/ehRqhEGp7Zgff1
 JTns5HChAzrMX1rvHfXKAnqNOryj8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaM41sPvMUPZibxM/cfj2eN5yICkPaI+TPNC6+8UzaySsEgHON61Hg0PBfLjjqFfLYEyvFhZ
 cvznTmQ4YYyUvk/k2HsGI/xIJcgxzs1wivIVIvnwhG8mbuYbzj9dFv2GAXmUwzN14vd+F+92
 48Gb6OikkwDOMWgOXO/2dBIcjg3wY0TWMqeRzp/LLDTe2KL2QgJVpfs/F/WU9U4wvkFyLyTp
 SvVt40x4AOXuEAr4D6iMhhLAI4Dl74mxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:1LdFtqs5HC1VS8+SIIc3mjr77skDedV00zEX/kB9WHVpm6uj5q
 WTdZsguiMc5Ax6ZJhko7C90cq7MBHhHOBOj7X5VI3KNGLbUSmTXeJfBODZrwEIdReSygck78
 Zdm2wUMqyWMbC85vyKhDWFLw==
X-Talos-CUID: 9a23:rDdkt2Mw6GYxO+5DcQBq9w0YId4feFb+0kfZelXoLjYqYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AH2gpmw1Sd2G/jTU+wnwJ0VTEkjUj2auWLkAI1pg?=
 =?us-ascii?q?8oYqcaw9fZSuy12WtTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.09,214,1716249600"; 
   d="scan'208";a="317585762"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by alln-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 09:56:07 +0000
Received: from sjc-ads-3960.cisco.com (sjc-ads-3960.cisco.com [171.68.251.157])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 46H9u7cG022085
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:56:07 GMT
From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gcc: remove paths to sysroot from configargs.h and checksum-options for gcc-cross-canadian
Date: Wed, 17 Jul 2024 02:56:06 -0700
Message-Id: <20240717095606.3572072-1-ohnatiuk@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
References: <CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.251.157, sjc-ads-3960.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202151

Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cross-canadian.
This will improve (but not fix) reproducibility of gcc-cross-canadian.
Also move this code to functions to avoid code duplication.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 .../gcc/gcc-configure-common.inc              | 19 +++++++++++++++++++
 .../gcc/gcc-cross-canadian.inc                |  3 +++
 meta/recipes-devtools/gcc/gcc-cross.inc       | 15 ++-------------
 meta/recipes-devtools/gcc/gcc-target.inc      | 16 ++--------------
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index d77b2ec3d1de..c936d1a9bd7b 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -120,3 +120,22 @@ do_configure () {
 	oe_runconf
 }
 
+remove_sysroot_paths_from_configargs () {
+	# Prevent sysroot path from being used in configargs.h header, as it will
+	# be rewritten when used by other sysroots preventing support for gcc
+	# plugins. Additionally the path is embeddeded into the output binary, this
+	# prevents building a reproducible binary.
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
+}
+
+remove_sysroot_paths_from_checksum_options () {
+	# Prevent sysroot/workdir paths from being used in checksum-options.
+	# checksum-options is used to generate a checksum which is embedded into
+	# the output binary.
+	oe_runmake TARGET-gcc=checksum-options all-gcc
+	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
+	sed -i 's@${1}@/host@g' ${B}/gcc/checksum-options
+}
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 7c4233c21157..9528b71272dd 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -64,6 +64,9 @@ do_configure () {
 }
 
 do_compile () {
+	remove_sysroot_paths_from_configargs
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}'
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 }
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 5b0ca15d4762..f8a7730cf322 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -62,19 +62,8 @@ do_compile () {
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 
-	# Prevent native/host sysroot path from being used in configargs.h header,
-	# as it will be rewritten when used by other sysroots preventing support
-	# for gcc plugins
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded into
-	# the output binary.
-	oe_runmake TARGET-gcc=checksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}'
 
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index e9187fc444b9..bd7506fe3a55 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -132,20 +132,8 @@ FILES:${PN}-doc = "\
 "
 
 do_compile () {
-	# Prevent full target sysroot path from being used in configargs.h header,
-	# as it will be rewritten when used by other sysroots preventing support
-	# for gcc plugins. Additionally the path is embeddeded into the output
-	# binary, this prevents building a reproducible binary.
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded into
-	# the output binary.
-	oe_runmake TARGET-gcc=checksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_TARGET}'
 
 	oe_runmake all-host
 }
-- 
2.35.6


