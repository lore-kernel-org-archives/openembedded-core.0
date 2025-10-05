Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5583CAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 11:02:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.8633.1759662154478097811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 04:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ixrxa57j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7811a5ec5b6so3687771b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759662154; x=1760266954; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwSF+B2Qw7QGAjmo/YSBe1cua9r0a3RGjAL2ArjvhFY=;
        b=ixrxa57jYN876tefo8a9G1KfxtlgAMzjyLkTfQN6nC2R60TRJ2l6DlxIm7pSQEBU3I
         rv/DvJUht2txCmfi/fGR09ibWLFKJqhC3lyJGLbuqd3cvbg40C3GgQna5m+PTSxjadcd
         2oxvyF8lNouXmeX/duqnDtal2U4lx9diAM8y3OC6zo6M5duKWRLqzqu8Isw4T5W7YvXK
         tfHNDjjQNKSut9dSmg8eaEL1tHxPpmhQ3i+N38rJ43r02QOcyBQAfbjCibH7qjU+1vRw
         IyP/h/fBsQAOYZyhb5q51m5VVMvBSPjbpBbk5s9Db+G57Y5zfUFy76frskFuMEjSV2Q1
         tNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759662154; x=1760266954;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AwSF+B2Qw7QGAjmo/YSBe1cua9r0a3RGjAL2ArjvhFY=;
        b=U5ZoVCF+ScyGafvs7rgC+7vQA1/bteUPQT/0ZNoYBkReD8ZBQh7Ii5P9SIh6hm8KaW
         7Cyw+XndO9ZGBswhckfyHpgFFdAurcLTnXwrEIheyeHduKWvA3qzsizh9Rxphh/AB9ka
         kIb+LGSS4qbFR3Hv6KpNNdbD5yNzZ7Jn6y3034vOTAfHNA8RWOA+HdkHLhCij2qpwpd9
         BQ804Nj6e5xvv5El6fpMwDdf2k2FjJuvnjTcx0+n1l4cRyI93MyUmAbQfWAmVKaIzj2a
         pIydyZzAVt7pc/FAwmcQ3TJf4FDqSuWC5eJQelLALRIen5MtyLqphPBqfwErIZVlWuiz
         wrqg==
X-Gm-Message-State: AOJu0Yxt0k8gPysUp6He2UTN9+4gwiDN5AFwe/C9V+skWw6k7nkoUk7y
	CLjubbFJVLXmGQlzhSJHb5I9Ajv0sH68Fn+8jRZLgIcrEq/+HQFVPpZ8XnWf5ChiK+qD/Au2N7L
	h2DkAbHo=
X-Gm-Gg: ASbGncsur7OaUtuMdOtWSD21OjypHf5sSa4HXPWwLTVPvf+qXEJ+yMQqXcgm8spt8cC
	xJ9DYOlxafHaQo0Men3w38wknVyc9IIouxmglt1wwmk5lFBA/LX3a3kb4sPTjuyG9rXyQCK83tS
	z0iyGc5UufXPpcC7TP9JmsyK2DSVqmGnQxcqjheBupJhmW1GPDrdTXXi8L4ku6CcTkZwmA73VcX
	MStdFcrWslRRMeknjO0D3/7IY3PMWL3rSBd0+IUJ/Dib6HiOSIrFtScP2coQMzI/mqI6v63pQGZ
	C4qMqy6eIXf5xO3fKFSHdgfmEh0yo/07UaBNNqSz7ufAF36B1UGv0ab47toGG92cVYTk/F8/D1+
	n64PsaPccH8U7EwcLd1dk1Z1qrN25/uDayDpkhP+yMLXjid0sCMAazZ2IPoE5Yg==
X-Google-Smtp-Source: AGHT+IH8M5A+IqN9NpIs9lz1EpocnWA7f7VSQzeL47TRde7dFck4lmOKOKO7amNmbbe/Z/CM/IViQg==
X-Received: by 2002:a17:903:4405:b0:274:506d:7fcc with SMTP id d9443c01a7336-28e8d00a48amr181337435ad.6.1759662153515;
        Sun, 05 Oct 2025 04:02:33 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b844fsm100475005ad.69.2025.10.05.04.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 04:02:33 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 73F6B1003DE; Sun,  5 Oct 2025 01:02:32 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 05 Oct 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  5 Oct 2025 01:02:32 -1000
Message-Id: <20251005110232.73F6B1003DE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 11:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224433

Branch: master

New this week: 3 CVEs
CVE-2025-11081 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11081 *
CVE-2025-11082 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11082 *
CVE-2025-11083 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11083 *

Removed this week: 6 CVEs
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Full list:  Found 27 unpatched CVEs
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
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-11081 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11081 *
CVE-2025-11082 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11082 *
CVE-2025-11083 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11083 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  sqlite3:sqlite3-native: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  busybox: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

