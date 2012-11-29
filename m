Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Te9IG-0006XR-E3
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 19:57:05 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qATIge1S007078;
	Thu, 29 Nov 2012 10:42:41 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 29 Nov 2012 13:42:22 -0500
Message-Id: <e7403df2bde00da021302a58fed6e782784ca629.1354214034.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354214034.git.bruce.ashfield@windriver.com>
References: <cover.1354214034.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1354214034.git.bruce.ashfield@windriver.com>
References: <cover.1354214034.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] kernel-yocto: checkout known branch before leaving do_validate_branches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 18:57:05 -0000

We should always leave the tree on a BSP branch or master when
do_validate_branches completes to avoid modifying version tracked
files are part of the build process. Modifying these files will lead
to errors when changing branches, since the contents would be lost.

This is evident in the case that a the meta branch is reset to a
known SRCREV and the tree was left on the meta branch. This branch
tracks the meta/meta-series, and other artifacts of the original
tree construction. When the build process runs, it updates these same
files, which creates a conflict when switching branches.

This has been fixed in the tree construction scripts to not track
these files, but a secondary fix is also required of not leaving
the build on these branches, to allow arbitrary trees to be built.

[YOCTO #3413]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0d4ed21..c74317e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -327,6 +327,8 @@ do_validate_branches() {
 	if [ $? -eq 0 ]; then
 		# restore the branch for builds
 		git checkout -q -f ${KBRANCH}
+        else
+	        git checkout -q master
 	fi
 }
 
-- 
1.7.10.4



