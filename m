Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 42E19701A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 21:34:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id DAC8230CFC49;
	Mon, 21 Jul 2014 23:34:24 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 23:34:13 +0200
Message-Id: <1405978453-16554-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1405978453-16554-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1405978453-16554-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 2/2] wic: --fsoptions handling
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
X-List-Received-Date: Mon, 21 Jul 2014 21:34:33 -0000

Add handling of --fsoptions in parition definition. Default value of
mount option is 'defaults', all user defined options are appended.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/mic/imager/direct.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index beae372..024cd09 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -113,7 +113,14 @@ class DirectImageCreator(BaseImageCreator):
                 device_name = "/dev/" + p.disk + str(num + 1)
             else:
                 device_name = "/dev/" + p.disk + str(num)
-            fstab_entry = device_name + "\t" + p.mountpoint + "\t" + p.fstype + "\tdefaults\t0\t0\n"
+            opts = "defaults"
+            if p.fsopts:
+                opts += ","
+                opts += p.fsopts
+            fstab_entry = device_name + "\t" + \
+                          p.mountpoint + "\t" + \
+                          p.fstype + "\t" + \
+                          opts + "\t0\t0\n"
             fstab_lines.append(fstab_entry)
 
     def _write_fstab(self, fstab, fstab_lines):
-- 
1.9.0


