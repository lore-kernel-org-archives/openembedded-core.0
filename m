Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23720CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:47:14 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.3076.1712116029400186552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F3S7pa8T;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e034607879so47549655ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712116029; x=1712720829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/WybcNlOnPMikQYAQgdPgBSN5TfU48yyyPqiaFzYzM=;
        b=F3S7pa8T1wF1otqvW5YEd6ONwM6PX1b83tBcyEkRFkWkhsYgv0BgzLytq20j4lMgw3
         A8O5tEhzESGnroXvgyzxhYrycOQuBHOtu0lI95/D9I3SqcubEfMTVm50+L8oX3UuUsK/
         LKFVZzMRZ33BcRVa6YEnb/Uclk3OeR0bztdrO117d/9DP3s9GvzJucFm4j0VaiJe+/et
         yuDL0UoJ/kzLpefdSy2J16aBjX3dkxGIxyXrhPVh9QHxKgIGv7qBEnH4n+1O+Cn/jx9F
         GAW+BtK34c6sFvuZBevKI6qyZ/Gd0JAWJr54RsuAUmuDaK76WuA8e9v8PoGgcjpbZwwT
         Fg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712116029; x=1712720829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/WybcNlOnPMikQYAQgdPgBSN5TfU48yyyPqiaFzYzM=;
        b=cRr+xts2XoeqB09OhC6gsb2JeL1vqPy1obyeVmttWNrgQUCPvC4vgi3z2P42SyEawl
         2gnIPDsYYt5m7r9/3bxC3sHp3TDyrGDyabB6HbfJf6xKbsWXFz47ugRYWdWIZhewGDDD
         IltM3SLx5EV658vO2Fs54eSW2RKjBUivmiH7GD8P3NVeO74zZ0GrnLT6uEnJgJAsmxD0
         nlLv8/mufaixfcwRBExMiCftWvET9iQY+Z7P9AJ5niQno+DIc2nm5HoY8MuvjLSR72w8
         DkQXo8xvyR1SnwE8A9RYpKyKFOTARPFqXT5IIJbR9fJQVIKoQDtKcS+vs2C7jkpEGDym
         ec4Q==
X-Gm-Message-State: AOJu0Yy+73PCbXCeXrhUsjpWdzCdKULTQSSuoDen25AWd6a6FIhXLg45
	ft7p0w2V2DWSgA5Rfc8C9YotBFGKUrepjqEoCsPuLhrxxaB5u+7z1gq4W9TnRvN7KFHYzvsrz9p
	Y+E4=
X-Google-Smtp-Source: AGHT+IFi0+QFBD8lSAL25bJnEUWPNAt2D8gLtRGyrYRL/VDfLm8cp+EseN7yt/Q9f0sJYR/6ualPJQ==
X-Received: by 2002:a17:902:9a43:b0:1e2:6b65:ec95 with SMTP id x3-20020a1709029a4300b001e26b65ec95mr3840593plv.45.1712116028565;
        Tue, 02 Apr 2024 20:47:08 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902c44b00b001e278fb17c5sm2326128plm.150.2024.04.02.20.47.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:47:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Tue,  2 Apr 2024 17:46:53 -1000
Message-Id: <cover.1712115855.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197893

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, April 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6758

The following changes since commit 1b5405955c7c2579ed1f52522e2e177d0281fa33:

  glibc: Fix subscript typos for get_nscd_addresses (2024-03-19 03:33:32 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Claus Stovgaard (1):
  gcc: Backport sanitizer fix for 32-bit ALSR

Colin McAllister (1):
  common-licenses: Backport missing license

Lee Chee Yang (2):
  xwayland: fix CVE-2023-6816 CVE-2024-0408/0409
  tiff: fix CVE-2023-52356 CVE-2023-6277

Meenali Gupta (1):
  expat: fix CVE-2023-52425

Tan Wen Yan (1):
  python3-urllib3: update to v1.26.18

Vijay Anusuri (2):
  curl: backport Debian patch for CVE-2024-2398
  qemu: Fix for CVE-2023-6683

aszh07 (1):
  nghttp2: fix CVE-2023-44487

 .../LGPL-3.0-with-zeromq-exception            | 181 ++++
 .../expat/expat/CVE-2023-52425-0001.patch     |  40 +
 .../expat/expat/CVE-2023-52425-0002.patch     |  87 ++
 .../expat/expat/CVE-2023-52425-0003.patch     | 222 +++++
 .../expat/expat/CVE-2023-52425-0004.patch     |  42 +
 .../expat/expat/CVE-2023-52425-0005.patch     |  69 ++
 .../expat/expat/CVE-2023-52425-0006.patch     |  67 ++
 .../expat/expat/CVE-2023-52425-0007.patch     | 159 +++
 .../expat/expat/CVE-2023-52425-0008.patch     |  95 ++
 .../expat/expat/CVE-2023-52425-0009.patch     |  52 +
 .../expat/expat/CVE-2023-52425-0010.patch     | 111 +++
 .../expat/expat/CVE-2023-52425-0011.patch     |  89 ++
 .../expat/expat/CVE-2023-52425-0012.patch     |  87 ++
 meta/recipes-core/expat/expat_2.5.0.bb        |  12 +
 meta/recipes-devtools/gcc/gcc-11.4.inc        |   1 +
 .../gcc/gcc/0031-gcc-sanitizers-fix.patch     |  63 ++
 ..._1.26.17.bb => python3-urllib3_1.26.18.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-6683.patch             |  92 ++
 .../xwayland/xwayland/CVE-2023-6816.patch     |  57 ++
 .../xwayland/xwayland/CVE-2024-0408.patch     |  65 ++
 .../xwayland/xwayland/CVE-2024-0409.patch     |  47 +
 .../xwayland/xwayland_22.1.8.bb               |   3 +
 .../libtiff/tiff/CVE-2023-52356.patch         |  54 +
 .../libtiff/tiff/CVE-2023-6277-1.patch        | 178 ++++
 .../libtiff/tiff/CVE-2023-6277-2.patch        | 151 +++
 .../libtiff/tiff/CVE-2023-6277-3.patch        |  46 +
 .../libtiff/tiff/CVE-2023-6277-4.patch        |  93 ++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   5 +
 .../curl/curl/CVE-2024-2398.patch             |  89 ++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 .../nghttp2/nghttp2/CVE-2023-44487.patch      | 927 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   1 +
 33 files changed, 3188 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/LGPL-3.0-with-zeromq-exception
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0001.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0002.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0003.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0004.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0005.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0006.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0007.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0008.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0009.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0010.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0011.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0012.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0031-gcc-sanitizers-fix.patch
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.17.bb => python3-urllib3_1.26.18.bb} (86%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-6816.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0408.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0409.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-2398.patch
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch

-- 
2.34.1


