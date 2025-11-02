Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD40ACCF9E3
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 11:49:34 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8569.1762084167204372605
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 03:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P0/gElNK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29558061c68so8200705ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 03:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762084166; x=1762688966; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UchWhtL7RL6Zhyou0lKsQjz0Gw7N+qYUMXU8N22UOOY=;
        b=P0/gElNKA/je5Tx5ILIKORpAx5cLJLlSF+SzylCOmP1mlJQF/f2McOkEHeatOfjFWA
         4EHlKnyLFdw34g47clZQx6PVgi2ppxus4H6z9TeMyAsoNfCrR+nhFBJdCm05HJNMfenu
         XJJLDrXNTXpMDH2LxdbX9tQE4KH/K9p2l6PQL/wrTNE4kYJmlPnlCvs8CWgpctCbghPC
         iGVM7IFgFitYTaaNSvmvHo33nUFKpmT1eaH1faMYUWz8g6yJp/3KOZxPmeqckZ2/sw2l
         Ti/XfqmgpC2mhqGBxy8Zy0ZQ5qlo49pXwZ3QFgcLzPiUHyDrDepIjalovwhRtDjZK1a0
         eGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762084166; x=1762688966;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UchWhtL7RL6Zhyou0lKsQjz0Gw7N+qYUMXU8N22UOOY=;
        b=cP20VIfbBHSEqQmhysI7sI8qHGV3XUx9SPcJwfbijTpt9GCbSryX0VejsoJjS0lQq3
         tge3Ces0XD6rMZd3xyqZ95/1qtKCOqfUDZ76hmeoFzfI/QCCDQ+ftw+2bg9DyX2FrrA3
         ut92fcldeqyrF4teOsGJm1Hg26llq7N3A2AS0OaNff/kt7blf4Rdzb5OHsTlIlG2+akx
         SS55Ieh+GBqF8lM7g+31sRt1o/jhZjRoOTiPuzntEs5GnvNI9GY68z/eS5BKMEQjHzWm
         huvuZQ1tEgRFNxR8rwjxsulUsePStcqPVZr37ETAREYgXq7mn+MWawTCoqxlgMsikSoT
         jPRg==
X-Gm-Message-State: AOJu0YwFZEnWEqV5ym70N6ahZqAUS7XgiiUI2G4Zh2TYg6TvXDo/SNkZ
	MQ1bbqKrTMfuWcU2u4PdTRuQjmt9Te9NTHSLMXTMbStPGmdEwpM/iGxlmHKRERvgvjxLVGv+C8E
	GrCZEBr8=
X-Gm-Gg: ASbGnctGHB9i4s4uAxydEgCGOpzRDd/Io6n6/PAqIDNQ/akMH0lpUQ8whEMJvKk0y96
	1Yofs1UDiBbkPaRhrTLG+2xph94Mtw2iBJBuRpvf01i9/jxnwBrg11wNS2DzbJuWNhgN6e2zB4u
	zaGv7fiYzC0c38avWDg3RMkwuGRVDUJSWFPPO6i8tpzgSRSTVBxvCgA5f3rnpDBlQ0NnMWfq7or
	kGig+Mj6lIyn+HVVaH1kwxsgi6h4AFgl96krdK4PPkzfWk+h2mGQvJwXd0AX+X6xmTmGSjWgq5l
	zyBq48tk99y+i4vIhHlPAFQFkC/OIO58X+cZiD5fy7KgUn/aen7qBABAfDHNvKnq7VJP7AiW4WQ
	jfQLtVWQx0vfFt0lyTNe4qSpnS3Ie9Zn6McL0HWsTHuPYxgz4H1vNxs+63K9i5kf7c2hdOqvBoz
	cpxKONd8qxNAnDIIc=
X-Google-Smtp-Source: AGHT+IEagww2fQunRXspKBx/g2vKijNCmq0nkqx/O0qmk3tIyItaKudtjfxz1hADoJDHNltWF8Ap1Q==
X-Received: by 2002:a17:902:ecc5:b0:27e:dc53:d239 with SMTP id d9443c01a7336-2951a48fb0bmr129136215ad.35.1762084166299;
        Sun, 02 Nov 2025 03:49:26 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269beedfsm82756585ad.106.2025.11.02.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 03:49:25 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id A09F51003DE; Sun,  2 Nov 2025 01:49:25 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 02 Nov 2025 01:46:59 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Nov 2025 01:49:25 -1000
Message-Id: <20251102114925.A09F51003DE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 11:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225576

Branch: walnascar

New this week: 7 CVEs
CVE-2024-58074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58074 *
CVE-2024-58093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58093 *
CVE-2024-58094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58094 *
CVE-2024-58095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58095 *
CVE-2024-58096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58096 *
CVE-2025-21752 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21752 *
CVE-2025-21807 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21807 *

Removed this week: 1 CVEs
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Full list:  Found 42 unpatched CVEs
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
CVE-2024-52560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52560 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58015 *
CVE-2024-58074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58074 *
CVE-2024-58093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58093 *
CVE-2024-58094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58094 *
CVE-2024-58095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58095 *
CVE-2024-58096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58096 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21709 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21709 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21752 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21752 *
CVE-2025-21807 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21807 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *

Summary of CVE counts by recipe:
  linux-yocto: 34
  ghostscript: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  busybox: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

