Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 19DB477E7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 01:18:25 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id m68so94823908ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 18:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HCexcliCoiSjRSrzEK2aY2+ZABHutjj7aIeZ/IP0UpI=;
	b=Udp3Ed4SSYp/tVdH2MRSaYpbbrJukgVnkYKAbyj8KnxbXaU3Ud9l0EbiY0OEN2Refm
	UyJ7Y5/AehKH5MF47xcB/jLl7xsz70Qa4ynUWSz12DLiKhYucq4JS1HQXji1AEvNfumL
	oEkfSpau5EX6zyrqrM09nKr4ftStGL9boZPQKTLM0B9oJKQ1/Uzw9tYrsASLxKiIpl6X
	Yq2+lP7yeBXPOeiMYinHq8HC6gbsrUVwyZKTU1nOWej5n7Pmc4LV93FraFdvTTXuMiYE
	t0dVBphn+tSTuHHk8oLY+MJf4ifWHluwcHtV5on1tErjI5LgGggXfn7cKgsbt+J5yMWz
	mipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HCexcliCoiSjRSrzEK2aY2+ZABHutjj7aIeZ/IP0UpI=;
	b=lJPyu8uhTDNdT+/CFnq0SAsBuHKsEoaL7BOsGSv27C1gI4FL8fg/c+ZGnZ8ywd0eUO
	5b1h/QrGhggcLw01XLeneREdPDdwjBqbdUnrbhKsDiktg2swd/Zr/amIrS7GrCNIKXA3
	eBq24wUxm36Zk/AX6BUMFugb5Q3ZwKRcCRwgJHvQeQJYv65Zq6SWbdhOsKHr+RSIQ+8A
	7xx06pt4Lpss17keIbMif5INqV+C6iDIYflpfwaPxi7yNcNa16plWKR4taEzDRhnyiW1
	TYSpmXLYPftZ/gjJSEjLsGydxbuMzpDkoSWFI8f8FmvkBIDHAUpaahxZBTZf5fSoGESN
	O+RA==
X-Gm-Message-State: AIVw110xIWrDBYq6tWUGo1HThTUItL6uoV/NyHTuRGaTe2Vyd/BXOcNg
	qqpCoRdKva8WlFU4YB0=
X-Received: by 10.36.118.195 with SMTP id z186mr11056114itb.66.1499131106360; 
	Mon, 03 Jul 2017 18:18:26 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id s78sm9265401ioe.7.2017.07.03.18.18.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 18:18:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 20:18:18 -0500
Message-Id: <20170704011818.724-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170629123022.4580-1-JPEWhacker@gmail.com>
References: <20170629123022.4580-1-JPEWhacker@gmail.com>
Subject: [PATCH v2] openssh: Fix key generation with systemd
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
X-List-Received-Date: Tue, 04 Jul 2017 01:18:26 -0000

106b59d9 broke SSH host key generation when systemd and a read-only root file
system are in use because there isn't a way for systemd to get the optional
weak assigment of SYSCONFDIR from /etc/default/sshd and still provide a default
value if it is not specified. Instead, move the logic for determining if keys
need to be created to a helper script that both the SysV init script and the
systemd unit file can reference.

This does mean that the systemd unit file can't check for file existence to
know if it should start the service, but it wasn't able to do that correctly
anyway anymore. This should be a problem since the serivce is only run once per
power cycle by systemd, and should exit quickly if the keys already exist

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/init     | 69 +---------------------
 .../openssh/openssh/sshd_check_keys                | 64 ++++++++++++++++++++
 .../openssh/openssh/sshdgenkeys.service            | 16 +----
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 +++
 4 files changed, 76 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd_check_keys

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 386628a..34ba0f8 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -19,25 +19,6 @@ fi
 [ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
 mkdir -p $SYSCONFDIR
 
-parse_sshd_opts() {
-    set -- ${SSHD_OPTS} --
-    sshd_config=/etc/ssh/sshd_config
-    while true ; do
-        case "$1" in
-        -f*) if [ "$1" = "-f" ] ; then
-                 sshd_config="$2"
-                 shift
-             else
-                 sshd_config="${1#-f}"
-             fi
-             shift
-             ;;
-        --) shift; break;;
-        *) shift;;
-        esac
-    done
-}
-
 check_for_no_start() {
     # forget it if we're trying to start, and /etc/ssh/sshd_not_to_be_run exists
     if [ -e $SYSCONFDIR/sshd_not_to_be_run ]; then
@@ -58,57 +39,13 @@ check_config() {
 	/usr/sbin/sshd -t $SSHD_OPTS || exit 1
 }
 
-check_keys() {
-	# parse location of keys
-	local HOST_KEY_RSA
-	local HOST_KEY_DSA
-	local HOST_KEY_ECDSA
-	local HOST_KEY_ED25519
-
-	parse_sshd_opts
-	HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
-	HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
-	HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
-	HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$(grep HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
-	[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
-
-	# create keys if necessary
-	if [ ! -f $HOST_KEY_RSA ]; then
-		echo "  generating ssh RSA key..."
-		mkdir -p $(dirname $HOST_KEY_RSA)
-		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
-	fi
-	if [ ! -f $HOST_KEY_ECDSA ]; then
-		echo "  generating ssh ECDSA key..."
-		mkdir -p $(dirname $HOST_KEY_ECDSA)
-		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
-	fi
-	if [ ! -f $HOST_KEY_DSA ]; then
-		echo "  generating ssh DSA key..."
-		mkdir -p $(dirname $HOST_KEY_DSA)
-		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
-	fi
-	if [ ! -f $HOST_KEY_ED25519 ]; then
-		echo "  generating ssh ED25519 key..."
-		mkdir -p $(dirname $HOST_KEY_ED25519)
-		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
-	fi
-}
-
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
 
 case "$1" in
   start)
 	check_for_no_start
 	echo "Starting OpenBSD Secure Shell server: sshd"
-	check_keys
+	@LIBEXECDIR@/sshd_check_keys
 	check_privsep_dir
 	start-stop-daemon -S -p $PIDFILE -x /usr/sbin/sshd -- $SSHD_OPTS
         echo "done."
@@ -121,7 +58,7 @@ case "$1" in
 
   reload|force-reload)
 	check_for_no_start
-	check_keys
+	@LIBEXECDIR@/sshd_check_keys
 	check_config
         echo -n "Reloading OpenBSD Secure Shell server's configuration"
 	start-stop-daemon -K -p $PIDFILE -s 1 -x /usr/sbin/sshd
@@ -129,7 +66,7 @@ case "$1" in
 	;;
 
   restart)
