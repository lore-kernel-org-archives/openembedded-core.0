Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F53C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:47:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7949.1789022842080886739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nYq/Rz8v;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b965570d7so74745025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 23:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789022840; x=1789627640; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doHansnN3sw7iarvX5yM0dzxDSe3W+bNNjWov9H7JPM=;
        b=nYq/Rz8vOGcSAmsPRXs2+I12kmX0fW+82HXinIPxKhFFhwE4iRVXESjzoZbsENlZuY
         xe2KEVmS4E5tfVbNgv/eH1rDAN4HhgCh1GK6UzwpZsOXDImScN69M9iEcRotov79yzT6
         V1ZtcgJtDve7rJnZKz0S447VuwyXnZuhJBlSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022840; x=1789627640;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=doHansnN3sw7iarvX5yM0dzxDSe3W+bNNjWov9H7JPM=;
        b=O576IQcvzbtFA3ufXBIqpANySKA46DxXDd3ZmZu+KAi0zK3S5xhnbI8I1c4k7rZBQO
         EAaj2TKlt1GIOuUatyBABB1DhMIQTr+DXfpuALhdjYO8l7ZUv4xd0Q6AP12A8Zu+GU/t
         KDw9FQ9CKtRw7WCBIwKKCIkg6i0aZDZltFpb+yeVlu4RXx6J1BBP3BCtn0zr3D3bQ/4I
         h1NDfO9Xn3qB/4b2STcZrw9L7ZkwY4W1soXVqG7zWOSxyJE0sm6Pir0m7cU/04gqDV5f
         Z9UOdkvY4/wRUVrSCRN+BjochHzvHIAJ6T5bw+eXZacm4vw7zwJ4a88q1nQfkLKAak/o
         QI0w==
X-Gm-Message-State: AFuF++logcfm5CrFhtkEX3A6uYJlpsYGQdaOdLU+RqLK4SGgF8KPuc1q
	fUm/hR0Ez5Om4hmFI4A+jJkecg9gWWDw23QQ+D4h3NxVohdEF+eX3z6JoGtCngXEuGzlaziIo6u
	4KfTNmw8=
X-Gm-Gg: AYBFou25t/iZfO+or2NsHztX8M54gLFddnSRtqKbCF5tzXoR73RMNY2a21rVYp1t0ZZ
	5MPfAFlMDCwiuXyBch/fO4HPYXI5C5+i3Cn5KfPPK+Oy1PpWuu0PsV2C09SZj+eFP6P62BjHRoI
	Ig4xCm0BpWk+pJnhvUz0BL2auXj4KTn0O2ofJpt5icYD5tOh/nKxSKSypsplYVtflGmeI2ZlyKU
	hglYlTf5aZYRB5/ZQl6eX3N92AfGkZkqxSiRbxyRjArv/DSgeMx75Pk9Q+gwbE2+zcaIjsoPLgm
	t3xQNjEKIUM91mGciPIKUT7RHzHzVTYaXFbrwHzwPVpZdSD5fXifvnErJ54Cs+afzacbXMZBYkZ
	8iawAhg+jdagV9e+oEyhpFjPzpw3ZgmRsFUBxD9gkwFQd+tLiXXJVJX2vIYvCwuel9pXnfRDzpd
	wTyaNYeJP0eyVvn6IGzQJ4BHhLyD72Zi2Y4xQEOvSQ3fJHExSCZaeC3KsJ6Vkt6GPV85HYM37Ts
	YU+fGLAfDgR307ICJ6wpWEhScTLgnMxvvOAaR9VpWOcTWU+qpsPlYrkJlob91Iry66hpcf2sNw=
X-Received: by 2002:a05:600c:4714:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49d04627387mr299842155e9.28.1789022840148;
        Wed, 09 Sep 2026 23:47:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20daed90sm22253445e9.2.2026.09.09.23.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:47:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap 00/35] Pull request (cover letter only)
Date: Thu, 10 Sep 2026 08:47:01 +0200
Message-ID: <cover.1789022713.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245540

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1788787321.git.yoann.congal@smile.fr/
(No review, no changes)

