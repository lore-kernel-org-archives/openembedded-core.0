Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E38C77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:35 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.25251.1751466329514593955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d8uKSRaL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b34ab678931so5769599a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466328; x=1752071128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3djKzKi9RtOjzmFIpD9o6j2bbBqvsosVqS09tztwFw=;
        b=d8uKSRaL3f9mti0+pZ/Gp0MUcJmW6d9i0tgOmNlKsZly5wb5+p+hZKEtHempgzgYts
         kq0Vunv3S0nGa1Y8PWUHcoTRyx1Kw4senyWHGtZN63yd34IsDweGMpY7Ujm+9ir+Obeh
         LV8dIiydYaD1LPo7P193SCowagK8g4kWG0Ijmk6UAkcsdaGGfLh9gbe/4yYjtroRuzF1
         pVDXZ6rURTupL/zb76rG2FGeuzrI3lI6SnQqpAt+GdN2Rdtwa5eTnpQFChzIWDs+72Jj
         wT3dJ0oj2vZgC7swzqXC81HvB6ypR8dxwU9qU6yS2YcL8jHxV4E3iHeLHz/VgxGvyVdj
         wkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466328; x=1752071128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3djKzKi9RtOjzmFIpD9o6j2bbBqvsosVqS09tztwFw=;
        b=fAKIQGbtl+8OBLz+21w0FJRt0xOemQQUf4chGeAKzPoDgNo7UUUOzmv2ymvHiXdvul
         bxbyRUAU7FgjO0XAiqpkrQ1YJ79UjmFAPerj9DYiFtlLupPQ5BNKYMWXRobcBrzyIzZQ
         A8iGhxuJyZ3QT9lYR/5TTZ+PyoOcQEHJZ6H/0cXmGae6MJ756rH0RS9ZAWQkE9jghEQf
         qz/W3rR2UYbKpJ6dOJzzLFzvvXw9ITVhRWSGvCqmsDP8OSQYG2lGEtOZ93qmKM3UPMw6
         0Gc8vFappycY4y/wrifHa/eXjiCyoxxjW7gBInV1i3jNQhRsKLDqSuCOpaAsfXkeFOBF
         fTmw==
X-Gm-Message-State: AOJu0YxiioKXfE0tnya08NvqpxFWAlgpePwLlmpfLHvWSv6/b5T5ZY3U
	ModLkkIMujtZA029qFsDEtwSUeLqEPRadK1dxjYmK38ps5aGDXK2b1GPemETUdhhwXCiTp7ikYe
	G+P6O
X-Gm-Gg: ASbGncvFqBZm0nK010qgjD4Iej0XWevLCSut/aaWfQyy6W/E+TZ1fhmpzGJ57pg8g4Q
	djkC8oOrIsCBft84aE6eRHDv0BPr4zRVeNaB4VtWnbJCcpgZlOKfFfOtRhrIVp5fC0uE1dvdQW1
	qqAUj05zSyJqX6BZm1xIyXMCCGz/4pwlX32V08Wb4IpUNa358qz3EBA30GVmQ//2pVw9MWNZqmY
	ykGq8im4F4P7kcOf8JTJH4JATVxP06JeR8De22Z+5grn90M3sS6rSmd1w7Nu7V216u/2W7G8OHu
	H7L6YkIZPKWMfjK77vxkagw4nZ6/va6i0dapnAFnWXwParIvorSxYA==
X-Google-Smtp-Source: AGHT+IE7MVy2U+/jk5Nvi7vw245BxgwkNKU9txwMaElgjLv+Ieus9UT6GiPS0nlISehTlIuFocOFAg==
X-Received: by 2002:a17:90b:17cc:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-31a90bea999mr4698730a91.29.1751466328242;
        Wed, 02 Jul 2025 07:25:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/9] Patch review
Date: Wed,  2 Jul 2025 07:25:14 -0700
Message-ID: <cover.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219833

Please review this set of changes for scarthgap and have comments back by
end of day Friday, July 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1923

The following changes since commit cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe:

  cmake: Correctly handle cost data of tests with arbitrary chars in name (2025-06-20 12:41:51 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Colin Pinnell McAllister (1):
  libarchive: fix CVE-2025-5914

Daniel Turull (2):
  package: export debugsources in PKGDESTWORK as json
  spdx: add option to include only compiled sources

Guocai He (1):
  tcf-agent: correct the SRC_URI

Praveen Kumar (1):
  go: fix CVE-2025-4673

Preeti Sachan (1):
  ltp: backport patch to fix compilation error for x86_64

Roland Kovacs (1):
  gnupg: update 2.4.5 -> 2.4.8

Ryan Eatmon (1):
  uboot: Allow for customizing installed/deployed file names

Victor Giraud (1):
  busybox: fix CVE-2022-48174

 meta/classes-recipe/uboot-config.bbclass      | 15 ++--
 meta/classes/create-spdx-2.2.bbclass          | 12 +++
 meta/conf/bitbake.conf                        |  2 +
 meta/lib/oe/package.py                        | 46 +++++++++++
 meta/lib/oe/spdx.py                           | 42 ++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc            | 80 +++++++++----------
 .../busybox/busybox/CVE-2022-48174.patch      | 80 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-4673.patch                 | 68 ++++++++++++++++
 .../tcf-agent/tcf-agent_git.bb                |  4 +-
 .../libarchive/libarchive/CVE-2025-5914.patch | 46 +++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch | 42 ++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 .../gnupg/{gnupg_2.4.5.bb => gnupg_2.4.8.bb}  | 11 +--
 16 files changed, 396 insertions(+), 56 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-4673.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.5.bb => gnupg_2.4.8.bb} (91%)

-- 
2.43.0


