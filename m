Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29062C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 06:03:10 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.3577.1685426588352929304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 23:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=UrM3U+Il;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d24136685so2747934b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 23:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685426587; x=1688018587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WZ4k+nE6uc7fFdpRh35EyESa1VdT/6MmZbBimBMjc8=;
        b=UrM3U+IlNaMN12nhsqfVFVMgxC4VpcJnETO/Re2LrFLDGf91+O0VLPg9a5nuHmLZBd
         nhITTkZZ4N7WgKZdoaTmMu6kNg08PkzTni7ToqaFQ2xnmKvyO91rz7Fe7F4zC1cnRSNf
         U9N9iijcGSGHF4LiKKkez9zIhCoLQVlgBS/lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685426587; x=1688018587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WZ4k+nE6uc7fFdpRh35EyESa1VdT/6MmZbBimBMjc8=;
        b=SLtjhge/Sc1NzIDmhCw6fRmqKzV5soYPvmxrPNqokNiXA91qaba0L9SrjWh5luonHR
         DHJvockLko75G80KiK3O/bzSLDW4HQ4yNz5TpV5XC+JzvxgDKk2KKI1Rrp54ylpeLiO1
         kDyhzNRxr455fHmoRNy/R7yZ6LTsck1t6LOoAorRTv0w9nRx4cuQGd2tNpPht0HgHjYF
         zDtt+ufP958++v+SHuyZwkyPiCMhsEn3xkIaX+0PjDzkPEexcSOXx3kOKAWOAgBTOV+I
         2SxD7ex+70ArNK7Bg/PQGTrSPIb8jofaQUnfTfZsbDPs7VbAHh1OoIYFcvXtjZsOdKiG
         HtzQ==
X-Gm-Message-State: AC+VfDyORiyuwkORhfny+p9zhSkVeMwQg1njymGe5RSKPxvmxPAnsrxg
	JCgIYVl93Q9caSOcAX2xmHfzeM63WSaFPVEjXznvSA==
X-Google-Smtp-Source: ACHHUZ664e43XGWBH2VX9MHDS+sMDpN9NmEXphBEd9FohfAUi6ZyqR02y9R5MHpH12lf84XyYGqWdA==
X-Received: by 2002:a05:6a00:1896:b0:64c:a099:8924 with SMTP id x22-20020a056a00189600b0064ca0998924mr1382753pfh.10.1685426587193;
        Mon, 29 May 2023 23:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:4e42:bd7c:be91:bb55:8b63:c6a1])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm847593pff.107.2023.05.29.23.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 23:03:06 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] xserver-xorg: Security fix CVE-2023-0494 and CVE-2023-1393
Date: Tue, 30 May 2023 11:32:48 +0530
Message-Id: <20230530060248.15423-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 06:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181898

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/0ba6d8c37071131a49790243cdac55392ecf71ec
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/26ef545b3502f61ca722a7a3373507e88ef64110]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


