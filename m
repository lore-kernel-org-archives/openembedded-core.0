Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465EDC4345F
	for <webhook@archiver.kernel.org>; Sun, 28 Apr 2024 11:18:44 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.8133.1714303114891968061
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Apr 2024 04:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K05WmOrN;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ddda842c399so3553233276.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Apr 2024 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714303114; x=1714907914; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVGU2HWdEskAB9MhHVjVTLRgC4I4zQNXNyeYFUeswx0=;
        b=K05WmOrNb4CcZP/cgoSMosGchHwS3I+IVGvxUgfyysg8M+Sc/opiRlxlWx0owtamLr
         jRAypduysQNx2OBB7FnfXECBT9Br1lfxDNeG00JfHcQ9tTC4XAGsyt/gq29Mk+ZPNzDw
         3ESlmb96hA/1LmVUJMx4GS3Rvk6v8+/Sv/FVhhTrfUyGfGLmEFX9BxUbE87Ra04l991h
         j0lRAHurerTGh8RIpVD58/IPbzjUpwLY/21zoZFDDUiO01+oyX0D46n9P82lrY/vCfdB
         36uKUokbYJLxbB3086olYl/7pxCej+XT/cKOIyMugDQdRhFeE9cFYx4CNHhZnYMyw9+r
         j+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714303114; x=1714907914;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVGU2HWdEskAB9MhHVjVTLRgC4I4zQNXNyeYFUeswx0=;
        b=XgAFJ5HfNXec0JS1OyZJeVypbh6UH3s+5JbWJypoSFioiBU63Ji8ZKrVtK/m6VP1lR
         0km8DzdBhmLFb4B9WWsGWX94pa80/9hB5TC9Z6ROjI4EOP6ac2RFgn3FAIJGXjpSS0IM
         h7Uo2305NDgrUvdIKycf3VlvmfeHrwSsAd3jKDRxtJNV8GP2SmTzXkniIDjktaaeYY0H
         MoF5ltn0nkZPPywyJhGTST4RgUpg7lMhW/JFroVVIq17K5TtcFhpbJvCh9uvvSClCTyF
         lCfj0za+da6imfhp8ylMtfmdwdFrHFolRAfnvLpUwKfBaMj5BrGh9FTpHrlisnRH9hNE
         d/nw==
X-Gm-Message-State: AOJu0YxNPZyskwYR6+M6SiMszPFM+x7T+4JwJUJKOtPoKJ7sJ+1xClj7
	ZltW9vWSiUEbxvRfix/rH5vHMyCTGY+lovdtZP50FDnzWDgfXy4q6N4DgN2+7yhq5Q16qNO5nCC
	0a9c=
X-Google-Smtp-Source: AGHT+IEgz5cxrRnTDrGu8UbzJpq6vIwvkMHfuue0yt5yG+1qMwi2ELDTfE1U1D82ui4HQwox+RtbXw==
X-Received: by 2002:a05:690c:6d09:b0:619:c995:143a with SMTP id iv9-20020a05690c6d0900b00619c995143amr10056351ywb.12.1714303113680;
        Sun, 28 Apr 2024 04:18:33 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id a5-20020ac81085000000b00434a165d45asm9540519qtj.38.2024.04.28.04.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 04:18:33 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 2B3AA100156; Sun, 28 Apr 2024 01:18:32 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 28 Apr 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Apr 2024 01:18:32 -1000
Message-Id: <20240428111832.2B3AA100156@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Apr 2024 11:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198727

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 38 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6270 *
CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6356 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6536 *
CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7042 *
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0841 *
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-21803 *
CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23307 *
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24857 *
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24858 *
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24861 *
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *
CVE-2024-26596 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26596 *

Summary of CVE counts by recipe:
  linux-yocto: 29
  busybox: 4
  cpio: 1
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

