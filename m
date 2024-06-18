Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB66AC2BB85
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 03:30:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.77975.1718681424331549968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 20:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6899ef744a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I3TXok011033
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 03:30:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys1x6jev2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 03:30:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 20:30:22 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 20:30:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][master][PATCH 2/2] apt: runtime error: filename too long (tmpdir length)
Date: Tue, 18 Jun 2024 11:30:19 +0800
Message-ID: <20240618033019.1181198-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618033019.1181198-1-changqing.li@windriver.com>
References: <20240618033019.1181198-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4L3TwF4164dRQucS_Ql_k1rhrJH5wDAq
X-Proofpoint-ORIG-GUID: 4L3TwF4164dRQucS_Ql_k1rhrJH5wDAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=1 adultscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=591
 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=1 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406180024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 03:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200855

From: Changqing Li <changqing.li@windriver.com>

when the tmpdir dir is longer than 220, there is no files saved in
tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
this is because apt-get uses the path as the file name, but the file
name can't be longer than 255 according to /usr/include/linux/limits.h.

[YOCTO #2688]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Take back from https://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
new file mode 100644
index 0000000000..c88efa3aae
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
@@ -0,0 +1,40 @@
+From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 18 Jun 2024 10:32:55 +0800
+Subject: [PATCH] strutl.cc: the filename can't be longer than 255
+
+The URItoFileName translates the path into the filename, but the
+filename can't be longer than 255 according to
+/usr/include/linux/limits.h.
+
+Truncate it when it is longer than 240 (leave some spaces for
+".Packages" and "._Release" suffix)
+
+Upstream-Status: Submitted [submit@bugs.debian.org]
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ apt-pkg/contrib/strutl.cc | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index 67100f1..5076b35 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -565,7 +565,12 @@ string URItoFileName(const string &URI)
+    // "\x00-\x20{}|\\\\^\\[\\]<>\"\x7F-\xFF";
+    string NewURI = QuoteString(U,"\\|{}[]<>\"^~_=!@#$%^&*");
+    replace(NewURI.begin(),NewURI.end(),'/','_');
+-   return NewURI;
++
++   // Truncate from the head when it is longer than 240
++   if(NewURI.length() > 240)
++       return NewURI.substr(NewURI.length() - 240, NewURI.length() - 1);
++   else
++       return NewURI;
+ }
+ 									/*}}}*/
+ // Base64Encode - Base64 Encoding routine for short strings		/*{{{*/
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 26a6d99f84..b6b56c0010 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
+           file://0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


