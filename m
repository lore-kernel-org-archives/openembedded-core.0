Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C2BC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:38:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27571.1786361885290390778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IBscPb9+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2682642057=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ABUU7w1935119
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PbkVDPmmQ3QnM6q/Ckou
	SNQj7hUMYehmDhbhoUAmIM8=; b=IBscPb9+FUYImDvIxql6qVlIJ0ky7bXb1muW
	2N8KCw/Dvj+AasZ+NBR/MLz2p5BKzl3HZqaEl+Wr0pE5URCcLqN+HXQcHTxlvcbg
	AxQNs2PmMb5Y12zxoxH2PzwvomafTxtYWZ7vLphu5bWB1TSwnYYaA930wc8MDDR+
	XIVBN6wOh/gQbxLLqQJ+UHhaGcCRewN45wK2uiA8uA972QURPIGZXTp/frc6KXY5
	oR0GBKv5PqPUrAUDLvEl6j7i0DR1gj+sLry1Mhklh+xi6PyfZGCrVVBkiCD6qZXI
	hplwgozqAGw0FDoPsf/9P7V3M62BfGgeGwxi0qdIoQeyqQDgIA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwsnwj9u5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:38:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwyYc8V0mxtlh80YOvx9Rw7E0OFLFO0/oLKCU1/OH9ND9n+CnViNyXasbsN/B2vQGbz4Sz1Y1oKgPSeXD6mlng+Nn6pWbr4xNG8WigZCwWlJkU16/8zoojtekaI2WDpTJslwoAMNf0uK7fgJCT8h0RiraDMgH3HbTelRIfF5XSUQVwmOYx5XnexnA01RVHLv0WwIcWh50Hf9rqty9ZmSI4CAx9Tm3tqYdrvysoA0NYLeKxKUNF+lYrc26hwg/UEbJBExeffZ03IyOhXWtTMH/XHs8KtfOtkI1O23eOktWI5KTCZQ1YpMVQWOlvpHnt+PKt7n5e/6sXNaNM0vqgLgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbkVDPmmQ3QnM6q/CkouSNQj7hUMYehmDhbhoUAmIM8=;
 b=iFTAuitz2HWctupCORbDS4VPulWhrLLNeWn2DF/23FO0ia9pVvyJ2z+aE0LlJae2tIlVh43AF5Q03wklt6bKE4lvMnGITsxV3o8BgOj15eB/gh5+aDWkuW3RKSuxCYl7giRa5kFg1fXX31Qb9chFjhVQZVnN/H3v8FXJ9Tsnji8JAUMWuLxdbRpyZKdTBhcm+yHq2cA64mXQFANpoylId7WodbCXxJrGUgLd9aduqd788I6TZ9Z83TPPeVvm450QSaBjiRrmMiQVfNCR9ZPPE9YeY1aXmbpRQ6MWak8lSqJ6ptNKbdPoVS97nkb3Pw2tZgsAHfBcFXI/VXo63lEOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by DM3PPF733C3E759.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f2c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Mon, 10 Aug
 2026 11:38:00 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::af7a:fb70:1f7e:534f]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::af7a:fb70:1f7e:534f%3]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 11:37:59 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [wrynose] [PATCH] curl: fix CVE-2026-4873
