Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0336B710C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cdO4007782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:39 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:10 -0400
Message-ID: <71278c7db2a66f33cd5640f754bae89490156197.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/18] kernel-yocto: simplify branch SRCREV validation
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:39 -0000
Content-Type: text/plain

The checking of machine and meta branch SRCREVs was inconsistent and
didn't allow a mixed AUTOREV machine/meta branch combination. By
simplifying the checks and changing the logic, we can now allow this
combination.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 49 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 087fbb0c3702..0ac1572471bc 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -311,37 +311,36 @@ do_validate_branches() {
 	if [ "${machine_srcrev}" = "AUTOINC" ] || [ "${machine_srcrev}" = "INVALID" ] ||
 	   [ "${machine_srcrev}" = "" ]; then
 		bbnote "INFO: SRCREV validation is not required for AUTOREV or empty/invalid settings, returning"
-		return
-	fi
-
-
-	git cat-file -t ${machine_srcrev} > /dev/null
-	if [ if $? -ne 0 ]; then
-	    echo "ERROR ${machine_srcrev} is not a valid commit ID."
-	    echo "The kernel source tree may be out of sync"
-	    exit 1
+	else
+		git cat-file -t ${machine_srcrev} > /dev/null
+		if [ if $? -ne 0 ]; then
+			echo "ERROR ${machine_srcrev} is not a valid commit ID."
+			echo "The kernel source tree may be out of sync"
+			exit 1
+		fi
 	fi
 
 	## KMETA branch validation.
 	## We do validation if the meta branch exists, and AUTOREV hasn't been set
- 	meta_head=`git show-ref -s --heads ${KMETA}`
- 	target_meta_head="${SRCREV_meta}"
-	git show-ref --quiet --verify -- "refs/heads/${KMETA}"
-	if [ $? -eq 0 ] && [ "${target_meta_head}" != "AUTOINC" ]; then
+	target_meta_head="${SRCREV_meta}"
+	if [ "${target_meta_head}" = "AUTOINC" ] || [ "${target_meta_head}" = "" ]; then
+		bbnote "INFO: SRCREV validation skipped for AUTOREV or empty meta branch"
+	else
+	 	meta_head=`git show-ref -s --heads ${KMETA}`
+
+		git cat-file -t ${target_meta_head} > /dev/null
+		if [ $? -ne 0 ]; then
+			echo "ERROR ${target_meta_head} is not a valid commit ID"
+			echo "The kernel source tree may be out of sync"
+			exit 1
+		fi
 		if [ "$meta_head" != "$target_meta_head" ]; then
-			git cat-file -t ${target_meta_head} > /dev/null
-			if [ $? -ne 0 ]; then
-				echo "ERROR ${target_meta_head} is not a valid commit ID"
-				echo "The kernel source tree may be out of sync"
+			echo "[INFO] Setting branch ${KMETA} to ${target_meta_head}"
+			git branch -m ${KMETA} ${KMETA}-orig
+			git checkout -q -b ${KMETA} ${target_meta_head}
+			if [ $? -ne 0 ];then
+				echo "ERROR: could not checkout ${KMETA} branch from known hash ${target_meta_head}"
 				exit 1
-			else
-				echo "[INFO] Setting branch ${KMETA} to ${target_meta_head}"
-				git branch -m ${KMETA} ${KMETA}-orig
-				git checkout -q -b ${KMETA} ${target_meta_head}
-				if [ $? -ne 0 ];then
-					echo "ERROR: could not checkout ${KMETA} branch from known hash ${target_meta_head}"
-					exit 1
-				fi
 			fi
 		fi
 	fi
-- 
1.8.1.2


