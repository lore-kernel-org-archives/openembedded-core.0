Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BA5CA1013
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 11:02:38 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.16910.1757242948855399343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 04:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bA/boCRA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so2882293b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757242948; x=1757847748; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCzr8LwEP4lOpwcj9Vgnb4JENWzZx4VjLhtlyULeZEY=;
        b=bA/boCRAz1ncFZ75xiWcAClorZ3u4WsDFlf+6wb69CnViguYZ4IBTydfIuKx4tG0hD
         bUe0oC7iSUdtXmJ5CSg4rMUmWHYXvrORq+4ElKOkwu6TI8C0SH/R0Ult0U8C3BbHlH0J
         JElr0uveESCovYEV9R+9GhfkMGQ01Tx3wrqBWOMLNz4lTeXFZwO+paC95XECSXPysNNw
         btk48fxl6IkTVaP1MegWidDSJQiPmDPO+oDPH1TQTGglMd+Oa5flHGrHwZ24a6eGvR4/
         p2HJLoqLfswcDwQ7ZTg3Cnw87IE6Zc73gSAXBksI62az8PFTFR/At24VLCil+CrgRgUT
         lFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757242948; x=1757847748;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCzr8LwEP4lOpwcj9Vgnb4JENWzZx4VjLhtlyULeZEY=;
        b=ZXkVy9dAYk34MIKegGTMlfqIdiaetODSIWBk8koAajzwEF/yqe86gnslJlK1e83PpD
         bXJGf9WftOMej28dcOygQayDyAET9G3zXSQklN9drWgND/EjwJQVwDZesx1vUgVVa0FV
         GG+wVniTn2cYucYTv0dNE0XtRT6W3puj3bN4cD66NdRCW8QvxcSVTlmK/0LzJAf4CaEj
         7W/lIWRkOQAt3B6uz2jcMt1/UqvRX2QgcW06qe/s12SEvAQtRZKUbDqH9uvIeKDAiFHr
         eWP9OGBNvM/jhcnx5zxyDM/yGD8gEt00tZB4jXVAb6r7pKygIJj/YkVukK/I10FJiwZt
         bszQ==
X-Gm-Message-State: AOJu0YwDNb76HZrIFm09b8wR0bzFadvRC89irWSRJVxDn/u8PtLV9GHS
	uDrmjHJAtaW4+0zyurGm40lhlTjep8l3KBJc7eV3K7HZ1ARCEwAt5wNU7m8dWDgAfaMti0ir/1L
	IJIOx
X-Gm-Gg: ASbGnctEiaw8vE2/USccH2QmiL4BWGfizrhbgiI/gWNBEPVNH9hSM7/YjCTYo4etYr+
	F+lRUimQKtG1hSyZ7M8CRKZXIggt6non9wpOu6JMuP86j4OhWM4JM9qwBUp/n6PbTpSKk275I3I
	jOWwKFX3ctaI352gUU9pCQmGSbUaxNwpAp6Sik2emWofpRgj2wLISAYXIVMQCmHyZiTmNXLtH0g
	MVo+9pG9AZ/r8UviIA3mFnIfAee8sS0Qom/ErM3IN2AprfbnXeqs8iG92u25WPyaF6BfdAFwbaE
	3Jliq9TpXHI7W8THlBh3+aoY7gPj6NOBCTLjHF3RG5/z2pdZ84ANOxmwryNnQV27Za8m8v7On54
	92BLRXo6AZHeEWzoqjE4J5v0+4UNIciX0TmbVMw==
X-Google-Smtp-Source: AGHT+IGI3aunTCmZGYatRUKEIsoc8uGxUYpKbhd56OVIE2Qeq+DF0c0Qn4EZXtRIAbj73IrOw+yZ/Q==
X-Received: by 2002:a05:6a20:7f8f:b0:246:3a6:3e64 with SMTP id adf61e73a8af0-25346cc4dccmr6119379637.58.1757242947995;
        Sun, 07 Sep 2025 04:02:27 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4d96829a66sm22155328a12.6.2025.09.07.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:02:27 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 2CA481002D9; Sun,  7 Sep 2025 01:02:27 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 07 Sep 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  7 Sep 2025 01:02:27 -1000
Message-Id: <20250907110227.2CA481002D9@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 11:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223048

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 35 unpatched CVEs
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
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  sqlite3:sqlite3-native: 3
  grub:grub-efi:grub-native: 2
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1
  libxslt:libxslt-native: 1
  pulseaudio: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

