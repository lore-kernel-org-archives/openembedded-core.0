Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6657.1624355465315229946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: K3FpQtpiPvXt373Q1uoQyfPaaOL0b8maHLfrf+n2Y5mWkNcA1JmlHDCbZgWAV/W3SfDVntwT2R
 nIKsYHIXpmyg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014103"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014103"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:11 -0700
IronPort-SDR: 4zT1XC+luPzR4HBZ7T8oEjrx529Jt4W72Fz2marNhH8YCI98At8RHEdkAmtPOsRsLSebFAkzKI
 JzZmq1ZbcRcA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260090"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/13] kernel.bbclass: fix do_sizecheck() comparison
Date: Tue, 22 Jun 2021 17:50:32 +0800
Message-Id: <61feebd88960eb4e074a80a0e45b36a7a1db869c.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrea Adami <andrea.adami@gmail.com>

The routine do_sizecheck() was historically needed by legacy
devices with limited flash memory.
The lowest extreme is probably with Zaurus collie having exactly
1024*1024 = 1048576 bytes for the kernel partition.

In the years the KERNEL_IMAGE_MAXSIZE has been converted to kilobytes
thus rounded so we have now KERNEL_IMAGE_MAXSIZE_collie = "1024".

The effect is that now the check fails because we hit curiously this
 | WARNING: This kernel zImage (size=1024(K) > 1024(K)) is too big for...
even though zImage is 1047288 bytes (kernel + kexecboot-klibc-initramfs).

Fix this case using test -gt (greater) instead of -ge (greater or equal).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 254ca956d63b4ce6aa294213b60bb943f9f3a9e6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8693ab86be..379bed44f2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -714,7 +714,7 @@ do_sizecheck() {
 		at_least_one_fits=
 		for imageType in ${KERNEL_IMAGETYPES} ; do
 			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$imageType | awk '{print $1}'`
-			if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+			if [ $size -gt ${KERNEL_IMAGE_MAXSIZE} ]; then
 				bbwarn "This kernel $imageType (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device."
 			else
 				at_least_one_fits=y
-- 
2.31.1

