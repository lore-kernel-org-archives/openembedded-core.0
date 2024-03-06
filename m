Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92D0C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:08:49 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.134])
 by mx.groups.io with SMTP id smtpd.web11.14036.1709737725400394246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=AUkP3k2e;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.134, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GazAGUAGbwlG9nHGmsXw+KUSN9nmiU7jbV8jBNI7o91Ebigrkc34MmxcRgOpenv2XpfzDw95v8Zpy1kda0xZnkiAyxijRNobZwRKVGJTWHOBqxntgyAN0/ZKfhyLsLU15F8Z3JcN5WKah7KBuaESH5cHa6effQ+lb0YQ/gGWUJA7OIo9YThAk4+LmYNShrq27ZnGUpW9fDhuzR42cyF6WWKVOeGCmIOk/4r61w2ji09Pq+kDIcldi5TwIle+sQQwXHBPGuLgTCNWVOc6sHXxVYq2/lREJ6H6ByefEHkWGa0x6PvHg/LLzqmIHH/ld+OEK/RnQUL5coyLC1jTgdzBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LrGdRXRCaisX2E2mJujL8OAkzQvj1Qt6d/eGPK+T0c=;
 b=FjSHbTkMHu7ZWAJJLLR/ZgTbvHT4vKMjJJu33p5I3u+jOnN8ZBkIuERVUBf/RhP7pkyvOfyVONLbHgts+uTB2QcJ4+BLXLuRGYIxzV/oc/VcLESrMOFD7UzVHxrp/v1gowKmSoQQZn+Xqiuv3bYyw5HnEB0U9Y3x5iVrcPrWP/vujYqPugljFxVU5JELCtNTD4jdPdpzSP6qkrIrQFNndPm8psZZ01/koo3Cah796pZLFPGl9cjkaZUBv/3uvP73H1iiz0DMwH7aZPj+nVHDWbERIZFvCzlngMsyfvi8DIKjO0RjImfKtoCP44oCJR8anKQzYI5VhG7xC0iTT1+75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LrGdRXRCaisX2E2mJujL8OAkzQvj1Qt6d/eGPK+T0c=;
 b=AUkP3k2eJAYtxIQkly02GIRh4b6ZW5cPbZsRE3LT56dKe8hlqnHp2msFoIxvLDsWQTlkxrJXw1VmtDl0Ngo75EKx9rL/ivjbN9qtNhbmeBX/6sc61cp8/87EIevsD4xZSDdrFDhxKV+ov54jHXd3sM6Y/8Z8kmvGSlthkoqBJe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by PAVPR08MB9604.eurprd08.prod.outlook.com (2603:10a6:102:31b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 15:08:42 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 15:08:42 +0000
Message-ID: <e822af82-f379-4904-be69-e1fece83cce5@weidmueller.com>
Date: Wed, 6 Mar 2024 16:08:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] kernel-fitImage: only include valid compatible line
To: a.fatoum@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: Christian Taedcke <christian.taedcke@weidmueller.com>,
 Denis Osterland-Heim <denis.osterland@diehl.com>
References: <20240305093628.1094525-1-christian.taedcke-oss@weidmueller.com>
 <17BA308225892468.21429@lists.openembedded.org>
 <4830be50-69d6-4122-abcd-5cc2ab574f02@pengutronix.de>
