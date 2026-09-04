Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D80C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:23:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9189.1788510193168118108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GfLbviO2;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so5639365e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 01:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788510191; x=1789114991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ok+WhNdEJGVr8d1uyJXGP0DCUgVkjvShxxDO2rgqjvA=;
        b=GfLbviO2QeTDQb/CGAZv0UM98QaphTucoKzjTZsPRleWC5VOF52TZQYKczTYi/kSA8
         5X9b3g+NCnIJkuy2vS+wLhXFCFZdgn2iB19iUPl9gZCwvi/Cg0iQoYG4yp+rwFNIm0QO
         yX8Fj66CDrcgzHo4uu/h2gO54biw/XwJ+rLr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510191; x=1789114991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok+WhNdEJGVr8d1uyJXGP0DCUgVkjvShxxDO2rgqjvA=;
        b=A8+MXmxg+dpi35GIqQR7zjihicmyrs+aF0IJFnpI7b5dA0TknaqrrUBE+8Mi+c9SSO
         4RzeM4rexWANBZIcIgqcmLMeYSsUnt4eRiW0MNVq9ae2SgMmnktdj6qF9E2ijcSO8233
         Jxi8skMtk/MxipCASLwuDh31QpF+JqNdoBc4w4t2Vd4emthCaA5b+gC9TzYD1FDcO9bP
         ZSf0qgZxqzdLr2ZTH1obQlCoqPo79soH3feJ676x2Cwap4n9PrVegurjwN6rl6T6XkzI
         ohOgB29MjhglMkk8pvBvBUGqaS8zNzkmNag/spqGNiZKwq2ZuifNnWKIR4ZtlaCvt49M
         tZ1A==
X-Gm-Message-State: AFuF++kG7ypI6Z9UnNfVOhkqPRCpGfdwri7TL5jp2WPE4ZNc35+qHQjK
	9fIuyxrS0V/PtxU7hfYr9vqqov8FWd0ovLnxyIp1b1G4iwagGjTcb5EIkwon547QyJbswSeA2Y0
	RdgoJhh4=
X-Gm-Gg: AYBFou3De1VddfSCSC1fKEs5we3y4No2Hv/P+3pQf9GlHld2U7iJXW8giarq1Q6l13y
	s6MpC7yNfDRUT8B4A6m7I7Gqo5elSOOBOTjA7t342i9jDUYV4nU0cbthPvGcdigJ+fXuNOAxDa3
	k9U8IRYMseKl8RvHsFAuHSlnVqNJC19ESjGEWK5xbVBR7hJgeONeGfSCElbYd5usH99jK2lb0tx
	vWhbsrqkJR4/QZpbCRCbJrro+AlpXBZz81gPdGUk6eygAWWGoFTpQGEY1Wg1CnMSzs3WHEKyOsT
	sca0f2GUQRGmRNcNicLBr3+vyb8GuCVY3Kgf1RvTBZl9jrA6yZ9OFu9mZlY742i6UxclQEk8tS5
	AF7vqxwO7bm4bcpbnqUgluCsOd8iH+7fc4FoCO2/H3lsEIFJzsW8MmMpPUgU27mNTwKcVRnmHGb
	4jcqluICufaQGhmCh/rpYpwNPmTJRVypUs1FY7nDdvAJwn4O7va2rjxsdOqimM1hvhCjldQvH4p
	7NiSnncklkMik4TMPfVtVxhvp/My2K+gTTzFFIHazQg8BxcsQpt1eI9XtjOOMY=
X-Received: by 2002:a05:600c:620d:b0:49c:fc6e:a3d6 with SMTP id 5b1f17b1804b1-49cfc6ea731mr15892015e9.21.1788510191159;
        Fri, 04 Sep 2026 01:23:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa009911d943005f4464.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9911:d943:5f:4464])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm82562395e9.3.2026.09.04.01.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:23:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap 00/27] Pull request (cover letter only)
Date: Fri,  4 Sep 2026 10:22:40 +0200
Message-ID: <cover.1788510042.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 08:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245069

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1788326578.git.yoann.congal@smile.fr/
(no review, no change)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4636

