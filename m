Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160A6C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 07:56:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5211.1740815766133967141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 23:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5155a5e946=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5217nZSD015268;
	Fri, 28 Feb 2025 23:56:00 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4533v09cy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Feb 2025 23:56:00 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 28 Feb 2025 23:55:59 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 28 Feb 2025 23:55:58 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <jose.quaresma@foundries.io>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [poky][PATCH 3/3] go: remove support for GOROOT_FINAL
Date: Sat, 1 Mar 2025 15:55:52 +0800
Message-ID: <20250301075552.354661-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301075552.354661-1-hongxu.jia@windriver.com>
References: <20250301075552.354661-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HJQ5Fptv c=1 sm=1 tr=0 ts=67c2bd90 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=WBAJb5gv3E3ej6zVj10A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PPsuhZ668SuIq8Xte41eoCc0WIB0-UVE
X-Proofpoint-ORIG-GUID: PPsuhZ668SuIq8Xte41eoCc0WIB0-UVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_02,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503010060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 07:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212090

After upstream go applied commit [cmd: remove support for
GOROOT_FINAL][1], GOROOT_FINAL variable is dropped and use
option -trimpath to instead [2]

The option -trimpath has already been added to GOBUILDFLAGS
in go.bbclass

[1] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98
[2] https://github.com/golang/go/issues/62047

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/go.bbclass         | 1 -
 meta/recipes-devtools/go/go-common.inc | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index e3e4782025..c81d946069 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -15,7 +15,6 @@ GOROOT:class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT:class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
-export GOROOT_FINAL = "${libdir}/go"
 export GOCACHE = "${B}/.cache"
 
 export GOARCH = "${TARGET_GOARCH}"
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index db165792dc..ca8469dbd9 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -38,7 +38,6 @@ export GOARCH ?= "${TARGET_GOARCH}"
 export GOARM ?= "${TARGET_GOARM}"
 export GO386 ?= "${TARGET_GO386}"
 export GOMIPS ?= "${TARGET_GOMIPS}"
-export GOROOT_FINAL ?= "${libdir}/go"
 
 export GODEBUG = "gocachehash=1"
 
-- 
2.34.1


