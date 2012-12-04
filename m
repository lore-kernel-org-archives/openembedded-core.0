Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tg29x-0001gR-DQ
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 00:44:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 15:29:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,217,1355126400"; d="scan'208";a="229008991"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.117])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 15:29:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 15:29:19 -0800
Message-Id: <1354663759-20022-11-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354663759-20022-1-git-send-email-sgw@linux.intel.com>
References: <1354663759-20022-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/4] sstate: fetch .siginfo files from SSTATE_MIRROR
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
X-List-Received-Date: Tue, 04 Dec 2012 23:44:21 -0000

This would be useful for doing siginfo compares to understand why a build
is not reusing something when using SSTATE_MIRROR. No error will be reported
if it fails to find the .siginfo file

[YOCTO #2898]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 832b39e..6b4b5a1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -212,10 +212,14 @@ def sstate_installpkg(ss, d):
 
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
     sstatefetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['name'] + ".tgz"
+    siginfofetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['name'] + ".tgz.siginfo"
     sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz"
+    siginfopkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz.siginfo"
 
     if not os.path.exists(sstatepkg):
         pstaging_fetch(sstatefetch, sstatepkg, d)
+    if not os.path.exists(siginfopkg):
+        pstaging_fetch(siginfofetch, siginfopkg, d)
 
     if not os.path.isfile(sstatepkg):
         bb.note("Staging package %s does not exist" % sstatepkg)
-- 
1.8.0



