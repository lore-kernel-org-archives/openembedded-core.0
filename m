Return-Path: <topi.kuutela@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2357C7673B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:42:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Aug 2015 23:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,628,1432623600"; d="scan'208";a="779512919"
Received: from tkuutela-desk.fi.intel.com ([10.237.68.32])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2015 23:42:28 -0700
From: Topi Kuutela <topi.kuutela@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 09:42:35 +0300
Message-Id: <1438929755-17296-1-git-send-email-topi.kuutela@intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH v3] python3: security: disable -pie and -fpie from Python3 compilation.
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
X-List-Received-Date: Fri, 07 Aug 2015 06:42:33 -0000

If security_flags.inc is 'required' to the image, -pie and -fpie options
are added to CFLAGS. These are not compatible with -shared GCC option.
The result is several errors of following form and missing Python3
modules in the image:

    *.o In function `_start': *.S undefined reference to `main'
    collect2: error: ld returned 1 exit status

Signed-off-by: Topi Kuutela <topi.kuutela@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 3724972..ff600fa 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -82,6 +82,7 @@ SECURITY_CFLAGS_pn-python-imaging = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.4.3

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


