Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E017EC004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 12:18:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.85])
 by mx.groups.io with SMTP id smtpd.web11.119333.1698063490086794200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 05:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=q5uyqg8j;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.85, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0IGHfPZdP6NpFP08X4kuf9OwPimHqVqrDeC/szNxQqsrr5/NFAznUU2SkIgyqajf6dD11nWavxnf2/GDyFCXoN3X3MIbImLuQT6TXtPoWYokTDgOuFkAJO79qDmhzygsAresRbj7A8qPdRbh8AEhuVyQx/62FULv7/bnSa8pHrc9R9qBmIWzFZXBsEg8mUCDjOmQxrP2TUbF1o9Svs3lw56FXXFltH9kWRVhuN969dfsHvB0Pd+5jY423VP2MGkrEoKPajlmHpUP50oxHf/l7uB/mxehkAM/bDtF9GedMHVJvFpzvSqH/EUwNTTqmBnzWFi6rJ/E9+0j8Lf+NpXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTRco6GNewPIop6qb41meDvp6t13QAw4D1mqGJAmtBM=;
 b=DErZtAUPCnYyeqZWSNJLyUePZSOpdSbn8vX3HiQx324TwnloumoCPJROAqHcTfZ+WOGoJNf3/j29DAJdVT4WUErF9Hr3yzXCPvo6XVF0B8O0SQKarfEl83H2Jf/P17QpQf0pzzvBHyYyWflGuDhlFLvF2rLnInIYUYPdyyqLVFw1dXpLgwqNOSNA0liFcWxXlN3TlVL56rLe6llLU1cP1Q0EcA6h4zv6XZfkyhkegawGJNa3VPPUGNw3HvjgMionrUgaFr0hoCiizz8Iznf0B7eEeGoqcVVCnh9aDJjjd6TAQbWS3Chz5DLMjG8PvXSrMq7aJCmLH5mbQS7UcqhrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTRco6GNewPIop6qb41meDvp6t13QAw4D1mqGJAmtBM=;
 b=q5uyqg8juj2yc6Mt5xYyZYFiUGHLo+r0FloNaGC2P5gF41+OUsQPftWnITbfYM9FKu+5bsBKknBBT1GMN1KIEZgwq90yW9FlZyTvMNPEHzHATXcjU9+CXDFq3LUi0BkX880MCl9CKadu1ShoOt+iBg1wL3GgcwChVbcOhbGI/jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DU5PR08MB10578.eurprd08.prod.outlook.com (2603:10a6:10:51c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 12:18:07 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%6]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 12:18:06 +0000
