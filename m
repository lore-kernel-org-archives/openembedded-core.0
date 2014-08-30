Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F05B71144
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cXAH013733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:38 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:30 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:09 -0400
Message-ID: <1b7932fbf3a0feebb07052d76fc73f421992aa94.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/18] kernel-yocto: remove KBRANCH_DEFAULT
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:38 -0000
Content-Type: text/plain

KBRANCH_DEFAULT was introduced as a way to trigger the enforced build
of a particular branch of the tree. With the fetcher now enforcing
SRCREVs existing on a branch, we can simply validate that the SRCREV
is reachable from the final branch and no longer care about enforcing
a given branch.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d51748e556ef..087fbb0c3702 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -111,10 +111,6 @@ do_patch() {
 	    done
 	fi
 
-	if [ "${machine_branch}" != "${KBRANCH_DEFAULT}" ]; then
-		updateme_flags="--branch ${machine_branch}"
-	fi
-
 	# updates or generates the target description
 	updateme ${updateme_flags} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
                          ${includes} ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
@@ -152,18 +148,6 @@ do_patch() {
 			exit 1
 		fi
 	fi
-
-	# Perform a final check. If something other than the default kernel
-	# branch was requested, and that's not where we ended up, then we 
-	# should thrown an error, since we aren't building what was expected
-	final_branch="$(git symbolic-ref HEAD 2>/dev/null)"
-	final_branch=${final_branch##refs/heads/}
-	if [ "${machine_branch}" != "${KBRANCH_DEFAULT}" ] &&
-	   [ "${final_branch}" != "${machine_branch}" ]; then
-		echo "ERROR: branch ${machine_branch} was requested, but was not properly"
-		echo "       configured to be built. The current branch is ${final_branch}"
-		exit 1
-	fi
 }
 
 do_kernel_checkout() {
-- 
1.8.1.2


