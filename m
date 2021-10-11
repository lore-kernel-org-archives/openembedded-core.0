Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE83C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:19 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.9555.1633945278468017196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bOrY/PJI;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id g25so7626341wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A4T7QkNcqjaQENBO130mc99G0eTFpVWY0wcfjwCoE/0=;
        b=bOrY/PJIJqd8URotrKdqAvQnS18L4DoY9LIjwDT/7A0S1c2iimFqJ4r8wVo4MsV40v
         QnpcSbbfXDjGz5OaQSSpCpgk+/+/nQFpZcYefrsRn+wR1a6qTZT7ddICK8QV5NT4yqPr
         rs+RUaL/wKNnNVcLnc6cfOkN/co8udfg7pJSun3da5j4WukmLyLu1V6RgJQhmt9J6UZl
         6t0YD6D4pTvdZjBrKDpP+mcTCsNMgAhjWsC1hl1j/CaOXMr0PVp3gN+A+pWEo5BH/xvF
         TnM3RfQbc/b6YpSp5MBRX4RdgjG3Shfyb73dlsYphpSph9p7pBvNvkevNU2+o/ShxYwL
         ga6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A4T7QkNcqjaQENBO130mc99G0eTFpVWY0wcfjwCoE/0=;
        b=tnoB5VX//fu4pXBoefgsATTU9/oOKO/UvPQmRzGX6Y7avJ3/ufmcPN6iX6LWTq2blo
         wbdsgGkMDSL+tI9P1GfC+dwxeBg4EK/a3GaFCbkTMhWVHgr04qecM7T6QI1Se6p720OF
         Iwp/GSEE/p0/CVO0A+rGzRrG1o4U4x0inAWnko1IflqUs/qyglfHWO2u1sVsWKaBmLdi
         R2shjp2qVjHP1sC8C06OAkj9Iw8+ET016bCVL8oAs4pwGTasfDfY+FZU6Sn7ifFeY1S8
         DNUUH08BWuLZ0JrgXUkZmPQIKew1sMxDRJmFZUSnduz1jGT0THf3XDGYahQchRwfV/un
         AViQ==
X-Gm-Message-State: AOAM531oDWPiNFMqq2TcwhjavPZ/4wzPxlV7NEXxlryBQzkyGhk7hWho
	deg1sk+BDMxZC+/O2Acj4opAwuway5w=
X-Google-Smtp-Source: 
 ABdhPJx71XXYahxaXN9s6K/2NKSiYReyfxkUPURQkn8wnzIPM+3VVmehTDnzPGu0Qo2wkbVcviwAeQ==
X-Received: by 2002:adf:f481:: with SMTP id l1mr22769662wro.411.1633945276967;
        Mon, 11 Oct 2021 02:41:16 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/25] libsoup: add a 3.x recipe
Date: Mon, 11 Oct 2021 11:40:55 +0200
Message-Id: <20211011094059.4184654-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156834

libsoup 2.x is still needed until all consumers update to 3.x.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libsoup/libsoup-2.4_2.72.0.bb             |  2 +
 meta/recipes-support/libsoup/libsoup_3.0.1.bb | 44 +++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup_3.0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c203f352caf..3ffb065804e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -384,6 +384,7 @@ RECIPE_MAINTAINER:pn-libsecret = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libsm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsndfile1 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libsoup = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
index e888202b775..351bc9de73b 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
@@ -20,6 +20,8 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
+UPSTREAM_CHECK_REGEX = "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
+
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.1.bb b/meta/recipes-support/libsoup/libsoup_3.0.1.bb
new file mode 100644
index 00000000000..1e4d3b272bc
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup_3.0.1.bb
@@ -0,0 +1,44 @@
+SUMMARY = "An HTTP library implementation in C"
+DESCRIPTION = "libsoup is an HTTP client/server library for GNOME. It uses GObjects \
+and the glib main loop, to integrate well with GNOME applications."
+HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/gnome/libs"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
+
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
+
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI[sha256sum] = "6f0c316d10f8458b96f564c7644be3c2011bd75ad5054c8db26afb0c9a91bc47"
+
+PROVIDES = "libsoup-3.0"
+CVE_PRODUCT = "libsoup"
+
+S = "${WORKDIR}/libsoup-${PV}"
+
+inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
+
+EXTRA_OEMESON:append = " -Dvapi=disabled -Dtls_check=false"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+# When built without gnome support, libsoup will contain only one shared lib
+# and will therefore become subject to renaming by debian.bbclass. Prevent
+# renaming in order to keep the package name consistent regardless of whether
+# gnome support is enabled or disabled.
+DEBIAN_NOAUTONAME:${PN} = "1"
+
+# glib-networking is needed for SSL, proxies, etc.
+RRECOMMENDS:${PN} = "glib-networking"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


