Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C42C677C4
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:23 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.37082.1749225617104640369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kTEqp5U7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso2718414b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225616; x=1749830416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc9/f8bQMw26n8fPZD/1M8zltNljl6LsMG+33QiIHac=;
        b=kTEqp5U7XMEjAOOu/eQXoFlBHrNoj4eXjhWKAsc0YvgvSQ+wvcpBeDrZXkiMZHp6Jn
         XRaY9NAJk5HQPOhrGe3BOQdYsdsYGQQLl7nOaNr2saLgrj568dqsyooeYWZ7MKga8u/G
         vvwvlSrVFGdrmXLAehiPz4t/0KEEig/krxt+ZUCN/kMO8BPA4b2bKNxlSedD7dsiY3wn
         49JjledmfraNmSwjgbKkaWAoyLbLh0NoNstKR7NFJw4rBtlIGiAUlTOducCHySZaZeeM
         mZgly0htp4FjY3jr2w5Fg3FTGgRIATp5L3Kj6kkQIpMxfd6Fkpzzi6OcOVvNO3iiDtFZ
         BEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225616; x=1749830416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc9/f8bQMw26n8fPZD/1M8zltNljl6LsMG+33QiIHac=;
        b=LAHNEHEVtBNch3ei+RyPBQdvDElX6RWjg+/iiBjxMqTyLaLpW0qHkP9SdMHw6OFAvG
         LpckLfWBPU0HXbDHVD/En0MKYfg+d1pgoOsVxkCOueCOdTKpTRfRxcpyXQHTDVVsf/ST
         3gHg0sMxCq4qQrRnFvFax7ymbc+ksD45vwmhSv3jjVnlNSrhbw2+/CaZxLpI3hw3/pJb
         oPcmSb9tbZ8VyeMLxnmMFz9aan2McgtS1Q6uGmeAgx4+RQh1d9ihY3m2ttD6Htfav5r+
         4IGsEDLiFgLXCV+nbiDNebcbEZ7hZIOvlOPOI+KZ/GbrqirgetNMoK/6zZpETlgFse6L
         5ZOA==
X-Gm-Message-State: AOJu0YyrvBByUuAkQO8S+bJJ1T6Dbm7j3TtYoM2mSgIR2aGSTKvjZ9O2
	rYhoLFZEoaAIpORznV3vS6BHyiJkFfPo1oJQ10huqDqco86YVLWZlczI2fqpKJubEBVQu3VIWkG
	dXSBG
X-Gm-Gg: ASbGnctgLuU5dqUJTm+W5kr0i7c48lFokqq0hUlFucp2xY6kIM9PlFfzsUs+jlQTpyG
	klXvu9F8cMxtvDUjQtwZQwNXkhXN9lGB/tX+wdRy0P/Ikpct1b6QG0Sz0fXPzMgnq2RK4qEkVUn
	lh/wauwb4zWHgWpuFf1+WjaIeRRFMoggaq5JpXoDKJh3WsaDS+shWNh6oODvzir0i53KFY4CeL4
	CJej9+zDfE/OAwaxTefJdFQXh/ii2XbB94SNmVUYir7DTc/IK+K/BKtBawR3UMn59u7iASLlJFz
	AdMDHsT7Juc7BE7p94YhwpCFBHMBNKzXradLjrTyF4s=
X-Google-Smtp-Source: AGHT+IEZDhJNzngTct/Wh0iMFBHIZiHCO+TUNJ0stUum6MoWB++6VXjAnAPJvs1Az93DlNS3vOp37g==
X-Received: by 2002:a05:6a00:cce:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-74827e50eb9mr5541914b3a.2.1749225615802;
        Fri, 06 Jun 2025 09:00:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/12] Patch review
Date: Fri,  6 Jun 2025 08:59:53 -0700
Message-ID: <cover.1749225417.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218162

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, June 10

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1740

