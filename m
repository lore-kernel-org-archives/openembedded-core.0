Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4645AFF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:16:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34458.1777969009878733772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AIQ322NX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454K2b02004717
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 01:16:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GQtxECEDo30NmBimHB1n+Mu5PDlL7jVVJqOplq/+FQQ=; b=
	AIQ322NXBwtcJzAInwsYMBDqR9v7vOUvl2sb8N0bB+n5xifRwzPgW/fhOSREBAzP
	p1eFYwZlxHlVftEQso0y8auZ2AtWRGOS5GPq6DrUb9Bu9d6EnZSZiz7c9TpdB/Zz
	VtIGjlzxwsPhhbTswZZdDiSt1AWljsV9SlKuqBbDO0YXmGLMwOy38Irb45qKWwNT
	0glfPM0Yr+GO0wR/PMM2Ci7Nm58n6iltiDvLVgz2nFDbfj2k3Kk0k9BFveEXi7M7
	V7T6BrVmoqmr8P6NaFFvwaOIKd2DiA4DIiyfjf17EczZ9r6rowq9uqNheVSnUVoI
	RSpts4T1bToRssrJuqQUlg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchytwck-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 01:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QILX5oxq1YmXLN9gCCfOQhPuzi2FPP6Z9FVLcFmIKM2FRT3E4UbBGSP/qFwZZriwW5qNipVug9pgeBQJipEA+HNsPDlb6Lm4YmnbuEbn6jGTvWCa3IY+Yj4Hc/lBW17yfa2tE6MMsrIwwfMr1NHj6j5Q8qwHGgxg/vMFsEdo94PiKMnMva+TzPaUqnzmnAcoC3okJNTvtCe4xjyX/iCeib52hZoGPWTsREnysvxZzFhj7xzw8Fy8EV/MLMbLz8jntbbkxLnAZwuDtv+a63x/bhOc9ePrfTfo0/TP/i+ERQAtslc/GnFbXLvFL5QUuvgMD1xrnhjh7ST++7e0Azj9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQtxECEDo30NmBimHB1n+Mu5PDlL7jVVJqOplq/+FQQ=;
 b=NE9tlvB0e+f7VRRFS4qbeO5znbjmn5VzplLOVXvx+M5vAAeKRBKv6Va6LxfFniuZZxxEJNuhy1YoXrzCXWsDLMZGz057ldD24Lh01mxBzf3nbDzagRlOQr0z/y8yz3mXcpsPhiaVzmpV8AAd/1xc0BFJQbAHgC/X8lK8J31j9oQSV62C8JhiNykk4N7p5xBese9xZOTicKkLQP0gwUwhaTZtLd5i0Gdnqe3uTnuzBbhzYr6zANe5aF8tgSXxDX4J/cWGIUUYIJj2HyuVxeTRhmvhpvNtAyzQ2JbZqPdrkn3SNTw2LdgiCQjGwFAI/d0wV6TC2QYe3AcV3ItkY7F9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:16:46 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:16:46 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        mathieu.dubois-briand@bootlin.com
