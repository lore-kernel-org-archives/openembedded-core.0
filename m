Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QI0AT-0002UK-Rq
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 17:08:42 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QI07v-0005db-It from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 08:06:03 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 May 2011 08:06:03 -0700
Received: from localhost.localdomain ([172.30.0.24]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 May 2011 09:06:01 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2011 08:05:50 -0700
Message-Id: <ebdc7d53636bce0c3faafa4367d2cd1cbaa4c3a0.1304607797.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304607797.git.tom_rini@mentor.com>
References: <cover.1304607797.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 05 May 2011 15:06:01.0844 (UTC)
	FILETIME=[F29CDB40:01CC0B35]
Subject: [PATCH 1/4] gcc-package-target: Switch to TARGET_PREFIX in symlinks
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
X-List-Received-Date: Thu, 05 May 2011 15:08:42 -0000

When TARGET_PREFIX and TARGET_SYS didn't match up, the symlinks we made
were invalid.  TARGET_PREFIX is what we use when configuring so it's what we
should be using here.

This is 05143e9b5d0a42e32ee0dd3c7fde482ff8d63f63 from OE.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-devtools/gcc/gcc-package-target.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index d61e96b..e7f1b80 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -91,13 +91,13 @@ do_install () {
 	find -name libiberty.h ${D}${exec_prefix}/lib | xargs rm -f
 
 	# Symlinks so we can use these trivially on the target
-	ln -sf ${TARGET_SYS}-g77 g77 || true
-	ln -sf ${TARGET_SYS}-gfortran gfortran || true
-	ln -sf ${TARGET_SYS}-g++ g++
-	ln -sf ${TARGET_SYS}-gcc gcc
+	ln -sf ${TARGET_PREFIX}g77 g77 || true
+	ln -sf ${TARGET_PREFIX}gfortran gfortran || true
+	ln -sf ${TARGET_PREFIX}g++ g++
+	ln -sf ${TARGET_PREFIX}gcc gcc
 	ln -sf g77 f77 || true
 	ln -sf gfortran f95 || true
 	ln -sf g++ c++
 	ln -sf gcc cc
-	ln -sf ${bindir}/${TARGET_SYS}-cpp ${D}${bindir}/cpp
+	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${bindir}/cpp
 }
-- 
1.7.0.4



