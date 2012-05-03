Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SPzjU-0002W3-Kr
	for openembedded-core@openembedded.org; Thu, 03 May 2012 19:22:24 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1410676wer.6
	for <openembedded-core@openembedded.org>;
	Thu, 03 May 2012 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=hpLQF1gyxoJEvLefGV8a5Z6ETontSGrtE/ILYx2YAA4=;
	b=EZwH1S6OV6uQM2hDy5tJNTnlu+X548COY/uVUKYqsfyPzeUQj6PRCzNWXv6erwYXjb
	HDR/XEFxJgl5C3LTtbNgOF/uudIOYRF52WIlbu97eakZ/t+obF22JaIcPsTRb9uN70PA
	5W94Q17ihkIr5f9yeIERCtRwwMJ1+hm6YFFOVxzqTG/ZLku89aK/ZL2DJk/lLsayV5Jg
	JQ4fHftm14j1fkFdanY1PAThaZEsMcq9JNQ9kRkEOoZZWsETTNy8HooH41CgUt+9IsV4
	8uJE3mqrd7VG6+vqoVVPKfsKRWeHlJxkAgqBmgvTMs6mxwpMWYLEbu/h8lTvQQeYLNEm
	kzSQ==
Received: by 10.180.94.7 with SMTP id cy7mr5936041wib.3.1336065161231;
	Thu, 03 May 2012 10:12:41 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id ff9sm951267wib.2.2012.05.03.10.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:12:38 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SPzZz-0002E6-Ss; Thu, 03 May 2012 19:12:35 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu,  3 May 2012 19:12:34 +0200
Message-Id: <1336065154-8513-6-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 6/6] runqemu: be sh neutral
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
X-List-Received-Date: Thu, 03 May 2012 17:22:24 -0000

Now runs with dash and busybox' ash as well as with bash

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu          |   13 ++++++++-----
 scripts/runqemu-internal |   16 ++++++++--------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 000d93a..305e46a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -91,10 +91,9 @@ process_filename() {
 # Parse command line args without requiring specific ordering. It's a
 # bit more complex, but offers a great user experience.
 KVM_ENABLED="no"
-i=1
-while [ $i -le $# ]; do
-    arg=${!i}
-    case $arg in
+while true; do
+    arg=${1}
+    case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemuppc")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
@@ -152,6 +151,7 @@ while [ $i -le $# ]; do
             KVM_ENABLED="yes"
             KVM_CAPABLE=`grep -q 'vmx\|smx' /proc/cpuinfo && echo 1`
             ;;
+        "") break ;;
         *)
             # A directory name is an nfs rootfs
             if [ -d "$arg" ]; then
@@ -174,7 +174,7 @@ while [ $i -le $# ]; do
             fi
             ;;
     esac
-    i=$((i + 1))
+    shift
 done
 
 if [ ! -c /dev/net/tun ] ; then
@@ -391,6 +391,9 @@ if [ "$libgl" != 'yes' ]; then
     exit 1;
 fi
 
+INTERNAL_SCRIPT="$0-internal"
+if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
 INTERNAL_SCRIPT=`which runqemu-internal`
+fi
 
 . $INTERNAL_SCRIPT
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 1831a09..80a6d3c 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -69,7 +69,7 @@ QEMU_MEMORY="$mem_size"M
 
 # Bug 433: qemuarm cannot use > 256 MB RAM
 if [ "$MACHINE" = "qemuarm" ]; then
-    if [[ -z "$mem_size" || $mem_size -gt 256 ]]; then
+    if [ -z "$mem_size" -o $mem_size -gt 256 ]; then
         echo "WARNING: qemuarm does not support > 256M of RAM."
         echo "Changing QEMU_MEMORY to default of 256M."
         QEMU_MEMORY="256M"
@@ -111,7 +111,7 @@ acquire_lock() {
 
     if [ -e "$lockfile.lock" ]; then
         # Check that the lockfile is not stale
-        ps=`ps -ewwo pid | grep $(cat $lockfile.lock)`
+        ps=`ps -eo pid | grep $(cat $lockfile.lock)`
         if [ -z "$ps" ]; then
             echo "WARNING: Stale lock file detected, deleting $lockfile.lock."
             rm -f $lockfile.lock
@@ -211,8 +211,9 @@ cleanup() {
     stty sane
 }
 
-n1=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-n2=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
+n0=$(echo $TAP | sed 's/tap//')
+n1=$(($n0 * 2 + 1))
+n2=$(($n1 + 1))
 
 KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
 QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
@@ -436,7 +437,7 @@ if [ ! -x "$QEMUBIN" ]; then
     return
 fi
 
-function _quit() {
+do_quit() {
     if [ -n "$PIDFILE" ]; then
         #echo kill `cat $PIDFILE`
         kill `cat $PIDFILE`
@@ -448,7 +449,7 @@ function _quit() {
 DISTCCD=`which distccd 2> /dev/null`
 PIDFILE=""
 
-trap _quit INT TERM QUIT
+trap do_quit INT TERM QUIT
 
 if [ -x "$DISTCCD" ]; then
     echo "Starting distccd..."
@@ -475,7 +476,7 @@ if grep -i ubuntu /etc/lsb-release &> /dev/null
 then
     # precede nvidia's driver on Ubuntu 10
     UBUNTU_MAIN_VERSION=`cat /etc/lsb-release |grep DISTRIB_RELEASE |cut -d=  -f 2| cut -d. -f 1`
-    if [ $UBUNTU_MAIN_VERSION -eq 10 ];
+    if [ "$UBUNTU_MAIN_VERSION" = "10" ];
     then
         GL_PATH=""
         if test -e /usr/lib/libGL.so
@@ -501,4 +502,3 @@ LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -n
 cleanup
 
 trap - INT TERM QUIT
-return
-- 
1.7.10



