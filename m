Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD13C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 09:05:20 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.55])
 by mx.groups.io with SMTP id smtpd.web08.7092.1643965518353305999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 01:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=BZbusN1r;
 spf=pass (domain: weidmueller.com, ip: 40.107.5.55,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSGiQpz47gyX9xp530tz0dkobo6+K5WStDmlmGDPFMQmuGbh4HmRQzMJgwJDUIZ5dZ43vtf4udSrUty7JJ2RjT0ltw/nnYmfYyimvz2o2AxWgP9MacmWprhq5u6aatJsCbwnSUOeTa2wev24jmu4Zd35im9YGeaAjSuwRWUAj0ZoIV3jjmyt8ZVRnbnU/ILE2Kr8k3ubN1nl4Gf2Hq9ZbzNdxZa3y//vx5XfGKskmi8B8POVrscaf+X8sDV7bnWjkaw6tMz/tK1sCk7VDsJijGOEiBCGqG9DSJG3fpaN9tiEiYc6a+BIOOI1855XnSYW9RKGSo/LXfhGOWJKSreDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfkti+dvkeieDepUuHrnT5fAz02BMMDYp4QyHXHPA6s=;
 b=KTHnEeoelQEtcSqvJlHmYGBelr+Rg56DGKIqXUOGHwyMseixG/h3fcXvWXPGa4sgxGV9ydNLK58oYMKMQ3mfehNLh+bbOzKrC4gFgZJRa0QRXo55C4M94RWqHmYmei8R4DcC80kLKUsqgg47BobwkA0EqPOwZa/AhDDMp1gKfavPU5b8VvJfDMBWMSkzz7OtPqGpoc0pz98hDs59MTrVdKO/huWc1Q9R+WhTQbZSia1h0y1/SWrS1IPlGRl7GeRwPfvd9gRLY8uePcrDy3Xo360YPDaVIG8sYePeaRkkdrIl/c1j7NYvLtr9C3Obfjkgidce3UmmKgmHmOs8es3OYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfkti+dvkeieDepUuHrnT5fAz02BMMDYp4QyHXHPA6s=;
 b=BZbusN1rmtGEYRgYeJ2EMV1c+ygerrH1+eDEc/IfRnA3NtbU+eGOywxa0Zp7g4WYCzjncN50NkOWe1dX1cuar++kHrvaKviO6Uv+dJqDX2xlK3B/2a7ndXDAQ77QEPpPXTCPp3A6draFYaxs14eoJzx7TE9BjIPL7NvdShn3XQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM6PR08MB3080.eurprd08.prod.outlook.com (2603:10a6:209:4c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 4 Feb
 2022 09:05:09 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.016; Fri, 4 Feb 2022
 09:05:09 +0000
Message-ID: <4ede83ba-c6f1-4dac-8dbd-44cc67d16062@weidmueller.com>
Date: Fri, 4 Feb 2022 10:05:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] recipetool/create: Scan for
 SDPX-License-Identifier
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220203170724.1319808-1-saul.wold@windriver.com>
 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0042.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1d9a3dd-befd-43ae-60bc-08d9e7bd717b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3080:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB30803032FD3092A157D6E47BD7299@AM6PR08MB3080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PxuNbLLgplAtJfRn2TXuGuZypeNU9QQ4qxsFRZZLq2MTviXhgfnX//lIS0sXlH25JaB7EQBs1VZPa0Rkj/fJxarohi3Q+FNoWbd/FBQJjOSaU3oEDMf91KBWziZVS3syAarbIJFCryKqvETimdOiWzKbvfCVy5JLNzXweLkBYfB5mYxVvHKgdR/9+oHgxoHnCucfx+5PGVu+EZeUdSM4fKKEFn7LO0d+f1Ogq5LrZC2+CfMSaUVCeljr9vcBkDUXpRk1jbZIWsipz8OE+NgH63aZJGkzYa0v8fVxLghwlSJvAovydO6oCMOSAIDWXAipA30K+ONE5fex1Lt8vS+ZPyG0NITMApyHS+RwaTL7abWYWf/6OV0FqIdEBEqrgJZOf28hyQzOyK8whDH1PC4PYN+JuJ84yJr+L8OyBTLqXs8uKG+kGqpjMMaodOQ03JoCJ6eFLXFM2jh2cDaEDR5SuMkhW6QhLLuezIOy5QkVhXb7rWc3ZXe45z9RPMTWnyL8HTyZMfZdEG7PGtf8wa9Czu9BbIazGZgpsdyS/+XLFK00xjJjDay7m+OwPR2292VJJpRyCGuJzcLLEu250KQYGAdJ5fZax5hybRkOXTMkZVhAINfcAcB8S+WPDxy7LjRTIuF+OKJxZEySNiIYJz5HDOIA/PgXnOHUeSvlGVANJ60zokc1MxvzYX4uxechiM1C+9mtE6D/xQf+JJ1KP/WIbS6VZfdqvP3q3enubDvSOKb0YF8rDzfr2z6zHfN1dta0kMtSz0GJgEbya4lwb0/SDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(31696002)(186003)(316002)(6916009)(6486002)(86362001)(2906002)(508600001)(36756003)(8676002)(8936002)(66556008)(6512007)(38350700002)(38100700002)(66946007)(31686004)(2616005)(66476007)(5660300002)(83380400001)(52116002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VEFrYkVXa3lOZHdtWmpSUnM2RmloN1lkSFBRazlNVGRBRFpqR3g2aitFR1Iz?=
 =?utf-8?B?ZklvY0g4c2FFWHk3MndBOFNDcmM4cVViOTk5OTZyZ2RhMit6SXNGS29jTDhT?=
 =?utf-8?B?ekkzNThpRkhyL3hqVGthVktRQklpaE5ScStmeW8vNHZ6ekViWHVzL0Z4Vk8z?=
 =?utf-8?B?SnpiTW44N3h3VG42TWlZTVFNeHQ1bUdtK1pQMEo5OFZadDZzakxMSDVjaWdq?=
 =?utf-8?B?WkNSUWJzUkZqSDFtSm1GeTFEZ0F1bHhIVVpBd0VUME9yQVRGR3FlL1RmdTVz?=
 =?utf-8?B?OFdGWlV2cUprc3Yzd2JUTGh0dm5FUmpqMnZCYzFwWjBsUkg5MjI3a0RJRDJ5?=
 =?utf-8?B?cVBpTkp6MzlGck4xUDN0dFgxT3ZzdkVJY2xHMGptQ1NlVnVYbkVqZmY4Zm92?=
 =?utf-8?B?dXR4REc1c25CTTFpVDRsWHBRanViWkhqT2lITitqa2hmQWh6WWVXQWFzdHFN?=
 =?utf-8?B?V0IvNWg5Q2pIQjF4b1B3a1gwTW1qdzM2QlE2d1owMFY3YkdlczhRU2d2eTc4?=
 =?utf-8?B?S24rd0VaN1BvallYelVlMTUvWUlMZEE3ZHpYenZ6MmVEbHRRdFRnT2h6cEJ4?=
 =?utf-8?B?Qk9iNDI4WGV3NXRsK0V2OHlQckVBcUZsd3VGV3VFVDFoQ1lHVHE3NUlPdFdI?=
 =?utf-8?B?ZklmVWd4b2crcFRGR29IclFyTC9rdzZibDFwSWxSd0dHeC9vajFtdTZkejFK?=
 =?utf-8?B?WGZiRHliOHJrRmx6SWxMZElBamtXNVFXcEN1aGMzTlFxeDJBdmRwSVp2cXlh?=
 =?utf-8?B?UnZ5QlZZbi92RHJ0MVgvZWtxWDZEQ3lubkJEMitaMHI4Vm1WaldaZFEvdEdh?=
 =?utf-8?B?TEJCYkVqWnZsNlhEWFdGbUdiSm9Va2ZMb1JGRlpHZjA4Y2RienlWT1dpamdT?=
 =?utf-8?B?alFoOXZkOGtCU05seVN2WXBLaG1HOHROYXhzQ29CWU1OREZzc0JqTkhMYnJq?=
 =?utf-8?B?bzRSbTBkZEJzUW9ndTFoZStOUTJTbkNDL1BDR0ZpK1JHTlpiR3g1NlVMekFu?=
 =?utf-8?B?VW9WNnU2c2puaTFYUGtYVVhaUm44NDhyalpPeThiRGEvWDNlYmlrMWVyVXJ4?=
 =?utf-8?B?TWdib092NEhOVXVZeStXYS9uWVlKZUh2bE4rM2lDTElDZHNOcFhQWjZNekx6?=
 =?utf-8?B?S1VpY001SVk0MjBDMi9ZRVU4SWNlbGQrT0dzZ2lyVStHYzREM0ZJcUczMno5?=
 =?utf-8?B?NWdSUXNxTEdsTUFBYlQ5S1lZSlV6UVNBRU5IWjVNQ2JYdHA3WDk0NnZ1blNo?=
 =?utf-8?B?K3REMCtaNkk2SHlJUkM3K3Q0SXVLOFBZR0ZpYlB1MXNmNEpBMndOWU5Uekcv?=
 =?utf-8?B?UDdiYXdHclVyaW9tRVBWR1o0Y3grcFMzeHYxZVRaSUdjbnlva1F6cW16Z1Vz?=
 =?utf-8?B?TmpBRVlrSFNmS081RHg2anFqT0poeU1OQ1JHN1NHOHBSWlc1dk9YOWQyeG9L?=
 =?utf-8?B?L0x6ZE1ZMDRyMVJjUjZNOUxoLzZmajNWekVkQlJSOHM2dG5wM0N5UlJESTNN?=
 =?utf-8?B?emZ1RzV5Syt6dHZRYk9xaml0RkZ6OHI4M2dxaHdEa296UkgzdmNFcDdlR1Bj?=
 =?utf-8?B?Y3A5UGcwQ0RUMUJ1S2YzSkVGRW42clMwQ1kwQVVtSjB6MXhhc1ZYR3krTlV6?=
 =?utf-8?B?QXBETWRIbVkxR1FxVFNGZTVjalU2NEpLc1hVZHFGZnhpYThiL2gyb1lOWFFj?=
 =?utf-8?B?U2FhNVRTejVCcHFTcHpBR3dOOU0xOGNjSmwrSkp5azVvRXdVc0tEN05ZUDdq?=
 =?utf-8?B?bG5HQ0xkbnBYMzFHcGtsMnp4Skg5RWI1K0MzYzRWYXVHSUlWak5ZcjFiT1Vn?=
 =?utf-8?B?VC9pQmZvZUxXdjFQNnl4b2hZcit4MGNSbXdEdG5WWndqYzZOREk1S0pMd2Uw?=
 =?utf-8?B?V2ozUUQxaUl0WmNvSmtxRDJma2pCTWNPMlVSaW90TDh6Y0VWejRUZEttd2lo?=
 =?utf-8?B?cmdhS0traU1iTUpFVndpUGxKWXBWOXdzU2tubVNMbFg0MlArM0JtNmE0SmlX?=
 =?utf-8?B?WkJFWjNiZWRFbHlXQVB1bFFjQVg4OUxEVUtUMVB3RXN2MHBxRXRDR09hSWtI?=
 =?utf-8?B?bllSVDNxd0xjbkVBdGk5d210MHNnYTJjZUpReTQrWDBnQUpDRU9nMjhaYUpO?=
 =?utf-8?B?YXJSSHFhSTZNK2JIWmZGendLcDZTRDhTaTJIWHdHQU5LdUs1Yjh0NFI0UVpI?=
 =?utf-8?Q?zY1siUjfEM6lZWuRSLg51ug=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f1d9a3dd-befd-43ae-60bc-08d9e7bd717b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:05:08.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FDSMWpiduqlTLWDhAXAGjmFt1Vx61s0OD8Y8RD1y2MLqw2/5T74S6JxKCqVzatNDYNHsxeYLbicUjvCMqJOOLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 09:05:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161342

Hi Richard,

Am 03.02.2022 um 22:24 schrieb Richard Purdie via lists.openembedded.org:
> On Thu, 2022-02-03 at 09:07 -0800, Saul Wold wrote:
>> When a file can not be identified by checksum and they contain an SPDX
>> License-Identifier tag, use it as the found license.
>>
>> [YOCTO #14529]
>>
>> Tested with LICENSE files that contain 1 or more SPDX-License-Identifier tags
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   scripts/lib/recipetool/create.py | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
>> index 507a230511..9149c2d94f 100644
>> --- a/scripts/lib/recipetool/create.py
>> +++ b/scripts/lib/recipetool/create.py
>> @@ -1221,14 +1221,20 @@ def guess_license(srctree, d):
>>       for licfile in sorted(licfiles):
>>           md5value = bb.utils.md5_file(licfile)
>>           license = md5sums.get(md5value, None)
>> +        license_list = []
>>           if not license:
>>               license, crunched_md5, lictext = crunch_license(licfile)
>>               if lictext and not license:
>> -                license = 'Unknown'
>> -                logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
>> -                    "and replace `Unknown` with the license:\n" \
>> -                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
>> -        if license:
>> +                spdx_re = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
>> +                license_list = re.findall(spdx_re, "\n".join(lictext))
>> +                if not license_list:
>> +                    license_list.append('Unknown')
>> +                    logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
>> +                        "and replace `Unknown` with the license:\n" \
>> +                        "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
>> +        else:
>> +            license_list.append(license)
>> +        for license in license_list:
>>               licenses.append((license, os.path.relpath(licfile, srctree), md5value))
>>   
>>       # FIXME should we grab at least one source file with a license header and add that too?
> 
> I think to close this bug the code may need to go one step further and
> effectively grep over the source tree.

Please keep in mind that we need a full license text and not only the 
license name for license compliance. The current function only search 
for license files with license text.

> We'd probably want to list the value of any SPDX-License-Identifier: header
> found in any of the source files for the user to then decide upon?

I think this is an other feature like a license checker because if you 
have a SPDX-License-Identifier without a license text you have a license 
violation.

This brings us to the problem that this code will interpret a file with 
only a SPDX-License-Identifier as a license file with license text.

Regards
   Stefan

