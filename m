Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id AFE84606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:22:45 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tB1FMix2016504 for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Dec 2015 09:22:44 -0600
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015120109224462-616329 ;
	Tue, 1 Dec 2015 09:22:44 -0600 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 1 Dec 2015 09:22:33 -0600
Message-Id: <1448983353-8914-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/01/2015 09:22:44 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/01/2015 09:22:44 AM,
	Serialize complete at 12/01/2015 09:22:44 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-01_08:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [PATCH] sdk.py / OpkgSdk: remove_packaging_data() after install
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
X-List-Received-Date: Tue, 01 Dec 2015 15:22:46 -0000

Run remove_packaging_data() on both host and target sysroots to wipe
opkg state after install, similar to what RpmSdk does.

Use case:

Opkg may download local package indexes (I.e. file:// URLs) by
sym-linking them into /var/lib/opkg/lists/ instead of copying [1].
This leaves behind broken symlinks under the lists directory when
using opkg to build SDK sysroots.

The -h option may be set via SDKTAROPTS in some configurations to create
symlink-less SDK archives for Windows file systems. Sysroots containing
broken symlinks will fail to archive under this configuration.

Testing:

Verified /var/lib/opkg/ is empty after running populate_sdk() in a Fido
based distribution.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/opkg/commit/?h=opkg-0.3.x&id=f9022a8520fcde8f1b71424d26a652c218fce685

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Reviewed-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Natinst-ReviewBoard-ID: 119065
---
 meta/lib/oe/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index a676741..860e5de 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -197,11 +197,15 @@ class OpkgSdk(Sdk):
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND", True))
 
+        self.target_pm.remove_packaging_data()
+
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND", True))
 
+        self.host_pm.remove_packaging_data()
+
         target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
         host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
 
-- 
2.6.2


