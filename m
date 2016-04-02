Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE6A7709E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3209a5V009229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Apr 2016 17:09:36 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:26 -0400
Message-ID: <49adf038de6dab1fc9ed745789228eb17ee24465.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459555221.git.bruce.ashfield@windriver.com>
References: <cover.1459555221.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] kernel-yocto: enforce SRC_URI specified branch
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:36 -0000
Content-Type: text/plain

During the simplication and cleanup of branches and kernel meta data
handling, the ability to force build a branch that didn't match the
meta data was dropped.

There are valid uses cases when a different branch should be built
(testing, development, etc), so we restore the capability with this
change.

If after the kernel meta data is processed the current branch does
not match the SRC_URI specified branch, a warning is generated
about the impending branch switch and that the user should double
check that they are building what they expect.

  WARNING: After meta data application, the kernel tree branch is standard/base. The
  WARNING: SRC_URI specified branch standard/gt. The branch will be forced to standard/gt,
  WARNING: but this means the board meta data (.scc files) do not match the SRC_URI specification.
  WARNING: The meta data and branch standard/gt should be inspected to ensure the proper
  WARNING: kernel is being built.

Reported-by: Steve Sakoman" <steve.sakoman@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6a6a3a31d904..f86b3ef011a3 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -170,6 +170,17 @@ do_patch() {
 		fi
 	fi
 
+        current_branch=`git rev-parse --abbrev-ref HEAD`
+        machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
+        if [ "${current_branch}" != "${machine_branch}" ]; then
+            bbwarn "After meta data application, the kernel tree branch is ${current_branch}. The"
+            bbwarn "SRC_URI specified branch ${machine_branch}. The branch will be forced to ${machine_branch},"
+            bbwarn "but this means the board meta data (.scc files) do not match the SRC_URI specification."
+            bbwarn "The meta data and branch ${machine_branch} should be inspected to ensure the proper"
+            bbwarn "kernel is being built."
+            git checkout -f ${machine_branch}
+        fi
+
 	if [ "${machine_srcrev}" != "AUTOINC" ]; then
 		if ! [ "$(git rev-parse --verify ${machine_srcrev}~0)" = "$(git merge-base ${machine_srcrev} HEAD)" ]; then
 			bberror "SRCREV ${machine_srcrev} was specified, but is not reachable"
-- 
2.5.0


