Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5461671212
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4ceCP007785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:40 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:12 -0400
Message-ID: <99bc596604dacbf1000867edec07e47f6305f65a.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/18] kernel-yocto: clean overly complex branch checkout
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:40 -0000
Content-Type: text/plain

Since the git fetcher ensures that branches exist, we no longer need to
validate the branch and have a conditional checkout of the source.

We can remove some checks and ensure that whenever we exit the
do_kernel_checkout routine that a branch is always checked out.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 9209f423cff1..69620f0a4275 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -221,17 +221,16 @@ do_kernel_checkout() {
 		fi
 	fi
 	
-	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 
 	# Create a working tree copy of the kernel by checking out a branch
+	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
 	if [ $? -eq 0 ]; then
-		# checkout and clobber any unimportant files
-		git checkout -f ${machine_branch}
-	else
-		echo "Not checking out ${machine_branch}, it will be created later"
-		git checkout -f master
+		machine_branch = "master"
 	fi
+
+	# checkout and clobber any unimportant files
+	git checkout -f ${machine_branch}
 }
 do_kernel_checkout[dirs] = "${S}"
 
-- 
1.8.1.2


