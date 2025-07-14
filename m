Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5A0C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.82365.1752510196534026654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=psuPlWqn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747e41d5469so4730356b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510196; x=1753114996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zePOviK8YTPS6iKGw6fRZQSpJ7qhRhxhodtadfnm4A8=;
        b=psuPlWqnYcd8eYGEFCpRlxgEEw+t1EBmQUt1GCc1h3a/OVP1/MqkLkLm4dLSzVSwbU
         MpY/r1VzFXtj9xNnJW40Q1/SceaA2u0X+/1aKjPyUDMiQq4MsBv1U0I0K+GKJkaF3+Yn
         n8S6gX6/RoF5eVUPd667kW3Zg8FxfjAPtvGRkIjnDs2PBbsINOU+o+Itx5w8RN2bM88S
         Vr5ul7ShDA9a8Csi18qDByF3FWUTL85plK4OyBDhRul4POuptiwHf2NoUqycEwznVayg
         moeGtxqd2u9IOcuO6ztwEk6pSOjFqOsvWdMphoECQBOWFOTSKspPbi9wW/n27nHdBqVC
         F+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510196; x=1753114996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zePOviK8YTPS6iKGw6fRZQSpJ7qhRhxhodtadfnm4A8=;
        b=b7eIT42nNMG/8XDSLrCBy3iMqPtV+SarL1fqq4y9U//EjYVMI1X6FVgfUBFBy0NLV9
         UN7EzkmhCLy2AaZMYjL4Bzd3LUajGORDLkkQ6X9cWAD0gqEPDTgB6pLLJ8PzOAquG7wU
         +KG7hqoFIlI31b02thoNmm0LHJpxNqkjWja3mFarAdT8PEGRWPw6+RmRgWKurNG4V0UE
         ZpzVrdMgRoZUvKaH96BBn0dB782SQchNyiYAxYnw4Xo2Jwwa/MMt5w6cLIZox1fPgido
         AhjaeaMXNQ92TQcAE9lCb9xPlyd0M4SRNU/If5VTJUMwGqu+7AMhVetLGYl9k6RXBjQv
         e9oQ==
X-Gm-Message-State: AOJu0YyS/iRWsxxe8QMztVO8E1dnGDuUB53GVL9EVJI9Wv9eu++5idqb
	MUszBWKHJcJ4kLLIT3oAk+Zky4FrXemq6/IaiRIsH49ADQPTKiIHFjEtMj65d008xJxcPJWdtlZ
	32LP/
X-Gm-Gg: ASbGncuzthxmtn4ZR6w3kc2wA64bZoGnTgtv6GXabE9QjQcJxnv0QIDaWDRJasbgQGJ
	NsLAZTZXyrpt061/p68FODv9ZAfIRnzQDlzqWCKf8PME73NlBxSJJj0mwr7RT1pv0jKhhRV8rXG
	FfSkYI8iPfTH3Iq13egvigGAt9Ysm91iISD0Gmd1oyJkeKq38gUmfqxRo1h2PreswknhdrFDDhh
	vf3lrC95DkBMpJhWrR4cQkDuohNfRkEKqUXgyenw7E1N3NixN37d1sZkPGTEMhWDzSjqhNfqK8E
	HhMjTaHRsizhCTjC6Ppz7mwLcu0exCG+eGXShk1gVNRe60SY2neIiEGujYzUtVJP2cZY98Q7S5h
	aFZCdDh7RM0Qi
X-Google-Smtp-Source: AGHT+IFlYwmmu4bOd2TZWLjHWt3PBOdO0VyU5SNCs9/GKnxYMW6RQWSfHHbnLy4qss+sbpv6HdcK5Q==
X-Received: by 2002:a05:6a00:4fc1:b0:748:f750:14c6 with SMTP id d2e1a72fcca58-74ee244a41emr17783990b3a.14.1752510195367;
        Mon, 14 Jul 2025 09:23:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/15] Patch review
Date: Mon, 14 Jul 2025 09:22:54 -0700
Message-ID: <cover.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220238

Please review this set of changes for walnascar and have comments back by
end of day Wednesday, July 16

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2000

The following changes since commit c855be07828c9cff3aa7ddfa04eb0c4df28658e4:

  build-appliance-image: Update to walnascar head revision (2025-07-04 07:52:57 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Archana Polampalli (1):
  openssl: upgrade 3.4.1 -> 3.4.2

Changqing Li (4):
  icu: fix CVE-2025-5222
  libsoup-2.4: fix CVE-2025-4945
  libsoup: fix CVE-2025-4945
  mingetty: fix do_package warning

Divya Chellam (1):
  libarchive: fix CVE-2025-5915

Khem Raj (2):
  webkitgtk: Fix build break on non-arm/non-x86 systems
  webkitgtk: Use gcc to compile for arm target

Peter Marko (1):
  python3: update CVE product

Praveen Kumar (1):
  sudo: upgrade 1.9.17 -> 1.9.17p1

Wang Mingyu (3):
  sudo: upgrade 1.9.16p2 -> 1.9.17
  libpam: upgrade 1.7.0 -> 1.7.1
  ruby: upgrade 3.4.3 -> 3.4.4

Yogesh Tyagi (1):
  ltp: backport patch to fix compilation error for Skylake
    -march=x86-64-v3

Yogita Urade (1):
  webkitgtk: upgrade 2.48.1 -> 2.48.2

 .../{openssl_3.4.1.bb => openssl_3.4.2.bb}    |   2 +-
 .../recipes-devtools/python/python3_3.13.4.bb |   2 +-
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch |   6 +-
 ...eproducible-change-fixing-784225-too.patch |   6 +-
 .../ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb}     |   2 +-
 .../libarchive/libarchive/CVE-2025-5915.patch | 217 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   5 +-
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch |  42 ++++
 meta/recipes-extended/ltp/ltp_20250130.bb     |   1 +
 .../mingetty/mingetty_1.08.bb                 |   2 +-
 ...ect-check-for-existence-of-two-prepr.patch |  40 ----
 .../pam/{libpam_1.7.0.bb => libpam_1.7.1.bb}  |   3 +-
 ...o.conf.in-fix-conflict-with-multilib.patch |   6 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../{sudo_1.9.16p2.bb => sudo_1.9.17p1.bb}    |   2 +-
 ...ebkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} |   4 +-
 .../icu/icu/CVE-2025-5222.patch               | 166 ++++++++++++++
 meta/recipes-support/icu/icu_76-1.bb          |   1 +
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 ++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 .../libsoup/libsoup/CVE-2025-4945.patch       | 118 ++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |   1 +
 22 files changed, 686 insertions(+), 60 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.4.1.bb => openssl_3.4.2.bb} (99%)
 rename meta/recipes-devtools/ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb} (98%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
 rename meta/recipes-extended/pam/{libpam_1.7.0.bb => libpam_1.7.1.bb} (97%)
 rename meta/recipes-extended/sudo/{sudo_1.9.16p2.bb => sudo_1.9.17p1.bb} (96%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} (97%)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2025-5222.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch

-- 
2.43.0


