Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BDAC25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:56:21 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.125])
 by mx.groups.io with SMTP id smtpd.web11.17697.1716472580051171251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gnGgvsYU;
 spf=pass (domain: cherry.de, ip: 40.107.8.125, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFtnwYaegvyaIm+2h4hxenvATb3kNeImEPWg13EYE6Nlsn3Z46HmTNgUiB1WwuHck0YbcAUTYKynUfnpAR1zP1a8TTM/4VgZKh/IQgIUskwL2AgWfq8WQqUDuNp4xqzM6Nkjbr+UzP44jNoPeL/gtHnrokg/gH5UV6XxkaCtRRybPACZneDZw5koPD9OYpzbqEJuk4ukS/lyUNdjzUCQx5HJARSkbGZVO3ygr5YIyHzhaMLS0KCBx4MncW9zp8IsoCG88LPG5BLHqLhVgr4SbiMvZ9rdpdIarCPT00F0V1f62bDlVr1W6ef82xgGcRpZOetAtlo3htKVLZEQ315Ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX9j4FqPyCXcHMDwaprzEzPwyGf18HXOX7f2PLRjzyg=;
 b=k5iudPqAYF7c/6Dra0swVMojqgIf9r/LM/Uzgz2v7H6FCsKl6KraTvQe+NzRFbnoP9/d4gOCwADQbp3uFrxtMO7itKtiC8fgeHrYp7nyJD34DpJMNeTlpobGGBT018ycCssI2PjMzkLspt2Tr2iCCzLlu5v7V25GgLnA503SK4uZfNlWDaU4JdZ5M04mHLNDdG0XcR6/o1chcbwDNpd3vvTGK7+3z/ZSKxm6wBqrsy03ly0U/XB5tPTcn4VTYkZTY12aTD0K2lhwAGMzQw2+fx50Qt4J0w6ngAGrVQbU1BHDUq54jY8dhptXBdeiAzZWoSC0nyq17WJ1J65sIJEa+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX9j4FqPyCXcHMDwaprzEzPwyGf18HXOX7f2PLRjzyg=;
 b=gnGgvsYUNgasHFdX3Ksi0gS5MtOzwiMOq3oXk7I5uOf6gFUO4NkkllrPXepa1owSO+QHB89y/bH3f8fThnJeIWMhnxz/2sOvZa9bUMNtVNv5pN7/4mT84hxv2kRTfzYu2gksy/bo5hWbRCNwWfSRL7GihWG5m0kJTiOjE+BH7t8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 13:56:15 +0000
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd]) by AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd%3]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 13:56:15 +0000
Message-ID: <7e116c9b-82ad-4359-8b7f-8e15e4b14d62@cherry.de>
Date: Thu, 23 May 2024 15:56:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] image-bootfiles.bbclass: new class, copy
 boot files to /boot on rfs
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
 <66c6fe23-dbdf-40a5-ad5b-393b4d1239f9@cherry.de> <Zk9JakPbu4jT65op@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <Zk9JakPbu4jT65op@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::15) To AM0PR04MB6578.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_|AM9PR04MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 60960814-278e-4d4d-f5f7-08dc7b301d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YnU4REovelM4M1lPZUNzR3hZaE5PaHlwUVl0WVFzQm1TRDdZdkIwcmxxOTc2?=
 =?utf-8?B?YWFxaFJWQkFXVTYxeGpFVEI2THJaVjhOMTh1dkplM053aTVZbUE1SE8xM2Vq?=
 =?utf-8?B?UFlMdnk4OFQ4di9pRE8zYW1hZFFDd1ZrdjZqcHVPdjgvSlAxNG56S1hMZnVB?=
 =?utf-8?B?a3d2SWhGNXlTU0FCSjIxMGdjQUpscVd5TTJ6RXlZSXNBZ3JtM1BtTWJSUDNk?=
 =?utf-8?B?SEQvWFZ3U3grcE85d0ZvVWlGblEwb1Y1b0M2aG4wanVoMmx3Rnh4MTBOb0Rm?=
 =?utf-8?B?T0lETlpvWWZJNEFEdURnZ1N4VDlOcVBrZ1hGTkJXZFNtVDNzQ0Y0aGVaZ0Vt?=
 =?utf-8?B?aEVXRUR4U1l6SzY3ZkdHWDAxdmIwc1hZZmp4aTUzNmpmTXFsaTNEYjh1QjBx?=
 =?utf-8?B?aHR0UWhqN1VFY2VlWmJoZDY1Q0JORVpJNjQ4aW5XeVFEQUtJbElFSFJPdWw0?=
 =?utf-8?B?KzhvZ0Vud1JoWUpBOWhvQlYwREZJRFQwL3NESmpnTFJOZUlONk5CRnZTVnVI?=
 =?utf-8?B?Qmh1UDk5WERGRWZEWUdTODBDcHRSeGtEL25MUWNjTi9CbktBYzdJR0l1Ky9j?=
 =?utf-8?B?dllZaGhNTW5ZS056S0VsZkRTQ3RGNlZTTjlNQ2gxbUJEUVM3MFgxUjY5VUw3?=
 =?utf-8?B?OHNVajdvTVozRTBja2tTVFp4OFd5dVdaZ0MvU1Y1czdYVVRIb0pOelIrcmIx?=
 =?utf-8?B?MDhjYmV5TTY0Vk5vdk9SeUdoanFDbC9GRFlQaFFYazArajgxaWZremRYS0E0?=
 =?utf-8?B?RURYS3YyNzZKMURMV2NoYXQ1MUVyR24yL0tiNitaUklLcHRqZm5Tc1ZuQmN6?=
 =?utf-8?B?ckFsM0pVZkRzMmROV1UvZjVyUTI3OEdFeC9UT0lNWEI1NlhCbFhEVEhNelI5?=
 =?utf-8?B?YU03ZXAvZ1Z6elJaWXZldmdaYkZVWHlNNjVSbjdPUUxFVVRDc0NzaDZSaEFq?=
 =?utf-8?B?ZnkwYU41eks1OG8yNTUwR1RHNzdFd2IyZ3NHa2w4MEdaaXo3RW1vUHQ0MmZZ?=
 =?utf-8?B?UEkxOGZYeHAybkxpR3FHZi9oVlp1ckVHR1o4bTBRTXZVWGYzVjhWYXgwMURq?=
 =?utf-8?B?eFZSandaSlkyWnNUTzhEaWd6cFVIMzZLWHRNOW93RXN3K0ZBek5mM0xBdytK?=
 =?utf-8?B?NFVEQWZCZUFDbi9HSEgrMGdyTjBPZjd0VUczL2xGTEZoVkJManZJeko5WEpH?=
 =?utf-8?B?djRxZ3RqTWxqZjhabjBqTldPdTJwNTlyNVJPMjkreVpmbURrdGcxT0cyUDlC?=
 =?utf-8?B?NGdNREh0Z1h5RCttUGVHZlVYS2NkNjM5RDdrQmlBeWhMT0RMSWV5S1o5N05E?=
 =?utf-8?B?ejUvaWlVak9UL0xac0lyNHJ5RUpGcGJnYnNEMXA0dmVoN1JweThuWjJKUWtV?=
 =?utf-8?B?S1lPaDNzalkvREYzSlhraVRKa0RFMTgzYnM4dldpbWFVazZubmQzQjllVDg5?=
 =?utf-8?B?ODZFUmFacjJiZTVDVWZpQS9UdE9FK3V0TGc5SmhhbXVCZnNZbHFrdjdWazBR?=
 =?utf-8?B?QlpXLzVpK2JlcUZYYnYxUDQ1ekZQazlPNmpEVVlCRWw5L05YVGx6ZmtSb3ZP?=
 =?utf-8?B?N1hSeGcyN0l1L2FEMUVRY0hyQnljbFo5eFRjenBYT1k4TUNtbTlhK0lUQkhD?=
 =?utf-8?B?Rm40ZXgxZTFSbnlIY0JCaDl6TXFmVi9VTDEvWk1adW84ZUhBeUJLbUJFeWNh?=
 =?utf-8?B?YThXNEUwWS9mVGlNbjVDdjZHRXFHK1l5aVk4b3BYYi9PN3pxUk9aNG9nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1NWQWZDVEsxZW5JK0QrTG5GK3o0MmtOaE0wSUpSVEVaV2k5alZWVlhDek5F?=
 =?utf-8?B?bGEvTkxRVWttWm5VNHNqbENLczBidEE3OE1OT3dsWVpIOEw1Sk9GT1dHdVNr?=
 =?utf-8?B?NTI3S3VPYlA4VkdXZGdocDZyK3FCMkpPcjR0YzFxeXErMUpTeFdhTitqbmg2?=
 =?utf-8?B?TzJ6bXhuTVlPR0pMNDZqcVhRNGRORGhJZDlvVlY0WC9oM3NuR0RNMk9VbTRu?=
 =?utf-8?B?REQzNFZYZGQxVTNnWWQrOWhmYTBQWElRalJuMitBdzVxMDlWNFV4QjU1d2RG?=
 =?utf-8?B?SERaVmZRTUxPcFZsRUJoS2wyWVkxRitDdGdoT2paRHdQamtoRVhncTQwc2t6?=
 =?utf-8?B?WWM3a0RkaW5sQXV5L1lCU1FnVG9yQ3dpQ3NkamJCbmtoNVhLNVlETmgyRGlC?=
 =?utf-8?B?MVFBbCtNN0RFeTdEYXhEMU95K0YrRW50Vm1oSUYxdDM2QzJyZmhqVUo1eFVw?=
 =?utf-8?B?NTVpNXBMWTg3b3o5QnNMUzFVQ2k3V3o3UFFEQnJwN1VtVnV3b012RmZmVnA3?=
 =?utf-8?B?VDlmazY5TXU1bmNaQzhDMmd5bHRidkh6UW9mUExUYWdxU3ZEMTVDaFB1TGlo?=
 =?utf-8?B?c0NudFlLWU5sTjBxZnIycWJRc1FpNzBsT1oreGgzV0MzdEd4S1NZdmQxdVBk?=
 =?utf-8?B?T0RYWkpYVFIxV3o2RHVyTm9rcHo2VnZQZ3cwNG1xRHNtY0NXS3RUTjVvZnRi?=
 =?utf-8?B?WGJLbyswbTZWWTRpdGtidWlueGxOdVJTZUtZQ0hoQVlxL1RncWdEKzBlN1hy?=
 =?utf-8?B?UjZhdy9vd1ZGTEJjR1ZnTXFadmpiZXAzTHFhM3Npa0xTejYyUFFkdlpOd0VD?=
 =?utf-8?B?ZzVVeTQ4aFN2cnA5b0taZEhyTWtSVkZEb0NUZU5rQ0VqOVpDVXNZb0JmRzU4?=
 =?utf-8?B?UjRwbTFBaStlVHYveTJocXBXbExsbmU0bGwvMXNSbDRGTktZMGhtOGorUzlK?=
 =?utf-8?B?WlBqVTJUYnBYTzdzZXRJRXNPd2hxREpDazFKVHMwbkRuaGxEU25JcTArK3k3?=
 =?utf-8?B?OGtMTCtsNWJoTnM3TDBwRnFBRjFjZWhwTzE0MXR6WXhwa0tNTlJIUFpML3o4?=
 =?utf-8?B?d0VrSTZ6bmwyN2ZaeTlwd2d6OHd2WURja2x5OThOeWd1eGhWWXRKWTN1MHZH?=
 =?utf-8?B?Mmx0Qis4QUUxZzBnZUJTU3lyQzE2NTZvZEkzdVpPbUdRRGlnS0JyczdqV3ZK?=
 =?utf-8?B?d1V2VjI1eG9kMjc5REJMM2RzVzByVnZ4ditPQ05xMElWUnEzMXVHdFZsV2NC?=
 =?utf-8?B?OCt2NzlTVUszRkZZd29yellMa3ZqbTN3dGI1Tklwb1o3NTNsQ1FhM1N3UnV2?=
 =?utf-8?B?UjAxaDFabzVUa1BnUnRsNmpqVzVhaDJlcnJjK2dsOVpyK3V4VFJzeVB2ZTRr?=
 =?utf-8?B?WmlDSkNORUxsSE9jNkZhcGFZeERXSG0raHJ5bTFkM3J6bnhwWGRsSFhqZDlP?=
 =?utf-8?B?SG1wU0oyMFBHZU1NQ3JCaHBjUHpKRERReTlERGdqWC95aGQ5cjNWNk1oNk1r?=
 =?utf-8?B?NFIrU3I5VmNaSVpxY21Fa01DZTRkZWdmZmpuNi91Qk1pN2NMWnRFZDZkOWN0?=
 =?utf-8?B?MlZucVEvYXRVa3ZObnVJQWsvcW9HK2lMUmNINzJsbDVCb1FQR0tzVXd4eXhn?=
 =?utf-8?B?eDBoRnUvVXFBTHpXU3o2ZDFUZG96cWM1bnhFMjNPUVBBTnBZSE93c1hDWkNE?=
 =?utf-8?B?U3diT0pqQlh4cGk1ZjVUYUhNUldZZ05waTg0bFUzd21UQVYrcUlOODAydFBX?=
 =?utf-8?B?VnlLWTM1R281eHhveWk1YzlNaDBBaW42VkJla0xlWTlWWGlWWWp3MWdod1lD?=
 =?utf-8?B?L0J1QllhMmhHdU5WMXlFeUZBVkFsa1l5dmpUcUpua0FnNmc0NjRDNkthZlNQ?=
 =?utf-8?B?WFc4SWhuMDArSXYyaXJFWXRlOWI2M2hIZ29sYXBPcjIvdld0cmFXOGxROFNL?=
 =?utf-8?B?eVR5ckJFVDljSzRyOUdPWVM5akxUSjEvd0kxUit5ZHZ2QlBTTWZZdTgvbldm?=
 =?utf-8?B?YjZjd1RGbUlNRTcva0FFVzdFRXRjeE5oR2JKOWRTY0FkSHRLR3BzanhKbEdH?=
 =?utf-8?B?QlIydEtQakluTi9tTzRMV1BmYzY1QXlDVWhNRzd0QlpxOWFRZ1UwZzRHQ3o1?=
 =?utf-8?B?WWdHVW0rRFV1TWgrT2xrSUZvc2I1NzRJV2xCd0RJL2RVczZxSmlsdUhIOGQx?=
 =?utf-8?Q?Ksbr/uu8L9IVDX2YNUwgngs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 60960814-278e-4d4d-f5f7-08dc7b301d06
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 13:56:15.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIfFqvLzjTlXWqD8Q6w7eXqeOyJDtzU0EabFz695sQ1nui4fH5Tr5EiT+kFOm/lkCsTPYSti8qhWMTBnasCM4RswEnSuP1yGweHRmKvZaG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199802

