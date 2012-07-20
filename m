Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SsFAt-00016s-Ps
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:31:28 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6KFJt16008000;
	Fri, 20 Jul 2012 08:19:58 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 20 Jul 2012 11:19:24 -0400
Message-Id: <377ea49225173c0366190dff73355126ee93e8db.1342796935.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/3] kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git directory
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
X-List-Received-Date: Fri, 20 Jul 2012 15:31:28 -0000

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

In do_kernel_checkout(), replace the creation of ${S}/.git with just
the creation of ${S} since the .git subdirectory is created only a few
lines later using a "mv".  Here's the original code:

  rm -rf ${S}
  mkdir -p ${S}/.git

  echo "WARNING. ${WORKDIR}/git is not a bare clone."
  echo "Ensure that the SRC_URI includes the 'bareclone=1' option."

  # we can fix up the kernel repository, but at the least the meta
  # branch must be present. The machine branch may be created later.
  mv ${WORKDIR}/git/.git ${S}    <-- See?  There it is.

There's no functional change here, it's just less confusing.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1e08faa..f09d503 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -106,7 +106,7 @@ do_kernel_checkout() {
 	if [ -d "${WORKDIR}/git/" ] && [ -d "${WORKDIR}/git/.git" ]; then
 		# we build out of {S}, so ensure that ${S} is clean and present
 		rm -rf ${S}
-		mkdir -p ${S}/.git
+		mkdir -p ${S}
 
 		echo "WARNING. ${WORKDIR}/git is not a bare clone."
 		echo "Ensure that the SRC_URI includes the 'bareclone=1' option."
-- 
1.7.5.4



