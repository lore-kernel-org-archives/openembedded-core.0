Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025A4C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:18:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.46])
 by mx.groups.io with SMTP id smtpd.web10.35343.1751275087460788076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=HAZVHapk;
 spf=pass (domain: prevas.dk, ip: 52.101.65.46, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmiG9gwgBysFwHHNkeS22w0JFP9QJG3axZvhCwcSZddFOg2/eFeRqHDeZQ+XGbb72wvTOD88/1dhxqbeSKsnH0HXdsY14lIRA1TZQrInGptA+dg8stB3ClFyfG2xaOpAW56wBNqlXoa2pA3/MhW5bfXhNQ6I2EV1BQP28oLdoapVbm/zAzv+prfw4SvR9XSgCkzZnko0lQPVfbT706OVm+T0whF+oSVDPCahf94FLyEZWsxKex1CbDTiI2iCsNQYYP4LfpzN+6koKlaOb8JBb7Cla2YMXjn21VmGybJGTUNon9vuNDJP9E6K0pgWOf1EXxxu1OAodW/PV8P8zcyiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpppcYisxOpxWWdIUysjOTyq2fY+fpPnSz1upcL9cJY=;
 b=cICQQJQDaQfpksM9DitoshFtyQnRN2AWGl+wgIMEc9Zr+aH6RKozeVvv0pY6u2ZoBuuTKkKjrNbOhdoxiKPikUoJgTg7VUEBjq6DYp3CWf2GEPjYNjIcbSAhd5LxDxBupoiQs4R/35DWvllgTByjLTuxUACGNW98e9Tq6r13Z9K9yKEfdszACjJkPClmk8XkPDyW4G4tf9a1BkPfyTgG07VD7f92ekdozMxgbT3jny3PpvQiqQ6B+2U/eBai8e3vKLYOszxFiPZn+mdTqABcjyumL/DFJZQXOHlHxE679g3TBKhemSuB8qpa/lswblFTBsZ8n5GJGQuHN5aq4Zpk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpppcYisxOpxWWdIUysjOTyq2fY+fpPnSz1upcL9cJY=;
 b=HAZVHapkwnfySqh/Dry0pWqh86vViuoOaxBv/zqFw7tsUtZhp7ehxzaNIHbQNxpKq8GtUKD0XKQrB/Q+pc1ESfD2njtnEb8GvqsHA6OtNI10oE/1olL3hIQJzbuX881tk4MCWIX1kAGaQgQHeYZ2Bt+N04fGL5KnMBRlB1yizJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by DB8PR10MB3752.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.20; Mon, 30 Jun
 2025 09:18:03 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%5]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 09:18:03 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] base: Use DEFAULT_SHARED_UMASK for do_fetch
