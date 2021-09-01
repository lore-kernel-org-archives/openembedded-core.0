Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.8221.1630503919084714729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NdSJVhRZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 6so3758989oiy.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjGlBKfSres31BmCssjtMmsk1vlJo4IJ7FlnRdNb3g0=;
        b=NdSJVhRZGJPW3Q0TUx99JP5JrATAwGhRKvsOn95y8g4niUKRI8zO7bEnHrVGTFtKWH
         eVm75zaApg+ueWrR0gziLpoGAYIo2L0FGZMS/HbvA7znpiT54qUab2R250V0Qln7FzlY
         X2Q7vtagBAvkD78Vz2mWVIlDyxPC75NULhhqsOxGSpjFQCrWuIZO9Xsaw+8mKYhDBXWe
         mSJS13Gy9wA58B9W+s1JA8stJXndMTr3sgxDkp1GzizZkmnub9x44/H1uX3NekoRl72M
         7fqdjE5gzObU66OO3HTHdkf41prJ5PHe/A/PNCW2YchCb+S3pxKVP8j3Bl2e0r+Xjtrz
         yByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjGlBKfSres31BmCssjtMmsk1vlJo4IJ7FlnRdNb3g0=;
        b=bYjjvNXKybBsflnZtKiSmWfYsLnaoGMlX3h7yKAGDa+rgajnYGsWGGuvXIQW6iI5K2
         PrRCKC7kEkk7LN9iyq6Z4A/rPRA4dqXSaOCt924k5VqdUkDvdWi1isnVU0Qb/QwBjuVs
         vJr0W4Rvp6Hnn0dDgKsh/eGYxi12ORqb3zbxtQmqGntxs7uEJFnj4RHvna+hohG2Dj/0
         R+WJahQWvXVgyMXtv9WLDatoCh7tB1PGw8LkQsqj7bX/RPx0UT6Bfku5lSQZtHzwQP4d
         qbBnZ0we3ubB0bwlx+EQ/wWSRYU6HCAM6JGrGLegBXvCCyBsUMore90kD9LppQpc3ntv
         p3vA==
X-Gm-Message-State: AOAM531x4eint0g6u+aCm6uS0uwIMRYKedsu9B+++pVk0cLwa+Ns0UIj
	FcutGSuxUEQmVDeyVMu8df/mg6QBHlk=
X-Google-Smtp-Source: ABdhPJylN1iPtjFYrZ2HXa1i6UDxtf9Ow6CSh7RF14LBhyF2ghpTrbyzrCwM9QOO5OAxraZ02tE+HQ==
X-Received: by 2002:aca:4557:: with SMTP id s84mr7219624oia.77.1630503918185;
        Wed, 01 Sep 2021 06:45:18 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:17 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 00/31] Add initial SBoM support
Date: Wed,  1 Sep 2021 08:44:39 -0500
Message-Id: <20210901134510.29561-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds initial support for generating SBoMs in SPDX json format. SBoM
generation can be enabled by adding:

  INHERIT += "create-spdx"

to local.conf

Joshua Watt (30):
  classes/package: Add extended packaged data
  classes/create-spdx: Add class
  classes/create-spdx: Change creator
  classes/create-spdx: Add SHA1 to index file
  classes/create-spdx: Add index to DEPLOYDIR
  classes/create-spdx: Add runtime dependency mapping
  classes/create-spdx: Add NOASSERTION for unknown debug sources
  classes/create-spdx: Fix another creator
  Add SPDX licenses
  classes/create-spdx: Fix up license reporting
  classes/create-spdx: Speed up hash calculations
  classes/create-spdx: Fix file:// in downloadLocation
  classes/create-spdx: Add special exception for Public Domain license
  classes/create-spdx: Collect all task dependencies
  classes/create-spdx: Skip package processing for native recipes
  classes/create-spdx: Comment out placeholder license warning
  conf/licenses: Add FreeType SPDX mapping
  tzdata: Remove BSD License specifier
  glib-2.0: Use specific BSD license variant
  e2fsprogs: Use specific BSD license variant
  shadow: Use specific BSD license variant
  sudo: Use specific BSD license variant
  libcap: Use specific BSD license variant
  libpam: Use specific BSD license variant
  libxfont2: Use specific BSD license variant
  libjitterentropy: Use specific BSD license variant
  libx11: Use specific BSD license variant
  font-util: Use specific BSD license variant
  flac: Use specific BSD license variant
  swig: Use specific BSD license variant

Saul Wold (1):
  classes/create-spdx: extend DocumentRef to include name

 meta/classes/create-spdx.bbclass              |  901 +++
 meta/classes/package.bbclass                  |   39 +-
 meta/conf/licenses.conf                       |    1 +
 meta/files/spdx-licenses.json                 | 5938 +++++++++++++++++
 meta/lib/oe/packagedata.py                    |   12 +
 meta/lib/oe/sbom.py                           |   74 +
 meta/lib/oe/spdx.py                           |  271 +
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |    2 +-
 meta/recipes-devtools/swig/swig.inc           |    2 +-
 meta/recipes-extended/pam/libpam_1.5.1.bb     |    2 +-
 meta/recipes-extended/shadow/shadow.inc       |    2 +-
 meta/recipes-extended/sudo/sudo.inc           |    2 +-
 meta/recipes-extended/timezone/timezone.inc   |    2 +-
 .../xorg-font/font-util_1.3.2.bb              |    2 +-
 .../recipes-graphics/xorg-lib/libx11_1.7.2.bb |    2 +-
 .../xorg-lib/libxfont2_2.0.5.bb               |    2 +-
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |    2 +-
 meta/recipes-support/libcap/libcap_2.51.bb    |    2 +-
 .../libjitterentropy_3.1.0.bb                 |    2 +-
 20 files changed, 7246 insertions(+), 16 deletions(-)
 create mode 100644 meta/classes/create-spdx.bbclass
 create mode 100644 meta/files/spdx-licenses.json
 create mode 100644 meta/lib/oe/sbom.py
 create mode 100644 meta/lib/oe/spdx.py

-- 
2.32.0

