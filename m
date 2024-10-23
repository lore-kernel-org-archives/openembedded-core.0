Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC6FCDDE79
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:09:40 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.7360.1729685374370861581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PrA/jhu7;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso74724901fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729685372; x=1730290172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=PrA/jhu7eJDDAY6hRCvXLxEGMYrdXaCuTMgqEuZT6gSp7IZAwJmi17Hp8ZqA6wcnJV
         z9vjzastOcfJ9Q88CYGl5IfrK5PAfAL5o+PgBhoz49N9MHH21Fe54Gb36x4NxaOF0lIa
         rw2W2ysX0WacbZaCHdh0NSokgewBn/zRl9OkAIsE3k/ULiTQydS20ITQVjApVLuSR1h7
         1ZjbyvDr3222ygbQbqL5aJX2scMDexKygaXuBOVuxpAj8RnxCwINWul64SOryoJuisbq
         kuxGc+TeeMQp+0HyZN0ZlyqbmdQJ9OUfsCxbT4eIbVQ1UQbCi8t2T1AXdHVpioEmSUGZ
         mkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685372; x=1730290172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=U+YIBdR6oC4ZD5X4O/lcW/8CiAyXu0A3cNcP5oVEx1Zc2AJKrLmne+B9kPTC+5LSTu
         UGaimil36z/D+Y4nEj9OIjdbLIKluVsKyrJlkhuK09goFEO9S0RFgrbIZ69OHt+xgHPR
         I9YQuLGtNXLNPNYnjLfIr+Vm5J0HYCjc/Y+cYkLrpRzVIKFbudSsDvOlmctcAlii3g9g
         CPb7jYQybk6oy8ymoTb3+N0mrIrjM3OqlnX7i9SI0wXpA3hJBaEGna4n1Ja/Nl9m9EqT
         Byj24plndPKrPjFM4J/GVampO197TBQAPUBvmDx3bPb6x5fm0axjcNcLXyljoFYa2XXM
         sopA==
X-Gm-Message-State: AOJu0YwhjK4BRqYBZBwX3HYFl0b1d5FD+YFntpAKseFdkVkdfwynLyds
	NE7hNGYJtZ4AFUQ8V+JRJEzkbR2rMhSsNOiP23VecMQAytRRADux/foUaSoFXjJElRFBEbOl/ht
	/O9U=
X-Google-Smtp-Source: AGHT+IHI1gvl6HZL76XR0hx/hOnrf5qRb8FHRLksodOE0f7zwYg/Wp+UMMKayy4Nml4myoea8cRNGg==
X-Received: by 2002:a05:651c:b21:b0:2fb:403c:268b with SMTP id 38308e7fff4ca-2fc9d5fe0cemr10309641fa.34.1729685372376;
        Wed, 23 Oct 2024 05:09:32 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae25d87sm10763801fa.139.2024.10.23.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:09:30 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v10 6/9] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Wed, 23 Oct 2024 15:08:36 +0300
Message-ID: <20241023120839.437771-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206207

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


