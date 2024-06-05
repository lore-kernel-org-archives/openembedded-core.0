Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AB3C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 12:25:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.105])
 by mx.groups.io with SMTP id smtpd.web10.13900.1717590315335689354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 05:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IEqJZTZi;
 spf=pass (domain: cherry.de, ip: 40.107.21.105, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RO2336NgCkjWdOnf2QhGNd0MWCUGVIL+FLTmMDKWAM8XiEJMUs8hj9fKH8GMYVSB9y/j71qZXD/165HNWnHjdtPsz2rYL+1j5tRbJzq5k177T31lrXj/4D9tWZdP0F7DfHm8tqLoAI+02GcDUQwohLrPUjbg0/fN7Ry7q7Jh1683IYs82JsdZwPbY9VaMv641jzlKBcTsdnk4qLh7m3w4wqYydDCeQ3OAcGFupsxLhwMl4r81PmCSoPAvzOczWao9bJyG9BljUXHb1Ce2Tooi8reVFWCAF17Cii5O6Wr2ydtSV6kdkDIhWDZolTwwtkTafVHl0Q2nwA/nwP/UNiS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnHrcPNmZn7rEyjsHGxdH4LEH3GpOe//hCYEO1V4ZlI=;
 b=NIOEAAlhtBshrHLPg0vsHSnPr3KkxV2OewPHzXiTnZdmU1h8bAmoH9FtUAh3mWquoypFncQTMhPAZWkAex2NSvFLJRMD0Le1kz0FY757tZpfpGj6im6p3gZACyu8hwR8JPmEHQa9AW1uWFTBMn4BULMilWxKb0pnj2PybtB47dHlt7W3tG22uaMU6//5RQvsoEu+t5DSj9gfVVWOqUkMEWTMDFXG8PqbhH6fAx9SVj7EGvfpvzKYAV3xPs/rZuDUda1/woP0Db0fh54LZN1IYmM98485UGPiw9ugXAy1dOOw4USRz9O+tmhzrDQMcw4bsjcBg4UQyJwwlrAJC9xOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnHrcPNmZn7rEyjsHGxdH4LEH3GpOe//hCYEO1V4ZlI=;
 b=IEqJZTZiCqxdPvrcqHA7y/QPBLA6yjt4RGj0VAqr1LEZghBBdbW5LltMroJ1PbZ9Us1cMCXqXOwclYxtvJ9pHIcwZJDzvPFj6mlvGGel5foHG/WlCqoe+SNLjLN+GfdnY6zcDZwnshRIkj0hCLOBik3G06vwMBc4Hh6/6riQ5+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.28; Wed, 5 Jun
 2024 12:25:10 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 12:25:10 +0000
Message-ID: <e59274dd-de20-4d04-8e9d-850a514066b8@cherry.de>
Date: Wed, 5 Jun 2024 14:25:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] mesa: build failure in CI, dependency not found
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Markus Volk <f_l_k@t-online.de>
Cc: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <aa532133-c872-4bde-8479-dba12de225c7@bootlin.com>
 <beedf05b-3b5e-4468-a6d1-46d7d6734246@cherry.de>
 <17D5C581F2EC238F.7636@lists.openembedded.org>
 <CANNYZj92YgWuYYw+ofrRSJ-TW60AHksUOyY7xeY9sneUEv8DcA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj92YgWuYYw+ofrRSJ-TW60AHksUOyY7xeY9sneUEv8DcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::15) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 943e7874-6a0a-4506-879c-08dc855a8ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b3Zhckp5QkdDVGdJNVZoU3Jsd240M240OWU4emFYTDRSMEdKSTZrR0dIWUg0?=
 =?utf-8?B?VWpxdGk1RTJIRWpiY2ZkaTJ2YStjMnY5UUxyNG9zUnVab2RiNmd0TXRxZm9P?=
 =?utf-8?B?a3JiZkVIcjk4VTJhSlViRHNSSHNLMHdJYUt1MzByOVVBUUdpbFlERFpSNWc5?=
 =?utf-8?B?aVFqOWRZUHNrc2U4R0paY0ZXMTJuMmM5MVllY2YydEZ1VWkwSDZBa3JEMWcr?=
 =?utf-8?B?U29ZYU1zTjFmaGFsSnFJeTVkMUo1U0Z0ZTB3ZTFEeS85dDNZbG44QlhaUTRo?=
 =?utf-8?B?VU9VeG1EUklHSmh4OEJXcEkybjRvUWVWMXBrSVUwZXZQd2dDRHFVVUc2dHpW?=
 =?utf-8?B?cGM0TzQxUmNya2tTL0hGQmcwUVhmTkYyTkFFcmVZbmdxY0RVWkkrbmFNNzZD?=
 =?utf-8?B?UFhvY1dKNVdRNUY1K0h5WVUveFNSb05JZkNMdzRjcVVUaVNieWxzZUNuZjFi?=
 =?utf-8?B?RFNsdk40R0VoOWJBMG5PNVN4KzhyemxjNjMySlU3VFdtTlM5ZHllVHliK2ll?=
 =?utf-8?B?MWxEZm05cm5MVG1wcW9YeS96NHdNbjM2N3RxQzVMVEZvNVRJT3kzalRmY0Qz?=
 =?utf-8?B?U3J3eWhOSXMxZklyaTR2ZTB0aXhXbC9RMzlEUDNpZWlDMWRNMTAwRzlkNVI1?=
 =?utf-8?B?Y2pNeS9tM2g5eGUvaGZQU1kzOFVreDcwOVdJcnZ2dUFoeW0zU0xxdTJiMC96?=
 =?utf-8?B?c1UvWXFnK1ZVc2NlTlVFUHlQcVdEK2IwelFLdkdjUjY3RVl6c3JuOCt5K3RH?=
 =?utf-8?B?WXJzN2dRNXNvNXNiYVZLdTNPSnZhVUs0b0hsWXR6Z2M4WmNxcmMrckVJYy93?=
 =?utf-8?B?RGZXbXpTUFIzRG1idE56MGQyRlo0cVcxdkFlUXNoQmlPYVk3NStLdHdHQ1dp?=
 =?utf-8?B?ZmlQSzQ0SWZYRk1oWTdEckYwRlBZUmp6WTRnN1doWFdWdzZtcmsrLzB4YjA5?=
 =?utf-8?B?U3ROK2NublV6elEyVStFdDhiazlnTGFyQ0NlalRzZU91Nlp5Tk1tV1BRdVU0?=
 =?utf-8?B?bHFQbkpRSTQwd0x3U3ZBOE8zeDZoY0JZNU5NUDZJYlFsMGhyV1BmUTZBQ21U?=
 =?utf-8?B?YU4zWG9RcktwNTdpbmRsdXRCVE9xUFlxVmQ0eGt1TmJ3NU1oeFpTdS9YbnVu?=
 =?utf-8?B?ekF1c2JSSDFSaGtoQVlaTTI3TlNaTzJvc1pjdSs2dk11UFdrMmREVFFsYmRC?=
 =?utf-8?B?TUNtdjNXeFAvYWdXUy82eG9NVkhyWjcwcytHZE1pNjhlRzdoNWF3UG9yKy9B?=
 =?utf-8?B?bkx3cENScEZhK3JtNUVONnhzcnN4WU9oNFcyMnNLQk1qZUE4ZGNvZEYwaWUr?=
 =?utf-8?B?VnNrRXA4MHZMMHBCcFd4QnFJQ1FHNVFpRHpWS05NMDd2OXRhMUZHQ0hCQTVX?=
 =?utf-8?B?WmVCWDdqNDVXK25MVnBmeGpHNTJsc1lZakdsekxzak8rOFlXWGx4WUlRL2Ri?=
 =?utf-8?B?NGNkNlNqQnNKMDNRZHJRUVQ5S1BXVVVSQlNWV25Kc1ZGNzlJdzBpbE1rcVRu?=
 =?utf-8?B?Q0NLNDdqSUs4WnpIQXRKaGpDMmVOcHNpSFFSZE5qYjZNSldnKy9nTE5CaCs1?=
 =?utf-8?B?ZUx0c2tqVTVIcFVLZkdjb1BBc1FUN3FFVzJjRklIcFFXMGZWQ3A2TVhjMXdR?=
 =?utf-8?B?MFJRd2NQeG5xdUdZOFZhODZnaHhENkJlVWVMSHJZSTcrUyt0UXkxTzFuK3V2?=
 =?utf-8?B?UWIzQzNRb2tVS3hWcEZPVG9OeFlITEZhZlArYm5YbUJXaEZ5NUhUZmtyMmhD?=
 =?utf-8?Q?8bWynN3bwoLfR5F7ayq4QZqWDuR7cXoLdygbhUo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWVvS01aZURMQlQ3dlBrRnJqZ1c0dUVDSktvckJQZlFLcEZOM0cwWGd0YnRL?=
 =?utf-8?B?d3ZwZ2Q0dTNreVQyUnQwSmI2TkpaU0pXY0xGelhVaUNwZkZwSEpzQU1ydm84?=
 =?utf-8?B?WXo2dmFodXNEQTFkbmJxY1A1cyt0ZUE4dGdCUUc5ZThhZWlhVXdVcWtia05k?=
 =?utf-8?B?YzBnN0lUQ0k4UWJwZGtUcFBQTi9TSUZwekNoMWdEblgvZGJBdGpJWnlTcWNx?=
 =?utf-8?B?Ry96cDhreUl3ZFB1THFqVmU3bWg1OTJySHoyZmRMTDQ2eVVwcUhlcEVKVkJF?=
 =?utf-8?B?ZWVYblZ3aEFWdGtwZjYzQ0t3V2h4aEllVHFlL1hWT2k1bklabzlkVmtuRTV6?=
 =?utf-8?B?dnJWM2VHYWNlZFg5dlJwVWVLR0NxM3hjMU1yRGozZ2hURE1tYlZqZnBxWXhr?=
 =?utf-8?B?RElLcW1INmJ1SnFPVWpnL0FJbmZIVllBQTBPRHRybklxTER4RnFkNGg2cVE5?=
 =?utf-8?B?bTFSN3NWNnZmOGtKZG1hRkpzR3lscGpRNWg4RWIwdVh0bUhVVHBBeTlScExZ?=
 =?utf-8?B?VVpCa1NGQzQ5R2hpSlpabGFVYk9lQU5Vd1IzNnhtMCtqVFVyRisya1IycDdE?=
 =?utf-8?B?cW9wNW1sckY4dVU0MVduR1BTNzVMQzNDSHVMbmpIdVRlWEc5R2tsVStTSU9h?=
 =?utf-8?B?VmE4RlFiYnZ4b09QV2lwTGVCUmdwVVpQN05ZZStCZnBXQ0FNSzRhcUlENmRl?=
 =?utf-8?B?c1NxZzE4RTVrVzVzM2M0U2Rtd2Q2bTVlcWJQamF2cWs2VUZWd0ZZYmMycG1W?=
 =?utf-8?B?QnJKR0VlbHRBZnptdzJRb3pyV05OWFJMUkhCRnZ6alRWeFRBMzEwSnpjcjFO?=
 =?utf-8?B?RUxPeGlhZXRrWWsyZmJ5SlhBQ1pXVEtGQis2YzUvdmpQck96Y3dIcnU4RFlX?=
 =?utf-8?B?aDFHK3hFaE42OWtLaTFONG00QVF2RUdpbzgzZmdyVEFnNHFwMTJUM2t6K2c3?=
 =?utf-8?B?VTF5ay9aOUt0cnM1OWFvRGd3aDkzRC9xREowcUFTKytGL0EydHJaMlBuSmcv?=
 =?utf-8?B?Znl3Z0ptZ0tvR05xY1VDTk9oUktZQURtUzR5ZkxVUDhQMkxJRjM1S0NraUZN?=
 =?utf-8?B?WDlzZ3BYSVZEc0JCUWx0QUhZb1I2UkRPVGxjTlJXMjlTTmNiN1kyak01M1Fa?=
 =?utf-8?B?VUptWEhia24yd0ZzY1ZHTnVVd3djd3V6L29SSUlJaDhpQlBNSm1kK3Ztb2E1?=
 =?utf-8?B?eDU0RkRSZC9UM3pYR2o3V3RJZlN4TlZNMXlKa0FBRUZYdUlSdk41dkdmN2FJ?=
 =?utf-8?B?VFZTM0RERHFsS1FzVlNYdWZoMWR1VGRkV3pKQ3phbHVNWUdDR3cxSVZPV0dE?=
 =?utf-8?B?S0xKcE5rdHhjY3RSSHVMTlpvWDZLbXVEK2U5TkNzbmtiMjZKeXBkVXdWKzhO?=
 =?utf-8?B?NjNSbzhqTlQ4bm5YQzJDS1FRZ3hISW5QWFo0MzhCcU1kNnZnZGlQRWhuWklr?=
 =?utf-8?B?cnJsSW9VUE9oWTdMS1c2dnRTcDRuNlVvL0tWdjl4ZHdQVXJmYmpkR2NMa1c4?=
 =?utf-8?B?Y3FHeHpITFZndGZWYXpIQ0ZtaEd3Z0xKN25nUGZabStPSGd4RUV6Z2FMTTRp?=
 =?utf-8?B?TnFGVXdjd2lYZDJReVgrd1JlbnhwbmNhTzRkK2V5Ty9uV2d3VVNLa2dpWjdG?=
 =?utf-8?B?UWM5UXFCUDlNQW9vZm5HbE5lazZBTHNReTRaNFgyNWl3NGx0Sm1XU2N5U0lC?=
 =?utf-8?B?YzdpM1hEYlV4YS9Eb0kzTGJWWHVtOVNsSGk4bmZuajF4Yk5QNU1wOTVJQTQv?=
 =?utf-8?B?Nm96VGZzMjVSdnErV0tneGVJOEFKOC8rd0VQQjgzVktkbHl3N25wQWRJL3Zv?=
 =?utf-8?B?L3NEcndHaGhrU1BCOU9DcUVtZ0h3Nk40NG5uUGlHdFd4NTFrcHJLcE9JcjF2?=
 =?utf-8?B?MkFFcDVqT2plSGU5aFJWTTQ5TXR1eXRzeDlyOHlWb0lZZ0xXR043VkdhNitr?=
 =?utf-8?B?NEhXM0JqaUU1SmcvTFdhT0FlVmt5SVNIZWJ0SkFTZTQyQ241Qmo4M2ZRTmtI?=
 =?utf-8?B?WDE1bFdEVzhKTVlObTg1ZkNMZW1vTFdudkM2ZUVGalEzS0szdXYwVUlPMWVm?=
 =?utf-8?B?czNyZ2YvNms0Q0x4SWVXajhTK0ovTHRmd2hCYit6Z1JreE9BazI5R3ovQm1Q?=
 =?utf-8?B?ZVdSMjJaNE53S1JRcUtmcHQ2ZGZaRlVsMHkvOHh2QUZhSHNDNStXTDU3SHIz?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 943e7874-6a0a-4506-879c-08dc855a8ac0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 12:25:10.2521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QB4DGMhmSSbWD4Y1rI/MpvzRAS4rLEyP0qBbyUzPa+qcdwStCdqr3HIldBZZ2E9rapjSJLs3a8mY/DKqQX+YYdEkZyRrHSsDzkuwrLPuZGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 12:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200362

