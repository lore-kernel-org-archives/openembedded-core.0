Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECF676FF2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 13:37:20 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u15DbL6w029666 for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Feb 2016 07:37:21 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020507372109-690644 ;
	Fri, 5 Feb 2016 07:37:21 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 5 Feb 2016 15:36:57 +0200
Message-Id: <1454679417-7594-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/05/2016 07:37:21 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/05/2016 07:37:21 AM,
	Serialize complete at 02/05/2016 07:37:21 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-05_05:, , signatures=0
Subject: [PATCH 1/1] isoimage-isohybrid.py: fix cpio working directory
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
X-List-Received-Date: Fri, 05 Feb 2016 13:37:21 -0000

Take `pwd` to be <initial-dir>. The %s path is relative to it. The value
of %s is "output_folder/build". The current code works as follows:

Changing directory to %s and finding the sources (after cd'ing) to cpio
with output redirection to %s/initrd.cpio triggers the following error

"Error: exec_cmd: cd output_folder/build/INITRD && find . | cpio -o -H
newc >output_folder/build/initrd.cpio  returned '1' instead of 0"

This happens because after the cd, `pwd` is <initial-dir>/%s and by the
redirect we write the result to to <initial-dir>/%s/%s/initrd.cpio which
obviously does not exist.

Fix this by getting the sources with "find %s" instead of "cd && find ."

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 62385a2..31dc9b6 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -174,7 +174,7 @@ class IsoImagePlugin(SourcePlugin):
             else:
                 msger.error("Couldn't find or build initrd, exiting.\n")
 
-            exec_cmd("cd %s && find . | cpio -o -H newc >%s/initrd.cpio " \
+            exec_cmd("find %s | cpio -o -H newc >%s/initrd.cpio " \
                     % (initrd_dir, cr_workdir), as_shell=True)
             exec_cmd("gzip -f -9 -c %s/initrd.cpio > %s" \
                     % (cr_workdir, initrd), as_shell=True)
-- 
2.7.0