Hi Marcus,

(First, sorry for the typo I made in your name)

On 5/23/24 3:49 PM, Marcus Folkesson wrote:
> Hello Quentin,
> 
> First, thank you for your feedback.
> 
> On Thu, May 23, 2024 at 03:26:36PM +0200, Quentin Schulz wrote:
>> Hi Markus,
>>
>> On 5/21/24 7:33 PM, Marcus Folkesson via lists.openembedded.org wrote:
>>> [You don't often get email from marcus.folkesson=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> image-bootfiles class copy files listed IMAGE_BOOT_FILES
>>> to the /boot directory of the root filesystem.
>>>
>>> This is useful when there is no explicit boot partition but all boot
>>> files should instead reside inside the root filesystem.
>>>
>>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>>> ---
>>>    meta/classes/image-bootfiles.bbclass | 69 ++++++++++++++++++++++++++++
>>>    1 file changed, 69 insertions(+)
>>>    create mode 100644 meta/classes/image-bootfiles.bbclass
>>>
>>> diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
>>> new file mode 100644
>>> index 0000000000..850e14e4bb
>>> --- /dev/null
>>> +++ b/meta/classes/image-bootfiles.bbclass
>>> @@ -0,0 +1,69 @@
>>> +#
>>> +# Writes IMAGE_BOOT_FILES to the /boot directory
>>> +#
>>> +# Copyright (C) 2024 Marcus Folkesson
>>> +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
>>> +#
>>> +# Licensed under the MIT license, see COPYING.MIT for details
>>> +# Inspired of bootimg-partition.py
>>> +#
>>> +# Usage: add INHERIT += "image-bootfiles" to your conf file
>>> +#
>>
>> Since it's in meta/classes, I assume we can also inherit image-bootfiles in
>> an image recipe?
> 
> Yes, that is how I do it right now.
> 

Would be nice to add this to the comment as well then, so people know 
their options?

[...]

>>
>>> +        if ';' in src_entry:
>>> +            dst_entry = tuple(src_entry.split(';'))
>>> +            if not dst_entry[0] or not dst_entry[1]:
>>> +                raise bb.parse.SkipRecipe('Malformed boot file entry: %s' % src_entry)
>>> +        else:
>>> +            dst_entry = (src_entry, src_entry)
>>> +
>>> +        deploy_files.append(dst_entry)
>>> +
>>> +    for deploy_entry in deploy_files:
>>> +        src, dst = deploy_entry
>>> +        if '*' in src:
>>> +            # by default install files under their basename
>>> +            entry_name_fn = os.path.basename
>>> +            if dst != src:
>>> +                # unless a target name was given, then treat name
>>> +                # as a directory and append a basename
>>> +                entry_name_fn = lambda name: \
>>> +                                os.path.join(dst,
>>> +                                             os.path.basename(name))
>>> +
>>> +
>>> +                srcs = glob(os.path.join(deploy_image_dir, src))
>>> +                for entry in srcs:
>>> +                    src = os.path.relpath(entry, deploy_mage_dir)
>>> +                    entry_dst_name = entry_name_fn(entry)
>>> +                    install_files.append((src, entry_dst_name))
>>> +            else:
>>> +                install_files.append((src, dst))
>>> +
>>> +    for entry in install_files:
>>> +        src, dst = entry
>>> +        image_src = os.path.join(deploy_image_dir, src)
>>> +        image_dst = os.path.join(boot_dir, dst)
>>> +        shutil.copyfile(image_src, image_dst)
>>> +
>>
>> We literally iterate three times over the same files, I don't see a reason
>> for not merging those three for loops into one?
> 
> Yes, that is probably better.
> 

The code already exists, it's probably robust thanks to the test of 
time, so maybe not worth refactoring until someone complains about it. I 
assume we shouldn't have hundreds/thousands of entries in that variable 
so the cost is probably fine.

>>
>> Also, I now realize that this was heavily inspired from what's in
>> scripts/lib/wic/plugins/source/bootimg-partition.py, would have been nice to
>> say so ;)
> 
> Yes it is, I have this text in the header
> 
> +#
> +# Licensed under the MIT license, see COPYING.MIT for details
> +# Inspired of bootimg-partition.py
> 
> Maybe I should make it more clear?
> 

No, I should rather learn to not skip whatever looks like a license to 
me at the top of the file :) Sorry for the misplaced complaint.

>>
>>> +python bootfiles () {
>>> +   bootfiles_populate(d),
>>
>> Not entirely convinced we should have a comma after bootfiles_populate here?
>>
>> More general question:
>> 1) how does this work if one has a boot partition created by wic (via the
>> plugin bootimg-partition?
> 
> The images will be copied to both the partition and /boot.
> 
>> 2) shouldn't we factor out this code here and bootimg-partition's? or make
>> bootimg-partition somehow call bootfiles IMAGE_PREPROCESS_COMMAND to avoid
>> code duplication?
> 
> I would love that. Not sure where to but it though, I'm still learning
> the structure of poky.
> 

This probably should be another python lib or something like that, maybe 
in meta/lib/ ? It's a bit trickier since the wic plugins are not really 
any part of a recipe, rather pure python stuff, so a bit different than 
the usual way of plugging stuff in it the proepr way?

> I'm preparing a v2 with an indentation error and that the installation directory is configurable so
> that it does not *have* to be /boot.
> But I will probably wait one or two more daysto give people a chance to
> give their comments.
> 

Sounds good.

Cheers,
Quentin

