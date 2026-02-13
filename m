Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8368EEF48E3
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67357.1770970218861808488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZjfjusWZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=650450735d=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D683Sx985812
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dvBHMxkuv4x1XAyr8Iv0
	6wix3Il10mpvWIgdy6qYPaU=; b=ZjfjusWZ4fB6aceCpEEn4KyFIUrvbjijIhnp
	7o++lfaZ9G1DgoVDUuwG87SV/Zuj69/j0RUn03LJXP2cy2IiWg5cxafSZoFrYaa2
	45mWtBHy5aMCQ5GYlmxoCtYQ0MFKH8/rgEXK6rAWi3JwwjFugv47rCWLfur8XDv4
	FeZ5FJIBJW+rpFKjnp8L77q+K6PgxuPmGv4NaFC2Wr529Bo+1z8iDJU+Bwpv4vg3
	5UwauY0fha1vOZ8yF+NEwSl9nXCcgXafKhMLzDteMyx4KsmQotL3im80k+A/WKqC
	kTD6ForXPgAqI7KGg22zuighUei3bzvBWSuoq3L0Z7oQBfCb1Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwq81e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJMiWP3Ea+jGYVesFJqVGtCjXiTHY2kQpo1X9tA52Kd2pza5GOlEw1Fd86aw9NY1ewkGyVgKUla7Qh+cSW4BLhkaOl9DJffbupnUpclc4N6a2aObR3U3gWj4bmdy8zpASJyuO5VaqOtyRL2Znv7Ay8/3gtHEu4z6fsmXtqPqC+h/o+YsZs+jirN7Ivb5d3kNynTFcw71KtW0s6jYPE4oORg1zUyNZJumaYOaLtwRmU4/GVYHGB2nqDS8cSsJgFpTVS9aGnD5lxpFs9/8QCAw/Gk/1I2RZUzdM1D9fpAzVAvX7yZoO4+DBR1QxY/9EZ6Bryo87sy7D3KH+C0JJg83MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvBHMxkuv4x1XAyr8Iv06wix3Il10mpvWIgdy6qYPaU=;
 b=Xm7NP1xWlevPtwr68tzpWMh+PMvEbkSstZRFRSCTFPRVbka9TgjksyPdsHXlYZcyvViLdWdOjgzN2BZSdV9PNKCuEcFRC1uTO9bd6RfzKhuaxHjQvnEnxnt42ISnriKntk3g1zCZCYq5q+1TYsprF2NjpMKGhW+aRU67HBt4AVVjuz9CrxzY6B0w2x6tkid3UWFDsTbGH6TncBHvTjqoUKy2UbOx9HkzOV4sz2b+1T8Ou7JtR1yn9B1kqabwui5+wVB9SgWzekstNS+kg4qJoHFzSrnFSiUK3ppI185vm9/f/iSvGd2Y+8zLlarOPgnJM2UT5i2T5sdHPOO2zN75eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 08:10:14 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 08:10:14 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] libxkbfile: upgrade 1.1.3 -> 1.2.0
