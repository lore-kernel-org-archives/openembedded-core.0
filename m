Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C85C0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:42:28 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.73])
 by mx.groups.io with SMTP id smtpd.web10.54531.1697809341555953826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=RCxrEElz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.7.73, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDTOJZEQNLhP7dcjYvmAa9BjxilEvbSWgo4FIJXYANBufCpwicP1vsik0PA/gmP/33Xb4ENSytilClslvOvgweMs1UmIyGQBsByeABkfPt+4i2j9lAXeyQaciw0co99dJIqFyJ7MEGwTlkqfwEMEo4+1XMglIB+tCTP92tNeIljarVkH0qxhWm7w5XUohesoMrpsEMBjL91jkUesSS+uMUw+K5sUQkeuaqZi6beBz74yKBtGZBicTAkGRKabxOweRW0YUig8gaj4T1eIcR7xb6ukwL+LD6wa1mClYFRPaYlv2edIPme5z40ICRGM9JA8Ied24uMiSoAvv8Yltc55Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAv2U2eGjQsqeOV/DQz5s7j7yse625dWz8ddSaaQAsE=;
 b=TO6QfAa4T42vxBLpz6Dt1u6llOf6csCYyQIjtqpkZ5v59++0me5cB2tGyq3iEDlRkVrKY5KsXBMkiIZyidTV6klo9ZPiqJM1CmSXwmNA7K5olvq3HGtbqAWDl8uMKWAhbnCxiFoX2ymIW/8+12yQLyY71xoIJ6hr7vzqrZlBU+ksVfRd2yX7WHsF/jt8xRHrUW44pG4Pka4SdIS/u1ZR1tam+7WWgOgGe2o/sumW/U4vUhIZ3ccl/vYfpsFmnMMMskMfhtru0QCZx+6fpn0KjJkrfPLrQMelqxJ4pHjow9TX3Tu7oViOt2NoHO41xviNdbopRd89oBwofR2lL89RRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAv2U2eGjQsqeOV/DQz5s7j7yse625dWz8ddSaaQAsE=;
 b=RCxrEElzhlb8kuDXAz4Ar5Iuq45nnM0PD4mfz7jgupVKiDUK142YjfdSLi/56ci2VuVu7XpSPp96oUAEeY7w3U4Tu3FHl6c0KW+csRudGmJDz546pBPHCYz3CF6laPeU1AwICCCvnqvtVoGOVcYGDFib6gKCw3+tk9GLS2tc2XqfaxhlMtJW02v1snfavisHyXkg+0f5kRA3ML62C5WxbbhuMNZ1Qlb5ZGYLzi8ZXG+lKqieg1zAbUGCdONhksP85LXODn2Vz7QLu05PaEvWT7/5ueXTL4Pq1cMji47HGyc4s0eV8lkfh4rVdD5lrgbukZjheXv0n3z3dKRdJ2b16g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6524.eurprd06.prod.outlook.com (2603:10a6:10:123::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:42:17 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c%5]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 13:42:17 +0000