In-Reply-To: <20250627212423.3315152-2-richard.purdie@linuxfoundation.org>
	(Richard Purdie via lists openembedded org's message of "Fri, 27 Jun
	2025 22:24:23 +0100")
References: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
	<20250627212423.3315152-2-richard.purdie@linuxfoundation.org>
Date: Mon, 30 Jun 2025 11:18:02 +0200
Message-ID: <878ql9y4dx.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0083.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::24) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|DB8PR10MB3752:EE_
X-MS-Office365-Filtering-Correlation-Id: fe63bd19-193e-4d7e-82ae-08ddb7b70407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gm3ov8hsG3YLPiFsIUduAtBn+xzAeQsEdWY7y9LLgw6vyRq4CMEli9ib1wZa?=
 =?us-ascii?Q?Wh0ILf4PPTYt0dwgL9FnmnEGVnqYHPYLJu4XPJltiGU3NTLU4vSK8JR2fX49?=
 =?us-ascii?Q?BgIof/hG6ngRXXJXIpPP6STeqtMMOnS9nuj9TQX7f1hJemMiW9F/dD/lSlMe?=
 =?us-ascii?Q?skw1Qg96L5+y3qjY2bXiLC39Q1ZzjSmgmHGQtCpXHSu9gSl/HQ9yhQRqBT4w?=
 =?us-ascii?Q?xIGWsgsCIWhztmNOpKvZDj/HrK817B3hE4SF6w/YR7R1CjEteN358obpMaxw?=
 =?us-ascii?Q?DgCs+CNQCfxUGGVAT5C7pt8viUM1xfD4Xtp5aUtAYl1hmrsdrkNxJznQuhs3?=
 =?us-ascii?Q?/8Ocg9JNbqfB5eV/DLeg3LzUaPuRqi7dc4+VM70bHuLHnY5I6mVOnfMONd5I?=
 =?us-ascii?Q?7Ah8vE7cw0VX+VL6rqA+sDdyE7H7hlwyDgqpD7P1yXlkCLbO2YLgRuqcm0UR?=
 =?us-ascii?Q?/ZRO/MhV4qUFKYOuvpcb8ANv1af9bCRQQOUCTZJYB85aw63/TIddVFs+U3/r?=
 =?us-ascii?Q?zaIrOS6eHXhQ2MIUShm2k/GEN8VaINbzXHzJILa1tmJh3j3XXbHTSGRncerv?=
 =?us-ascii?Q?mvTh+NHD4TPgr7M5tEcOwax1vKsQVEvJsAsAoz7BLk872xSggobZ15gIxViA?=
 =?us-ascii?Q?TyDZg2BtJMbmyM2wvI5UXD4gZTQTzfYCLwX6w2MnHdDvaixs5ZhfMO/m0u2a?=
 =?us-ascii?Q?NgdZfLgRXbb+Nl3V4EkRiGuGpGW0fMfuRC8FWwEyYKYCMMBiGSvhDJdsk69F?=
 =?us-ascii?Q?cFXE+z1O5fZy9CcnSxRVNIKLVPshtcfAAAdrTYlsXY8z8vRyGPjUTBJ2fFTI?=
 =?us-ascii?Q?9+N0bVZrH0nwYJ8upFw2iT21Wnf+XQ8puJjynZ/erUxNz4hR4BegHY8Xf7og?=
 =?us-ascii?Q?fTQo3BSIUSFRyQYAAnvM2Z6d6O7pCbkNwhBRQjsxMbfy62bgGMvyjdkOMdVF?=
 =?us-ascii?Q?9OLkg4nKjzDbjqyAxEzVxqm08Ej43ZDQQBzMIcMUkokiR+KncdVsGuPajV5i?=
 =?us-ascii?Q?//S4RIVSr+jW3J1nuFzg169K2xlofLtizm5aMK2gF7thEizQqKwWPPKRIkd6?=
 =?us-ascii?Q?/1gkRFA21/8cswB2ui55zKaF3yaSCNCw8ZRXW8BCJztpAHByAKWOK2hTkMUJ?=
 =?us-ascii?Q?q4qKz2QPmG1hyczBWaP5Iz4A8CW07MdEIXk1igC1ZOfwW0iDd8VSkyhJ6Xgi?=
 =?us-ascii?Q?A3QQL1u+cKHBEdhSIYjQHE+hxgtSXNzL+PSoS9uhOhfQLTEJnfXF2ohtj/Yg?=
 =?us-ascii?Q?YjNqB88LMKdIB3pwBr/8BEyJBo2+gvH7bGW/DCG9aM/bpmZHSTxyZo8x281n?=
 =?us-ascii?Q?99WkbuIIvWgge+TLPjvl7AX+m7jOsjRrQ8zZLUav2AlvLF9XniF3f9aW0PQE?=
 =?us-ascii?Q?ri5l0r0yoUz0UVxfdx5CNvTUoDFeBfrbRj/gAcuqdMyXLy9T49nyUzjBZbQK?=
 =?us-ascii?Q?WfxHzVkZhLM2BGAxIplYG3hiqUV+BCgtAG3XcJ9uyvyW3PscmzjADw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jt1OaC/dDxRa25Bemo2ujxAqXvX4NQsz5p3nG1g4bTAdxQAusYZKfezAmT6S?=
 =?us-ascii?Q?bUzcZGjRfTzwbsewa7mTfzx4FPPCmon/pYuoQx5x0xexEegSXYczTbvvdmIW?=
 =?us-ascii?Q?5g5Y0JVvRj3p4zMsuum8BhbsxM6iP1rBXgrVZ644gPdQjKvqSWnMmji9w00N?=
 =?us-ascii?Q?3h02MLPUIKR6UXIBC/CK1CYPdeFYsJOqVILIgzcXac67Kk+7wSty4yg/gcIy?=
 =?us-ascii?Q?zOPCCAIF/wymo0tPd+SSgXfFhCpvXoY/BifGWWewg1bb8Xj8aw/h54n4QYQj?=
 =?us-ascii?Q?ZyMb0K6rBUYnXD4qRGOun+dmr0CYYzUS/M65yTWZJskHoo9atqYxHFNWpWgf?=
 =?us-ascii?Q?T7AYzxl/00yMxUpWIO7G1VCC7G8Kkv1gODR5c1dTAT4bdmvClkei66OlsSdY?=
 =?us-ascii?Q?1h1r0QgKl5S7Uhmn3Xg4GoTRwlItpwO6ZkByhiFAkJPTLDFOLHusTOi7C4ty?=
 =?us-ascii?Q?cZYbBSMjM5O63nbTnTePOCbSxAfccrjpzKQ5Qgs2kKznRYQA3vu0i6b/kPgE?=
 =?us-ascii?Q?sWOLN8TVUYUcALPYjeclVts2Sxt5Lgjl00Rm3g69vyoVFaKrv0vsn362z5nF?=
 =?us-ascii?Q?+L7923Ng1MoCvY2Mf+3JHNxt76nq7CvsGZLTQDqodO3nOP12KLiqGFRsnHxt?=
 =?us-ascii?Q?rNbUebhpepJ8+emT1V5iVJd7Msnc8LZ9RHFYLWNsHqDH/7hvC769t1tyB4N/?=
 =?us-ascii?Q?BB/vaGJgcTjLs2bWGCArAnhgAsXVs1gNXmAWphnZdypUIe7VEyjFkYVTHcvB?=
 =?us-ascii?Q?qgfIPtUMS8r2xNSAXILW5/jodJUy7luIrrUA15MAWlGasrLB+XBnFSybgu/a?=
 =?us-ascii?Q?sCB85gaTTSmHWb0Vjzx3wvjxhhguHQT9Yv2IMnj3zC+pCB087yI2csTiaQHp?=
 =?us-ascii?Q?q/zyddN1p8/KH7HA8qoDjVZ0u/5mkGol2xZYgI8V3pCDOIHcMy/5xMLyAc7H?=
 =?us-ascii?Q?2+k4Qf4qhgsdh0d4t/MT8s8/v0BGnlfr/IhzBtnKWPHOQMnNaf5hGUM0u0o0?=
 =?us-ascii?Q?fIET4ukv5W4y8FYqc9jDHpFldvE202FTf1VSyKsIBbU/9JV7c4NBPRu/UrwD?=
 =?us-ascii?Q?i+lMLUuIEKh+OjCPN1qYpMO6nDpylQKk0QbzTuIscdGRLJaU5+KXjOo9EH8S?=
 =?us-ascii?Q?cOAF05O8V0fIqSQoaAZsCkJokgR+lvouqhjWIoObyyhrVY0WzIVRthTIC51P?=
 =?us-ascii?Q?cVkCzyImlnreXFIBHCr2kzyleqOt7lUikeYdCrJtVoCU7m+0S784fyRjtTDd?=
 =?us-ascii?Q?yejC/e8CVKbzLsRUjRrb8IOctTBGwF3aNVZIYGfG1PBX0u8iwWFZTOEpBiUz?=
 =?us-ascii?Q?IWsCHyYmDyU2lc8zCFWzdoR63Ztve0AfHx33jea/fG9V16YytfDTgVIAKlyC?=
 =?us-ascii?Q?cjqveH1gvkKmexfbMoS8zcOUMKKgJVkvpX3B7NDjJuTSIz5s3uxjA5ONbNXD?=
 =?us-ascii?Q?isJxJnI1qqOutYL1sRfhKqQcZIdIRWAhxJ6szGm7lupBcNglZMUE7KSKbHGx?=
 =?us-ascii?Q?7Q1zwgYU0IJka/Yqh8zojeN9bE80eAmCM+ryuChHSQt+54ZO6PemKGW5Vj5n?=
 =?us-ascii?Q?l/3rnQenv/4hGMq18b1X+1ZqRXFibCDnMBIPjZp67OtDv8jsJDkqdEBOVppM?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: fe63bd19-193e-4d7e-82ae-08ddb7b70407
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 09:18:03.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTeubtNmBFFydf3XWZQNufT93TnHE9LfiOPNvUyZqi323QKFUTXTLkpLX1/Bcxvxv+kaMK7OXuVpXMM1gRL+QaklAziX52BJAb/SyIWh6Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3752
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219498

On Fri, Jun 27 2025, "Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> The intent has always been to share DL_DIR, so set the umask accordingly
> to the new DEFAULT_SHARED_UMASK variable and match expectations.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> index b86f50e2839..77bdbd03dcb 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -154,6 +154,7 @@ do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
>  do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
>  do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
>  do_fetch[network] = "1"
> +do_fetch[umask] = "${DEFAULT_SHARED_UMASK}"

So this changes metadata hash of everything. Perhaps that's the right
thing to do, but it does mean that changing that shared umask variable
comes with a rather high cost.

I was looking at doing the var lookup inside the download method
instead to hide this dependency.

But, I suppose, both the old and new umask variable are really more
"named constants" than things that are meant to be tweaked at all, as
they (especially BB_DEFAULT_UMASK) have wide-ranging effects that are
not really easy to predict.

Rasmus

