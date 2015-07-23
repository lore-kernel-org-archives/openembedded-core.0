Return-Path: <oscar.andreasson@pelagicore.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 76B0C73217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:52:39 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so3228451pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ztqbxVpllc9IKnjwz65dpvl47fEKNNH2OQomnH8mL90=;
	b=RCJhmjuT1Qbe4pEOGOtAWJz5j6+kqaNiAYO1d1ZGwt6008XZnuLaeyUN3Zngw0aWQM
	8zXe3DRs6AyetKipjOe3iH9Qr9YDWIPJx+XszEA3yfZ8NJh3mbdZ2G05G9hCqITbLXR/
	aeGdN21Bwni7HrmcCINpX/X2S3V7oGhfyb5HFRKjsCX08amHwXp/szPGIihYZI8ZM+/o
	WlIpx9lo0dkKdEmaJg4iDlLeubuzmwrKRH7TecJBK7FvBU6VECgvo67BhIU3GSvL0jSr
	7vJ3r72cx1I+cbEhgv5mfG5H71nYU0MsNzlGX0MBUEHg67DVXgRLd22T3EcXHNAKJjrn
	+e6A==
X-Gm-Message-State: ALoCoQkZJhBTqcq9BPNIjKMSJ1m53TZkS+G8Fh++Enj0hq5KuCAhlj06krZN2c9y6/VkebjHLWA0
X-Received: by 10.70.46.161 with SMTP id w1mr14410514pdm.66.1437691960006;
	Thu, 23 Jul 2015 15:52:40 -0700 (PDT)
Received: from localhost.localdomain ([38.104.105.146])
	by smtp.gmail.com with ESMTPSA id
	of5sm10816055pdb.52.2015.07.23.15.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 15:52:38 -0700 (PDT)
From: Oscar Andreasson <oscar.andreasson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 15:51:44 -0700
Message-Id: <1437691904-27761-1-git-send-email-oscar.andreasson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] mkefidisk.sh: Added function to wait for devices to show up
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
X-List-Received-Date: Thu, 23 Jul 2015 22:52:44 -0000

Call function to wait for device to re-appear after partitioning device,
before formatting the same device.

Signed-off-by: Oscar Andreasson <oscar.andreasson@pelagicore.com>
---
 scripts/contrib/mkefidisk.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 55f72b0..133c5bc 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -83,6 +83,17 @@ debug() {
 	fi
 }
 
+waitfordevice() {
+    counter=0
+    while [ ! -e "$1" ]; do
+        sleep 1
+        counter=$(($counter+1))
+        if [ $counter -ge 10 ]; then
+            die  "Device $1 not showing up, something is probably wrong"
+        fi
+    done
+}
+
 usage() {
 	echo "Usage: $(basename $0) [-v] DEVICE HDDIMG TARGET_DEVICE"
 	echo "       -v: Verbose debug"
@@ -293,6 +304,7 @@ fi
 #
 unmount_device || die "Failed to unmount $DEVICE partitions"
 
+waitfordevice $BOOTFS
 
 #
 # Format $DEVICE partitions
-- 
2.1.4


