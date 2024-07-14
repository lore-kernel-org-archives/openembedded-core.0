Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EF6C3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.15294.1720960782798032709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n4+bOMFi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fa9ecfb321so21713845ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960782; x=1721565582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwKQ25OSsRB+gyr6bUaZQGcnMWRZ9pU2M48vf6c69Sc=;
        b=n4+bOMFiCx/2NFfrOjCrRCR3QEz1B8+xksaJw3WY3DEqQBVhaL9GpOZkVRzTlLV6gC
         jAR7m9O21fv3YgSEN4mBmXl50i8ODYKLMZpT94Tx+Gi2Sd7/xTl6ZUcKcHeKEEqbioY+
         PoeSFRWiMuqqpuX6Imme/4EJQZhH7yrbHGZLJo0JxD9rbv0fRuupQ9Vcai6vd0xGSdav
         EataNbWUp4wcwA+G24P0zG5Ur5AH4TUuiRO2oVZF4BqAsjpUlcO3Cubel/t1dCj3iIYU
         1vpdde4yO9JU6TwJfVdomm3TlFYfqrAwo8R+LA864mBV6TySaE4Og8XMMuqKYnwA7cVd
         X+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960782; x=1721565582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwKQ25OSsRB+gyr6bUaZQGcnMWRZ9pU2M48vf6c69Sc=;
        b=jLEa0Fx3+U6lFRd+2YPwkQH9+YQmlCv1NV3xnXU4qwhB+0bDPXf0QhiqSGFEnwCVch
         YapMugRTk4A/s4c4WADfqupws0ZKhrfvp7HC5SUl+JWZ7oQhskJS1xuSaI2ItnF//CUj
         +khS1c/05mfAakmtIlZ4nsHpR9seOGU1jOT3T9Y2A3fivG/ZplINYAQ0lXcyMjmq35vT
         gkAxUEa7JmzZhh2aRYaPySk6AL8UPWyDnKyaO6gmOG32FW+UlKtSwmZHr454KJad7ylZ
         KHEySMkM3T+fz9CVkbuOTXMeclPCBnhXCGmUwcECRePjSon3N8LB4WUEQ/qeqXam+Cm/
         9u2w==
X-Gm-Message-State: AOJu0YxH8VQRFtsd2C53khqNufBKrP7cOrjJMXiATvb5zyX5PG9T51fc
	4MIhFz+a5efdLP2lJQyrhgrcMZOG6UdV7X/MteGdnRBTgJWX1p5cWK4bxLXHRahIQhVbVqMKKoY
	2KmM=
X-Google-Smtp-Source: AGHT+IFL4ApWxwVmvVqF3vVDljV6n4D+jxq9UnZHbNRFsrF703GlwWdrdVSnoxB5qbnkPtqPzurvcg==
X-Received: by 2002:a17:902:650d:b0:1fb:247b:aa2a with SMTP id d9443c01a7336-1fbb6edf7c0mr96830295ad.59.1720960782022;
        Sun, 14 Jul 2024 05:39:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/27] kexec-tools: submit 0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch upstream
Date: Sun, 14 Jul 2024 05:38:49 -0700
Message-Id: <2a83956abfa3cc4b39aa7682c03b551222c85dcb.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201879

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d28861326dd8d23914571dc0be8e70899927deea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
index e874a8b4f1..489b109285 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
@@ -8,7 +8,7 @@ is used by MMU, the "SECTION_SIZE" is defined with
 (1 << 21), but 'add_buffer_phys_virt()' hardcode this
 to (1 << 20).
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [via email to horms@kernel.org,http://lists.infradead.org/pipermail/kexec/2024-April/029903.html]
 
 Suggested-By:fredrik.markstrom@gmail.com
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-- 
2.34.1


