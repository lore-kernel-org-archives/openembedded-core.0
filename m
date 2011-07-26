Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlplE-0008UJ-Vf
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:05:57 +0200
Received: by rex (Postfix, from userid 1000)
	id 0848320EA7; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:15 +0100
Message-Id: <5aaef860790c0799550116da35b16a73ee8d7b2d.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 8/8] RPM: multilib file class/color
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
X-List-Received-Date: Tue, 26 Jul 2011 22:05:57 -0000

From: Mark Hatle <mark.hatle@windriver.com>

We need to include file class and file color in order to do the conflict
resolution required with a multilib design.  This is normally disabled when
we don't use the internal dependency generator, patch enables it in
all cases.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch |   34 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb            |    1 +
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch b/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
new file mode 100644
index 0000000..d1e4bf6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
@@ -0,0 +1,34 @@
+rpmfc.c:  Always generate per-file information
+
+Even when the per-file dependency generate is disabled, we want to generate
+per file classification and other associated data.
+
+Note: this is a temporary workaround.  Eventually we will want to have a way
+to seed per-file dependency and other information in order to generate a
+package from previously determined information.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/lib/rpmfc.c b/lib/rpmfc.c
+index 0c3befd..9306999 100644
+--- a/lib/rpmfc.c
++++ b/lib/rpmfc.c
+@@ -1692,7 +1692,6 @@ rpmRC rpmfcGenerateDepends(void * specp, void * pkgp)
+ 	/* ... then generate dependencies using %{__find_requires} et al. */
+ 	rc = rpmfcGenerateDependsHelper(spec, pkg, fi);
+ 	printDeps(pkg->header);
+-	return rc;
+     }
+ 
+     /* Generate scriptlet Dependencies. */
+@@ -1720,8 +1719,8 @@ rpmRC rpmfcGenerateDepends(void * specp, void * pkgp)
+     av[ac] = NULL;
+ 
+     fc = rpmfcNew();
+-    fc->skipProv = !pkg->autoProv;
+-    fc->skipReq = !pkg->autoReq;
++    fc->skipProv = !pkg->autoProv || !internaldeps;
++    fc->skipReq = !pkg->autoReq || !internaldeps;
+     fc->tracked = 0;
+ 
+     {	const char * buildRootURL;
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 9cfb3ab..c0e3208 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-solvedb.patch \
 	   file://rpm-tools-mtree-LDFLAGS.patch \
 	   file://fprint-pointer-fix.patch \
+	   file://rpm-fileclass.patch \
 	  "
 
 #           file://hdraddorappend.patch \
-- 
1.7.4.1



