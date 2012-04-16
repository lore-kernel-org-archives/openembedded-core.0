Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJumH-0007pw-42
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 00:52:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GMghiq011862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 15:42:43 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 15:42:23 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 17:45:06 -0500
Message-ID: <5ad851d6c479b34fb05833a6397cd86592d0d899.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 03/17] coreutils_*.bb: Sync up file path with busybox and minor cleanup
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
X-List-Received-Date: Mon, 16 Apr 2012 22:52:09 -0000
Content-Type: text/plain

We need to ensure that the filepaths used by coreutils and busybox are
the same.  Do this for base64, mktemp and df.  Also remove references
to hostname/uptime in 8.14 version as these were only relevant for the
older 6.9 version.

su from the 6.9 version is removed, as it should come from shadow.

(No PR bumps, as the previous patch did that.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb  |   10 +++++++---
 meta/recipes-core/coreutils/coreutils_8.14.bb |   23 +++--------------------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 32ea321..597d457 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -34,7 +34,7 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINKS = ""
 
 # [ gets a special treatment and is not included in this
-bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
+bindir_progs = "basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nice nl nohup od paste pathchk \
                 pinky pr printenv printf ptx readlink seq sha1sum sha224sum sha256sum \
@@ -43,7 +43,7 @@ bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
 ALTERNATIVE_LINKS += "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
 
 # hostname gets a special treatment and is not included in this
-base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
+base_bindir_progs = "base64 cat chgrp chmod chown cp date dd df echo false kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname"
 ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
 
@@ -69,12 +69,16 @@ do_install_append() {
 	# hostname and uptime separated. busybox's versions are preferred
 	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
 	mv ${D}${bindir}/uptime ${D}${bindir}/uptime.${PN}
+
+	# remove su, it should come from shadow or another package
+	rm ${D}${bindir}/su
 }
 
 pkg_postinst_${PN} () {
-	# Special cases. uptime and hostname is broken, prefer busybox's version. [ needs to be treated separately.
+	# Special cases. uptime and hostname is broken, prefer busybox's version.
 	update-alternatives --install ${bindir}/uptime uptime uptime.${PN} 10
 	update-alternatives --install ${base_bindir}/hostname hostname hostname.${PN} 10
+	# [ needs to be treated separately.
 	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
 }
 
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 9ccb813..9994526 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF_virtclass-native = "--without-gmp"
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINKS = ""
 
-# [ df mktemp base64 gets a special treatment and is not included in this
+# [ gets a special treatment and is not included in this
 bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
@@ -33,18 +33,14 @@ bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 ALTERNATIVE_LINKS += "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
 
-# hostname gets a special treatment and is not included in this
-base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
-                     mknod mv pwd rm rmdir sleep stty sync touch true uname"
+base_bindir_progs = "base64 cat chgrp chmod chown cp date dd df echo false kill ln ls mkdir \
+                     mknod mktemp mv pwd rm rmdir sleep stty sync touch true uname"
 ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
 
 sbindir_progs= "chroot"
 ALTERNATIVE_LINKS += "${sbindir}/${@' ${sbindir}/'.join((d.getVar('sbindir_progs', True)).split())}"
 
 # Manual file provides for manually controlled alternatives
-MANUAL_ALTERNATIVE_LINKS += "${base_bindir}/df:${bindir}/df.${PN}"
-MANUAL_ALTERNATIVE_LINKS += "${base_bindir}/mktemp:${bindir}/mktemp.${PN}"
-MANUAL_ALTERNATIVE_LINKS += "${base_bindir}/base64:${bindir}/base64.${PN}"
 MANUAL_ALTERNATIVE_LINKS += "${bindir}/[:${bindir}/lbracket.${PN}"
 
 do_install_append() {
@@ -54,9 +50,6 @@ do_install_append() {
 	install -d ${D}${sbindir}
 	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i; done
 
-	# Process the special items due to mismatch with busybox
-	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
-
 	# [ requires special handling because [.coreutils will cause the sed stuff
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
@@ -69,21 +62,11 @@ do_install_append() {
 pkg_postinst_${PN} () {
 	# Special cases. [ needs to be treated separately.
 	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
-	
-	# Special cases. base64, mktemp and df need to be treated separately, because busybox have them in base_binding not bindir
-	update-alternatives --install ${base_bindir}/base64 base64 ${bindir}/base64.${PN} 100;
-	update-alternatives --install ${base_bindir}/mktemp mktemp ${bindir}/mktemp.${PN} 100;
-	update-alternatives --install ${base_bindir}/df df ${bindir}/df.${PN} 100;
 }
 
 pkg_prerm_${PN} () {
 	# The special cases
-	update-alternatives --remove hostname hostname.${PN}
-	update-alternatives --remove uptime uptime.${PN}
 	update-alternatives --remove '[' 'lbracket.${PN}'
-	update-alternatives --remove base64 ${bindir}/base64.${PN}
-	update-alternatives --remove mktemp ${bindir}/mktemp.${PN}
-	update-alternatives --remove df ${bindir}.df.${PN}
 }
 
 BBCLASSEXTEND = "native"
-- 
1.7.3.4



