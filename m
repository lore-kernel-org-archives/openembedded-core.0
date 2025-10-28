Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA22CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 17:00:40 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.14551.1761670835760540736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 10:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/+fenBY;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4eba5b415b8so17935631cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670835; x=1762275635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MPAKIwpiBRrwlYU97RscJFLSaqqMW37995WUqIo8Vs=;
        b=L/+fenBY5BCNqxiWfUs+YAH3WUkX3yvWUm7l+cq+hHR8AYZWi7J+aOxiZsIhCjNZ88
         Qbxsoj35tl1EpDJGhDLNRfYo8q/Wa2zTM0HLeMcVJkNieEEUjozhlHG3swmKqwr75JMI
         gUP+PlgCJXKjEtnrspA8jKHxOcfQJy0QGsVIpXa/v0dB1Oy9zVPTmANq9c0X93hVjrkQ
         DvHX/5TxAo86JeuWFaK846KQduZXoVMeL+uKFDp36V19ta8lQF5qVpNJHO/uvbyWjqWW
         sYC++KaMPqfED6J2gpw5TSAL8s09VFYUGOQDsEYOaTjMSaLTClzlFqO9eT4s+o9V5sUK
         RMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670835; x=1762275635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MPAKIwpiBRrwlYU97RscJFLSaqqMW37995WUqIo8Vs=;
        b=Nmly+RnLDCpqPDQg6pRfB03jouwCeVqKZubV9QPY0xQciAJ/lwsHFnmWr1L4GFtAzj
         RyxkqD1A98sRmPG+99igN+BnHoxoTJ9VkhmlRIWFeL4Z+n/WFdHuMV0ov2t/M5mwdjM0
         WNjg/T4uCJUwRHhSdyQmmNAyYdGWeR6gi4f0qobI7QzO8tUmkA7USEvSjHS51zYpdk/8
         acIpFuZi3NgAedvYpexIZDHdjhzWP/icOrWI6Cbzvidht1c2OzAawAvgr5FYPCDBBJLe
         S0ueDbB76GJDYa4Dc1ohNnCnpyaKLEm8suPXfZ4Lm5FgEkEzNBVuklD6D+um32GXk94R
         2BOg==
X-Gm-Message-State: AOJu0YynK0PtMX9x+Uh3iw/8yFJAtPlNOk/pF6mALJT53dNZh3i7uhIE
	Ti2LOrGlffcBl1QPJ0hJa+JYzYawm/6+Bpjs9H5vTHV9TnhVvjelcEdS
X-Gm-Gg: ASbGnct3StLgnBgU5u84zHqCPtO7NwC/zO+Rvh+UAkWb23FNFyNndnsq5y5mEG4Xado
	0jsQRbPkmS7HJ3R2k2qiw77YcrdFsTI1IW4KHgCZxJ94zAkq4hQy8QpYzHF4GftSbo5T82TiEU1
	qbEOvtwt31AtBUwh9O4jfgH82M1sNbzYAMpXWh8z45HepFwTtz8KPwt0wWHanUzB4oWYLsP8q6T
	c4B5vlZB6IjbLydYJmODWXeC4ZZTrjCiU06Zh38KML+Qu1UGq+Y9QAdCL/hXLjIhW6XuAnqRYCl
	YwoxRfRrHXhGJzfU06L3pkbm0f6JqomVB0xZEaN4/wnjbFNkVu8hrlj1rlwTBjtHROCLp/hAMuq
	fuKfDa9nbR3Gy+H0RC/WYUgR5NUifZUgDtVjI+9iL/rl825rolqGgr/WKpDU3cl5z7D3ZjO5Gvm
	irAtRH9qvIWWz66yj2gte2Qi13S1VGPDK5Tk8pedQD+qmbo2+smOuqoOieTivvXhzto4abqxc+G
	uakOWhmUXdHynI=
X-Google-Smtp-Source: AGHT+IG1YUnTl/cCmbGZO91Bn3CV2iX1AfihVjNdVMIu5f49ven6qorjG1dPFAwwA3V0DHr76/T+fA==
X-Received: by 2002:a05:622a:134b:b0:4ed:133:998 with SMTP id d75a77b69052e-4ed07492b30mr49217621cf.10.1761670833072;
        Tue, 28 Oct 2025 10:00:33 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37d7db2sm75515421cf.11.2025.10.28.10.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:00:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-libc-headers: update to 6.17
Date: Tue, 28 Oct 2025 13:00:15 -0400
Message-Id: <20251028170018.1795898-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 17:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225413

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the linux-libc-headers to match the recent 6.17 reference
kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Initial build + runtime testing passed for core images on
x86-64 and arm64.

Sending this so it can be included with the 6.17 kernel
update testing.

Bruce

 .../{linux-libc-headers_6.16.bb => linux-libc-headers_6.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.16.bb => linux-libc-headers_6.17.bb} (80%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb
index c3c77f8719..b4bf1126ab 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb
@@ -8,5 +8,5 @@ SRC_URI:append:libc-musl = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83"
+SRC_URI[sha256sum] = "9b607166a1c999d8326098121222feb080a20a3253975fcdfa2de96ba7f757a7"
 
-- 
2.39.2


