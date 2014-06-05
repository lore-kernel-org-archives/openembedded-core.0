Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3444A6FA61
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 09:46:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2014 02:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,980,1392192000"; d="scan'208";a="542814625"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.113])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2014 02:46:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 10:46:16 +0100
Message-Id: <7f201e4112bf82e8a8efc4a609b65cff8da540b0.1401961481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1401961481.git.paul.eggleton@linux.intel.com>
References: <cover.1401961481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1401961481.git.paul.eggleton@linux.intel.com>
References: <cover.1401961481.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] libarchive: avoid dependency on e2fsprogs
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
X-List-Received-Date: Thu, 05 Jun 2014 09:46:25 -0000

libarchive's configure script looks for ext2fs/ext2_fs.h in order to use
some defines for file attributes support if present (but doesn't link to
any additional libraries.) There is no configure option to disable this,
and if e2fsprogs is rebuilding between do_configure and do_compile you
can currently get a failure. Because it doesn't need anything else from
e2fsprogs, and e2fsprogs isn't currently buildable for nativesdk anyway,
copy the headers in from e2fsprogs-native which we're likely to have
built already (and add it to DEPENDS just to be sure we have.)

Fixes [YOCTO #6268].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 3e6cdb4..2a2d0f9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -5,6 +5,8 @@ SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
 
+DEPENDS = "e2fsprogs-native"
+
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
@@ -36,4 +38,13 @@ SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2
 
 inherit autotools-brokensep lib_package pkgconfig
 
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
1.9.3


