Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450B4C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 18:06:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web10.57577.1684346795898432038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 11:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=HINooEkK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.20.84, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQ4amwheje09icL5mIVzwT2xq7n+kBTO8y16JO2LSPb32s/PWVYiTA5/pqHQV+gG9myIoi/ozS2WbxnwOkaswWIlzf/MTscwzHBcu5aXPKDl7VvDTOaueshTr8DBAp6w0o2AlBn+XxFxUeVdBhd0qZs/VBbfkJbDSBuzk7dH7Ww3ulUgw7BJDYTxp+JK8yZPwybtg+72dSCXXv81gWuja7VbHpa6BHw2ohYaGXtcZD7yBcKn3Jnq06Nx0AH4NS+k5YMbSoX1cCitZybKXg5EUR5ubQn46mTwGjq/FpGbxAHgHLadX93zw/s1/QJXUEanpSfM6b/IsZ7bTWhmxoSnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCqYArbrOCEGrd85ncBZiw8gjMvj74f5eTHcQ5OBUU0=;
 b=UYU7rHyNteFpVti7xfXTV/ZTwxwgmAaF5IQ+WLLbhrq9/wl0O1sMBfACPgZeBXEeC/HwPQAg9Px+X33X2sIIomN3PwPQPzBCgMgq9rz97i1Afkstc8rCZEa7txh/GyX+bzXfYK+tO/3avaXF3vajc6pDeyWDsB0h2nPhv1dMguHenNf6i/vQ3qb+R0bYUWhVlbXq1qauoOFDs9H3DOsj8rcfHFO09FJieO/K2o24GMAL66LniaHuQs/leY21IRdxthr0hZd2JoYositHpEiWC7W5Sarp13ulk0wcxRVJXPSDwdBwqUN6+EWe47G19FnGpIIxedoOraoE+N7S+wfoRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCqYArbrOCEGrd85ncBZiw8gjMvj74f5eTHcQ5OBUU0=;
 b=HINooEkKcHUI8/oFKtWSRa98Ka2s1OuCMVJMieiMcfhjnhtLP4VId+EaxjkjYnlY0p2BivxoWFdOuLEJF5JhYEptXUJv1/sANQQ15NBYTnrZEHNknzfDiDpLzx3/beS8fHIdkbVQCRL1pXveNoAiHOl5CT7jCaXqimtS5AOqnB8azmuXvzG+VCL29KOljXezj7XitJ0EOABJBGOqHBPIptju+lZvLjKkheKZz8RNSMoIbzqju1PpOV7EYrJCNSuEn6q14LdzOPTAfnVGKUofD2oUNMRvdWIuJNhnirVXDPGgfYbKw5JV2CnLc0kwYk5mydj3ai2iAfJ0LfxaXWAbzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB7467.eurprd06.prod.outlook.com (2603:10a6:10:262::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Wed, 17 May
 2023 18:06:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd%2]) with mapi id 15.20.6387.034; Wed, 17 May 2023
 18:06:32 +0000
