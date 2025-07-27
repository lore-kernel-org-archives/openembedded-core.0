Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47D3C87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 11:46:39 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.58708.1753616799498142891
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 04:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=brveVew7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7494999de5cso2440530b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753616799; x=1754221599; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zInuyzY4PQX2XxPfOs3kbJz8itTUt6icAuj9aN3CYUo=;
        b=brveVew7y6plJ2soUVDwJRjavhfOUVUfd+rSFamg6fQea94DYBd68BfRDfEiaE9LTh
         RQciH6etBa35vdlHdta7F7fDtBPSitwVAzq9AYsi38le+PU/+6msiI6/E8VQMERpmysJ
         cd5ZgmjMTFZFklAiMUtdzhSqbgFVMkLYXYL0IpZMvHtqPH175+6N6Qg0INvsXBwrZxg6
         iJin0Nq28VNn1Qzh7545iCgw6T5IDNesLCZIsI3ofYc0Dvk0AahsLtKNuD0Xd1oKZLxS
         HcaUyk6aApK1uhSY3vzxzte4SS2dX1cmo7skUiFW0U+h93WMtb7HRrbzUy31b1lHG/AI
         h5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753616799; x=1754221599;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zInuyzY4PQX2XxPfOs3kbJz8itTUt6icAuj9aN3CYUo=;
        b=JJAex2EWglC3ywGPUhIu5CqcP453inVAhaznxco0i3HKvQstW5BMKMnWJruP9c05BH
         V6XnSyzJU5HwAqiNTL+t/CEu6HBeCTv3AkDdZsY8OVWItMfK68g8YX2Z+2ESAys1dCQh
         9y2eeQciJ0biHPdYbu5MVoCiJ6lm4imtUusmnp+iKLtYzGN2bzkskOPPqcVAqHlBPZSq
         4tYWpuyle2cvjP9RFB6r5h3YHsSwwlPhrsyy+2ARDOuTDzkjBXRgK9jlXlKaiOVpL1zv
         Gi640A/G2/blvMDiyEgnXX5H9+Alq/KYFyyQOaE0GQu1qoQEXAVddW64uV1rHtVWFphb
         2g+g==
X-Gm-Message-State: AOJu0YyUstNaKP5JZPfOyFcwc3RMZXHUwqQnT41VQAGuYqyaGqiqPE1+
	dSp0KISK0fGKOXZBtdXG3AZlvTO/Wu+g++i2mchz18lhjhXnpUhCEPLe3UYP7zB39lWawuAHTsI
	GUeAIBCA=
X-Gm-Gg: ASbGnctBd1h90iJ6WK48qTiKQk5kU/lbRajaL0/cvbSx+lNFNwUQfTcwpRPrB+jxl4c
	4hSqoBlKBv+ZCOYnoeeTXMfMBPs3NirWTi5cStRwZiKuR5WJHcLHBscHgkV2/DG/MN3ZmADA/nq
	WGdq5HcCsOKjzZIDIs5t20r2ANOCnMIgoM0WhqEuNB0zg9HBK0rk3vA8K71E0wd4qmTJko97lEI
	UeDXmuXXhlFIfrLj7fduv0OZPliFKSbFGizpSJhkPGODsSG/XI8BjJ/ja9irEn1YG86cGrU+G22
	NvSe1bf7hkIAB1SId2p7lhRJiiUS8lft0lzElnF8Q+lcCagE9geyTarGNh8U2ynAp832W1Htdn4
	vkyKfONVO1sSWB+ER+ceupxa4uSs=
X-Google-Smtp-Source: AGHT+IEw7cAKng3L/Dwi2wwLgApwJ7TFIrr0+tFCqbl2dcwWD9Z+FmQpz6n5W4vFmABWSyfp20nW0w==
X-Received: by 2002:a05:6a21:3382:b0:232:bdc1:6ba1 with SMTP id adf61e73a8af0-23d6ffea54bmr13201832637.4.1753616798727;
        Sun, 27 Jul 2025 04:46:38 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640baa00a9sm3063096b3a.140.2025.07.27.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 04:46:38 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id E8436100464; Sun, 27 Jul 2025 01:46:37 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 27 Jul 2025 01:44:09 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 27 Jul 2025 01:46:37 -1000
Message-Id: <20250727114637.E8436100464@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 11:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220946

Branch: walnascar

New this week: 1 CVEs
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Removed this week: 2 CVEs
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-4947 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4947 *

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
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-47436 (CVSS3: N/A): orc:orc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47436 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  orc:orc-native: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

