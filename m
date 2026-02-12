Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E62EE36BD
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51610.1770919531504460439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rc0SShKv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5B5Ox2177871
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=e05fLn8qSubFk8zSL7N7dIOFw3OiNszAYgQB8AUMzfQ=; b=
	Rc0SShKvs8aJi2T4lJAcg0f3/7ihMBRPtYJTpnCFt6epFyxi+QQaVlixO/WSntIg
	N7o32s44oj0xgLM7EDpoojh/NLFBsMspf5mMFZioGDHwX2RiyLQn4suQJVnbw9qT
	AJ00s53dWupKGp5L/BICZWwMC7LEYLob8klJwYZ7RStuEDTXvpYW55qH1f3Ngmg9
	P17PhXmdFlkYia92XE0cXoYeOGk+aoPsgl9f6j9oRIKGrps34YNd7iKGUIzjixTQ
	KUo7JkHCbGt7BA/D8pBrmq7DIIpzB3Ku4qTB+X6JTiOyRne5kKxY0ad+/WVN0sON
	AA4+5W8MqljyaeTdgBBHow==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012012.outbound.protection.outlook.com [40.93.195.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwph3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:05:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO2DpY4Q4thlidBcZ93h00QUNkimwSjbTIcTV1pxwYNX7Xhrerf5iI5s+DYRS/aGgUUxag1iir/Vyvg8jlsKyo+MoFbMgMbdYClBdI8re4rhzGo5QUn1pCNuUjhFAQ6zpX7RCSD/rzS+rDNazfx3Jz3ZWLXzIZoWvHP/UYtaWzNYtbWTQ9bO+RdA4eV+zAMs+tF7y6+UfdyBQiqlYrQUPBc1sJ25M+Kqom4ltnD8b1h7R0bNV+i5c8ZEyb3g6It7e8jSSPsxsItshPAe3pV/tVavp83lTe04kSEfnDZYJ/ADCg5CuuOWC0uJW4UiJSkMCW7fAailyGQYolbP3ySsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e05fLn8qSubFk8zSL7N7dIOFw3OiNszAYgQB8AUMzfQ=;
 b=yiM4nd0wzIF7ze2Y8H5OB3P4TWptdWewOSQCmyTf7WoM926PHK56sWWSqNp8QqBTJ3QjP1/DSPo28wiZdl9SztluVotYplwBwE6TwzuXHwKif741vLOxeLAjtKWjrVFQE5ug6QQhtXv67V/9/xeDCrGQi03tIjP6JZx9fPH3Z3I3Jb/zRsvOC1uK4ybAz4FEAFVglHwgi2ZqdT2hZJeu52moeXx2HOOP/44hSOiLrJVVlswwFYCxsfbcPHTuKx/3Psrl4oX3+wI3fxnNWtqhxu7S5aV1goyMT2m5QpfPDU3wQYPRyplI46cOagH7LeFCocEQUBMlyHPS0xBVF4YU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:05:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:05:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 03/14] kernel-yocto-rust: enable Rust kernel support via 'make rustavailable'.
