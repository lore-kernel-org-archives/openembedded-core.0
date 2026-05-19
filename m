Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E86CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16406.1779175554553006375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PgAhqS42;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F40E3123077
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xwHh/Dz0SqsAsRdxkk7lSqpMx9ZGEyNO5Z7SPcAOKf0=; b=
	PgAhqS42IA7UTG1ZjLWRJnRv5y8xtNYpz6tF51qz5TmlsQvW6anwYqm3ixl5FL8c
	eVHWK+vAoXQIAY6Dh8WGTuiMhPmdE8Zlch6OBgK2OjSlgTpJMjdKpKAkX17CkWU+
	YFVQQWCSsCU82t6GZ1V6/DA3GE63wBPdo+WkJ7YGeWK4nJ91leyl0/Ow4Abydsy5
	IJjRrIPFu+4Yw/c5KW2YMStV9haH1wvJVDwnW03UP0zxRTPwP9ebIZma4ffUETbK
	5CzWjubp9g0m6snF8hWRk4VxLfIg3GVisE1l3rSl3fkrPYrPsFXxmXJVMtgVIxCD
	dfATaiuqXiVpjf6qd7Oc2w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf37vq-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eohLwVGLoa0fn0kSwHX4KYuV9uDy5WlcoqjihmXWgCXOxmdN4KO9bf+hhljwVykdCndl7WMwiRnHQOLRX5JmisOevo2ibZ6Xb9qu0Gsi6CHHUSj0nb1swTPXh1VicfUl6KaYBqygbphRKF0DQT0AW98uR5sNgSZy1sehh8latak4SpVyVYpHdivFLAZOO4+6vGyf573bKBNdJDnQiLRuc+Vn1t9glGnSjufrFzk01XHdTnXM8sq+et346CothJ/QIt5RRFgBvHARYOsEmTnjCN0sujso+c5mJBabH/0nmqFqWCsmsA+vXB941ngSg+zRxF7mJ8RUqRvMgO2ILh5M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwHh/Dz0SqsAsRdxkk7lSqpMx9ZGEyNO5Z7SPcAOKf0=;
 b=BI3Pe0ODkcQXtuJHaj8jMFwpo7ILLUtw1jOc98kv8kmQL6xlpEGU7igATT3oNODM1hDfsaQ6xDLmv5RUmjMCpHqmo/dcyTT00lTwYK6c2HNKWX/2zypo8cw+9KYNqziSIWx8TPbADVZ+oKfHeHYc1CYrsETlVQowF7egai3MwBxlcoVdCSvpK7kQ3JJUiRVM7fnDMnuwUq1jl/fgerKsAYitNNsURA3aA6IUi23ZwQqvGokeoMkmDe2LP50xKFj8VKMNsD+ktFn4xbB6FdWaxx/u4z388gKbgOhFNeTB220F1VPuTEQKL1MV0g3y1NVRgtYcUm2Oeqh3W2Acl3O13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:25:49 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:49 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 02/12] rxvt-unicode: backport a fix for building with gcc-16
