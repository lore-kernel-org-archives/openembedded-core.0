Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4596DC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 08:34:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3009.1678869285769525332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 01:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2438f77fcc=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F8HAWW006238
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 01:34:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2avgavb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 01:34:45 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 15 Mar 2023 01:34:44 -0700
Received: from pek-lpggp1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Wed, 15 Mar 2023 01:34:44 -0700
From: Hongxu Jia <hongxu.jia@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] pkgconf: fix CVE-2023-24056
Date: Wed, 15 Mar 2023 16:34:43 +0800
Message-ID: <20230315083443.1329841-1-hongxu.jia@eng.windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: G2biemXFNhSCYstah7O4x-VU_s3GvEdL
X-Proofpoint-GUID: G2biemXFNhSCYstah7O4x-VU_s3GvEdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150071 domainage_hfrom=7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178528

Backport from https://gitea.treehouse.systems/ariadne/pkgconf/commit/628b2b2bafa5d3a2017193ddf375093e70666059

Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
---
 ...nd-stop-string-processing-on-truncat.patch | 75 +++++++++++++++++++
 .../recipes-devtools/pkgconf/pkgconf_1.8.0.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch b/meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch
new file mode 100644
index 0000000000..c6ec7c94e1
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch
@@ -0,0 +1,75 @@
+From 9368831d360c0e47df55d1bb25c3517269320c5f Mon Sep 17 00:00:00 2001
+From: Ariadne Conill <ariadne@dereferenced.org>
+Date: Wed, 15 Mar 2023 16:12:43 +0800
+Subject: [PATCH] tuple: test for, and stop string processing, on truncation
+
+otherwise a buffer overflow occurs.
+this has been a bug in pkgconf since the beginning, it seems.
+instead of disclosing the bug correctly, a "hotshot" developer
+decided to blog about it instead.  sigh.
+
+https://nullprogram.com/blog/2023/01/18/
+
+Upstream-Status: Backport [https://gitea.treehouse.systems/ariadne/pkgconf/commit/628b2b2bafa5d3a2017193ddf375093e70666059]
+CVE: CVE-2023-24056
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ libpkgconf/tuple.c | 28 +++++++++++++++++++++++-----
+ 1 file changed, 23 insertions(+), 5 deletions(-)
+
+diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
+index 2d550d8..b831070 100644
+--- a/libpkgconf/tuple.c
++++ b/libpkgconf/tuple.c
+@@ -293,12 +293,21 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 				}
+ 			}
+ 
++			size_t remain = PKGCONF_BUFSIZE - (bptr - buf);
+ 			ptr += (pptr - ptr);
+ 			kv = pkgconf_tuple_find_global(client, varname);
+ 			if (kv != NULL)
+ 			{
+-				strncpy(bptr, kv, PKGCONF_BUFSIZE - (bptr - buf));
+-				bptr += strlen(kv);
++				size_t nlen = pkgconf_strlcpy(bptr, kv, remain);
++				if (nlen > remain)
++				{
++					pkgconf_warn(client, "warning: truncating very long variable to 64KB\n");
++
++					bptr = buf + (PKGCONF_BUFSIZE - 1);
++					break;
++				}
++
++				bptr += nlen;
+ 			}
+ 			else
+ 			{
+@@ -306,12 +315,21 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 
+ 				if (kv != NULL)
+ 				{
++					size_t nlen;
++
+ 					parsekv = pkgconf_tuple_parse(client, vars, kv);
++					nlen = pkgconf_strlcpy(bptr, parsekv, remain);
++					free(parsekv);
+ 
+-					strncpy(bptr, parsekv, PKGCONF_BUFSIZE - (bptr - buf));
+-					bptr += strlen(parsekv);
++					if (nlen > remain)
++					{
++						pkgconf_warn(client, "warning: truncating very long variable to 64KB\n");
+ 
+-					free(parsekv);
++						bptr = buf + (PKGCONF_BUFSIZE - 1);
++						break;
++					}
++
++					bptr += nlen;
+ 				}
+ 			}
+ 		}
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
index 887e15e28c..cad0a0fa4f 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2214222ec1a820bd6cc75167a56925e0"
 
 SRC_URI = "\
     https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
+    file://0001-tuple-test-for-and-stop-string-processing-on-truncat.patch \
     file://pkg-config-wrapper \
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
-- 
2.27.0


