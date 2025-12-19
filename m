Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24964D7496F
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:28:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13486.1766136532532541452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 01:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zitf9e93;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4448c0fa6c=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ69oMV2591427
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 01:28:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=GP5rCH2fy
	cz1iD+zqw1fktBVxxKWYE5NPKhRsVZsdI0=; b=Zitf9e93gNU968/cNlUEX+0CK
	55rH/XRbxUF10PrXAh62liNuXw5sowkST0dVc14kbrxHhclQGtRwsfmfAhTEbTGS
	a2XgrPgXJLUIsJtHsMCUUFA09UGkMKcz1LOZILTWg3BP6Z4p/S2DvJH0f4+KhQw4
	UJsdfLOMjbrCDMhO8e5LXkwvqAKIlvHh6XGnadaWEoGoelrbhx70qaHfjaxVEBv5
	jdaANsA4ldPrFAB2Y8dMWazRIEI1nv1UET1sthEOmjNuDltduBgk0prYgF81CoBU
	5KMawitcIh7iEywtYiXiAOOi66ufEnZnTIOrYewyr5z0ySrVHI1uLMIpgNZqw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2urnp2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 01:28:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kn9v2mXc0KBaQJG2eX60rS7s2FQdRQOeKjc1+V0b6wGH44etjOv1896SFaN8i+emGTlI11GBEI2sNDUPpCUh+Afy3LDLjB5Ggcfop5O6dd/Knuik1nc6KpvGEhv8y6846+FNxrcEMMC3NLos7m6Vw1Eb+uupekqZdaVnDo+wW0t7/OFTqHXoRb0+121s7pEJ3VqDgcZhqObbnksY45Le0DVIJfrocPaXXxiwZT/JbhAOLR+gb/co6XneNwTg0EJfoX/14F6b75WxXKRUO/YV+d7lCjk6vhJ+GGdl9B8+EdNyJUopCn0Dm8Jrhnokp3kQBnHKEAjEfAPgtmiDRiEfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP5rCH2fycz1iD+zqw1fktBVxxKWYE5NPKhRsVZsdI0=;
 b=BfmfEGO0EXZas03UpNGn2PErY16y2OWkaVIPzCxHZ0S/GHFpbJk3ObmxBhcvkDZ3ZTehbzYmoa3MmoK+7TrFFz1l5EedfrKhFcqBCQvh9nCxlQIq0ql2BqVm372fGbYfkB4HYI4640KhtKVnibvoaW4OmwVfwIQkxHs8Vw9IDhncajigTU3qM9Xz4kyrWSZ8TXG+X8r/8vEJ2fytzDxd+F1Sh+4WaNlBBOBqhldQJzfHiwtKMeiePytrkJQ65W957XnGSpOR8ZHPDxSu1IZOwwGWyGD1dUsbMI7dmaeg/QWF3HVpFyCeHKN25psAv29xeewTxJm0AZUPLwlKZ5q2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Fri, 19 Dec 2025 09:28:49 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 09:28:47 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 1/2] binutils: fix CVE-2025-11839
