Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 496D174051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 10:48:53 +0000 (UTC)
Received: by pacgb13 with SMTP id gb13so10593349pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 03:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jaRRZ+wRqgUJ93giuzZCklIwH6RKujA0AXF1i86QCiU=;
	b=Fv0phDMBv3TrAQ2epO3URWOUp59EisljJeq1UjlKyYJZBfekcFDyrmrKySsUDcXl4D
	cq8nZZsFw5pu8vKHB+t6KdK7mEkggC5weKAeGikYIjiD1kn+JtKpsopMCIaj+zyGPmPS
	AZURSW32ASfB6ORSQEhX5Vmscb0jBzSvwDEcxk+NotVFxY2e+Yknx2Mu0FBxbwIy5piR
	i87HDDJGYw9wH09a44dYQH45eGR0LH52Qlfg+hxDqWPIfZS/6mw/dqc4wAiB92+4c7JD
	Mp/XvqJlUt0QSMsXHDNjulx84WbDlVSK5/hHDphwH9N0MSlHLYnxh5dX/hdDN/Fr6m+D
	cIBA==
X-Gm-Message-State: ALoCoQkZOjpwOYAki4HLiCrm/la/dSNbSUpQlobTqiQMB0l8W6FiGA+GFqngi5x4cfmNfHPXwUhw
X-Received: by 10.68.68.135 with SMTP id w7mr51025147pbt.63.1434451735149;
	Tue, 16 Jun 2015 03:48:55 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id cf1sm955541pdb.41.2015.06.16.03.48.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 03:48:54 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 16:18:30 +0530
Message-Id: <1434451710-2526-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH v2][fido 4/4] runqemu-internal: set mutual exclusiveness for serial and nographic options
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
X-List-Received-Date: Tue, 16 Jun 2015 10:48:54 -0000

Use "-nographic" option only if "serial" option is not
specified. Otherwise we get below error when
'runqemu <kernel_image> <rootfs_image> serial' is executed,

(snip)
QEMU 2.2.0 monitor - type 'help' for more information
(qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple
character devices
-- CUT --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 scripts/runqemu-internal | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index fb51754..e346c64 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -275,9 +275,6 @@ else
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
         QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
-        if [ $MACHINE = 'qemuarm64' ]; then
-            QEMU_UI_OPTIONS="-nographic"
-        fi
 
         NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
         export NFS_INSTANCE
@@ -383,7 +380,11 @@ if [ "$MACHINE" = "qemuarm64" ]; then
     QEMU=qemu-system-aarch64
 
     export QEMU_AUDIO_DRV="none"
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    if [ "x$SERIALSTDIO" = "x" ] ; then
+        QEMU_UI_OPTIONS="-nographic"
+    else
+        QEMU_UI_OPTIONS=""
+    fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
         # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
-- 
1.9.1


