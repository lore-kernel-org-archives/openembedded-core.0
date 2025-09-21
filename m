Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC74CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 14:08:51 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.29885.1758463726073631886
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 07:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OX+5ibTt;
 spf=pass (domain: baylibre.com, ip: 209.85.222.196, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-829243c1164so389309085a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758463724; x=1759068524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGeB+RZkeoIHf01BscdOQJFtAYzQut9Zd3Yn78260RU=;
        b=OX+5ibTtcrs+OdAKAHCykZ0vMwm4fmlWkyIfdy4VmQF6GkI0G42Z60uUHfZnixXZ5r
         h8w9mHuC86flfc84Cxz+4g3G1E2FadKM00vw7G/IZWtA00/1QTFec4KbHe/AkqJjX3cJ
         Q308MGfsS9GpLP1mMlDatKS+bmU4c3Y8hkGPOV9Q+Bu2bJc95sLt+Gcigj8FBP461HPO
         B0fS40WqQe6EJRpR2uRGc9A9dPo0Uz7tZIzcAFDs30OHbcuOsM8R2wsUt/5lW8U5R227
         ThJAS2pFO+H6vcWpwV41kww91VB3T55P/XOiiN0r44Lv/cxNCLDPUGZnnGSWm5F1UFqA
         EsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758463724; x=1759068524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGeB+RZkeoIHf01BscdOQJFtAYzQut9Zd3Yn78260RU=;
        b=PZVQPwtKzlPjhS7F4I+5LNSkPVkKW039uW3COrIuye4qdfB+2IPX/gyOsMBhqBK6Xi
         sRibrzqRn5G5AX3WoErDNAr3gIXXoSPvEHjf2L3qgQwkuROLHm0F74Jdh7DfXhuXKDmW
         Eon8PXLVFIuccbuuV7FZ5XXlvuXRrkNplTo1jXHxr6WBl/TbwNFcz88TE3nVhGmPmhVO
         8q61/XcINmd3depAwkt48LadCf7XvP6oiXJfHCnXZlJQKOnJ2WkaS95oPXBT2+RjDVwP
         SABE1QWcs4doqYmC02S0H1tcPvPj4ULnVgupb/4i5a+ZzJ4HEdtxTm/C5nknTANtVpY2
         xVIw==
X-Gm-Message-State: AOJu0YxgRazgEE7/nJB8NdAS2fXZbUG10l1IiRwXhS8/DvNcz+SUDd30
	/pG4VAZxrXxRPTh94OzeWAIpjdnZzXT2ja2kWwviOXpeT+0JQldFInmofFy3ckP2Tf0H+raWxfc
	DocppqPQmvA==
X-Gm-Gg: ASbGncty3hzOpxPJdYWSI5GjlMUNsH/Ylfi2fQxje0GQIVMz4emmGuaQLMttEAZKrBV
	+ei1AyIZQhBXcE0la/XGHBkX8uX/4qtqNsfXAbHAD817d2ltBxYcK61sdqv6fAoUXAmuxggmuNv
	HKNY89Mf0vHmUhj8Hyfv6hh/pGfnjtl/iLwDkkz9gTLVtP/EdrajhZ3BaoDLkS15sP4aUxaz5ve
	2LZ6BnU+SN/a+krJrVIWonw5rCbs/x3OE2V7KR2Ct7kw1ZchaTUR6gYjI0jV5dYLmCO/Ai9lWxB
	v6pcq2dEjlQUj+dt6m9e4oDy28MYxfd6WLuWBH+jQhz0M8OKz/OeRvcZ27yPfwhXjg4rENNz9WM
	kqCKNEvhOguA7wzaveqRdlwyV0qseqVr+jpC0AAJfBIYr2y76S5WhhgZIWdc=
X-Google-Smtp-Source: AGHT+IFas7rK4+2oxIP08DUUDsUnD/o32njntxAid4p/97bWodVw0R0u9WwuTRWoKyTS8nr+hP5zAQ==
X-Received: by 2002:a05:620a:70ef:b0:82a:bb78:20f9 with SMTP id af79cd13be357-83ba40ade19mr925505785a.19.1758463724101;
        Sun, 21 Sep 2025 07:08:44 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84aa50416e8sm15948585a.17.2025.09.21.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 07:08:43 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH] python3-dbusmock: upgrade 0.33.0 -> 0.37.0
Date: Sun, 21 Sep 2025 10:08:40 -0400
Message-ID: <20250921140840.2555040-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 14:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223797

Upstream notably removed the setup.cfg/setup.py files in this period and
updated pyproject.toml. It still uses setuptools as the build backend,
and should be compatible with recent versions.

Changelog (https://github.com/martinpitt/python-dbusmock/releases):

0.37.0:

- templates: Drop iio-sensors-proxy (See #241)
- DBusTestCase: Drop obsolete {start,stop}_dbus() methods
- Fix dbus-daemon startup race condition (Debian#1109272)

0.36.0:

- mockobject: Fix _wrap_in_dbus_variant for Struct and Dict types (thanks Sebastian Wick)
- Drop setup.{cfg,py} and RHEL 9 support, move to pybuild (rhbz#2377609)
- Drop iio-sensor-proxy tests, the template is broken (see #241)

0.35.0:

- modemmanager: Add operator code (thanks Guido Günther)
- modemmanager: Allow to set CellBroadcast channel list (thanks Guido Günther)

0.34.3:

- tests: Relax libnotify expected format for libnotify 0.8.4

0.34.2:

- spec: Adjust %autosetup to PEP-625 tarball top-level directory

0.34.1:

- spec: Adjust Source URL to PEP-625 tarball name

0.34.0:

- modemmanager: Add cell broadcast messages (thanks Guido Günther)
- Move release builds to pybuild for PEP-625 compatibility

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-dbusmock_0.33.0.bb => python3-dbusmock_0.37.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.33.0.bb => python3-dbusmock_0.37.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
index c0ea64b6b8..9592c83727 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "04efd311dd1063ac2b8f7baa79a026b5c0aa3ed4ef18cd9226f52a273fa6193a"
+SRC_URI[sha256sum] = "38754c5ad2ad8f3936ff67d4b058bca416588a72bc094e91ded9f8f401b06310"
 
-PYPI_PACKAGE = "python-dbusmock"
+PYPI_PACKAGE = "python_dbusmock"
 
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.51.0


