Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC8CD3ABCF
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 16:20:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.63312.1731342039575668921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 08:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045fc21af=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABEqY9u017639
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:20:39 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t3w79tp8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:20:39 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 08:20:29 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 08:20:29 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] bootchart2: Fix native build
Date: Mon, 11 Nov 2024 08:20:28 -0800
Message-ID: <6890ffe7090972af68b585b0a130b29bbc700548.1731341964.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1731341964.git.liezhi.yang@windriver.com>
References: <cover.1731341964.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4E5J9pToCRnnwplSdzGdSwJ7xGGswCTV
X-Proofpoint-ORIG-GUID: 4E5J9pToCRnnwplSdzGdSwJ7xGGswCTV
X-Authority-Analysis: v=2.4 cv=WY9eaFhX c=1 sm=1 tr=0 ts=67322ed7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=7qc236X2U0ynn47o93cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=588 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2411110134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 16:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206962

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ bitbake bootchart2-native
gzip: /path/to/bootchart2-native/0.14.9/recipe-sysroot-native/usr/share/man/man1/*.gz: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 8a211366bf..535af94ecd 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -138,7 +138,9 @@ do_install () {
 
    # Use python 3 instead of python 2
    sed -i -e '1s,#!.*python.*,#!${USRBINPATH}/env python3,' ${D}${bindir}/pybootchartgui
+}
 
+do_install:append:class-target () {
     # The timestamps embedded in compressed man pages is not reproducible
     gzip -d ${D}${mandir}/man1/*.gz
 }
-- 
2.44.1


