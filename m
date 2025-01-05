Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485E4E77197
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 11:20:33 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.36505.1736076026934581048
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jan 2025 03:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VX0lWcIa;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.41, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dd16e1cfa1so117579786d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 03:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736076026; x=1736680826; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3PHGTHnMTYtC8j/6RMczlrL9TpZYi+H/TFKMWdRV4c=;
        b=VX0lWcIaO37999aTfHeZ3islHnfSVHuHzX+tSKkd9o3TLjtjSscTXoU7dt2HtDuniw
         1sheqvaJrpy4RVFi342kvoDkCq/5OCkmsurhGyDfl09kTUWVWpRp2MUvy/ScIyz50Ked
         J1j883JaIf1KAGcraK7B1+2FmJ3n1s5hfLQuz0YEHeBBELQ4Sp8+ix8Ph+h6mkJMcYO/
         0IFBYv6gEVGKt4NSBo3QaOzmx4aLxg8lID173o9GDzysg9yDol4QOfLPyuM0iDHXpMUn
         AYRXiViQwYhWAxSroYMFwSVeXYeLaMdNfCcJaEn65RG+jbgEXOYGsRMuNuscjJNWZDq0
         AvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736076026; x=1736680826;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3PHGTHnMTYtC8j/6RMczlrL9TpZYi+H/TFKMWdRV4c=;
        b=SWjOVM7tv11GN4VA7ZErfmr7hhp/n51jtbV/M/GLIACHxV7RSZESUv0nrG117BxWaj
         +t4io5f/IP0WYn1/q5pvPWq012fTfmtk13z4Jx3NE+EpXYAJ1l2WRF7oC/bQBBdTUIwi
         esKyKruKH0o7x6DoagfoBRpHEVClCWOEKG8yyRx7z89Gyxmd1sugvJtWTsMB/F7TiXfA
         cHysfh0FwHQlfvaMpt6maIKruAx2ycleJL1CpvvRwi6OwgmGXa72uvSPI9hnvH2cbzRh
         tUCySG9IhjV12gYit+1hlfWmmP4ceG9PwRql0UI6hIWL07LpZt9vNziKKECFbcDPUJ/K
         us1g==
X-Gm-Message-State: AOJu0YzH+faY/6zY3esww1dSc17t4ekt20tXJRt13ZBMK/YlxnCCBiSG
	jEM58lt0FGr64hyep4qClo1vcQocweOujxjtvKQ/MHxJIhJLCjOl9UKm4W1haqQKFhBiQn8adl1
	b
X-Gm-Gg: ASbGncs0uSQWQ3vZOQvLIMGcmnCsu7vmqwgg4mHcneYN7tRxde4M2E8iLa6HuUTGJmJ
	pDzh/xOc8HPbU5HgAF0zjojTdZ9iQSv4quIQ9rjvMrBJWfpOupvNM5RntNALrkV/oT0EKi+gF7E
	0O/vk97kUdqmL1tuU6PhedA8dkiM9VV99Q2B8tkMb3m6YSHdGRXjmfbjv0ZODdZ0M3xTVsPsvRx
	oVZFMAZnPKD9CwKXhwthxtNh8gg6I6IPsESfky226w09ECYdJ4eEOqtUAECdw==
X-Google-Smtp-Source: AGHT+IG62FxNS6UVdhOGp63wxG/xG5rjVpAy7CXxX3Io4NsbewhcajczZOtxDgxbiPUcXpha1p24ZA==
X-Received: by 2002:a05:6214:1316:b0:6d8:8ca0:a7 with SMTP id 6a1803df08f44-6dd23397e65mr883217506d6.30.1736076025764;
        Sun, 05 Jan 2025 03:20:25 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddc5b6049bsm26875066d6.79.2025.01.05.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 03:20:25 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 389671003FB; Sun,  5 Jan 2025 01:20:24 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 05 Jan 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  5 Jan 2025 01:20:24 -1000
Message-Id: <20250105112024.389671003FB@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 11:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209415

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 18 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
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
  linux-yocto: 15
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

