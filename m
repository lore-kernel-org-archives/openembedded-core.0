Return-Path: <Roopa.Kalmath@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B044DCA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:14:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11053.1791803681803467145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sfzcl9U5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=474586a506=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Litg099863
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jxZEUsqjqPznCKJIhRmwmjlbwgEQhHqnUH6SDNq1nOk=; b=sfzcl9U5TGMD
	uiwhBkDD3NkgNiJYfCCCok2KPf5euSkoRIDN6BvOXKPeHg9oee5kNqQZpAYz74fQ
	rcpjeE6dPcMHPduAmT80Dlbi6Bq9tVFeXhtDOWHGqUV6OjX8rrXHN8cQmCC97SDv
	y91ou6ieXvFUmNpJDAkDim6x/Ul2lb6dw7tXJAAUdZ8KaEvxU3u7mxfxJFYO1Lyf
	kN6W3j2NQ89GSJB8ya3XZg9/gGYu25rorv6p5NFesQUmiKTHvxDLSNFYzJnSiZrO
	UdZW6xlStKsihEuIlMRCLYtZTdsFPsrwU/jHnns5eM8x7usWZNAUddJ1f2CqGSPJ
	jVA8uydPgQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7cb526de-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:14:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7R4TtD04nNYB23NNOVbGuQYplcrw2HufI5zsaoc+lS9R5pCFY00vGp3JeYQUakflBaw9wJGOcHyEsUSRp2toIBueFxKR+5TL5euAwI5tjRLqDs6HfzTY74d51IMOjI3+Lw7mp0I3h60eH3AMYGX4x2JUQqX5+fXFuVIx0Be1VSnghCAdRTrEbU+7AzyxVJCBT1DYofTvLofGtd3DvMPa1elrmA/WIlygaqY6zV6B4DQmZVHi4sGE3lzNmILahIgCxWmJbO7M9VKM5mfQq0WN3H0SqCvh62SbR6VpZgZiHXvuy8/NtS1Rfw0vXaX/2nzFIp3k7B9ZFMne7/kKHJUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxZEUsqjqPznCKJIhRmwmjlbwgEQhHqnUH6SDNq1nOk=;
 b=Rs0RVCWhHldgqpiJcZDMMVQMdfA6diJoPjD/lE5frK29hwwETN0AgdZRRQ1EHhOPGwXLrhXlGTLy5c0LuvqDTdru3LWU3SD7gjnPWucZH2uHYbc7JuuCZKwcWK3frjT2as6YqJEpb+nqAV22zBNpK20kcwubBwHODzA0qZHW+51Fr5PGyA0cDhJBhMknF6gssVEKUQ9G+G7iQ442Kq2Eiz+UNRxDpAM9tuDuOFB+Tc6RPd5DOplqJpXz1jDaZgyMsiKS+grODPBZ6mUpp+728wLDcfCzAXZCA5dHDgv953BmicRw6sWcZaEBM5/7UEJEEENgkROA0ETx2AA1zIH6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by IA1PR11MB6491.namprd11.prod.outlook.com
 (2603:10b6:208:3a5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:14:37 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:14:37 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2] u-boot: fix CVE-2026-29009
