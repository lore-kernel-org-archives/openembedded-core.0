Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (vsp-authed01.binero.net
	[195.74.38.224])
	by mail.openembedded.org (Postfix) with ESMTP id C53AF75CFB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 19:08:08 +0000 (UTC)
X-Halon-ID: cec0c6d8-25a3-11e5-bc2f-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 21:01:58 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 21:02:03 +0200
Message-Id: <ee0b3bd7139ce6efefeaa1ac186a92a15998356c.1436381838.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436381838.git.petter@technux.se>
References: <cover.1436381838.git.petter@technux.se>
In-Reply-To: <cover.1436381838.git.petter@technux.se>
References: <cover.1436381838.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 1/1] kernel-yocto: fix machine_srcrev check in do_patch
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
X-List-Received-Date: Wed, 08 Jul 2015 19:08:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

do_patch is currently doing checks with machine_srcrev without initiate
it which leads to below (additional debug added):

 DEBUG: Executing shell function do_patch
 .
 .
 .
 + [ 0 -ne 0 ]
 + [  != AUTOINC ]
 + git rev-parse --verify ~0
 fatal: Needed a single revision
 + git merge-base HEAD
 usage: git merge-base [-a|--all] <commit> <commit>...
    or: git merge-base [-a|--all] --octopus <commit>...
    or: git merge-base --independent <commit>...
    or: git merge-base --is-ancestor <commit> <commit>
    or: git merge-base --fork-point <ref> [<commit>]

     -a, --all             output all common ancestors
     --octopus             find ancestors for a single n-way merge
     --independent         list revs not reachable from others
     --is-ancestor         is the first one ancestor of the other?
     --fork-point          find where <commit> forked from reflog of <ref>

 + [  =  ]
 + set +x
 DEBUG: Shell function do_patch finished

Only reason it works today is because 'rev-parse/merge-base' with empty machine_srcrev
will result in "false positive". Solve this by adding a similar non-empty check and
use SRCREV as fallback as in 'do_kernel_metadata'

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/classes/kernel-yocto.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6fd025e..fb14926 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -168,6 +168,16 @@ do_patch() {
 
 	# check to see if the specified SRCREV is reachable from the final branch.
 	# if it wasn't something wrong has happened, and we should error.
+	machine_srcrev="${SRCREV_machine}"
+	if [ -z "${machine_srcrev}" ]; then
+		# fallback to SRCREV if a non machine_meta tree is being built
+		machine_srcrev="${SRCREV}"
+		# if SRCREV cannot be reached something is wrong.
+		if [ -z "${machine_srcrev}" ]; then
+			bbfatal "Neither SRCREV_machine or SRCREV was specified!"
+		fi
+	fi
+
 	if [ "${machine_srcrev}" != "AUTOINC" ]; then
 		if ! [ "$(git rev-parse --verify ${machine_srcrev}~0)" = "$(git merge-base ${machine_srcrev} HEAD)" ]; then
 			bberror "SRCREV ${machine_srcrev} was specified, but is not reachable"
-- 
1.9.1


