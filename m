Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C41E6D759
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 21:12:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1RLCm4j008931
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Feb 2014 13:12:48 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 27 Feb 2014 13:12:48 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Feb 2014 16:12:35 -0500
Message-ID: <7d732756e9fe71b5504dab39417efe46f71e7008.1393535348.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393535348.git.bruce.ashfield@windriver.com>
References: <cover.1393535348.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] kernel-yocto: always checkout machine branch when existing validate_branches
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
X-List-Received-Date: Thu, 27 Feb 2014 21:12:51 -0000
Content-Type: text/plain

The validate_branches routine is responsible for ensuring that the specified
SRCREV exists, and that the tree has been prepared for eventual patching
starting directly from that SRCREV.

On exit, the routine checks out the specified machine branch and the
preparation is complete .. except if a KMETA branch isn't used, we exit
early since the branch can't be validated.

To make the exit condition consistent for all cases, we can move the
KMETA validation inside a conditional and allow the same exit path for
both cases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fab5d4c57055..fb8e04e704fb 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -358,31 +358,26 @@ do_validate_branches() {
 		fi
 	done
 
-	## KMETA branch validation
+	## KMETA branch validation.
+	## We do validation if the meta branch exists, and AUTOREV hasn't been set
  	meta_head=`git show-ref -s --heads ${KMETA}`
  	target_meta_head="${SRCREV_meta}"
 	git show-ref --quiet --verify -- "refs/heads/${KMETA}"
-	if [ $? -eq 1 ]; then
-		return
-	fi
-
-	if [ "${target_meta_head}" = "AUTOINC" ]; then
-		return
-	fi
-
-	if [ "$meta_head" != "$target_meta_head" ]; then
-		ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
-		if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
-			echo "ERROR ${target_meta_head} is not a valid commit ID"
-			echo "The kernel source tree may be out of sync"
-			exit 1
-		else
-			echo "[INFO] Setting branch ${KMETA} to ${target_meta_head}"
-			git branch -m ${KMETA} ${KMETA}-orig
-			git checkout -q -b ${KMETA} ${target_meta_head}
-			if [ $? -ne 0 ];then
-				echo "ERROR: could not checkout ${KMETA} branch from known hash ${target_meta_head}"
+	if [ $? -eq 0 ] && [ "${target_meta_head}" != "AUTOINC" ]; then
+		if [ "$meta_head" != "$target_meta_head" ]; then
+			ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
+			if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
+				echo "ERROR ${target_meta_head} is not a valid commit ID"
+				echo "The kernel source tree may be out of sync"
 				exit 1
+			else
+				echo "[INFO] Setting branch ${KMETA} to ${target_meta_head}"
+				git branch -m ${KMETA} ${KMETA}-orig
+				git checkout -q -b ${KMETA} ${target_meta_head}
+				if [ $? -ne 0 ];then
+					echo "ERROR: could not checkout ${KMETA} branch from known hash ${target_meta_head}"
+					exit 1
+				fi
 			fi
 		fi
 	fi
-- 
1.8.1.2


