Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T4Oue-0001k7-LO
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 06:20:57 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7N48lSl003086;
	Wed, 22 Aug 2012 21:08:48 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 23 Aug 2012 00:08:44 -0400
Message-Id: <77af894dab0374d4c8db80ca18ee3104d4192393.1345694632.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345694632.git.bruce.ashfield@windriver.com>
References: <cover.1345694632.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345694632.git.bruce.ashfield@windriver.com>
References: <cover.1345694632.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] kernel-yocto: don't require meta branch for custom repos
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
X-List-Received-Date: Thu, 23 Aug 2012 04:20:57 -0000

The commit a9f11849 [linux-yocto: explicitly export KMETA to scripts]
allows the meta branch name to be changed by exporting it to all
phases of the build.

But if a custom kernel without a meta branch is built, we end up
passing an empty string to the creation scripts, which breaks the
build since input is expected.

Inhibiting the export of KMETA to the creation scripts when empty
fixes the problem.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1b37dc7..bb0915c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -61,9 +61,10 @@ do_patch() {
 	# if we have a defined/set meta branch we should not be generating
 	# any meta data. The passed branch has what we need.
 	if [ -n "${KMETA}" ]; then
-		createme_flags="--disable-meta-gen"
+		createme_flags="--disable-meta-gen --meta ${KMETA}"
 	fi
-	createme ${createme_flags} --meta ${KMETA} ${ARCH} ${kbranch}
+
+	createme ${createme_flags} ${ARCH} ${kbranch}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not create ${kbranch}"
 		exit 1
-- 
1.7.5.4



