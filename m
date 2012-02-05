Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rtvkz-00013k-Om
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Feb 2012 07:39:26 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q156VIVa002873;
	Sat, 4 Feb 2012 22:31:21 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  5 Feb 2012 01:31:05 -0500
Message-Id: <3b763b26201b41190909e291451e56c76943aa2b.1328423023.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1328423023.git.bruce.ashfield@windriver.com>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1328423023.git.bruce.ashfield@windriver.com>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/5] linux-yocto: locate and use out of tree features specified on the SRC_URI
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
X-List-Received-Date: Sun, 05 Feb 2012 06:39:27 -0000

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
1.7.4.1



