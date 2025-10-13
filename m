Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D83CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 09:49:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.39496.1760348974711588901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 02:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rum8CPWw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2381cdf521=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59D501JT539225
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 02:49:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LxDFIr4Jl
	bRvEb2TxcouLCaxEhg3mN2Y0LQjEZrTj3A=; b=Rum8CPWwyBIap84vuzHMmp1M+
	/h1Hw2Y+S3HrRvG998FYuF4EdV53N5V3sPcsUpxWO8mxroWwnf3UotuGsNQAC+2g
	IqB6if/KB99GhoGEpmcbS22IoQlxNRHtoG8RDpWuuv5gNkN+TezuikDRWlVINkDI
	fdIsZUulkK+kCYDFr72DNeM2xSHChiXHJgx1qCR20CefvgCxpFDdVvYIG9EDfeYF
	C55gZsfumrpBE6fu/Wg1IPAc5enGYu8XWIGuIyblpo9wJOmtyE5x3GayYSXpbidj
	Y1orgy3VW8lOB0i+ImA9+PxyAGDgH38dyaaKDegnRW0Jj+6rJHBGrVl+grDUg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1hg2q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 02:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+xrarAzdbT0UqJv2VPW19qFPprvZMBJPicf9h3Hl1aJOpkYfTWOQ0lLRTQ6ceapS2YETR+MUCI/NURWFG0Ruq6b8/JWeBcH7ZbzTxPJRnUfC1xGi+8w0dKjSmt35u9dJYcxGI0A9wSflMLs9kahvultfNalkZxF3by6sG5RXAGR1N1VfEAcrV7RqFvsXBVTOL92UBrvBJk9gAiMJKmf80NLSW50Xb+KlOvw+Oe044Pw9dw3+YksPl5Hz7FL4SV+DqNQiybCFPKcJNar3C1pYAXLcU1Fn80C/+V/q6N0+UAWgDkV3kmSiUmch4MkWHnfXHosw7NInFcHyGrLf8NQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxDFIr4JlbRvEb2TxcouLCaxEhg3mN2Y0LQjEZrTj3A=;
 b=Bc3ZMK/KlgmqDC05a6SEpxCgxIfiQgOZwI8wdC6os/ZdMWGFk5AiOMe0o+hHSm0wVqCjGoAbRfNYDoQLM0eaD/u+Mlzm2pHgJUYg024H18c4oAeSlSPOTc1YtOvG7mER0QDKs5FN/eSZ7unAZEmW7yE04ukfr6OqFvEmHZ7XxUcRhQLkh/rsudoKxrdOXqyOqQD42ZhkN1CjmSurnJGjh4VqBKee4mH2QZPti/pgcT18XRL8TVcEe11wcGKPn668opuSgq3nSvmCY/G0BOslRPCRGz7oX+A1wovtSJAXoXIZKjsIgrdzkskoY7xVJKnPE7asVFph1T0dVJ4RLzGYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 09:49:31 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:49:31 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH V2] glibc: stable 2.39 branch updates