Date: Tue, 19 May 2026 00:25:24 -0700
Message-ID: <20260519072534.24588-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d63523e-02c4-4f4a-642a-08deb577d9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|13003099007|38350700014|22082099003|11063799003|18002099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	KEvP1O7Euu1XZAcNwHSxsw0tVfhu99E2c4xNXuBl8FVc2eX5VnnNlHafpy3YeQD6Y20tG41HfbTQQwRXkOdovJGTi+JBCTvsADsCon0HS1DJ3ePRbmizf6D+EiySw9kogxt90IxB0RoLvmOG+FxIbzxIKB98I09MYnf0WDXU3gc1tdOtsRSh9MzKEQNh4chpu86cIVwfL7Az//tsYzGN5MT8Bx9+TPy64c4SkUY3SXfcjICMD5yFgKuUFPVLyfZ4bTh+BRjiMWG8JIDy6/auerkU5VoXe7p6tPLyfu8ggRElTDL2WsklSFUThesesRc/8V9j6/lKtqAhgRoOIajBpfsX1us2VGCMgtVDb+3tHBpdTUZFWai61tS9g4OTwOwmGIqyUSXR9IUFwr43Y1iM8JXt1V0rDyC0nyFWY8IRDLtmkRApwYt13usCSb3k3McU4YJ4vdWxoj+WW7HkJpDGF7Ngm85yTfSrsVMA42AU97PT2jpR0kCDNhcZM+4wAn0l/BDDAZjMDL4meyFaq71MJluN8e9FpqfLBZb36ods170CvZcCTrfoCbq0ev6lcdnkxeupFpDrCzhyNHPUNwLt0NrEJVnCsOqv6HGW9PfEC/8b4t1QI9kAQsMypFSVGPQKSKxVfxMLpXo6/e1KqHCu0qVgvHeUv9WDpKK/FXLrPlpCTPbc2hUuO/w1LR4JHAwHWmkUckQ13l6wleIObfayYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(13003099007)(38350700014)(22082099003)(11063799003)(18002099003)(56012099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h+vxeW6//TjNLWu+4CqGuyYaaDHOnf9MXgj9peQiBJBSPoXkFOQI1FLUY96J?=
 =?us-ascii?Q?TlTp0mFYUanX/wTyBrb66HKzChi0D7SU2bCnOEATSnTFxAFGdKjF07X1p7QG?=
 =?us-ascii?Q?nws+W+SWTVAkAFiQrqG5bzG1ipTbnlk8tv94olegQDG/YgPkUewrX83pUC4V?=
 =?us-ascii?Q?Kcq3wJm5U1HkPCvW/v0m7Emm/iecmJzOl26ZYq/pT/E/xOgVerYkqRf4RVCE?=
 =?us-ascii?Q?ddvkFF2VrkeMNGMNrVnAttbbY0Rc7qGZkwtncJV3Ql1oHY3hfHcARUI6kWao?=
 =?us-ascii?Q?tIbHB0hi/mViji4gvYcQId4mfSx9GR1bLkRfY9XnbEXGwfGLvky/KTkS/nVe?=
 =?us-ascii?Q?R+mlLi8nY+UhXhN1WBV7bbV+Q6LOXfZvy1LhvqGLn58aDFTyRreob/HtT7fQ?=
 =?us-ascii?Q?u8awXlun0kJovfaYIPvj9L7J2QxI+YDgTreVfFGCAxe9AOdmqveUF8rnyGHA?=
 =?us-ascii?Q?MMn7ZDv1w2fsw+WctAGOHeBa+FwpvJ7hK7COl7z4v62XFheu/xXLn5aIqub7?=
 =?us-ascii?Q?ddDL90gmWCUTbtPd0HlB7sQq01SdbTBdNWczM2URS3vmhsvFo+LyGHhciuru?=
 =?us-ascii?Q?LSRgezC2X4ojh3l42BWadx/f0PtCh+azJh3CFHX1jF8eqKsaSHP8cL2MVWXx?=
 =?us-ascii?Q?QvKLAPoq+9ZU1uMXcivvyieLruwrfN9cnyZoAj+iweEqaxZ2ovIRI4TdbLZO?=
 =?us-ascii?Q?YJdWKIxktJbSrwrQhVAsThFhvqD0Cb8p+rgtslI9lUPhJV45HDmrn+RuwOuo?=
 =?us-ascii?Q?qUyqbE2aduJ0mAkiFUhhyZ8GGFEptILDbvKip/Kr/dse+8lPEEeIpDf38Cue?=
 =?us-ascii?Q?Tgc95/FuORFpHLOYxkRrl2iPPoKuz8TUW6mGsb/A3s8nGdvmDuD1U8wDN/uq?=
 =?us-ascii?Q?/3IdC/I13/WtKXYwnMPKsfEBsctwONuQyGSLCId+rWCl4KKqTWjkCiU0CZaV?=
 =?us-ascii?Q?wqYzuCNq02c6+Fpt5Ue4/EA9Y7rgeNiq49/EsFEveNLlwLwiMA3onFzpeLJJ?=
 =?us-ascii?Q?tc3gBIBZR3dxLAhnodApsVe0+RIUq9TJbqhli2ou6FIILayMH6GukGlikQKA?=
 =?us-ascii?Q?tkvqOKRsWTJl8C3M664qMMk+WE8kNBVPrzjlP7YBayByPYhtUxrXq2r/8QON?=
 =?us-ascii?Q?nyQQtmUDekbARhCTZCP8CwxutkomLxuueU0b3DePUQS3v8DvrkNufjf2Brl8?=
 =?us-ascii?Q?emma6nMiqTwyz/U1+6mKgUYAaL85qwEi6PEdOkHXnx4Qu9CzyWqJ7jAvIE8m?=
 =?us-ascii?Q?ljLQue5sE9J/X9PDHrK/IFECi1YFcUr5rjCSoJCqXBYUHArG76xD2fvFhDML?=
 =?us-ascii?Q?Rp6N/Uw7suXd01hoiwb1d/wZ/6mJ4WENxV25QtIseFVKGA4nIDvVYwZAyAV8?=
 =?us-ascii?Q?oyCizhvGfyxzs5Y6c1qkPHMvxxfHRDtSFSIPB/V2f6RmZmY2QtEJBnF8rNZo?=
 =?us-ascii?Q?G0+F5/yXCWaCS9CJVBTb1+Tq3xYF9aLaS99ODPKvODQccd7qqDuJguiKhFPA?=
 =?us-ascii?Q?uPR+b5SmbvSY5FyWQ3LGg/R2F/LJL9LtOpxeve98qDUaF7AKx/F/qPVx9Ciz?=
 =?us-ascii?Q?MEJ8EGjFaTCKk0aTtkzJLUg1McOhOB2YPy0UsokMeZE98hdrPs8DCrGFACrX?=
 =?us-ascii?Q?Dq9/GGhEgjByxNUnVBGir+kENjC0BmQ2A+mnZIzOIjODFl9g0ueWtUpw2fSH?=
 =?us-ascii?Q?DpiXEUGA0d1iqT6G1TC5J8FZ4STYzcu4oVogcARjJQgV0tLEID8Y9ecEhUSo?=
 =?us-ascii?Q?z/hjRHw9P9TMLGdTFIIO7BDD322m0XM=3D?=
