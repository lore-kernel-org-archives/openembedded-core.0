Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D9AC87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 11:48:18 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.24501.1754826489348591811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 04:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kCY4pgJ+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso3661961a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754826489; x=1755431289; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEwKqbr9Hu+UOEaPJemn6q0HIqUqHYv0xrjKYC4ctKY=;
        b=kCY4pgJ++FKRpV/nD94EZ/zTXWt+OEyxjz03MDLQo9G5InZ/vcGJFeruXU8UnCK/00
         KpzPzjqwXltNQXazdEVVRYOFP8QY0L4pqpHOkyS976vq4X+jCY0DoAoLhHKrgroaUYhx
         AOwA77YjQwXOA33GKuQLEjvH76Tb6nbjJTkb6Y99uPozgRP38TbfNVKB9oHVGUCwsl1W
         cVw7oxmcnAYwIZebw2PG4G48MIXfdtWXY3DuceN+gRNh5vkkPMxRF1lt1bXFiG2PPx2W
         HnA7W75uK6M9hO6qJNFZdXXY4DmSa7bUPvGY2lT/DwF14ZR9dw8DiegMCWf+v3nZ3/Bk
         JYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754826489; x=1755431289;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dEwKqbr9Hu+UOEaPJemn6q0HIqUqHYv0xrjKYC4ctKY=;
        b=Q+dQWZZG+HvFeRQpcs18E5P5kzrjCm6mhTX2rj+IuvNAD1K6LhGuitlqH4DQtnj/Cy
         af3jO7R9iSLC7xtWX/1FrbwYFkuN6Ehle44bLpTGqXPx5AA9Nr1MA8a4cErIEDFZQ39C
         2VIYzUZk07G9PE3N5k43+OwJy56ECd5/1zs2Tofn21xj7vPZnM3kRXKVEcmXCA37LCw1
         Q9R8lnNjixU2j3JxKa4RMs+awQAIgS7C3M9q+TyKalHjRJDycii8MwtLhn9R3wKDpetJ
         07oNLRIH0uTlc8fTMGyIfFBqX1DHio7p6C/abo+ZV1m2oG3cJeL54Wh1M6tDOLK9YUq/
         qGSA==
X-Gm-Message-State: AOJu0Yx5s1J3G2l8qOxRSJ9dfhEQJhLVXKq4Do3NwhTNvHbsbWVnmVqn
	5iyZcZGu9UtGUhw2cEUV5PsQjxYFGUNisHBKMkIpQZn07QX5LS0LfSRpNWLXh+e/B4nqmhd2sF7
	j6IYHTKw=
X-Gm-Gg: ASbGnctQlF1m25mQeVB4p5Qvee9hOVNcRP1TTZce/nO9Vnow3VGUINHTx9LYDCtiAim
	MaI7sr5YidltX0QKUtGdan7o3LZxvwzEWRu3kC0k06TGYj4m5R7HsbZj667ozSCm4bfeJN6m7Qv
	LfVXgSVYd/hlSKmGhlOIi/R10HWMSt1db+aG8ERt5se44I5imtlpUi8cm+SgcC6oGNe8pnUz8ji
	q1YnykrOTdoIEtORo4MyWLlcRDxQughFkTQWm+E2dh2FSVP0jDv9lpLnXlBrEU3MdMRX4zdQDCF
	up1VZsdz05fBOp1hnlsx2jLGZs2sC2IOtRKOTw2iwnnOu8z5RVBxSov4O7BmbEbmNC4MyezLIwb
	3QLhfonwuswJqCFodYjVeK3A9u14=
X-Google-Smtp-Source: AGHT+IHp5ZYXPXs0JtKpY1MVisYigRvfKsVickb6Su6lZGpm7lzOrgwS3XG5EkvmfulAEWAJ+OnLjQ==
X-Received: by 2002:a05:6a20:548d:b0:240:2421:b912 with SMTP id adf61e73a8af0-240551f3000mr13462671637.37.1754826488529;
        Sun, 10 Aug 2025 04:48:08 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbce4bsm24059020b3a.77.2025.08.10.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 04:48:08 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 97A24100467; Sun, 10 Aug 2025 01:48:07 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 10 Aug 2025 01:45:45 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 10 Aug 2025 01:48:07 -1000
Message-Id: <20250810114807.97A24100467@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 11:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221700

Branch: walnascar

New this week: 5 CVEs
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
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
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-8224 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8224 *
CVE-2025-8225 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8225 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  qemu:qemu-native:qemu-system-native: 2
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

