Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C438C77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.51575.1682788858041398188
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RFBMi+jm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-24dd508237bso443523a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788857; x=1685380857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5Xg9IGUav94zD1FslEFFsHEuaSnR9pf9EXPeMGpP54=;
        b=RFBMi+jmL3NbBSGSwdixVgBnOXk7FWQfvF3q8gF3lO+fK7caNTOLRp4zGrMUw8sqNZ
         ZHeuoUo0OyH4ObJBDg/p4sT9J7vXibTgrCTmDCDIIDFQFjmPpWCW8ibgd4JRg6xVrECv
         202mqwFfUY4CbdgQmmK41bHX7vxCEhNLpuasfzCI7C7VSDaQ0nBZLwi9UGFa7Ih16zzP
         X9IpAqOJElld9W5UQJctKzfPmOwSkDXegO358Qed31FNkoLGunYINwhuHLcvwmIIkDqB
         CMHbpGlE8r0G/ytOa0S3WT1AWdgL5lVb4oVrRtJPPRCJKAmKITd9zWx88eEeoRCRHd0N
         gihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788857; x=1685380857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5Xg9IGUav94zD1FslEFFsHEuaSnR9pf9EXPeMGpP54=;
        b=cqADBOQ++J6+0NFTp4SwP2l2PYR9AsQmZFsyNpI57gr9JFV0eC2HPv4pNYR9aNK0UI
         9zP4HMlfvMuq+nP7EpVNAhyEbMFN+VWWR1cFsuqkTWAloBfLBfPc1diNtE6ajIE2Hc3s
         7iK0+oWRFD1Xn1kjz4napTzOIXJ0NLKDvMJmPD7P6pyVmTIR7dEdbQn1Dn5wBuefkGcv
         VufIlKFxYigY8tWMx3H93ogq6hfOXXGVGJ+MeuH8xtVh+enaAiUK18D8bCNsuC6/2hGN
         rIZgggjfAhBh3qOLEKg+YkG6LMjP1sXP5Fvz8QinxDID2mAXjJiEyMq+shNn8PFlmSud
         CHGg==
X-Gm-Message-State: AC+VfDyMrIaI5HM5WohxkXWs381/AzR4NF+/4IicGS4AbYn3+RJmLIPP
	NhmQXccJNLGkwZcVdNp0EA+17aUFoeYNv3PEFIA=
X-Google-Smtp-Source: ACHHUZ7bsymqCUS6hX0fEA8KGMfjiVtjTZHzoTu838TILkRhGLCFkR/cRTjHT4nB4zWC+ADxez+jyA==
X-Received: by 2002:a17:902:7489:b0:1a6:8f8c:fa1a with SMTP id h9-20020a170902748900b001a68f8cfa1amr8579166pll.16.1682788857118;
        Sat, 29 Apr 2023 10:20:57 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.20.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:20:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] xserver-xorg: backport fix for CVE-2023-1393
Date: Sat, 29 Apr 2023 07:20:23 -1000
Message-Id: <dc2c777cab0230fc54e078d20d872aaa9287a8b9.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180546

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