From: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
In-Reply-To: <4830be50-69d6-4122-abcd-5cc2ab574f02@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::6) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|PAVPR08MB9604:EE_
X-MS-Office365-Filtering-Correlation-Id: b8fcc4ab-cf73-48c4-0da5-08dc3def4f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GGSV4/zMC2YkO5Y5bnPWHtq51iZtwT/dWeWFQyHLIYCvjNWRfDmh8ztz0lUy+M7UgoIajtOjO8h94O0VG0hgf9NQSSi8vBve044IhSzdGyfx2A2Jdb97kWp5ua8Mg/WPCGpF0wFlWHIGxPcZX/lbzxfcnykE5C3FfQ9TgHfB1BfR2izLn6JOdFiJ2rpb4qQgYNzy31WijExBNpLve5iJ5wkeQ9DJj/6XRcErjxIfcsjlxn1Nq+XsgcbZP6kXeHMrERixv2YI14XZ4fokUlhLk5DWKXLcr8IADKTtKumH8zPlZ7V8C+1FfHOuaAT8ukh0tNqeXiAC8M7IsuKYHGe6wDH9QtZlohVG8yUzIBNnJTXP083p9+IcAKMEDhik++OBTGGQtrtFBf+axtUAtYCrHe8fKO3lzo3tgSgKr7uSq2V3pewBbq3BtSMlRdg1sxAPr3LsIzRjzduz+MfphDt157evnb0edmKtFrDYaVKFRFQZcdgsdjdyYiyySULM1XatR7YY1d7Aq8VuSXplJL5PeK0x9YLxXjruh3JmScryQvnzB8PP9zuaOkB6qJh38+pVLruYw4CRptQTeJwpmzMJ3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUdRdGdRS2VkWHFuWElUWFFmYzh5Z3YrMHpFa01KZjRJQ3VndGo3Y2V5OFdr?=
 =?utf-8?B?bVBuR0kxSUtUQ3h2eGIwMEdNeEZTN0pjY0Y5cGJUd3ZLWVNYUnJVVjBLTFhG?=
 =?utf-8?B?bFYvVFNMRWx1T3hyUGsvTXdkTSs2ZGVyV1VrZXIyUFZkeHlzWUZiQisvTjJn?=
 =?utf-8?B?alpwSXptaXovaUVXSWpXeWJJOFZ0VTlvMWJkN3dKM3lJbzVlcWtTeUsvZ2VU?=
 =?utf-8?B?VFNnUzJVbjNwZmdrWnpuSGtVSDJYM2NJMXRJVDh4ak9FYU5ZUVo1ZDFNdFhw?=
 =?utf-8?B?U3JqNkFhYkE2Tm1qNjgwbVVDMDNlUFZUYkp5VkRkYVZyN013bTZ2endBL0pz?=
 =?utf-8?B?TjNjVCtETUtpWUwrVkJHTlNFVzhaZk5sd1pYN2FLT3ZXMnA3T2RiQXlYK3l1?=
 =?utf-8?B?T1VOaTdreldodTBlNURrb3VTQ1F5MTBSQlZLRmZiVlplbUlNTUNWamprNnRy?=
 =?utf-8?B?SnRnZFI3bFV1ejBDZ0h4RmFxSXRtZldmWEVIdm83d3JGZWFzbUpVN1AybzFy?=
 =?utf-8?B?YXU2ckNVeENqZ25DZXBiNzBvY21yZG0ydFAvVTR6ZDA0ZEdPcUhRYzZRYkx5?=
 =?utf-8?B?MG41c2c1aEpldGMzK3p1ZXUvVi9qK0w2eG1HK2VNRmhGR09MVkpaTGFIUVd1?=
 =?utf-8?B?RVl2d2h0NEQzRXc0YkV1UlR0U2M5YXNlMDA1bVRyS29QNXMxMmFCNGhmR3Zo?=
 =?utf-8?B?WW0vU0p5dEhBdjR0VlkvS05aYnZqUFBxQTAwdGlNUkxINFFFWnZ5KzVEMkM0?=
 =?utf-8?B?QWV5NnZxeGdsS1RScWVMMG0rWkNqYURKN0U2TWVyWWxnd1hrZitKT0cyeksz?=
 =?utf-8?B?SVlYZ28vUUUyUU5XcDFuME1yMUlWdm9CMmthQjRMYWgwaUFFd0RtSGxRSm8x?=
 =?utf-8?B?VzJ1aHJ4dk1UdnNXNnlLajFsY280cTNHNkpsYkF3ZHhuMTNvVDVpYnplMHZB?=
 =?utf-8?B?dmVlUUdEYU4ycytoZi92OFgyR3RzdzV2aTFRcnNpaEY3cm1hWG5wTitxOVZ0?=
 =?utf-8?B?OU1pcWNieUJqdldFVmJXSC8vMU1SN1FHNEdkL1pQK0VFWEp5V2N0N1ZUR1dH?=
 =?utf-8?B?RzFvWFFaeGpzbHhIdVBoZkl1WDY3M01DZ0JMK2RqdWRENExJLzhXTlBrS2xU?=
 =?utf-8?B?UEV3NWFQbndzZlVMQ2pEaGxjSDdoMU93RXRQVGY4SUpiVUtva2UrTDlLcVd0?=
 =?utf-8?B?RXBpMEhMeHpHRVB3WXRBK0UxRDMwbWo1b0NLQ0dvNUlyNzN3SktaT3lnTHhR?=
 =?utf-8?B?UmRJdWUyZzRYS05rbDFTWUozdzM4TWFFZnVOeG9CbmRubThWaENxZWQvcXhs?=
 =?utf-8?B?UEhEYzB3eFdBS3FmUTJ1U0t5NGRKdUR2YWpkSllNbTNTRnY4Uk02SWttc0F0?=
 =?utf-8?B?ekR4WStzampVUVNJRGQvcmQwU0F2WEI1c0p4L3FtaHF6WTh0T0I5a3FOL1pR?=
 =?utf-8?B?MnVaSEZDeERGKzBZTTMwRU1ncWJoaTEzVzRtV0dCVXZNUkpWVm0vdXhhdHJO?=
 =?utf-8?B?cmdtYVpIVERoVjk1N1BtNUh2WTFubmFxSTBFQm5hcDdlTlIxcG1rWnE0UDBC?=
 =?utf-8?B?LzA5TnJSTGd5WUEzYVVrT3JWK1JFZ1JHQUh6NjBVdHIzRVhOUTRRUzdOZm82?=
 =?utf-8?B?U01kajM1QjZNbnh6T3Ntc1ZnRWVPNGEwYU9SbytpQ2szaytybCtuYnFvQldw?=
 =?utf-8?B?TmluVitOVFBrdGJLc3RYUHkxUmIzUW9MWTkxTVJCREpIZVN4emhyTGF6Y3Mz?=
 =?utf-8?B?SHRNWTdZUC8zb0RnMEFzYVI2NWxvZ3NwWHBvdCtxK3dqWGlaRDBjaGNUNTBP?=
 =?utf-8?B?aU9GdUpGbXJqWWsrUHQ4c0lnclByV0NFT1hnWTI4Z240dDVvUTNwak1xMEpi?=
 =?utf-8?B?SzFqUmFyVmVJSCtnVkR4REY3MWlLeTEvd3haU1lwb2d4Wm51T2kzNHJrT2FN?=
 =?utf-8?B?cHpxQTFqZVluMTlicUxtMGluUjd0ektlZXdSeUM1QUJ2cHl6bGVoQUZhVUhI?=
 =?utf-8?B?aXgrdjliUWJObmJHV3VDRXFTZWt3RDJHcHNqZ1lPWVV2R2JXTjY3SGl3QjE3?=
 =?utf-8?B?OFo4UGZBQ01jbzJiU0p6alh6TzA2SUYwSU9US2dpNHZ0VTNReXJQYUZLd2R2?=
 =?utf-8?B?S0ZUZ3YvNUQ5L2VYYXI5NkpGRTV6d3lMcUxuZjBjZGhnTFBSWUdBMGhadWpJ?=
 =?utf-8?Q?VsEdlf0ZXvX0YQRzLKatr7Qee5zoZsbDV+THSrK2HdGC?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fcc4ab-cf73-48c4-0da5-08dc3def4f6d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 15:08:41.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcVmHDB8SULVcOjtPMePRZ1KvuDGLZ+LtN7B3JFAZe1LWYEUZMGU4euvyoOpI0dfNS9uSreUzeLPosqrfsSOLXAmQ3K68ZUo47Tj1xomwTECBx08djTEn6+CJTctsXvo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9604
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196682

