Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4E7785C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:39:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB4FdbUe018298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Dec 2017 07:39:37 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 07:39:36 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Dec 2017 10:39:25 -0500
Message-ID: <149752d3e5fdfd0c876c8edc8ff4abb468bb3c95.1512401707.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1512401707.git.bruce.ashfield@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] kernel-yocto: ensure that only a single defconfig is processed
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
X-List-Received-Date: Mon, 04 Dec 2017 15:39:37 -0000
Content-Type: text/plain

As a follow up to the changes to ensure that KBUILD_DEFCONFIG will
always get its defconfig into the processing, we also should ensure that
we don't get both a KBUILD_DEFCONFIG and a SRC_URI defconfig in the
configuration queue. If both are in the configuration queue, we end up
with competing values and a potentially long running check of 5000+
options x 2 against the final .config.

By removing the defconfig found from the SRC_URI when one is found
via KBUILD_DEFCONFIG, we ensure that only one will be processed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 2edf0fd15788..60979a218f12 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -107,6 +107,8 @@ do_kernel_metadata() {
 				cmp "${WORKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
 				if [ $? -ne 0 ]; then
 					bbwarn "defconfig detected in WORKDIR. ${KBUILD_DEFCONFIG} skipped"
+				else
+					cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
 				fi
 			else
 				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
@@ -117,10 +119,19 @@ do_kernel_metadata() {
 		fi
 	fi
 
-	sccs="$sccs ${@" ".join(find_sccs(d))}"
+	sccs_from_src_uri="${@" ".join(find_sccs(d))}"
 	patches="${@" ".join(find_patches(d))}"
 	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
 
+	# a quick check to make sure we don't have duplicate defconfigs
+	# If there's a defconfig in the SRC_URI, did we also have one from
+	# the KBUILD_DEFCONFIG processing above ?
+	if [ -n "$sccs" ]; then
+	    # we did have a defconfig from above. remove any that might be in the src_uri
+	    sccs_from_src_uri=$(echo $sccs_from_src_uri | sed 's/defconfig//g')
+	fi
+	sccs="$sccs $sccs_from_src_uri"
+
 	# check for feature directories/repos/branches that were part of the
 	# SRC_URI. If they were supplied, we convert them into include directives
 	# for the update part of the process
-- 
2.5.0