Date: Mon, 12 Oct 2026 16:44:16 +0530
Message-ID: <20261012111417.3043587-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261009120200.848470-1-Roopa.Kalmath@windriver.com>
References: <20261009120200.848470-1-Roopa.Kalmath@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0193.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::17) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: cd68121b-ac4c-46c2-4e25-08df285200ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|260925022911599003|260925021911599003|260925021311599003|10067099003|13003099007|261009223027099003|38350700014|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4buj56wG76r0Am7MFIUqFunteUI/a/YXncnUb1tukOERoA0d+hp+5jAvDvf+I7d760TgHInvgR8tlctc2BAkp0ebelO9upmpOSg44CaU6beb704B2sk72cqINNST5ZpEvtTzNoC49cZIgAR63gGqqFg/LZJhvvVXdHrITxwWiq4qBHUdtbUGtH0xbTQXUpkb15Jxmuz5yqH44zvA94a4zBQZHC6dAu5BVp2B5XMJlZwKjmTH40UCPe37wIi9iFlHotBiwyFmLT6K6MHSz2/aYIsJBfcegVg1Dlbpq2OjvjSFByq0tcEWWBAKsdb2B7/mT8leIuwQiIYLg/emhZrNdDXaGiUeICCt0S4Cl7ZhVA+iPXidAMZykCkMNt42ax1jkJOW4sBEeFbSAEG6NYWOr8aDkYNyWCnvijTK+Pe0MkqKt/xZB2svvxbPi7YSp4JEc97beFpfUxl/8pebcsFqEGxOP5nCNuAkohTLAERQZJga07rk3kJMmBxXWrETWvHPrg65YQQhJyllj2tcFR+P2HD7wfq6xqgKCxa6Xf/PkU/O4IqJFXol552YVPpBENS84uL14kvM8LV4PkwyNwDUxxvT299mZNCBQo/LhgaPWlAfLRywsJiC3FJj6qk2Qy9v18xeQtHOpENcXY92mM8u85R3qz8DY5KFRA65VaBwfTE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(13003099007)(261009223027099003)(38350700014)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8x0IgZ3zIBTiYBdjXZctdl9naSNFTMfFlxmiBw46UnNjKsGn7LBSEIbO1q54?=
 =?us-ascii?Q?YmibqEiYUolu4Jgyv64WsFPCVGukY0wNmqqAJXga4vjMOMGk3itx1/8t0TZJ?=
 =?us-ascii?Q?rnQ5pbbvl6M6VpiuHQM1eFTFaQSpVE9U1g9eHiEVZCP0FX2UkHp01cWIJrzZ?=
 =?us-ascii?Q?R0DHwePc50+lCzYjjNbC21P63/8lMJpvId3sAZeTdtX/WZW9tt0wjFUTJP9i?=
 =?us-ascii?Q?Iw6qfMuA1yEBpMH76nFGkZgiv7rmvdkRz9fpmE7OMRCkOns2U3XFWPgGKujA?=
 =?us-ascii?Q?nx0qwC3CuvHHQEnW96GAXk0SCZXygac31bmaUGEGKnyDQjtzgy1ot0uk4vYf?=
 =?us-ascii?Q?Qq2jo+7EIxXNHlSiNE/GxXd/oJ3dyMKwUghzWJdGTdRGO2VqcLOEo72UEv7x?=
 =?us-ascii?Q?q+UEiY+GmdHGSQD1M+X/vhYvZ6WUFL8UtHaW+tX0Q1MOvOk53MBv4xY0hTDb?=
 =?us-ascii?Q?QnyOgnmD+VfYaOzmTzfqRyLS+KUhbmUOnP0tSz+O2MIObXrn4orgrqZZONKy?=
 =?us-ascii?Q?dOScVWBTisMf51vdGqkEvHOipFrHtmk3wME0gWML2cEMTvPxSs9Lb+gW66qk?=
 =?us-ascii?Q?rqKyXpBAiYWJ2w8c15diGmVi+jpadYkVFmhoNmphxl1bg+RLCi5hrUABsIXe?=
 =?us-ascii?Q?rrBFHYVTi+9vhtLtlwZeQI+yoWxQQcGAPKGc4yYLuJ/bX7mCKbkzRStVkrTE?=
 =?us-ascii?Q?1IdUiuA57XjTtOc5hbP3ijuwSOXbtX4hUEgY033p/D/sUqxZHrTUJMf+rkfJ?=
 =?us-ascii?Q?fycJPhbyoel8yeOukJ2Mw8IfyMv+R+Rqz/YPDigZGKlpeD1brPyGMzBgx7Yx?=
 =?us-ascii?Q?B6aVWmgsW/MinP9U9wQQFaIGLffD+cIrLG9lwCVg6pXxaErfEKM/njh8xoFw?=
 =?us-ascii?Q?5OQdbOh0nWilVVQndRC211snP2dkNRR21uLrphjR2ImLEUsG5TOkVx3tJYDf?=
 =?us-ascii?Q?+imgPknerKYXb2BvL6YYZZDK6wJwVSqNl2/Bu/sm/RYOWktdZ0JqYtq/Jje0?=
 =?us-ascii?Q?bB5SvsMyyTOWuYXZ/mjS8a7qXqKza8ojlyTG2rerOPlre4g4l6l+V8j5Ynng?=
 =?us-ascii?Q?6TZoLqhP2gNkPNxS2D2Bfp0MZFHKWGsyhgpiDJr29guBrNK5VRcBzHkN9Ueq?=
 =?us-ascii?Q?Vb6jWIKHMhhrJ7F4iVyycl0z/m4UFECkCF28FXyFDbzgSu6bQpbUWRDRFGb8?=
 =?us-ascii?Q?o6Vyqln1VyB0aMuFaCHRefcXO9JiMbEjLfpT3UG7UjOeI9ATrM+gZHrXsCBt?=
 =?us-ascii?Q?yWWWEU/ffuUs0vKHJuA/CKCxhY4BgmQaQnApzgAaHxelG2A3oiknYDcLUUzP?=
 =?us-ascii?Q?ewVOkusiYQJ3jWAzRHKwDguh98hBWx2I1gt47bjleo24/tEkMbYtfApf3y7M?=
 =?us-ascii?Q?hHqNKZRdulGFRDoCHjW8hI+IHehylM6673x7ao8Awp9HJPk8egUKrGOBt5/F?=
 =?us-ascii?Q?Bg1Zdr7db9KAsCUGNnfNlu/4VrUuYK9lixk0KNnTv7gT11liwaZYqOFbyrzk?=
 =?us-ascii?Q?vzs0IwdVHhHBFCt7yIhvfCI2lAze1bbJtDLS2/5TxvQdsF2PCpGxtbLt1+y8?=
 =?us-ascii?Q?+f1NgdAfR5b7hs4riYeT6knK9ADmoRVThyznDONTSqgna6onkjKC+M/2VzTu?=
 =?us-ascii?Q?AhIsme48GHE3li9Cs00yVphxfGUnWRaERYsIpEDOW6Ma01P7WAscyyTmqMYh?=
 =?us-ascii?Q?OB7Oy1dKrHodpp85+cY5oV2SjgIa+czXu6Df6aJm5JifNcFqvxmIfS94CFeZ?=
 =?us-ascii?Q?1DDjYN6WinCjHZxo/bA/VpIdUuqKI54=3D?=
