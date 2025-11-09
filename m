Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FAECCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 15:46:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27025.1762703194794101373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 07:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQSGnNvZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47118259fd8so14892345e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762703193; x=1763307993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ScM4vRXwRSAkT4/gd3/GMCGIinb+UPIQupNQ8zVO2c=;
        b=UQSGnNvZHxpC5J821lxU608kX/CLmfDxVevJ4pTa/CYKgoFgVZdj+VBBeMsFCrsokr
         PaLRhSHwKwSxEAkl1GGMEKLxm4NqIQRLh03nVuJhtDiNSbbsziLAQ5N9+rnPOX5hvJ+R
         ElBdaLbr8+sl2Ix8xlbdApkHmAAZqQCBUqEQVibK2H7ezhq9+jimiO2QGVvI824mWxoP
         icNHmd0+hETFiYOw/MXAZnHbjQq4Q8f/jSb+j528Qfv2NI2YDlwEoOsQ/M73NgkbSSkJ
         PHHJQFF872U2MGokmmijVdOv+AWeThStNdF53BAFElHhspeloZF1dm3SODUVJb4KY439
         Eiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762703193; x=1763307993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ScM4vRXwRSAkT4/gd3/GMCGIinb+UPIQupNQ8zVO2c=;
        b=WDChPPzvsZuRiFc0UseusHKMjz1qC/nBefRiWiTsCUlv6vxvUghpTCPCxAKuYhFZvX
         zAcefhA+B84lOkSic5L3ee/f0rwrrADrtWJzDTpdvVkn92OiFgak9IqK4PIz93s2Ts6t
         7hxO07CmEkYUT/8Nd2beuPHA6SBU4fFvC8GwYoh6plObrD6zL0fOq71i0vPlpihVH941
         NqsssAEQToctSdTNJflo/KiAJN/ubKJY00htHHGoYF29Otn8zang5ZpN69uKZ8U0g7q9
         mzMb1cH3m8aOir9o3PwLJuXTFrMR/406MziOC9l/zToo+XbqFR5kNFnqoD9I7ZOFttLf
         yT2g==
X-Gm-Message-State: AOJu0YxOM8k3L6qjwE6STVdlVO5GyZglJA2bqcGm9mqHYT1mAUqmS9/s
	3rYj6OTQXH/parosoJrDPzxpVRiUaoNzqss84/eApr7pKdse3ePJ9YpGLIR9bSTF
X-Gm-Gg: ASbGncv3r8NrSZJM5x1qxSfjSpdYAyuy6oOeNGhSy20ElUfU17Zcm9J5/EQtHBiuyP5
	KMyRQcx3f5EdbKS81Cc50NvOhqvZnDun8g22DWPzdo6iXXHISsy8yCOLNG5395NH9sQgV+eFm56
	wblmQeLo1Kw1m/4RNoLxvKHv6BE1+PozBDXKypdhtYj/XUNAmBbcFxN/rQOTzELvwvHlPAauS2w
	6paBxAdjEmDRxucuT+M1JmPiNvV/8/rn3LD1K2MHKgyYBdKAgStucsLiyWzKMki4HQNNeshNSGH
	ZX+4CD3LcSDi1W66+/lzSBPXE6hAk4DLm2yb5ZEp2Lj2QqIAam1iW0DuyOSAJ1jwbrOVHhS82ze
	Q1uMZ2iHt3y59v3+13y3iVL7hDnlQqnL/NjIfnR9CjVw7qhYm8XnhS32nO2AEUG/XC1iQorEyEY
	Lk5IyjVEb5
X-Google-Smtp-Source: AGHT+IGJJMYQYjw1SXbW4neRnCghtox5N4Vzz4qi6aRw4r83LZnBMnZ+C03SJKGzrV+43JtdsTSu+Q==
X-Received: by 2002:a05:600c:1912:b0:477:79a0:51e with SMTP id 5b1f17b1804b1-47779a0061amr19713355e9.40.1762703193040;
        Sun, 09 Nov 2025 07:46:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777bbb8c59sm7062985e9.17.2025.11.09.07.46.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 07:46:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] xf86-video-intel: correct SRC_URI as freedesktop anongit is down
Date: Sun,  9 Nov 2025 16:46:31 +0100
Message-ID: <20251109154631.2464244-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 15:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226095

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: 04037a14e1431c4a51f5d51885974732a6108368)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9649bec517996558e01d668d2b59e68306a3a647)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 2e526bd799..0a42bd9975 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,7 +13,7 @@ SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git;protocol=https;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 

