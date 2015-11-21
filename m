Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C349F6011A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 08:10:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAL8Ab4h019603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 21 Nov 2015 00:10:37 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sat, 21 Nov 2015 00:10:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 21 Nov 2015 16:10:35 +0800
Message-ID: <1448093435-8279-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
References: <1448077640-5771-1-git-send-email-hongxu.jia@windriver.com>
	<565025D3.4020401@windriver.com>
In-Reply-To: <565025D3.4020401@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] mariadb.inc: fix mysqld hung at first init time based on systemd
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
X-List-Received-Date: Sat, 21 Nov 2015 08:10:37 -0000
Content-Type: text/plain

While SYSTEMD_AUTO_ENABLE_mariadb-server = "enable", the mysqld service
hungs.
...
[    **] A start job is running for Run pending postinsts (25s / no limit)
[  OK  ] Stopped MariaDB database server.
...

In mariadb-server's pkg_postinst, it install db at first runtime. And the
following 'systemctl mysqld restart' casued the hunging. So the fix idea
is to reomove pkg_postinst and still install db at first runtime.

Introduce mysqld.service and mysql-systemd-start from ${S}/packaging/rpm-oel/.
For review convenience, we add them as files.

The mysql-systemd-start provides two functions: the install_db is to install
db at fist runtime (the first runtime means if a db existed, the install_db
will directly exit); the pinger is to wait for mysqld service startup
completed.

The newly mysqld.service add ExecStartPre and ExecStartPost than previous:
ExecStartPre invoke 'mysql-systemd-start pre' to install db before mysqld
start at first runtime; ExecStartPost invoke 'mysql-systemd-start post' to
wait for mysqld service startup completed.

It also fix another issue:
When you manually restart mysqld and do mysql test to connect the server,
the return of the restart could make sure mysqld is ready, and the following db
connect will not fail with:
...
Can't connect to local MySQL server through socket
...

Use "?=" rather than "=" to assign SYSTEMD_AUTO_ENABLE_${PN}-server, so we could
override it in local.conf

Add 'mysql-systemd-start pre' to sysvinit startup script, so mysqld could work
on the system based on sysvinit.

Tweak my.cnf to remove obsolete/incorrect parameter.

Issue: LIN8-1397
Issue: LIN8-1687
(LOCAL REV: NOT UPSTREAM) -- sent to oe on 20151121

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc          | 22 ++-----
 .../mariadb/install-db-before-start-mysqld.patch   | 32 ++++++++++
 meta-oe/recipes-support/mysql/mariadb/my.cnf       |  1 -
 .../mysql/mariadb/mysql-systemd-start              | 68 ++++++++++++++++++++++
 .../recipes-support/mysql/mariadb/mysqld.service   | 50 +++++++++++++---
 5 files changed, 147 insertions(+), 26 deletions(-)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/install-db-before-start-mysqld.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 42a4eda..3a29f58 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -10,8 +10,10 @@ SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
            file://fix-mysqlclient-r-version.patch \
            file://my.cnf \
            file://mysqld.service \
+           file://mysql-systemd-start \
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
+           file://install-db-before-start-mysqld.patch \
           "
 
 SRC_URI[md5sum] = "92f682b00eb137af01e59ea93f7e31f7"
@@ -33,7 +35,7 @@ GROUPADD_PARAM_${PN}-server = "--system mysql"
 
 SYSTEMD_PACKAGES = "${PN}-server"
 SYSTEMD_SERVICE_${PN}-server = "mysqld.service"
-SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
+SYSTEMD_AUTO_ENABLE_${PN}-server ?= "disable"
 
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
@@ -125,22 +127,9 @@ do_install() {
 	echo "f /var/log/mysqld.err 0640 mysql mysql -" \
             > ${D}${sysconfdir}/tmpfiles.d/99-mysqld.conf
     fi
-}
-
-pkg_postinst_${PN}-server () {
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-
-    #Install the database
-    test -d /usr/bin || mkdir -p /usr/bin
-    test -e /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname
-    mkdir /var/lib/mysql
-    chown mysql.mysql /var/lib/mysql
-
-    mysql_install_db --basedir=${prefix} --user=mysql
+    install -d ${D}${bindir}
+    install -m 755 ${WORKDIR}/mysql-systemd-start ${D}${bindir}
 
-    [ -x /sbin/restorecon ] && /sbin/restorecon -RF /var/lib/mysql
 }
 
 PACKAGES = "${PN}-dbg ${PN} \
@@ -236,6 +225,7 @@ FILES_${PN}-server = "\
     ${bindir}/mysql_install_db \
     ${bindir}/mysql_secure_installation \
     ${bindir}/mysql_setpermission \
+    ${bindir}/mysql-systemd-start \
     ${bindir}/mysql_tzinfo_to_sql \
     ${bindir}/mysql_upgrade \
     ${bindir}/mysql_plugin \
