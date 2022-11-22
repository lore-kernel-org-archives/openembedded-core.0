Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A83BC43217
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 13:38:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19017.1669124285413625981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 05:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8325759ffa=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMDD6QD009709
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 05:38:04 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqaa91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 05:38:04 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Nov 2022 05:38:03 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Nov 2022 05:38:03 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] tcl: correct the header location in tcl.pc
Date: Tue, 22 Nov 2022 21:38:01 +0800
Message-ID: <20221122133802.1175512-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yAPl0sVq7miXU9sylAs84baJwaXQAHiv
X-Proofpoint-GUID: yAPl0sVq7miXU9sylAs84baJwaXQAHiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_07,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 13:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173679

From: Mingli Yu <mingli.yu@windriver.com>

The patch alter-includedir.patch previouly install the header
to /usr/include/tcl8.6, but it doesn't reflect in tcl.pc and
the header location still /usr/include in tcl.pc and result
in the below configure failure for other packages such as
python3 which depends on tcl and uses pkg-config to detect tcl.

| conftest.c:161:16: fatal error: tcl.h: No such file or directory
  161 |       #include <tcl.h>

So update alter-includedir.patch to correct the header location
in tcl.pc to keep consistency.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../tcltk/tcl/alter-includedir.patch          | 38 +++++++++++++++----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
index 5b25af2c0c..26c9b0d7fa 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
@@ -1,3 +1,8 @@
+From c6960f4ca82a153416d138221dd2426475aed683 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 22 Nov 2022 18:48:27 +0800
+Subject: [PATCH] tcl: update the header location
+
 Lets install the include header and private header files into
 usr/include/tcl8.6 when version of tcl is 8.6.x
 
@@ -7,17 +12,21 @@ Signed-off-by: Khem Raj <raj.khem@gmai.com>
 
 Fixed the TCL_INCLUDE_SPEC
 
+Also update the header location in tcl.pc to correct the header
+location in case some package such python3 which use pkg-config
+to detect tcl doesn't find the header.
+
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- Makefile.in  | 2 +-
- configure    | 4 ++--
- configure.in | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
+ unix/Makefile.in  | 2 +-
+ unix/configure.in | 4 ++--
+ unix/tcl.pc.in    | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index 0370491..daa569a 100644
+diff --git a/unix/Makefile.in b/unix/Makefile.in
+index 0ebac43..b0c3ee0 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -29,7 +38,7 @@ index 0370491..daa569a 100644
  
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
-diff --git a/configure.in b/configure.in
+diff --git a/unix/configure.in b/unix/configure.in
 index 9f96e2b..e323e02 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
@@ -51,6 +60,19 @@ index 9f96e2b..e323e02 100644
  
  #------------------------------------------------------------------------
  # tclConfig.sh refers to this by a different name
+diff --git a/unix/tcl.pc.in b/unix/tcl.pc.in
+index 846cb11..72ca44b 100644
+--- a/unix/tcl.pc.in
++++ b/unix/tcl.pc.in
+@@ -3,7 +3,7 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+-includedir=@includedir@
++includedir=@includedir@/tcl@PACKAGE_VERSION@
+ 
+ Name: Tool Command Language
+ Description: Tcl is a powerful, easy-to-learn dynamic programming language, suitable for a wide range of uses.
 -- 
 2.25.1
 
-- 
2.25.1