Date: Mon, 13 Oct 2025 02:49:15 -0700
Message-ID: <20251013094915.2816229-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ2PR11MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fee4393-3fa0-440b-ebc4-08de0a3dce71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w7+VtRIxEqJSpQzy2jJmbcA2KAxM8Hn/X5A3aFC4MFCt9vbsnyWwg+r/iRNS?=
 =?us-ascii?Q?26+IKVHbvpGBc1R4eJmcV1Qzl43ip1kWqYT+E5vDV0Nl51vuwXQpFVgB5nTQ?=
 =?us-ascii?Q?eQva8teEwRRzIRcQSWyoU5tIqhWsPg9IHcv/7VicojTVLI/77cHOSkM7YxiI?=
 =?us-ascii?Q?qjw41J20kMr2/MTzSwq5EMrxgubd/8f3Fu3UKioDXTGwo4QtezFr9ZP4K/cT?=
 =?us-ascii?Q?un2xeKMK3I+qBYwQI2+CHfJ0+R95NJBPfDiEDDocx9sru3y/y8x0R3QFzP+q?=
 =?us-ascii?Q?BgKgNkRaYXduv4lpiIA66pekgYVs/FmqF8W40TaOJaLk/weLBmJ8YX6rIhE9?=
 =?us-ascii?Q?lG7Zzy3NgRQqu7/1QppnB+lQH91w1obf4PHfkSVx1yVw3jnEgVGqeSKvQhQX?=
 =?us-ascii?Q?5QzWpeOAaxXd912/sQbH1ZYKAIStXLhoe2dMT6z7RpM1+GrBGbmoUM1j3FT/?=
 =?us-ascii?Q?qdk0X3IkjkaX9ARjEpm/wM0o0uPC6k+OybLNnl1yKeefWZlfZlssEvnKHt/k?=
 =?us-ascii?Q?s9o7wtNLIe+WcOzjRJp/ULk74cL+CvVisHJEODS/Q7VUExINEAbL6wZaTjyJ?=
 =?us-ascii?Q?FYggQv63rMQCWtqa//qRTbWHEEv9cRn/xqKGYa9qY2h4Op8DlBN8p8kktv5L?=
 =?us-ascii?Q?nT0MPdhcupbkrHHx0/E9UT7Jb+QHucwAi33ullK2V9POaM/FZPBihb3Y46I0?=
 =?us-ascii?Q?8i9DnLcRjS1r8DrxbjziP7gwSFmh0g7nFHO9Aa6xma2qnSwy3Fk+yi3PdknD?=
 =?us-ascii?Q?f9S7NYibIXciSaEMewV+3QGl+TDsPBHbFAkZpA2HrMpgO5ts1FQS/UBtdw/6?=
 =?us-ascii?Q?UiK5ULbnJrYxn2X8TT5F+bYtQxVBUSNb9xSHq0UZ1K670nI5AmI8Fhx4MUJc?=
 =?us-ascii?Q?dWMEYmVsOj62GrGdAd5AX0doAGQNMjFXKBZsvahA+aEFBajQAM4XT8FqTQMM?=
 =?us-ascii?Q?izqapAIGSJCppJkWuVmCsd6LcQWhX/7YDjGWPkp5PLYuJCxY3FXFgyOfUbP4?=
 =?us-ascii?Q?kTsYI6eJ7ExG3zpx2uIa6NU6ug4p7uem+/dbH9hyRzrgzVLueDIQbTU4ZlGU?=
 =?us-ascii?Q?rbT8C40iiKpkdMci8QHNCkMJ+UMSysdpAhRuNW3wctQmoWWh5isTNJHmKeQg?=
 =?us-ascii?Q?A78K79H6m+VX2y+vQIom+OeCDp1UhPQn8msSQvACTrYn0Fm2Cju3NfGd87WL?=
 =?us-ascii?Q?v/pAy3cX4L5+a9xmszkarlG1HXSeLWTi3HPdFS5cU6IjZIVrY1WEBia60cfm?=
 =?us-ascii?Q?IcKtp2MTkGqBKhCmUfx4Ws9Bu4q558ucl6pC96I3qUVU9SJlL32OZtMp1qrj?=
 =?us-ascii?Q?tTd48qvK9mCZbneZnIYCruUwEV7Zj3hjZ0lBdJ4neuhiljMxUMpb6pDiGtvL?=
 =?us-ascii?Q?/LDV8X9sXlTNLI2aUr2Xbo+nPVbH2xPujCu1V+Q8bzBvlIIxnvc/5nCZDh0e?=
 =?us-ascii?Q?FuJl2dKryopNiAI4cvKYfGlgG1CUCtYrP2tRSSi3GoMA7Ik3q+MTmW+BGvfJ?=
 =?us-ascii?Q?KiF9nb92i7dY1A6aE4TMXFZ0X5QdUzByDV2t?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AiYH+bnQw/ExyZnwf7zIIpAsAvO0A4wCRyKDK9F0/CaiB+HtBz3CC7NgI5oZ?=
 =?us-ascii?Q?UDAgmpMZs4yplkWpNdpNFqviTe2sLbnUTohdFhNoYmqR/DSH2qDS/Nf9nvCd?=
 =?us-ascii?Q?MOsjPBvTO/4i1KBqxUx67hfUWuWerN52VqK158af06drzEI+/e1EM0IprBgV?=
 =?us-ascii?Q?eA4dFaZwJFqQVEKRDLvsGOFw2kH+2CBuWJWg9wwvuZFaqauY6uJkoel3IJ8+?=
 =?us-ascii?Q?NqD08az0GeJ8eJSwIr73RgxaU+vfL8mI9Syfpza240zjS+quwpTY6wULjLZx?=
 =?us-ascii?Q?t2W2gGlc5mZdzcz3gRmuSej3s2126FFKZfqqNiX0JrevkEp5qjDe4FqruLSZ?=
 =?us-ascii?Q?3gMdzhLnaBLDgTDlq3LHBaltMphUIBJwOvAH8Qxzku8stTCzXO1w7B+1cChL?=
 =?us-ascii?Q?MdbV0WDfdZ+wC9Eh0nNFTnFQxsXg2lP10n13ziis/cO2IDO3TvdGwaenOTcU?=
 =?us-ascii?Q?1V1LbpNj+kyCGSVrZkxGRyxjHTV4qQh2oWCwJXYlL3qTfqpyXZE1OD8Rtgzn?=
 =?us-ascii?Q?/W6Hqd3K1eVxI8NhYmkd8SLeAqgiEGjyX25RjyLXN7WzntfVd/0L5K5hs83s?=
 =?us-ascii?Q?mcx0uq3do/RXgLOx/8QwUegl/l3H/Icnpni1rk9Zybr+HBlA80/ehGyaJldc?=
 =?us-ascii?Q?VFPOJTUFPBUsF6Vi2S9S5/+n/NT4UigLEEiObCckHa7/QmnW+spNAuQoEeD2?=
 =?us-ascii?Q?LTmWmDrk3aM43Quf51z0WhXcapO0MZbQny7g+6NQmGzc3oIKaJyFiIWY4QME?=
 =?us-ascii?Q?oCI3iT9DXCZyAxAGEXO5E41/80A0MddRsLPpDPiH2KKQZo6oH+nGKtiu5ord?=
 =?us-ascii?Q?x9tm9ug5Qoi9NdqSkNHuV1Gu9lv3/SgHnTXBLmwNyWvGy2xe0j9m7XQgYDZM?=
 =?us-ascii?Q?f+PkO0e6msiGy7+2ViLABRLqHu1VFPSaXpS4tL8oCJLXnmPAkd/Y5R7lmtx0?=
 =?us-ascii?Q?MymKkFSMWn1zohOyH+xVCeE9WxD50w+NIL/Ylcwr07t2UQraiNwSPnVZ+Ent?=
 =?us-ascii?Q?Kci0JJ0a7Y1a8e7n7xTaIqVhvV952jvsjOJW6LW5fdI8VtHRGbA7wKjq/SE1?=
 =?us-ascii?Q?w7hfr19Qgjshfs/HYh+SATZSxscQvPZ16oJbIe68qCbVhAKeng2ycptgvtlV?=
 =?us-ascii?Q?OoSVxaceOAyTx6cb89vIPZBbA13Af8bd3p8oEKO5t16/WOH+qQYxL7gGgFDC?=
 =?us-ascii?Q?CN4vnFw+bEExotGimYZLApYxfVLSi2RODT9uexpxFadUw4/l30jx4iFym1Tl?=
 =?us-ascii?Q?tgzxe5/A5ztxcEmiKsSGzrsTNgCQnEuUJxbjHvjq5dldL+9/DrXZ6m4TI2LN?=
 =?us-ascii?Q?ncQ3U5KDycWxgh14/2Bie/jfxeaxy+VKeFdMbr2mHwG/7pVDgOH9lLnr4tt2?=
 =?us-ascii?Q?A+OeuUJ19VidKHHRShwBOZI0LBBpBQBdJQqSV5+B+WEot62j6OiFzR9y9D8T?=
 =?us-ascii?Q?RSauYpguCVZhCWMPIFGGC2J2FgWMalq58mQ3kGIvsiWtiOnPWVs0qQalQp8Z?=
 =?us-ascii?Q?10ytDxx3dyjfNIMZv+Ww2VGUXBnZDmcHXueostAraApWBnOHilUbZWk1Rmn2?=
 =?us-ascii?Q?JfZhMu9tPN+Scb8WW3DPBsA+PX3J2ecknmawfBXzHqCePvQgIfEt0+NJaHVe?=
 =?us-ascii?Q?3Bkd4DobgkXBdIVaGEmJihk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fee4393-3fa0-440b-ebc4-08de0a3dce71
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 09:49:31.2832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bL9YkpFrv1LANczQxgzptwfGlxmfrXI0ORjpMmqKeqKa0K8NFUWeWbO46Bq+UT5W9zdy+qBhfv749YO/tLQlPzgTlylPqjreEqKs2k54i8RLMCxn/I8KZ3uJzuD35EbB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7599
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA0NiBTYWx0ZWRfX6GdgtV38xoxe
 DHKherm0wdbnozazbNEI+GWUBQsxf6PGqjt/hvN3XOdNRsoUifqTrFkPFsDY1mS/ZT7LlDjqRu6
 KX+rTEWByUjloLCBPk2XhPN2nfa0+UGlbBdReELIeLUNqCpZXJWWeo1oARwO33dnlMz259sFBp5
 BFI8e+YqUSgEtTzk3d32p1v3i/sr3xcWop2vh7Sma2Yv04vC4sDwys11AH2W1htPdlN9yz7dzI0
 fs6Ju/FrfcVqaFwpkTqEu+NS6YFADJmEr9yA3Z/xp8gICptP37dTSkCxbyHFVHcmmNUN2Vuknox
 Q++CPIXiPnP2ffVtbrL3Y/JNPTgkhKXCRY0LXEirgzLN5LebhRgqjHX+/G0GKst2LG5giQq7A4x
 pdEzJC/D8l14ho6RdsxrHfOHlWyWPA==
