Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154F4CFD314
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 11:02:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23618.1765710133981735169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Dec 2025 03:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aD5ld6AS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso92289a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 03:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765710133; x=1766314933; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/gAOvUDJDCMOfPomIWfEahLRz3MPOHXUfiKFoxBm5g=;
        b=aD5ld6ASkkb+SuLiJ59La88QkJi+VeiU5RNdK0Eb4rusyYbtSuHg7MmJq3o6jJ1+uV
         7bjV2uPcIgVcnceRk6u3iKaiVZI8FD9UZncwQAOUrHEGbV6acz8DJIaulqGBPWz0pYtw
         5/8ToF9eRruZdNOPlY4Sl5ZJOV7qo9240ScXzaTAaB0qA3+n3Q9Nimqh2LHP4RD3nf5l
         6yVrzctkQR9EJHodF9FZaQb3sd4hkiAgeQmUUEVZlFGkgM4UruynuM2ub9ab+zHaK//b
         vWjyYjcbmvNgbFqI1rCxHrz4ie5+0AsTz9aXX4jtnw3FfxSkCzHR3dy/EKlifmWdK9gS
         ZmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710133; x=1766314933;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/gAOvUDJDCMOfPomIWfEahLRz3MPOHXUfiKFoxBm5g=;
        b=IB264gPTXjcv9UVb8sG0zY+8UZPJ91uHAvOTroct7EuplS34BIpmrqHx0ED5hF0SpJ
         dNp+DjW3KTDtw76zVueTN5P7RhvGOU9kX5+b+07IDA9A01sBGwYSUVANVNjfdXxJBQGf
         PP12tP5HMes9VbMMqM1Etsia7gJmg4hebMxDqQzUR6LGr48f1U0n1TyZLM0SEVzgIcsz
         +ylcvWXjLLkEUKxsgM1Rbhpc+jxasqpT5yBkBCdgvfKGJ0W40At8AoqWMQON8X28onUt
         b01yFfBlaNC6khFYELJQ6UJk5YP9v5f4ws57lNbOSkPWvEJuJG11iaPmAskcAhHsfgJv
         w9Mg==
X-Gm-Message-State: AOJu0YxhSJ+cVsvor03yO5czLjWIeqtCIRrcdFoOBBWkp5l/yKRcL83T
	/wD8ghxfHt7pdbpq5lVgNTthDFRMw2/+YAh8lPLYIqe0eSzFmHi31O92/KLQYUftplU2kHGsWfK
	ihBiT
X-Gm-Gg: AY/fxX68OdraaVG0KcVaVEj6cTKHC2G/L44eEE0DD07fURrKjj0GMi7EQHZRRBr/kvi
	Wz5UOfxOTBZljP2FQPWeMXcFha4jP5gqFJMdUH6k4D/XxjmhXO6buBczydbZ0vkaxFWalLbZu0m
	QW1YVJfV5JPoHnMfw1v2636s0Gk0fw5asMyos7MeKr7c8LRxQOb/dSmu/Nlc3cHDN3ehYXL0ekT
	Y0Bn8Vd1kjZca0+yKyrifxPUHQPuevunGejt9pSz8QP9wJ9e7vSS3m+9n5cvvy/C65AnHM7l0f3
	HQEpZWZ1UFO3rli6UbCKBXSX5f/I56j3JfGDyPp78C20nvr5H2OtOnafm3tPl5GD4/ZIbDkkEc+
	w63DLl0wInjXuYaFLXntlPHqXLZEnPeZXSQjG6jmSmPG8pVG8zg4ggFrHayp2OVx0IH25K5tZQ+
	SCDe4auHSHdfGFBSpEr2RsMerbiQ==
X-Google-Smtp-Source: AGHT+IFHOkm0uryUU8RzaFGrI+SlQf3yuaS6XunuPwio06wvgczZ+LORzSWdPINGlwcu7svwaXlGng==
X-Received: by 2002:a17:90b:5348:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-34abd76f866mr5588744a91.31.1765710133055;
        Sun, 14 Dec 2025 03:02:13 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe3fb21dsm6271901a91.15.2025.12.14.03.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:02:11 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id CC07C1004A0; Sun, 14 Dec 2025 01:02:10 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 14 Dec 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 14 Dec 2025 01:02:10 -1000
Message-Id: <20251214110210.CC07C1004A0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 11:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227692

Branch: master

New this week: 2 CVEs
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *

Removed this week: 10 CVEs
CVE-2025-11494 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11494 *
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Full list:  Found 21 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libsndfile1: 2
  python3-urllib3:python3-urllib3-native: 2
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

