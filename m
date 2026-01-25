Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C9BE63C9F
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 11:02:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36937.1769338929279836282
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 03:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SpsVLolY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a2ea96930cso22577925ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 03:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1769338928; x=1769943728; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jB/IjPDul0YDxNtPiTWOMU0TC/ATf+ZI1baDjm0FPjY=;
        b=SpsVLolYmRUAOgpKkQaZlsmYZZOELKlk0ijrkbp4/LOnoWh5nkPwFbdP4rik+24c2Y
         WC/gZ21Pxn61DvD3sjPdsbdZhfKnswHf6Bki0mnc7+mOCueGZRdAM1upIAcSJXUGnpz6
         ntr0NSES0rrL1qX4+Os4EDvsyoB0n2I+8qUh/MBdrLFLK88OP/HDen//coklNiQTXGIW
         msQzx6w7UD5LZFgbs/sgVApAixfVa44Lq5rCFnsiIBPhb8q14zI6fOoBKzY4OIm3rOi0
         6w/D9SCBydsiKHrlCL+ec57je2Q7w+wXj9DghOyaXscuaz3oltQ5DrGnxAUfKnLBJp7z
         k48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769338928; x=1769943728;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jB/IjPDul0YDxNtPiTWOMU0TC/ATf+ZI1baDjm0FPjY=;
        b=NEIgvSNJwpMTjJOkP4nD9jxWHL3KWY54rqH3Q9ss0j+veenkQf6B3DbT8gg5ML5Z7U
         h7yjavOEZ0Oa9dTvMnUD6O/PNeqGBnArxsDtjWTQLgc0OqybrOL+VDz5yYEA++qZpzx6
         M8elgdibR2CQmYjEcRV8eJV0jBddRFMUbrT6O0RlYQTg15GVvrucLqgbwmcDy1FV30JG
         QQiAv7075WT1zgqpnh1/MMaTupntwgh0ejVzB3sBQnLf7nLPfGBIk3ZNgpSg2FafIYG3
         rIg/28Tx7kpf9VZY8inkkgirE8dOBuDe674Chj25hPHsk6/yBU8550gh7uuIUseuXv7v
         5OPw==
X-Gm-Message-State: AOJu0YzLZCZ9J1/slaBeBAQZik0o/QkSmf6VqHahgERAHw4MWPj2lBby
	RnQ+aLCOiTIURhXibt/Nj+rso1ta3CjxYPT1uEXaTWTG0io7BOfA+xcz6B3Xk8cyRDyaU77YC9i
	/j28F
X-Gm-Gg: AZuq6aIyL0grcuLjZg4/LIa6fz42emOwtFypIs9svYT6RNpDs97PncAjmk/vDVeJ6lO
	eMxjpExQZ+iEiRuJIb+I/EjL0W2yTGder31T/YcjUupDlXVbIxVRH3owx2MivLiGFhglIjNT469
	qHFBL+Nlc8l8sl0BmKn6y+RO5Y3EbPklg59H6woQzmshLbBH70q9mXcX4xVmmrOsKfebt8dFIbR
	+d8YB8lFbTivuiekM++FGhjgifl2cqUtXV55QgJSfstfVI3qcTEcP5GsoTldqjo40xTUF4uupJU
	RrKlXAPBEpFsHw3ikXjc0fYZMrRU1wXlkrhPcBrbFBfQDGaTsbwvB4c1h3VtGPFVgYnZkGLCspb
	rWcUnj/buBFpb0CgpjXJR0vldhvxLXlWdJ1w98wEgCkFbRYfyVvVr57rCB+d9+sRk7G8YVShcGv
	RkeI8+MF+F0u3MKXY=
X-Received: by 2002:a17:903:380d:b0:2a0:ccb9:2f0a with SMTP id d9443c01a7336-2a84522e53fmr10149535ad.8.1769338928361;
        Sun, 25 Jan 2026 03:02:08 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdb322sm64290125ad.89.2026.01.25.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:02:07 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 6CE951003EF; Sun, 25 Jan 2026 01:02:07 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 25 Jan 2026 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 25 Jan 2026 01:02:07 -1000
Message-Id: <20260125110207.6CE951003EF@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 11:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229933

Branch: master

New this week: 1 CVEs
CVE-2025-56226 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-56226 *

Removed this week: 1 CVEs
CVE-2026-21441 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-21441 *

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
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-56226 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-56226 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2026-0915 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-0915 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  ffmpeg: 8
  avahi: 4
  libsndfile1: 3
  busybox: 1
  expat:expat-native: 1
  glibc: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

