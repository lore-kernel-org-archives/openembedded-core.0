Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6B80C783A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 18:46:45 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7VIkHDh013764; Thu, 31 Aug 2017 13:46:47 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2cmjtq6cx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 31 Aug 2017 13:46:46 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v7VIkksR004435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2017 13:46:46 -0500
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 31 Aug 2017 13:46:45 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 31 Aug 2017 13:46:45 -0500
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 31 Aug 2017 13:46:45 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Aug 2017 13:46:43 -0500
Message-ID: <20170831184643.3991-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170519150121.7707-1-haris.okanovic@ni.com>
References: <20170519150121.7707-1-haris.okanovic@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-31_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1708310279
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH] package_manager.py: Add PACKAGE_ENABLE_FILELIST option to OpkgIndexer
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
X-List-Received-Date: Thu, 31 Aug 2017 18:46:46 -0000
Content-Type: text/plain

Setting PACKAGE_ENABLE_FILELIST option generates Packages.filelist on
`bitbake package-index`, which is index of files provided by each
IPK package in the feed. It's useful for figuring out which package
provides a particular file/program/library/etc.

Disabled by default since generating a filelist involves reading the
payload of every package in the feed, a time and IO intensive operation
many users won't want to run. Those who do may flip this switch.

Testing:
 * Built an opkg index with PACKAGE_ENABLE_FILELIST unset and verified
   no Packages.filelist are generated.
 * Built with PACKAGE_ENABLE_FILELIST="1" and verified each subfeed
   has Packages.filelist; took ~3min longer for 8,200 IPKs.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/lib/oe/package_manager.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b4b359a8c6..5e1fc48500 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -161,6 +161,8 @@ class OpkgIndexer(Indexer):
         else:
             signer = None
 
+        enable_filelist = bb.utils.to_boolean(self.d.getVar('PACKAGE_ENABLE_FILELIST', True) or "False")
+
         if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
             open(os.path.join(self.deploy_dir, "Packages"), "w").close()
 
@@ -175,14 +177,18 @@ class OpkgIndexer(Indexer):
                 pkgs_dir = os.path.join(self.deploy_dir, arch)
                 pkgs_file = os.path.join(pkgs_dir, "Packages")
 
+                filelist_cmd = ""
+                if enable_filelist:
+                    filelist_cmd = '-l %s.filelist' % (pkgs_file)
+
                 if not os.path.isdir(pkgs_dir):
                     continue
 
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s -r %s -p %s -m %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+                index_cmds.add('%s -r %s -p %s -m %s %s' %
+                                  (opkg_index_cmd, pkgs_file, pkgs_file, filelist_cmd, pkgs_dir))
 
                 index_sign_files.add(pkgs_file)
 
-- 
2.13.2


