Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66937C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 10:15:44 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.79])
 by mx.groups.io with SMTP id smtpd.web11.52933.1718619337076805956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 03:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=S8W73Ek8;
 spf=pass (domain: prevas.dk, ip: 40.107.13.79, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EC1aV4PPXj1LJ2n7nYwgZVMGyo+Nc9+NmLz/TGend6wOmSvsaFVCXniNgdIamNuNGmKqUFVZCOpXz+/fGV04bw+Dk4c8yZou5o55DYQ7huZixTGP+wqN2Zm3rxZycDgWkbaYi1Vp0QCMIVxW1RwaEMXAfN98DxfeIUmkTSYUVO9mtXtpiPEoXyqd25QLDR27lAQo7aEcpCc96zPpqYPUyFOWKVBe7RB4W4Xs8+KL2OdBOr0Ro8uQxMMU5nwsp5jXYebQ8iaSMtuMFiubQV0Rz03mNkWjXrl/u66kwzmxUQkty8Ql4WYwQs63i0I4nVyxgzaiIelpSpxoEuzEbvB2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5EF9/TOFMHo0y32rnFh1L7biSAkKK96tIndbTP5Ga0=;
 b=nqP2qSrdec+o7yl9YQEGiX3k4k/4R7pM36ZYxfiGw4jl6puG1y3OAlPNg6mElMCeG3DuspKwZ4jKCMyk2a+u0gt/Zb2VKc/dqJqKzKXxlOAjNC6MaVmYEAEMnbf33m0u5Wppuxy2vA6xw8MjhL9nkgADj/dLGy4e7jTeJCG5sRDj7sPPsdc1ehy5BHTsgHntzDeZRGmoJK6jUkKuh9iKrJkRGIdOzdpkm9JasK718DOI2Vmiyx0xW0uES4+JjIcQ2YNR/03XkBOyeWPWrDrKWSYKYChO4ao5puLXxmKc8rshtrE0CsHH6Fb539+KgvpXCJCBvnwcr0fU76q+GQSpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5EF9/TOFMHo0y32rnFh1L7biSAkKK96tIndbTP5Ga0=;
 b=S8W73Ek8Va2x7Wf3CECk34zJrUk+cbM68ZOT+JUoB974Ut3JV/Pgg3rKghmvj/yr8f7HYtWPKookmGNU1WwjOfA4S/435NAUK5GGW1sxfb8M3FhteQqOrz15+FrVXGyqIZxJk/tlWPodjqH4C5EepeeVgntXxCq8XdkiC3J8KzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS1PR10MB7957.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:481::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 10:15:32 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:15:32 +0000
Message-ID: <8648d8bc-0f62-44df-a43e-d043091ce8b7@prevas.dk>
Date: Mon, 17 Jun 2024 12:15:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] findutils: split into packages
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::31) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS1PR10MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: d0abd352-886a-42b9-0e36-08dc8eb66bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|41320700010|366013|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RU1wemVpUFFUUTZrbXArRDFnVXRrTGl3N1hzYVBNdkpURmpFOE5ReGFmRnFn?=
 =?utf-8?B?VjhkcTB1bVdXakc2Mk90eWVhdE9hZnZyUW92NHYwQk0rZzBrbURvUkdReXNH?=
 =?utf-8?B?KzA2QU5BUmtIR21iVHRsdkY5eTBlUmhOWnFxNmtkc0E0VXQrYlU0UnpVVTVm?=
 =?utf-8?B?Tkg1VTh5K1l1WXpyUmJ2WFo1NVdGQkZZd3JTeVJoSnFtcS94TG83QnB5VE5r?=
 =?utf-8?B?V2VGci92R2VCbm5Bd1kydGN6N3ZZUUFWd3pDU280UmZzL0JqNE8zT1Y3T2Iy?=
 =?utf-8?B?RnZkZkhiS3dZcHNaaEZaSW1naGlBUFZtZjd6eW9aaFB6cUFzZ1F6M3lXTnFG?=
 =?utf-8?B?KzNCb0xEMzQrTU9SRVhUWks0RkE3Q3hYTitlb3VFMFlNbi91Nis2aTg1ekth?=
 =?utf-8?B?eXB2ZkJsai9LMGtaeDk4UkR5UVpDVmVKVzZKT21GZTN3VU1HdHhCelN6b3Nn?=
 =?utf-8?B?MmNYSGkrTTIvelVGcHQrbGhGRTVWQWtsMU81Q1E2OC8rQ3g3YTUyYWRET1hk?=
 =?utf-8?B?UTJ5ZkE4VzlVU0xhZ3RJcktVVDNYR2JlY1hVbU9DNE1ib0VBRjVPenEwME00?=
 =?utf-8?B?M1dWWVZTRjV5ampFYjdieG4xakJYQU85RnA5NTdMODNQdm9YZDg2d2xSUkFW?=
 =?utf-8?B?dUEzb0xmd2JDVWN4YWliTWt6cmRSSWk4elIycEtxckJ3RStFcDhtSTRmcUxX?=
 =?utf-8?B?dlB0bnAwSSt2K0Rod2ZNR20rRzJrSWIvU0dKYTlWUGowMHRGVzlhU3IrWkYx?=
 =?utf-8?B?MXpaZTViYlpMN1NLL3N3b0NFaDlLMjVxbEhGazBwWDdoSmVTQUJuRnBSdzRv?=
 =?utf-8?B?eG9wMHg3TXdsYXRoa3VTL3lNVTVzL0RBL1h3UkJaa2dKUFRqVlkzQjFnaHU2?=
 =?utf-8?B?cHBuK0wyeUduQzdCUFNvK09JajNmK0wvSC9VWVI0SEJzU20yYTBPN2lTVkQ3?=
 =?utf-8?B?NEFWUjVERWx1SG93M3ZSRjlJc2pJWEcvMDRNUGlnZlJ2ODNCWjRJeCs1RTdx?=
 =?utf-8?B?WXVzV0c2d01yMEd3ZVo5ckRiYkQ2MlN6cHp0Q1psM0hITUxTZDB4QTl5ZzZO?=
 =?utf-8?B?UldjejMwZzNVYUIzbDBHY2VmVno3cXM5NFkzOVBLVkFOK3R3dUQvVjR5QmVR?=
 =?utf-8?B?MmxCVVNqVllCaEUvV2kvd1dsbWswbmdpdGFJSnB0cEFYUzhGWmNoK0FncWxE?=
 =?utf-8?B?em1RSW51M0RNRGptZ3Y3U2dEbkNRQzlrRUVKclRra0V0anAvb1czZk54RHJB?=
 =?utf-8?B?Z3hiNG5iK2k5ZjdYWWczOW9QSnVwWHVQTFRaL0pDVFVEMDV3Y2RHUGs4aDIr?=
 =?utf-8?B?Q0NFQ1RGTWI3QXgzYUNwS0Y0N0ZZdUpuZlFhb3h3dW1wbzNIM3ovYjZIVXNP?=
 =?utf-8?B?bkoyRDdoMmYvdldPcFYzMWtsUTFoUTYyd2R3Q0hWRHErK0NYNlluYUFBS0hk?=
 =?utf-8?B?dVUwTC9FWjVyZG1tY1VuTFh2Qm1iN3hNaHpaT1c0L2x1WXE5UE9OeVc5UTVt?=
 =?utf-8?B?d2hsdzdZZUIyd0ZTRENEclFFZENUTm9wa0diNUlYM3ZUVmdUTmRXZ1hvWFBX?=
 =?utf-8?B?T1pBSzVmZkE3MkR5akhuR3JvVjZUNmNzMEpuaFZ6SGhjaVF6ZnJqY25NV2dN?=
 =?utf-8?B?dG9jeWFObFJuNkIwcjN3Z1U0V05uYjNYSi96WjN0M2FXQ3RXYkEySVFBWXU2?=
 =?utf-8?B?RFFyWHRMd1ZIU1ZYRUpIeFYrbXd3cFdYZHY5bk1USW12SE95QWlraU1Pdmdv?=
 =?utf-8?Q?VPP7JmpA9zZMtnivu/K01xEEPfSooB0kyPQ5qhw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(41320700010)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGR6YzZzNHZzcllSU0pCVXZTV2pVdVVKMTJXMWJEUjNEY1NpRDFaaDU3aVhZ?=
 =?utf-8?B?RHk5K3FkT3BQWHJqUStRSmlzc0NuOW42N3N3MndTK3FGaDNTYk5DZm02NGZO?=
 =?utf-8?B?YWNCQlQ3Y2ZKUmxEa1ZrVTV4L1RJbS91RkwxZVFtL1NqSnJrQUVBbmFIOTRD?=
 =?utf-8?B?OStBNXpNMThvU2dVcnJsVGFkV1hRbEZIZHFaWG1tcWpCT1JBRmxJTjhFYzRv?=
 =?utf-8?B?V1lUTmVoNTJSZ09HdlpDZUxGcEZJY1JFK1VTL3ZJQzNSK1ZLZnl4ZDU1dEZV?=
 =?utf-8?B?dzMwYmJpTkFvQk5oODBMR1hGNlpDdHQ1RjZjNEp5UXhJRVNyalI2bTRGZWY5?=
 =?utf-8?B?NHRBUE51eFRva0hldS9IaVk3MXFCT0lSU3dZcEZWZHFxU1ZqL051ZGtQWk1W?=
 =?utf-8?B?bXptMzY2UVhFYlIvclliVmU3UXorVXVVa0QyL3VGNUpjL0RqdU9Oak5xby94?=
 =?utf-8?B?V0VVbUZxWWQ0N1EyU1ZRejdORTdUL2NBN0NRMnQrVml1b2NZMFFMWjBFMGhr?=
 =?utf-8?B?dFB6dUMxd0g1MExpYjNCU3ZKT3laNnI0RFMrQUJDbFNXaWhBUVNZUzBGemp3?=
 =?utf-8?B?ejhvNlpTTFY3cW9WdkNxMUZQeW9vWUF1U3JiYW5iWnlSdkdGSnhhcmFSMk50?=
 =?utf-8?B?ckdKQyszZ21QUmF0dnI4aURIRnFLbDRUQ3hkdkx0V0RkQmlmWVFnWko0V1Jv?=
 =?utf-8?B?VlUxalFhKzBQSlhMUm5zaWpMcm1WYm9KTkJ1RGZJNnhoZ1crSGRJZDlIM1h4?=
 =?utf-8?B?SGFpRmZ2d0dISDRQVmJoZ1BTQlVRRGRzQ0JMdndUZ1p0aVpDUU1xeDZWSU9z?=
 =?utf-8?B?T09DQ1VwRzl0dndxbHFCb1BqQS8zTmMzQkVZdDF2Z0lOaU9EVzFGc0htc0dV?=
 =?utf-8?B?WGE5dU9UV0JkcEx5MEp0bnF2Wi9lblhuN0Jrd2RoRHVMeFRHUy9FaXlqdVRZ?=
 =?utf-8?B?QVo5RWQ0M0d4azRRWERqWVM3cytHdG5qL0tvTHZ6ZGl3WnVDbGloa1JaWnlm?=
 =?utf-8?B?dGVBTlBLU3VRSENPZGVZUWdha2dxSWJEdFZRZmhWZFR4dGdpTUJiQ1RsOVJL?=
 =?utf-8?B?RmJwbkRRcXgyNkg3WWpuK0g0MzJlVWVEWTc1ejBjcEVXbU5URDJWdzNUMHhS?=
 =?utf-8?B?NzV2Nm9xc25OM3g1S3RiUnBTNnBGd2tvUnNMMUpmaERSVTBRWTZ5dGdIVkFR?=
 =?utf-8?B?QzVDdE5mbGhJSnNLYll3ekYwbXpRQm9iK0xzTjlXdE9VM1RIVzNaUVNDVnhW?=
 =?utf-8?B?amMxRXoweHFuQXhZSFlhc1BZeUwzVmR0ek0xSUxrK2YrbEdUMUFTR014b2Y4?=
 =?utf-8?B?U1FKZWJvdFZoblFvMUQ0MGZKL0REQlR6YUZuczJjUmFDOGFGZG92VHlzL3py?=
 =?utf-8?B?cXRhZkF6Ky9TR3l2VWdQVS9BZUpTeFdVQmRLYStneUFFd2xJMTlPR0wzTUVa?=
 =?utf-8?B?UDVjbldwRjMzTzhDdFlWOXpNVE1laVpmbS9FU25rWUdOSEhRYTFVRXhtZXBl?=
 =?utf-8?B?VzdqN1NmRnArUkdqNnJ3UFMyaVIxVE9VTmVLM0xXR25nYlZweTJZRE00L29K?=
 =?utf-8?B?NlpJMUdjSlNDL2VOMXlqV1NnOHJvak95cmc1RVhialB0UnFjM3BTaUxXcG8v?=
 =?utf-8?B?bWVPRG1mMmpOdWJ2TGxFS1I5NmpabmFuTW9LK0VLWGhhekhSMUkxNUFzeFB1?=
 =?utf-8?B?cnc4ZXo0K1MzU0R5R1QwdlA4Qis5ZFFQYUdMeFR2ZmtQY1kydWRoRUY4ZDNJ?=
 =?utf-8?B?ZXYyUHo2NzRQSDFCSVdXR2xkSld6dGg0RVZrNEM4dEpXMkJrUjk0aXZORG9k?=
 =?utf-8?B?dDB2UmpBbkQ1ZDdLeHVhbHdsekU2VnIwL2JwVGV3VGFDL2dIRkI3ZlpCbXcr?=
 =?utf-8?B?OWtnSU9Db2diaHZZMjVFWlZ2aU1qbkJOQ21hZy8ycTVzdDcrUHZTTExTYkMz?=
 =?utf-8?B?VXh0Q2VvdkpyUlloL1BhWTE4bzdEQjRlWmd0TmRDeW1ZZVErbmhQTGdGQjI4?=
 =?utf-8?B?UkV3U2lldTNRTkFoL3VtbmRuYUNxRzVuRlN1N0tMTFVtTVNSOGN1K09LMVlh?=
 =?utf-8?B?WlJoaHRickFRaERXaTdoYU9Vay9BcngySmdNZlV0MENyMGo3VE4zd1R1V2tQ?=
 =?utf-8?B?cUhiR3llRXJtV2dPakNGVTFVcXR0QU0zVzVtQ2NqNkYwdUJVdUVxa2RSYmcr?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d0abd352-886a-42b9-0e36-08dc8eb66bc5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:15:32.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpyDURmsc3lBD9aVCGsxhXKECbMC6jfyd3CvwnDWot2g/2c3Wy57W78bWzKdO4Xd2MBLy6C5gvo78X+6FSa2T6h7ThTuMie7Qd0pYefpD/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7957
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 10:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200804

On 17/06/2024 11.59, Rasmus Villemoes wrote:
> 
> For backwards compatibility, make ${PN} pull in all the new packages.
> 
[...]
>  
> +RDEPENDS:${PN} += "${PN}-find ${PN}-xargs ${PN}-locate"

Sorry about not testing properly before sending. For this to work this
also needs

ALLOW_EMPTY:${PN} = "1"