Hello Ahmad,

On 06.03.2024 14:40, Ahmad Fatoum via lists.openembedded.org wrote:
> On 06.03.24 14:39, Ahmad Fatoum wrote:
>> Hello Christian,
>>
>> On 05.03.24 10:36, Taedcke, Christian wrote:
>>> From: Christian Taedcke <christian.taedcke@weidmueller.com>
>>>
>>> Without this commit the configuration node includes the compatible
>>> line 'compatible = [00];' if EXTERNAL_KERNEL_DEVICETREE is not
>>> defined, i.e. if PREFERRED_PROVIDER_virtual/dtb is not used.
>>> This prevents u-boot from using this configuration and it prints the
>>> message "Could not find configuration node".
>>>
>>> The functionality to add the compatible line was added in commit
>>> f4c82fb6da89 ("kernel-fitImage: add machine compatible to config
>>> section").
>>>
>>> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
>>> ---
>>
>>>   	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
>>> -	compatible_line="compatible = \"$(fdtget "$dtb_path" / compatible | sed 's/ /", "/g')\";"
>>> +	if [ -e "$dtb_path" ]; then
>>> +		compatible_line="compatible = \"$(fdtget "$dtb_path" / compatible | sed 's/ /", "/g')\";"
>>> +	fi
>>
>> The change is ok, but I'd prefer we harden this against errors a bit more:
>>
>>    if [ -e "$dtb_path" ]; then
>>          compat=$(fdtget -t -s "$dtb_path" / compatible | sed 's/ /", "/g')
>>          if [ -n "$compat" ]; then
>>    		compatible_line="compatible = \"compat\";"
>> 	fi
>>    fi
>>
>> This should ensure that compatible = "" only results when the DT indeed has compatible = "".
> 
> Scratch that line. This should ensure we never get an empty compatible
> (or one with a wrong type).
> 
>> What do you think?

Thanks for your suggestion, i will prepare a new patch.

Regards,
Christian

>>
>> Thanks,
>> Ahmad
>>
>>>   
>>>   	dtb_image=$(echo $dtb_image | tr '/' '_')
>>>   	dtb_image_sect=$(echo "${dtb_image_sect}" | tr '/' '_')
>>>
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196679): https://lists.openembedded.org/g/openembedded-core/message/196679
> Mute This Topic: https://lists.openembedded.org/mt/104741166/7654653
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [christian.taedcke-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Christian Taedcke
Software Developer

