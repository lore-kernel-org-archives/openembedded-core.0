Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96595E66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 11:02:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58841.1766314941970075213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 03:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qKsEsUTC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a1022dda33so25502495ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 03:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766314941; x=1766919741; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl1dkRVvPtKbh9PjhXtMvucFFzX3c13N8RVeq4e2LHU=;
        b=qKsEsUTCl9qxKkgoP3gd6cPoBYO1U0AFSYBksraz+0T5TawqROrY68I4PeG4WMQnez
         luW/V1zPXsFGwhYTO2HfRWkMby9oDCmjsKahBDWrYyVbCCYN2RUkWr+KDoX04hxADQ+9
         4S8NvWV615teJM71SBPpwsgfdeWrAk+EJbMHsvXRW/RWWyMRjsIl4gEWG0j23aqLBaOn
         qsEj52mgxrDfSIkdpDz/VKuwLE3ceXfB9wR2I6d6Ou4zI/6sk4dsuMzzaxyT7aiHmFjm
         kRqaNWwqiaPTdOCGGbGYGmZlvdKnmd+D6Hx/OZJNxFSqde0AkyoGORhOvF83QV3/Mce6
         ENKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766314941; x=1766919741;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl1dkRVvPtKbh9PjhXtMvucFFzX3c13N8RVeq4e2LHU=;
        b=iPGCjdTOHpvtmd2Xqnli2d+y7waF2TfDIJI7uN+96PcSdScpLK0eQxdP5pInQjBfvn
         effMpqAIBchLy6X8wlSesa25eagTLGzhMmw20ALEuTyYc3BKRRI24ZNA+dvG1xrWS5gH
         alCuXP0A+DVmcIvFmuod54B0MUm74I051NwYanE1craDWj1Y3skT5WUM4SWWGIwNnH64
         qy0ImMvIMnJuYOeveWOMb0ISHtfR/YDNeN0/bNVyB8+/wN8VdqtzdwBqWVLeEKeFTpDs
         tP5G3ZS2ytk3ZoawYIC8yqbNl3FBNySTcpKxw11l5HM4tyHvp1dMRfGxQEPWMB1nHqQr
         sMrg==
X-Gm-Message-State: AOJu0YxHpmzcn3qqsyoFFozmYVXou4sVWDibnq6Q2p+TG25WRnEySCs9
	UrtlFULa4jyAw/fXqU12WsX3NskegFa0/k+D3MvIB2p0pVUHJwBqbzTaZb68x4JzmTmO7t0WHmC
	Um/g0
X-Gm-Gg: AY/fxX5C+xvnL5ZBKJ5sPdmf9IzZCTw0fUZUaMuwF1iYg+MDUtB5Kc9SWFkcxTnhaZ/
	hMQmbJ60+cMmt0CcWCcgRcbq7Zo416GuAvUVRUKHlzgshlbNKFzmIK54446lbIiYtuv1KdeuqBN
	0rLp+rhSd7mgitz/d5PH93z1HcOXlaQL4Q1ru0vsDXJZne+HvJ6BJdlgJpHWVePiHir0hed8cpX
	Um7KmL8rz/6toS/5faWRJ9DROby0wWOzn9idbW6XvR6UipHOeqoNV5Woe2SjbMTTeeQ5KTO3iEe
	lVr7HmXb3U7GHOp1mW49X8Y5zyLkfq/8/RY5SbjPnZyeSa+sBfqpa4JEP0y6thTK32phcs3VhVJ
	F9r8/M4ssBw6Ow09o3IQ2+ojmMA71KHxmMOJ1bCMeQLZuvHbd2B4h1hNw6ca1lDiXogSJ9B3RMY
	lhRNexkd2hqe9YEIc=
X-Google-Smtp-Source: AGHT+IH4FFLlDjVlSWGQ46rTaJKoFe7ReIjN6vmx8olVD0W9pynobQok+uD36ilMNM8mANrcYkdDWg==
X-Received: by 2002:a17:902:f708:b0:298:efa:511f with SMTP id d9443c01a7336-2a2f283680cmr71906445ad.39.1766314941049;
        Sun, 21 Dec 2025 03:02:21 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec6bsm67412065ad.87.2025.12.21.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 03:02:20 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 07751100435; Sun, 21 Dec 2025 01:02:20 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 21 Dec 2025 01:00:02 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 Dec 2025 01:02:19 -1000
Message-Id: <20251221110220.07751100435@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 11:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228253

Branch: master

New this week: 3 CVEs
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *

Removed this week: 0 CVEs

Full list:  Found 24 unpatched CVEs
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
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libsndfile1: 2
  python3-urllib3:python3-urllib3-native: 2
  expat:expat-native: 1
  libpng:libpng-native: 1
  python3:python3-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

