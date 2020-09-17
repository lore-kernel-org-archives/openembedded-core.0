Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.13763.1600344138726317879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2020 05:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: BA/OuGiDqoYjAwIN8xv5pm9E/p2PVtXoIodgUDqi1/vryogqXdyNjOnhvrHzmetGslSeK1mtLP
 1eq8FTSWgt9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="158981806"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="158981806"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 05:02:17 -0700
IronPort-SDR: MRaTemNQU8Njws/cdD4oCqodfPEHkOgNKCh7pkEMQfFXf7dPaPGbdmjQqg3iX7d+1bgROKM0Iw
 +TXly5mp/WNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="339410857"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2020 05:02:16 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH] documentation/ref-manual/ref-variables.xml: Added IMAGE_EFI_BOOT_FILES variable entry
Date: Thu, 17 Sep 2020 20:02:15 +0800
Message-Id: <1600344135-21738-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

IMAGE_EFI_BOOT_FILES created to help differentiate files needed between
bootimg-efi and bootimg-partition when creating the installer/.wic file.

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 documentation/ref-manual/ref-variables.xml | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index a506480..6e438e8 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -5719,6 +5719,61 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-IMAGE_EFI_BOOT_FILES'><glossterm>IMAGE_EFI_BOOT_FILES</glossterm>
+            <info>
+                IMAGE_EFI_BOOT_FILES[doc] = "A space-separated list of files from ${DEPLOY_DIR_IMAGE} to place in EFI boot partition."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    A space-separated list of files installed into the
+                    EFI boot partition when preparing an image using the Wic tool
+                    with the <filename>bootimg-efi</filename> source
+                    plugin.
+                    By default, the files are installed under the same name as
+                    the source files.
+                    To change the installed name, separate it from the
+                    original name with a semi-colon (;).
+                    Source files need to be located in
+                    <link linkend='var-DEPLOY_DIR_IMAGE'><filename>DEPLOY_DIR_IMAGE</filename></link>.
+                    Here are two examples:
+
+                    <literallayout class="monospaced">
+     IMAGE_EFI_BOOT_FILES = ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img
+                    </literallayout>
+                </para>
+
+                <para>
+                    Alternatively, source files can be picked up using
+                    a glob pattern.
+                    In this case, the destination file must have the same name
+                    as the base name of the source file path.
+                    To install files into a directory within the
+                    target location, pass its name after a semi-colon
+                    (;).
+                    Here are two examples:
+                    <literallayout class="monospaced">
+     IMAGE_BOOT_FILES = "boot/loader/*"
+     IMAGE_BOOT_FILES = "boot/loader/*;boot/"
+                    </literallayout>
+                    The first example installs all files from
+                    <filename>${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles</filename>
+                    into the root of the target partition.
+                    The second example installs the same files into a
+                    <filename>boot</filename> directory within the
+                    target partition.
+                </para>
+
+                <para>
+                    You can find information on how to use the Wic tool in the
+                    "<ulink url='&YOCTO_DOCS_DEV_URL;#creating-partitioned-images-using-wic'>Creating Partitioned Images Using Wic</ulink>"
+                    section of the Yocto Project Development Tasks Manual.
+                    Reference material for Wic is located in the
+                    "<ulink url='&YOCTO_DOCS_REF_URL;#ref-kickstart'>OpenEmbedded Kickstart (.wks) Reference</ulink>"
+                    chapter.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-IMAGE_BOOT_FILES'><glossterm>IMAGE_BOOT_FILES</glossterm>
             <info>
                 IMAGE_BOOT_FILES[doc] = "A space-separated list of files from ${DEPLOY_DIR_IMAGE} to place in boot partition."
-- 
2.7.4

