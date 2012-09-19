Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEO5f-0002os-9Y
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:29:35 +0200
Received: by wibhq4 with SMTP id hq4so4822195wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZDBCQ7oXn8xgcairi8Zr6vYuSc5J8JVeIzMDgiC6HtE=;
	b=EvjFsgs0IzxLXcTkYN15/q5Nxl6w4Ig/QBOeWSGEYuukXtmemRy/8OhaTE1sBHrG2N
	0LY8iFkfp8DeIOboUtMxPV4EI8Xt6mijVLCnceuXoXSzc9KOC+7NzxmGflumB862CjlY
	q+S+8iuGu1NjJx5sUuIS+8t9hcMQz/A0qHlqj/kZtHeh3qqjEEMw78uJZWSbrXLia7AV
	zU5yE/oUAYtMW6GRD4aTszP+9Q6U2h49YzegEebEPBy0Wy3KvNVgMWmY9Umjx1LPYp3z
	6WdPev4IwecQahrGLDuccCBCeXoh16jDjIinQ9bBH/50oc1we3jrHDXy0D1SL1ZNtS6z
	UsUg==
Received: by 10.216.194.18 with SMTP id l18mr2165316wen.132.1348075013899;
	Wed, 19 Sep 2012 10:16:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm5956274wid.1.2012.09.19.10.16.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 10:16:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 19:16:30 +0200
Message-Id: <931838ee38865666d1d6293878f9c3b8bad8ea9a.1348074403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348074403.git.Martin.Jansa@gmail.com>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348074403.git.Martin.Jansa@gmail.com>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] opkg: add patch to fix SIGSEGV when printing status file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 17:29:35 -0000

* it was triggered by c02364f36e228835ea5d7fd4e1d347fd451f8544 when new package had 2 entries in Provides and old version just 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...g-provides-even-when-oldpkg-provides-exis.patch | 46 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch b/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
new file mode 100644
index 0000000..1e5e965
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
@@ -0,0 +1,46 @@
+From 3340b120909ea353440cfffe01fed43c55387a00 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 19 Sep 2012 17:31:45 +0200
+Subject: [PATCH 7/7] merge newpkg->provides even when oldpkg->provides
+ existed
+
+* introduced in http://code.google.com/p/opkg/source/diff?spec=svn277&r=277&format=side&path=/trunk/libopkg/pkg.c
+* the problem happens when oldpkg provide 1 and newpkg provide 2
+  provides_count is merged to 2, but oldpkg->provides has only 1 entry
+  causing SIGSEGV:
+  pkg_formatted_field (fp=fp@entry=0x1444ce0, pkg=pkg@entry=0x120c620, field=<optimized out>, field@entry=0x7ffff7bd2abe "Provides") at pkg.c:739
+  739                           fprintf(fp, "%s %s", i == 1 ? "" : ",",
+  (gdb) bt
+  #0  pkg_formatted_field (fp=fp@entry=0x1444ce0, pkg=pkg@entry=0x120c620, field=<optimized out>, field@entry=0x7ffff7bd2abe "Provides") at pkg.c:739
+  #1  0x00007ffff7bc32fc in pkg_print_status (pkg=0x120c620, file=0x1444ce0) at pkg.c:887
+  #2  0x00007ffff7bbff59 in opkg_conf_write_status_files () at opkg_conf.c:400
+  #3  0x00007ffff7bbad8a in write_status_files_if_changed () at opkg_cmd.c:65
+  #4  0x00007ffff7bbb73e in opkg_upgrade_cmd (argc=<optimized out>, argv=<optimized out>) at opkg_cmd.c:577
+  #5  0x00007ffff7bbbcc2 in opkg_cmd_exec (cmd=cmd@entry=0x7ffff7dda080, argc=argc@entry=1, argv=argv@entry=0x7fffffffe768) at opkg_cmd.c:1319
+  #6  0x000000000040165f in main (argc=3, argv=0x7fffffffe758) at opkg-cl.c:377
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libopkg/pkg.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/libopkg/pkg.c b/libopkg/pkg.c
+index be486ee..255c673 100644
+--- a/libopkg/pkg.c
++++ b/libopkg/pkg.c
+@@ -377,10 +377,8 @@ pkg_merge(pkg_t *oldpkg, pkg_t *newpkg)
+ 	  oldpkg->provides_count = newpkg->provides_count;
+ 	  newpkg->provides_count = 0;
+ 
+-	  if (!oldpkg->provides) {
+-		oldpkg->provides = newpkg->provides;
+-		newpkg->provides = NULL;
+-	  }
++	  oldpkg->provides = newpkg->provides;
++	  newpkg->provides = NULL;
+      }
+ 
+      if (!oldpkg->conflicts_count) {
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 03ed103..9a03f2e 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -7,6 +7,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
   file://0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch \
   file://0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch \
   file://0006-detect-circular-dependencies.patch \
+  file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -14,4 +15,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
-- 
1.7.12



