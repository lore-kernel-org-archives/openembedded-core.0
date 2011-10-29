Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKFVx-0006nu-Mn
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 22:28:25 +0200
Received: by faas16 with SMTP id s16so5067293faa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2011 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=H4HsAXU6Se2WttWutFRDh5rrBBMC+VMXdeDdAwg8qbA=;
	b=XfABP3ABSbJnTO0aW1bJwQCVFhuYLsiUnM0hP0WgZ0bd0ahuxwDIww5Ndpxyf9AyNp
	fP+bCct+sVmqGoLKqpHNLHSUXbbR+12ZXCFaP5CT/Eqb/Ehj9O7IMOvtR2dND+EyfDhL
	LVEVnL/K+jqQeUzWUbs2bNcZnzJQF9XjOjwCU=
Received: by 10.223.17.3 with SMTP id q3mr16083084faa.28.1319919742291;
	Sat, 29 Oct 2011 13:22:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t19sm26471110fac.0.2011.10.29.13.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 13:22:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2011 22:22:15 +0200
Message-Id: <1319919735-2962-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <20111029202108.GH12609@jama.jama.net>
References: <20111029202108.GH12609@jama.jama.net>
Subject: [PATCH] python-2.7.2: fix build issues when additional modules are linked against host or native libpython instead of target
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
X-List-Received-Date: Sat, 29 Oct 2011 20:28:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index af14adb..defe9c1 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -51,6 +51,7 @@ do_compile() {
 	install -m 0644 Makefile Makefile.orig
 	sed -i -e 's,${includedir},${STAGING_INCDIR},' Makefile
 	sed -i -e 's,${libdir},${STAGING_LIBDIR},' Makefile
+	sed -i -e 's,LDFLAGS=,LDFLAGS=-L.,' Makefile
 	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	# save copy of it now, because if we do it in do_install and 
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
-- 
1.7.7.1



