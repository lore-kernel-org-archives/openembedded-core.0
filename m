Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web10.9271.1610550581752079950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 07:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n7eQAn+8;
 spf=pass (domain: windriver.com, ip: 40.107.94.88, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtkSSF3nV9QvrQcvlRQ8uVDSTXftwlv8k5LQLf8OlajQ6rgSz5s48AEXLlxjV0yzUqFeXvZaHJ5O/u7dKtyOaAz3mSRrJn+J111uE7oEeayGvS6kBWmesVv5S5zJVH2MHF6R7Hv4ilaAtcao6b5xpJFDLC+XHTY4lmof84yXIZujnQEDwgzrvSZf+iV92XKP1M5gqHt34vrhx+CjLeKfTtHLmbVdFkTpuJLb42FyrUJtCfr2LncfPhhVng65prUEo84OAOnjP7bRF8j+CA5xOj94mL8Il+U8lLQpivYzVOCa6un7ZihbI5vvBB4IJMXuUMQ3VpY55ghYyb4VKBjH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBmnWpuFb4hPeTrNV+DMR3fHuEGUlqkImUBrjRVRVOw=;
 b=CFE/6yiKdW4PvP8P60LdAoB2a8Vja2l2g/DWTbkSKLHesfAvJoIIhBalaew8EF0NL3SKfko//76D4fZsVjFtm6ok/RMeiHwMhTonVPn7TZZTcGMslbhSPIR6VI7UMNGuot73peTtG1oi1Ky/yJ39TJuh8UlCDIxfc7/JKhX1Ir/zapcLpM7YlqF/zhM9PdZ/zMLuE4OeEBjQLU8GdWSazm0lRea82i1bAcuDRpyRqWIfsaU+cKs/pVfaeIAYyaBgQNAVwD9GB8X05sPQrXd/ENyr28SElMVf4quef77sAbBIh8jrplyDCJvPJAOG3A+QPXBMBrjXqN9p1V2ACeGDmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBmnWpuFb4hPeTrNV+DMR3fHuEGUlqkImUBrjRVRVOw=;
 b=n7eQAn+892TDTTN31/U7eFcarJ0KAstxK0s7P+4NxnVDyKUTZaUI4pt76/lEZLXOZZH9LvsCXQgiwCSqOVb0qwHo8evtmPs8KYku/wjOsYUvDh7dlZ6G0rhMET9L//jui0sdt9hB0PyP5Htrm9M1TBY4yCrkmbu8sdjlnBpbAw0=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 15:09:40 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3742.013; Wed, 13 Jan 2021
 15:09:40 +0000
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Add support for qmp commands
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210112231109.4048330-1-saul.wold@windriver.com>
 <20210112231109.4048330-3-saul.wold@windriver.com>
 <4cde6b73149d57c967f77d213baf3b33e0cfd63b.camel@linuxfoundation.org>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <305572bc-83d8-986a-2e11-367470149930@windriver.com>
Date: Wed, 13 Jan 2021 07:09:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <4cde6b73149d57c967f77d213baf3b33e0cfd63b.camel@linuxfoundation.org>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 13 Jan 2021 15:09:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcf8f20a-416e-47d6-7089-08d8b7d54044
X-MS-TrafficTypeDiagnostic: MW3PR11MB4537:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4537091E6725DEB5EB123A10EEA90@MW3PR11MB4537.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CoEyemYQOHO7e2PllrZjIU70cAN3U7aOFWwZDQt/vwlinyD84tD9VUnfk+nJpzbzFJBcqKHlA426XFI7wAf194aKkxkjIgwCXZEjhKde0+zD2OPelQ03ExvhgivmFOjKTGhsT9pp7LZjpqoHTMjTOPSgj9FlyxCNBXtEXKhncAKRmaVNVMY6P6zko7I3QrfUAVswHvCHJH/PHeFNbPlRbBsGy4/QUCRnjSv6uERyprlpMqhzvTabsKpcpnBjQo0D/BeTIiTJ0gpfj9iv8rnwpeQnFyTkTykkpuNs6oCd03a4PDF7ylj8Pz6xjwUu/Ih9r0rHMUoY8tJMRed/iChPEYm5IwwkQ4ozgCNRY5vq/uGoK6tj2EmSKaLrxWgXs8vwpc3IZEVoVP7YDRJWx2azx0S9fu+jd9rNNEm/sXoTDql1p97MgZUYIATsDSYuGSbNVvs6R3UkU9KCvQBoZBjuBtNZoJBdOsjlIcARBMmKamQELTtuXceh7tuqXf9bgHoaJ7AqHxnrj5AkGEqNerokeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(36756003)(2616005)(6666004)(956004)(53546011)(16526019)(66946007)(966005)(31696002)(52116002)(186003)(478600001)(26005)(31686004)(86362001)(16576012)(316002)(66476007)(66556008)(6486002)(8676002)(8936002)(5660300002)(83380400001)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?yakJ86+BVE4489O2hTz5f6q9Zzt6TymdnNmdWhu5e6cRBeeqHJqediROT79Y?=
 =?us-ascii?Q?ctxDPLBppN6iN+KFdJUsR8OP247P9bRVj82oKIUHTBoSUO0ISLO9anVrUaiO?=
 =?us-ascii?Q?xfi/ec3DR+e8srx0UTL3Ecxqiwkn9c5LXUtrQEFWxM5Euy06sUxB4vzbJkKx?=
 =?us-ascii?Q?VaOHf4w3R2T0WtQ71zmp6FuJNbiE8y2heXsA3mVWUBERJp50En3PmfIJBhxH?=
 =?us-ascii?Q?4OD7YNLmoxWZqatBdhvxA8wKkKmHx6jCYoCIQ/mVsCym+MIf7c1IYjxxHsFd?=
 =?us-ascii?Q?TtX/7hP4pyvnugNQ8X/wB+G7Yo15oTvAe5hRFBuBz1Q2dUtmYsJnwZpQmHJ9?=
 =?us-ascii?Q?PrRvUD++dY9/JYou81YDiB6qMABtltvsP0i1nJmfimDzLc3si3u9q+BAL/mS?=
 =?us-ascii?Q?HIp+KULTPhVESAuxjjpJZwq1xSygNdTmXdTxG0FPPk4GpiVqGtzuN2wg239Y?=
 =?us-ascii?Q?WI5PWbjfBBiFWlnct/MbPkWIREegPY0pp81TSI9kb7QlSFPW5JXKOZr7WYh4?=
 =?us-ascii?Q?/jEDhy/x2bXJyniMJSxlKQjDdfvrjxv9c+qvljgMqwvj1n2cEfvkuC7t6Uwf?=
 =?us-ascii?Q?lG6Xai8WT2etTWt6/6xN8Qpk92j3Ni73C1VnnL+35NXQeAF6qSDUW2ByA2Sl?=
 =?us-ascii?Q?vgN6zoqu9yy/u6EYPs4dTTn2f/o8nFExlIBJIHS/YQ8pfDe9ccr6QD8jDHS2?=
 =?us-ascii?Q?fujfEcUFKkgYv9knI0c9PzVTzwLZHXWOAM4ADVSilpWPZaT6RlCixItKBMps?=
 =?us-ascii?Q?5LkBbv+HqEEvB6ghsAfLjG0boF8HkMcdL74nsXflCQrntLUzhaGOpNx/vGCi?=
 =?us-ascii?Q?flL6E3Vz+JmETZrUCh9WtoEKZZGhKezLPOO8mGlQtkW1e5X9ny4fvTizN6Bn?=
 =?us-ascii?Q?SguHnk05HJKAiDamsx92hqv7hcGC7pGXPiwS5XuX5BcJVlpRR0TmKnbyTb+t?=
 =?us-ascii?Q?US3BOrDvzh2LVxMyEHli99hjxjURc7oulqPe6apAM5o7Ox+YzFamVkeLzSmp?=
 =?us-ascii?Q?+mK/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 15:09:40.6153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf8f20a-416e-47d6-7089-08d8b7d54044
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDwoLfdgalVFZmDWe09kqhrnyJXivpj4/ezyBPnTZ0vwQ1KchTAEFSCC3qkkG0iKRhzeKH8O8vsa56r/pbZ77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 1/13/21 3:45 AM, Richard Purdie wrote:
> On Tue, 2021-01-12 at 15:11 -0800, Saul Wold wrote:
>> This adds support for the Qemu Machine Protocol [0] extending
>> the current dump process for Host and Target. The commands are
>> added in the testimage.bbclass.
>>
>> Currently, we setup qemu to stall until qmp gets connected and
>> sends the initialization and continue commands, this works
>> correctly.
>>
>> With this version, the monitor_dumper is created in OEQemuTarget
>> but then set in OESSHTarget as that's where we get the SSH failure
>> happens. Python's @property is used to create a setter/getter type
>> of setup in OESSHTarget to get overridden by OEQemuTarget.
>>
>> By default the data is currently dumped to files for each command in
>> TMPDIR/log/runtime-hostdump/<date>_qmp/unknown_<seq>_qemu_monitor as
>> this is the naming convenstion in the dump.py code.
>>
>> We use the qmp.py from qemu, which needs to get installed in the
>> recipe-sysroot-native of the target image.
>>
>> [0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>  =C2=A0meta/classes/testimage.bbclass    |  6 ++++++
>>  =C2=A0meta/lib/oeqa/core/target/qemu.py |  6 ++++++
>>  =C2=A0meta/lib/oeqa/core/target/ssh.py  | 17 +++++++++++++++-
>>  =C2=A0meta/lib/oeqa/targetcontrol.py    |  3 +++
>>  =C2=A0meta/lib/oeqa/utils/dump.py       | 31 +++++++++++++++++++++++++-=
--
>>  =C2=A0meta/lib/oeqa/utils/qemurunner.py | 34 ++++++++++++++++++++++++++=
++++-
>>  =C2=A06 files changed, 92 insertions(+), 5 deletions(-)
>=20
> For fun I thought I'd try this on the autobuilder:
>=20
Seems it was too much fun, looks like I will need to be able to start at=20
least one build on the AB.

> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1748
>=20
> Looks like we may need to use importlib to import the qmp module as
> otherwise oe-selftest can't launch (and the qmp module may not be
> installed yet).
>=20
Ok, I will look into this, it worked correctly for me doing a locally,=20
with do_testimage, but clearly I missed something that between the=20
qemu-system-native install and the testimage.

> I didn't wade through all the errors, just the oe-selftest one.
>=20
I will take a deeper dive on these.

> I also noticed warnings from builds that did work.
>
I will look here also.

Thanks for at least giving it a try.

Sau!


> Cheers,
>=20
> Richard
>=20

--=20
Sau!
