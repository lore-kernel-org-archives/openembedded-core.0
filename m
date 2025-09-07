Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94973CA1013
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 11:49:18 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.17413.1757245756801741313
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 04:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MitZEdx1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b520c9c291dso1845762a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 04:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757245756; x=1757850556; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lVkzH60R7aeG3qVVy3+jYhWrAT36lWd3mlzUBZWa3s=;
        b=MitZEdx14hY04mnTMoeTwQQiSBDl9PK+OmKuy1CBV6j8z4y7ooDBD/bJNI9CFI8JUG
         kkgmQmtrihwhQ3lyeuIaObFTjX8PnSZgMP4aWygHlP16f3MPTZTrxYll2OcIWpQ4IS+Q
         Sw0D0SuZvp1I0BuRZhLsZZOQaqAQYu1NqVBqTSJrsleF16XWv2uowJHWpovRva6M4yRw
         yfjAjANES2o5+fq7if3DqO/9iSlNDrdMqzB6kCh1kL0LEAYDCBkor5UkYERUNvZ85wq2
         Tee612cgNb3Qs6BtGJaxoRLNy/7vSbcCIfigXOlSY/5SV7llR+CxrgG98/An3JIkxqLL
         ShlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757245756; x=1757850556;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lVkzH60R7aeG3qVVy3+jYhWrAT36lWd3mlzUBZWa3s=;
        b=kayIC1k11MzUn+zbpHoLvBqdy7MAvdALscfVCl1dUwUS1CePzzs9LxM4bSvz70NjRQ
         3o1pkwQr1Arj537B4Y5YJsd2vV3LlrsK5YljuFyql40qocBjGgTnQKHIlKUe/mjXLqmK
         YKc+VV4Qi5nUUyaC3jBGr4QYTNG210XAL6UyitqhRHCfGXxrLtfh7YlIOkvxH+XfBCf1
         4dsT6K9ccM7cwRKrfW1XqYd3F3N+qpEPEAPnfXOJgF6ZEcvbTryUZ822Flvu1ujUB703
         dzd8LG9s8QXwgMt3HB4pMUK4GppNn2ZyMDgNkJU649+x+qKPCtsARgTEjMYKJOqoUZhQ
         /WJQ==
X-Gm-Message-State: AOJu0YxjJ8s6J0N1U+WG40pIbNMEsW8KzYplCF0zvnl3is148B8CuVaf
	Cc8IyG2grepfGwyLxE3hnONVPSAclPLfkvjCANp08vfF7Cnv7jkMBAWNmmI8GZxZrKuxVWi3huk
	jnsLO1+A=
X-Gm-Gg: ASbGncsWSlh7smTENX1Svp9KpSiarwO0SNzvb6L7ZONhvxR6PG0g+fX2zylcJ88FObj
	5ZcSEL7NM961m2V08CxOECKFsehbVRaOSP784JNsaVc9xkQa6LjOZNzcHGvAsdmBhszXCQQSSMB
	qCmz5pofi6KcTgAwOJXG0smrKpnz1tggisNNnMEqjvdOZQ4DWITUCfrfkeWN3WyMIohugdq814k
	gV+nn3ETJSCbT90A8ViU9aLrceXc3LROngCchhgcm72WXImBLged3GPBaWNJieqSQ1UdCC6J7EG
	/i73gbFVBGYnrxdd581soAd/HTystu79FRV4GoCGGOCcLpmYavCIJadmTVHL9J5KA2PUB9fxBgF
	ngFGn7NquNSwImCOFGF6WuklzB2w=
X-Google-Smtp-Source: AGHT+IECk+ObMxXfpgeZ5oYEdr9ev3N7TJb3pziEhf6yynA7O/m41n1SIBP3cAmsJQOCY80P3qSgIw==
X-Received: by 2002:a17:902:ce89:b0:251:493c:43e6 with SMTP id d9443c01a7336-2516ef57cd4mr55729295ad.10.1757245755998;
        Sun, 07 Sep 2025 04:49:15 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0d881afasm153097475ad.47.2025.09.07.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:49:15 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 319E81002D9; Sun,  7 Sep 2025 01:49:15 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 07 Sep 2025 01:46:52 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  7 Sep 2025 01:49:15 -1000
Message-Id: <20250907114915.319E81002D9@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 11:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223051

Branch: walnascar

New this week: 0 CVEs

Removed this week: 8 CVEs
CVE-2025-32989 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32989 *
CVE-2025-32990 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32990 *
CVE-2025-53905 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53905 *
CVE-2025-53906 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53906 *
CVE-2025-5916 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5916 *
CVE-2025-5917 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5917 *
CVE-2025-5918 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5918 *
CVE-2025-8224 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8224 *

Full list:  Found 41 unpatched CVEs
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
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-2759 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-2759 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-3887 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3887 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-47183 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47183 *
CVE-2025-47219 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47219 *
CVE-2025-47806 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47806 *
CVE-2025-47807 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47807 *
CVE-2025-47808 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47808 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *
CVE-2025-8225 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8225 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  gstreamer1.0: 7
  grub:grub-efi:grub-native: 2
  qemu:qemu-native:qemu-system-native: 2
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  libxslt:libxslt-native: 1
  pulseaudio: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

