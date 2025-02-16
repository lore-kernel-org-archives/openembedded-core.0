Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0261C02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 11:20:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.27332.1739704823864549688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 03:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cK1LbTtG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c4159f87so45559745ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 03:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739704823; x=1740309623; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXzhxluw6pH2Pjzmkkwlz0EnzMk+qFhe+W/JEz142Pc=;
        b=cK1LbTtGhg4zelByWwly5SN2mlBGwCb6hNoP1DV/jQqziGKMm/tBSgtiQIJ5hfBQOt
         n2+IFueNXboyDv199go0RIYQl2PjNngYXFfPO6UQSeiqLiDYZAeHDDu+/ILPIHz+mZHy
         vHlteyRwJzuGhZVBtxXtyBIiXzNe6MzJMjlsC++lBgx7RwX+5IrE+0wQB/j6Pe+9H6g1
         Ql2Jkbu7qwLJiT6xmPLCyEHDR+EjOMudOEUTC/CLlDwmHUi6o8eSTwMdGD/ccanboFkL
         aOaxxDr3Jmw462gnaqPWAGuIqNpDQwKINJImxCNdhU5IKqtl74z9C0wU50PLqjri/Vwf
         gAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739704823; x=1740309623;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AXzhxluw6pH2Pjzmkkwlz0EnzMk+qFhe+W/JEz142Pc=;
        b=eWGhwdyexcGaNPTDlTCN6ZVeCqxp48n79Lf7SbUJJcCnBSBMJIHmFUgjZ7nnUXtZfA
         LxEphSFpl1asdJHiw/BQJQZ6k1e4Deo2KizDLLhaBZUmupRx6/nuwM2tXStKVGTDaKer
         C2cryeSIbnJAP49RifKuOXcKRPyaJ6tDaVIfWqmIycLi5OvhpGtsKLhGTjSMIxbL6+HF
         mW4VV1AerR9jYzxQ1F+tc/SlGJs6wAbxFaOEVnfo/gFq9o07lQHCtw2dbC2cROfCnSyB
         sqwTpNAWd6uftnw0UYPVDycQ+peI2zklnXU+J76wFqMXuLy51AtcVi8pP3A53FdAFTCi
         HdxA==
X-Gm-Message-State: AOJu0YzUvy6IIW5TUdIAkXZMP51vz1TjcJULlbTwfgyYUB0VuricPCSd
	LxLxXkCzZyXCph4+XYGZ6R81phlWt6vsaJpJI00zLQUmSTEsjhAImjVHxW0IxSZ4ewpGP5VaOV+
	n
X-Gm-Gg: ASbGnctPq3X4KKrZVdsmDg37sj+QRC39pLxH/VT8u1DWBBfzI1/aExtuS9SPYVldB29
	SA3Rv5pr9+C27qSv8EHoTBttGPV/FoKqXMRvDn3TsUJ9Aojus3bnCQMoz+rJSQGym2PTEizzOvG
	9tYDxc2i3Aoqu7OPOTqEH+quNu0scOKdBSA9TIO8rX7QnRMQPZWydwj1GHG5IH88N9g8fChtRBN
	gdJ9TNWlxy7/nucIeXZLY39wnjwzPXxcQ1dQIvsvg8R5WLdr18m/WNgpMN6/qnNqyOrP+wx8tcz
	5L1MsMMsNFghzv6MxGCI
X-Google-Smtp-Source: AGHT+IFPvow48jKNb45feJKuG9hBiqiH7V5/jCUxlagF9Z8UIy3GjTYeOzy5uSh94OsnQmEryAHi3Q==
X-Received: by 2002:a17:902:ec8c:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-221040bf834mr86384445ad.39.1739704822765;
        Sun, 16 Feb 2025 03:20:22 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545e39bsm55641405ad.124.2025.02.16.03.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 03:20:22 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id E46D6100399; Sun, 16 Feb 2025 01:20:21 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 16 Feb 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 16 Feb 2025 01:20:21 -1000
Message-Id: <20250216112021.E46D6100399@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211498

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 19 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3079 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
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
  linux-yocto: 16
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

