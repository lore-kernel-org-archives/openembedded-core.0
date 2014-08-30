Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC71671222
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cTEO013730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:29 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:07 -0400
Message-ID: <8bca9f297d71508880c9f676b172f006c1f9036e.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/18] kernel-yocto: remove SRC_URI kbranch validation
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:30 -0000
Content-Type: text/plain

We no longer need to check if the KBRANCH matches the branch specified
in the SRC_URI. This is taken care of by the fetcher at the beginning
and SRCREV ancestor validation after patching.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 357a79b12311..3bef841ae80a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -230,12 +230,6 @@ do_kernel_checkout() {
 	
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 
-	if [ "${KBRANCH}" != "${machine_branch}" ]; then
-		echo "WARNING: The SRC_URI machine branch and KBRANCH are not the same."
-		echo "	       KBRANCH will be adjusted to match, but this typically is a"
-		echo "	       misconfiguration and should be checked."
-	fi
-
 	# convert any remote branches to local tracking ones
 	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
 		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-- 
1.8.1.2


