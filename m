Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71E096018C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 02:20:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3R2KZXX030790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:20:35 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Apr 2016 19:20:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Apr 2016 19:20:30 -0700
Message-ID: <75bc093f2baf23824118d59164a099da025aa105.1461723377.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461723377.git.liezhi.yang@windriver.com>
References: <cover.1461723377.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] libxsettings-client: fix COPYING file
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
X-List-Received-Date: Wed, 27 Apr 2016 02:20:34 -0000
Content-Type: text/plain

Fixed:
* Move the code of copy COPYING file from do_configure_append() to
  do_patch[postfuncs] since we had moved license-checksum from
  do_package_qa to do_populate_lic.
* Add xsettings-client.c and xsettings-common.c to LIC_FILES_CHKSUM.
* Update comments.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libxsettings-client/libxsettings-client_0.10.bb         | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
index 67c5e27..9e9336e 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
@@ -9,7 +9,9 @@ SECTION = "x/libs"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-client.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
-                    file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
+                    file://xsettings-client.c;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
+                    file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
+                    file://xsettings-common.c;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
 DEPENDS = "virtual/libx11"
 
 PR = "r5"
@@ -31,10 +33,11 @@ inherit autotools gettext distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-do_configure_prepend() {
-    # This package doesn't ship with its own COPYING file and
-    # autotools will install a GPLv2 one instead of the actual MIT-style license here.
-    # Add the correct license here to avoid confusion.
+do_patch[postfuncs] += "update_copying_file"
+update_copying_file() {
+    # This package ships with a GPLv2 COPYING file, but the author says
+    # it is actual MIT-style license, add the correct license here to
+    # avoid confusion.
     cp -f ${WORKDIR}/MIT-style-license ${S}/COPYING
 }
 
-- 
2.7.4


