Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188D0C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 13:22:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.136])
 by mx.groups.io with SMTP id smtpd.web10.62607.1710163338009698900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 06:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=kNkmhmXW;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.136, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKqpEGzfbggsJeBTN7E9mBf5dFFbJ5dYjhBSsMY4ky3hU/hZOIlNVgZJRxlDwUVDwR54N5w95NI347pZd5GLb6WvfQV1u167aEkTcO4opwTXODg9oNsF2dFKsLITxYFzhnf6AWRwayIq2x/7OFUjAko6H1/Oti/ufpBRzPZXCfbN0LqDS2KVbKTsaJ4lHYtyc9/8I/sjXcJS8a9ugC3TcdRiQKIgq2pi2hRaGYGmYNe1r4UVJokMDezfCmAR+CAtGl141uRrEKxtmlhxP6K00JDe4rAioI224ZXtxRklXanzS+4MjwgUzWLjVrdoiGueJ5EbBbaGH6jEl7117CSgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpj+TSBed/HCPvyrCnTLmLytYehr0GzF7QY6TZX5o/M=;
 b=XkJ3N7MRDuXFPEG60N+7HtIULtYB9uJFV2h8bCMU2hvz5UysmYlhdtkMA5/re4/rU9FKWMRnymzTJbqkQtpYzFeaOkDn2voWc7EzbT3iosIofqc4EnvqUlOVR0RK4D7iuV3Bm0fMNF7ynpquHwPS3sQCzVIDwdOHPdnoBk8OpMmw2iRP9+TyBewCp6q7Y6RSfERbhFFy4G2B/rtjoKtt3GGevhtOJb7s+5JxsD5VfTHXiCq+eEm2WlMRyoRZzYDUJmbro4MtQ1y7hLFBTinfVFODlG8aUFPIKCbapZOJsgoG6ZF6tyWUk/NWjyu83h5oYGmoZv4WG/xoqd1zWjpCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpj+TSBed/HCPvyrCnTLmLytYehr0GzF7QY6TZX5o/M=;
 b=kNkmhmXWzoWuthkbPgu2bJOS24yHannWNNucn//gYUXUXl7tWN8ALytGNL4qdv0fuFV4EIAaPQdkoWdWa7lMED7iISqFK1x6ik5ulONnp0C3Xzq+N1u2NIOH6n9s/sFRS3Xp1TFa0qHbmCOgDCNBd4Z+/MBIDPwYgqnxamKZiiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by DU5PR08MB10702.eurprd08.prod.outlook.com (2603:10a6:10:524::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34; Mon, 11 Mar
 2024 13:22:14 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f%7]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 13:22:14 +0000
Message-ID: <6c5e770c-632b-44a7-981d-9d070ef95363@weidmueller.com>
Date: Mon, 11 Mar 2024 14:22:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] kernel-yocto: enable fetching kernel metadata
 using file fetcher
To: bruce.ashfield@gmail.com
References: <20240311091533.46869-1-christian.taedcke-oss@weidmueller.com>
 <CADkTA4PUzMKk7hJ76Zdz_UTjgCSDFVfpYq6FfHpb_LiRVb4ttw@mail.gmail.com>
From: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
CC: openembedded-core@lists.openembedded.org,
 christian.taedcke@weidmueller.com