Hi Alex, Markus,

On 6/5/24 1:35 PM, Alexander Kanavin wrote:
> I think we could ask Markus to look at this update to 24.1, as he's
> done work with libclc  dependency previously (and authored the patch
> for it, which should preferably be dropped).
> 

Yeah, I'm hitting a lot of issues right now :/

I can provide the following info already though (patches not tested):

"""
commit 9d03be215762c45ad547446a29865c20c9ed4c2c
Author: Quentin Schulz <quentin.schulz@cherry.de>
Date:   Wed Jun 5 13:31:29 2024 +0200

     mesa: enable RayTracing by default on intel if clc is enabled

     This was the default before 012489e55ce3c88615c5fb2667e10e9cfd7b7edb

     Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

diff --git a/meta/recipes-graphics/mesa/mesa.inc 
b/meta/recipes-graphics/mesa/mesa.inc
index cb1c9b7b349..a2314a6f22e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -73,7 +73,7 @@ EXTRA_OEMESON = " \
  "

  EXTRA_OEMESON:append:class-target = " 
${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', 
'', d)}"
-EXTRA_OEMESON:append:class-native = " 
${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled', 
'', d)}"
+EXTRA_OEMESON:append:class-native = " 
${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled 
-Dintel-rt=enabled', '', d)}"

  def strip_comma(s):
      return s.strip(',')
"""
"""
commit d0fbbca90047248d97ddcc90e3699dfb998f3fad
Author: Quentin Schulz <quentin.schulz@cherry.de>
Date:   Wed Jun 5 13:54:16 2024 +0200

     mesa: use new option for installing intel_clc binary

     Comes from 1e31fd5f4268b134b26cd9d82d76d406332a3d8d

     Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

diff --git a/meta/recipes-graphics/mesa/mesa.inc 
b/meta/recipes-graphics/mesa/mesa.inc
index cbd2a11b6ef..3b32ff635a1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -73,7 +73,7 @@ EXTRA_OEMESON = " \
  "

  EXTRA_OEMESON:append:class-target = " 
${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', 
'', d)}"
-EXTRA_OEMESON:append:class-native = " 
${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled 
-Dintel-rt=enabled', '', d)}"
+EXTRA_OEMESON:append:class-native = " 
${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled 
-Dintel-rt=enabled -Dinstall-intel-clc=true', '', d)}"

  def strip_comma(s):
      return s.strip(',')
@@ -254,13 +254,6 @@ do_install:append () {
      rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
  }

-do_install:append:class-native () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', 
d)}; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
-    fi
-}
-
  # For the packages that make up the OpenGL interfaces, inject 
variables so that
  # they don't get Debian-renamed (which would remove the -mesa suffix), and
  # RPROVIDEs/RCONFLICTs on the generic libgl name.
"""

Additionally, Intel Vulkan driver forces libclc dependency if intel-clc 
option is not "system" (so either "enabled" or "disabled" or "auto"), 
since commit b52e25d3a8eee702ff5d21e4cdb9a4dc0736282a.

Moreover, Intel Iris Gallium driver forces libclc dependency if 
intel-clc option is not "system", since commit 
5438b1910464e4b17fe0248a96a6ed98f0280a20.

Now, if I add libclc to the dependencies, I need meta-clang for this but 
then llvm + libclc as DEPENDS is not working, I get the following error:
"""
Exception: FileExistsError: [Errno 17] File exists: 
'/hdd5tb/qschulz/work/upstream/yocto/build/tmp/sysroots-components/x86_64/clang-native/usr/lib/libLLVMPasses.a' 
-> 
'/hdd5tb/qschulz/work/upstream/yocto/build/tmp/work/x86_64-linux/mesa-native/24.1.0/recipe-sysroot-native/usr/lib/libLLVMPasses.a'
"""

We probably also should migrate to rusticl instead of keeping Markus's 
patch but I have no idea how to do that properly.

Finally, I have no clue how to test any of this so even if it passes the 
build, I wouldn't be able to trust it works :)

Cheers,
Quentin

