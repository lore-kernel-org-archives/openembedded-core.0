Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 704547036A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:57:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1vx5C021192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 18:58:00 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Jul 2014 18:57:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jul 2014 21:57:56 -0400
Message-ID: <3a19aa87a9f5d562cd1c5615d89486a46adea9da.1404987090.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1404987090.git.jackie.huang@windriver.com>
References: <cover.1404987090.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] postfix: add new recipe
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
X-List-Received-Date: Fri, 11 Jul 2014 01:58:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Postfix is Wietse Venema's mail server that started life at IBM
research as an alternative to the widely-used Sendmail program.

Postfix attempts to be fast, easy to administer, and secure.
The outside has a definite Sendmail-ish flavor, but the inside
is completely different.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/postfix/files/install.patch  |   66 ++++++
 .../postfix/files/internal_recipient               |    1 +
 meta/recipes-extended/postfix/files/main.cf_2.0    |  102 +++++++++
 meta/recipes-extended/postfix/files/makedefs.patch |  116 ++++++++++
 meta/recipes-extended/postfix/files/postfix        |   85 ++++++++
 .../postfix/files/postfix-add-db6-support.patch    |   26 +++
 .../recipes-extended/postfix/files/postfix.service |   14 ++
 meta/recipes-extended/postfix/postfix.inc          |  230 ++++++++++++++++++++
 meta/recipes-extended/postfix/postfix_2.11.1.bb    |    6 +
 9 files changed, 646 insertions(+)
 create mode 100644 meta/recipes-extended/postfix/files/install.patch
 create mode 100644 meta/recipes-extended/postfix/files/internal_recipient
 create mode 100644 meta/recipes-extended/postfix/files/main.cf_2.0
 create mode 100644 meta/recipes-extended/postfix/files/makedefs.patch
 create mode 100755 meta/recipes-extended/postfix/files/postfix
 create mode 100644 meta/recipes-extended/postfix/files/postfix-add-db6-support.patch
 create mode 100644 meta/recipes-extended/postfix/files/postfix.service
 create mode 100644 meta/recipes-extended/postfix/postfix.inc
 create mode 100644 meta/recipes-extended/postfix/postfix_2.11.1.bb

