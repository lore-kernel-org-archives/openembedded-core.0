Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDB9EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:59:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.29750.1686862734717929537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SkHpDrI0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f8d86db375so24253285e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686862733; x=1689454733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykvTx8609hn/SiHdYuJ6N5AN0+E9n5i+7UglOOdTCKI=;
        b=SkHpDrI0Fz7ejqHv1YPx0IXju9SzvEDKJhKRM+2ecgWuS4q826x+N3UWUR+pgpqqEd
         2MlIn02QWzcfR+Qi0mGj9EZA8/sD4YM3FgANnPCkSfjSz+de8Ea0a3KcAVRydWt6eRIC
         ZZNF47hiistZJwkiRNTbnJ5uURBTnYGLX0Fqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862733; x=1689454733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykvTx8609hn/SiHdYuJ6N5AN0+E9n5i+7UglOOdTCKI=;
        b=GMlAVlF+IjAY4YHhfYG7D6oJwTnsfGfn9YUJmpwNK2zSeMFtYjM7ge++9IrM8N2RM4
         1geo3LEOJ9fLevaIhA34Ga2nLfgRqKlkF5xOhIvjNuF/a4qm2UXl3hgfo0EPcUb1Hdrh
         v7j0vKT50cJpLezE9QV+OzOM7dRXDQuartoMiYnrv1Y79a5pV/eBcXVO7qLX+yHBsIcJ
         7fGMnagGzi+RSqT8t/DnE74jSySF8lRmPVUNnD5rxUOtIPk+NJGkjsCrx1WRvcfXBYfQ
         tG0SEvO86GLDucxkPZeH5Uji4GBqBQRjgmw3o/OBVo8IPZuw2b9gwzYxdXJGbZ2FbHMu
         +gLA==
X-Gm-Message-State: AC+VfDwM/6c3RUjkqcFKWDBj0DO17v76tPujbICCSEFHz29wNNTjSGy1
	Yl/J6JA01oQ/cpR8R+yrGy/QYDXdn3fDv1glv+E=
X-Google-Smtp-Source: ACHHUZ7CjvxIbCrMgLDwwxDrMSzyoin10kTPRQjjQQe76WrIHNms3eMvRmcuLX5EevI9xu2j8eSq2Q==
X-Received: by 2002:a7b:c409:0:b0:3f7:16ed:4ca3 with SMTP id k9-20020a7bc409000000b003f716ed4ca3mr308734wmi.1.1686862732444;
        Thu, 15 Jun 2023 13:58:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b814:609:2b03:c353])
        by smtp.gmail.com with ESMTPSA id f19-20020a7bcc13000000b003f8d0308616sm186125wmh.32.2023.06.15.13.58.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:58:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] runqemu/qemu-helper: Drop tunctl
Date: Thu, 15 Jun 2023 21:58:50 +0100
Message-Id: <20230615205851.1476699-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 20:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182874

ip tuntap provides the functionality that we obtained from tunctl. We only
needed tunctl when ifconfig was more available than ip. That isn't the case
now so we can drop tunctl and all the hoops we need to jump through to build
and provide it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oescripts.py     |   4 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb         |   7 +-
 .../qemu/qemu-helper-native_1.0.bb            |   9 +-
 .../qemu/qemu-helper/tunctl.c                 | 158 ------------------
 scripts/runqemu-gen-tapdevs                   |  26 +--
 scripts/runqemu-ifdown                        |  12 +-
 scripts/runqemu-ifup                          |  26 +--
 7 files changed, 17 insertions(+), 225 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-helper/tunctl.c

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 5b0691a9ffb..6deb30beaa8 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -123,8 +123,8 @@ class OEGitproxyTests(OEScriptTests):
 class OeRunNativeTest(OESelftestTestCase):
     def test_oe_run_native(self):
         bitbake("qemu-helper-native -c addto_recipe_sysroot")
