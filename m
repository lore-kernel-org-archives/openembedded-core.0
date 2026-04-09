Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF0EE9DE73
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:45:54 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127632.1775724348239399688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wrqoa7Ns;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso485457f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775724346; x=1776329146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4QrwDi3lxKzR4exzeOUCsCE97/07sXv5VEWmH2NIjk=;
        b=wrqoa7Ns26KeVB5KxPAnzjEuPAaraOgOx29dVWEStJt2+8oyUSnwApyAWnAg0zr86J
         Y3heW3MbxoHNX1yFeg/4FL60gvWRJmHlHQRd0LJU+9UfyZyfJeARi2oVl2LC2TJgPghI
         8VtcS7W2YpSxdmOrhQplXFubYEqfitlsy3Cgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724346; x=1776329146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4QrwDi3lxKzR4exzeOUCsCE97/07sXv5VEWmH2NIjk=;
        b=m+Ev509YNVIAXERCIFpb50HEJj64B56vVNs4yeOVh5t+r5HIIgzeCUAt+QngS0Kc2u
         H8a5cIU+kvu7pbJXXx8Pkjr3B4kF2mttT30EYQKtzqwzl7Sci439BKl0fchaEj5ekB20
         k1orpVkTd5vA6MkjjN5FI9Ho80QsANbZ7yU4aykhF3Efcq5qiJLkosBy0Wjczf31Pbx7
         RrVM1K148/n8i3sQnxb9CQKF7qLyp/mj1mfwsiHChiiAgDvo6Rds5/F/dmi5536WXQGG
         1lbdSxBtkC/8fmN4jQfyr4WmHTrwihfjjuD1U5aNCjtviaLXmXqHBgGKcUfSWspho8rA
         60PQ==
X-Gm-Message-State: AOJu0Yw6XddgX1zPetwnHYFsa9hE1MUxjwZLOfP27L0Q6i1IbDUjmjz8
	0XNfQJ2JOTsIYPgzUK99TdVcKMs8sqX02CoJ188z0wcBHg/AruBc/yLmswIvjiXLlwXAStRiEQh
	96kIeNKL9OPYW
X-Gm-Gg: AeBDietVF6+DBEIjXqVBKenbUiZYoIL4tr+IBG/gJeJ+soa+4MgTuzkNEL3DUkagMJe
	7XkWPjL2n9z9Ijtqit5V7HbHtd1mZ2o5Sh5BP6UyVxy+wGhyIDqA+rbxfgDVh0wG4FNrSLylv7I
	ZTDHBYxwS10fCCh4Yd0THWAXqSmX9AuKPP5qZxdHD3D7+5dIgmDXV1gk1pZ67R4hA/HYYSIvWok
	JjoaO25FzYF+6fsJUS4NYGeMFlUNthgh4l7yoEp16El1U9VAv2RnWOzJPCvDhjsa9U/sUF635gc
	VnDll3hteVAm9+IkCjTBYrmJBFBeYuCmpGYidMAW0N2nPraUaA9mJGOi4LoVwQ5wNapBFC5jvjo
	9NKQnUP3Xg+Oq9bE/MglGq5U1N2ElwjRWsdcQx5v6dJ7YWxmMD9HPH2Y/7wsyuw2+xH1j/L6bEJ
	5h3jiXrFB2EbWJKyRBQijlFnLTLcR6/9zidLZeutapOHG0XJ/OiGqX3E12BIhqPNwZO0i+cjwpA
	ciuR48lsRQtPwdPTJVmEil46Yc=
X-Received: by 2002:a5d:5d08:0:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-43d292a9581mr35807508f8f.21.1775724346275;
        Thu, 09 Apr 2026 01:45:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm67388972f8f.21.2026.04.09.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:45:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 00/15] Pull request (cover letter only)
Date: Thu,  9 Apr 2026 10:45:02 +0200
Message-ID: <cover.1775724198.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234896

Those are the patches from the last patch review (no changes):
https://lore.kernel.org/openembedded-core/cover.1775106968.git.yoann.congal@smile.fr/T/#t

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3571

The following changes since commit f74c948779850a9759d8b24bb83bb661ff85def4:

  curl: patch CVE-2026-3805 (2026-03-25 08:17:01 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

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


