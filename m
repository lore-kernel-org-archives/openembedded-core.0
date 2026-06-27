Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF51C44501
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 07:55:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51397.1782546939268413372
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 00:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VYx/w0yL;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49222fb062bso18630485e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782546937; x=1783151737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdL+Iy6NlfcrCo0JXX/tEiApTnX2e3Z/MdAecqdi5ZY=;
        b=VYx/w0yLSFwmH2639ePrpUtS22doqWYCe/VDlbRp8AYIYiucxgQVIRBEGCnrMkss6p
         5dHk5a+zUS44SlruKsVJOCCCeRDYYJOwei3y7XcLezK0yvk6hozaOjUP/jXUtEd+RAty
         CLBzZtjCQcwRM24lWNGPJq/Stbx9uuc6qowLFYjMUsKpVVe6C1gdlL8/BOp34hLUPJV+
         SDsAglZSYps9E/KTU420MhL7hbw8L5z/Fm/v3wt5HH8Fb/EMEaINFgaGLmFHTyxNHAX9
         1zttqaYO3AK5cQExyqhLR4XMHs+6Xn/cncqLLkYOwK8qba5a4hsTT0w8NY0YuTNAIKDc
         gAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782546937; x=1783151737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdL+Iy6NlfcrCo0JXX/tEiApTnX2e3Z/MdAecqdi5ZY=;
        b=eDnVaLD3BjJfkTNUrMJKkVkRnHxAfc0HnPMwa0aXMO2+msKJ2sPsepyQhdUsQg8I5W
         JJbcDvmnh8ouOZBmrdTCVOymNK+nEH6+MhLqBZUwq+ljornbdECZkFHp1u2/wlIldi2g
         rYwsjJmD7eOuJD923bsDDSlevWKBEljOeOt9LJOdV75y/7cwowVg7HnLywIyPRUY87Pa
         vNElarA6u8Fyz4P78FCkccDXklxd+IbXyJvSp2Fkh6rFm06gK0Jyk01G7WTzy+MMk40M
         cPodIrc9zNO9hGRYvsDO6rRaHblKZRtQHNBGxIKM+4t6LdUo1MjwAePrvJH4u+GpNPj3
         CycA==
X-Gm-Message-State: AOJu0YzD2bm/RANgazUoROTCA6Zqqham3IfrQeWhGqD4rFPPltko7Xh4
	g4CY4kNe5yLOuTJIqpjUn6GmQL9wuu1qz0FY7Yo8ms87uW+RYybUtb76bdt4hL59ntc=
X-Gm-Gg: AfdE7cnEAvm0lfAIV0lEJv0d+oE62Yf2lYhvRHB5BucM5au21xn1Up8OcAeKjJxt3WH
	b/IKxv4N/5P57O0ngvB7KMh8Ct1sY+YCCC5oCvYwyEj9UamUooHr3uqwcdQgLwEgMIGRndOU+5c
	uwpG6gN3auIfcdxjg1uq/Fua573j61zhvqqSAXGgy6SSLHiENObNVCesYTrSxG2cO/oyPt9zISk
	m/tO7TXh3GQ5gbC8mBNW4tBE4MvYxgDr7LMznDxon2jSig51Y24z1XrAtKN+pAL1r6z5NQ5t609
	0YK9kLs3XxGvWAJKehE3JkB1BlPzvkSWowPgQyLIiTKOf6NgOQS16jLwDZaRiz/V0idgmcyHJov
	PLOlMRAa8pO/RhrRxCcsK7CQHs4/bsocmXK6m4dAF71TVakSzJVfheWObq6SYxWwofw3jTAEpir
	qWNJzJUAOxLEWB01t7Px6s4RWzp2/vgauVWamnIFwemqtdNDE+
X-Received: by 2002:a05:600c:1d18:b0:490:b65f:8b1 with SMTP id 5b1f17b1804b1-492668553cfmr144806615e9.5.1782546936957;
        Sat, 27 Jun 2026 00:55:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f4ffc11d9sm11421952f8f.37.2026.06.27.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:55:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/8] pkgconf: exclude pre-releases from version checks
Date: Sat, 27 Jun 2026 09:55:23 +0200
Message-ID: <20260627075532.3153679-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 07:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239685

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
index 277ef9786c..7d9205e560 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://pkg-config-esdk.in \
 "
 SRC_URI[sha256sum] = "cd05c9589b9f86ecf044c10a2269822bc9eb001eced2582cfffd658b0a50c243"
+UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
 
-- 
2.47.3


