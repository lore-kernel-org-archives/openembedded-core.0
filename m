Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EADD071ACF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649690"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:22 +0300
Message-Id: <20170510093529.6651-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/11] sysprof: update to 3.24.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 May 2017 09:35:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../sysprof/{sysprof_3.22.3.bb => sysprof_3.24.1.bb}           | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/sysprof/{sysprof_3.22.3.bb => sysprof_3.24.1.bb} (73%)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.22.3.bb b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
similarity index 73%
rename from meta/recipes-kernel/sysprof/sysprof_3.22.3.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
index 26310634c64..ca3589bcc97 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.22.3.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
@@ -13,20 +13,24 @@ SRC_URI += " \
            file://0001-Disable-check-for-polkit-for-UI.patch \
            file://0001-Avoid-building-docs.patch \
           "
-SRC_URI[archive.sha256sum] = "e6dca325b3014440f457a92db18ffe342a35888db3f0756694a99b9652796367"
-SRC_URI[archive.md5sum] = "9514065dc752105240e5567c13708af4"
+SRC_URI[archive.md5sum] = "2b44ae1d8cd899417294a9c4509d7870"
+SRC_URI[archive.sha256sum] = "054eebe2afb6fe3c06ac8c46bc045c42f675d4fd64e6f16cbc602d5c7ce27bec"
 
 AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
 EXTRA_OECONF = "--enable-compile-warnings"
 
+# This properly relocates msgfmt, which otherwise fails to find its data files. 
+# Tips on how to get rid of hardcoded version welcome.
+export GETTEXTDATADIR = "${STAGING_DATADIR_NATIVE}/gettext-0.19.8/"
+
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit dbus"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-FILES_${PN} += "${datadir}/icons/"
+FILES_${PN} += "${datadir}/icons/ ${datadir}/appdata"
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'sysprof2.service', '', d)}"
 
-- 
2.11.0


