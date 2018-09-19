Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 98E60793DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:08:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2018 01:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,393,1531810800"; d="scan'208";a="264821248"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.255])
	by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2018 01:08:48 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 16:08:46 +0800
Message-Id: <20180919080846.14972-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] initramfs-framework/udev: call settle before kill
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
X-List-Received-Date: Wed, 19 Sep 2018 08:08:48 -0000

When mount command is executed in rootfs module of initrd, eudev creates
a loop0 device node, applies rules and adds a inotify watch to it. Right
after this step, we execute finish which first tries to kill any running
udevd daemon before doing a switch_root.

In some cases, it is possible that switch_root is executed before
inotify_add_watch was actually processed which would lead to errors like:

| inotify_add_watch(6, /dev/loop0, 10) failed: No such file or directory

Make sure that we process all the events in queue before actually trying
to kill udevd to prevent this race.

Fixes [YOCTO #12861]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/udev | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 79c8867823..87551ff4a9 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -6,6 +6,7 @@ udev_shutdown_hook_handler() {
 	status=$1
 	module=$2
 	if [ "$status" = "pre" ] && [ "$module" = "finish" ]; then
+		udevadm settle
 		killall `basename $_UDEV_DAEMON` 2>/dev/null
 	fi
 }
-- 
2.17.1


