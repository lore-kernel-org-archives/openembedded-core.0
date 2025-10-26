Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB94CCF9E5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 11:47:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.8790.1761479272112421563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 04:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NyWA1i9J;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-290d14e5c9aso50801625ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761479271; x=1762084071; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZscNweptAk5i94Bu5nR0sz5qgS8R8rXo8HBKMFXTx8g=;
        b=NyWA1i9JL3P49JC7j6P/zMgahbOj8dIZSaNAb7KE222FU72nQLVnMfZmvwEj4LW7+F
         ArKaOSMWKpAosoQqc5pDiHpc1vGsq8M0g9LlZlAGcFLEhwS2vbaS7aJ1QUv8JdiqKfiS
         4qgZMVV9TllPcWSuSzBWyzX2vgkst+EU2ITycPV/uFS9ej6gjHyie0gQg+lVnXhKtdHh
         hPRAu7iFOdFlglgEAaHiLP5KVyQdUQxaHP8BUb1kbdJNKpcsves6epyRCZNJUMadUl1F
         N+psjs7dOrFnWPsn/bbeAYojYPXOsAa7uZM36f6dQN5KwMYRWplvbk6xsJ1PgkPavCzC
         5i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761479271; x=1762084071;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZscNweptAk5i94Bu5nR0sz5qgS8R8rXo8HBKMFXTx8g=;
        b=t5Oxv5EwP+NqJKOMoKaN3alXLjhcRFLw/iDNZB6tkzH2pKREhwksqcU+TVIjK/7EjZ
         Rv4pkjHyAKRXLnMzJweNMNlkGwPLDh5K4HbWQYPZLx2CHXQVjaGrjVXUff0RbSS+2RFd
         f4IY2QGftkSouoaZNWpCqSWsK65CLuEg73Kru9+BHwhNrwt/obi1ev8eJ+ZGloK77smq
         ZM8WJluiAPpazG4gHiJnwcTMfrbaRjtlV+Lmq6+j3qdmIxcT/68k8nBVk9wla7gIgX34
         ahGEBUzSa12XK4romDkVZva74c9Q1rVUqrnfqQ3klZ1kJDkJw+dWZlrJMGdgaDl06jKO
         /nlQ==
X-Gm-Message-State: AOJu0Ywg/RxUWUaUO2H3XqlV1cUG6oyoPCh0kUq5Okhd5VkGW4szAO/N
	UUXph7IECEdhf77dXRBKaKBsz3C5dflwbLRNS9WBX3W2nmCWpE8NU3lkUAG+OVGyf8j60nZUN9Z
	R0R2LDKg=
X-Gm-Gg: ASbGncs5TuerkQ4gn+VKFm1g2IWUvVugKNqjOr8z3ibdHRxcPy4UWVPwdCd2hjnaxKO
	Yy3PeFzexlrj09pbzsDcd+RPhxtuGXK3hiVRIioRF5cwE1QqfbtJ0dp7o1b+BlgjVPb4poeWYoP
	VjaETbZrHZ+hpJwIzJEE7sAIN2GvesbHkewYFS226i+9QHv6OHGz6OTciVjRMh2UkE1xCgGbSvs
	gAmTrijUdEFlna7efD4JoRudHaU4tSsmqwQXEpSNGNtYGRG/8BSql5NBoUi1vIS4KuiAS61XTG9
	IlIjYG1dMbqNgrzQ4zmfpFceWmg18WP3n/CrVKI0dqlmQwUnWQs9YX24Y52Am+4BM4DyM0rJgFS
	GgvxAsWxcfwMOP3C4o+SoqUJttgURiLuzr7uJWXMF829aTy99nrsNZ0yO5McLfFF1f8d5EGs8ra
	FeVaI9XyEjR7gxbJc=
X-Google-Smtp-Source: AGHT+IE1hWJIbIA4mzoz6uHMg4YLA94Q8ePN/iwsGB8RwjiM2VQUoIaB/NhFWymekfocIvDFm/OUlA==
X-Received: by 2002:a17:902:dad2:b0:293:e5f:85b7 with SMTP id d9443c01a7336-2930e5f9113mr199136045ad.11.1761479271230;
        Sun, 26 Oct 2025 04:47:51 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fee41ede9sm2485007a91.5.2025.10.26.04.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:47:50 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 5C78B100417; Sun, 26 Oct 2025 01:47:50 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 26 Oct 2025 01:45:25 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 26 Oct 2025 01:47:50 -1000
Message-Id: <20251026114750.5C78B100417@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 11:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225314

Branch: walnascar

New this week: 3 CVEs
CVE-2024-52560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52560 *
CVE-2024-58015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58015 *
CVE-2025-21709 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21709 *

Removed this week: 0 CVEs

Full list:  Found 36 unpatched CVEs
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
CVE-2024-52560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52560 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58015 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21709 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21709 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *

Summary of CVE counts by recipe:
  linux-yocto: 28
  ghostscript: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  busybox: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

