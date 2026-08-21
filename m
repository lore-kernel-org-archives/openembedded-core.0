Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A4BC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:49:36 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1610.1787338167223986052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FZAp9PUV;
 spf=pass (domain: cherry.de, ip: 52.101.70.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwsDAR/1dap+EOsd2QoKUgnuiygaJ8o4jSa7iK5U9YSuBJxBkF0X1hDA3tFAWSw+W+XgIrYdT/2O2kyPF1x3cuSxYlebQXDkAfBWptLhjB9VnSFUB5agVwze9RNLQK7VWChTuyuvMBjUAlMZfokSgcJ4+ux1hdvWkp0GzXTBesDnnUPNoA3cWLBL8CzMWxB5NEprXt/pUWYls/FCbxQ/FEG7pL/kLaMLWtffrzhrjR5XWfxZiuB6uQTeDDheUHIQ+LLn9hrzRrawYNHAFRM6EsXRMIqHzyzRJmZBfPPQUGktOwR7rvY/QZ4o4GCKU2VN+ecB7uUXKO9yKj6AL9WCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wj0lzOC0lKrUXZjAMGBRvrmHHmPupWyDUyYAQJlOx9k=;
 b=cZ4x9h0EKoRndNhs5vlBEl4sRz4+r7L8XHu2duILIzkdRRzKsv4MccuBG5zWl6v7GAO8Z33VuOpt9fnvRy/Eei84ZNqi9MLnzY8lkQSrFAW7AHFtU4SQk9/VqXVZ5RPLWynlcS389SrNKL7hTFuiHrMnIdbk+49xtqhyCGaywUDyM2e0lYu475ye1rJb3x8i+p09oMw6TF4DnC8LwADBGj7peEu+8mwboO8Dtz79/0D5LNvchDrIgtOJmgkYo+PXhl+Qr6CxIQLPPDhuaXG0BTjJEb4rgr1iWJAawJkTVhTbz8+Fv5EybItMkVv7o51xWdzqcsmqiOGLeSiTTEdkwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wj0lzOC0lKrUXZjAMGBRvrmHHmPupWyDUyYAQJlOx9k=;
 b=FZAp9PUVOGHd/40/XjbWI9YSajUxfc882teAYb76/dH1zBNX0a9RUkszH+m4qjlMRjfGGo10iPxFOyuhf9D4wYlHZR+Yh8rYT4hzMDQUNCMekMb69MRgGReKDa02BYqD4LbDizXQwd+WJeUvaRBTfj07rEirhT1WY4BQsWCxGM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB8062.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 18:49:24 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 18:49:24 +0000
Message-ID: <856d5958-7ff5-4785-9673-2f6d4ba795ab@cherry.de>
Date: Fri, 21 Aug 2026 16:15:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3]
 meta/conf/fragments/yocto/monitor-disk-space.conf: add fragment
To: antonin.godard@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
 <20260821-sbom-cve-check-fragment-desc-v1-3-e06feb747b07@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260821-sbom-cve-check-fragment-desc-v1-3-e06feb747b07@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::35) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: dff0baaa-9dad-4df3-488b-08deffb4ebb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	qaYk7kEgXXrPRLpB7g1eRAWycGXkfNdZ3RxIbx96Nl79MDGeqN2CWmJqJuTFIrhb2qqQnhbF4zQieFweXHSJU3dyMdgkILcKeZyYsSXCJAF5zUtoSskRtUqeAdpSY3QcLq+BWxmTZL3yqOOvpcq4Djdkyp03vHl9KMSPDJiPctN9BF/CQKZ97oUXLF06RRWLH8mCdiYiAdcAnH5P/5DiPSBuOLkmFCZ1noo4ddkWgNJ8uPn6VYdKXuPDfN1Qdxv7oHbynEN3InS0+yOqxO0J/C57RzL/+Rau1vQ+0S5Px0lLE4v8k+qgQl2C03MXMgoXh1MlguqizgFL3XulOeIAbIARsv3cJ+u2YtDmsNTQcyWXq9A96x00WKwsndZ5XSPoym/FHWjcd0dunI6gZLTra20HS6/pEFXBFapB8eqMIaUVm6VBJwYaeEIUw5Y3mVuxVrmh0PN0Cqxu2JcCDroYAVqd2FU+Iq8VNFEstoNh+5Hr8S3HY+hCC+zamGxwgxEQG0G5F7tPby++vUPPElfqt9Hk92Ksh+UqnypBq7xBHeb7vOZbZCsjIg4W2IawwJDoDqiWLDXDeEvf3ZphuhFPivX0SBglcAUuO6ZcxDEoBq+d3nBNuYoLs6Nou6cckZ8jsil9BEKsdSm5sFFwPMtQRMO/pWm0jFdEFkBP5aSNsqE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGFjMXdoMXFnSnVaWHVCOWh1cXFySXBKdXBLd3JKa3ZrMUJGM0lvRWFWb3BL?=
 =?utf-8?B?VWhFcFEwSTl0TDB0WDlVTEhyZmtSNGV1NGZ5QitMU3dGWVVPeXNTRmNPKzQ4?=
 =?utf-8?B?OTZHYWd6SmRtR3djbDh6Z1pJM0NpNUxIajNIUU00dmpKRk50QXI3Y3NNUXNk?=
 =?utf-8?B?QlVOUGdHWWZHUmdwd3hZWHg3a0RlMVJWeHE1WHQra2UrOFRVWlJsQzZuc3k1?=
 =?utf-8?B?b2RweWlLM1FCamFVNjhGcUdITVlQVWo3cENxekVLZVY1NjZDV3YzWlFlWU5O?=
 =?utf-8?B?Sm1DSDJCNjY3Wit5SnFnUVl3dGtSaW84ZUhsVGNNNklkNXoxVlBNYVdRMnda?=
 =?utf-8?B?NTU3R3VwcnRycjdKL1pyRS92dTB0YkVFMW55RmdMaHpIZXdzRW9FOEFzVy8x?=
 =?utf-8?B?eG1oQi9kRjRaUnZqTldnYnNPdEptZDZTU0RQZGplOUhOWnBOdlRLaEJBdWVw?=
 =?utf-8?B?a2hNZTZtdnljWTQzWDIvK1VGRzVUaDV4ZVZ4eU8wWk1ublVESGRQMWVXWjJC?=
 =?utf-8?B?RWR2TithYlowVnNjbURvZFgrak1QUkZ4a25OV2ltWmJYOHdyNTFPWUlSeE43?=
 =?utf-8?B?dmNQTS94akIrYm4wUkpCMWtOS2RKUHdyVHU4bDJ6WVdDZzJtVUFsT3g3dmtq?=
 =?utf-8?B?S3d6S000cEZvR25lOWFDeFVhckU4clFVN1RLR1g1L3dMWk1reHRQYTZUUHZo?=
 =?utf-8?B?R0pBWk55b3JReWVJNWtibC9nNWtxRnorRFBEYTduSWk5RitMTXVxcmR0aFdH?=
 =?utf-8?B?U255Q2hiVVNoaDl0c1laMzZDRXlQZGJCSVkrcW1YeUZaQUdhWGR4djZBRWFs?=
 =?utf-8?B?Z3E3OU1uZ0RuaHhIVlFGOEFFL2plQzlCODdOZlM3dlZJRFFPb0RXVFpPOGNu?=
 =?utf-8?B?aEFacitrejVGWUhGQ1FhUTRxaG40RTFJbnAzZDJwYWg5Y2trYnErbmxPQmFh?=
 =?utf-8?B?QlhJcC9yU1pHb1lvbnRYaVFqK1pNdGsvT3kyUkRIY1Y2ek1Cb0NQQ1lmaUNr?=
 =?utf-8?B?SWZCSG1raEJucmFvbmNRZCt2NXdVcmtDbHVyTmRPQ2laYkZnUjBKdU1VT2tR?=
 =?utf-8?B?dy9neUNSZkN3bVppZkF6dDVrOGhsamJibFUzc3F4VVV4M1hiSFlZcHhoZks4?=
 =?utf-8?B?elhHV1lVQ1JuT1hiNHFvaFgzbi9Uejl1dGYvMERsb214LzRQa0N0VHFMRE9P?=
 =?utf-8?B?d0NDUnZ3c3BJQ2pPYjBPTzdTUm1tOFBlYzJBQWs1Zzd5eHlkbWt0cFZwZFlm?=
 =?utf-8?B?RVZ6Ym5XNWQ2dHBVUHhmWlZsNlpKRU1YK2t0L0pLaGo4T0FmRmw2U3cwa2Nl?=
 =?utf-8?B?L2orRlhTaEMrRGszUFlDbTJXYnFZby9neDZJZm1HTXQ0OVlzNVo2OFZ0QWhJ?=
 =?utf-8?B?cDY4TXBsWGkxMndaVTlWNjU2R0ZRRkVBcUwrK2RUNW1SdlZYVmxCM25mUWJF?=
 =?utf-8?B?aDVtQ2FsT2dZT1QzSXdJTjQ4cEFnc0ZEdmYyM0dlcHJxSDZOd0ZPNFVBL3pa?=
 =?utf-8?B?WjRYb1RIZ2xLRWVjdlFlTTloUzBJV2hFMC92TzBKbmVaUXJPZkZCWVNib1Jz?=
 =?utf-8?B?V1duL2RxZWVHb1NTaElxZzBrajFOYTE2RWZKcVIxQlRMNk42ZThTdGluOVdN?=
 =?utf-8?B?akl4eFRlTmRjZy9GOWpNK2I0WHJ3WWllOW05RUJzK2NYQitBazAyaytKVkgx?=
 =?utf-8?B?cEtaZWhtWktnTWlFT29UeE9BVFJzTEZ1Z0YxZzJPTnZ2VjNMVmZ1RlZVWnlw?=
 =?utf-8?B?Rko5ZHU0Z1pRUDY3UnUwN0JLS21EYS9kZkNFWG55Z0IxNUVnejFCcEM1VkN1?=
 =?utf-8?B?MkZyREE3Zlc5OUFjWnE3dGVpRE14UXg4UmhZL2VUT3hyNEZNYWw4amU4Ty9n?=
 =?utf-8?B?TnF4QWJxakozbXVUWjZvQVRnZnVOWFJUWjlsZUVmSE5tN2dic0lxNHR5SUlw?=
 =?utf-8?B?SzVESEZSNXRhWER1eXRrNE1KTUd1dXRRekN3UUE5RjJGYVBTUGd6ZmRpN1c3?=
 =?utf-8?B?S0FpdGliV2EwYjFpdGxLWWMvYnlDN2owOUJtT3QzTUhnaXJsMVZsUlpjNDJU?=
 =?utf-8?B?cHphekpXcFgya1d5V1h3NTNMQWs2YzVqbnNRSGxyaTlvWW9CK3kzL3FXS09P?=
 =?utf-8?B?VVBnalJSR09Vd0ZYRG9KRGNQSDBDQWM4Qyt4Y0JzS1E0UjdpNWdLbHpBc0Ji?=
 =?utf-8?B?bkczWWduZkFXY0xnUGtQWEwrVUM1YkZxY2RhRFNOdHR6eS9FOExZNHNaSERz?=
 =?utf-8?B?UzFFKzkvWHVXY3hpc0gxZ2NNSC9pNEdYU21kWjMyd3hTRUtSVlRFTTF4TTBs?=
 =?utf-8?B?a2s1NVZOZ3NJLy9NdG8zbFdCMUVQMXBYOVhoWGN3L0ZUZzN0dmRLbU1XMjFV?=
 =?utf-8?Q?1sBh0IJ559/N0mSujBfmeN0uAP0WP6TxqXh83egl1TFei?=
X-MS-Exchange-AntiSpam-MessageData-1: IEKv7PggZplPZzqz+3ztH+7BUVnYYswOFZU=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dff0baaa-9dad-4df3-488b-08deffb4ebb3
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 18:49:24.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OU+uGuVHTDql2zMki0VNRVg4SDUs9/IfeaaLXCK/rPNsKpnAvI1DJe659Htdus4Rh08L2HH207LaG2G5RcnPAuE9XvTk4bsmVEOcA9CfcWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 18:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243954

Hi Antonin,

On 8/21/26 2:26 PM, Antonin Godard via lists.openembedded.org wrote:
> Add a "core/yocto/monitor-disk-space" fragment to enable the
> functionality previously provided by the default definition of
> BB_DISKMON_DIRS in local.conf.sample. As the definition might not be
> obvious to set, having a simple way of enabling the feature through a
> fragment makes it more approachable.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   meta/conf/fragments/yocto/monitor-disk-space.conf | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/meta/conf/fragments/yocto/monitor-disk-space.conf b/meta/conf/fragments/yocto/monitor-disk-space.conf
> new file mode 100644
> index 0000000000..95ff54465f
> --- /dev/null
> +++ b/meta/conf/fragments/yocto/monitor-disk-space.conf
> @@ -0,0 +1,18 @@
> +BB_CONF_FRAGMENT_SUMMARY = "Monitor disk space during the build"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Monitor the disk space during the build. If \
> +there is less that 1GB of space or less than 100K inodes in any key build \
> +location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully shutdown the build. If there \
> +is less than 100MB or 1K inodes, perform a hard halt of the build. The reason \
> +for this is that running completely out of space can corrupt files and damages \

Remove "The reason for this is that".

I can suggest also rewording after the "and":

and can make unrecoverable damages to the build.

which is lighter (to me) when reading.

> +the build in ways which may not be easily recoverable. It's necessary to monitor \
> +/tmp, if there is no space left the build will fail with very exotic errors."

"No space left" is implied by the context of the text above so I think 
it can be removed.

-very, exotic is already strong enough to me.

> +
> +BB_DISKMON_DIRS = "\> +    STOPTASKS,${TMPDIR},1G,100K \
> +    STOPTASKS,${DL_DIR},1G,100K \
> +    STOPTASKS,${SSTATE_DIR},1G,100K \
> +    STOPTASKS,/tmp,100M,100K \

According to your commit log, this should be 1K instead? but I guess 
this comes straight from meta/conf/templates/default/local.conf.sample 
where the inconsistency already exists.

Cheers,
Quentin

