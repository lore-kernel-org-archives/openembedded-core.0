Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE28D5B154
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3024.1765620166806494595
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mBQ85pau;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0a33d0585so885635ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620166; x=1766224966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix8gH9ZPmCqL7Xh8TSaK1REyVINGz6Tf91/6AlI8qlA=;
        b=mBQ85pauPvc1x6EOAleZF9Vfls9HqN/5eBrCKCznk2jgX1WbAcC9reAzJu6Li1leRK
         PiDvuylEdYGjDqaq0HWsfFBTYBD7f9roUeG7b/YjJ5aVlseJrIR+TgCVKAjKUaO8iiGO
         yVUSQ+K9dcadTp06MKmcp4mFX2h4n8ShjtJuW+jVu7p6GiiuE5UOwzVDYR+snzZq4cuH
         9EatzMPXiE8oXNlvw27k7YEI5As9cqKNuReI23i/OhQzXFSzheXnmqgPIX5M/IfE0ru0
         KlYP6tz94kbltsRpBOYg0uQO3e9ol4OEbTYBsFkcLDTKms5oaOXwGA196EInD2kx+a9t
         cAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620166; x=1766224966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ix8gH9ZPmCqL7Xh8TSaK1REyVINGz6Tf91/6AlI8qlA=;
        b=HCnTdeiK3n+rjagokKRqOXXvnQAYdzB+6wmP6vI9V5tDaCCDOSW8Rl+AvD5DCXbXSW
         KB3+pM9qWAPh+F30qm++nOlkNtxnMXVPZI335PSC/5IGIuw/GgY3Hc7Ty7ax1tE010uF
         Fs10qnxSiUfpyM+dlFLC1hbxFPrWCqZ5N6896dVkvR3XO5wq801MS+29nlB2H/2WwhEv
         Q1rDe7aeLw27SQPV/uKUkOh+MJtsBpetuNPjLl6sffWSjhbBjkpbiub2T7Bq69MaT+NQ
         oELhsBFt4knknEqnf2sdkrXXbMSwR8VTX/EwHmBF/HNaFqXfTY4LizNY2K2pLJVL1jck
         FjBA==
X-Gm-Message-State: AOJu0YzhNbrGx1393hiV80sHbPVwfoqmzbMarSqhbKbD6Z2+Z/POGagc
	/5Qy0kC8toKvAGnHJL/Fic9Hkp3MkHvNPR8F/ctVlsvEqk6ypV8eJJWhNVzgcXkQ
X-Gm-Gg: AY/fxX5OBqL3vnyJvFjLOponJepHVftGyQejBSScjn51bYCTWF8fEDn9DJeQ2zHhx6D
	LtSFhHXczztHIMrT6Ry6SqMBhzxp4smgdUnaeTWlckFmkBx03EUYrRbeF/rj2DEbNMFNWu9B9Uo
	JFvC0w7DojkT241wQV4FXKXSZa3E32d9lDX+vZ9lJTdUIb0WOUWBjh7GJVmqUVQKhWx+N21cu6G
	1sL0pgWnTZ3NXKd2E5jfh0XMQTuhBkvRdWUBC9LNwZ5uxFmWfy4RIGmkd1j8RQLaf6/sMcETrRz
	oqdAjC92e0QCXNYI8RUQfQ6jlIYR3xpraGVjL36oHGU6OACFTbreRAHI7SWxGCxRCLesSB5y6Y2
	eegh8XxUZjhfpVcNvPwQ1VL/MOVpZ4ClXahF9nSTgGBBDDGn/5t1+3mCJ8JUdYSQd7xRaF0zdI2
	TuaFE7+QL4Lk3U7lHHSsL4vPtn
X-Google-Smtp-Source: AGHT+IEJZO+8nEA+t+Nz98st8FjybRiSsYHrq1vsdKUzOSXFN/dRAoI8cYT+f24iuf+cb+07rskWGw==
X-Received: by 2002:a17:903:3c26:b0:29f:1738:348e with SMTP id d9443c01a7336-29f23e07bafmr56492915ad.15.1765620165963;
        Sat, 13 Dec 2025 02:02:45 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 66/67] mesa: upgrade 25.2.5 -> 25.2.8
Date: Sat, 13 Dec 2025 15:29:30 +0530
Message-ID: <20251213095931.2571498-66-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227684

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Pick up the latest (and last) release from 25.2 branch, fixing several
issues with the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fb953ee296577db183733e9f21d8fc866ec4453)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3124db0986..cf2c2a57a0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
-PV = "25.2.5"
+SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
+PV = "25.2.8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

