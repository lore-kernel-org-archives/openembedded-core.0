Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B83DCCA472
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.226.1759261816743793457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nN8MQAxG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781010ff051so4421794b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261816; x=1759866616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8jZYtKo0NX19i4K84QvGXVSTEOwulKS4RFoBGX9ucs=;
        b=nN8MQAxGBBculxPJ8+hMHHfaxp2WdWcFv8E1QJpdjSvK/k/FmR9nsRVVbXjd11pDZQ
         +QyH4TwF9Xj8oECUhhFjgbot9yBRdKHxn1emXl75AtegCXJnkwE/sHjqq5d8ynXwI5C5
         p2i7gwLuBOZHhZakOMA7wl+xBrNJEMPdE0IEpd0Y25JgcCogPVI4x6PZxbtdsacE0YLF
         vzpi5TYa3oEf871wJU16mtPVzX8ph5MH2FTR7U6oLdlQM2bYxHH7k9IzEz72JnFKe+0m
         A9EJz7XQ3zpR7aJYzC+8lz8/PJeQIXOKx0u0ZWZfPXRZTev1G3oqiaNj7Oab7LJPXS0y
         6zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261816; x=1759866616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8jZYtKo0NX19i4K84QvGXVSTEOwulKS4RFoBGX9ucs=;
        b=gcECcUtATl8Tb/sYK6EXK2YJ2e6rOd9GH1YcA0sGH4ODkvQQxKqwAI+We57ucaqViq
         6JoavJPcncN6+8ZVfM7sHRWzyAHeWJSxIMyno/Kve03aSVWQ9abHCnRyQJaqUF+1vlti
         30pAIINn6T2q23NblwWYDn5E9qnrWCS5c7OccwLqMiMm4QL95dSalljzky9n65A3foFI
         5bfC3Dp4jKdvfX7vf5bbCn3mIS+KhD8QUeVZ6P08roHE1IJxLq8yskHETzWQLuyrJcxk
         6WI9bpfqioAQGN056e6QKJcLEq6t64PbvzjQdHEmRm9TngoIbQ72HKBsK2pLdvQoaejE
         RieA==
X-Gm-Message-State: AOJu0YzooZ8COemt/LZ0T4LkS2mHhTla2DHl2klNYAxFP22B2LhjMGAf
	biS3W8YxF7nKKGicnV0W+LtxHRKutK/nlKlKc9+HdSCq1bM03hOls7Zni9+jblDa61NA674KYmm
	mdWEU
X-Gm-Gg: ASbGncsvHVKMgVGnTcpgfZqq282eSDF+KpBj5uLr8LUG5NfZxB8+HaVrglAIdR7Pm0L
	vNHowKlJDxioBSU64vrbCUAXEyU91gFMcngfcFSVl5zITqYxZsgigN8+LqnslOodoe+r1gjP05l
	lQ0zjhygXBPKlAV9l7Bdj3gEy6xg/g36k6rF/7xGzQuKF7IUMUQHAV5EZnsmMCyiR7If2j7Ba6S
	FpR0RM3HJ0m7HEpb35JX8CIVn53hyAXMbCa853en2sx3W4ACE0DRmQa+XLVpIv7YEjmbBBgzKFT
	wG11JIr85t0cVo1GKdu2RLatErtaKULcmcZOEmbmjbNbyEpUfpU4+EMsc1Fj0wc4ReSrHPzCaW1
	8JUgR9Gprcp/iqiy3vCEeVIDYG9EExvxGtdSQkA==
X-Google-Smtp-Source: AGHT+IHbLD2ozW3KORS2HWpGTTu77qlcDStvRvTjK53TWkrJGyZUxSQrMo+liVgVRDn9ksSPDWLVjw==
X-Received: by 2002:a05:6a00:1828:b0:781:2271:50ed with SMTP id d2e1a72fcca58-78af3ff6b02mr677752b3a.5.1759261815743;
        Tue, 30 Sep 2025 12:50:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Tue, 30 Sep 2025 12:50:02 -0700
Message-ID: <cover.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224193

Please review this set of changes for kirkstone ande have comments back by
end of day Thursday, October 2

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2467

The following changes since commit d381eeb5e70bd0ce9e78032c909e4a23564f4dd7:

  build-appliance-image: Update to kirkstone head revision (2025-09-19 07:04:23 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Divya Chellam (1):
  vim: upgrade 9.1.1652 -> 9.1.1683

Gyorgy Sarvari (1):
  libhandy: update git branch name

Praveen Kumar (1):
  go: fix CVE-2025-47907

Soumya Sambu (1):
  python3-jinja2: upgrade 3.1.4 -> 3.1.6

Yogita Urade (3):
  grub2: fix CVE-2024-56738
  curl: fix CVE-2025-9086
  tiff: fix CVE-2025-9900

 .../grub/files/CVE-2024-56738.patch           |  75 ++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 meta/recipes-devtools/go/go-1.17.13.inc       | 125 ++++---
 .../go/go-1.21/CVE-2025-47907-pre-0001.patch  | 354 ++++++++++++++++++
 .../go/go-1.21/CVE-2025-47907-pre-0002.patch  | 232 ++++++++++++
 .../go/go-1.21/CVE-2025-47907.patch           | 327 ++++++++++++++++
 ...inja2_3.1.4.bb => python3-jinja2_3.1.6.bb} |   5 +-
 meta/recipes-gnome/libhandy/libhandy_1.5.0.bb |   2 +-
 .../libtiff/tiff/CVE-2025-9900.patch          |  57 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 .../curl/curl/CVE-2025-9086.patch             |  55 +++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 13 files changed, 1174 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0001.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0002.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47907.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb} (82%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch

-- 
2.43.0


