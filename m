Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 47AE965D31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 16:00:31 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 24 Apr 2014 18:00:24 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 2D37228C69A;
	Thu, 24 Apr 2014 18:00:24 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 18:00:22 +0200
Message-ID: <1398355222-37083-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] openssh: enable ptest support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Apr 2014 16:00:35 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Install openssh test-suite and run it as ptest.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../openssh/add-test-support-for-busybox.patch     |   61 ++++++++++++++++++++
 .../recipes-connectivity/openssh/openssh/run-ptest |    7 +++
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb |   12 +++-
 3 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
 create mode 100755 meta/recipes-connectivity/openssh/openssh/run-ptest

diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
new file mode 100644
index 0000000..07af667
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
@@ -0,0 +1,61 @@
+Adjust test cases to work with busybox.
+
+- Replace dd parameter "obs" with "bs".
+- Replace "head -<num>" with "head -n <num>".
+
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+Upstream-Status: Pending
+
+--- a/regress/cipher-speed.sh	2012-06-30 07:08:53.000000000 +0200
++++ b/regress/cipher-speed.sh	2013-02-15 11:30:20.670022055 +0100
+@@ -26,7 +26,7 @@
+ 		echon "$c/$m:\t"
+ 		( ${SSH} -o 'compression no' \
+ 			-F $OBJ/ssh_proxy -2 -m $m -c $c somehost \
+-			exec sh -c \'"dd of=/dev/null obs=32k"\' \
++			exec sh -c \'"dd of=/dev/null bs=32k"\' \
+ 		< ${DATA} ) 2>&1 | getbytes
+ 
+ 		if [ $? -ne 0 ]; then
+@@ -42,7 +42,7 @@
+ 		echon "$c:\t"
+ 		( ${SSH} -o 'compression no' \
+ 			-F $OBJ/ssh_proxy -1 -c $c somehost \
+-			exec sh -c \'"dd of=/dev/null obs=32k"\' \
++			exec sh -c \'"dd of=/dev/null bs=32k"\' \
+ 		< ${DATA} ) 2>&1 | getbytes
+ 		if [ $? -ne 0 ]; then
+ 			fail "ssh -1 failed with cipher $c"
+--- a/regress/transfer.sh	2003-09-04 06:54:40.000000000 +0200
++++ b/regress/transfer.sh	2013-02-15 11:25:34.666411185 +0100
+@@ -18,7 +18,7 @@
+ 	for s in 10 100 1k 32k 64k 128k 256k; do
+ 		trace "proto $p dd-size ${s}"
+ 		rm -f ${COPY}
+-		dd if=$DATA obs=${s} 2> /dev/null | \
++		dd if=$DATA bs=${s} 2> /dev/null | \
+ 			${SSH} -q -$p -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
+ 		if [ $? -ne 0 ]; then
+ 			fail "ssh cat $DATA failed"
+--- a/regress/yes-head.sh	2005-11-28 06:41:03.000000000 +0100
++++ b/regress/yes-head.sh	2013-02-15 11:55:11.413715068 +0100
+@@ -4,7 +4,7 @@
+ tid="yes pipe head"
+ 
+ for p in 1 2; do
+-	lines=`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do echo yes;done | _POSIX2_VERSION=199209 head -2000"' | (sleep 3 ; wc -l)`
++	lines=`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do echo yes;done | _POSIX2_VERSION=199209 head -n 2000"' | (sleep 3 ; wc -l)`
+ 	if [ $? -ne 0 ]; then
+ 		fail "yes|head test failed"
+ 		lines = 0;
+--- a/regress/key-options.sh	2008-07-04 09:08:58.000000000 +0200
++++ b/regress/key-options.sh	2013-02-15 12:06:05.109486098 +0100
+@@ -54,7 +54,7 @@
+ 	fi
+ 
+ 	sed 's/.*/from="'"$f"'" &/' $origkeys >$authkeys
+-	from=`head -1 $authkeys | cut -f1 -d ' '`
++	from=`head -n 1 $authkeys | cut -f1 -d ' '`
+ 	verbose "key option proto $p $from"
+ 	r=`${SSH} -$p -q -F $OBJ/ssh_proxy somehost 'echo true'`
+ 	if [ "$r" = "true" ]; then
diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
new file mode 100755
index 0000000..3e725cf
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+export TEST_SHELL=sh
+
+cd regress
+make -k .OBJDIR=`pwd` .CURDIR=`pwd` tests \
+        | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index d19cc5a..3b10164 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -27,7 +27,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshd.socket \
            file://sshd@.service \
            file://sshdgenkeys.service \
-           file://volatiles.99_sshd "
+           file://volatiles.99_sshd \
+           file://add-test-support-for-busybox.patch \
+           file://run-ptest"
 
 PAM_SRC_URI = "file://sshd"
 
@@ -48,7 +50,7 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
 
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 
 # LFS support:
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
@@ -118,6 +120,11 @@ do_install_append () {
 		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
 }
 
+do_install_ptest () {
+	sed -i -e "s|^SFTPSERVER=.*|SFTPSERVER=${libdir}/${PN}/sftp-server|" regress/test-exec.sh
+	cp -r regress ${D}${PTEST_PATH}
+}
+
 ALLOW_EMPTY_${PN} = "1"
 
 PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
@@ -132,6 +139,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
+RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
 
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-- 
1.7.10.4


