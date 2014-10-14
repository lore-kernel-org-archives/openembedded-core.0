Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C8FE671210
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:20:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 14 Oct 2014 02:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="399903785"
Received: from gtotamun-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.192])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2014 02:13:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Oct 2014 10:20:24 +0100
Message-Id: <42a68e3379047a3c191908b57067ead7899e2f38.1413278343.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413278343.git.paul.eggleton@linux.intel.com>
References: <cover.1413278343.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413278343.git.paul.eggleton@linux.intel.com>
References: <cover.1413278343.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] python: force off_t size to 8 to enable large file support
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
X-List-Received-Date: Tue, 14 Oct 2014 09:20:39 -0000

If DISTRO_FEATURES contains "largefile", force the size of off_t to 8 as
a workaround for having ac_cv_sizeof_off_t=4 on 32-bit systems. In
future we will likely drop the value from the site file, but for now
this is a slightly safer fix.

Fixes [YOCTO #6813].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index d93bc64..cc92ebc 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -49,6 +49,9 @@ inherit autotools multilib_header python-dir pythonnative
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


