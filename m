Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724A2D5AE68
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2995.1765620067948879557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VldoGlzZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f1bc40b35so25227225ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620067; x=1766224867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9cq2KcotP8SVkNT2TAANE+oncCrASHk/hNpeNp9M/0=;
        b=VldoGlzZRB3FukFvmKZih7sL7LQNmGAbxFuKAGgesHozrc7f+rT3U2lwS+oJ/J478J
         7pSuV7XlHrN3Uo3ElVdY+DNcMjV1/dINz6Yfp4jIvIY0sdtFWTqY8/b37RnzZxNuyE3Y
         t3FhXOQ3mIkjPWQqni9X/BzbwzzU5PaWV8AcPGuI6cqtTP7rPQHp79d8ZuFc6WwWC8KN
         e5Ozy9wJU5I0Gokl95XwjqJHuQqxLhyvNBB0OeIuiNdRUI19+LZ/7178sMw3MKk2Tw/v
         U3lQC4BP+ZbkGJ2t8MBOx1h00f8jYyuz2psgXiVFik3PzctWdyMlrG+IazuhZIJ7+AwX
         uJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620067; x=1766224867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9cq2KcotP8SVkNT2TAANE+oncCrASHk/hNpeNp9M/0=;
        b=P0NfXyDV1R4P7/EKWozSKbZDaBfWAdBHAC4XbCexCruYRmtxvmHt+26rtBKybz8Ym0
         xe/76KAILJYoqta5Ynpf20SeiQy2OUzxudYdqDkwyOgVA60gLhngvDm4WiNfkoELq44y
         zGyamsY42pSuXEOcnAGMBKdJ7tyw6foilTqu1uLVA4G88U/Y1KYQtJffhJeWmYErnsG4
         Oh2g21FRNLn0for+Y57FnFCT1j0AQpk1PTFiUYtYhEXiEpkAQ+Swdft7eBOqE97Z7hfn
         qpi9HicmOY7OPCi7Oq47+Q1hl2IZM0xTkqHXLn4cB1hbvAujHRGSSTH3IFAbHTd6cg7M
         Bc7w==
X-Gm-Message-State: AOJu0YzCQuIitBMYHO/lCTbafi0ZsfPJNfT6qRzNRdHsvC3NN+o+iDoY
	oLhMxz/5ZVD55AHEGRqpmdknYDCuUhUbtNabWUACRuOBw6eSJyxzhxFSJAUFKwpr
X-Gm-Gg: AY/fxX7pI8iel8AZkcLgUI1sUBoIOXTgIPJ9w7lGJDlnoh0JbQOpilKIBbWyMVanvn/
	lstMELXJ5KxPMOx/vS1M04K8yARZicnujNIh3QhAqRhoqLO0jRTLkK1vzT7YSJTcI953qs4zf78
	NgHN9lrWBHzkftU1xXKIurpGXACqPqvsgT8xqe2wbD35qkeMc8AxiGhFG8ZHGmYK6YnZ0GoMNm6
	FZ64TG7eeQPzDs0OTYlZb630rsMCGqk46w0vMCVA/o4XpdN/31eP51zkE0SgQ59XbsAHCvxtk7i
	vNpgfKB10gRGQ254pGJGOM6LQMx9PAtkVaC9sFBIsvMrTqfD19/fvCZe+kOw04Hec99Zz5MSEDU
	XoMggBpC0uZze/jhn4mTdbBu9CDPxYAgDNggjjQ5hNEs8id3DTVsDL8nv/c9nAYKdJIemSWAHUu
	dPQZB/Z+frOCPKbp4eBSzW3Uzp
X-Google-Smtp-Source: AGHT+IHi4jZ5B5gsxEU7GG3lKBlCiFdJCipDQOOfoMGyhQDPJkk2SbLvAG4eZjurP2szSLcnKODmGw==
X-Received: by 2002:a17:903:2cd:b0:24b:270e:56c7 with SMTP id d9443c01a7336-29f23ae3de8mr45410895ad.7.1765620067124;
        Sat, 13 Dec 2025 02:01:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 32/67] gstreamer1.0-python: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:56 +0530
Message-ID: <20251213095931.2571498-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227650

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8a5ea8bc63b33408642600886936c79a96bd898a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...reamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
index 12340245e8..9a3a86fcbb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "86e2fe2b1bba7ffc18b1d4abe1035fe1c33b20fe4e077cce2f90dbfa445b2341"
+SRC_URI[sha256sum] = "7a544b7968b181c2965e979f2ce889db36397790de9a7c312cf468b51d26428c"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"

