Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BAED86FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 09:21:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M9LfIj024634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 02:21:41 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 22 Aug 2016 02:21:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 17:06:07 +0800
Message-ID: <465a1e60b3586015948f86fb01fc39d4f218d415.1471857001.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471857001.git.jackie.huang@windriver.com>
References: <cover.1471857001.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/17] rsync: control ipv6 support based on DISTRO_FEATURES
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
X-List-Received-Date: Mon, 22 Aug 2016 09:21:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for ipv6 and control it based
on DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/rsync/rsync.inc      | 2 ++
 meta/recipes-devtools/rsync/rsync_2.6.9.bb | 2 ++
 meta/recipes-devtools/rsync/rsync_3.1.2.bb | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
index 8739c9c..37897ab 100644
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ b/meta/recipes-devtools/rsync/rsync.inc
@@ -16,3 +16,5 @@ do_install_append() {
 }
 
 EXTRA_OEMAKE='STRIP=""'
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
index 5a19e21..efdf255 100644
--- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
@@ -11,3 +11,5 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6d5a9d4c4d3af25cd68fd83e8a8cb09c"
 
 PR = "r4"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.2.bb b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
index 798fecc..c6cb331 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
@@ -9,7 +9,9 @@ SRC_URI[sha256sum] = "ecfa62a7fa3c4c18b9eccd8c16eaddee4bd308a76ea50b5c02a5840f09
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PACKAGECONFIG ??= "acl attr"
+PACKAGECONFIG ??= "acl attr \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+"
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
 
-- 
2.8.1