X-Exchange-RoutingPolicyChecked: 
	Mh0wD/wwL1BmV7uLmvuswEQSoMB/dgQV0YcYB6EzCJqWNdUbjVsAhYNTspvWkcPYCyy+zO+b5gfkUbhHe3TqVz8CpkE6ks+vPz4Yqe2rO+ltfKq3rX6JHtE2sQtl+HnfpjWRSWSw/bsbNesVtZpT8oXvnx8CAmxc3bnDMpxIZiDbAjWnWKp0ZeNl+ZmAS7OVI+p3izytU7U+lHcouloV1YxYAdBzXL3QN8zyzg7+kfUImT5DGkJM/SioWasILEQaMevhRJCxYCxbha8F1oLFdKoNNZ3WvTDS5awQU/cFM984EKzSfmSzkFo/1fnFd3qK8nEAnR5s7VJ3/F5jPSP2+g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d63523e-02c4-4f4a-642a-08deb577d9fa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:49.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reWQ3LCEyovp20/JI4vQO7+WSkMUDZSP7WCls6px1cucS6Jge4wVCnuyseQArqHOlyx1hA52tBlxlL2y4t4MJVygHh6ko5Rrshj3l6+DZMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
X-Proofpoint-ORIG-GUID: kNAo6NSMoxsVQ0eB1NnmMURN_C8g-jYS
X-Proofpoint-GUID: kNAo6NSMoxsVQ0eB1NnmMURN_C8g-jYS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfXxmbs/EjjUWsd
 vmhH1hBW0yNIC7dcoqQfXWgZt4jF6CSsQgrnb0Lz9eQ//PJrDb2pL6bZ1kzYmpIx1tzEm0DoiQ7
 64mo2lL5Tzcpq4aUrDgeuUnq9jxxpjUSSRx/zkJVDwr4SkOAq99LkzwzTv+FXTvsEqflPYOTJBp
 rmmJibESo6/qD4VxX+XsYqMMktTqHUDvGWf0jV+oKX+k19YhCRiGREh6+WOYiuSBEy6k73Wqnm0
 qKUzAsAwn0NZlkS2iur+JRNIu4weGFxnhEV1jkxsJreK+pWyEsOn1HFKrTXWjZNeJC29GsEKdcC
 xokqqZODc1f38hlDRvnIcIcRMNPYEmFEpvNwm/B+lU0pk5Gl4Nn6rBl8tc5emDXppCXJmAvIXXh
 qwt1IEKOptU43qeDyIwPFnXsKhRE78+RvnrZ3aZ59aOtRjVzJUOdXeZ+cKWC6lea5v1PlrU3Gm+
 +2+R1QPMj/ZBIt6ehQA==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c107f cx=c_pps
 a=Qv0FdJiMAyQkWbHkl99ofg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=561Vo0wAAAAA:8
 a=t7CeM3EgAAAA:8 a=7mOBRU54AAAA:8 a=j0KEWJ7GEyusYeRizL4A:9
 a=pGV5B61SGPbAHu_EfFT_:22 a=FdTzh2GWekK77mhwV6Dw:22 a=wa9RWnbW_A1YIeRBVszw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237277

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

