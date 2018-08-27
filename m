Return-Path: <prvs=7777a5c19a=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id DC14178EDC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:31:35 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7REKQr5032587 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:11 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2m34mw6gm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:11 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7REVA0o016496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:10 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 09:31:10 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 09:31:09 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2018 17:31:03 +0300
Message-ID: <20180827143105.30059-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 1/3] isoimage-isohybrid: Fix creating initrd.cpio
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
X-List-Received-Date: Mon, 27 Aug 2018 15:31:36 -0000
Content-Type: text/plain

Only bsdcpio works with numbers for option -R to specify user:group,
while GNU cpio doesn't. Debian use GNU cpio so without this change,
you cannot create ISO images without installing bsdcpio.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 0d4f50d1f7..4a0a57ef9e 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -191,7 +191,7 @@ class IsoImagePlugin(SourcePlugin):
             else:
                 raise WicError("Couldn't find or build initrd, exiting.")
 
-            exec_cmd("cd %s && find . | cpio -o -H newc -R +0:+0 >./initrd.cpio " \
+            exec_cmd("cd %s && find . | cpio -o -H newc -R root:root >./initrd.cpio " \
                     % initrd_dir, as_shell=True)
             exec_cmd("gzip -f -9 -c %s/initrd.cpio > %s" \
                     % (cr_workdir, initrd), as_shell=True)
-- 
2.18.0