Date: Thu, 12 Feb 2026 10:04:22 -0800
Message-ID: <20260212180433.1825988-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
References: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ce58d0-f865-411f-0fdd-08de6a614db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|19052099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BveMZ6YhbMWxw0K45Ln5/zCne/I+GniynqaC9PDYn/fkxL2h2JneeS3lcW+K?=
 =?us-ascii?Q?nGWwz81IdgOhuc/RLW9ef1qyeVgOeBf9Bd0uBC4wKv97O8zQu4XlMkuOHtHg?=
 =?us-ascii?Q?urV7ZN4bZ0um1kb44wSvn0yv4eFaekOoXAJ+r3gwRl9le4Rxuvlabqg9I0dY?=
 =?us-ascii?Q?FUVksrUOHX4xDboCcQxx3QSib0qCYWu6VnUWhI09EF1d53gxArTAwczkyNbg?=
 =?us-ascii?Q?vnGJRfAb4varUXltltYzD5xgeYeaFoXgc6KCpxJO9MmIa2gqaLU0kTejuufH?=
 =?us-ascii?Q?tjjFEEenhvFDlrxWWNHZCNhOr7RWRMGXM13EKUmDMoZ/bRlJzGKqjJZcJ49q?=
 =?us-ascii?Q?wS/SWAiDYk64DAk6xsJVGmm9hVsD/oYIikDzYTxvLOMdqVCwBUXa/oBoYPcL?=
 =?us-ascii?Q?4UmZ+C5nOUKNnvV9Lt9CoGK3txPBEDJHJt7RlqLOAit+SkQb/1ZYdle3BkfL?=
 =?us-ascii?Q?W9haDerAPmbYe1nLNFumAPd88IxdVB/6H+jcFI38AbeCjLHICCH2KgBFXpU9?=
 =?us-ascii?Q?icuprTpWnw9vxXfZM2PKd/Wi3xRK77RU86QlhWGy9VGNAwmuMDeFYSTDswcg?=
 =?us-ascii?Q?7Pb33oBdpOXRkJg4npFd9szDlFWVgldfinvIS6J1hOIsP1RGJkpCFL5ACRu5?=
 =?us-ascii?Q?iUkcd+UoyF8ZNk+OI/1PxFQ63RiFEaDNsV2cy2Ml/6FPraUk/dkLpVmhPzfR?=
 =?us-ascii?Q?JUIHGo5AdbWsPQI9TOM8XDhKOfDS+Dlf39shxC0fY+cTQz9rDcjLSXkvxqC2?=
 =?us-ascii?Q?RIKinO5u9zlu4f3m309SuJK/04CtASs8N4+p63saCXMwCB53Yt6TRORl3m1S?=
 =?us-ascii?Q?8wVJCClY/SXMXzPCSYzEstQ+L0Bvu4TLBi1V8RF4A0w7a8gTpSn0jYS1u9kn?=
 =?us-ascii?Q?3hkrwbrgklomleVJ0IdlwMamTnemOJ5fBekQXMRnhX291cr96LWb+hsArVTr?=
 =?us-ascii?Q?T66bNR6TgbKuZ9UlW1EA+tPQ/BqG3m6h5rCIf7qtj81j894rgSMYi0SijLOt?=
 =?us-ascii?Q?lmtAndOIqcoupzs0cbX9Zq7G0tpfWEJZWQxrx0c1/Kj3NhBv2VoWzQw+YfWE?=
 =?us-ascii?Q?pdkBKfVCn4i2sMfFUiCczoh7ShjsVen8fINbWdEqW1XqsjO/YoafaV0cC5ia?=
 =?us-ascii?Q?Uj80SkI3aJZQHtG2BNVOFC8pp/KAerfGxxyWTArjNJdUXe0aZFMjCiinGAXs?=
 =?us-ascii?Q?ed0I6hB9rYXDf1HTPl8d5IXqDYmFM4lLR/i5Hx6MYPBupNhnWFP5g8H96RZg?=
 =?us-ascii?Q?oP8KN3ecQAn5E++bnqEuGBYX/ZgCFo1+kHrrUUcxepN0QmCt0gjyDRi8BY5X?=
 =?us-ascii?Q?RVLdTvgitKaLJLXLHbRmTf1YAtVngyecRLfxgxv/RdBxQ60h1qmF18Y5Mb/v?=
 =?us-ascii?Q?LKi1cgTn3OijnMN0R2+/MgvH4O19J6elJaKHgg5ggroYMtPqCPmnedk/AlJG?=
 =?us-ascii?Q?mBVEF44Tn4oPRBRhFLvbTl0pIUpITjRcBmvPcRnlsePg+e1BysQdDnf6Q1vF?=
 =?us-ascii?Q?6VN89jl8nQt5dpcwAAlxYZ+1kgb8TPWl1VuZVac7E6S47vFR1BS9x7YBy8iI?=
 =?us-ascii?Q?SDY1+rVsWUgkmzqqQjPtcHxYdNKpOSaxb5yc4F07BR8q7db/66KUCD3/SBGy?=
 =?us-ascii?Q?o2/6GkQgv1sUHE8iJUBnKTQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XZkYvjwQaWRkH/uhh224zn21EgfwDxIyAezJVBffQrYl4gib+xp0adLtKAWg?=
 =?us-ascii?Q?im8mNJi0x774Fp10fY6ylzq2XLGiwQcdyZT0B9KyQ/rzWkSyzjpKva56VOER?=
 =?us-ascii?Q?80d4sNuIqW6uThqJyyhn0zEnFQ8Ynp/zXtxbQZvbN7Zw29fEl2ghwyENZBzl?=
 =?us-ascii?Q?rNZw1mp0OXGu5T85KWpYm7IhqHZG61fEBqykTo9A02JVrwL3a4WkZUJPB//P?=
 =?us-ascii?Q?kDsd4GZ1rUQIQB1OR6uA0E/ru2Mi3JbLDJ50AkZ4z8ICFCCc3b+GbYhbQyDd?=
 =?us-ascii?Q?2GsZAH2S32VmOcvNNhkQTfF+OnqYICI+GoXAVXPMmMbFc4b0t4FInom0A2sD?=
 =?us-ascii?Q?OIGpMGsiPR6fAYOECruThIEg5wQddVR4+vePE4hxvJSLT9hFH1DAabpSg3PT?=
 =?us-ascii?Q?4uYiSAXiQi7xhktltcs6kkYciiyemOKIwIAzaAnFSgjtuOaSy66qLNhUYN0V?=
 =?us-ascii?Q?Fejf9h+GGj+Khcah4G+syTzaoqKlywJX0frUh16n6c7CFkzUIjxlSj9JFIsu?=
 =?us-ascii?Q?RPc1xOh7gdoyyK377UjCKlHQrIUXEdVR6Q45O87EAz+xEo3nz0JSH1tedvuU?=
 =?us-ascii?Q?X50Y3jg/+TBOmZRbvzgB5MOiVjLDqVRPYOjEg7vY3n2lD/dcs4Mck/bivPu2?=
 =?us-ascii?Q?pcz0kcPhkL3GmTBjp7/WMsCkEPCCcFiq5jLT3hswAdqkEGMFrdoN1jsaRYux?=
 =?us-ascii?Q?Pvmcv5vXTAVaUOOG3R+50gYv2t4noGt04ChVrmgRTSfjUHQDmjtO0RR5YN8I?=
 =?us-ascii?Q?iWNA5xpvdJkYw5a3vJpbYXLSxqKViIl9jcxK4K8/0W1gP4FpYd4ejjJbxCdr?=
 =?us-ascii?Q?CCVnXk4jJrGz42PfFf2qFKUQYcHwQMz2gTxR37GMDhexNIFmO0i1Dx7DndGD?=
 =?us-ascii?Q?lj30K6fbH4jc9w2RsXqoMdZv5oHXDKmyVF2hJrvm6VCs9s6LA1FwLs2icZ6V?=
 =?us-ascii?Q?LeOANHQrbK2kNSu4Cdu9h/SHfIjKZ5kzsHV50TdOOvys+mkRNBmjds85ezaC?=
 =?us-ascii?Q?QfRfO/C4Ns1VqyS5nbeoBx6ABgpdF3ZfI9mInGyMxXD1zGKxJRbVr3g/jbm1?=
 =?us-ascii?Q?HKewaKW7yyt1t67T4qxoU8hrtSaIKHVe3A/2merZHzKKMQmvBgkErsDz6Pqx?=
 =?us-ascii?Q?goGu8jJFWUTyo39WAjMrN6zxFj+xKVWyhyZUBGkI/S3RkvEiT5Pu5tinzVxW?=
 =?us-ascii?Q?IiE1vS6xsjzdOIHXTZXrU6U0MoJJCW5SC51BX4FddRgTuaM4GAXQ3m7VXpml?=
 =?us-ascii?Q?FxPi6QmIexXLn9tknYUseYkFl0NwTOEYuvKwR/bntciiacd1VA1wjGna52/o?=
 =?us-ascii?Q?zZlJYn6Uz5YxP2BII1ZcHNh/x9jrV64ZiLGSnIVzMycg8QpVusPJ1/3Gk8j7?=
 =?us-ascii?Q?mgXjgeCtGuRZv4sKlo5lFFUHOwOFihje+6hSEv0Xc+Bd7fVfUU0F2Wc2FM0s?=
 =?us-ascii?Q?RBGUvGAQl1OaKxgkAHJNUYeGs9UgieS62hU0wWj+YTkQm085wmuMLeq67NnF?=
 =?us-ascii?Q?Et9AmUDl6CG/HwIiB9QOAHirAD9GfhgEVRdQJiUdURSdhPlOVYgft/lvY+NB?=
 =?us-ascii?Q?q6ldjpqzQ2cpRn9w7ss3eZvyL4fejDihp0V7jze31tMThQHdy+AsODaZ2hdV?=
 =?us-ascii?Q?4IqqbJtODCi9mFpA5diBkehrj7e7IYs+uRXInXxgCVFBXhQTWe2ePtSatKwU?=
 =?us-ascii?Q?dOiS9YQrWaf1OGuFdQGj2Lzjln8IzNkjKeNHBlSL7thv3Ff51impHIhF4yOb?=
 =?us-ascii?Q?0x/X8VrAe6jkfZgTINeqgBeBJyKrZYQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ce58d0-f865-411f-0fdd-08de6a614db5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:05:28.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MueO/vU/i+TXr0dv2ALMsGWluQVsPgGyOnqP4LXBjiPBhMC9q402K+wg5Q5MLd723q9Zwrmo9jQMaALZZNot3q0jA9QFGBkoqNFxwxRaJzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e166a cx=c_pps
 a=AUi/O1gD07nBRLizZNiypw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=-yn6Wxg1_zSQloxVRBgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2fFWZDitczjhlBZ3Q2QzUTL4lQ-ZlZO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOSBTYWx0ZWRfX2O0N8gmUkuXI
 5Jhe9qhawn6DDyBoRCZUNh5IPLxLa8yau/OftIzo2Pc9Rq9oOWbmtrqH18604xw0L6PwhIxOnnA
 Qyg+b/7uHThjnn46NPNTibL9mxk2Y3rjGUkMouP2XyrlP7Dk52OtM3tR+p8UKE3sYptQGnB8YEz
 GWg6UnmKPhlDjxgGavF8Nq+7bCw3SIUNNj3ISZAZdZSptbp4Oj7tmJ7Ab1TiklBwkOkzas6rTUT
 elbCr9XGUKMMRQkBEykFDUvFf0W7j77SLLI2R3UDJ9WnsBI9X1yu/we5VnEVwMBEzH+Inrr1wyy
 dMSG5gApNpcKt9IBqZepW46euCE6kQNfF4xD15gW67E7M9C8g/AIBmvnw7kHbO3D+yElNJNVz/3
 J4r3WyDmX1Y/01ky4tWIMBmZqa+DA5ncT3fEwxopWEQvEGoRZLrBryVLQZ1lDZ7JYePZ3x6DoDR
 iNXtJyXDjFzuR3G/sUQ==
X-Proofpoint-ORIG-GUID: v35TZ6XoOb3vOj4gZ8-kSq7KDWvRGnu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231058

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This change adds support for Rust-enabled kernel builds by:

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 12 ++++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
new file mode 100644
index 0000000000..7acc81764f
--- /dev/null
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -0,0 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
+
+do_kernel_configme:append () {
+        oe_runmake -C ${S} O=${B} rustavailable
+}
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..5939318101 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit_defer ${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', ' kernel-yocto-rust', '', d)}
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
-- 
2.49.0