diff --git a/meta/recipes-extended/postfix/files/install.patch b/meta/recipes-extended/postfix/files/install.patch
new file mode 100644
index 0000000..a3fe089
--- /dev/null
+++ b/meta/recipes-extended/postfix/files/install.patch
@@ -0,0 +1,66 @@
+Change fixed postconf to a variable for cross-compiling
+
+Upstreamstatus: Inappropriate [embedded specific]
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+diff --git a/postfix-install b/postfix-install
+index 49225ac..2e4c292 100644
+--- a/postfix-install
++++ b/postfix-install
+@@ -201,8 +201,8 @@ test -z "$non_interactive" -a ! -t 0 && {
+     exit 1
+ }
+
+-test -x bin/postconf || {
+-    echo $0: Error: no bin/postconf file. Did you forget to run \"make\"? 1>&2
++test -x "$POSTCONF" || {
++    echo $0: Error: no $POSTCONF file. Did you forget to run \"make\"? 1>&2
+     exit 1
+ }
+
+@@ -363,7 +363,7 @@ HTML files. Specify \"no\" if you do not want to install these files."
+
+ : ${install_root=/}
+ : ${tempdir=`pwd`}
+-: ${config_directory=`bin/postconf -c conf -h -d config_directory`}
++: ${config_directory=`$POSTCONF -c conf -h -d config_directory`}
+
+ # Find out the location of installed configuration files.
+
+@@ -433,7 +433,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
+ 	case "$junk" in
+ 	"") eval unset $name;;
+ 	esac
+-	eval : \${$name=\`bin/postconf -c $CONFIG_DIRECTORY -h $name\`} ||
++	eval : \${$name=\`$POSTCONF -c $CONFIG_DIRECTORY -h $name\`} ||
+ 	    exit 1
+     done
+ }
+@@ -446,7 +446,7 @@ do
+     case "$junk" in
+     "") eval unset $name;;
+     esac
+-    eval : \${$name=\`bin/postconf -c conf -d -h $name\`} || exit 1
++    eval : \${$name=\`$POSTCONF -c conf -d -h $name\`} || exit 1
+ done
+
+ # Override settings manually.
+@@ -565,6 +565,8 @@ HTML_DIRECTORY=$install_root$html_directory
+ MANPAGE_DIRECTORY=$install_root$manpage_directory
+ README_DIRECTORY=$install_root$readme_directory
+
++test "x$POSTCONF" != "x" || POSTCONF="bin/postconf"
++
+ # Avoid repeated tests for existence of these; default permissions suffice.
+
+ test -d $DAEMON_DIRECTORY || mkdir -p $DAEMON_DIRECTORY || exit 1
+@@ -724,7 +726,7 @@ do
+ # Postfix releases, and software should not suddenly be installed in
+ # the wrong place when Postfix is being upgraded.
+
+-bin/postconf -c $CONFIG_DIRECTORY -e \
++"$POSTCONF" -c $CONFIG_DIRECTORY -e \
+     "daemon_directory = $daemon_directory" \
+     "data_directory = $data_directory" \
+     "command_directory = $command_directory" \
diff --git a/meta/recipes-extended/postfix/files/internal_recipient b/meta/recipes-extended/postfix/files/internal_recipient
new file mode 100644
index 0000000..6a8f268
--- /dev/null
+++ b/meta/recipes-extended/postfix/files/internal_recipient
@@ -0,0 +1 @@
+root@   permit_mynetworks,reject
diff --git a/meta/recipes-extended/postfix/files/main.cf_2.0 b/meta/recipes-extended/postfix/files/main.cf_2.0
new file mode 100644
index 0000000..a128faa
--- /dev/null
+++ b/meta/recipes-extended/postfix/files/main.cf_2.0
@@ -0,0 +1,102 @@
+# Configure your domain and accounts
+#mydomain=sample.com
+#FQDN from gethostname
+#myhostname =
+mydomain=localdomain
+mydestination = $myhostname, localhost.localdomain localhost
+mynetworks = 127.0.0.1/8
+inet_interfaces = 127.0.0.1
+
+virtual_mailbox_domains = sample.com, other.net
+virtual_mailbox_maps = hash:/etc/postfix/virtual
+virtual_alias_maps = hash:/etc/postfix/virtual_alias
+
+alias_maps = hash:/etc/aliases
+
+# You'll start with the following lines for maildir storage
+virtual_mailbox_base = /var/spool/vmail
+virtual_uid_maps = static:`grep vmail /etc/passwd | cut -d ":" -f 3`
+virtual_gid_maps = static:`grep vmail /etc/passwd | cut -d ":" -f 4`
+
+
+# You'll start with the following lines for IMAP storage
+#virtual_transport = lmtp:unix:/var/lib/cyrus/socket/lmtp
+
+
+# General stuff here again
+config_directory = /etc/postfix
+sample_directory = /etc/postfix
+queue_directory = /var/spool/postfix
+mail_spool_directory = /var/spool/mail
+readme_directory = no
+command_directory = /usr/sbin
+daemon_directory = /usr/libexec/postfix
+mail_owner = postfix
+setgid_group = postdrop
+unknown_local_recipient_reject_code = 450
+mynetworks_style = host
+debug_peer_level = 2
+sendmail_path = /usr/sbin/sendmail
+newaliases_path = /usr/bin/newaliases
+mailq_path = /usr/bin/mailq
+
+smtpd_data_restrictions =
+        permit_mynetworks,
+        reject_unauth_pipelining,
+        permit
+
+smtpd_client_restrictions =
+        permit_mynetworks,
+        # reject_unknown_client, # This can cause a lot of false rejects.
+        reject_invalid_hostname,
+        reject_rbl_client list.dsbl.org,
+        reject_rbl_client sbl.spamhaus.org,
+        reject_rbl_client cbl.abuseat.org,
+        reject_rbl_client dul.dnsbl.sorbs.net,
+        permit
+
+smtpd_helo_required = yes
+smtpd_helo_restrictions =
+        permit_mynetworks,
+        reject_unauth_pipelining,
+        # reject_non_fqdn_hostname, # This can cause a lot of false rejects.
+        # reject_unknown_hostname, # This can cause a lot of false rejects.
+        reject_invalid_hostname,
+        permit
+
+smtpd_sender_restrictions =
+        permit_mynetworks,
+        reject_non_fqdn_sender,
+        # check_sender_access hash:/etc/postfix/access_domains,
+        reject_unknown_sender_domain,
+        permit
+
+smtpd_recipient_restrictions =
+        permit_mynetworks,
+        permit_sasl_authenticated,
+        reject_unauth_destination,
+
+        # check_recipient_access pcre:/etc/postfix/recipient_checks.pcre,
+        # check_helo_access pcre:/etc/postfix/helo_checks.pcre,
+
+        # check_client_access hash:/etc/postfix/maps/access_client,
+        # check_client_access hash:/etc/postfix/maps/exceptions_client,
+        # check_helo_access hash:/etc/postfix/maps/access_helo,
+        # check_helo_access hash:/etc/postfix/maps/verify_helo,
+        # check_sender_access hash:/etc/postfix/maps/access_sender,
+        # check_sender_access hash:/etc/postfix/maps/verify_sender,
+        # check_recipient_access hash:/etc/postfix/maps/access_recipient,
+
+        # reject_multi_recipient_bounce,
+        reject_non_fqdn_recipient,
+        reject_unknown_recipient_domain,
+        # reject_unlisted_recipient,
+        #check_policy_service unix:private/policy,
+
+        # check_sender_access hash:/etc/postfix/maps/no_verify_sender,
+        # check_sender_access hash:/etc/postfix/access_domains,
+        # reject_unverified_sender,
+        # reject_unverified_recipient
+        check_recipient_access hash:/etc/postfix/internal_recipient
+
+disable_vrfy_command = yes
diff --git a/meta/recipes-extended/postfix/files/makedefs.patch b/meta/recipes-extended/postfix/files/makedefs.patch
new file mode 100644
index 0000000..32c31b0
--- /dev/null
+++ b/meta/recipes-extended/postfix/files/makedefs.patch
@@ -0,0 +1,116 @@
+1)remove RANLIB, SYSLIBS, AR and get them from env.
+
+2)reference sysroot when searching header files
+3)include sysroot path instead of absolute include path
+for Linux2 and Linux3 systems.
+4)for non-native build, search STAGING_BASELIBDIR/LIBDIR
+  native build, search host library path for nsl and resolv library
+  which comes from libc
+
+Upstreamstatus: Inappropriate [embedded specific]
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+ makedefs |   27 +++++++++++----------------
+ 1 files changed, 11 insertions(+), 16 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index dd5f256..e6fb795 100644
+--- a/makedefs
++++ b/makedefs
+@@ -87,9 +87,6 @@
+
+ # Defaults for most sane systems
+
+-RANLIB=ranlib
+-SYSLIBS=
+-AR=ar
+ ARFL=rv
+
+ # Ugly function to make our error message more visible among the
+@@ -293,12 +290,12 @@ case "$SYSTEM.$RELEASE" in
+ 		case "$CCARGS" in
+ 		 *-DNO_DB*) ;;
+ 		 *-DHAS_DB*) ;;
+-		 *) if [ -f /usr/include/db.h ]
++		 *) if [ -f "$BUILD_SYSROOT"/usr/include/db.h ]
+ 		    then
+ 			: we are all set
+-		    elif [ -f /usr/include/db/db.h ]
++		    elif [ -f "$BUILD_SYSROOT"/usr/include/db/db.h ]
+ 		    then
+-			CCARGS="$CCARGS -I/usr/include/db"
++			CCARGS="$CCARGS -I"$BUILD_SYSROOT"/usr/include/db"
+ 		    else
+ 			# No, we're not going to try db1 db2 db3 etc.
+ 			# On a properly installed system, Postfix builds
+@@ -307,12 +304,12 @@ case "$SYSTEM.$RELEASE" in
+ 			echo "Install the appropriate db*-devel package first." 1>&2
+ 			exit 1
+ 		    fi
+-		    SYSLIBS="-ldb"
++		    SYSLIBS="$SYSLIBS -ldb"
+ 		    ;;
+ 		esac
+ 		for name in nsl resolv $GDBM_LIBS
+ 		do
+-		    for lib in /usr/lib64 /lib64 /usr/lib /lib
++		    for lib in $BUILD_SYSROOT_NSL_PATH
+ 		    do
+ 			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
+ 			    SYSLIBS="$SYSLIBS -l$name"
+@@ -332,7 +329,7 @@ case "$SYSTEM.$RELEASE" in
+ 		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
+ 		       then
+ 			   :
+-		       elif [ ! -e /usr/include/sys/epoll.h ]
++		       elif [ ! -e "$BUILD_SYSROOT"/usr/include/sys/epoll.h ]
+ 		       then
+ 			   echo CCARGS="$CCARGS -DNO_EPOLL"
+ 		       else
+@@ -356,8 +353,6 @@ int     main(int argc, char **argv)
+ }
+ EOF
+ 			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
+-			   ./makedefs.test 2>/dev/null ||
+-				CCARGS="$CCARGS -DNO_EPOLL"
+ 			   rm -f makedefs.test makedefs.test.[co]
+ 		       fi;;
+ 		esac
+@@ -366,12 +361,12 @@ EOF
+ 		case "$CCARGS" in
+ 		 *-DNO_DB*) ;;
+ 		 *-DHAS_DB*) ;;
+-		 *) if [ -f /usr/include/db.h ]
++		 *) if [ -f "$BUILD_SYSROOT"/usr/include/db.h ]
+ 		    then
+ 			: we are all set
+-		    elif [ -f /usr/include/db/db.h ]
++		    elif [ -f "$BUILD_SYSROOT"/usr/include/db/db.h ]
+ 		    then
+-			CCARGS="$CCARGS -I/usr/include/db"
++			CCARGS="$CCARGS -I"$BUILD_SYSROOT"/usr/include/db"
+ 		    else
+ 			# On a properly installed system, Postfix builds
+ 			# by including <db.h> and by linking with -ldb
+@@ -379,7 +374,7 @@ EOF
+ 			echo "Install the appropriate db*-devel package first." 1>&2
+ 			exit 1
+ 		    fi
+-		    SYSLIBS="-ldb"
++		    SYSLIBS="$SYSLIBS -ldb"
+ 		    ;;
+ 		esac
+ 		for name in nsl resolv
+@@ -415,7 +410,7 @@ EOF
+ 		esac
+ 		for name in nsl resolv
+ 		do
+-		    for lib in /usr/lib64 /lib64 /usr/lib /lib
++		    for lib in $BUILD_SYSROOT_NSL_PATH
+ 		    do
+ 			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
+ 			    SYSLIBS="$SYSLIBS -l$name"
+--
+1.7.1
+
diff --git a/meta/recipes-extended/postfix/files/postfix b/meta/recipes-extended/postfix/files/postfix
new file mode 100755
index 0000000..7bcc816
--- /dev/null
+++ b/meta/recipes-extended/postfix/files/postfix
@@ -0,0 +1,85 @@
+#!/bin/sh
+
+success() {
+        echo " Successful"
+        exit 0
+}
+
+fail() {
+        echo " Failed"
+        exit 1
+
+}
+
+check_return () {
+        local ret="$1"
+
+        if [ "$ret" = "0" ]; then
+          success
+        else
+          fail
+        fi
+}
+
+PIDFile=/var/spool/postfix/pid/master.pid
+case "$1" in
+
+        start)
+        echo -n "Starting Postfix..."
+        if [ ! -e /etc/aliases.db ]; then
+          # The alias database is necessary for postfix to work correctly.
+          echo "Creating aliases database ..."
+          newaliases
+        fi
+        if ! postfix status >/dev/null 2>&1; then
+          postfix start
+          check_return $?
+        else
+          success
+        fi
+        ;;
+
+        stop)
+        echo -n  "Stopping Postfix..."
+        if postfix status >/dev/null 2>&1; then
+          postfix stop
+          check_return $?
+        else
+          success
+        fi
+        ;;
+
+        reload)
+        echo -n "Reloading Postfix..."
+        if postfix status >/dev/null 2>&1; then
+          postfix reload
+          check_return $?
+        else
+          postfix start
+          check_return $?
+        fi
+        ;;
+
+        restart)
+        $0 stop
+        sleep 1
+        $0 start
+        ;;
+
+        status)
+        if postfix status >/dev/null 2>&1; then
+          pid=`sed -e 's/\s//g' $PIDFile`
+          echo "The Postfix mail system is running (PID: $pid)"
+          exit 0
+        else
+          echo "The Postfix mail system is not running"
+          exit 1
+        fi
+        ;;
+
+        *)
+        echo "Usage: $0 {start|stop|status|reload|restart}"
+        exit 1
+        ;;
+esac
+
diff --git a/meta/recipes-extended/postfix/files/postfix-add-db6-support.patch b/meta/recipes-extended/postfix/files/postfix-add-db6-support.patch
new file mode 100644
index 0000000..e3e28c8
--- /dev/null
+++ b/meta/recipes-extended/postfix/files/postfix-add-db6-support.patch
@@ -0,0 +1,26 @@
+Subject: [PATCH] add db6 support db6
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/util/dict_db.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/src/util/dict_db.c b/src/util/dict_db.c
+index 93ee480..f1ae66b 100644
+--- a/src/util/dict_db.c
++++ b/src/util/dict_db.c
+@@ -693,7 +693,8 @@ static DICT *dict_db_open(const char *class, const char *path, int open_flags,
+ 	msg_fatal("set DB cache size %d: %m", dict_db_cache_size);
+     if (type == DB_HASH && db->set_h_nelem(db, DICT_DB_NELM) != 0)
+ 	msg_fatal("set DB hash element count %d: %m", DICT_DB_NELM);
+-#if DB_VERSION_MAJOR == 5 || (DB_VERSION_MAJOR == 4 && DB_VERSION_MINOR > 0)
++#if DB_VERSION_MAJOR == 6 || DB_VERSION_MAJOR == 5 || \
++    (DB_VERSION_MAJOR == 4 && DB_VERSION_MINOR > 0)
+     if ((errno = db->open(db, 0, db_path, 0, type, db_flags, 0644)) != 0)
+ 	FREE_RETURN(dict_surrogate(class, path, open_flags, dict_flags,
+ 				   "open database %s: %m", db_path));
+--
+1.7.1
+
diff --git a/meta/recipes-extended/postfix/files/postfix.service b/meta/recipes-extended/postfix/files/postfix.service
new file mode 100644
index 0000000..6ea9214
--- /dev/null
+++ b/meta/recipes-extended/postfix/files/postfix.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Postfix Mail Transport Agent
+After=syslog.target network.target
+Conflicts=sendmail.service exim.service
+
+[Service]
+Type=forking
+PIDFile=/var/spool/postfix/pid/master.pid
+ExecStart=/usr/sbin/postfix start
+ExecReload=/usr/sbin/postfix reload
+ExecStop=/usr/sbin/postfix stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/postfix/postfix.inc b/meta/recipes-extended/postfix/postfix.inc
new file mode 100644
index 0000000..c58787e
--- /dev/null
+++ b/meta/recipes-extended/postfix/postfix.inc
@@ -0,0 +1,230 @@
+SUMMARY = "Postfix Mail Transport Agent"
+DESCRIPTION = "Postfix is Wietse Venema's mail server that started life at \
+IBM research as an alternative to the widely-used Sendmail program. \
+Postfix attempts to be fast, easy to administer, and secure. The outsidei \
+has a definite Sendmail-ish flavor, but the inside is completely different."
+
+HOMEPAGE= "http://www.postfix.org"
+SECTION = "console/network"
+DEPENDS = "virtual/db libpcre openssl postfix-native \
+	${@base_contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
+	${@base_contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
+"
+DEPENDS_virtclass-native = "virtual/db-native openssl-native libpcre-native"
+
+LICENSE = "IPL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
+
+SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+	   file://makedefs.patch \
+	   file://install.patch \
+	   file://main.cf_2.0 \
+	   file://postfix \
+	   file://internal_recipient \
+	   file://postfix.service \
+	   "
+
+S = "${WORKDIR}/postfix-${PV}"
+
+BBCLASSEXTEND = "native"
+
+inherit update-rc.d useradd update-alternatives systemd
+
+INITSCRIPT_NAME = "postfix"
+INITSCRIPT_PARAMS = "start 58 3 4 5 . stop 13 0 1 6 ."
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = \
+"-d /var/spool/postfix -r -g postfix --shell /bin/false postfix; \
+ -d /var/spool/vmail -r -u 5000 -g vmail --shell /bin/false vmail \
+"
+GROUPADD_PARAM_${PN} = "--system postfix;--system postdrop;-g 5000 --system vmail"
+
+export SYSLIBS = "${LDFLAGS}"
+
+# CCARGS specifies includes, defines
+# AUXLIBS specifies libraries
+# Linux2/Linux3 has HAS_DB defined
+# makedefs will make CC to be CC+CCARGS
+
+# ldap support
+export CCARGS-ldap  = "\
+	${@base_contains('DISTRO_FEATURES', 'ldap', '-DHAS_LDAP', '', d)}"
+export AUXLIBS-ldap = "\
+	${@base_contains('DISTRO_FEATURES', 'ldap', '-lldap -llber', '', d)}"
+
+# no native openldap
+export CCARGS-ldap_virtclass-native = ""
+export AUXLIBS-ldap_virtclass-native = ""
+
+# SASL support -DUSE_LDAP_SASL -DUSE_SASL_AUTH
+# current openldap didn't enable SASL
+export CCARGS-sasl  = "\
+	${@base_contains('DISTRO_FEATURES', 'sasl', '-DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I=/usr/include/sasl', '', d)}"
+export AUXLIBS-sasl = "\
+	${@base_contains('DISTRO_FEATURES', 'sasl', '-lsasl2', '', d)}"
+export CCARGS-sasl_virtclass-native = ""
+export AUXLIBS-sasl_virtclass-native = ""
+
+# PCRE, TLS support default
+export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCARGS-sasl}"
+export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
+export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
+
+# OPT,DEBUG is aready in CFLAGS
+# ignore the OPTS="CC=$CC" in Makefile it will not use the CC=$CC $CCARGS
+EXTRA_OEMAKE += "OPT= DEBUG= OPTS= "
+
+do_compile () {
+	unset CFLAGS CPPFLAGS CXXFLAGS
+	local native_build
+
+	native_build="${@['0', '1'][bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d)]}"
+
+	# if not native build, then pass SYSTEM and RELEASE to makedefs
+	if [ "${native_build}" != "1" ]; then
+		# uname -s for target
+		SYSTEM="Linux"
+
+		# uname -r, use 2.6 as bottomline, even target kernel ver > 2.6
+		RELEASE="2.6.34"
+		sed -i -e \
+		    "s:\$(SHELL) makedefs):\$(SHELL) makedefs $SYSTEM $RELEASE):" \
+		    ${S}/Makefile.in
+		export BUILD_SYSROOT="${STAGING_DIR_HOST}"
+		export BUILD_SYSROOT_NSL_PATH="${STAGING_BASELIBDIR} \
+		                               ${STAGING_LIBDIR}"
+	else
+		# native build
+		export BUILD_SYSROOT="${STAGING_DIR_NATIVE}"
+
+		# ubuntu x86 host: /lib/x86_64-linux-gnu(64) /lib/i386-linux-gnu (32)
+		#             on 64 bits, 32 libs in i386-linux-gnu
+		# let makedefs finds nsl and resolv libs, host CC will link
+		# the correct libraries
+		BUILD_SYSROOT_NSL_PATH="$(${CC} -print-search-dirs 2>/dev/null | \
+	                  sed -n '/^libraries: =/s/libraries: =//p' | \
+	                  sed -e 's/:/\n/g' | xargs -n1 readlink -f | \
+	                  grep -v 'gcc\|/[0-9.]\+$' | sort -u)"
+		if [ -z "$BUILD_SYSROOT_NSL_PATH" ]; then
+			BUILD_SYSROOT_NSL_PATH="/usr/lib64 /lib64 \
+		                                /lib/x86_64-linux-gnu \
+		                                /usr/lib   /lib \
+		                                /lib/i386-linux-gnu"
+		fi
+		export BUILD_SYSROOT_NSL_PATH
+	fi
+
+	oe_runmake makefiles
+	oe_runmake
+}
+
+do_install_prepend_virtclass-native() {
+	export POSTCONF="bin/postconf"
+}
+
+SYSTEMD_SERVICE_${PN} = "postfix.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install () {
+	sh ./postfix-install 'install_root=${D}' \
+		'config_directory=${sysconfdir}/postfix' \
+		'daemon_directory=${exec_prefix}/libexec/postfix' \
+		'command_directory=${sbindir}' \
+		'queue_directory=${localstatedir}/spool/postfix' \
+		'sendmail_path=${sbindir}/sendmail.postfix' \
+		'newaliases_path=${bindir}/newaliases' \
+		'mailq_path=${bindir}/mailq' \
+		'manpage_directory=${mandir}' \
+		'readme_directory=${datadir}/doc/postfix' \
+		'data_directory=${localstatedir}/lib/postfix' \
+		-non-interactive
+	rm -rf ${D}${localstatedir}/spool/postfix
+	mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
+	install -d ${D}${sysconfdir}/init.d
+	install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
+	install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
+	install -m 644 ${WORKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
+	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/postfix.service
+
+	install -m 770 -d ${D}${localstatedir}/spool/postfix
+	chown postfix:postfix ${D}${localstatedir}/spool/postfix
+	chown postfix:postfix ${D}${localstatedir}/lib/postfix
+
+	install -m 2755 -d ${D}${localstatedir}/spool/mail
+	chown postfix:nogroup ${D}${localstatedir}/spool/mail
+	install -m 0755 -d ${D}${localstatedir}/lib/postfix
+	chown postfix:nogroup ${D}${localstatedir}/lib/postfix
+	install -m 0755 -d ${D}${localstatedir}/spool/postfix
+	chown root:postfix ${D}${localstatedir}/spool/postfix
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/active
+	chown postfix:root ${D}${localstatedir}/spool/postfix/active
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/bounce
+	chown postfix:root ${D}${localstatedir}/spool/postfix/bounce
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/corrupt
+	chown postfix:root ${D}${localstatedir}/spool/postfix/corrupt
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/defer
+	chown postfix:root ${D}${localstatedir}/spool/postfix/defer
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/deferred
+	chown postfix:root ${D}${localstatedir}/spool/postfix/deferred
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/flush
+	chown postfix:root ${D}${localstatedir}/spool/postfix/flush
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/hold
+	chown postfix:root ${D}${localstatedir}/spool/postfix/hold
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/incoming
+	chown postfix:root ${D}${localstatedir}/spool/postfix/incoming
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/saved
+	chown postfix:root ${D}${localstatedir}/spool/postfix/saved
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/trace
+	chown postfix:root ${D}${localstatedir}/spool/postfix/trace
+	install -m 0730 -d ${D}${localstatedir}/spool/postfix/maildrop
+	chown postfix:postdrop ${D}${localstatedir}/spool/postfix/maildrop
+	install -m 0755 -d ${D}${localstatedir}/spool/postfix/pid
+	chown root:root ${D}${localstatedir}/spool/postfix/pid
+	install -m 0700 -d ${D}${localstatedir}/spool/postfix/private
+	chown postfix:root ${D}${localstatedir}/spool/postfix/private
+	install -m 0710 -d ${D}${localstatedir}/spool/postfix/public
+	chown postfix:postdrop ${D}${localstatedir}/spool/postfix/public
+	install -m 0755 -d ${D}${localstatedir}/spool/vmail
+	chown vmail:vmail ${D}${localstatedir}/spool/vmail
+
+	chown :postdrop ${D}${sbindir}/postqueue
+	chown :postdrop ${D}${sbindir}/postdrop
+	chmod g+s ${D}${sbindir}/postqueue
+	chmod g+s ${D}${sbindir}/postdrop
+}
+
+do_install_append_class-native() {
+	ln -sf ../sbin/sendmail.postfix ${D}${bindir}/newaliases
+	ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
+}
+
+NATIVE_INSTALL_WORKS = "1"
+
+ALTERNATIVE_${PN} = "sendmail"
+ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_PRIORITY = "120"
+
+pkg_postinst_${PN} () {
+	if [ "x$D" = "x" ]; then
+		touch /etc/aliases
+		newaliases
+
+		# generate virtual_alias, default is hash
+		touch /etc/postfix/virtual_alias
+		postmap /etc/postfix/virtual_alias
+	else
+		touch $D/etc/aliases
+		newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
+		touch $D/etc/postfix/virtual_alias
+		postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
+	fi
+}
+
+# Exclude .debug directories from the main package
+FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
+               ${exec_prefix}/libexec/postfix/* ${systemd_unitdir}/*"
+FILES_${PN}-dbg += "${exec_prefix}/libexec/postfix/.debug"
diff --git a/meta/recipes-extended/postfix/postfix_2.11.1.bb b/meta/recipes-extended/postfix/postfix_2.11.1.bb
new file mode 100644
index 0000000..8f237dc
--- /dev/null
+++ b/meta/recipes-extended/postfix/postfix_2.11.1.bb
@@ -0,0 +1,6 @@
+require postfix.inc
+
+SRC_URI += "file://postfix-add-db6-support.patch"
+
+SRC_URI[md5sum] = "56ac1f1a79737c4ac1e24535a122a4a6"
+SRC_URI[sha256sum] = "487f98a73b95a5799409caf21ec065efea91c1dcdfb84c038a0e3a265d6489e2"
--
1.7.9.5


