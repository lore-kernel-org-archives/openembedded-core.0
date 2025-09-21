Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE323CAC5A8
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 11:02:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.27551.1758452550972286664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 04:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jvFXuqsn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-273a0aeed57so5879525ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758452550; x=1759057350; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT9tqmmHSCFoIBi/yBp5CeDm1FEwnzbGhmWe436pJ2Y=;
        b=jvFXuqsnTisKo+KtQM5gf+Zw6rf2b5LcLgAlUDryUhU94nERoCbcx48Z6xseSIwmMu
         i9PRe8OYaerHpVAkauYEEY6va3sA7GzYoaT3cKo7XbdZSc2dtoKd7x+IrQ4RmCfvBTHE
         3qIfzTVBf0FntZILhsr1XbikFQNyxfVnUpXMTmlLQ2RPSmZTkXYNNJ/GYS9XSrqxy8f1
         RruSnmibF04p//5e+85x/NSm9oJ8b2pPAz9BsI0/tVt/qlI0b/koGZbJUw6lz/3/M+T1
         hUhYeHngS1AOfpFurXQTYybuHhGbcXxdEm428LUBC5/LO4dbpj6KXnGneIWMBLFhACX0
         244g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758452550; x=1759057350;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PT9tqmmHSCFoIBi/yBp5CeDm1FEwnzbGhmWe436pJ2Y=;
        b=NCgk5K2NpDT9QrSY7aABrzG8bWJX21tj4R5pp73D5zSMgoW5zSW7U9p50Bu7ld0eA+
         /z9cXxODR7o/lCDZlxfyBVMuSASVNZIbBogryawtdqQeNwXBit7JdKKlANxOm5ny3wWs
         aPnbbPN0/VASX7FOFr1H0UVudcUSYvVVTmgYiov6lP9xbeVlgXusKf3bXTrTZLUAs+MZ
         2dAuBX8N+rU9jPdy0TlTIo/zCbnUik7dQetdseVaCxDIuRFiEnbMFikrXtVou5qitFGN
         RbeoiDo/YmIkBkt9BUPqqETlR579NESoQNtsqUq+3J9Ey5oJ+xEnDWNMF6TBUxnXxVZ0
         c3gA==
X-Gm-Message-State: AOJu0Yxhu/p5ZA/yINAQ7ePy2dve94rge0nv7yjbC3kLNnUuvI2YLKSH
	hukIALfcg6owh27CmF0g9CXuTTGqCkoZ76eMCVted7ioFErZJRNtZ2Dx8csGJZIHjEbjNGxgAye
	9Ej2H
X-Gm-Gg: ASbGncuAUxVkWmt0WCoSkYc8sS8tNPrTVrkkofWhqa2beXTTc3b9Nb0lgV7je24G3KP
	JvZM2DhY7+aus8W8vZtd3NONUXKYGvipvVI7mrXT+Q4lrSSYwgLzx6calMgRhL/KiBkdtsU5rJr
	HWiGRiZSA2vYWbqtGNcYM2ROk9TlOgbsIXqGueIgGZrBYAv1nhS8ppME0d4MKAJ1H8XGnr5ah25
	2iucVEj0d/yR62RjxBiC0u7w4jHSUyvpASEadnjSu6YI2fUrPcyOirWBSlZDN3P039nsEaO5KJ+
	bS3T23w2BC7KmDEWgkbWH1AcEQa2/xwo3l3UIN7JM0GSiL3KkQO7nA4zjwi1CQWHk03ZC9ZNnRN
	SDHMTztJPwoemqP3xYPjpj/6GlYM=
X-Google-Smtp-Source: AGHT+IEzRgRDZDZK123qdR4F2PIGBOaRPxIhIJnlupQu/MpEghwrRNayFCRr3F+wlilAeqtYhT2ORQ==
X-Received: by 2002:a17:902:f711:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-269b7953d8emr105692685ad.10.1758452550077;
        Sun, 21 Sep 2025 04:02:30 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016b675sm100312465ad.36.2025.09.21.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 04:02:29 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 21A01100387; Sun, 21 Sep 2025 01:02:29 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 21 Sep 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 Sep 2025 01:02:29 -1000
Message-Id: <20250921110229.21A01100387@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 11:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223788

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 26 unpatched CVEs
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
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  sqlite3:sqlite3-native: 3
  tiff: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

