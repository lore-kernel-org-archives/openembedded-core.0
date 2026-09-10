Return-Path: <enoch.ng@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140E6C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 19:17:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22972.1789067865401694311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 12:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oDXrzv7h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3713e747d9=enoch.ng@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AIS0rf3535720
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 19:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LxDaSduM+dOkPUvmDFXI
	fqperUKQvw7Q7jwILhjHvIs=; b=oDXrzv7hSgfiSZv8jOfa8KeIjijoyXd74+tT
	OiA3+wTUV6BL46IreYHVeOloSlIwufuKkfIPXiTOYhcTpjzhqEtAgc+C7VuES3lI
	0mYjZTa/1w4hBSQ08S6DLQwaYhOsTexGE05Q+nh/ZkJoMbn8RheOPlc/7w2nh26l
	iIFfFCYYYZ81hhJiLPW2nS4FYARRM1VDpa8HlY3Z2p07yftg05IqNdlw5J80CUEm
	9/corkbrFTSVFPR+XFrii9pklUe2wNIWKdoBYNvETp6j2hjxiaTpWOmc4O4V1zoR
	h/zOzhSU2VMk1wnPbfThxqaTn5S0OkiZGANNXcICseFNqvo7Iw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023111.outbound.protection.outlook.com [40.93.196.111])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcyra3yx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 19:17:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI20c9t3aYSv+ReMlUxtDg9NssJJTdyJnAp2D+4DTPXTj9MFLL4EbUy4LFzsCsalzcP8XG2RxqgSH+XgZCOP5h/wgCQqzkKw82Gps4QHP1GuhLy2dI03hctSblW4woiJgHc3lEGLm4Xy0TeEtotebZlkhaGSN1xJXiGo89Aqs7ri4fkLJMi4SeQjB2hbduo58pxK6A9rh4pzCMo21xQvDDILb12IW54znr4U0SrzYxbXhBl/CNUFVU28pFvj5RneYSY1w2EkXWW8quDEqe34/4GnmtBaIgo8l6YGiBVIYhsBCzVFWkCTGYHfFnBxofam2Asbg4k9tjv2JIcrM7xN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxDaSduM+dOkPUvmDFXIfqperUKQvw7Q7jwILhjHvIs=;
 b=NAMn5hCoDmI8p/c1s+XZE3oWrinYrjHeEZgENmWtZcIyslN1suuIPe661u8Qw50Hj25FbMp4OoWP9nc1RedZ4tf/INW0ewLB4d+01Ka6wPhoC56ezZDWKl99j+RQGP9Rwfd5z5iB2s6oMeKLDuougM2Q4jl4ELNe7tSWEuLipOH88UZ3NVbGfe6kYwhfZTQOOk5Le51ubAPgB/rpKRmdCQQvtVDlb/m7QzbZP+X32rXik4YZ5I8kT7xEW9V3ARuHohsWNS9D6qF2BW6WPfqqbF4Q01rL7UrpjTwJZovAbKERFB0k2avAYkLNlC8Dor/0qo59PA1iIyAczrId/aLl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:17:40 +0000
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e]) by DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e%3]) with mapi id 15.21.0382.014; Thu, 10 Sep 2026
 19:17:40 +0000
