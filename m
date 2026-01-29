Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0F7D46C1A
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7165.1769656114258187671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F01c/lbc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64891eafc2=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T1fZtT759257
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 19:08:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=w4KD3KYF+9ncDz/04CKE
	U+Nq4QpXBa6Xuo/X4ExsZ7o=; b=F01c/lbcc+MuyGshLt4DGkudsHt0lOVJCj8b
	HoIyEbz1/Bj9+Y6EF49h8/JdJKiPm0r3GwysYh4LDzhXDIl862wY6CbWvMqtd7cP
	Xg/nhQHpWUPjrUnM4vVUf1e9x8novMMcP8OCHxnYU2zG23tauyo1G0WXL6dL0A1H
	ms7CK9YYz+y9VtrT6BHZ6LvDjFpZd0mXGvEKbDbLDv9h74UwGUMYhvsgbrCKqK1W
	ydF4nb7KzeLtUR6Vj+4ISRYuvY5B3g+/XErtnkLQaHKvEJ4rpSph5+3jYHGMHwTk
	Jzf823aHk1981zYbvCn1FZYoIyezRqlLRL1XdBbVOG0itXONHQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx2t82aa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 19:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IB4oo6SB+BFZJrJTDEnZmOE0NifWRLCQLuPXvzCV33tQ03xohhPRB3fz8fnvES/HgI8/wfur+/z3Vgh3PHynGVUuJtE+gX8QS1W624AjUpLtwDVGIAHZN1uDfG0tHqVwISH/01cgKs9E4NaFTX1zCJcBxTaoam2FuUoPQoYGpr81iJ/NjkDemrum9AH0c8B7g9b716SrTFl6774vY0WbNFy61Xg2p3XSoP4drilIuSji+ikDkyxbg8+GwgvFYN/6gC5hLmwEbLxdTM5cLGpbQHQj2ldopLuTytNFSwN70y7bE5AP/d30InJP+MLlluqk5f497jmT6w5vKlQ22pnogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4KD3KYF+9ncDz/04CKEU+Nq4QpXBa6Xuo/X4ExsZ7o=;
 b=mDo5V7PEel/co/bEPkvmynAJ59TusSvQCfS3X1mDE20uCx64grQq+YhV37yUufJS6WI0zCoUys53LXYRjQ/Q16UyjZoP2Bz1YfQmlWsoFAi/1JnOBrUCy30Rnv567db4fF6QTL20TSYB4qKeppT0wrvhnG3lCqvwR4qJQcf2lgghc8rD7zvMqSN8tq9AJC7mtUtqVkEOIbkjIqf491qTlZ8H0oyEUoqGpsx/MllCk94AUuW9f2+1CxTiNUi2c02psRBumBNg8f4Eh5EWrS0eBqCQertcarD++UB9N6yq9P2FXTg3Jq1Be/HboSchsND80ZHOQDLbti3Hq466mq6MCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 03:08:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 03:08:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] runqemu: restore support to run without bitbake
