Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5DDEF48C7
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 16:37:16 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23333.1771153708649938199
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 03:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KjkL4LWX;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.44, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-662fe3ff6f6so1100988eaf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1771153708; x=1771758508; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFdlQWwrrA/06VIE+/MTXX6z3Ly79eSYPg0F1QvePlY=;
        b=KjkL4LWXLGAdamS+aw/Ee/Zhu88RsKhIvil4uXpIIb/t4AGWJDYab5DSvT0JG5DSCz
         MtMhMeqxeMitGHHNmVab7Ce88fYtsyZESYkY8D2MpPlGezjx7/Pe13XTowV2mSKQFGaM
         /ui18kort5eCXM7HR4FXj4KaNDY0qMNxpbcDtzyx6Fe2mUvy8E94EvH6dd2XVvB9IcVX
         sm73xMDHeoS5CGyt+awNcpp6/y2fNbVcGwvM6a3QJMFyqOW76XgJ/6alRXnJ1QAnqULZ
         FqxgMmz/FvWNJ7XpgleUX5kzLu/Ytq6rZ4EQ7+sO4Q2NnTLmtZaLgNsOLJkUsvf9W6xS
         7Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771153708; x=1771758508;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFdlQWwrrA/06VIE+/MTXX6z3Ly79eSYPg0F1QvePlY=;
        b=wOIUcE7F9ax/L2c9KnivHiKqOWI3dTwxJ0iNFl5fzr/6NNAc7FVukuFHVszn5TqbkX
         Qh7f6xa83+uG1PcFlbSVR82hPOC4BS1kVj+oZtvBGjz/G5Q4U7icPjuEnkDrV0oMngHg
         d8SraJuRFmhvL3PK9ysY8CBcVEdqqjIPr4svAjwAPonpPxdjyAnxdRNepYX8Awysy/fx
         tmebFoy2iSFL3s7ZnVhemnP/6pb14Y2hhYT81jkDadsGlXGIa11silMUqQoEeU1rEzwu
         W5ThGBZzh4tL/Xt6Gd/q/7y8jXSnUm1runLAXGdpSORnDWG/Q6xNtsMZhEVNMc2O+3zj
         bjjw==
X-Gm-Message-State: AOJu0Yx0D9169lrqD0tdApEw2OAq5KxXVQmQNqFXiUmRnQX7/lX5yte8
	6H+6puGl0zl97iTXAIf9OGi0qaC3P7vwNkPBi1gcgDZqX2z4++e+j0HlpatLE/Pn8oR0bi/8+d6
	7aqL4bnM=
X-Gm-Gg: AZuq6aICDfbo7hfpJKDTS5hP5Shnn5F0omOyAUpzp++FFjVF+hAh0+NGzlG9CBcnVW+
	4z07fTaCE7iMaerm+HthcUqEEcKri162iPeRbaSeJUWGyd/DgsjsGPrHTylcfr0ujp8/gOkkBq8
	ivm4KM6PJ05VXHoqSaBFRqAgpCum8L+hfjr0TjneL3p4XIk2E0VFcp1cKwrU2AtN33PNPaIsLk9
	nHxXGY/Xpji4ep4h6p1aBnf/Xre7MFKgMfLJsK3HyEbrKW6hKrHesalWHTmpE1AoELeOlC5KELJ
	t7ETnGnF+C/Xy8BPOYwt9xSuIBBE6vGF0F9Q1iQTTWFF3NXP1kd28ckivzvwgT+hQj8LzwFyeTH
	ke4Rkn5EeJHXeLv9305ZVfAXxmXLoIXzzVxuCbBSolN5jQsYKF/qZ4/3GMfpSFdCersbyUwnVXL
	gk/ksKR2hbXkhiSskjLK5ZlfkEjeMHXbl6X9tTig==
X-Received: by 2002:a05:6a20:4305:b0:35d:cc9a:8bbb with SMTP id adf61e73a8af0-394672ce1famr7243141637.47.1771153333450;
        Sun, 15 Feb 2026 03:02:13 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532f04f0sm3873874a12.24.2026.02.15.03.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 03:02:13 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 75AEA1003F4; Sun, 15 Feb 2026 01:02:12 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 15 Feb 2026 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 15 Feb 2026 01:02:12 -1000
Message-Id: <20260215110212.75AEA1003F4@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231163

Branch: master

New this week: 1 CVEs
CVE-2026-24881 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24881 *

Removed this week: 1 CVEs
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *

Full list:  Found 25 unpatched CVEs
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
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2026-24881 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24881 *
CVE-2026-24882 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24882 *
CVE-2026-24883 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24883 *
CVE-2026-25646 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25646 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  gnupg: 3
  libsndfile1: 2
  avahi: 1
  busybox: 1
  libpng:libpng-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

