Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DE7286E5FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 10:49:49 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cZbR7-0002it-Fb from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2017 02:49:49 -0800
Received: from svr-pkl-eng-05.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-03.mgc.mentorg.com (137.202.0.108) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 3 Feb 2017 10:49:48 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Feb 2017 15:49:36 +0500
Message-ID: <1486118977-42065-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] [RFC]kernel-yocto.bbclass: ensure repatching when HEAD is checked out
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
X-List-Received-Date: Fri, 03 Feb 2017 10:49:50 -0000
Content-Type: text/plain

In some cases it is seen that kernel_checkout and
validate_branches are run again in simultaneous builds.
During do_patch the kgit-s2q mechanism creates and
checks for the kgit-s2q.last file inside the .git
directory, finds a fence post and starts picking up
patches after that. This can create trouble as
validate_branches checks out the HEAD of the branch
and so the patches should be reapplied rather than
skipped due to finding of the fence post.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/classes/kernel-yocto.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 5cfd8af..131c48a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -350,6 +350,10 @@ do_validate_branches() {
 			current_branch=`git rev-parse --abbrev-ref HEAD`
 			git branch "$current_branch-orig"
 			git reset --hard ${force_srcrev}
+			# We've checked out HEAD, make sure we cleanup kgit-s2q fence post check
+			# so the patches are applied as expected otherwise no patching
+			# would be done in some corner cases.
+			rm -rf ${S}/.git/kgit-s2q.last
 		fi
 	fi
 }
-- 
1.9.1


