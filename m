Return-Path: <oliver.staebler@bytesatwork.ch>
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8D9781FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 09:36:58 +0000 (UTC)
Received: from stanley.bytesatwork.ch (162.40.150.83.ftth.as8758.net
	[83.150.40.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: oliver)
	by bytesatwork.ch (Postfix) with ESMTPSA id F1D92101C035B;
	Wed,  2 Aug 2017 11:36:57 +0200 (CEST)
From: =?UTF-8?q?Oliver=20St=C3=A4bler?= <oliver.staebler@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 11:37:10 +0200
Message-Id: <20170802093710.26565-2-oliver.staebler@bytesatwork.ch>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170802093710.26565-1-oliver.staebler@bytesatwork.ch>
References: <20170802093710.26565-1-oliver.staebler@bytesatwork.ch>
MIME-Version: 1.0
Cc: =?UTF-8?q?Oliver=20St=C3=A4bler?= <oliver.staebler@bytesatwork.ch>
Subject: [RFC][PATCH v2] eudev: Remove udev-cache
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
X-List-Received-Date: Wed, 02 Aug 2017 09:36:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As eudev requires devtmpfs it is not necessary to keep a cache anymore
as the kernel handles entries in /dev itself.

Signed-off-by: Oliver Stäbler <oliver.staebler@bytesatwork.ch>
---
 meta/recipes-core/udev/eudev/init               | 49 ----------------
 meta/recipes-core/udev/eudev/udev-cache         | 75 -------------------------
 meta/recipes-core/udev/eudev/udev-cache.default |  5 --
 meta/recipes-core/udev/eudev_3.2.2.bb           | 20 +------
 4 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/udev-cache
 delete mode 100644 meta/recipes-core/udev/eudev/udev-cache.default

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 0ab028b391..0455ade258 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -14,25 +14,7 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x @UDEVD@ ] || exit 1
-SYSCONF_CACHED="/etc/udev/cache.data"
-SYSCONF_TMP="/dev/shm/udev.cache"
-DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
 
