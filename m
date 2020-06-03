Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web12.4155.1591213819556606950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 12:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=e0f7nOFx;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 66CBD5C0842;
	Wed,  3 Jun 2020 21:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1591213816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:references; bh=EoM2ZhuLmDCWRh/n0qGhdP2czveNku32+JyB5OM6REM=;
	b=e0f7nOFx9+4b23CXhbFhp2ga5q538poO3lQunRFN8KaOyENj2FNEmF2dspokmWID1ALi6m
	1+MylEzakbxvOt0CfwkMqnXtmFpFF0PoR9zLO5+6YE6FXEy8nCBQSCgInF9qB2gzYZjwkc
	4jks3XR9gE7Y9aNenrj+9DcRB6jKCI8=
From: "Stefan Agner" <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Cc: stefan@agner.ch,
	liu.ming50@gmail.com,
	ricardo@foundries.io,
	alex.kiernan@gmail.com,
	Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] initramfs-framework: check successful mount using mountpoint
Date: Wed,  3 Jun 2020 19:50:11 +0000
Message-Id: <20200603195011.12498-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1

From: Stefan Agner <stefan.agner@toradex.com>

Instead of checking for existence of /dev in the mounted file system use
mountpoint to check if a root file system has been mounted. This allows
to use the rootfs module for OSTree based rootfs as well, where the file
system rootfs does not have any of the regular directories (at least
when using the modern layout).

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
Note that the finish module is checking for existence of /dev again, but
we are not using this module for the OSTree case.

Another alternative to this patch would be to check for lost+found, which
I found a bit ad-hoc as well.

We could also check the exit code of the mount command, but I am not sure
if that is a reliable way. mount(8) documents two exit code which sound
like mount has succeeded (0 and 64, "some mount succeeded"). Also, if we
want to retain the option that a module before the rootfs module mounts
$ROOTFS_DIR, we would still have to use a mountpoint check.

 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 748c9391c0..ee24e82af3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -13,7 +13,7 @@ rootfs_run() {
 	C=0
 	delay=${bootparam_rootdelay:-1}
 	timeout=${bootparam_roottimeout:-5}
-	while [ ! -d $ROOTFS_DIR/dev ]; do
+	while ! mountpoint -q $ROOTFS_DIR; do
 		if [ $(( $C * $delay )) -gt $timeout ]; then
 			fatal "root '$bootparam_root' doesn't exist or does not contain a /dev."
 		fi
@@ -61,7 +61,7 @@ rootfs_run() {
 					flags="$flags -t$bootparam_rootfstype"
 				fi
 				mount $flags $bootparam_root $ROOTFS_DIR
-				if [ -d $ROOTFS_DIR/dev ]; then
+				if mountpoint -q $ROOTFS_DIR; then
 					break
 				else
 					# It is unlikely to change, but keep trying anyway.
-- 
2.17.1

