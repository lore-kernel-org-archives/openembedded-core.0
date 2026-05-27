Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCD4CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 14:15:18 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21514.1779891314888759156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 07:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SRRoDnq2;
 spf=pass (domain: cherry.de, ip: 52.101.83.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htIRifPo+ewNokhP9aIxXOlivIUQuBZEf2kh8a43v2XqhQibFCF1OvKK5ivJBK5eXmdVSTuKMPozIFKB/d46qJHcdCc3hmg5moSrhKOGa6HWJjgLSe7dmqc74zYonnM/BBqTvLoybjj4ADmNauSF2kCylVGF34ZwhLASKuS/VnRTBNUB7xyaPmCr3cp/nC6uOZx9mZJJ9FBLlbW3fCJBXRFFT9kKZ36dA4yTu1W4gPyi9XUk7LfhHW5tjeIs5SOs1lVPP6X1vaJIUE5oqXezRgrUm3Uo/JKPNESwrOEBruSFmN4/bpOW/CFipE5mPEBBjyEe6reRR4+8Ih4c9HNSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEFXqRf+OYB2EXPlkGKykaH2yvufzDEksq4saA7MX7g=;
 b=Hs5AMErdlnJoYBHzYC4BGSuSp3rOnS8lJZu1bjB03spGjoyHucoUZ7GuLgn5HlTCNn4s7uxWOjdSlv4KskIwhcAh83UOK03zfaIni61N3v/Wudr6EC4+9RJUeGLfRDOr5qd7Gm97KjCHiJPJZoHVaC06GZqH6T98MvyuwgT6WnlvaRsu1G4x8/pwg5wUNMZGcLkDa1dzIdq6rOQjkQGDV7/QIpthUZFzKTjAjPK72UC21eZFp82A0f64/+cnQRPKQPo8nsEd2W0FurDeGG4S3xJreXrNL7eoTyIIRE77I/1AiZR1mv5C1X+lzGcGLCYD+9NOLaLmWI5E4l5xljRICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEFXqRf+OYB2EXPlkGKykaH2yvufzDEksq4saA7MX7g=;
 b=SRRoDnq2S82J3UmUmfJbiFmMlizsptjzKDdfytDl69kN/VOlQdCV3q0ezQ42dZrWOMrRA7kYTz47kX5zHTKWt326DgSnYlcWAoSrSOrRlDssESsuXfFQa9C1XfzgblaqVZffcAhKU5PS8EDqNxuWsP3bYe0OVOEqQwUhFZgAtZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU4PR04MB12327.eurprd04.prod.outlook.com (2603:10a6:10:631::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:15:10 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 14:15:10 +0000
Message-ID: <f85c631d-e53b-4a5f-b333-aa6f9f3ec5c8@cherry.de>
Date: Wed, 27 May 2026 16:15:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] "packagegroup missing SUMMARY" warning when there *is*
 a SUMMARY setting
To: rpjday@crashcourse.ca,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <6b1570ed-8060-963b-1ac9-dd4ffc78f7f9@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <6b1570ed-8060-963b-1ac9-dd4ffc78f7f9@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU4PR04MB12327:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2a0392-4069-4e9b-929f-08debbfa5c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|4133799003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	QYley7whWLzYn4PI4xALGm4tw4TjLXrscw68aGui3QfmB7NR2SIR3BXPzku3H8Cq+WXuB8x4eXDbQ1KFQ0fCbSzJBgemdlIpVGoo3JvSHE95TGLV3pWRNgYMIjsPg7rKUKVg/95YTDxbK00rFeP3D+wYdqmJI/FNkgPUyZLwmaoWaeN+FCx00yBP9RrDDXuXjgts/h7CaVnQjq65Y/zNwJKnyPJgU8JA7uG1XWPsZeb1UIrumvzOgST8NK8NDndwa4FLKRpQ/eWxzrpcHcJaerkFfF+5O1QrEyvq2CkC5ZhYTMJAY9wU56ZzC4rYYXNBRi9VqjYgDpBcNDvtLLBPQESXiw1Tbim5Et3a0Ilhwr9Lp1fB1HBp9GFr5zYj4KICjVVf5qIxzvQ5ciqzhqvj1W2O1WHXtZsQ2727HN1H3wG5Jd89Q7hYK0Va+JGZLw+2oflRHRVKLqXZUQ/XILBfYLeOw8oVuvqHtH7nhZFC0n4BH7mMqAmcdEh8LZ1+aL5/+qN6tk5HNXUEXm/4oXwCThZsIz3i4Hq0cuNlFuhYB+4FFoHzNCdb6qNkSMR60z7JyO6vbZqGIrnVzD0yylHlj+v5wnTUZTkwKZyRwmC2bGKdDu92q3awaFVyt3yIQyeBmbFnIHj2fp1GkaOzqp4xdg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(4133799003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RS94bFQrMExCNlJCMXBYVWkxSUF0c3Foam1LR2ZucUdIUmdWQmNNNWI2TVp3?=
 =?utf-8?B?SWlBNmJWd2VuNWRibFZyODJQdjg5U3RQbkVIdmY1TFZGZ2taQlA5MWFtOUh0?=
 =?utf-8?B?N1hwT3hQNTlWVXk0WUhhT1VIR3hFb20rbkJBTHk2YWJURGlLdTRXUVRyZkh6?=
 =?utf-8?B?dGpJMDdQWHdnR3NqRHdXN2NSMkRmL0h2VlFXVEFUMDF5RTE0Y1g4WjNSeCs0?=
 =?utf-8?B?aWZ1a3E2azg5ZVNtYjZ0SnEzZkVIY2pGUmtDUEdHK0RuYTZpT2tyWUxVdjdE?=
 =?utf-8?B?aGhVTXVjZUxLZ2NsZGovVVhjeVBpV3lKM0ZvbStkY0FHTG1IUzYzZlBENmVh?=
 =?utf-8?B?SlpPU2VoTjB1RlIrNm9BVDlySFpYbU1raS81VVJRSVJ2ZG9jVmRqaWxBQ1hO?=
 =?utf-8?B?aVR5ZTdPR2dkQXVBK1lVZlpGQ0xUbnIzdUFqVUNwTDhhU2pRVkNLY1NrMEl4?=
 =?utf-8?B?djlxcWY5TDljY1ZsNm9ReEUvYnlhTUVhdi9URmJQZXZPMFYyT2VXamdubm1X?=
 =?utf-8?B?WlRadkFGc3Qxb3VsT1haQzBhVDgyQ0pySTdEZFl5LzNXQ1pWdGhvbUJZS1ln?=
 =?utf-8?B?T3l3OHhRZFVrU01iRVVTNm0wazFPMkIrbDBSb1YxVEEwUkRQd2dsRWVTUzEx?=
 =?utf-8?B?ZHl4bXl3Um8xQWNYdUs1amRZU1loUzl0NXNCRWR6NXgyZ0VPeEU3YkRtWlFt?=
 =?utf-8?B?bUQ4c1NHY0NGclFLUlJMTlFRMXo4VWsxY1Z2dWlWZ2x3NnZPYlg3REo3WEpk?=
 =?utf-8?B?bm5sK0J4Mm05RUxDdUFHOElMLzlpUFYvUUducVJEZGNtbW5SRjIvbkFpNDFS?=
 =?utf-8?B?N0Zsb3d4d1RXRHA4ckFnYWZTYStFN1VmcHdCVml3WXVvZzFLZGdJdzlKSUZQ?=
 =?utf-8?B?YllMOUJIWVBpbFcwTDQ4MjZPcUdZLzM2Ym05RzcxaVFkbFNjTE1MY2tqUlda?=
 =?utf-8?B?Y3pZeEMrNHd6cGNCQXJtSC9ZcjFKQkJ2RzNiQVAxenY3WjdVaWkzS3lHVitU?=
 =?utf-8?B?V2dRWm0rUHJ6SWJocGN6bWZ1TDkvM204enFha1FwbkxKeGdOa2JSK215Y1Jw?=
 =?utf-8?B?ZkJpRkgvMzVrekczY0NwZVJkVzhVRURBZDduZXRWMTlNa2M2b1ZmSXVNRFdT?=
 =?utf-8?B?VytaLzFxSnFuQi9EYlBlQkk5cHU5NFRyUEpMaUFBSFlEbFU1QXRtbFVWZUNp?=
 =?utf-8?B?bVRKZ2c2QTRUbUYxV2pUQzZudlA4UHZVVllhRE5BWkEwNSs3ZVVMYUUyd1Nv?=
 =?utf-8?B?OEF2eFVMQXhpNDZCdkc1bHB4dEF1ZUQxQkhTZWJDeW0rYWRlSUZoUk1EU1hR?=
 =?utf-8?B?RnpCOHA5OWZOYVkvTXlseTVxaWxKS3hFWmljTlVsUDEzTDdHOUtUMmJ0QUVv?=
 =?utf-8?B?MU1aSkNqSGRUdFhqdlFQYy8xa285Kzc1dld5TGdXcWV5Rk1PUXRZYk1jUDNi?=
 =?utf-8?B?bjRtanRHK2ZKZXhsVVJDN0lIRjIwNklIVlBrdFJvNmorSE5YeXFhRHBRdFVY?=
 =?utf-8?B?VE1lWjg5TVViNWt6Ni83dFJGNWl5UGN6ekR0UUEvdFFSS0hVZGpKL1NDYzl5?=
 =?utf-8?B?Y09ybHdySUcrcnZHWUhqU2hpMlhPMWxNK0FUb2l1KzJ2NnlqRDhYT2FWa3BW?=
 =?utf-8?B?WE11TlJoTWpjQXZSci9VVkFGSHRPUEVlNFBtbTlXUXJqT3pTTDJrQW81L2E4?=
 =?utf-8?B?MjhhbXZvd2pnRWxjWldlWDk4Snk2QlRSQ1M4SDJBK0tWbVZFYm1EY0k3VFFq?=
 =?utf-8?B?NHU0Skh2TkxoakdQZzRpbWhFaFlnQlA1My9qaFI4MStoMzdjajVjSmJ5alZU?=
 =?utf-8?B?L1EwRmFaZXdJcC91dEllYnFtTjFHWHQzL2lTM1pUVjNERUNmVFNBMWwva2ts?=
 =?utf-8?B?YTF0V2UzOTB6ZTNYUUFjc2krNlRLYmpLaWVXOTRsUitvOUJqem95Tjk2cE5J?=
 =?utf-8?B?UCt1MXlqOS9La0lEVmRxbXowd2Y1b2VjY2pSWjNTOXFCS0dVa1JCMWpPWDlH?=
 =?utf-8?B?aXR5bHpCa2xHNHhxVGhZMXhldGRrdko1dEpqdllkM2xSZjl0Qyt4ejBBeFhL?=
 =?utf-8?B?YlppbkcxZk1WdkhZc09ZQktSVEswRnRzNVlFV0FXaktCZkZWcHd2cnUvcmov?=
 =?utf-8?B?dlBOaTVEOWlFZVAyOG55TlZCcmttWmhFQU1jamNQdGpZaGdtQjh0YjZ4Zkkx?=
 =?utf-8?B?T1Y2dVRveDhJMW1PMWxPQllhQVdQV1o4ZkZqOFlmeHd4NWlLT1EwQXV1eWM0?=
 =?utf-8?B?RlRFUjdGK1E0Vm9LU1ZqV0EzTXY4TTV3SEpFaVVQN1NTdThtdW1WeFpHNG1u?=
 =?utf-8?B?VTFuZkxXSE9CVmJ0SVNPOUczVFpNL1RldkN2RUM3ZFB4WlY3bC9SZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2a0392-4069-4e9b-929f-08debbfa5c60
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:15:10.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Imd5KB4iICNQph+f08FSC48bYr2GW5JvtYteDPo39PykJc8rL1BJOmVpI9nMEVwL7cc7fMYM/0WEk/zKcYY7Y62/c4E2ENil5zY8pkohacw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12327
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237670

Hi Robert,

On 5/27/26 3:58 PM, Robert P. J. Day via lists.openembedded.org wrote:
> 
>    (while this is from meta-security layer, it's a more general
> question about how a packagegroup assigns a value for SUMMARY).
> 
>    building an image that includes packagegroup-security-tpm2.bb:
> 
> https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core/packagegroup/packagegroup-security-tpm2.bb?h=wrynose
> 
> and getting the warning:
> 
> "WARNING: packagegroup-security-tpm2-1.0-r0 do_recipe_qa: QA Issue:
> Recipe packagegroup-security-tpm2 in
> /home/rpjday/Layers/repo/wrynose-next/layers/meta-security/meta-tpm/recipes-core/packagegroup/packagegroup-security-tpm2.bb
> does not contain a SUMMARY. Please add an entry. [missing-metadata]"
> 
>    here's the rather odd content from that packagegroup recipe file:
> 
>      PACKAGE_ARCH = "${TUNE_PKGARCH}"
> 
>      inherit packagegroup
> 
>      PACKAGES = "${PN}"
> 
>      SUMMARY:packagegroup-security-tpm2 = "Security TPM 2.0 support"
>      RDEPENDS:packagegroup-security-tpm2 = " \
>          tpm2-tools \
>          ... snip ...
> 
> this seems overly complicated since the packagegroup doesn't define
> any sub-packagegroups, so the "PACKAGES =" line seems superfluous, as

Yes, because the default value of PACKAGES, here 
https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n335 
is overwritten in the packagegroup class with the above, see 
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/packagegroup.bbclass#n13.

I'm sure meta-security would appreciate a patch for that.

> does the override usage for SUMMARY.
> 

There are a few SUMMARY: overrides in OE-Core for packagegroups but they 
all have a recipe SUMMARY as well. I'm not sure where SUMMARY is used 
and whether an override for it per package makes sense, but in any case, 
I guess here the override part could be removed?

>    but why should this generate the warning above? is there something

Because do_recipe_qa() which does the check, does it without a package 
override, so it needs to be defined at the recipe-level (that is, 
without an override).

> odd about the way this packagegroup is being defined?
> 
Yes, there's a package SUMMARY but not a recipe SUMMARY.

Cheers,
Quentin

