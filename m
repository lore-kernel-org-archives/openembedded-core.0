Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC117826D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:45:36 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u49so5174138wrc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=h+NEeiCOsuUpcuhFM9/HFN4eQ2GmFkxTh8qEu9LEtKA=;
	b=MLaOresTaLKcyC9D8xSUxJCf8bpFd9Tm4xtT1TGHVpj2/J8+3ai/QzG60T/8RGY9Tr
	1jOUZanVjD/YkdSN0cSY7ZtgOPpR368i0ouv5b4Jo1P8nuQqPpBw1XmcYZnWFLuB41lx
	ew66lz0KlFF65LtdmbGOmrHr6pE11/wJKsM5QZDiWc2SKAKA0kD9W7YGCWARKSqrrf+q
	0K09cWwRBEPz/UZpCdAn7kL3eD2T7rhAhgl5kr7PRUIPjSaGL/3mJMhitb6mgFVXyw4t
	Xfqnru1DRp09zREnSbS0V9ECV/5OP5cHgUyKV2R8wOjlV6JwpQZRubZySKunpeN5ozoy
	Jlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=h+NEeiCOsuUpcuhFM9/HFN4eQ2GmFkxTh8qEu9LEtKA=;
	b=BpDuzCsXiaaVFvkYimHAbFXLjQ0nA4EAHVLY0pYJB81P4t1WrLIbXRi2VQPm4CE0Td
	N8ngTmqKQwcyGEM6v/NMDhhLKbBggy0fGcYYPcQP41bNADm4YGIJUpLJVyordQpWXRGb
	zLJYdKwswtd97SBqmCrKHxLa8xom7f/t8GORXK4qTc54keZ2fPD7lFu/cIEDiZCGJ/A+
	DubTobViTVXyjxIxM+VP/Rd6OabeD9V8hgSQyK6WBfylJEE5peOyk4oK+cIjvhLobdrP
	w1YAoJny3IFT/fTCc7HEbhRxiNYYhm5xswa4iH24pP/FjDzGhaBqg22aKSLt8A12aS8E
	iztA==
X-Gm-Message-State: APf1xPDGJQueV/O7a5m5voEfFfWld7oeYaWQHBKoHYp8DZC6nNhPSv6R
	K3ptub/sxJWJAuhdm7tMY/Gmt3f5
X-Google-Smtp-Source: AH8x2279aRfyU57R1yw5xEiLEBzXAecakqsO5MXD8Y38LNTtQvr9idlnJULcoK1yxhRU1yqXbFiWEA==
X-Received: by 10.223.197.139 with SMTP id m11mr3395122wrg.0.1519224337407;
	Wed, 21 Feb 2018 06:45:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b185sm8939141wmb.24.2018.02.21.06.45.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 06:45:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Feb 2018 14:45:34 +0000
Message-Id: <20180221144534.2844-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] grub: fix compile error with latest flex
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
X-List-Received-Date: Wed, 21 Feb 2018 14:45:37 -0000

With newer flex releases grub fails to build:

grub_script.yy.c: In function 'yy_fatal_error':
grub_script.yy.c:18:22: error: statement with no effect [-Werror=unused-value]

                      ^
grub_script.yy.c:2366:2: note: in expansion of macro 'fprintf'
  (void)yyg;
  ^~~~~~~

Backport a patch from upstream to fix this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/files/cast-fprintf.patch | 36 ++++++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                |  4 +--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/cast-fprintf.patch

diff --git a/meta/recipes-bsp/grub/files/cast-fprintf.patch b/meta/recipes-bsp/grub/files/cast-fprintf.patch
new file mode 100644
index 00000000000..b340d557070
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/cast-fprintf.patch
@@ -0,0 +1,36 @@
+grub_script.yy.c: In function 'yy_fatal_error':
+grub_script.yy.c:18:22: error: statement with no effect [-Werror=unused-value]
+ 
+                      ^
+grub_script.yy.c:2366:2: note: in expansion of macro 'fprintf'
+  (void)yyg;
+  ^~~~~~~
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From c36c2a86404f373100775305f532c09d46f3c6ce Mon Sep 17 00:00:00 2001
+From: Vladimir Serbinenko <phcoder@gmail.com>
+Date: Mon, 14 Aug 2017 14:11:43 +0200
+Subject: yylex: Explicilty cast fprintf to void.
+
+It's needed to avoid warning on recent GCC.
+---
+ grub-core/script/yylex.l | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/script/yylex.l b/grub-core/script/yylex.l
+index 95b2191..7b44c37 100644
+--- a/grub-core/script/yylex.l
++++ b/grub-core/script/yylex.l
+@@ -91,7 +91,7 @@ typedef size_t yy_size_t;
+ #define stdin  0
+ #define stdout 0
+ 
+-#define fprintf(...) 0
++#define fprintf(...) (void)0
+ #define exit(...) grub_fatal("fatal error in lexer")
+ #endif
+ 
+-- 
+cgit v1.0-41-gc330
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2ea31f64206..fc175406885 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-	   file://fix.build.with.gcc-7.patch \
-"
+           file://fix.build.with.gcc-7.patch \
+           file://cast-fprintf.patch"
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
 
-- 
2.11.0


