Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0IOe-0004hr-Su
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 19:58:09 +0100
Received: by iwn10 with SMTP id 10so3195850iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=p/4AqCHA1Ral2QmJ5lYelmQJLZQ4vDsvVRskueD6DJo=;
	b=J8P8+hxBq8anfpzdmLms7q05xfZga7SX6sS40GcKlv8gB+LkPQeF3aRCNr2Lrf1+8/
	lNtHKBflEhlXIq1w8bBMai3QHa6gLWrpy80TOAAhwX86RFn5mR9P34bJoTRFX6RhEQaS
	ZGsbXBL0Ru4EzjfbgzkY71WSL50LgTyw1thuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eUSF9Xdpo1JYidOxvvqMQ/+KtsGGDoQzNS1XlxJSD7WLzCZClK1mGHmlGONAKP/dSG
	J56sVU+L5hCtQw/ool77hjb2e+6HEZOjaqqJbKUDbnbM60Tw53kCkwYyYS7+5pTO7QOb
	TS7Yg1NcN31iS2WcNtpm2W4kh/DBAmzr8zmkA=
Received: by 10.43.48.135 with SMTP id uw7mr265872icb.169.1300387975318;
	Thu, 17 Mar 2011 11:52:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d10sm778876ibb.34.2011.03.17.11.52.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 11:52:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:52:50 -0700
Message-Id: <fdbcef8a9a1668aba5d9e4e071f0745e2c2b8014.1300387701.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300387701.git.raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] scripts/poky-qemu-internal: Pass -m <mem_size> always on commandline
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
X-List-Received-Date: Thu, 17 Mar 2011 18:58:09 -0000

There is a nasty bug in qemu 0.14.0 where it over writes device memory
if the default sizes was not specified on commandline. It can be
worked around by this patch.

I also simplified the memory size calculation logic a bit so we append
'M' to QEMU_MEMORY at the very end instead of sed'ing it afterwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/poky-qemu-internal |   32 +++++++++++++++++---------------
 1 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
index 046e2b6..5ea30e8 100755
--- a/scripts/poky-qemu-internal
+++ b/scripts/poky-qemu-internal
@@ -40,40 +40,36 @@ mem_set=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-m[[:space:]] *[0-9]*\)'`
 if [ ! -z "$mem_set" ] ; then
 #Get memory setting size from user input
   mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
-fi
-
-if [ $mem_size -gt 0 ]; then
-  QEMU_MEMORY="$mem_size"M
-fi
-
-if [ -z "$QEMU_MEMORY" ]; then
+else
     case "$MACHINE" in
         "qemux86")
-            QEMU_MEMORY="128M"
+            mem_size=128
             ;;
         "qemux86-64")
-            QEMU_MEMORY="128M"
+            mem_size=128
             ;;
         "qemuarm")
-            QEMU_MEMORY="128M"
+            mem_size=128
             ;;
         "qemumips")
-            QEMU_MEMORY="128M"
+            mem_size=128
             ;;
         "qemuppc")
-            QEMU_MEMORY="128M"
+            mem_size=128
             ;;
         *)
-            QEMU_MEMORY="64M"
+            mem_size=64
             ;;
     esac
 
 fi
 
+# QEMU_MEMORY has 'M' appended to mem_size
+QEMU_MEMORY="$mem_size"M
+
 # Bug 433: qemuarm cannot use > 128 MB RAM
 if [ "$MACHINE" = "qemuarm" ]; then
-    RAM=`echo $QEMU_MEMORY | sed 's/M$//'`
-    if [[ -z "$RAM" || $RAM -gt 128 ]]; then
+    if [[ -z "$mem_size" || $mem_size -gt 128 ]]; then
         echo "WARNING: qemuarm does not support > 128M of RAM."
         echo "*** Changing QEMU_MEMORY to default of 128M ***"
         QEMU_MEMORY="128M"
@@ -81,6 +77,12 @@ if [ "$MACHINE" = "qemuarm" ]; then
     fi
 fi
 
+# We need to specify -m <mem_size> to overcome a bug in qemu 0.14.0
+# https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/584480
+
+if [ -z "$mem_set" ] ; then
+  SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -m $mem_size"
+fi
 # This file is created when poky-gen-tapdevs creates a bank of tap
 # devices, indicating that the user should not bring up new ones using
 # sudo.
-- 
1.7.4.1



