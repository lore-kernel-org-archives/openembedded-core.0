Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10CCC677F1
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 16:35:55 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.71])
 by mx.groups.io with SMTP id smtpd.web11.201520.1673973346088942664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 08:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=KYpd1hrA;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.71, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBUOz7xhTWOW3gTdBJG13xp+RpzBQ/BRg+LTNxNHwDCZ9iIqt3164WNycvRmnwwvMI3EoWRfP9x++Gk9QR3u2luywNvw+IJiRcXeix8AAmcepKzOHjlGFKynIgs6cb9BtIFt78qcmCe/x1GT2NPYj35ysLxMfqJtPhkwoijcRVgKEbhafIBsDlJlYvpULdfZvd9nYFal6yuQPtyjDiR3qMoDiPysysvaoAMmx52ad9CSaq76YKSMiU5KBQPn+5YTbmNeolvlc3BlEjFnE0PvOAdwerfKRzm0bADPgCIOhJ7xV/LPq3TWHaIaMS8ORrsXUgcbs/gc4s1MkgY87VhzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16iiTnbsHKD0bYCXQC5eJmim7aG0LgDR8Hpu5lq0H/M=;
 b=kamG+f4EHDXHwAXYoOSDOzy7FvmycCJ2Gu7pHle0I7/j45sSb49w13irVOLD35ieSnqz+TEmd1uRGq+Jpwsw01l6aAaRNA/xMG2FICgvvmev+7g3SoEPMumQh4iF1PQKQwx0Jv4DkVs+DqgYnYxYgulcpLjoRnHO8fg1eObAKHIgqSZIWo9klZolWNk0+ikLYcgDzxsvaIJFTx43OCYQZJSQLMH5FzlpOLk34sHcmvvwshjUEdOzDpCymSuKFPIXQoqnmnWpJUCWSp/nzU4je/OAZRAKRAWN3PdYTlJX9sE95RPzy1gFjzqOuaKmwW3px8Iq5O+cXJwSuGRPqPBTYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16iiTnbsHKD0bYCXQC5eJmim7aG0LgDR8Hpu5lq0H/M=;
 b=KYpd1hrAHhW+yovc+gMM/kYFA9P5X32E286MMaZnzC+3ykMwLNtDy72KuSknaSSE6rDuLbI39womhL7XgxEgG3ja/eCBXO7xoUDgqf2CrjuDpAsGaa1MNjiDzdK3KEX2X3mq2F8nKO4bV45lLMtfhflC80tmk1zu8SITEufle74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 16:35:42 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%5]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 16:35:42 +0000
Message-ID: <49792f50-c378-bad8-0d68-9160166ef103@amd.com>
Date: Tue, 17 Jan 2023 09:35:38 -0700
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
 <f8fc990a-fac9-3cab-95e8-19c62c05f907@amd.com>