Date: Thu, 29 Jan 2026 11:08:11 +0800
Message-Id: <20260129030811.104017-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0253.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::11) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b4ca82-ed1e-44dc-148b-08de5ee3ad17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VEVodVDz1PCDWcNSO0RJxenHY22rTot+2Q4VLVw/2JsM3pMufG/dKj9No0kh?=
 =?us-ascii?Q?R51OMY6Y/eKiJgIDVQqRhkQURekeMvDq7w8eiFRyfo+90vnj8RogRfHUEXls?=
 =?us-ascii?Q?IvJpPTcc+XukyfQ2zVebVO1zmx8E+tSEp33OFDR40dwz1eAP6imqkTdudeYW?=
 =?us-ascii?Q?LBu+S5SjaCLkf5auvLWRi6l1Kgflwf9jDIy2twthFa7NdkfhFs8U9+1M8vZi?=
 =?us-ascii?Q?kcUo4LJ6ZXy951dVU5r23WIOxZ9nImVqe2IjY+gxiANNsAhEFehoA3mZN3Sw?=
 =?us-ascii?Q?4fF/+Zipu97P5j+tUrID5vBnRAs1eCz9So1TZUVcwcymfEeA1o9LWzolm4nF?=
 =?us-ascii?Q?qmg58VufafORvO6zCrk63GPj22tQljMgDC5h6SUOWtT1/ExqONXjED2y2623?=
 =?us-ascii?Q?Aq0XVuxWIIBcLs3tWsVhWTDjgJdtJ/atb4FUbwohBsB6wgghTJZ6OUiCapa7?=
 =?us-ascii?Q?+3JBdXqFuMOH1eICQtZ1O4Pl6R5cGsNz8gonlBAmlDyzYOkAdCwzp1+1F5hW?=
 =?us-ascii?Q?MUQCjabkXU9WfBuoCzoscmCgQs7rhef+9YwtoatVgOGM+oGmA2RPOqu9f+eH?=
 =?us-ascii?Q?ERGWGN8C/9yptHzeW4gLXJvTSWEVVW4vmmM6FXEd5MyyqrfLSXJ/x+NwEJli?=
 =?us-ascii?Q?orQVXq3hElVVmTSBGttgEvjCnW3jbl2UrWPswZU7nr//zCj8cauEpdMxLQGz?=
 =?us-ascii?Q?XiWCENQTMUvdM5tT8P5EqjRH7U/GwksckPpWCBvJd1YV4AZtxM/quXuy0FQX?=
 =?us-ascii?Q?XerN6nsUM6eXGvNET5kivVnlXgnUiXoTrNdv0u3gWX5oC9ukq7dZSrfQIrPH?=
 =?us-ascii?Q?+/B47H/+F6DQ6yrYZKNl+TGqcSX9BGD17naf2lhx5HTVQtwRh6HDsdQjRH44?=
 =?us-ascii?Q?oc0ND8BAfQ9R2oFlAGHH5eJsAH2/ULj1qKY30JWTlzbrTVqHIgigtgCSaAtG?=
 =?us-ascii?Q?al6MDVDObGk9vqkMz1M33EtCYZhnXfPJ9qeWg1horexuP9dkN6SElppRmzFJ?=
 =?us-ascii?Q?jIysvwFXSxKX3eUEhMDfEBt2kLbW6DCH42DNuV5yPBglRdVW35d3sFwGyhly?=
 =?us-ascii?Q?ffEu3/x0tBlkIbIr7T6wxGNSgLT7C8eiKqbt2UJnYbXv1WziXZFAEV4SRAt2?=
 =?us-ascii?Q?cgqo+ePe5j3N3WYklsJZuu0oLfiV31ef36Kkv8t3PD+b2aRwndQvqhjwmlTC?=
 =?us-ascii?Q?k1LjFAfiRtIhym0IM2mImq2h/maBFfGoHvTtLPLq2THgK1mmB43uu3C1m1hf?=
 =?us-ascii?Q?Irpbd4HlNpTfbFNUgPN+r/swXFIm3UkNPPzu3EvicZLqV+/b8TLFb5ewp3EO?=
 =?us-ascii?Q?daYgPDt69IjeEtPJBIi1y/q+vTGUu85SoRwobFMYkvWbhfByFrwle9xL95KJ?=
 =?us-ascii?Q?2EteMc3+VsUIwHIZqmH288epWj+Ieq5ndm+ZfAnfTlulA4rBNpZ0BslIjd9t?=
 =?us-ascii?Q?GnDdtcCp7eObX4ft4AFKdlssfWfjrsjYKf0rNmvBV6/RXk0Mv5TgXGid7iy4?=
 =?us-ascii?Q?nEYI05gijmQwvcYlbGqRItEZsiccRlubeRGFt/HpU/gOZSbMzQ5FtNGQBoCZ?=
 =?us-ascii?Q?F9+xXxpZoM4xZUoTsp3Zd/YCam5wQr/vXUuOtx3olh7z8p3KAVxo1zCuCbQA?=
 =?us-ascii?Q?i5dnoCF5PEUn6JAFN75wQAfLEPWnTIRih8xvQY47QX4U?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8ArDRIYDAjpNxyuOKIKkEb3LX9xBWWPoNG+hQ/YGlIuSdrVSSoFY6vCmgL7W?=
 =?us-ascii?Q?nBDb2gNWcU+Bb4apExWCn9LGkDx/g7Qx797pl/EHwp0yCg6AUCEaHwrsff4V?=
 =?us-ascii?Q?YxjANwWyFyZudpnCrn/yunhADLn3zYLcbKKfIHgDX34wK7VvJ4xPkmQTnLis?=
 =?us-ascii?Q?TkhvSb5c6WeZPvk78J6uxvcPXzByKg9bEHBf/jLVsdySB4ZcaeP5BnroMNes?=
 =?us-ascii?Q?lU9YwmIEP23w7rpprZmR0tPUzr/7AK6vR30WlwUAOX7Vr+BZLBERIBhi1/ma?=
 =?us-ascii?Q?aDXR2LBDSKmK33Kj0vqeizsV91udrQQ08A0HZsjoK+kt6j9C1zIIddFZ6oN/?=
 =?us-ascii?Q?+L27De8olGfRfdJSWeAt0Bme7Z2/jTmY4vi57mMYUFMYQR3Y170l4c6ASNPO?=
 =?us-ascii?Q?2BRTtUdnloSxMMNUWBo7HYB1xtHCVr8ZTc3tVzZ3MtvaPSghfPoREPn07cvQ?=
 =?us-ascii?Q?HCNcs1n+Q4A0pLnJ9Jd5HwEqWkvo7Wci1SYPaGOPmgvPk7MnuuO7nAFuq+s5?=
 =?us-ascii?Q?nWFavxRoVw6GQs5Mnp5vdhi16K9vWRiu+XkYr3vYBbGu4KdrQZLWCagUqMOw?=
 =?us-ascii?Q?u5/DBtjYskNbb8f+lG0sSq7M9s2jHeiq9wOZxHzouBVBRyRMVMosH74Pxqda?=
 =?us-ascii?Q?1a6e8mnapU5c0QyCdJ6JZlvghv+P1E/C9mM1ppOhzYsPKMgB49+HMSzsMGOA?=
 =?us-ascii?Q?mw5ZBJV9kKkBKc348UUnwLB/lxXVp7XWVpvhTcDvPeu6NdcCda4nrzd/clgF?=
 =?us-ascii?Q?/zf3frNxzfUM+p/JrFfYQHtkX3ZyVP+TKW0x443Rd06quHla7CXbdKkm9J+o?=
 =?us-ascii?Q?xH+/8IR1sn8mjX3MT29UI/YD3OG43B5Sy5NarbDFehCTTAXaxSE8+YNQ5hGv?=
 =?us-ascii?Q?w6WthcOyletoufsLDAbkFjOGdP5R3cLOUQvPLLcnT0X9y5x3Q10Qfm/Cc1wC?=
 =?us-ascii?Q?OOjkXY45ZJS5nC2ENEKkGeD3Qh4OL81H/7nmyc7h1ZBrBzxVQiKygoR80ImD?=
 =?us-ascii?Q?Nkc36dC/6Cgl/7kJRAvyHszCIqp01YaXIkqAuFGrc7yvyQewuS3HA4XQAluH?=
 =?us-ascii?Q?QflATrOYM5SIZZXnvdqPAxEn6Jk2of5NA7/o7bBf+WOVe5aCwzErIR6z9f1Z?=
 =?us-ascii?Q?4+jTqy5xR+lgHU3LBQjw4GIRd8W+8uk82wnk49lQ6FOenJMf52ad7zBA1To6?=
 =?us-ascii?Q?AnlAOdZMUYSyffLLKnQ+k8IWgHBFLZMQ36Fn4/ACb9fZ1I5P8aEvjqWLUDrA?=
 =?us-ascii?Q?oQau3E/A8TGgtqpRIVxnlrrW4jsumzL5TzQAwwBilwSulCgrTnZ5IiJtXejh?=
 =?us-ascii?Q?/5dgtrHS0hBxQqxE8I6BVaTn0G5s9Uke8QJ784AqBCAOpsegk+sqFDyeCn+z?=
 =?us-ascii?Q?Ir/RmwyGacRX7iw5k1yDUaVshs3v6DOvlX/s0L9mWO6+Z6tdFApEk7qahZlM?=
 =?us-ascii?Q?OvFzazZW+Druko9Yi17oZt1A4rjyAi+AsH1Pcz5JoHfjzvK7ohJKZPZE7+8O?=
 =?us-ascii?Q?ZtAC4EU2Jbwu5U44sm728OPeDg1hw5v7RReJYenKg2wJDmE8FKtkXSoODefa?=
 =?us-ascii?Q?tt4Qt3hkI0ldrMJe0m0JWjrgVcCpTPwEBS/FtUdJeqw6oUE/IQuZ771JkF9z?=
 =?us-ascii?Q?Gt9Z2edOvk7NhJ1M58Lpncywqa9o8Kv7Cth6x1wXTJWtWsF24aHaGA9qesig?=
 =?us-ascii?Q?2TOHT6kN7vxtt9BQyMNw6xOdMjG9QDplPr1FxZ/gPYjlj7nF/6pNP2tRHUEF?=
 =?us-ascii?Q?azz38WbdIA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b4ca82-ed1e-44dc-148b-08de5ee3ad17
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:08:29.8968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/vsy3jBC2Cfd24q/sIt8eAK5Mf0x0DWaBxngslPTrmB4khgmARvireTG8NRYJK1KULHe6xqje2uaIwsSk7X8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
X-Proofpoint-ORIG-GUID: PB5Ccgg6rWz68a72qAmgIASJulc9Dnh7
X-Proofpoint-GUID: PB5Ccgg6rWz68a72qAmgIASJulc9Dnh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAxOSBTYWx0ZWRfXzBkeYbkcaIhu
 lMq69g31kGguhBrTY+BlAhQWNbA3N0hD0mJuVD6V1eNSqf/17VlXaBttfrJFO9WJIIltB/QnzAI
 h/+W2nOM82/CckootfX+i1d2tQoD3GCL7cvDUh5cLFgzsmIiuJEIOpDTEtmFF5KIGRuDM/2KXlq
 +0eJcD/BqFesmuchLdX8ov+QNJ2yWg6klxhJ4IW3keCxmy3Ewpm0fokuBn7Tg+/czMRAxY1NNEo
 g0noAA6NFwR4yrNwRzgXneVZpH4PgxdFZBrCxGxnom8e2anREGAQAD9B9ik7ot76wxLFpMg6PX9
 PhgsaSlKkg8vmVWVs8zHmVxiWztVuD+imMU92SwQ8c58zDhgb4PJHEc3wuW8KBDJou2N4UfatiM
 r21I9qem0Yj5Ax+Cfy6gTATNCiqVIjerxV3+79OeMye39r8xyBIt+uqnj5xr7fOn2/k2uYppZZw
 oSlNr32fthmDWnZ128Q==