Message-ID: <35aedcf0-4dfb-f085-f1ff-2ccc16cc0ff0@vaisala.com>
Date: Wed, 17 May 2023 21:06:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [kirkstone][PATCH] gcc-runtime: Use static dummy
 libstdc++
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230517100548.1431325-1-niko.mauno@vaisala.com>
 <CAOSpxdYYTopMKiqESto5VsrS6yfYxU1dxRz9XvH3zXEAt-+mwA@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAOSpxdYYTopMKiqESto5VsrS6yfYxU1dxRz9XvH3zXEAt-+mwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF000013E1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::22) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7e6ae8-f677-4e45-05e3-08db570171b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OTo8CuqFXK2wT5Bd0yQVPVW3rF+HDOCqNwWpNOMZ6Hk5Y5DkZbmKL7SD4O5QmEcUeoya+DHlopEao0allXy+2QaGSI37x1dqHxdIeWq+kAS/Mu5ChrrTnrUBMMiTwpo/DYp5htign770wobyswBgrN+UVE+yM2xnrN2Xh3NzM1o2iyzQOEdGrClfw0EALqZVZAsfTUvbT+SXuPnCTqNCyHiRkVMSBBtcGKWMFK/EO+VC/IaH4Tob4jb4Wo93UqAMzJ8pMDO/mKr4+cfhF20cqs/MGQjoxG04v0xDmr01HZ5Dha6LTLQUTCgJ1Oam5u7QaXIZEuFw/vLoUmJ6CvBayy3jtZBfjnIaf84kca2L9UJwpxz5rC1cMPpQZOtiRqNjuP++KDE7erSUkE+jVYUwqcy27J6LP44lxY5WNDCs56wYcgRIPuYP7rTdW6Dw6MPYxUQ8NFiFif+lIDS8Sm0gyIV/qGkiUTqriTrdvt0OhQLU6LdLfHyZw+dVuM5CbrI2YOpdmnz0it/qZb+mVYNQxOXZE0uqJl5ny0Hx0bXnDZlh4ncoaKf2FezDde60kUGddGGhGK2ng68glsjjcJ4H6Mdg978T/ZXpNxeHo9lGu7NsTv0O+dJlfBx1oDmqH70nAcV3DooqzohtxAEnFtZIHw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(451199021)(66899021)(31686004)(966005)(6916009)(316002)(4326008)(66946007)(66556008)(66476007)(45080400002)(478600001)(54906003)(86362001)(31696002)(36756003)(83380400001)(6506007)(26005)(6512007)(2616005)(186003)(53546011)(41300700001)(5660300002)(8936002)(8676002)(6486002)(44832011)(2906002)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4jay2c5ZHhHmfskWNwr04yM8/cNt/hL5W5WndZyHKOEYdKXlcFjcAZr1ViRi?=
 =?us-ascii?Q?j8Tgu4JMsXoB5IbwwgEL8tAMXrlCkRHcSbtQsRQKjnkrC9swWo8VTgOGpvj/?=
 =?us-ascii?Q?qOnkG0cjwvI3r6kvDqIW2jLGsXGeIciIpxhrOESlSm5hGGcsa0oSp/UYj+zy?=
 =?us-ascii?Q?zQTp/Ou+fDtf2fiziyrXR8ujsZqwx4vWgPw6lHEr/AdwIhT30lbbPl5QG9gY?=
 =?us-ascii?Q?7A35oj7XtDdSMOt/xQp4o1GeeAYGZZoKNr93Fk9aLWf5Mng2tPkONP8ur581?=
 =?us-ascii?Q?qnxj3dKyscFroaSWEVXhRiCDhi0CNAbEqBzoWmCz6QLqGXbwGtmf8dAMSyPz?=
 =?us-ascii?Q?MK27FBfCb5Kn2HVEY3PNCbE3igA1fPMl2gVHb1J+QLlpgEKERXTjNwvgm0o+?=
 =?us-ascii?Q?z68mhggbRjB0ISAAVRkoTlP1Ra2hqfzo2QjdAhqVO6GFFD8+P9sTReRNRrrI?=
 =?us-ascii?Q?N0C4MzhoiBowS+KkyozBE8wvxkuEuYapGx97bXbiCZ81kJB5QOgpM3rOBjUl?=
 =?us-ascii?Q?wU2RHyL3Jg8I8vCuozEv0VO2HfaT8T0qudxLqeBg3rEISVK06IUYQkC3lWpw?=
 =?us-ascii?Q?8Pd0XS5Zv/HCyjnfTc+97W/j+eV7eXfL1WTz5EVcZndcwamJxQviw02jCGI4?=
 =?us-ascii?Q?G3Dx2JxZW5zsNL4Eykm+Bk+AU2P76Ak4HgW+ce1P/+w1kNXzYy2X+Rmqwh8k?=
 =?us-ascii?Q?cUURtNsYUAXnlc4jkqnlYyBW2+h1wOijbhzhSJSumFGOVibgiKucDi9YlhGV?=
 =?us-ascii?Q?CbEl1mszyoTkP/u9YdMlMCaddk4WUTirMkFb249v0WZA7gPUBcvTh4GB4YOP?=
 =?us-ascii?Q?MnqtYCI5eq+LK91K7B6OOrOvyiLzZhnHZzLY5rULdK4mCEY+WCIhEG8snMw0?=
 =?us-ascii?Q?GXzLjMlhCmEGWvE6ujO/4AOuYxcCiYop98CeipZpx/HEt1jd1b915pBxyjFw?=
 =?us-ascii?Q?VaGXRqJyFXJg7BEHje+kqlhbCWnQhtrFGylU+M949iok+Apo+aOln8r2SGvS?=
 =?us-ascii?Q?Bubxg4ZUVjcleSIatwEaatjUKjBAH2PWdgSTkxB65yCmlWrP1nD0x0W9/MuS?=
 =?us-ascii?Q?cl7F+2Qgm+Tg1Qa/1OYrEx3Qe/Qr5qG2BAtZWqEhPF9RSEVTlFW7BmNPxFuc?=
 =?us-ascii?Q?zf2ju7m7f2CeSbi22Zfk/E8La0xw/SGHwvcvKh7BgW+MT53KFApF0BORGNeW?=
 =?us-ascii?Q?7KIDTbJN7xKrEeAG486bxxvgm3aHz8+03iYeleoaEDhHfJZ7l1FCyNsR0lES?=
 =?us-ascii?Q?xItRof46LjOYA27s3WNuoFfYq8RHhYaMuwAhw8cIbD+3QqkKVbwkZKU1Vc7L?=
 =?us-ascii?Q?wGRXeUPJoltx4E2nSpYQ69iKcHGvvKqwMK0XEFIfZBYO8AZ7iStXdtCAifie?=
 =?us-ascii?Q?rQPBYaXuynGlJDDNW3/FZddrLW1eDKiWGDvjYRco9S8zRgF9F+58iayVfvhU?=
 =?us-ascii?Q?31RZlcB8Boix6I7IfktQw5qigGODDcv5MNJHUMZGK6pn4KjJ0PtiXU3H816h?=
 =?us-ascii?Q?V6F30HjIflvjcLCHIOtGBPuidCsCFR1z0CK27zJHfnmH9AKy2frs7TUmxNHI?=
 =?us-ascii?Q?o1XwrVFjf1YVsIKApQ44+yby61Zi7SJk8UdG/Pv4?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7e6ae8-f677-4e45-05e3-08db570171b9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 18:06:31.9490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/hisErov1rM1xFoRoRKs36vmgxLHcu4ZEVEhkoOHoOvjbH07nI1rBVC+SYEbF+Z8ospPJQU9c7MLQAauNFJmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7467
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 18:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181498