Message-ID: <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
Date: Mon, 23 Oct 2023 14:18:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::20) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DU5PR08MB10578:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df844b6-313e-4bfd-9e80-08dbd3c21cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XnJIdGJjj51RpKRBFPVyjeZm9bbPMmJJ+ksZfuwXkT3UIohombG4BrCbRIL1lKVg/P0EjcQk9KLo7jmQGw5FXgn1FikgqpMBZK3U9LU5Cvfkkz5p/xJmC8VW2HgqjIHrqzhVFYvDAF9wAhOsjgvkT9/9aHM+LaYcBNhnAwTwYGwC7OOYLV76hyF2l8Tcc4r5Lb3gp4tOMqp5VKKpnPXbXJQbciqkD0H1ACC5mrOE2lxg+KBoU+VtmFCRcNfoWJYkUHJV5+WKQOSrFQSoqGy7WeLHnXYwcJt4ogqoITBjgpdbViKdQs/dsvcScZseXlxKsqxyAKdiHehjigbK+rUzuMhahyKoVYS6DjoO+o59rtkqmRDRr0o5eMFVombe8mfbcwxWKEQskAYDkRZxgQQsprThZUUhNaoc2hIGP0vQtXn96+1VWz9iK7hWu76RLBn0dBgHgyyNLWVPBXU7BnmYtQLQVwqrfUw49iiz/T0c3scZSEcbl2+QhlSa9XirBo3qP99evxhNnP+4WcQ+ePNKn3C3LyS+Ua06+dwPh0HhhJlcn6MMKz1EbC2tnAqHwK/CdqFtfisTC7bwNt1X5yCdr6fdm7mDn0FWI+n6k5RlJ24uSfBlQUYuPhw8q48vreF+wcq4LXgf0qH/7DqMBOhRSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(38100700002)(66556008)(66946007)(316002)(66476007)(54906003)(2616005)(107886003)(478600001)(6506007)(53546011)(6486002)(6512007)(83380400001)(5660300002)(41300700001)(36756003)(86362001)(31696002)(4326008)(8936002)(8676002)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NVOVkEOM7C75gOKqOdpIGCYj2/KtnjZMDCYENX/EsEGzQXWsn/xXdnDW63Qa?=
 =?us-ascii?Q?57yKaT6MewPkiSqhLSeFCTSQiVTuIoSCdz/4IIHqVLIZYj0L8jy/99lxa7e+?=
 =?us-ascii?Q?7g0qMYpABKwCgpI/Or33j3yPrSWbG9PRyt75Rqs+QC5wKY2YQQg9W4BcwPtv?=
 =?us-ascii?Q?9vVUw3wZiXXzwoLkbrTdkP8tTK1dZ6Rw+gx2+tnOj7C6oxDjlExOkVu7wfYU?=
 =?us-ascii?Q?JHkNld/yYoIbVRqqhMrXACOo/8SgtYCX4BYJ3IY3POodP1QL2liE1VBTwzuv?=
 =?us-ascii?Q?65jBcYMCg6zZWEbPJlkHDuANeRyjr3Qluz4ZWbV2QT5uYFwMlbnNAu7pc7jq?=
 =?us-ascii?Q?G0mVOPddfEWMcOyBZyUIvhUlKt97UBLxkS6iUMmX0asJltreZSWNAchqqnCo?=
 =?us-ascii?Q?gCMBKd7yYd91Uy2Cc5On8ylYDrM9d0Uk67mF1itC2sQY+4yB3c/2XPm4VfUS?=
 =?us-ascii?Q?YlsTtcuLwUM26aMy6Pu16AuzSx8Nhuaw/rxJbSJAnIEWyYt+cbx+BXgy7bxk?=
 =?us-ascii?Q?x+doZdpUn3lHejjw65QkpzI2JZzEgBV8NLfZbtKiFFjiUkAL8PFJJYNu1dGD?=
 =?us-ascii?Q?bxMH/Plnlk+3sLGcb5Fafyfzt3odknLtW3QQ9xjPdm6kNg7K8UUgklLh1GRT?=
 =?us-ascii?Q?JzaQWESrZVHFl7+SKr/Vfi37hYUeRWrPfqOkWDR2oUVHGzZ0V5ifqXBDpblr?=
 =?us-ascii?Q?boOMCgSSkSVoMNN7tGOVra6k258ZWjPTx7fRiAwkXPgsYWIfvE0TwP61yElN?=
 =?us-ascii?Q?N5QBPp0cC8LSFt/wHFwYLLmHrcaU/8CdSEZQvNpkCHpA535w/C/vx9lQP3QV?=
 =?us-ascii?Q?Ab6ICNIhUzE9B8xr0HK+BHuoLQzPd0FwisU4BM5S/gKH2S7BMyiKoXj2V6Kd?=
 =?us-ascii?Q?RxEAjAmuX5ejnEiURwA8GBVJOCw6ILJ1hC5i0hJvpxAIdyzHZrPdz0KECMca?=
 =?us-ascii?Q?7rg/g2i8oTA4JM34J7EbrBPsWi8WidJOavomJg2OWIeRwKkjBaG5Ualnilvm?=
 =?us-ascii?Q?3/T8/AWE2xlRBTaXW5eanTjaK9YVQ0EGMrucbPqrfiwEo40IFTNLIrb+83FY?=
 =?us-ascii?Q?aCKOp3SdxLwrPmnYMTisUkdGKRCNG/CAmMT8MBv+xYSllbrjzZmll8M5Bysk?=
 =?us-ascii?Q?MAx1ALOENGDsP0j48nFzJPkpqc2aUXnGexnQY2l2WI/Pgm1J7303nEh71mv1?=
 =?us-ascii?Q?h23mj402dSN9ZW3JDUqR6opeewijxb9orjDu0B2mEBHJcJhrEHoUVnnIjUkL?=
 =?us-ascii?Q?U2NLNRngwtSZ83BJ+23EWQcnaUbWiPmVyOy8Hkx5dZH8tTI/VvcKHmDjbBz8?=
 =?us-ascii?Q?F1JoEqV7XosYIVcmz2J0fC2XNuOJi0jWA6DDlohJeYQJD+kBCGE7fZz7R3K4?=
 =?us-ascii?Q?k5oz5Ir+P39BvDWSp3LoOTVRPOZDcFQod52Mr3dWiBH+a+T+WQKA6KeZhy1r?=
 =?us-ascii?Q?xoKp02zofWrPvePh3zcW6uEQgIPI32TtxMxOQyZ3u7VaI1q5aS8EfsweLyLw?=
 =?us-ascii?Q?Dtm5o1MQ2cDsmZcZog+f9VUytKDz512yIhH+7Pe7JaC+k7lG9bqTVJ5ElBtr?=
 =?us-ascii?Q?bIwxtJQnBaymUF82QQM/D2mFvmpk9G98Gtuc93+3v7Z8ORarQoJik4aRvl6B?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df844b6-313e-4bfd-9e80-08dbd3c21cf0
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 12:18:06.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQWGstQGSjpVK8G4soEuqYz+EgYA7ksHaZtz7qLbxq1nJFdXgiKqthYd+XDfsVhf7prdKqehmMJd7yKXWnfQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 12:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189623

