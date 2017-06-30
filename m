Return-Path: <wei.tee.ng@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1BF278241
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:40:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 00:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,285,1496127600"; d="scan'208";a="1188914004"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2017 00:40:56 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 17:30:17 -0700
Message-Id: <9803f5a3ee81a9579a465ce26b1acd03eed366ee.1498782014.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1498782014.git.wei.tee.ng@intel.com>
References: <cover.1498782014.git.wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH v2 2/3] initramfs-framework: setup-live: detect media and assign rootfs image
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
X-List-Received-Date: Fri, 30 Jun 2017 07:40:54 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

Integrate the featuers in init-live.sh into new scriptlet to handle
boot up live image process using framework method.

This commit include the changes for:
- Create a conditional loop for the bootparam_root variable. If it is
not set, then it will boot from ROOT_IMAGE. Else, it will boot normally
which is not from removable media.

- Gives a standard path to the original boot disk mount which can be
used to. While /media/sda is a good guess, it isn't always right, nor
is it a good assumption that only one boot disk is in the system.

- The current rootfs module has no support for rootfs images, currently
it only support for rootfs partitions for wic image. Therefore, there
is a need to assign the rootfs image for live image.

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 .../initrdscripts/initramfs-framework/setup-live   | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
new file mode 100644
index 0000000..16da34a
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
@@ -0,0 +1,67 @@
+#/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+setup_enabled() {
+	return 0
+}
+
+setup_run() {
+ROOT_IMAGE="rootfs.img"
+ISOLINUX=""
+ROOT_DISK=""
+shelltimeout=30
+
+	if [ -z $bootparam_root ]; then
+		echo "Waiting for removable media..."
+		C=0
+		while true
+		do
+		  for i in `ls /run/media 2>/dev/null`; do
+		      if [ -f /run/media/$i/$ROOT_IMAGE ] ; then
+				found="yes"
+				ROOT_DISK="$i"
+				break
+			  elif [ -f /run/media/$i/isolinux/$ROOT_IMAGE ]; then
+				found="yes"
+				ISOLINUX="isolinux"
+				ROOT_DISK="$i"
+				break
+		      fi
+		  done
+		  if [ "$found" = "yes" ]; then
+		      break;
+		  fi
+		  # don't wait for more than $shelltimeout seconds, if it's set
+		  if [ -n "$shelltimeout" ]; then
+		      echo -n " " $(( $shelltimeout - $C ))
+		      if [ $C -ge $shelltimeout ]; then
+		           echo "..."
+			   echo "Mounted filesystems"
+		           mount | grep media
+		           echo "Available block devices"
+		           cat /proc/partitions
+		           fatal "Cannot find $ROOT_IMAGE file in /run/media/* , dropping to a shell "
+		      fi
+		      C=$(( C + 1 ))
+		  fi
+		  sleep 1
+		done
+
+		# The existing rootfs module has no support for rootfs images. Assign the rootfs image.
+		bootparam_root="/run/media/$ROOT_DISK/$ISOLINUX/$ROOT_IMAGE"
+	else
+		break
+	fi
+
+	if [ "$bootparam_LABEL" != "boot" -a -f /init.d/$bootparam_LABEL.sh ] ; then
+		if [ -f /run/media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
+		    ./init.d/$bootparam_LABEL.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode $console_params
+		else
+		    fatal "Could not find $bootparam_LABEL script"
+		fi
+
+		# If we're getting here, we failed...
+		fatal "Target $bootparam_LABEL failed"
+	fi
+}
-- 
2.7.4


