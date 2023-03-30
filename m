Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5099C77B61
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.38929.1680210852754171690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=o20WIOBT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id u38so13486802pfg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210869; x=1682802869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2dVh6u47Oay2rXDreWDbe50aAhKkcl036xXAEASPoQ=;
        b=o20WIOBTyAixEhIhwj/tNauzQE8y0ClrR+ez/HhbclbFgOnoomqvmT41MEwmjVv8Vq
         saEcNoFT6lYOY1UA5WaX0DAEcJPzu/XIrZvQ8LTotx2HglWbGS6J576kLjN5R94jGsF+
         qC7uElypt9x8qvNCSstHeYbwM5R5LeaMs0zQ3TcnlXOLtRjO9uLe1c25uZB6T+hbfHos
         hs4m/id9DeWWMyh8wGP6iQYbE8Hr2Jw5Ji2rX926HIDR2Md+u9c/yj2JYGaS0Y4tvooJ
         kX9m3g6lGVwy8R9S6UAV/o+VMw31Yhy3XKnmozwpBHYx1hfYrmTgNQd/uHu/Hy7oQlSo
         6CQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210869; x=1682802869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2dVh6u47Oay2rXDreWDbe50aAhKkcl036xXAEASPoQ=;
        b=ZkG9DjuQu3Jh9KOOKqf88Ck2C8mABf/uZ1Z930t/QW+KE4Pvud3QSPUWZaurWzAP7f
         dRo4smYMT4jZDoz5znquprmlxBOHABftnxFpyym8tmRGe9vs4jZuv2u7A9Lxao6snu8U
         23sg73A1YSF2YmJtNsCUYaSSqqs8KHTmHf2DO2lte/IBOT+U6aqRpXSgrjgQAgV3G84B
         at0aAVIouVu+u4tDuX6mxLzA6bhML6sGuHMR/v/8ui1Z96ac7sX6dvZHGAVkEFJrnbeS
         ve+8/etBIFM2tlPjRU9npMLtOL5Jpt88DFZjUBdZM+6FfLyQxgM84ZycT4kik+o0gMum
         mibw==
X-Gm-Message-State: AAQBX9csBBRX70oS6glo08mKkpTJa8csRHU2GfRqm1ixRMIhVKUmQTxE
	yJBDl43qFv9kPsJ5koFYs3M1kPLKFpalFfMAnwc=
X-Google-Smtp-Source: AKy350a/64yooalJ/WaooG7/XjOUGyMneQpVaLncdo518cEIWCVYe0XApJtukASC/uJtm3EZTbBttQ==
X-Received: by 2002:a62:1dcc:0:b0:625:2636:9cd2 with SMTP id d195-20020a621dcc000000b0062526369cd2mr21316973pfd.18.1680210869446;
        Thu, 30 Mar 2023 14:14:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/14] xcb-proto: Fix install conflict when enable multilib.
Date: Thu, 30 Mar 2023 11:13:54 -1000
Message-Id: <a9fdbd8d5a2017248f519784e4236b3983e5ecac.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179371

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/pkgconfig/xcb-proto.pc conflicts between attempted installs of lib32-xcb-proto-dev-1.15.2-r0.armv7ahf_neon and xcb-proto-dev-1.15.2-r0.cortexa57

The differences between the two files are as follows:
@@ -2,7 +2,7 @@
 exec_prefix=/usr
 datarootdir=${prefix}/share
 datadir=/usr/share
-libdir=/usr/lib64
+libdir=/usr/lib
 xcbincludedir=${pc_sysrootdir}${datadir}/xcb
 PYTHON_PREFIX=${prefix}
 pythondir=${pc_sysrootdir}${libdir}/python3.11/site-packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4876189dd2ae5a04a296b11b537b9f613159c6bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nstall-conflict-when-enable-multilib.patch | 32 +++++++++++++++++++
 .../xorg-proto/xcb-proto_1.15.2.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
new file mode 100644
index 0000000000..4209139da8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
@@ -0,0 +1,32 @@
+From fc28149b6b198042c8d29e0931415adad7ed3231 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 16 Mar 2023 08:03:47 +0000
+Subject: [PATCH] Fix install conflict when enable multilib.
+
+Automake defines pythondir in terms of libdir (rather than hardcode 'lib' or query it from python as automake upstream does)
+https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
+
+So libdir needs to be defined when pythondir is defined.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8b57a83..580f5bc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ SUBDIRS = src xcbgen
+ 
+-pkgconfigdir = $(datarootdir)/pkgconfig
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = xcb-proto.pc
+ 
+ EXTRA_DIST=doc xcb-proto.pc.in autogen.sh README.md
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 4e4472a9c1..e60e7958a7 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
 
 SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz \
            file://0001-xcb-proto.pc.in-reinstate-libdir.patch \
+           file://0001-Fix-install-conflict-when-enable-multilib.patch \
            "
 SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
 
-- 
2.34.1


