Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3E9C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 12:24:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23863.1754483084239099699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 05:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=031303e4df=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 576B6e0S3549337
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Aug 2025 05:24:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy9rtjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 05:24:43 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 6 Aug 2025 05:24:41 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 2/2] tiff: fix CVE-2025-8177
Date: Wed, 6 Aug 2025 17:54:13 +0530
Message-ID: <20250806122413.3600531-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250806122413.3600531-1-yogita.urade@windriver.com>
References: <20250806122413.3600531-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=6893498b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=5vSyN_hxAAAA:8 a=zeFUTzhvEqj9sz3i0PIA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1zBLIHEOKY9YwKILsQtb:22
X-Proofpoint-GUID: t4IebRcyim9CyiO1yvrOdGgJh6A4jG9f
X-Proofpoint-ORIG-GUID: t4IebRcyim9CyiO1yvrOdGgJh6A4jG9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA3OSBTYWx0ZWRfXxDgLcPdGPSn/
 yeL4wYqZJliOE+assiaZi00hfqOApDFloEgPxBQNkIYKLwbTH5HuGwnxlnbn2VhPryGd+kRlzcB
 1vNU/qHa1KJVJNGGb1zadeNBRI1pjp/IyesS5DysrKVh/7ltv2V3tTMdWWfZWpyOOZ+VgjwlmiG
 yWOriOfacsaY7j0TWBxUI4IamMG+WeVd/TKaz0+BcCbXbl8h6dTDRs0o9JGYzEn13NIUOuKM1mw
 xg4irepP/ZKt0FSRivHRoUHOxLdiTPtrwaWqkZh+AWhAI+RLuQUYP6cG7XI3zyCY00CxhYdDy9G
 1UuHIJVQMdsWOTw7oy2n+E4RM1gEw+4mt/K91SLGAxclOXgq45v3WhYNDwAQbk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 12:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221535

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was found in LibTIFF up to 4.7.0. It has been
rated as critical. This issue affects the function setrow of the
file tools/thumbnail.c. The manipulation leads to buffer overflow.
An attack has to be approached locally. The patch is named
e8c9d6c616b19438695fd829e58ae4fde5bfbc22. It is recommended to
apply a patch to fix this issue. This vulnerability only affects
products that are no longer supported by the maintainer.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8177

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2025-8177.patch          | 35 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch
new file mode 100644
index 0000000000..30dbccd94f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch
@@ -0,0 +1,35 @@
+From e8de4dc1f923576dce9d625caeebd93f9db697e1 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Wed, 25 Jun 2025 17:14:18 +0000
+Subject: [PATCH] Fix for thumbnail issue #715
+
+CVE: CVE-2025-8177
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/thumbnail.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index 274705d..8960d36 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -538,7 +538,15 @@ setrow(uint8_t* row, uint32_t nrows, const uint8_t* rows[])
+	    }
+	    acc += bits[*src & mask1];
+	}
++	if (255 * acc / area < 256)
++        {
+	*row++ = cmap[(255*acc)/area];
++        }
++	else
++        {
++            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
++            *row++ = cmap[0];
++        }
+     }
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 6ff31bd0bb..4c9c212312 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -58,6 +58,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8176-0001.patch \
            file://CVE-2025-8176-0002.patch \
            file://CVE-2025-8176-0003.patch \
+           file://CVE-2025-8177.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.40.0


