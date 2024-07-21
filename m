Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1873C3DA61
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 11:19:10 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.22884.1721560743293032814
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 04:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3Q9BPSSL;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.180, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-79f0e7faafcso206995485a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721560742; x=1722165542; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be52Pj3f4xnjHbQKwcdS9DADC/ouEPDMQdaGnz8+4pY=;
        b=3Q9BPSSLvBg5v9OWuN5tMRd52cN8BR+KD1dqz9SDoIorOz/XGDtqY7jER8Hec+D9L0
         PEMpKyIKX5oijnr0C0pj3MLCXWKfrKvAfVjHTlO6AJpkYNistShuB7X91w0mSngPcno+
         /S6jTk/4K/GqGmuGkK/zZMckP8aRMKqneoj0lswZi5JaRbax5MPvJRL+CdYfowXTm/+l
         0J5ZSMEgxiFGWO6OSu9OaPX+a+pPcgDL7hrL++022P2TSQeAY66Fz6oh90kaHeFN1rHG
         jaAmjC6Vc1t1jjhVgMtAf1PPN5o6Wbn8WN0tFxmBh/kQxq6/BujKoSvrw9mcNTvEZVpL
         BgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721560742; x=1722165542;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=be52Pj3f4xnjHbQKwcdS9DADC/ouEPDMQdaGnz8+4pY=;
        b=K5tbM7m3Hbv9sKpXYLgHEdbPBF3KZ8N/vSt4r4u2jllnF7TT+iY8XrX36WWG/Y7mez
         eBuBzFos6ka0iCwzNnXQOeTsvdkmvxBhTVQvkLnsl3oxAVutOLFdmt9Sk68k4zwUkaco
         JXpO/gUqEZ3lidwj04ULsn7E/RKmt0sMl5F5ZwZz/b3EzCfDU+ORC4a3g3c8PhKENamj
         IL58KQSa0mmPTf7YuHn481jt9pI4Y+fPa/Mtt4eNnMOmCeQMQig8FED7leq2/szws5lv
         D0E/M8hiSgo/x2z/c1TIAruPUHwvQKOUEfw7isDxbzhj0/fTDhM5jwtS0+hO8w8AnTFx
         wdCA==
X-Gm-Message-State: AOJu0Yyb9zKPhl5KqOI2Lm/jk1Hs7QDgusO64xb18Bg2iWz9Q5BIf0O3
	Dtt+Rl//FW8yZQ9ASP1EWuP11wqG9DeXzeMtClXdL+9XqYTmYcViT00RGIWxYtg0SEKGecBkZgF
	nAS0=
X-Google-Smtp-Source: AGHT+IFe81CIvHFjCUGRet/Gy6lvsdUHvrGyUsHAC9SfCe9jkuScTsnjWTNTv+yXoTdLPH0TuhDarQ==
X-Received: by 2002:a05:620a:4152:b0:796:842c:7808 with SMTP id af79cd13be357-7a1a65382f6mr516598885a.4.1721560742065;
        Sun, 21 Jul 2024 04:19:02 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a19909461bsm264814785a.129.2024.07.21.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 04:19:01 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 86ABF10038F; Sun, 21 Jul 2024 01:19:00 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 21 Jul 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 Jul 2024 01:19:00 -1000
Message-Id: <20240721111900.86ABF10038F@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 11:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202294

Branch: master

New this week: 3 CVEs
CVE-2024-35328 (CVSS3: 7.5 HIGH): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35328 *
CVE-2024-41007 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41007 *
CVE-2024-41009 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41009 *

Removed this week: 3 CVEs
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-14.1.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *

Full list:  Found 39 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-21803 *
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24857 *
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24858 *
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *
CVE-2024-26596 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26596 *
CVE-2024-26900 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26900 *
CVE-2024-26913 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26913 *
CVE-2024-26949 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26949 *
CVE-2024-26952 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26952 *
CVE-2024-27012 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27012 *
CVE-2024-27017 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27017 *
CVE-2024-35328 (CVSS3: 7.5 HIGH): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35328 *
CVE-2024-36288 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36288 *
CVE-2024-36971 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36971 *
CVE-2024-39472 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-39472 *
CVE-2024-41007 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41007 *
CVE-2024-41009 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41009 *
CVE-2024-41010 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41010 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *

Summary of CVE counts by recipe:
  linux-yocto: 34
  qemu:qemu-native:qemu-system-native: 2
  gnupg:gnupg-native: 1
  libyaml:libyaml-native: 1
  openssh: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

