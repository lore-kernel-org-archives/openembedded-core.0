Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029F4C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:56:50 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.19968.1740516999678545694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PVE9Pkr3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so342708a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740516999; x=1741121799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=60XAqoOyx06y/uunfm4QfiOkPKRjoVim2XqHfGvBtoI=;
        b=PVE9Pkr3ZSFWaFk3aQR4WKtihQK/8HF4vsEZ8p1V0vaD9JRUTqv+fGgnxJilcLPEIa
         f3tCTi9EdfRb7KssrisRfcgj+RUutxNvdcKiq75VaYoY049jinVCbB1FgDSS132mqFzo
         jKy6+F3qydzmFeVRWGZ1eEdUjh0l76r0jvnkiU0RZ8h4XIk3skwuF+xzJlbjAeCXU4JF
         PLfYgjEMwZmSjh7n01tEiAtPN0d4c80jHieoqktRvDDF3tGwtp2c408QFoBS6gi8tJQf
         +zBkRI0sUyLgXKbQ33wgHxKFELF1NkHsWOrd3Bit23l814hJAlgCXja9wT2yrswPJ/bV
         S82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740516999; x=1741121799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60XAqoOyx06y/uunfm4QfiOkPKRjoVim2XqHfGvBtoI=;
        b=IXfAVTrUgv116nUFw+3U53I1OLUD7u4cwNpGDaitMWNQ7p5Ks0KUn/QRJVllFSnAxq
         N2Zw2s4ZMf9LDkt1S5Qe80h5ca+DkE9tQNDWov0XLLY7kmhJOkRU9OelCrXfjxvKShCv
         MxLiBa3CP0AsNj+L5RBFSNznx6nyHH+0Jr/PxRYNC9gW4tRfXqEhZK7hbudZqlisVtdd
         xh4fHReVnuVXgfyuNKCk5sjKcN4w5EkTTO2pG29+3BNPFGiJct92IdeUSFRAHtkj2bMV
         TVa6LclDSKadz9aPkTbuSA9haZBGXyPrr7WRU76ctbBRs/rljzIZq/8wpXMhD3MtAb2C
         QPoQ==
X-Gm-Message-State: AOJu0YwBwFjMpbdpuBvbiRyGQUvul3im8CLcXyf9ju9/5Br4dxv1z1XX
	z6i9f+BEzdQXqW9WTVuE0hcdeIT9AUg2znFl7p16DwY8jbH5VrgHDUC1tBkURxBL66+fojsLUa8
	i
X-Gm-Gg: ASbGnct8Wzwd1N8wQRDdzifp5cz8OwdvQ76p18RRwoekb/yVKFaWFSeyWp5UHmusKAd
	OydbOKMI+StNwuuw37tmVxACgK7BmI31EG1kPSp55Se8mJyGbfVcy3vogrJtz7C6xaMZy+qyANj
	Lk+Qo+L+0gly2vxsypY/+MKobXruQblHtVPzzKtwC+Da1hM8Yl0VN+MeacvWA4QJ+Af2SKLXHxs
	jn3vcA7y6lfsnrUuyQmVmIjA7KwhR0WpqKvPRAuohXWiEFLcLb29YgFXXNQQcfD7YPe9NIktHqq
	2wNNwzpIxNQupsq6Vw==
X-Google-Smtp-Source: AGHT+IGa2d5VvNMN9jPjScduRWpVOhUAXL3FAxuBp2aaNnmsullpkdFY9cLIoF1vfE+GdlxoMkYFAA==
X-Received: by 2002:a17:90a:c105:b0:2fb:fe21:4841 with SMTP id 98e67ed59e1d1-2fccc117c76mr41886452a91.8.1740516998849;
        Tue, 25 Feb 2025 12:56:38 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Tue, 25 Feb 2025 12:56:23 -0800
Message-ID: <cover.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211924

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, February 27

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1081

The following changes since commit fc46705cc629a151f85717a57f7d789de8fd9b64:

  icu: remove host references in nativesdk to fix reproducibility (2025-02-19 06:28:10 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Etienne Cordonnier (1):
  python3-setuptools-scm: respect GIT_CEILING_DIRECTORIES

Hitendra Prajapati (1):
  libcap: fix CVE-2025-1390

Hongxu Jia (6):
  u-boot: fix CVE-2024-57254
  u-boot: fix CVE-2024-57255
  u-boot: fix CVE-2024-57256
  u-boot: fix CVE-2024-57257
  u-boot: fix CVE-2024-57258
  u-boot: fix CVE-2024-57259

Peter Marko (1):
  libxml2: upgrade 2.12.9 -> 2.12.10

Vijay Anusuri (1):
  bind: Upgrade 9.18.28 -> 9.18.33

 .../u-boot/files/CVE-2024-57254.patch         |  47 ++++
 .../u-boot/files/CVE-2024-57255.patch         |  53 ++++
 .../u-boot/files/CVE-2024-57256.patch         |  51 ++++
 .../u-boot/files/CVE-2024-57257.patch         | 227 ++++++++++++++++++
 .../u-boot/files/CVE-2024-57258-1.patch       |  47 ++++
 .../u-boot/files/CVE-2024-57258-2.patch       |  43 ++++
 .../u-boot/files/CVE-2024-57258-3.patch       |  40 +++
 .../u-boot/files/CVE-2024-57259.patch         |  41 ++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  11 +-
 .../bind/{bind_9.18.28.bb => bind_9.18.33.bb} |   2 +-
 .../{libxml2_2.12.9.bb => libxml2_2.12.10.bb} |   2 +-
 ...0001-respect-GIT_CEILING_DIRECTORIES.patch |  36 +++
 .../python/python3-setuptools-scm_8.0.4.bb    |   1 +
 .../libcap/files/CVE-2025-1390.patch          |  36 +++
 meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
 15 files changed, 635 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57257.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch
 rename meta/recipes-connectivity/bind/{bind_9.18.28.bb => bind_9.18.33.bb} (97%)
 rename meta/recipes-core/libxml/{libxml2_2.12.9.bb => libxml2_2.12.10.bb} (97%)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm/0001-respect-GIT_CEILING_DIRECTORIES.patch
 create mode 100644 meta/recipes-support/libcap/files/CVE-2025-1390.patch

-- 
2.43.0


