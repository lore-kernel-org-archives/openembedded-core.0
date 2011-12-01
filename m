Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW5S3-0003pp-Lk
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:09:20 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so2082708eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gMMCJYCnnJE/dHRIB3o2taxUubG5EDs+42Vlk6YCuXE=;
	b=f2iGpt3Y5CxnJFYzFy9YppQYW4hEnvU3N6nux/DUbHh/0RJe4CBnv1isk80N6vI03R
	2AI++lJhKw6uQ29kHuBsCoBBsmTmiWl8cwkcdGYSHX8+0uW1/ipK3/AvJVV+18VkgSfu
	nMKSfyKWnmnZSyMn+t8g+iV0FQJRg2Zy5r0Ok=
Received: by 10.213.110.14 with SMTP id l14mr1039504ebp.54.1322740960662;
	Thu, 01 Dec 2011 04:02:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm16873247eeh.5.2011.12.01.04.02.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 04:02:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 13:02:09 +0100
Message-Id: <077a16901586d7325489fd29e99ecd608f174c26.1322740824.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
References: <9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322740824.git.Martin.Jansa@gmail.com>
References: <cover.1322740824.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 4/4] coreutils: fix u-a for base64, mktemp and df
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
X-List-Received-Date: Thu, 01 Dec 2011 12:09:20 -0000

* busybox installs mktemp and df to base_bindir not bindir
  SHR root@gjama ~ $ ll /bin/df /bin/mktemp /bin/base64
  lrwxrwxrwx 1 root root 7 Nov 10 15:44 /bin/df -> busybox
  lrwxrwxrwx 1 root root 7 Nov 10 15:44 /bin/mktemp -> busybox
  lrwxrwxrwx 1 root root 7 Nov 28 15:48 /bin/base64 -> busybox

* so u-a for coreutils fails:
  update-alternatives: Error: cannot register alternative base64 to /usr/bin/base64 since it is already registered to /bin/base64
  update-alternatives: Error: cannot register alternative mktemp to /usr/bin/mktemp since it is already registered to /bin/mktemp
  update-alternatives: Error: cannot register alternative df to /usr/bin/df since it is already registered to /bin/df

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb |   20 ++++++++++++++------
 1 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 01face0..cc05d88 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r1"
+PR = "r2"
 DEPENDS = "gmp"
 DEPENDS_virtclass-native = ""
 
@@ -21,13 +21,13 @@ SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d
 
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
-# [ gets a special treatment and is not included in this
-bindir_progs = "base64 basename chcon cksum comm csplit cut dir dircolors dirname du \
+# [ df mktemp base64 gets a special treatment and is not included in this
+bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-                join link logname md5sum mkfifo mktemp nice nl nohup nproc od paste pathchk \
+                join link logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
                 pinky pr printenv printf ptx readlink runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
-                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes df"
+                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
@@ -36,7 +36,7 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdi
 sbindir_progs= "chroot"
 
 do_install_append() {
-	for i in ${bindir_progs}; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
+	for i in ${bindir_progs} df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
 
 	install -d ${D}${base_bindir}
 	for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${PN}; done
@@ -61,6 +61,11 @@ pkg_postinst_${PN} () {
 
 	# Special cases. [ needs to be treated separately.
 	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
+	
+	# Special cases. base64, mktemp and df need to be treated separately, because busybox have them in base_binding not bindir
+	update-alternatives --install ${base_bindir}/base64 base64 ${bindir}/base64.${PN} 100;
+	update-alternatives --install ${base_bindir}/mktemp mktemp ${bindir}/mktemp.${PN} 100;
+	update-alternatives --install ${base_bindir}/df df ${bindir}/df.${PN} 100;
 }
 
 pkg_prerm_${PN} () {
@@ -74,6 +79,9 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove hostname hostname.${PN}
 	update-alternatives --remove uptime uptime.${PN}
 	update-alternatives --remove '[' 'lbracket.${PN}'
+	update-alternatives --remove base64 ${bindir}/base64.${PN}
+	update-alternatives --remove mktemp ${bindir}/mktemp.${PN}
+	update-alternatives --remove df ${bindir}.df.${PN}
 }
 
 BBCLASSEXTEND = "native"
-- 
1.7.8.rc4



