Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C33C83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 09:00:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14625.1753002017386586186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 02:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9296d98d46=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56K8xjDh3346479
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 09:00:16 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k08yr8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 09:00:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sun, 20 Jul 2025 02:00:04 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sun, 20 Jul 2025 02:00:03 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 4/4] lttng-tools: Remove the scope resolution operator with musl
Date: Sun, 20 Jul 2025 17:00:10 +0800
Message-ID: <20250720090010.3122861-4-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oXe5tJKumWoVKwT4tZn2-r-KJt7jqlAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDIwMSBTYWx0ZWRfX1Rhm8VQUhcjO
 eTHWfx1tU1QWb3RF/sqwWxWcRTVU9CQGwAlnOw7nLd2VVxoZqWLSXIEkOBIyh8sEDq4h8K270SH
 KUjHBofXuak/kPco2EbzjrCQ59cnNN7xVkEmiKqBLXAAJV5A+nfo2Q3z/3hMTTeEELuK8Bn0WHo
 IixnZ3wVAGbcyv1THK3e/Np2uIUCyuhxV4czb26uYjQ9bvG0s0ao0HK9kdK8dOLJ7IHvYqzv+tq
 kCThpjHk9tuaL6RGhiAEi+NCuzsNhFxCQ2Jy0nwrnn3WgIN8pTvO/bN40JOocyB4R0k972kWA9c
 Tz59D3YPDVNCegDQm0QV6q6P+CadxjvDgO+9g2oOTkhB4zTymKHJRPzyFltYMnN46excqtymMI/
 PoDVcKEv
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687cb020 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=6zuJ2OBVxoR8M5G13BoA:9
 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: oXe5tJKumWoVKwT4tZn2-r-KJt7jqlAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 09:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220617

From: Mingli Yu <mingli.yu@windriver.com>

Remove the scope resolution operator :: in musl build to fix the below
build failure.
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
 |    18 |                 int flags = ::EFD_CLOEXEC;
 |       |                               ^~~~~~~~~~~
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
 |    21 |                         flags |= ::EFD_SEMAPHORE;
 |       |

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...Remove-the-scope-resolution-operator.patch | 41 +++++++++++++++++++
 .../lttng/lttng-tools_2.14.0.bb               |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
new file mode 100644
index 00000000000..dac5002f097
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
@@ -0,0 +1,41 @@
+From da83d31a8dd555c28eb27bd7a7d3c53b51d5f276 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Sun, 20 Jul 2025 16:37:57 +0800
+Subject: [PATCH] eventfd.cpp: Remove the scope resolution operator
+
+Remove the scope resolution operator :: to fix the below build failure
+with musl.
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
+ |    18 |                 int flags = ::EFD_CLOEXEC;
+ |       |                               ^~~~~~~~~~~
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
+ |    21 |                         flags |= ::EFD_SEMAPHORE;
+ |       |                                    ^~~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/common/eventfd.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/eventfd.cpp b/src/common/eventfd.cpp
+index fe5b549..3379b0b 100644
+--- a/src/common/eventfd.cpp
++++ b/src/common/eventfd.cpp
+@@ -15,10 +15,10 @@
+ 
+ lttng::eventfd::eventfd(bool use_semaphore_semantics, std::uint64_t initial_value) :
+ 	file_descriptor([use_semaphore_semantics, initial_value]() {
+-		int flags = ::EFD_CLOEXEC;
++		int flags = EFD_CLOEXEC;
+ 
+ 		if (use_semaphore_semantics) {
+-			flags |= ::EFD_SEMAPHORE;
++			flags |= EFD_SEMAPHORE;
+ 		}
+ 
+ 		const auto raw_fd = ::eventfd(initial_value, flags);
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index da3bdd4052f..989c963c1f8 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -48,6 +48,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
            "
 
+SRC_URI:append:libc-musl = " file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch"
+
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
-- 
2.34.1


