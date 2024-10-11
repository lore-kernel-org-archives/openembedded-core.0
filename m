Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FBCCFD378
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:21:30 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.10046.1728649284124758677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ENEOsfoo;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398d171fa2so2577992e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728649282; x=1729254082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=ENEOsfoo63RjRTePxPpRp95KBzmrCOQifBuZfcgSDqgNIDB/YBNtAjnRsbOJqTLx/T
         3lWcsYNOkXGrERN3e9MAd6XqOpe3dvAk5oMeFMHL3DCdHj4MF+7MJ4KO4mAgyVGQ+Oj/
         NB7vAB12NpM7JwlSI9igkjv1cBlINad8SjqjNqzIJm6o4+Yqt/sIrM1gVt5kKdqmFOmO
         +MqzD+f4andxCzxMlTdinmnNUmxKnPYS3DOwOcIj8pWYX5LTItDTFuceQHW+nvbX3OfQ
         2t2UwGCVi/IjyZQOyMNLcaXgjzGAIaPq0hJpAkno7bGDui4HMqllXQqRXC6JVqP5xFwT
         NrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649282; x=1729254082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=dD7CrA0FkS+DGnzBLUDRujZAEsziN1AJzJtE8r6y7GNgBCjOH6rBW+TK7BvMyzRPVe
         Z4GA3wRDWuFZPH5Qqaeh+iaZN7LXcUhoySJTp8/H8HIzr7ObpP5Wevlt6LNG5KBD5SP8
         yYuMb0+kynvUYxIcLc7rEr5xRero01RdxngGTqduOGK8CCxCf0E8u9eZo8Xf5Io1Cp9U
         YJgVOC1LQbkPuzeBbrr+vs8fHqsLJnSZhUzH+fEit+XnDw4yREsUJr7I3+ZV/djQJtsJ
         sT/F4ZyZkk/QCwEuIet/By4ITsPjXBbdQyp9j3yZnhJKrAyPIPOWR0/xCbi1FRLvISZA
         OuiQ==
X-Gm-Message-State: AOJu0Yx3HBtKyI+x9L10AOKw0SVddN4liqjeneUWBT/3RbkOVIjliUMM
	37XVxTWFV06mq/HKBzat+jBC+54wNEoX6FRrqXVvcVmyNlwtarkSltpMsvWrgHutanHB/yWCgPF
	Fsd4=
X-Google-Smtp-Source: AGHT+IEQw/ixj3AGoCfirAiGsG0zBCSY7JLmY3H78mQZFU8AeuKfzuFwDH1bYZq7p09FHQjG0dQWsg==
X-Received: by 2002:a05:6512:3b24:b0:539:9717:7ea0 with SMTP id 2adb3069b0e04-539da58b296mr1573179e87.55.1728649282233;
        Fri, 11 Oct 2024 05:21:22 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8608sm591336e87.89.2024.10.11.05.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:21:20 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v8 6/8] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Fri, 11 Oct 2024 15:20:42 +0300
Message-ID: <20241011122044.12222-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011122044.12222-1-mikko.rapeli@linaro.org>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205691

The test is actually using grub-efi not systemd-boot so
remove it completely. systemd-boot will be tested via uki.py
tests.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index e6d6a91a22..fcfcdaf7e4 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -21,11 +21,11 @@ class GenericEFITest(OESelftestTestCase):
             cmd += " kvm"
 
         self.write_config("""
-EFI_PROVIDER = "systemd-boot"
+EFI_PROVIDER = "grub-efi"
 IMAGE_FSTYPES:pn-%s:append = " wic"
 MACHINE_FEATURES:append = " efi"
 WKS_FILE = "efi-bootdisk.wks.in"
-IMAGE_INSTALL:append = " grub-efi systemd-boot kernel-image-bzimage"
+IMAGE_INSTALL:append = " grub-efi kernel-image-bzimage"
 """
 % (image))
 
-- 
2.34.1