Date: Fri, 13 Feb 2026 16:10:03 +0800
Message-ID: <20260213081003.2457504-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: b5834068-8344-4fd7-7a0b-08de6ad75131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I5tKlOGH7aCzj5QI9DE6WwzT9743xN78hagdq1WHYa537fUVaj3q8sIDnDbK?=
 =?us-ascii?Q?7hrS5bd521f4FSvjzTgdhhQeuUbYjflrw2wRCF8HjmH6dILF/jHllAEKHlt7?=
 =?us-ascii?Q?9yYMyu5BmJlmVJ/wSjyRPbKPVDt//s+5PBA6CCbgsSS9BodYHxhXJ7FP8oYN?=
 =?us-ascii?Q?4p6aJvIMZBXYmWnz+FPlVb08jsZBSDQORw4FIhxA7kkrwNmWiXpGfobJzwrg?=
 =?us-ascii?Q?qR0dJHw2xkiPEAaMwW2SQ1yYjJUjr23qwYgkvlIFf4+h6lP8w7usU16jTCyK?=
 =?us-ascii?Q?Tt78xF50SWzxJSiotrCJM+xUrCY8gXstTvPXIkbn5XUgaX/znAms4nuB8eas?=
 =?us-ascii?Q?aainnV3N6QCVICp4YjZhvRuD2qC2vFFM5FFugEB/y4g+YRGbU0WGUjAuI+Hs?=
 =?us-ascii?Q?i+RbNYnHaNOzMFALTaLk5gw0KMjSd+CJmzaWisqcExhgl5r9+iUcncDYBk3d?=
 =?us-ascii?Q?jan4J3hnIb7v8OjjrTnBcecTF6DEnoLRyniXiaaiJroPwLIsYymtga8jNVC7?=
 =?us-ascii?Q?8NHe2MyOa+FIu4xhC3lQcz55uPyzn+3v/FuMmOeNKiTQgmi70+QamQqca3F3?=
 =?us-ascii?Q?6pY5Z4rPNRQMW/HGdLQC3erjB2V6FYEiq7RyC8PEB6ScqkJIJvdzsgm9sNS/?=
 =?us-ascii?Q?vfLd0zUL9f5aJs18D2lKZvB6FkUP/Xzrv62k1gruc+vXKJZILtdYpd3sVrc4?=
 =?us-ascii?Q?MqoXx8OQcxwC1Vm+SBKvUl6t2V0Dz4c+XlsYlo4Uq2g6M4sizPiCv+iuE99D?=
 =?us-ascii?Q?nk8GMeJn0lpa6mFKS5gO98G84jxVfnrQ39fY9sUpGgJLzXZizqRdZS1cNK8i?=
 =?us-ascii?Q?u/xdBVPDhOZZjWjCNRJ7fra4ixQQJudP3+t7S6YDNnm6bXFKfhatwSaWlBgb?=
 =?us-ascii?Q?GK5os9kRNeRQ0F2cMDq4fJvwV4FNNEvtPaDjSa7tAgbnfyW4czVFHNCtJr4+?=
 =?us-ascii?Q?aHxeog9nMzFCY/v5sbShRk/Upolsc2M2qt/riJXnSeC/ig8Qs6TB24fv6WaT?=
 =?us-ascii?Q?mo3GX1Ie/5UfhSfMWjqMh8FchgFLHLz0yoULiuxSXl38iMwZ9+EN+InSnw2R?=
 =?us-ascii?Q?vmxqQMUy9SwhJ6r19coLR9w2o61d7b5VruBzkN+9ThCfaS3OUh6IT2GnC3WG?=
 =?us-ascii?Q?B/OGs/ujtMy8GFMLSOnW4mGDABQZSA7b3Zg4COwKAt4s83wQvgvVR75GCMmK?=
 =?us-ascii?Q?iCbs0tx0ILjuMf6ARF57rhEKjuCYfu/tYbuTnx0CwgXVbT+HiDlyFNQkD3FS?=
 =?us-ascii?Q?KqasiEUKGKRLsy2KF0qwwSEiip8tmuBUVkQWG5BVMlF66EOMZHAkYtGYad5O?=
 =?us-ascii?Q?KzbhDNTsE+P4792tUPQakzDV2bQ1FHN46I67AEN1YLwbX2Dbyc9wnP/2fPZi?=
 =?us-ascii?Q?/42ArqHx3eeeq0EBzHEnambTQ+IgXlEGW0rg2LlCAAmMDgIy167BONVI2PBv?=
 =?us-ascii?Q?ILpJbGbXivZ64VHTI7MTq+Pt/IbVxjEmG7Z9/Uae5FRLPEST3eOtje1eRqsj?=
 =?us-ascii?Q?e1+7bsyc5XqMCAPO9jQ28ysbG4HOmZ54PCNCXKpTwKljvcwgh8Yw/v/n7v4p?=
 =?us-ascii?Q?rRbvgf4UYziUSD2Jfuk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?edALih2B+Zxn26AfnM/FxvqDLyH1KUHVpJSf+j87864gvT5TJb75utw43c2f?=
 =?us-ascii?Q?PDLdVE3jZls0r5i3amE5WGOmMs5PkBIfjVoACwhrqDh6IuqLF/BYDhbgDkb2?=
 =?us-ascii?Q?FWVGxuz0pdSoaEov8Qg5UySo4rCPmoaCr6S7lLk07LEl3/2n767eB9EtW6Qp?=
 =?us-ascii?Q?sC4YKdMUVhf0J7yf5G7FXrvMDSjDBznItzMsQwZ+ggW0cNJ8HWngC78KQxaw?=
 =?us-ascii?Q?Sqw705x1OiKmjcVmN7ToNoCEexFieWXGgB7HIsnsFS1JWsxJKdAdtZlJCFNJ?=
 =?us-ascii?Q?jVaweVmR0RVyvxF7Vu3FQ5oJjhA12jO8P7F9idP6DjmScqjavV8HzAGeeBgK?=
 =?us-ascii?Q?+zErfw0267FIN+PgAuycCMwkUBMbxg02ozTWOErtKq+XDkavG3kzcf1G6a/a?=
 =?us-ascii?Q?GLCEn7kYmLVIJvOcoB6SbrruwoRzsFYYyhd7xhfoTpdSoqm7Kir32ij/rmdl?=
 =?us-ascii?Q?q6M2e66QRgQn//FAZTDpth8PYwc/e8ULUrXd4mQhq00FxlE27hUjVVxpvlbn?=
 =?us-ascii?Q?cxN6+udBYyRBsRMK7zOD1jFJqy8AHE04eFV0LmzZoH8Nw8JlYkJqNza0xtZn?=
 =?us-ascii?Q?KaOMhAkz7lCck5rK+z21OSzH2vSpauVJYwHQ1kpd4KsfyP4dLUovM8+JhGtr?=
 =?us-ascii?Q?PvF+RXNIQfiazxiQG50cyrSwQjEMzyRuO2aLrAwrtbS7DCcGQJGGGeId5qEy?=
 =?us-ascii?Q?N1Du4x65b4Gf1YoI6edIeTLGZAXjayWNVq2DfTu0fmhEzr789AwxtgEa9yAD?=
 =?us-ascii?Q?gzkoOzyLU1WTA2l7hLi7YqSQE9wgISR+wlfWTnn2g8jS1HEQJHPfhB8hPRoK?=
 =?us-ascii?Q?mnyu/NmCq0PNu+HLu6p7d1AVt/T/TbZ8d1yGiU8n7R5nBr+RlNHOpM1LUlSu?=
 =?us-ascii?Q?WcPVXaGAu5sOTrecGu2FfOOwRKeVrxv/LAdev1y8Q2QNk/zz3j/EEXpldZwB?=
 =?us-ascii?Q?B8Fmh6RTBowGNm6Sl/lhloTXwHPehhKw9O/zRxfr43dciKiW0l9QyINC5/hP?=
 =?us-ascii?Q?FLxUFbymPteo8edo1YANf5XJvwGbyp0SUoqm+9+j7nuQpUmppj6sohrrd/DT?=
 =?us-ascii?Q?nunMLYG4RJ0Dbp3yi+EcXE7jZ7X9uvmldZfmrGGO3T9rs1+jo61H7SnYUjYm?=
 =?us-ascii?Q?qOTznJ9YkFQsdkTiyw4zTyctRuAeOKdsAIoM5Se5Mesk27D3dOmxCNxYnla0?=
 =?us-ascii?Q?3XD5AdBrjYcHJl/9n6z2fZ6ZYGPlZCrcaEbG3zY+D/ryctwU3FKO2uOkvuQ0?=
 =?us-ascii?Q?CYcTiKoVg7nhedAdEXIsYTYMglSx9tpMumuMIq3ZyNCRSsPfgdOt8pVtJYjK?=
 =?us-ascii?Q?bS3DSaLNBcBw/GqR2O2DXD/soEDmaQ0mKEmmlhn220zlKWuxbYK92I+eCoG5?=
 =?us-ascii?Q?TLoFSGG1Lk3ovAQMYqnGaLa2fmGaI6yzWrVJ6i6UtmKFMrwbJ/RJlj4AOoLN?=
 =?us-ascii?Q?NL7c3T+suJWPJuglAzwzpCqbwnCcmWFor5kp7v5gBx7Zj8OEWbXA9WIs9EWv?=
 =?us-ascii?Q?F3S2A79DPUhuvYN1qslBp7Em7OhxMXsm/qsLW/IVI+QTqunECn5ZurzMnkee?=
 =?us-ascii?Q?6e3gxJZB1M/rAWfi0or+cPqNQIq1cDN2lM1KTEFZuyGnZFLbVgrFFLYstZga?=
 =?us-ascii?Q?Y29YXsaFM7qEEs+xegEK4ZfHIeZTHAN7nqbPOq+hZNJGG3j/yLRiPI9AMTEN?=
 =?us-ascii?Q?yHCPwECohejqN/RqnrWDB4XUp1j5CDfC8abajHmmujolisq2V/l0fftROSxL?=
 =?us-ascii?Q?QwrMJ7IyPE+SR9Ms3LF/ORO5o/TGUv4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5834068-8344-4fd7-7a0b-08de6ad75131
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:10:14.7619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqNJULitvm4UrASk5i3qrU6pXMqS4I9gW2Ch9PwWHVuvKC+NmV01M8F+zq3QWactVjFH0seoyCL08PMeSHP1+HaKVIXaIKDoaaann1HwE3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698edc68 cx=c_pps
 a=HO36DfDzC3pv6rVb14NK+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=aR16PxjQAAAA:8
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=uQD6sHBvZBC-kErfzWUA:9
 a=zbFvvTOBjyH4ze5LlUjX:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: w1bGkHg9dLhDLkWOmD7zLmC-_fE2HYaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA2MiBTYWx0ZWRfX8WcLQcS8xamv
 lSEyw9z3Gl5RZOxjsg3zW/EmwyvaL2X3vssxPAm8MwpK7704xUl5qCvFTdyRR5NY8ulZPmvIDg3
 VrcbW84gxFBqzI9VHQXdB8oyO9qORy2vhSgW4AJPu+vyemNFP0iKIV9gRjTeJ9ye3z8Edy5GIOY
 iErMQIsBmzUzjG9h+RGAYcP/PkWyArDLogS6cOSLbmy09AfpJAtnaXwbhlGLJa3AaQTXw3mK+cJ
 yFiprfFhxSYlITFNSZ6FKFL8Oe77odaF+EVAJ8nWmCLG9beu9m51qe0bSNHSPgVt6Bf30YewH6S
 tNlULD+yTO0k+L4moWYJxdopWKrq2FjYGqGRzjl8mtbEeChJcyOvSffj6K3nUAhRsE/NqYydk+m
 x8kvarASSyythW6Nqfgb+E3OqWplmyhDR5GvxdMMAbZuwJAfemAh8haotXkTxUQixjejx+nM6ZX
 6dCbji7SIN0kT1Rl1jA==
