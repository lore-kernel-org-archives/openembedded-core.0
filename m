Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.74])
 by mx.groups.io with SMTP id smtpd.web09.8963.1618990743199689360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 00:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Gl/+DBEJ;
 spf=pass (domain: windriver.com, ip: 40.107.92.74, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo1lYDTIkpKEc7xUsLumR4IrU8UGsRX++PYWew/gtjTiIF3wSa/wQ8b0AaCSWBQ1Pko7oaomZim64erT4dgoeVn0tjsMXp1NjsL0LQOM/v62yqzCE7QvMZCzZGrVcTn1uNI0/JQo5ttmavKjFak4qT0PB3S9wLPzMkm1XMcJComDaxvshLMkV5EjrjNRDlQbWa3AA3hZo5UcMMrzUXgC3dDcXGXDKzIns19vc75VtZCunu/XQ2Hsn5Job+E4pffilkB8cj3E/72j88x90XN4Gsr0Sxou7yVd/1KjaWCTi1y+7BDHnktYo7c9+V7CzSPh9THEsr1Zqp63F1GWzXTF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITbHBS9JHXi3gnHwtmRQxBlZilnI9c02iwJ9WkF3Ouo=;
 b=eh9x+OIKq0jnUl5GifzpTZi8Ch9kvbD2M6jl/uln0voj0fHxQo4MC5FsusPPakZ5+944WsF+8zK0+M71UfXRyUnSdMdMbA0a0JTordcJjGFopSWz8YkshKSJ1Y3BIb8nuy/BY72ODUEeyj0TbmVwOs9zvAWUM7Yj9rgvat3BRoPKBsCtdT/GuSt/StoCE6IUCZwseG+2TMLtPXij8zLsqEJHHL6MMJUM23NnMZWbadSZZRJkpyltn5A3ZO1qOmye2fauaGGDNZuqGy/rBLFzVYaPgigx18RugbqlS9ZKFBe+70glb4+tBP6GQ8qt6KBzFqTsuFTl75yamzY6H/mR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITbHBS9JHXi3gnHwtmRQxBlZilnI9c02iwJ9WkF3Ouo=;
 b=Gl/+DBEJNEBF4vToIw+fdoWM96ebe+MXmCVEmY8m37bwli/CCpiq4XuLSii3OOu4qoqE3QgW+d7bZzvcKa7hbc1PjiQC7e5p8Q0Q/Vbh0Eyisty7i7mcszVJ6LnE119Paynys75LVLgRLE9imqpPZMoslVBH4asWTjYn/QLzKAk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3304.namprd11.prod.outlook.com (2603:10b6:a03:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Wed, 21 Apr
 2021 07:39:01 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011%6]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 07:39:01 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][hardknott] parselogs: ignore floppy error on qemu-system-x86 at boot stage
