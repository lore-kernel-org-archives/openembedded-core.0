Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65D76601E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:24:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5P9OXLi020466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:24:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 02:24:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 02:24:31 -0700
Message-ID: <8389e233505ed188fb41513d0f745a4b84874b6d.1435224137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435224137.git.liezhi.yang@windriver.com>
References: <cover.1435224137.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] runqemu: disable graphic when no DISPLAY
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
X-List-Received-Date: Thu, 25 Jun 2015 09:24:35 -0000
Content-Type: text/plain

Disable graphic when no DISPLAY rather than print an error like:
[snip]
Could not initialize SDL(No available video device) - exiting
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 09c507d..d9e91af 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -70,6 +70,7 @@ SCRIPT_KERNEL_OPT=""
 SERIALSTDIO=""
 KVM_ENABLED="no"
 KVM_ACTIVE="no"
+GRAPHIC="yes"
 
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
@@ -142,8 +143,7 @@ while true; do
 	    ISOFS=true
 	    ;;
         "nographic")
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
-            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
+            GRAPHIC="no"
             ;;
         "serial")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
@@ -291,6 +291,13 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
     fi
 fi
 
+# Disable graphic when no DISPLAY or -nographic is specified.
+if [ -z "$DISPLAY" -o "$GRAPHIC" = "no" ]; then
+    echo "Disabling graphic."
+    SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
+    SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
+fi
+
 machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
 # MACHINE is now set for all cases
 
-- 
1.7.9.5


