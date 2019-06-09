Return-Path: <adrian.freihofer@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 92BA77DDA5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 12:04:19 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x59C4Krk021930
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Jun 2019 14:04:20 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.33.94])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x59C4IaI019116;
	Sun, 9 Jun 2019 14:04:18 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id AC7A52325006;
	Sun,  9 Jun 2019 14:04:17 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 14:03:41 +0200
Message-Id: <20190609120342.5475-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609120342.5475-1-adrian.freihofer@siemens.com>
References: <20190609120342.5475-1-adrian.freihofer@siemens.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH v4 2/3] testimage: consider QB_DEFAULT_FSTYPE
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
X-List-Received-Date: Sun, 09 Jun 2019 12:04:20 -0000

testimage.bbclass starts qemu with the first image type found in
the IMAGE_FSTYPES list. It's weird: this ['wic', 'tar'] works but
this ['tar'. 'wic'] does not. If QB_DEFAULT_FSTYPE is defined,
this fstype is booted.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/testimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 9bb5a5cb0b..525c5a6173 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -210,7 +210,11 @@ def testimage_main(d):
             bb.fatal('Unsupported image type built. Add a comptible image to '
                      'IMAGE_FSTYPES. Supported types: %s' %
                      ', '.join(supported_fstypes))
-    rootfs = '%s.%s' % (image_name, fstypes[0])
+    qfstype = fstypes[0]
+    qdeffstype = d.getVar("QB_DEFAULT_FSTYPE")
+    if qdeffstype:
+        qfstype = qdeffstype
+    rootfs = '%s.%s' % (image_name, qfstype)
 
     # Get tmpdir (not really used, just for compatibility)
     tmpdir = d.getVar("TMPDIR")
-- 
2.11.0


