Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id BB1D476FD5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 15:11:41 +0000 (UTC)
Received: by ioii196 with SMTP id i196so25565071ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 08:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/8l7vzhGl7hr1noe0/CTZLpdkPj77bmwJ5R4djNDiIQ=;
	b=bBUVFcxTV1DjgHXYemDIPx7sQTcQpSvVSyPr8zuOyRkAMMoEsQ8dn0BtRwo+/9C0zT
	vlNCriez+ZHtrDOb1GV8L0VMLcd7Vb1g+iEFAK5LlihIxRNwJK7K5pgF4S0PLDOSdL4q
	1xFH6nc2G6f0Y90rNGThsk2rjKr9UIzgB9rLB4Oqb8M6pdodXX5tz59jy31AE4Xf3Kgj
	PSyRGcj+zyEshiHrCfijhQToxtv0nCZDSLFmjsWgI4Upxgslku3MlfpuWx3Y7EdMaFOK
	HWjVvjBUmuQO4Xu/gKXAtkOsTrp5hGmheDNQCu+HFS6ZgOlkHnTLrStejEI4gc0AEuTy
	KmHw==
X-Gm-Message-State: ALoCoQkeDGLDBUCTdIXeef4D6rh09hFtGA9NaYlrlQmxT5VWtd9q28zsJSGh141jmPpTOJV8g6zW
X-Received: by 10.107.10.14 with SMTP id u14mr31929150ioi.94.1441811500913;
	Wed, 09 Sep 2015 08:11:40 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56733.dip0.t-ipconnect.de.
	[87.165.103.51])
	by smtp.gmail.com with ESMTPSA id x21sm4752658iod.8.2015.09.09.08.11.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 08:11:40 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 17:12:05 +0200
Message-Id: <1441811525-22113-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] runqemu: avoid image file name mismatches
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
X-List-Received-Date: Wed, 09 Sep 2015 15:11:42 -0000

Giving anything with -image in it as bootparams or in qemuparams (for
example, an additional -drive parameter with an image file or an
"-initrd .../core-image-minimal-initramfs-qemux86.cpio.gz") caused
runqemu to treat these parameters as names of the rootfs image file.

Matching *-image) after checking the current argument for more
specific cases like bootparams and qemuparams avoids this
misinterpretation of the command line parameters.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a4d9a23..5d770fc 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -118,22 +118,6 @@ while true; do
             [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ] && FSTYPE=$arg || \
                 error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
-        *-image*)
-            [ -z "$ROOTFS" ] || \
-		error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
-            if [ -f "$arg" ]; then
-                process_filename $arg
-            elif [ -d "$arg" ]; then
-                # Handle the case where the nfsroot dir has -image-
-                # in the pathname
-                echo "Assuming $arg is an nfs rootfs"
-                FSTYPE=nfs
-                ROOTFS=$arg
-            else
-                ROOTFS=$arg
-                LAZY_ROOTFS="true"
-            fi
-            ;;
         "ramfs")
             FSTYPE=cpio.gz
             RAMFS=true
@@ -192,6 +176,22 @@ while true; do
         "publicvnc")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc 0.0.0.0:0"
             ;;
+        *-image*)
+            [ -z "$ROOTFS" ] || \
+		error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
+            if [ -f "$arg" ]; then
+                process_filename $arg
+            elif [ -d "$arg" ]; then
+                # Handle the case where the nfsroot dir has -image-
+                # in the pathname
+                echo "Assuming $arg is an nfs rootfs"
+                FSTYPE=nfs
+                ROOTFS=$arg
+            else
+                ROOTFS=$arg
+                LAZY_ROOTFS="true"
+            fi
+            ;;
         "") break ;;
         *)
             # A directory name is an nfs rootfs
-- 
2.1.4


