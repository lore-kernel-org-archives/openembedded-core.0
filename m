Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60A6C2A06C
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 11:02:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41081.1767524537058277500
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jan 2026 03:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a04DZ8nm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29f102b013fso164994995ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jan 2026 03:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767524536; x=1768129336; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g2BzPtYL5yJEqBbqR3FmcnhRF5qzNYGX7eDz07Z/80=;
        b=a04DZ8nmhpiHMnBXdTE/it3ZNcWDiK8g9K2RVJ0b8sOQsuUD4xbnO7JRxXk29ZJw8x
         RqjsklpkDZdRngeU350wOEvJuojInd63xSXRRbRWt98dnXqahatYhenZSGC2judrefw/
         SgovCeTRvmT2tT/qSkNvtCe+qvpCcxfVGrQmvKJODGmwA93XMbaelBXrDzGIVGaOvHv0
         NoCL2Yp+p5OmmNFWgjdKtZafhNkbR5pstzTKlqBF2uFRNXXD8h9ULOcPPw8AKH8xn/5H
         Yg52FssfpjymUhL3VinrgUlnzrw3POa7G71CWThq4ix7JvCVMl+W56l3movuwebbhaa9
         S3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767524536; x=1768129336;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0g2BzPtYL5yJEqBbqR3FmcnhRF5qzNYGX7eDz07Z/80=;
        b=TmuEGBD9iAiwYG4aE23ER81SI91Z9CjKvIEFWFg1cqpqi6uBq75cFRPfB6j+MoE3mZ
         0RjQah5tZeRs7wOgOEn5M55uAWBW3Oc4cCnraYrbXahHQzA4T9p9lFHWXLm85KXkcp65
         YppqvD6kzaUiMi9gZOQn4Kixiin2Evk7dyzYyJXSZ7GnOcYYkZ7NW1ZfI81jM7vW+SuF
         NvgkEza6Yf0vw7PcUBnLc93DP0aF4f2Kdx8axWOBN5DrZMK9cNUEorpAuoEEhui8HaiA
         couK38ziJEYY10aK2dwFgiCOsTOe7RNgYozQqXoke/J7uSZuLZVnyjGOm+3FSIQSAkxQ
         fIhw==
X-Gm-Message-State: AOJu0YyHEEehBXTiUuPJ3ZqCCHHU1bZYI6v0BUa8+HmmC1+YaijbeAvo
	yN9fYkFtQprWQU+j+91rl8DjuHJhPR0aMWCRnUnYbdCxwV9A4RDbOM8E/9zwjfFzC8Di15sJY8h
	zArD5
X-Gm-Gg: AY/fxX5opOzTV66on4tZswjk6kcFR2q5443vdbLKkAgNSRnPNfeS2zmFERtAPb3GWAB
	a8HiW8bdW3mYtU4DrWUdX9Np8py8wqX77e6epsRpNiG5ipHYaX0NcNwvgEPkjSkZdJNQqFvcCyk
	xx4IHkJUpPL1lsAEIxFJFvy5rd2xIapJd6MVnuV+nVMFmMstcSOp0QGQZ1UKMWel0HcApmxDBKb
	K4j8SEk4iyuaOQQkH4yTD3Pr/tTpWXxA5ZKpiNFPafYcq4n9YZcHenKh31IZ2aEGNwgfGkAYJVK
	ScM6zluzcRfVl+c60sjGpuRVElUHLSwJY3eIqPvQuFqMb+L2SSh9oJI2Ol6L3bI084RNLHa9ybc
	VPZR2eXGFUxGkmTNx+PxH40Ih+yWOMlJdZFGymodOt5bY23W1UPvID7E0ONp9Pu9UQD+ThbwMJL
	fdKhkrhM5ENorC5CM=
X-Google-Smtp-Source: AGHT+IFHDYRv6RgXlzuAbbmCtqDxGZiTwkZbRT2r8Dj8ASPrY2KayNcoYLoewacKp1cir+u97AlJJg==
X-Received: by 2002:a17:903:228b:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-2a2f2c56453mr440732495ad.61.1767524536079;
        Sun, 04 Jan 2026 03:02:16 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5f5dasm414609495ad.82.2026.01.04.03.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:02:15 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 21A77100292; Sun,  4 Jan 2026 01:02:15 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 04 Jan 2026 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  4 Jan 2026 01:02:15 -1000
Message-Id: <20260104110215.21A77100292@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jan 2026 11:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228853

Branch: master

New this week: 3 CVEs
CVE-2025-13836 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-13836 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Removed this week: 2 CVEs
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *

Full list:  Found 24 unpatched CVEs
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
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-13836 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-13836 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libsndfile1: 2
  python3:python3-native: 2
  busybox: 1
  expat:expat-native: 1
  libxslt:libxslt-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

