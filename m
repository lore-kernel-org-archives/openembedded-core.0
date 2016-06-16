Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A21176B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 10:59:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Jun 2016 03:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,480,1459839600"; d="scan'208";a="988686342"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2016 03:59:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2016 13:59:20 +0300
Message-Id: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/5] security_flags.inc: add SECURITY_NO_PIE_CFLAGS to libgcc and gcc-sanitizers
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
X-List-Received-Date: Thu, 16 Jun 2016 10:59:43 -0000

These recipes no longer seem to need full exclusion from security hardening.

The rest (glibc, gcc-runtime, valgrind, grub, grub-efi, uclibc) still do.

[YOCTO #9489]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index ea1d4e5..cd2b964 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -43,7 +43,7 @@ SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = ""
-SECURITY_CFLAGS_pn-gcc-sanitizers = ""
+SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
@@ -62,7 +62,7 @@ SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-iptables = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libgcc = ""
+SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libnewt = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
@@ -109,10 +109,8 @@ TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
-SECURITY_LDFLAGS_remove_pn-gcc-sanitizers = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
-SECURITY_LDFLAGS_remove_pn-libgcc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-uclibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-uclibc-initial = "-fstack-protector-strong"
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
-- 
2.8.1


