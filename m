Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UJ7vw-0006KB-EW
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 20:47:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2013 12:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,893,1355126400"; d="scan'208";a="310637850"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.200])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2013 12:30:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 12:30:28 -0700
Message-Id: <1363980628-11678-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] cairo: explicity disable lzo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 19:47:43 -0000

By explicitly disabling the LZO check, we ensure a deterministic build

[YOCTO #4076]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 9bec6c2..06d2dee 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -24,8 +24,9 @@ EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} \
                  --enable-tee \
                 "
 
-
 inherit autotools pkgconfig
 
 # We don't depend on binutils so we need to disable this
 export ac_cv_lib_bfd_bfd_openr="no"
+# Ensure we don't depend on LZO
+export ac_cv_lib_lzo2_lzo2a_decompress="no"
-- 
1.8.0.2