From: Enoch Ng <enoch.ng@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: maintainers.inc: Update maintainer for apr* and fmt
Date: Thu, 10 Sep 2026 14:17:28 -0500
Message-ID: <20260910191728.1928198-1-enoch.ng@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To DS4PPF10012BF96.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF10012BF96:EE_|SA1PR11MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bac21f-efc1-4aba-deb2-08df0f702eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|10070799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ke9JXzBQapdlK/reJ5+akuw8m8Q4kwR9dBgsmUJ4ZpvzFnmSb3zmDNh4EVbCoLVzUU2fE2GAOivGIDV1l5YA3deVCPLy9VAcsdTQ3JOILcVq8hqQM8sc0K7yNFNHLN5Xiu5GzuDK7peZ1B1Eh3yW/Sx5sT84Jv3FkQPo7RhQRj2AF51owHNNzIiACPGE8T5b7hiSbUZdRv7vnBXKo9LqqHr4G9guePvqjcRy9Y7BagT2WMC5foGsKdFbGeX+DTgC5yy+cAXwDnatJ12585Jq6c+jb/l9KElVnf3mxnk9/zPH6FUJ20oE189+dMg87JFRZbvwv+U/XEfJJ/X/S0SL67re4iqwJ3KWmrnWqrHFBu2DJiPLW1VI5WC99tNCDfeKoDr1RxUB+QzAQYJXFFLYVNM12+mstqdoLsb/VQ/vHRXG/OwLjt1doFpt4vmTl8f8SjvmPr74xgdomKjnjSx6Nuh/Zijt1U3m/tjKOa5q07HqxHvsjxvGNMtZmQvXCfPevDhU4pPsFR0OA1LIXtJ1SCNNO9RS+PhBsoE05Qqw2LzIa5lDQvhkZBkDjciC994siBsYJfDJt8Pz/w5QnlUQ+Xz/gPO/Z9m6mETaPiqn7akTG0QCkw88+ycOMFdAPjkLRfJjQVjQ638dPwo20c+kzCZ5hR/JdKA1Cph4NGayzEQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF10012BF96.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(10070799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PdHt7hESaIQZaggD+NWxq1l5GKkMCrTVWbhOawkdDPeDJkKtY535d40655ck?=
 =?us-ascii?Q?HMRKiZgBE2WcnllicTS263pm6vu2dO0GAi5e8WFHn24MRk9/Yu8gcoI3yZK1?=
 =?us-ascii?Q?PQZIBXcRd7aFPpQSmXJolrleX9R9whLhEFu0IsoiNXjuBHIpwLrCEDlPl2Qz?=
 =?us-ascii?Q?diaDNXLHHlhQrzIdg1sJ2ForzskK8Ljay401A7IwkPcgEP/9HbAgEwhp2bTp?=
 =?us-ascii?Q?WiR/m6pkkD6+O7785d4XdIG8zV8ugRIyDj11qAQIGFsXdZ4Kmx4AXnVP82rW?=
 =?us-ascii?Q?ESmb8XiGIqo50rUlH1bSuDl9SD8L6AHpTeOkI9YX+y3ObXg+4aEnAO3GuDNQ?=
 =?us-ascii?Q?HDig1OQO5AWvChW60ho/RrDzdCZ3/xp06h9Uf9ZBlFGQmRsCiMV1sLeAsezn?=
 =?us-ascii?Q?kqf6uTzx+FwLMFCjktTelpGW5EaO5O0guPClD0TiSqRamyuRKz9OI2jEKQVF?=
 =?us-ascii?Q?9HHK6XJfw+PTqQ27yjepWG+Vc/VVqWyes8tdEP8nnjV4EJz1Ll29DUnWtSgj?=
 =?us-ascii?Q?1kcfqL2kRvKeKHAayqAY2SvJr3rYpde6sAxmg1ig9Ub4CvZMSeEhRPemk+J/?=
 =?us-ascii?Q?RlrPsiPlKlMYroo51YSln8mzxo+7O+VCTeoNdf7oMklXCy0Q+XM9uf5L9riK?=
 =?us-ascii?Q?aAmzJCKPDfPpO+GdhhxxWwVcIlTtTvxMEckTqOqEFHB/6I4axbHneL0h/8Se?=
 =?us-ascii?Q?/mk4P5oxc7iLUlhL/qxsfuK89KhlWZl/pNAAqbu6BTVOsqAdi8El3dEC8aJq?=
 =?us-ascii?Q?KnMfoLLYpGZw7oWA+9pLmDeKJrixMZuXjBJuzxFelFfSDWBiI4BoROk1fhZ9?=
 =?us-ascii?Q?IfJF7jIQ9yh6Dm8vTiIygygHWmcAPVGcekKv89PMEnnczqDMRoNL8b5ETA3P?=
 =?us-ascii?Q?p0olnP9wAtw2fgz66KddJzTZEfVCkiPPloDPs7/t5/Rl4hZK6mUc47fKzqxw?=
 =?us-ascii?Q?TdDd8C4FWW5M5ICJ4kKPtBJzgZ60L+88HK8slVOw9+G88zBdlDXJn/wMPF+Z?=
 =?us-ascii?Q?KEDpRtUCnAjeHAbQExq5f7ZNUhjPx5X4h9rzAeyXQrUw2xodOAPCut3GnhZi?=
 =?us-ascii?Q?Ni8YYZG9wavFjvKLRvOIcz3BCxiy4INhtW+Vvbyx/6xvTo9KB/hBC+jpoQLE?=
 =?us-ascii?Q?e/URX8/LGqiBEau86Yho5eIeMnviZobxkZ6XzPSQ1Ze65fUisFouS9/ulnYu?=
 =?us-ascii?Q?GqOkQGgcCoyxxXtVStbJ3t5cCBbbiNSquWbdBMR89U17UgD2aqqikqL0L9Mu?=
 =?us-ascii?Q?66WEgf81HDKKXh6LI+igKZyxm8gm27+uP99u2DN1X2nkTbDWGQHkKZfnL2QG?=
 =?us-ascii?Q?vMtbLUGqWCffK9JCFAZTKBJ4cBCcqHel2/GRto7dcbiA0SO/djZbfUSuKT51?=
 =?us-ascii?Q?PxN82i2hOti/xud0hvb556U3sEcMte2n5ctD3AYchDHT2r+HivbdPpBUnVP1?=
 =?us-ascii?Q?Woh0g9VH4NhwT9vBR7dJFC8Sowv1QIbKCych/+ZoZMC7JerWWrGeWxgzYH1d?=
 =?us-ascii?Q?WTFq3Io5987bC/UnO6PMxOibrtUpEXtBfTi2B6jQIT4MzGBpeQAHxLENRulY?=
 =?us-ascii?Q?yY6PX91bn1JqS0cFF87MYuIMmsN/saX0Jiq2U4VnTGO+UGicKqRB4O2H9GqC?=
 =?us-ascii?Q?1+007TAdOd8SP6SivMU5rbzwaFFS89AflCaCWJfaIYa9i3nN1ryZAEG7ry9+?=
 =?us-ascii?Q?0YYKH/dMpmuzWR8zCAQKNquAQuYr4+GhXvOQenDA+RRsC6JyIhUCpGR/okg6?=
 =?us-ascii?Q?Vc1smCod4UcLi2fysf64SDlP/Ro1Ngv/vnAXFKj+WWm/sLaxWgX2NUDW4zsY?=
X-MS-Exchange-AntiSpam-MessageData-1: 6H2YtYeMVRTKTQ==
X-Exchange-RoutingPolicyChecked: 
	K/HUhC/kgz8NgqRA7BhAIWMRzzEmQiw30+eofox1zV+WUT9FKP/Usv7TEAnvpoLqewG9tJLkANZaX50dXzQHYz5osWW3JeZOp0VZD1YhYrI/tjpEMM4EEPU00AUGGS/eEWgGru+jrXHXdqJ2YYl2havzegJyvjg6vk38bTxEhcOhEWyLwVLhk+ef71lKeJTAechlm39tWXhk34GUVTLoYYUah0MqclfFSFH5SqxeDOnFsqlrwvvdKfkdVWKOxSUtyU6U/Gl2EVsua2hycwOcCor35rkih1y3uy/ooxc+EXD/0B6y8ERFpMgSSU2G4g74twqlHM19W+SZetBQw8idzA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bac21f-efc1-4aba-deb2-08df0f702eb7
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF10012BF96.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:17:40.6629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vf5oWiUAx2oQkmdaBsLT/5MCA+2jct4cng3aDTjYeBJT4Reud8cRDCro0qxtk6H+UTA+IG4XDsPpi8RqGhPL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
X-Proofpoint-GUID: rW7oI2KkZNs9VSGDzS-ZnJVkvOyLE4z0
X-Proofpoint-ORIG-GUID: rW7oI2KkZNs9VSGDzS-ZnJVkvOyLE4z0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIzOSBTYWx0ZWRfX17iWMwCtI4S1
 INNGfdHJx0z8sz2qpgkUAmYuWgx9UXp6+cWlYJlD88ajns2GbYkRdceMLut03++ih9OBKUjbMKY
 6moz70wOi72zaHKXnHBx/xnCEf95cvEeItEA/5KtWMN1swnHW2XwaA4rD2WNoI0Bf95v8/W7nP9
 cB0+3EYw+fetKCMiXbjkER48onXVA6K/Hyr+cqQxpyAd+24HeVckanJPQWRTQ2uq5iUnSFsTrIq
 a9N5vL+1c9Fkf5QPZPYnwGgSRqVxyVp7y4d8IISmHr4L3dr8G7rycC7DyrPJDq5OQffWOBeXGp/
 J//m/JLilH8/feUawc+WyO0FCh28W75vPmEU9bJp770wXwy/Z5LYKVKZzJ4iGAk6/HUOyHaBRez
 voexVnFXRuCQn91SatgWKedGKsS+WCMUyFBqGYbtSI5ok05EkVr45O16LuDlTNUfHqBB/Lcq+vL
 arYRTS0ZevBUtrYKvvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIzOSBTYWx0ZWRfX9e4bbqShicE4
 O4VQayKgBejM0fGz48uHqwW86A5a9o0Y5GiDSc2RQzWLScsoYORbLFB4vBzN8N+OG7noXQYy4C0
 xN+acYZNPCiy78vFZbC8jr0iI0dUiB2IdQiw+rxvtqlBolu51w3n
X-Authority-Analysis: v=2.4 cv=NtRE4MdJ c=1 sm=1 tr=0 ts=6aa30257 cx=c_pps
 a=xKt9kXuiMwQaJDL2paq1FQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=d70CFdQeAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8
 a=w7VepgM5cCr8LUPBtRcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=NcxpMcIZDGm-g932nG_k:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 19:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245591

Volunteer to maintain the following packages:
    - apr
    - apr-util
    - fmt

Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5cbc60c1ce..473561cffa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -40,8 +40,8 @@ RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacke
 RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@rootcommit.com>"
 RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@rootcommit.com>"
 RECIPE_MAINTAINER:pn-appstream = "Markus Volk <f_l_k@t-online.de>"
-RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-apr = "Enoch Ng <enoch.ng@windriver.com>"
+RECIPE_MAINTAINER:pn-apr-util = "Enoch Ng <enoch.ng@windriver.com>"
 RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
@@ -186,7 +186,7 @@ RECIPE_MAINTAINER:pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-flac = "Michael Opdenacker <michael.opdenacker@rootcommit.com>"
 RECIPE_MAINTAINER:pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-fmt = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-fmt = "Enoch Ng <enoch.ng@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-font-util = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-fontconfig = "Ross Burton <ross.burton@arm.com>"