-        result = runCmd("oe-run-native qemu-helper-native tunctl -h")
-        self.assertIn("Delete: tunctl -d device-name [-f tun-clone-device]", result.output)
+        result = runCmd("oe-run-native qemu-helper-native qemu-oe-bridge-helper")
+        self.assertIn("No bridge helper found", result.output)
 
 class OEListPackageconfigTests(OEScriptTests):
     #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 2a5bcfb909d..b100659a8c7 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -6,8 +6,7 @@ RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
 
 PR = "r9"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999 \
-                    file://${COREBASE}/scripts/runqemu;beginline=5;endline=10;md5=ac2b489a58739c7628a2604698db5e7f"
+LIC_FILES_CHKSUM = "file://${COREBASE}/scripts/runqemu;beginline=5;endline=10;md5=ac2b489a58739c7628a2604698db5e7f"
 
 
 SRC_URI = "file://${COREBASE}/scripts/runqemu \
@@ -18,7 +17,6 @@ SRC_URI = "file://${COREBASE}/scripts/runqemu \
            file://${COREBASE}/scripts/oe-find-native-sysroot \
            file://${COREBASE}/scripts/runqemu-extract-sdk \
            file://${COREBASE}/scripts/runqemu-export-rootfs \
-           file://tunctl.c \
           "
 
 S = "${WORKDIR}"
@@ -26,12 +24,11 @@ S = "${WORKDIR}"
 inherit nativesdk
 
 do_compile() {
-	${CC} tunctl.c -o tunctl
+	:
 }
 
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}${COREBASE}/scripts/oe-* ${D}${bindir}/
 	install -m 0755 ${WORKDIR}${COREBASE}/scripts/runqemu* ${D}${bindir}/
-	install tunctl ${D}${bindir}/
 }
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 6053b71717d..4d64ea4b93e 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -3,25 +3,20 @@ LICENSE = "GPL-2.0-only"
 RDEPENDS:${PN} = "qemu-system-native"
 PR = "r1"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/qemu-oe-bridge-helper.c;endline=4;md5=ae00a3bab86f2caaa8462eacda77f4d7"
 
-SRC_URI = "\
-    file://tunctl.c \
-    file://qemu-oe-bridge-helper.c \
-    "
+SRC_URI = "file://qemu-oe-bridge-helper.c"
 
 S = "${WORKDIR}"
 
 inherit native
 
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -Wall tunctl.c -o tunctl
 	${CC} ${CFLAGS} ${LDFLAGS} -Wall qemu-oe-bridge-helper.c -o qemu-oe-bridge-helper
 }
 
 do_install() {
 	install -d ${D}${bindir}
-	install tunctl ${D}${bindir}/
 	install qemu-oe-bridge-helper ${D}${bindir}/
 }
 
