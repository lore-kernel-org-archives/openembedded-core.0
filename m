Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7AE6FE69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 18:19:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jun 2014 11:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,472,1400050800"; d="scan'208";a="547675165"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2014 11:19:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 11:19:46 -0700
Message-Id: <1402683587-7488-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] e2fsprogs: use update-alt for chattr
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
X-List-Received-Date: Fri, 13 Jun 2014 18:19:53 -0000

Both busybox and e2fsprogs provide chattr, ensure that they are delivered
to the same location and use update-alternatives to ensure the correct
links are there.

[YOCTO #6407]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 2bdd724..5302554 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -54,6 +54,8 @@ do_install () {
 	fi
 
 	oe_multilib_header ext2fs/ext2_types.h
+	install -d ${D}${base_bindir}
+	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
 }
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
@@ -73,3 +75,10 @@ FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
 FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
 
 BBCLASSEXTEND = "native"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "chattr"
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_LINK_NAME[chattr] = "${base_bindir}/chattr"
+ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
-- 
1.8.3.1


