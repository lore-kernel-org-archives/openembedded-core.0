Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nIK-0000Kd-3V
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:40 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:49 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id E5FF9291D51;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:14:02 +0100
Message-ID: <1361279644-17675-7-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1361279644-17675-1-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 6/8] openssh: Add ptest
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../add-test-support-for-busybox.patch             |   61 ++++++++++++++++=
++++
 .../openssh/openssh-6.1p1/run-ptest                |    7 ++
 meta/recipes-connectivity/openssh/openssh_6.1p1.bb |   11 +++-
 3 files changed, 78 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.1p1/add-tes=
t-support-for-busybox.patch
 create mode 100755 meta/recipes-connectivity/openssh/openssh-6.1p1/run-pte=
st

diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/add-test-suppo=
rt-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh-6.1p1/add-=
test-support-for-busybox.patch
new file mode 100644
index 0000000..5913597
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.1p1/add-test-support-for-=
busybox.patch
@@ -0,0 +1,61 @@
+Adjust test cases to work with busybox.
+
+- Replace dd parameter "obs" with "bs".
+- Replace "head -<num>" with "head -n <num>".
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-status: Pending
+
+--- a/regress/cipher-speed.sh	2012-06-30 07:08:53.000000000 +0200
++++ b/regress/cipher-speed.sh	2013-02-15 11:30:20.670022055 +0100
+@@ -26,7 +26,7 @@
+ 		echon "$c/$m:\t"
+ 		( ${SSH} -o 'compression no' \
+ 			-F $OBJ/ssh_proxy -2 -m $m -c $c somehost \
+-			exec sh -c \'"dd of=3D/dev/null obs=3D32k"\' \
++			exec sh -c \'"dd of=3D/dev/null bs=3D32k"\' \
+ 		< ${DATA} ) 2>&1 | getbytes
+=20
+ 		if [ $? -ne 0 ]; then
+@@ -42,7 +42,7 @@
+ 		echon "$c:\t"
+ 		( ${SSH} -o 'compression no' \
+ 			-F $OBJ/ssh_proxy -1 -c $c somehost \
+-			exec sh -c \'"dd of=3D/dev/null obs=3D32k"\' \
++			exec sh -c \'"dd of=3D/dev/null bs=3D32k"\' \
+ 		< ${DATA} ) 2>&1 | getbytes
+ 		if [ $? -ne 0 ]; then
+ 			fail "ssh -1 failed with cipher $c"
+--- a/regress/transfer.sh	2003-09-04 06:54:40.000000000 +0200
++++ b/regress/transfer.sh	2013-02-15 11:25:34.666411185 +0100
+@@ -18,7 +18,7 @@
+ 	for s in 10 100 1k 32k 64k 128k 256k; do
+ 		trace "proto $p dd-size ${s}"
+ 		rm -f ${COPY}
+-		dd if=3D$DATA obs=3D${s} 2> /dev/null | \
++		dd if=3D$DATA bs=3D${s} 2> /dev/null | \
+ 			${SSH} -q -$p -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
+ 		if [ $? -ne 0 ]; then
+ 			fail "ssh cat $DATA failed"
+--- a/regress/yes-head.sh	2005-11-28 06:41:03.000000000 +0100
++++ b/regress/yes-head.sh	2013-02-15 11:55:11.413715068 +0100
+@@ -4,7 +4,7 @@
+ tid=3D"yes pipe head"
+=20
+ for p in 1 2; do
+-	lines=3D`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do ech=
o yes;done | _POSIX2_VERSION=3D199209 head -2000"' | (sleep 3 ; wc -l)`
++	lines=3D`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do ech=
o yes;done | _POSIX2_VERSION=3D199209 head -n 2000"' | (sleep 3 ; wc -l)`
+ 	if [ $? -ne 0 ]; then
+ 		fail "yes|head test failed"
+ 		lines =3D 0;
+--- a/regress/key-options.sh	2008-07-04 09:08:58.000000000 +0200
++++ b/regress/key-options.sh	2013-02-15 12:06:05.109486098 +0100
+@@ -54,7 +54,7 @@
+ 	fi
+=20
+ 	sed 's/.*/from=3D"'"$f"'" &/' $origkeys >$authkeys
+-	from=3D`head -1 $authkeys | cut -f1 -d ' '`
++	from=3D`head -n 1 $authkeys | cut -f1 -d ' '`
+ 	verbose "key option proto $p $from"
+ 	r=3D`${SSH} -$p -q -F $OBJ/ssh_proxy somehost 'echo true'`
+ 	if [ "$r" =3D "true" ]; then
diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/run-ptest b/me=
ta/recipes-connectivity/openssh/openssh-6.1p1/run-ptest
new file mode 100755
index 0000000..3e725cf
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.1p1/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+export TEST_SHELL=3Dsh
+
+cd regress
+make -k .OBJDIR=3D`pwd` .CURDIR=3D`pwd` tests \
+        | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/=
FAIL: /g'
diff --git a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_6.1p1.bb
index 32c3b2c..b2a70b7 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
@@ -25,13 +25,15 @@ SRC_URI =3D "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/=
portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
            file://openssh-CVE-2011-4327.patch \
+           file://add-test-support-for-busybox.patch \
+           file://run-ptest \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', ''=
, d)}"
=20
 PAM_SRC_URI =3D "file://sshd"
=20
 SRC_URI[md5sum] =3D "3345cbf4efe90ffb06a78670ab2d05d5"
 SRC_URI[sha256sum] =3D "d1c157f6c0852e90c191cc7c9018a583b51e3db4035489cb26=
2639d337a1c411"
-inherit useradd update-rc.d update-alternatives
+inherit useradd update-rc.d update-alternatives ptest
=20
 USERADD_PACKAGES =3D "${PN}-sshd"
 USERADD_PARAM_${PN}-sshd =3D "--system --no-create-home --home-dir /var/ru=
n/sshd --shell /bin/false --user-group sshd"
@@ -81,6 +83,12 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${locals=
tatedir}
+
+	if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+		ptest_do_install
+		sed -i -e "s|^SFTPSERVER=3D.*|SFTPSERVER=3D${libdir}/${PN}/sftp-server|"=
 regress/test-exec.sh
+		cp -r regress ${D}{$PTEST_PATH}
+	fi
 }
=20
 ALLOW_EMPTY_${PN} =3D "1"
@@ -98,6 +106,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
 RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 DEPENDS_${PN}-sshd +=3D "update-rc.d"
 RDEPENDS_${PN}-sshd +=3D "update-rc.d ${PN}-keygen"
+RDEPENDS_${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
=20
 CONFFILES_${PN}-sshd =3D "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh =3D "${sysconfdir}/ssh/ssh_config"
--=20
1.7.5.4



