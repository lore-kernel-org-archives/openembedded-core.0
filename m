Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BCDFF60DC
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 06:57:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14605.1774940245639426431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 23:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UEO+quaI;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486ff201041so52356935e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774940244; x=1775545044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ASOtGUMfBgdp8quTOXCzwyuqLCEwanma3RM7Dcv70A=;
        b=UEO+quaIQm0U30Eg1bt8KKpCix0hw6ZSh0B7/uUxw2Prnmh0I2ysP9QFsyu9kYy3iR
         RLJOSp2nFXaiwjXPeS/ksVEIrl1k/vCSUF7ERsaP3Yc08jAj9h+B31AgcyfPsULeGEx2
         n2QgMzOzpYmX80GFjvOBQZ8lcBqrFNIPPyd2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940244; x=1775545044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ASOtGUMfBgdp8quTOXCzwyuqLCEwanma3RM7Dcv70A=;
        b=bbsDwG+oKPPfqcpt5B4rZ3thdIWFgRymHev2uI7jN6NzM5KIwBcYI3AdT8n+VwYEBl
         aRh425zGyZV1Hlk7KzCmILS+M2SOXZv2QWBnNmh0+RcPs0wKSCU++/waWFJvmENUndB3
         dzburNVejZ6nsHNW5zYbP+RmjupVf9+EQHr+D937esQ+mOYyEuPF6i4dMWqdsFBBUYKv
         EMjgzWFfKfldq33Xn7UrR1vKNsMGTo8KY+IJ5NhBKdG+15AWq6BErkvIUHjYKyDuAp2u
         uquamKsrsHJUX9BavpiAeij2T4UVHMNMPoPcODdXXuaClrGWLjSKsgrhPWNGzc6o9Ff1
         3OWQ==
X-Gm-Message-State: AOJu0YydVlqFfUUPCtA45/4oYTzSplDPuTAMzcMV9Lf3FDL7C5UKXaLe
	zKIh3rnKif79dP83H8c6pK07LB7aB/jCV1CK6pbU5kfqN/mg7SjlF0gHiWSDPSTAa7ISTKjhCrK
	P0LESiQ0=
X-Gm-Gg: ATEYQzyLuy9ezXt7KL9e0EHUrN6ZvjuK1kLhQyJlVLTKgp+b0BxmLZFVyJriyTIWbIE
	pwaj3NkEWUQUwtYoVoCodUQNe2kBarYg5JFQlZK+bF8uwHdiL3R+itMEm0MHPbq7t1jKL5seMJi
	pYTt88qKRHUAsybSatZJnooWZWJD+FwxEIccTantP2+iHt/2ueqo5ub3cvshzzdDZqqwLJoaCys
	Mc6lVBj98oCGhdBCIfyomsbUbKXhLcBM0p7Guq3osSpTuee5cmAbxGMzFvfkyC4eyQV7kgnuJen
	5TjSFNBpwHA4RJpXSzx09kEUF4tZqWKFQ0UF8+/sc2TEEewhpf1M8uOJC4ZU887ibXQU/MoqA/5
	RgmVdoBaEUzAI8tlV2iqlxrzrjjLhohrq1VSgX4i8THHKnh+vHjjMZJoXSoj6QzEj6wLxGJcNIY
	Tw0OTvkmPY5rL3fV7Asen6M1gVfG6tWH09Y88vT1FkbiEDSaYQZ1Gh56knIJwGayb2ICVNu8+vn
	7SCSoQy1nwwowrKW6Th9HN5umZVq/AXP5UtVA==
X-Received: by 2002:a05:600c:a108:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-48727d6f6d8mr208050105e9.10.1774940243349;
        Mon, 30 Mar 2026 23:57:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a546esm11016455e9.5.2026.03.30.23.57.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:57:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 0/6] Patch review
Date: Tue, 31 Mar 2026 08:56:57 +0200
Message-ID: <cover.1774939987.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234262

Based on reviews and discussions, here is the updated state of the patch
review request:
* Updated "python3-cryptography: Fix CVE-2026-26007" to v2
* Re-added "gnutls: Fix CVE-2025-14831" v2
  * This one is quite big but its equivalent has already merged in
    whinlatter
* Removed the series for glibc 2.43 support

Given the change and the release build due this week, I don't plan to
extend the review deadline (end of day today).
Ping me if you need more time.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3558
Got some failures caused by disk space on stream9-vk-1 worker.
Successfully rebuilt:
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3498
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3444
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3502

The following changes since commit 41597b5260fb5ca811d0fb4ae7e65246d61734eb:

  Revert "scripts/install-buildtools: Update to 5.0.16" (2026-03-26 09:48:20 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

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


