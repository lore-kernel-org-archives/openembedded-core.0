Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.16421.1623585061224840377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id B5A8038C13C0
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.40 FAILED
Message-ID: <MADEUP.16882202DCE70C61.30228@lists.openembedded.org>
X-Groupsio-MsgNum: 152885
Content-Type: multipart/mixed; boundary="===============5870695207618471729=="

--===============5870695207618471729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *connman* to *1.40* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-connman-upgrade-1.39-1.40.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5870695207618471729==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-connman-upgrade-1.39-1.40.patch"

From 710a3ce7d80ba03a35c7dd77badbeee7420cdce3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 06:49:40 +0000
Subject: [PATCH] connman: upgrade 1.39 -> 1.40

---
 ...ve-musl-does-not-implement-res_ninit.patch | 10 +--
 .../connman/connman/connman                   | 83 -------------------
 .../{connman_1.39.bb => connman_1.40.bb}      |  4 +-
 3 files changed, 7 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/connman
 rename meta/recipes-connectivity/connman/{connman_1.39.bb => connman_1.40.bb} (74%)

diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 942b9c97b6..3292e908bb 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From c7734e1547db967eccf242fe4b9e8a30b9ff141c Mon Sep 17 00:00:00 2001
+From c77c3728839210cdd61e1ff73afcdb221e1ced56 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] resolve: musl does not implement res_ninit
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+), 21 deletions(-)
 
 diff --git a/gweb/gresolv.c b/gweb/gresolv.c
-index 38a554e..a9e8740 100644
+index 954e7cf..2a9bc51 100644
 --- a/gweb/gresolv.c
 +++ b/gweb/gresolv.c
 @@ -36,6 +36,7 @@
@@ -26,7 +26,7 @@ index 38a554e..a9e8740 100644
  
  #include "gresolv.h"
  
-@@ -877,8 +878,6 @@ GResolv *g_resolv_new(int index)
+@@ -878,8 +879,6 @@ GResolv *g_resolv_new(int index)
  	resolv->index = index;
  	resolv->nameserver_list = NULL;
  
@@ -35,7 +35,7 @@ index 38a554e..a9e8740 100644
  	return resolv;
  }
  
-@@ -918,8 +917,6 @@ void g_resolv_unref(GResolv *resolv)
+@@ -919,8 +918,6 @@ void g_resolv_unref(GResolv *resolv)
  
  	flush_nameservers(resolv);
  
@@ -44,7 +44,7 @@ index 38a554e..a9e8740 100644
  	g_free(resolv);
  }
  
-@@ -1022,24 +1019,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
+@@ -1023,24 +1020,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
  	debug(resolv, "hostname %s", hostname);
  
  	if (!resolv->nameserver_list) {
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
deleted file mode 100644
index c64fa0d715..0000000000
--- a/meta/recipes-connectivity/connman/connman/connman
+++ /dev/null
@@ -1,83 +0,0 @@
-#!/bin/sh
-
-DAEMON=/usr/sbin/connmand
-PIDFILE=/var/run/connmand.pid
-DESC="Connection Manager"
-
-if [ -f /etc/default/connman ] ; then
-	. /etc/default/connman
-fi
-
-set -e
-
-nfsroot=0
-
-exec 9<&0 < /proc/mounts
-while read dev mtpt fstype rest; do
-	if test $mtpt = "/" ; then
-		case $fstype in
-		    nfs | nfs4)
-			nfsroot=1
-			break
-			;;
-		    *)
-			;;
-		esac
-	fi
-done
-
-do_start() {
-	EXTRA_PARAM=""
-	if test $nfsroot -eq 1 ; then
-	    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
-	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
-
-	    if [ ! -z "$NET_ADDR" ]; then
-		if [ "$NET_ADDR" = dhcp ]; then
-		    ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
-		    if [ ! -z "$ethn" ]; then
-			EXTRA_PARAM="-I $ethn"
-		    fi
-		else
-		    for i in $NET_DEVS; do
-			ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
-			if [ "$NET_ADDR" = "$ADDR" ]; then
-			    EXTRA_PARAM="-I $i"
-			    break
-			fi
-		    done
-		fi
-	    fi
-	fi
-	if [ -f @DATADIR@/connman/wired-setup ] ; then
-		. @DATADIR@/connman/wired-setup
-	fi
-	$DAEMON $EXTRA_PARAM
-}
-
-do_stop() {
-	start-stop-daemon --stop --name connmand --quiet
-}
-
-case "$1" in
-  start)
-	echo "Starting $DESC"
-	do_start
-	;;
-  stop)
-	echo "Stopping $DESC"
-	do_stop
-	;;
-  restart|force-reload)
-	echo "Restarting $DESC"
-	do_stop
-	sleep 1
-	do_start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta/recipes-connectivity/connman/connman_1.39.bb b/meta/recipes-connectivity/connman/connman_1.40.bb
similarity index 74%
rename from meta/recipes-connectivity/connman/connman_1.39.bb
rename to meta/recipes-connectivity/connman/connman_1.40.bb
index df42e9ffb8..b888d47866 100644
--- a/meta/recipes-connectivity/connman/connman_1.39.bb
+++ b/meta/recipes-connectivity/connman/connman_1.40.bb
@@ -3,13 +3,13 @@ require connman.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
-           file://connman \
            file://no-version-scripts.patch \
