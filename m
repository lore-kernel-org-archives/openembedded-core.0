Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A74C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:58:23 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.85])
 by mx.groups.io with SMTP id smtpd.web11.1074.1672862293685183876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 11:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=G6gSlzFF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.85, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzQVKvV1kx7eKAVto5kxPaRffJOupRfwsmoR2IRaHnVILzawivJhrrdUw++xdv/VU5EEaMPlFXXChcXfezBXTMYXC7rHjMePsLh2RbNw0sCtBvi/6RdjAYRPgvpXQabxd0VVG4QY4/MjczvaRhmaZrFXzmaekSOmXH4y8EDgLevPEUDznyruk9hhc/dh0hs7f7fJos4rW1Xb0XhHOoMXEf6imu4yskVrHf6PY1omfrRBb0HFmwQGTHH5VAQA3iAPGmYEwgtceA/D6r9+XOq9X9QR12svJmWBMlek2G9E6AVj+nLQ4tC9k7bx1YuGPFukfoGB0LORS7Yisbe5vryClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkAKIc+2JJ0lBLbGDtT7rMul3OjDUYkNfEIWsrYhIUQ=;
 b=lir7suC9RPpbHAm8TH4RkIo1ESQzY3TFT7Xo7/AnGpRHTh4p1tanRLLdxvfn6msEWBvAUWElFTPEmU9YMj+St9SFf9gYKL8UTJu2plbP3mY7cK66KjjuMaHmCB1MVLcX4kjgHkLppHGrF7h1vLtvLDeoNz90LgDvD2mcVWNwk/nuCi0Bj3etY2dvGPpO/CW3riUuioGp/h3Jmrl0/LTg31k66gTzIRIGg0+h1YhzLtKiCy2tQkKJtudGYj015WmocH8gR7ChaxLE/+L74Czxe76G2XmhF+CeZBLXI5cMQKyXswApUO6Q99fVJU//bZ77ZKV9I0FJvF/T9c4a47n63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkAKIc+2JJ0lBLbGDtT7rMul3OjDUYkNfEIWsrYhIUQ=;
 b=G6gSlzFFBlA65T72uwKhGVjUs2jJ0nChM1ZC97qnOLdL7daKBlx37P4ocPMyeKuEtoigKmaK25rmYjeV5Iq0pKV8L3n1KzjALXYgTF9k07h3pE1Ik8N2u9GKVvZmoClYe7TaqgtrkT91AgA8bNyw5Vf5jOt+Ggu11OhBdbsdZpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by SA1PR12MB6972.namprd12.prod.outlook.com (2603:10b6:806:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 19:58:11 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%5]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 19:58:11 +0000
