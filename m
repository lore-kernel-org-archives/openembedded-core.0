Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E61AC77B7A
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:36:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.497.1686191778984455758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=W9gARJb7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-662f0feafb2so105352b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 19:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686191778; x=1688783778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AuyNJn9mkBts2bLeMlwBH/j0BEwzwCrtxk7xBNUaRM=;
        b=W9gARJb7z6Y2op3MyqUA8kcY/G83rH1ZJ2xWkn77EZmQd57qedXR54Q1UHA7kxGcds
         V65V621EMu2HT4+dEGgorhQmq7zFGYZIgA6CJllDyWlAymjPyRoweSePNPo9P7mThEwz
         hZmBkQr6fmqdEx9tuCCqdfBKCN3/SuMs66IK88JLNsxw4Qtuvf9wkZJeG+kT1zTjPJ0R
         6XTcRbWxJWxr+1sDS3xBnRIp/VjvuunK6EC1wqzvCNN45z6IyGs6sgRNTqryPvwwYetE
         tENnAJ+q/+FFdNHQsxDLaqU9aRgCwtCeUGogK1zfaGjhwlah/JfkwvaIJlE1gAWJ2EBK
         LaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686191778; x=1688783778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AuyNJn9mkBts2bLeMlwBH/j0BEwzwCrtxk7xBNUaRM=;
        b=lps1f1/ekVgwjGuyG7DYLJKYEu/LVEHY57gZi1V0gCF406nigZewt/uov7+1e/wrDO
         Gzc8dF6pkrXspb5A3liquI58/zIK+tQH8lQ+g4WnZveCQG4ywrBHKdAZIZ5MIGPaDKc3
         hybvuADYJyozwLSGQqy6QA4GF9sBoXWisGIXr1rQi4W4IgYXVnFLu4IpAe/c+IozWVun
         jflMtFfT4M843hT7d+PIarwI5fXAkJclQNYFkV4mGXrX6R/0kYx+85kBdRaZp8jsU/Pf
         uMtNiqMe9clCUR3YcVLvTr72sfYhdSdEmrCMP0s3ENm7UfZZT1QqYeqeV62qKSeWRO8W
         nhrA==
X-Gm-Message-State: AC+VfDxqjzWROuMjboC0LPlyghQVD2lsh8Ohx9i5SE6l1IT3EI3zJoN1
	1L28v5GmljuR2XdggOPx22w8hzMS9AUVlIUN1Z8=
X-Google-Smtp-Source: ACHHUZ67K7ruNtOmx+p5Yyp3ku73/+p12eRCjGH/ynPo822/a97s/qq6d6w1kbYu5421RjW8FxPwmQ==
X-Received: by 2002:a05:6a00:1396:b0:662:b5de:27ea with SMTP id t22-20020a056a00139600b00662b5de27eamr961504pfg.11.1686191777816;
        Wed, 07 Jun 2023 19:36:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b00649ac17779csm19478pff.160.2023.06.07.19.36.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:36:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] xserver-xorg: Security fix CVE-2023-0494 and CVE-2023-1393
Date: Wed,  7 Jun 2023 16:35:56 -1000
Message-Id: <0a29894da0b41f8494f72ded25916887b4a5c729.1686191643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686191643.git.steve@sakoman.com>
References: <cover.1686191643.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182485

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/0ba6d8c37071131a49790243cdac55392ecf71ec
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/26ef545b3502f61ca722a7a3373507e88ef64110]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2023-0494.patch          | 38 +++++++++++++++
 .../xserver-xorg/CVE-2023-1393.patch          | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-0494.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-1393.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-0494.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-0494.patch
new file mode 100644
index 0000000000..ef2ee5d55e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-0494.patch
@@ -0,0 +1,38 @@
+From 0ba6d8c37071131a49790243cdac55392ecf71ec Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 25 Jan 2023 11:41:40 +1000
+Subject: [PATCH] Xi: fix potential use-after-free in DeepCopyPointerClasses
+
+CVE-2023-0494, ZDI-CAN-19596
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0ba6d8c37071131a49790243cdac55392ecf71ec]
+CVE: CVE-2023-0494
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/exevents.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/exevents.c b/Xi/exevents.c
+index 217baa9561..dcd4efb3bc 100644
+--- a/Xi/exevents.c
++++ b/Xi/exevents.c
+@@ -619,8 +619,10 @@ DeepCopyPointerClasses(DeviceIntPtr from, DeviceIntPtr to)
+             memcpy(to->button->xkb_acts, from->button->xkb_acts,
+                    sizeof(XkbAction));
+         }
+-        else
++        else {
+             free(to->button->xkb_acts);
++            to->button->xkb_acts = NULL;
++        }
+ 
+         memcpy(to->button->labels, from->button->labels,
+                from->button->numButtons * sizeof(Atom));
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-1393.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-1393.patch
new file mode 100644
index 0000000000..51d0e0cab6
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-1393.patch
@@ -0,0 +1,46 @@
+From 26ef545b3502f61ca722a7a3373507e88ef64110 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 13 Mar 2023 11:08:47 +0100
+Subject: [PATCH] composite: Fix use-after-free of the COW
+
+ZDI-CAN-19866/CVE-2023-1393
+
+If a client explicitly destroys the compositor overlay window (aka COW),
+we would leave a dangling pointer to that window in the CompScreen
+structure, which will trigger a use-after-free later.
+
+Make sure to clear the CompScreen pointer to the COW when the latter gets
+destroyed explicitly by the client.
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/26ef545b3502f61ca722a7a3373507e88ef64110]
+CVE: CVE-2023-1393
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ composite/compwindow.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/composite/compwindow.c b/composite/compwindow.c
+index 4e2494b86b..b30da589e9 100644
+--- a/composite/compwindow.c
++++ b/composite/compwindow.c
+@@ -620,6 +620,11 @@ compDestroyWindow(WindowPtr pWin)
+     ret = (*pScreen->DestroyWindow) (pWin);
+     cs->DestroyWindow = pScreen->DestroyWindow;
+     pScreen->DestroyWindow = compDestroyWindow;
++
++    /* Did we just destroy the overlay window? */
++    if (pWin == cs->pOverlayWin)
++        cs->pOverlayWin = NULL;
++
+ /*    compCheckTree (pWin->drawable.pScreen); can't check -- tree isn't good*/
+     return ret;
+ }
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index ab18a87a3d..5c604fa86e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -14,6 +14,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2022-46342.patch \
            file://CVE-2022-46343.patch \
            file://CVE-2022-46344.patch \
+           file://CVE-2023-0494.patch \
+           file://CVE-2023-1393.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.34.1