The following changes since commit d1b64f190c1686f081f5ba2c4f2b320048f6a514:

  sstatetests: Switch to new CDN (2025-06-02 07:21:18 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (6):
  libsoup: fix CVE-2025-32908
  libsoup: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix do_compile failure
  libsoup-2.4: fix CVE-2025-32053
  libsoup: fix CVE-2025-32053

Deepesh Varatharajan (2):
  binutils: Fix CVE-2025-5245
  binutils: Fix CVE-2025-5244

Divya Chellam (2):
  screen: fix CVE-2025-46802
  screen: fix CVE-2025-46804

Guðni Már Gilbert (1):
  systemd: upgrade 255.18 -> 255.21

Vijay Anusuri (1):
  python3-setuptools: Fix CVE-2025-47273

 ...55.18.bb => systemd-boot-native_255.21.bb} |   0
 ...-boot_255.18.bb => systemd-boot_255.21.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...1-missing_type.h-add-comparison_fn_t.patch |   2 +-
 ...k-parse_printf_format-implementation.patch |   2 +-
 ...tall-dependency-links-at-install-tim.patch |   2 +-
 ...missing.h-check-for-missing-strndupa.patch |  10 +-
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   2 +-
 ...005-add-missing-FTW_-macros-for-musl.patch |   2 +-
 ...06-Use-uintmax_t-for-handling-rlim_t.patch |   2 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |   2 +-
 ...patible-basename-for-non-glibc-syste.patch |   2 +-
 ...implment-systemd-sysv-install-for-OE.patch |   2 +-
 ...uffering-when-writing-to-oom_score_a.patch |   2 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 ...-not-disable-buffer-in-writing-files.patch |   8 +-
 .../0013-Handle-__cpu_mask-usage.patch        |   2 +-
 .../systemd/0014-Handle-missing-gshadow.patch |   2 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   2 +-
 ...ass-correct-parameters-to-getdents64.patch |   2 +-
 .../0017-Adjust-for-musl-headers.patch        |   2 +-
 ...trerror-is-assumed-to-be-GNU-specifi.patch |   2 +-
 ...util-Make-STRERROR-portable-for-musl.patch |   2 +-
 ...ake-malloc_trim-conditional-on-glibc.patch |   2 +-
 ...hared-Do-not-use-malloc_info-on-musl.patch |   2 +-
 ...22-avoid-missing-LOCK_EX-declaration.patch |   4 +-
 .../{systemd_255.18.bb => systemd_v255.21.bb} |   0
 .../binutils/binutils-2.42.inc                |   2 +
 .../binutils/0022-CVE-2025-5244.patch         |  25 +++
 .../binutils/0022-CVE-2025-5245.patch         |  38 ++++
 .../CVE-2025-47273-pre1.patch                 |  54 +++++
 .../python3-setuptools/CVE-2025-47273.patch   |  59 ++++++
 .../python/python3-setuptools_69.1.1.bb       |   2 +
 .../screen/screen/CVE-2025-46802.patch        | 146 +++++++++++++
 .../screen/screen/CVE-2025-46804.patch        | 131 ++++++++++++
 meta/recipes-extended/screen/screen_4.9.1.bb  |   2 +
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
 .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
 .../libsoup/libsoup-2.4_2.74.3.bb             |   4 +-
 .../libsoup-3.4.4/CVE-2025-32053.patch        |  40 ++++
 .../libsoup-3.4.4/CVE-2025-32907-1.patch      | 200 ++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32907-2.patch      |  68 ++++++
 .../libsoup-3.4.4/CVE-2025-32908-1.patch      |  89 ++++++++
 .../libsoup-3.4.4/CVE-2025-32908-2.patch      |  53 +++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   7 +-
 49 files changed, 1053 insertions(+), 170 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.18.bb => systemd-boot-native_255.21.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.18.bb => systemd-boot_255.21.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.18.bb => systemd_v255.21.bb} (100%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46802.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46804.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch

-- 
2.43.0


