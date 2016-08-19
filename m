Return-Path: <net147@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7556276809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 12:51:56 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vy10so3424330pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ojYnQ1pHAxpSa4VXMms1QMAS2xcamIkePgqRYepWSco=;
	b=f5vAfWreXAPJICEMO8X8z4OiHWCj0/k82sNK+/NyPYp61yTZ4JJIuceUtSI2+9cImp
	ojeIg6uGN22yjsewtbpgqfadC3qM8NO7gHtnn/AA1IQD70UqUI0Sn9qhgWvh8q22p44x
	f9TuVMdxLjxakiYRyEmzONNY5oWQDSmNfvE0kBIedRj39pJR4irAW24Brsazkqwzlivc
	EX5jEdBvOsoTc4E6426+A24cdPktMloDSBzmnv9+CpDsMUtdn3zuQEvoxH8/Wt0WAuAL
	e5+GqyncwEhQbVp+edQEqkFK0hpLq+D+1REK6D9tu1xmVWx10b1Efz2kj/sfarHWIJVk
	MR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ojYnQ1pHAxpSa4VXMms1QMAS2xcamIkePgqRYepWSco=;
	b=diPnDuDrYKcpWMSpHzzT9/Yi+JWyRmIU4UpJM4XYRkB39tmGnNrcVjZiEehw2rpjTT
	ZgXDt2klJCzBs3Cipf7fwg9E8eH5NT6o2iUXYQmho3APUT0yT/PRXcE9jp5xhKPMeZNe
	mMajzkqsm24tIZgWuOthSbbUGMpadoz9emsmCXj54UfbXRSDd/Zpwvm2ujejGh0e9Mb5
	2cJ0CbIPdjrq5D4HW9hunGr09fmfAfsjZT8oEoPRUV2WZk4VEtln5i8w6/dWeCDnL6A+
	94nA8BuTLZGJ06XTd9ukCSC978cXEQkgq3In8yAvQEdjcF9J5AHCRMqRSnH6x+gQC1+T
	9Q4A==
X-Gm-Message-State: AEkooutZ40CszYAW1e8d6DRqH/Q1QZOBohd0NyOwJtaajnu3rfWInQjN+uo2W0JXzicBpQ==
X-Received: by 10.66.242.166 with SMTP id wr6mr13420688pac.147.1471611117748; 
	Fri, 19 Aug 2016 05:51:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	fj19sm11520346pab.37.2016.08.19.05.51.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Aug 2016 05:51:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 22:51:12 +1000
Message-Id: <20160819125112.6315-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [krogoth][master][PATCH] image-vm.bbclass: remove old images if RM_OLD_IMAGE is enabled
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
X-List-Received-Date: Fri, 19 Aug 2016 12:52:00 -0000

[YOCTO #10164]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image-vm.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 72f7b4b..bf57e2c 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -105,8 +105,12 @@ build_boot_dd() {
 	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
 
 	cd ${DEPLOY_DIR_IMAGE}
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
-	ln -s ${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
+
+	if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ]; then
+		rm -f $(readlink -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect)
+	fi
+
+	ln -sf ${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
 } 
 
 python do_bootdirectdisk() {
@@ -142,6 +146,11 @@ DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
 run_qemu_img (){
     type="$1"
     qemu-img convert -O $type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.$type
+
+    if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type ]; then
+        rm -f $(readlink -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type)
+    fi
+
     ln -sf ${IMAGE_NAME}.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
 }
 create_vmdk_image () {
-- 
2.9.3


