Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 64EBD65E94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 15:23:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Oct 2014 08:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,796,1406617200"; d="scan'208";a="596967979"
Received: from tlankage-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.121.248])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2014 08:23:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Oct 2014 15:23:23 +0000
Message-Id: <5b27a6cffafddb75301c325bc9aa8eadd09d5551.1414423342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1414423342.git.paul.eggleton@linux.intel.com>
References: <cover.1414423342.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1414423342.git.paul.eggleton@linux.intel.com>
References: <cover.1414423342.git.paul.eggleton@linux.intel.com>
Subject: [daisy][PATCH 1/2] python: force off_t size to 8 to enable large file support
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
X-List-Received-Date: Mon, 27 Oct 2014 15:23:36 -0000

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
1.9.3


