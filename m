Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 294B36E8DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 08:06:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2686Ogb022814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 00:06:24 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 00:06:23 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Mar 2014 16:06:20 +0800
Message-ID: <9477177f82743adfab34256b7bc002a37dd61787.1394093112.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394093112.git.Chong.Lu@windriver.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Thu, 06 Mar 2014 08:06:27 -0000
Content-Type: text/plain

If image contains dbus and ptest is in DISTRO_FEATURES, dbus-ptest package
is installed, regardless of whether ptest-pkgs is in IMAGE_FEATURES. This
issue will increase size for most small images.
This patch fixes this problem.

[YOCTO #5702]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} | 0
 meta/recipes-core/dbus/dbus.inc                                      | 5 ++++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-test_1.6.18.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.6.18.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 677ff78..292bef6 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -6,7 +6,6 @@ LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 DEPENDS = "expat virtual/libintl"
-RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
 
@@ -151,3 +150,7 @@ do_install_class-nativesdk() {
 	rm -rf ${D}${localstatedir}/run
 }
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES += "dbus-ptest"
+ALLOW_EMPTY_${PN}-ptest = "1"
+RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs', 'dbus-test-ptest', 'dbus-test', d)}"
-- 
1.8.1.2


