Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEOSz-0003II-Sy
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:53:41 +0200
Received: by bkvi18 with SMTP id i18so380770bkv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qpeDnfZ/qCYrG7evHfwWc/3DHWwgV6L3V8xoMROl71Q=;
	b=ecpRqtSLvYFwwPEpLF2R/F6r4cyGbKeioU+B5Yp7gpTqj6t/asHtgC4Sm1zZwlAeTE
	VWCFnXp98hltf+Zdlmmi8zbE0HgrfYflSlbdMJWz8/nzg3UED1zh/s2sIs4duNn4q/aT
	ja+w8qx8m3+ZIqkhMQT1qqXw8QMhO4G47MEwa8Gzshfz/alctH3rRtnaPn4qccKUmku1
	I2ObUdd3XYEGf4r8SYPfB8II6N5OtUCZtxzku7PZsr3HT5kXCLjpP4syrXbhomIWmPE/
	fgarS3t/IhNvXM36YqJRxBmWB59fzLYddv3XQTOzkmFnot7nYulbIrOrtUBb7az8LIUI
	5gXg==
Received: by 10.204.13.82 with SMTP id b18mr1615467bka.118.1348076460448;
	Wed, 19 Sep 2012 10:41:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm2636840bkv.11.2012.09.19.10.40.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 10:40:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 19:40:52 +0200
Message-Id: <4d8cd3fa25204601840a23f10f670b4c14771680.1348076271.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <931838ee38865666d1d6293878f9c3b8bad8ea9a.1348074403.git.Martin.Jansa@gmail.com>
References: <931838ee38865666d1d6293878f9c3b8bad8ea9a.1348074403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348076271.git.Martin.Jansa@gmail.com>
References: <cover.1348076271.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/3] opkg: add patch to fix SIGSEGV when printing status file
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
X-List-Received-Date: Wed, 19 Sep 2012 17:53:41 -0000

* it was triggered by c02364f36e228835ea5d7fd4e1d347fd451f8544 when new package had 2 entries in Provides and old version just 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...g-provides-even-when-oldpkg-provides-exis.patch | 49 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch b/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
new file mode 100644
index 0000000..f1be7b8
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
@@ -0,0 +1,49 @@
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
+Upstream-Status: Submitted
+http://code.google.com/p/opkg/issues/detail?id=93
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