X-Proofpoint-GUID: hU3N6EYdaV4VPASf12EAip4eNI61Zzen
X-Proofpoint-ORIG-GUID: hU3N6EYdaV4VPASf12EAip4eNI61Zzen
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68eccb2e cx=c_pps
 a=yA2OuHN0nunLSqluPLsRVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=ITOSnwOEketPtstdGAcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510130046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 09:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224769

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..58cbbd43fe82910cf8ae9008351b0b0665104500

58cbbd43fe (HEAD -> release/2.39/master, origin/release/2.39/master) x86: Detect Intel Nova Lake Processor
835b1e3379 x86: Detect Intel Wildcat Lake Processor
765534258e nss: Group merge does not react to ERANGE during merge (bug 33361)
7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
a6ac06abeb Avoid uninitialized result in sem_open when file does not exist
ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [BZ #32245]
fffc2df8a3 Optimize __libc_tsd_* thread variable access
83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
3b6c8ea878 debug: Wire up tst-longjmp_chk3
89596f46e3 i386: Update ___tls_get_addr to preserve vector registers
4c2509882f elf: Preserve _rtld_global layout for the release branch
cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy relocations
97017da5ef elf: Introduce _dl_debug_change_state
5601ad79b7 elf: Introduce separate _r_debug_array variable
24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bug 29190)
5f5c411132 elf: Second ld.so relocation only if libc.so has been loaded
4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug 32066)
f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug 32065)
e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (bug 31985)
fef226255d elf: Add the endswith function to <endswith.h>
d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.out
4f145bb35d elf: Switch to main malloc after final ld.so self-relocation
65d86471ce elf: Introduce _dl_relocate_object_no_relro
5434cc2c41 elf: Do not define consider_profiling, consider_symbind as macros
b2d8c6cbe7 elf: rtld_multiple_ref is always true
2b89de7c91 Revert "elf: Run constructors on cyclic recursive dlopen (bug 31986)"
46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
5f225025db elf: Signal RT_CONSISTENT after relocation processing in dlopen (bug 31986)
d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTENT switch
6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986)
9fa7cc6a0b ldconfig: Move endswithn into a new header file
269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support (bug 31840)
42a8cb7560 Remove memory leak in fdopen (bug 31840)
d1c1f78e9e math: Remove no-mathvec flag
20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variables [BZ #33234]
c11950503f ctype: Fallback initialization of TLS using relocations (bug 19341, bug 32483)
25c537c3b3 Use proper extern declaration for _nl_C_LC_CTYPE_{class,toupper,tolower}
fbdf9680cc Remove <libc-tsd.h>
fca5937510 ctype: Reformat Makefile.
49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)
392e6cf1e8 AArch64: Improve codegen in SVE log1p
3a78a276a3 AArch64: Optimize inverse trig functions
b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]

