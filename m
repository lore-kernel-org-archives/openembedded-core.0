Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 296CC6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 14:41:46 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u8REflIo013811 for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 09:41:47 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016092709414751-340609 ;
	Tue, 27 Sep 2016 09:41:47 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 17:40:11 +0300
Message-Id: <20160927144011.13336-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.10.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/27/2016 09:41:47 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/27/2016 09:41:47 AM,
	Serialize complete at 09/27/2016 09:41:47 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-27_06:, , signatures=0
Subject: [=OE-core][PATCH] populate_sdk_base.bbclass: fix broken variables
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
X-List-Received-Date: Tue, 27 Sep 2016 14:41:46 -0000

This function never worked because the SDK_OUTPUT and SDKPATH vars are
written bash-style in a python function. The only reason it never failed
a build is because the function bails out the start because of the flag
CHECK_SDK_SYSROOTS.

And I guess nobody tested with CHECK_SDK_SYSROOTS enabled until now.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ce12f27..a23775e 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -147,7 +147,8 @@ python check_sdk_sysroots() {
         return os.path.abspath(path)
 
     # Get scan root
-    SCAN_ROOT = norm_path("${SDK_OUTPUT}/${SDKPATH}/sysroots/")
+    SCAN_ROOT = norm_path("%s/%s/sysroots/" % (d.getVar('SDK_OUTPUT', True),
+                                               d.getVar('SDKPATH', True)))
 
     bb.note('Checking SDK sysroots at ' + SCAN_ROOT)
 
-- 
2.10.0


