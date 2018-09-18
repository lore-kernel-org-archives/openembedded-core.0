Return-Path: <prvs=8799cb1e88=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 27C7B79799
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 16:16:21 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w8IGG2kY023031 for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 11:16:22 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2mgx43b2xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 11:16:22 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w8IGGLG6015107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 11:16:21 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Sep 2018 11:16:21 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Sep 2018 11:16:20 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Tue, 18 Sep 2018 11:16:20 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2018 19:17:52 +0300
Message-ID: <20180918161752.5660-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-18_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH v2] isoimage-isohybrid: don't include cpio in cpio image
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
X-List-Received-Date: Tue, 18 Sep 2018 16:16:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Because the find | cpio processes execute in parallel connected via
the pipe, and the cpio outputs in the same dir find searches for
source files, the cpio will be included in itself partially, depending
on how fast the build machine creates the cpio file before cpio
gobbles it up.

This bloats the ISO image, though compression reduces the .iso file size,
once the kernel decompresses the cpio image and boots it live, it uses
up to double the RAM memory.

Fix this by creating the initrd.cpio file directly inside cr_workdir.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 25a695da17..170077c22c 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -191,10 +191,9 @@ class IsoImagePlugin(SourcePlugin):
             else:
                 raise WicError("Couldn't find or build initrd, exiting.")
 
-            exec_cmd("cd %s && find . | cpio -o -H newc -R root:root >./initrd.cpio " \
-                    % initrd_dir, as_shell=True)
-            exec_cmd("gzip -f -9 -c %s/initrd.cpio > %s" \
-                    % (initrd_dir, initrd), as_shell=True)
+            exec_cmd("cd %s && find . | cpio -o -H newc -R root:root >%s/initrd.cpio " \
+                     % (initrd_dir, cr_workdir), as_shell=True)
+            exec_cmd("gzip -f -9 %s/initrd.cpio" % cr_workdir, as_shell=True)
             shutil.rmtree(initrd_dir)
 
         return initrd
-- 
2.19.0