Message-ID: <55697ce7-5a88-f34f-f3c5-8fac7cd29ab6@amd.com>
Date: Wed, 4 Jan 2023 12:58:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-Core][PATCH 1/2] kernel-fitimage: Adjust order of dtb/dtbo
 files
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
References: <20230104025330.2648640-1-sandeep.gundlupet-raju@amd.com>
 <631753f6-a7f8-e1ee-4853-7f91ee820b46@theobroma-systems.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <631753f6-a7f8-e1ee-4853-7f91ee820b46@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|SA1PR12MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 2300a5e2-18f3-46ee-df9d-08daee8e023b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X8I30xtWU42k0xGQk1m9GkMm8FkgC73x5Dfao3zCO11Qa+/2E6rdSLap/UXBRELKuFqkCQ3Jh7vvE2cAtGHfNqranelmvlLsxajo+FRV8v177D9ux8wylhU97NBdcjj0rNkOJv4UX6QHxVI+T/MVWvyrDLgfc0+ogYP6h2lwuhyllvZTGlQMYt2iT3gVxiX0lRuPIobiDKW1vOkfhz/Gno8Q+0etX+XdQriiOiP7GA8/1y/J0pV9IBDathgUPt42O4DPE1SfH7z5LYzIWt2EIvrehfH08Cld6XjeygGO9wIUfe63ahi9RSAtMRNEYSyXXWWx+vLxAONC9RIZQa+PhYIKX9f8KIOn5jZjBZ+G03rdff8WUSZJc13lJPmDGBH4bPswuIdN9xCN9MP2Kcut6MDLaCVxSTu0OrxihbOtax91kr4KXQSDQ8iQuEw+FYMae0lpA2kd+yvS493NUlQuVh9VJa5GoDCKWVb+qC54g7FNVhX0gntUzb5prSUMFXgy3ZarFgbnPYkjClkD8CByHl3OZB1jy/hrtES4e054w3Wsnc6FoLhnD7IKPLl4MtFojmlC2qqHB6CZB3fbNHrvWqvWzXZzy0vkBK41wyW4ZZMIEbhaUl2AOD1K42nBDtQ3C7Irqf8uTGh98R3Cf1HmhfqwOO5HuqBWg9wJc/6A4xavgJPYaZIHcVNhI/3cD5APbj4Q5iIYg88ZX+LND3jZXZ8ojIChmL1/z93soAHvjLE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(316002)(6512007)(6666004)(186003)(110136005)(26005)(53546011)(478600001)(66556008)(66476007)(8676002)(4326008)(66946007)(2616005)(31686004)(6486002)(6506007)(41300700001)(8936002)(5660300002)(83380400001)(2906002)(36756003)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q4QkrccjQVCP4ZcRhEHK4cNx9JbDmE1oj2TjO9FL5uvpLEYikJxvwFjuxLDL?=
 =?us-ascii?Q?m54gHAqQkjBNKg4wjCuzJMHSf8mrCLp38qedhgYhx1H4rT9PtP0SyK5XzwdF?=
 =?us-ascii?Q?lFgNbYrbk48YA6VbkSQ8m6CN0Ntca09I6zUoY46pHgM5BQJjUiC0jayJ1loT?=
 =?us-ascii?Q?CVpcXHP72KMdIqY2Wn19FYnHqYyyghD2fVvw5b2eet67DtWeLq/krKqr4TzR?=
 =?us-ascii?Q?Kp+KHEze4mM5Xfd4VC9rE20J92UQwU04OiBl14knIWj/SB5U/vNK+cQeibz2?=
 =?us-ascii?Q?j5lMabc6zGXJmlWwu1BRyEnziwEQdmzi9UuW0QSimMEYzfCT3bJl2xVYXHHa?=
 =?us-ascii?Q?7QLh0iC2ZfwytMgVVYSgugjSTA2wr+4cVP6jBIGcVxgjThmVNKhtyUXpI8pB?=
 =?us-ascii?Q?Qpek2lYy5s/o2ef2Rrb7kgXFySpCxpcc/4mLlDmYwd1NiuCYxW1urmm0DmYP?=
 =?us-ascii?Q?MEZh7rcKn1fCXr1cAU8XStIR2kl5fzyzESZzdllKKJgQY6wKvsYlKsg2Fts+?=
 =?us-ascii?Q?pdcQSrSeWuAbUOeZIK+Mtt4amzN2Hy3IbrPCjhIJ5JknGoK9K1jy2Ngphv1P?=
 =?us-ascii?Q?BD5QDoYBa7ShZJfw9oTgwEvtVsog2ANaCbFpk8ucStVpX6g3CamkAhRfP2jb?=
 =?us-ascii?Q?Wer0IawJo+MteWvp8SIz23RjGKubbAhQFHgjDbhQ7QlCVUm+zkrfGv8wWkwN?=
 =?us-ascii?Q?/Z+owOggYJf3i5uOeIZS3fsIU3gF7TKnMzEwcoRC3u4kLCv5WjB720QNLKx+?=
 =?us-ascii?Q?RtAPzYrtIRppJcK9lJLvZVJF6Lfuo1fRb2u4+UbiCVdOlnz+JhlbYObG27Ri?=
 =?us-ascii?Q?ZmmuaYG935iKQWpWqu7aI4qyR2IHfsDn+lmJlODzvv6+XtiL8kUlniC4ox25?=
 =?us-ascii?Q?AuQ8LB0mHh3A/OOdkcUc6Fg40lzkp1HEBjTr5VlAdqDtiI8ArLrfIXBiudAe?=
 =?us-ascii?Q?mPxnqXeR77lqIFyrcm/8XisnbYuZYVX8LQsd8lurXJ4lC8LB7g9mTs9/d1dS?=
 =?us-ascii?Q?EE4j5NCW/ffo8Vlsdnp8gmKnx30G2mQ4i44NBPUuoRJnn8VrxTcmuoB+Aufz?=
 =?us-ascii?Q?/3v5FS7uFrjXPBlXLdWrfbE+9yT06JnEnnQQU5gXqYYbfGpAKkqUliNOZm1v?=
 =?us-ascii?Q?CkzlcJQtGdJCexLcLvvs6vImhPaoK6xW239tBYvgwBuloRJFsJ0kJUxKAZib?=
 =?us-ascii?Q?+6qp57aRysCRR8befiXbW5ZjUgNmiRkobLPismUsoxIiJQ84ekTnvlYdjOKM?=
 =?us-ascii?Q?zGNYpqWAzijLWQPfWwLXQ66ZPFcgrZcdG8vsN6s4ZpKCf9Z8+Hmw8e++AWaf?=
 =?us-ascii?Q?yfURtnxIE/+gjB6BKe6iB9LwofunweUj55292SovRrjlKP/L9AjHzZOeUQ/0?=
 =?us-ascii?Q?xHdV+Z3k9qJwXRZsZKgb1m+v6FF3dFnEr5fZdtkDn9UPksA+Ddp6fAkk7bLQ?=
 =?us-ascii?Q?8KN7ZeiuYUFXG/Deq1Um8ixqcDrM6EWU8DKGP1aTLDpPNpuL5Gk7Du4K/5JG?=
 =?us-ascii?Q?geDoEa/qojqPfgwgsWxCmAfjdt0Pjm70P3Fks9EF8kSb3hNIxQtYOCUSTkS7?=
 =?us-ascii?Q?pjKOAJpGVqsJSwrDCXDFlM/L47jjgDSdSkU4k+QN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2300a5e2-18f3-46ee-df9d-08daee8e023b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 19:58:11.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfmoN2p6PKzI6QZYRZdIt1DVLmkzNrWFWMvXZAd4bSfVzkxh3WjZGjUHyldxsItuW1DgiViY9aEQiOF/YENXaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 19:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175505