X-Exchange-RoutingPolicyChecked: 
	x0zrBvxbgqOlW3UfM4MXguds+on55zvtV8FoqPIbqYDpO2R/U3a4stKN37VsBjZ1VXgM32xsP/c+HjNKh9OdpXZGhCG8pSpp5G0Bcuwe0vYd5Ki7VhwZrTfsOzazc1G8yw5vw/y1V5bWGItOLKdakXgG/vkYziJ8rpoAwJ5W+gR4fKp7Wsf+4j3QYpTexssZ72mRE6EgCB+hNLBhdfLq+1tV0mF6hrGnYWEKyvwxza5VaJxSUjLBKwyTvL8jbiQfOtA/jJ+6t1BS0dLgG8esTcLmeFRQqI/zwIqiN9PVMmARvQ+ooE/+insG1wMMaAJ9RyED2lOLsjLVm75d5tmyoA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd68121b-ac4c-46c2-4e25-08df285200ae
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:14:37.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zkZIZJY2dC3Rfrwqkw5OzA+QsWdS84wuL/+MXi/yDAk2Q3QEj6atTTpxU7Pr7ukaDedkgoP1aKDE0CK0DSmoWucWDFwB4u4f0XYixMRXc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
X-Authority-Analysis: v=2.4 cv=K/a3jCWI c=1 sm=1 tr=0 ts=6accc120 cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=8r2qhXULAAAA:8 a=1VxDqnHFAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=9mBAJ5yBif5Chv3fy6oA:9
 a=8gvLZcY7Nlvl4CGD_6nf:22 a=aZ5uHUMKh6B-zo3GvD48:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=NLIdpY7OFUhHErZYHOup:22
