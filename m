Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37734CD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10266.1781682487394502430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3svsfyyr;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4629324e170so377817f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682485; x=1782287285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOIbMHKcUwMC7YVEIkmNmF2APM52zJynyBvr+hDCMsg=;
        b=3svsfyyrBOqLQZhuwo6LPvICzxkXHs1HfgMRNAArtNYo+46ke/vamDujZsvrry31fe
         5pEXZlVWoXQWJn3fWRLcqvZs11awZObCmD6yCaS0A6fkxTsc8oHTAQsEuhp58PsnAzk0
         cLez6Nd6XSoVLEEZZrGnNo4aZsvrWuEpr4vRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682485; x=1782287285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOIbMHKcUwMC7YVEIkmNmF2APM52zJynyBvr+hDCMsg=;
        b=rPF0tUA3eiKCr6+dEaQxjDXv3OjPh+i6+HuC4rnFlCdp7rGJH9n8A9wEt/5VoFvbRQ
         FFNUUlfLEi0GBDzGf8kspgzRIJLocF8YSDMmR5xC4zdN0ThpocbIP6xUxJVZyjCxLVcJ
         smQs5b7ullyhUzoyN5h7wWTxytjn/FcOQB/DP6FVznlKZx3WqwbK2CKV9HKpqcWbXwOh
         a0WAJqrfm3KnJWWyeL/DkQFmsW8+NoZvrFXK2ywJAAqzPT5orQOZdNpG6I23mtT5Drag
         AApZPU2JUVLAY+i5/R2Yxt1gcSFP/3RSN94C25rsWpy39CMESmF/NfxfZYSS8ZmbSicc
         t8vw==
X-Gm-Message-State: AOJu0YxyYdKwq1gYIwgF9A84TtlJLSBx+ennpl9AOyyfXXQKDojNojsW
	t+XSBcBhSejSFih/JBW7TfbMXdULNRRB5TI2w0GAyi2T//cE2ttt7MsXdASeah/Q21OD7rjIsLM
	JkeWA
X-Gm-Gg: Acq92OEKCPFeF1okXpZGDNsBgaJW/M6dbzvofC35dWXd5hFcB+u2n7n/7iQ0X7fSDk4
	q1hqmvjWcV1ZFW8U4JyoD7bq2G9BbAMxGEfx0gqBXKBGLoXT7Jb+xe05v4X7z3ofbLV6j5uSF3U
	t63VPacFY8cD2cTWzohTlt/2zhabnBrcz+HqusdMgDYLCtSx3P5usYLMatBgpzJK5NkkV1hssml
	IinwK7eEHiDaQpllIkwM3y5ocutef2A9d/yb7UGLkCnyhKLlM6gRaAoDw3Lc1s5CKpDwqSglXVS
	36QOYiD+L0CtBtw8q+E6OBBxGcF6CvEsXalJnDJpfSK1UA+9Fm+LPt8JXP895Avf7WwxPC2GJkQ
	A15Qk8vO6Vecw77unM9xoREC/nleIbx90sybCjXbFT2U8vJuKni5QsWuW6n66qIxPhrcqAemxCq
	IZSHoYV2/8KFCndzuqwCXS6udourTps6gloBw1ktWxIgv1BQNXICkaJBkB4btlFu0Ip04GP3GOC
	17bm01ANdnbtHFVdw==
X-Received: by 2002:a05:600d:84ca:20b0:492:3071:1db7 with SMTP id 5b1f17b1804b1-492333d8b49mr32668265e9.28.1781682485372;
        Wed, 17 Jun 2026 00:48:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 0/8] Patch review
Date: Wed, 17 Jun 2026 09:47:51 +0200
Message-ID: <cover.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239015

Please review this set of changes for wrynose and have comments back by
end of day Thursday, June 18.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4013

The following changes since commit cd635307ab8460d05d13dbfb3f28efdbde6609cd:

  python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak (2026-06-15 10:50:53 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 530fb9ea9ba6ffe212566d3b95d17b519c52c769:

  openssl: upgrade 3.5.6 -> 3.5.7 (2026-06-16 23:18:27 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  curl: fix CVE-2026-6276

Anil Dongare (1):
  libusb1: fix CVE-2026-23679 and CVE-2026-47104

Ankur Tyagi (2):
  wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
  ca-certificates: upgrade 20260223 -> 20260601

Deepak Rathore (1):
  qemu: Fix CVE-2024-6519

Peter Marko (1):
  openssl: upgrade 3.5.6 -> 3.5.7

Prabhudasu Vatala (1):
  conf/machine: fix typos in ARM and x86 README files

Ross Burton (1):
  curl: fix mbedtls detection

 meta/conf/machine/include/arm/README          |   6 +-
 meta/conf/machine/include/x86/README          |   4 +-
 ...1-Configure-do-not-tweak-mips-cflags.patch |   2 +-
 .../{openssl_3.5.6.bb => openssl_3.5.7.bb}    |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-6519.patch             |  53 +++
 ....03.18.bb => wireless-regdb_2026.05.30.bb} |   2 +-
 ...0260223.bb => ca-certificates_20260601.bb} |   4 +-
 .../curl/curl/CVE-2026-6276.patch             | 315 ++++++++++++++++++
 meta/recipes-support/curl/curl/mbedtls.patch  |  41 +++
 meta/recipes-support/curl/curl_8.19.0.bb      |   4 +-
 .../CVE-2026-23679_CVE-2026-47104.patch       |  89 +++++
 meta/recipes-support/libusb/libusb1_1.0.29.bb |   1 +
 13 files changed, 514 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch
 create mode 100644 meta/recipes-support/curl/curl/mbedtls.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch


