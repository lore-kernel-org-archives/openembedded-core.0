Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 220B374E1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 00:16:53 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id f79-v6so4044727oib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 17:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zVcFCFMeLFgBsuNpVca7cZWTKHEIjytwZq+J54qCQX0=;
	b=vOITIdrsmf8mo4SKLE0vCgCeD7jnqLexJ0R6kmXCZuvQpnmZse1A06M4SORDXFHL18
	dd32FmU+wtBnHd6NnOgrp3HnBZxtG/4c3QYxcbIS2KwtmvZKuivnOB8UJOSmdM8dSyUt
	4zTDXXAE74xoS3XM/y/tUgYcIY74yXjPR68dupIlI9h776QJW7NlMNqVHy86FpURB0mL
	d3iq8yDhTe9Azl69XoiOXtTIxiCnNB4sUw4fehhZmEpVwEixqWHboD6c1Nie427E1X+W
	YVqkSY1bsT9mvb3zQE+WriEz0YAN9G25JQAgBNShDOKCqrtqyInw80T4O6HboV7bkxIm
	njXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zVcFCFMeLFgBsuNpVca7cZWTKHEIjytwZq+J54qCQX0=;
	b=sxs4daPY0yuv5khS/FrwYVQSh5R3moE0sj9iIzq1sI2DycRILff8B4SxT5ZGIntR8j
	u5qwqttzaWwiQiHg1Xbiqdil5SslJxnu5Gr+zTHuyhuLgBiAbc/vlI268ku6bLljpV1M
	xnXAubrxDx//h3wKi960kgin20PuyNdCPDA/5DERNvwgP2lCs7Gqk78dJ5YXQG9lv/7O
	cpMcHUn+9Z2bM+z0Y51Cf4SBgnpu5tuhWRiGOssguzv+tFK7FnSKkz4HYusaoGSUoVZw
	1Nux9splnd2dgP7bn3ikbH/iX3bstWChLklLneRrJelEaIhHCRhxp5UgA/JitXpyMpj2
	qb/g==
X-Gm-Message-State: APt69E34DyWZf69AY9NBSBy9aVYtH7eKvJ3VfDrKUUmzZsF+GJQc+Z79
	xhqp39xKy7GxgB2OnvJT2C2ixQ==
X-Google-Smtp-Source: ADUXVKJwK3uMUviaitRFF7l0rEKtL8mvOfr+BIuZTn6KQgRPPw1oYITpXBAhn4iaJyGY45lam0OjXg==
X-Received: by 2002:aca:d0d1:: with SMTP id
	j78-v6mr2830807oiy.276.1527725814822; 
	Wed, 30 May 2018 17:16:54 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i1-v6sm7218461otd.52.2018.05.30.17.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 May 2018 17:16:54 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 17:16:47 -0700
Message-Id: <1527725807-6825-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dropbear: drop run time detection of read-only rootfs
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
X-List-Received-Date: Thu, 31 May 2018 00:16:54 -0000

Previously, when dropbear was started via its init script, relocation
of DROPBEAR_RSAKEY_DIR to support read-only rootfs was handled at
run time from within the init script.

Update the init script to take advantage of the read-only rootfs
config setup by read_only_rootfs_hook() and therefore be consistent
with startup under systemd (where relocation of DROPBEAR_RSAKEY_DIR
is handled by the read_only_rootfs_hook() at build time).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass |  5 +----
 meta/recipes-core/dropbear/dropbear/init | 26 ++++++++------------------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 5522209..221869e 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -112,14 +112,11 @@ read_only_rootfs_hook () {
 
 	# Also tweak the key location for dropbear in the same way.
 	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
-		if [ -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
-			echo "DROPBEAR_RSAKEY_DIR=/etc/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
-		else
+		if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
 			echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
 		fi
 	fi
 
-
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 		# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
diff --git a/meta/recipes-core/dropbear/dropbear/init b/meta/recipes-core/dropbear/dropbear/init
index f6e1c46..ffab7a2 100755
--- a/meta/recipes-core/dropbear/dropbear/init
+++ b/meta/recipes-core/dropbear/dropbear/init
@@ -17,8 +17,11 @@ NAME=dropbear
 DESC="Dropbear SSH server"
 PIDFILE=/var/run/dropbear.pid
 
+# These values may be replaced by those from /etc/default/dropbear
+DROPBEAR_RSAKEY_DIR="/etc/dropbear"
 DROPBEAR_PORT=22
 DROPBEAR_EXTRA_ARGS=
+DROPBEAR_RSAKEY_ARGS=
 NO_START=0
 
 set -e
@@ -28,32 +31,19 @@ test "$NO_START" = "0" || exit 0
 test -x "$DAEMON" || exit 0
 test ! -h /var/service/dropbear || exit 0
 
-readonly_rootfs=0
-for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' </proc/mounts`; do
-  case $flag in
-   ro)
-     readonly_rootfs=1
-     ;;
-  esac
-done
-
-if [ $readonly_rootfs = "1" ]; then
-  mkdir -p /var/lib/dropbear
-  DROPBEAR_RSAKEY_DEFAULT="/var/lib/dropbear/dropbear_rsa_host_key"
-else
-  DROPBEAR_RSAKEY_DEFAULT="/etc/dropbear/dropbear_rsa_host_key"
-fi
-
 test -z "$DROPBEAR_BANNER" || \
   DROPBEAR_EXTRA_ARGS="$DROPBEAR_EXTRA_ARGS -b $DROPBEAR_BANNER"
 test -n "$DROPBEAR_RSAKEY" || \
-  DROPBEAR_RSAKEY=$DROPBEAR_RSAKEY_DEFAULT
+  DROPBEAR_RSAKEY="${DROPBEAR_RSAKEY_DIR}/dropbear_rsa_host_key"
 
 gen_keys() {
     if [ -f "$DROPBEAR_RSAKEY" -a ! -s "$DROPBEAR_RSAKEY" ]; then
         rm $DROPBEAR_RSAKEY || true
     fi
-    test -f $DROPBEAR_RSAKEY || dropbearkey -t rsa -f $DROPBEAR_RSAKEY $DROPBEAR_RSAKEY_ARGS
+    if [ ! -f "$DROPBEAR_RSAKEY" ]; then
+        mkdir -p ${DROPBEAR_RSAKEY%/*}
+        dropbearkey -t rsa -f $DROPBEAR_RSAKEY $DROPBEAR_RSAKEY_ARGS
+    fi
 }
 
 case "$1" in
-- 
1.9.1


