Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467CDCAC582
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 11:02:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.7298.1757847757820692557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 04:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IrLzkM7F;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7725de6b57dso4078919b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757847757; x=1758452557; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5efuhckID9Fy0Ja+0wFWq/oddxVKuQ6KjyVPrJswJ8=;
        b=IrLzkM7Fhx6aB2hSbNpLExgZa7hxlzjMz+U7tj2x/YM3jNtWkVKTfSQk3jXGwYvpOB
         gtypiqId3WRTF/MuT1XS6zRfRXCJO1TcVdFpcZSAP02pp7VBQhfwpwud4ST0YVoZ7Ov+
         HNJMz58HSwENb2NKOBSOgCsxOmBsofUxvhdCaIE5niPW9AO+7Zsfezs+gW26O/iWC3oD
         mG2YfhXn02apwCOw+B3kh4lzK8JhGWu18WshaF5a4IeQo+qqrXpWuuPM5uVLdv84Sgzu
         18bUnmZ3DrFXQaRlfwc2gTVoesSVzHFGTVxyXyFDD7OzU6MaJb/JSLJ7pk1c7lTzHDVn
         +I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757847757; x=1758452557;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5efuhckID9Fy0Ja+0wFWq/oddxVKuQ6KjyVPrJswJ8=;
        b=DeeXtijYNpz1WoJ5/ET7Q4NieD8X2GMJDCMn/dz+D0ipAxYR1hAwlDJk5aY2FgdcXG
         eb0WCkgq7C0ECKAmJtI0eO0kNDRQlQWIo4bhcJ8IW6b1qvAcOaofYFXzfrnb3rK115GB
         NThWjxJnmfNOgxy1r5l1x2vuWPdRp0h78djJ/Ke1p1zKsPOlawKLx7QGmU+mk961gpol
         ydLwetBIcM8PfcclwWA/KG1N0PVDd0tqaVw8W+K9q4nXwHZ4gxvrUw1/nR5EPIYv/xSv
         iG73ghpnGt/NQa+Gtr/m9k98eW1XKBKM5v4t7D4dOXdbSycCxXaMa5WY8uUMWZphlpM0
         VkXA==
X-Gm-Message-State: AOJu0Yyk3gsNKcqEO/RjwTlAHe6cG6OiIjkV/P/M2UH6Ng2/C6OGyFwu
	0bAQ1WV4a9ODTHwD5SrgqRaHetelehEduv9DHCYqf5zJx0aImESyG+r+/RCAfFzDthMqRpw+hGH
	FnXEU
X-Gm-Gg: ASbGnctWMVxmf/LxiXNCdhNGx5tivTJ09nSKbRECYqkdpJ6CTlhdiVsyFYybcHDcRx+
	7S5Fa8DQLWe6j8yzpwNhKV58JAfclYRexrIxWTxZeuvBvrYty4oiV2H0ZSIeBRYa7v3QuD2f9Hq
	Cxco9Jxcsp+tHd45Bx+oEqkFLbapgJSxacId53acKZwkcP4VyG2WK1p7uq0IwHyITt0ibuf5OoO
	5FR63rzNSFHSMwX6zH1ygVgthqbzwK0pTiyHqRp819TntPooAVLDpM1sa62RAPBT64uRjUqLgk/
	JbDND+t3Xj0vcuZBcV91HYdWEyL+Xys7E4g3ehnxs0UjmeybPBrqOADvhlgYIuGcAtENa1zgB2e
	yhWz5/LYWiwQhi9NRQQhkYvMQzpo=
X-Google-Smtp-Source: AGHT+IGnnuaeJkgRPAmFf0uoBnbQBgTRaV0bhk0Jf0rVtzP9Rfgpf3OfF6fYKcd8DsIPbhbL1MllBA==
X-Received: by 2002:a05:6a00:2345:b0:776:20c2:d58b with SMTP id d2e1a72fcca58-77620c2d91amr7536893b3a.24.1757847756916;
        Sun, 14 Sep 2025 04:02:36 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761853866bsm6849589b3a.95.2025.09.14.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:02:36 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 9D48C1002DB; Sun, 14 Sep 2025 01:02:35 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 14 Sep 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 14 Sep 2025 01:02:35 -1000
Message-Id: <20250914110235.9D48C1002DB@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 11:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223347

Branch: master

New this week: 4 CVEs
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Removed this week: 13 CVEs
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Full list:  Found 26 unpatched CVEs
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
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  sqlite3:sqlite3-native: 3
  tiff: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

