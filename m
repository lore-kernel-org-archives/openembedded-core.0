Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id D2E4779689
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:14:52 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id f1-v6so5131178plt.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=iAzNvY5ycR8hNAn/8j5EqvFNCpUNrIp33niqfFlZq5g=;
	b=oWqjREbW4s0+Cew34kFU/xrpRBsCBlLnrpLosLSOPG/+98tZG4CtuUPp8NP8fMrHda
	Y4nGqzxz1ziT5l6Ra2umwNGXS3F5ZswE4obHoDPqEjVVjXxuScyVHDx8thvAvPqrYk56
	YqSfPec1F2CPH7mxbt8DzjXtUOQe363pFT9J4duRzPFCuFp5oneRkd3dW1bWfrMDIUpR
	IV6GzxzWqqGE8nPE8egner9t8T2o2HTk8og8DhzovXBDlrAhTEWaZ2a/q+TMSari+t+5
	OBReJ6p/YYbMxRj7cr+fNTfCXvPr8eWb8/zu4XkrvTcTOwfU7Vcj/eqESRls8XyuuEHR
	xO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iAzNvY5ycR8hNAn/8j5EqvFNCpUNrIp33niqfFlZq5g=;
	b=F9BP8eDEwdXCvi3bjD2OeJ8eE6Ba/Ed3NGREula6zXN7WYsVUKFFVOM44wlk0PBrXc
	mBOZlFOukp0a44H1KG9vdfQOovq13xz782wZajB1Aog0v7XOhs5WL/VUSg0VFDpUv888
	p5e+WKlDBbb8FmsOYKf6FuxzPRUYeY+Ls3cvE8Xtl4bW1JAkP7C9eJxZUEbkj1XjVOpJ
	2LVIBgquy/dG5xKvs32MCDzXZ+900yNiKSA8sRvCoHFx/NxpepzKiYGOfwGbWg8wHyTZ
	9eJ2tTs5EQXQ2+cX9/sgGAQZGjPkW0NooforLSDMsrh/zup/Kl+sBjlzb9nhgXgr3oxx
	ERrA==
X-Gm-Message-State: APzg51DE30fYKkBi3WTzj3AvwWEJbX/uYJkFv445WoRKUPdmVcvQFR8E
	Zt7ANkKg+W+zxl5k6U33uO0=
X-Google-Smtp-Source: ANB0VdaJfPSSi1PeP0IcgEXVYlAz99yUHCFPrHvwVZ1CjzGZuePcUEnHhvveF3fW+afU1tbaKG/3uQ==
X-Received: by 2002:a17:902:8542:: with SMTP id
	d2-v6mr3167535plo.285.1536246893984; 
	Thu, 06 Sep 2018 08:14:53 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	a15-v6sm11725846pfe.32.2018.09.06.08.14.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 08:14:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 08:14:52 -0700
Message-Id: <20180906151452.1277-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] xserver-xorg: config: fix NULL value detection for ID_INPUT being unset
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
X-List-Received-Date: Thu, 06 Sep 2018 15:14:53 -0000

Fixes Yocto # 12899

Xorg.log message:

(II) config/udev: Adding input device (unnamed) (/dev/tty59)

and cause system freezes.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...value-detection-for-ID_INPUT-being-u.patch | 40 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.6.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
new file mode 100644
index 00000000000..964d5dd4cf4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
@@ -0,0 +1,40 @@
+From a309323328d9d6e0bf5d9ea1d75920e53b9beef3 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Fri, 5 Jan 2018 11:58:42 +1000
+Subject: [PATCH] config: fix NULL value detection for ID_INPUT being unset
+
+Erroneous condition caused us to keep going with all devices that didn't have
+ID_INPUT set.
+
+Fixes: 5aad81445c8c3d6
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=104382
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-status: Backport
+https://patchwork.freedesktop.org/patch/196090/
+Affects: < 1.20.0
+[Yocto # 12899]
+
+Signed-off-by: Armin Kuster <akuser808@gmail.com>
+
+---
+ config/udev.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/udev.c b/config/udev.c
+index e198e8609..3a73189e2 100644
+--- a/config/udev.c
++++ b/config/udev.c
+@@ -135,7 +135,7 @@ device_added(struct udev_device *udev_device)
+ #endif
+ 
+     value = udev_device_get_property_value(udev_device, "ID_INPUT");
+-    if (value && !strcmp(value, "0")) {
++    if (!value || !strcmp(value, "0")) {
+         LogMessageVerb(X_INFO, 10,
+                        "config/udev: ignoring device %s without "
+                        "property ID_INPUT set\n", path);
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
index c680cf9e89b..7e8a9541cb4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
+            file://0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch \
             "
 SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
 SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
-- 
2.17.1


