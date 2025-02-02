Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1DEC0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 11:20:42 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.62387.1738495233044488116
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 03:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VKY1tKrZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216401de828so60974105ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 03:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738495232; x=1739100032; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7NLxMTJJXVCB0npGaaytcjoYcLNtMP3mWIpx11JvRY=;
        b=VKY1tKrZmjBo/nR1Cdfcvmcl0eGFyXwKvNkT/cMFnDsxAHgMiv/fsUZCRlfU6FXPbz
         ZIT2gCmjotfd/XlLgQmcwflKguoWGJ8a/Gwqcumy/u0H7171+I9c9UutFCSNQTgO6E4p
         XReZbG47RiNYLudLZjYNFiSCL0QitMsBNPLwtDV0jd1Wf0mJw8Y+B2EkO7DVxkZSnYX6
         zGsikAim/KxW+keIeVa1EUFnR8CkHgGxUC3CgoYgyHm8AmssUnNmvcTpM9OEU3Gsu9zV
         C+ci/Txv1+QGicD4YEeaVLM5/1aLM11SJLrHW5hmEMnLBUHTGTMg9eakZDQyA8KkN2l3
         BZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738495232; x=1739100032;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7NLxMTJJXVCB0npGaaytcjoYcLNtMP3mWIpx11JvRY=;
        b=ojiU4YIEKXDolw9NllZ87EIyiwsa7sHcqR8txIf6F5Ifg+8E06+YkbuWwSaHK+E6Q7
         HKKToDVEfROmEO/+m5aLw0TE1o30WX6mJH1cNzV55a0y4oBu+Vat2An+lEGos2knV/zb
         P/JLUGjikn6DGr1n9MRVPJrLyEOa6nwNLvEqZPyDhyBg/rDUnfzlIXQ07wjPCwXFkFok
         See58Al8+xytNRWpC3UCZrSRGHUq9R4Lp1l3wLjFsCCvYku/6ZEJxoTjW2lwX3atfQ56
         Wb4Kc6frq9GJ34ubTTA7Zs5ufg4zZdoEejHoo9vPOpYURoKeVmDomx7KI3n3TyYb5UEW
         NKeA==
X-Gm-Message-State: AOJu0Yx03HXCbHFT/EFKLbdfHVFxblSDdyBo4At6poDk9eAPSYWLwFS4
	rpwn1uxp9IpOmwK103J8fLT64AoAKUXvbgWSy9or+2mKG2ML3FghgWIf+0Nh6xk2d/pBJrwUf7U
	g
X-Gm-Gg: ASbGncsiFpAmwNbcX+Eh2gCCGUQIpbXX5+g6xR7SYDsGixtpdGh5e6+XmINTPLRbwzv
	YFgWUorjZFK0v3NIfoYH6q7wwNhu78OTNkTLxw0vg4TEV0fS3frVNMDW9OOi9kF4dq5Ue5d370X
	cUU9eKp1prbf+xh4EQYBZ8YHZyFkMsqoEHGx7oECuUeShre8n0crM142HclWwvj0MJHHEMeyafy
	oXcUmHBVSmJrH6pzk8d2XGE2w6A/8R2AYtxu2K4CwY7mjUO4W1ffOS1KEZSQXH3crU1pEOZfaM3
	1NJSGhaEb1aQ26Or8Zf/
X-Google-Smtp-Source: AGHT+IHVObWQksZKr1rlfXfpOw+Jyeo9gBWVCAu2g72QJZsFszgYjTfB+QDlYY+p6xWCWv/i6KjjlQ==
X-Received: by 2002:a05:6a21:8dc8:b0:1e1:bd5b:b82a with SMTP id adf61e73a8af0-1ed7a61ced9mr32210008637.40.1738495231875;
        Sun, 02 Feb 2025 03:20:31 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cea77sm6320718b3a.150.2025.02.02.03.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 03:20:31 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id E80B6100399; Sun,  2 Feb 2025 01:20:30 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Feb 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Feb 2025 01:20:30 -1000
Message-Id: <20250202112030.E80B6100399@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 11:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210616

Branch: master

New this week: 0 CVEs

Removed this week: 3 CVEs
CVE-2024-57940 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57940 *
CVE-2024-57944 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57944 *
CVE-2025-21658 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21658 *

Full list:  Found 18 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 15
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

