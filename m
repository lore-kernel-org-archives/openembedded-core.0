Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3110.1588363526824318250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 13:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: wPL78DKmSo6h/aKDaA76TSqt/Tldm5DVdhzg/vLIddRaNLIPghcyriLLDFkYKldb8/1W8J/F2q
 Dp4swOpP+wFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2020 13:05:29 -0700
IronPort-SDR: p9o06esVmxa8Z4vq5kRTJfOno3foTtonOV4O69FOxx4NXtJf7hGKshKiAuShjrZd5iE2P1Ac4J
 y/S2qWGOgWSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,340,1583222400"; 
   d="scan'208";a="248626976"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga007.fm.intel.com with ESMTP; 01 May 2020 13:05:29 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/2] at-spi2-core: upgrade 2.34.0 -> 2.36.0
Date: Fri,  1 May 2020 13:05:16 -0700
Message-Id: <20200501200516.4061-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200501200516.4061-1-timothy.t.orling@linux.intel.com>
References: <20200501200516.4061-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix source reproducibility patch merged upstream.
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/25.

Upstream release notes:
"""
What's new in at-spi2-core 2.35.92:

* bus-launcher: make session management more robust.

What's new in at-spi2-core 2.35.1:

* Fix source reproducibility (!25).

* Avoid depending on Meson 0.50 (#20).

* Add ATSPI_ROLE_MARK and ATSPI_ROLE_SUGGESTION (!27).
"""

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../0001-Fix-source-reproducibility.patch     | 32 -------------------
 ...-core_2.34.0.bb => at-spi2-core_2.36.0.bb} |  7 ++--
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.34.0.bb => at-spi2-core_2.36.0.bb} (86%)

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch b/meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch
deleted file mode 100644
index 7631969cd62..00000000000
--- a/meta/recipes-support/atk/at-spi2-core/0001-Fix-source-reproducibility.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b7fa0aa00b07e03e338dd02af564431bf2f2b185 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <Joshua.Watt@garmin.com>
-Date: Wed, 20 Nov 2019 15:24:02 -0600
-Subject: [PATCH] Fix source reproducibility
-
-The generated enum type files can be included in source packages meant
-for debugging, and thus need to be reproducible. Replace the absolute
-include of the header with the basename. This is sufficient because the
-target include files are always in the include path anyway.
-
-Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/at-spi2-core/merge_requests/25]
-Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
----
- atspi/atspi-enum-types.c.template | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atspi/atspi-enum-types.c.template b/atspi/atspi-enum-types.c.template
-index 385d0ee..92e4937 100644
---- a/atspi/atspi-enum-types.c.template
-+++ b/atspi/atspi-enum-types.c.template
-@@ -5,7 +5,7 @@
- 
- /*** BEGIN file-production ***/
- /* enumerations from "@basename@" */
--#include "@filename@"
-+#include "@basename@"
- 
- /*** END file-production ***/
- 
--- 
-2.23.0
-
diff --git a/meta/recipes-support/atk/at-spi2-core_2.34.0.bb b/meta/recipes-support/atk/at-spi2-core_2.36.0.bb
similarity index 86%
rename from meta/recipes-support/atk/at-spi2-core_2.34.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.36.0.bb
index 84e05e77fc7..c5d01c9294b 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.36.0.bb
@@ -5,11 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://0001-Fix-source-reproducibility.patch"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "53c21565507105fb68031cd9c21a559b"
-SRC_URI[sha256sum] = "d629cdbd674e539f8912028512af583990938c7b49e25184c126b00121ef11c6"
+SRC_URI[md5sum] = "f101d111b06293d15738afc904c1d931"
+SRC_URI[sha256sum] = "88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.24.0

