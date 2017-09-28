Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 89CA573115
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 16:35:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q124so3496370wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qnHSL6xvT2jy1pAL40bL3cMzH9l/IXiQrQm+JsBkdqM=;
	b=LWVkhr7x1DttqI7IDpeVQJ1m89gzorbsFBmw8m+R0Qjy+ALwm3mtP13yXF7mI3eK8h
	tkNoQICwXN7H1VfgBUcdM3dUMvYYCX2NsZ14nj6tENl42DlLcZsG6waO/DA5wz6qq++l
	UVga0y38FQBzxOQ7ZjK1ekFA3ASSAPyeLtcI5KeDbdLUNnaFY9RMdYcTCP1RRIxr9bfl
	+fBhNAoHyFISFg0emsZYuVfbzDkD6Xb1ybFkFjWLeHYd3vubqiqdyQ/EkmE0CWFIg/8v
	ZT6koDVMK+tTiRVhOnTTfRH645dW7S2ds2eeVt4KINRpHNb9lHQiGWpAtJ4I5+QJ1es1
	ARkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qnHSL6xvT2jy1pAL40bL3cMzH9l/IXiQrQm+JsBkdqM=;
	b=fOw/6xc7IGJQeIZTyXmGyjVULHyzFzrO7UBuI6xHYVywdOiCiDwu4gplcmqoDjziHu
	X9ZPz3n9uYsxdDjdF4kZzdtHLCCc36RbcYcGSwLIFx+oMWGhkK6ZQ2zempBABhZWSzB0
	FN+5VgBCjuLd5JzW0/dCZEhZVPoxwKB2O+TaruPW4bfgoDuIulCswh6Itldx7ZSt4wTZ
	3ED2XAB9xhVpgchz6sOF8xhF6jpWQN8IUaopPm+S78BJGnenT0q3q0diLs3PFvigud44
	fFMc5oX5ImdkkSExnSmBUl2+IFvrV/YUZyY/zChyR+YBato5kpKdBoxnx+z/eowAlY8t
	HoSw==
X-Gm-Message-State: AHPjjUjr/dCXpaxcmSSbxIEMlgPfQRVmY21L2tI3OUn1jQTBSJ08ugU9
	GPRjzPEZ0BhBUFFl6dXJIXsAIA==
X-Google-Smtp-Source: AOwi7QBvvhOqMUElUNeCk+wXxHJDqRPnMIOS3N3YFkLcVFRqzlAZYUQWB5PxJfUWeYvroIEGYndOCw==
X-Received: by 10.28.39.68 with SMTP id n65mr1590840wmn.122.1506616527122;
	Thu, 28 Sep 2017 09:35:27 -0700 (PDT)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	u33sm4171177wrc.91.2017.09.28.09.35.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 09:35:26 -0700 (PDT)
From: andreas.kling@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Sep 2017 18:35:21 +0200
Message-Id: <20170928163521.21828-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20170927094014.2666-1-andreas.kling@gmail.com>
References: <20170927094014.2666-1-andreas.kling@gmail.com>
Subject: [PATCH v4] systemd: add runtime dependencies to pam plugins.
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
X-List-Received-Date: Thu, 28 Sep 2017 16:35:27 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  This ensures pam plugins required by /etc/pam.d/systemd-user
  to open a user session are installed.

  systemd[1]: Starting User Manager for UID 994...
  systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)

  Drop package systemd-pam to prevent confusion.
  It is unused for a long time now.

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 v2: improve commit message
 v3: drop systemd-pam
 v4: move version info to annotation
 meta/recipes-core/systemd/systemd_234.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 881896bfb5..acc4c4623b 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -31,6 +31,12 @@ SRC_URI += " \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
+PAM_PLUGINS = " \
+    pam-plugin-unix \
+    pam-plugin-loginuid \
+    pam-plugin-keyinit \
+"
+
 PACKAGECONFIG ??= "xz \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig usrmerge', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
@@ -100,7 +106,7 @@ PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 # Update NAT firewall rules
@@ -295,7 +301,6 @@ PACKAGES =+ "\
     ${PN}-kernel-install \
     ${PN}-rpm-macros \
     ${PN}-binfmt \
-    ${PN}-pam \
     ${PN}-zsh-completion \
     ${PN}-xorg-xinitrc \
     ${PN}-container \
-- 
2.14.2