diff --git a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c b/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
deleted file mode 100644
index d745dd06cb4..00000000000
--- a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
+++ /dev/null
@@ -1,158 +0,0 @@
-/* Copyright 2002 Jeff Dike
- * Licensed under the GPL
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <pwd.h>
-#include <grp.h>
-#include <net/if.h>
-#include <sys/ioctl.h>
-#include <linux/if_tun.h>
-
-/* TUNSETGROUP appeared in 2.6.23 */
-#ifndef TUNSETGROUP
-#define TUNSETGROUP   _IOW('T', 206, int)
-#endif
-
-static void Usage(char *name, int status)
-{
-  fprintf(stderr, "Create: %s [-b] [-u owner] [-g group] [-t device-name] "
-	  "[-f tun-clone-device]\n", name);
-  fprintf(stderr, "Delete: %s -d device-name [-f tun-clone-device]\n\n",
-	  name);
-  fprintf(stderr, "The default tun clone device is /dev/net/tun - some systems"
-	  " use\n/dev/misc/net/tun instead\n\n");
-  fprintf(stderr, "-b will result in brief output (just the device name)\n");
-  exit(status);
-}
-
-int main(int argc, char **argv)
-{
-  struct ifreq ifr;
-  struct passwd *pw;
-  struct group *gr;
-  uid_t owner = -1;
-  gid_t group = -1;
-  int tap_fd, opt, delete = 0, brief = 0;
-  char *tun = "", *file = "/dev/net/tun", *name = argv[0], *end;
-
-  while((opt = getopt(argc, argv, "bd:f:t:u:g:h")) > 0){
-    switch(opt) {
-      case 'b':
-        brief = 1;
-        break;
-      case 'd':
-        delete = 1;
-	tun = optarg;
-        break;
-      case 'f':
-	file = optarg;
-	break;
-      case 'u':
-	pw = getpwnam(optarg);
-	if(pw != NULL){
-	  owner = pw->pw_uid;
-	  break;
-	}
-        owner = strtol(optarg, &end, 0);
-	if(*end != '\0'){
-	  fprintf(stderr, "'%s' is neither a username nor a numeric uid.\n",
-		  optarg);
-	  Usage(name, 1);
-	}
-        break;
-      case 'g':
-	gr = getgrnam(optarg);
-	if(gr != NULL){
-	  group = gr->gr_gid;
-	  break;
-	}
-        group = strtol(optarg, &end, 0);
-	if(*end != '\0'){
-	  fprintf(stderr, "'%s' is neither a groupname nor a numeric group.\n",
-		  optarg);
-	  Usage(name, 1);
-	}
-        break;
-
-      case 't':
-        tun = optarg;
-        break;
-      case 'h':
-        Usage(name, 0);
-        break;
-      default:
-        Usage(name, 1);
-    }
-  }
-
-  argv += optind;
-  argc -= optind;
-
-  if(argc > 0)
-    Usage(name, 1);
-
-  if((tap_fd = open(file, O_RDWR)) < 0){
-    fprintf(stderr, "Failed to open '%s' : ", file);
-    perror("");
-    exit(1);
-  }
-
-  memset(&ifr, 0, sizeof(ifr));
-
-  ifr.ifr_flags = IFF_TAP | IFF_NO_PI;
-  strncpy(ifr.ifr_name, tun, sizeof(ifr.ifr_name) - 1);
-  if(ioctl(tap_fd, TUNSETIFF, (void *) &ifr) < 0){
-    perror("TUNSETIFF");
-    exit(1);
-  }
-
-  if(delete){
-    if(ioctl(tap_fd, TUNSETPERSIST, 0) < 0){
-      perror("disabling TUNSETPERSIST");
-      exit(1);
-    }
-    printf("Set '%s' nonpersistent\n", ifr.ifr_name);
-  }
-  else {
-    /* emulate behaviour prior to TUNSETGROUP */
-    if(owner == -1 && group == -1) {
-      owner = geteuid();
-    }
-
-    if(owner != -1) {
-      if(ioctl(tap_fd, TUNSETOWNER, owner) < 0){
-      	perror("TUNSETOWNER");
-      	exit(1);
-      }
-    }
-    if(group != -1) {
-      if(ioctl(tap_fd, TUNSETGROUP, group) < 0){
-      	perror("TUNSETGROUP");
-      	exit(1);
-      }
-    }
-
-    if(ioctl(tap_fd, TUNSETPERSIST, 1) < 0){
-      perror("enabling TUNSETPERSIST");
-      exit(1);
-    }
-
-    if(brief)
-      printf("%s\n", ifr.ifr_name);
-    else {
-      printf("Set '%s' persistent and owned by", ifr.ifr_name);
-      if(owner != -1)
-          printf(" uid %d", owner);
-      if(group != -1)
-          printf(" gid %d", group);
-      printf("\n");
-    }
-  }
-  return(0);
-}
diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index ffb82adce67..4f8ea979d23 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -1,11 +1,7 @@
 #!/bin/bash
 #
 # Create a "bank" of tap network devices that can be used by the
-# runqemu script. This script needs to be run as root, and will
-# use the tunctl binary from the build system sysroot. Note: many Linux 
-# distros these days still use an older version of tunctl which does not
-# support the group permissions option, hence the need to use the build
-# system provided version.
+# runqemu script. This script needs to be run as root
 #
 # Copyright (C) 2010 Intel Corp.
 #
@@ -62,29 +58,17 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 	exit 1
 fi
 
-TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
-ip_supports_tuntap=false
 if interfaces=`ip tuntap list` 2>/dev/null; then
