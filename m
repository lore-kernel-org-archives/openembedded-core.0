Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD240C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 11:02:44 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.15803.1753009359738543828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 04:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=esfK28Ny;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so2403969b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753009359; x=1753614159; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKgZTzzEXkllGeucIY34ACpSxyiMGu30ISKIvwL4Xx8=;
        b=esfK28NylwSDdsT2+tRo+bbDK4aWWhzVvTvyhdRwMp/2huI+gNSSmwzDlXvysOkEJv
         CXXVHPxqKlNCxLGD0AeiGW9vvHJCjJvN7ktpPMegA5pPCFjuErqcV1+l44M8a55GSZjL
         XhJjMrvUG0xNVHmHkfk3WeIvWziyeiRyjaxdu8UIg/1a8or31AbfqkPSqKFk0R+WqRQW
         /M3yUXF5bGG84o/9r+WIVV2JXZqh3uZ7XQlGGfBhmk66cJY3Uqw9/gagFKtyu1ZFoFB5
         V81ct/fU8hx8i2QIKkFVTV2+OeEqxc9LTGGigNhpG128igrTQm8ZKr+vM4EOFc7g0TaZ
         C9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753009359; x=1753614159;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SKgZTzzEXkllGeucIY34ACpSxyiMGu30ISKIvwL4Xx8=;
        b=KU5JrejR3kJQ9niP8jUrb9qW0OKgUjiMJ3UEqRYtGxjaYolhEYXwfJUquA1fiGRe8M
         gux7sVOnFgobNCQdEw5iY/RSJUp800KG6hHv5WlWEFrxs4xypUqE/zqt+W7yPMjiXWWp
         V0m7VFDBTR32pJDTiZsWjkMIgB5CuzJwAvkdO1Q38TSPwxpIj1x8CBdSb9LeWtfu6jd0
         T9p7cSTqHuPTpJuHSzPsb2RJvnESBO99JNgBKZBkq6CaKblpspWSIPfPJbejHhA4zzqX
         bR4pmR2AWZ9rEJ5OCyz2JtSrkezTFh7LMeHwe8AiG8p6aZGrkEDBw6Iwy0L/4KHzq/y0
         hpIw==
X-Gm-Message-State: AOJu0YyY4oVN1au1a366q+9rcbEgOokOS8uS+VDp/69MLqIKuWNYh0iQ
	xn4LCZRrC0McOkizvmX2aqLrFgdgXU6OI17n1gjIyRttWhAmjHzxdZcqxcbQOx0IO7ginpO6498
	rqM4QNvs=
X-Gm-Gg: ASbGncv82n/09YfPOSthqMCzxO4yEI7CC8BGJPqbrFUWM18ByWPHKjDEczUfe0JKB5+
	L7nV6f3fw5kaaHAjeItnl0Z7DVoMihC9w9TAtA8e+HKDUSD8uk8OcDyLJBnU0J2mh5VFsOUuOcv
	pzXoJ4fwE8CPX23snHC0qhn6z2U/sk4vw73Pu9/sgwuVJQvmki+nVgv9L0OU98PvSI4wqt1l+ec
	5B2ZCqRzfnHH7oWjjaSPXhGPx+q285t7KgKGLM3Vtv3J0fRj8aC0D5m6E6G3Bq8B5K2ijtZrsG1
	nK8uOdLQ1vaCUp8Pab+Dm37rJrF5beIUHdIPlQviOBHVCh/rOsjzobuOJccTVu2u/ZUaPympc63
	tee1OCTRm7mGuX4QhZCUor+Bft58=
X-Google-Smtp-Source: AGHT+IFBUHKcQ6mx5M/Wa9MVGF9TGCqzX8h5vZLdEln2FhH5JMhMlBu810uKItaPaekHPIjbNv0PyA==
X-Received: by 2002:a17:903:1387:b0:234:adce:3eb8 with SMTP id d9443c01a7336-23e2f6f22b3mr129572175ad.12.1753009358679;
        Sun, 20 Jul 2025 04:02:38 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e479dsm40204635ad.24.2025.07.20.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 04:02:38 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id CD39F10036A; Sun, 20 Jul 2025 01:02:37 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Jul 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 20 Jul 2025 01:02:37 -1000
Message-Id: <20250720110237.CD39F10036A@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 11:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220618

Branch: master

New this week: 1 CVEs
CVE-2025-47436 (CVSS3: N/A): orc:orc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47436 *

Removed this week: 2 CVEs
CVE-2020-1171 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1171 *
CVE-2020-1192 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1192 *

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
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-47436 (CVSS3: N/A): orc:orc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47436 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  orc:orc-native: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

