Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 921C86B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 15:39:05 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c20so329260226itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QE2xBevGLcCxl/B84krgF9NUede2vf+j171ccuerHxM=;
	b=iZILDQKn5v7Ch+KyeEhsu0X8uGCNyi6fsFfGfyi4k5QbSpiXfQcvADvHuBe+IbkfX4
	vGj/zXJe4TTfGTxBullELnF7o2tdqIPkrhZLXLssAt6f7rc16UWGtkZ/z53HIQCPR9Mr
	GornYI1NyLNTGXtO+UKtJd0cLdlgx3GYAev5FpoQnVDl0ie6hoAE8hImI5F/qCdjjL2X
	Dk01O5nuiJScPMA4kBPDBAV7TIebpPNNfQqnGE8pvGEkwEgFaXAjNz49tq14+s7BxdPn
	8Gs++QA3WJCjzIyFZg83ibPLgjPy6K6WOxBOkO2Y4O1Cspl4YqJS5CaD15DfFxca9ii3
	aO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QE2xBevGLcCxl/B84krgF9NUede2vf+j171ccuerHxM=;
	b=PSkF/HRar6pO4sMUDasOZySnNSfkGHz8yS3NHjv83LkEftSSt0XGPh0XVvMRD/B6G6
	jayBeJCRlSBo7eODMGk6Ux14tc0Ie4pmcW1ZxYr9usgwlE+60pWWU3RvsxEkKWzJ6wcZ
	0PqCbHUzlkvJyMBTnXyDLgUqkbRYruwpsIYOaWDgPfe3xjB+3cRc+2ttaczOqTWGJNnG
	olJgwsy+ZK5Y9V9kTTH89FUuKb6e9BM94xfrvLQFUgggoY/nvIDM5NgvTacdSuRgUFBN
	DZ6m3iMtkhhqYyRh2ugJLeJmGj4dPq/tT/hUrUcf9wmYadwPA/urqc9ihkaQdZ/zXz3i
	EgXw==
X-Gm-Message-State: AIkVDXLyjrbPfFFiqz2mq7AQjeXfSKrWBvA9wI06QnZU1l4RfU0aNlKojHtkcO7KXkhsqko2
X-Received: by 10.36.190.68 with SMTP id i65mr6659793itf.118.1483630745333;
	Thu, 05 Jan 2017 07:39:05 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8FAB5.dip0.t-ipconnect.de.
	[93.232.250.181])
	by smtp.gmail.com with ESMTPSA id 9sm39443103itv.0.2017.01.05.07.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 07:39:04 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 16:38:52 +0100
Message-Id: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/1] rootfs-postcommands.bbclass: sort passwd entries
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
X-List-Received-Date: Thu, 05 Jan 2017 15:39:06 -0000

The /etc passwd files in a rootfs consist of the default entries from
base-passwd plus anything that gets added by preinst scripts or
extrausers.bbclass.

The execution order of preinst scripts is not perfectly deterministic,
or at least unrelated changes caused it to change in a
non-deterministic way, resulting in irrelevant changes in the order of
passwd entries.

Such re-ordering is bad for reproducible builds and file-based update
mechanisms like swupd which work best if changes are as minimal as
possible.

To achieve that, the files get sorted in a post-processing command,
enabled by default. It would be slightly nicer to keep entries from
base-passwd at the beginning of the files, but that's harder to
implement.

The order of the entries should not matter, but in obscure cases where
it does (like having multiple entries for the same numeric ID) this
behavior can be disabled by setting SORT_PASSWD_POSTPROCESS_COMMAND to
an empty string.

Fixes: YOCTO #10520

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 8d48a2d..4ca031f 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -30,6 +30,13 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
 ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 
+# Sort the user and group entries in /etc in order to make the content
+# deterministic. Package installs are not deterministic, causing the ordering
+# of entries to change between builds. In case that this isn't desired,
+# the command can be overridden.
+SORT_PASSWD_POSTPROCESS_COMMAND ??= "sort_passwd; "
+ROOTFS_POSTPROCESS_COMMAND += "${SORT_PASSWD_POSTPROCESS_COMMAND}"
+
 systemd_create_users () {
 	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
 		[ -e $conffile ] || continue
@@ -146,6 +153,19 @@ ssh_disable_dns_lookup () {
 	fi
 }
 
+sort_passwd () {
+	for i in passwd shadow group gshadow; do
+		for suffix in "" "-"; do
+			file="${IMAGE_ROOTFS}/${sysconfdir}/$i$suffix"
+			if [ -f $file ]; then
+				sort $file >$file.tmp
+				cat $file.tmp >$file
+				rm $file.tmp
+			fi
+		done
+	done
+}
+
 #
 # Enable postinst logging if debug-tweaks is enabled
 #
-- 
2.1.4


