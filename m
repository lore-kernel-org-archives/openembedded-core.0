Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342C6CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 15:18:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45679.1782141506550403004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 08:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DY767Tbo;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4629d80fa08so4408011f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782141505; x=1782746305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/44BioZ0+A6s2wDoGY2ySrX6m3zDS2ofks8quTG9rH4=;
        b=DY767TboJv21EPcTpTOXkAA8FCsmd084HGJvt3+TqLAheeZxKHk4TYsESmFauhf3Qv
         dFF+m+HysNtoHf0JokiqODr2QB2f1tNeG8bj+iBiWLVQyACxlAilodZAm7Dso0RR3SuA
         cq/9EiMjJQzpX9hPWp4TR5Fz7SEVfiCBa4FXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141505; x=1782746305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/44BioZ0+A6s2wDoGY2ySrX6m3zDS2ofks8quTG9rH4=;
        b=qjjvtxBemL9S/Y/SGMlcX+G9xHAJW4LT1HT0klRYntNwi+M17xB0PK185Upu3JdXBH
         zWcXR+yNLapgTtJgqguq/EoLfsD9j62xIDgyGzSfWxi9PLjnSHKo7c4mrzH0u5jYy52l
         8IPZKGYWXjm7xZ0pK2QAMz+uT1xEb2n2L0F+Tf6E/cl7E8bFMg6MUCdW/43RnJhuAJlf
         bXVTj4hjxkMg4thRNh5H/+Hy+zdmIYe474DpbTPzf3KCwn2TXAxkJ/iInRzrPBqp7Ga0
         SFhSr+yHWVZh3K61io4GkUvQNGxn0IL6JudkYU/qEbXvS0L5wjAJAAf9Lnkc9kBzZjXL
         JmVA==
X-Gm-Message-State: AOJu0YznB5SBrURCI97mofO1AHNMQ/A4XbodEcbWN707wrI2Kziiw++s
	7MbyUwE/f/Wr823leT6LhtVGRJ5CRMPG5NdQG8mj4x2wpROrF88cLJM7Z+0try1bywhIwnCgvuC
	vZChn
X-Gm-Gg: AfdE7ckxcyo+MG7jCqpn/qnlxlO30yRPT+IU2fQL3/m3P9kC2ndKogWKgH6MlUHKNwP
	jTj2BKsTAjdhlc5tpH4EPep4zgp7+StlbyevyqnOVUjhT611qzWkGVzovPH1oA0lmGKIMeILO+t
	//PA+zYfNQtlohXSolQP/NnoorzM6L2pgBFpevqq1YXeIe5DQQ2Nm/xaJkgo88vnE/JCAHBPvNT
	3Rs5wC+N1XU92gbJ9+PLipGLwSppjM2+kPoqGMNx4W9frpT/OH9JB0O1jR27lr/idJ3vCPu8B7Y
	07WcT0HWSg0k3ciazOmh0aEb49A2djJv/34EKfEO+dwoVLAH90dBXVkMLtEeHpgv5rr70GPfdFf
	Pv5UkX4XWJTaIbixGGjs6RjL3/wzmsQyVFamX2DUqiLp0LHfJrBY6qOa1qOHtXQkA6uuDmG7kZl
	41iMnek5y6WNzWCWo50+yFAY7qlWftXGdYmDTUDs+FPQ0xib5suy7O6ZS9I1vkt3OYu+VeMo0UM
	VbQ82al8EhpTtuS
X-Received: by 2002:a5d:5f47:0:b0:460:3234:293e with SMTP id ffacd0b85a97d-46509690d26mr23929714f8f.41.1782141503835;
        Mon, 22 Jun 2026 08:18:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466667882f7sm27730184f8f.21.2026.06.22.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:18:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for wrynose on Mon Jun 22 15:49:27 2026
Date: Mon, 22 Jun 2026 17:18:08 +0200
Message-ID: <20260622151809.1336050-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239309

Branch: wrynose