Date: Wed, 21 Apr 2021 15:38:48 +0800
Message-ID: <20210421073848.3161050-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0067.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::31) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK0PR01CA0067.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Wed, 21 Apr 2021 07:39:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 484d9ce0-0978-4544-d4de-08d9049887b9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3304:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33044DE2A4FDC6D17BD83932E4479@BYAPR11MB3304.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DJ74WCCls6lbzjIjTMdrBTpaSpKcpa5tGdo+Mjskf4m399OQ3d/j0h/E7J46+eSUPwhbkVG4hyexMydMZxkVaG13IuzyhfcTgfIo6i0i97lxENo9sNMO/CiONZZOUlyaAG8I5jSreyn6n2UAfwl4R6vxo+qauDh9xHNsyVP0EKtOJTagUWzyZoLz7u9R3X4x2B2Erpjac3VVOoigDtJT8PruTI3qe3H/fofltQbAMdHgHZ8jj7XCtCAfVf1u+A2QiJk99geWN0mjw0We+KtDw4TVhk2U+jXVTpb62DF3CEP3mr935cNHdjs2aayp8QDOdafelf7ajb4ckfSNoraWc32lyp8N1dAbPL0kpNCESB0gVNrKSVnrQ87rboiLHr1rGW9CD6ojVbskgrKhH3diBM9sTF/d/bA7LhtFb0RRe9ROvSH+SlmdZHSJ4sDNHxnT09YuuQAEUqZXfaYG/9lcaW54ce3Kx7TZ25eX1afSSCtTJ+qsRhKGeVsZQmc4NFpzKVtnUmKP+KPRs3JejnN23Blh1EXr2aNSXSKjudFOhZ+1Og/9O/uG9gu9h0z6ooo1m3IA6BtAvjA91FV3s7RHmsPSHnAQGwEUv3Qopwhklo03sDJf/FWidPq2VKUGNyq1k6taSzHyxIpE8cNQWYH3hIt7rmds2f5mFjWa3MVNqpwa4Ld6NULaEKnSMFwunnta8J3ral2AYAVJu//AvpfOU22PkY7xQX33x0sCR0ETJ0M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(956004)(6666004)(83380400001)(8676002)(6486002)(2616005)(36756003)(66556008)(52116002)(6916009)(6506007)(966005)(478600001)(38100700002)(316002)(1076003)(66476007)(66946007)(2906002)(8936002)(186003)(38350700002)(6512007)(5660300002)(9686003)(86362001)(26005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?d5uoRGlesYpBFfmzbi4uCOGTH6P2iQEP3c3d2mNT3Hu8k7+dM6xxS/3aai6U?=
 =?us-ascii?Q?Pf4AGMjrsveuRfFLYihIe4tRSWXtzWd/U9au4o5bIA+ShcO//0a+jqCwCHna?=
 =?us-ascii?Q?Sx2gI0+SrU/wJzSwaw5v2fChk7HEW8ZJNLxPzeTTCJvD5r/gThcnFTTy+aBi?=
 =?us-ascii?Q?CI2XX4ci701O4/3EyyKL4+dxE1JOPVvUQAoOCN4vs3Q+AhXHWkYgpuwGYyeR?=
 =?us-ascii?Q?/KZhA7wQ8lgM+bwYzWSb5AAK6aTZFo2KD/wVOk4wYn+1dm543cdvONrMLl48?=
 =?us-ascii?Q?d9ew4uvL+E4ItoY+lWesqThtFYCa95dHeAPozQ1KVPViAVDcWw6YLsvdMnoT?=
 =?us-ascii?Q?EROWD5BiVe2X7E43Il9eQj4HtTzzuv8H42CbhljXHIofNObvNnTdOWjJRrzN?=
 =?us-ascii?Q?nGYGWEOFbFteyDd8K75ewFJ/vyX0jDuQ1BIMN+fQFIrLii+PUyqEJPW7Idwy?=
 =?us-ascii?Q?jt7CXo36Nj0dd7Pbj65XtWXZNGr4kr2tI9s/ZklKyBk0dk7CSHejQWoQskfM?=
 =?us-ascii?Q?0cuQZ1h76HTA4y1KRxYDDClQJQ62iM8CBjZRrv4OllD0kiFZQm16btiDpm2p?=
 =?us-ascii?Q?2DvcIPZ6WbJ63tLV1aQNq8XbhlJJzqkwnnCnkxvzFtR+BuWbdZjHAYlPsioo?=
 =?us-ascii?Q?S07QqeSXfTNZwP6MBc0MhaeicPiytPbsEV6LFR9D9qDaaBmp20dyx8mdzcWR?=
 =?us-ascii?Q?VULGvRH0EVORorIRsz1LMutSh+vq7j53AcAkmBaARu6WjjWXLQyoWaf9Kbrk?=
 =?us-ascii?Q?2dIZ9xnk89/Z2T+QhlRe8BqyxpCnqm3jAATIvWb+GdMpWd/FajoqWPvqB6v5?=
 =?us-ascii?Q?gXcbabEzhU/KJ6l8keEUpprQTFPW3/T2WAqYRMc7bXqgXc8Y+PAGiX+gl0MW?=
 =?us-ascii?Q?6ijqzI3/lS7NSjOUxzuZV8uVUTbSgQbJN/iWwMlECKcK5x6wTDTf96UlZhNq?=
 =?us-ascii?Q?QiKUxmAEvxxYBwHOEwcngf0Nc0oJyF4lS2chVYSHeB2vzXDekKs0Bbvpea9m?=
 =?us-ascii?Q?G9Y2w8Pt1Ve1Ufr0G1U9tHUuC2F5XqGfvAUS2ysnFiED6J+NnSKCa8WDzrr0?=
 =?us-ascii?Q?KC7IYhTe2Vp+kmH1LB0PxMToF2n9eo/AcrJObCl6I9Mw/Jdi+bqhjy0l10gM?=
 =?us-ascii?Q?lZC9ZrrMvcCilPz/IaPtUq0lNxYiyFrBZRQ8t7Y5CnZuReztCavLblpZjnfx?=
 =?us-ascii?Q?ryxcL53JwVnZ7NeJ0IpSUPu2V65Y/gWasGk+YIkMEGaH69NQsubRIu2HnrzJ?=
 =?us-ascii?Q?wwOZw0BNrWshDSDXgP+QzBBq/3493Zr/y02ViaJGTPI+aA3TBdM8rIJVWeqj?=
 =?us-ascii?Q?zBCdjtgiYv1yC/PQWAhufdeT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484d9ce0-0978-4544-d4de-08d9049887b9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 07:39:01.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjokYPmZIjHD5YQq3G82T4ISJoS0RhLTudsn0FmT4JMIDz4lk0lqfqEGUeMTHPOZU9yaumU5C8RuV3DNf0TLnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3304
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

We can disable floppy drive by BIOS on a hardware, but an empty floppy
drive is connected by default on qemu-system-x86. Linux usually detect
the device and modprode the matched floppy.ko at the boot stage. Due to
we don't specify a floppy deivce in qemu boot arguments, then the errors
about floppy reading comes out.

It is harmless and normal, so we could ignore this error message on
qemux86.

Seen if kernel-modules is included in the image which pulls in the
relavent kernel module.

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01402.html

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3359f23ee9351c70997d5e0a17d17d1e47d59623)
Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runti=
me/cases/parselogs.py
index 4714741aff..1bb0425521 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -88,6 +88,8 @@ qemux86_common =3D [
     'tsc: HPET/PMTIMER calibration failed',
     "modeset(0): Failed to initialize the DRI2 extension",
     "glamor initialization failed",
+    "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
+    "floppy: error",
 ] + common_errors
=20
 ignore_errors =3D {
--=20
2.27.0

