Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 391B5731F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 09:21:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7M9LeTi019689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 02:21:40 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 22 Aug 2016 02:21:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 17:06:06 +0800
Message-ID: <efaf91f3dfb40f0d3d18c54605fcf2cf81d62b28.1471857001.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471857001.git.jackie.huang@windriver.com>
References: <cover.1471857001.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/17] rsync: use rsync.inc to avoid duplicated codes
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
X-List-Received-Date: Mon, 22 Aug 2016 09:21:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

There are two versions of rsync but the rsync.inc is
only used by 3.x, there are duplicated codes in 2.x,
so this commit include changes:

* remove duplicated codes in 2.x and require the inc
* move the LICENSE from inc to each bb

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/rsync/rsync.inc      |  5 -----
 meta/recipes-devtools/rsync/rsync_2.6.9.bb | 23 ++++-------------------
 meta/recipes-devtools/rsync/rsync_3.1.2.bb |  4 ++++
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
index c65f270..8739c9c 100644
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ b/meta/recipes-devtools/rsync/rsync.inc
@@ -3,11 +3,6 @@ HOMEPAGE = "http://rsync.samba.org/"
 BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
 
-# GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-# needs to add acl and attr
 DEPENDS = "popt"
 
 SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
index 6854c77..5a19e21 100644
--- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
@@ -1,27 +1,12 @@
-SUMMARY = "File synchronization tool"
-HOMEPAGE = "http://rsync.samba.org/"
-BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
-SECTION = "console/network"
+require rsync.inc
 
-# needs to add acl and attr
-DEPENDS = "popt"
-
-SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
-           file://rsync-2.6.9-fname-obo.patch \
-           file://rsyncd.conf"
+SRC_URI += "file://rsync-2.6.9-fname-obo.patch \
+            file://rsyncd.conf \
+"
 
 SRC_URI[md5sum] = "996d8d8831dbca17910094e56dcb5942"
 SRC_URI[sha256sum] = "ca437301becd890e73300bc69a39189ff1564baa761948ff149b3dd7bde633f9"
 
-inherit autotools
-
-do_install_append() {
-	install -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}${sysconfdir}
-}
-
-EXTRA_OEMAKE='STRIP=""'
-
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6d5a9d4c4d3af25cd68fd83e8a8cb09c"
 
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.2.bb b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
index 9637ed4..798fecc 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
@@ -5,6 +5,10 @@ SRC_URI += "file://makefile-no-rebuild.patch"
 SRC_URI[md5sum] = "0f758d7e000c0f7f7d3792610fad70cb"
 SRC_URI[sha256sum] = "ecfa62a7fa3c4c18b9eccd8c16eaddee4bd308a76ea50b5c02a5840f09c0a1c2"
 
+# GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
 PACKAGECONFIG ??= "acl attr"
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
-- 
2.8.1


