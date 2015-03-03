Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF44071708
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 15:46:46 +0000 (UTC)
Received: by ykr79 with SMTP id 79so407945ykr.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 07:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Bfx37TbHSa+8ten8gPG9/DRdMmwxewy9rvIjMXtVr/E=;
	b=hH97Ix64TBfcSMnpmg3etEeQMLl6QFgLsBks8zYwTBglHnDkNWws8nwIPbSq0Yh2uH
	3S4OOhtGuMwav7+6KQwMt4ORhp0NDs5JbDMmkCLlmr6Plw0sXmV4RWoO8omC55QHtfZg
	2MaBCDnh4EFI+TxsTJTv+t06TiDcfDzrxygQNktddErn8VY5RmiXsJI/YvzI1Vyl8Qrc
	M0sPWE+tXm+G1YqeT0lxyd3SdSN7gNIK/g4TBkxgDBAsTR+qlgwO7WWd1XrlZtNDN3Tj
	urKXByI53JqWvd/W4KG7rUDF8Ql0A+AqCy78hd/sMm0b+p9xZ3UBcmLnWh8VXJ87w6NB
	cgzg==
X-Gm-Message-State: ALoCoQmq5E6jys8fpdgvC5aPhFMg2pvVLRh0Vi02S8mPhyLnixU6kiXOnSMvIvUZl16WJG5ZrVbj
X-Received: by 10.236.222.34 with SMTP id s32mr31506442yhp.164.1425397607879; 
	Tue, 03 Mar 2015 07:46:47 -0800 (PST)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id n22sm831796yho.1.2015.03.03.07.46.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Mar 2015 07:46:46 -0800 (PST)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 21:16:22 +0530
Message-Id: <1425397584-5154-3-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: [OE-core Yocto PATCH 2/4] bootimg: Add support to install Image
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
X-List-Received-Date: Tue, 03 Mar 2015 15:46:47 -0000

Add support to install kernel image for aarch64

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---
 meta/classes/bootimg.bbclass |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b1c03ba..a8e0c19 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -66,8 +66,16 @@ populate() {
 	DEST=$1
 	install -d ${DEST}
 
+	SRC_KERNEL_IMAGE=bzImage
+	DEST_KERNEL_IMAGE=vmlinuz
+
+	if [ "${TARGET_ARCH}" = "aarch64" ]; then
+		SRC_KERNEL_IMAGE=Image
+		DEST_KERNEL_IMAGE=Image
+	fi
+
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage ${DEST}/vmlinuz
+	install -m 0644 ${STAGING_KERNEL_DIR}/${SRC_KERNEL_IMAGE} ${DEST}/${DEST_KERNEL_IMAGE}
 	
 	# initrd is made of concatenation of multiple filesystem images
 	if [ -n "${INITRD}" ]; then
-- 
1.7.9.5


