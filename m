Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E202CC77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:44 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.30329.1683300036729928318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fpmOfEBZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64384c6797eso1649830b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300036; x=1685892036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYDUdCebUJwftCDaU2Vyq5hMVqNdbUPBIagJnSnMw5o=;
        b=fpmOfEBZnvIZSJPmR7TylZ7vYsfSNtdEshm6nTH5SOQF7A7bMmp6yXSKaEtFCUYfYp
         6zfvNxs5CEKO3CIWn6/spoK3JISd7LsbcAG9L/Gg8XZgt/eBrB5SiPDQX2mscyoFZuFF
         lGvN9liGgu5zzgzoqUIoQpKeucncluiT39HYrtVz3wUt2DBBdMiDZJNwN5eOG13j26Xr
         ZUTbAkV46/+GRsgeCMwHhumQ8vNB7GDI9naxiejFrIdEv8na00u5ceLkcXA60e7eJA20
         j6rh8vyHxdw16erM8hSVXo7Kc96WR38yADmrDMMgO225XrPcuhe7Sz5KV0boavJq6CTo
         R6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300036; x=1685892036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYDUdCebUJwftCDaU2Vyq5hMVqNdbUPBIagJnSnMw5o=;
        b=entiEeIz0gHwMAaImWZ559g+pvTKKjN6DzBdm0vBlKX0DH5INIQfFMMXDD/cFiHoQQ
         qQobfD3ryItKxbTjAPYdZqMHLJ1RNjvXIzwykwiTg+Oe3YxDRygRVcwCQSiSWb19s+Xa
         k0C5Cm/+STcHQF+NmHC5PiAipBBExj0Idf4JBP+9dIGbB/TO3p38AosWucHodd5CnPz0
         GM1sCGULKe174iaWmakRHvv5CFl0lV8hjYLo8Zf0aukTIBTnNySbQYX01QT4jh1SknCG
         pq9MA1q1eoeRzeHqvd665/HuhJAN4Lk+c04lCK9xh7tN1IgcxVXUGxYmoYf8iiuy1A4r
         enaw==
X-Gm-Message-State: AC+VfDyjyL4AHBrVY9U+HVvuwcMEEiwAudvhrNypeoknL2lsiV6slrd/
	PJQ9ASP1d8ik4KEGLxKuqk26jpBjjmQQL7jcU5g=
X-Google-Smtp-Source: ACHHUZ7uiQwGoeId2fdLR13N6/5is70w8/IkvD6CSAVEbV/g4Eg0c97bfuKvHHcr4FcvBqTF1V36OQ==
X-Received: by 2002:a05:6a00:23c3:b0:643:64fb:3b6a with SMTP id g3-20020a056a0023c300b0064364fb3b6amr2825894pfc.13.1683300035662;
        Fri, 05 May 2023 08:20:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/35] Revert "xserver-xorg: backport fix for CVE-2023-1393"
Date: Fri,  5 May 2023 05:19:30 -1000
Message-Id: <9bb0a416d03c3bcd3cf45fa7aa761ff948612eac.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180939

Fixed with subsequent version bump

This reverts commit 7828f7026b4cd3ae97ebe5d849c09fabbc17272d.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...posite-Fix-use-after-free-of-the-COW.patch | 46 -------------------
 .../xorg-xserver/xserver-xorg_21.1.7.bb       |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
deleted file mode 100644
index fc426daba5..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 26ef545b3502f61ca722a7a3373507e88ef64110 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Mon, 13 Mar 2023 11:08:47 +0100
-Subject: [PATCH] composite: Fix use-after-free of the COW
-
-ZDI-CAN-19866/CVE-2023-1393
-
-If a client explicitly destroys the compositor overlay window (aka COW),
-we would leave a dangling pointer to that window in the CompScreen
-structure, which will trigger a use-after-free later.
-
-Make sure to clear the CompScreen pointer to the COW when the latter gets
-destroyed explicitly by the client.
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-
-CVE: CVE-2023-1393
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- composite/compwindow.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/composite/compwindow.c b/composite/compwindow.c
-index 4e2494b86..b30da589e 100644
---- a/composite/compwindow.c
-+++ b/composite/compwindow.c
-@@ -620,6 +620,11 @@ compDestroyWindow(WindowPtr pWin)
-     ret = (*pScreen->DestroyWindow) (pWin);
-     cs->DestroyWindow = pScreen->DestroyWindow;
-     pScreen->DestroyWindow = compDestroyWindow;
-+
-+    /* Did we just destroy the overlay window? */
-+    if (pWin == cs->pOverlayWin)
-+        cs->pOverlayWin = NULL;
-+
- /*    compCheckTree (pWin->drawable.pScreen); can't check -- tree isn't good*/
-     return ret;
- }
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
index f0771cc86e..212c7d39c2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
@@ -1,8 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-            file://0001-composite-Fix-use-after-free-of-the-COW.patch \
+           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
 SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
 
-- 
2.34.1


