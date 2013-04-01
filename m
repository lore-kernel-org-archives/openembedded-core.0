Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UMiVm-0006fQ-Uw
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 19:27:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r31H9sZV002857
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 10:09:54 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 10:09:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 1 Apr 2013 10:09:34 -0700
Message-ID: <5389a28a24e7cc7046d86d78c9e516b0ff76af86.1364835699.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364835699.git.bruce.ashfield@windriver.com>
References: <cover.1364835699.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] kernel-yocto: use KBRANCH as default build branch
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
X-List-Received-Date: Mon, 01 Apr 2013 17:27:15 -0000
Content-Type: text/plain

commit 61001aa [kernel-yocto: respect SRC_URI modified branch selection]
changed branch processing such that a branch specified in the SRC_URI
would set the branch forced as the build branch.

This change broke compatibility with the yocto-bsp, linux-yocto-custom
based recipes. These recipes specify the branch to be built via KBRANCH,
but allow the fetcher to use master for keeping the repository up to
date. This means that no explicit branch is set in the SRC_URI and the
routines return the default branch of 'master', which is not what is
set in KBRANCH.

To support this case, we simply pass a default branch into the routine
returning the branch to build, and ensure that the default is KBRANCH
so if no branch is passed in the SRC_URI, KBRANCH is always built.

[YOCTO #4145]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 7b8e607..d1b4f10 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -46,7 +46,7 @@ def find_kernel_feature_dirs(d):
 
 # find the master/machine source branch. In the same way that the fetcher proceses
 # git repositories in the SRC_URI we take the first repo found, first branch.
-def get_machine_branch(d):
+def get_machine_branch(d, default):
     fetch = bb.fetch2.Fetch([], d)
     for url in fetch.urls:
         urldata = fetch.ud[url]
@@ -55,7 +55,7 @@ def get_machine_branch(d):
             branches = urldata.parm.get("branch").split(',')
             return branches[0]
 	    
-    return "master"
+    return default
 
 do_patch() {
 	cd ${S}
@@ -70,7 +70,7 @@ do_patch() {
 		fi
 	fi
 
-	machine_branch="${@ get_machine_branch(d)}"
+	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 
 	# if we have a defined/set meta branch we should not be generating
 	# any meta data. The passed branch has what we need.
@@ -195,7 +195,8 @@ do_kernel_checkout() {
 		fi
 	fi
 	
-	machine_branch="${@ get_machine_branch(d)}"
+	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
+
 	if [ "${KBRANCH}" != "${machine_branch}" ]; then
 		echo "WARNING: The SRC_URI machine branch and KBRANCH are not the same."
 		echo "	       KBRANCH will be adjusted to match, but this typically is a"
@@ -280,7 +281,7 @@ do_validate_branches() {
 	cd ${S}
 	export KMETA=${KMETA}
 
-	machine_branch="${@ get_machine_branch(d)}"
+	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 
 	set +e
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
-- 
1.7.10.4



