Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FD6CAC593
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.41399.1757580696475566019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QIenznJb;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45de287cc11so8812645e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580695; x=1758185495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKTargJJzNLOd+JkcVIHbiw57ZwweYjpLuKVmZHQTSA=;
        b=QIenznJblPMTnueEthJVdHtaSfVMtcQ4eQJ9OBoLNlNQ6ANi2BSbx5zZvGsaMRZyrd
         pjHiKdqvCe5m2aRAZI8ro6an+3D7fiXU5YD7QWGnJx4+qIWJUNdewiegur30Hgz//TH/
         MOXPmwVomT3aPU9PF8d+8+F0txKhu8mmUPG5GmYpbciRIDJ4UhJSpHav3QnNrMjSswrO
         FYs2C9oaoPVGg4hD2je5jrYW5TdSBA6MNbjs42jnWRNNj+OdOaJ3jUKNVwUJbgtMKEv1
         bFS5cTs/ycH2VoBNItr+hHSTOdD7uw7cg6YAMx4IuCK3FucXtJZqXjz1m2u2S7/AS8iq
         dIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580695; x=1758185495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKTargJJzNLOd+JkcVIHbiw57ZwweYjpLuKVmZHQTSA=;
        b=urxYoVzJ7acZ5yYmCc/gEhDtKuuB+Xovumplr6YDXOplCwW0Ba2M1oL6Ikye/QS4Y6
         cMvbayUJoyOqahQ4qEe4WGCUTEYimiS+P2g1cFVguOyVD78pzOsVdNBjvyv09mQtJ6UW
         Eh7ZSs2wWX2HW2zyrNbFDasa/wB+1fFLfx0d+FDOHOtdHsmVRQ6SyzRNgYBreDYTRvxh
         H7o5rfIKR9a6IBL2ILRG1ewjZ4wTm+xOY7cD7UHDA4AsSyAMM6drm8Qkhlkr3m4Iocgd
         YT1EPB3VqAhxyCtUhnd/qz26Htn986l9pLKjkvh72Q1qshEhyopdkTt37p5MGv1QmiFw
         8PuA==
X-Gm-Message-State: AOJu0Yx90mJiE4+UZM9Xwel4xU1O5bhphnvhaobXzW+ExhSNauq/si69
	elGO/91gayw/R4HzBv7xlVW/nrs58UaARQ9zVJoWdDtgkz7r7MidhMDgA613PQ==
X-Gm-Gg: ASbGncvWgZFVwgX8XC/9P6W9yEpPEUJ4NGTEmzmDVig6p50HPfeTqkzaMyah05EI1nB
	MKAmixlwii7FwGEkjoDivT4jnbLE5PXJylrvBZfSzY7vBzx/Ah/epaa/iXX85rQ2cKDdh/uZLtd
	Cap7PLjEl/AaK56hMYrWOnjhT4+kJ4i1JTT2sgUUk2d7lSwexUGKMw2+zY8I/yUjDLuwXew+J/d
	0vKj/4gp7qp7ZE1m9JWLCo9DHXWYBcR/by7TiJ4N3Fv7bKTTiw8eu4h2BReGREC+rVPpmOb7Mqs
	71tykda7wKDmrtsSProrW4ZnjwdKshGDUshKchcrRq8KnxT4aqu1UPLuU2FK7MpYApg5qlexsmE
	NLQkTJ6sJRUq/XPz13GMYW5EfTGTXOA8Qu/ebLPOpKfdksF88rGS8+l+P5RoyzrdZ/GypchA+9v
	1l2EO2HidyxaV1SAlu4Oug4r3IVI9LzkEktWIJzjWSuhrvy/pL/hkz0EkF9g==
X-Google-Smtp-Source: AGHT+IECsBPavQSXd2CvUx2vzVyNbJPIkVe21EBIdDul5DDIiKlv1dJjKZfzvoTwFkiryh6EzFf/cg==
X-Received: by 2002:a05:600c:49a2:b0:45b:92a6:63e3 with SMTP id 5b1f17b1804b1-45dfd5e3d5bmr16517685e9.9.1757580694553;
        Thu, 11 Sep 2025 01:51:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/16] ovmf-shell-image: move .wks file to its own directory
Date: Thu, 11 Sep 2025 10:51:09 +0200
Message-Id: <20250911085123.1551425-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223249

From: Alexander Kanavin <alex@linutronix.de>

If it's in ovmf/, devtool thinks it belongs to the ovmf recipe
and then deletes the file as it is not referred to by that recipe
anywhere.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ovmf/ovmf-shell-image.bb                      | 2 +-
 .../ovmf/{ovmf => ovmf-shell-image}/ovmf-shell-image.wks        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ovmf/{ovmf => ovmf-shell-image}/ovmf-shell-image.wks (100%)

diff --git a/meta/recipes-core/ovmf/ovmf-shell-image.bb b/meta/recipes-core/ovmf/ovmf-shell-image.bb
index 5aafba97e05..bc068e6e255 100644
--- a/meta/recipes-core/ovmf/ovmf-shell-image.bb
+++ b/meta/recipes-core/ovmf/ovmf-shell-image.bb
@@ -6,7 +6,7 @@ COMPATIBLE_HOST:class-target = '(i.86|x86_64).*'
 # boot loader and no rootfs partition, not additional
 # tools are needed for this .wks file.
 IMAGE_FSTYPES:forcevariable = 'wic'
-WKS_FILE = "ovmf/ovmf-shell-image.wks"
+WKS_FILE = "ovmf-shell-image/ovmf-shell-image.wks"
 WKS_FILE_DEPENDS = ""
 
 inherit image
diff --git a/meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks b/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks
similarity index 100%
rename from meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks
rename to meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks
-- 
2.39.5


