Return-Path: <adrian.freihofer@siemens.com>
X-Greylist: delayed 980 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Jun 2019 22:03:33 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 778EE7D68F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 22:03:33 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x57LlD88022197
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2019 23:47:13 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.34.89])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x57LlB8U016946;
	Fri, 7 Jun 2019 23:47:11 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D9C572273143;
	Fri,  7 Jun 2019 23:47:10 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 23:47:07 +0200
Message-Id: <20190607214707.28381-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190607214707.28381-1-adrian.freihofer@siemens.com>
References: <20190607214707.28381-1-adrian.freihofer@siemens.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH v2 4/4] runqemu: add wic-fs and wic-wm paramters
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
X-List-Received-Date: Fri, 07 Jun 2019 22:03:33 -0000

This is an optional follow up for the previous commit. It allows
to define if wic images are handled as vm or as fs type images by
command line argument.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 71894c9ca8..c730a72168 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -76,6 +76,8 @@ of the following environment variables (in any order):
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
     [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
+    wic-fs - Start Qemu with -kernel parameter for wic images (default if -machine virt)
+    wic-vm - Start Qemu without -kernel parameter for wic images (default otherwise)
   tcpserial=<port> - specify tcp serial port number
   biosdir=<dir> - specify custom bios dir
   biosfilename=<filename> - specify bios filename
@@ -455,6 +457,10 @@ class BaseConfig(object):
                 self.rootfs = arg
             elif arg.startswith('ovmf'):
                 self.ovmf_bios.append(arg)
+            elif arg == 'wic-fs':
+                self.wic_fs = True
+            elif arg == 'wic-vm':
+                self.wic_fs = False
             else:
                 # At last, assume it is the MACHINE
                 if (not unknown_arg) or unknown_arg == arg:
-- 
2.11.0


