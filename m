Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.18515.1592835557709973609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mw9x/ZRg;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b5so8468516pfp.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=gCq7myu3pRHHdlpBwf2CmeG3z7tKLxk2r9M6oB/6bLE=;
        b=mw9x/ZRgvZAKRqA8m5r5wuN3vfslQbJDX7aU1A9z0+VTJDHIg3Bxp48Z9I/hEUdoAt
         5h9g2o7SkY/o+Vp0B5A3Fh72RDRwxiS8U2R1tUYa3SbwSY102GT3Xn12dkDYjv1noumN
         z1Z/BFp/8rGhYNVK6nkxDhoGQqPnyRoXMzOZRqAUUZYTIoauVRGDEtoqHyGt8Qz6/NLg
         DzhTbFDGRZVoYiS2tZDPWxNLSCv5YWwXQndchE2AUxydqqBHPJ2mR+afVZCqVyXy3Ivc
         /Ob/pNgeY7gb1SU0qXGwr7yQjMegNqXuna8fIAxzWN+EpjJBffK7ajxOULlo4D+0W4KQ
         ChFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=gCq7myu3pRHHdlpBwf2CmeG3z7tKLxk2r9M6oB/6bLE=;
        b=uOKURJd5jPLKMwE/7u1X0Gu1yPOIHrma2yVGYv0rJEthzfokRCPzKMvPZJOe1KyAYZ
         USyw6YkCe2eA5L6LnBrZlE22MFFLYQZxqXp0GzPOeDJOiSOK7ykAOl0vOyb/LCrD+lKA
         AABBVDkmjI6R6Fxp+EATGPSOJukObGr1y7tVLodhUptkM2XlVa04xjaevk3llwWLgtY6
         bx0gPaBygKWbruATp9MBa/5YglN95V9X0P3jDSHKt9bBrz8l7R2CCYc487AZmIQnpfls
         JAzFnARyomlFEBBZ5SLCy/gn+n0OY1MEyGjFb50Njw+Z/q01594PDQtkhpn1k2oZrhdJ
         sAsg==
X-Gm-Message-State: AOAM532EKNrHZsZyWeEV5TG4x7CwYpPQBZtDhS9DpH4gplws5mumJK+l
	Uj+2/fa0oZKagR+DP/OqN1QXUTmt
X-Google-Smtp-Source: ABdhPJy8lSnDLAD+sqwPiZlLH0ERa6L9mPWpPqfDmVfC9GvOGlcixcF2m9MorXoCDJoPSsQYGhzyEw==
X-Received: by 2002:a63:1946:: with SMTP id 6mr12489896pgz.287.1592835556535;
        Mon, 22 Jun 2020 07:19:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:489f:ae11:ae3f:a4e7])
        by smtp.gmail.com with ESMTPSA id 23sm14188840pfy.199.2020.06.22.07.19.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:19:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Update bind and replace dhcp
Date: Mon, 22 Jun 2020 07:19:09 -0700
Message-Id: <20200622141915.31932-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Move to the latest Bind ESV and replace the depricated dhcp with kea.
Three packages need to move from meta-oe to core.

The new bind is not compatable with the dhcp

Armin Kuster (6):
  libuv: move from meta-oe to core for bind update
  bind: Update to latest ESV version 9.16
  log4cplus: move meta-oe pkg to core
  kea: Move to core
  dhcp: remove depricated package
  maintainers.inc: add new packages remove dhcp

 meta/conf/distro/include/maintainers.inc      |   4 +-
 ....in-remove-useless-L-use_openssl-lib.patch |  30 ----
 ...d-V-and-start-log-hide-build-options.patch |  33 ++--
 ...ching-for-json-headers-searches-sysr.patch |  14 +-
 .../bind/{bind_9.11.19.bb => bind_9.16.4.bb}  |  37 ++---
 meta/recipes-connectivity/dhcp/dhcp.inc       | 149 ------------------
 ...TH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  27 ----
 ...-limitation-in-linux-dhclient-script.patch |  65 --------
 .../dhcp/dhcp/0002-dhclient-dbus.patch        | 117 --------------
 .../dhcp/dhcp/0003-link-with-lcrypto.patch    |  35 ----
 .../dhcp/0004-Fix-out-of-tree-builds.patch    |  95 -----------
 ...invoke-dhclient-script-failed-on-Rea.patch |  36 -----
 ...gument-to-make-the-libxml2-dependenc.patch |  62 --------
 ...move-dhclient-script-bash-dependency.patch |  28 ----
 ...ct-the-intention-for-xml2-lib-search.patch |  34 ----
 .../dhcp/dhcp/0013-fixup_use_libbind.patch    |  64 --------
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |  21 ---
 .../kea/files/0001-remove-AC_TRY_RUN.patch    |  34 ++++
 .../kea/files/kea-dhcp-ddns.service           |  13 ++
 .../kea/files/kea-dhcp4.service               |  13 ++
 .../kea/files/kea-dhcp6.service               |  13 ++
 meta/recipes-connectivity/kea/kea_1.7.7.bb    |  67 ++++++++
 .../libuv/libuv_1.34.2.bb                     |  19 +++
 .../log4cplus/log4cplus_2.0.5.bb              |  19 +++
 24 files changed, 216 insertions(+), 813 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.19.bb => bind_9.16.4.bb} (77%)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp.inc
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
 create mode 100644 meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4.service
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6.service
 create mode 100644 meta/recipes-connectivity/kea/kea_1.7.7.bb
 create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.2.bb
 create mode 100644 meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb

-- 
2.17.1

