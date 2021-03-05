Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.7663.1614918143328449753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ojq8DObaauRvJk8ecZIKV0LKbfQjTxq7epvOsZHWjdIbCl3L3bUjeDo+HOCS4ED2x7QJrm662L
 ZwRZnMmBcosw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670848"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:03 -0800
IronPort-SDR: 7DF4stTxb57e5R2+AmY4sGTBefe8UjL5DJsbc/rv6i6RKMztUZbMmPMsagAe0qsPgpzoUMe92H
 0va3jiF1qyrg==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128764"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:02 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/52] xorg-minimal-fonts: Really fix determinism
Date: Fri,  5 Mar 2021 12:20:40 +0800
Message-Id: <d3019a718b5f6250fa3486d69af0b1fc9a011dfd.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

My previous fix wasn't correct as the file timestamps do vary by git checkout
or modification time and aren't correct here. Instead use a specific
date/time for the files to be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 725a30a30052540a4b7fc2933396fe9eb946eeac)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index e1e470bf34..bf8385fe6d 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -10,8 +10,12 @@ LIC_FILES_CHKSUM = "file://../misc/fonts.dir;md5=82a143d94d6a974aafe97132d2d519a
 
 SRC_URI = "file://misc"
 
+SOURCE_DATE_EPOCH = "1613559011"
+
 PE = "1"
-PR = "r2"
+PR = "r3"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 
 inherit allarch features_check
 
@@ -26,7 +30,9 @@ RDEPENDS_${PN} += "font-alias"
 
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
-	install -m 0644 -p ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	install -m 0644 ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	# Pick a date/time as otherwise it would be the git checkout/modify time
+	touch -d @1613559011 ${D}/${datadir}/fonts/X11/misc/*
 	install -d ${D}/${libdir}/X11
 	ln -sf ${datadir}/fonts/X11/ ${D}/${libdir}/X11/fonts -s
 }
-- 
2.29.2

