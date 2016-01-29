Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A999F76DF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 15:04:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 Jan 2016 07:04:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,364,1449561600"; d="scan'208";a="891900248"
Received: from mshai-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.30.5])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2016 07:04:34 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 17:04:31 +0200
Message-Id: <1454079871-4658-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454079871-4658-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454079871-4658-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/3] externalsrc: use shared CONFIGURESTAMPFILE if B=S
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
X-List-Received-Date: Fri, 29 Jan 2016 15:04:48 -0000

External source tree is used as the builddir even for different
architectures in case ${B}=${S}. This may cause problems if MACHINE is
changed as do_configure is not being re-run (which would run make
clean). This patches changes externalsrc to use a common (per-recipe)
CONFIGURESTAMPFILE under 'work-shared' if ${B}=${S}. In addition,
do_configure will depend on changes of this stamp file. As a result,
do_configure is re-run and the build dir is cleaned correctly if a
rebuild for different MACHINE is done.

[YOCTO #8950]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index f7ed66d..be0fe55 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -85,6 +85,17 @@ python () {
 
         # Ensure compilation happens every time
         d.setVarFlag('do_compile', 'nostamp', '1')
+
+        # If B=S the same builddir is used even for different architectures.
+        # Thus, use a shared CONFIGURESTAMPFILE so that change of do_configure
+        # task hash is correctly detected if e.g. MACHINE changes. In addition,
+        # do_configure needs to depend on the stamp file so that the task is
+        # re-run when the stamp was changed since the last run on this
+        # architecture.
+        if d.getVar('S', True) == d.getVar('B', True):
+            configstamp = '${TMPDIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}/configure.sstate'
+            d.setVar('CONFIGURESTAMPFILE', configstamp)
+            d.setVarFlag('do_configure', 'file-checksums', configstamp + ':True')
 }
 
 python externalsrc_compile_prefunc() {
-- 
2.1.4


