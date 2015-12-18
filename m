Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11935731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:44:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBIKihN7003007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 18 Dec 2015 12:44:44 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Dec 2015 12:44:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 18 Dec 2015 15:44:36 -0500
Message-ID: <dc64e1bbd415e6261cd034db6705824f92e93e14.1450471022.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450471022.git.bruce.ashfield@windriver.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] kernel-yocto: fix checkout bare-cloned kernel repositories
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
X-List-Received-Date: Fri, 18 Dec 2015 20:44:46 -0000
Content-Type: text/plain

From: Jianxun Zhang <jianxun.zhang@linux.intel.com>

The existing code doesn't tell regular (with .git) and bare cases and
just move the unpacked repo to the place of kernel source. But later
steps will fail on a bare-cloned repo because we can not checkout
directly in a bare cloned repo.

This change performs another clone to fix the issue.

Note: This change doesn't cover the case that S and WORKDIR are same
and the repo is bare cloned.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 00d9667fe0a6..c2d0d3076f45 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -184,11 +184,18 @@ do_kernel_checkout() {
 	source_dir=`echo ${S} | sed 's%/$%%'`
 	source_workdir="${WORKDIR}/git"
 	if [ -d "${WORKDIR}/git/" ]; then
-		# case: git repository (bare or non-bare)
+		# case: git repository
 		# if S is WORKDIR/git, then we shouldn't be moving or deleting the tree.
 		if [ "${source_dir}" != "${source_workdir}" ]; then
-			rm -rf ${S}
-			mv ${WORKDIR}/git ${S}
+			if [ -d "${source_workdir}/.git" ]; then
+				# regular git repository with .git
+				rm -rf ${S}
+				mv ${WORKDIR}/git ${S}
+			else
+				# create source for bare cloned git repository
+				git clone ${WORKDIR}/git ${S}
+				rm -rf ${WORKDIR}/git
+			fi
 		fi
 		cd ${S}
 	else
-- 
2.1.0


