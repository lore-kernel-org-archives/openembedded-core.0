Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8471C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 15:09:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.55])
 by mx.groups.io with SMTP id smtpd.web11.54474.1724684936389362713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 08:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=guTWryNj;
 spf=pass (domain: cherry.de, ip: 52.101.65.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGh9PDdfSbaSKFoKo9Gn4SlVhhoRlMj3IeI2tjG9YzMdkMsNDUsWaX+rhTN1EFSQpRBDbB4Q8b/TzN0sjBkzSZmBbSISNhOMZa465X4qLwRP67pRDMXMgSW1mh+EjpygxmlIicSHXQEypQrvXYDaT/pN3cqqVmGR6hXJBdOI9igTIpIWnVdbA8dE716dC6x0qCB5mlNohQ3DUuO3YANO17gM2M3Qj7vwfertISOa+xqJtvDGOwcPz2qWD4STIqcXWhvQVlmVSha2p1a9s6mLbJz5E2/FRV9JUYUUTKAFVIVPDU/y6rSpivauEYoVMjijUd3BzZ/6IiW/34FYzrXHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boYlEofmvY1sk5DdNEnYtPsqPcHbdf/ki7vKuZ7Zkfg=;
 b=wrhAcWT5eS3MX5JZ+EuTs408hOPh3CodyrNMVUorMBfppe/aaRm6Af4paPTZma3v5nMPlRa2jblbO+pgAMZTn01ajQh/RE4jT4kGDRXFb3m29hwNQdoZmLy+trnOb0JzI/q8G1Nx0zgpBVa1HwnkT4tQ8HstieSHOqy/A8O99awI6cZlHoMZQXRaLaYJ2C2u2h/LKaE3NkAR9g954sFIw/gDQJ3+MGzUAt8QbOezeeQVuCqpePKtIxfscKuonF+Nn1ppxhY1+Q4pornLMArAqKi0XDj1vgzwKD5ogFILKxkNkQsiaZvx2fDASzX5j31aZ7XG5mfgaW6k6xqYnQqT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boYlEofmvY1sk5DdNEnYtPsqPcHbdf/ki7vKuZ7Zkfg=;
 b=guTWryNjNJfj0D2NNyOX77fPuMyiZnz2Zdtr2ds8QGN5uvrlGaR5p5k+nZP3h6A0vaj0EJJ+pCMg33/VoVTSChnxzjN7ow0qawpSFb7JawYqWVadfx5ltdB5nwPfR+aHdYBfJl4Vvxxf0aJsGTszCAibsobeBAPMbP+D+Nen4WE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB9953.eurprd04.prod.outlook.com (2603:10a6:800:1d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 15:08:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7875.019; Mon, 26 Aug 2024
 15:08:50 +0000
Message-ID: <26e49092-0af4-49c3-8a70-b67c4c8ca07c@cherry.de>
Date: Mon, 26 Aug 2024 17:08:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] linux-firmware: add a package for
 ath12k firmware
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240826013909.353920-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240826013909.353920-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB9953:EE_
X-MS-Office365-Filtering-Correlation-Id: d80dadec-96a8-403d-7758-08dcc5e0fdf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c3MzaTczLzQzWWdjYUlYeUxRWHZHVnZjclFWOVNRRDI3M01ocTFRcjh0Q3dM?=
 =?utf-8?B?U1hKL2FzU3QxVE5Da3ptRE9KQy80ZU5GaVZON05YQmU5TkZJSjIzRmQ3TlNZ?=
 =?utf-8?B?ZlptQmxMMThzbjgvVTRiTVNNdXVWYjM3anB2WUFsOGl3RHUxRGRUS0wwRXVV?=
 =?utf-8?B?SDV0c3RlaXkzUnlIcVdMUmpsV3hsTjd6d0FXV2V0cmdQaEw5RGlwWXVLQWFL?=
 =?utf-8?B?TU9DZVJ3eXdWQ2R6bU5VSWZPOEpFTmNjWWFYN2txbDRKL080WkJEOWpYSmpw?=
 =?utf-8?B?R2RXVERBMDYxdTVxTzY3N2dxRDVReVBXZWxLOUg0RzZ5OTBKbzBwRUFua3hy?=
 =?utf-8?B?TFA5RTY0RmhBR1lUQm4xTG03V0UvbE1KQmNHRTZHNmduMXZ2TzNwZjJHYXRY?=
 =?utf-8?B?d3lpalpVY3VDUHdMZGVLSnZWcFZNRFRpZlVSajU0Z3hzWGdobVNWc2FscjE1?=
 =?utf-8?B?OUZlc3FPMmtCWjdXS0VWcTlNRW91bjNkNHl1Mkl4dTFWeUY2RWZRbkgvd2p0?=
 =?utf-8?B?ejNvdHRsd2E4RlFxRG9rVFJ2UkNFVlRiT3hRU05vQlNlclpqbWhnU0Nka3Yy?=
 =?utf-8?B?dUQvUHdTMXhady9MQzByS0dYdk9Td1pOeDMwaXhCT0FrRXZrbFRNUEtVQitI?=
 =?utf-8?B?WHkwb3I0dGpSVnd2TURFYTdpYnB6ekFIYjhwcy9mVklkYUM5TXc4Z1dac1Mw?=
 =?utf-8?B?WGF6ckxjZzQ2b0JrYmpmWWJBT3RISGkrQUxrNm01bnZFNDhwVVJLMjNVR21I?=
 =?utf-8?B?Z1RFcE1abEVFNXVnVHFPSFdkZVBkcUZLTXQrV0ZJZEdFT0NHRmN1cEk2YjFl?=
 =?utf-8?B?TE05OEN1N0h5VUl2MFk4YTFEb2tVTklvcndhZUNMOFdMSWlISGdTSGVYaE92?=
 =?utf-8?B?TlNobDBPdUMrdFVRdDJKT0pnSk1iNXpwYy9uNVB2ZE1SRnk3V2pWRkVndXpD?=
 =?utf-8?B?VGhoQzFQY09kU0t3U294cXY5YkNlaFdYcTBBdklhcG5BNW1uSS9PVEp2WCt4?=
 =?utf-8?B?Z2xaT3ozNVRZbkxCN28weDc5YUUyV2ZscHdMOHZndU1yQnNpRHlSRzd2UTFo?=
 =?utf-8?B?blVRNVNwTUJ0MWltbUZOVkFxRCtGYmVmUzMyYnpiczRtNFJYeStleFRYYnRJ?=
 =?utf-8?B?d0l5TE0zUWVYU09yd2xkVUF3N01uZWlXNlcrTEJXTjZMdUtRSkF4MmxVTlJU?=
 =?utf-8?B?ck8rNTZjUXY2aWlxK0NJSXpYMS9FTmlXZm9maTAxYzluWVByeTQ5VjV6U0l1?=
 =?utf-8?B?L2ZjMDRwMkUzQzJxNjV2Z0dvbkZJNmpHN2drYmNFaFRtMWU2bnVDYkFJWitZ?=
 =?utf-8?B?WW1JeVR5YU5KTWJKQzRnRys0eS8ybUZPQ2xSNWxSNXZjdHVoaG5PaFR0cjJJ?=
 =?utf-8?B?QzRNaUpycnN0d21YSUk5dnV5dUdnS1ErNndJU1BScDBncnhCc2EzWG1iQ0d0?=
 =?utf-8?B?Tit3dHV6aERNQ3BZd3B1TU9TbjhZQ2lXbmkxM2V6RjRGQThDK1gzZ09QakhS?=
 =?utf-8?B?Rk1qK010THhDKy9LaGl2RS9BanhNT2RGdUJtaHFiaGw0MzhBRjdjVnNXbUJ5?=
 =?utf-8?B?YTRjaWhBOGZTYW9ncGkzQy9ua1FCcWQwb05vZnFMbDZYbnp1YTBYem4wWGQ5?=
 =?utf-8?B?ZTJ1SGN3VDQ1RFVwbUh0aE5iZGFrdVB2NE05RlZUMnY3dC9YeEpwb0JyQkRm?=
 =?utf-8?B?TjBiUm45cTNtVG9aWFZQSHdDM3hhK2NHWFBjd3hvUVV4SnVCTDFDUGJZQUp0?=
 =?utf-8?B?MUg4VU15blI3NXpFTDMzald6ZzBsNWFHVnljZDFCNWcvMWV3VmZCQlZvNTd2?=
 =?utf-8?B?ZC9zYmMwaXBwenJsV0lOUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTNHRmJGU1R5aDZoL3BGMzFpSmg1eEQ0RXNVOGhhQTZlSTgwblBxRzdKUU4y?=
 =?utf-8?B?UHoycEtOaFc0Q1p1MExTZ3ovR2FMeCtLTkxoOFM3L0ZGOXpGVDRzYU1FeThX?=
 =?utf-8?B?TDlXdkdjUTY5VTRhb2dJZEtQR3RwN3pXTnB5Ti8yL0tyK3RQQ1ZCbEMvVmNw?=
 =?utf-8?B?R2pzcEVsWUgzRkFJT24xeWIrdnYyWTNHL1dtWnBiaWg3QUorL09OT0Z5TG83?=
 =?utf-8?B?VDN5NWhIaHZ1Tm02c2FEUjFwU0RsNVhzeEFCU1Y2V1BqZWdhZjR2QklkWFpD?=
 =?utf-8?B?eGJwNEE2dmlTYWVRYldxRXNqUG9RUHdONnpyZVE5QjAyNis0UFhMMkF4b0NX?=
 =?utf-8?B?N0xOSGhLdWp1Qi93YzVVMkxCTEM3U1ZYMFRqeVBuSGN4aERFV0llY2twVFBC?=
 =?utf-8?B?eGdCU3dPK2oramRzU1RWVng4RkdtWHJzTzlXRXJzbHY3TklUMWhOOHRXV1JX?=
 =?utf-8?B?L3NUeVU5YmpRVy9GWWpQYitRT2FYaDNzUUxScTFmYWxNTi9aalA2a0U0ZFBK?=
 =?utf-8?B?UlBxYmw5RUNUcTZnNnNDZ3h1Sk9OVGczRlpWMXV5YUJjNXZFckNDNUx2VTR0?=
 =?utf-8?B?N0pRK2hhbE1MUGtZQkQ5bnlyR3FiTUJwQVp5RVMrc1UrR2lmczNaSHRYMUVz?=
 =?utf-8?B?UHora2t0T0llUWwwRStVdUF4c01oemQ3OTdjNm5WbEFRaXNYNnVmMlQ5cUhk?=
 =?utf-8?B?cUJ0cWJXZGxkMTd0clZPZG1yYjFwK0hXazJKUjdGek1FandsdDdoc0hWcWQ0?=
 =?utf-8?B?UHhXcFpSMHNTREhUVGc0Vk9nTFFtbmNTYm8vWmJ0OUJYdGZSR01YUWlOSjhY?=
 =?utf-8?B?QXdQaGNNNkRvRlVHYXVyZHFONVF0V1JvbFlUYmN0d2U3Q1RkZ2hnRVVobDVI?=
 =?utf-8?B?RGlBL0RQMVQyMVlOZGx2V3QrLzEwK2NTcXRoa1lpUTV2aEYzWDdQdVJueTFn?=
 =?utf-8?B?YVZ2VUpNVWEvN29nNERVTFhTZVpnTlhDcnNJc3J4OENDTlRiTC9HTzA1MklW?=
 =?utf-8?B?NUIvM29IR0oxS0xhbGlQWWUzRHJCTkN4WGI0ampOOUVNOTNyME1NVzd6ZlBP?=
 =?utf-8?B?aWtFSko1SnkzOEtwMDVtRGJaRmIzT3pNVm5tWHNwUGlnWGp3REZpWW1EK09U?=
 =?utf-8?B?aVNNbkNOTXV4TUlsclZEblNoMWkvQnFEeGJYdnB6cDZpT2xJaWJ3ZkJJSUdn?=
 =?utf-8?B?OHRiQXFQbEJPRDlnSmJlV09aVGlvTXYrMllZbXZhWVhDcjBEemN6QVU5ajlk?=
 =?utf-8?B?RUNQSElmanMzK29JUWFaYnlMajRiNWdod0JUZjdTemd5VUJ0WnJkeWR6UHJD?=
 =?utf-8?B?WEJBZ1d0YkVqMGE4SGgxd25Ed0VYUmUxNFRtT1ZvRzRYeGZBQk8yTDl1aDJB?=
 =?utf-8?B?czg0czBIeVZ2VXZoekZmTlNIUllxTExCMDVuUnFPWEhGRURGTmpoT0JFalBI?=
 =?utf-8?B?MHp5SU93d1hPMUQ1MUNoVUxKTno5NEovWjQ1aHVVK0JBQXJjclA5QzgxMmlL?=
 =?utf-8?B?ZzJRbWMvN3hSeGlTeEdHQkJKRXRCUlQzSi9SRDd3OEFRTHJNdTFpZUxoZVJE?=
 =?utf-8?B?Z2FVcTAydUpDek52U2tqelQ5WEk4TkZzTExUQmdMQW4rUCt4alNYdExzNjhZ?=
 =?utf-8?B?STVrNlViR1dxOHQwNDdvendjLzJRT09QQUFJQVR0ZW1HZlAxVU5FYThSbllj?=
 =?utf-8?B?d3N6ZHVDUFl2WmlMZ3ZsUHlyYU4rTFNzcHpKNy90dkcvN0hncEZxdTFQVWx3?=
 =?utf-8?B?WTBqT2h2NmxtWUpyYUx2a0IvMVppUlBPVHZvZUlaQjM2Y0xtU1U2OXppRWgr?=
 =?utf-8?B?clRuVGhJVm1Vb1FvZVVaeTZVYmJQTjU1VXhLMnR3a1dINTFiRFhqR3YyUnN3?=
 =?utf-8?B?YmY4clFkL2xGVXJsMGgvY3hINVVON3VGTGpvNytjSTdHcHJLT3dVMGwySVJR?=
 =?utf-8?B?RnFmeFhnVFIxa2RJSkUwN2FPUTVEN0dNQWlwTEE1dEJOT25WVjI4dFdoTW55?=
 =?utf-8?B?RmJseTkwb3ZRM3BPUWJoOGdXRkxSVkczZmR6b0s0emdNYUdDcW9XcHVEUURn?=
 =?utf-8?B?NHgwb3ZkZUUzQmRmSWthZi9pYlJoK2NGTVV4a3d5NndXOW5NelVSODBUdTI0?=
 =?utf-8?B?U3ZickxweU5Tc29CaklteFJTNEdnd2tqU1dlbWNPaXdZcHJBdkRLdElIVjJF?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d80dadec-96a8-403d-7758-08dcc5e0fdf6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 15:08:50.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDi6wTtXg4cR+NCM6aP6Pq5ibVapVZYzbAO/yH0xd8Q7VQpfDXt5O8oj+E92Ng6FPHIxd3VjqB/RXXfl9wM4vIAmOT4I7nt3NRWP/8lsMCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 15:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203755

Hi Dmitry,

On 8/26/24 3:39 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the firmware package for the ATH12K module.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../linux-firmware/linux-firmware_20240312.bb              | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> index ff79bb9b33c6..53851b58fede 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> @@ -322,7 +322,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>                ${PN}-cnm-license ${PN}-cnm \
>                ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
>                ${PN}-carl9170 \
> -             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
> +             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
>                \
>                ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
>                \
> @@ -487,6 +487,10 @@ FILES:${PN}-ath11k = " \
>     ${nonarch_base_libdir}/firmware/ath11k \
>   "
>   
> +FILES:${PN}-ath12k = " \
> +  ${nonarch_base_libdir}/firmware/ath12k \
> +"
> +
>   FILES:${PN}-qca = " \
>     ${nonarch_base_libdir}/firmware/qca \
>   "
> @@ -494,6 +498,7 @@ FILES:${PN}-qca = " \
>   RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
>   RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
>   RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
> +RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"

I don't think this is appropriate for a release branch.

This would break existing users by moving the same file to a different 
package. This is fine for the master branch, not release branches.

Since I cannot see any firmware/ath12k paths in any FILES aside from the 
one added in this commit, I believe this directory was caught by the 
catch-all linux-firmware mega-package? If that is the case, then to 
still allow for backward compatibility, add the following:

RDEPENDS:${PN] += "${PN}-ath12k"

so that anyone installing/depending on linux-firmware package for this 
directory will still have it after updating.

Cheers,
Quentin

