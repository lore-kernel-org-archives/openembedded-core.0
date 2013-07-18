Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 276156B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:04:58 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id z11so2926781wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0QAVrl35KAAzYYnLYvoxVOE26fbCFU93FNbh39BxXsQ=;
	b=GdnilHqJb4nORkU+5bqT/TUpRY2+mZju8fhJtzSyMl4ul2FRrSQNdr9pAIPhCj4YtV
	KYSduJ7R8yP5YW2XjLls2M/rNFEMBDVh5mTISoRD/XRS+jtxU5yZJxtjcoHTY9UIM+Kr
	PrqUNd6wBMA9wLrF4UWPN2obyq7phwxj8oKndlMuDVC7SIcfz8Kt+wq4u4hVlmfqswBZ
	GcPhkVF3XtaIAIeUq6mIdxFBmCISNW1f8w66uig2ETXGXqoVLvALhwqxliodQSODlBPa
	dWW/MU1ewf84SJGcI/NzOxL2XUzMeb7xHB+QTOsh/a1n49iwIn3EjnXQrdR44tH88ohp
	9pmg==
X-Received: by 10.180.208.17 with SMTP id ma17mr8243376wic.7.1374156299236;
	Thu, 18 Jul 2013 07:04:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b20sm16805749wiw.4.2013.07.18.07.04.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 07:04:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 14:59:42 +0100
Message-Id: <1374155982-23797-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374155982-23797-1-git-send-email-ross.burton@intel.com>
References: <1374155982-23797-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkGMqZdgM9iFzFyBVSFkIEcIAKdcYcUCIB+2qOpS2HK2G6TsK4PJU8i0padEX/Qng9CvGkF
Subject: [PATCH] initrdscripts: mount / as read-only when live-booting
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
X-List-Received-Date: Thu, 18 Jul 2013 14:04:59 -0000

So that the root filesystem can be fsck'd properly, mount it read only.  Either
initscripts or systemd will re-mount as read-write in early boot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 890c562..c56c79a 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -157,7 +157,7 @@ mount_and_boot() {
     case $union_fs_type in
 	"overlayfs")
 	    mkdir -p /rootfs.ro /rootfs.rw
-	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+	    if ! mount -o ro,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
 		rm -rf /rootfs.ro /rootfs.rw
 		fatal "Could not mount rootfs image"
 	    else
@@ -170,7 +170,7 @@ mount_and_boot() {
 	    ;;
 	"aufs")
 	    mkdir -p /rootfs.ro /rootfs.rw
-	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+	    if ! mount -o ro,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
 		rm -rf /rootfs.ro /rootfs.rw
 		fatal "Could not mount rootfs image"
 	    else
@@ -182,7 +182,7 @@ mount_and_boot() {
 	    fi
 	    ;;
 	"")
-	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+	    if ! mount -o ro,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 		fatal "Could not mount rootfs image"
 	    fi
 	    ;;
-- 
1.7.10.4