Passed a-full on autobuilder (Same as patch review request):
* qemuppc (AB disk space issue) retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/31/builds/1662
* pkgman-non-rpm (AB disk space issue) retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/67/builds/4598
* oe-selftest-debian: AB disk space issue in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4777
  but "Bitbake Selftest" passed.
  Retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4779
  but, here, "Bitbake Selftest" failed on github infra issue (see #16415 – AB-INT: github infrastructure issues)
* oe-selftest-fedora failed with 16206 – [scarthgap] AB-INT: runtime_test.SystemTap.test_crosstap_* failures
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4594

(TL;DR: No new bug seen in test with this series.)

The following changes since commit 048f2f8e8864ae5861afe95ea52efc0354bfc18c:

  build-appliance-image: Update to scarthgap head revision (2026-09-04 10:39:17 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 5b4292b3fc1586709dcdc27d7cfa3d880e6f338a:

  gnutls: Backport fix for CVE-2026-33846 (2026-09-06 01:25:16 +0200)

----------------------------------------------------------------

Anil Dongare (1):
  apt: mark CVE-2011-3374 as not-applicable-config

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.150
  linux-yocto/6.6: update to v6.6.151
  linux-yocto/6.6: fix tiny build

Darsh Kelaiya (3):
  python3-git: fix CVE-2026-42284
  python3-git: fix CVE-2026-44243
  python3-git: fix CVE-2026-44244

Eilís 'pidge' Ní Fhlannagáin (1):
  ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE

Hetvi Thakar (3):
  python3-idna: Fix CVE-2026-45409
  python3-mako: Fix CVE-2026-41205
  libssh2: Fix CVE-2026-58051

Jaipaul Cheernam (2):
  util-linux: Fix CVE-2026-3184
  expat: set CVE_STATUS for CVE-2026-72522

Jakub Szczudlo (Nokia) (2):
  gnutls: fix CVE-2026-42010
  gnutls: fix for CVE-2026-42011

Peter Marko (3):
  libevent: set status for CVE-2026-63380
  alsa-lib: patch CVE-2026-56109
  busybox: patch CVE-2024-58251

Pratik Farkase (1):
  libevent: merge inherit statements

Roland Kovacs (1):
  gnutls: Backport fix for CVE-2026-33846

Ross Burton (2):
  libevent: use libtool to install test binaries
  libevent: upgrade 2.1.12 -> 2.1.13

Tim Orling (9):
  python3-babel: fix CVE_PRODUCT
  python3-click: fix CVE_PRODUCT
  python3-dbusmock: fix CVE_PRODUCT
  python3-attrs: fix CVE_PRODUCT
  python3-numpy: fix CVE_PRODUCT
  python3-pycryptodome: fix CVE_PRODUCT
  python3-wheel: fix CVE_PRODUCT
  python3-pycryptodomex: fix CVE_PRODUCT
  python3-git: fix CVE_PRODUCT

Vijay Anusuri (4):
  p11-kit: Fix CVE-2026-13757
  libxfont2: Fix CVE-2026-56001
  libxfont2: Fix CVE-2026-56002
  libxfont2: Fix CVE-2026-56003

 .../busybox/busybox/CVE-2024-58251.patch      |  51 ++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
 meta/recipes-core/expat/expat_2.6.4.bb        |   3 +
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +-
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/util-linux/CVE-2026-3184.patch |  61 ++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |   3 +
 .../python/python3-attrs_23.2.0.bb            |   2 +
 .../python/python3-babel_2.14.0.bb            |   2 +
 .../python/python3-click_8.1.7.bb             |   2 +
 .../python/python3-dbusmock_0.31.1.bb         |   2 +
 .../python/python3-git/CVE-2026-42284.patch   |  37 +++
 .../python3-git/CVE-2026-44243_p1.patch       | 136 +++++++++
 .../python3-git/CVE-2026-44243_p2.patch       |  86 ++++++
 .../python3-git/CVE-2026-44244_p1.patch       | 104 +++++++
 .../python3-git/CVE-2026-44244_p2.patch       |  30 ++
 .../python/python3-git_3.1.42.bb              |   8 +
 .../python3-idna/CVE-2026-45409_p1.patch      |  75 +++++
 .../python3-idna/CVE-2026-45409_p2.patch      |  48 ++++
 .../python3-idna/CVE-2026-45409_p3.patch      |  72 +++++
 .../python/python3-idna_3.7.bb                |   5 +
 .../python/python3-mako/CVE-2026-41205.patch  | 110 ++++++++
 .../python/python3-mako_1.3.2.bb              |   2 +
 .../python/python3-numpy_1.26.4.bb            |   2 +
 .../python/python3-pycryptodome_3.20.0.bb     |   1 +
 .../python/python3-pycryptodomex_3.20.0.bb    |   2 +
 .../python/python3-wheel_0.42.0.bb            |   2 +
 .../xorg-lib/libxfont2/CVE-2026-56001.patch   |  75 +++++
 .../xorg-lib/libxfont2/CVE-2026-56002.patch   | 138 +++++++++
 .../xorg-lib/libxfont2/CVE-2026-56003.patch   | 114 ++++++++
 .../xorg-lib/libxfont2_2.0.6.bb               |   5 +
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
 .../alsa/alsa-lib/CVE-2026-56109.patch        |  33 +++
 .../alsa/alsa-lib_1.2.11.bb                   |   1 +
 .../gnutls/gnutls/CVE-2026-33846.patch        |  66 +++++
 .../gnutls/gnutls/CVE-2026-42010.patch        |  41 +++
 .../gnutls/gnutls/CVE-2026-42011_p1.patch     |  43 +++
 .../gnutls/gnutls/CVE-2026-42011_p2.patch     | 141 ++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   4 +
 ....c-patch-out-tests-that-require-a-wo.patch |   8 +-
 ...ncrease-default-timeval-tolerance-50.patch |  10 +-
 ...-monotonic_prc_fallback-as-retriable.patch |  11 +-
 ...ts-are-marked-failed-only-when-all-a.patch |   9 +-
 .../libevent/Makefile-missing-test-dir.patch  |  14 +-
 ...{libevent_2.1.12.bb => libevent_2.1.13.bb} |  16 +-
 .../libssh2/libssh2/CVE-2026-58051.patch      |  34 +++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 .../p11-kit/files/CVE-2026-13757.patch        | 265 ++++++++++++++++++
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |   1 +
 51 files changed, 1863 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch
 create mode 100644 meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch
 rename meta/recipes-support/libevent/{libevent_2.1.12.bb => libevent_2.1.13.bb} (84%)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-13757.patch