rename lerp to avoid conflict with the non-identical function std::lerp

Upstream-Status: Submitted [https://lists.schmorp.de/pipermail/rxvt-unicode/2026q2/002707.html]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index f8c0d8ab83..80791ca511 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -11,7 +11,8 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncurses-nativ
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
-	   file://rxvt.png"
+	   file://rxvt.png \
+           file://0001-rxvt-unicode-fix-gcc16-c-20.patch"
 
 inherit autotools features_check pkgconfig update-alternatives
 
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch
new file mode 100644
index 0000000000..facb574a2b
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch
@@ -0,0 +1,61 @@
+From 4ff364c3df99b02e658ac2b3d2eec7139c494612 Mon Sep 17 00:00:00 2001
+From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+Date: Tue, 28 Apr 2026 03:22:40 -0700
+Subject: [PATCH] rxvt-unicode: fix gcc16/c++20
+
+rename lerp to avoid conflict with the non-identical function std::lerp
+
+Upstream-Status: Submitted [https://lists.schmorp.de/pipermail/rxvt-unicode/2026q2/002707.html]
+
+Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ src/rxvttoolkit.C | 10 +++++-----
+ src/rxvtutil.h    |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/rxvttoolkit.C b/src/rxvttoolkit.C
+index d92c5b9..343a901 100644
+--- a/src/rxvttoolkit.C
++++ b/src/rxvttoolkit.C
+@@ -834,7 +834,7 @@ rxvt_color::set (rxvt_screen *screen, const char *name)
+   // parse the nonstandard "[alphapercent]" prefix
+   if (1 <= sscanf (name, "[%hd]%n", &c.a, &skip))
+     {
+-      c.a = lerp<int, int, int> (0, rgba::MAX_CC, c.a);
++      c.a = rxlerp<int, int, int> (0, rgba::MAX_CC, c.a);
+       name += skip;
+     }
+ 
+@@ -981,10 +981,10 @@ rxvt_color::fade (rxvt_screen *screen, int percent, rxvt_color &result, const rg
+   result.set (
+     screen,
+     rgba (
+-      lerp (c.r, to.r, percent),
+-      lerp (c.g, to.g, percent),
+-      lerp (c.b, to.b, percent),
+-      lerp (c.a, to.a, percent)
++      rxlerp (c.r, to.r, percent),
++      rxlerp (c.g, to.g, percent),
++      rxlerp (c.b, to.b, percent),
++      rxlerp (c.a, to.a, percent)
+     )
+   );
+ }
+diff --git a/src/rxvtutil.h b/src/rxvtutil.h
+index d08b1bb..ec69cc1 100644
+--- a/src/rxvtutil.h
++++ b/src/rxvtutil.h
+@@ -21,7 +21,7 @@ template<typename T, typename U, typename V> static inline void clamp_it (T &v,
+ // linear interpolation
+ template<typename T, typename U, typename P>
+ static inline T
+-lerp (T a, U b, P p)
++rxlerp (T a, U b, P p)
+ {
+   return (long(a) * long(100 - p) + long(b) * long(p) + 50) / 100;
+ }
+-- 
+2.49.0
+
-- 
2.49.0