Subject: [PATCH 2/5 v5] clang: Enable cmake flags for llvm, clang, lld tests
Date: Tue,  5 May 2026 01:16:22 -0700
Message-ID: <20260505081625.849368-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: e8529ff7-2a06-44ae-3b3a-08deaa7ea3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	balESG7zu63NsAhsDPjkDhDHqCFkisQiKGY+wDFwMt4SRWzdmzjXY8ZNtShBFGbK9CciTrOXe7MrPNL0rrF433sL+a5p+IzVUPF8kPEFNFPh6/lFvp7X68rZnwIDCS/2PeC8fPsEExNEQIfdikvhnVGHH5yTkshL/vewVY+356xQhoXJro68XrSEDJQZ+hTA3vsYv81XXTLYIiUkiIZPbMVIP7tcFe5EmF8fONSq4bX0ghBUZ/lJzzokFLk29aV4+8RhFlJTEuKUGIda8pmZ5f/NTUvAok5pkZ6jcMKAqvrJJ8kAuF7AP5zLZgmZXEIFCaudYMNDJAXxftHag/PwmWS5Echc5K/sbUOF5acIqtrOLh26KTWL2k0eRZm2eEdwb1YYN4qMOkmGEYUDyDeybQ7XDk9pBD7nJAvcnTffhYD1bR4XNuChSoK5mObJTJogruXbN9+nLfX9Dz2i3lAdUCK3duW8uKEbWyuKSjCod8GKmjqZ3QPSpQGQmluieglwr2Rg2wnj/2hilmAaAudyAVswg1jI3hO4uTzgToYhbGSh9xUVPP7hpWiQ2KDL3JcSYL5eJeV1K2P0BDId4n8q3L9DOqxfpuhD+kzW49Jss63KuHJY0agAtDtn2fNnAWDCa6Uq5MQt1VuxzPmWVn+agPAwaxa61F/YTIPQmmShmZYIR3D3ib9ZbLEMk7thz94FBjsGX9Zf/gVj4QNTaXoMDA9Jj1YpWJ8GblJnL7+GEFSmuXCBUfHfhZ8ReARBiqUw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y9dsqRXbwhJ1rh4GqnSNRT/5jQXL6r92rwbIFb2rI1pxeRPHTyWiaG3BhMrp?=
 =?us-ascii?Q?nqQH5Tkr2t8xjgUbzvnY8+tS9zXIM15EqBno7w873R9QViBKT3KMPqwXh4hj?=
 =?us-ascii?Q?w/yfeNiftKr1T2TdQa2v7FvaOGltATNnM1TjrHPCuh6IrgvbJ51Rcvn7wukr?=
 =?us-ascii?Q?oQpdAINtN8uJkj7ZOIqCLUpdjwvUQq4bbaI3HC20FLe66SkLJBzI2FC3jiNJ?=
 =?us-ascii?Q?fDv5HzxtDGDhwJolwET04B1W9dSuO3TVjiJMHvHU5dVIxOmpArx6gElUy8ca?=
 =?us-ascii?Q?H+QCC4zn8r6SjI61wqcegHAhdho6KYNlo6KgYxiMut8mM1YeK+DdTsEFDTqs?=
 =?us-ascii?Q?ZW5MIS2ZjjuJ6wJZ25K1ToPYuFua1NgfflGeAfAAUW2/TLETlelhiC5DMmeZ?=
 =?us-ascii?Q?YpY/WQ0Zzoo6c8f5LnNP2cZ1QMExs/Ps+eURex2EewvMETJIwoiOT3QlTTxc?=
 =?us-ascii?Q?udS3zl3vvQcg2hIUuKPKJEAkjKdgoOW872JCxg3+td1mV3saVBY7Ia/R3Cra?=
 =?us-ascii?Q?pfIzBy5H9kai2gO47HkjrbjE8op7Ar42WqmkfbcKJoLoBtw2Jz+R2/S6A+gM?=
 =?us-ascii?Q?MIHefcjUbsSVNmVRCDw//7sdSrcRISDwR5Xe+yb+vn95hGPq0RV1sGJabBBu?=
 =?us-ascii?Q?L1GRFJ2LDUn976Za7KqPYn9n0y/Bg+csBsrwt30A/Cj6TFORi4lFVd3Lgo9f?=
 =?us-ascii?Q?8Z4pljKP3GOOcDRd+yYvibQwqIWJwJGas30Joi/dqqyYY6vFeuuCCYem+iZD?=
 =?us-ascii?Q?+40w/gD/BB9oJ/sCyE5PUubmEW6GqwjlumkkrqRkJSsYS4UtJuAISarMixBK?=
 =?us-ascii?Q?7pIoDs+YvB+LobRXR08yUnv+LjM6+GF4h5pKLDASRNDpk8AbMP3VXik59Z+p?=
 =?us-ascii?Q?7BAb4CzAi9LC1GvQe3fpLQCKxyuo4xMfBFmmZdtc3D73GFrzko/rbIiFHrls?=
 =?us-ascii?Q?KXQyM0zkvOWlFLUIhencT7jEX7eHU4P08kljf55tMVNyi+c4gffqW4kagCKR?=
 =?us-ascii?Q?5RhjkKxV0Rwuq4ou5s/2Hk395N3sQkYtc++ux3kSsKAZfGPvd8M7PctFLH9i?=
 =?us-ascii?Q?MuxauICFursjwsTbzw7MwNcYc0nyGOMHbFxA0PfCCZc0urzsxStD0SBi7wVK?=
 =?us-ascii?Q?G4LZULA8jsiFY8asSjoT1KdTpk/vU397kzP2kW5cDDNvynpP9ysY9JlJu2D5?=
 =?us-ascii?Q?DHPbXaMumuhlV+P6v3w9UrfGobtGaQY69nbBvUqMDQMMEFzXtzLv1Pv0ODYz?=
 =?us-ascii?Q?52MaTHArERYoDgIQCt5ZTC7HeNFHZ9zM3L11Pt7X9TygxjQPCiiGphWhntpL?=
 =?us-ascii?Q?rKAYO+7NnzCrIe51ABQp4Vdf9vuqqzHfll+wiCmhDP9bZ/ZDiEG7vIVBvFdI?=
 =?us-ascii?Q?p1znnRJIoCFXwgt52xNdXs1RAxAfdbslR8bhefgCx6OyhPzZnmO1SlJqgAat?=
 =?us-ascii?Q?87NhrwvW9eEjFLiwpRkZiLOndIk4N+US0uIKue1FlFc5L3EgM5WXlAxJOFIz?=
 =?us-ascii?Q?3wl03heTQoYX7e+o8gBQb6rGNCVFc3cXz2TWs2kzxBEDpw8Cm3KbDn5Ib7vG?=
 =?us-ascii?Q?fnmZhzZh27I/1gjnskQsUiJrjLGKWXeJM4zJ7AlZFzI1czXvwMWm6BQJ0AW4?=
 =?us-ascii?Q?5LniJFcKR1HvqU0rmG33gKdtOeoaSKP8yMp+Tr5ll/l12TijBN+HrkOoO5Ks?=
 =?us-ascii?Q?foYgs+DxNAaoEVXCOZVA5SMhv5YDkc+GILyfSncsvUATSrhR7XkWkBtkigVb?=
 =?us-ascii?Q?0dr7Xh6q5IH8TKpW6bE9TwNpBFa/ExV9ud8MiizFYaHYuGSslQ1D?=
