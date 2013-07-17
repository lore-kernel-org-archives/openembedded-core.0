Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7766A6B251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 09:58:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H9wP6A022346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 02:58:25 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 17 Jul 2013 02:58:24 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 17:58:21 +0800
Message-ID: <1374055101-19424-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] bind: run in the chrooted jail
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
X-List-Received-Date: Wed, 17 Jul 2013 09:58:27 -0000
Content-Type: text/plain

1. Introduce bind-chroot package, contains files/directories used as jail.
2. Add hooks to init script for setting up named to run chroot.
3. Setting ROOTDIR in /etc/default/bind9 is needed to run chroot.

These components mainly come from:
ftp://ftp.redhat.com/pub/redhat/linux/enterprise/6Client/en/os/SRPMS/
bind-9.8.2-0.17.rc1.el6_4.4.src.rpm

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-connectivity/bind/bind-9.8.1/bind9    |   30 +++++
 .../bind/bind-9.8.1/setup-chroot-hooks.patch       |  120 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |   26 ++++-
 3 files changed, 173 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind9
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/setup-chroot-hooks.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind9 b/meta/recipes-connectivity/bind/bind-9.8.1/bind9
new file mode 100644
index 0000000..3d5b69b
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind9
@@ -0,0 +1,30 @@
+# BIND named process options
+# ~~~~~~~~~~~~~~~~~~~~~~~~~~
+# Currently, you can use the following options:
+#
+# ROOTDIR="/var/named/chroot"  --  will run named in a chroot environment.
+#                            you must set up the chroot environment 
+#                            (install the bind-chroot package) before
+#                            doing this.
+#	NOTE:
+#         Those directories are automatically mounted to chroot if they are
+#         empty in the ROOTDIR directory. It will simplify maintenance of your
+#         chroot environment.
+#          - /etc/bind
+#          - /var/run/named
+#          - /var/run/bind
+#          - /var/cache/bind
+#
+#	  Those files are mounted as well if target file doesn't exist in
+#	  chroot.
+#          - /etc/localtime
+#          - /dev/random
+#          - /dev/zero
+#          - /dev/null
+#
+#
+# OPTIONS="whatever"     --  These additional options will be passed to named
+#                            at startup. Don't add -t here, use ROOTDIR instead.
+ROOTDIR="/var/named/chroot"
+OPTIONS="-u bind"
+
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/setup-chroot-hooks.patch b/meta/recipes-connectivity/bind/bind-9.8.1/setup-chroot-hooks.patch
new file mode 100644
index 0000000..e951213
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/setup-chroot-hooks.patch
@@ -0,0 +1,120 @@
+bind: Add hooks for setting up named to run chroot
+
+Upstream-Status: Pending
+
+Add chrooted server hooks in init.d.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ init.d |   76 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 76 insertions(+)
+
+diff -urpN a/init.d b/init.d
+--- a/init.d	2013-07-17 17:42:58.750501832 +0800
++++ b/init.d	2013-07-17 17:50:01.029876808 +0800
+@@ -10,6 +10,55 @@ test -f /etc/default/bind9 && . /etc/def
+ 
+ test -x /usr/sbin/rndc || exit 0
+ 
++if [ -n "$ROOTDIR" ]; then
++    ROOTDIR=`echo $ROOTDIR | sed 's#//*#/#g;s#/$##'`;
++    rdl=`/usr/bin/readlink $ROOTDIR`;
++        if [ -n "$rdl" ]; then
++            ROOTDIR="$rdl";
++        fi;
++fi
++
++ROOTDIR_MOUNT='/etc/bind /var/run/named /var/run/bind /var/cache/bind
++/etc/localtime /dev/random /dev/zero /dev/null'
++
++mount_chroot_conf() {
++  if [ -n "$ROOTDIR" ]; then
++    for all in $ROOTDIR_MOUNT; do
++      # Skip nonexistant files
++      [ -e "$all" ] || continue
++
++      # If mount source is a file
++      if ! [ -d "$all" ]; then
++        # mount it only if it is not present in chroot or it is empty
++        if ! [ -e "$ROOTDIR$all" ] || [ `stat -c'%s' "$ROOTDIR$all"` -eq 0 ]; then
++          touch "$ROOTDIR$all"
++          mount --bind "$all" "$ROOTDIR$all"
++        fi
++      else
++        # Mount source is a directory. Mount it only if directory in chroot is
++        # empty.
++	if [ -e "$all" ] && [ `ls -1A $ROOTDIR$all | wc -l` -eq 0 ]; then
++          mount --bind "$all" "$ROOTDIR$all"
++	fi
++      fi
++    done
++  fi
++}
++
++umount_chroot_conf() {
++  if [ -n "$ROOTDIR" ]; then
++    for all in $ROOTDIR_MOUNT; do
++      # Check if file is mount target. Do not use /proc/mounts because detecting
++      # of modified mounted files can fail.
++      if mount | grep -q '.* on '"$ROOTDIR$all"' .*'; then
++        umount "$ROOTDIR$all"
++        # Remove temporary created files
++        [ -f "$all" ] && rm -f "$ROOTDIR$all"
++      fi
++    done
++  fi
++}
++
+ case "$1" in
+     start)
+ 	echo -n "Starting domain name service: named"
+@@ -17,7 +66,8 @@ case "$1" in
+ 	modprobe capability >/dev/null 2>&1 || true
+ 	if [ ! -f /etc/bind/rndc.key ]; then
+ 	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
+-	    chown 0640 /etc/bind/rndc.key
++	    chmod 0640 /etc/bind/rndc.key
++	    chown root:bind /etc/bind/rndc.key >/dev/null 2>&1 || true
+ 	fi
+ 	if [ -f /var/run/named/named.pid ]; then
+ 	    ps `cat /var/run/named/named.pid` > /dev/null && exit 1
+@@ -33,6 +83,31 @@ case "$1" in
+ 	    echo "named binary missing - not starting"
+ 	    exit 1
+ 	fi
++
++	# Handle -c option for chroot jail
++	previous_option='unspecified';
++	for a in $OPTIONS; do
++	    if [ $previous_option = '-c' ]; then
++		named_conf=$a;
++	    fi;
++	    previous_option=$a;
++	done;
++	named_conf=${named_conf:-/etc/bind/named.conf};
++
++	mount_chroot_conf
++
++	# If named is running in the jail, we should check -c option, make sure
++	# it's available for the chrooted server or return a error.  
++	if [[ -n $ROOTDIR && ${named_conf:0:${#ROOTDIR}} != $ROOTDIR && \
++	      ! -r $ROOTDIR$named_conf ]]; then
++	    echo "Cannot find configuration file in jail, put it into $ROOTDIR."
++	    exit 6;
++	fi;
++
++	if [ -n "${ROOTDIR}" -a "x${ROOTDIR}" != "x/" ]; then
++	    OPTIONS="${OPTIONS} -t ${ROOTDIR}"
++	fi
++
+ 	if start-stop-daemon --start --quiet --exec /usr/sbin/named \
+ 		--pidfile /var/run/named/named.pid -- $OPTIONS; then
+ 	    if [ -x /sbin/resolvconf ] ; then
+@@ -48,6 +123,7 @@ case "$1" in
+ 	    /sbin/resolvconf -d lo
+ 	fi
+ 	/usr/sbin/rndc stop >/dev/null 2>&1
++	umount_chroot_conf
+ 	echo "."	
+     ;;
+ 
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 3c5d600..0ba461b 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -6,7 +6,7 @@ LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl libcap"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
@@ -18,6 +18,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-CVE-2012-3817.patch \
            file://bind-CVE-2013-2266.patch \
            file://bind-Fix-CVE-2012-4244.patch \
+           file://bind9 \
+           file://setup-chroot-hooks.patch \
 	   "
 
 SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
@@ -32,16 +34,23 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
                "
-inherit autotools update-rc.d
+inherit useradd autotools update-rc.d
 
 INITSCRIPT_NAME = "bind"
 INITSCRIPT_PARAMS = "defaults"
 
 PARALLEL_MAKE = ""
 
-PACKAGES_prepend = "${PN}-utils "
+PACKAGES_prepend = "${PN}-utils ${PN}-chroot "
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/nslookup"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
+FILES_${PN}-chroot = "${localstatedir}/named/chroot ${sysconfdir}/default/bind9"
+
+RDEPENDS_${PN} = "bind-chroot"
+
+USERADD_PACKAGES = "${PN}-chroot"
+USERADD_PARAM_${PN}-chroot = "-d ${sysconfdir}/bind -r -s /bin/false -g bind bind"
+GROUPADD_PARAM_${PN}-chroot = "-r bind"
 
 do_install_append() {
 	rm "${D}${bindir}/nslookup"
@@ -52,6 +61,17 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
+
+	install -d "${D}${sysconfdir}/default"
+	install -m 755 "${WORKDIR}/bind9" "${D}${sysconfdir}/default/bind9"
+
+	# chroot
+	chroot_prefix="${localstatedir}/named/chroot"
+	install -d "${D}${chroot_prefix}/dev"
+	install -d "${D}${chroot_prefix}/etc/bind"
+	install -d "${D}${chroot_prefix}/var/cache/bind"
+	install -d "${D}${chroot_prefix}/var/run/bind"
+	install -d "${D}${chroot_prefix}/var/run/named"
 }
 
 CONFFILES_${PN} = " \
-- 
1.7.1


