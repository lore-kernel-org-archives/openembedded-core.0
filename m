Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47E4C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 12:01:19 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.13746.1738238475305922961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 04:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lHDGp87M;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38634c35129so574975f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 04:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738238473; x=1738843273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6HwV0AbDuHTzkoACPqJmgjypfb6rbPD0WNV5jmryrxY=;
        b=lHDGp87MRz3tzP8Z4W1GKFXtwGGXRaqYvU87nag3GAPTL9XAPXLL1zqDYtKSrFT9vf
         ntjrs7S3oC/0B/yUFpIJVIec2djTVf+E09YdMUUyqbzdlEeWpz4atq6Bq+tZ9qJpKOI+
         Nf4LpCOZMM2FIby93svu7LoEdfRvVEZw2Z+HcgRQgGSh+WV8X85DcgpTYBKOlPVJ515L
         3YhNh35awQkQOYZTwGlZP3orRPFpBzQswZez1SiK401p2JykAudF1Z241j0ikrUwreal
         +eyZUCXmWoyulVnlXcy0b6SSkb/qFBzIjfpUSVpROwjmLua5ZqC9tXdKbZYBtAXFZrGv
         WHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738238473; x=1738843273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HwV0AbDuHTzkoACPqJmgjypfb6rbPD0WNV5jmryrxY=;
        b=MnaEkzu4CmQ7B3hyIf/OWmnCpLS9ZMMVcYyXTobjXR8laeugtgerMxxwTUzLP3p5Ju
         uaJTZfYygac0gH3JIn6MaDxewS7nMoKzE2RBL5LhUhSN4ucqKrBsSuHC5LvPqyEjcAMd
         qYg9ls9w/dfNrHBS5A9W7Sje5ishZ9I7boL5D2A/SVMHOVEQrsiDk/IO3wXSKog799uu
         EXcxVSefGWTZW195M4leTHeh0tUxZmwjdFDNoLBEMvrIzc7hadN1w5q80ncTY8M9KpET
         mE885hlMqoQ3GiL3fKuD3RIqPUax7rypY3GNnWmeO8CcVA6ixSVqDgylajm4y4RpgpY2
         cCYw==
X-Gm-Message-State: AOJu0YwLWfHOdZ04Fsw33n1bX81BsEzW56dJARu7bh4qSNpUC4ClhSqT
	kIwXWz+sSrRJEXQFy6pB1385SSAR72dZQWtggwmzKVqXs3cAHbMi6OP/zbN+
X-Gm-Gg: ASbGncueYkHce3eFyTH6OvUvYFXPKMpnbEqNsV3JfZeI0Rp/xBslH+w69iacSZK+9e2
	IsmETpOH+eV2I9up54XZdpZAtknv6RBLuu4jWNjIqdcnRcs5GzZ9O813zzcIYqb/aZwepiUGZIq
	PxKzblchT7tR8zmLOhf0ZQCT2DJNAiEdNKTSr8MwEBkKUacrfRo9NP+fUoVq1qW9E8M6RWr4xmX
	AQCdJzlCIXwmXp8v8+zKQmJdJpnqImQ5118NCs7xJ3r45qYZdUfac2cJO1UhH6LHk5TES28S/yd
	uoz69HMk88U+ztbulKLuwL9L0Qq5KAvlgkL87bjlV779j69xunEBBFMPl5M=
X-Google-Smtp-Source: AGHT+IFOP7xIpcsmwKEvt7oIvLQdto8kZ5ujVwKCAHwraU7EOkvqFTk4TJXjdRntZxbilgQHipAjvA==
X-Received: by 2002:a5d:59a4:0:b0:386:1cd3:8a07 with SMTP id ffacd0b85a97d-38c5194db0amr5402093f8f.7.1738238471251;
        Thu, 30 Jan 2025 04:01:11 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec34esm1810063f8f.14.2025.01.30.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 04:01:10 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] linux-firmware: Add RTL8723DS blobs into ${PN}-rtl8723
Date: Thu, 30 Jan 2025 12:00:39 +0000
Message-Id: <20250130120038.916935-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210440

The Realtek 8723DS blobs are under rtw88, add those into the rtl8723
package.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index f0b710a6cc6a..8d1ebf1fbc75 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -1238,6 +1238,7 @@ FILES:${PN}-rtl8192su = " \
 "
 FILES:${PN}-rtl8723 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
-- 
2.25.1


