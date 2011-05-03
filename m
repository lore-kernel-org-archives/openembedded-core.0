Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJQ-0001qN-LQ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2011 16:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892686"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:44:50 -0700
Message-Id: <f71b2d4565b2b021c5f3ac1973189ca66bcaaf3f.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 12:13:46 +0200
Date: Tue, 03 May 2011 16:44:50 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 22/33] git: use DESTDIR=$D instead prefixing all variables by $D
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
X-List-Received-Date: Tue, 03 May 2011 23:47:28 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* with git-native and rm_work enabled I've noticed git fetcher errors like:
  warning: templates not found /OE/shr-core/tmp/work/x86_64-linux/git-native-1.7.3.4-r0/image/OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
  fatal: Unable to find remote helper for 'http'
  for every recipe using http:// for git repo
* after this change template_dir points to
  /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
  without that workdir prefix
* haven't tested target recipe, but I guess it needs different fix or
  maybe it worked before and gets broken by this change

[sgw: removed RFC comment, target patch to follow]
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/git/git.inc        |    4 ++--
 meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index e1d1c71..843a1d3 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -14,8 +14,8 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
 inherit autotools
 
 do_install () {
-	oe_runmake install prefix=${D} bindir=${D}${bindir} gitexecdir=${D}${gitexecdir} \
-		template_dir=${D}${datadir}/git-core/templates \
+	oe_runmake install DESTDIR="${D}" bindir=${bindir} gitexecdir=${gitexecdir} \
+		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
 }
 
diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-devtools/git/git_1.7.4.3.bb
index 603d2fd..2ff1ed5 100644
--- a/meta/recipes-devtools/git/git_1.7.4.3.bb
+++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.4.1



