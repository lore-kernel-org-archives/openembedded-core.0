Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F0C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:06 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.13925.1699451217553053974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WjM5ehPs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ccbb7f79cdso28325205ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451216; x=1700056016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6Jw/ykyAtJWu3jflga0sBXfpQGVJHIe9RcNtfHQ+tk=;
        b=WjM5ehPsg1eq6cduya879yFEY8IwyMR/pw0gGzWf2HU20U1A2lPkahdolPO03NkLpG
         4OLgBWVSZ3zjDNAXIQg+2NxeAxK4aMQDxiQKgoPRGVkST9hvMnP12IAUfXVYtudV3Ma8
         ULmzzhsBfaCGqJ8pkubH/OMEACTj/PrziubJd3S5jfrS1rnAfv9v+OzFivumoZ1cXoLe
         11X7Cw7Y0BB6EDdKv4cUYLa+LeakECiPGIdlTLfu6N/Ld9Y3+oGWAWHX6ldCOeEwLbBk
         GPe5BUYRu4uMPlXNE0CN2oUu53QAKnbwyffWNDFupwHHE7FfJctJnM3mxBwUmeymRhvb
         jqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451216; x=1700056016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6Jw/ykyAtJWu3jflga0sBXfpQGVJHIe9RcNtfHQ+tk=;
        b=FPkKtQiCm7CIDl90mGoI0uZkFpFQst9xMWoYnMhsV55pJx0XJtdb94Js4rh6nDVp+x
         sBit7aXXk6yH/G0XaRgpiguiea1XKYkyQT0MsKlGQt4NUo175IyhTjckyK5aop4LHXxE
         q/pVPcBnK4cZjCovzJggifbGanS9aiIpIMRt0G/OWNIt3Dk3yt0Dpb57vw4Y0udEB2tp
         OQ7ldRT0bLLk9CpfVjE0MaWhY4z+GLqRX0dPIkhUG0Rx3AbLYuzOREMkfaKAP++bWcWT
         Eck+bTYSvuuodrH/a1fjOIgUMy9WFIVIuJ3VhlLiJ1+5SyI4C8ezNdG866sdX0IVeNiG
         gnZw==
X-Gm-Message-State: AOJu0Ywov+MCHze/ArgLmmcuoeliZxikv+aARUPE838HMsGCffO3h0um
	15wJV1qP6/1qGnrbQVXKUB2ez8tMY8xgDOiRp4YXsw==
X-Google-Smtp-Source: AGHT+IHOvaaITkZH6pCybY0H0LbdHeVWaLjAUwoH8X65YVWPb8YuMHuEvDrFJebrULUxK/u7m+Xgtw==
X-Received: by 2002:a17:902:9b95:b0:1cc:5a1c:3d94 with SMTP id y21-20020a1709029b9500b001cc5a1c3d94mr1664273plp.18.1699451216412;
        Wed, 08 Nov 2023 05:46:56 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.46.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:46:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/10] Patch review
Date: Wed,  8 Nov 2023 03:46:41 -1000
Message-Id: <cover.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190326

Please review this set of changes for mickledore and have comments back
by end of day Friday, November 10

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6156

The following changes since commit e9ca1405b732720ff72d379e0262a78bfd2e7d53:

  busybox: Set PATH in syslog initscript (2023-10-19 04:34:38 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Chen Qi (1):
  systemd: backport patch to fix warning in systemd-vconsole-setup

Mingli Yu (1):
  curl: Fix CVE-2023-38039

Peter Marko (1):
  openssl: Upgrade 3.1.3 -> 3.1.4

Ross Burton (4):
  pixman: ignore CVE-2023-37769
  cve-check: sort the package list in the JSON report
  cve-check: slightly more verbose warning when adding the same package
    twice
  cve-check: don't warn if a patch is remote

Soumya Sambu (1):
  libwebp: Fix CVE-2023-4863

Xiangyu Chen (2):
  shadow: Fix CVE-2023-4641
  linux-yocto: make sure the pahole-native available before
    do_kernel_configme

 meta/classes/cve-check.bbclass                |   2 +
 meta/lib/oe/cve_check.py                      |  13 +-
 .../{openssl_3.1.3.bb => openssl_3.1.4.bb}    |   2 +-
 ...l-return-0-for-missing-creds-in-read.patch | 139 ++++++++++++
 meta/recipes-core/systemd/systemd_253.1.bb    |   1 +
 .../shadow/files/CVE-2023-4641.patch          | 147 ++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 .../xorg-lib/pixman_0.42.2.bb                 |   2 +
 meta/recipes-kernel/linux/linux-yocto.inc     |   5 +-
 ...23-5129.patch => CVE-2023-4863-0001.patch} |  20 +-
 .../webp/files/CVE-2023-4863-0002.patch       |  53 +++++
 meta/recipes-multimedia/webp/libwebp_1.3.1.bb |   3 +-
 .../curl/curl/CVE-2023-38039.patch            | 209 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 14 files changed, 580 insertions(+), 18 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb} (99%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch
 rename meta/recipes-multimedia/webp/files/{CVE-2023-5129.patch => CVE-2023-4863-0001.patch} (97%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38039.patch

-- 
2.34.1


