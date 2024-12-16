Return-Path: <walter.schweizer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694BEE77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:46:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.58033.1734360407697984549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 06:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=walter.schweizer@siemens.com header.s=fm2 header.b=jkw49yvv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1328393-202412161446454d089e2eccde0dadea-gpvtfx@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412161446454d089e2eccde0dadea
        for <openembedded-core@lists.openembedded.org>;
        Mon, 16 Dec 2024 15:46:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=walter.schweizer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3tVa7qLJWzf3Hi2CA0Cb1vglKtF6hsCYYwfs3je4ewA=;
 b=jkw49yvvEbg93EUZocofBKewxvJowTYualNAHAuWsT6T3l2dzEbdKgql/eljgEzfn7y/HJ
 R1UMQL9qmNbSpKXFuvSHkfPQQCUjlDzYeMLwbPtt9qa0c0wZXcy6Kp/fiUWB0ABS1egSuldp
 r4SOu6BiuXge77lxzZT9jfWprdbzr0RRqdQlzMwapBeB77fB9d6y+w+lRYfoPlhAAYhSTdrj
 X+/j4aDt6TQR+g5Dc/0UQT1iM5gWFvqoV7b7rqxFW5VdfY+jRowgTnXAWJoiWytBSR8Ozdo+
 UeZI2OkLqM7N5jcHzYHO2JVM0p3zXy49OfRHRAyG89YGC7vpS1Xxq5/Q==;
From: Walter Schweizer <walter.schweizer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Walter Schweizer <walter.schweizer@siemens.com>
Subject: [OE-core][PATCH] feat(initramfs): add UBI support
Date: Mon, 16 Dec 2024 15:46:42 +0100
Message-Id: <20241216144642.131551-1-walter.schweizer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328393:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 14:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208770

Mounting the rootfs failed when it was on UBI.
This patch allows the rootfs to live on UBI.

Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 38e138f618..df0cbfb091 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -33,9 +33,11 @@ rootfs_run() {
 			elif [ "`echo ${bootparam_root} | cut -c1-6`" = "LABEL=" ]; then
 				root_label=`echo $bootparam_root | cut -c7-`
 				bootparam_root="/dev/disk/by-label/$root_label"
+			elif echo "${bootparam_root}" | grep -q '^ubi[0-9]\+:'; then
+				bootparam_rootfstype="ubifs"
 			fi
 
-			if [ -e "$bootparam_root" ]; then
+			if [ -e "$bootparam_root" ] || [ -n "$bootparam_rootfstype" ]; then
 				flags=""
 				if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
 					if [  -n "$bootparam_rootflags" ]; then
@@ -49,6 +51,7 @@ rootfs_run() {
 				if [ -n "$bootparam_rootfstype" ]; then
 					flags="$flags -t$bootparam_rootfstype"
 				fi
+				debug "mount $flags $bootparam_root $ROOTFS_DIR"
 				mount $flags $bootparam_root $ROOTFS_DIR
 				if mountpoint -q $ROOTFS_DIR; then
 					break
-- 
2.34.1


