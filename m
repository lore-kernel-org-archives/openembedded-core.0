Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B608ACD128A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 11:19:24 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.73147.1712488760087946246
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Apr 2024 04:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lq1Knt8I;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.180, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-789f1b59a28so233779785a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Apr 2024 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712488759; x=1713093559; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoJ5hLCnkugoEQVluDlVq7P4fIKHTpclnOwotiUB2o4=;
        b=lq1Knt8IT/alJN6tEGFj5QwaWzlu7hp6It6Wi+qgdw8+mHmd6slcUDvgZQBtGghwQ6
         H/5+wtvnu9Q3PJiQwQTM0kn2KSAuSd4UfHwOYXZ9Gzv3Vv8ZyQQfLqcv1c5w7WZlvFY+
         RMAdY+PLq4CsNriIhEh5GOWTDRSmCm5QdsfB49jzSjS5CpEnRRUpoKnALs7gptpzRLr1
         PjHk39oGNqxUeC0mwEvnWStCHy6wRWVLkm2DTyrtQd0x7rlZKW6Syu1OqLoD6Ro0MSop
         3tcC0fATVOPueKNHhCip0ZEy2BPL6d+WUjNKtOGovkSEOu1sNYs1lugsTLIj6k1ibfzl
         ln9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712488759; x=1713093559;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OoJ5hLCnkugoEQVluDlVq7P4fIKHTpclnOwotiUB2o4=;
        b=wI+SytwHi0k4M2ocmUyHn4VCnI7cfTwlCRBECzMLw4Qi3mN1CFn+4tr1jXuMWoqo6n
         eOPSa+sXTzWFf/TZmILTyURCa59afv8dDpwqO4YzxLFPwOCpO8RK9WNtaM3pu86MAG/5
         7YU9GW8ehJpia1FBRRd7c9XB+5SeftwIdVxI4elVUaaPmaOxrK+VVpG+pF/KSRRQ0U9S
         MT2cr9R2tO0Aqe7+s+dmGE7O44LIHRI2wLjvHlrLuRpbb36hXsHfLT9gC1Antq6Zd5FS
         bPe2a64fRFsFfIiKjjyk0A/Gfl/lKFVi5wu7FHBiY1mAme9c8o+n3TLhOp/oecIAwsnb
         bIzQ==
X-Gm-Message-State: AOJu0YzZ+Ui5vYR+fvltAT12UmwcokTtWaCBy18uV6aNNczEKOAsS5O+
	gLebKc1raF9my9cePN+WA1OrAUMozS+0LMft+YD9m+ZUSZGWaf1x5fzoxnUFZLHuMz/ngfl5k3K
	U
X-Google-Smtp-Source: AGHT+IFz1RQekXPBUDRJkHjovXlK9NA+RfMwLXROp0dQTZccf5ALHC4qehuXXezZGJ9gTgGLEfw0SA==
X-Received: by 2002:a05:620a:2047:b0:78a:73a8:cb9c with SMTP id d7-20020a05620a204700b0078a73a8cb9cmr6603552qka.74.1712488758863;
        Sun, 07 Apr 2024 04:19:18 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id p20-20020a05620a113400b0078a45b214e8sm2206823qkk.83.2024.04.07.04.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 04:19:18 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 545EF1068E9; Sun,  7 Apr 2024 01:19:17 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 07 Apr 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  7 Apr 2024 01:19:17 -1000
Message-Id: <20240407111917.545EF1068E9@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Apr 2024 11:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197999

Branch: master

New this week: 21 CVEs
CVE-2014-4859 (CVSS3: 6.8 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-4859 *
CVE-2014-4860 (CVSS3: 6.8 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-4860 *
CVE-2019-14553 (CVSS3: 4.9 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14553 *
CVE-2019-14559 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14559 *
CVE-2019-14562 (CVSS3: 5.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14562 *
CVE-2019-14563 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14563 *
CVE-2019-14575 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14575 *
CVE-2019-14586 (CVSS3: 8.0 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14586 *
CVE-2019-14587 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14587 *
CVE-2022-36763 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36763 *
CVE-2022-36764 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36764 *
CVE-2022-36765 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36765 *
CVE-2023-45229 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45229 *
CVE-2023-45230 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45230 *
CVE-2023-45231 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45231 *
CVE-2023-45232 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45232 *
CVE-2023-45233 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45233 *
CVE-2023-45234 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45234 *
CVE-2023-45235 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45235 *
CVE-2023-45236 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45236 *
CVE-2023-45237 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45237 *

Removed this week: 0 CVEs

Full list:  Found 58 unpatched CVEs
CVE-2014-4859 (CVSS3: 6.8 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-4859 *
CVE-2014-4860 (CVSS3: 6.8 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-4860 *
CVE-2019-14553 (CVSS3: 4.9 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14553 *
CVE-2019-14559 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14559 *
CVE-2019-14562 (CVSS3: 5.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14562 *
CVE-2019-14563 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14563 *
CVE-2019-14575 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14575 *
CVE-2019-14586 (CVSS3: 8.0 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14586 *
CVE-2019-14587 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14587 *
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-36763 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36763 *
CVE-2022-36764 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36764 *
CVE-2022-36765 (CVSS3: 7.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36765 *
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
CVE-2023-45229 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45229 *
CVE-2023-45230 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45230 *
CVE-2023-45231 (CVSS3: 6.5 MEDIUM): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45231 *
CVE-2023-45232 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45232 *
CVE-2023-45233 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45233 *
CVE-2023-45234 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45234 *
CVE-2023-45235 (CVSS3: 8.8 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45235 *
CVE-2023-45236 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45236 *
CVE-2023-45237 (CVSS3: 7.5 HIGH): ovmf:ovmf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45237 *
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
  ovmf:ovmf-native: 21
  busybox: 4
  cpio: 1
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