+           file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
+SRC_URI[sha256sum] = "1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.17.1


--===============5870695207618471729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1454 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (816 cached, 1 parsed). 1454 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-e421ba03a21d276dd4b7e2148d9ed8be558f1258"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e421ba03a21d276dd4b7e2148d9ed8be558f1258"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Network 0 Missed 7 Current 909 (41% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2064 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_fetch)
NOTE: recipe connman-1.40-r0: task do_fetch: Started
NOTE: recipe connman-1.40-r0: task do_fetch: Succeeded
NOTE: Running task 2551 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_unpack)
NOTE: Running task 2552 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe connman-1.40-r0: task do_unpack: Started
NOTE: recipe connman-1.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe connman-1.40-r0: task do_unpack: Succeeded
NOTE: Running task 2815 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_patch)
NOTE: recipe connman-1.40-r0: task do_patch: Started
NOTE: recipe connman-1.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe connman-1.40-r0: task do_patch: Succeeded
NOTE: Running task 2816 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2817 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_populate_lic)
NOTE: recipe connman-1.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe connman-1.40-r0: task do_populate_lic: Started
NOTE: recipe connman-1.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe connman-1.40-r0: task do_populate_lic: Succeeded
NOTE: Running task 2818 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_configure)
NOTE: recipe connman-1.40-r0: task do_configure: Started
NOTE: recipe connman-1.40-r0: task do_configure: Succeeded
NOTE: Running task 2819 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_compile)
NOTE: recipe connman-1.40-r0: task do_compile: Started
NOTE: recipe connman-1.40-r0: task do_compile: Succeeded
NOTE: Running task 2820 of 2826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_install)
NOTE: recipe connman-1.40-r0: task do_install: Started
ERROR: connman-1.40-r0 do_install: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/temp/run.do_install.39122' failed with exit code 1:
make --no-print-directory install-am
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/dbus-1/system.d'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
  ./i686-poky-linux-libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c client/connmanctl '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man1'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man8'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man5'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/etc/tmpfiles.d/'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/pkgconfig'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 src/connman.conf '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/dbus-1/system.d'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/connman/scripts'
  ./i686-poky-linux-libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand src/connmand-wait-online '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/lib/systemd/system/'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 include/version.h '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../connman-1.40/include/log.h ../connman-1.40/include/plugin.h ../connman-1.40/include/notifier.h ../connman-1.40/include/service.h ../connman-1.40/include/resolver.h ../connman-1.40/include/ipconfig.h ../connman-1.40/include/device.h ../connman-1.40/include/network.h ../connman-1.40/include/inet.h ../connman-1.40/include/storage.h ../connman-1.40/include/provision.h ../connman-1.40/include/session.h ../connman-1.40/include/ipaddress.h ../connman-1.40/include/agent.h ../connman-1.40/include/inotify.h ../connman-1.40/include/peer.h ../connman-1.40/include/machine.h ../connman-1.40/include/acd.h ../connman-1.40/include/tethering.h '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 scripts/connman_resolvconf.conf '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/etc/tmpfiles.d/'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 connman.pc '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/pkgconfig'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 src/connman.service src/connman-wait-online.service '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/lib/systemd/system/'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connman.8 doc/connman-vpn.8 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man8'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connmanctl.1 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man1'
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connman.conf.5 doc/connman-service.config.5 doc/connman-vpn.conf.5 doc/connman-vpn-provider.config.5 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man5'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c client/connmanctl /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin/connmanctl
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin/connmand
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand-wait-online /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin/connmand-wait-online
install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/connman': No such file or directory
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/temp/log.do_install.39122
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ppp/ppp_2.4.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-syst
 emctl-native.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscrip
 ts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_popu
 late_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pkgconfig-native', 'patch-native', 'readline', 'libtool-cross', 'ppp', 'glib-2.0', 'pseudo-native', 'systemd-systemctl-native', 'autoconf-native', 'ofono', 'dbus', 'wpa-supplicant', 'xz-native', 'quilt-native', 'gcc-runtime', 'initscripts', 'glibc', 'gnutls', 'update-rc.d', 'automake-native', 'opkg-utils', 'gcc-cross-i686', 'libtool-native', 'iptables', 'bluez5', 'attr-native', 'ncurses', 'binutils-cross-i686', 'texinfo-dummy-native', 'openssl', 'libxcrypt', 'libpcap', 'libffi', 'libpcre', 'util-linux', 'zlib', 'bash-completion', 'gnu-config-native', 'm4-native', 'mobile-broadband-provider-info', 'systemd', 'ell', 'libnl', 'gettext-minimal-native', 'libgcc', 'linux-libc-headers', 'gmp', 'libidn2', 'nettle', 'libunistring', 'libseccomp', 'gmp-native', 'libmpc-native', 'zlib-native', 'flex-native', 'mpfr-native', 'base-passwd', 'libx11', 'shadow', 'autoconf-archive', 'shadow-sysroot', 'base-files', 'shadow-native', 'expat', 'libsm', 'lib
 ical', 'bzip2', 'libcap-ng', 'libpam', 'util-linux-libuuid', 'libxkbcommon', 'acl', 'xz', 'kmod', 'libcap', 'libcheck', 'xorgproto', 'libxcb', 'util-macros', 'xtrans', 'attr', 'libice', 'icu', 'libxml2', 'flex', 'cracklib', 'wayland', 'wayland-protocols', 'xkeyboard-config', 'libxau', 'libpthread-stubs', 'xcb-proto', 'libxdmcp', 'python3', 'unzip-native', 'gdbm', 'sqlite3', 'libnsl2', 'libtirpc']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 48 DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image install
