Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4468ACC6B01
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9310.1775107329527039069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zipk/QT2;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so3484105e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107327; x=1775712127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2ckOwGycpOs8vOfrxA+OCsKZT7W2WLalNor9yIEVcU=;
        b=zipk/QT2ZNLw1REEgaIBuRKnbW3NZ+0f+BnI5UBJ2VXOI3+cN3ZIExR4CO8LaWagzE
         4vLdfxZ2w/m4QLG/2loMqR7oTioW0IFW+ppHVT2SmjUqbGmp9yg9DmnHIkGiuUBwO/x0
         94mTtgr0FfOCxINhTzXRiVwmF8U0tvesm6KiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107327; x=1775712127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2ckOwGycpOs8vOfrxA+OCsKZT7W2WLalNor9yIEVcU=;
        b=fBl9F0bVem8eqE4Vvt+oAsQksSsOTrPsRc2hnu8F8JEuQsTTcP0w8iDKAUBi7QnjP2
         3IhFagiqNO26DB+XdUK2mhzcIGgYshk3CBi82r88AfmxbRca4/kWzD78GPStkI3PBWLw
         kbkTs3SxQaSe5jPmgH2DmpLTEa3qgugzIELMowc/dqTA2poKoVrWwYc/SjxA+n+xty1p
         +stnTl8JccZRBRsGC2IZMofLizvR8JBNinkm3i0eJ0onNqns51ZtyptTrvaqrz3K1wCZ
         UOd/kV6Z7R3BF+oxcbvqM81FhOwICW7hzeNaQdARE+z+UnzWF5hujpxn0RxJAYOIpoMw
         42uw==
X-Gm-Message-State: AOJu0Ywmu5ia2j2fQRP2O6m473vk6qdUbgmBKdx8PsRpdeIh6TYVc1sX
	5wUZuzb89duvilYa0dehb7/w1VGm1HB05CbXjlmf0uT9rLF/hGcf4//+yS9WkANGr5fQicQtOHC
	ZAKXUbPI=
X-Gm-Gg: ATEYQzwLl8nbcxIcJAV+FrQByUB/eXlGOt4Pmf4KXnk5U2ZBYCi6kRvd16UvguZHPEb
	JVWcFst9zVwhqTbLbPqTjzdjiq1l4JycKlilaT/nHCSfRTxciUCnW/cGvajB5FXs/Iu8soBbqnd
	E88ha/2viMtx3u79JKWwc95yS1FsSG0qAemKiPuFSfU0WaJ6je7A6UaaiZpQkM3EGTNxmSuVHKh
	DU66ImrzZqRE8qbqUZpj36V4MOj6M9xkqk2Z9XN4Yg60Gw1qDBoIrNOvRay6f3lttiLwINZLGsD
	u1BYRb/gUJajXuBA3q2WLZyuB/OGU25R4ROyM2OYGFL1X8iHSSlbS4JrUqPrf9sOV5HETewQkr6
	Wn4Dsfxn4U0iZzN48NRv1tAFG2XZ3BgalSEmdG+yLNqZs3y3Jte0RQmB8LDCkptMgnz5ZtarygY
	0P0SeHjvnrWAuka9iF4Gb7bZf0Tllh0D85TJGm2V5Ub3jjpfU+vZDbEIs+WHFDX/1OanKsfCHvD
	Stp2T1SgNQO/g69x083U32eDEo=
X-Received: by 2002:a05:600c:c165:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-4888b786676mr28517515e9.21.1775107326986;
        Wed, 01 Apr 2026 22:22:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/15] Patch review
Date: Thu,  2 Apr 2026 07:21:17 +0200
Message-ID: <cover.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234472

Please review this set of changes for whinlatter and have comments back by
end of day Monday, April 6.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3571

The following changes since commit f74c948779850a9759d8b24bb83bb661ff85def4:

  curl: patch CVE-2026-3805 (2026-03-25 08:17:01 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to e8a3acb03d4c466cd08e358953df15746cb5aaca:

  vim: Fix CVE-2026-26269 (2026-04-02 00:08:06 +0200)

----------------------------------------------------------------

Andrej Kozemcak (1):
  ca-certificates: upgrade 20250419 -> 20260223

Anil Dongare (2):
  vim: Fix CVE-2026-25749
  vim: Fix CVE-2026-26269

Changqing Li (1):
  libsoup: fix CVE-2025-32049/CVE-2026-1539

Deepak Rathore (3):
  expat: Fix CVE-2026-32776
  expat: Fix CVE-2026-32777
  expat: Fix CVE-2026-32778

Jinfeng Wang (1):
  tzdata/tzcode-native: upgrade 2025c -> 2026a

Logan Gallois (1):
  oe-setup-build: TEMPLATECONF were not applied correctly

Paul Barker (1):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c

Vijay Anusuri (2):
  python3-pyopenssl: Fix CVE-2026-27448
  python3-pyopenssl: Fix CVE-2026-27459

Wang Mingyu (3):
  ccache: upgrade 4.12.2 -> 4.12.3
  libsoup: upgrade 3.6.5 -> 3.6.6
  libxmlb: upgrade 0.3.24 -> 0.3.25

 .../expat/expat/CVE-2026-32776.patch          |  90 ++++++
 .../expat/expat/CVE-2026-32777_p1.patch       |  48 +++
 .../expat/expat/CVE-2026-32777_p2.patch       |  65 ++++
 .../expat/expat/CVE-2026-32778_p1.patch       |  90 ++++++
 .../expat/expat/CVE-2026-32778_p2.patch       |  59 ++++
 meta/recipes-core/expat/expat_2.7.4.bb        |   5 +
 .../{ccache_4.12.2.bb => ccache_4.12.3.bb}    |   4 +-
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 109 +++++++
 .../python/python3-pyopenssl_25.1.0.bb        |   5 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb}  |   2 +-
 ...0250419.bb => ca-certificates_20260223.bb} |   2 +-
 .../libsoup/libsoup/CVE-2025-32049-1.patch    | 229 ++++++++++++++
 .../libsoup/libsoup/CVE-2025-32049-2.patch    |  34 ++
 .../libsoup/libsoup/CVE-2025-32049-3.patch    | 133 ++++++++
 .../libsoup/libsoup/CVE-2025-32049-4.patch    | 291 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2026-1539.patch       |  97 ++++++
 .../{libsoup_3.6.5.bb => libsoup_3.6.6.bb}    |   9 +-
 .../vim/files/CVE-2026-25749.patch            |  64 ++++
 .../vim/files/CVE-2026-26269.patch            | 150 +++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 scripts/oe-setup-build                        |   2 +-
 23 files changed, 1612 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778_p2.patch
 rename meta/recipes-devtools/ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb} (88%)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb} (93%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20250419.bb => ca-certificates_20260223.bb} (97%)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch
 rename meta/recipes-support/libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb} (85%)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch


