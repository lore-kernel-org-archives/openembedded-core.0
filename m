Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A445CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 14:01:29 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.40])
 by mx.groups.io with SMTP id smtpd.web11.34643.1759759283054921611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 07:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TrRp7+yG;
 spf=pass (domain: cherry.de, ip: 52.101.83.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcQ5j9EYx6aujz7GwDsISC4/GVLOX2boV/E5LfCkVqd3tKhqC+9TOM0leMCs+q00eZzRV9sT2nx4icKMq9OauV2LNU/dYMHOa7shZEWBuSu+7GLr/IjjeQGmAhvRmaxN2xiloyLbYfMYgPA7PV6+LqzdhZC8MHqa78yXcIXjOMJ/lGNTjZ1vTN2t3sh+/B9KEQXF0wFvf88p3HlF0B1SbzlYUsJyyK5rZ8pt3vjVk+cgx7oIQtLSr8yos5EKESl7G8TxZr1wOsRNr+DVz6kkOjkPec1VAfDjkBqV6u7ZTaYCcC5cojYRMokK1c5bm2L3APhjUrwvwWJNJ9uNq4JRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+EngRjwjZ+ZoG7c7EOJOSqznritykJOOW7Kp58R7ew=;
 b=LeGxMYAdhzg3WRBDV7m16f6v+4NrW1/TnGWS+6g0Rol2yDgn6GHC08untfdCiHoM3eNzdLLneK7CU/PDqUFSfj4FAdUd0MFxnoWRjPTCBVaLWq27V2SDxPbK910Ij8qMi6AAeoyhM8et0p7sRsrfWVDXHgcbPBP4Y5seV88VCGawpG/gJlnagfEyMIfnMdjaY45QGCwwEr+X01+A/ovklRLhSgDIset0FH6kMBSG5SPJMAQv5c98jYz0OpNTvnNF6h1oSu6EStVAQNMatqdANmL3vJLaqmYx5O0qxz/AI66xHid8zYT9HG70Et++rd/Bsw0qmRrpEuN85H0rTB5HOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+EngRjwjZ+ZoG7c7EOJOSqznritykJOOW7Kp58R7ew=;
 b=TrRp7+yGql7EpWb1uc4owMd5QmuNzxDtX5c0s4329ICdIOQa8PRjJjpap2Tfl+kvu1e63Vq4+O1xh8bkinEtjX4xpdfIpBfpPxTa3BYu+xbTQsDBVMRfox9JZhfv92FVHo7o54NQZ6vIDllLbFyNaVPmA6M+AQquTrYruq23l18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 6 Oct
 2025 14:01:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 14:01:15 +0000
Message-ID: <feae4e64-0969-4e02-84b4-3ecba5e41a02@cherry.de>
Date: Mon, 6 Oct 2025 16:01:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-demos: split info tools to a separate
 package
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cb5769-3587-48ec-a7c3-08de04e0cfae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dU0yd3FUdjFQZ3BGbktFZEZtR2h6eFEydGdEd09EVGVVc1BKcUNIVVBvWWY2?=
 =?utf-8?B?bVJXaW80bzVaVmNGZ2EzQktLU3VjUHZocitTeWY3MjVaZExKYlV5Qk9keFBE?=
 =?utf-8?B?elpaZ1RVLzhtZGJqajRQVm5PVUNtNmo3b0laVFRvT1FPVFQvUDM1NzQ3YmpW?=
 =?utf-8?B?YmtWSGc5bUhFaG5IaFNjU0VwQXJVRHVmL3R2Qm9XZHhhRVpsczE5S09xalVN?=
 =?utf-8?B?a2ttaXpyUjRhN1FFNVVPNGhrSHhXU0RFNVphbjc3dTUrQ2tsUkZaTHJCYjZT?=
 =?utf-8?B?QzZlOHdiWmFXUG5KZTloazNQeDNlNE1ETWJLSTR4WXJNUjY0bUl2ZGhlYmN4?=
 =?utf-8?B?U1NkQmtCRTNIWHExYURqZGZNaWhrR1phQ2JvRDFVbS9RbEoreHZpQlZiZ1FS?=
 =?utf-8?B?TUNoNmx6Y2p0QVRkSGRaejFNaGd1MmFlMTdvZWpnWjNtbHo2eDJtUHF1Y3Q4?=
 =?utf-8?B?WFVteEtOYm85bkF3bXdrTkNyV1cveDcrMjRJNGVQMmM4WWRxTXNLMFgvV3pH?=
 =?utf-8?B?YkdsaUgyYnNuR1RCTW1NVXdqVVZGTjhlUnIraHJJZ1lFMWJJeTNZWkFRT2FH?=
 =?utf-8?B?ZXBhN0xETjJwWTdEZFcxRU4wcGwxT0xIa0FFcVV1RDBsVTdUVXd6dE5la0lJ?=
 =?utf-8?B?Z01LVFREYjZZd1VTekVkZ1NRR3ljdW1XZkgwemF5b09RWm9PUVRBNHd4akZL?=
 =?utf-8?B?MTI5SFM3TGtIZzJuZm1tbTlCZ2VLS0dRWEFtaXVpL25icXRoRSt3MXZKWlNM?=
 =?utf-8?B?bU5HNkdFRFg2Z0gzUlAyWGI3MTRjdzJkcDVkeXo3Z21Ub3U1MXA5WkFsY0xv?=
 =?utf-8?B?WjJ6RkZVb0JkZW4yMHA3S0dPd2swUi82TDNNa2ZTaHhDUWloeFVNQnM3S1ZQ?=
 =?utf-8?B?R2JqYjNoTlU5WCtDbUtaOHh4TUt6YlZwWHBLMVF3cUFuQm5EWHJvL3pwSzFv?=
 =?utf-8?B?dmpORFFuU0NsdTFjRVBGeXRVSFpkNHBWS0pIQjFPUG1HQkFRanRHa1dJZ3lY?=
 =?utf-8?B?Y1QyUWVsVGpwbEJKY2pDNG44c3FTOGFuNlp2VzZqWFZIL0JJeXNKVG5iVUFF?=
 =?utf-8?B?R2xQNm1ycUhweUxZSy9kQ3I4T1FUUTdOYldUSi9QR2NFeExtcXJYMUlzQ01F?=
 =?utf-8?B?alBmYkt3c1d2eXVrcFZjUG84bnoxdFcyVXhpVVRScDdFYXZuaktrTnNrRDVh?=
 =?utf-8?B?MXVqbUZjQUwzR3oxUHRZTXVmaHo1UFZRYkNORERMY1NUVGp0VklEakQ3QUt4?=
 =?utf-8?B?U1JvUTdrK1Rud2tNVW5RY0cxRFVXWXo3QW9iM0kvQmhOYm9aTjBPTHQ5b2Nn?=
 =?utf-8?B?R2pzbWFwN0FzSWF6amdwL2F1bFlNNDAyL2FWdnBSbGZPOHp6b0tOUmM0WDlC?=
 =?utf-8?B?RXpwNGRHdEtVSzRLNis4d0dCTnlDREo3YVJTNnptWWJMZ3JuNW5WRi8vSlU4?=
 =?utf-8?B?Nm93QmhJWk0rcXNsODFzU2YxcHN6V0pTN1hBT3dxRnNVSGcyOFMyKzhBYUl5?=
 =?utf-8?B?NHBkSmxCK0hyelNpRDhtWThkZUdIZ1d3alVmQkdlbFIvSEkxeVJZTU9TRnFp?=
 =?utf-8?B?d1hsbjI5TGJWbDJMazVFL3dwRXYyTS9FYUNzZTNoaHRHcHBIOEpqWHJ2aU5q?=
 =?utf-8?B?NStNdlhxcXdQa21BOCtYaXY3UWZNejhMTW9nZWcwQVZQRzY5SkdpaWt4NzBv?=
 =?utf-8?B?c2t1OFhIMUdXWDliMkJ3SDAxeXRvcXZsSHJ2VWErK0Y5ZHlEQVJnUCtRMkE2?=
 =?utf-8?B?RTVDTFVvM0VoV2FMekJOdEI4RTFETWM5UjJrR0xSNmE1V0JCVVY1Z1AzcU8z?=
 =?utf-8?B?TXQ2a0RDcmNzd09SMm1jc2tOdWNwS0NjSFY5cnJzdldGemxmSW5sbmpFS0Z4?=
 =?utf-8?B?VVNGOEF0RUNPVzVEUXJXZzBEZEtwMmd2Tkw4SFZUWnFyVzFNQXZCa0lKanhp?=
 =?utf-8?Q?rrCebtJFc2tl62gzhgXncgOIS2FJrAAS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Und1ZjV6UlNlNm5iZlg4RiszM1dtUm1qTTZ5SU84Q1A1QmFlaXlkSEZ3c24z?=
 =?utf-8?B?ZUtUYThUd3d4bnR2OTdPbE1Gay85VlQ3cUErcmZiR3lhdGFsUDhVK0hvM0lG?=
 =?utf-8?B?QzZmemY1MStGYzNUcktZVzI5Tm9pcHRDSmdPdHlLVzFmMkcxNlN5bkVGcDZG?=
 =?utf-8?B?RGxuL25RWmxPSlY5NG1lYUQyb0pKMEpFOW5NQWlNb28xZVlmSGhLLys0YzJF?=
 =?utf-8?B?NWZ2NDNwbmtnOGNGdHNSV0ZBcWJOelhBejh6dWRQNm81blMvdnBsWE1UT09y?=
 =?utf-8?B?VjhuWHZSVklSSERCZExUN1JBUWs4dFB5MkhRdzIra2tZajdKUTZlVTJSNHJ0?=
 =?utf-8?B?bWZaaTl2ckl6SStWK0YrWEtiWTdKRGFOeUNaaVIvMUxlcG5ydCt6dThCVlZZ?=
 =?utf-8?B?ODdHYStVTSt0ZmRiakVIQlhHZVdxUmxtelIwcVpYK0h2Y1FIUEl1MUk2U0l3?=
 =?utf-8?B?Z2J6YnIrVThOT3RnRHJtdnpxdDA1QWp6ek93VHdVNWVieEdxbk9HOXBmejlM?=
 =?utf-8?B?MVZQL2VSSUVvd0F6RE15R1RHRERSNWhYUzlkSThWaWQ3Wk5sMUpJTTl3UDQ3?=
 =?utf-8?B?U0hyb1dsSmNCbTNWTW5uRVdWcFpvMTNXYmV0VWNwVEQ2OU56dDRETFBQRFhu?=
 =?utf-8?B?SmFQSXJ1NDJtMlljanBZWnV1emFuUGphVzE3NHFZK1FZRkxocHFPWW1mbG4w?=
 =?utf-8?B?RlJzc3k1SlBVT282cUdtbE9EbzBRSk5SNXI2cHlwQ3c3VElYRDhBZFF4NWI1?=
 =?utf-8?B?YUh3N3ExOEhReHNQc1BHSGRJTTdHb3dmaVAvVlYzZFJkTE5VbWpiblJiT3Z6?=
 =?utf-8?B?VXhjK2JSNytRMHZxR3laa004SzF5WHZZc004eHlMb01waUpFNXNpMmM1Sk1F?=
 =?utf-8?B?bVhvSis4MlVzZk9hTndyekphUDQ3R09pZENOMTdUS05TY240TTVQbm5PU2hn?=
 =?utf-8?B?dHg1RURqVEtwOFUxYlJyZWhuRjFBaUdjamUyTTZTb1lIMWgxNUNpaGd6L1B6?=
 =?utf-8?B?ZzFOOExFMmg4YUgvU1Z0WXdVcWtleXpPcGRuc2JQOFoyUlV2NVJMTGVCNXNi?=
 =?utf-8?B?TEtqUzAxc2NFK3ZYdWhJRXJwTnZneVRmOU5XOEpNZmpydEMwdnROOVdGTTlh?=
 =?utf-8?B?Mmdyb1hXdmUrZm1QNlU1Tm5reStDellyN01CWERTY2JwZGJiS1lxYVFSWEpw?=
 =?utf-8?B?a0haVXRqV3JZZ1daU2dDTE5iUWYzRE1JWFNUZGNxRHJyQWYwM2tTa0c0S2Nk?=
 =?utf-8?B?K0QwczlxL2VmWDRlRnpKb3dobStHWFNkOWtLNkd4N1NucU1abExPWFVNTnli?=
 =?utf-8?B?VjZuekM4bDdocmh4UzlzZ2N2Qk05bVhYZ09HTGxrazJjbjNFV3lVbElRTFZY?=
 =?utf-8?B?NTFPZ2VOKzZRcmRYSzRGS1FpdEVXNjR0Smo3aVI0dDdHQXlPbHdoaW1lc3dQ?=
 =?utf-8?B?dVVFL0VmbU80QytUSzRIaGxMRGhNU3FhZ0Q1ZWZNaS95ZnlLOGJ0NjhTQUFE?=
 =?utf-8?B?K0pxbXVkekJIUXY5ZUdkbzdjMUtWNGY2WCtGRitLNjJlUmFkZzBrdW9ZTW5G?=
 =?utf-8?B?bUo3VTdQUzlkRXo1eWVkUk9HK1FEbTM5QXAzN0thTkx4WGhJc3RrdTdSVDE4?=
 =?utf-8?B?ZUo0T3gzNy81NHBOa1ZNUnE1YkZpWC9rMVFHM3dnbS8rV0hpWlFXNXM3SjBL?=
 =?utf-8?B?ZUhXUVpCbGVSdGROSmFrVy82RUxoMWdWMmxmbURSQVVXQlNNZWpPTkpva2lk?=
 =?utf-8?B?dUZFcmxPMmxZZWIxakRBQk1tUGtZRlN4YS9zUWNvZERVZmo5c3RROEpUa0Y1?=
 =?utf-8?B?Um1zZzAyZlZjeHRuenBhRklTNGdTVE5GUmhTUEZYSk5yZGtHTzJTdFh0bXFV?=
 =?utf-8?B?bldZenNjRjJxWHhsbnBSelZPTi9GVTZBZGwzVk5NTHJEWU1TR2RleGc1aFlk?=
 =?utf-8?B?WEE1NloyYXd3QVlKdXdhQlo0MEhLc0hHNHRCZzNFZGNFcUZCQ3IyVjNSQ0Zt?=
 =?utf-8?B?aTVpVjFXK0R0SEc5dFZRcjVNNnFaYXhveVZ2QTRHNVI1aFI5a1FPRzdNQk93?=
 =?utf-8?B?aUtNUllwL2NKMWFPS0FVc1FNSEdsOWlFazdxWS9xOTdRZlJKTVlyclZVeU4w?=
 =?utf-8?B?R2F6dUpxV0dyaE9QSHVNa3hsOUZEYWRwMXlNNDRSeUpXUkdvUXh2eGlZaDkr?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cb5769-3587-48ec-a7c3-08de04e0cfae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:01:15.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOPHil2/C/UdWpqgTZpy9wX11CvQ36BwAN75S4MiXjuWrwfSN2Xa5vl1v/qAJvZkF3dTTkzp5VhTgzr1wluKFrsLZYinWEg6sRKg0KqsRTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 14:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224488

Hi Dmitry,

On 10/2/25 3:50 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> While the rest of programs inside mesa-demos are really "demos", several
> *info utilities have separate value as they allow gathering information
> about the running system in a manner similar to clinfo or vulkaninfo.
> Split them into a separate package in order to allow picking them info
> the images without picking up the rest of "demos".
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> index a9e84039d2c9..0bc8519e90e2 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> @@ -20,6 +20,10 @@ REQUIRED_DISTRO_FEATURES = "opengl x11"
>   
>   EXTRA_OEMESON = "-Dwith-system-data-files=true"
>   
> +PACKAGE_BEFORE_PN = "${PN}-info"
> +RDEPENDS:${PN} += " ${PN}-info"

Is there really a dependency from demo applications on the various info 
binaries?

Can you justify this dependency?

Otherwise this looks good to me.

Cheers,
Quentin

