Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8A9C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 11:47:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.55014.1752407253160510701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 04:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JcDCZ51K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235f9e87f78so33330575ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 04:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752407252; x=1753012052; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB6TDh81cbXxJeqsvZIZlkF5FJspZemmigPUIK9V9nA=;
        b=JcDCZ51KMGctmAO1VnGXqeCxwoH5D2AtuGu09FW39pqaV7RCyDSQyRGtjcxp8DyrzS
         niIQMjciUJWiLfM8S5tdQuNSNiOLh0aqyZ/WxOmIerY5OT/kx0qB1NRKJHIh7P1GH+7C
         bCBW2JgFM8UnaiCXAlBnotYzet1a1CYu9t17kBf9SXZ3zc1N0L6R2eFveMwFqp/XnTHE
         HzRyNK8GTzpSrdtYJzyI3qWz9Wo5/DJnWEVFi3sIhu48lL/fbmjHM6jW3CCkTrFYJDKR
         J3qJD/9pkRTwf3PiwVL/v6G6InBbW3ck8JaYxmJl+9DTZjFgGY5NcubXJxuvakukK+94
         15OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752407252; x=1753012052;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PB6TDh81cbXxJeqsvZIZlkF5FJspZemmigPUIK9V9nA=;
        b=tazNfgMAG0T2aakG/McOJn/ZGcNlOcgmGbos57DlT+EkxcHit+LuRGQpO3/4hWOJV+
         rs1M8KqjkMGE1xdzht8XtTBSzo0vGGxORYzPorMIJq6txBzG5ydMopxwdfaH+Yjw6/sp
         aMPkEu0kt76ed3mn2iPy1Q1X0DwZfOBLfsMNfxiJlb9GNdSHVU9hnaVkmLL9BW2ywrIg
         tOscrq3F5MRO72KXj96OLzYJ7l2AuFYpZuoUJ5GRg58wY2dT0/+6Mn2iKeiUoRVliMpG
         x3GzMqEMBT1nPX1ImbbiPI+xcMVtb1Nr6U1DKO5buC6lSQ3MPHmJtytISJItZOUtxGKX
         7Tnw==
X-Gm-Message-State: AOJu0YwggWzXmqfMI7cKmJKAJTKzD/qRWN1sPTWmIwGv8yWDcxdPUHjs
	lu0LQbmgusZaRsUxewVaHfKMI/7v6T3eu9WyvSm0Lvl+BAhG7UpFDMRjy9Aexx10R7vF79iL2GH
	KjaGUveA=
X-Gm-Gg: ASbGncseVewNwb7bbmGXaQhFiBnw6kwrcNFcRusGhjl5DXr12RII2qDOtXB9d3ui9rn
	c2GjZrlobbCQ9NHYzC7R+Zc22dEPA2j4dzUzXtkevssWIgIZhNZgsjw6Fse+xI14y7XjvNywOwW
	ZPHbtbp7kTwOS87HUyhIPRh39pqrosx47a0Y3db0W257W96vNyuCKKunG4EcISkYLMASPgZpQIJ
	UYW8NdYyC0PremXUWuu/y5cJC6n2ceo1X+CYgdr8B1BemrseQkSXxaj5fu+4l7ZfuqvWROaWJRs
	2Nag40cftsZWYdlwonQRrxi2AAGwh/AFBm/F/BoMBuqFTcxKxIkKqh4OAnPmokA2S1xsiDbF+2c
	IBCDGgHlnhYAj4av/r9+QTEqZ/WA=
X-Google-Smtp-Source: AGHT+IG0f9ZdMyb7WBbAvxsrthSu2qJI8IhizO6MRN4WWtRuelLWE+ptv+vBaKfspZJU6rL9xTy5vA==
X-Received: by 2002:a17:902:e548:b0:235:f18f:2911 with SMTP id d9443c01a7336-23dede2e09dmr160185845ad.2.1752407252317;
        Sun, 13 Jul 2025 04:47:32 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm76068025ad.189.2025.07.13.04.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 04:47:31 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C5FAC1003B3; Sun, 13 Jul 2025 01:47:30 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 13 Jul 2025 01:44:46 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 13 Jul 2025 01:47:30 -1000
Message-Id: <20250713114730.C5FAC1003B3@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 11:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220204

Branch: walnascar

New this week: 3 CVEs
CVE-2020-1171 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1171 *
CVE-2020-1192 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1192 *
CVE-2025-4947 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4947 *

Removed this week: 0 CVEs

Full list:  Found 29 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2020-1171 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1171 *
CVE-2020-1192 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1192 *
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
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4947 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4947 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  python3:python3-native: 2
  curl:curl-native: 1
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

