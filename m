Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7E2C7EE39
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 12:19:50 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.16257.1751199580227351536
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jun 2025 05:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fObok73l;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-879d2e419b9so2827122a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751199579; x=1751804379; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6BoOrkpIBwX8muyaycdsX1Ei0/wS4E66FS/zEfAvKE=;
        b=fObok73lz0vfoqa/hrB4zwmoDztym+W1jKE7oA5tAQlkOq9pELRGbsQ+wrWfJewVMI
         L9/VrwMm2163xADfs1cNGPLA97aAN4vSPOfGht9F5pyFQyXvhaa7XtdlaYAFgjDXlaDH
         i0cv6vKAx1NkeFW05MQ27VBFXvlHtDZujlAIIGHSL3BjAt8Cd4EdJziJZr+a6vnxSmRg
         4r4e46XeteVFuv8LEEkYFwvJUvp1mcdBRcgVM/g7pB5BRXHROXXLmb6z4jtP2RRRrRI+
         z0shUkoal4e4wPK5E1Mg6YaNs3QVriWXHl5x2CcJaxGJStKMa/nhHYfmowrzKXqoYZHH
         9oiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751199579; x=1751804379;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6BoOrkpIBwX8muyaycdsX1Ei0/wS4E66FS/zEfAvKE=;
        b=R7UYa4nfcw274S1MloxiZWA3yyJOMO8MGZL4DTBW4VuLTL2l+lXnULmTR4HqjgHtlH
         97uiStOZgswK4I7bRxCGaloxuKoCEeVUukf2lvtdnQZR27yKj85Wk198NWh3rpqdz1Wl
         cWUmiZmLOFTYauMndpp4G4wZaQwPO0Pok3g+D2ZVybVhrCHEDZ8Oc4ZjSWdC6W8riXyY
         hbq6lrCayJmNJYk2MpU8XcpsQrMHxOzDvzMq8+aXrOPMoMSm1mNdLiw/Eh5XTGpITG7W
         OhNOzBx8TVwxQ0JUTz13SmOK/IuqhjbsD/HmYJddGIqRuO/ruoJ0JHB+BefQLISgmTTr
         8DZg==
X-Gm-Message-State: AOJu0YyQ4+HPyxt0IAXiBBM5+S5BsZY8JSSBCMAr10wH1N1uhpuAJG9C
	zk423X0KJL3mC5cVXt+x8L6AgmWn9NfaGS5uI5+BhvQUUilj827tidXOB9ng4DOr1PGofhoa0Az
	L6eZdGFU=
X-Gm-Gg: ASbGnct0mqxeSy1ftAWJpuhB4W6CQheh3BKi9Yxo3A2Z5uyI4riE4jofP1eUkTYy3ke
	PtguI3ketMZz4Mpz0px3Y4tyjbRDaGF1kzyuDyfZ3FrdCb/aRROlzzYPYWWaWCEjpx25ZbCBkle
	oDb2LGqTZsQzsEtPWBJOtEei0wE+HPNqWtb1/ldem+H2CV+kLBuqk/3M7EN0pef5be06p5pnfPQ
	yIILeHUmlgabYVYbXrCSJLyIEGHzmVWAJUK1nlhenM6X6YRc7B4DmwNV+Cwq3K3lknSjBK/vysC
	a9Ceg+/AIbXhp0e+wF8s1Y2bCcivY8gjFBv9PgHDqbviQURz0MId6wTrvlDR8ZWi1g9ErqTNfoi
	Ydw==
X-Google-Smtp-Source: AGHT+IFSuMKV+kiui5InswQMwZGP3r6Bi2VvDh+XBRhxd+0pFi0gU04lKbuJ73IvzC76dEraRU3EOA==
X-Received: by 2002:a05:6a20:9194:b0:1f5:7b6f:f8e8 with SMTP id adf61e73a8af0-220a127661amr15803495637.6.1751199579239;
        Sun, 29 Jun 2025 05:19:39 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409a41sm6307181b3a.29.2025.06.29.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 05:19:38 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 87F121003F0; Sun, 29 Jun 2025 01:02:50 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 Jun 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 29 Jun 2025 01:02:50 -1000
Message-Id: <20250629110250.87F121003F0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 12:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219444

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

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
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

