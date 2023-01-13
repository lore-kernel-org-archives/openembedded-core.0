Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D476EC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:51:36 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.76])
 by mx.groups.io with SMTP id smtpd.web11.93072.1673628691475902794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 08:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=1hhZeL3s;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.76, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPsFdAnz8xlTt/p7Cgb14PAA6CHwN4+KqzDprezHGQiULysoNJFdQ35NIPMrW03R/XAevf3VucUApWfEuOBj4h6B/TiqNmvdVhgGZX+c6XhWGSTbcyPxyoXxkhEC6aEbrKHRaLUoDDPPaoyyX3dU8wjBlWljI01BadyaVqw45b773mMeBSa452g3PVJCm9ViHw2lruFRQI7CtgoW96uDUGcRdGeA4deiTNbewUL466lurNT0urd1MaA7/fRUszd18AlfzdQJFo3gYHz+YzY/xuAwBvhIgFQkrJN+J1KhDFwDqjOV2c551UFBNCGSecy5Aygk+w5s43ils7SwffY/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo8M7Zy+IjkGDOGQ8xM4aEHTlOnrgoHs9nkSHzfsIEY=;
 b=mVcrJOMnubdoAz3taCq+KCzacvb4DcNGLhX+xiFAJ9T6sAhCOn3kN6yRcfzrJFI+P/S3bua224RBIQ3VSqszJNW+fGUubwcInY37Iktf3EiaKE6b1FpXxjBovFrM1LOuLD3a/W4clgncAi6lA/29CwYj2Ohn0kv5pufhLCOJuswnAs6143bLa1FDyBhRh1y2levnAmrsX1mF43kzegwX//Rm7RO+q859gcupzd3MpLvr+Rd+5ULtk+aV0YgTYsFlTaEd6FVpIlQIgDuV+15Zn4f9QQShcbhn4bS44Vd8rLIZqGkgmQVApdmrXKCiLzPsXQa8219nFjRcqnbzJ4PEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo8M7Zy+IjkGDOGQ8xM4aEHTlOnrgoHs9nkSHzfsIEY=;
 b=1hhZeL3svImlx1gVv5R1w2njf9Kh4rwOQ4d65gjRmYvexwGSEycg/X7n9uuSW5CophhDbSDXH+MCzR+RfKAsWqwHzdvDm4V2V98r4Ip1a+6DnmueMk2krBHERRsPvvVcXVCTUcji5zvTbwS4hq97AnzOFwoEEZIJoc5X1BfZOB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:51:29 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%5]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 16:51:29 +0000
Message-ID: <f8fc990a-fac9-3cab-95e8-19c62c05f907@amd.com>
Date: Fri, 13 Jan 2023 09:51:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-Core][langdale][PATCH v2 1/2] kernel-fitimage: Adjust order
 of dtb/dtbo files
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>,
 "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
CC: "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
References: <20230108172535.2366114-1-sandeep.gundlupet-raju@amd.com>
 <89dd40da-14b3-7535-0177-acce59fa087c@amd.com>
