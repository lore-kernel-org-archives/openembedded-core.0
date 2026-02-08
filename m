Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28485EF06E1
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:13:01 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23806.1770548912554060242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 03:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OLQNG0lh;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45efde72438so2338148b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 03:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1770548911; x=1771153711; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePTHsCwHERP9RggJxv0lM57spXkmTA/hhsVSFaJFR8w=;
        b=OLQNG0lhl5ToS1iFlM8oh45KiwjlknrVv5Cs4rBc8kXHGn8ydLYSUf0ng0qyU6lOcR
         NxIeQqMYUTksbyxO/69GwX1iysVa7QesAkXq+/JM15Z6a0lDvY4BRFroM7SDE1GJbWGG
         NWQKRj/8w/+IypCWy9ciXBR3D2VCR1PzT9JfMnQOuW33X8b77oKYYNSINLWvPcokovZH
         7xcrRxopaE2AC4bUbqolmNzAqC/25iZSyd7Qrfki/zCpq74VHCbu4OqcGxI76zp6ANI1
         8OKgiAUHqIxgL6uh+q3DY/aDJTmbGxiBKZ78eGd5Q+Ns4MU4UFkR5Q+SfTgiub9UmnAo
         Z3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770548911; x=1771153711;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePTHsCwHERP9RggJxv0lM57spXkmTA/hhsVSFaJFR8w=;
        b=W2HVYhemhE/KsOmTjTb3GCJkh6gloiS/x+JvbNf9+jbCR1al1808iSoAQ9wyCgSmvd
         OCE3OYJ2rRk2+YycmHDGlUxp8hG5VND1M8vWBdCXFKhYXfr8Xh9vtCCvC0LOtK6NQI0M
         hJVziP1dytL3n44I9rISwg8D0DOA3GTr8Mtw9z4zTiDzAnp3Y2eiy2iyHb70mw17O5Q8
         WFQWlDWqoJGe2uzJUscHmYzhpmE0WlXo2Y0UjPKVuHeqBsQcT8Std63spUG84QcSefDd
         eROvsv/xoLCD6VV2xGn0lEZXAFDtBAMid/74ZORc51Mh01+G5iXTAdVp6BPkg+bXk2q/
         kbYA==
X-Gm-Message-State: AOJu0Yw7cjlaP4wt0WYgPaVglasP4mwqLoT75GkoSOnNiSFAwQmYPwC5
	2YzmLKm8CkM5iplYna120RrLkc1yfZouj9EOyGlY7ycXkR3VOOwaNci8dP7BqqykHEOrHadVxYh
	5V2RXDWw=
X-Gm-Gg: AZuq6aKvKInpKLvBpmtjIu50QtPQAJqRtL6CgCVwSxxu13ft4iP3m7/xN5yglEYJJB/
	xKN0FO6gOXP4n4l3egyaHTFKsgDEGiOAGTIQ9lkjehtfpXn+uQGusP3g1WTiIaon6Ew/45rAWuq
	CGAOr6mDfrkhOwXCbjMthOkSNhRjM61+VvNg8ljLUqwEJk7W8YT8hci2x6YZRKtpVYtYpjg/nna
	yPImCWyN0uzoHN9UtPITDRQQmlaBVa2F9O/mQXAqr77D7aRWC+uM1fQ1COq1/rvaTFCN+s+Ua1O
	KhrjsXAxcfXvzTBWYsPAHpQ1/P7Bq0z93HTM/dkyn2f2i5MasH77W0yw99hhyi5ZpGnsfkDvPZ1
	WTJOL2XjFz5jBbSTzG5/qYPompjes1boDF/iqNjaLJWYxCW7H4USN9iKa74XWSNQOcNKvfR9XRj
	U4cpHNcxCmn6n4GKI=
X-Received: by 2002:a17:903:b07:b0:2a9:62e6:ab11 with SMTP id d9443c01a7336-2a962e6b00fmr39061115ad.59.1770548546326;
        Sun, 08 Feb 2026 03:02:26 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aad371919csm32281985ad.62.2026.02.08.03.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 03:02:25 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 5FAF51003CE; Sun,  8 Feb 2026 01:02:25 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 08 Feb 2026 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  8 Feb 2026 01:02:25 -1000
Message-Id: <20260208110225.5FAF51003CE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230684

Branch: master

New this week: 2 CVEs
CVE-2026-24882 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24882 *
CVE-2026-24883 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24883 *

Removed this week: 17 CVEs
CVE-2023-51791 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51791 *
CVE-2023-51793 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51793 *
CVE-2023-51794 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51794 *
CVE-2023-51795 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51795 *
CVE-2023-51796 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51796 *
CVE-2023-51797 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51797 *
CVE-2023-51798 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51798 *
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-25468 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25468 *
CVE-2025-25469 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25469 *
CVE-2025-56226 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-56226 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66476 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66476 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2026-0915 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-0915 *
CVE-2026-24061 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24061 *
CVE-2026-24515 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24515 *

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
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2026-24882 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24882 *
CVE-2026-24883 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24883 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  avahi: 3
  gnupg: 2
  libsndfile1: 2
  busybox: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