X-Authority-Analysis: v=2.4 cv=NcDrFmD4 c=1 sm=1 tr=0 ts=697acf31 cx=c_pps
 a=1oswHZhTlIntAJ9aeONiTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=2V6DY6BgAAAA:8 a=Oi8JoTq9TeFMMREfi6MA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230110

From: Chen Qi <Qi.Chen@windriver.com>

This patch is basically a revert of the following three patches:
- 0c10a78796 scripts/runqemu: raise an error when bitbake was not found
- b931f74442 scripts/runqemu: remove the code block that works around the missing bitbake environment
- 8197be4dd3 runqemu: ensure that bitbake environment is either returned, or an exception is raised

The comment is also changed to reflect the current usage:
"invoked from a running bitbake instance" ->
"invoked from environment with no bitbake (e.g., SDK)"

This code path was deleted by accident based on the reason that nobody
is using it. But in fact, running runqemu from SDK needs this code path.
Such case has been supported for years.

A little more history on this code path:
In 2016/09/09, this code path was introduced[1]. It was introduced
originally to handle running bitbake inside bitbake situation.
In 2026/09/19, running runqemu from SDK is supported using this code
path[2]. This means that this code path was then needed by one more case: SDK.

Supporting running nativesdk-qemu from SDK easily via our script dates back to
more than 18 years ago, as shown by 'git blame' on the nativesdk-qemu-helper recipe[3].

