Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q520T-0008DU-C8
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 22:28:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2UKQiJE002997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Mar 2011 13:26:44 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Mar 2011 13:26:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2011 15:29:12 -0500
Message-ID: <c5634cb91376bafa6377dd0376cb7cb9cbf928c5.1301516765.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1301516765.git.mark.hatle@windriver.com>
References: <cover.1301516765.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/3] Fix sat-solver & RPM5 integration issue
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
X-List-Received-Date: Wed, 30 Mar 2011 20:28:45 -0000
Content-Type: text/plain

From Michael Schroeder, fix the configuration of how RPM5 handles obsoletes
within the sat-solver.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../sat-solver/sat-solver_obsolete.patch           |   20 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 ++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch

diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
new file mode 100644
index 0000000..7685057
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
@@ -0,0 +1,20 @@
+Fix obsolete settings with RPM5.
+
+The following patch is from Michael Schroeder <mls@suse.de>
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur git.orig/src/pool.c git/src/pool.c
+--- git.orig/src/pool.c	2011-03-25 15:49:34.885834194 -0500
++++ git/src/pool.c	2011-03-28 10:55:13.138786524 -0500
+@@ -70,6 +70,10 @@
+   pool->disttype = DISTTYPE_DEB;
+ # endif
+ #endif
++#ifdef RPM5
++  pool->obsoleteusesprovides = 1;
++  pool->implicitobsoleteusesprovides = 1;
++#endif
+   return pool;
+ }
+ 
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index ba5af67..33bf939 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "libcheck rpm zlib expat db"
 
 PV = "0.0-git${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://sat-solver_rpm5.patch \
+           file://sat-solver_obsolete.patch \
            file://cmake.patch \
            file://db5.patch \
            file://builtin-arch.patch;apply=no \
-- 
1.7.3.4



