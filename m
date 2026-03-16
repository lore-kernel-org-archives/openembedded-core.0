Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C5AF013C0
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 07:24:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45480.1773645854657489604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 00:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Be6VdW3a;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so50270725e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 00:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773645853; x=1774250653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYSSb1kpBoQEUNSun2Q2jaqukvmTNzPGfORQcNDEpMQ=;
        b=Be6VdW3aQUnpm7mGwqF4myqKo+F/FJE4Cza2PTOW7V2OTh+lhtrPMVkBNJ0Cji2Rtu
         21wyxKRtNwhnV2Z9vH610OEtKOrr70357zh7/oY4V0JZBnEyEYqNLv/DicHeRgDZEOvf
         yoHrTpji+exV1lD/2e+dSNfro/UDmrmnG/9pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645853; x=1774250653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYSSb1kpBoQEUNSun2Q2jaqukvmTNzPGfORQcNDEpMQ=;
        b=dUh2EefuiK8Ce4ufPxYRWA5DWLV3ab6XJp5O1sWwbQvMDE64YBk+xWCZK6i/WCpnqD
         lD8N301XjjPbE60puA+V4RLfkQTHhulTFJfubEg3G/V+t3XeSRDG1Wvxcy5gfgi5hkAW
         4OIQTaTW8FLguux3FKyJFsOs3bKysPitlIU7T3/aP8Yur9bzFQJwxIpQF/ADBlca91QS
         eAgKiDunku2E5eiQjuLGxUn6VT8rE5Y/HNcAgTxv6i73Is/6H/0zMbIRgrEZik8J8vyr
         PsSJq6a6dO0VCYUfsK282Id6WBn7gM+J3cWQzlTIibN3lYxSX1Pxg35+eQnMGhYZSV6Q
         F3rQ==
X-Gm-Message-State: AOJu0YwL/SqKEGM3eOqfE79CurfJwXa5DxAL7ygM2FicgXEi6KTAhglS
	iyyTRv4Y8cMeaIl4u+CuH9GszjsSLh0xAP56cXzaJuPZm1mDq+9/IsficOGKIc3htA1gM51tYOY
	Jsvq7Z/M=
X-Gm-Gg: ATEYQzyKNjLyIjigVXHO9g5DicQtwfv1wZNON/xmv6NmPh6cmK+MTKqB7ReAKfbWatR
	kKlMJohIRvEAgxDygk0LeW6CyqmREPOxVxrzdjc8HCSmIOXCJaL+vLdCORY7oRKJHUqvD7dyab5
	OFHBOPcQsdk5sDG8ARqJO1QOr4I12GFEhwJl0mwCGN4iqEARHMckQUNYIIGfRQ7MyqQJlkBtI53
	E+FMgx89fciI5dHdD4FMFqtCBl/Oxdjp9H1SmjcFdHUcNpKhiDqy4kzXVAWKqnZ3wjf0GKVbcKB
	KeKqvTWltWWJ9HshYMRQDI0gl8abHkFTNXFjl/O8XjnV4Ivu9gaQnHbKn/S8yWy3+GFPE4nGTNO
	41UNdAVsN857bB0eoGyYREq/WBXlG1pCT4NsqbAEsZo+yEyCAvi/EFGNaZXnS4aL82Il28szNg7
	8YeWuPQnQOdx5sVu4NwCyQTBPSV5avMVoDPstGO4RhribcaSUkZ+8jaPMm2eRJ51qWtYnKxj4Yj
	JncbQpShoihvAKmRqfUuEILPszXZByLcXaRlIoM
X-Received: by 2002:a05:600c:8486:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-48556702d64mr199939795e9.19.1773645852737;
        Mon, 16 Mar 2026 00:24:12 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2509-819e-bcc9-bfb5-d85a-bcf1.rev.sfr.net. [2a02:8440:2509:819e:bcc9:bfb5:d85a:bcf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6bb4sm392678775e9.4.2026.03.16.00.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:24:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Sun Mar 15 09:20:21 2026
Date: Mon, 16 Mar 2026 08:24:03 +0100
Message-ID: <20260316072404.1987656-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316072404.1987656-1-yoann.congal@smile.fr>
References: <20260316072404.1987656-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 07:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233219

Branch: master

New this week: 9 CVEs
CVE-2025-12801 (CVSS3: N/A): nfs-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12801 *
CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61662 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2026-1965 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1965 *
CVE-2026-3783 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3783 *
CVE-2026-3805 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3805 *

Removed this week: 8 CVEs
CVE-2024-10041 (CVSS3: N/A): libpam https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-10041 *
CVE-2026-28372 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28372 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28418 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28418 *
CVE-2026-28419 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28419 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *

Full list:  Found 24 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-12801 (CVSS3: N/A): nfs-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12801 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61662 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2026-1965 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1965 *
CVE-2026-3783 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3783 *
CVE-2026-3805 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3805 *

Summary of CVE counts by recipe:
  linux-yocto: 11
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
  curl:curl-native: 3
  libsndfile1: 2
  avahi: 1
  grub:grub-efi:grub-native: 1
  nfs-utils: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