New this week: 29 CVEs
CVE-2025-15661 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15661 *
CVE-2026-12003 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12003 *
CVE-2026-3195 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3195 *
CVE-2026-3196 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3196 *
CVE-2026-45961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45961 *
CVE-2026-45991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45991 *
CVE-2026-46331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46331 *
CVE-2026-50261 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50261 *
CVE-2026-50262 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50262 *
CVE-2026-50264 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50264 *
CVE-2026-52908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52908 *
CVE-2026-52909 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52909 *
CVE-2026-52910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52910 *
CVE-2026-52911 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52911 *
CVE-2026-55199 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55199 *
CVE-2026-55200 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55200 *
CVE-2026-56131 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56131 *
CVE-2026-56132 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56132 *
CVE-2026-56403 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56403 *
CVE-2026-56404 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56404 *
CVE-2026-56405 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56405 *
CVE-2026-56406 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56406 *
CVE-2026-56407 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56407 *
CVE-2026-56408 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56408 *
CVE-2026-56409 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56409 *
CVE-2026-56410 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56410 *
CVE-2026-56411 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56411 *
CVE-2026-56412 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56412 *
CVE-2026-8461 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8461 *

Removed this week: 53 CVEs
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2026-1502 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1502 *
CVE-2026-23679 (CVSS3: N/A): libusb1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23679 *
CVE-2026-27145 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27145 *
CVE-2026-3039 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3039 *
CVE-2026-3087 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3087 *
CVE-2026-31688 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31688 *
CVE-2026-3298 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3298 *
CVE-2026-33811 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33811 *
CVE-2026-33814 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33814 *
CVE-2026-34180 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34180 *
CVE-2026-34181 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34181 *
CVE-2026-34182 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34182 *
CVE-2026-34183 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34183 *
CVE-2026-34978 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34978 *
CVE-2026-34979 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34979 *
CVE-2026-34980 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34980 *
CVE-2026-34990 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34990 *
CVE-2026-3592 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3592 *
CVE-2026-3593 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3593 *
CVE-2026-39314 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39314 *
CVE-2026-39316 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39316 *
CVE-2026-39817 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39817 *
CVE-2026-39819 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39819 *
CVE-2026-39820 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39820 *
CVE-2026-39823 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39823 *
CVE-2026-39825 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39825 *
CVE-2026-39826 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39826 *
CVE-2026-39836 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39836 *
CVE-2026-42499 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42499 *
CVE-2026-42501 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42501 *
CVE-2026-42507 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42507 *
CVE-2026-42764 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42764 *
CVE-2026-42766 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42766 *
CVE-2026-42767 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42767 *
CVE-2026-42768 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42768 *
CVE-2026-42769 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42769 *
CVE-2026-42770 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42770 *
CVE-2026-45445 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45445 *
CVE-2026-45446 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45446 *
CVE-2026-45447 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45447 *
CVE-2026-47104 (CVSS3: N/A): libusb1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-47104 *
CVE-2026-4786 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4786 *
CVE-2026-5713 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5713 *
CVE-2026-5946 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5946 *
CVE-2026-5947 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5947 *
CVE-2026-5950 (CVSS3: N/A): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5950 *
CVE-2026-6019 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6019 *
CVE-2026-6100 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6100 *
CVE-2026-6276 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6276 *
CVE-2026-7383 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7383 *
CVE-2026-9076 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-9076 *
CVE-2026-9150 (CVSS3: N/A): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-9150 *

