Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D03D6E2B1
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 04:37:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6009.1732077421508753868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 20:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1054b6dcf8=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK4O6FA008574
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 20:37:00 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7us1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 20:37:00 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 19 Nov 2024 20:37:00 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 19 Nov 2024 20:36:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] sysvinit: backport patch for fixing one issue of pidof
Date: Wed, 20 Nov 2024 12:36:58 +0800
Message-ID: <20241120043658.2026129-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -3SWffuugicFSNoJsgTvrMbl33jFtNxf
X-Proofpoint-GUID: -3SWffuugicFSNoJsgTvrMbl33jFtNxf
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673d676c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=t-8_O1zyAAAA:8 a=5lBHT7pM2oULDme5Js8A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=yfEXjMlvih_vmE0eOnXP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_01,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 04:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207409

From: Changqing Li <changqing.li@windriver.com>

When a program is a link to an executable, and this executable is
handled by update-alternatives, renamed to a different name, cmd
`pidof full_path_of_program` will not work.

Eg:
/usr/sbin/httpd -> /usr/sbin/httpd.apache2
`pidof /usr/sbin/httpd` cannot get pid of the process httpd

Backport the patch to fix above issue.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...rom-Mark-Hindley-which-avoids-cleari.patch | 31 +++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_3.04.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch b/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
new file mode 100644
index 0000000000..33c9f62eac
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
@@ -0,0 +1,31 @@
+From 5be52641a10ad6cd89bc7cdb80318e32be7e6662 Mon Sep 17 00:00:00 2001
+From: Jesse <jsmith@resonatingmedia.com>
+Date: Wed, 29 Mar 2023 10:34:45 -0300
+Subject: [PATCH] Accepted patch from Mark Hindley which avoids clearing
+ realpath information in pidof when trying to find matching executables.
+
+Upstream-Status: Backport [https://github.com/slicer69/sysvinit/commit/c06458e1c1822a2c8ff89fbdd29262ca97dd18b1#diff-4244fa301bd80b0a8f553ce0751fb0fcde1a45ee9dee71db85135cffde8ac712R13]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/killall5.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/killall5.c b/src/killall5.c
+index 86866b0..f7a401e 100644
+--- a/src/killall5.c
++++ b/src/killall5.c
+@@ -766,8 +766,8 @@ PIDQ_HEAD *pidof(char *prog)
+ 		return NULL;
+ 
+ 	/* Try to stat the executable. */
++	memset(real_path, 0, sizeof(real_path));
+ 	if ( (prog[0] == '/') && ( realpath(prog, real_path) ) ) {
+-		memset(&real_path[0], 0, sizeof(real_path));
+ 		dostat++;
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index 1dd5f575d2..d3f77d8150 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            file://0001-hddown-include-libgen.h-for-basename-API.patch \
+           file://0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch \
            "
 SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5"
 
-- 
2.25.1