[1] https://git.openembedded.org/openembedded-core/commit/?id=1e8165ea2f19aecdc03ccd102ee44ef0544f0f39
[2] https://git.openembedded.org/openembedded-core/commit/?id=93649edc034f2540ff55dc9b41638797209cfb9c
[3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 47 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 32a3d6296a..7e3d11f653 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1007,12 +1007,34 @@ to your build configuration.
             if not self.bitbake_e:
                 self.load_bitbake_env()
 
-            native_vars = ['STAGING_DIR_NATIVE']
-            for nv in native_vars:
-                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
-                if s and s.group(1) != self.get(nv):
-                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
-                    self.set(nv, s.group(1))
+            if self.bitbake_e:
+                native_vars = ['STAGING_DIR_NATIVE']
+                for nv in native_vars:
+                    s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
+                    if s and s.group(1) != self.get(nv):
+                        logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
+                        self.set(nv, s.group(1))
+            else:
+                # when we're invoked from environment with no bitbake (e.g., SDK),
+                # we won't be able to call `bitbake -e`, then try:
+                # - get OE_TMPDIR from environment and guess paths based on it
+                # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
+                tmpdir = self.get('OE_TMPDIR')
+                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
+                if tmpdir:
+                    logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
+                    hostos, _, _, _, machine = os.uname()
+                    buildsys = '%s-%s' % (machine, hostos.lower())
+                    staging_dir_native = '%s/sysroots/%s' % (tmpdir, buildsys)
+                    self.set('STAGING_DIR_NATIVE', staging_dir_native)
+                elif oecore_native_sysroot:
+                    logger.info('Setting STAGING_DIR_NATIVE to OECORE_NATIVE_SYSROOT (%s)' % oecore_native_sysroot)
+                    self.set('STAGING_DIR_NATIVE', oecore_native_sysroot)
+                if self.get('STAGING_DIR_NATIVE'):
+                    # we have to assume that STAGING_BINDIR_NATIVE is at usr/bin
+                    staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
+                    logger.info('Setting STAGING_BINDIR_NATIVE to %s' % staging_bindir_native)
+                    self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % self.get('STAGING_DIR_NATIVE'))
 
     def print_config(self):
         logoutput = ['Continuing with the following parameters:']
