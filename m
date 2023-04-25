Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9146BC77B71
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:08 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.80354.1682431078941388282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YOK3Ypeg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b5c4c769aso7619403b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431078; x=1685023078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5Xg9IGUav94zD1FslEFFsHEuaSnR9pf9EXPeMGpP54=;
        b=YOK3YpegaUkbGE6RqCorVAoknMUCb39E5K4jUfJ7jS/bRFo13s5936cSWRgRISS3lw
         kZhGdU81lodIS1nSo55Br3MOBxd14msSj+RpBbT96S9RtJ/0N8Mp/P12lWRFP3pQUon+
         Mwpx4BoLQ/cZlwSPQBUysJveedezzEz8FeuoU9EZQcqlih3DbVi0Wb4DwzQJ5UyqlaUs
         D+a6PQ5oMlKxK3Up1uThoifcNhj9tVS21sHz5JP2g96ZJMSzc5j7Z1DI9hQz1gcP5NHP
         GVSC9q7rsMV7rDobsJ79zGEeQ/Jl1DE/p8Du5qr7rdtljP72oJd8pkx6Jpmx6HdI6hx6
         JoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431078; x=1685023078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5Xg9IGUav94zD1FslEFFsHEuaSnR9pf9EXPeMGpP54=;
        b=E7WQrULP0GqTd57yC7TqGk5L4ORgu8XlYMItFo2mZcnQP/CGgbRsk+O2f5zdVmr4ot
         oz0YN37Z2Oa0RNWIvTGzfFXWulK5tZnZW0sYBx3mTYnxkNGHNPKCd1Ij8m+ltvBDqvTT
         m/MwWFb0jZvf0laxL3BmOoQAzzddh8SdU5RONt/vaB3zmLWUMqt6xdQKbb39TVeUW5sR
         U/mQ13pBvz4f89hDArXinjqTPP2HxZ7TGt8FD7WzV+SOsz+thCWMap/0+bt0qBAZg1MO
         WJKkPyLdOImhq1sLe/DGNesAs4saiRn/xB9KqmDvxq0dzSmiHg4JAIrKk252I+I9ZVdw
         UeHA==
X-Gm-Message-State: AAQBX9cJqhn5gJH0fzO5BSwkJOlSQY92XhC6TC18H8hU3bx8nGM3ZQoU
	ZwWljnohExca9LO6Noqakry0paYftgxqObOjX7w=
X-Google-Smtp-Source: AKy350bAEZ6So2NyGR2OB/SSUMVVA+WdaNDDhnb/YIDlWUkoQv/zEDuwjNqlPEdKzpxukJdakER3/g==
X-Received: by 2002:a05:6a00:aca:b0:63d:254a:3900 with SMTP id c10-20020a056a000aca00b0063d254a3900mr21593329pfl.5.1682431077789;
        Tue, 25 Apr 2023 06:57:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.57.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:57:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/10] xserver-xorg: backport fix for CVE-2023-1393
Date: Tue, 25 Apr 2023 03:57:33 -1000
Message-Id: <e4670a8bf33243326b75e79f3d739c869d329659.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180377

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7828f7026b4cd3ae97ebe5d849c09fabbc17272d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...posite-Fix-use-after-free-of-the-COW.patch | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.7.bb       |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
new file mode 100644
index 0000000000..fc426daba5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
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
+CVE: CVE-2023-1393
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ composite/compwindow.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/composite/compwindow.c b/composite/compwindow.c
+index 4e2494b86..b30da589e 100644
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
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
index 212c7d39c2..f0771cc86e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
@@ -1,7 +1,8 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            file://0001-composite-Fix-use-after-free-of-the-COW.patch \
            "
 SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
 
-- 
2.34.1