| make --no-print-directory install-am
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/dbus-1/system.d'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|   ./i686-poky-linux-libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c client/connmanctl '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man1'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man8'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man5'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/etc/tmpfiles.d/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/pkgconfig'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 src/connman.conf '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/dbus-1/system.d'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/connman/scripts'
|   ./i686-poky-linux-libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand src/connmand-wait-online '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/lib/systemd/system/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 include/version.h '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../connman-1.40/include/log.h ../connman-1.40/include/plugin.h ../connman-1.40/include/notifier.h ../connman-1.40/include/service.h ../connman-1.40/include/resolver.h ../connman-1.40/include/ipconfig.h ../connman-1.40/include/device.h ../connman-1.40/include/network.h ../connman-1.40/include/inet.h ../connman-1.40/include/storage.h ../connman-1.40/include/provision.h ../connman-1.40/include/session.h ../connman-1.40/include/ipaddress.h ../connman-1.40/include/agent.h ../connman-1.40/include/inotify.h ../connman-1.40/include/peer.h ../connman-1.40/include/machine.h ../connman-1.40/include/acd.h ../connman-1.40/include/tethering.h '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 scripts/connman_resolvconf.conf '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/etc/tmpfiles.d/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 connman.pc '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/pkgconfig'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 src/connman.service src/connman-wait-online.service '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/lib/systemd/system/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connman.8 doc/connman-vpn.8 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man8'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connmanctl.1 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man1'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connman.conf.5 doc/connman-service.config.5 doc/connman-vpn.conf.5 doc/connman-vpn-provider.config.5 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man5'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c client/connmanctl /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin/connmanctl
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin/connmand
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand-wait-online /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin/connmand-wait-online
| install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/connman': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/temp/run.do_install.39122' failed with exit code 1:
| make --no-print-directory install-am
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/dbus-1/system.d'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|   ./i686-poky-linux-libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c client/connmanctl '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man1'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man8'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man5'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/etc/tmpfiles.d/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/pkgconfig'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 src/connman.conf '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/dbus-1/system.d'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/connman/scripts'
|   ./i686-poky-linux-libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand src/connmand-wait-online '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/lib/systemd/system/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 include/version.h '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../connman-1.40/include/log.h ../connman-1.40/include/plugin.h ../connman-1.40/include/notifier.h ../connman-1.40/include/service.h ../connman-1.40/include/resolver.h ../connman-1.40/include/ipconfig.h ../connman-1.40/include/device.h ../connman-1.40/include/network.h ../connman-1.40/include/inet.h ../connman-1.40/include/storage.h ../connman-1.40/include/provision.h ../connman-1.40/include/session.h ../connman-1.40/include/ipaddress.h ../connman-1.40/include/agent.h ../connman-1.40/include/inotify.h ../connman-1.40/include/peer.h ../connman-1.40/include/machine.h ../connman-1.40/include/acd.h ../connman-1.40/include/tethering.h '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/include/connman'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 scripts/connman_resolvconf.conf '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/etc/tmpfiles.d/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 connman.pc '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/lib/pkgconfig'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 src/connman.service src/connman-wait-online.service '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/lib/systemd/system/'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connman.8 doc/connman-vpn.8 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man8'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connmanctl.1 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man1'
|  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 doc/connman.conf.5 doc/connman-service.config.5 doc/connman-vpn.conf.5 doc/connman-vpn-provider.config.5 '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/share/man/man5'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c client/connmanctl /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/bin/connmanctl
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin/connmand
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c src/connmand-wait-online /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/image/usr/sbin/connmand-wait-online
| install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/connman/1.40-r0/connman': No such file or directory
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe connman-1.40-r0: task do_install: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2820 tasks of which 2811 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/connman/connman_1.40.bb:do_install
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5870695207618471729==--
