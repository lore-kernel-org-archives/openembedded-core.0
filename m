Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A4BC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 11:03:04 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.28472.1747566176706416638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 04:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RQpJ6TrZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so2940748a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747566176; x=1748170976; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxGZTB12e0pyQLsXK+bNp2JJeCTk0DCQKfw5r63C1jY=;
        b=RQpJ6TrZJI7OZXvvi0oKXHzAzJHn3LM+eWVK/s+scej6U3SaZyOClCtHBJihCYEBuH
         fjWLNKfMdoX6HChPo2mwp7YsWXwc0h078y9M0FxM9LmoDyrvuKJLuEgrBNARgH9chq8m
         79Ep9GH2cY4Y9x1fUuRTENWATkYMkfZqgD6V+3e+4ZXK4Tt0/hfO1eteYn4otDi2KgfX
         pOZP8h4hNzGKZ/OE9juAVEgKM7QlTy1qN/r7hiaJvpFaJfuLiH4Yu6zLZn+sXv1jHlUP
         fMngftzGnlq5EEwkDZv7EpjZtfWia8yEFvBsH/orWU1TbxVI5/5LCwM6u84Iqs2PSUsP
         4DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747566176; x=1748170976;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxGZTB12e0pyQLsXK+bNp2JJeCTk0DCQKfw5r63C1jY=;
        b=UxBIDDHOsMsAJp6hJwVcE0+XPchgJX0JmdtyOsmz4fxE8uQ45gPSS5vnR4ayLnvuQp
         wt0yAbfcswdOBAEk+DZ+CDAdbtkrHrxnRvY78UZbQ2K2T2Cnelfh349avDcQjrx5LglI
         MIINkc2u94pWu9ONddJqlDTKBYEAQ8ulM5mXR0AUBF7DrsfBf4ZqtO2JSH5sd3PjZyMG
         X3xbsJ7gLAYUmntwvxhNpS1u5+eStgMVywSYhoRUVt18SbCSaWp3A/l+A2qm0xN+1srA
         Z0xFmcNjxnxwmR0ktVOmek71ra482dSs1vLxp9GFMnzDu0Jnd7Gf2Th8hxQIspS7VveS
         MStw==
X-Gm-Message-State: AOJu0YyRTC9iBlkJWriCv57r3DicgxrySnB/JSv4Qs7IiJbV78wIO1WY
	ACfSB7SPi6+gPGgW6DvbWgzio0nq7ObxLb0zZvdG9g2PAzyXo6Uljs+6+hyM9MD+eg5c44/y4Jc
	EKPNB
X-Gm-Gg: ASbGnctOoTHbAIAYudWv+lOqN91HciDQ38Je9xwOomIyjKG//SMWDUnmTmfoTA7tinM
	V6/H6WMoQHdrrJvouwD4rSwXvb+AbyUdVDrOjEHALCjkRrStlCogj8MZDQ/gJLBi0ZOSHZB4p8j
	cZSgU/+8008sY19Q6uLK0tDsKNvAaeBCYV9oTL2uObxljkNAlmNFzN8T9dWNnWNPuknWaES0Lvg
	yL58LiIq4vEjIZxqAiMmz+C0DZv5nX3v+HH4c/HF7WnvTst4KY+QVArY0UPMKtMLBZjqQDQFCEc
	B6SF7ier0FGSHxbBuxlbBfcFbm5aQfa2UMZACKI0xSurt2EdyyGS169o
X-Google-Smtp-Source: AGHT+IGuEIwRWE407K1xxvXD6Uxk0saSMHfz3uEMoTCfJ3aYPcgHSYjBYqZrPv1vzSfSH4DI1nJh2Q==
X-Received: by 2002:a17:902:dacf:b0:220:c164:6ee1 with SMTP id d9443c01a7336-231d4595b02mr140327665ad.32.1747566175662;
        Sun, 18 May 2025 04:02:55 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebad0bsm42108635ad.196.2025.05.18.04.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:02:54 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 70DFF100420; Sun, 18 May 2025 01:02:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 18 May 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 18 May 2025 01:02:54 -1000
Message-Id: <20250518110254.70DFF100420@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 11:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216775

Branch: master

New this week: 1 CVEs
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *

Removed this week: 0 CVEs

Full list:  Found 27 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

