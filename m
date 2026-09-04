Return-Path: <Karthik.Gopal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25553C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 18:22:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4783.1788546162383925458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 11:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CKVm3Fro;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37070994b3=karthik.gopal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HJ1Lm1151664
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 18:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=k7l/QIeea
	j7ArjTR0WAv1fWyOPHj5c4Xgv8wyGMgMYw=; b=CKVm3FrozwFuq59amvCCZs/t9
	kqLFvm3PLtv5eQ9Hbdlu69EdQupe5YiJOLUWghkfXRn8A1TDJz51oD/VSuDJUoOa
	YWdu1Lkg2EhoBDHeROdVEXvQi1U3g2V9RZZrqcjORofdedreao21TFb+/NXFVVgd
	UnK4Fk1v0eVK2dvIKWPYdM9XE/AOh5CiDBcCNkDM5MZkKu3QNgKKjK5Qq5qaR2Y3
	+CTqvZqTsp09tE/x7cB2r6SbDCVhoJ4X7LGFWoc9Qs8RCPMU1oMSFGXeGvTbsxIQ
	9wifuo6F5iVumRnZzcv+NJ05X4HQB63wFPJlaK2qU1eacDZhJQMAA8o5NywqQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022097.outbound.protection.outlook.com [52.101.48.97])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5nyk26u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 18:22:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJaYNamaQGWq7nsvlcZj9vlf3FgAvdKu0fJyonQOPKlstAP/v9+CI9khsDI+fEUwQnkrzL9Sczk6cVcHOvl9uxf8jzLpozsERvII3eVWZc3DwxDHrTYiSTqsRwNSxWTEOTWeIXhaD8B0OMKy0856GxSHjOL8bNsipaHJJ3jDy0FRDZbdoNAZ9S64T/8+4ztPr+SIlt9nXR80dMBcXOIGukFSw4obJnXbOqK1q7dgCz9xZT87lGzOlYkBLc1mHihPaMUYtwZoamwI04zX19wA44RiAA25MO5qrANScBBZIBT6kRDGHkzVvefVIrIOusFPs+aFhenu3SwbEgLu+vpMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7l/QIeeaj7ArjTR0WAv1fWyOPHj5c4Xgv8wyGMgMYw=;
 b=Wpwmg3MX+W01fSUujAu9X2Cbis+zXEFsooThoYNGndIoI8u83Cf2nzERlGxZQcjlwyFqw97TkZ+Fp6FnWDZ5as3T9HGrM2/mFZ7gC03+kJz1ZmvaTroraTOkDwskBVNZxe2DQrXL7hFIuWV75LHt2lzvAoL++eq848poqwYGEPkgWwCo64MQTzAmi9wOk3jWbvOFgv2dcukB6LQzHduQZPTF6yxXGuF3YIecvPKceOLxkKgv+HeP0y0gKldSL3yEKnWFFPR7/Bj3w7JJySOJdvfPNCCig+MbGFL15RU8Sq8N710TyezlIm8NeFdQbGOUrkH2KVM/gyl1JpllUpv+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4231.namprd11.prod.outlook.com (2603:10b6:610:3e::14)
 by SA3PR11MB467332.namprd11.prod.outlook.com (2603:10b6:806:513::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:22:38 +0000
Received: from CH2PR11MB4231.namprd11.prod.outlook.com
 ([fe80::784c:cea1:4b97:f9fb]) by CH2PR11MB4231.namprd11.prod.outlook.com
 ([fe80::784c:cea1:4b97:f9fb%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:22:38 +0000
From: Karthik <karthik.gopal@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: karthik.gopal@windriver.com
Subject: [OE-core][PATCH] maintainers.inc: Updating maintainer for recipes
Date: Fri,  4 Sep 2026 13:22:01 -0500
Message-ID: <20260904182201.11581-1-karthik.gopal@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0169.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::26) To CH2PR11MB4231.namprd11.prod.outlook.com
 (2603:10b6:610:3e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4231:EE_|SA3PR11MB467332:EE_
X-MS-Office365-Filtering-Correlation-Id: ee55a1ff-8b4c-40cd-6054-08df0ab17fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|38350700014|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cIx8MqcSYktJfWYbXJlqO/EbI5Gf/cThgapnvYcfEfM7Ht+MhhG/vaqkyG7tEwAeakh6zWg3q7LzmfLTRwyY19Pu0g6mi1+uGrjMK/FdQ3CBOwQH/XDfj46pwDGtAIIUTzClFiywN/XaOwt66IF9aHGeJ4S/Iw+lUXA+Vv1sSqQB1FWkF0SJlzARnhNH+OHzFp8Kfvxum+Fh4Rd9cQ1e8FR9jn8qmB2VVV0VskSV4KqFExwf2bo9HubLefwO7afq6tUVDmN1WSQlLOFYnZzQHuVRooUCBe5NDq16f5ncowA6aJTaQR19qM/Nk8yVvgoFvD8CnmEHbEEAR9Xka0BmGfsLw8F1LOTLEae/4UMhQBe/OobUEAyOG64ssFb5JGgbw4nVoJQOFq+YMSN+pgA91uyP5SiaFdAh1FskiaCPHy2OK09trSk0YztC8TXwxf9VOFBRZftZhiOzQYaHOJBjfPgFlb1SP6fGg7ILmNflGxq9dH6k+wO6gBLy1pkEwrxJhsAFnSP6CC3Ja/TTeDno66Hba6mlg/s+vu1WMTL7gXM08thYbz8qbNHw+tHI5b+P+HCvNpHkgoTWgNklfqx1avjoCuvtt9sM9U0tKlYHMmy2E9P83CiW5w6QGruRXSt4K4ARY6EmPHLsblp4wq9yz5hmu23JkAGdUiE9BeJ/W6XmGRPbH5D/Wq9iCwNtev9afHG9UvpsApyxbvbOkeVaquj4m4ZdRUXf6dCx5CePM/I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(38350700014)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XLqa0+UAzOcr0+i4oTlSjGtLBqHHoFfl+skB9C7nktzqpn5gDG1cKF+CDg3a?=
 =?us-ascii?Q?bgoKirIrEez4zIAI2jjfwFLtqC7cltSSriklljqB/vW0v15WAjiQA+y7iBiW?=
 =?us-ascii?Q?ZRgmh8dKiP6pYCWRNVFDalBmUV8mwC9glRnzOd4RirOA4FbmxatInsOp7sI3?=
 =?us-ascii?Q?dOOdnbxU4UnhKTj7Rz8GhbfyKZxfAU0aYlUrCK+ZYpKaXmEHu4uEC6HXMvh3?=
 =?us-ascii?Q?cvcydu11p2qJ5S5kRU62jCdHs6/WGcRUVbJT/X3Pz4WTO41IBalgCw1Z0OYF?=
 =?us-ascii?Q?U0fek78DOkf9sDM/JR6TRZOz9MeUlOhqrvBpjw/QkuZusQNK1BqWzOYpGcMu?=
 =?us-ascii?Q?MNoajGZ+YWF1Be/Uk41Em5JqO3PMYXHCIZcqLJIrIKJZsvHB3lYk2nZiCXVt?=
 =?us-ascii?Q?RZEZvEuieEZyl5oWT5GNnMSMXcpxdmnE82nmEsULkxuskU1kNwd3YhjpR8Zq?=
 =?us-ascii?Q?Eo5OqAYXfv5/9dY3aYXISZbsiO+HPVgNT+la/Hx7hL2EkwkA7pL8jp0QPQXP?=
 =?us-ascii?Q?0hmZ2td8KGUVwJFQ1ZplGmNnLvhzCpbG6zDjlqiy0yXgStGjqpzcJPRrFe0W?=
 =?us-ascii?Q?o+vMTjwDLiTUIKNMu+qg28vwBh1EP4A5ivHOXB8d10TMDF+fkweqfHVEHXnE?=
 =?us-ascii?Q?DwnHy7CHcP3R/dJ/f7H1tojbdLWpSoSaooXgQTTY35NfYF9EebdXseiMe/hk?=
 =?us-ascii?Q?ywp4v5FP+1rxaqC7naMVTcRcr5ioIpMf9m59TlXQEGSCo0SAIiiKJheNfr/R?=
 =?us-ascii?Q?DO/aeEkfnFRB0+LCeW7QwbEyplbueQBTCTsyZGwcqX4ByZjx6Ciz+5gwm/MU?=
 =?us-ascii?Q?WgW+6pKdc0PCOZeOQbnIcJ45gfLKqvOqMrpwTQyKztRx0LC43MeJ3iQKUFc+?=
 =?us-ascii?Q?0rVghBPRrcSGfYw5fGZdPPplVsrqRS0dHUTz4dMy4ddMa8rL/vxphovTdxNM?=
 =?us-ascii?Q?PPtMSzPjSHfVRhTbtbiX2DabB6gBovTL71cXBtAsk7nWjEF7kQcnn4geySyI?=
 =?us-ascii?Q?wFfWU3D2f2/ZolCU1CBoHveaGpqF+mj7zEHmbqjmLYht0ifSGniFP2XYyXM7?=
 =?us-ascii?Q?/LA7//Tmhzn42cAKqKliTlROdgm1D7Y20vlvbt0YRmSmNy0qfHr2YwqizlAP?=
 =?us-ascii?Q?kmQkHbKjtWJ5X6axX/bvx+14yhm3xq1v2zWH4Sh0NRm9ny+/xjXWE+Eo+fsi?=
 =?us-ascii?Q?aGwMQLL3Z1lI0xgBbD2Z6XEiYxxP2inndhen9fV6UTm3yPzBy15AOqI82s2M?=
 =?us-ascii?Q?u0kOE+wJgnE6WXjljS8WtS4WVjw2SPF6WbCFBsd2EQpujx2UYM0d1WK1rsEX?=
 =?us-ascii?Q?uLNzDyOrBgZVs+zXxnsC2x64uI99Y5DKPuvISjAqo9b+RKeFT6UczWlazsN3?=
 =?us-ascii?Q?EWAfXrxMSDNRmdzku708CI3wNFKQi9z6yHmcl1q0spNeHY5WfVbVMgcc09mK?=
 =?us-ascii?Q?QpDEbB3MTREvt8zMkX+KR/b1ofdjUqgV/lyg7MLYaNVg1oMTq0CuwkFF4pzo?=
 =?us-ascii?Q?NsBlKSs7MdjEVJ/nlaiNAdBHJYpe41eXc481iYB5xD3EZLwvs1742eQAhlxh?=
 =?us-ascii?Q?jWCmygjuNiRjuqMfFjT4kYyFQ5rUCuk1xf61n37BmQPAF62ErodKAVUfJQWG?=
 =?us-ascii?Q?ZO5dtyN7DCYrvGwiqzHweMWyQAPDkD2QBJt2/1LCpSEHkE15rMJs8+55CIs5?=
 =?us-ascii?Q?wI3RFppRIBPCwqmkkRJS+12OOKlNtzOm6ObcmTgLH/8Yel2OPjAW4q21542l?=
 =?us-ascii?Q?LRe3GfoQcRh5QzP/n4hSYYKsTR12RFI=3D?=
X-Exchange-RoutingPolicyChecked: 
	mAfohoTYBlR2LMs7pGgiFKMycZ3svn7GKFaJK0pmDHKw926m+Vuu5CkT0fIA2M3+tR3sdszoIyEvS6K98dj9imetbiTQf+KhNArsou5NU3rxheh4QQXodhealmA/oJ+A39WU/7nCfSgId4p5KwVRgHNIh1PKETp0Pe0vR5iCBh6d2AP9VsGRB67YmsJ/eAHAT5FQ27VqHvi+inx2zIdxB74ifFIn+37aqRjnVuCUYETAYPJLhtw7RwgtrOS56sMkZ94fkpAAHPxzk/mETl074ZH29sUXSo4FqoZIodgudRjzLNrjrbLHbdOP4lVCe8a+l0sewfh/0o+qsylZzcchqg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee55a1ff-8b4c-40cd-6054-08df0ab17fec
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:22:38.4561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bax5GOIzmEcCQ7mxF96N4xXYBMruM8h+FI/GLyTh9jti5w3wPxnN7dOGSJzCcdmkddk/nPIPGUptbNrXZR2OKjO4Hz0uvG2+ZitHfqPUQys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB467332
X-Proofpoint-ORIG-GUID: ebuPTh2NkJhrYfwx-T9YA8M-jdiCuoVS
X-Authority-Analysis: v=2.4 cv=LvuiDHdc c=1 sm=1 tr=0 ts=6a9b0c70 cx=c_pps
 a=kzsVodbpLl5/Zj7uDz6sWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=r9lhY5OmAAAA:8 a=ag1SF4gXAAAA:8
 a=0gcC27t9AAAA:8 a=COk6AnOGAAAA:8 a=gXAOBB-0UcRYM2s3jiYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=lBmE0PM3J_p9GLi-zqlx:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=f5sM90hAhNS9OGT-JDKn:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE2OCBTYWx0ZWRfX48Y9g+KG9/yu
 hixYNwpd8rroRKZalnCP06mlMN9MgKLyGezrB5HOlJW/CbUzOdRM1UoGO4vyqPp//ZeNSN7IEy3
 4QjS276d5VhAfQzN9AOkmLXAor3ZWKMFtXLqIVa8CxSVD5CqEVkofQBPtOthdztAgfpoB9w13hS
 A7gvemKQPlryIS7QCQBS4YhTNaETEc/ZcPV5tmQcZUb8n8QWUB5I3ECz+NQITqGOII6+oxI9JHF
 U2ob7Syvup8qaS73Ue7GgS/G6m593PO/x8053c9aPh+lENYjpFBDwLHPljoZKLEd3NS4QPdL2gX
 GrrFoe345PyT8IOfUguQI/xdq/po2eNV3pLOXsq4wj3zOYZKEGGG3sxnKfF6lpYMYQOWmWBlWH3
 vd8nS5bEIYvojsX9vhpvz74GnICoG5teCpriq0soCeKjnA1OfYUY/Wnt9cw4bV8DaWZAOJF5aeu
 /kNJmmcilAbT8+iIXDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE2OCBTYWx0ZWRfXys9v4i3Pgn3E
 818FxQmDeOtjZ+FZxWSJALgjvF1YPnniXRfECWxYsGcHsXqCgthDbisbS/zG6ixwVRLhvJllfhh
 KjNBFS2UL2uKJEeIhss7slQbwUkBxEza1FM6oeBNNC8x4OAvHC6v
X-Proofpoint-GUID: ebuPTh2NkJhrYfwx-T9YA8M-jdiCuoVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 18:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245128

replaced 'robert yang' with my name for:
 cryptodev-linux
 cryptodev-tests
 cryptodev-module

replaced 'Yi Zhao' with my name for:
 libcap

replaced 'Chen Qi' with my name for:
 pciutils
 sysstat

Signed-off-by: Karthik <karthik.gopal@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2966cddc05..7d4429887e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -136,9 +136,9 @@ RECIPE_MAINTAINER:pn-cracklib = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-createrepo-c = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cronie = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cross-localedef-native = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-cryptodev-linux = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-cryptodev-module = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-cryptodev-linux = "Karthik <karthik.gopal@windriver.com>"
+RECIPE_MAINTAINER:pn-cryptodev-module = "Karthik <karthik.gopal@windriver.com>"
+RECIPE_MAINTAINER:pn-cryptodev-tests = "Karthik <karthik.gopal@windriver.com>"
 RECIPE_MAINTAINER:pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-curl = "Robert Joslyn <robert.joslyn@redrectangle.org>"
 RECIPE_MAINTAINER:pn-db = "Unassigned <unassigned@yoctoproject.org>"
@@ -322,7 +322,7 @@ RECIPE_MAINTAINER:pn-libassuan = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libatomic-ops = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libc-test = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libcap = "Karthik <karthik.gopal@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
@@ -592,7 +592,7 @@ RECIPE_MAINTAINER:pn-parted = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-patch = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-patchelf = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-pbzip2 = "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-pciutils = "Karthik <karthik.gopal@windriver.com>"
 RECIPE_MAINTAINER:pn-pcmanfm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-perl = "Unassigned <unassigned@yoctoproject.org>"
@@ -826,7 +826,7 @@ RECIPE_MAINTAINER:pn-swig = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sysfsutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-sysklogd = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-syslinux = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-sysstat = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-sysstat = "Karthik <karthik.gopal@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-boot = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-boot-native = "Viswanath Kraleti <quic_vkraleti@quicinc.com>"

