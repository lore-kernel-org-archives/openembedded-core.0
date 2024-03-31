Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB17CD1284
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 11:19:04 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.15339.1711883939862619391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 04:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xUBH8eLW;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.172, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-789ddcd57f4so218672885a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711883939; x=1712488739; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVCgXlVDPMlAEk8m3V+nok8MZyHtl8NrY12D4bln5Is=;
        b=xUBH8eLWSZB4sENfdESMvwVnoQ7TAkRI2cU2Uy2pBy8r4FmB5tRwZNn+2b7z1If/0C
         WSCccEfuYrhe2bpC6kK3oV+ra+t1yUAM9Ln8uF4dhJMoSe8gHs/WZ4yHxUDLuaGxModk
         Zoku7G18wtOg8Ik6MOYtocTiB0t6EMtkUAFP4UjmPS40fAIQlo5Ps2DVtAVKdWq6QR5U
         yTg5Xq0Di7BfRFKrs1guc0zxHxfnJh64VZFMzUcJPfZkmd5CYMfZFQb6vXitRrAHGqq0
         vNrYGkjNsKeOi/6ipFelZkDzOTI55pEtZFyC9XtiyfMyg2mcNhd0QWZ6xH4gnwWJCnZm
         1vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711883939; x=1712488739;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVCgXlVDPMlAEk8m3V+nok8MZyHtl8NrY12D4bln5Is=;
        b=Sg4ipD70nfoD8D6rAy4tapsk/wHz2XYZzefFjWB3RQJxoayMbAnSm5faZw49H7EGOs
         tT23wg25WjLEtf+GN0XACHl8sQYkQd3CldRF1b9HA/8LrYu/eVDSDVNtoBBO9VVTorwT
         KirgwAl/9QeenBAyrmZCBsVdyHSVDM7jQTkWWEddFfsyBV4Oyx3vTnlsFIRgTaj5aHfh
         ho00Wr8i0M132pe64tESb4cgcVcFyqsNn0xzGniVzEh1QX4XqsViLQh2i5fCX4Muse+z
         D87wkb+jiKrRbWyLQ33M0G5zVE9upRnpKJfun9FmCitOAv80uKyBOsvu+mMEY1bn6KLq
         H31g==
X-Gm-Message-State: AOJu0YzkrV4lspmJuReDjHszMZLcgTbeahnc8H/ic2GjS75Ojawa86U8
	WgQitNw4K5Jj9skSW14BarkHQieP34zQkUAcAL229zJB7kgy4a/Z/kWpw8FykTFD3kp2C8R54C5
	Qs0w=
X-Google-Smtp-Source: AGHT+IExhpFWViwVj1GZo+OXl5EXnCKkIosKUhJdgTtp6FiLxjW2uQE3SjAz837E0pp0SuLQHpPQog==
X-Received: by 2002:a05:620a:1d9d:b0:789:ea39:51e3 with SMTP id pj29-20020a05620a1d9d00b00789ea3951e3mr7050921qkn.18.1711883938768;
        Sun, 31 Mar 2024 04:18:58 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id y1-20020a37e301000000b0078bdd8fa570sm513297qki.106.2024.03.31.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 04:18:58 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 4603F1068D9; Sun, 31 Mar 2024 01:18:57 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 31 Mar 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 31 Mar 2024 01:18:57 -1000
Message-Id: <20240331111857.4603F1068D9@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 11:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197658

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 37 unpatched CVEs
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

Summary of CVE counts by recipe:
  linux-yocto: 28
  busybox: 4
  cpio: 1
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

