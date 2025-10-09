Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70850CCD18F
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.9244.1760038292167555748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=04mcEKid;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f67ba775aso1996387b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038291; x=1760643091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqA27nS3TAqlJm4Ta3fb7JFun/ZiF53TmHfZDWRV3Cg=;
        b=04mcEKidCV3x2CGptKm6XJoffNCX+yEhVfF0aI9EjRTJsOC4T1ctleKOkQ/rv9mKvJ
         DCIzOBWVRPaaPDPRq8IMuFhdmN1G3MPyxijJc4ja62YpFCGwtBvhxjfCm8RqdtYa3KHm
         POX+xlBd8cjVnNOwZAiTCffz5siF6XxTNUuF27REJMuf3trcJ4EWPCVd+sg/vFEuI6ld
         vZgiI4GPEvcNfWQiTtxkRg86zIdC6dzq9SzF7kj/k3cDDToHbXw6sfPEYOfqy4Kc8DhQ
         2bewBlVhGlIXvnlZzhFhHXFsqsOpaFmQNJhvggHOlPP7esPBbf0cexoPRs9yRcbCKGCS
         yy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038291; x=1760643091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqA27nS3TAqlJm4Ta3fb7JFun/ZiF53TmHfZDWRV3Cg=;
        b=AQXuqt708vnp45eYiL4va3KEqK2TB9mqEQmDKWXuINImtSIcrJSAHJgXr+C8/kVLSe
         VMpPkWs6b+IoRsrHyDMBrYlYh7xYRLkVvGDQGczUepRAJS7pJ0cUvvhSAhlC2M2luYK3
         bV3NZpmCehY7AqeRUmS+YBUdiKyBYUYVM1iDF2owj28znBZezvHsKnhuqF+2scXjraRb
         WZymy4LjKwRzHsJq7ghpBClsk8zJGQnA7heO2saxwc04GQr4n2VjnIzknMRZ3QUG8VQ1
         bbmFKro/NOvL5HbE5gOhmsIfDg0e40jcdLJF1j1XTgHOchaDs6PI3Wu59N3SbId0pLmc
         I7TA==
X-Gm-Message-State: AOJu0YwNu+p1DwvmPj9JVAxCrnVIzoITY/QFpARN6/ejrn9y9bE0dorz
	4PhaWJEEfUFgyu2ihuu9vtF1ZrfhfUwqdvNxVG5LoMu6GIjAySpVGLdOC0ypmheRp6z6tHDP7Pu
	ExA5J
X-Gm-Gg: ASbGncttfqdF5DRZxV0UhYkPNanpz09Bg2ots4/CT6qmYJCYzvsrGu262PC7X+JK3j+
	gZf0pDCt/n3xPP6eHcWvQFuxCimz5Rrlp+qf/j+Bg4t0WIb7PdQW5OBHgwwVadjtVHiw9RM2YjW
	90H/zHttRaKXnIIhz+E+GPjh3NL/ua7cg+YC5E/qguZ+3P9bYSkVMfS5sJaOE7kk91NLkMrPZ/o
	OjbZkxqxf+mdAozrLwTXwnfVPk4t2ZFoweTQY8lLIDJd0Z2ePoIOPaIOd20VDgxdLyq87uWlCk1
	liCPl3Vo4JyHmdyx7sh2hykbAsF0Ul7V4qRdlXrfJhXKrJhY+W+IaEAjRaMYLVprF/dhroD2BYB
	ZkYQmX4FaFOzR4rvpLVap7/iRfym4aSp4ReUEXA==
X-Google-Smtp-Source: AGHT+IH4CduP52sFinW6ql5QdJWszENci/+PnY47FA+/r34Eou5AB8lnDT7p+aJy2DQchMEv8S0OyA==
X-Received: by 2002:a05:6a20:2451:b0:24a:b9e:4a6c with SMTP id adf61e73a8af0-32da845e56amr11974018637.44.1760038291430;
        Thu, 09 Oct 2025 12:31:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/24] grub: ignore CVE-2024-2312
Date: Thu,  9 Oct 2025 12:30:53 -0700
Message-ID: <dc10bf2f9dd91cbd34af43162b61736fc26aa314.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224628

From: Peter Marko <peter.marko@siemens.com>

This CVE is specific to Ubuntu [1].

[1] https://bugs.launchpad.net/ubuntu/+source/grub2-unsigned/+bug/2054127

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1b019752b7..94eeadfb99 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -70,6 +70,8 @@ CVE_CHECK_IGNORE += "CVE-2019-14865"
 CVE_CHECK_IGNORE += "CVE-2021-46705"
 # not-applicable-platform: Applies only to RHEL/Fedora
 CVE_CHECK_IGNORE += "CVE-2024-1048 CVE-2023-4001"
+# not-applicable-platform: Applies only to Ubuntu
+CVE_CHECK_IGNORE += "CVE-2024-2312"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-- 
2.43.0