X-Exchange-RoutingPolicyChecked: 
	Ol+S8muRUv7DlP7YaOU4vzUgIhNvzdqnu6AN2UUMd5vy3oySzRlXG+fxL1dRrXZwskDdE+bwkMde3q9UjM3bIZDoVlRDoCMkyGCTdgGkhUWEUbCKLm2y11PO34bjgv2WBi7DR9EpHOmMkAIYoElr4ABzNX52wE36rQMQE9Qu4yWmQiw+F5VszccuNO8lKTeitovq0tjKSjwGLCOTBdueDAeAd3+wdyLrpiCR0G3FqCLvuNL/N0dkyYT/A59DmMrat/hCpNfAXSKU+ZgTya0Px1U37i4DSFgDJ2Sbsu15kdW4AVgjbl1GC7RRr9rlJ3t9gAGeMYp7pK3Jap4aJZog2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8529ff7-2a06-44ae-3b3a-08deaa7ea3ec
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:16:42.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iITqO+rVF1sGJZUbHU+SbwVFxfa8crcsNuSoccr7JcIUwmcNKDi1ohHRj1dfisyOEE2i6KAOlE9XA4L5zLruGISA54mv+PdagKS0bNAXmj4CQDZz5j4Iy9A/XV5lBVIW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3NiBTYWx0ZWRfX9Aasjq1HnZG7
 7bC3gNGgWjlPZwTg5ruDzwqxgfOSfrpCPXjv/zRN9Nj1lE+1gB/vMlK22NRAXx+suPyPOn2FKIt
 ovLpdKeLqQttw0iD21RYLQ4BrXNpiT58qOyRYF+PHGLOZDPcWVKcrS74vP6UmDqEwRCH4hJn53E
 X5uz7HZOl0XRe4kYq56rl/y+Dja/E0uMvoEeG3ziCp4XGntVynq72SQk/8lYyIz8amAi2AWI8w3
 8UVKryOqXwVBW/IUxPUkNzRpEvTiC6Wb68giuRAKnHyXk6/IVU1vOEXLt4miY7n6hHGxrKf5tkX
 5VAGpjWCFBF91HLkygiRIYLifU3jK/CFV3poK/0VWAqtqy3NP5I0JUuI9jfJN1ks3stTzHxChNK
 JExk3W9BY3KFDEjRrmuYv+lbmhrCQqYlwQ9gLJzD0rYjedDXNlDcs24cphIpkBxGwx71dLj4lTT
 xkwMDvVM6FwMyaZipjA==
X-Proofpoint-ORIG-GUID: f2WSfc3dRJjbEnwxZ1WjwWndwkAe7DqJ
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f9a771 cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Q7J_BWS0j0Z7kq5DsWMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SpBFinFd2HQPRVSSNDA4x2V4s_MA2TKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236468

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Enable the necessary CMake flags to build and run tests
for LLVM, Clang and LLD. Install the LLVM target tools
needed to run tests via llvm-lit inside QEMU only when
CLANG_ENABLE_TESTSUITE = "1".

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb |  8 ++++++++
 meta/recipes-devtools/clang/lld_git.bb   |  5 +++++
 meta/recipes-devtools/clang/llvm_git.bb  | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 662cda1b2e..080feed63a 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -77,6 +77,14 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+CLANG_TESTSUITE_FLAGS = "\
+                  -DCLANG_INCLUDE_TESTS=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('CLANG_TESTSUITE_FLAGS'), '', d)}"
+
 DEPENDS = "llvm-tblgen-native llvm-native llvm binutils zlib zstd libffi libxml2 libxml2-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..8960cac2d3 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,4 +19,9 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLD_TESTSUITE_FLAGS = "-DLLVM_INCLUDE_TESTS=ON"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLD_TESTSUITE_FLAGS'), '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..e7823154b9 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -80,6 +80,18 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLVM_TESTSUITE_FLAGS = "\
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
+                 "
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLVM_TESTSUITE_FLAGS'), '', d) } "
+
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.
 DEBUG_LEVELFLAG = "-g1"
@@ -118,7 +130,7 @@ do_install:append:class-native() {
     rm ${D}${bindir}/*-tblgen
 }
 
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', 'llvm_sysroot_preprocess_testsuite', '', d) }"
 SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
@@ -126,6 +138,10 @@ llvm_sysroot_preprocess() {
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
+llvm_sysroot_preprocess_testsuite() {
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
+}
+
 FILES:${PN}-dev += "${libdir}/llvm-config"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.3


