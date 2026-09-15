Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCF5C88E7B
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:19:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24196.1789481951057028132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hNA9HgHK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0aII3613522
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qLKYMIB9jbd/ta7oM+bKLvAm1pTtsaGazFiuj7NVk5s=; b=
	hNA9HgHKzeyGeJsIYhB4WsWotKGql8Y0EKzaCmUL5mJZ+9rWbx+CqTf7UCfv3HCh
	9Zou4sWOKHFi4SHaEI96TrnjJc7lY1cM7z45TOCx58o6kHhhJpR8ZGA39tBXwRdZ
	bEdOou5PwXJcVQTzTXW74iocc5nQ6DoKpjilFGQvXTrFMJOpPxJeW8Xx0xcMLfmI
	J5/F8e4qSeT7HPGqru9NoKitqSd1xyosuIrgdq6XcXtPJHKBm1gb8ZNHGjMKHfH+
	aX9DzD8P6VXR43nzU4tNaMK+R62M3TZhsXJrALsVwT0BwjwONhI+viE4BQPAErJN
	0pngmXWgUgUpqrVoKV3o+Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022092.outbound.protection.outlook.com [52.101.48.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gmxxnp702-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:19:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bD+Cxfzl09XBoHBq8fK6gR+tIR4qIyHchzbBkwFUV1/ovKvhRyQ0A4jmFstp238KXYuAyESqebJwIF8FOkiePURRc+RWiVhnGlwrvORadnBs8VhFfbTtZ4elA3Zqm5qhkBLHtNrxFOBAFgPLsEGRTYRM6MA0PQpUiD+N4kg3tqRt6cj4xLbCRut6Xi0xWlTKnP3H93DQ/OWzGyiIqWm8OMNXvHWqSWj981UvFiLiyTxobq5m06mTdugudXrUL4tUFmQn+PJNMz6/NGrjp8VWk2vVHyL3ok7PeegP3Wl1FBWcVvHen/RPHnutbdcEu6432ChUswIxUf3jtBJ9QaV1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLKYMIB9jbd/ta7oM+bKLvAm1pTtsaGazFiuj7NVk5s=;
 b=RGA3UgBZ9FVFywZEGUosW0kz7RxMwja7dyfvHlWVKtlwuLJctXCLuE2RfY8CE8Vghzxkw6sx7kgfoJNLeUIP/ZbRVkbam87pI34mhUNvFxoAkEce5QfH1nYY7ZmtQcPRCR3KisyQCen0owX9rlUQBRZIkDc1Yvv6ryLbhSMuVCG/mGgKe5vubyw9OpSEdGXm7fIGYRs5kZEKqKikpKbPwnmFBZKviQaVcCjkTEaG84oSGc9szt+DOjkBBRfGzKC8zcFSiQbwpi9EmwI2DNi9/4NzhPJiYMFdc0g7BVB2ch6aJ3wq4hsdFDvAMMj2gU1j4QphQ6vCgeQx+tCevmvHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 14:19:06 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:19:06 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Randy.Macleod@windriver.com,
        alejandro@enedino.org
Subject: [PATCH 4/5] rust: backport deterministic DocLinkResMap serialisation
Date: Tue, 15 Sep 2026 19:48:33 +0530
Message-ID: <20260915141834.1212812-5-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: 7591819a-004b-49f1-efe7-08df13344cee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|29003799003|6133799003|12006099003|25016099003|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	u4W70zgqoLnIVPj8jwMSrLnXReu/GydqSHvmZzEuq+eXU/8rs5Y52O1WRkqSz13S7eKfmWBmscxAgpEgND4FNACLUL7WYssZn2ghGk5mGK4+Zhxuo/eRWDdFca6T6NTEpPOALhWW8FVaBAkU7qJVOk0QgZ1wVrQ7omIX/CPfipekXF4oHT/d36540QUfdo0A0ydT7KJ39jb7xxDF1m+/W395zzr0HuJg7sNBcddcru16oGStdLMjAAX+6XiJwev+i/Olm0kic6xwGEC5RFq1LURM168bYy+p7i6C4x82rKs3MLBt4ffXcPEdpQsml0MqzdbLg+oJHRXRgUNBUtDs1GQImqq1r9dICtPUlK742EvVykeWdFNAI7Vjvp9jzoEhtWY0556VLpaQajPoipTq4IkLh+KGYIJh9Eldk7iw82e81xSe2WR93NQgkf+E56E60rdsC7qG1ZqejLdkxmjIQpbIcTRfxMZU7Wx+qLVAqYTLJbvPnjNJWF8SHeYYy0E/khyhk3pkx4LdnAAXB8ZiDyHWg01eC1gHJhAzmepvN6K775shMA5qpkEhnba/4iP6uAgyPolmZp0HOVTBocq4m2WFUExZKvxSHQUaOXYFZX8oodJsayohrBU7Ik5jDwt8xJS317VUOAxocdzCwX5TDUiUC0y8XkFZkblcYrDs970=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(29003799003)(6133799003)(12006099003)(25016099003)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2BAaft7VsmtR1hw0cxYnvJNuz+vEdBQEWcifs5vIcREhRIrF2ZlcAmfZsovV?=
 =?us-ascii?Q?5+g67L1DMo4MMfpQRyUrjogn3AhMd8JDIY7Pc5F8TsjpM79EAHWnGoT7bnuV?=
 =?us-ascii?Q?aC/hGZ7/Rj8rffhhBbzo28BNJA/Q73dZzwkuVf8Nos56gbt0KJ9PSTpbJCDl?=
 =?us-ascii?Q?oNrqy8OfFeX/geFQ5ObEyi2iJ6MHtl3ueiOyPF/BS9g4sWVaSVRlfDtEnym6?=
 =?us-ascii?Q?xD7uyIvuH/yPBijNNBV8ssnTsC4Qgd7KPj7G8i7ecHkjVPWdl9OyezLxyE2A?=
 =?us-ascii?Q?iB3D+0ZPsmiRfjptVqoa3oQEnGmjSduRYpk1a3EJPZetgrUfmwQg+PJIU0bd?=
 =?us-ascii?Q?wF5QYkCDsfH4JsuWjkBEO4TaNI4gXBZKooMtDVpgG0jDG1c8Z6aot9VSYQvi?=
 =?us-ascii?Q?m0So1R0DfKX1Kj0AAkcyhVj9Dejkd8jDyxnaEEb8+E9nKHa1NDYEWxjNbOEN?=
 =?us-ascii?Q?n7viW09cHRQxxi1CMGsIWysep0CN80ztJSCjHJC3CIVBgrkSGeI36vxNSCOt?=
 =?us-ascii?Q?BQk/ZDptEERjz2OU1KoevdCFBxGMhozvDZRgde7csQwmZptEXgamhoTwa8Yv?=
 =?us-ascii?Q?z/NTAa4vWv6DYJ9Ag8K4dlKBhoHhj9BTbN0FETutioFuhX75ITp0n23HXdn2?=
 =?us-ascii?Q?xLpoWuqxaVlavDjjf0znRFh7tnV74lhW52B/UFFgk3Uc16pqYYsWQvyBggnN?=
 =?us-ascii?Q?RWpb33OkmlX9mNeHyLJyZYd824S1MugvKMiCOHaojHlvcle6+5lmIKuJI9ey?=
 =?us-ascii?Q?LkmLL7uDwhhkkv3VIb3bTusP678+/FUX4C/ARfAgUws0VwoI7R1YdZjq9T5M?=
 =?us-ascii?Q?R320NjymwLEtQizehpnvGRIRew+dj1uin8BkMPa+N2lfpMcbFyKGNt1Ag99e?=
 =?us-ascii?Q?4TpJpur9jnyeTkVLSpxukK2PbNm5dbjOTWrmNYCGVIHjLPiCyGlU4WkuoBXx?=
 =?us-ascii?Q?0/26lWcdUO0ePe8Rq7gFLPiCBVdYC9B7Fq7qt4/2Uru5WAquOEu6Cm+sS8IZ?=
 =?us-ascii?Q?UvuDxhPYKLiOgcWaTCeIOaeXlknVxCEIXO985UCOq/TBjagZYUjoQt79S5Gf?=
 =?us-ascii?Q?BZ5HptsIjxw4cvj2vx/GWwn8508PoYryQ2MydtKFEgNhzshIhp7ki8NpEWtA?=
 =?us-ascii?Q?Lv2RjUUYVT9/7b0PF/Xljey+7h4zAKGkDGJYXOCJsAn+8gLoc2TuAag2wLge?=
 =?us-ascii?Q?uATwnp6IQo9BQnGF1OUDFanQwsA3ndSpaNBsN1svqkh1tPWlPwMOloKuNhMm?=
 =?us-ascii?Q?0bJI8t7DTKHOZC5TjqjAby2w8Ht+fhtxUUvPTjCx3NZnZkjKSrElqa9AoZX+?=
 =?us-ascii?Q?45V2Yfz0pENCIn2FAzqmLq6FGjbVLRk0PWSMdotVNXZ7LGVr3Fwy6zpWDbco?=
 =?us-ascii?Q?/FcmHiZsY0Nzg7IfaCNdw/Lmpa8iRuqlMtlGk5IN2WGHHzPCWAeetIlObZNn?=
 =?us-ascii?Q?dltNjYvnLYBVI8d/kF75bG/FztKPIk1YKJqegWkId7BFYmk8LLjg7ODO6yu7?=
 =?us-ascii?Q?0Wl8LgYEvAtuNWtHsxrTYFQGSSpDc2isaKwmf7IZ6j3CF8h/nQXoVl8AuL6B?=
 =?us-ascii?Q?VAmzG5YYyZcrzdsPqS3jxjPkI1oXYwt0va2f2gjghmstNw88m4QHHd6ZT726?=
 =?us-ascii?Q?jSQ9tmMYnCkL/ZodaTW81xQgDpRJhx3qNEk7Fq8j+XjJpChCTKdrA662cIJq?=
 =?us-ascii?Q?K2M9l2DD1Aol9SdKUDcaxgqjoQm88xjYNbTzb+8wuBX02HpqZVb4WIaiNSUt?=
 =?us-ascii?Q?EEylSAxI0UyWEK1azj8PRJDvtXYEdBc=3D?=
X-Exchange-RoutingPolicyChecked: 
	DIgBLDqpMZlqSwh1m+dhCAU4U7JS3eTwyH4IgV76YObT7VSScd3MmuWkOuFz55Y2WUoXOonuYenrMzZYuXZX0LsjeqEqCu3TCjvkIsdwRsQ/DmvUOojRBuMKoJXGj6sp6YwMJUNJQDZAZG/6gkhNle8JBIMULXQq54gcQrYLpBeG3U4H2YslMWfumUixSCGUC1oj+TIKVFuMH239A1o71omnbVrZOYhUToD4U8vJKkhT/FK6g/jHdKmV793z30ulf6hdtM8bY+MXtRfX9ZCcvpFL/Jvnio7dvUB7uCN4Qny+0KfBZA0k5mwVIWzQodeMcXtxlVSvKqlTXjbWtd5q+A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7591819a-004b-49f1-efe7-08df13344cee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:19:06.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvvCCbd66lTtBAQWiSHEWV6I8B80rTmJ8DC7GOkdKvQUUU3mL2I3uavFVK1lPDMHwf9xANbK0ich1bOGMFk0P+aHyfeKt4HUd7NBiPp4VIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfXz/GQczP4YAZ9
 fdLTb+ToxfcPwDMeXAlgDc9kZyZRoeGWaMytgzQ/K2N0hDOrAmdd416IeDZRVnsCV58kMP1JyTn
 EwtDfIo+FqjS+gLm/RLxpMbnz2yOLriwkNT3ygm+JYQphO1uArHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX4cM2iUrKxW9v
 KAAliO9ogS2TDppENnNKnHLUflEdDpAPOYTXKz2bGZ7CITZaHkukfqU9WbgkJtArMSMuYevFTL3
 /bhk/f/NazRhMaLvmajZHGaXd7+fRmoow/OmVgJT3ywGi8+jhHV3ngycaHFZl14VDpWNNpzbSo7
 uizC+W0Bl/nPnxuWAPQJgnBuaQwh3M01W8N5BSW3m02hBsyvuipD5yzocBXQxjoxJEdtL1Wspju
 Qf55QIXA6OES+hOYYdBiDJpkGZuHfKITpGpTjhhq43wcgmsWbNJPfa4FQerNtxJjMyawNz+ohrb
 2ocgndqn6BTCpW/b0WCK0sCTgm/Tsvs/9cxhG20NR9i3ku207xOd69JsifBnFuSeVPR7ctNTNSV
 9Ic+6faQ7ea8gn3UpW2uV7PiFGcMA7f3Flj8bQbFlAzeUS5548RfrmntWxWNvZtIBvmClxwIbLh
 O/gCtHyhsrdRvLcgpbQ==
X-Proofpoint-GUID: E7NAmm3tiGqtW6Bs8mpL45Usn2dXnq76
X-Proofpoint-ORIG-GUID: wcZF1kDiN3FfJVLbrYUF-KRlfq2Zm1zt
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6aa953dd cx=c_pps
 a=kSJWFpm684f10duVF/7JAQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=kx9bFl9ssQdwfPT5i8IA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245846

From: Sunil Dora <sunilkumar.dora@windriver.com>

Backport of rust-lang/rust commit f9d9939 by jprochazk and mejrs.
DocLinkResMap was an UnordMap, so its iteration order varied with the
build host and that order reached the encoded rmeta. An FxIndexMap keeps
it stable. The commit is in rust 1.99, so this only carries it until the
next rust upgrade.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...oc-link-metadata-order-deterministic.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch

diff --git a/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
new file mode 100644
index 0000000000..8cd64f21bb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
@@ -0,0 +1,40 @@
+From 6630363e7bc9bc0926300e242aa538b8d92cdb95 Mon Sep 17 00:00:00 2001
+From: jprochazk <pjanv42@gmail.com>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] make DocLinkResMap an FxIndexMap
+
+DocLinkResMap was an UnordMap, so its iteration order varied with the build
+host and that order ended up in the encoded rmeta. An FxIndexMap keeps the
+serialisation stable. Only the code change is carried here, not the
+upstream run-make test.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/f9d9939467a5185a72f0ee8da778a0b71fc966ae]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ compiler/rustc_hir/src/def.rs | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/compiler/rustc_hir/src/def.rs b/compiler/rustc_hir/src/def.rs
+index d0300d6..e903c0c 100644
+--- a/compiler/rustc_hir/src/def.rs
++++ b/compiler/rustc_hir/src/def.rs
+@@ -4,7 +4,7 @@ use std::fmt::Debug;
+ 
+ use rustc_ast as ast;
+ use rustc_ast::NodeId;
+-use rustc_data_structures::unord::UnordMap;
++use rustc_data_structures::fx::FxIndexMap;
+ use rustc_error_messages::{DiagArgValue, IntoDiagArg};
+ use rustc_macros::{Decodable, Encodable, StableHash};
+ use rustc_span::Symbol;
+@@ -969,4 +969,6 @@ pub enum LifetimeRes {
+     ElidedAnchor { start: NodeId, end: NodeId },
+ }
+ 
+-pub type DocLinkResMap = UnordMap<(Symbol, Namespace), Option<Res<NodeId>>>;
++// FxIndexMap is necessary because its data ends up in .rmeta files, so its
++// iteration order must be consistent. See #159677 for context.
++pub type DocLinkResMap = FxIndexMap<(Symbol, Namespace), Option<Res<NodeId>>>;
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a294201c6e..a50a3fd001 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} \
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
             file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
+            file://0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
 
-- 
2.43.0


