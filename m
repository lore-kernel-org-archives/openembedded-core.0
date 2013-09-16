Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id EC9A661579
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 14:19:40 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so3754381wes.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 07:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VtMA+9wiN1Rl03SKjnQwjieNWH+k2HeU9fiBBQTFeQU=;
	b=gaXBafQlmC4jGBOfgwVhuqirBorZ0YQMuT9tlnY0VQTlOHcOjoAPg8RTcdUb2uqKVe
	u0XSWbV3RzlhxGFStszMLuMa8MMeWPxJ1F8bltigVIZ/qTLApZgbvL9+OcDjouBgAupK
	yvjAB5KvYWsL/UBp2u9DMji8N9yVNRHFwPeWohTLxYQl8mBQsrkQsEukay0YH7e7B1TR
	Wix+tM1zph4UIXr+BjieeoUFgsE99mBEkde/zQsgUxo0YSFQTB+MKmhBfWdTLAZ3Zsbd
	fH2qt7nxqW6jc8neSCpv7Erk6lip/6ySl4fq3RoGIgwestDMN1QPsh7s4Cmrk/s0vEm8
	YsbA==
X-Gm-Message-State: ALoCoQkdD8EILT9/PDArQUJ/KmEoDoWAm1CGqOzrGjrtSBNDnzKG1BtR228rWUo1FSU7grt3N3NK
X-Received: by 10.180.231.6 with SMTP id tc6mr13728271wic.59.1379341182114;
	Mon, 16 Sep 2013 07:19:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fz8sm23945496wic.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 07:19:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 15:19:33 +0100
Message-Id: <1379341173-31921-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] Revert "initrdscripts: look for new systemd-udevd location"
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
X-List-Received-Date: Mon, 16 Sep 2013 14:19:41 -0000

systemd-udevd is back in /lib, so revert this change.

This reverts commit 27bb516be433ed9dcde6fe4a17d2429951a010a0.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh       |    2 +-
 meta/recipes-core/initrdscripts/initramfs-framework/udev |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index df0076d..3f5fde8 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -11,7 +11,7 @@ ISOLINUX=""
 # Copied from initramfs-framework. The core of this script probably should be
 # turned into initramfs-framework modules to reduce duplication.
 udev_daemon() {
-	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd"
+	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
 
 	for o in $OPTIONS; do
 		if [ -x "$o" ]; then
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 18d44a5..bb462dc 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -11,7 +11,7 @@ udev_shutdown_hook_handler() {
 }
 
 udev_daemon() {
-	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd"
+	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
 
 	for o in $OPTIONS; do
 		if [ -x "$o" ]; then
-- 
1.7.10.4


