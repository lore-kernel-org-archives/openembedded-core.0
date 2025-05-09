Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD96AC3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:23 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.1932.1746805563104339892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eV8L3cq2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b245ff89c99so628063a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805562; x=1747410362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+CI8Q9QtX+MKM/IH5gjCBdOCI+yej3J09+hluBQ5w/M=;
        b=eV8L3cq28GjwxJEN9eOYNIzyfIqSm6z0nFdBprOBITfbHY/P5JwSnPFsJBr9UXnQGJ
         ksnMJ+HNIuyp4ADb93QcheW21L94hRdtHq5dHtO0hqXeIxqUZc5lZ6mGY9PCjC+2RqzZ
         bcrJW9GbnjxIKDXk+GLiAqaD2izzaLgJYiVPSdWr+CLVN8zXhxxUsYQIGIsisatMUwqq
         v/Rz0YWSsLEHNbPjXC1GozjbPUvt9mSTru33iFWWC/7E/KdJbE6qhT8K0rEYZouXhOdm
         tnRZ8SUeR6h+nB8a5kbvvIxm7VjiaDO0cQp4vKNRxM57AKE7vD6+VSWYiXR+BsO8rka3
         JAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805562; x=1747410362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CI8Q9QtX+MKM/IH5gjCBdOCI+yej3J09+hluBQ5w/M=;
        b=FngN2U6P8SyMi5G2VBduXutoEo8FG6w8OYlsAj8ZfBHVCeFlSYxBMfq4t7j6Mt6zQa
         ZuxYIFqGpaO84UwO+T8jIZAtx1rqHvJz+64CbRw3LoAlQHdTXXbEczWDxXARtwfX8szs
         punIfkERkRxyrDSHuVGzutUO98mhbm7qVTDfVKuwG/OJ8A+i0kUW+xBi50eSqWG1XQaQ
         27XvgwOcS6csvzgMmEd7D+NQBHFItII3aUXEI3lj1R+PYr0cSR9UttsbMXEz0nKb6NCZ
         NyUkCBgxOcssK1uSl0rnAx2ryO/c1F0ycwSP9WmDGUPEcXUNLogGAmhJjxR53lSmP07E
         uqNQ==
X-Gm-Message-State: AOJu0Ywtb9CbGbMIyGvhSSgA1Y2kYWSWrJoScZ6Zro5NwWmYtSrfn4bG
	MZssXs9yLIiNgzo6mk9mwxR7ZCgNPFM77yTgKTEAkE+E9RqcBTOmrETOXlAE77XIBhR2zyBNE6R
	s
X-Gm-Gg: ASbGnctHqgev6SFRyXfjtoWPk8Iu0NSMFXvtzw4JJwHjWRCmmf3MijiyTiObKSkw3uD
	Nz70TfZf73coV3cOx7L/ooYzb5IWQc42trn943aHmsCx65nUIsZwu12tLKy8mjBUa9WJQVhGpk/
	+ZW4hYXEsQusZu8WkJsszwZ0LuHbuAHgzCPAssqEBiLoD/Du85kqFcMO7M6SV3dBbnwPDkTIolF
	olt+WqtvmDtwtdSpcYJwpoqx361393HcOMIbrl05qRmMlhER2qICSnmkvJW2oBMBeCx9yH7o+yx
	eir70/qLpxKOvvs08gg1BQbCwzqykFY9
X-Google-Smtp-Source: AGHT+IF+HCviUwARvwnzRgz1ZPKJFhiFzqI9DKdc3xeg263oLJD1ypG7dZyXiRnjtRfszDEwoxA2+A==
X-Received: by 2002:a17:90b:3503:b0:309:f67c:aa8a with SMTP id 98e67ed59e1d1-30c3cb19ad6mr5879948a91.5.1746805562126;
        Fri, 09 May 2025 08:46:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Fri,  9 May 2025 08:45:47 -0700
Message-ID: <cover.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216226

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, May 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1557

The following changes since commit 45c50169fa7e34349acf3e24fc19e573cbab4e65:

  bluez5: backport a patch to fix btmgmt -i (2025-05-06 09:01:45 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Haixiao Yan (1):
  glibc: Add single-threaded fast path to rand()

Praveen Kumar (1):
  connman :fix CVE-2025-32743

Vijay Anusuri (6):
  libsoup-2.4: Fix CVE-2024-52530
  libsoup-2.4: Fix CVE-2024-52531
  libsoup-2.4: Fix CVE-2024-52532
  libsoup-2.4: Fix CVE-2025-32906
  libsoup-2.4: Fix CVE-2025-32909
  libsoup: Fix CVE-2025-32914

 .../connman/connman/CVE-2025-32743.patch      |  48 ++++++
 .../connman/connman_1.42.bb                   |   1 +
 ...dd-single-threaded-fast-path-to-rand.patch |  47 ++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 149 ++++++++++++++++++
 .../libsoup-2.4/CVE-2024-52531-1.patch        | 131 +++++++++++++++
 .../libsoup-2.4/CVE-2024-52531-2.patch        |  36 +++++
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  36 +++++
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  42 +++++
 .../libsoup-2.4/CVE-2024-52532-3.patch        |  46 ++++++
 .../libsoup-2.4/CVE-2025-32906-1.patch        |  61 +++++++
 .../libsoup-2.4/CVE-2025-32906-2.patch        |  83 ++++++++++
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  36 +++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  12 +-
 .../libsoup-3.4.4/CVE-2025-32914.patch        | 111 +++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 16 files changed, 840 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch

-- 
2.43.0