In-Reply-To: <f8fc990a-fac9-3cab-95e8-19c62c05f907@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|PH7PR12MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bdea71b-5550-496b-390b-08daf8a8dfbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0/qnD989oBLU4tBdAFxoa3qbtiAl58/1OfJ96GN7lp2mYKAUS4sESJHZkkbn6fPsYI7TpORn0d4HENkezDPGpm66YfmfIGuRxrMh/GTFcSpqvKnZJhRflf/d3JHPKe3OHLw4ljAH2PHKiMepBG+y6nvy6dFB4IssGzOTqsdwagQFdZPiMO/ss3xygnlEGBwdmiyK7lIeNd6BBWSZ5Uo1/GgjgXRtN9fSEhXvmYj4CoPTaBZFJnCELfQKTo8XeOU764xPqDp0XXzIovrxDwI+KnbpC0j3E+/lQVNEfOVB/G0OAvLU8S9/7p9wjMGOst1j7Ldoox8knKwt2xsMk1R3mAL/4PBmY9JFYhokwsNsdEcaKflQcmXtTQi1RLnfasmPIvqY2/jhMrQhzqmdFmqJRyyWWM9MhTeXlEifKp1zyqTBg+xpM0u7mJd0tZSRyqAEEmPONy8wyICTvQGD4bvWk+luhTReXjrzJMWyjBjVzeuguzC+R2uvZO4wbXKqc9giRpiuCvw9e0RP3tmY/Ja1kZ7OyXZJZb5uGOGFDt8WvKO5XNVM50q9DI9LJzbfpZnEiIsfHWnt/h/2M9uEE8XqZYXgt9BqKjUztMbSNo0e27b+1icqYGUGjNee20bx1IdokjHD577EF1QVtgLKDs6pR6uK8wfTX6FnaJuEZWRcojEhKROQ6QSfQkPmBOuguMsEc28UWw1tFoZFLjbQE1gKSUFjRCooJzxMJN/lhppM+3c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199015)(31686004)(478600001)(8936002)(6486002)(4326008)(53546011)(66556008)(41300700001)(36756003)(8676002)(66476007)(5660300002)(26005)(66946007)(2906002)(316002)(31696002)(86362001)(110136005)(38100700002)(6666004)(6506007)(6512007)(186003)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BeH9a1lVMCvtIJRwFehrFZJkAMhve7Zm1DvamB9ekLOXgsfIeFYF8mZulGpT?=
 =?us-ascii?Q?kr5A0Rb8Wv81a4cZ/nXACTkqxmdA/haAnUn0mmxbmN3d8tAtSVBn5FhwNqyC?=
 =?us-ascii?Q?sAg7GwTvK4xlQYJ8HuK/M8wMZKfel/eZdMejfxPO541/aPk6waG15tFvEjrQ?=
 =?us-ascii?Q?84+GHu5YTcsbrT4n3cuoMrKa62ZSN0VoVddc173Laz5QtSw0DqIzHWYVhvGJ?=
 =?us-ascii?Q?+sveclP6sf+WTwyIH1G/Uw8fIJEtDl4E4/nEtwSEkAiD5+vj+XYmtmLAdYV0?=
 =?us-ascii?Q?lAFS/9IdwoCthPs9uPp7xA/s6bW8o8AU6hY1mDl/GCa9JEBxHriYzduYQ628?=
 =?us-ascii?Q?wT0xMs1HnNBLIy4shDPSJz9/Pl8sFxZIzrT9kz7KA/X37FAkL1z1//lq07VF?=
 =?us-ascii?Q?Q7SRnGWDJYcedqCvv4yqKE7F3VEnn/YkT4XI380+xpCanbG3tmsFp1SkVwUx?=
 =?us-ascii?Q?+Vo0gIlmmwfgB6GoBh1iXTP52YhZ2xTP4mRakiiV7JDL3ElJ7wmCQihbOdsz?=
 =?us-ascii?Q?7nghF7H8hFfeUyLkHmKFjxB+J6sbQup9Y7i0viCu4FhQ+l/V03ZTitIv+iQh?=
 =?us-ascii?Q?eEuMXvt/CTNR881zmo7Bc93moP02FJOCxfUcG4CK8wiUlAPGxdbfPQhn9quL?=
 =?us-ascii?Q?Y2X0EAOoZXuQqq8TqUG+q+PvTPj43mEg1YyVC8IwZRvD3r3kBFaf/W8mb3JZ?=
 =?us-ascii?Q?gCxpAcDCrKSVL2xK4ucLS6F+b6dJfEVUVkCYppJ+zQJGRFQyFgSzgf6T0B+M?=
 =?us-ascii?Q?tUWcWaDrcQ6Z4BFL/8ngGg8ee9eDeekGl1ozq5d/znhnAenXGCpIMczQNrI9?=
 =?us-ascii?Q?QExkcuXEQBHSyo/UO82Y8hdf5c9H51nMfE4KK1Q5dVKMqI8LvGPbm2XspLM+?=
 =?us-ascii?Q?olsXViT9k4FDxQi5qfsLuyFkQqgo/jvLCIBS0YMXhFlvXe919vFHWbewNrs2?=
 =?us-ascii?Q?ERyAwSuWTfvpqaYQvBG2OFHakhZQbzuAKYTcysn1p3hZ8CfQqJLNiED7ZHoa?=
 =?us-ascii?Q?w84si5IuAfYiVQGeg29CTdAvoPGfK2RXvpTjVqtDOfbQNiu+JOU2cLkJZDDv?=
 =?us-ascii?Q?pxUqkZufmbafSBuHYbeoUPMmGePY33zb5HJO+NGf+Dqjbo240o9//ekWhAYO?=
 =?us-ascii?Q?XSQ1arXGuDUyyTb+yVVWbHFmr+Ges5LrsYpcN42T+6wBCuohC8eOIGsCVOdN?=
 =?us-ascii?Q?1sGcI9bESvOEPK6L9yMqDumWY03BjHO56MW/MNE94lcHBztYXd7rPtLGZ0CW?=
 =?us-ascii?Q?nyxHZlaVQqdSwkeLSrF4j7H+5QflxcSfpEzony9phZezbMl41TtN6SCwA0QU?=
 =?us-ascii?Q?apE/Kv/7c7RNS7rmDL3vkEBpWZk3Wx0uxFiYFt+uIA9CsL4UHDY+E1TvaJmV?=
 =?us-ascii?Q?et4H7iGG2t4SYJtqJDWDlboBvMQPp+WKPoH2wmx2/DkyYN6wYa9KZ9IyLv+6?=
 =?us-ascii?Q?11rNBs4PC2JeUYaJIVHjWDIXZWbWjqRGVx+uwGgjchcWHqwW+484SI+x65bC?=
 =?us-ascii?Q?ZKuANHWJc/44EVOWKyKoe5KdIezBeTvE3hbrPFt0KqrJqRZG7+HQHv9sik+S?=
 =?us-ascii?Q?FLUosAHXnLyShw26mvceK5CaXMhbMOlEWo3HD09e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdea71b-5550-496b-390b-08daf8a8dfbf
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 16:35:42.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRswJymK/fRNtVVpSHcZYcUT6OgJ9z98Ky7vVjdCbNpsf10hWotSF2tNBJ7wligiogQ1tsFtX/VsAORtbNaLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 16:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176053

