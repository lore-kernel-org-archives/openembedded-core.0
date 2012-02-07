Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvO-0004HK-DI
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206408"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:37 -0800
Message-Id: <3e2ce87566124db8c78472f9a4f00ab26410f213.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/35] linux-yocto: locate and use out of tree features specified on the SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 22:54:11 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

In a similar manner to calling the patch.bbclass to locate patches that
were listed on the SRC_URI, it is also useful to query about 'other' items
that are on the SRC_URI. In the case of linux-yocto, it allows us to
know about kernel features that were specific on the URI and then apply
them to the current tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 7fdefcf..3130bf4 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -10,6 +10,16 @@ def find_patches(d):
 
 	return patch_list
 
+def find_sccs(d):
+	sources=src_patches(d, True)
+	sources_list=[]
+	for s in sources:
+		base, ext = os.path.splitext(os.path.basename(s))
+		if ext and ext in ('.scc'):
+			sources_list.append(s)
+
+	return sources_list
+
 do_patch() {
 	cd ${S}
 	if [ -f ${WORKDIR}/defconfig ]; then
@@ -42,6 +52,7 @@ do_patch() {
 	fi
 
 	patches="${@" ".join(find_patches(d))}"
+	sccs="${@" ".join(find_sccs(d))}"
 
 	# This loops through all patches, and looks for directories that do
 	# not already have feature descriptions. If a directory doesn't have
@@ -81,6 +92,16 @@ do_patch() {
 		fi
 	done
 
+	# look for any found scc files, and ensure they are added to the list
+	# of directories passsed to updateme
+	for s in ${sccs}; do
+		sdir=`dirname ${s}`
+		echo ${patch_dirs} | grep -q ${sdir}
+		if [ $? -ne 0 ]; then
+			patch_dirs="${patch_dirs} ${sdir}"
+		fi
+	done
+
 	# go through the patch directories and look for any scc feature files
 	# that were constructed above. If one is found, rename it to ".scc" so
 	# the kernel patching can see it.
-- 
1.7.6.5