Date: Fri, 19 Dec 2025 01:27:53 -0800
Message-ID: <20251219092754.90100-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::9) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: f384c032-4e72-4175-1fd8-08de3ee10313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mRGTwP3TYNWLauvvqzJRYsQU1NyV7a0A9HJk9ravLC9QAu7BbXaR+DAQr365?=
 =?us-ascii?Q?ZAVYzujAlCu/Gp+dG82hlSZw8xRpGYuUPIIdr2Xlvpr0bDkBOD+yQ+5c/QL2?=
 =?us-ascii?Q?sjaicsLbBoyKiOTxAYu6XCRzQzWUdUr6z4fZf2lZuvAObw3zzq3yn+ejM8xh?=
 =?us-ascii?Q?PpAtq1vj8FemzjVFviK2IGfWl86yxsgvNEqNZ+OqcmwwcaDkwfLd2X2oDGCS?=
 =?us-ascii?Q?4vzphejR+0q1FiuqgizJQIzZwb8awXy5s2GWezk9a6P16UZm1vMdP2num5U3?=
 =?us-ascii?Q?3gh0IxTQi/SxkCnIYi3w9YaVAFajKE9dLEx773LSwdfphvvyPmSbU5sCeks/?=
 =?us-ascii?Q?Ea6tvOw1JycNLKPKCjVUqBz6gqLvqkxStnTCkK1rx7Ti16Rn3slX1+vRjmdr?=
 =?us-ascii?Q?K3lg0IPfSMip35uyN59TODZJxubaItBWyF4WlMhxZqCPMfDemtZwWjWdVhCG?=
 =?us-ascii?Q?1tNaX649A9aUJIHShAvpR3qhAXzz+KRvAt/byHxrvBYyr0RNpjmsOnEGiUDY?=
 =?us-ascii?Q?nlMXm8P5pOpxHfAs4TW3+DrK7lvdkPhQs7tRzE2f9/RZbqHR9dMnC9idReJL?=
 =?us-ascii?Q?vjZAF4eQLsR1q0HWvHp5IpfbdM9xPdrkcLzQ1OEN9VXFw+x5/QWYRGjZnqB0?=
 =?us-ascii?Q?BR0H41LgLfebwPNw1ikDrKxyxlorvNHmTaZDVnJtAQixP40FQPH6CcBwt1Ph?=
 =?us-ascii?Q?ojtRnki+ieMRpgnRDp6iCqkFah1WJF/WeOpsnu0YyzYNBzX+sA++Ob7zjlWF?=
 =?us-ascii?Q?no65eeQY74vDqvLDbuD8HfyZTbppvzdbFdPU0JS6t3QiwqYJFVulrtIilm+h?=
 =?us-ascii?Q?8IMkb8Wgoza1+A9ZNn3KJ8ENQRuwafZSxhkKt6MxjU7Y7VD9YkoNEbrcILzV?=
 =?us-ascii?Q?0+/N1EgRu6CwNwb7MVvTd5khCuvWM9MFwsWkG8NQ0oL68ivEH/KoR3npdzwc?=
 =?us-ascii?Q?220lzTqYIW4YRxtrbM1ggsE+0DRLMFvc8co2KFmQRj/75ncsRSCKnK2mPyQ5?=
 =?us-ascii?Q?oLt5Ve/PUEMO6ts3R4DRRzrDNEaHKB3qxYhympsv0eDF1t4B0ox27iGTapxQ?=
 =?us-ascii?Q?w5EFPjiEuaewmmJls82TnE9ilf5E4jnM4wPO0cpOoTHmBoFwIT9AbywiFEAc?=
 =?us-ascii?Q?KtPR6g3S1Y09CEfPetexdGa+l2gKLFREWn4m58AXFGPMVQqI92IMPMHjRMIC?=
 =?us-ascii?Q?hx9SBgQuMI22/v9TbeC9SknRc2T0xUGbuNBuVtZcVyFZNwl6W1K7+ONiliLj?=
 =?us-ascii?Q?8JR6nQ7KDm4xypg7iDBU5G4PTU0t8aFk/GFlnscFPF9264uPJ+zhxEnDpxkv?=
 =?us-ascii?Q?mKLd8O8+JVde7DqByyUBAY1AtE7KbDWuf5kYR0YF2IwN48G3UUoAEuzM9fxW?=
 =?us-ascii?Q?MWZk3NlpDFfDedobgw2yAA7vvoWoJv9jyPGLgoZXrgq4FZ1TbOpgdkkTtXZL?=
 =?us-ascii?Q?k9z0GElHLNS+xSo4P94G9zECvRl8aEF4Ho4F1kbtiDf/Z02fKBvPLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6gFfs55kmgKouJC0YXC5mZqu7p09KZpKXgJkNkusC+m5W1UdFJkm25SuwqBe?=
 =?us-ascii?Q?f49kxKm0Q2gF/rJtIpjjiveJtkwSrOkF2oOtxoAWi2/76D9EwDwfzNQSWrW7?=
 =?us-ascii?Q?EzAloJamFIpn6qSWB4AG0PNK9YRkJQGF2dwT0uCsNHZAztebgcRsYLY0dbD4?=
 =?us-ascii?Q?SqA3gDz7YUvWAN2YIS6AtTxB3j/Lo8pLqbbWRtj+OPkTERGIQ9YPmh+fxuJG?=
 =?us-ascii?Q?3E/c1+PQV22mKbdIeTb/XZtZvvujWMOGfLosd7iwPSr4+Xs5qMJoPTmrRWCD?=
 =?us-ascii?Q?r10ozLPfub0+pYYDuCPg4OHd3rCKX43EVKDJBqN0iZdNQ5WXODI7nNsvqB0l?=
 =?us-ascii?Q?xYr3yLcCMMhc9I4gLtSUtp24jhpvr8jsomopcJQMG7i4PWwf3/w6ciHiDecs?=
 =?us-ascii?Q?znLIssFn/JigreJXei9EZXOiGD/E+SNqTkVEplNJLzWHPjFc1pBCKQcMnoHk?=
 =?us-ascii?Q?eQX3kofPSvkzL90jBBYJFgVdpijnU1i5jDr4QltSciAvnv6VOW63bmolnsGt?=
 =?us-ascii?Q?T00jHHjVAqH1CJ5A5v6TzAweqdkc8MExfjkn5Xcap9CojfZlqvCjjTF2B56h?=
 =?us-ascii?Q?nj6G+zBd0X66FKLK3yvvrUMoN3SHhY7XLGcYFdc+dhI7tb8DsJeBvsvCZI8P?=
 =?us-ascii?Q?n9iI6O/ZEzGzr2ez4e6NR8QiN9CNdFPceqiN9C4HAdSCWsj75FcbVl/0Vcuw?=
 =?us-ascii?Q?OT4tWpofVq1TTnYxteCJXJHYXhL20TSkTVrujsKipsWRw3x7OLkS43C8uMEz?=
 =?us-ascii?Q?r/CI76zi9gqzwikGiu1sDBEm3N8w59G8xpYpv8AJihsgayT0EJce3Dwi2wt2?=
 =?us-ascii?Q?Sho34LKpP64Yu2hwFH5ISjPxlW4YM2HHh0ErKVPXQu7DWIvIYk2503L3rysv?=
 =?us-ascii?Q?uRGWWLaR8qtMZeg76bEzBoKnWF4xscF+GxyejfE6tGLoZLT1L6tnKyiWGRfd?=
 =?us-ascii?Q?uaP62FwqvhHZSFCMdLW3HpCAO3XOaGVhrfUZPv86rbrkLED4O6f0ciXhA8uK?=
 =?us-ascii?Q?BU+EQQXt1lHKTsyCM6DMpvbtF5PA2TqWbGk5XVewCoavqDBhfwmuCVRKvVv0?=
 =?us-ascii?Q?hyaevdyDgSyqfWwf8HgkD3lJ8nU6CPwNCKemBxpKrHDcw2YRg/q/X50hBVG/?=
 =?us-ascii?Q?3MuwD2MUIw9jTpPD8DFoPyYW/GbXhUmzgyT7xDDCo2DJd7+bLp+1rzRsgj31?=
 =?us-ascii?Q?AP/zhQ7q89+LR0byeN9nEvBEKYfQyS3p1qY1o78asSUCSFSsq5JPcsC0nRkY?=
 =?us-ascii?Q?Z0CIPWhM6HlnlKTXX/EH+bqPZYGU4Uj9yBVU1rgoxwzbcMtfHcJ6zAz83bVM?=
 =?us-ascii?Q?b1Tv7CVPuAwV2jOSmvRelggLlfNkRlqsE3XlBtO6yGw9Hj/TYKIHRum7r4GY?=
 =?us-ascii?Q?WLseyyFjusHkhoWv5TS8lSMQGKabQWkr7kySxRkgbfn6ZSPIDUp75dTr1zcY?=
 =?us-ascii?Q?H1f2cmJK41B1ZlcwUg1RrbXhEk2L7cvU+/ANni+qlN/O8QLO0gGMKlu2tgEd?=
 =?us-ascii?Q?tOKHPHrkYfQFjyxkbrcu4wF34W6NyAocA2SlWgTE3ezU4smCPABid7GIGWk0?=
 =?us-ascii?Q?+0/YgIEsN2IODHEI/OGcpkqTLsK66fTpRgxCp8lhwRqPFagyMpeLU4Qdrpcl?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f384c032-4e72-4175-1fd8-08de3ee10313
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:28:47.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+mZJWU+UVL2Yrn5pqbGRfYdK8+8sQbNKshXl8GaS1AhJxghlUFdk28BIAjhN7TZZgIY5DQSWkY5HZ4xY+ywMjYOx5bFf2+6CqIe1u2sc64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
X-Proofpoint-ORIG-GUID: YtrdlfVywKDTGZVVVaJ7j3abVvKGMPfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NyBTYWx0ZWRfX+6YCZQ3JMSQT
 0vKC9oUYa+iWu8o2GdSgU3u6EXCm76Ezhv13Czc+ed2q/nA3tUy9JkPL84qa+5MSu0NWSt0nw5A
 WdYHRQ2st8iEelBe7KVGNAtMEJViG6G2eGb90jB4zbLdU6QVBYkeIp/I/6Vo6WId7S/VM+EsJEO
 0xRRsN4ck5u0mbGWTmitteS0KC5BUoiGP6qcbXd2jOXEPgyDrLYbKRuszgYJk0J20f+lKtzNckR
 3KSOJI2aa054npCDSUOaVsb9km3g652jlH5N0wDeeNBM9vVjMzdri2NqTxFdUUP5EXJs2PIoloS
 ap2xN58wBrCYkBq9cZXizEkzqlg4Y1srx3QkKDHwRSnNs6KBtd+S6YwwuBE+L1/h1HZ34YDY45s
 CgrC0Xyqg5Il5JthknAohX8mFy6+kWI9zCyQLKKS4mVUS09d+rmOuGPwJaYo35xExI5yDaseztj
 FFwFGzOSHKCgMGikgkg==
