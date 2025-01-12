Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BC6E77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 11:21:53 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.34507.1736680907962143538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 03:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YdujsnKC;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.179, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4678cd314b6so32274351cf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 03:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736680907; x=1737285707; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCJP+G1PnnZ5IcREMNSx+ygNaxZte1yGUpoCAk7WmlM=;
        b=YdujsnKCAbwHSLa6Z9J0QaWGEoSD1z1OAJeMRVmx3LdHZLoK5d0quB3B/WDy+VuOBV
         LmtAXStvbEKMWWG0TvNMEqw3CfpLbg1AqVZH1Hj+L7xIW3ZBpkT4WKakBprMtERAWIvx
         YTxcxJGEbV58cBgoL+YApOZsud+SPVQVNxa8MZ+7FaB7q16JkNnseKpRjZ4wU5tXBsdH
         qRHyFGywXeIsSbe4/tIHoNaQTDOrAjk0Porumly7gC92zE9cq0F8Q+DQdY6QS+arQ2h5
         OxQDez1TPY6IDRgXiYXExNb7OnJRnafclaUWJE870TnM/+SYgSxjQYqGk4KOtZx0Xvi+
         7Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736680907; x=1737285707;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCJP+G1PnnZ5IcREMNSx+ygNaxZte1yGUpoCAk7WmlM=;
        b=O6x6BJv0km3sSOGOgIaRTk/mNfMSFAufmviVSXB7LXDyB1IdqlUZsaurTkbxGipHlY
         ol8DDrw78G9NWiQF55Sqh00I/u8BDspAclhhjQYVtnsOFLZJqK5oQGsbIQ0g4dXzalIR
         gjkpCtfk4spgyc6kvJmExJWvSdprgC2MpTAHRMUM0ItvbGVqNtreuhEjBQyRIUPEiUHi
         7FNi4BqOYe2hwJOUNcgvAglfOI0P0cz+ztGfuUubTm8IamtBgPnCa0oQB33KUPvvYrl+
         oLfj3VkycoBs6hesglwDXkAV2El4k6O0dkJi8VhKwhgaIN/wJD+RetTJDoEl+KdDuq06
         CCdw==
X-Gm-Message-State: AOJu0Ywq6NPIFWx77mIBBv2JRa3PDDBD+kjNNUupoPzm6PZ9HjRNjj0r
	ZGkPjPwtPlXGagon4FEW7FolEGCugZmkYUHC8JljW5ss13BNBrDpxmLJKRnmFb7yht0eGTjr7LK
	IsrY=
X-Gm-Gg: ASbGncvM8GJoYTI/M7xHLEFm4tP0D0VLnj5IWAtEAPWlx8lixOHcpWWAiHtcwl+RAhi
	9CNYvI3VS5eQThmXprDANrlfqNRyUTIIXHXUczyIKng0dixs4YGafeo2xzjT3Nh4jz6ymSyDD42
	FQj9BmDQy9LNlvwDFWoIQvzs11wB8MODaZibQYQfpHrrVhnDbgvB1rPdYwKYNXJV8OjHcj3KMri
	SplBDJMibnmpBv1mr4OW7XM+d5yR5hL5XK2JYNLZLaq2VgAPz3/iXqdielQhg==
X-Google-Smtp-Source: AGHT+IHuENl8DrWvklgIlpbFYEnUWssvEO4xT9sL9cCCeusO4K33jnZwAn9bZQuzwljCSj+X5ibRPw==
X-Received: by 2002:a05:6214:ac1:b0:6d8:a84b:b508 with SMTP id 6a1803df08f44-6df9b1d9e12mr240276766d6.12.1736680906587;
        Sun, 12 Jan 2025 03:21:46 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfad9b4f0bsm29215966d6.66.2025.01.12.03.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 03:21:46 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C88E310043B; Sun, 12 Jan 2025 01:21:44 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 Jan 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 12 Jan 2025 01:21:44 -1000
Message-Id: <20250112112144.C88E310043B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 11:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209677

Branch: master

New this week: 32 CVEs
CVE-2014-8139 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8139 *
CVE-2014-8140 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8140 *
CVE-2014-8141 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8141 *
CVE-2014-9636 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9636 *
CVE-2014-9913 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9913 *
CVE-2015-7696 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7696 *
CVE-2015-7697 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7697 *
CVE-2016-9844 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9844 *
CVE-2018-1000035 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000035 *
CVE-2018-1000156 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000156 *
CVE-2018-10195 (CVSS3: 7.1 HIGH): lrzsz https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10195 *
CVE-2018-18384 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18384 *
CVE-2018-20969 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-20969 *
CVE-2018-6951 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6951 *
CVE-2018-6952 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6952 *
CVE-2019-13232 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13232 *
CVE-2019-13636 (CVSS3: 5.9 MEDIUM): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13636 *
CVE-2019-13638 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13638 *
CVE-2019-20633 (CVSS3: 5.5 MEDIUM): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2020-27748 (CVSS3: 6.5 MEDIUM): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2021-3468 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-4217 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4217 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2024-50612 (CVSS3: 5.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50612 *

Removed this week: 0 CVEs

Full list:  Found 50 unpatched CVEs
CVE-2014-8139 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8139 *
CVE-2014-8140 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8140 *
CVE-2014-8141 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8141 *
CVE-2014-9636 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9636 *
CVE-2014-9913 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9913 *
CVE-2015-7696 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7696 *
CVE-2015-7697 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7697 *
CVE-2016-9844 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9844 *
CVE-2018-1000035 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000035 *
CVE-2018-1000156 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000156 *
CVE-2018-10195 (CVSS3: 7.1 HIGH): lrzsz https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10195 *
CVE-2018-18384 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18384 *
CVE-2018-20969 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-20969 *
CVE-2018-6951 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6951 *
CVE-2018-6952 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6952 *
CVE-2019-13232 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13232 *
CVE-2019-13636 (CVSS3: 5.9 MEDIUM): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13636 *
CVE-2019-13638 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13638 *
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2019-20633 (CVSS3: 5.5 MEDIUM): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2020-27748 (CVSS3: 6.5 MEDIUM): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2021-3468 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2021-4217 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4217 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50612 (CVSS3: 5.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50612 *
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 15
  unzip:unzip-native: 14
  patch:patch-native: 7
  avahi: 6
  libsndfile1: 3
  qemu:qemu-native:qemu-system-native: 2
  xdg-utils: 2
  lrzsz: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

