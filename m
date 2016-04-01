Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id CE5CE760A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 14:31:42 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u31EVhTh020709 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 09:31:43 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016040109314407-464341 ;
	Fri, 1 Apr 2016 09:31:44 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 1 Apr 2016 17:31:20 +0300
Message-Id: <5882683e4ea3cb36dcf585a408fd3ba7ada6d488.1459520938.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <18546c4acf904968012b1861fac052bc72e55e09.1459520938.git.adrian.ratiu@ni.com>
References: <18546c4acf904968012b1861fac052bc72e55e09.1459520938.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/01/2016 09:31:44 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/01/2016 09:31:44 AM,
	Serialize complete at 04/01/2016 09:31:44 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-01_06:, , signatures=0
Subject: [PATCH 2/2] isoimage-isohybrid.py: change cpio generated uid&gid to root
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
X-List-Received-Date: Fri, 01 Apr 2016 14:31:45 -0000

By default cpio preserves the uid&guid's of the original user which
leads to host contamination and boot failures because commands like
mount from initramfs expect to be run by root and the original host
user might not even exist on the target.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index de99ad8..bc99283 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -174,8 +174,8 @@ class IsoImagePlugin(SourcePlugin):
             else:
                 msger.error("Couldn't find or build initrd, exiting.\n")
 
-            exec_cmd("find %s | cpio -o -H newc >%s/initrd.cpio " \
-                    % (initrd_dir, cr_workdir), as_shell=True)
+            exec_cmd("cd %s && find . | cpio -o -H newc -R +0:+0 >./initrd.cpio " \
+                    % initrd_dir, as_shell=True)
             exec_cmd("gzip -f -9 -c %s/initrd.cpio > %s" \
                     % (cr_workdir, initrd), as_shell=True)
             shutil.rmtree(initrd_dir)
-- 
2.7.4


