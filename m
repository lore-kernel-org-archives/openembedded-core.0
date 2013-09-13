Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACA3761855
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:02:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8DC2arK029968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:02:36 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 13 Sep 2013 05:02:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 20:02:32 +0800
Message-ID: <a8596b9162366df23d07ad8206ddb0ce8863b699.1379073449.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379073449.git.hongxu.jia@windriver.com>
References: <cover.1379073449.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Fri, 13 Sep 2013 12:02:35 -0000
Content-Type: text/plain

The libqt-mt is tested by lsb-dist-checker and lsb-test-desktop,
and it locates in meta-qt3 layer.
So if meta-qt3 is not added, there should be a warning to call
attention; if added, it will add libqt-mt to RDEPENDS.

[YOCTO #5153]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 1c1a8d1..f83c5d7 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -193,6 +193,15 @@ RDEPENDS_packagegroup-core-lsb-python = "\
     python-misc \
 "
 
+def get_libqt3(d):
+    if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
+        return 'libqt-mt3'
+
+    bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x')
+    bb.warn('libraries. Its intended use is for passing LSB tests as Qt3 is')
+    bb.warn('a requirement for LSB')
+    return ''
+
 SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
 DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
     specified in the LSB Desktop specification"
@@ -221,6 +230,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     atk \
     libasound \
     ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
+    ${@get_libqt3(d)} \
 "
 
 RDEPENDS_packagegroup-core-lsb-runtime-add = "\
-- 
1.8.1.2


