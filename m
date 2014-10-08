Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 084D96FDEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 02:49:55 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fp1so6119593pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 19:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=fNYpHv0E1AQIZ0pBd1dGnlocHPxpLg72y0ZOHPCDQHM=;
	b=eQ+7HlfxsztbU6QX94USVv3DNvypjQMLXZf3RPRusgelihVWgkhPS2OzBfuWikM0lb
	/3ne/fhzU48pzYdJyc0oQrhJWaE+zanVHE0PTork3il445h08CM3RpECppYyMLOAWVmH
	AoDEFxh6e6z3J77uVyRzZxF9MVixMK77u8+1EqTLN3viTdIpTeYFB0qhgeISoBnjUNSI
	Vc/Q55PD8XF58Kq0+BI/K1Nkf+TWeTO/V9PDp3XnBBmfJ4hC4DdGsw/Q1aX78710LzO3
	OgPPX7GQvQCMq9xkCswh747rRcvnpiK1gQLqXKhsZD09dNZojcFznf6LnEmUpo2w8Jhh
	3KNw==
X-Gm-Message-State: ALoCoQmqKc9lAoyc+GxpW8Vx/kKB1XlamGWFUvansYTevtb0OzP4pq1jldqqhIYyCFn0w3P8iFXL
X-Received: by 10.67.14.69 with SMTP id fe5mr7303056pad.73.1412736596816;
	Tue, 07 Oct 2014 19:49:56 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49]) by mx.google.com with ESMTPSA id
	k11sm17103556pbq.61.2014.10.07.19.49.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Oct 2014 19:49:55 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Oct 2014 11:49:44 +0900
Message-Id: <1412736584-7768-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 2.0.0
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu@renesas.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: Add patch for disable pkg-check of wayland-scanner
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
X-List-Received-Date: Wed, 08 Oct 2014 02:49:56 -0000

wayland plugin can not build by pkg-check of wayland-scanner.
By applying patch to disable a check of wayland-scanner, wayland plugin can build.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu@renesas.com>
---
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


