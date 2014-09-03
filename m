Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCC6E713B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 09:41:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s839fhab024815
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 02:41:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 02:41:40 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 17:36:07 +0800
Message-ID: <b4a68ca960394f346025bb47035efa6b9e8e52a4.1409736914.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409736914.git.Chong.Lu@windriver.com>
References: <cover.1409736914.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] i2c-tools: create i2c-tools-misc package for perl scripts
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
X-List-Received-Date: Wed, 03 Sep 2014 09:41:45 -0000
Content-Type: text/plain

We don't want to install perl on small file systems by default.

The solution is to split those perl scripts from the main package, installing
them only when perl is available. We use PACKAGECONFIG to create and enable a
new feature "misc".

Add perl to RDEPENDS_i2c-tools-misc.

Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
index 4605414..854d180 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
@@ -3,8 +3,6 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-RDEPENDS_${PN} += "perl"
-
 SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2 \
            file://Module.mk \
 "
@@ -24,3 +22,15 @@ do_install_append() {
     install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
     rm -f ${D}${includedir}/linux/i2c-dev.h
 }
+
+PACKAGES =+ "${PN}-misc"
+RDEPENDS_${PN}-misc += "perl"
+FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
+                        ${bindir}/ddcmon \
+                        ${bindir}/decode-edid \
+                        ${bindir}/decode-dimms \
+                        ${bindir}/decode-vaio \
+                       "
+
+PACKAGECONFIG ??= "misc"
+PACKAGECONFIG[misc] = ",,, ${PN}-misc perl"
-- 
1.9.1


