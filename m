Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AFFC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:27:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web10.9602.1744975659159701505
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TVtROZnc;
 spf=pass (domain: cherry.de, ip: 40.107.20.81, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfo32vSXVyE4oEcq8kY2y42jcyQnn6//ANaat8v0lhgDZtWxp4zdZH8LS6y/LpMRnYhi8SiRaIkNlwSRqHAE/VqnJYi172rCoQ9MlFHTKp4cFP7lvDLDacX3HOHYoRBRLd+28uZ0xauZbAkBZnrZQ6pG/f0nupmtTPRgXmQHweVLQwaAeG2ez/J3Hz6WXo9q1aJC3Hm3DpquzCA5iCyYVm/zjqqU9cK4c2wabHAS3F95CCrObccPt9ZQJIKfcR66VJvbs8MObwBtDHOAEczGoGh1TKsk4yj8HOPs+vmpvaxGxzBvioUl5PvP0GqUC1dZ6+ZXz5oV5k0XQrp5ebAVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoFaZk6ECL4RLq8byu+vE3/71pkRVWtOWiysrl8CfKA=;
 b=R3adk5YJxXwtLgfBxMtRKMaoKMXAPCrvoJCDOesWNMu/2oML4uoYN/UjDvqjNrcNzyBBazkMRQa2/eofJIGI090a5YfoyXIxZNQK5zI4EXJsX/EW66KRfyqk7p+DZwZtkUEVcb4EUYZH6uKh4x/64jKcysJTlM36AfYhcCKNzXOZTzcRW9TKn49RFEJplNsF9RWRi4IoIN+wJ4MFNkG2GN9qvAE+dEXaAn4Y61QeQ3S2vrbSnWcbTVlsJQ/Mt7hSwtl6ARv/NTOFv3YX8ckxj3Ge5IDVIhSdyFs/WfriQqcqxwVmmXDX0tTc0hvs8Sxi9z/dhBBSjrdlVm5F1atbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoFaZk6ECL4RLq8byu+vE3/71pkRVWtOWiysrl8CfKA=;
 b=TVtROZncc5uXJGv7KmpawpW43fuDXf5vMm/21NBTgbBV3DxE7+6fjkcSBdy8xJwvXJhdItfc2fPHvTXNKoZ1G+mNUitBMvcNamvHfXrvP/AAUILdMgmD6z+hbGyUjjFprKY5SSTA5r6IbOSU40/OueogH9GOiZNY17Gnmltun74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI0PR04MB10542.eurprd04.prod.outlook.com (2603:10a6:800:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 18 Apr
 2025 11:27:33 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 11:27:33 +0000
Message-ID: <3a3e69de-3714-4810-b9b6-326d44893431@cherry.de>
Date: Fri, 18 Apr 2025 13:27:31 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [OE-core][PATCH] send-error-report: improve debugging
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20250416100149.274800-1-thomas.perrot@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250416100149.274800-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::18) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI0PR04MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d636fd8-4976-4e6a-fbf3-08dd7e6c0321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bDMyU1ZabFh6KytBYTlHRldZT1ppUDZGS2ZDMVdndDAzbndXTWtjM0Vwak9B?=
 =?utf-8?B?aDJkYlk1UEx2a0sxTTV5YkNUODFsM2laUXJMNmpiRy9CVFROVmJzZWtuOHZm?=
 =?utf-8?B?aFg1YTIxL0kyY0RtcnJmcGRqUjJTb3Q1RGY1UnAyaE1SR0lqVko1THJ4SGZ2?=
 =?utf-8?B?WDdSdWRpaUlya1pEeXluc1pFU2IrSkpwRjNScW12NHlTclNjWDZOUHR5VzRW?=
 =?utf-8?B?UE9mOWFwdTJCRFpVeks5bjhkMHNOVDN1MnNpWDN1aVVsSVVHelFzNTdrTDdu?=
 =?utf-8?B?MUdZekpQVk95NFY5TnlKTzVEMEVyMElPVkN5a2REVzg4aWg4SWRVT3VLNUQ3?=
 =?utf-8?B?NjFrUXBqZDJWbW9GeU91bEpzMXdJdlBxRVkzRW90THpQYTNxZk1wSDhUUkVx?=
 =?utf-8?B?WnB6ZXd3MnloOXRpQUlIdUNySTYwY0JPdEp4R3RrVlRoRE1qblhOak1CRGIw?=
 =?utf-8?B?SGp6dEVlNWJxUUVNeEc1V2JFbUxJNHE3SkFObWlOb1JJUTZBTjJFYnBmbVBB?=
 =?utf-8?B?djh3d0k0WENOdVpLT0pVdDBBczhOVlErdWJSUVdJM2FMdEFvMEpMaHRUS1Qr?=
 =?utf-8?B?YmxrZkk1QnF1NVpFMmJpNEUzc1Q1dXAwVU1CekZ1clNwQlIxWXpZcFIwYVNR?=
 =?utf-8?B?K3QyRnRRdTk0STAyZG5WWWl1ek9rUWY3NmxHVUVFelFSRDdacTlNNGVBVk13?=
 =?utf-8?B?T0dHNG9lOVp3RFBrUjU0eW5tMk9heEo5UHFRZzRlM3dMSlFIUzRzSWhmR1dN?=
 =?utf-8?B?RXdNRkRoamw2SllvTkRlQlp1aW1yZnlOS3U0ODVCWWJGdE5rREJXRXBaazdv?=
 =?utf-8?B?dmxEWjkxR2t4bEViVkJLMHpOUXhsOVlONTFWS0ZkVlhiUlhTd3VtY1JGUldr?=
 =?utf-8?B?VDRaNEp1WHFFc2dCd05hci9jeWt6Mmh3OXNvamdLaXBHcndaQmNFMk9ERlpN?=
 =?utf-8?B?dkFEUnNtUkthZit5b3VpZnJsdVFLNW5DSWlMWTJPWGY5V0ZteUZoNEJiUXhi?=
 =?utf-8?B?UEcrNVFpK0RZeGk5RFBtbDdqNHc1T0wwUk11dmwwdEU3ajE0YjdnMlZQK1N0?=
 =?utf-8?B?TS8vekhuaVpaOTRUazI5RnRyNlFWWjg5RGc4ZFowS0htWjZxZDd6akRnU2hG?=
 =?utf-8?B?NTBuZWpVSzBLYWgxMk9yT0hpeU9sQVpEVkdkRndscURQQTlTbkl6bmVQRUF6?=
 =?utf-8?B?ckRPRkJjODYxdmRjalF6cCtiL3VrVVpRQ09QelMwYzEzYkZ4dVVPU0xPN2pt?=
 =?utf-8?B?WVlmcmQ3dUl5c1QwUXhvRHBxTTc1SVZCeDZoZkpXOGFFOXUvdzlHY1AvZFkr?=
 =?utf-8?B?ekk4Q015S2VQQ0NlVGFCTUdxQUVoWkJaYXMxa24rUmYwQUJMN1R5NmNtUzRB?=
 =?utf-8?B?Q2FqTGxpc3Q0MjZ3dFMzaGV5ZmI3RVJaVzdSV0hVY01SZFcxU3NxL0UyT3Jz?=
 =?utf-8?B?QlBsaWM1UXNMblFZa2tQOVArSHluNjA1T2draVRzU1prUUQ2OE5ONzlkZFg1?=
 =?utf-8?B?TG9qVlJPSXJwbWtBSGpQTWV3VzdTTThnNXZqUzBoYi9MMFBDY2VsbTU5OS9k?=
 =?utf-8?B?K3ZoV09kTGZDK2tJaXJYOXZNS3ZFSWV2dzA2MVJwUjlRS2psQmdaOUhLWEV4?=
 =?utf-8?B?RXFETE5kcHZQcU9veDBucHcrQUpnRTM1dDNFQUtHQWVoWWZINDdDREpCRW5h?=
 =?utf-8?B?RjRNblZvbGRVR2hmTEllVzViK0xaeHpDWm5yS2p2UHBtMndqR1RJUUMyK1BJ?=
 =?utf-8?B?Z2VUOHAzUHYyMHlJeTZLN25OUmxsQk56ZW44Y0tpUkdjVHlMVVlWWFFLc3JG?=
 =?utf-8?B?NjNSNlkyVGpNUGRaOTZTYi9jbFFQTTlGK0txd0pFRzFBVEJucmhoMkwwak1x?=
 =?utf-8?B?Q3p2UUVMazRvZ3lpejBqM3NKeXNaTm9CNytXTzV2OUllKzNKUGtFL0R4QnE5?=
 =?utf-8?Q?vSmaE2lfpVg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTF1TEFVT1QrNVo3b2lTcVJTYi8zakx2Y2tMT0l5ZXptYmlIVEhiZ1VrN0s4?=
 =?utf-8?B?ZTY1VzBVTkNtL3VKWDk4RFdNSGplWkM0SmRkT0Z4ZXFDWXFMMk5qd3ZCVzEv?=
 =?utf-8?B?OHVIbUlFakIyVGlSWHlESmp3VzNVMmpaSDhOeWFsWTlBTVRnMnBZV2xDS2xu?=
 =?utf-8?B?UHBIOFZ2b2xiQ2QxQTVaK250bXk3UVhNYmY3Tktqc3lZRUh6M0R4OXB4MUZB?=
 =?utf-8?B?SDg2RDJFdUZ2NVhxTS9CZGgwcXNKWWZrQWdNMWh5TS9RcDVLV3V5QXI3NnpX?=
 =?utf-8?B?LzhJMVp5NG1lbHgxSytmRU5kVk9rMzBLN2dLcFFBSEg0OFBPZzloY2c4dXBV?=
 =?utf-8?B?eDBENzhZUllGM3l3aW00ckRLOHZnb0I0WlJVMThTM3Z1RUFmMS9nQXA2eXRi?=
 =?utf-8?B?alBMcDNqbTdXRHMrNitUc0VGYitwZ2ZNeTczbnlXQU94cXQ1ZytlUG02QkVJ?=
 =?utf-8?B?aVgrU1ArNi8xM1R6TVM2UlRFUktsVTY3K2Z0QmNORGFiWU13Q3F0R3dNUit5?=
 =?utf-8?B?aGkzelRPcVc5cjVXWUtXa01UTzdDcHdvUFh4QkZQZXdLRDVhbjROV2s1bEla?=
 =?utf-8?B?NEhNMHZKWkY1S3o2S2Z3N3pSVzQ5ZlEyYnRFU2FmR2pwaE5CMWtGdDk0VFdJ?=
 =?utf-8?B?alI3SytaSC96UkV0UTVkbEdYYlRJaUIzRW5SSUJWWGlpcWdUTUJCb0paRGph?=
 =?utf-8?B?MGJqMVA3RllNSERvV01VYkwxM1BUQS85WnNsOHJzYnhvZTA2K1pPRGx6ZUJD?=
 =?utf-8?B?d3ZGL3NoYWNxcG1LS0hVNGlFSmpFMnRVeHJiRnNoOWFUOWdURldJejdPZzhB?=
 =?utf-8?B?aWNwNFhOK3NsaCtNaTkwYXZHcCtOS3lPRzJoR3dCY2FMRXZrUkQ3aWtFU3V5?=
 =?utf-8?B?SUpCZjhyMW5qSFlYdml5VHFmN0JXbTdJK3cxWE5yK3dkUHFONGUyM1dMRkM0?=
 =?utf-8?B?eTBhV2d5SWJHaDBucTFwZTBQMG5xTUIvN3dCRHRQaW0rMlVtaHJKcm5sWEFa?=
 =?utf-8?B?ZUhTaDJNZ21lVk84a1IvWFpmZzUzZmlhOUh6S2J1aGMvOTJyRTQzekQ0RkFp?=
 =?utf-8?B?bEh6ZC9TREx0aWxGRFpUbUs3Y2lTTDMxcDhwRHgvWDI4ekUwQ3Brbmc1UTYr?=
 =?utf-8?B?WmZTQkpNYzNERklXU3M1NWV6SXJ6dnkyWGVDSmtpenFHR1Q2dGFrbkwweDdw?=
 =?utf-8?B?Y1JlM1l5S1lPK2cza0NGUzhJYzkwYXJFRTlESkhNN2d5WC8zVWxOVHNGZUk4?=
 =?utf-8?B?NWMyQU5PWTFwdlh2OWxoSmY1UC9TQU4vT0ZUK0g2dk9lQnQxSHBxeXNobHlU?=
 =?utf-8?B?bzhQdVBLT29UODk1K1JBYnQ2YUNSTXRyR2RZam5TUSs1djdaNkRzejd0SXBO?=
 =?utf-8?B?L0dsU0pQOW9laFlNbmcremlZVngrZk82M3dyazVuSWlVV3BIamRvcE9qaXZx?=
 =?utf-8?B?WGUyQ3dhZ25tOVllWEpEQzJNZ1NscEZkU09kd3AvYWhqSEtPNWJTOFRQSEhs?=
 =?utf-8?B?UW5rWU90Qkd2UXo3cXV3UFNFcStQMlhxQXlIcDNMQTFUL1Z0VEV0bGZSQUFH?=
 =?utf-8?B?Yno1UjhLeWVIRWlUVktRMDh3Wkt5aEo1Vi9LSUpzQWdDdnFtenFMSHhrR2I3?=
 =?utf-8?B?eWM1eTZKU0pDbmMzWkJjby9Memp1MUo0bncxMHJiWWVPTnJtaTBOQnFoajA0?=
 =?utf-8?B?NFBXRU42Q1lXY1ozcEdSSk1reDhXZDZPa1hBNkcwNzVUVThuU2xVRm1td3Ns?=
 =?utf-8?B?VTkxeFozMHhRU3hFZEx3THd5ZGZLNHYrbEpWd1lwWTRtcTJnTnl1QkhrTmY1?=
 =?utf-8?B?ZjRqbldhZ1pvRmp4MkloTGdieFJLSVorL05NN2xXK3JyV3hBTmJsOVpQWTRi?=
 =?utf-8?B?SXNoRFMwTTF1MDBnZG9aYWNrdFZ5ejRzYkpGWTRQS0NEQVZOZmFjcnRtOTVE?=
 =?utf-8?B?OGpoam9yM3IxdTUyNGJ5WmtPcisvQVNOZkdZZk1yRms5dVZ1a21HNUtVNnUy?=
 =?utf-8?B?bzV4amJWamZYUjVMTU1qOHpzRlZrYmFZTG1GQkpoY3lQdlBwaEZJbXBsVWQ2?=
 =?utf-8?B?RkJHOE5uK2FqS3IvRUVBNnNneGpPQzMwVzZSRVBHZWZLbC9yeDdGMUFzb1Zs?=
 =?utf-8?B?eDl6cVY2RW9zSnZ0bGY4bFJFM1VBSGVudFFIY0E4UGJCMWpYWG5vYm91ckFm?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d636fd8-4976-4e6a-fbf3-08dd7e6c0321
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 11:27:33.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSgyEfF+qcQYJjVYAG8RXsw6kejxv9HOjqp+ey5sZvy+VrZHv30qD2/m4OvInLuxHO2isV34y18S4F58DHjKdfzPmR3FqvhMnzZqNvgOlc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10542
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 11:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215127

Hi Thomas,

On 4/16/25 12:01 PM, Thomas Perrot via lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
> 
> - add a debug mode
> - print the request and the response when an error occurs.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>   scripts/send-error-report | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/send-error-report b/scripts/send-error-report
> index cfbcaa52cbc3..cdc1dfc5613a 100755
> --- a/scripts/send-error-report
> +++ b/scripts/send-error-report
> @@ -6,6 +6,7 @@
>   # Copyright (C) 2013 Intel Corporation
>   # Author: Andreea Proca <andreea.b.proca@intel.com>
>   # Author: Michael Wood <michael.g.wood@intel.com>
> +# Author: Thomas Perrot <thomas.perrot@bootlin.com>
>   #
>   # SPDX-License-Identifier: GPL-2.0-only
>   #
> @@ -22,7 +23,7 @@ scripts_lib_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'li
>   sys.path.insert(0, scripts_lib_path)
>   import argparse_oe
>   
> -version = "0.3"
> +version = "0.4"
>   
>   log = logging.getLogger("send-error-report")
>   logging.basicConfig(format='%(levelname)s: %(message)s')
> @@ -140,13 +141,25 @@ def send_data(data, args):
>           url = args.protocol+args.server+"/ClientPost/"
>   
>       req = urllib.request.Request(url, data=data, headers=headers)
> +
> +    if args.debug:
> +        log.debug(f"Request URL: {url}")
> +        log.debug(f"Request Headers: {headers}")
> +        log.debug(f"Request Data: {data.decode('utf-8')}")
> +

Why only print log.debug if args.debug is set? Isn't that an unnecessary 
additional check considering the log.setLevel(logging.DEBUG) in main?

>       try:
>           response = urllib.request.urlopen(req)
>       except urllib.error.HTTPError as e:
> -        logging.error(str(e))
> +        log.error(f"HTTP Error {e.code}: {e.reason}")
> +        log.debug(f"Response Content: {e.read().decode('utf-8')}")
>           sys.exit(1)
>   
> -    print(response.read().decode('utf-8'))
> +    if args.debug:
> +        log.debug(f"Response Status: {response.status}")
> +        log.debug(f"Response Headers: {response.getheaders()}")
> +        log.debug(f"Response Content: {response.read().decode('utf-8')}")
> +    else:
> +        print(response.read().decode('utf-8'))

Same remark here?

It's also a bit odd that the same info is going to be in different log 
levels depending on whether debug was enabled or not.

Cheers,
Quentin

