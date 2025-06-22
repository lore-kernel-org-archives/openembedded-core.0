Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B66C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 11:46:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.24581.1750592804235895690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 04:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gNf/++La;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747ef5996edso2440965b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750592803; x=1751197603; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C07Mv8+QjUpb0QoRRLZ7qPBy53StZeKwI9Sa+rWAuyI=;
        b=gNf/++LaaaqDG5IHVLgyypCxJLeHgRKkft6Basd4DVf8NXv0wqV5vQsInRDGbxUs/i
         wZnAFUHN5W8/OYVC1N3clgnNAa/1jc+IIXoAdphgv/fVBBx5Fef3CxAJpLsWkJwdeero
         5vRew8P8YZR6nUjXKb+c1SVMmBwaKYFdW7PiyMuC2x8+klubJoHDQ/xOFf5uqLlpzmdE
         iP5TPrOe9zLnmY2QiiuL52K5pBYeb+CVHqSyWRv/et05koCkkKM/+Wcj4bo0efHiNv3K
         ZExwxI+9tqn4G3jW8rMmX4QGRDTl0o9nxtOUHnRnKTqHTjADcJb3316y53rmVdfreLlM
         icrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750592803; x=1751197603;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C07Mv8+QjUpb0QoRRLZ7qPBy53StZeKwI9Sa+rWAuyI=;
        b=w1xSd19fyAUO/Pe/pmkPnDuYEFvLCro7VX2jPK0T7lWoFJtQT33DPwBYrUJsbm1ZP4
         Yj1ZW3h6K4qHD3J/h4HGTNYXFVGSC6AMtnskh0E48bCa7/dpWUg629VRGk0948qt7kEy
         gLzxGypu36vJ6Vdn6NKpdSMUVjVPGnsBCiVVyCo3lNuKqoTCoLl30gCHsh38gRfdxR00
         nBVO1lB5k0Erfb63WLKm9WV1z8PEU266CRSS+Go1wn6YDooRVW5vX1ZCmUCaee0cMrm2
         3F4QvA0adIp9rqKAOKdqQ6Ct98jvpFjK8WctSpRkaylCXTQXu6Z0XKesqdu6PGIZCjuq
         Sccw==
X-Gm-Message-State: AOJu0YzF9NVlguohrE0mTuildYTrwaGwTCGQn6N0xDqCIUpZQMkARwcK
	oaRAyYjQkv6epZk8rf6gbkZovDfs50SIz74j2nt2Z0S91c9btdNCtnCLDoPhRolf4loLGb94D+R
	VNFE46Bk=
X-Gm-Gg: ASbGncuMtGLtLiPpE9WockB7NbjB9YxHwENdcaMcB2k5cJ1JDKeREx07WImv3OTg51W
	eBN/3Z1DxxDLDMweiF6w+FCstXRzeO4X295lnr7lyYVYNRicCsVoNOKoLv9uJ9rfMiKBwNGVwYp
	28B99LLCsNmCmJx3i5f0d0kR4WrTo5yema/9sFWGN84YCTwAcxhBPVMG28XgtEVU0LVdRfQgkT/
	twHtfo4lUf5NJM7r54GszdSxNe2Rega5qmZ29LwcCykgiyTIX+K0Ya36NvIut3KBdrQaY+Mzc0e
	kLMMz+yRSdX8IsfjxpTgWm8KVD+1f0ZAEbxTi5meXR7jDHsam2lhfRc3R5HkV3fnqATkTuNLILl
	89A==
X-Google-Smtp-Source: AGHT+IGp+1tI1SXAJNl0Aon5+IwyEIxHMK3K8IAAjtGnbDEpzyJqkpK5SBFjhXG/l+BCKR/IJ21cJQ==
X-Received: by 2002:a05:6a21:2d4c:b0:1f5:92ac:d6a1 with SMTP id adf61e73a8af0-22026e602b2mr14050667637.4.1750592803463;
        Sun, 22 Jun 2025 04:46:43 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6bd5c7sm6104832b3a.165.2025.06.22.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 04:46:43 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C4092100337; Sun, 22 Jun 2025 01:46:42 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 22 Jun 2025 01:43:58 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 22 Jun 2025 01:46:42 -1000
Message-Id: <20250622114642.C4092100337@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 11:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219173

Branch: walnascar

New this week: 3 CVEs
CVE-2024-3566 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-3566 *
CVE-2025-48708 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-48708 *
CVE-2025-5914 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5914 *

Removed this week: 1 CVEs
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *

Full list:  Found 31 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-3566 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-3566 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-47273 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47273 *
CVE-2025-48708 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-48708 *
CVE-2025-5914 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5914 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  ghostscript: 1
  go:go-binary-native:go-cross-core2-64:go-runtime: 1
  libarchive:libarchive-native: 1
  libsndfile1: 1
  python3-setuptools:python3-setuptools-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

