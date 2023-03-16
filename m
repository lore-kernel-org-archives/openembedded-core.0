Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113CDC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:27:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7487.1678955266305379949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24397540d7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G7dxis007486
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:27:46 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqdngbgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:27:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 16 Mar 2023 01:27:44 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 16 Mar 2023 01:27:43 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] mdadm: Fix raid0 tests
Date: Thu, 16 Mar 2023 16:27:40 +0800
Message-ID: <20230316082740.3355373-3-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316082740.3355373-1-mingli.yu@eng.windriver.com>
References: <20230316082740.3355373-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IZXfz1bi8a2zbHzMCNDThWn2AvPRvN_i
X-Proofpoint-GUID: IZXfz1bi8a2zbHzMCNDThWn2AvPRvN_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_06,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178680

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix raid0 tests:
  tests/00raid0
  tests/00readonly
  tests/03r0assem
  tests/04r0update
  tests/04update-metadata

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-Run-udevadm-settle-before-setting-r.patch |  39 +++++++
 ...metadata-avoid-passing-chunk-size-to.patch |  41 +++++++
 ...ts-fix-raid0-tests-for-0.90-metadata.patch | 102 ++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   3 +
 4 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch b/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
new file mode 100644
index 0000000000..c621c082e8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
@@ -0,0 +1,39 @@
+From 39b381252c32275079344d30de18b76fda4bba26 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 27 Jul 2022 15:52:45 -0600
+Subject: [PATCH] tests/00readonly: Run udevadm settle before setting ro
+
+In some recent kernel versions, 00readonly fails with:
+
+  mdadm: failed to set readonly for /dev/md0: Device or resource busy
+  ERROR: array is not read-only!
+
+This was traced down to a race condition with udev holding a reference
+to the block device at the same time as trying to set it read only.
+
+To fix this, call udevadm settle before setting the array read only.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=39b381252c32275079344d30de18b76fda4bba26]
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jsorensen@fb.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/00readonly | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/00readonly b/tests/00readonly
+index 39202487..afe243b3 100644
+--- a/tests/00readonly
++++ b/tests/00readonly
+@@ -12,6 +12,7 @@ do
+ 			$dev1 $dev2 $dev3 $dev4 --assume-clean
+ 		check nosync
+ 		check $level
++		udevadm settle
+ 		mdadm -ro $md0
+ 		check readonly
+ 		state=$(cat /sys/block/md0/md/array_state)
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch b/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
new file mode 100644
index 0000000000..9098fb2540
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
@@ -0,0 +1,41 @@
+From de045db607b1ac4b70fc2a8878463e029c2ab1dc Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:15 -0600
+Subject: [PATCH] tests/04update-metadata: avoid passing chunk size to raid1
+
+'04update-metadata' test fails with error, "specifying chunk size is
+forbidden for this level" added by commit, 5b30a34aa4b5e. Hence,
+correcting the test to ignore passing chunk size to raid1.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=de045db607b1ac4b70fc2a8878463e029c2ab1dc]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+[logang@deltatee.com: fix if/then style and dropped unrelated hunk]
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/04update-metadata | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/tests/04update-metadata b/tests/04update-metadata
+index 08c14af7..2b72a303 100644
+--- a/tests/04update-metadata
++++ b/tests/04update-metadata
+@@ -11,7 +11,11 @@ dlist="$dev0 $dev1 $dev2 $dev3"
+ for ls in linear/4 raid1/1 raid5/3 raid6/2
+ do
+   s=${ls#*/} l=${ls%/*}
+-  mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
++  if [[ $l == 'raid1' ]]; then
++	mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 $dlist
++  else
++	mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
++  fi
+   testdev $md0 $s 19904 64
+   mdadm -S $md0
+   mdadm -A $md0 --update=metadata $dlist
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch b/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
new file mode 100644
index 0000000000..d2e7d8ee50
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
@@ -0,0 +1,102 @@
+From 14c2161edb77d7294199e8aa7daa9f9d1d0ad5d7 Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:14 -0600
+Subject: [PATCH] tests: fix raid0 tests for 0.90 metadata
+
+Some of the test cases fail because raid0 creation fails with the error,
+"0.90 metadata does not support layouts for RAID0" added by commit,
+329dfc28debb. Fix some of the test cases by switching from raid0 to
+linear level for 0.9 metadata where possible.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=14c2161edb77d7294199e8aa7daa9f9d1d0ad5d7]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/00raid0           | 4 ++--
+ tests/00readonly        | 4 ++++
+ tests/03r0assem         | 6 +++---
+ tests/04r0update        | 4 ++--
+ tests/04update-metadata | 2 +-
+ 5 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/tests/00raid0 b/tests/00raid0
+index e6b21cc4..9b8896cb 100644
+--- a/tests/00raid0
++++ b/tests/00raid0
+@@ -20,8 +20,8 @@ mdadm -S $md0
+ # now same again with different chunk size
+ for chunk in 4 32 256
+ do
+-  mdadm -CR $md0 -e0.90 -l raid0 --chunk $chunk -n3 $dev0 $dev1 $dev2
+-  check raid0
++  mdadm -CR $md0 -e0.90 -l linear --chunk $chunk -n3 $dev0 $dev1 $dev2
++  check linear
+   testdev $md0 3 $mdsize0 $chunk
+   mdadm -S $md0
+ 
+diff --git a/tests/00readonly b/tests/00readonly
+index 28b0fa13..39202487 100644
+--- a/tests/00readonly
++++ b/tests/00readonly
+@@ -4,6 +4,10 @@ for metadata in 0.9 1.0 1.1 1.2
+ do
+ 	for level in linear raid0 raid1 raid4 raid5 raid6 raid10
+ 	do
++		if [[ $metadata == "0.9" && $level == "raid0" ]];
++		then
++			continue
++		fi
+ 		mdadm -CR $md0 -l $level -n 4 --metadata=$metadata \
+ 			$dev1 $dev2 $dev3 $dev4 --assume-clean
+ 		check nosync
+diff --git a/tests/03r0assem b/tests/03r0assem
+index 6744e322..44df0645 100644
+--- a/tests/03r0assem
++++ b/tests/03r0assem
+@@ -68,9 +68,9 @@ mdadm -S $md2
+ ### Now for version 0...
+ 
+ mdadm --zero-superblock $dev0 $dev1 $dev2
+-mdadm -CR $md2 -l0 --metadata=0.90 -n3 $dev0 $dev1 $dev2
+-check raid0
+-tst="testdev $md2 3 $mdsize0 512"
++mdadm -CR $md2 -llinear --metadata=0.90 -n3 $dev0 $dev1 $dev2
++check linear
++tst="testdev $md2 3 $mdsize0 1"
+ $tst
+ 
+ uuid=`mdadm -Db $md2 | sed 's/.*UUID=//'`
+diff --git a/tests/04r0update b/tests/04r0update
+index 73ee3b9f..b95efb06 100644
+--- a/tests/04r0update
++++ b/tests/04r0update
+@@ -1,7 +1,7 @@
+ 
+ # create a raid0, re-assemble with a different super-minor
+-mdadm -CR -e 0.90 $md0 -l0 -n3 $dev0 $dev1 $dev2
+-testdev $md0 3 $mdsize0 512
++mdadm -CR -e 0.90 $md0 -llinear -n3 $dev0 $dev1 $dev2
++testdev $md0 3 $mdsize0 1
+ minor1=`mdadm -E $dev0 | sed -n -e 's/.*Preferred Minor : //p'`
+ mdadm -S /dev/md0
+ 
+diff --git a/tests/04update-metadata b/tests/04update-metadata
+index 232fc1ff..08c14af7 100644
+--- a/tests/04update-metadata
++++ b/tests/04update-metadata
+@@ -8,7 +8,7 @@ set -xe
+ 
+ dlist="$dev0 $dev1 $dev2 $dev3"
+ 
+-for ls in raid0/4 linear/4 raid1/1 raid5/3 raid6/2
++for ls in linear/4 raid1/1 raid5/3 raid6/2
+ do
+   s=${ls#*/} l=${ls%/*}
+   mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index b5fbc5b18e..ffb42aa13a 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -28,6 +28,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
            file://0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch \
+           file://0001-tests-fix-raid0-tests-for-0.90-metadata.patch \
+           file://0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch \
+           file://0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.25.1


