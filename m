Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 32C66771F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 11:48:46 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f65so27653723wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k001OofMIokaHmozHROtwYXaDk6PFrg9o2WxLRyR9BA=;
	b=SePtvpSWYiUzQPOqA/lTK6OdQn56jebtEX2UwcTKi35nSjYJtB0dSM4gBsSnEZ59mM
	c2ta7gayGLB/1y35NDqq81US0IyeXZ1tV1H80iL4AbSRXFbuh/dbT/gGDMFoL67FCqUp
	be1CzfKfdIFEi1mtqNiFrl13hVKJ8sxxmL2M/ZFrhMo1PFdEgsYUurJDvM7CzzH5X/O2
	PWbGekiYNgS0PetW0vwJk3A4oqvNLFXHZr+9yFAT59I+NOcQPQrgRIPrvSiTwHHopmPn
	ySZvYinKWpivQPu8Wq0HhzVLzSz1BTre59eriolangSLrFWd0D6kn0nMyOPaKczVZqNk
	m8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k001OofMIokaHmozHROtwYXaDk6PFrg9o2WxLRyR9BA=;
	b=NfDdbOpqSWO9/k1Rck2hw+tSEKWw4YnG+k3qhqyxEF61raOXWgkd98ohL36CSvWvUr
	km7d8/IpWJhKijbZVnQjqJJerPZTF4hwvCereWf1hXVJ4J4p95wBQkUkxGYAK4sVdSh0
	va3a96xBDdp3W6VefZjWecFChS3EEzTgNwgww3/BnMV9DVrbkDNBm8axsZruE1IG6pbh
	dv9iqUa1rbRjrMlMNHFXQOx/AJlyS/CLVcAqQCFJEiNafaSqkJFlO/0Ha4Q3G+D1B79N
	tzmspuznhVcqDAiA7k0Uu8LIGsx7OWao3KTLiiaZz6z1SPGo/ccsIsuxlSrLFNSOwvLl
	NOEA==
X-Gm-Message-State: AEkooutwu5P7vAMwTU+hJ/z5RGvDNth0oBZbauu0tLo+24G2Xc/X9GGeCSZos8YSkJRDxw==
X-Received: by 10.25.160.205 with SMTP id j196mr20750860lfe.80.1470743326070; 
	Tue, 09 Aug 2016 04:48:46 -0700 (PDT)
Received: from localhost.localdomain ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	f3sm6554974lff.21.2016.08.09.04.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 04:48:45 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: ross.burton@intel.com
Date: Tue,  9 Aug 2016 13:48:36 +0200
Message-Id: <1470743316-19724-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470743316-19724-1-git-send-email-kristian.amlie@mender.io>
References: <CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
	<1470743316-19724-1-git-send-email-kristian.amlie@mender.io>
Cc: openembedded-core@lists.openembedded.org
Subject: [krogoth] [PATCH 2/2] systemd: allow add users as a rootfs postprocess cmd
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
X-List-Received-Date: Tue, 09 Aug 2016 11:48:47 -0000

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


