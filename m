Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADDAC83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 11:47:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.16607.1753012057402508127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 04:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Tfpvxmqb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3392595b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 04:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753012057; x=1753616857; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUCd61GTOnT068XW/xkTHILtagyO3OWKJayr52287UA=;
        b=TfpvxmqbJeelHKbBD+pXjvz5S55K+V21+ITLv7V0ZGYW4rtzsITc2yrLsC3tNVuqvS
         TvzKaGz+fdlyAENBhxXDicggBeQekKMUOqoGU0SzEbWUZSzRPAKVF7bIzbGoZDgGxySU
         xRKxjlpUq/wN1198HcI/Av+49bX/kgB3giDfgSD/J/s2mwy7xKULkrkyHCFio0AQZaBj
         pfV8zuyjgxfUu0KI8Uhi201NVQqk9xixJ8R/HQ5DpvURoFlNsAW25GhjTxC0vCKLcokg
         SZAlH+cKYKX9uVmKyao/M1WV+Bki6vHOdOnate9cB1MBrdECIphTb/mzMDY5dBvgJa5c
         2Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753012057; x=1753616857;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fUCd61GTOnT068XW/xkTHILtagyO3OWKJayr52287UA=;
        b=N5VQ70/XLMq1+6rJ6Q7kSfKZvpMderVxY+JdnGaf8I87V5zgmRvzuLz8p9BimeZdjr
         ft0MtEaZrBDetiEcqZ63tD5g+K+1fKnTgz3iW7/dIeu9phOX0ZtsYWGsZp4bx4h/pIj6
         vSL1Gvv0WqKJeVMNOLfrvxIVpGctsAFxOi9risCNpuU3HLE9cEKt7SexZ1n2kfwqf0mK
         07/4wU11kMFQNDBkJCsciqE1IELukS5gXh7jVMZUNYCFCuiUhNhNKBfSJDVdEGWrIgbU
         v+hYSZWpKJFKYlw1C0sVLTB5eNokSdK/oud+Bs86jJcLrqiTzcvXM9V2CfHIsJtIVz76
         tr8w==
X-Gm-Message-State: AOJu0YzkxS2idyAsFaA0xQdvJr5pqholW1AbGcz5L3+vugfSggng5nRp
	qOL492mRPLfe8quqimoyZh3LU0MBWnW3qB6aZpvqqOqJ/yGjE3jRLz2JgrtxWSCjVLfHaRQKEMT
	Qa0X0sCE=
X-Gm-Gg: ASbGncumVcsvOtLDUt+iKo1G2F8j+svdWbARKRE5S1PHRsD8WaS7jbV73ML56bsZWGr
	kvBWvrZjQXiuV8SyPLo9HICPgn0uttf1D3pEXU0d6q9ajZLs0yvk8s6g0vWujGgvbPDY5m9dVQv
	xWL02G+q2clOkD8FzotQx+iN4jlXO0rl7oWS/fJfcmykWEWsHY8MFGjYkLWHOUSz/0pOJ0u6rfF
	bpLlTVPwHLl1TV+KDTFlCcZeX9SBolWRNfq+34MwdVOVsuFIZsE5NqvU3uCU7DMRnJqiW/7ZSm5
	8HyVyh6K4US/IVCYdrU3suwqIVdnHAuhOxPcKQfUmiFpOgm70z4QfWNTB0A56TQ/92Cyi4AKzTe
	tRxKXzV8HqSxBcM57jmaCSrQXr0I=
X-Google-Smtp-Source: AGHT+IGrwzGUJhu1sHKaaXgrBR8/oosE1PklHDB4d3aTa561UhzeQxJZNem/2CL48ryrzUgem/Bkxw==
X-Received: by 2002:a05:6a20:9f04:b0:233:ab19:794e with SMTP id adf61e73a8af0-2390c764914mr21607786637.8.1753012056623;
        Sun, 20 Jul 2025 04:47:36 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ffa9850sm3720799a12.65.2025.07.20.04.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 04:47:36 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id DDE9610047B; Sun, 20 Jul 2025 01:47:35 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 20 Jul 2025 01:44:53 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 20 Jul 2025 01:47:35 -1000
Message-Id: <20250720114735.DDE9610047B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 11:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220622

Branch: walnascar

New this week: 1 CVEs
CVE-2025-47436 (CVSS3: N/A): orc:orc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47436 *

Removed this week: 2 CVEs
CVE-2020-1171 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1171 *
CVE-2020-1192 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1192 *

Full list:  Found 28 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-47436 (CVSS3: N/A): orc:orc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47436 *
CVE-2025-4947 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4947 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  curl:curl-native: 1
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  orc:orc-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

