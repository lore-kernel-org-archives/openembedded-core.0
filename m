Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5246CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 11:47:30 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.17221.1760269649326496941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 04:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v21dfsH6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso3130419a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 04:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760269648; x=1760874448; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRXpgVi8LPqazmE1K3dm7wH8qJjrn7sIgeFwJUL71/8=;
        b=v21dfsH6fWtatuOREdNV8WRGTT9Yg+OkZJ+QxAuTPP9FW1enqMj7mXzwayNQANBjiP
         zoOiJNEDqh32yf7PFNbVSLyLG5u7hsHeUaf4eyxC3N6eIpYAQiJAkk6eRVEp7B1Nu3w0
         5E9eCqOnEAqsb+dE/ZlHrwnGqcaFfgpk/4uR5Su4nVK4RQaJvoj4YlHAqc3SydERea7b
         5ooCeQdrCTfeT5SAzF5JejctnDYQuI3//3QKhblLaBC+lO6UjbQycBxCl47I1gFYrhDG
         QCekBucpCSrSTzvbdGE1csO/54iHTpcLTHGdQPxQprFGjDyHJDXwdbTjrnlVxT7lcoCW
         /Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760269648; x=1760874448;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRXpgVi8LPqazmE1K3dm7wH8qJjrn7sIgeFwJUL71/8=;
        b=qhRLXievjpLsXif1Oj3ZUESJwS5iU1MNeNIXFTh46CmZho07Xd2FvxH/CeNqmZPc+a
         SrYBBBnrqaoh1qV/4KxXEqnr3l/eUBWsPSgAAukgJPogfeCOETfbXsSfGdITRvQ6Vrm9
         6a6sFjIRLUXemB/0Ifv2mdeltM+Qiso4xen5rxsSyrB8rSl18ZIA04Ip11NZeVobvjef
         zS/kVVMZB1/YhZRtoMX1WRnok9reNkqF3ervPwKNlreFEGtbYRm0kAeXWt5VY0GlREuS
         HXJcbMmdegjy2wbmyWXSwEjRhtHB4aZh+raAvCUH21BS2/5YTDSQwToJBdhEqFyf94eW
         +52w==
X-Gm-Message-State: AOJu0YwFcWgrZckvxvgN1pUd6Kp/FInjKjX0QCbcmdbZ7i+l/laugX2m
	OXbdLDdkA4RXy4AGfRq5mBGMGmd6VjUYsh8YBvWZN8vmIu1w5h9LuWP4BmlXNCKXPiV+EDd0xI4
	57CQkwyg=
X-Gm-Gg: ASbGncvAObAXAFBdevOxZ+xKrVLYm3g2/O3BSaTdmNoL9otknenn8+ZKmpdPfnm0IxP
	2usnd24OubIGip4bm/t2xxeMpTWJr3BoTfoEw6CBOV6BkAfvKtDWLY9/RAPTy5B+0sr8dz7/JPP
	72w7kA3dS5zRSP3vMAIcCZP65Je47CYCokft0B8AA9Df8nt3WL4EKgrIoaqlMykNjY1fsTDv2J8
	hGgqa1Gx72iijHR9aO/Ufpf6rcmRIo8wlCK9golp8P7y3HzWwNqM2Sv4i2E1mr0owX9gSqGoCRe
	e8DTg9pPSBbFFKcAqb4A4S+AcvDMERtmF5WFxQcGP2HFl48+eabObsvb9CQGzEoebUeD7s6P7Ec
	Vbk2zMXkE/qjSLFo++9dV7nMIZCi1kQ9avB+uGqyoccQ1Dg==
X-Google-Smtp-Source: AGHT+IGCtUXGSmuPdTvzLOrOB0xqFXgGmyG5GHlYD8F9BRbwbvNuyL7XXuCOZeFPgmozyhlRfmxSnA==
X-Received: by 2002:a17:90b:1b42:b0:32d:17ce:49de with SMTP id 98e67ed59e1d1-33b510ff459mr24062737a91.4.1760269648461;
        Sun, 12 Oct 2025 04:47:28 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b62657166sm8686512a91.11.2025.10.12.04.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 04:47:28 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id A17921003D1; Sun, 12 Oct 2025 01:47:27 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 12 Oct 2025 01:45:03 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 12 Oct 2025 01:47:27 -1000
Message-Id: <20251012114727.A17921003D1@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 11:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224734

Branch: walnascar

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
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
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  ghostscript: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  busybox: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

