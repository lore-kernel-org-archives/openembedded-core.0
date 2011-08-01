Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7I-0006ZU-P8
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147061"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:35:55 -0700
Message-Id: <1d453309b001b8381e6746a20eb69e2453bf33b0.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 03/22] libzypp: Fix variable substitution problem in do_archgen step
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:49 -0000

From: Kumar Gala <galak@kernel.crashing.org>

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



