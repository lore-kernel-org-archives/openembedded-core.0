Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E480E63F38
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:12:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15303.1771229530640583867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d+QUAU8P;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362507f396so2775176f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 00:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771229528; x=1771834328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5D1faByFjfV9H3I4gsUDMhkcJO7IA9MC7cGdN+xp6bo=;
        b=d+QUAU8PuoDYZrRDOW4l6FtaBKkxEMTFZ1LYwBK2HkH8njB5o2bBuiI5RJvjkTflo4
         JncYF3RDLu/yZ8btQwOs7UjhkhGc6kA4kw4ZY47g7orfWyN6LF4kKv66g8x1OLzJdxo3
         y1hpul6+Ad8xYRfxVrTc1Ih31mugtkMGFD27M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771229528; x=1771834328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D1faByFjfV9H3I4gsUDMhkcJO7IA9MC7cGdN+xp6bo=;
        b=EzwrYBZ5Bl+0hNsR8OY5Mk/zssR6GGf8Pr99MNyYW0hbXTLS6/eJEiaOUdws6UvHdG
         M5ziWTSCl3lAuYgDMV4XgYQzaYerw7eT1Vlcr0AKZiMqpuzCPH+4ZVrDo1B5YfYA78x6
         VUh5aRP+dzZHchpMA7MNTy9L043HJpN0Lw7bRXs1TWQInWBHoFTVfWZGefUEck67H1vD
         7+mhFS9mqsZqYrt7XuWIjPGhmTMjAL/FXjc86L3mMYHjbPegHM7bBZj7rBq5E9fWoc7Z
         KxvIkkO8p+3gltYdeBaFijKZHd4d+Q4b+VMZWKbYmd8QoJ3Re6iiqOSzop0FPPCdVf5L
         dFAg==
X-Gm-Message-State: AOJu0YwYSjbaHgJSlK3S1lzJIQWwNoN9JS/Eb6cDebe6vh6lCyj8uI+Y
	a5EYghru7U0MN04JvrO9NTbLy2/8ksVYXkCKQ+zudVeRMdZ0kbQSzyDvCZ8KgLe7alTU7kKnftG
	fXZI+
X-Gm-Gg: AZuq6aJoWlWf7zSzIdLUzjlVG7F63amhc1VziYDq6LezVd1pEGrrVZpDNH0F/OuSY+X
	BolRFuSu/xbvk1GKc1zJa+OEDBqPJ9EIQ1xGkz80ksGcxQcJpOFrpvDIT+P9bjGZEdxdCVyxHHl
	jTWAu60wrdvw+QmNrHXK045ZjH4DAvvGqdbojy2stGCl1qjprLMN71HBX03fKSAdNyQnoeRIELh
	pHXQKHwAyaygs6Tb1FMwvaBMlq2CFONWV9sXhGlV0Io//BWa7bjP2IqHaRfIepQ7whOHysBqBeS
	d461BnnbJGNmpnBrUtrpl7+c/DbhKcE3LPMqoYkz158f6vNuubodsYY98Tui179fvJQhJplNWQI
	teEYNFlTNmxaoQgIKqk8PhfZzw+PUYNtruqNNTny5OTn6AgRKxbpfP5x7N+IosUwChYxjIL1fAi
	Zk25hVP2KWZs5h/5pV+Of2rrCyfSC1TAiC95PnNn0gmBCQ2y9YPTYwZt1zCXAUkkG7bZcBA3+nH
	WhSmRVsniCsxAzHEmGJIvpU/FPRj6C67c2rIhJR
X-Received: by 2002:a05:6000:4284:b0:437:6bcd:77f8 with SMTP id ffacd0b85a97d-43797917f4fmr20399874f8f.38.1771229528106;
        Mon, 16 Feb 2026 00:12:08 -0800 (PST)
Received: from localhost.localdomain (2a02-8440-2507-120f-34e9-13d6-3b07-65ac.rev.sfr.net. [2a02:8440:2507:120f:34e9:13d6:3b07:65ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm25066365f8f.31.2026.02.16.00.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:12:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Subject: OE-core CVE metrics for whinlatter on Sun Feb 15 19:34:51 2026
Date: Mon, 16 Feb 2026 09:10:45 +0100
Message-ID: <20260216081043.2293215-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231183

Hello,

I'm sending this CVE mail update for whinlatter which was missing for a few
weeks.

Since I'm sending this manually, I might as well provide a status update:
* I will be taking over this weekly send from Steve (Thank you again Steve!)
* If you have question/comments/ideas about these mails, don't hesitate to ask me!
* For this particular branch, a lot of the new CVEs have their fixes in the
  branch pending review: https://lore.kernel.org/openembedded-core/cover.1770968514.git.yoann.congal@smile.fr/t/#u

Branch: whinlatter

New since Sun 04 Jan 2026 (6 weeks ago): 32 CVEs
CVE-2023-51791 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51791 *
CVE-2023-51793 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51793 *
CVE-2023-51794 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51794 *
CVE-2023-51795 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51795 *
CVE-2023-51796 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51796 *
CVE-2023-51797 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51797 *
CVE-2023-51798 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51798 *
CVE-2025-11187 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11187 *
CVE-2025-15467 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15467 *
CVE-2025-15468 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15468 *
CVE-2025-15469 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15469 *
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-25468 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25468 *
CVE-2025-25469 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25469 *
CVE-2025-56226 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-56226 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-61732 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61732 *
CVE-2025-66199 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66199 *
CVE-2025-66476 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66476 *
CVE-2025-68121 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68121 *
CVE-2025-68160 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68160 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2025-69418 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69418 *
CVE-2025-69419 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69419 *
CVE-2025-69420 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69420 *
CVE-2025-69421 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69421 *
CVE-2026-22795 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22795 *
CVE-2026-22796 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22796 *
CVE-2026-24401 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24401 *
CVE-2026-25646 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25646 *

Removed since Sun 04 Jan 2026 (6 weeks ago): 16 CVEs
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-13836 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-13836 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-58436 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58436 *
CVE-2025-61915 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61915 *
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Full list:  Found 53 unpatched CVEs
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
CVE-2023-51791 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51791 *
CVE-2023-51793 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51793 *
CVE-2023-51794 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51794 *
CVE-2023-51795 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51795 *
CVE-2023-51796 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51796 *
CVE-2023-51797 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51797 *
CVE-2023-51798 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51798 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-11187 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11187 *
CVE-2025-15467 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15467 *
CVE-2025-15468 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15468 *
CVE-2025-15469 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15469 *
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-25468 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25468 *
CVE-2025-25469 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25469 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-56226 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-56226 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-61732 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61732 *
CVE-2025-66199 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66199 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *
CVE-2025-66476 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66476 *
CVE-2025-68121 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68121 *
CVE-2025-68160 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68160 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2025-69418 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69418 *
CVE-2025-69419 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69419 *
CVE-2025-69420 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69420 *
CVE-2025-69421 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69421 *
CVE-2026-22795 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22795 *
CVE-2026-22796 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22796 *
CVE-2026-24401 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24401 *
CVE-2026-25646 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25646 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  openssl:openssl-native: 12
  ffmpeg: 10
  avahi: 5
  libsndfile1: 3
  go:go-binary-native:go-cross-x86-64-v3:go-runtime: 2
  busybox: 1
  libpng:libpng-native: 1
  python3-urllib3:python3-urllib3-native: 1
  qemu:qemu-native:qemu-system-native: 1
  vim: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/
(Note, this link does not display whinlatter right now, a fix in currently being developed)

