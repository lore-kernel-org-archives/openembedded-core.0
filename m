Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB2807CB38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 18:34:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n19so6824194wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gtxDqRBj3hJEutEAjX24nXcu92GPVOq3rDegnAr4Os4=;
	b=jei8wNeje/33Zr9LrVUrwX61/JXDSoCn1bVAapa0R+U6yV3CSPflWGybpzjHLylWrk
	SnKX3XnH3rP0/sLMk5Zh4UOgFG1QYhDVbDx0pJ44T8NnEm5zhqyZvhg+/4ab0RKwpFSG
	GzO98s54RIiz6xjsuajneBLYzI2EoZtiXE1Z1pmBJopb46Pu8UBqDhq6Kl7tTiOdRGAs
	7Z2bdtwA3vor2rmu5AT4x/EfvyeR3FYgQUB62t5V+8DRxy3aEHVcpvRKqNclhxNWDHkE
	7vyMhJhhsJwn9XqNdGB525reNT9ZI0CwZcC7EEjcwwyQzRV5Q/qRb+UNBvjeYYqHkXIA
	nO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gtxDqRBj3hJEutEAjX24nXcu92GPVOq3rDegnAr4Os4=;
	b=MI0wWnu9OgyvFDQnSZEhK7d6UMueqQ3Z9nsQfEWs+fEhn/Q45klynLJbaucJNa/mob
	Iybv5hOUQLXoWMKReweVlhcv1PcUT9CpCEG1eGjg/4OlzeaWD9ScGadc6I3umBdno5Ib
	rsR+wiUGAq2FStNpY+bGsdNCuOwf4fXma0CFYWC9UWCijr+XuLTlE8cC6OKhetgh6Y1M
	cM5DnS2lmYBRU/OUOlFN8WPEJJ20R25cPEXLX9W1jDrkIGDYgSwxqdprXZ90bF47ppyA
	Sr3uT/RkGgLrsLhlznci6vuSVL6OAb0oGioNddYolIGgT6VspL1aaaGwjCNRbZT+mQAN
	vXEw==
X-Gm-Message-State: APjAAAV99xpPIqeR/Jo8ZGf1sciR8U5pb7m9jMUI8oPat9Ccnyfva/4C
	OoywSpfI8kQ/ZJGZfHHuYp/aZuuykFM=
X-Google-Smtp-Source: AHgI3IbsWJXgY2P6Po+qMs8yoF29d/feWRTtgU76dI41gmwNQTUwOaE1CRTgUdDjHeEfUAy8VayOZg==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr357013wmj.151.1551292442181; 
	Wed, 27 Feb 2019 10:34:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w4sm26158366wrk.85.2019.02.27.10.34.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 10:34:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 18:33:55 +0000
Message-Id: <20190227183355.19346-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190227183355.19346-1-ross.burton@intel.com>
References: <20190227183355.19346-1-ross.burton@intel.com>
Subject: [PATCH 2/2] libpcre: enable JIT
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
X-List-Received-Date: Wed, 27 Feb 2019 18:34:02 -0000

PCRE has an optional JIT for performance.

Add a PACKAGECONFIG for this, enabled by default.

Also add a patch so that auto-detection of JIT availablity, which is required to
enable the JIT by default, works with out-of-tree builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpcre/libpcre/out-of-tree.patch              | 26 ++++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre_8.43.bb       |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre/out-of-tree.patch

diff --git a/meta/recipes-support/libpcre/libpcre/out-of-tree.patch b/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
new file mode 100644
index 00000000000..687dcc034da
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
@@ -0,0 +1,26 @@
+In out-of-tree builds the #include fails because $srcdir isn't in the include path.  Set CPPFLAGS so that it is.
+
+Upstream-Status: Submitted [https://bugs.exim.org/show_bug.cgi?id=2379]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Index: configure.ac
+===================================================================
+--- a/configure.ac	(revision 1749)
++++ b/configure.ac	(working copy)
+@@ -159,6 +159,8 @@
+ 
+ if test "$enable_jit" = "auto"; then
+   AC_LANG(C)
++  SAVE_CPPFLAGS=$CPPFLAGS
++  CPPFLAGS=-I$srcdir
+   AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+   #define SLJIT_CONFIG_AUTO 1
+   #include "sljit/sljitConfigInternal.h"
+@@ -165,6 +167,7 @@
+   #if (defined SLJIT_CONFIG_UNSUPPORTED && SLJIT_CONFIG_UNSUPPORTED)
+   #error unsupported
+   #endif]])], enable_jit=yes, enable_jit=no)
++  CPPFLAGS=$SAVE_CPPFLAGS
+ fi
+ 
+ # Handle --disable-pcregrep-jit (enabled by default)
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-support/libpcre/libpcre_8.43.bb
index e28615a8ba7..08314efb9e4 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -9,6 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=91bee59d1b327eb1599b4c673e2fb3d1"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://fix-pcre-name-collision.patch \
+           file://out-of-tree.patch \
            file://run-ptest \
            file://Makefile \
 "
@@ -23,13 +24,14 @@ S = "${WORKDIR}/pcre-${PV}"
 PROVIDES += "pcre"
 DEPENDS += "bzip2 zlib"
 
-PACKAGECONFIG ??= "pcre8 unicode-properties"
+PACKAGECONFIG ??= "pcre8 unicode-properties jit"
 
 PACKAGECONFIG[pcre8] = "--enable-pcre8,--disable-pcre8"
 PACKAGECONFIG[pcre16] = "--enable-pcre16,--disable-pcre16"
 PACKAGECONFIG[pcre32] = "--enable-pcre32,--disable-pcre32"
 PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
 PACKAGECONFIG[unicode-properties] = "--enable-unicode-properties,--disable-unicode-properties"
+PACKAGECONFIG[jit] = "--enable-jit=auto,--disable-jit"
 
 BINCONFIG = "${bindir}/pcre-config"
 
-- 
2.11.0