-	ip_supports_tuntap=true
 	interfaces=`echo "$interfaces |cut -f1 -d:`
-elif [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
-	echo "Error: $TUNCTL is not an executable"
-	usage
-elif interfaces=`ip link` 2>/dev/null; then
-	interfaces=`echo "$interfaces" | sed '/^[0-9]\+: \(docker[0-9]\+\):.*/!d; s//\1/'`
 else
-	echo "Failed to call 'ip link'" >&2
+	echo "Failed to call 'ip tuntap list'" >&2
 	exit 1
 fi
 
 # Ensure we start with a clean slate
 for tap in $interfaces; do
 	echo "Note: Destroying pre-existing tap interface $tap..."
-	if $ip_supports_tuntap; then
-		ip tuntap del $tap mode tap
-	else
-		$TUNCTL -d $tap
-	fi
+	ip tuntap del $tap mode tap
 done
 rm -f /etc/runqemu-nosudo
 
@@ -95,8 +79,8 @@ fi
 echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
 for ((index=0; index < $COUNT; index++)); do
 	echo "Creating tap$index"
-	if ! ifup=`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`; then
-		echo "Error running tunctl: $ifup"
+	if ! ifup=`$RUNQEMU_IFUP $TUID $GID 2>&1`; then
+		echo "Error bringing up interface: $ifup"
 		exit 1
 	fi
 done
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index f72166b32b1..98ac7f07b34 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -1,8 +1,7 @@
 #!/bin/bash
 #
 # QEMU network configuration script to bring down tap devices. This
-# utility needs to be run as root, and will use the tunctl binary
-# from the native sysroot. 
+# utility needs to be run as root, and will use the ip utility
 #
 # If you find yourself calling this script a lot, you can add the
 # the following to your /etc/sudoers file to be able to run this
@@ -34,13 +33,8 @@ TAP=$1
 STAGING_BINDIR_NATIVE=$2
 
 if !ip tuntap del $TAP mode tap 2>/dev/null; then
-	TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
-	if [ ! -e "$TUNCTL" ]; then
-		echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
-		exit 1
-	fi
-
-	$TUNCTL -d $TAP
+	echo "Error: Unable to run up tuntap del"
+	exit 1
 fi
 
 IFCONFIG=`which ip 2> /dev/null`
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 5fdcddeeda0..237bf2a07b8 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -1,10 +1,7 @@
 #!/bin/bash
 #
 # QEMU network interface configuration script. This utility needs to
-# be run as root, and will use the tunctl binary from a native sysroot.
-# Note: many Linux distros these days still use an older version of
-# tunctl which does not support the group permissions option, hence
-# the need to use build system's version.
+# be run as root, and will use the ip utility
 #
 # If you find yourself calling this script a lot, you can add the
 # the following to your /etc/sudoers file to be able to run this
@@ -39,7 +36,6 @@ fi
 
 USERID="-u $1"
 GROUP="-g $2"
-STAGING_BINDIR_NATIVE=$3
 
 if taps=$(ip tuntap list 2>/dev/null); then
 	tap_no=$(( $(echo "$taps" |sort -r |sed 's/^tap//; s/:.*//; q') + 1 ))
@@ -47,24 +43,8 @@ if taps=$(ip tuntap list 2>/dev/null); then
 fi
 
 if [ -z $TAP ]; then
-	TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
-	if [ ! -x "$TUNCTL" ]; then
-		echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
-		exit 1
-	fi
-
-	TAP=`$TUNCTL -b $GROUP 2>&1`
-	STATUS=$?
-	if [ $STATUS -ne 0 ]; then
-	# If tunctl -g fails, try using tunctl -u, for older host kernels
-	# which do not support the TUNSETGROUP ioctl
-		TAP=`$TUNCTL -b $USERID 2>&1`
-		STATUS=$?
-		if [ $STATUS -ne 0 ]; then
-			echo "tunctl failed:"
-			exit 1
-		fi
-	fi
+	echo "Error: Unable to find a tap device to use"
+	exit 1
 fi
 
 IFCONFIG=`which ip 2> /dev/null`
-- 
2.39.2


