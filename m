Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F418C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 22:54:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3672.1713912866358944973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 15:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RR2FUkHQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=484351f043=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N77w6G005461
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 22:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ZP9dM
	Yu+ODfa5h2bfH/PAyo3FqU01wlz+8QUIQUGDXM=; b=RR2FUkHQjs0Kx0YqgQYU+
	uvXbtTRXCiyuzEHrHZ9GFNzOCu9tBNbIUJGSqTflHvyKxYc3s3iEEmRbmLoQiweH
	NmDrX5neNinqOeyXrWQTgtk8A97Z+7TAKCQ5akzZItp92ZgjHJ+helJkdSxvTy7e
	ByvkAo5APUo/ts2hDT9kUdy97xxSgHz2cqovZ7Ob1ZjbJ2Z0yRlPwFD36yCvrTMH
	CCirz+ebVDxjTMZrnrUMmYMDmTIJvBv1LD8YATYhfe/lmHl/Afc2WI7N1krCTTOA
	jZ8GRmzyJ8Y7Zq7c73/83kPLW27PUg4epPK9lXQc5sSdjxUtjEmjxA3ytoMMCoUC
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xp8asgwtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 22:54:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 23 Apr 2024 15:54:24 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 23 Apr 2024 15:54:24 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] oe-debuginfod: add option for data storage
Date: Tue, 23 Apr 2024 15:54:24 -0700
Message-ID: <20240423225424.1697682-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qsmTPTFQtnKM5KFvx3lNtHWA4dGvmuKh
X-Proofpoint-ORIG-GUID: qsmTPTFQtnKM5KFvx3lNtHWA4dGvmuKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_17,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxlogscore=910 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404230061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 22:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198635

From: Joe Slater <joe.slater@windriver.com>

Storing the data files under $HOME can be unreliable if debuginfod
is used for several projects, especially if $HOME is shared
between machines.  We provide an option to save files under the
project directory.  The default behavior is unchanged.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 scripts/oe-debuginfod | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-debuginfod b/scripts/oe-debuginfod
index b525310225..5e70d37b8b 100755
--- a/scripts/oe-debuginfod
+++ b/scripts/oe-debuginfod
@@ -15,14 +15,29 @@ scriptpath.add_bitbake_lib_path()
 
 import bb.tinfoil
 import subprocess
+import argparse
 
 if __name__ == "__main__":
+    p = argparse.ArgumentParser()
+    p.add_argument("-d", action='store_true', \
+                         help="store debuginfod files in project sub-directory")
+    
+    args = p.parse_args()
+    
     with bb.tinfoil.Tinfoil() as tinfoil:
         tinfoil.prepare(config_only=True)
         package_classes_var = "DEPLOY_DIR_" + tinfoil.config_data.getVar("PACKAGE_CLASSES").split()[0].replace("package_", "").upper()
         feed_dir = tinfoil.config_data.getVar(package_classes_var, expand=True)
 
+    opts = [ '--verbose', '-R', '-U', feed_dir ]
+    
+    if args.d:
+        fdir = os.path.join(os.getcwd(), 'oedid-files')
+        os.makedirs(fdir, exist_ok=True)
+        opts += [ '-d', os.path.join(fdir, 'did.sqlite') ]
+        
     subprocess.call(['bitbake', '-c', 'addto_recipe_sysroot', 'elfutils-native'])
 
-    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', '-U', feed_dir])
+    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod'] + opts)
+    # we should not get here
     print("\nTo use the debuginfod server please ensure that this variable PACKAGECONFIG:pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
-- 
2.25.1