X-Authority-Analysis: v=2.4 cv=H43WAuYi c=1 sm=1 tr=0 ts=69451ad4 cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=dHwC8glK4a3Alx4pFYEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YtrdlfVywKDTGZVVVaJ7j3abVvKGMPfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228201

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11839

PR 33448
[BUG] Aborted in tg_tag_type at prdbg.c:2452
Remove call to abort in the DGB debug format printing code, thus allowing
the display of a fuzzed input file to complete without triggering an abort.

https://sourceware.org/bugzilla/show_bug.cgi?id=33448

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0019-CVE-2025-11839.patch        | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 9ad79b85d3..4d3390cf66 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -45,4 +45,5 @@ SRC_URI = "\
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
      file://0018-CVE-2025-11494.patch \
+     file://0019-CVE-2025-11839.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
new file mode 100644
index 0000000000..7f2f6d553d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
@@ -0,0 +1,32 @@
+From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Nov 2025 11:49:02 +0000
+Subject: [PATCH] Remove call to abort in the DGB debug format printing code,
+ thus allowing the display of a fuzzed input file to complete without
+ triggering an abort.
+
+PR 33448
+---
+ binutils/prdbg.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
+CVE: CVE-2025-11839
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c239aeb1a79..5d405c48e3d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned int id,
+       t = "union class ";
+       break;
+     default:
+-      abort ();
+       return false;
+     }
+ 
+-- 
+2.43.7
+
-- 
2.49.0


