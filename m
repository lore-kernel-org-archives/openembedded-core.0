Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.4797.1631830774154780016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 15:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=HYGjbH6t;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id a12so5235725qvz.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pdWGQgdG4ki+zm1DQm/o+8hoN601C8/lBOp1ETnARJ4=;
        b=HYGjbH6tNMGFn7pGc22cCO0MnmBoyfwtFcM8P8zHWKLB7IZHC48wrFlT+Ib43Ykhz7
         N8cBGuwJePY2lESShgz4NwYzZqN7Tiqux1PH6usFoeuc1A0Syeq9LoXGQU26+zYSjbEU
         AlPO81JqkxsBdmAR0QW2nleO1eOZSanOAGLLlrwOSCpbU0V0OyG/fcWGIbS+yoifE01+
         ePNvlc1J3Cm/sEctOJg69fxxHO0ZcIBGEwUTefIIpEWlcBNr8GF/sNNUP8bq/t+Aj5RS
         Bd0cqwy+0ZyFSEPY/0YuCKjrgrvvgzuCpcrEB9PbIbxPQ0FFIJmeKvsCp2S2LoK2HZgX
         +68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pdWGQgdG4ki+zm1DQm/o+8hoN601C8/lBOp1ETnARJ4=;
        b=FVbaXkFxXi0hIT4U5wpVy/7jA/k3ttC3gENUXYDWHjBJAFUUlqyoy3wF7Hsf6N7VSV
         4omoqCUfaytXDuLXDczbfk677tAfBV/h4TfRR+niOk9q65beVbIkhEXMJj6XWCoN8/U2
         zYcash/C2ys4TAMEK3l9Ep98iJHUMjEin85TKrHCiy+GAqYhqt0c3XIJsX7tC1W0vX48
         wLm8HAQsYHVAV9Q8GHW1XdPvxY5/pNBFIFW3NbgW5FuLNPGiruDZLONMJO14uuSzwESF
         TEpNMzEUdKnzd0Pmsc3U/YbAgjCsNhVEqCHcE2PYghqmsFTKphwdYqz8fYCe78V9kA5i
         fXYg==
X-Gm-Message-State: AOAM533MNYbbkNVtajxqhu8dYPmikmGDupMX+r+LBUd67DAqx8DXLVrs
	QEv7Ye+0v+rM1LhouHft/LacBHYzSmkGWA==
X-Google-Smtp-Source: ABdhPJxXe3s1sE97B4MTFGKWpavMWXDGCh5RhNZLViEDFMgopPaNQ36dkZ+sjsq/DkxQwbEYtAT5Gw==
X-Received: by 2002:ad4:47ad:: with SMTP id a13mr7899676qvz.61.1631830773060;
        Thu, 16 Sep 2021 15:19:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a650:b700:b85d:4277:577e:3e0a])
        by smtp.gmail.com with ESMTPSA id q192sm3476006qka.93.2021.09.16.15.19.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:19:32 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-sato: Fix runqemu error for qemuarmv5
Date: Thu, 16 Sep 2021 18:19:32 -0400
Message-Id: <20210916221932.18084-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When attempting to execute runqemu on qemuarmv5, the following error is
encountered:

runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB

To work around this, limit the QB_MEM size for qemuarmv5, similar to
what is being done for qemumips.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-sato/images/core-image-sato.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 35d06677379a..e63a229d1257 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -13,4 +13,5 @@ TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
 
 QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
+QB_MEM:qemuarmv5 = "-m 256"
 QB_MEM:qemumips = "-m 256"
-- 
2.20.1

