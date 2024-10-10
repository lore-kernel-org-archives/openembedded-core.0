Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ABDCF07DC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:07:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.39206.1728551252564066170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=abwN/e3N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so7329405e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728551251; x=1729156051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gT8A5PePfqv6JZtY5blTRxZ2uxf5kd8ToOnnmo7Iz7I=;
        b=abwN/e3Nx98+x42FAKjWgTw5d7SRprToi7Q6Jfp1Zz/i/o1/ao5riDR49DntrfP8Pd
         R1P0i5BhfTxN3OxhrBk29tpcEN0D6HFEL9ilTLR680giv6jSUMVGxJRFUuV7GtheKZ2T
         el8qNAUAKte7s86CtUFSYFQLubxeRbYMBCP3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551251; x=1729156051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gT8A5PePfqv6JZtY5blTRxZ2uxf5kd8ToOnnmo7Iz7I=;
        b=kxxeL05mlGUsp6xAw7t4pQ2JwBJlZ9A7fROU8UiiPlydJg31UXWZKU3BabYEwoLuGv
         EyUY85Uw8bxSOJYp67RfTSctMoAh6UsuZaVw+jBHe3CRIxJH4nyu9xOwxGPicDc7yyfs
         1S0yDg6lf/pkNfsfdkVaAABkglWmsPEecjgt2iiRfqCqM+k0cbGu4Z4SJaeNlQSutpFv
         iUWTtj7SZ9uykRSQoKLUTc/t3FPromspbLs3vrjBUR8yrQ3SDY679PLOtHMDMnXYRjWH
         jQGi1wuDFuL7hz5zR3W1NrBSlpbj5Cu6PcZ9+XNjSj306bOwvKQfzRAIEajfB0PdILig
         G1tw==
X-Gm-Message-State: AOJu0YxsTJ9zqesflTRUNGvIw07QQ3112oTLJYVD7J1657vCehYfilqH
	F8Br4l20JxLaOBu0Iv+2S8RCyIF2yM5XJwuuH7/fPYyR/FKKTitSg83kVj/+3Kd1RmT6GRyIYtT
	s
X-Google-Smtp-Source: AGHT+IHZwo1wuuBE8UaA+rTqLKfIHGvUsIy9xjJOb0yE2izhDKqPhT8adt7A0oCfNLfmEKvxMsQiZQ==
X-Received: by 2002:a05:600c:3b21:b0:42f:512c:ac84 with SMTP id 5b1f17b1804b1-430d748ca66mr55485115e9.30.1728551250362;
        Thu, 10 Oct 2024 02:07:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf5181fsm42645815e9.25.2024.10.10.02.07.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:07:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] efi-bootdisk.wks: Increase overhead-factor to avoid test failures
Date: Thu, 10 Oct 2024 10:07:29 +0100
Message-ID: <20241010090729.518687-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205400

After commit d74bfb2d5c9e6247e4c0a3c2fdba0cc4a7585395:
"linux-yocto: Enable l2tp drivers when ptest featuee is on"
was merged, oe-selftest efibootpartition.GenericEFITest.test_boot_efi
breaks due to space issues.

Increase the disk space available to avoid this and allow functional
automated testing again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
index 2fd286ff982..5211972955a 100644
--- a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
+++ b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
@@ -1,3 +1,3 @@
 bootloader --ptable gpt
-part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.1
+part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.2
 part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/

