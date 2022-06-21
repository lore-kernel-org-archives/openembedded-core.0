Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C827C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:18 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.1300.1655854094330246615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WczQXDNN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id u37so14475540pfg.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvVLxXcEWL4DX3EVR/LLyfWJ9crdWOVON+fuWDNEEVE=;
        b=WczQXDNNn8EvDTjteO3QEf+b5+SMEKaDSNkLQIg7w6TFtlTIe7WgQ7DFK5hoJJ5Rxe
         0G0dLXrhfyHfIftwHWqhy0Aq+/q0kHOyFVuR/UsNm/onQ6uii5wrpKMnS/6fZcz9wgop
         VQInfJGzfFROa594/p+IJEM2QRaFmSUpjHb3vS22fXdqZq8enBIMbKu7BAiE+TTy4mjK
         FrVBVpOdfHOgQN9sPkeIjdcnpKBZ4arHfIxzGXjrKCQ23jKcDw6WG+Lsga1QACZSriFP
         Qzoq4DvVYyDO6y4mHxZHp65YxnGpfzPm3GSlDdsiBJ1xL5INcLGY0EMQ5w6RceyY8LeE
         wL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvVLxXcEWL4DX3EVR/LLyfWJ9crdWOVON+fuWDNEEVE=;
        b=aKROgSZaZeHXTyvPAl/mzYAP87ECdASfagJcUnubkxgXFO3iPfAkS4wJlZsWn5DWVB
         +CPBvyi2lj+KihCbeW25TgDBU+s5eO/JHH1VX5TR+GRnE2/ElSM+SSD2y0eaILCMJ0fH
         2ZGUBpILPGJC2QYqklSEWKneIib9SX16JTrDrbJL01xgC7KcAEMhY2DICFGRJlBL4Bq0
         qjmdfDPwVxBVLSJHVlImWSbioLXfT8D0F6R0ys4Gz2qa+y4nZnSgcmAap7r/FqSKb77f
         WIGzt0eaGOwh6F3lHcSgaJjgtdF0Y4Zn9Yy7falng6SNWktf1aKPxg6nPofgPtem+Md3
         xmug==
X-Gm-Message-State: AJIora/2vyMe9ROz5K3W2+ZLQkKwdDGn/+Kk8e7ZEvYH1lvvhvTCRXNL
	VynfyegrynJFSZgGmseHC7jtm5EUXF+onbgU
X-Google-Smtp-Source: 
 AGRyM1vDJN6PtZHkg/eYiQtQAxNaPPkxbVQo5nPbgq6VC/LeSaMz/OyYoyCu9H76fYawETKczAgaJg==
X-Received: by 2002:aa7:91d3:0:b0:525:1f61:dacf with SMTP id
 z19-20020aa791d3000000b005251f61dacfmr14421528pfa.40.1655854092975;
        Tue, 21 Jun 2022 16:28:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Tue, 21 Jun 2022 13:27:46 -1000
Message-Id: <cover.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167190

Please review this set of patches for kirkstone and have comments back by end
of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3811

The following changes since commit b2d10487f80deb04a0893325a1ae79c8629a7655:

  liberror-perl: Update sstate/equiv versions to clean cache (2022-06-17 05:02:15 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  python3: use built-in distutils for ptest, rather than setuptools'
    'fork'

Davide Gardenal (1):
  efivar: add musl libc compatibility

Dmitry Baryshkov (2):
  linux-firmware: add support for building snapshots
  linux-firmware: upgrade 20220509 -> 20220610

Marta Rybczynska (2):
  cve-check: add support for Ignored CVEs
  oeqa/selftest/cve_check: add tests for Ignored and partial reports

Martin Jansa (1):
  mesa: backport a patch to support compositors without
    zwp_linux_dmabuf_v1 again

Michael Opdenacker (1):
  rootfs-postcommands.bbclass: correct comments

Nick Potenski (1):
  systemd: systemd-systemctl: Support instance conf files during enable

Paulo Neves (2):
  python: Avoid shebang overflow on python-config.py
  gtk-doc: Fix potential shebang overflow on gtkdoc-mkhtml2

Richard Purdie (2):
  python3: Remove problematic paths from sysroot files
  python3: Ensure stale empty python module directories don't break the
    build

 meta/classes/cve-check.bbclass                |  43 ++--
 meta/classes/rootfs-postcommands.bbclass      |   8 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  82 ++++++++
 .../efisecdb-fix-build-with-musl-libc.patch   | 184 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |   3 +-
 .../systemd/systemd-systemctl/systemctl       |  14 +-
 ...shebang-overflow-on-python-config.py.patch |  33 ++++
 .../python3/deterministic_imports.patch       |  32 +++
 .../recipes-devtools/python/python3/run-ptest |   2 +-
 .../recipes-devtools/python/python3_3.10.4.bb |  12 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb  |   1 +
 ...nd-deprecate-drm_handle_format-and-d.patch | 158 +++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |   1 +
 ...01-Makefile-replace-mkdir-by-install.patch |  84 --------
 ...20220509.bb => linux-firmware_20220610.bb} |  11 +-
 15 files changed, 555 insertions(+), 113 deletions(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
 create mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
 delete mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220509.bb => linux-firmware_20220610.bb} (99%)

-- 
2.25.1