@@ -1691,6 +1713,9 @@ to your build configuration.
         self.cleaned = True
 
     def run_bitbake_env(self, mach=None, target=''):
+        bitbake = shutil.which('bitbake')
+        if not bitbake:
+            return
 
         if not mach:
             mach = self.get('MACHINE')
@@ -1707,10 +1732,6 @@ to your build configuration.
         else:
             cmd = 'bitbake -e %s %s' % (multiconfig, target)
 
-        bitbake = shutil.which('bitbake')
-        if not bitbake:
-            raise OEPathError("Bitbake is needed to run '%s', but it is not found in PATH. Please source the bitbake build environment." % cmd.strip())
-
         logger.info('Running %s...' % cmd)
         try:
             return subprocess.check_output(cmd, shell=True).decode('utf-8')
@@ -1722,7 +1743,11 @@ to your build configuration.
                 cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
             else:
                 cmd = 'bitbake -e %s %s' % (multiconfig, target)
-            return subprocess.check_output(cmd, shell=True).decode('utf-8')
+            try:
+                return subprocess.check_output(cmd, shell=True).decode('utf-8')
+            except subprocess.CalledProcessError as err:
+                logger.warning("Couldn't run '%s' to gather environment information, giving up with 'bitbake -e':\n%s" % (cmd, err.output.decode('utf-8')))
+                return ''
 
 
     def load_bitbake_env(self, mach=None, target=None):
-- 
2.34.1


