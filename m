Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D3EC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:30:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.3067.1711042219182639915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 10:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=Nk2SfNCx;
 spf=pass (domain: nxp.com, ip: 40.107.20.50, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCAnQdJa7gwLEaLdMXo4l8ao8Iy9r0YSV2gnb1MUqQWcn9UuAxQmNEvkT70KKm3fCUweSpFnBSKXNE8MnPEbXW4WBUq+8Uu1zpKOoshw/d7C4sckV3qSAUIafUhZS60NMXQ2hZpy64+ab5lW+Kj+FOvdE0F51uYKZxrZGpubgFq1qOepS/W5niis8LQXXOFGQL02ECEMpcr8bSz7a3kOrl7ZrbHGL7FSNm/fAWFlPy+L3nxd5e5J00inL0dfPVuWfyy9k1AijsBNmEOO4cA+DXsLC92gStw2Le5Snizl/SdVX7hqRnh6ioYzQ3FEQ4tsPXY8lLhLH995emuHXCmNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBsLi/ZVwlQ/NMv0PZoTN8ZTdtGKo7DsJw68zQcVqVY=;
 b=S3bnDc7ZsYMPAxcdTWkzhXsnemRY9wuAYx/okwAU0nGkl7V+eq7+VO6BVVxW9n0pKkbOps0Z4aoNJxYbXjMNF5AdI5rVXYFenksCxp6NnbcFGEqd65I17qzogHXfJR2GqZU8VBa7oRR3oVCaeHh65jzdg58VAS9MFEqMJbmezRKuOtNYnZtmD08CIalJq8a87sUBE4JlKswzW3rE+pOe6nZ3UEltwtITi4rEKrPiRFfQAW4BJW8olYKvsW9e+4bRv7IYj4FD8kuPIuzQ+Fbx9NYc7juyqRIc3aYqY+LqJDctfjvUz9ZCbaByBFwz3RzBe2o1X3D5wfv7eTZ/zPkpMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBsLi/ZVwlQ/NMv0PZoTN8ZTdtGKo7DsJw68zQcVqVY=;
 b=Nk2SfNCxmkztErXxxvmk1ZNXuaEGWeuRoWp4A6xtBgRsZmjxJRr9KTRiwCIe27NQ2gtwrXdnJp/r2bGuj7W+Sg8ofH8JvTEjlZ6CrADInUmih7x7+U6HeUCdzNcchfRt6tkPOlIXtHV/DdFNHdcDZF8sTpU5BJNDKyF82MY8Ra8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.29; Thu, 21 Mar
 2024 17:30:15 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 17:30:14 +0000
Message-ID: <8dc4471e-0924-46f5-824a-8173dc2fecf3@nxp.com>
Date: Thu, 21 Mar 2024 12:30:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: Add check for
 missing command 'file'
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240316173558.468284-1-tom.hochstein@nxp.com>
 <20240321151941c828fa8a@mail.local>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@nxp.com>
In-Reply-To: <20240321151941c828fa8a@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c473c00-3740-44ea-3ea3-08dc49cc9153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AUcsXJuB1JjIgfg77TN1GHAkQZ7EQFrYWvTjN8XoZo99ae7ipFffpuux0eakVRO3dwbmNCsQcryZvV/wyjjaTyeNam5HavSUbEH/COlgcJ0f7JonoLHeB/s5biyEeilxwCs6bg8Uuh/H38JqzVUPz+wwvrDFOCdUlxgGIQqfaiSPXNA3n3q1QUWPA/BbiwcacNixm13tbv2wLftoz/47Ag5DCuKjOAmMKrUiox9ZdOs8GFsUWnDc8HmUJXYKBPcGcvTrmrRMgkfVCIkMWjPjYpe+XQC9QwK72i4BDSlfm6NDk/iOLG9tB4wfzBI7Br9dgGw+K2FSUEn3exMNunq+WHuRkz/kgv7yQ+d4PUcgdV7uYC4OhFALfQuHA3sqq0WFH9I0XJ1s15pUkb6QuoebfsW5cbHPst7RtDcAZ25QxJgRbgkYtVfUJgwDr1nezAjqZer8xs1WWZHCvL25DE0jbIqSG5tpQ48VGdqRhBAttSgAPAoBdA/z76WS1rMmB+2JVI9Ti3m91+H7uBufGIHwPwNC1SvJ+AxngRHdpIeIRyvTMHbRokf1NXQ3BL4FVyQ+akMLMUYZB8Ylnp5P65mJVvav25ZIa9tPuaH2jHCR+A0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjF3YnByUEdtNVBiM0FoL2MydDB4eDhBWFl6Y2lGMXZOT1pwTjNxeldoc2pK?=
 =?utf-8?B?Qis1azNIOXJCYjV4eWd2cWFTRjc5d0hEZUFOeWZkNkN0alArcjcxclpndzdE?=
 =?utf-8?B?K2UyQnM0c0pPRE9kQTRtMUtpSHFHN1lDNVptTEZaNmd5QTFzS2xtUmZPTXN5?=
 =?utf-8?B?b2t6dDU3UVZNTlJDQTl0bDVsSmdTVkRickNMVWpVOEYyeVpPRXp5VlFrbll5?=
 =?utf-8?B?V2dTTWZvcTI4VjhqWFhTcDZnODdzUEVXTkozaERUZTBvQXRub3h4a1c1eU5B?=
 =?utf-8?B?QU1qZlV0V0dUN2pmOXlZQkVGM3NWTG93Z09COC9ldW1Jei9JTk4rWGtaVjdO?=
 =?utf-8?B?NCtHR3VxZkdWMitPNmVSNFBtUlpMMmh1UHhET3VFcDVIL0MyQnhjNE9SNk9V?=
 =?utf-8?B?WWFydjI5RVF4V1lGOFBpRjZsdEZlc0tPYkRnZVlWcmxER0xOd2JMa3BER0RJ?=
 =?utf-8?B?QWlNMHVDNnhsckVsd1J5ckl1TkxRRVIxTWZ0S2pZeVlRMTdWbzVXMGxsL3Ex?=
 =?utf-8?B?alUyQ2ltNEN0dkIzWnFlbGtwRHpOUFU4VVdvOWxBOStBazF1N1ZiTURyS1Vh?=
 =?utf-8?B?ZEVVWks4MkVGRW93UEpqaUM1K1ZYWnV4cUl2VENLeUMzYm5XbjRIR3JxaEhL?=
 =?utf-8?B?YzAzd0tCMVNGZTJORzFSUkRnS09sVWxNRm9tZ3ViV2d2UzZSbVFZL0NFamVV?=
 =?utf-8?B?VDNOcHhhYm82b283MndjOFdpZE8wL2hoUUhnOGlnSUNPWTlobzRRSkx6YnhM?=
 =?utf-8?B?OXg1Rnk4R29QMFdLaFIweWx5VmJTVmg2TERQOEJ6aW9GaXJrem1PbmRSUHYz?=
 =?utf-8?B?WExrYjNOYWVESWhSSmJsQkhLM3V2QWhwQkJsY2RWQXhVci83TFh6N29EWExu?=
 =?utf-8?B?NVg0bmZXYmZQZWw5TDlyOFdKL1RnQkpWYTV4bVg2SmVQcXUzZXVRaWtWWk80?=
 =?utf-8?B?SS92U0tTTXdTZFo2WTA5LzVoTk1BelRjMnc3OGJ2bmlXWUVmbFFEa1NTcWVI?=
 =?utf-8?B?MTRmVXhESUdDSWFVbHVWM0d5cVRQTmh3MGpjZmlETDVoZk5tVTl4K3hyRnB2?=
 =?utf-8?B?YW42azg0MGEvZVo2UjJTY1ZxL3pTc1JsakNrWktIQ3Z4WWlUTTNKeG1manZZ?=
 =?utf-8?B?VEhMRyszckhzVXh6KzI3d3QxV1FTRWlOWEdxSWtCYU0zcVpIWjFOcWZ5QmR0?=
 =?utf-8?B?azZTODMrdXA4aEJYbTZ6VE84bG9VeElVOS8yK2I0d1A4bzN6MVZ6ZmlWbWxq?=
 =?utf-8?B?N0xLZUhKOXB2WmFOWWs2aTVUcHhhd1JZUW40c2VSTnhMSlhsNXZHQ0RwV0NS?=
 =?utf-8?B?VGliaXRKNlR0bi9QN3dlQytxWWRhWThMTDNxTXVVd25IdDk2RlJPTEFYaGl4?=
 =?utf-8?B?NkQ3MU1PeHZBRTJoQnYzbU1JNU94SXJTc2ZYWHIrUlZQZi9aVGlPamNkVU4r?=
 =?utf-8?B?eGI3blUwUmpiUTY3d3F0a0tBMWQxU1FYNk9JSklwZm1TMEhjdmo3R05wZlBK?=
 =?utf-8?B?Rk9lWXgreDYrQ01oQkVYTUhmMmF5L01qbkdrVFB0M3A3Yzhyd3BkbmpRUDhU?=
 =?utf-8?B?ZnZzV3IvU0lhbmlqU25vY00zR0xiUFVNWkNvdHVJd3ppYUNHVGFhMWl6ZVE1?=
 =?utf-8?B?QTVtRS9uVmRhb1FiUlVCUXFISzNLRC93RmFKUjJ4SGNPeWVXMVlUR29qQjRB?=
 =?utf-8?B?Z2dEWkFQbWozSDlMbnd5UVphd3dKREJmQjZ2Wkp5ZlptUGhFM3lIOUs2cTJO?=
 =?utf-8?B?MzJVdWpVU1ZHMzlsWCtUWXlxVk5QbkJxelM1VE12d1VwR080VU54SmpPNXgx?=
 =?utf-8?B?Q3NWWGtXUCtsZTEyanpvQ1dnamYvd29wWWRENkJtbEdMS0FxZ0NxTVE4ZFlF?=
 =?utf-8?B?S2w1M2E1RGwrTVYwTDR4RVlsVzJwcDhlQXEwUFJGKzBBTXRyc3gwc092TUdS?=
 =?utf-8?B?MitpRFhhM2RlSGE1c0FVMEdNMGJqRlZSUGdrZjZrOVpDRUo5dVkrK1ppbzQz?=
 =?utf-8?B?aURzQkpmbmE0MmNBNVNUSXY5bUkzenpkMDVCbXFaVTZTUlNFYlZ6dldwRkRT?=
 =?utf-8?B?TGdyUUNpa2VLdGR5RXpiM1ZlcGx3dCttS0g4ejZwOUMvV1cxNjdyWTIxRFp5?=
 =?utf-8?Q?S6tblNJsVKv2qvuVgwF/lx+un?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c473c00-3740-44ea-3ea3-08dc49cc9153
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 17:30:14.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkGViRmRWLQg/r5ooeUtKXzNgKnec2cbpXQxSu8KB3/zf8lzJaUbN9VuYzoDwWB9Z1PQrTaueC+t8DqpruPMOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 17:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197423

Thanks Alexandre,

On 3/21/2024 10:19 AM, Alexandre Belloni wrote:
> Hello Tom,
>
> On 16/03/2024 12:35:58-0500, Tom Hochstein wrote:
>> On a machine without the file command, the SDK install fails with a
>> cryptic error message.
>>
>> ```
>> xargs: file: No such file or directory
>> sed: no input files
>> Failed to replace perl. Relocate script failed. Abort!
>> ```
>>
>> Add a test for 'file' to print a clear error message.
>>
>> ```
>> The command 'file' is required by the relocation script, please install it first. Abort!
>> ```
>>
>> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>> ---
>>   meta/files/toolchain-shar-relocate.sh | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
>> index e8ab357717..3d55e38102 100644
>> --- a/meta/files/toolchain-shar-relocate.sh
>> +++ b/meta/files/toolchain-shar-relocate.sh
>> @@ -1,7 +1,9 @@
>> -if ! xargs --version > /dev/null 2>&1; then
>> -	echo "xargs is required by the relocation script, please install it first. Abort!"
>> -	exit 1
>> -fi
>> +for cmd in xargs file; do
>> +	if ! command -v $cmd &> /dev/null; then
> This fails on some of our builders:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/9148/steps/12/logs/stdio

Aha, looks like &> is a bashism. V2 coming.

>
>> +		echo "The command '$cmd' is required by the relocation script, please install it first. Abort!"
>> +		exit 1
>> +	fi
>> +done
>>   
>>   # fix dynamic loader paths in all ELF SDK binaries
>>   # allow symlinks to be accessed via the find command too
>> -- 
>> 2.25.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#197256): https://lists.openembedded.org/g/openembedded-core/message/197256
>> Mute This Topic: https://lists.openembedded.org/mt/104970783/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

