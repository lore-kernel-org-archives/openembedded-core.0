Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBnrC-0003tY-T8
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 14:47:10 +0200
Received: by fxm19 with SMTP id 19so3338588fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=94kO66+o1yyVuZ1bz1HxZG41mRkD8MU9vM8Htn8OJxM=;
	b=vEzC9yKfVU3pkuZ4xz0QwoLcEwZ9VhwajE4J8/YqunEKz2xO/m0FAxr0Bvpjs94KKg
	coBRhB3WOyc6WXwPjPgEy8WIU6BWlbpbf4KPxb4OO+pi8mgi7CQV75GMzp8EeSGe2Afv
	I0+pTLIE5PRvr+HZJHaOyECKuVDuXg7apdUS8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aVjjhbG6RdFdY5Rhn155enPtDZvzimJi8eeW9cKJ0tQtgS8vvWogLzsGTsuv7CbN4i
	GWG5C3eBxSyrOCrRiBnTFh7ExwihmqejqWknULAgF1VGhqrOW3wKmK+S10UiUA4it70h
	ZVeGD2r+a/UdIMBYEECHZcTT2hUffAhHtCVhY=
Received: by 10.223.67.210 with SMTP id s18mr2241921fai.41.1303130690531;
	Mon, 18 Apr 2011 05:44:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm849167fau.16.2011.04.18.05.44.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 05:44:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 14:44:38 +0200
Message-Id: <1303130678-975-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
Subject: [RFC][PATCH] git: use DESTDIR=$D instead prefixing all variables by $D
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
X-List-Received-Date: Mon, 18 Apr 2011 12:47:11 -0000

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
---
 meta/recipes-devtools/git/git.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.7.5.rc1



