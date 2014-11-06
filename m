Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 766D172032
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:08:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 21:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,324,1413270000"; d="scan'208";a="627443315"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.89])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 21:08:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 21:08:52 -0800
Message-Id: <1415250534-16350-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
References: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] libarchive: avoid dependency on e2fsprogs
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
X-List-Received-Date: Thu, 06 Nov 2014 05:08:55 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

libarchive's configure script looks for ext2fs/ext2_fs.h in order to use
some defines for file attributes support if present (but doesn't link to
any additional libraries.) There is no configure option to disable this,
and if e2fsprogs is rebuilding between do_configure and do_compile you
can currently get a failure. Because it doesn't need anything else from
e2fsprogs, and e2fsprogs isn't currently buildable for nativesdk anyway,
copy the headers in from e2fsprogs-native which we're likely to have
built already (and add it to DEPENDS just to be sure we have.)

Fixes [YOCTO #6268].

(From OE-Core master rev: ad754e46ad477acfbe7543187a5c38bc333b8612)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index f90dc02..99a924c 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -5,6 +5,8 @@ SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
 
+DEPENDS = "e2fsprogs-native"
+
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
@@ -35,4 +37,13 @@ SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2
 
 inherit autotools-brokensep lib_package
 
+CPPFLAGS += "-I${WORKDIR}/extra-includes"
+
+do_configure[cleandirs] += "${WORKDIR}/extra-includes"
+do_configure_prepend() {
+	# We just need the headers for some type constants, so no need to
+	# build all of e2fsprogs for the target
+	cp -R ${STAGING_INCDIR_NATIVE}/ext2fs ${WORKDIR}/extra-includes/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1


