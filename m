Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC21F3C9A6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:56:14 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23599.1771948568720242592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=D+yZ+x+8;
 spf=pass (domain: cherry.de, ip: 52.101.72.18, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoGDVs6sJvk3NW/UkpRrR7q9tzfHUuV6jFTc15ucqsjctAC08EITHee8k5FBhbg20pu7HUEZLVcHVSQpJ1Gqi+c7SZL5LoGqNyO0JhkTC4Jy0W25WyqgzaXh90JzpbIo+iYmbK8DhMtCUVSPZ7ToV7++kW6HugBnGjsDsrGju6JlkkIfpEN5FX5CDP+xKxbvYY1pwAa7Iq2E+/YHKyZ45puljNM1bhZ6ul+DbM9hqmI9odYuOWIh7gfJkcKtWzvElZNEms5ZldMitlled1nwv8cXDXrsK3vfk7DDJzUQ9uyReADaQFXOj46RxqvLeDOzDefA2NVpl9Gl2jDXOIf1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNFrGnSC+MUDEaDSlcQUk65IuUQKVzqERo0Qk01bf6w=;
 b=aIfmuDSGCTONSMAYoVcTe3i2lu67z4fYcpdiqTx3e9BQJUi8pTYBFXHh5j9XQP+zpVPqAnYFVd2C/JnddzmWu6ptT5wP4Phy+6050pUs05ppGIGXF6CovNeFHQfr0ftmfSXZzr3GsJdIOyOY4SHt0hJv6/wApIgZc0NWCtBsndrSW8GJ7G9urIp1LbKuqgQG9DjM/HY4dpkncZF6V3JLiTwxrF57BFBkpvQqZrVBF0fezZhNouJR3EElwqZDAWCrdgQEF/Mxt40XYl4Dm8wMcNWmOnPOfDbXVRexAfARU5s5+tKMKycL3/TQk6rjP1nxpaRG/vCKI8uAj+RSptAlhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNFrGnSC+MUDEaDSlcQUk65IuUQKVzqERo0Qk01bf6w=;
 b=D+yZ+x+8fX1cT8/4PdwObvD3ux4YEsjBU7L0q3GBH3bfPQAA+Pj5n0nep5Rm26OYzJB1tx9l+mBGPul7Hr3k3cbXYyFyVFRZXvIN1wLIg1JfO96xhlGkLfF7cYb0OtBRKeMLm63afnnygfbAr4x8RrT6GIEsMZ5eu4jPHesK7vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:56:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:56:05 +0000
Message-ID: <63d2f849-77a5-41c4-bef3-dadc6b1dc946@cherry.de>
Date: Tue, 24 Feb 2026 16:55:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade from 25.3.3 to 25.3.6
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <20260224030657.123463-1-changqing.li@windriver.com>
 <DGNB3UO240VX.2N0QPFPWP24JB@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGNB3UO240VX.2N0QPFPWP24JB@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: d6aafa46-5ad8-4477-320b-08de73bd3772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0VobWMxTnhFaGRhUjFyNElBZkF2OG5xUVBZRnNSQWJueDhoOGVkaTBOdzR1?=
 =?utf-8?B?Sy9JS2JFaS9keFovZUU0ZkYrNksrQ0UzRVBHTVl5alRtTWVMZ3hvSnA4M2hH?=
 =?utf-8?B?Q3dSdmtidnd5Wmc5UFBEWjkrZDBHak5EUng0SFFQenVCT1BreGhVY2M1c0pa?=
 =?utf-8?B?SFEwY0EycHBkTWx4WHJNNFViUjd0SkF5NFBVeC9qK25PRE9hY05FUjNKMEYx?=
 =?utf-8?B?a1JxMEV1c01TRVFNRm5rK2hMemRCNWt2d2JqMHJNS3F2SHh5OXV2WVh5Z0VW?=
 =?utf-8?B?Qyt0djFtV2ZvNFN6QVJnRWgzUnV1Z0trOVd0NjFCbk1ESUwzQXBIckJ3TXIv?=
 =?utf-8?B?ZTFiSnVRNjBsUnFjSlRKZ253K20yOWsybWp5WnVTdTFGcmlaMmE0YUxWcE1O?=
 =?utf-8?B?ejhYcmpNbXY3ejY2Wm8wVzhlaUtNMXBLMVU4RGlkSGJ6Mm9PdVRLa1ZnV3dE?=
 =?utf-8?B?S2x4RnNnN1l5Qm5qNSt2Z1pOby9QMkZOZWVSU21vdzJaaVAyNWpsamwxYlo5?=
 =?utf-8?B?cXlxMFhselM5bWhqRzBQUW5ZTldnSHplcXRER3hTdVRvRmZrNTNXVm1mblRD?=
 =?utf-8?B?NE9lNTlpTHU1d0tXM1BqeG9rYmcrcERoVTk0UkxscVlhWWtvbzRUUkpLeW5L?=
 =?utf-8?B?OStneGhSbWdaN3J5cVN3MnZyTDlZOEo1dTlnQ3lNZE5JS3J6R1VGU0RLZmtV?=
 =?utf-8?B?a3VlcHNJbjI0cjBEQVFNRjdEWmxuUVZaTHB3UzFFSDU2ZlltbEhnb0tCRTg5?=
 =?utf-8?B?SmpBVndVeWlvYlVWL1lOcjhINmgrMXJyd3hUSG9sTU91b05ZdGE0blozVWdW?=
 =?utf-8?B?Q0s2RTV2WHZrUFlBb1pWZVBSaGViOHBQWUNIeHUwR2ZvdHdJMVp1YzJaRit4?=
 =?utf-8?B?dVZDaTg5ZTZheWI4Q044bjhWQkY4SU9JeFh0MHNRSEhxSEppSUVwVXZFR1dO?=
 =?utf-8?B?YTZGUnRVczVqZ2QrRGlXUXBFZDRKTXNkOUhYdENGcmVGRUcvTDUrVUNlNmlK?=
 =?utf-8?B?a3MxcUN2SGV3YkNVMVFCYlhSNDJKS2V1RlhPTDVVdC9NNDBpVkNqN3BWK011?=
 =?utf-8?B?ekpJODI2M3d2TmM3bFVkY1RyVGd6RWR1bVZ2b3A5OE8vN1dWWnpOdjE4S3ZT?=
 =?utf-8?B?S29hbk5yL0NwcXhkWCthVGpmODlDREFtaTVNN21RdmMraWtneS9qV2hpb2pZ?=
 =?utf-8?B?a0U0NGdyWFJKSGtGUjdQdklrK3BIcWM2K09tazhsdHk2WXlROTJ2SjBTV3BL?=
 =?utf-8?B?UGZJNVF4ZWgwWjZJQTg4SmhXNkkwL1YvTERNbXNVWndOVmpXYm9ONDdlUWpO?=
 =?utf-8?B?alQ4YTJTNEF2TjNaN2VST0pMRHdYTm5nMWhPcFI5cmxzckpLMWIzOENhVVhO?=
 =?utf-8?B?L1QxOWV3RmpLWTVFWjJ5c29oeUsySStLUE8yWi9ISk4ydENOSjMvWmF3ZkV3?=
 =?utf-8?B?eXRHZ3ZyTi9HZkdRZGdQcnE3T3VEQ082SVlBMGs1cGp4aG9KTFhCVS83MCtY?=
 =?utf-8?B?UFJIVjlENW9aazNyY1VXcUtXY20ySEY0Q3U0UWszM0RPWm5iUWVsTnZPdElz?=
 =?utf-8?B?Q3NVd3A2ZWRzSWN2OFJSTGxxcWQvNHl5RlZLSXRvYm1uc0kycFRhSXYxaUtI?=
 =?utf-8?B?TC9QMHh3UmY2ZzB0MHF1Q0Y0UG5ISHRrdDRjeGFCNC9IQVd3QWkzbXQzVmND?=
 =?utf-8?B?cEFVOWJMWGkwK21yeDBDZjRCekRKVXlFYU5JTGJUSkUrUUhJMGlIRUQzMFcz?=
 =?utf-8?B?eDVEUGJScDNjT0o3aGxEY3hoMVhpSmlPK3hwV1VGNUJsU3lTaTQrWkpWWlJi?=
 =?utf-8?B?UzNMODAzQ2ZBNUxnbmkxaFc5TTZtTGJlRmozNDlsZ0kyaWdISW9CSGJYam5y?=
 =?utf-8?B?eDRvK3JocFZEZXJ2Vjd5bHZYYVhTb1RnRVplaENJVm1zUlJ1eTJxNW5XcHJk?=
 =?utf-8?B?eWlaNjNsdWdFYUU0Y1YvcTVJMDdKM0UwcHA3N0pjZHNCRVladlJKeGtGcnk3?=
 =?utf-8?B?b2xWNkxtNmxGZVRHN3BBZ2FWTGNGdHozcXY0UGo3ajZtcUpJbnVvVHlVMEVE?=
 =?utf-8?Q?cVFac4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bG1yM3BaN3hpWDZaQzQxb1dPT1JFZUo2TUxhQVBmZ0QzZUJ3STRjNnVKOVh3?=
 =?utf-8?B?eWlsRTN1Z2FTTC83eXd1VTNGdFFlZlB3bEFKc1dOaDlKYytycEFRZXVEUWRG?=
 =?utf-8?B?TTNmSU0yWWh6aE1JRXExeTJYUFNIZjJlOWE1Y2lkS1M5OXVGZ1BwZzVPNTZC?=
 =?utf-8?B?dVdkSU9kdG5hcVdFQXRibjY1K3R6RjkzOVRUeFRQMFBRNEE4Zk45U2tBazJ0?=
 =?utf-8?B?WkFwR2FzTjE1RWNPWGs3RldBOUl0RmsvRXBTeTFXamd2WDYyNklmYkFmbElj?=
 =?utf-8?B?VWtaV1BNTS9IMEQ2elI1K0ZQR3ZIQ3NhK0lXSUlRWnNPYzNYcG9FclVQNWlO?=
 =?utf-8?B?QW5oSG55aXdwOXNPQ3FyaC8ydUNuOXE2VncxS0lUVlo3cW5HVVQxbmhoM1RK?=
 =?utf-8?B?SVZVaWVlRWJISWZSR3FsQ0kvRWl4Rnk5OGFtL3VIcDZRV2szbit4K2RyLzJX?=
 =?utf-8?B?Z0NnbFhYd0h6K2taMStZY0IyZnZlZDRrSkFFc1I4WGY4NVlpRTNNRVRoUEg0?=
 =?utf-8?B?cDlXc3pmUk5ZNUhRbUEwU2JyM2xzQU1ZalA0QlNPcGlTRC8wZmNLVUFVTG16?=
 =?utf-8?B?NWIvTXBTUW5LemVtREZpZUZhRmQxRmZ6Q2xGdEVrZlZuZTF0SUw0N1N2WVFR?=
 =?utf-8?B?UzdmdXA3eENEc3pKdTNJVzZxZEN2QlJaeCtyMzNWZS9DaVQ5RE82NDROa28v?=
 =?utf-8?B?MEgwZTg2OThiSERmQXNLTFJyZjcwdGFZVWFBWDBZRFhEMWVZRUhIWEQrQTJZ?=
 =?utf-8?B?L2hiZVJGa2xUSWs3TkxpaHVvSDhnUnNjcGIrSjF0blpBaUhnNldhcEJZZlJH?=
 =?utf-8?B?Sm5NTGJDcE5nU2hFSXNOcTdzRkVuV09oLzJINTU4eldMalFjSURRdmxSSWxp?=
 =?utf-8?B?d0cvN0hYWUlpRmpDbFI5T1hnYVFiU2pDL0kyY2ZLM3hNN2lsTENibzRwMDhP?=
 =?utf-8?B?c3hqcWd4aXMzK2gxM1p5UXlSOGl6aXhNWFZDQ1BrUXQvSGZmNVp3dUNxSW5C?=
 =?utf-8?B?Qko3NVpTS2dpQk9FWE8xTE1KeERDZCtxOEo3eUxZWEZ2WTNTczExbUtuUTJX?=
 =?utf-8?B?STA5MERIZzlFbVRWOWs3K0U0T1FoZGRyZFdMTlcvUDQ1YnR0ZnY2UWlOOWZM?=
 =?utf-8?B?T2RZYVcxRGpvd1k5SnZDME02U092bld1aFMwaCtkTUxlTzlnRWoxeGNYdnQv?=
 =?utf-8?B?dFl5MmlNMWErNzcrUGMrMllXZi9BNjQ1bmo4dHBvZ1Ruc3dkOGxMV2IrbDh2?=
 =?utf-8?B?THlpSmJ2QjBINFFoaUVWaUhsYnBGMjBGMGxTRUZTa3NEUFhWRWx1cE1FTUpr?=
 =?utf-8?B?V2JrTUlDZ1RwSGUydDdDek5nMDAzNUxML2xwMG02TnQ1TVBSQ1o3S2svUXBG?=
 =?utf-8?B?V3NZNG5SMmg4TGtxSGpWNm9FcDFadU5lRXZDY1c0T000eWpYZDV5RUlza3lZ?=
 =?utf-8?B?YlllZk1jTlRmZXREcmcveVdNbUFKNHNKeFZKaVZlMTY4VmVYU0xJdFl6NkN6?=
 =?utf-8?B?LythYzdOd0ZDVVg0LzBZUGhJbVNLM1IvQzBxc01VOEFYcXFzeE5tY1JJUWF0?=
 =?utf-8?B?aGp0T082Y3RRcUZnajlvdEhKcEtnZ1B5MFE3Zkloc3VGQm4vYU5GRUd1ODRS?=
 =?utf-8?B?VFJlL1QvL1cyQVBIdFN5a2UrMGxXUG9nTUw1Qm4yMURweTlMN2Y0RGcyQzFv?=
 =?utf-8?B?T2R2ZHdHWHVxVWNabVJYR1dkd3pqUWRqWWJNVFRKaDVvZnFvTjV3NlltMGNu?=
 =?utf-8?B?WGtDNmJIOURxNjlZS1FHOTZ6dDgwaTVtaksvRFUxUnNmSUtEMFM5YmtQSCt6?=
 =?utf-8?B?UEwzOE9wclovNWNtbitmdmJuN0JXN201dGVwVW50TG5xd1h3Z2lJMWlLblBw?=
 =?utf-8?B?WWQrSFZ3Z3Q4Y1lFRHVwNmN5cWFyMjl3bnhtdWJVY3VHMmFLYWJ2akU4cjJN?=
 =?utf-8?B?NHUycDUxaDA0M1Z4MjZBMFdzVnhrcVBQcnVSTjByZFA5bTRyTFE4cTdSdEQ2?=
 =?utf-8?B?K29tV2NzRUdCSG5HdWlPdnNPc3IzN1oxTXRwaEl4bUUzS0FFMzVVWFdtKzFw?=
 =?utf-8?B?bytUV01odTlCSzBvOWRFQVBQQlhBMlJtUGs4a1IrVlRJQ1hVMzFvVHU5blU2?=
 =?utf-8?B?aTlFaVRybFFBU0FRSC9oSWZ3ejRsZmY4anlwaVJBN2xjZ3Z6SlJaeHRyS3li?=
 =?utf-8?B?MThXdnl6TCsyRVlqbGgvbWYvOGJXODJBalNVWjVqSEJ3elExU3ptemFKMVV6?=
 =?utf-8?B?RmUzZmJoSTRxb2FwM0l0YS91N3NvQllSbU1yMnB0dzladElqbjdLRjNrZVIr?=
 =?utf-8?B?UWJqSE5VVTl3Sll3WUx1NXVOdkhyOURkMm40a0IzY2FUL2sxa0QycjlveElp?=
 =?utf-8?Q?xGPoDz5GmCV7LoZIR5adFz/aV9fKzPxa4Ch3Z?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d6aafa46-5ad8-4477-320b-08de73bd3772
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:56:05.0163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPX3BnAS3H6eWcoWvZvLLZ8WSq0NeTp9fpYwaae9yOmEX5XUl4QRNtD5waS6PsXOfZoN3PHpVOotjK0h4LUNQVGmdGYg1d80ofLXkRzNxk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231874

Hi Mathieu,

On 2/24/26 4:44 PM, Mathieu Dubois-Briand wrote:
> On Tue Feb 24, 2026 at 4:06 AM CET, Changqing Li via lists.openembedded.org wrote:
>> Release Note:
>> https://docs.mesa3d.org/relnotes/25.3.6.html
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index 1607fddd4b..dff1a66f7c 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>>              file://0002-rocket-drop-file-names-from-the-generated-file.patch \
>>   "
>>   
>> -SRC_URI[sha256sum] = "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b"
>> -PV = "25.3.3"
>> +SRC_URI[sha256sum] = "59217efeac3b64e7ced958324b9db7494f1e0741aeb22d780276514cc1b8f206"
>> +PV = "25.3.6"
>>   
>>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>>   
> 
> Hi Changqing,
> 
> Thanks for your patch. I note there is already a message on the list
> upgrading to 26.0.
> 

Already merged in master, see 
https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/mesa?id=fff91e17742c2045468c504f892e82b3742f28bb

Whinlatter is on 25.2.x so this isn't relevant for any stable release, I 
believe we can simply drop this patch entirely.

Cheers,
Quentin

