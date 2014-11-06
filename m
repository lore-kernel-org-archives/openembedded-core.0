Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56C4D7201C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:08:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 21:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,324,1413270000"; d="scan'208";a="627443306"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.89])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 21:08:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 21:08:50 -0800
Message-Id: <1415250534-16350-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
References: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] python: force off_t size to 8 to enable large file support
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

If DISTRO_FEATURES contains "largefile", force the size of off_t to 8 as
a workaround for having ac_cv_sizeof_off_t=4 on 32-bit systems. In
future we will likely drop the value from the site file, but for now
this is a slightly safer fix.

Fixes [YOCTO #6813].

(From OE-Core master rev: a8216030ee6c65531de8fbf3eed878a345a94edc)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 0d64172..5270df9 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -47,6 +47,9 @@ inherit autotools multilib_header python-dir pythonnative
 TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 
+# The following is a hack until we drop ac_cv_sizeof_off_t from site files
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)}"
+
 do_configure_prepend() {
 	rm -f ${S}/Makefile.orig
 	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
-- 
1.8.3.1