In-Reply-To: <89dd40da-14b3-7535-0177-acce59fa087c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:a03:100::16) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: febe0ca6-f61f-4954-3758-08daf5866aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IRApWFKavLQJlRMVc3s7J2sXr1/pXoRSdNVnHjoCZ6DTwop6tUqjZwt+v83tl12CFTjpnXX11Q92j6a+rGW1XxGBEZk9tqyrf7pTe1PwaWEeZlhenSX3sgEVSvO+qWFDRJ61rQY2o2kgQTsS77A9YTjD3FqsFNMhmQ1juP6D+iiwSKySFgOmlwrNxhlMuRVrGc7HmGcx9eo8I6N34HAw2FRlNzCA5uszCMHT7SgtlCLxBgZl7Hkyjd5YIjUofM0nCdDJwz+JXVHGta+aICCCPluSY40XuH3AnrM6YyLDyOkyTEWbsKDJNvQZlzzvWyKe/HZqASjFRXVLv9qV3ygpIb4UFZE+OvikNZlqIZYvRh7iywwWzZCGrBlbZiPeuXZXsUFpmf7yLLXuYR8jTICqfV1psMKSbmi6jMJGAyaoyck2KiFsx32MzqUBslJOOuQtpB0Koy1Fj15rVZna6JwFmcqgwglccpP6Uo2bI35yuMofp4ChO2gLnpMs/rD4v1dmuJ5tiWctS6tjixMi0BFEs5ZUpUOKSud+pntQvv6b3+hornuBo2+YGGKLmyf0LPWV1BXn5fhpqO0MtCm7OJFXc1XwJkxOTQwlv9p2FTlqH4SAqwBaW4REGbdak+P0GGCs/2Cdr101a+8J17Ck3HqEOhQ2Vtwm2ZKm9Cx4RXVe5qerz/seUwRGxjs3n3+iDIGtniqVYD41hYbxySwmotgy7Busp9HcoRJaYNDN09K9Kec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(2906002)(110136005)(5660300002)(316002)(36756003)(2616005)(38100700002)(83380400001)(6486002)(31696002)(86362001)(26005)(6512007)(53546011)(6506007)(186003)(478600001)(8936002)(8676002)(31686004)(6666004)(4326008)(66946007)(66476007)(41300700001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IVfKvb6KBITX1+IUqpzv54nhGIu2KUGFFqOmzMil/pHxHmC08ucJFGQbv4jT?=
 =?us-ascii?Q?IxbKk+Ls8C0SIqPL0levBxQo+6walHRvqnVsKZun4ipZvDy49fiPvuIYptzZ?=
 =?us-ascii?Q?TaavR+TruFhRRlkTB6TmzKmO8COHG6dNUCJlN4qHV2DxPAihc/C1H/vg4QQu?=
 =?us-ascii?Q?8UDHexDhKeM0X0ykw30zhlfR5ZU3YB6MOafysWPn5JzAm6AvvuEd3kI5G8+H?=
 =?us-ascii?Q?NFz9qOoWRfXl2nWwYUsNMQGlBJli5OSDUYuxAGkm5eDfz5xpCFT9LJeya46Z?=
 =?us-ascii?Q?+Qkaq8ZGSHiU+2Q2vcA93Em0FMZ513tLsYS04xCyKwPsaRwilHQ8+3SATd2/?=
 =?us-ascii?Q?c9Imto1QsEguXumaBotr6QTeO33nOHNT5HNEmVqim21OClCWPfnrq4SsWzHf?=
 =?us-ascii?Q?MiT6znCbEW7w3oe3XyJSjW2Vf/i/uyaRPVKwgmleiJ0OJVzjZYIDUFcrXX2J?=
 =?us-ascii?Q?9uk+F1AGIM7kuN0EfRIYuEiKADEsc1L1Zkl4B09K+7rV6sPZpdBeBKI152Qi?=
 =?us-ascii?Q?2UH85laMSuSubcoNj11tZe3UMD62f0iypN6ZchdY9SWpkYdMBJ2je6O8RysV?=
 =?us-ascii?Q?9K+VBlN0qg1suTQTtQ6c54PowPGrhLcXvAKfrJ7AZAgHPbliZxSJfIowguBj?=
 =?us-ascii?Q?U+QSiFnC+I91E/2ZvGeM+KBEAzCQ1OdtoG90Am4S6cq4V94Of42sKKntWhV4?=
 =?us-ascii?Q?Iy9jpdBW7sTTzOsKSt2e4ER387BuZEuSCcLv4ziZKVV+C5IAC4Vl5JYdiX7a?=
 =?us-ascii?Q?OegauMMQVEfZjZeBa93GpfttxUySGAOn3XFmtniA2OKWSb4Po5Vhc4uHOrgg?=
 =?us-ascii?Q?vjKkycnu1o5GPhZXV76jbqmmFLKTrX9slY8UtqW1NxsNxtQRlNmZXsj99OC2?=
 =?us-ascii?Q?Opk/R+hDrTOAgD5MUbeyb8XpNX/TcK8xHaVAZCR8grfgDy5qc8M7Ky/uw6Kp?=
 =?us-ascii?Q?EpXffsPxmKaQNKBEqFoXHtRWtckRNxaf+DHdsPhMJFczrXxuIzCjlIRwZYDo?=
 =?us-ascii?Q?vPDtII0aHNmdZVHCph0XHiKRIRO2WYp+5U16y14i3z6L7qKMSdNtuOqHVRkA?=
 =?us-ascii?Q?K6qGbxrwitbyONMoeNnjGdGzOYYO2aFZ1ZTnVfvlQ/jk9pqL4aRgVtXKClxi?=
 =?us-ascii?Q?o1DhIX3/P/DjcJV1wYrsFpQUWjvJAJa+sr08y/rBvaHoG1yU9pS1thAxD6kR?=
 =?us-ascii?Q?8A8qpZMl5i+a8R69Q1EBfBXnjvxXGxBVJqeTsgNBwbxHB3EzpXfZo5VibUpp?=
 =?us-ascii?Q?OFIl8nLNPlsU8WOhLNNV9ZMVdPMGDWtZXlWLnIR9JIws+uqy3NgGhzWSrqJW?=
 =?us-ascii?Q?qHW/omMf0Gc0ZKIUTzBgOpaqJ/X+GtZPv3rtez+cBhJbMibk0FkCpUzFx2tH?=
 =?us-ascii?Q?sQ7HYXbsm2cfH0XqHAxeZqOU3z1oXmumXBztytOeh7Rbtjc3qkipk+k28QbM?=
 =?us-ascii?Q?POxSkx1kK02i140K0lf+V5xK3N+y6QX6PlZ1p65v/e4swpkN4/Jom+UxEVuc?=
 =?us-ascii?Q?1spb1LqfdykrfBg3XVj9eJ6659uVIUUmS0M9HFLH1JttqXAU7zAih5TQ62xu?=
 =?us-ascii?Q?VMXPUqW/l2TZdYvRSd+negvSfYwBFoKHavY4fihN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febe0ca6-f61f-4954-3758-08daf5866aa5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:51:29.1700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6N8HLy0GKgUvki/+Z8Ssq/EyDVt03cBnz8oWeSE/fWeQrbyGPe3se32/Pqoc+tjp25ob/X1eeEu12lT6lg/jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 16:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175838

Hi Richard, Alex,

Thanks for merging the patches in master. Can you merge these patches to=20
langdale release as well?

Thanks,

Sandeep

On 1/12/2023 7:19 PM, Gundlupet Raju, Sandeep wrote:
> Hi Michael,
>
> Any updates on patch merge?
>
> Thanks,
>
> Sandeep
>
> On 1/8/2023 10:25 AM, sandeep.gundlupet-raju@amd.com wrote:
>> From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>
>> The dtb files must be before the dtbo files, otherwise the overlays may
>> not be applied correctly.
>>
>> =C2=A0From Bruce Ashfield:
>>
>> =C2=A0=C2=A0 We can split between dtbs and dtbos, they just need to be s=
orted
>> =C2=A0=C2=A0 for reproducibility reasons.
>>
>> =C2=A0=C2=A0 Of course, this was only working by luck previously (before=
 the
>> =C2=A0=C2=A0 sort), since it has always been gathering dtbs and dtbo's w=
ith
>> =C2=A0=C2=A0 find, depending on filesystem ordering for the order in the
>> =C2=A0=C2=A0 fitimage).
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>
>> Changes in v2:
>> =C2=A0 - Remove 2 loops and use single loop for dtb and dtbo with same l=
ogic.
>>
>> ---
>> =C2=A0 meta/classes-recipe/kernel-fitimage.bbclass | 5 +++--
>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass=20
>> b/meta/classes-recipe/kernel-fitimage.bbclass
>> index 8ddebf8dd8..06cdc4f1ec 100644
>> --- a/meta/classes-recipe/kernel-fitimage.bbclass
>> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
>> @@ -546,10 +546,11 @@ fitimage_assemble() {
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${EXTERNAL_KERNEL_DEVICET=
REE}" ]; then
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtbcount=3D1
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for DTB in $(find "${EXTERNA=
L_KERNEL_DEVICETREE}" \( -name=20
>> '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for DTB in $(find "${EXTERNA=
L_KERNEL_DEVICETREE}" -name=20
>> '*.dtb' -printf '%P\n' | sort) \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(find "${EXTERNAL_KERNEL_DE=
VICETREE}" -name '*.dtbo'=20
>> -printf '%P\n' | sort); do
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 DTB=3D$(echo "$DTB" | tr '/' '_')
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # Skip DTB if we've picked it up previously
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Sk=
ip DTB/DTBO if we've picked it up previously
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DTBS=3D"$DTBS $DTB"

