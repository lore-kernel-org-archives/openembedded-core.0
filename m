Return-Path: <prvs=221486d377=haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id D41E96B8BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 22:07:40 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xA7M3WKb019579; Thu, 7 Nov 2019 16:07:41 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2w41w84r8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 07 Nov 2019 16:07:41 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xA7M7dAE019067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2019 16:07:40 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:07:39 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:07:39 -0600
Received: from harisdt.amer.corp.natinst.com (172.18.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Nov 2019 16:07:39 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2019 16:07:36 -0600
Message-ID: <20191107220736.2173245-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-07_07:2019-11-07,2019-11-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH] meta/lib/oe/package_manager.py: Enable sha256 checksums in opkg indexer
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
X-List-Received-Date: Thu, 07 Nov 2019 22:07:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Pass `--checksum md5` and `--checksum sha256` to opkg-make-index.

Sha256 checksum enables more reliable install-time validation of IPKs.
This is particularly useful when installing from signed feeds --
I.e. feeds using signed Packages index files that deliver otherwise
unsigned IPKs. Such feeds rely on hash validation of enclosed IPKs to
thwart tampering. After download, opkg verifies IPK's checksum against
the (signed) Packages index file. Weak hashes like md5 are prone to
collision and therefore tampering.

The md5 checksum is purely for backward compatibility. Sha256 validation
was recently added to opkg. Newer builds of opkg will use it. Older
builds still look for an md5 checksum. Md5 is deprecated and should be
removed once old build are phased out.

Testing: I ran `bitbake package-index` after building a few IPKs and
verified MD5Sum and SHA256sum attributes are present in Packages.
Using opkg-utils 0.4.0.

Performance Impact: It takes about 40 seconds to cleanly re-index 8000
IPKs on an Intel Xeon E5-1620 machine. This was previously about
20 seconds.

NOTE: It's recommended to delete all Packages* files after applying this
patch. Otherwise, some IPKs won't have sha256.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c7135ce918..4ff19cf09c 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -217,7 +217,7 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s -r %s -p %s -m %s' %
+                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
                                   (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
 
                 index_sign_files.add(pkgs_file)
-- 
2.24.0


