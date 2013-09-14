Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD12F6C764
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 02:40:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8E2enA0001091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 19:40:49 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 13 Sep 2013 19:40:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Sep 2013 10:40:45 +0800
Message-ID: <f68ed559f85f1ea1be513dcea93d9b4dad6a8e3f.1379126215.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379126215.git.hongxu.jia@windriver.com>
References: <cover.1379126215.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] LSB 4.1 Library Check: fix unable to find library libqt-mt.so.3
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
X-List-Received-Date: Sat, 14 Sep 2013 02:40:48 -0000
Content-Type: text/plain

The libqt-mt is tested by lsb-dist-checker and lsb-test-desktop,
and it locates in meta-qt3 layer.
So if meta-qt3 is not added, there should be a warning to call
attention; if added, it will add libqt-mt to RDEPENDS.

[YOCTO #5153]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 1c1a8d1..c0dda5a 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -193,6 +193,16 @@ RDEPENDS_packagegroup-core-lsb-python = "\
     python-misc \
 "
 
+def get_libqt3(d):
+    if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
+        return 'libqt-mt3'
+
+    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":
+        bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x')
+        bb.warn('libraries. Its intended use is for passing LSB tests as Qt3 is')
+        bb.warn('a requirement for LSB')
+    return ''
+
 SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
 DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
     specified in the LSB Desktop specification"
@@ -221,6 +231,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     atk \
     libasound \
     ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
+    ${@get_libqt3(d)} \
 "
 
 RDEPENDS_packagegroup-core-lsb-runtime-add = "\
-- 
1.8.1.2


