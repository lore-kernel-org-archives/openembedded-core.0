Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id AFB786080F
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 11:37:14 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id f93so11548255lfi.2
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 04:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version;
	bh=uax7YqBKdUIfZqLr83lEHckm6LFJAiL2zv5ME3eA5VI=;
	b=kZrAs7xQ32rWcwVybMvV7BoqogyRcfLjGLJJmwRdpwMpwy4FbxxNSsyAB368d/SKjM
	cQjCe38wcPssxxSiyT0YAIRYD1nivUdPozMmBYyVLBjNLLUfiYgSV/UlONTgmLHLb3H2
	v6JceNxmfTJpFZ+Yia3MNXI9FDL6wI3PcRVdKjhsym8DXsePdZyJ8oE+2msUvisL5FED
	EwhRwLuOGZgGMzqtggEHlSnPkC1seMePE7pKu/98mlMFYuFQ6ucHpBZjY1N7n3SjEBMg
	pGKX2mlsRTNSVPW1u2NS/ZBor6cTeIce+To0sYCi+kzkCIDvw0UFhvctjt9Bd+7kkvis
	d9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version;
	bh=uax7YqBKdUIfZqLr83lEHckm6LFJAiL2zv5ME3eA5VI=;
	b=BEjRneMTGhYmdOvstbtSCun6NUHUM9MxDvCPRINtclHizLaKtBAChBw0cNfQv++W6A
	ws9hWr4dir7FEpGD+SLTYQpVZ4o6kJgezB2jgW7TvSLGaYwEULuskAv3On42lgMxrki9
	XEpitH7ELmoN5lSszKINDO946U5rGjN0eL86anhK2rHmV0zWOJ38zi9JmX33nn28hFoh
	ubBEDPcfEudQywahtn4BioQVx3H8KbllML/W6R/3//snHPBcSTjueld7ztmm1BgPWTus
	o9B395e/Rnw1mPOQxePP+GYdvVCjxun+pGXifQm3TBVNvwZUlyz+gFFCQhBVU/1pvuqS
	TB/g==
X-Gm-Message-State: ALyK8tI+NgmR6KuoNS8gZEGdKva4K6wsFiMB3girkhmqmAMUxzCcSxdFwyLjkbpcY8Arhw==
X-Received: by 10.25.212.5 with SMTP id l5mr6045834lfg.73.1468928234399;
	Tue, 19 Jul 2016 04:37:14 -0700 (PDT)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	90sm2924312lfs.7.2016.07.19.04.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jul 2016 04:37:13 -0700 (PDT)
To: Openembedded-core@lists.openembedded.org
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <578E10E8.9070003@mender.io>
Date: Tue, 19 Jul 2016 13:37:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
Subject: Patch: Krogoth systemd network service fails to start on boot
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
X-List-Received-Date: Tue, 19 Jul 2016 11:37:19 -0000
X-Groupsio-MsgNum: 84673
Content-Type: multipart/mixed; boundary="------------010309060300020003040207"

--------------010309060300020003040207
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hey,

on our krogoth build the systemd network service does not start, and it
seems to be because of missing users, which has already been fixed on
master. I've cherry-picked the two patches that fixed the problem for
us. Note that they are not written by me, but by other people on this
list. I hope they can be applied to krogoth.

Regards
Kristian Amlie

--------------010309060300020003040207
Content-Type: text/x-patch;
 name="0001-systemd-Create-missing-sysusers-offline.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-systemd-Create-missing-sysusers-offline.patch"

From 5da020f1b00c5ed003400baa3905843824db0a60 Mon Sep 17 00:00:00 2001
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2016 21:40:21 -0700
Subject: [PATCH 1/2] systemd: Create missing sysusers offline

Some system users which are needed by systemd components were missing
create these users knobbed with relevant packageconfig

(From OE-Core rev: d18957925c6c073b7194e3a233efea24e436f74e)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd36a447d0da53e713d992b17ce86dd31ea63c67)
Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..a2d35f8 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -319,10 +319,16 @@ PACKAGES =+ "\
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN}"
+USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
2.7.4


--------------010309060300020003040207
Content-Type: text/x-patch;
 name="0002-systemd-allow-add-users-as-a-rootfs-postprocess-cmd.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-systemd-allow-add-users-as-a-rootfs-postprocess-cmd.pat";
 filename*1="ch"

From 27f74da024b459e0f8f02184f3e253dc58305cba Mon Sep 17 00:00:00 2001
From: Stephano Cetola <stephano.cetola@linux.intel.com>
Date: Tue, 31 May 2016 13:59:54 -0700
Subject: [PATCH 2/2] systemd: allow add users as a rootfs postprocess cmd

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


--------------010309060300020003040207--
