Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.32254.1630998135157646973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207344438"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="207344438"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="537804474"
Received: from tengjieg-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.164])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/11] kernel-yocto: Simplify no git repo case in do_kernel_checkout
Date: Tue,  7 Sep 2021 15:01:57 +0800
Message-Id: <0c8d643d7b474a845588ad7dbf86f85a9aad5c49.1630997270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630997270.git.anuj.mittal@intel.com>
References: <cover.1630997270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul@pbarker.dev>

If the kernel sources are not fetched via git, a local git repository is
created in do_kernel_checkout. In this case we know that there will be
no remote branches and we will already be on the correct branch (since
only one branch will exist). So we can simplify things by skipping these
steps.

This also removes the assumption that the default git branch name will
be "master". Prior to this change, the final git checkout command in
do_kernel_checkout could fail if a local git repo was created and the
user had changed init.defaultBranch in their gitconfig.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af2a9c92d4498492ca23388c7b4bbed48abdc4d7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel-yocto.bbclass | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d38b60f519..8878573f6f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -341,6 +341,21 @@ do_kernel_checkout() {
 			fi
 		fi
 		cd ${S}
+
+		# convert any remote branches to local tracking ones
+		for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
+			b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
+			git show-ref --quiet --verify -- "refs/heads/$b"
+			if [ $? -ne 0 ]; then
+				git branch $b $i > /dev/null
+			fi
+		done
+
+		# Create a working tree copy of the kernel by checking out a branch
+		machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
+
+		# checkout and clobber any unimportant files
+		git checkout -f ${machine_branch}
 	else
 		# case: we have no git repository at all. 
 		# To support low bandwidth options for building the kernel, we'll just 
@@ -362,21 +377,6 @@ do_kernel_checkout() {
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
-
-	# convert any remote branches to local tracking ones
-	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
-		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-		git show-ref --quiet --verify -- "refs/heads/$b"
-		if [ $? -ne 0 ]; then
-			git branch $b $i > /dev/null
-		fi
-	done
-
-	# Create a working tree copy of the kernel by checking out a branch
-	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-
-	# checkout and clobber any unimportant files
-	git checkout -f ${machine_branch}
 }
 do_kernel_checkout[dirs] = "${S} ${WORKDIR}"
 
-- 
2.31.1

