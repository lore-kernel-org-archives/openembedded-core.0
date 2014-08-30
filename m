Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF516FEA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cRIb007773
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:27 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:04 -0400
Message-ID: <16f674ddc07276977e2577319fa37995ab0cbc59.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/18] kernel-yocto: use cat-file instead of git-show
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:29 -0000
Content-Type: text/plain

Parsing the output of git show is error prone, since it changes based on
the type of issue with bad comit IDs. Since the output is no longer used
in the case of a valid ref, we can switch to git-cat-file and  simply
check the return code.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6c9242770407..38c886b21b09 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -321,8 +321,8 @@ do_validate_branches() {
 		fi
 	fi
 
-	ref=`git show ${machine_srcrev} 2>&1 | head -n1 || true`
-	if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
+	git cat-file -t ${machine_srcrev} > /dev/null
+	if [ if $? -ne 0 ]; then
 	    echo "ERROR ${machine_srcrev} is not a valid commit ID."
 	    echo "The kernel source tree may be out of sync"
 	    exit 1
@@ -358,8 +358,8 @@ do_validate_branches() {
 	git show-ref --quiet --verify -- "refs/heads/${KMETA}"
 	if [ $? -eq 0 ] && [ "${target_meta_head}" != "AUTOINC" ]; then
 		if [ "$meta_head" != "$target_meta_head" ]; then
-			ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
-			if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
+			git cat-file -t ${target_meta_head} > /dev/null
+			if [ $? -ne 0 ]; then
 				echo "ERROR ${target_meta_head} is not a valid commit ID"
 				echo "The kernel source tree may be out of sync"
 				exit 1
-- 
1.8.1.2