Hi Quentin,

Thanks for the review.

On 1/4/2023 4:36 AM, Quentin Schulz wrote:
> Hi Sandeep,
>
> On 1/4/23 03:53, Sandeep Gundlupet Raju via lists.openembedded.org wrote:
>> The dtb files must be before the dtbo files, otherwise the overlays may
>> not be applied correctly.
>>
>>   From Bruce Ashfield:
>>
>>     We can split between dtbs and dtbos, they just need to be sorted
>>     for reproducibility reasons. Two loops versus one, would be
>>     fine, with not too much duplicated code.
>>
>>     Of course, this was only working by luck previously (before the
>>     sort), since it has always been gathering dtbs and dtbo's with
>>     find, depending on filesystem ordering for the order in the
>>     fitimage).
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>    meta/classes-recipe/kernel-fitimage.bbclass | 14 +++++++++++++-
>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-=
recipe/kernel-fitimage.bbclass
>> index 7980910aa8..cb6635a673 100644
>> --- a/meta/classes-recipe/kernel-fitimage.bbclass
>> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
>> @@ -590,7 +590,7 @@ fitimage_assemble() {
>>   =20
>>    	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
>>    		dtbcount=3D1
>> -		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o=
 -name '*.dtbo' \) -printf '%P\n' | sort); do
>> +		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -prin=
tf '%P\n' | sort); do
> I believe you could have
>
> for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf
> '%P\n' | sort) $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo'
> -printf '%P\n' | sort); do
>
> would make sure dtbs appear before dtbos in the fitimage sections but
> still use the same logic within the loop without going for code duplicati=
on.
[Sandeep]: Good thought I echo you on this one, I'll send a v2 patch=20
with changes.
>
> I believe the issue is the content of the DTBS variable, which might
> start with a dtbo file.
> When this happens, the default configuration for the fitimage takes the
> dtbo only and I guess this is your bug.

[Sandeep]: Yes that correct, it fitimage picked the dtb based on sorting=20
files in alphabetical order and in our case it looks like below, Where=20
it picked up default.dtbo as default which caused boot issue.

-rw-r--r-- 8 sandeepg boulder=C2=A0 480 Jan=C2=A0 3 11:33 default.dtbo
-rw-r--r-- 8 sandeepg boulder=C2=A0 29K Jan=C2=A0 3 11:33 system-default.dt=
b
-rw-r--r-- 8 sandeepg boulder=C2=A0 33K Jan=C2=A0 3 11:33 system-top.dtb
-rw-r--r-- 8 sandeepg boulder=C2=A0 29K Jan=C2=A0 3 11:33 system-vck190-rev=
1.dtb
-rw-r--r-- 8 sandeepg boulder=C2=A0 435 Jan=C2=A0 3 11:33 vck190-rev1.dtbo

>
> We could also decide to have the original loop but have two variables:
> DTBS for dtbs only, matched on file extension
> and DTBOS for dtbos only
>
> Then you'd iterate over DTBS for fitimage_emit_section_config first and
> then DTBOS.
>
> I'm also not sure we need to create fit configuration nodes for dtbos
> only? but maybe there's something specific to security here?
[Sandeep]: I will defer this question to Bruce Ashfield and Mark Hatle.
>
> Cheers,
> Quentin

