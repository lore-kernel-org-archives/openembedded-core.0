Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43DECA0EFF
	for <webhook@archiver.kernel.org>; Sun, 31 Aug 2025 11:49:52 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.27805.1756640987091757301
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 04:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gw0WAMMi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7723f0924a3so1040087b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 04:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756640986; x=1757245786; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPBq4E6fSUVRt52ThbCSruQ9ky5ydbPAuexPw9GqlAo=;
        b=gw0WAMMiuu8iIAtPKHEur0+QymCIewzJSC7onLIxpcJrvCsIJpUtKaW51ZpeuT1hGX
         FUH2Z2e45kLEic4sQ4OW8Hy4lIfWYq6ZiihjUcZQVbHNJUkIuMtlkWZMo68pJovORlV2
         lK75rC8yLiPs/ab1HZ18wSk4r+Pbejqbk1zZwuv3bxhSaZtKCH6BZbj41OK6EK4ARK3D
         S0QytrRjrPUiVmIVKcLfBHTuMuOHgChItL66bIrNRJJ0TJsxhWSj1MD20LLY3J3QF2ki
         CRvMAtKtjCpaQHMDDialy82B60uEI89XqniUEO4OW05qf1qc1ONelUz6XkMwm14OkJS3
         mhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756640986; x=1757245786;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPBq4E6fSUVRt52ThbCSruQ9ky5ydbPAuexPw9GqlAo=;
        b=jK0DbS38XuVQ7Fk29tylQmHpi0z3BlZTcEMCZo8OgfTCGwpNI9AcMJLa5fwlt5Qppd
         7jv4mN9IAsenAISHVrO845PaHXerb2r3X8Vxfw2s80EyFCvSfQlzCjdRd2H2RIjgeagz
         A4OQZnpTd1mdvoQiKROdNgAtejDzt8iqR0GP+ksUFlJRurrqyredAOcEHzJdNbMljmkA
         LxKysvRNP4d9++UgVNm/BGbkYJKZQrZBVGX/EDehmlXllKylonkmjCSYxEj14xZuk+LJ
         CxFgNIaATgTuZ2FQzmcehR6gmqMYe1yA/wGpRppYeBuWgf8oI+g20Lcg2G1yu1lPZMja
         pM3A==
X-Gm-Message-State: AOJu0Yx3Ku4tzujUv+NxNlkb8EqeXaZWNkGIcnydS7c3ksPX8YS12/pp
	5iOQ/NtMJdfJjEHyAycYKy8zA2k40cvvYQjojjTQNd3c87Wc/+/iJ4pjs+zOw8mfKGdskw7VEIl
	TSg6CxMA=
X-Gm-Gg: ASbGncu6t0A99EWtXhQ2MxzOdQURjiLjoZLv+Rw3gzBdSwfK7L8r+1Cl223m49r6s+u
	kKBTgWqIAcEItOfBAu5Vc9vKEK2kQqNeXD2nxQ6yxhJjfykNwp05PS1qd149Mq6Ugrws6/1WVdi
	QnslmpTYD9vYiEVLrlE09xm6ztw4FDAotSnetGp+E6BZVeGcUfcBDmNF7e3pO7dqO4e8nnWYIEd
	NQCNV49Xdp7pab+kAOCtr9e1uLY7gVKITceDm01uiVwrZS+wK8qbhR6cpOuW37RHpp9I78zqXz7
	9cqib5p/D35B1eOlN1IXDoxBC1MdS83zFwy7r0A2d07ULPlJzcza24LoIHQUuMiQQJ0/lyek7BN
	TEyss9h+NO2GRSNJEUJ1323iEJkE=
X-Google-Smtp-Source: AGHT+IF8qdSZlOkTYzGlv65q1uYWRyky2JFdxnOBqs6vLzIdtUGqyQLXQbkx3I3GXL28nu/wpgHyKw==
X-Received: by 2002:a05:6a20:3d8b:b0:240:11b3:bef3 with SMTP id adf61e73a8af0-243d6f051d8mr6807923637.38.1756640986296;
        Sun, 31 Aug 2025 04:49:46 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd007026esm6751887a12.9.2025.08.31.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 04:49:45 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 874A7100429; Sun, 31 Aug 2025 01:49:45 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 31 Aug 2025 01:47:19 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 31 Aug 2025 01:49:45 -1000
Message-Id: <20250831114945.874A7100429@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 11:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222633

Branch: walnascar

New this week: 4 CVEs
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Removed this week: 2 CVEs
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2025-4056 (CVSS3: N/A): glib-2.0:glib-2.0-initial:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4056 *

Full list:  Found 49 unpatched CVEs
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
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-2759 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-2759 *
CVE-2025-32989 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32989 *
CVE-2025-32990 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32990 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-3887 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3887 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-47183 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47183 *
CVE-2025-47219 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47219 *
CVE-2025-47806 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47806 *
CVE-2025-47807 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47807 *
CVE-2025-47808 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47808 *
CVE-2025-53905 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53905 *
CVE-2025-53906 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53906 *
CVE-2025-5916 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5916 *
CVE-2025-5917 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5917 *
CVE-2025-5918 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5918 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *
CVE-2025-8224 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8224 *
CVE-2025-8225 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8225 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  gstreamer1.0: 7
  libarchive:libarchive-native: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  gnutls:gnutls-native: 2
  grub:grub-efi:grub-native: 2
  qemu:qemu-native:qemu-system-native: 2
  vim: 2
  libsndfile1: 1
  libxslt:libxslt-native: 1
  pulseaudio: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