In-Reply-To: <CADkTA4PUzMKk7hJ76Zdz_UTjgCSDFVfpYq6FfHpb_LiRVb4ttw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|DU5PR08MB10702:EE_
X-MS-Office365-Filtering-Correlation-Id: 1059046d-bc11-47a0-1c03-08dc41ce444a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5+jg3u7QXe9yeEbAdbvynEvD/L1vlhKnW1WmI/xWV+WLbQHT5KqgwDWr4Rqwla09humi70uWDuqFRE2pD+Rlonoq2PCcpawZVzJQTualC+OiEL9uZWaDcaavezi7zJdVn5WqLKgvLPheQajd6slsx600f05NrbEvRp3bgVWGa+gzCHIRSNbbzGyf/lmk7k03Degwk/s2fBd3cPLgHR6PyS2p8qxst7iSF70qeVfwKHCq1UhdexmLU99fELLoIvv8w3psmVfVpADovp3sauWCXr41soEH9eaBDqHfZ6PPy1J2vu17h50Es3mveGAxagcCEFoxJgtf6ZQ/3zgjSVEcki0X7dfWyvyDzoyEHSuZCl62e8fQsLwTdhkXQnbVJP8hGjuIEzi9E5PmpTeTBN/h7R2Jyc0WorxJO8ph2gEWArWo7stcTwMCwrzqJp64pOux77xx/bRY5gxMM0z929WQtihXuv7aki5Y8uv1NzOUElViOSdeS8EhrH1+pM31PaPDjWkd7dx1N2inQJusJjkxVOV3KjvYDaUuT0x4BPi19Ayaam97vLB3AECTcbZRDhty/kwsQtIWZPycJNtKLHVObtM+LWk8TAXEy66hrgtmxIM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xq1yTYmvPElZJmK/pwR2cZaYegLxIhmTo8EDv9m/ygPGOUXShrhl5ju4eXMV?=
 =?us-ascii?Q?aGZBpUvLCFhoisQnUGk5F+CClIKtopUAozSlygtZYLkAojoM6xx3vO3g+IG4?=
 =?us-ascii?Q?RSXdR66ey+V2Oy/w+lXf1GWltiZbiFOin5JUof6fT8TdPWbg06TorroyWSdU?=
 =?us-ascii?Q?iqqBvTlzQN0SzV+C7oQDNFnDGxyR/n1ienMxYD5/ViczP9mCtvvVrCoP9Lxf?=
 =?us-ascii?Q?N882ub7Fc4vEag2lVegM92ZetD2UDUvu/uf9C6KmaBPVEyi6TliEk2WxPjry?=
 =?us-ascii?Q?BTAVHg2UPWqAnuO9DqXSAuq7e+xqrNNEBgYnVqx1bn3KcXuFEfW5H40ndqku?=
 =?us-ascii?Q?uHRyZbrzsdPg3RYf/j8WgYNvarRXDlvgcbhWBStLkZRkJ6C9GQaY7qFFxRtn?=
 =?us-ascii?Q?g3thsrxadxZLenYk4RwrtW28q4H0LkxzbkaUy0Bl21VmbhikX/y2rKMZfhSA?=
 =?us-ascii?Q?ples37n/tQgxREQn4cMaaAVSfrAuV9mXw8qQUqlq2TDIJCVFeF2GN2k1XBjp?=
 =?us-ascii?Q?0XfHvgohTqN/0znXhlh4xN2jxTGJqRxGMH8/Gf6a63esQ8iswtM9NP4X3p3e?=
 =?us-ascii?Q?NCHzQI4/GrRvEItJOzsImaIMwaINUQuK0+FrEloy9QFv95bbkC8w07Xu0WLE?=
 =?us-ascii?Q?ixsIyFme+n6YCunSZlbgiC5ulu6A4L68pjw2qHwQX/bg2KH8gU7kpUfOj4M6?=
 =?us-ascii?Q?b9O9uhs423ahHyMXIn3bh81XWXsHasYU5CHIwXXo2HLeTvmRxk7xlskoO78v?=
 =?us-ascii?Q?dfZ+kwGvMk0VE0BSxb6ud0HRRObVKUkWFOGVLkEkAtH5JNLnbDR8bEu0RKXi?=
 =?us-ascii?Q?i5aBGMqrwJEgh1XT5HFaG26+wgVo4xu600ISliDYMp3vhQ507TOOL68/CJYB?=
 =?us-ascii?Q?+ueRBnG/kvzJdWfXlUmUEDSWvLBWpXx+xAWk8M0vNgvt94sBsrCMCVVRMm1Y?=
 =?us-ascii?Q?GnrXQDYX4F95VQbEfR7Ue3SPJxdrAatDo3AacmXWenAumYIE9LuXFISttzCt?=
 =?us-ascii?Q?EtH5ea5Xz355dV1xvEwGYIkyTzcmvNgP6hmQokAMFBFSHslt1Npfh+NybF8k?=
 =?us-ascii?Q?10Twxdnhm85lWkeDmzjzSrY4MyQ1f5QvPGsEWGH6gG7jWkDj6BsclxfyjrUe?=
 =?us-ascii?Q?6Or+zBbFzgbOKMYLKJX8tLedOy0y4vqK6uhkg/v6nL6OhAcGZ9ubSY+VHjmR?=
 =?us-ascii?Q?+WHt08GkAvVj8AV+/69VuNzn9o7RSfzmpDA8gFVYI1ZIbfOohb0HOE/blPhO?=
 =?us-ascii?Q?Hhuqiz/bKFU+YLjfvn9riARQR1XPfkGr9jots9s3vbuMr8QfKWUCBJCygpgs?=
 =?us-ascii?Q?1F4hX8NhbSjoEY1xen90uNIhzonZAulo70eLHMbiaMlUj5GCw8AxNoQIowSD?=
 =?us-ascii?Q?w4dtawqWvwf1nmDHWZmWCafQm4AIKklYFMLT2meiIloIJBs3GIcaveXgsOBe?=
 =?us-ascii?Q?CZPJNneMq+lr9W1FTCNVgXme/nOFRE3JrYVpc9FYwMd+ZV3lx7dGRMRsFN0o?=
 =?us-ascii?Q?8LZr2r9DZWjtFHPbcNDL+KjaAPTyL+fn5uBV/gWWL59ucrVGoxKfWaRe4J2d?=
 =?us-ascii?Q?VOj+VfpQTECpsN193tZiqBeykeL9j9V5Nfu/3gp5L5hU8Uy2nKDABE0d35Za?=
 =?us-ascii?Q?vb0uJtM2KEaWwuLGT/gZGRc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1059046d-bc11-47a0-1c03-08dc41ce444a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 13:22:14.5343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyN1R3+rP0iz2aKnqxvhGeYr+duZKflWiST0TLn83CuUZ//f8QsRdNmk6RDBR4aM4raJ9MPJrsrzbnZcOyrPuP7B/1BatP4+Q0MH5QTCYDVdLH8TP33Zxt4tj/xMys0R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 13:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196937



On 11.03.2024 13:46, Bruce Ashfield via lists.openembedded.org wrote:
> On Mon, Mar 11, 2024 at 5:15=E2=80=AFAM Taedcke, Christian
> <christian.taedcke-oss@weidmueller.com> wrote:
>>
>> From: Christian Taedcke <christian.taedcke@weidmueller.com>
>>
>> The file fetcher does not support the destsuffix parameter. It does
>> not rename the supplied folder during the fetch. Therefore the folder
>> name (i.e. basepath) is added to the kernel-meta search directories.
>>
>=20
> What's the benefit ? I need to understand what you are trying to
> do that requires this.

In a BSP layer for a custom machine we use the linux-yocto kernel.
In the BSP layer the file /recipes-kernel/linux/linux-yocto_6.1.bbappend=20
adds a local folder containing kernel metatdata to the SRC_URI:

SRC_URI:append:my-machine =3D "file://my-meta;type=3Dkmeta"

The folder my-meta is a subfolder:=20
/recipes-kernel/linux/linux-yocto/my-machine/my-meta

Without this patch we would have to write:
SRC_URI:append:my-machine =3D " file://my-meta;type=3Dkmeta;destsuffix=3Dmy=
-meta"

When using a file fetcher for kernel metatdata without this patch the=20
destsuffix property would always have to be the same as the folder name=20
itself. With this patch we do not need this duplication.

>=20
> Because my first thought is "absolutely not" to changing the way
> this works.
>=20
> What I see below is possibly going to break out of tree BSP
> definitions. The combination of kmeta and destsuffix really
> isn't there to support the git fetcher, it is a keyword combination
> that I used to indicate a meta-data repository that unfortunately
> overlaps with the other fetcher parameters.

Ok, that was not clear to me. The comment above the function=20
find_kernel_feature_dirs() indicates that the returned value has=20
something to do with how/where the fetcher stores the provided metadata:

-> Return the name of the repository as it will be found in WORKDIR

I think there are 2 ways forward:
1. Rewrite this patch so it does not affect out of tree BSPs (remove=20
exception, still use destsuffix for other fetchers), or
2. Drop this patch completely

>=20
> The reality is that I won't be able to fully review and test
> this until after the upcoming release is done, since I need to
> also see about pulling together some regression tests and
> submitting them at the same time.

No problem, i am just in the process of upstreaming our in-house=20
patches. This is not time-critical. We can continue the discussion after=20
the release.

Regards,
Christian

>=20
> Bruce
>=20
>> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
>> ---
>>   meta/classes-recipe/kernel-yocto.bbclass | 21 ++++++++++++++-------
>>   1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-rec=
ipe/kernel-yocto.bbclass
>> index 9a86616dad..3cbdf21df8 100644
>> --- a/meta/classes-recipe/kernel-yocto.bbclass
>> +++ b/meta/classes-recipe/kernel-yocto.bbclass
>> @@ -62,8 +62,8 @@ def find_sccs(d):
>>
>>       return sources_list
>>
>> -# check the SRC_URI for "kmeta" type'd git repositories. Return the nam=
e of
>> -# the repository as it will be found in WORKDIR
>> +# check the SRC_URI for "kmeta" type'd git repositories and directories=
. Return
>> +# the name of the repository or directory as it will be found in WORKDI=
R
>>   def find_kernel_feature_dirs(d):
>>       feature_dirs=3D[]
>>       fetch =3D bb.fetch2.Fetch([], d)
>> @@ -71,13 +71,20 @@ def find_kernel_feature_dirs(d):
>>           urldata =3D fetch.ud[url]
>>           parm =3D urldata.parm
>>           type=3D""
>> +        destdir =3D ""
>>           if "type" in parm:
>>               type =3D parm["type"]
>> -        if "destsuffix" in parm:
>> -            destdir =3D parm["destsuffix"]
>> -            if type =3D=3D "kmeta":
>> -                feature_dirs.append(destdir)
>> -
>> +        if type =3D=3D "kmeta":
>> +            if urldata.type =3D=3D "git":
>> +                if "destsuffix" in parm:
>> +                    destdir =3D parm["destsuffix"]
>> +            elif urldata.type =3D=3D "file":
>> +                destdir =3D urldata.basepath
>> +            else:
>> +                bb.fatal( "unsupported fetcher '%s' used for kernel-met=
adata" % (urldata.type) )
>> +        if destdir:
>> +            feature_dirs.append(destdir)
>> +
>>       return feature_dirs
>>
>>   # find the master/machine source branch. In the same way that the fetc=
her proceses
>> --
>> 2.34.1
>>
>>
>>
>>
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196934): https://lists.openembedded.org/g/openembedde=
d-core/message/196934
> Mute This Topic: https://lists.openembedded.org/mt/104859707/7654653
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ch=
ristian.taedcke-oss@weidmueller.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

