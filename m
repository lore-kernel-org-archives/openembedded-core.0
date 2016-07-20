Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0F3606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:54:11 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id g62so32140115lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k001OofMIokaHmozHROtwYXaDk6PFrg9o2WxLRyR9BA=;
	b=BHyW39ZXa5HuVqiiWQVWH+o1D/CYAoxqoqYhBDi2+Twk5sL8UruWS4CtqtuWE6CSl4
	Wvkvut0MaTZgfFuFDygYJX8pM1P/l2XT0bkMvou3CfPSK+k2lmqmOKF+LrU4aagNfJV8
	gHgqPH/eW5xpI4KjjUYCNWwXjtKfkWCCnKLovWjYbN5k5SF/eJ0KQD1syXD2P+xR6ofs
	klbi7j9PurDbKDxno6SAkY/QMMJG8ezC6Al/tUkmsAWvu4gIYcUrBNYV7F0FYgsnXj1B
	DqWhurmLi1jZvYNRt61ZroJR9RxSoE8ITSUIUwKI/Bi5A9d/7EyAtOwvkc8KQjikNg+R
	XrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k001OofMIokaHmozHROtwYXaDk6PFrg9o2WxLRyR9BA=;
	b=G8ddssBjh6C5OVfEl4CaaEh7v86O05IEVRPCiVM8fpasyJPd0+XmZF7sEjjxnp2a3Z
	M5hfFLA8T9CSzSJY2pAks/tdP7N3qv+bgEU8K06D7nYppS9VN9hgfKvzqp86IP6rpRrf
	xy1CfdBNiCiO+gYJTgJeLSQxVV0OLCqkdIzp7bTHgF7ds1QEfO8uBj8S+9l2R6x3oaGX
	DWx5oKq6yHxCPnxUvAB/2YPs9qNcUZFv0Dc9T4mJmWUqSqG3pmUOsyjWUkk5e0yjGbxI
	fdtpeBdSmLq7p7RCztlC+KlXbe4aW3AnlxbgagMpkMqQbaKqEJCietguiprQNioKvzp2
	BVzg==
X-Gm-Message-State: ALyK8tLH+6F2rcOIBN9zW+bYAtMjv88SIVoneRaipeLH8a9YqxnegW/GFZU0biUrVwZFpQ==
X-Received: by 10.25.160.15 with SMTP id j15mr7898735lfe.109.1469001251554;
	Wed, 20 Jul 2016 00:54:11 -0700 (PDT)
Received: from localhost.localdomain (cm-84.208.203.118.getinternet.no.
	[84.208.203.118]) by smtp.googlemail.com with ESMTPSA id
	s187sm334770lfd.3.2016.07.20.00.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 00:54:10 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 09:53:41 +0200
Message-Id: <1469001221-26502-3-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH 2/2] systemd: allow add users as a rootfs postprocess cmd
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
X-List-Received-Date: Wed, 20 Jul 2016 07:54:11 -0000

From: Stephano Cetola <stephano.cetola@linux.intel.com>

Adding all the users / groups to systemd is only available for readonly
file systems. This change allows users to add them to read / write file
systems as well by specifying:

ROOTFS_POSTPROCESS_COMMAND += "systemd_create_users"

Also, add "--shell /sbin/nologin" to each user's add params.

[ YOCTO #9497 ]

(From OE-Core rev: 98a4c642444a524f547f5d978a28814d20c12354)

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79be110c1fdfd0affe6a310b96e7107c4549d23c)
Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/classes/rootfs-postcommands.bbclass | 43 +++++++++++++++-----------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 95d28af..db8b551 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -21,7 +21,7 @@ ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_create_users;", "", d)}'
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
@@ -30,7 +30,25 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
 ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 
-
+systemd_create_users () {
+	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
+		[ -e $conffile ] || continue
+		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
+		if [ "$type" = "u" ]; then
+			useradd_params="--shell /sbin/nologin"
+			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
+			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
+			useradd_params="$useradd_params --system $name"
+			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
+		elif [ "$type" = "g" ]; then
+			groupadd_params=""
+			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
+			groupadd_params="$groupadd_params --system $name"
+			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
+		fi
+		done
+	done
+}
 
 #
 # A hook function to support read-only-rootfs IMAGE_FEATURES
@@ -73,27 +91,6 @@ read_only_rootfs_hook () {
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
 	fi
-
-	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
-	    # Update user database files so that services don't fail for a read-only systemd system
-	    for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
-		[ -e $conffile ] || continue
-		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
-		    if [ "$type" = "u" ]; then
-			useradd_params=""
-			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
-			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
-			useradd_params="$useradd_params --system $name"
-			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
-		    elif [ "$type" = "g" ]; then
-			groupadd_params=""
-			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
-			groupadd_params="$groupadd_params --system $name"
-			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
-		    fi
-		done
-	    done
-	fi
 }
 
 #
-- 
2.7.4