diff --git a/meta-oe/recipes-support/mysql/mariadb/install-db-before-start-mysqld.patch b/meta-oe/recipes-support/mysql/mariadb/install-db-before-start-mysqld.patch
new file mode 100644
index 0000000..724618f
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/install-db-before-start-mysqld.patch
@@ -0,0 +1,32 @@
+From 5d8495e81a748350c89849c1a385e57ee31836e2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 20 Nov 2015 09:52:29 -0500
+Subject: [PATCH] support-files/mysql.server.sh: install db at first runtime
+
+We remove postinst in mariadb-server, and still need to install db
+at first runtime before mysqld start. So invoke 'mysql-systemd-start
+pre' before mysqld startup on sysvinit system.
+
+The first runtime means it will skip install if a db already existed.
+
+Upstream-Status: inappropriate [meta-oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ support-files/mysql.server.sh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support-files/mysql.server.sh b/support-files/mysql.server.sh
+index e23b837..e5926f5 100644
+--- a/support-files/mysql.server.sh
++++ b/support-files/mysql.server.sh
+@@ -304,6 +304,7 @@ case "$mode" in
+     cd $basedir
+ 
+     echo $echo_n "Starting MySQL"
++    $bindir/mysql-systemd-start pre
+     if test -x $bindir/mysqld_safe
+     then
+       # Give extra arguments to mysqld with the my.cnf file. This script
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
index 28d3899..dc4c172 100644
--- a/meta-oe/recipes-support/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -4,7 +4,6 @@ port						= 3306
 socket						= /var/lib/mysql/mysql.sock
 
 [mysqld_safe]
-err-log						= /var/log/mysql.err
 
 [mysqld]
 user 						= mysql
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start b/meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start
new file mode 100644
index 0000000..8e7006b
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start
@@ -0,0 +1,68 @@
+#! /bin/sh
+#
+# Scripts to run by MySQL systemd service
+#
+# Needed argument: pre | post
+#
+# pre mode  :  try to run mysql_install_db and fix perms and SELinux contexts
+# post mode :  ping server until answer is received
+#
+
+get_option () {
+    local section=$1
+    local option=$2
+    local default=$3
+    ret=$(/usr/bin/my_print_defaults $section | grep '^--'${option}'=' | cut -d= -f2-)
+    [ -z $ret ] && ret=$default
+    echo $ret
+}
+
+install_db () {
+    # Note: something different than datadir=/var/lib/mysql requires SELinux policy changes (in enforcing mode)
+    datadir=$(get_option mysqld datadir "/var/lib/mysql")
+
+    # Restore log, dir, perms and SELinux contexts
+    [ -d "$datadir" ] || install -d -m 0755 -omysql -gmysql "$datadir" || exit 1
+    log=/var/log/mysqld.log
+    [ -e $log ] || touch $log
+    chmod 0640 $log
+    chown mysql:mysql $log || exit 1
+    if [ -x /usr/sbin/restorecon ]; then
+        /usr/sbin/restorecon "$datadir"
+        /usr/sbin/restorecon $log
+    fi
+
+    # If special mysql dir is in place, skip db install
+    [ -d "$datadir/mysql" ] && exit 0
+
+    # Create initial db
+    /usr/bin/mysql_install_db --rpm --datadir="$datadir" --user=mysql
+    exit 0
+}
+
+pinger () {
+    # Wait for ping to answer to signal startup completed,
+    # might take a while in case of e.g. crash recovery
+    # MySQL systemd service will timeout script if no answer
+    datadir=$(get_option mysqld datadir "/var/lib/mysql")
+    socket=$(get_option  mysqld socket "$datadir/mysql.sock")
+    case $socket in
+        /*) adminsocket="$socket" ;;
+        *) adminsocket="$datadir/$socket" ;;
+    esac
+
+    while /bin/true ; do
+        sleep 1
+        mysqladmin --no-defaults --socket="$adminsocket" --user=UNKNOWN_MYSQL_USER ping >/dev/null 2>&1 && break
+    done
+    exit 0
+}
+
+# main
+case $1 in
+    "pre") install_db ;;
+    "post") pinger ;;
+esac
+
+exit 0
+
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysqld.service b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
index 757d038..1bcb0ee 100644
--- a/meta-oe/recipes-support/mysql/mariadb/mysqld.service
+++ b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
@@ -1,16 +1,48 @@
+#
+# Simple MySQL systemd service file
+#
+# systemd supports lots of fancy features, look here (and linked docs) for a full list:
+#   http://www.freedesktop.org/software/systemd/man/systemd.exec.html
+#
+# Note: this file ( /usr/lib/systemd/system/mysql.service )
+# will be overwritten on package upgrade, please copy the file to
+#
+#  /etc/systemd/system/mysql.service
+#
+# to make needed changes.
+#
+# systemd-delta can be used to check differences between the two mysql.service files.
+#
+
 [Unit]
-Description=MariaDB database server
-After=syslog.target
+Description=MySQL Community Server
 After=network.target
+After=syslog.target
+
+[Install]
+WantedBy=multi-user.target
+Alias=mysql.service
 
 [Service]
-PIDFile=/var/lib/mysql/mysqld.pid
-Type=simple
 User=mysql
 Group=mysql
-ExecStart=@BINDIR@/mysqld_safe --basedir=@PREFIX@
-TimeoutSec=300
-PrivateTmp=true
 
-[Install]
-WantedBy=multi-user.target
+# Execute pre and post scripts as root
+PermissionsStartOnly=true
+
+# Needed to create system tables etc.
+ExecStartPre=@BINDIR@/mysql-systemd-start pre
+
+# Start main service
+ExecStart=@BINDIR@/mysqld_safe
+
+# Don't signal startup success before a ping works
+ExecStartPost=@BINDIR@/mysql-systemd-start post
+
+# Give up if ping don't get an answer
+TimeoutSec=600
+
+Restart=always
+PrivateTmp=false
+
+
-- 
1.9.1


