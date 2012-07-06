Received: from mail-db3.bigfish.com ([94.245.120.74]
	helo=DB3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SnEzh-0005UL-Kv
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 22:19:13 +0200
Received: from mail39-db3-R.bigfish.com (10.3.81.230) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 20:05:58 +0000
Received: from mail39-db3 (localhost [127.0.0.1])	by mail39-db3-R.bigfish.com
	(Postfix) with ESMTP id D5EC0401CE	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 20:05:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail39-db3 (localhost.localdomain [127.0.0.1]) by mail39-db3
	(MessageSwitch) id 1341605157318314_9033;
	Fri,  6 Jul 2012 20:05:57 +0000 (UTC)
Received: from DB3EHSMHS010.bigfish.com (unknown [10.3.81.238])	by
	mail39-db3.bigfish.com (Postfix) with ESMTP id 4B95C260043	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 20:05:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS010.bigfish.com
	(10.3.87.110) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 20:05:55 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 6 Jul 2012 15:08:02 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q66K80vL027294
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jul 2012 13:08:02
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 15:08:00 -0500
Message-ID: <1341605280-32431-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] packagedata.py: Fix get_subpkgedata_fn for multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 20:19:13 -0000
Content-Type: text/plain

This happens when tryng to add libgcc-dev to as a multilib package
(e.g. IMAGE_INSTALL_append = " lib32-libgcc-dev")

| Processing task-core-boot...
| Processing fman-ucode...
| Processing dosfstools...
| Processing lib32-libgcc-dev...
| Unable to find package lib32-libgcc-dev (libgcc-dev)!
NOTE: package fsl-image-full-1.0-r1.1.3.6: task do_rootfs: Failed

RPM (or bitbake?) is looking in the tmp/pkgdata, however some of these file
paths are mungned for the multilib scenario:

$ find tmp/pkgdata/ | grep libgcc-dev$
tmp/pkgdata/ppce5500-fsl-linux/runtime/lib32-libgcc-dev
tmp/pkgdata/ppc64e5500-fsl-linux/runtime/libgcc-dev

This patch fixes where we look for these files so they can be found and
properly installed for the multilib root file system

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/lib/oe/packagedata.py |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index a7a40f0..9a28e6b 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -27,6 +27,14 @@ def read_pkgdatafile(fn):
 
 def get_subpkgedata_fn(pkg, d):
     archs = d.expand("${PACKAGE_ARCHS}").split(" ")
+    mlarchs = d.getVar("MULTILIB_PACKAGE_ARCHS", d) or None
+
+    if mlarchs:
+        for mlarch in mlarchs.split(" "):
+            if "_" in mlarch:
+                prefix, split, new_arch = mlarch.partition("_")
+                archs.append(new_arch)
+
     archs.reverse()
     pkgdata = d.expand('${TMPDIR}/pkgdata/')
     targetdir = d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
-- 
1.7.10