X-Proofpoint-ORIG-GUID: -ZI9J4rBfBla3MJlXiiIKFM9lo11B-nj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NCBTYWx0ZWRfX/3jKHZJ6xuDM
 VSsSG/sz44Ku4Urrafx2XbOlmzn6EYXAM9gFT6N/Vydcmc5QkhlIQeWRfLqf/YffHTSd2BA0+IR
 4WGo+hN/pBbzAGxOqVR6FSbSdlzcljQVK5YqjS48Hk2vFqSUj3nN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NCBTYWx0ZWRfX6TJqby7SOECy
 CHVV/jCpphSAmDX5Xkv21nHj3M6ptcfHULbtpG9YNRwzs8rHc0zpvcWeTTpzbPJSo8YRXC0ZufI
 xFCEHRKH5gdPtq6FCJFs89sC0mfsghnOfgeDWt6/hcvk9fCEng1g2rCFsdMsaZ308qDoA2LGRZa
 WCOXKF2KRH/b5TPz8qVBHYYhXtwzMTKbKonN2EZu2NZ7Hy4hEoUq6Q354WdGYjSwlXGa28ByhP1
 31i0ND1yBBG/fcgxLavVxpdBDUlfbp4oz/pQ6ZkEEJkqx6OO8ZCC+6HQcRnrI7i9ocOm5ufrtq3
 OHHITy0NkYrhQR/NGq5kgWOM+/NzWaRuZZiW75YAjpIE/iS8rtloh9C+jFF89aDlM/SOaDtz07f
 hOiqhAv9K04gxXE/MKXgyDY7timVyG1tpyXVX5QzwEW2SB+Iz2lzs82TxOKFe19mrXB7LQRr4oQ
 YTs8HHCtwZADGstbNHw==
X-Proofpoint-GUID: -ZI9J4rBfBla3MJlXiiIKFM9lo11B-nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247636

nfs_readlink_reply() validates rlen only against the incoming packet
length (inherited from CVE-2019-14195), but not against the destination
buffer nfs_path_buff[2048]. A malicious NFS server can send a valid
READLINK reply where pathlen + rlen exceeds sizeof(nfs_path_buff),
overflowing the BSS buffer into adjacent memory.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-29009]
[https://www.cve.org/CVERecord?id=CVE-2026-29009]

Backport the patch to fix CVE-2026-29009:
[https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 .../u-boot/files/CVE-2026-29009.patch         | 38 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
new file mode 100644
index 0000000000..860e504414
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
@@ -0,0 +1,38 @@
+From 2b88f08722584cf235f7dacaa190af3d24deb40f Mon Sep 17 00:00:00 2001
+From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+Date: Fri, 9 Oct 2026 08:38:23 +0000
+Subject: [PATCH] u-boot:Fix CVE-2026-29009
+
+CVE: CVE-2026-29009
+
+Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
+
+Fixes: cf3a4f1e86 ("net: nfs: Fix CVE-2019-14195")
+Cc: stable@vger.kernel.org
+Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ net/nfs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 537d4c62..9b628ecf 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -698,11 +698,15 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
+ 
+ 		strcat(nfs_path, "/");
+ 		pathlen = strlen(nfs_path);
++		if (pathlen + rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path + pathlen,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
+ 		nfs_path[pathlen + rlen] = 0;
+ 	} else {
++		if (rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index 9610d9e8fe..8dd15cf9cd 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -3,7 +3,9 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-46728.patch"
+SRC_URI += "file://CVE-2026-46728.patch \
+            file://CVE-2026-29009.patch \
+"
 
 CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
 
-- 
2.49.1


