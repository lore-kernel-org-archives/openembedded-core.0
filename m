Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A337C433FE
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 13:52:05 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.10862.1636638724617015910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 05:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hlbRMrjt;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso4812050pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 05:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ea19MERyZWSKauGhJk97FUG6ROfJh5BfF2eJ9LQDdMA=;
        b=hlbRMrjt746kbjsVY6FCiSEyzYTVGNyQRQU9wDISUCLJxp4Qo7cNCWEF+1J4oB5Bv9
         /KIBoLZOTIvnbR+LiXOTJLBh9Dy4LQjfs5mmGS1Xvs+IM0ndD/dFXrwWxSN2SPT23ky9
         LD6baMkGPHFmp7P7aqgMjLTdZPFye2T6BqMzQzZxCyFpy6jQFo2eDgHD2HIfAvof3wLt
         f6AvhZ6c+lcxp8tNGl6u8gyYZnanQAxWnvFYIdgwrvdfCw7iNDYQqiyMAUn8pHXx5CVe
         j0ouVCJCk9Qk2fx0Rw1S5L4Im5zFhJpHe3Q8/hg/z+MB9XBrxKF5z7GcEC0kCYXskj04
         8yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ea19MERyZWSKauGhJk97FUG6ROfJh5BfF2eJ9LQDdMA=;
        b=X1niE/PWxapMR9WcCvGNnGMHEy67M+8/hMx3LoVOXbcLjomwlQMJ8vNxZMekbcGcfw
         XCEwDzsI8+MV19laCKW5Csd5ZtDSpPoDv2KtPtYnK1YxO7B1mpeOBed3XhOPfwViGVnX
         jwBVyp5dsfU5c4+dA8M9ZTs+R9hS0nlT5Kd5wQX7aIK1Ncdwq4CoOiLW5yifAZWsUfoc
         YvIOC2ZUA4njBs2F+hdy15TmDI+itTZaCzuRjmPLQZ4ZecKIZMWVnJjhawm/sFdUhG+c
         jc+TnO02UmNfHUbBj2mB5mLHKyYlyOj4jJDXah5EuuJCtHUoSvihp4AManxdHjTEoGyf
         reww==
X-Gm-Message-State: AOAM532VMrWEi8LehxQxKmu2Qja/Rb9FUkFDmMzHE/OYugKreCGHDoTY
	c5AWPiC+Rs5jkjnY1UI3QvfvE9IBCwI=
X-Google-Smtp-Source: 
 ABdhPJyNI3lEx5MCB8PQH4IDW9Zy+MFQvCKQ9xAoJxt3pUSdZCNYGNuvOzw9uXxE+sLuq9M9Vwr8iQ==
X-Received: by 2002:a17:902:bcc4:b0:141:bfc4:ada with SMTP id
 o4-20020a170902bcc400b00141bfc40adamr7807039pls.20.1636638723833;
        Thu, 11 Nov 2021 05:52:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 v2sm2984232pfg.115.2021.11.11.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 05:52:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ptest-packagelists: Remove qemu ptests for rv32
Date: Thu, 11 Nov 2021 05:52:00 -0800
Message-Id: <20211111135200.2765078-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111135200.2765078-1-raj.khem@gmail.com>
References: <20211111135200.2765078-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 13:52:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158181

qemu is not buildable on rv32 yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index fd52fa72a4a..0277ddaf1af 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -64,7 +64,9 @@ PTESTS_FAST = "\
     glibc-tests-ptest \
 "
 PTESTS_FAST:remove:mips64 = "qemu-ptest"
-PTESTS_PROBLEMS:append:mips64 = "qemu-ptest"
+PTESTS_PROBLEMS:append:mips64 = " qemu-ptest"
+PTESTS_FAST:remove:riscv32 = "qemu-ptest"
+PTESTS_PROBLEMS:append:riscv32 = " qemu-ptest"
 
 PTESTS_SLOW = "\
     babeltrace-ptest \
-- 
2.33.1