Full list:  Found 542 unpatched CVEs
CVE-2011-3374 (CVSS3: N/A): apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3374 *
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2236 *
CVE-2024-43802 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43802 *
CVE-2024-47850 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47850 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-52005 (CVSS3: N/A): git:git-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52005 *
CVE-2025-14876 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-14876 *
CVE-2025-15366 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15366 *
CVE-2025-15367 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15367 *
CVE-2025-15661 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15661 *
CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-50422 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-69693 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69693 *
CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71074 *
CVE-2025-71289 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71289 *
CVE-2025-71306 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71306 *
CVE-2025-71308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71308 *
CVE-2025-71313 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71313 *
CVE-2025-71315 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71315 *
CVE-2026-0665 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-0665 *
CVE-2026-11822 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11822 *
CVE-2026-11824 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11824 *
CVE-2026-12003 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12003 *
CVE-2026-2243 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2243 *
CVE-2026-23327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23327 *
CVE-2026-23328 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23328 *
CVE-2026-23371 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23371 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23442 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23442 *
CVE-2026-23459 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23459 *
CVE-2026-2625 (CVSS3: N/A): rpm-sequoia https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2625 *
CVE-2026-27447 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27447 *
CVE-2026-28529 (CVSS3: N/A): cryptodev-linux https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28529 *
CVE-2026-29518 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-29518 *
CVE-2026-3099 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3099 *
CVE-2026-30997 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30997 *
CVE-2026-30998 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30998 *
CVE-2026-30999 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30999 *
CVE-2026-31420 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31420 *
CVE-2026-31501 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31501 *
CVE-2026-31560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31560 *
CVE-2026-31589 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31589 *
CVE-2026-31694 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31694 *
CVE-2026-31696 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31696 *
CVE-2026-31697 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31697 *
CVE-2026-31698 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31698 *
CVE-2026-31699 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31699 *
CVE-2026-31700 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31700 *
CVE-2026-31701 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31701 *
CVE-2026-31702 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31702 *
CVE-2026-31703 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31703 *
CVE-2026-31704 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31704 *
CVE-2026-31705 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31705 *
CVE-2026-31706 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31706 *
CVE-2026-31707 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31707 *
CVE-2026-31708 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31708 *
CVE-2026-31709 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31709 *
CVE-2026-31711 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31711 *
CVE-2026-31712 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31712 *
CVE-2026-31713 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31713 *
CVE-2026-31714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31714 *
CVE-2026-31715 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31715 *
CVE-2026-31716 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31716 *
CVE-2026-31717 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31717 *
CVE-2026-31718 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31718 *
CVE-2026-31719 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31719 *
CVE-2026-31771 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31771 *
CVE-2026-31777 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31777 *
CVE-2026-31786 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31786 *
CVE-2026-31787 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31787 *
CVE-2026-3184 (CVSS3: N/A): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3184 *
CVE-2026-3195 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3195 *
CVE-2026-3196 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3196 *
CVE-2026-3276 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3276 *
CVE-2026-33845 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33845 *
CVE-2026-34000 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34000 *
CVE-2026-34002 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34002 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-34757 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34757 *
CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-37555 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-37555 *
CVE-2026-3832 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3832 *
CVE-2026-3833 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3833 *
CVE-2026-40930 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40930 *
CVE-2026-40962 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40962 *
CVE-2026-41035 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41035 *
CVE-2026-41066 (CVSS3: N/A): python3-lxml:python3-lxml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41066 *
CVE-2026-41079 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41079 *
CVE-2026-41080 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41080 *
CVE-2026-41411 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41411 *
CVE-2026-41989 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41989 *
CVE-2026-41990 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41990 *
CVE-2026-42307 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42307 *
CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *
CVE-2026-43009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43009 *
CVE-2026-43022 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43022 *
CVE-2026-43042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43042 *
CVE-2026-43045 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43045 *
CVE-2026-43053 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43053 *
CVE-2026-43088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43088 *
CVE-2026-43095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43095 *
CVE-2026-43115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43115 *
CVE-2026-43131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43131 *
CVE-2026-43174 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43174 *
CVE-2026-43191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43191 *
CVE-2026-43204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43204 *
CVE-2026-43228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43228 *
CVE-2026-43284 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43284 *
CVE-2026-43299 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43299 *
CVE-2026-43308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43308 *
CVE-2026-43310 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43310 *
CVE-2026-43311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43311 *
CVE-2026-43326 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43326 *
CVE-2026-43344 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43344 *
CVE-2026-43349 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43349 *
CVE-2026-43350 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43350 *
CVE-2026-43391 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43391 *
CVE-2026-43443 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43443 *
CVE-2026-43490 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43490 *
CVE-2026-43491 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43491 *
CVE-2026-43492 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43492 *
CVE-2026-43493 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43493 *
CVE-2026-43494 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43494 *
CVE-2026-43495 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43495 *
CVE-2026-43496 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43496 *
CVE-2026-43497 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43497 *
CVE-2026-43499 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43499 *
CVE-2026-43500 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43500 *
CVE-2026-43501 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43501 *
CVE-2026-43502 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43502 *
CVE-2026-43503 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43503 *
CVE-2026-43617 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43617 *
CVE-2026-43618 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43618 *
CVE-2026-43619 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43619 *
CVE-2026-43620 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43620 *
CVE-2026-44431 (CVSS3: N/A): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-44431 *
CVE-2026-44432 (CVSS3: N/A): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-44432 *
CVE-2026-44656 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-44656 *
CVE-2026-45130 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45130 *
CVE-2026-45186 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45186 *
CVE-2026-45232 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45232 *
CVE-2026-45834 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45834 *
CVE-2026-45835 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45835 *
CVE-2026-45836 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45836 *
CVE-2026-45837 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45837 *
CVE-2026-45838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45838 *
CVE-2026-45839 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45839 *
CVE-2026-45840 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45840 *
CVE-2026-45841 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45841 *
CVE-2026-45842 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45842 *
CVE-2026-45843 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45843 *
CVE-2026-45844 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45844 *
CVE-2026-45845 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45845 *
CVE-2026-45846 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45846 *
CVE-2026-45850 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45850 *
CVE-2026-45930 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45930 *
CVE-2026-45945 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45945 *
CVE-2026-45961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45961 *
CVE-2026-45963 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45963 *
CVE-2026-45986 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45986 *
CVE-2026-45987 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45987 *
CVE-2026-45988 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45988 *
CVE-2026-45989 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45989 *
CVE-2026-45990 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45990 *
CVE-2026-45991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45991 *
CVE-2026-45993 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45993 *
CVE-2026-45994 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45994 *
CVE-2026-45996 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45996 *
CVE-2026-45997 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45997 *
CVE-2026-45998 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45998 *
CVE-2026-45999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45999 *
CVE-2026-46000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46000 *
CVE-2026-46001 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46001 *
CVE-2026-46002 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46002 *
CVE-2026-46003 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46003 *
CVE-2026-46004 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46004 *
CVE-2026-46005 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46005 *
CVE-2026-46006 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46006 *
CVE-2026-46007 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46007 *
CVE-2026-46008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46008 *
CVE-2026-46009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46009 *
CVE-2026-46010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46010 *
CVE-2026-46011 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46011 *
CVE-2026-46012 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46012 *
CVE-2026-46014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46014 *
CVE-2026-46015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46015 *
CVE-2026-46016 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46016 *
CVE-2026-46017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46017 *
CVE-2026-46018 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46018 *
CVE-2026-46019 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46019 *
CVE-2026-46020 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46020 *
CVE-2026-46021 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46021 *
CVE-2026-46022 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46022 *
CVE-2026-46023 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46023 *
CVE-2026-46024 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46024 *
CVE-2026-46025 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46025 *
CVE-2026-46026 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46026 *
CVE-2026-46027 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46027 *
CVE-2026-46028 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46028 *
CVE-2026-46029 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46029 *
CVE-2026-46030 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46030 *
CVE-2026-46031 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46031 *
CVE-2026-46032 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46032 *
CVE-2026-46033 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46033 *
CVE-2026-46034 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46034 *
CVE-2026-46035 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46035 *
CVE-2026-46036 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46036 *
CVE-2026-46037 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46037 *
CVE-2026-46038 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46038 *
CVE-2026-46039 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46039 *
CVE-2026-46040 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46040 *
CVE-2026-46041 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46041 *
CVE-2026-46042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46042 *
CVE-2026-46043 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46043 *
CVE-2026-46044 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46044 *
CVE-2026-46045 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46045 *
CVE-2026-46046 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46046 *
CVE-2026-46047 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46047 *
CVE-2026-46049 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46049 *
CVE-2026-46050 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46050 *
CVE-2026-46051 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46051 *
CVE-2026-46052 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46052 *
CVE-2026-46053 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46053 *
CVE-2026-46054 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46054 *
CVE-2026-46056 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46056 *
CVE-2026-46057 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46057 *
CVE-2026-46058 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46058 *
CVE-2026-46059 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46059 *
CVE-2026-46060 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46060 *
CVE-2026-46061 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46061 *
CVE-2026-46062 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46062 *
CVE-2026-46063 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46063 *
CVE-2026-46064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46064 *
CVE-2026-46065 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46065 *
CVE-2026-46066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46066 *
CVE-2026-46068 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46068 *
CVE-2026-46069 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46069 *
CVE-2026-46070 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46070 *
CVE-2026-46071 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46071 *
CVE-2026-46072 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46072 *
CVE-2026-46073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46073 *
CVE-2026-46074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46074 *
CVE-2026-46075 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46075 *
CVE-2026-46076 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46076 *
CVE-2026-46077 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46077 *
CVE-2026-46078 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46078 *
CVE-2026-46079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46079 *
CVE-2026-46080 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46080 *
CVE-2026-46081 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46081 *
CVE-2026-46082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46082 *
CVE-2026-46083 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46083 *
CVE-2026-46084 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46084 *
CVE-2026-46085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46085 *
CVE-2026-46086 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46086 *
CVE-2026-46087 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46087 *
CVE-2026-46088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46088 *
CVE-2026-46089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46089 *
CVE-2026-46090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46090 *
CVE-2026-46091 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46091 *
CVE-2026-46093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46093 *
CVE-2026-46094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46094 *
CVE-2026-46095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46095 *
CVE-2026-46096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46096 *
CVE-2026-46097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46097 *
CVE-2026-46098 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46098 *
CVE-2026-46099 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46099 *
CVE-2026-46100 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46100 *
CVE-2026-46101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46101 *
CVE-2026-46102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46102 *
CVE-2026-46103 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46103 *
CVE-2026-46104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46104 *
CVE-2026-46105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46105 *
CVE-2026-46106 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46106 *
CVE-2026-46107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46107 *
CVE-2026-46108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46108 *
CVE-2026-46109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46109 *
CVE-2026-46110 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46110 *
CVE-2026-46111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46111 *
CVE-2026-46112 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46112 *
CVE-2026-46113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46113 *
CVE-2026-46114 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46114 *
CVE-2026-46115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46115 *
CVE-2026-46116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46116 *
CVE-2026-46117 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46117 *
CVE-2026-46119 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46119 *
CVE-2026-46120 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46120 *
CVE-2026-46121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46121 *
CVE-2026-46122 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46122 *
CVE-2026-46123 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46123 *
CVE-2026-46124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46124 *
CVE-2026-46125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46125 *
CVE-2026-46126 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46126 *
CVE-2026-46127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46127 *
CVE-2026-46128 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46128 *
CVE-2026-46129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46129 *
CVE-2026-46131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46131 *
CVE-2026-46132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46132 *
CVE-2026-46133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46133 *
CVE-2026-46134 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46134 *
CVE-2026-46135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46135 *
CVE-2026-46136 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46136 *
CVE-2026-46137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46137 *
CVE-2026-46138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46138 *
CVE-2026-46139 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46139 *
CVE-2026-46140 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46140 *
CVE-2026-46141 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46141 *
CVE-2026-46142 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46142 *
CVE-2026-46143 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46143 *
CVE-2026-46144 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46144 *
CVE-2026-46145 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46145 *
CVE-2026-46146 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46146 *
CVE-2026-46147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46147 *
CVE-2026-46148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46148 *
CVE-2026-46149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46149 *
CVE-2026-46150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46150 *
CVE-2026-46151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46151 *
CVE-2026-46152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46152 *
CVE-2026-46153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46153 *
CVE-2026-46154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46154 *
CVE-2026-46155 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46155 *
CVE-2026-46156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46156 *
CVE-2026-46157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46157 *
CVE-2026-46158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46158 *
CVE-2026-46159 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46159 *
CVE-2026-46160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46160 *
CVE-2026-46161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46161 *
CVE-2026-46162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46162 *
CVE-2026-46163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46163 *
CVE-2026-46164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46164 *
CVE-2026-46165 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46165 *
CVE-2026-46166 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46166 *
CVE-2026-46167 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46167 *
CVE-2026-46168 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46168 *
CVE-2026-46169 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46169 *
CVE-2026-46170 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46170 *
CVE-2026-46171 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46171 *
CVE-2026-46172 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46172 *
CVE-2026-46173 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46173 *
CVE-2026-46174 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46174 *
CVE-2026-46175 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46175 *
CVE-2026-46176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46176 *
CVE-2026-46177 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46177 *
CVE-2026-46178 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46178 *
CVE-2026-46179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46179 *
CVE-2026-46180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46180 *
CVE-2026-46181 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46181 *
CVE-2026-46182 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46182 *
CVE-2026-46184 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46184 *
CVE-2026-46185 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46185 *
CVE-2026-46186 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46186 *
CVE-2026-46187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46187 *
CVE-2026-46188 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46188 *
CVE-2026-46189 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46189 *
CVE-2026-46190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46190 *
CVE-2026-46191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46191 *
CVE-2026-46192 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46192 *
CVE-2026-46193 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46193 *
CVE-2026-46194 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46194 *
CVE-2026-46195 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46195 *
CVE-2026-46196 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46196 *
CVE-2026-46197 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46197 *
CVE-2026-46198 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46198 *
CVE-2026-46199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46199 *
CVE-2026-46200 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46200 *
CVE-2026-46201 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46201 *
CVE-2026-46202 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46202 *
CVE-2026-46203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46203 *
CVE-2026-46204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46204 *
CVE-2026-46205 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46205 *
CVE-2026-46206 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46206 *
CVE-2026-46207 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46207 *
CVE-2026-46208 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46208 *
CVE-2026-46209 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46209 *
CVE-2026-46210 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46210 *
CVE-2026-46211 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46211 *
CVE-2026-46212 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46212 *
CVE-2026-46213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46213 *
CVE-2026-46214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46214 *
CVE-2026-46215 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46215 *
CVE-2026-46216 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46216 *
CVE-2026-46218 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46218 *
CVE-2026-46219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46219 *
CVE-2026-46220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46220 *
CVE-2026-46221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46221 *
CVE-2026-46224 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46224 *
CVE-2026-46225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46225 *
CVE-2026-46226 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46226 *
CVE-2026-46227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46227 *
CVE-2026-46228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46228 *
CVE-2026-46229 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46229 *
CVE-2026-46230 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46230 *
CVE-2026-46231 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46231 *
CVE-2026-46232 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46232 *
CVE-2026-46233 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46233 *
CVE-2026-46234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46234 *
CVE-2026-46235 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46235 *
CVE-2026-46236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46236 *
CVE-2026-46238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46238 *
CVE-2026-46240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46240 *
CVE-2026-46241 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46241 *
CVE-2026-46242 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46242 *
CVE-2026-46243 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46243 *
CVE-2026-46244 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46244 *
CVE-2026-46245 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46245 *
CVE-2026-46252 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46252 *
CVE-2026-46273 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46273 *
CVE-2026-46274 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46274 *
CVE-2026-46275 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46275 *
CVE-2026-46276 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46276 *
CVE-2026-46279 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46279 *
CVE-2026-46280 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46280 *
CVE-2026-46281 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46281 *
CVE-2026-46282 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46282 *
CVE-2026-46283 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46283 *
CVE-2026-46284 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46284 *
CVE-2026-46285 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46285 *
CVE-2026-46286 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46286 *
CVE-2026-46287 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46287 *
CVE-2026-46288 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46288 *
CVE-2026-46289 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46289 *
CVE-2026-46290 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46290 *
CVE-2026-46291 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46291 *
CVE-2026-46292 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46292 *
CVE-2026-46293 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46293 *
CVE-2026-46294 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46294 *
CVE-2026-46295 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46295 *
CVE-2026-46296 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46296 *
CVE-2026-46297 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46297 *
CVE-2026-46298 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46298 *
CVE-2026-46299 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46299 *
CVE-2026-46300 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46300 *
CVE-2026-46301 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46301 *
CVE-2026-46302 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46302 *
CVE-2026-46303 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46303 *
CVE-2026-46304 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46304 *
CVE-2026-46306 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46306 *
CVE-2026-46307 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46307 *
CVE-2026-46308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46308 *
CVE-2026-46309 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46309 *
CVE-2026-46310 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46310 *
CVE-2026-46311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46311 *
CVE-2026-46312 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46312 *
CVE-2026-46313 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46313 *
CVE-2026-46314 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46314 *
CVE-2026-46315 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46315 *
CVE-2026-46316 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46316 *
CVE-2026-46317 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46317 *
CVE-2026-46319 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46319 *
CVE-2026-46320 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46320 *
CVE-2026-46321 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46321 *
CVE-2026-46322 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46322 *
CVE-2026-46323 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46323 *
CVE-2026-46324 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46324 *
CVE-2026-46330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46330 *
CVE-2026-46331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46331 *
CVE-2026-46332 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46332 *
CVE-2026-46333 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46333 *
CVE-2026-46483 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46483 *
CVE-2026-46727 (CVSS3: N/A): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46727 *
CVE-2026-47162 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-47162 *
CVE-2026-47167 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-47167 *
CVE-2026-4873 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4873 *
CVE-2026-48864 (CVSS3: N/A): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-48864 *
CVE-2026-48914 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-48914 *
CVE-2026-50219 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50219 *
CVE-2026-50256 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50256 *
CVE-2026-50257 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50257 *
CVE-2026-50258 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50258 *
CVE-2026-50259 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50259 *
CVE-2026-50260 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50260 *
CVE-2026-50261 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50261 *
CVE-2026-50262 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50262 *
CVE-2026-50263 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50263 *
CVE-2026-50264 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50264 *
CVE-2026-50292 (CVSS3: N/A): libinput https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50292 *
CVE-2026-5201 (CVSS3: N/A): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5201 *
CVE-2026-5222 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5222 *
CVE-2026-5223 (CVSS3: N/A): cargo:cargo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5223 *
CVE-2026-52858 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52858 *
CVE-2026-52859 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52859 *
CVE-2026-52860 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52860 *
CVE-2026-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52904 *
CVE-2026-52905 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52905 *
CVE-2026-52908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52908 *
CVE-2026-52909 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52909 *
CVE-2026-52910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52910 *
CVE-2026-52911 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52911 *
CVE-2026-5435 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5435 *
CVE-2026-54411 (CVSS3: N/A): libpam https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-54411 *
CVE-2026-5450 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5450 *
CVE-2026-55199 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55199 *
CVE-2026-55200 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55200 *
CVE-2026-5545 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5545 *
CVE-2026-56131 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56131 *
CVE-2026-56132 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56132 *
CVE-2026-56403 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56403 *
CVE-2026-56404 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56404 *
CVE-2026-56405 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56405 *
CVE-2026-56406 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56406 *
CVE-2026-56407 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56407 *
CVE-2026-56408 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56408 *
CVE-2026-56409 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56409 *
CVE-2026-56410 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56410 *
CVE-2026-56411 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56411 *
CVE-2026-56412 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56412 *
CVE-2026-5673 (CVSS3: N/A): libtheora https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5673 *
CVE-2026-5704 (CVSS3: N/A): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5704 *
CVE-2026-5773 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5773 *
CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5928 *
CVE-2026-6238 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6238 *
CVE-2026-6253 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6253 *
CVE-2026-6429 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6429 *
CVE-2026-6732 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6732 *
CVE-2026-6844 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6844 *
CVE-2026-6845 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6845 *
CVE-2026-6846 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6846 *
CVE-2026-7009 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7009 *
CVE-2026-7168 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7168 *
CVE-2026-7210 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7210 *
CVE-2026-7774 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7774 *
CVE-2026-8328 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8328 *
CVE-2026-8376 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8376 *
CVE-2026-8461 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-8461 *
CVE-2026-9149 (CVSS3: N/A): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-9149 *
CVE-2026-9669 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-9669 *

Summary of CVE counts by recipe:
  linux-yocto: 415
  expat:expat-native: 16
  vim: 11
  xserver-xorg:xwayland: 9
  python3:python3-native: 8
  curl:curl-native: 7
  rsync:rsync-native: 7
  ffmpeg: 6
  qemu:qemu-native:qemu-system-native: 6
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 5
  libsoup: 5
  glibc: 4
  cups: 3
  gnutls:gnutls-native: 3
  libgcrypt:libgcrypt-native: 3
  libsndfile1: 3
  libssh2:libssh2-native: 3
  cargo:cargo-native: 2
  libpng:libpng-native: 2
  libsolv: 2
  python3-urllib3: 2
  sqlite3:sqlite3-native: 2
  xserver-xorg: 2
  apt: 1
  avahi: 1
  cairo:cairo-native: 1
  cryptodev-linux: 1
  gdk-pixbuf:gdk-pixbuf-native: 1
  git:git-native: 1
  libinput: 1
  libpam: 1
  libtheora: 1
  libxml2:libxml2-native: 1
  perl:perl-native: 1
  python3-lxml:python3-lxml-native: 1
  rpm-sequoia: 1
  ruby:ruby-native: 1
  tar: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