Testing Results:
            Before     After    Diff
PASS         5080      5099      +19
XPASS        4         4          0
FAIL         119       120       +1
XFAIL        16        16         0
UNSUPPORTED  154       154        0

Testcases changes

testcase-name                                                before           after

debug/tst-longjmp_chk3(new)                                    -               PASS
elf/check-dt-x86-64-plt(new)                                   -               PASS
elf/check-gnu2-tls(new)                                        -               PASS
lf/tst-dlmopen4-nonpic(new)                                    -               PASS
elf/tst-dlmopen4-pic(new)                                      -               PASS
elf/tst-dlopen-auditdup(new)                                   -               PASS
elf/tst-dlopen-constructor-null(new)                           -               PASS
elf/tst-link-map-contiguous-ldso(new)                          -               PASS
elf/tst-link-map-contiguous-libc(new)                          -               PASS
elf/tst-nolink-libc-1(new)                                     -               PASS
elf/tst-nolink-libc-2(new)                                     -               PASS
elf/tst-rtld-no-malloc(new)                                    -               PASS
elf/tst-rtld-no-malloc-audit(new)                              -               PASS
elf/tst-rtld-no-malloc-preload(new)                            -               PASS
elf/tst-tls23(new)                                             -               PASS
elf/tst-version-hash-zero(new)                                 -               PASS
libio/tst-fdopen-seek-failure(new)                             -               PASS
libio/tst-fdopen-seek-failure-mem(new)                         -               PASS
nptl/tst-sem18(new)                                            -               PASS
ctype/tst-ctype-tls-dlmopen(new)                               -               FAIL
ctype/tst-ctype-tls-dlopen-static(new)                         -               FAIL
stdio-common/tst-scanf-bz27650                                FAIL             PASS
elf/ifuncmain8                                                PASS              -

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 89e532fd67..2ca1571158 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
-SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
+SRCREV_glibc ?= "58cbbd43fe82910cf8ae9008351b0b0665104500"
+SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
-- 
2.49.0


