Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8F37722E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 01:08:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8818qcb015174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 18:08:53 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 18:08:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 7 Sep 2016 21:08:45 -0400
Message-ID: <19733dbba22db959884039e2afa6f900ad64fae3.1473296553.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1473296553.git.bruce.ashfield@windriver.com>
References: <cover.1473296553.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] kernel-yocto: restore kernel-meta data detection for SRC_URI elements
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
X-List-Received-Date: Thu, 08 Sep 2016 01:08:56 -0000
Content-Type: text/plain

Before the kernel tools were simplified and streamlined, there was code
which not only migrated a patch/cfg/scc to the kernel build tree, it
also migrated any subdirectories of those patches.

The effect of this data migration was that any other meta data in
a patch's directory structure would be available for processing.

While we don't want to do this migration anymore, it is possible to
check the path of any SRC_URI patches, and if they include a "kernel-meta"
subdirectory add it to the search path.

This restores the functionality without the old complexity.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 068378f06796..f991f0219b1f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -124,14 +124,19 @@ do_kernel_metadata() {
 	# for the update part of the process
 	for f in ${feat_dirs}; do
 		if [ -d "${WORKDIR}/$f/meta" ]; then
-			includes="$includes -I${WORKDIR}/$f/meta"
-		elif [ -d "${WORKDIR}/$f" ]; then
+			includes="$includes -I${WORKDIR}/$f/kernel-meta"
+	        elif [ -d "${WORKDIR}/$f" ]; then
 			includes="$includes -I${WORKDIR}/$f"
 		fi
 	done
-	for s in ${sccs}; do
+	for s in ${sccs} ${patches}; do
 		sdir=$(dirname $s)
 		includes="$includes -I${sdir}"
+                # if a SRC_URI passed patch or .scc has a subdir of "kernel-meta",
+                # then we add it to the search path
+                if [ -d "${sdir}/kernel-meta" ]; then
+			includes="$includes -I${sdir}/kernel-meta"
+                fi
 	done
 
 	# expand kernel features into their full path equivalents
-- 
2.5.0


