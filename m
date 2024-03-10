Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6ACC54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:01:13 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.40538.1710086463573724207
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JdyrSjQL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dd8d586126so1088905ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710086463; x=1710691263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rY1F53jgA2y8E0Agsy+CvV7Avi8zeWUriMzYrNS/cYQ=;
        b=JdyrSjQL09NdqZ4euAicWrM5wuS1yPWoaUhrBOR+bEwSGbO+Bv4QsekGFfWFomKpPD
         dBljT4GYTySY7uQ+Gbhb12P3hHH1gosJxvGWU2V1LbS8YCCECmQBf9QUcrxd1EHhVKgl
         eIjYviiU3o05IWsBm8WOIDG+YnpUQEpROZQ2ZqA1/gU/gkA5cAuzYN+6vc6UTImCewEr
         eBKmZVbALz3duJjGs2qkaQgu61eZpV1VnS0d+w4WXSSNwHWqvog829klCHP+xQUDTCNq
         I63v4Z5xpCQD6SlT9Uo7HPSHxu1is9F/WP7gq+V+Us/SKRgndp5SEnUaGJ8Wu3lK5By/
         qaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710086463; x=1710691263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY1F53jgA2y8E0Agsy+CvV7Avi8zeWUriMzYrNS/cYQ=;
        b=tv729RL5lPLnW3Tk2XVsv3vbJ9l3EpAbXz0Vauesujwd6JIJn/IOhJ0JWqEeT0+LLa
         U/Bz08DDOKbuybBUZ7e9tcD3Yyb+QQ0e07mBZnUWSOV0jz24w1gjBHwUus5iFGFcCfpl
         s3RHgNYnaYpQFA7sK/WPolfl9jFK6BYdxeuOpibW3DZ270XhViLyO6VP8//ipxpo3HxO
         l5EoQH7Nr3/pnXLqTUCCjbeAc9eHJsySksQWci0wx0dn2HcFS3NOzn3RaFG+oXH2VfrV
         jhJt8xsUuZ9TIj0GG3kNuyHnDZi1zu0wsMaOfKoVOXKyCPVMJXmqW39DHAXTjVShHOsb
         Icwg==
X-Gm-Message-State: AOJu0Yz5wQW0ygTY/gqSeB+X5YYfrPaXEF7Ld4nF1Uy9lts2EgQ1fgtE
	PmKPXEfFR3HQz8pO54xL5Tm0bD9pUL/bO8W9ciV0KbMaYRwgcazhCR3TTKicMXhY61BX4kfOPkc
	rGsYy9A==
X-Google-Smtp-Source: AGHT+IHECRtlelBTtsBnF/xGBeGegM0VDxhuyuEWVK4fro5rFq6MgRHdlAI8ZTRLGfboJ4RDQHiRQg==
X-Received: by 2002:a17:902:f552:b0:1dd:9a43:2f5c with SMTP id h18-20020a170902f55200b001dd9a432f5cmr874125plf.47.1710086462825;
        Sun, 10 Mar 2024 09:01:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902cf4900b001da105d6a83sm2836862plg.224.2024.03.10.09.01.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 09:01:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 1/5] glibc: Remove duplicate entry for CVE-2023-4527
Date: Sun, 10 Mar 2024 06:00:50 -1000
Message-Id: <d58b1a3a08fbef97455124d9be3eba297d33f036.1710086264.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710086264.git.steve@sakoman.com>
References: <cover.1710086264.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196894

From: Dhairya Nagodra <dnagodra@cisco.com>

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 212f960cb5..ee89762ae6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -11,7 +11,6 @@ CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-5156] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-0687] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-6246] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-6779] = "fixed-version: Fixed in stable branch updates"
-- 
2.34.1


