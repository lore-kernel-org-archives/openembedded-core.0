Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6E0CC6B1C
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:49:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10747.1775116168248968185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fZBrEwac;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f454be5bso17545855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775116166; x=1775720966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqWxngHRtoSntDaQUNhgY22bCobI3R95bqRT4EOEvaA=;
        b=fZBrEwacZCU26DCogwdlALXyvWRa34m1aJ0ZRj8igVzPClyZxjch5hhvFprOy3UpbI
         mPvzP3vDFXhmuDf1rO6oJhHwd5Xno0xlANy3YTKyVTrRey4RM3jhct3G/ReZQWaLdWyd
         VBRzjrbuj9V5VGnCT3VDKO9BQG62N+6gcbe9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775116166; x=1775720966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqWxngHRtoSntDaQUNhgY22bCobI3R95bqRT4EOEvaA=;
        b=fPx8+aBrXrUOYzDBZgmPSiN3XphPQg3+hLxrPlXAquj9Y0wwNz1fkLEsaZgNyKODUJ
         zsDCwHRk9JVoi6wmh5aunB51LOGYbfz6gj5H9vODgLNut8S92N2Rkskq2vgnDYfEKZuZ
         eoIIu724tYHQ/uBRqNB5S7uOBX48FHq6NDr0BxxR6r1WBtJVujSefwQCpM0JPObkM7nX
         P1JQO7ZbDzJOhlZeNt2p+RArNGklVb1vj4X2Je063J8FJtDohfPpnjlt0Wrr1vNJ3f8H
         8b0s3rbyGqw01KeGbrhxQCAwsFT0W1LwiMQj3rEgHNYzy60VexEjSHMgGUqwzgGZt6rZ
         E0YQ==
X-Gm-Message-State: AOJu0YyUrVOtqrjX6n9Cr4LV3r6NMO+JT+SNr83yM0NdtXJyLw0rz50r
	8OFyPkqnKzJaUyNHx3EIrN5S0KrtSTesAuUTsm+R5F5iXrAY2PP58lI4/vPv3xX45a6X4LXq89q
	H7mtn9Lk=
X-Gm-Gg: ATEYQzxucTcgmceQqnX7KnoGLC/6XtGZ/aLJwEVimNgxYiiwcu8KJT6gngznDhgFN/S
	4Ez0Vtk9VkYH8qWhgRNRlOtCcbxhs4Rz1DVwHZ/nHyE1KzgqAaFyk3JHXOu7aFKSwPmOyZcp5KF
	tdInLgdWY5L9y+KFJC7/BsXSLzjz/Svza6GvGjBdNbdS2jtUflrBMFXZWpk2nAsAi/I9Bov2MbQ
	zm413sbrgNoO6kwb++M20BoLKtpf7tWwLxnnowm+Y93F1zVSYA1KmjRDemaAgoSgUO9NsO7aZU+
	StncjvR0jh0FVav8kBgKhSRmc+DINuBQIaphOcAhsYqBM2kdCbwfW6FotEcCfJEyO8oloZWR+I0
	e1zQNyzWp00gTVKpRWtIUeHN/gdAC3XHhL5lA9N6RDfnl+F4NreJbStMk2IwjqMEjcN7rAQotgP
	1l2AgCgSeH0Aru1gDAUINebmtpnwCWgQp6QJ5S+cgcTNSebXjicXIQHfFFPcxnpZLyhrn23bLh5
	KVBgYWp4gPd/ndj26VDIJBO2sg=
X-Received: by 2002:a05:600c:a405:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4888e078f42mr18342615e9.8.1775116166226;
        Thu, 02 Apr 2026 00:49:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8dca46sm69989025e9.30.2026.04.02.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:49:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 0/6] Pull request (cover letter only)
Date: Thu,  2 Apr 2026 09:49:04 +0200
Message-ID: <cover.1775115851.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234503

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1774939987.git.yoann.congal@smile.fr/

Passed a-full on autobuilder (same as the above review request):
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3558
Got some failures caused by disk space on stream9-vk-1 worker. Successfully rebuilt:
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3498
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3444
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3502

The following changes since commit 41597b5260fb5ca811d0fb4ae7e65246d61734eb:

  Revert "scripts/install-buildtools: Update to 5.0.16" (2026-03-26 09:48:20 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to d0e844108702e553950cab60d51f1cc4cfeed993:

  gnutls: Fix CVE-2025-14831 (2026-03-30 16:36:58 +0200)

----------------------------------------------------------------

João Marcos Costa (Schneider Electric) (1):
  spdx: add option to include only compiled sources

Nguyen Dat Tho (1):
  python3-cryptography: Fix CVE-2026-26007

Paul Barker (1):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c

Vijay Anusuri (3):
  python3-pyopenssl: Fix CVE-2026-27448
  python3-pyopenssl: Fix CVE-2026-27459
  gnutls: Fix CVE-2025-14831

 meta/classes/spdx-common.bbclass              |   3 +
 meta/lib/oe/spdx30_tasks.py                   |  12 +
 .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 .../python3-pyopenssl/CVE-2026-27448.patch    | 124 +++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 109 ++++
 .../python/python3-pyopenssl_24.0.0.bb        |   5 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../gnutls/gnutls/CVE-2025-14831-1.patch      |  61 +++
 .../gnutls/gnutls/CVE-2025-14831-2.patch      |  30 ++
 .../gnutls/gnutls/CVE-2025-14831-3.patch      |  45 ++
 .../gnutls/gnutls/CVE-2025-14831-4.patch      | 200 +++++++
 .../gnutls/gnutls/CVE-2025-14831-5.patch      | 500 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2025-14831-6.patch      | 119 +++++
 .../gnutls/gnutls/CVE-2025-14831-7.patch      | 150 ++++++
 .../gnutls/gnutls/CVE-2025-14831-8.patch      | 105 ++++
 .../gnutls/gnutls/CVE-2025-14831-9.patch      | 421 +++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   9 +
 18 files changed, 2046 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch


