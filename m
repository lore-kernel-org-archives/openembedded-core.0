Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 35A5F7CDE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 16:36:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so12165563wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 08:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dva1+dAb2slcKsI3rGhb74WAPqYUDLUMS2fOGpKOjBY=;
	b=Jfpnl+Lcg1xYHxEVOLfllVirtTNR8U79CBUBgDLFRhNpGUqqjFGACkmxqC4SS4qLiw
	t3Wl7ssV+WGXzrOGfYtDpmH0k9xqAZnxHnuwvsc2NG1tMr16znTdxd3ZLkJlKeivI1MI
	GIDQDv1eARW4xQ06vA/s0nCIwcUC8Fa9yW5oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dva1+dAb2slcKsI3rGhb74WAPqYUDLUMS2fOGpKOjBY=;
	b=HvGIPFHTTh0NnInTS+A/DubXASPL7NUMAVAuhVxzv9tmbD4N2IZSimWHat2QoWMjZH
	JY42jvbwhW2wg0NHTsNBq+lWINYzpRYQvXM72hkgHojwXtviWCAdfFx2yS1VdxyRvT6y
	hzrih2bXkdFcXvzbfgfjP5Yx+ggzvWBAXLBmGvDrjbUKdSMBgtFRtuuhCbKdUjY3dk5K
	Ac88Y0mx0S2oKYB+lt/JiQewIvUeLJkDfi3kUR4sRUqn7tma8fjEdtMvIkBeJwAh/bOo
	3uPfYmCGFu6B2P0xEMDb4Wc7XtwjES/S+Dd4KoHQozhfI88XCdOxu4NFxIKSolyXSBJk
	o75w==
X-Gm-Message-State: APjAAAWLFPArrVQQq+zi5oUOMs3mneydtW1rvxS/WpoZg7FXKen/RYLd
	G5lNDiMY3KOMNyS/zhC9bPCqZRkDD/4=
X-Google-Smtp-Source: APXvYqwkPlrdu7mcV66WpYrkVVyldXN228x6l9gMzmaXBKNw9KefkGELcAip/rWTaZCuiSQu6/8wfw==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr24341226wrh.371.1580143002370; 
	Mon, 27 Jan 2020 08:36:42 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r6sm21767627wrq.92.2020.01.27.08.36.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 08:36:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 16:36:34 +0000
Message-Id: <20200127163634.12222-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] kbd: Fix build reproducibility issue
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
X-List-Received-Date: Mon, 27 Jan 2020 16:36:42 -0000
Content-Transfer-Encoding: 8bit

Our CFLAGS were being lost which was breaking reproducibile builds due to
losee of the debug prefix remapping flags. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/kbd/kbd/fix_cflags.patch | 25 ++++++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.2.0.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/fix_cflags.patch

diff --git a/meta/recipes-core/kbd/kbd/fix_cflags.patch b/meta/recipes-core/kbd/kbd/fix_cflags.patch
new file mode 100644
index 00000000000..37220960ab7
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/fix_cflags.patch
@@ -0,0 +1,25 @@
+We need to ensure our CFLAGS are preserved as well as whatever tweak configure
+tries to make. Without these, the debug prefix changes get lost and we lose
+build reproducibility, likely with other side effects.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+2020/1/27
+
+Index: kbd-2.2.0/configure.ac
+===================================================================
+--- kbd-2.2.0.orig/configure.ac
++++ kbd-2.2.0/configure.ac
+@@ -72,9 +72,9 @@ if test "$enable_code_coverage" = yes; t
+ fi
+ 
+ case "$GCC,$ac_cv_prog_cc_g" in
+-	yes,yes) CFLAGS="-g $CC_O_LEVEL $FORTIFY_SOURCE" ;;
+-	yes,)    CFLAGS="$CC_O_LEVEL $FORTIFY_SOURCE" ;;
+-	   ,yes) CFLAGS="-g" ;;
++	yes,yes) CFLAGS="-g $CC_O_LEVEL $FORTIFY_SOURCE $CFLAGS" ;;
++	yes,)    CFLAGS="$CC_O_LEVEL $FORTIFY_SOURCE $CFLAGS" ;;
++	   ,yes) CFLAGS="-g $CFLAGS" ;;
+ esac
+ 
+ CC_CHECK_CFLAGS_APPEND([\
diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
index e13cea76346..e5700ff57f9 100644
--- a/meta/recipes-core/kbd/kbd_2.2.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
            file://0001-analyze.l-add-missing-string-format.patch \
            file://0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch \
+           file://fix_cflags.patch \
            "
 
 SRC_URI[md5sum] = "d1d7ae0b5fb875dc082731e09cd0c8bc"
-- 
2.20.1


