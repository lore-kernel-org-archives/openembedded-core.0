Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QFkkW-000470-UL
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 12:16:37 +0200
Received: by wye20 with SMTP id 20so3086260wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2011 03:14:03 -0700 (PDT)
Received: by 10.227.37.197 with SMTP id y5mr667348wbd.4.1304072041255;
	Fri, 29 Apr 2011 03:14:01 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o23sm1605439wbc.61.2011.04.29.03.13.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2011 03:14:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2011 12:13:46 +0200
Message-Id: <1304072026-31760-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] git: use DESTDIR=$D instead prefixing all variables by $D
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
X-List-Received-Date: Fri, 29 Apr 2011 10:16:37 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* with git-native and rm_work enabled I've noticed git fetcher errors like:
  warning: templates not found /OE/shr-core/tmp/work/x86_64-linux/git-native-1.7.3.4-r0/image/OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
  fatal: Unable to find remote helper for 'http'
  for every recipe using http:// for git repo
* after this change template_dir points to
  /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
  without that workdir prefix
* haven't tested target recipe, but I guess it needs different fix or
  maybe it worked before and gets broken by this change (that's why this
  is just RFC)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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
1.6.6.1



