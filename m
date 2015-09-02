Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB1077032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:33 +0000 (UTC)
Received: by igbut12 with SMTP id ut12so17224347igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uXyBsdJzO+bgF/bwI41aeFvP3DH2ySmO3xPuYDdIXwM=;
	b=Hj5NLdf7OkFmVFQZm6pM5U7Tn9+jAveLWXHE90s7B6wAaj2hm22jWIR/HwNS2QuEBs
	Un577RaYSryMN9Kpp/8NaZoYuNDKfMLT2KCmwtxsyLzLNSve4iqmCeZzLboq7jn32DVs
	t9ZfHaWUUKtmpPCqtQ1pIvUgpBZPGngWwdpp0pGUvz1OOebusPEtgatnkbsJtw62Xcmw
	WjokKWYOOhCLuDCWXuOH53iu6i3jODRun5BlhQvWfhKfsfsBuYrhG+ijboALu9rM3li1
	l6B5cS6gJmB2EvtaiyAQaIT7Y4+lia7Em8ozkDuWi3yqcOdDPWa0ZvMEo8m4Hktl0pMn
	lmvw==
X-Gm-Message-State: ALoCoQl/keIOlomeLdTFZy4uaQeU2WMD8nr3tikL6mL2zMwrYg4RZZYzuP2dba4PIACfBCI0lXo0
X-Received: by 10.50.13.100 with SMTP id g4mr3946424igc.62.1441208914149;
	Wed, 02 Sep 2015 08:48:34 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:33 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:41 +0200
Message-Id: <784e52fcd898a07a12236058026fd48d0e01c8b7.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 05/10] initramfs-framework: support mounting rootfs in modules
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:34 -0000

The "finish" script always expected to mount the rootfs itself if the
"root" parameter was set. Now it checks first whether the rootfs
directory is still empty (using /dev as indicator, because that was
already expected to be present in a supported rootfs) and skips that
step if non-empty.

This allows modules to implement their own rootfs handling.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../initrdscripts/initramfs-framework/finish       | 33 +++++++++++++---------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 325f47b..fa566b1 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -8,23 +8,28 @@ finish_enabled() {
 
 finish_run() {
 	if [ -n "$ROOTFS_DIR" ]; then
-		if [ -n "$bootparam_rootdelay" ]; then
-			debug "Sleeping for $rootdelay second(s) to wait root to settle..."
-			sleep $bootparam_rootdelay
-		fi
+		# If $ROOTFS_DIR is non-empty, then some other module has already found
+		# the rootfs. We check for /dev because that was already expected to be
+		# in the rootfs.
+		if [ ! -d $ROOTFS_DIR/dev ]; then
+			if [ -n "$bootparam_rootdelay" ]; then
+				debug "Sleeping for $rootdelay second(s) to wait root to settle..."
+				sleep $bootparam_rootdelay
+			fi
 
-		if [ -n "$bootparam_root" ]; then
-			debug "No e2fs compatible filesystem has been mounted, mounting $bootparam_root..."
+			if [ -n "$bootparam_root" ]; then
+				debug "No e2fs compatible filesystem has been mounted, mounting $bootparam_root..."
 
-			if [ "`echo ${bootparam_root} | cut -c1-5`" = "UUID=" ]; then
-				root_uuid=`echo $bootparam_root | cut -c6-`
-				bootparam_root="/dev/disk/by-uuid/$root_uuid"
-			fi
+				if [ "`echo ${bootparam_root} | cut -c1-5`" = "UUID=" ]; then
+					root_uuid=`echo $bootparam_root | cut -c6-`
+					bootparam_root="/dev/disk/by-uuid/$root_uuid"
+				fi
 
-			if [ -e "$bootparam_root" ]; then
-				mount $bootparam_root $ROOTFS_DIR
-			else
-				debug "root '$bootparam_root' doesn't exist."
+				if [ -e "$bootparam_root" ]; then
+					mount $bootparam_root $ROOTFS_DIR
+				else
+					debug "root '$bootparam_root' doesn't exist."
+				fi
 			fi
 		fi
 
-- 
2.1.4


