Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5B6C5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 11:53:28 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.36037.1749383602585248980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 04:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fyDjLUWM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so1259503a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749383602; x=1749988402; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPhL9iXG8UQsISGRJTbfa27apcIDvzsCrPquBKvI+fM=;
        b=fyDjLUWMFucAVHbbox3aBGtSrB5k+Eh1xt0cNBm+1KrlD6ELg9QSSBnl/MyPj09e6s
         VBWjEgS2aRFoFfwB23wMuIr8kN1UB3UHKtDfe17pLoU+FUQ104DzlnCu1L4TrshzZ+wz
         79bYkoBdt+qVZxOc3KEszRvMbnFKzJZVzMeGxFSEH2BT75DOCEB7LoMdG++Sxtne0iur
         eBmmLdRc2OsB3y7u5m67X15jzN5cH1f51Yi8UG7dxPsPRsagb0GdxQGmzGLwFMcYtwDH
         IvfEvhhKHLzhbipz+l+RYSxbgKMAuWzWV6xoijKlRH5enF3Ynzr7hQeMS1qF7LWkrh8O
         vD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749383602; x=1749988402;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jPhL9iXG8UQsISGRJTbfa27apcIDvzsCrPquBKvI+fM=;
        b=Xt/ndU8bKTVCZbqd0vs3ngoaxX/uv1R2alm3Iix5J3qAFRrrwKJzK4n5fl8ZK9lWEq
         lUfVke4NJzPwZBUK3tE6HtPP1Oy4neu7StMhrT87aGa6vLM+XpUYRquXQwwBqyKoAhHL
         yQy4SupgDYSsrNTjwdHVVN2ekOVeOl3g0+fUF31prC/6S6HG7KgvJcQst4s1O/9FmpyQ
         ha5Jt9/DTstgjUsfo3AKTmAtbn732Ov2ZA7y/CvGVZ388tbGQtGyEeECEv3aofSy0YVs
         V5rv5yYdug27exqA+mbjYzz9hUPjLbycVehjelyTdbqOcvIJhd1viJhYiuLzvl47CVaM
         Eqwg==
X-Gm-Message-State: AOJu0Yxwxr3iSUN29S596dkGfJYgMfpvk733ovCedA7rTWoJVIa6U5Z4
	KIvO7K5MD8khWFEB4ssZVALhVIRyRGwozSKULCncrYR9J6rAV0VgycJaenw5xRO4X7HDV4a+9k3
	Q3nV4Nqc=
X-Gm-Gg: ASbGnct0+I7XHrMWdEqIr6m4zvJzWjI1QmwRrVe6wWfxg3GPlSdb8rZ7jIAGIilDJ+W
	QQ9RfFVaAW1ClGvC4keR5FA75PK230rLtSrrnzY3J3/WTqof+GgT1QI1JETN6DqudSHKHAi6Ro5
	PiaoapBY6fBQnEPrnJOBkDwJjbLl8jSMFbxVusTVx3ea+plSol1qB2qvotBet0v4O2dV/lgrOHQ
	RslxzBpVbZyk8BVGrX9Z48SNmWKsLuqxqo4p1ug1sB8PcyQrWrzXZ0TzW01esrqBsIbhisHsERU
	I+eDMnl/WlN/8+msMioMzian4Y4nahOfEmYHewPGOO+VnpYBFvyjPJO1rySAX+HfEmY=
X-Google-Smtp-Source: AGHT+IHDq4uwAdJxQyqijHQFXl1zYaBEghxWXx5sEM17uWOUMw5mrsx0vIDLSPJUkCHPlYEq/0LxHA==
X-Received: by 2002:a17:90b:520d:b0:313:480f:ee72 with SMTP id 98e67ed59e1d1-313480feed8mr11465739a91.23.1749383601917;
        Sun, 08 Jun 2025 04:53:21 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603410b9bsm38003065ad.213.2025.06.08.04.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 04:53:21 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 294CF10039E; Sun,  8 Jun 2025 01:53:21 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 08 Jun 2025 01:50:26 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  8 Jun 2025 01:53:21 -1000
Message-Id: <20250608115321.294CF10039E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 11:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218216

Branch: walnascar

New this week: 1 CVEs
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *

Removed this week: 3 CVEs
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *

Full list:  Found 28 unpatched CVEs
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
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
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
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

