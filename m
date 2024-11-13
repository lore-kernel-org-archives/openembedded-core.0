Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5F5D41C3E
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 12:51:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11011.1731502309274865187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 04:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1047f0ff89=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADBgvnf028584
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:51:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtua0je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:51:48 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 13 Nov 2024 04:51:47 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 13 Nov 2024 04:51:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang
Date: Wed, 13 Nov 2024 04:51:47 -0800
Message-ID: <20241113125147.3276369-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OMkF4nrV6y1fBF6C3hHElAJA2Wfli-8q
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=6734a0e4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=uPZiAMpXAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=HrJoeDBFkZHRldxA6sAA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: OMkF4nrV6y1fBF6C3hHElAJA2Wfli-8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411130110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207098

According to [1]

As of the current version 1.0.8, bzip2 --version will print version
info but it will also continue compressing stdin:

  $ ./bzip2 --version
  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.

     Copyright (C) 1996-2019 by Julian Seward.

     This program is free software; [...]

  bzip2: I won't write compressed data to a terminal.
  bzip2: For help, type: `bzip2 --help'.

Debian (and its downstreams like Ubuntu) will patch this out [2],
making the < /dev/null unnecessary, port a part of debian patch
to fix the issue

[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a-program-like-bzip2
[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.patch/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-fix-bzip2-version-tmp-aaa-will-hang.patch | 62 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
new file mode 100644
index 0000000000..84206b2a4d
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
@@ -0,0 +1,62 @@
+From a9dd6acbaca836fc4e943e69a31b2e7acda32045 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 13 Nov 2024 19:49:23 +0800
+Subject: [PATCH] fix 'bzip2 --version > /tmp/aaa 2>&1' hang
+
+According to [1]
+
+As of the current version 1.0.8, bzip2 --version will print version
+info but it will also continue compressing stdin:
+
+  $ ./bzip2 --version
+  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.
+  
+     Copyright (C) 1996-2019 by Julian Seward.
+  
+     This program is free software; [...]
+  
+  bzip2: I won't write compressed data to a terminal.
+  bzip2: For help, type: `bzip2 --help'.
+
+Debian (and its downstreams like Ubuntu) will patch this out [2],
+making the < /dev/null unnecessary:
+
+[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a-program-like-bzip2
+[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.patch/
+
+Upstream-Status: Submitted [bzip2-devel@sourceware.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ bzip2.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bzip2.c b/bzip2.c
+index d95d280..6ec9871 100644
+--- a/bzip2.c
++++ b/bzip2.c
+@@ -1890,7 +1890,9 @@ IntNative main ( IntNative argc, Char *argv[] )
+                case '8': blockSize100k    = 8; break;
+                case '9': blockSize100k    = 9; break;
+                case 'V':
+-               case 'L': license();            break;
++               case 'L': license();
++                         exit ( 0 );
++                         break;
+                case 'v': verbosity++; break;
+                case 'h': usage ( progName );
+                          exit ( 0 );
+@@ -1916,8 +1918,8 @@ IntNative main ( IntNative argc, Char *argv[] )
+       if (ISFLAG("--keep"))              keepInputFiles   = True;    else
+       if (ISFLAG("--small"))             smallMode        = True;    else
+       if (ISFLAG("--quiet"))             noisy            = False;   else
+-      if (ISFLAG("--version"))           license();                  else
+-      if (ISFLAG("--license"))           license();                  else
++      if (ISFLAG("--version"))           { license(); exit ( 0 ); }  else
++      if (ISFLAG("--license"))           { license(); exit ( 0 ); }  else
+       if (ISFLAG("--exponential"))       workFactor = 1;             else 
+       if (ISFLAG("--repetitive-best"))   redundant(aa->name);        else
+       if (ISFLAG("--repetitive-fast"))   redundant(aa->name);        else
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 324276df70..1327c446b3 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
+           file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=${BP} \
            "
 SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
-- 
2.25.1


