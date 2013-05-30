Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7797E6162D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:01:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4U91f8w006581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 02:01:41 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 02:01:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 17:01:33 +0800
Message-ID: <af7f8fbdaf90a005c3306f5a1a3f3802e0669a82.1369820334.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369820334.git.hongxu.jia@windriver.com>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] ntfs-3g-ntfsprogs:import and update recipe from meta-oe
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
X-List-Received-Date: Thu, 30 May 2013 09:01:40 -0000
Content-Type: text/plain

Import version 2011.4.12 from meta-oe and update to version 2013.1.13.

This recipe is a merge of ntfs-3g and ntfsprogs

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb

diff --git a/meta/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb b/meta/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
new file mode 100644
index 0000000..0067cb2
--- /dev/null
+++ b/meta/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS driver for Linux with read and write support."
+HOMEPAGE = "http://www.ntfs-3g.org/"
+DEPENDS = "fuse libgcrypt"
+PROVIDES = "ntfsprogs ntfs-3g"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
+S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
+
+SRC_URI[md5sum] = "2d6fb47ddf62b51733227126fe9227fe"
+SRC_URI[sha256sum] = "4b383f0074a3ab7683339d1f18222b107aaeb4983db119292c43c2b275cefb27"
+
+inherit autotools
+
+# required or it calls ldconfig at install step
+EXTRA_OEMAKE = "LDCONFIG=echo"
+
+PACKAGES =+ "ntfs-3g ntfsprogs libntfs-3g"
+
+FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g* ${base_sbindir}/mount.ntfs"
+RDEPENDS_ntfs-3g += "fuse util-linux-mount"
+
+FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
+FILES_libntfs-3g = "${libdir}/*${SOLIBS}"
+
+do_install_append() {
+    # Standard mount will execute the program /sbin/mount.TYPE
+    # when called. Add the symbolic to let mount could find ntfs.
+    ln -sf mount.ntfs-3g ${D}/${base_sbindir}/mount.ntfs
+}
+
-- 
1.7.10.4