Date: Mon, 10 Aug 2026 17:07:35 +0530
Message-Id: <20260810113735.2818173-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0041.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::20) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|DM3PPF733C3E759:EE_
X-MS-Office365-Filtering-Correlation-Id: 73682e60-1311-451a-c4ea-08def6d3d471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|3023799007|18002099003|11063799006|56012099006|10067099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xbPFwt79wvuBo9mHVCLEfwxjJVy/dTh4tt5U0xApfzy6deswjV/9H25QHSjQWqwQRCINlvvYoQE/g6hio+oDBVi9mUMCNMgXA4isLj8jWWqag5ik2EnT2mj4Ab02ej9AJkX9FcF8oJdxKS0ocpXZSIOpZjNdCyDfhIpzgogm6rNFN0OnewhKdVXNRFHXxryaDv5QIfc90SFc9E4mKwxGSjBZ8AWIM6W1XCC3da9sVn5Fw+YL/XSccMgKu64+3Slv2JUn7kZktz1VG6CbRkIWBWimZMQQF+vl+CC9RfzS3QOL0ja6/2+0uzJ/mq+RpZJWHchl3l77UlAIFJTGFl+EDUdidAU0QtCV3d82yzehdNA8ZnhlEO7frNEqcyQ3ZcSaYNziqY+/72Ak9lsF7OkmXftSpYe+lNmPzd0s9t8r3+Lc9KOS9v/y8ZxirAi9Z+pXXU77YWMn56aoTkK3qQgkJ6/yj2er1Q/ykFzojKV/hMJA311bmJPmK23sDYoGUyrOr1OgRGb6HAdKpM/j1My26VPaNCotl3dmj2v9Xdt0MRCB+W5x2qehBNHt62v53XrOXVECyaeaNBvrMZ9Rt1va7gy+B1BgVdfA8pzCDgc6bhOT9nEoIpSND7MuuypHjO8Vs9uQsN0k9Vn6y8LQK9hWJNMBSvnZIvajI/XfXMC+3KSVcYncYCEPmXiROPUVBUvfhBUpe1hq5GQPZp684IIT4D4+lZn0eJR2MGMr8BczKbU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(3023799007)(18002099003)(11063799006)(56012099006)(10067099003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vTv2wNbvg7j9lOuljnkG841f6nBcUc5XGDBK4+r9mqfQXWSznXa4vrki7amG?=
 =?us-ascii?Q?xThGA6LTCtFhnnI5Cj3L41XN0bRokX9oLjqjZVCucl5TaKwlwj9mFmDsmBy3?=
 =?us-ascii?Q?4CTMZVEa52QiPt7mK8iMqgKdzLFMsAG0dudo3hQjz285+Zk+gLXXV2lzijrl?=
 =?us-ascii?Q?+JG6BrByDyOPpVPgvsZJoT213UE85wu/ynZz3vcO+Kz90nW1Hr35TghiMSph?=
 =?us-ascii?Q?Gw7o6GMebh5kvTGLEz8soU0NEm6zWZ4VussP3hm8Ul6iqcaij9mDh2LkGYTt?=
 =?us-ascii?Q?hFULH4SE4vj6NzFhp05sqQDPCrJh6omvcPzDTtpkS3+pze8Jvlp0ru1c8Tw2?=
 =?us-ascii?Q?LeEPNUc5/+WDSskTs8ferW9Pw6s3+2TR3Bhs5Tbg9Rdst40gsyemAdcBIwXK?=
 =?us-ascii?Q?0jdzKVGNMPOmGIZXp1Mp9H6Y3PGtQzR9h703K8ncMROJ8T7ymEMMe75/OO/z?=
 =?us-ascii?Q?bwhrCovGpWXgO6se8eFIpZecLBHQxvpnTUWm8UrpM8ONtT+JHcrfAg0jACJe?=
 =?us-ascii?Q?N6uyhemKLmyZ1o4neRafkI6dwcI0WJJ0ttwpj/LUQqeW5qc9wPq7rnzcyiob?=
 =?us-ascii?Q?T14YqEtA/rYCgbm6Zt3+VULQglJ/edSGrW6PxrhrnO0uXOw+Qoz8t1FnySmd?=
 =?us-ascii?Q?EBN+GF0BaecUJGKPVWTtLxxyELpUaurMHr3GhPl7ByacdaDL85zi4tTp2L1T?=
 =?us-ascii?Q?vLyw9F0XolvOm6gbfqcxSfmXXEpOHUWOA3iZ3ZIbtsTafCW1/Cbfedw9A95z?=
 =?us-ascii?Q?2l40P6rfe49roTI1UBRyO8VhJyx7xKL+KXaE2GHyfpa4AqKL9m4G6gbovSVV?=
 =?us-ascii?Q?BeLgkwN3rQK3cnGlcxl8Tw84gNUhuCVjTnC0QTk+lfhD1umAObFn0YsEfuj4?=
 =?us-ascii?Q?PM4T+9QAkZeZUrQbdE4LOg5nG1GyQuclTH2ZSF8DNddCWlXoICL639maWvzZ?=
 =?us-ascii?Q?c5BH1d2zSJYpTWcfzZ0pbh/x3U1FR/NLf4BQcrhOBGugCgtSkTReET5njDxg?=
 =?us-ascii?Q?S1Md0n4EAAQztonQZgcMQtrHjmOBt9uHgiQEkBRZi4X2eiyqLbYQC/Nria5r?=
 =?us-ascii?Q?kfCCsHs1HJHsDHoGL4xC6wbUGuo739kVMXyhyZfkNxqBCV2WzBfKCX/ZEjTx?=
 =?us-ascii?Q?Di2vLlKs5QDIluTA4FxbWsyelFKceDlHF1z+v1WZT7GV5ZMPtYpQ4umMG2OM?=
 =?us-ascii?Q?cDSx7K7YyHFpyylvTsYBPFDIaKb2UO2Vp4jdWy3meFPayCF28di36jby69mZ?=
 =?us-ascii?Q?vHCzIkAAjDyfhJqsTSLPiBd6GpBCcqiZpiAyCshjhUqPCl3y9E+ARHBcEdc9?=
 =?us-ascii?Q?mU6cK64fKdIC44F+d66cLyNb96ZaTL7eon1cA71AQJx+YHSptlECbjWSPLg8?=
 =?us-ascii?Q?Pw4U8yQQy5PyyiEU6Q/8Sii/B0dL+aestpptd8OPQTb/kZnD0zEznJKdMipP?=
 =?us-ascii?Q?+2yopC+9QzHKUnP/IkJw7qcBl9NSYOvOjPSfOwk0Y7nSPXKwbgaYQuiAHwth?=
 =?us-ascii?Q?VhF/L6QQIYVykmwT+PTk/PB9GXSgh8uNNk9fdGFevnyddN0QfdU38G9Y8SWw?=
 =?us-ascii?Q?QBQ7r6HWVS+tfnnP74PVzXcr9py1Pgh2QTvvQENxqYm2Mn5cI43zeBb1XeUS?=
 =?us-ascii?Q?OZhTksmSDXx6HFZcFsSlCC5Cf9Wb1jfNegRkF1Df1kRWINIBUPdKg4xLCUyT?=
 =?us-ascii?Q?yttSjyvcfzdQRYOphvA7eEhHpLpmd+9GPl4M9ufNg7mSiGFBYPaP4mkKR2Qg?=
 =?us-ascii?Q?ZW6yeS9NkSLLCZ6GpW0tLsN7VudW7Dk=3D?=
X-Exchange-RoutingPolicyChecked: 
	FllZvNL+HTO2SaVlTsB3aDu1n73PtSnQVATlai+Qiudc3u5ac8mnOo5ZKWEC73/E7WtzxkRt44zdgOkt6JnThguObOXRBDhnHwevPLcql8qU0bggCLYCaJFQWboU57MFJ1V+Xv7BKZTZWWt9EgodhWkPvTH24eUdb/sa+dz99+rKn9eDGAhOQeVQPFt/7kmpzv4SErHOugzCBtYsErxmyvHCbj3Osp2VoMxzL2tVyXPZDDj3AU5xoRLJ+LinDWyXg9VVbGD0CwrcFh3XdFqp1BQAjKBmKqjpY3sMe55nxfXMA5xH8Gk7Malp1pR/ly9mDztLpM1qUubkahlTSTw+1A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73682e60-1311-451a-c4ea-08def6d3d471
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 11:37:59.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1+gr7215kgQML4PMHvvcknkOF0q/T7Dmx7U8YseetLbzg8kNHWOrayBeTkiJeA8voBLxA3ZKi0l/322ldQy1zqv8YOWt0zfRVH2Ii70fU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF733C3E759
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX9z9HHNG61pUf
 CD3NT+omr2iWR71pkAqC6OEr6kLjIh3VcuTVnv4EFh+9/fe7Qr0QCpjNOTDgpPEBuqCCJZ3cEST
 7GR8iuwhptexlCIxj/Sxvbk4PpNUj2sux3aE0aXROqQPkZtf0J1J
X-Proofpoint-GUID: BJAQRLQOOpKrYwB2Lf_g0UpYfrGZ-1O8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX0Eb1IAgi88Il
 VYenlRkiarKAo9IOls34Y9stUYuPyj8/OCVw0cGJRkfB2M46xlTJBDxbtEajTfixYy8yWPnfsi/
 2gHyB9m5DPbhb7fId+6nUeEs5lxa1KmBcK/BdwSJvnpyyKZptDSf8ojN5dl5pi64h27rFuoc6ba
 3BelKj03/E9SzOaHS/jnifNKb28RWZ/FuGfrmKvPsCNoEj1A4FiPNLTEuEJDe8LdpIEEz6xWlbW
 Klp+EilTPuhmRBENDdG+W6sI+fpO7+bRGLpCnmVwHRlBDEDhBnl9aHVGD6pb8Ba26Y6tUbSo+An
 Y39XPgDd/5aGzb8EKETi23qAlla+xcULVpBeYcX6NlP2uasOsZDylA/ck8QgBwRMNYluO/jC4Wh
 KrGWf1JGoddjiJI8joPvGtlqAADQM9mfW/26C0afTBa1R5wEbDe4wVhHwRf82f63KQYvQ52N838
 +Rl5Y4GsBzIueP/4FTg==
X-Authority-Analysis: v=2.4 cv=ZZEt8MVA c=1 sm=1 tr=0 ts=6a79b81b cx=c_pps
 a=eZaJmiuXqmfvnt2b4sL4XQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=ugkhXdxtAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ObDqZnEl5-jpK_Vmy_sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BJAQRLQOOpKrYwB2Lf_g0UpYfrGZ-1O8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243125

A vulnerability exists where a connection requiring TLS incorrectly
reuses an existing unencrypted connection from the same connection pool.
If an initial transfer is made in clear-text (via IMAP, SMTP, or POP3),
a subsequent request to that same host bypasses the TLS requirement and
instead transmit data unencrypted.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-4873]
[https://curl.se/docs/CVE-2026-4873.html]

Upstream patch:
[https://github.com/curl/curl/commit/507e7be573b0a76fca597b75]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../curl/curl/CVE-2026-4873.patch             | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
new file mode 100644
index 0000000000..85fa3c493a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
@@ -0,0 +1,48 @@
+From 507e7be573b0a76fca597b75ff7cb27a66e7d865 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 24 Mar 2026 08:35:08 +0100
+Subject: [PATCH] url: do not reuse a non-tls starttls connection if new
+ requires TLS
+
+Reported-by: Arkadi Vainbrand
+
+Closes #21082
+
+CVE: CVE-2026-4873
+Upstream-Status: Backport [https://github.com/curl/curl/commit/507e7be573b0a76fca597b75]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/url.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 860009a7eb0d..cffd10215ef1 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -723,7 +723,7 @@ struct url_conn_match {
+   BIT(want_proxy_ntlm_http);
+   BIT(want_nego_http);
+   BIT(want_proxy_nego_http);
+-
++  BIT(req_tls); /* require TLS use from a clear-text start */
+   BIT(wait_pipe);
+   BIT(force_reuse);
+   BIT(seen_pending_conn);
+@@ -875,6 +875,9 @@ static bool url_match_ssl_use(struct connectdata *conn,
+        (get_protocol_family(conn->scheme) != m->needle->scheme->protocol))
+       return FALSE;
+   }
++  else if(m->req_tls)
++    /* a clear-text STARTTLS protocol with required TLS */
++    return FALSE;
+   return TRUE;
+ }
+ 
+@@ -1333,6 +1336,7 @@ static bool url_attach_existing(struct Curl_easy *data,
+     (needle->scheme->protocol & PROTO_FAMILY_HTTP);
+ #endif
+ #endif
++  match.req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
+ 
+   /* Find a connection in the pool that matches what "data + needle"
+    * requires. If a suitable candidate is found, it is attached to "data". */
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 097b3056d8..5ba881bd76 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://CVE-2026-6429-dependent.patch \
     file://CVE-2026-6429.patch \
     file://CVE-2026-7168.patch \
+    file://CVE-2026-4873.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.40.0


