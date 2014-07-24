Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 94B5A705A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:18:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 3D34929497C5;
	Thu, 24 Jul 2014 14:18:00 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 14:17:03 +0200
Message-Id: <1406204223-16935-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406145547.6335.37.camel@empanada>
References: <1406145547.6335.37.camel@empanada>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2] wic: --fsoptions handling
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
X-List-Received-Date: Thu, 24 Jul 2014 12:18:07 -0000

Add handling of --fsoptions in parition definition. If no options are
specified, 'defaults' is used.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/mic/imager/direct.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 77a118a..7e2b63a 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -113,7 +113,15 @@ class DirectImageCreator(BaseImageCreator):
                 device_name = "/dev/" + p.disk + str(num + 1)
             else:
                 device_name = "/dev/" + p.disk + str(num)
-            fstab_entry = device_name + "\t" + p.mountpoint + "\t" + p.fstype + "\tdefaults\t0\t0\n"
+
+            opts = "defaults"
+            if p.fsopts:
+                opts = p.fsopts
+
+            fstab_entry = device_name + "\t" + \
+                          p.mountpoint + "\t" + \
+                          p.fstype + "\t" + \
+                          opts + "\t0\t0\n"
             fstab_lines.append(fstab_entry)
 
     def _write_fstab(self, fstab, fstab_lines):
-- 
1.9.0