Hi All,

Can someone merge these patches to langdale branch?

Thanks,

Sandeep

On 1/13/2023 9:51 AM, Gundlupet Raju, Sandeep wrote:
> Hi Richard, Alex,
>
> Thanks for merging the patches in master. Can you merge these patches=20
> to langdale release as well?
>
> Thanks,
>
> Sandeep
>
> On 1/12/2023 7:19 PM, Gundlupet Raju, Sandeep wrote:
>> Hi Michael,
>>
>> Any updates on patch merge?
>>
>> Thanks,
>>
>> Sandeep
>>
>> On 1/8/2023 10:25 AM, sandeep.gundlupet-raju@amd.com wrote:
>>> From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>>
>>> The dtb files must be before the dtbo files, otherwise the overlays may
>>> not be applied correctly.
>>>
>>> =C2=A0From Bruce Ashfield:
>>>
>>> =C2=A0=C2=A0 We can split between dtbs and dtbos, they just need to be =
sorted
>>> =C2=A0=C2=A0 for reproducibility reasons.
>>>
>>> =C2=A0=C2=A0 Of course, this was only working by luck previously (befor=
e the
>>> =C2=A0=C2=A0 sort), since it has always been gathering dtbs and dtbo's =
with
>>> =C2=A0=C2=A0 find, depending on filesystem ordering for the order in th=
e
>>> =C2=A0=C2=A0 fitimage).
>>>
>>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>> ---
>>>
>>> Changes in v2:
>>> =C2=A0 - Remove 2 loops and use single loop for dtb and dtbo with same=
=20
>>> logic.
>>>
>>> ---
>>> =C2=A0 meta/classes-recipe/kernel-fitimage.bbclass | 5 +++--
>>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass=20
>>> b/meta/classes-recipe/kernel-fitimage.bbclass
>>> index 8ddebf8dd8..06cdc4f1ec 100644
>>> --- a/meta/classes-recipe/kernel-fitimage.bbclass
>>> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
>>> @@ -546,10 +546,11 @@ fitimage_assemble() {
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${EXTERNAL_KERNEL_DEVICE=
TREE}" ]; then
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtbcount=3D1
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for DTB in $(find "${EXTERN=
AL_KERNEL_DEVICETREE}" \( -name=20
>>> '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for DTB in $(find "${EXTERN=
AL_KERNEL_DEVICETREE}" -name=20
>>> '*.dtb' -printf '%P\n' | sort) \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(find "${EXTERNAL_KERNEL_D=
EVICETREE}" -name '*.dtbo'=20
>>> -printf '%P\n' | sort); do
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 DTB=3D$(echo "$DTB" | tr '/' '_')
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # Skip DTB if we've picked it up previously
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # S=
kip DTB/DTBO if we've picked it up previously
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DTBS=3D"$DTBS $DTB"

