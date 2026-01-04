Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD01C2A062
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 11:50:22 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41548.1767527406252037918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jan 2026 03:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IyCJ2luu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso15442979b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jan 2026 03:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767527405; x=1768132205; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IU/M7XbJGF25hAbYIhmO4Qge4rGoExUYT/v/QTGri4=;
        b=IyCJ2luunX1iqUKNbBgescRAQb+OWfpV0yMQpTOl4Q58LfoNJ43IM14D1Otny06p1O
         CzafyGlViy1wsc8SKF/HmO5BZpTorQnqz0nUSRRtI+3GpdQ1h+qt1X8NR5cw6VL/8sAP
         bi6gglFLyoS8gykUotS1uTcXqfB16kFX7HTuZgEuSIyFtvVNp9jDioVppV1dmM6HuiiF
         lPjZvYSUEdIdVOeGsBn7yd7jgYTbERwJbM8gIp7fmcy+Cy52Iq2VK4nBNWvb3LgiY6xu
         /RGBWbGttFFFsKvnVLw4rSFYtMdqkAmRF8Fby+ztttjvf5BBPczgQAoDacwByVdEsnd0
         rF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767527405; x=1768132205;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IU/M7XbJGF25hAbYIhmO4Qge4rGoExUYT/v/QTGri4=;
        b=LA0Joo9fyADEe1lHJO8/0VjNOqHFw+crebwCe3PtQv5Kj2ACSPX33B+03XnhIeYFop
         1ws6gnRIS5Qec3z4zacrDtDwU2nYK4sn7WO1L6f2tUCvO0EDwXJJbK5s78G4SUjVAdyV
         Afjdob4EETmroTX59ipTSZmd92FrMasEubnq9P8dxX4gaO7pYZ+qZTfydOSEYlgwDWoa
         3TCWPXtMAnXzelHf11qtVcMtgcBKQz9GjQ6xUxtS/jOX1jxd8jUo6wVHKFPF8sBTk5c+
         tR5VnvS6E2DWb7Kldpfj3Hp7UqZUlCbipycjVbuI1Xcey/gDRqsNinS6ZjOXvQ56lc/o
         E4wg==
X-Gm-Message-State: AOJu0Yy+pA5T2Azhpm3ZRxrQ9NY2cVy/BHW6pe1i8206/FGksbvtQK8t
	M+I/SYyZQcTIhTBeFTrLGmzPzFLi2wldox9KJjv14jcWY+2u1kksWNw5cwh2H7tD3UbMawgdKPz
	UIh88GF8=
X-Gm-Gg: AY/fxX4SLm04Zv+oWMDb2saFmn39G385c9tOm1tw166/QHyCUONuDemi4xn8cBHODaf
	aa2lVL3J75b7UPx34/G014k4hGrExplSho4kCY/LrQixHqDT2CuWM+3UX9q3ytUiRc7P13Ow/ia
	Lu1N2koOGqoiQp2uf3ZLB6wcAjulq4z1pjZoyeb0Tk+h7DYBrD01J2HgHOuDqvcdf28D1iv7B/h
	esjvktAWBWtNYgkrgRsPnzirWZl4VHqTMnHGSGqpCcfY1aTgpYuAPp2OnwY4DutxkG9hTUGzNXo
	0jbL95/Ft9OcDjCBE/IFSR2tI0v63eCdWznS+nwxxNygVozQcbrm4DTHSla98+APWrtxuyarTZ0
	2UfQEs6kAszreUP4HBJHXEICFNxBKmm4SXKe5ckCc0Z6Dq2Dh7bK3eJUCHCoVyR6aYygb/3g20Q
	F2NHSE0BVzu1ths38=
X-Google-Smtp-Source: AGHT+IGyQb5EkbD34tOz/LO6CGsmVqq98I/uTpJsZIgn/A3IYk1cIA5Ki9RmDRemFBZirmCKelWNVQ==
X-Received: by 2002:a05:6a00:ad84:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-7ff66276fa0mr42024677b3a.31.1767527405464;
        Sun, 04 Jan 2026 03:50:05 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a939ea2sm44805814b3a.4.2026.01.04.03.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:50:04 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 8325E100292; Sun,  4 Jan 2026 01:50:04 -1000 (HST)
Subject: OE-core CVE metrics for whinlatter on Sun 04 Jan 2026 01:47:47 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  4 Jan 2026 01:50:04 -1000
Message-Id: <20260104115004.8325E100292@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jan 2026 11:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228856

Branch: whinlatter

New this week: 2 CVEs
CVE-2025-13836 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-13836 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *

Removed this week: 0 CVEs

Full list:  Found 37 unpatched CVEs
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
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-13836 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-13836 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58436 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58436 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-61915 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61915 *
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libpng:libpng-native: 5
  sqlite3:sqlite3-native: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  cups: 2
  libsndfile1: 2
  python3:python3-native: 2
  python3-urllib3:python3-urllib3-native: 2
  busybox: 1
  expat:expat-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