-# A list of files which are used as a criteria to judge whether the udev cache could be reused.
-CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
-[ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
-
-# List of files whose metadata (size/mtime/name) will be included in cached
-# system state.
-META_FILE_LIST="lib/udev/rules.d/* etc/udev/rules.d/*"
-
-# Command to compute system configuration.
-sysconf_cmd () {
-	cat -- $CMP_FILE_LIST
-	stat -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
-}
-
-[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 [ -f /etc/default/rcS ] && . /etc/default/rcS
 
@@ -66,37 +48,6 @@ case "$1" in
     # /var/volatile/tmp directory to be available.
     mkdir -m 1777 -p /var/volatile/tmp
 
-    # Cache handling.
-    if [ "$DEVCACHE" != "" ]; then
-            if [ -e $DEVCACHE ]; then
-		    sysconf_cmd > "$SYSCONF_TMP"
-		    if cmp $SYSCONF_CACHED $SYSCONF_TMP >/dev/null; then
-                            tar xmf $DEVCACHE -C / -m
-                            not_first_boot=1
-                            [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
-                            [ -e $SYSCONF_TMP ] && rm -f "$SYSCONF_TMP"
-                            [ -e "$DEVCACHE_REGEN" ] && rm -f "$DEVCACHE_REGEN"
-                    else
-			    # Output detailed reason why the cached /dev is not used
-			    cat <<EOF
-udev: Not using udev cache because of changes detected in the following files:
-udev:     $CMP_FILE_LIST
-udev:     $META_FILE_LIST
-udev: The udev cache will be regenerated. To identify the detected changes,
-udev: compare the cached sysconf at   $SYSCONF_CACHED
-udev: against the current sysconf at  $SYSCONF_TMP
-EOF
-			    touch "$DEVCACHE_REGEN"
-                    fi
-	    else
-		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
-			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
-			    # otherwise, we do not bother to read files.
-			    touch "$DEVCACHE_REGEN"
-		    fi
-            fi
-    fi
-
     # make_extra_nodes
     kill_udevd > "/dev/null" 2>&1
 
diff --git a/meta/recipes-core/udev/eudev/udev-cache b/meta/recipes-core/udev/eudev/udev-cache
deleted file mode 100644
index dcfff1cb45..0000000000
--- a/meta/recipes-core/udev/eudev/udev-cache
+++ /dev/null
@@ -1,75 +0,0 @@
-#!/bin/sh -e
-
-### BEGIN INIT INFO
-# Provides:          udev-cache
-# Required-Start:    mountall
-# Required-Stop:
-# Default-Start:     S
-# Default-Stop:
-# Short-Description: cache /dev to speedup the udev next boot
-### END INIT INFO
-
-export TZ=/etc/localtime
-
-[ -r /proc/mounts ] || exit 1
-[ -x @UDEVD@ ] || exit 1
-[ -d /sys/class ] || exit 1
-
-[ -f /etc/default/rcS ] && . /etc/default/rcS
-DEVCACHE_TMP="/dev/shm/udev-cache-tmp.tar"
-SYSCONF_CACHED="/etc/udev/cache.data"
-SYSCONF_TMP="/dev/shm/udev.cache"
-DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
-
-# A list of files which are used as a criteria to judge whether the udev cache could be reused.
-CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
-[ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
-
-# List of files whose metadata (size/mtime/name) will be included in cached
-# system state.
-META_FILE_LIST="lib/udev/rules.d/* etc/udev/rules.d/*"
-
-# Command to compute system configuration.
-sysconf_cmd () {
-	cat -- $CMP_FILE_LIST
-	stat -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
-}
-
-[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
-
-if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
-    [ "$VERBOSE" != "no" ] && echo "udev-cache: read-only rootfs, skip generating udev-cache"
-    exit 0
-fi
-
-[ "$DEVCACHE" != "" ] || exit 0
-[ "${VERBOSE}" == "no" ] || echo -n "udev-cache: checking for ${DEVCACHE_REGEN}... "
-if ! [ -e "$DEVCACHE_REGEN" ]; then
-	[ "${VERBOSE}" == "no" ] || echo "not found."
-	exit 0
-fi
-[ "${VERBOSE}" == "no" ] || echo "found."
-echo "Populating dev cache"
-
-err_cleanup () {
-        echo "udev-cache: update failed!"
-        udevadm control --start-exec-queue
-	rm -f -- "$SYSCONF_TMP" "$DEVCACHE_TMP" "$DEVCACHE" "$SYSCONF_CACHED"
-}
-
-(
-	set -e
-	trap 'err_cleanup' EXIT
-	udevadm control --stop-exec-queue
-	sysconf_cmd > "$SYSCONF_TMP"
-	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
-		| xargs tar cf "${DEVCACHE_TMP}"
-	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
-	rm -f "${DEVCACHE_TMP}"
-	mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
-	udevadm control --start-exec-queue
-	rm -f "$DEVCACHE_REGEN"
-	trap - EXIT
-) &
-
-exit 0
diff --git a/meta/recipes-core/udev/eudev/udev-cache.default b/meta/recipes-core/udev/eudev/udev-cache.default
deleted file mode 100644
index a3b732698d..0000000000
--- a/meta/recipes-core/udev/eudev/udev-cache.default
+++ /dev/null
@@ -1,5 +0,0 @@
-# Default for /etc/init.d/udev
-
-# Comment this out to disable device cache
-DEVCACHE="/etc/udev-cache.tar.gz"
-PROBE_PLATFORM_BUS="yes"
diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb b/meta/recipes-core/udev/eudev_3.2.2.bb
index 78fef2c144..47d958bf6b 100644
--- a/meta/recipes-core/udev/eudev_3.2.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.2.bb
@@ -17,8 +17,6 @@ SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz;downloadfilena
            file://local.rules \
            file://permissions.rules \
            file://run.rules \
-           file://udev-cache \
-           file://udev-cache.default \
            file://udev.rules \
 "
 UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
@@ -40,14 +38,7 @@ PACKAGECONFIG[hwdb] = "--enable-hwdb,--disable-hwdb"
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
-	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
 	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
-	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev-cache
-
-	install -d ${D}${sysconfdir}/default
-	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
-
-	touch ${D}${sysconfdir}/udev/cache.data
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
@@ -59,14 +50,10 @@ do_install_append() {
 	rm -f ${D}${base_libdir}/udev/hid2hci
 }
 
-INITSCRIPT_PACKAGES = "eudev udev-cache"
-INITSCRIPT_NAME_eudev = "udev"
-INITSCRIPT_PARAMS_eudev = "start 04 S ."
-INITSCRIPT_NAME_udev-cache = "udev-cache"
-INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
+INITSCRIPT_NAME = "udev"
+INITSCRIPT_PARAMS = "start 04 S ."
 
 PACKAGES =+ "libudev"
-PACKAGES =+ "udev-cache"
 PACKAGES =+ "eudev-hwdb"
 
 
@@ -76,13 +63,10 @@ FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
                    ${includedir}/udev.h ${libdir}/libudev.la \
                    ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 FILES_eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
 
 RDEPENDS_eudev-hwdb += "eudev"
 
-RRECOMMENDS_${PN} += "udev-cache"
-
 RPROVIDES_${PN} = "hotplug udev"
 RPROVIDES_eudev-hwdb += "udev-hwdb"
 
-- 
2.13.0


