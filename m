Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1312572207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 14:39:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jan 2015 06:39:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="440942419"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.162])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jan 2015 06:26:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 06:39:06 -0800
Message-Id: <1421332746-8069-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2] glibc: Fix up minimal build with libc-libm
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
X-List-Received-Date: Thu, 15 Jan 2015 14:39:17 -0000

This addresses 2 issues discovered trying to build a minimal libc with
libm option.  By default nscd was always being built and without inet
enabled there were missing symbols.

[YOCTO #7108]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch | 3 ++-
 meta/recipes-core/glibc/glibc_2.20.bb                        | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 7136253..332b8f7 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -4205,7 +4205,8 @@ Index: git/nss/getent.c
  D(gshadow)
 -D(hosts)
 +DN(hosts)
- D(initgroups)
+-D(initgroups)
++DN(initgroups)
 -D(netgroup)
 -D(networks)
 +DN(netgroup)
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index 9dd5e67..f67fbfd 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -90,9 +90,12 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-selinux \
                 --enable-obsolete-rpc \
                 --with-kconfig=${STAGING_BINDIR_NATIVE} \
+                --disable-nscd \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-inet-anl', '--enable-nscd', '--disable-nscd', d)}"
+
 
 do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
-- 
2.1.0


