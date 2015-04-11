Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFFD73D32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:02 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so37829774pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Qh9iQa5FrN6QHJ51nqwCIBv3FHO5vhKJEgq+Kdoib/8=;
	b=vRWDvPQvNVWD81zeyJAghMvNB1vxFpQJuVIiZKy1YCnzZW73Pouu/k0mVbDSuJCxqs
	4P+gbfJl2GKIXeZ6PfHGITJWwFpXWz2IDmf5tkhyjez2Lb9jTJ7GXXh8Sr29XnQlsKLg
	294rU1eGf2E36IXJTftN8mxBcPxptfYwJ7xGHjaS6leugQ2gf2pMhFr+qc4Mo24x1/wh
	IM7vql6kWC7t0LkSuil/q09DxXw14hzs01i4ApUo3DcWb7M4hwAuCdeIg3B69yUTeuYF
	R8uGOzvD3cVZ3pfmhwpQW3HBYbZt+UGtAHVzy62Rf1NX+x5FyoKePFhpCv30KwSoGcop
	jcrg==
X-Received: by 10.68.225.162 with SMTP id rl2mr6985607pbc.117.1428715264561;
	Fri, 10 Apr 2015 18:21:04 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:42 -0700
Message-Id: <f51fc6d88ad6766561e415faa63d986e1ce00e93.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 11/17] xserver-xorg: Use __GLIBC__ instread of __linux__ to denote glibc dependent code
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:03 -0000

Change-Id: Ia899520181feb1c601a76e04a176f4387a331c00
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch | 31 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.16.3.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
new file mode 100644
index 0000000..21e4ed4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
@@ -0,0 +1,31 @@
+From f242740f6488a25e6ca84968b0e2319a9a3975b4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 20:52:50 -0700
+Subject: [PATCH] use __GLIBC__ guard for glibc specific code
+
+Using __linux__ is a tad bit wrong assumption since
+linux != glibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hw/xfree86/os-support/xf86_OSlib.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/xfree86/os-support/xf86_OSlib.h b/hw/xfree86/os-support/xf86_OSlib.h
+index eb0a338..c366ffc 100644
+--- a/hw/xfree86/os-support/xf86_OSlib.h
++++ b/hw/xfree86/os-support/xf86_OSlib.h
+@@ -178,7 +178,7 @@
+ #include <sys/types.h>
+ #include <assert.h>
+ 
+-#ifdef __linux__
++#ifdef __GLIBC__
+ #include <termio.h>
+ #else                           /* __GLIBC__ */
+ #include <termios.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
index cfbc491..7eeadd1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xtrans.patch \
             file://0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch \
             file://0001-xkb-Check-strings-length-against-request-size.patch \
+            file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
            "
 
 SRC_URI[md5sum] = "afd93977235584a9caa7528a737c1b52"
-- 
2.1.4


