Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F74272519
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYTBC024249
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:29 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:08 -0500
Message-ID: <bec9f101ebccd2fb91f25ecad99a21e31965c830.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207154.git.bruce.ashfield@windriver.com>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] kernel-yocto: make sure git tags get dereferenced properly in do_patch()
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:34 -0000
Content-Type: text/plain

From: Jeff Wang <jeffrey.wang@mit.ll.edu>

Commit 92c1ece6c347030d48995a36f4c67861356e59d3 causes the test in do_patch()
in kernel-yocto.bbclass to fail if ${machine_srcrev} is an annotated tag. The
check is meant to ensure that ${machine_srcrev} is an ancestor of HEAD, but
if ${machine_srcrev} is a tag, then "$(git rev-parse --verify
${machine_srcrev})" evaluates to the SHA of the tag instead of what it's
pointing to.

Replacing "$(git rev-parse --verify ${machine_srcrev})" with "$(git rev-parse
--verify ${machine_srcrev}~0)" fixed the problem by finding the object pointed
to by the tag, and not the tag itself. This also works for commit IDs that
are not tags, hence is safe in a scenarios.

Jeff Wang <jeffrey.wang@ll.mit.edu>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 5706a9e4e338..3b59d85f4ece 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -129,7 +129,7 @@ do_patch() {
 	# check to see if the specified SRCREV is reachable from the final branch.
 	# if it wasn't something wrong has happened, and we should error.
 	if [ "${machine_srcrev}" != "AUTOINC" ]; then
-		if ! [ "$(git rev-parse --verify ${machine_srcrev})" = "$(git merge-base ${machine_srcrev} HEAD)" ]; then
+		if ! [ "$(git rev-parse --verify ${machine_srcrev}~0)" = "$(git merge-base ${machine_srcrev} HEAD)" ]; then
 			bberror "SRCREV ${machine_srcrev} was specified, but is not reachable"
 			bbfatal "Check the BSP description for incorrect branch selection, or other errors."
 		fi
-- 
2.1.0


