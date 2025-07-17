Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10259C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:55:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.40198.1752720941871728079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a09BHsX2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so434261a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720941; x=1753325741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sfb6PjEzvUNblK++oagRdHixh1lT2nm7noj7yhYrLfc=;
        b=a09BHsX2kHqhUwrdhQUGpbb9JIl0/RJKtYdnEVNd/LGmuNyPYBNtxYiPnDT2Cmjcwh
         BDsPOs+Q+IICMEyH81c6Ei4QDWf7jvnPoGjqAmEBk76N3Kp0fcDn+jPHF9HbHBEdAkHC
         sIWNXnal+E2Cs3XtZIhxdxGLMNg0g1EjV08J3H7FJ/UrEJBXnoK0JTr5YIGvzs3LW32g
         KMkj9MxWnn2UMB0q6mnsPQEmCoG4ubppJg+pI8Ut5DtxMRUgBPsGIzwDvHzsFxY4nrdq
         2ObfA4zof/+wrpX3Jyo5T+qarPsbVutFPOBI6vSv65VFHtglVLu9cq01qkHIGkXDUjkf
         +nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720941; x=1753325741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sfb6PjEzvUNblK++oagRdHixh1lT2nm7noj7yhYrLfc=;
        b=xSp7EznCWtJkWKXuoHcjEA6DQC5NSuiUGecrpUEeLS4iNtmMQShnUMqySZ8y74bZZ0
         trB2NmybVQ3uaHeBpkxZnZ/hbkKJjw3aQsPJ6xbO7mWuf7DW5fe4WDjucEROMD0ORGIj
         yVgnypbqyZUWMDs7xmUkoC7fqIT7GTqKwVTShYKA8h7hnCeQ0VXVD0TYjxxc1DyV6j+A
         iFyFGXjh+LBKHcRI7dOV0UiUNUvc5duHZtOVoq0O1Y9BzjFcvskVFw38SA5VUM3qmyHS
         kcZc4ertKCmpAnMJPib2fv9ZI9kzIPTtoA+AupXQoeqaZiSVvtVP3OChL7PTWaCZjqzD
         mqDA==
X-Gm-Message-State: AOJu0YxDenr2AH09QMe0T08zrGRDedbqeQ7xMtZb09NJ+ROqXPKqZtx2
	EwRFrCwqysWLw7LYaA4WAkYfi/63W6bJiLob19Zyzqr3JarTDoR1+Uo3hEDfrkuiFrRFDyruguD
	kjgd0
X-Gm-Gg: ASbGncvBSimJr0Yx0Sv1i7w5+OxouzZ9qhPLcm0r+rvgMH79S7nW2Mi8P5e690PtcTJ
	ARutn8AIB+vrvjZoWhWXfqFb/APHc4G+3Y6h1HKvF0cRkGaWTKYZpNZgM0+EnC4gCJFtPbWpXPW
	Pc/+JF5xVMNVPOqdFBqDVtOdutdjcvU/ahoi1Rs4EcJ+VSbrQTV5R3LoKUgn+dU7DnYoE2hezjT
	RG9c5DWhQtWSUArzRclt2bCqUk1Rw9NZft6fD72P8xOmmerPKdiUvdNn3MFZz6iaxA21msD1Hm3
	ab2fknDA2x19R2TkhvJY7T+oQEcCkwdANQkyvvthzhUp/UvVM78GX838dBqjkXigP8Q2UhpHnJD
	Hu5TnIGJrgMFdww==
X-Google-Smtp-Source: AGHT+IG7/VSaCiVsKADZHH7VHQDOgrjS5GC3GSsqeRBNORnW+lG2lAPJl1Is6tLFgBIkFOHbZusb0A==
X-Received: by 2002:a17:90b:544f:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-31c9e6fbc9fmr7236105a91.12.1752720940688;
        Wed, 16 Jul 2025 19:55:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/13] Patch review
Date: Wed, 16 Jul 2025 19:55:23 -0700
Message-ID: <cover.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220486

Please review this set of changes for walnascar and have comments back by
end of day Friday, July 18

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2030

The following changes since commit 4225c9abbc68e1a29a54927a9c8e1fe12208e5b4:

  ltp: backport patch to fix compilation error for Skylake -march=x86-64-v3 (2025-07-11 09:55:25 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Archana Polampalli (1):
  gdk-pixbuf: fix CVE-2025-7345

Deepesh Varatharajan (3):
  binutils: stable 2.44 branch updates
  binutils: Fix CVE-2025-5245
  binutils: Fix CVE-2025-7545

Divya Chellam (3):
  libxml2: fix CVE-2025-6021
  libxml2: Fix CVE-2025-49794 & CVE-2025-49796
  libxml2: fix CVE-2025-49795

Jiaying Song (1):
  ruby-ptest : some ptest fixes

Peter Marko (3):
  busybox: apply patch for CVE-2023-39810
  curl: ignore CVE-2025-4947 and CVE-2025-5025
  iputils: patch CVE-2025-48964

Yash Shinde (1):
  binutils: Fix CVE-2025-7546

Yi Zhao (1):
  kea: set correct permissions for /var/run/kea

 .../kea/files/kea-dhcp-ddns.service           |   1 +
 .../kea/files/kea-dhcp4.service               |   1 +
 .../kea/files/kea-dhcp6.service               |   1 +
 .../busybox/busybox/CVE-2023-39810.patch      | 136 +++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 .../CVE-2025-49794_CVE-2025-49796.patch       | 189 ++++++++++++++++++
 .../libxml/libxml2/CVE-2025-49795.patch       |  75 +++++++
 .../libxml/libxml2/CVE-2025-6021.patch        |  59 ++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |   3 +
 .../binutils/binutils-2.44.inc                |   5 +-
 .../binutils/0018-CVE-2025-5245.patch         |  38 ++++
 .../binutils/0018-CVE-2025-7546.patch         |  58 ++++++
 .../binutils/0019-CVE-2025-7545.patch         |  39 ++++
 ..._rm_r_no_permissions-test-under-root.patch |  32 +++
 meta/recipes-devtools/ruby/ruby/run-ptest     |   2 +-
 meta/recipes-devtools/ruby/ruby_3.4.4.bb      |   5 +-
 .../iputils/iputils/CVE-2025-48964.patch      |  99 +++++++++
 .../iputils/iputils_20240905.bb               |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch |  55 +++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
 meta/recipes-support/curl/curl_8.12.1.bb      |   2 +
 21 files changed, 800 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49794_CVE-2025-49796.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch

-- 
2.43.0


