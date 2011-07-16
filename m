Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhyVG-0001L5-GB
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 08:37:30 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so1714106iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 23:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CFj52poTOJUiuPAw3c11BZIlBv73zyI15d0JTTItCgU=;
	b=qd/d8i7G09/XemzVKO5xeHETUoySiOa00Nm7xCc2+yrVOtDkRi4n3AcIva3j3P5w2a
	Bz1YHj/Bd+bs7h+7fWdctO8nPdule6evEIwM+EAcdHiDD4sMWgRoULiY6AEJaRoBBqj6
	FN/euc7wWONxt1hKnBfO3HlDMVi1Tg39KX4Wg=
Received: by 10.231.117.35 with SMTP id o35mr3619924ibq.160.1310798011067;
	Fri, 15 Jul 2011 23:33:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d5sm1339185ibi.62.2011.07.15.23.33.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 23:33:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 23:33:18 -0700
Message-Id: <6c24d5d89609df523fc385cf66afc2c06875e433.1310797743.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e286a25378756398463d3bf34174005a8cef8841.1310797743.git.raj.khem@gmail.com>
References: <e286a25378756398463d3bf34174005a8cef8841.1310797743.git.raj.khem@gmail.com>
In-Reply-To: <cover.1310797743.git.raj.khem@gmail.com>
References: <cover.1310797743.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] acl, attr: Fix build failures when NLS is disabled on uclibc
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
X-List-Received-Date: Sat, 16 Jul 2011 06:37:30 -0000

Disable gettext support when NLS is not enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/acl_2.2.51.bb  |    2 +-
 meta/recipes-support/attr/attr.inc       |    4 ----
 meta/recipes-support/attr/attr_2.4.46.bb |    2 +-
 meta/recipes-support/attr/ea-acl.inc     |    3 +++
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support/attr/acl_2.2.51.bb
index 301d44a..18aac7c 100644
--- a/meta/recipes-support/attr/acl_2.2.51.bb
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -1,6 +1,6 @@
 require acl.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "3fc0ce99dc5253bdcce4c9cd437bc267"
 SRC_URI[sha256sum] = "06854521cf5d396801af7e54b9636680edf8064355e51c07657ec7442a185225"
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index b2ed9a1..c110340 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -20,7 +20,3 @@ do_install_append() {
 	sed -i ${D}${libdir}/libattr.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
-
-# Only append ldflags for target recipe
-LDFLAGS_libc-uclibc += "${@['', '-lintl']['${PN}' == '${BPN}']}"
-
diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
index 9fef41b..fe8ab79 100644
--- a/meta/recipes-support/attr/attr_2.4.46.bb
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -1,6 +1,6 @@
 require attr.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
 SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index afe2f1c..9af5960 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -32,3 +32,6 @@ FILES_lib${PN}-doc = "${mandir}/man2 \
                       ${mandir}/man3"
 
 BBCLASSEXTEND = "native"
+# Only append ldflags for target recipe and if USE_NLS is enabled
+LDFLAGS_append_libc-uclibc = "${@['', ' -lintl '][(bb.data.getVar('PN', d, True) == bb.data.getVar('BPN', d , True)) and (bb.data.getVar('USE_NLS', d, True) == 'yes')]}"
+EXTRA_OECONF_append_libc-uclibc = "${@['', ' --disable-gettext '][(bb.data.getVar('PN', d, True) == bb.data.getVar('BPN', d , True)) and (bb.data.getVar('USE_NLS', d, True) == 'no')]}"
-- 
1.7.4.1



