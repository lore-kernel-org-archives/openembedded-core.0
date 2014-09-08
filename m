Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4563A62252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:12 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cc10so2507852wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OX1ZfwVdOzLWbMngEYZbcL6ODahLfIU/ckvGD7j2xco=;
	b=Hh7ApkpspDzXoid+4KZHvspcX4mARbsMAZtdP07N9ZfsGowvvDH6PqPoRdWRrqiuL4
	WrTiSVY/pe23pm97l3WRoYZXGCH5+7Uyq8c5kXNvjz4qyQlcG9XsfToNKGLjPbHPS8cF
	mAWoc3sqFkbKS4BNfB1rr40UO1n4SF4zlRgDmXc7d1ZweCUsRp1CIOHmr6ILUG2EM/Iq
	Y9w/OtvHaGPk5v3rm2+Wvp/OYkbRjk7+JxjF3N6MsXBNe7tGoLW9Copu0UFNdHsHGV3u
	BPu9nwhMTEpjoLNy7cLXD5oWgT2tSLAxL0Bb0JxbeCclUkgxkidUgd14qFFRo/5lWBUM
	QZug==
X-Gm-Message-State: ALoCoQl/xdG/E59MUn3SfND80XK4RTcojrQAz/Sy3VzWWfFC69ZsOkVpajGh4T0kLqRLaD06b9en
X-Received: by 10.194.193.10 with SMTP id hk10mr12407032wjc.70.1410177553195; 
	Mon, 08 Sep 2014 04:59:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:35 +0100
Message-Id: <127dfa1b5eb5dc9829b0139d5e84e24b6b2836a6.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 17/27] pixman: upgrade to 0.32.6
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:12 -0000

Revert a patch to the MIPS-specific code that was causing compile failures.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/pixman/mips-export-revert.patch       |   22 ++++++++++++++++++++
 .../{pixman_0.32.4.bb => pixman_0.32.6.bb}         |    5 +++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch b/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
new file mode 100644
index 0000000..14a5fd2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
@@ -0,0 +1,22 @@
+Revert a commit in pixman 0.32.6 which breaks compliation on MIPS machines with
+errors such as:
+
+pixman-0.32.6/pixman/pixman-mips-dspr2-asm.S:4267:
+Error: invalid operands `mflo $14,$ac3'
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- b/pixman/pixman-mips-dspr2-asm.h
++++ a/pixman/pixman-mips-dspr2-asm.h
+@@ -72,10 +72,7 @@
+ #define LEAF_MIPS32R2(symbol)                           \
+                 .globl  symbol;                         \
+                 .align  2;                              \
+-#ifdef __ELF__
+-                .hidden symbol;                         \
+                 .type   symbol, @function;              \
+-#endif
+                 .ent    symbol, 0;                      \
+ symbol:         .frame  sp, 0, ra;                      \
+                 .set    push;                           \
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
index 51cca5d..467ba50 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
@@ -29,9 +29,10 @@ EXTRA_OECONF_class-native = "--disable-gtk"
 
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+            file://mips-export-revert.patch \
 "
 
-SRC_URI[md5sum] = "cdb566504fe9daf6728c7b03cc7ea228"
-SRC_URI[sha256sum] = "ae2bd664057e330d41b40336ed296d3512318ce7f2401cc42601f2613d371e4c"
+SRC_URI[md5sum] = "8a9e8f14743a39cf303803f369c1f344"
+SRC_URI[sha256sum] = "201fc0d7d6bc0017496f2bd27b3ca14224aea0df6b624c5ee2dc0307a4ff14a4"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
1.7.10.4


