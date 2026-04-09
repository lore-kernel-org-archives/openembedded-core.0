Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93333E98FC2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:17:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126106.1775715410776009931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=it/zuvP2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394sTpu1739904
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=YS0UPuON322EFVJ+dy3hbPdC4b5g0kcmwB6NpEZzmuY=; b=it/zuvP2N+ky
	XCUlHPdvRH+DvqkFRlvzdpi24e4pmHknvWLgR1lE+PYQj+fY2/U3Vqd8nczab0BF
	d3ybqT3Xgz7LzSj83Xl6cRAn7GMGS5NG++040A+alKRxWjpIwlBoEkhh2Nkzt3rq
	e74I06v8C1PgS+Mk0xfNDIi0FiLTjFlqFFw88MaJemXF6UMgkiuaqjnRLtucdTZw
	flAEpXsLYE7YdmBJLGxOeeakQ7PmqLuInuU9+NPWNWlK96UORJIDRvIL4SPTtNQS
	fB+ppfdweINFsCdTz0KP9184sT0CmwmLxSbvSZPkLOi4n32XHPPulPuFuNbiYK48
	XJpaikDHNA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybr2h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:49 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:48 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 08/12] libxml2: Fix CVE-2026-1757
Date: Thu, 9 Apr 2026 14:16:35 +0800
Message-ID: <20260409061639.1688205-9-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d74451 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8
 a=Wge7mEMZo81WAwdar44A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7oGfEIv61vJLPuz6Wa9y-5vhcWDtd4RN
X-Proofpoint-ORIG-GUID: 7oGfEIv61vJLPuz6Wa9y-5vhcWDtd4RN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX22tAtEqhMRcX
 D+kqSOi4FsFYnSft6lotUFZZpnloqn1vZNwP36Q0ki9v2WVailGLlGtqwzLkP7asCnWK+Nly5l8
 bYaeZ8/KOuQaVKP8mUDZQT91/jMXEsiIf++w7Rt8PlKRwnSgvrQBMX6MgPqHzUvxt7J5RXi0Avm
 ilxf/Z1ewdbNoqGLIEWRju8P3XE+DB76LAo6BF2QQGkKpdUXD5JXpMSlaUse0MvERrGJzgLMTZ0
 gf36KPwahlEUv5KLhRp/RfyxupA9LI0oXT98cpJnOcYLSKSogFSln1XhMbBlcv8S/4AUJ8ifXKP
 Bs0NA6N8moWmranxLISIhWLsfQJdqoaO18NGzHFdDDpJAwxhZqAzfL7zzmwLNF6evd7/VjsN/JS
 B4QJSNjJrlbY5b/nRjbnu4B6RzZxGh+0V5rPC+K5KAEUc60DycMwgfWu8cLhDmlxqADKHNpugYn
 ZeXVBgPOv9fdw2ZsdHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234884

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2026-1757.

The shell is refactored [2], so backport the related code from shell.c
to debugXML.c.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/160c8a43
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1341deac

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../libxml/libxml2/CVE-2026-1757.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch
new file mode 100644
index 0000000000..b6e6373ab0
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch
@@ -0,0 +1,49 @@
+From bbe186902eddca01cc2049780a1d1a37937d3862 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 25 Feb 2026 16:16:14 +0800
+Subject: [PATCH] shell: free cmdline before continue
+
+This patch frees the cmdline when it's not empty but it doesn't contain
+any actual character.
+
+If the cmdline is just whitespaces or \r and \n, the loop continues
+without freeing the cmdline string, so it's a leak.
+
+Fix #1009
+
+Reference https://gitlab.gnome.org/GNOME/libxml2/-/commit/160c8a43
+
+CVE: CVE-2026-1757
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/160c8a43]
+
+The shell is refactored [1], so backport the related code from shell.c
+to debugXML.c.
+
+[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1341deac
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ debugXML.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/debugXML.c b/debugXML.c
+index 9d9618f..2d5c99d 100644
+--- a/debugXML.c
++++ b/debugXML.c
+@@ -2866,8 +2866,11 @@ xmlShell(xmlDocPtr doc, char *filename, xmlShellReadlineFunc input,
+             command[i++] = *cur++;
+         }
+         command[i] = 0;
+-        if (i == 0)
++        if (i == 0) {
++            free(cmdline);
++            cmdline = NULL;
+             continue;
++        }
+ 
+         /*
+          * Parse the argument
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 25da11bd2d..2bfa78324f 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -30,6 +30,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-01.patch \
            file://CVE-2026-0992-02.patch \
            file://CVE-2026-0992-03.patch \
+           file://CVE-2026-1757.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.34.1