Message-ID: <d96313a1-5ed6-4ea5-977f-84c21ba0c37f@vaisala.com>
Date: Fri, 20 Oct 2023 16:42:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] package_rpm.bbclass: Support compression
 override
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
 <20231020124450.9736-4-niko.mauno@vaisala.com>
 <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF000013D9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::15) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c374514-3531-4386-3e20-08dbd1726061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DDdYuJXsvHI36Y6QzkX+7RbJTd6UKgLjm4TWDhD5r+i93cWr2157gWngckmCRfgLIwYmRW/hIT9N3cdOVKVdfmBzQ9Jp3VqxKct/ZRLQNaLZsPkXNtGUSReOW3iDkV1Q1AqkF4RjUnAwO2gLrwcbMxJTrOK731glYD+0LagKUtp+iHfAWlKY5yXS22DAgOHy+i/sbSpdtNriuq/f3wCJmC0Rj3Yg8/gUwVeB5nQ9Le58Arv6L2NOOTSUYt7MXRTAUdWLgah8CezOe1Iv/vr8KRH/Oo90SAFrGPHdKt6+obeQ2ilzVTJNq3nXJPgJEOe3CeKRPj6ULsen1xg7+td5vajlWI9rq52XZA7+3CFpA6nQnXOea+Upcr5MwxsVMyrx4Z+JemWgM2YwBeul+JEtkiiH0ag/WoEfBKI4+h0LfyRkhhS84SU5DpaYLoByYMfOoVkNuw2y+mgEF3J5RGQaezOmR6SW8v+ex3OgNwAh/v4QqoC1RnEHsVNNp9nOrdL4oS5+rNFMlGs7QS/FMgieMBFhmHsgRwwPLShmhFHEJb0WeuaSrlDYeQIF4k4o0V3dj4iyq/fBtzIGxm/Nf0+wEdi9vVn6g8iAUamnBhp1Wb6xpKXhLoZ+YbiaHh30/P3FKpglV12N20lAkbxwsc9M4w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(31686004)(38100700002)(5660300002)(36756003)(41300700001)(44832011)(316002)(2906002)(8676002)(8936002)(26005)(966005)(6486002)(6512007)(478600001)(66476007)(31696002)(86362001)(6506007)(66946007)(66556008)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjA0bUI2M0JYRkNqSmUwU1VsbDYwZXFkL0QwRlNpQkRvQnNvZkpEeHRPUktw?=
 =?utf-8?B?OWVMNU9kQzdtb3BZZjRzNnBEaHFWM1Y4VzNDK2FCaS83cDdBeXJzeGFjNWJy?=
 =?utf-8?B?RVFjNXYwaVoyYmdDbUhQQUZpK1hWUy9wM3pVdDJ5RWJ5UUxHV0xZZ2NlWmtV?=
 =?utf-8?B?Z2N1ekR2RWR2K2JubkZtMWJGQ29XSVRaS0FSQkY1cmhNbUdaMjdiSVVRUnRT?=
 =?utf-8?B?RFF3NHY3WUJYRTdtSDRSaElxZHg1Y254QVVMeVVZM2RSZGRQcFVZbDUwbUpp?=
 =?utf-8?B?SjNYL0w0YVFMa0pjWGk2am5LakVxbE50N2FmRU1wMjVmVkp6V0pkTzN2ZVRt?=
 =?utf-8?B?N204WTROMzdCaXJkMXBCTWRnNWIrTEZZdmdDNXhqNFR3N2Fla05Pa2ZBNFEw?=
 =?utf-8?B?cXd5bm5LY1hJMVlCVUhiUHRZSzVyZ21kNHk1dENoQnlwbTNsbDB6QjZWanVW?=
 =?utf-8?B?bElxUFVtRExKaG1WM1M5UTNBWWh2alQ3Y01kSmV2RnpldnlpRDRuelBxQ1M2?=
 =?utf-8?B?Z2RPL1Q1M3pKSzA5dkJ1cncxRGNONCtiSFZsUHM1anZ3N3VrY1BlQ0xQcXVN?=
 =?utf-8?B?VU5FSlR4Y2ZBemtnb1NJdjRnajg0UTU4alNRZTYweFJNQWd5UENmN0FFZkVw?=
 =?utf-8?B?eFlwbFVyVyttcnE1dUordXpYaXNtdW5LUHZsZEY0emh4elR5SnpqUkdQajV1?=
 =?utf-8?B?RE9pb2l5VXg0Nmg0b3I2MFF3TVBTc3dKQU9EanlXVnhhN3dPZGlERzZrZlhP?=
 =?utf-8?B?UEQ0VW9jMmJuVEpUVTl6bmdEcUJ0d2VuWGx4WUsvcGFHVStmUUVGLzVoSWZp?=
 =?utf-8?B?ZlZxNjRqaXAzQXFPQnNZdWFib0c4Q3JFaER2VTV5ZnBjVzdiMmhnK2Z4cTU2?=
 =?utf-8?B?Ykg3OW9uZUNKQTJObDhva0o3aDZ1SDVHVCtPVEtPM2VUTHRWci8xNWtsNXds?=
 =?utf-8?B?VUN5ZmdZMEMwWEVKY1lxK1NONWVMWEl4aE1MSFFNRHpmZGg4QTJZenl6Qmly?=
 =?utf-8?B?RkI0YUpjT0RLQTNKMXJpYmw5bGp1elNTZ1N4TzZnRmg2RzExWmszY3NMSjR0?=
 =?utf-8?B?eHZrbWVxQmhDTGIrSFhWQUdXNWZBTllIeVlsM21waEVacEVVTXVhNmJZd1lF?=
 =?utf-8?B?YjNOYjR1L004a29QSnN0c2VvQWI1MERaSlpwNFpGdTZ3UThqVFhNTHR1QlF2?=
 =?utf-8?B?QUVESzIxSDUwcTVEeGcybHl0ZUFrNXNWNERTbnRIUWVJSCtGTlRYT1B5cDB4?=
 =?utf-8?B?SjRMWWgxVHgrTFJJblMrbFJFL0syalJlQVoxRElkS3JxK05lUjVaaUFhZHNP?=
 =?utf-8?B?S1RaTFQ4Rk9WUkJrWmUzRzJPVzk3Vk1RdVZob2FWM3B2dVluWEVhYThIdGNj?=
 =?utf-8?B?NUtrQS9nNkI2VjBOVEtTcmVEWnp6N2tDeWNUV0E4MU1TdU9URi9JNnQ0SHln?=
 =?utf-8?B?L1dsZTl0MWRaR1VhMkFsSTRXWmh0TC9yd3NDQWR5bjEwTFFYNkJZZ1RsVER3?=
 =?utf-8?B?VU8xcERTZlAvb0FKOWl5NmZjSWcrYUluUS8vamZYeFQvWHBVZWIvdUFIbkpw?=
 =?utf-8?B?QU1OTlhmVmQwUGZmNmFkSDY4NUtocW83YVdIWHpNd1BjaTFrRUxVYlViU29Z?=
 =?utf-8?B?OUI1cGNxZmlSekVYRWF0WG8xd2R5SVUwRGxDVWE3bHlTNXdTRUJHTlR1UlRu?=
 =?utf-8?B?RDBBNXZ1QWZXeFFndU05bGNqcnJadzI3bXUwdk9KUXJITktlVjJsdmZud1VJ?=
 =?utf-8?B?RC9tcExMQXl4eC92ODg2ZXBaTEZ2K05ONWwyNFJ3Kyt3STZyc3hPdVRzU2xD?=
 =?utf-8?B?cmdjTlhraS8rV3dsUXlSazFpMERzRHkyL0dhYWtmKys2UDhRTzcraE9QK2tw?=
 =?utf-8?B?dk1ZNTBSVStaMkpLaGtNTVYwWWk2R2xBS21GU2s5QWRYbFl2MHhQYjRTUys2?=
 =?utf-8?B?QTZid2ZNcnBUY3R4ZVpsUjF0TXMwczZNd0U5dU93T2Flb3JhcCtKV3BUZTRV?=
 =?utf-8?B?aHpGeDZ6c2FRa2s3ZkZHNTdvOThJc2VaNzBsWDNmZEpoTUZOSzFpZ0l1K0g1?=
 =?utf-8?B?MENLL081OERCMUM4WGJ2bUdncHprSFJON0xYUk5HZyt2elpUeG1nQmFvN1B4?=
 =?utf-8?B?RmxYWUZ5RnFhYW5WYnRQNTcyaXdSd29wdUJ2aHhmQ20yVmZJUEV0MVJETGl4?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c374514-3531-4386-3e20-08dbd1726061
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:42:17.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSutU+ofvlmJTGHYNReJEEEERNSIeSwCeawTBKhekrmrM5d5g/EqK6Y+guqhc+3d5BKbJO59ETOtUtGQ8qWbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6524
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189532



On 20.10.2023 16.00, Richard Purdie wrote:
> Is it common for people to need to manipulate rpms on target without
> rpm being present using busybox? Do you know if busybox plans to add
> zstd support?
> 
> As far as I could tell when we looked at this, the rpm world was moving
> over to zstd so adding in conditional xz support for a limited use case
> probably just creates a maintenance headache going forward as it isn't
> something we test or plan to test?
> 
> Are you using this on an LTS release or master?

Hi Richard,

After moving to Yocto Kirkstone (LTS) which we currently use, we started
getting developer reports of 'no gzip/bzip2/xz magic' error from BusyBox
applet. For example developer uploads an rpm file to target device and
then unpacks it in runtime using 'rpm2cpio <somepkg.rpm> | cpio -idmv'
command.

We don't include rpm package on target filesystems as that would
increase rootfs footprint approximately 5 MB. Including only rpm2cpio
from rpm package needs still accompanying libraries, increasing the size
by 2.5 MB approximately which also feels too big.

I checked the discussions from BusyBox mailing list and found that in
2021 the maintainer seemed reluctant to accept the proposed zstd support
because it was not optimized for embedded systems.
http://lists.busybox.net/pipermail/busybox/2021-September/089179.html

BR, Niko