X-Proofpoint-ORIG-GUID: w1bGkHg9dLhDLkWOmD7zLmC-_fE2HYaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231083

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
  - libxkbfile is used by the X servers and utilities to parse the XKB
    configuration data files.
  - This release adds a new XkbRF_FreeVarDefs() API, and brings over many
    fixes from the other copies of XKB code in the various X.Org repos.
  - Since no complaints were received about the added meson build system
    in the 1.1.3 release (February 2024), the autoconf build system has been
    removed in this release.

Ref: [https://lists.x.org/archives/xorg-announce/2026-January/003662.html]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../xorg-lib/libxkbfile_1.1.3.bb              | 16 -----------
 .../xorg-lib/libxkbfile_1.2.0.bb              | 28 +++++++++++++++++++
 2 files changed, 28 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
deleted file mode 100644
index aab6284384..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "XKB: X Keyboard File manipulation library"
-
-DESCRIPTION = "libxkbfile provides an interface to read and manipulate \
-description files for XKB, the X11 keyboard configuration extension."
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8be7367f7e5d605a426f76bb37d4d61f"
-
-DEPENDS += "virtual/libx11 xorgproto"
-
-PE = "1"
-
-BBCLASSEXTEND = "native"
-SRC_URI[sha256sum] = "a9b63eea997abb9ee6a8b4fbb515831c841f471af845a09de443b28003874bec"
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
new file mode 100644
index 0000000000..40d2ab1188
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "XKB: X Keyboard File manipulation library"
+
+DESCRIPTION = "libxkbfile provides an interface to read and manipulate \
+description files for XKB, the X11 keyboard configuration extension."
+HOMEPAGE = "http://www.x.org"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
+
+SECTION = "x11/libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8be7367f7e5d605a426f76bb37d4d61f"
+
+DEPENDS += "util-macros virtual/libx11 xorgproto"
+
+XORG_PN = "${BPN}"
+XORG_EXT ?= "tar.xz"
+
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
+SRC_URI[sha256sum] = "7f71884e5faf56fb0e823f3848599cf9b5a9afce51c90982baeb64f635233ebf"
+
+S = "${UNPACKDIR}/${XORG_PN}-${PV}"
+
+PE = "1"
+
+inherit meson features_check pkgconfig
+
+REQUIRED_DISTRO_FEATURES ?= "x11"
+
+BBCLASSEXTEND = "native"
-- 
2.50.0


