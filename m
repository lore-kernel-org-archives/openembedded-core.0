Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3AC6B2BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 14:50:23 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so5112628eek.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 06:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yZBjzZqaL0F7hnDENPyQz4GsERrhZOEr+HhBDwUq3QU=;
	b=DsdQVtmBLDu1ptlbz296dDznlulYov3HaKgdOnjAI3O/LpPEAPnpy4LfgplALbOtEt
	dFRPMelKUCAu3ppnv/LiXGRaS8UGKijv/FUtFIyM1+p5ECFRtstbwA54yWgSP8dHKrCX
	lO1Eq5GUNKp+TqrBQYgf+l44VEoVR2xkCCuh0NczNlR9vXBcDn4rI7fQloFFPuAV70yl
	oTU7hJqqhv+yqgrrNfIWTc1LAIw3QVSROIdrvCZV5w+481BLd8B+h3E9QbWai3TTJJK0
	er98nBEvMnM9vqmx8r5wGxgFFkldOeJG+G+XWQp5qyHeizkfdQ2l3D/wyoJOjcx0OO3K
	Watw==
X-Received: by 10.14.115.133 with SMTP id e5mr2001717eeh.91.1388415024423;
	Mon, 30 Dec 2013 06:50:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm109344395eem.21.2013.12.30.06.50.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 06:50:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2013 15:50:18 +0100
Message-Id: <1388415018-6181-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] kmod: fix zlib dependency
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
X-List-Received-Date: Mon, 30 Dec 2013 14:50:25 -0000

* unlike BBCLASSEXTENDed native support, dependencies in kmod-native doesn't get
  automatic -native suffix, so kmod-native was depending on target zlib.
* move the dependency from .inc and apply it with right suffix

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb | 3 +++
 meta/recipes-kernel/kmod/kmod.inc           | 2 +-
 meta/recipes-kernel/kmod/kmod_git.bb        | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index fccc39b..6600413 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -2,6 +2,9 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 require kmod.inc
+
+DEPENDS += "zlib-native"
+
 inherit native
 
 SRC_URI += "file://0001-Fix-build-with-older-gcc-4.6.patch \
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index f8d5bac..ac9de2f 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
 
-DEPENDS += "pkgconfig-native zlib"
+DEPENDS += "pkgconfig-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index f90b9aa..c55cbd3 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,6 +3,7 @@
 
 require kmod.inc
 
+DEPENDS += "zlib"
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RCONFLICTS_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
-- 
1.8.4.3


