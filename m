Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PztOT-0006Mq-HG
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:16:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2GGEUjm027863
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 09:14:30 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 09:14:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@lists.pokylinux.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2011 11:15:25 -0500
Message-ID: <606a176feefdba28cfa8a2f026749a2bdd37e4b8.1300291424.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1300291424.git.mark.hatle@windriver.com>
References: <cover.1300291424.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/6] sat-solver: Add workaround for RPM 5 db construction
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
X-List-Received-Date: Wed, 16 Mar 2011 16:16:22 -0000
Content-Type: text/plain

The first time the database is created on an RPM5 system it works
correctly.  However any subsequent rebuilds cause an empty database to
occur.

The following is from Michael Schroeder <mls@suse.de>:
> rpmdb2solv contains a hack that makes it use the unchanged already
> converted packages. To do this, it needs to get the database id
> for every installed packages by reading the "Name" index. This
> somehow doesn't seem to work with rpm5.
>
> As a workaround you can add a "ref = 0;" line at the top of the
> repo_add_rpmdb() function in ext/repo_rpmdb.c.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../sat-solver/sat-solver/rpm5-solvdb.patch        |   30 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch

diff --git a/meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch b/meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch
new file mode 100644
index 0000000..8ce1b15
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch
@@ -0,0 +1,30 @@
+sat-solver rpmdb based solv database construction
+
+The first time the database is created on an RPM5 system it works 
+correctly.  However any subsequent rebuilds cause an empty database to 
+occur.
+
+The following is from Michael Schroeder <mls@suse.de>:
+> rpmdb2solv contains a hack that makes it use the unchanged already
+> converted packages. To do this, it needs to get the database id
+> for every installed packages by reading the "Name" index. This
+> somehow doesn't seem to work with rpm5.
+>
+> As a workaround you can add a "ref = 0;" line at the top of the
+> repo_add_rpmdb() function in ext/repo_rpmdb.c.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur git.orig/ext/repo_rpmdb.c git/ext/repo_rpmdb.c
+--- git.orig/ext/repo_rpmdb.c	2011-03-16 09:43:50.470008215 -0500
++++ git/ext/repo_rpmdb.c	2011-03-16 09:47:55.503989694 -0500
+@@ -1344,6 +1344,9 @@
+   memset(&dbkey, 0, sizeof(dbkey));
+   memset(&dbdata, 0, sizeof(dbdata));
+ 
++  /* Workaround for RPM 5 database construction */
++  ref = 0;
++
+   if (!rootdir)
+     rootdir = "";
+ 
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index 54420cd..a6519d5 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "libcheck rpm zlib expat db"
 
 PV = "0.0-git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://cmake.patch \
            file://rpm5.patch \
+           file://rpm5-solvdb.patch \
            file://db5.patch \
            file://builtin-arch.patch;apply=no \
            file://no-builtin-arch.patch;apply=no \
-- 
1.7.3.4



