Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A39BC369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 11:03:08 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.26760.1746356578881078094
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 04:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YO0nO9VX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22423adf751so41083245ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 04:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746356578; x=1746961378; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wDPcfcLGRpHMQndS61SGVa+TOTV1Wp9pps5HRaUKtI=;
        b=YO0nO9VXalhT0jZEYSBztXypOozuWnBAScuYlWxsmCVdsFkDX7PIzku57lGgUgbYnh
         7L6S9oF50Tc34Fw3s5rdrONH6Grm9dVg6RY2m3Seaqu72H6uaD+RxEf+EVTdpVVjv1xt
         xRCXhfes9cA0ZU2JKdlaFGA8SlDqN1VToSWEHzdDSTKNcjoWcqpRxod4Jc9DYNTqWZ9z
         GRokQ4uSgKu167SgsLpI0/xMGRsGwwWs4qODRYSvrZfdPu0pqw0tKMLxvmrLWXYzLkXp
         KwXdsGImNntlzDCZ6lq9B8IHdJ8laLxjIab3SXaatIb+0FR16ThezTuffBvXGpnTQKwV
         6quQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356578; x=1746961378;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wDPcfcLGRpHMQndS61SGVa+TOTV1Wp9pps5HRaUKtI=;
        b=J1f+QeP5MdlNFlMB5V4W/KMtBCWHJ9G3jYNvttCzt3TDE+WnAoG05j4PnbFISPk/cA
         M+ItWCUTOCPyXyAWVJ9KcaUUzGtTCosSch5Yp465aBCbQtQ/fI/CdGGB4Cai35uRZn6M
         Xd4979I2AjQugWhB3Nw278IYOTaueKO1k2EBLNh7X8+HsJ2SE7+3MzsMt27HC0vA2ODl
         qnQNsL5pnt5IpIxPjzLGEz37PRNFG4Czm+CubBIJZqYKpRIlNcAH5eQrfJSZ/wKsfZuQ
         AoRTX0zHRfm2JCtvmL0hQMZoUP+S/TwNlzFtK0fY5Uari2WJWrljhku0wTTT6dpemOuR
         dtsQ==
X-Gm-Message-State: AOJu0YyTttex55kjoMxbHDF02sgIeKpGJ68poAg3O7dhywWb+9845oAI
	2LmaSy9A8jH/fLesALG2VIVtGNVB+hn5jk+mDhwAwVBqD6iVatOZdvnD2sSSXrsw2WjBVqEFCYj
	N
X-Gm-Gg: ASbGncuGdwlyT9ya8OJZ6hoQnx1J6YS9aQfBw981Pdd3xV3Cn7t4EeU/0WrCPPLY89p
	8ExdKBFyZFbnGu6MBeheLM9WJOgCVfKGL/Cd3rhXSKXJ0jEm8sqzO8zoPSdKuveMrv+hUh0be5u
	glENaCpiHhSc7IdK6pDnsCtZwKQuGPRDUcupkVqL25spKv8LGo7JzC+/kKNNLZ4ZOiH7MbcArJ+
	pXjDZk1vCesW8/idOgs2pvYZM9/7Fw+3DDA+A7LBKzuX23DUP8AjFlwjWhv40GBrunG4zPbgx94
	0EvtyJMhhzHuY/MLop/OeuFoFkcItUwXyQ4fyzwV0O2oNA==
X-Google-Smtp-Source: AGHT+IGkJj39dlptvf9Zs7KCLAhSI3Hgs1m/ooYIxsz9C7J70pO3jli9UPoSm+2hVirpcSGIuQ+2yw==
X-Received: by 2002:a17:902:e747:b0:224:1af1:87f4 with SMTP id d9443c01a7336-22e102f315fmr149946525ad.22.1746356577882;
        Sun, 04 May 2025 04:02:57 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d4b2sm4800006b3a.132.2025.05.04.04.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 04:02:57 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id ED40410033D; Sun,  4 May 2025 01:02:56 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 04 May 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  4 May 2025 01:02:56 -1000
Message-Id: <20250504110256.ED40410033D@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 11:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215939

Branch: master

New this week: 6 CVEs
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Removed this week: 2 CVEs
CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32414 *
CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32415 *

Full list:  Found 27 unpatched CVEs
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
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

