Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S26Uj-0002ts-4Q
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:44:25 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1RJZple010298;
	Mon, 27 Feb 2012 11:35:54 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 27 Feb 2012 14:34:16 -0500
Message-Id: <92c5d2e6843fdac90c2b41a454919ff5a8d29274.1330371008.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330371008.git.bruce.ashfield@windriver.com>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330371008.git.bruce.ashfield@windriver.com>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: allow non-branched repositories to check out
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
X-List-Received-Date: Mon, 27 Feb 2012 19:44:25 -0000

Not all users of the checkout phase of linux-yocto have all
branches present. This is normal, and should be supported. By
checking for an empty KBRANCH we can avoid validating a branch
that isn't supposed to exist.

[YOCTO #2032]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 50ff555..5f3cb63 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -165,7 +165,7 @@ do_kernel_checkout() {
 			echo "kernel repository"
 			exit 1
 		fi
-	 	if [ -z "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
+	 	if [ -z "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ] && [ -n "${KBRANCH}" ] ; then
 			git branch -a | grep -q ${KBRANCH}
 			if [ $? -ne 0 ]; then
 				echo "ERROR. The branch '${KBRANCH}' is required and was not"
-- 
1.7.0.4



