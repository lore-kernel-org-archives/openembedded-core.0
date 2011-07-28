Received: from gate.crashing.org ([63.228.1.57])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmVsN-0002I9-LS
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 21:04:08 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SI9oSo015548
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 13:09:50 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 13:09:50 -0500
Message-Id: <1311876590-20157-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] libzypp: Fix variable substitution problem in do_archgen step
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2011 19:04:08 -0000

The do_archgen step creates a script that utilizes the variable name
${ARCH}.  However, we also utilize and define ${ARCH} so instead of
having the following in the script:

	COMPAT_WITH="${ARCH},${COMPAT} $COMPAT_WITH"

We get something like:

	COMPAT_WITH="powerpc,${COMPAT} $COMPAT_WITH"

Just renaming the variable in the script to not conflict with ${ARCH}
fixes the issue.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-extended/libzypp/libzypp_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 6555bd4..a9ed639 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -111,9 +111,9 @@ do_archgen () {
 				shift ; continue;;
 		esac
 		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-		  ARCH="_$1"
+		  CARCH="_$1"
 		else
-		  ARCH="IdString(\"$1\")"
+		  CARCH="IdString(\"$1\")"
 		fi
 		shift
 		COMPAT=""
@@ -129,7 +129,7 @@ do_archgen () {
 				COMPAT="${arch_val},$COMPAT"
 			fi
 		done
-		COMPAT_WITH="${ARCH},${COMPAT} $COMPAT_WITH"
+		COMPAT_WITH="${CARCH},${COMPAT} $COMPAT_WITH"
 	done
 	for each_compat in ${COMPAT_WITH} ; do
 		echo "        defCompatibleWith( ${each_compat} );"		>> zypp/poky-arch.h
-- 
1.7.3.4