Hi Steve, I must admit this is surprising to me as I am unable to=20
reproduce the failure You describe by issuing

   $ git checkout=C2=A0poky/kirkstone
   Note: switching to 'poky/kirkstone'.

   HEAD is now at f53ab3a2ff build-appliance-image: Update to kirkstone=20
head revision

   $ git cherry-pick 591f14c698f43ca4ae6431c8cd96225d1ed5dbf5
   Auto-merging meta/recipes-devtools/gcc/gcc-runtime.inc
   [detached HEAD 935862b25f] gcc-runtime: Use static dummy libstdc++
   Author: Khem Raj <raj.khem@gmail.com>
   Date: Sun Jul 24 08:10:21 2022 -0700
   1 file changed, 2 insertions(+), 1 deletion(-)

Could you provide any further pointers/hints regarding what could be=20
wrong..?

-Niko

On 5/17/23 18:21, Steve Sakoman wrote:
> This patch does not apply to current kirkstone HEAD:
>=20
> Applying: gcc-runtime: Use static dummy libstdc++
> Using index info to reconstruct a base tree...
> M meta/recipes-devtools/gcc/gcc-runtime.inc
> Falling back to patching base and 3-way merge...
> Auto-merging meta/recipes-devtools/gcc/gcc-runtime.inc
> CONFLICT (content): Merge conflict in meta/recipes-devtools/gcc/gcc-runti=
me.inc
> error: Failed to merge in the changes.
> Patch failed at 0001 gcc-runtime: Use static dummy libstdc++
>=20
> Steve
>=20
> On Wed, May 17, 2023 at 12:06=E2=80=AFAM Niko Mauno via lists.openembedde=
d.org
> <niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>>
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> some standalone targets e.g. riscv64-elf disable shared linking for
>> baremetal ELF ABI in ld, therefore lets make it a static library
>>
>> (From OE-Core rev: 3c6219dfcbcbde314648ba8cc54a90b32ea1c952)
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-de=
vtools/gcc/gcc-runtime.inc
>> index 8074bf1025..d019b0790b 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -68,7 +68,8 @@ do_configure () {
>>          # libstdc++ isn't built yet so CXX would error not able to find=
 it which breaks stdc++'s configure
>>          # tests. Create a dummy empty lib for the purposes of configure=
.
>>          mkdir -p ${WORKDIR}/dummylib
>> -       ${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummyli=
b/libstdc++.so
>> +       ${CC} -x c /dev/null -c -o ${WORKDIR}/dummylib/dummylib.o
>> +       ${AR} rcs ${WORKDIR}/dummylib/libstdc++.a ${WORKDIR}/dummylib/du=
mmylib.o
>>          for d in libgcc ${RUNTIMETARGET}; do
>>                  echo "Configuring $d"
>>                  rm -rf ${B}/${TARGET_SYS}/$d/
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181484): https://lists.openembedded.org/g/openembedd=
ed-core/message/181484
>> Mute This Topic: https://lists.openembedded.org/mt/98944818/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
teve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

