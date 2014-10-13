Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 26B336ACB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 03:54:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D3sChj012596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Oct 2014 20:54:12 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 12 Oct 2014 20:54:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 12 Oct 2014 23:53:59 -0400
Message-ID: <6a01a5b6d5e737531135479f22ba4baf61c23597.1413172183.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1413172183.git.bruce.ashfield@windriver.com>
References: <cover.1413172183.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kernel-yocto: fix branch validation for AUTOREV, non machine_meta kernels
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
X-List-Received-Date: Mon, 13 Oct 2014 03:54:16 -0000
Content-Type: text/plain

The simplication of do_validate_branches missed a case where a custom
kernel can supply SRCREV="${AUTOREV}", and not use SRCREV_machine at all.

In this case, we will incorrectly try and test the tree for a non-existent
commit, and break the build.

By simplying the condition of the check to look for an empty SRCREV_machine,
we can skip manipulating the tree and testing for a SRCREV.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 7718f9ab1b58..e672a0e3a5aa 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -288,12 +288,14 @@ do_validate_branches() {
 	# check and we can exit early
 	if [ "${machine_srcrev}" = "AUTOINC" ]; then
 		bbnote "SRCREV validation is not required for AUTOREV"
-	elif [ "${machine_srcrev}" = "" ] && [ "${SRCREV}" != "AUTOINC" ]; then
-		# SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
-		# that doesn't use the SRCREV_FORMAT "machine_meta" is being built. In
-		# this case, we need to reset to the give SRCREV before heading to patching
-		bbnote "custom recipe is being built, forcing SRCREV to ${SRCREV}"
-		force_srcrev="${SRCREV}"
+	elif [ "${machine_srcrev}" = "" ]; then
+		if [ "${SRCREV}" != "AUTOINC" ]; then
+		       # SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
+		       # that doesn't use the SRCREV_FORMAT "machine_meta" is being built. In
+		       # this case, we need to reset to the give SRCREV before heading to patching
+		       bbnote "custom recipe is being built, forcing SRCREV to ${SRCREV}"
+		       force_srcrev="${SRCREV}"
+		fi
 	else
 		git cat-file -t ${machine_srcrev} > /dev/null
 		if [ $? -ne 0 ]; then
-- 
1.8.1.2