Hi Slava,

On 22.10.2023 20:34, Vyacheslav Yurkov wrote:
> Hey Lukas,
> Thanks a lot for the patch. A few questions/comments from my initial=20
> test below.
>=20
> - I tried it with a go-based backend I have by providing ssh URL to=20
> github. It seems like the GO_IMPORT is set to a module name from go.mod=20
> of my project, which of course fails to fetch it like that, because it's=
=20
> not a valid URL. How is it supposed to be used?

Your assumption is correct: the GO_IMPORT is taken from the go.mod file.

I've not considered the case where the repo URL is unequal to the module=20
path. This may require manual rework of the recipe. Another solution=20
would be to take the source URL from the recipetool. I think there is no=20
correct solution to this problem, because probably most people might=20
want to have the original solution, since they are creating recipes from=20
oss components (i.e. from github).

> - I've got about 20 lines like:
> INFO: Please add the following line for=20
> 'vendor/google.golang.org/protobuf/LICENSE' to a=20
> 'lib/recipetool/licenses.csv' and replace `Unknown` with the license:
> 02d4002e9171d41a8fad93aa7faf3956,Unknown
> INFO: Please add the following line for=20
> 'vendor/gopkg.in/yaml.v3/LICENSE' to a 'lib/recipetool/licenses.csv' and=
=20
> replace `Unknown` with the license:
> 3c91c17266710e16afdbb2b6d15c761c,Unknown
>=20
> I believe I have to go through all of them manually and set a proper=20
> license in the recipe. Still the questions arises, what should be a=20
> better way to reduce amount of this work? Adding more hashes/licenses to=
=20
> lib/recipetool/licenses.csv would be a way to go? I'm just afraid that=20
> file might explode if we use it like that...

The file will explode anyway. Thanks 'go'.

Adding more intelligence to the underlying license detection could be an=20
idea: in your first example, the license file contains actually two=20
licenses: MIT and Apache. Yocto has no way to detect those cases.

>=20
> - Could please clarify where does the version from go.mod hide? Is it=20
> taken directly from go.mod? I'm trying to understand what should be the=20
> workflow when a module version should be bumped up in the go.mod. Will=20
> that be reflected in the recipe in any way?

No, currently the go-version doesn't play a role ATM. Except one case=20
when you have a go.mod file with go < 1.17. These go.mod files don't=20
include indirect dependencies.

I hope you might find this helpful and thanks for testing!

Cheers,
Lukas

>=20
> Thanks,
> Slava
>=20
> On 17.10.2023 15:26, lukas.funke-oss@weidmueller.com wrote:
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> This patch series adds a recipetool handler in order to create 'go'=20
>> recipes.
>> Each recipe contains a list of dependencies in their SRC_URI
>> variable which are derived from the projects `go.mod` file. For each
>> dependency the corresponding license file uri/hash is added.
>>
>> The recipe may not work ad-hoc, but is a good starting point to create
>> a working recipe and have a working offline-build.
>>
>> Lukas Funke (4):
>> =C2=A0=C2=A0 classes: go-vendor: Add go-vendor class
>> =C2=A0=C2=A0 selftest: recipetool: Add test for go recipe handler
>> =C2=A0=C2=A0 recipetool: Ignore *.go files while scanning for licenses
>> =C2=A0=C2=A0 recipetool: Add handler to create go recipes
>>
>> =C2=A0 meta/classes/go-vendor.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135 ++++
>> =C2=A0 meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++
>> =C2=A0 scripts/lib/recipetool/create.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 scripts/lib/recipetool/create_go.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 730 +++++++++++++++++++++
>> =C2=A0 4 files changed, 1029 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644 meta/classes/go-vendor.bbclass
>> =C2=A0 create mode 100644 scripts/lib/recipetool/create_go.py
>>
>=20