-  	check_keys
+	@LIBEXECDIR@/sshd_check_keys
 	check_config
         echo -n "Restarting OpenBSD Secure Shell server: sshd"
 	start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/sbin/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
new file mode 100644
index 0000000..f5bba53
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -0,0 +1,64 @@
+#! /bin/sh
+
+# /etc/default/ssh may set SYSCONFDIR and SSHD_OPTS
+if test -f /etc/default/ssh; then
+    . /etc/default/ssh
+fi
+
+[ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
+mkdir -p $SYSCONFDIR
+
+# parse sshd options
+set -- ${SSHD_OPTS} --
+sshd_config=/etc/ssh/sshd_config
+while true ; do
+    case "$1" in
+    -f*) if [ "$1" = "-f" ] ; then
+            sshd_config="$2"
+            shift
+        else
+            sshd_config="${1#-f}"
+        fi
+        shift
+        ;;
+    --) shift; break;;
+    *) shift;;
+    esac
+done
+
+# parse location of keys
+HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
+HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
+HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
+HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$(grep HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
+[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
+
+# create keys if necessary
+if [ ! -f $HOST_KEY_RSA ]; then
+    echo "  generating ssh RSA key..."
+    mkdir -p $(dirname $HOST_KEY_RSA)
+    ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
+fi
+if [ ! -f $HOST_KEY_ECDSA ]; then
+    echo "  generating ssh ECDSA key..."
+    mkdir -p $(dirname $HOST_KEY_ECDSA)
+    ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
+fi
+if [ ! -f $HOST_KEY_DSA ]; then
+    echo "  generating ssh DSA key..."
+    mkdir -p $(dirname $HOST_KEY_DSA)
+    ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
+fi
+if [ ! -f $HOST_KEY_ED25519 ]; then
+    echo "  generating ssh ED25519 key..."
+    mkdir -p $(dirname $HOST_KEY_ED25519)
+    ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
+fi
+
diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index 148e6ad..603c337 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -1,22 +1,8 @@
 [Unit]
 Description=OpenSSH Key Generation
 RequiresMountsFor=/var /run
-ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
-ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
-ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
-ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
-ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
-ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
-ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
-ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
 
 [Service]
-Environment="SYSCONFDIR=/etc/ssh"
-EnvironmentFile=-/etc/default/ssh
-ExecStart=@BASE_BINDIR@/mkdir -p $SYSCONFDIR
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key -N '' -t rsa
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key -N '' -t dsa
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ecdsa_key -N '' -t ecdsa
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ed25519_key -N '' -t ed25519
+ExecStart=@LIBEXECDIR@/sshd_check_keys
 Type=oneshot
 RemainAfterExit=yes
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 7bd313b..fdbee85 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
+           file://sshd_check_keys \
            "
 
 PAM_SRC_URI = "file://sshd"
@@ -118,7 +119,13 @@ do_install_append () {
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
+		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
 		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
+
+	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
+		${D}${sysconfdir}/init.d/sshd
+
+	install -D -m 0755 ${WORKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd_check_keys
 }
 
 do_install_ptest () {
@@ -133,6 +140,7 @@ FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
 FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
+FILES_${PN}-sshd += "${libexecdir}/${BPN}/sshd_check_keys"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
2.9.4


