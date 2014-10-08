Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD0D601A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 02:57:36 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id ft15so6099282pdb.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 19:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=7FPmw68TndrQJr8rYl9AsTxKBFQkuAGmynz//HSkeGI=;
	b=gWZbisOayKk68YmPddJwMI0VLfvbBfXXAniDrA9zPeG9GN9a2qtNotCp5ymEB/IlJJ
	r7wjW5I1rr40Rt4kxNqQyBCnX1ZIaUVOGSc+rCvy2WzoSmA/LMXHJpMhQ1aB9Qn0N/0w
	NsZEEAd2qKpr1k78eyFGGTxsy7lb+oZ4plxevZ3xqkHXUUTckZTf1uIdqP7oAcjlkgbX
	/b8KtxYwN1cLGUTsEY+mDmkJpA0nuvAb8otGgoKwREdbzgpDiuUtwZUcQx4z4I4ZGUDN
	Zjx3EVni9F5VrCdYJp4Oi10YPvqZyuelHkzxKV4QytXeEUXR9yoOZvY6IQKbTt3er3Zn
	A/AA==
X-Gm-Message-State: ALoCoQmGM1lfWtuLkpOmlXu7LoSH4NzU06zz1Finxe2W9l4e5+qfDCYZ9c+CZYvjIciM0uKswDLo
X-Received: by 10.66.184.174 with SMTP id ev14mr7413517pac.20.1412737057809;
	Tue, 07 Oct 2014 19:57:37 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49]) by mx.google.com with ESMTPSA id
	pp2sm17105270pbc.66.2014.10.07.19.57.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Oct 2014 19:57:36 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Oct 2014 11:57:27 +0900
Message-Id: <1412737047-7936-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 2.0.0
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: [PATCH v2] gstreamer1.0-plugins-bad: Add patch for disable pkg-check of wayland-scanner
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
X-List-Received-Date: Wed, 08 Oct 2014 02:57:37 -0000

wayland plugin can not build by pkg-check of wayland-scanner.
By applying patch to disable a check of wayland-scanner, wayland plugin can build.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 v2: Fix Signed-off.

 .../gstreamer/gstreamer1.0-plugins-bad.inc         |    1 +
 .../disable-wayland-scanner-pkg-check.patch        |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/disable-wayland-scanner-pkg-check.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index dab0bf5..71badae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -7,6 +7,7 @@ DEPENDS += "gstreamer1.0-plugins-base bzip2 libpng jpeg"
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
 SRC_URI += "file://configure-allow-to-disable-libssh2.patch \
+            file://disable-wayland-scanner-pkg-check.patch \
            "
 
 inherit gettext
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/disable-wayland-scanner-pkg-check.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/disable-wayland-scanner-pkg-check.patch
new file mode 100644
index 0000000..decf3f0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/disable-wayland-scanner-pkg-check.patch
@@ -0,0 +1,19 @@
+diff --git a/configure.ac b/configure.ac
+index d28f5e7..8a5e53f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2011,13 +2011,11 @@ AG_GST_CHECK_FEATURE(DIRECTFB, [directfb], dfbvideosink , [
+ dnl **** Wayland ****
+ translit(dnm, m, l) AM_CONDITIONAL(USE_WAYLAND, true)
+ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [
+-  PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.4.0 wayland-scanner, [
++  PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.4.0, [
+     HAVE_WAYLAND="yes" ], [ HAVE_WAYLAND="no"
+   ])
+ ])
+ 
+-AC_PATH_PROG([wayland_scanner], [wayland-scanner])
+-
+ dnl **** WebP ****
+ translit(dnm, m, l) AM_CONDITIONAL(USE_WEBP, true)
+ AG_GST_CHECK_FEATURE(WEBP, [WebP], webp , [
-- 
1.7.9.5


