Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB0EC7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 13:33:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.web11.8181.1750944779351038746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 06:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Zy9M3nt4;
 spf=pass (domain: cherry.de, ip: 52.101.84.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfLb+4Z/75isCEfpodFXmc4LUs42PiaXkYnDoPkMrLK+6daUvxELB6KJDVA3C8HyHdCkBpSdsZjN7unP8JK6lCZXa1WC7IL3evFs94M6d/EJct9e+shPZ3UiBSqFRiGyhiGuToIIcs8ePEKdqixJoSLOD4EjO4o+KTqcP2BARRSRuylNj93k19lw99E/PaAGO+q1Ay+B+DARhJRo5oh10uhK3Dw/ovz4P+TTHrWsy8VVbaT3Xg8n+E6meIUvedigWeB9PPuC5XJ8DqwvT3uB95jlrCSvRlpY9owQeDzUzJOHT9VPOjjmImlBxxBImhYZEN5xotlZuc3ctBzDqyNCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ict66CNIIy9Dl94urTUH+Toa4FDZCe/yYTm9u16tD5g=;
 b=Kzk6STDyMKGGhLN/fwSkc3AnhlTXb5S7qr/1dLH9A+VwSkE2l9YVNGe6jZnjjX8/WPRuIsFGHYOWBREEgSUl9mY1o1L3PNcB9oeBWTJYc1qpJO3fIQCWAjJQWs0dQbCN38chhOmLY+13cPsS7fW5tuIwQknvB/+cXI/qT1lXSO14inVuZZZjVHCWF3VmCyNyFAxE3VSIPAOqvfNpD+uQzFA/0VcH/2Q25AY2pDuh1HaJVaXVMKPD8tQOhYjbZPRl0pbQH2df4Ad33tmA3Lu53R7I5wQwMWv7I+iqHuL4Beajw12W8sYsRXwsKZuZ9vLfZIpxCv+QVS3H9z1WdDf1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ict66CNIIy9Dl94urTUH+Toa4FDZCe/yYTm9u16tD5g=;
 b=Zy9M3nt421sctNII/IkZe2V1MZ7kLnzd2KCYfaZVgSdRjr+X2MIyhNSVHRScGCTLurZHDSCFo+sDFVvfP/AbSnBAqcFmPdG9fDvo76rCX7atpxzaLdPd2ZFWRTtGi8LV9Sp4YSb2Ydq5kKXAUeEnShX3k8k93AhSWYVypQXOVuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9686.eurprd04.prod.outlook.com (2603:10a6:102:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 13:32:56 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 13:32:55 +0000
Message-ID: <c731f3b1-9944-4996-ad2e-a6ca31dda0be@cherry.de>
Date: Thu, 26 Jun 2025 15:32:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] json-c: Re-enable '-Werror' now that icecc is
 not supported anymore
To: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
Cc: m.felsch@pengutronix.de
References: <20250626131413.3666480-1-Moritz.Haase@bmw.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250626131413.3666480-1-Moritz.Haase@bmw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0123.eurprd09.prod.outlook.com
 (2603:10a6:803:78::46) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff1e1fa-6887-4552-752d-08ddb4b5f572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N0NIRmFPZ3RIeUs3NmUwdEhhTnBYT1IxNk54Zys1Yllxb1hOSTM3NTU0YlE2?=
 =?utf-8?B?M1RqeFkweEhMbWpLSGgyUFkvcUs4ZW50dVo4WnFoak8yaEFCVnVxTGNRUWdT?=
 =?utf-8?B?aFpwL2I5Yk9pQk9QTHJtS2haODQ4a01wNVBCVVY0T0hpcEZCeHJmM1l0a1U2?=
 =?utf-8?B?MWgxbHF0STh4ZlY4K1VnZXpnRkg1bE81eVZ5Q1VWVzZtT3lNZGhiejdmTlE5?=
 =?utf-8?B?NExzZ1Qrb3NrZC91WXNwc2w3cGp4dkNIa0lHYWdJaXNxdWtlUkpLc0MxTklU?=
 =?utf-8?B?bm5wNXN4TnNDS3JPZk1MRjMwTzR6bXFSZ09pSVlTbjdLY2cwOXpJOXlyam4x?=
 =?utf-8?B?Sk1IaWpDbWlObllTVzNkby9jUEpya1doamd5cG1MY0hJN0l1aEx6RjNFODZB?=
 =?utf-8?B?dlBLZVRUWnZKb291VVI3TStveFJMaTE0dWVFbzFLay9peThtb2djdXNqNERG?=
 =?utf-8?B?NjlCZkh3c3lwUFVPTDBaYnpmMUFiY0JNYTlZZ1liWERzLzlUQ2hlK2VGY0pO?=
 =?utf-8?B?OFZXdnFXYnFsZXdvOHJBUHJ3TUpxYUdHaG5aNXRiYUFIY3lSSnNnUWg3TElM?=
 =?utf-8?B?TEZGZXpMSStuSUdFM2hZVEkyY2JTSXp4cmhlaHpoN0JOdmNLdEZBYk90d2M5?=
 =?utf-8?B?TjFKUDlJNlVXV1FtcjlRaStWRGttQzMrZDE4Z2FCWTdUcjVjVEExSmRZRm1O?=
 =?utf-8?B?MWxpaXV4M3VTSUxKSHZJWU5ibk1ScDFWOWtVQ1NMeWsvbW9QcDl5MmtTNjBk?=
 =?utf-8?B?SDgwa3k5SkF0aXVtc290NU1SU2FFOERRNzZDeEdZSGlEVUpmVFA0bk94bVR0?=
 =?utf-8?B?OUJyNDJkMXdzbHBJaGRFdys2K3g0VEc3eGpTQ1A0c1VYRHZjV3YxUFBYUmdG?=
 =?utf-8?B?SWxDR1gyQ3FkSUlkVGRXYjl3Ymo4SE1iNjdpbGFXZ1lEUWJTVVRiRE5DNjRU?=
 =?utf-8?B?bE5xZlA0ZExpSDFLR25IYjN4clNQUDVLVnlrWnNQWnI3VVhNOWs0VTJDbFZq?=
 =?utf-8?B?YXZ0akFBZ1pDL0hlSEpjdEZuTkZYN0UrTmVhbGxyY0dXbklhcVdQb0NlTVFF?=
 =?utf-8?B?UlJWRnF4aWF0eHpjS0ZVbzZNSnZZTkg2UW1yUUorMFlWUWJ6dHpGMTZJTFBz?=
 =?utf-8?B?djhSMndkVUVNOHRHQ0xkNG1adFBuU3g2ejl3UWVJOXJ6WXFwbUpMTzNReXFU?=
 =?utf-8?B?L2Rub3h1cEwyL3QxdU1Vd041Z2Z1QzJ4YllKV3BmOEFWRUF5dGpqOW1PR1ZG?=
 =?utf-8?B?TTk3VnZmRWRxV2ZtM2wrWmlRV1E1TkU4TDBUdHJHem5MaDBzaG5pcUhKaFNH?=
 =?utf-8?B?K0hsN3hTVkdtYjNWd3pNbSs0TUc3ODFIOE5ObFRmTnljaUxGOVBCWjgrdzZ2?=
 =?utf-8?B?emZLSXdrQmw0ZU1xTVpLY3p1M0twNmw1RWJYcng4aHVxTWhpU3lYTUVVZ3pw?=
 =?utf-8?B?T2pSdnVSZWRwNC9aWEFndGZ1c3d3a0FhOXk4dlR0WVRSRWlpclBZcnpyU3JH?=
 =?utf-8?B?dFhFRzhuS091ZWxjdzZIQ0JMekQzczUrVituQ3hFUGo2NlJleHZtdWJIVkNZ?=
 =?utf-8?B?bkpLenRjL3ViVWJLclJSQUdSSk5lZTFoU0ZYQjNiN1BUTFg0eXVhOW9qMTlq?=
 =?utf-8?B?VWthOTdFdlBjczV4MEU1djZCTkZ1RjV1SXhrQWR6RlQwRi8wWGFyTDVaSHU4?=
 =?utf-8?B?MXNZbHFheVRkNU10VzJlV1V6VVJJYW9pb0xSUituSklFdXRnQ1k5VmU1blcw?=
 =?utf-8?B?Z2Y3OEhpdUpBK2dEdFVVVm9qeG54U0NERW9sZjBkVXlabm1qSE1HRTRYYTFs?=
 =?utf-8?B?NDB0ZnloWkdSaWQvZGZ5ZnhkbjRkS0lZcDdQc0hsbzhDZGdoY3Y1anFpYllk?=
 =?utf-8?B?d0N2enRGY0hRdTZLQTEvZG5zSHZlZXpSSGkwTlRHUWl5VExGOS9yTXpOS0Vx?=
 =?utf-8?Q?iZ9F+lR6EOY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTBjWVdqM010L1FLL0FyUHVZZ3FsT3pMUXdvVGl1T3YzbE1wR2dENElOUVUv?=
 =?utf-8?B?VmVrK0dhR2pnTExyMkZxUkl2WVJzQzNzbjdpZkVyNW1sdXQvOERPYlVWNUd6?=
 =?utf-8?B?RW9FbWFPN2lTUnV3ZVpUVWNJZ2U2M3MvQ2lkZjZWbzdzV3FxUWIwRlNnWmFK?=
 =?utf-8?B?MVNYOU4rTzREQllWTXZNY2Z1eit6eW9ZSUd0OGE5VWNHSmI3bGFlVWhkOTh4?=
 =?utf-8?B?dHJIM0NUQlVsTFZ5aTRoOFNoRXVQeDE2TXhCb0RwVFVJMC93SlQrREVoQXEw?=
 =?utf-8?B?VnR4cnkzYXRZb3NNT3A4VlFwZTZadlF0d0tXdmxDN1oyRGdWcnRWNldsVEJF?=
 =?utf-8?B?am1vQ3hDWEd3TGFvc1VsbC9TSGp1d1lGOHFDaGNybGJyVk00anpRL0R2dkM5?=
 =?utf-8?B?djZVbDdnSXFyZGNCUTlxYU5oOUFNd0huTU10aFJYclkxK3ZGcmQrRkl5UGdV?=
 =?utf-8?B?TGp0UmMxczNzeGIvbkJOKytma1JzOTJIVzlzZjRWMXo1SHoyRmNkcmxJeUxi?=
 =?utf-8?B?R21xcUFQMVhjaDhtSkxxSU53ZS9FR0g2am1Pbjk1Y3QxRFdNK3JDajA1UzMv?=
 =?utf-8?B?MnBjQ2duTlZKUWVNMnJjY2JkSk5tTGNFSmdGOUJtZ0ZVRWpSYUJmTTNabUlx?=
 =?utf-8?B?bHhPcStaRVdVSnNoL1ZiU3hVZEFKYmF2eGNUcjZOb2RoWE1FZzVLbU5FZHJz?=
 =?utf-8?B?NUNWTUFFcEtTVXFWcHl1bHVhTUVEUHNQTlIycW1FL0xBb1RjNEpzNmp1Zk5E?=
 =?utf-8?B?UDJ0MXNsenBHQlRObU9WZE44QUtRdnpoemdMT1FHaEFXZnFwUGRLK2ZDa1NU?=
 =?utf-8?B?Nlc2NCtPWGR5dTdOcUJrTlZkcHZaR3VSMldJTWhUNkFVV2IyUkcwNkQ3QW5C?=
 =?utf-8?B?OFpEUlJTZXlyRkY1ck94ZjRyb2g2U04wcmR1c2RGVVdSU3k1ekE0NkNHcGZ0?=
 =?utf-8?B?d3hxQ1hYUHBIYWNwVG1yZkl2dmFEd3RVenZLbFRPSnVONjU5Q2xYZmdROWxx?=
 =?utf-8?B?SllVVk1qQVQwajQ0UUxSdGZIUUsySDluMUVmWk45djBxNENKNkJOc2NUS2Vu?=
 =?utf-8?B?b1BkaTAvRWxBYndKUmxCREMyZFFRTHVWMXM1Y25CTjRCWEYvekREQ0pOblZR?=
 =?utf-8?B?bDVRU3p4YUtnVnY1OUJPK2FCTGQrYXVsUmhDTU1yL2hmTjFEYlNtTi9nc0t0?=
 =?utf-8?B?Q29LVTNQRGdwVmgyT3l5VnVnOGcyNmpLODdHb2tnU3hXUERTTk1ITlFQUkpw?=
 =?utf-8?B?d05GWlg1STFDVlNjTnE4N3BTZDMwbWpWZlNaNGFjL0tVb1NDTHFrRG01a1Bj?=
 =?utf-8?B?Nk1kNGI3RXZGOTd2OW5HZzduMUJvVVBJNFE3Y1NTZFVpb01LUEJQY29WOTJX?=
 =?utf-8?B?VUFvdzBXM2swOGNsNmd0WFRyN2dKZmNhd2h5TzR0R2xlMVlQdmFKWnRheWVu?=
 =?utf-8?B?cFFscXdDSW9lTE42R1BRd21VR0ZOZVJRQXY3Um9oNnYvbE5sV25WOURVaVB5?=
 =?utf-8?B?NGZWNld0T3JGUHc2RzdTQW1aTlJUbUZPSjBFMVJ0U2xoUjhVc1dYdTdYb3RU?=
 =?utf-8?B?NXJVbkFQVGF1S1k3SXoyNWptcXV2RTdKUlF4a3RkampFUzg0SlU3YW1vck1H?=
 =?utf-8?B?aTBDSmt3dVVPRFB1VC9pcXJUOTNvcTNEck9OYk5BZmRKN2tBWHg4L1AwSUN1?=
 =?utf-8?B?WjFlQVdNcDZQRW1XOFoyRlpGcGFaTzZVdlIwSXJ3V0RBS2RDZHQ1TkxYVjZZ?=
 =?utf-8?B?dWdUaHY4WVVzUXlVQnRpOFJ2WGUxQ25yVTdCa3dQTGpNRXVvUDJLd1I5NVEw?=
 =?utf-8?B?T1NOR0tHQ2d4b3N5andhQmJ4Rzd1RG1iVXR5dDhpdXZZb2ZQbGIvWTM1THZm?=
 =?utf-8?B?aWpZMFBZdnpOMlRmMVNHUzZBTnFrMW5mZWlpZi9McGhKMGwwc3Q2V0Y2bVdD?=
 =?utf-8?B?ZFRwRmxNZFlrdUpZVXE2cTZLbXUrT3JnSDJ3VDJhTFZ6SnRyWVlxT1ZWOWNM?=
 =?utf-8?B?UGF0SWpadXhPMUUybXNkcXowSlZRRnR1dDhkSXdNdFdBQnBFWWthcmcxLzNV?=
 =?utf-8?B?MS9IU1RUcTZTZTc4NldjVWxSci9WMFhGU2pGbGE1WjVIRnI2SWVPWktsMEM3?=
 =?utf-8?B?dXgvWnF6UjIzckVvN0tMVURLWmdMZi9jUHZabTZhd3VFaHZoc3pJY09WOEFN?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff1e1fa-6887-4552-752d-08ddb4b5f572
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:32:55.8258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yz2SkBJbavGpjLYpFdAkdDf9Nm4UI477T7+A7j1vA8tcT3zfJquxCLkL6T59EofexVMj6i8WjKPWImabZARup2mMdiTMt4ppUJfbWVC51w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 13:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219354

Hi Moritz,

On 6/26/25 3:14 PM, Moritz Haase via lists.openembedded.org wrote:
> 6481e8b209b ("json-c: fix icecc compilation") disabled '-Werror' unconditionally
> for all compilers. As support for icecc has been removed via ba4fd5229893
> ("classes/recipes-devtools: Drop icecc from OE-Core") recently, we can re-enable
> it.
> 

Looks nice, thanks. Minor comment below.

> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> CC: quentin.schulz@cherry.de
> CC: m.felsch@pengutronix.de
> ---
>   meta/recipes-devtools/json-c/json-c_0.18.bb | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.18.bb
> index ece320d66ce1f03ce0c8655374c02c283a9364dd..5edeced4c55df088e1a9990d9e159fe970bb537b 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.18.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.18.bb
> @@ -19,10 +19,8 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
>   
>   RPROVIDES:${PN} = "libjson"
>   
> -# - '-Werror' must be disabled for ICECC builds
> -# - Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
> -EXTRA_OECMAKE = "-DDISABLE_WERROR=ON \
> -                 -DBUILD_APPS=OFF \
> +# Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
> +EXTRA_OECMAKE = "-DBUILD_APPS=OFF \
>   "

We could have the closing quote character on the same line.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

