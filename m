Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTt-0000T5-BR
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56hUP025899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:43 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:34 -0500
Message-ID: <5cb5d2edd8674d9f44feae18b4d4049a5e24a23c.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] kernel-yocto: allow building from fetcher source dir
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
X-List-Received-Date: Wed, 27 Feb 2013 05:23:27 -0000
Content-Type: text/plain

The linux-yocto recipes themselves always set S="${WORKDIR}/linux" and
arrange for the fetcher default of ${WORKDIR}/git to be renamed before
building.

Part of this rename involves an assumption that the directory used by
the fetcher can be removed as part of the renaming process, or in fact
that renaming is required.

If a derived recipe uses S="${WORKDIR}/git", the checkout phase fails
since the kernel source is removed as part of the processing.

To fix this the code now detects this situation and does not clean the
source directory before renaming the fetcher default (and in fact does
not rename it at all).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   39 +++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 368f91e..7b8e607 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -148,29 +148,34 @@ do_kernel_checkout() {
 
 	# A linux yocto SRC_URI should use the bareclone option. That
 	# ensures that all the branches are available in the WORKDIR version
-	# of the repository. 
+	# of the repository.
+	source_dir=`echo ${S} | sed 's%/$%%'`
+	source_workdir="${WORKDIR}/git"
 	if [ -d "${WORKDIR}/git/" ] && [ -d "${WORKDIR}/git/.git" ]; then
-		# we build out of {S}, so ensure that ${S} is clean and present
-		rm -rf ${S}
-		mkdir -p ${S}
-		
-		# We can fix up the kernel repository even if it wasn't a bare clone.
-		mv ${WORKDIR}/git/.git ${S}
-		rm -rf ${WORKDIR}/git/
+		# case2: the repository is a non-bare clone
+
+		# if S is WORKDIR/git, then we shouldn't be moving or deleting the tree.
+		if [ "${source_dir}" != "${source_workdir}" ]; then
+			rm -rf ${S}
+			mv ${WORKDIR}/git ${S}
+		fi
 		cd ${S}
 	elif [ -d "${WORKDIR}/git/" ] && [ ! -d "${WORKDIR}/git/.git" ]; then
-		# we build out of {S}, so ensure that ${S} is clean and present
-		rm -rf ${S}
-		mkdir -p ${S}/.git
-
-		mv ${WORKDIR}/git/* ${S}/.git
-		rm -rf ${WORKDIR}/git/
+		# case2: the repository is a bare clone
+
+		# if S is WORKDIR/git, then we shouldn't be moving or deleting the tree.
+		if [ "${source_dir}" != "${source_workdir}" ]; then
+			rm -rf ${S}
+			mkdir -p ${S}/.git
+			mv ${WORKDIR}/git/* ${S}/.git
+			rm -rf ${WORKDIR}/git/
+		fi
 		cd ${S}	
 		git config core.bare false
 	else
-	        # We have no git repository at all. To support low bandwidth options
-		# for building the kernel, we'll just convert the tree to a git repo
-	        # and let the rest of the process work unchanged
+		# case 3: we have no git repository at all. 
+		# To support low bandwidth options for building the kernel, we'll just 
+		# convert the tree to a git repo and let the rest of the process work unchanged
 	        cd ${S}
 		git init
 		git add .
-- 
1.7.10.4



