Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED64CEFC2A
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 15:47:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12638.1728402449922649959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 08:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00114b8562=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4983t2E1011143;
	Tue, 8 Oct 2024 08:47:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4230r4b674-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 08 Oct 2024 08:47:28 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 08:47:27 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 08:47:27 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
Subject: [PATCH 1/1] cml1.bbclass: do_diffconfig: Don't override .config with .config.orig
Date: Tue, 8 Oct 2024 08:47:27 -0700
Message-ID: <f47c98577fc657f37b63003350eb47bfe9824044.1728402305.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1728402305.git.liezhi.yang@windriver.com>
References: <cover.1728402305.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Cy1f1GJnWRPb2NmLsmvHHLorgaObHwbQ
X-Authority-Analysis: v=2.4 cv=bP1EI++Z c=1 sm=1 tr=0 ts=67055410 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=8MGP5GKOd3gDfpqK-YMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Cy1f1GJnWRPb2NmLsmvHHLorgaObHwbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=972 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410080100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 15:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205296

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
1) $ bitbake virtual/kernel -cmenuconfig
Do some changes and save the new config to default .config.
2) $ bitbake virtual/kernel -cdiffconfig
The config fragment is dumped into ${WORKDIR}/fragment.cfg.

But the .config which was saved by step #1 is overridden by .config.orig, so
the changes will be lost if run 'bitbake virtual/kernel'

And the following comment is for subprocess.call(), not for shutil.copy(),
so move subprocess.call() to the correct location.
    # No need to check the exit code as we know it's going to be
    # non-zero, but that's what we expect.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-recipe/cml1.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 8c207daec41..0bf171a6681 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -93,10 +93,9 @@ python do_diffconfig() {
 
     if isdiff:
         statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
-        subprocess.call(statement, shell=True)
         # No need to check the exit code as we know it's going to be
         # non-zero, but that's what we expect.
-        shutil.copy(configorig, config)
+        subprocess.call(statement, shell=True)
 
         bb.plain("Config fragment has been dumped into:\n %s" % fragment)
     else:
-- 
2.25.1


