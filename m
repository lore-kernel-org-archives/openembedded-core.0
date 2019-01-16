Return-Path: <prvs=29196da710=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 1F09079E69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 22:37:27 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0GMaUdI017975 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 16:37:29 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2q1nnvvua2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 16:37:29 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x0GMbSsO003618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 16:37:28 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 16 Jan 2019 16:37:28 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 16 Jan 2019 16:37:28 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 16 Jan 2019 16:37:28 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 16:39:26 -0600
Message-ID: <20190116223926.3702-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-16_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH] ipk_write_pkg: add error output
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
X-List-Received-Date: Wed, 16 Jan 2019 22:37:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/classes/package_ipk.bbclass | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 508b7dcaff..5eec20a35b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -224,15 +224,18 @@ def ipk_write_pkg(pkg, d):
             conffiles.close()
 
         os.chdir(basedir)
-        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
-                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
-                                stderr=subprocess.STDOUT,
-                                shell=True)
-
-        if d.getVar('IPK_SIGN_PACKAGES') == '1':
-            ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
-            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
-            sign_ipk(d, ipk_to_sign)
+        try:
+            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
+                                                              d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
+                                    stderr=subprocess.STDOUT,
+                                    shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.error("Failed to create package, opkg-build failed with: %s" % e.output.decode('utf-8'))
+        else:
+            if d.getVar('IPK_SIGN_PACKAGES') == '1':
+                ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
+                ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
+                sign_ipk(d, ipk_to_sign)
 
     finally:
         cleanupcontrol(root)
-- 
2.20.1