The following changes since commit 310eec2cb646d7d1a3ca99bad7e37495bb418a0d:

  build-appliance-image: Update to scarthgap head revision (2026-08-28 09:52:39 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 1b1e13055b4eed838e1411d91dea46de08e1d72f:

  patch: Fix CVE-2026-56288 (2026-09-01 17:07:13 +0200)

----------------------------------------------------------------

Emily Vekariya (2):
  python3-pyasn1: Fix CVE-2026-59886
  python3-pyasn1: Fix CVE-2026-59884

Hemanth Kumar M D (1):
  glibc: fix CVE-2026-5435

Hetvi Thakar (5):
  wget: Fix CVE-2026-58469
  wget: Fix CVE-2026-58471
  wget: Fix CVE-2026-58472
  patch: Fix CVE-2026-56289
  patch: Fix CVE-2026-56288

Jaipaul Cheernam (4):
  systemd: Fix CVE-2026-29111
  perl: fix CVE-2026-13221
  perl: fix CVE-2026-57432
  perl: fix CVE-2025-40909

Martin Jansa (1):
  socat: fix native build on host with newer glibc

Peter Marko (5):
  python3: upgrade 3.12.13 -> 3.12.14
  systemd: upgrade 255.21 -> 255.22
  libarchive: handle CVE-2026-5121
  libarchive: patch CVE-2026-5745
  gnutls: set status for CVE-2026-1584

Siddharth Doshi (9):
  vim: Security Fix for CVE-2026-55693
  vim: Security Fix for CVE-2026-55892
  vim: Security Fix for CVE-2026-55895
  vim: Security Fix for CVE-2026-57452
  vim: Security Fix for CVE-2026-57455
  vim: Security Fix for CVE-2026-59856
  vim: Security Fix for CVE-2026-59857
  vim: Security Fix for CVE-2026-59858
  vim: Security Fix for CVE-2026-57456

 ...ixed-strchr-with-const-for-new-glibc.patch |   38 +
 .../socat/socat_1.8.0.0.bb                    |    1 +
 .../glibc/glibc/0024-CVE-2026-5435.patch      |  137 ++
 meta/recipes-core/glibc/glibc_2.39.bb         |    1 +
 ...55.21.bb => systemd-boot-native_255.22.bb} |    0
 ...-boot_255.21.bb => systemd-boot_255.22.bb} |    0
 meta/recipes-core/systemd/systemd.inc         |    2 +-
 .../systemd/systemd/CVE-2026-29111-01.patch   |  170 +++
 .../systemd/systemd/CVE-2026-29111-02.patch   |   85 ++
 .../systemd/systemd/CVE-2026-29111-03.patch   |  106 ++
 .../systemd/systemd/CVE-2026-29111-04.patch   |   35 +
 .../{systemd_255.21.bb => systemd_255.22.bb}  |    4 +
 .../patch/patch/CVE-2026-56288.patch          |   75 +
 .../patch/patch/CVE-2026-56289.patch          |   36 +
 meta/recipes-devtools/patch/patch_2.7.6.bb    |    2 +
 .../perl-cross/files/CVE-2025-40909-dep.patch |   25 +
 .../perl-cross/perlcross_1.6.2.bb             |    1 +
 .../perl/files/CVE-2025-40909.patch           |  412 ++++++
 .../perl/files/CVE-2026-13221.patch           |   75 +
 .../perl/files/CVE-2026-57432-01.patch        |   52 +
 .../perl/files/CVE-2026-57432-02.patch        |   34 +
 meta/recipes-devtools/perl/perl_5.38.4.bb     |    4 +
 .../recipes-devtools/python/python-pyasn1.inc |    2 +
 .../python3-pyasn1/CVE-2026-59884.patch       |  245 ++++
 .../python3-pyasn1/CVE-2026-59886.patch       |  252 ++++
 ...shebang-overflow-on-python-config.py.patch |    2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |    2 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |    2 +-
 .../python/python3/CVE-2025-13462.patch       |  142 --
 .../python/python3/CVE-2026-11940.patch       |   66 -
 .../python/python3/CVE-2026-11972.patch       |   60 -
 .../python/python3/CVE-2026-1502.patch        |  113 --
 .../python3/CVE-2026-3644_CVE-2026-0672.patch |  154 --
 .../python/python3/CVE-2026-4224.patch        |  121 --
 .../python3/CVE-2026-4519_CVE-2026-4786.patch |   66 -
 .../python/python3/CVE-2026-4519_p1.patch     |  107 --
 .../python/python3/CVE-2026-4519_p2.patch     |  159 ---
 .../python/python3/CVE-2026-6100.patch        |   75 -
 .../python/python3/CVE-2026-7210.patch        |  148 --
 .../python/python3/CVE-2026-9669.patch        |   96 --
 .../python/python3/makerace.patch             |    2 +-
 ...{python3_3.12.13.bb => python3_3.12.14.bb} |   24 +-
 ...atch => CVE-2026-4426_CVE-2026-5121.patch} |    1 +
 .../libarchive/CVE-2026-5121-02.patch         | 1270 +++++++++++++++++
 .../libarchive/libarchive/CVE-2026-5745.patch |   39 +
 .../libarchive/libarchive_3.7.9.bb            |    4 +-
 .../wget/CVE-2026-58469-regression_p1.patch   |   39 +
 .../wget/CVE-2026-58469-regression_p2.patch   |   26 +
 .../wget/wget/CVE-2026-58469.patch            |   53 +
 .../wget/wget/CVE-2026-58471.patch            |   71 +
 .../wget/wget/CVE-2026-58472-regression.patch |  236 +++
 .../wget/wget/CVE-2026-58472.patch            |   77 +
 meta/recipes-extended/wget/wget_1.21.4.bb     |    6 +
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |    1 +
 .../vim/files/CVE-2026-55693.patch            |   88 ++
 .../vim/files/CVE-2026-55892.patch            |   81 ++
 .../vim/files/CVE-2026-55895.patch            |   53 +
 .../vim/files/CVE-2026-57452.patch            |   76 +
 .../vim/files/CVE-2026-57455.patch            |   72 +
 .../vim/files/CVE-2026-57456.patch            |   90 ++
 .../vim/files/CVE-2026-59856.patch            |  103 ++
 .../vim/files/CVE-2026-59857.patch            |  110 ++
 .../vim/files/CVE-2026-59858.patch            |  134 ++
 meta/recipes-support/vim/vim.inc              |    9 +
 64 files changed, 4444 insertions(+), 1328 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
 rename meta/recipes-core/systemd/{systemd-boot-native_255.21.bb => systemd-boot-native_255.22.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.21.bb => systemd-boot_255.22.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
 rename meta/recipes-core/systemd/{systemd_255.21.bb => systemd_255.22.bb} (99%)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/CVE-2025-40909-dep.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59886.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13462.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-1502.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4224.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6100.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-9669.patch
 rename meta/recipes-devtools/python/{python3_3.12.13.bb => python3_3.12.14.bb} (96%)
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2026-4426.patch => CVE-2026-4426_CVE-2026-5121.patch} (99%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-5121-02.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch


