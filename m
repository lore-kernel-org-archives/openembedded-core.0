Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68204C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:15:21 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.105])
 by mx.groups.io with SMTP id smtpd.web10.57162.1699283714091586577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=eOsqw0rd;
 spf=pass (domain: prevas.dk, ip: 40.107.7.105, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVvVxhaBLXK1+yvqy/MeoXL6CyGZveRobS4PDqXuL4FXhQQR/DV9sfgew750+aHZiMFClKyON4w4XMIK7UjhVC0UtgJy5D7YBj7pWYnbWqbHHEhA8yjMVnU4UFv0C1C8t5OlgysC/GFpqOgfCNjmE79VSTutoxqIo4evbl2mN9C2y9hRpAfF25UoYgiv3wq4xRTmrdN1o491FI6nV51KKRFW2REAwgQEBxaEQfoPTH4UOoVJNCw8SusMPyBngjtm7/Wmoe7VrgfNHkMDGcrpp3U3sXBdj7xtsWKCFZs67ktVUjJ1p+MNS+DiAyDy43ddLbsKY1rWOvtKTwpfbJJxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo8Cpeop1572cv9J491H89IA5FNuggud/3WASVsBWdw=;
 b=oGYt4jTAh2v/Sw08/3AS+koy+1v7wDtb3NNPzMWrYGJ/oEQ3e2lD3143+0bFcty8E3m3yJPq9PSW4AQv3eAzEygxf8qtpMz0pZy3fQcbbMSKL4bbS8q7lU7ScJPs4lECoYHt7+RUI19dKo7PSplakCi9m+bsbWtkDEojbvPrDJp59NHFV8IPjXZuw1513aOp8jEbkubLSEOZFsFYWz2jWRwEGd7oW6qEFg9srggNkGVf7+6k1rEFRj+xDbY6fzFhkw+iWZ9RpC+npJfLOHi3t3iMWpasSriyklaepjFZkac5rOgvwiy8S6CYEsDSQSaVd5C2xyuVVOVz062zRXuekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo8Cpeop1572cv9J491H89IA5FNuggud/3WASVsBWdw=;
 b=eOsqw0rdOK4XwJl3KuN8md/fluQk2UIOyf9GMSwb55dIizrNey08N81Sd5Naf7A4GG9sc2NbpIM2PQrcBRNdUP1bE5hiOi5QglCq2GXFrzBUIrIdJKtE0JzQTv3Jx7hTN2laq7BHnsaIiSz/We8ydzc/hXfHuqpGJJChIrmZi70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DU0PR10MB5922.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 15:15:09 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 15:15:09 +0000
Message-ID: <9a9a2845-68f0-45b2-b934-5e8438361670@prevas.dk>
Date: Mon, 6 Nov 2023 16:15:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: add jevents PACKAGECONFIG item
Content-Language: en-US, da
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: openembedded-core@lists.openembedded.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Max Krummenacher <max.krummenacher@toradex.com>
References: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
 <CADkTA4OsEXpRsULAkvx0cbFvdH2xVPW3JGuG2FcJ43OZyakBzQ@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CADkTA4OsEXpRsULAkvx0cbFvdH2xVPW3JGuG2FcJ43OZyakBzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0087.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::33) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DU0PR10MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: c2823407-f40a-40b2-8ef3-08dbdedb2a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yVzEUUqBMSWAS0ES/ct8QI7emrxkyY+5sQ67qDAm8B5yhhV28aLXzAXVgZVYE8IUqRACL64snWFU0/IVMwmb8VC9tK+Bf/Nzffrf2dKSqaptj5szF4nUgpkaES2aHhwZqTNKXFkccFRjBKigda8BVlvHlyCSMf+99kKdE2tkXXamwVhMP/m9BgHKwRFTfTXuIZ2UwaUcs4InP9mh8xKatHNz+Ip/A/cgU29zQ01bL+mBpGPJDjGQURSwrZAX4UTD4YbFDcEZgH3DmVSy+1NarjDI0PqPNUFEBrCh3fQQpf8M6qzLWAV/p8oMyg7CkgqBmnt8jzZY30zhFcZt2sOSqtQn29wM9ej4hnwIxDvMmstkUQSDETGifduZPJyn6rZT+mHCyrzitQ9RGdpsUpj/Iu1SBhSgXDYTAyvwosdLCwFjubkSkzsJxnDywg/U7HcSUu5v9CR7KHC2hZQVerI61FysVxFkLqx+5AkkRCshJNSZJ1c22sNjNmxRDrXM/ulPZwWInFIxWK4n6FW6jSP9GEMDCN7lp0dARr1rk/YgGTpLT3A+Bso0tlvH0qBkCz1kFO9e5abn5POIag0TThCxvPIDDJUvi+/w5bfeFR4E7vSZKUjq/7mxmmmLj8pLkF1Q/gfIcvrWPrqdzkScD0vApg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(39850400004)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(36756003)(316002)(8676002)(8936002)(83380400001)(4326008)(8976002)(26005)(66476007)(66556008)(6916009)(54906003)(66946007)(5660300002)(41300700001)(44832011)(478600001)(6512007)(6486002)(53546011)(6506007)(2616005)(2906002)(31686004)(31696002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+6OindHLNCaw8EynnTfRlgMJL8PUPJ8102mvX5Rmpvfp5zV3S+lO4VvXd6wO?=
 =?us-ascii?Q?eQ55PtCvE8+M7Nth24Ijl3uMDSZ9DyhLoMCm9j2q1rlqkQNPhi5XomIL68rJ?=
 =?us-ascii?Q?USgQnfeowdcFei8VYv5Ca1ulUtZOPcbEVx/1+H57Z9Vk7ypddhXyF5Rk8Jcw?=
 =?us-ascii?Q?FXI6ysrP24dOmHsNweO3xxXZtIFStCb3joTmbAXikx6vtBhOLLBLNCdmsdpn?=
 =?us-ascii?Q?IiWjizpp/tkCuXOOqOJf2wsVkeOqVwl9encJo9Gnt8xroCWSmeLKNNVy1VzF?=
 =?us-ascii?Q?KRXzciRUmfReseq++w17CD2OPFYObNBDUb9BAyb47t24KpsRBJs5PjSmW+tS?=
 =?us-ascii?Q?NZ2ry9Ztuww2wBXvbYlDtc7I4h/oDS9mF8EArzwXLG7WztcVFWSBkhJ+6gO+?=
 =?us-ascii?Q?eO/yNKpPTeLONIvg7S7pog0NN+/uP2iuW7eFpgIeDll9xl9lulqQj8XPl60j?=
 =?us-ascii?Q?TDFZhHo5XfkKycCM0g7yQpGMgd7Q1O26RlMLR5rOaf+5OuMoXPyO1pPIJIYO?=
 =?us-ascii?Q?Avz8vfby8X8ruNtf41tfovCmig8T4jU8ijWzF9lai1wNe3kbrsgd9juF52Eo?=
 =?us-ascii?Q?po2H0Vx03Y9Jbr3YA8SMTZsq4rcptQGRllpeRHPsUUCth3xx3ixpTNyyLCti?=
 =?us-ascii?Q?4SmYfsITME5r9TD7jsLmPPJegewniSybm1islpb4qQVE0MU32DEO87jGnl25?=
 =?us-ascii?Q?holuDIGNpDxY0B3kuIaYhXDSvuC2MLjwhYAMsE30ssT7Bl/VLGvYmor2tNs7?=
 =?us-ascii?Q?69bnRNAHsHiTPD++A/MFOwmGJvHOUEboEY64QU0BRLlmjkt3g986GkQULyDr?=
 =?us-ascii?Q?QdEuJLFTy86ZeSSxrkTjZDb+zrzwVNIkFr44KP5yTYcb4+Zi+oJ6u1Ylkjlq?=
 =?us-ascii?Q?bfQjQ3TuCIYGIKMrTKEzSh3giMgZe7zME4FbzBCoPPJTelaFaOcCJ4xPh1qi?=
 =?us-ascii?Q?24MBqjUtRzjzXZv7iH7+O/y8L5mipw8oYZiz/826mft9cFw8c3qcHyLTOBm4?=
 =?us-ascii?Q?yDzUnZMk5oZS4oGAePha+nPyPgZVYp5LYISAOyp43jgqvwRCD7WuXePBZHJ6?=
 =?us-ascii?Q?AV4KzgF1RNozylHLn7qljv+sMFhhUthvfIbzlt+Ztr5BtISnzDwmBpzawIAs?=
 =?us-ascii?Q?qYMqbEDR7OmaYAdm/AE6FvheknA3qiBvyF4tDCZ+VoL1Dlng+tLznOPg0TzP?=
 =?us-ascii?Q?bqdl42wqpbHH0TafzCHUUyYJATtg32Z9mli8Oz3xDzR4P9jCMfyGjiUVpHSq?=
 =?us-ascii?Q?vbp6QVEMONvecNIJXNhlqZgrrizVH5UBsueyWLo6RTrT2pPG3EODi9mxaYuA?=
 =?us-ascii?Q?HQtBDsrsKVEz7iXjMoOe4QqzJDjMxhIpxiOc/DJ1F7MX1o94cBpbfgXcQ86R?=
 =?us-ascii?Q?2yw18fLnj5Uw/O4EtIwPc6IqJZyjr0U4yha7BYqgCShSLYo1Y7cQ/cGU0wnC?=
 =?us-ascii?Q?yE/xRjsMDAvXHaaFGC6t16Lho12jimMvAqjsid9ZvBQTMoppSo5gurcCdSE9?=
 =?us-ascii?Q?Z4eazfeuogxZFdYukapA7biWqReRD7x58sb+nu/YMsfZKFGZec2SF2qJxr1Z?=
 =?us-ascii?Q?3UJAOYOLb0JNZUd1W2u3N5gHcTdSD8EaYQi6wYIZx346jJKEzpZnAs5NC8D1?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c2823407-f40a-40b2-8ef3-08dbdedb2a7b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 15:15:09.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkWqKIBBXkLJi3zYvJaW4s51wLcKTOEtA0beA3zGJOXnRnnXWtUiJCOpG/oaxYFTrmxulbE+u6WUguu94HZKEpAr5hgHIs+RXmq4Eb5ZwK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5922
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190227

On 06/11/2023 15.49, Bruce Ashfield wrote:
> On Mon, Nov 6, 2023 at 9:22=E2=80=AFAM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>>
>> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>>
>> Building for an arm64 target, e.g. qemuarm64 or a raspberrypi3,
>> without "python" in PACKAGECONFIG, results in
>>
>> | Makefile.config:892: *** ERROR: No python interpreter needed for jeven=
ts generation. Install python or build with NO_JEVENTS=3D1..  Stop.
>>
>> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>> ---
>>  meta/recipes-kernel/perf/perf.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf=
/perf.bb
>> index a392166e73..37b53ee7df 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -28,6 +28,7 @@ PACKAGECONFIG[audit] =3D ",NO_LIBAUDIT=3D1,audit"
>>  PACKAGECONFIG[manpages] =3D ",,xmlto-native asciidoc-native"
>>  PACKAGECONFIG[cap] =3D ",,libcap"
>>  PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent"
>> +PACKAGECONFIG[jevents] =3D ",NO_JEVENTS=3D1,python3-native"
>=20
> Since we already have a python packageconfig and it takes care of
> the dependencies that we need, we shouldn't be repeating the python3-nati=
ve
> in this one. We'll end up having to maintain that dependency in
> two locations.
>=20
> i.e. we don't have python3-native as a dependency of our main python
> packageconfig .. is that an error (the python packageconfig) or should
> this be depending on python3 python3-setuptools-native, just like the
> python one ?

The two are as I understand it entirely unrelated. The existing python
knob controls whether some stuff that requires python at runtime is
built/installed (and that build may of course itself require some native
python, in this case in the guise of setuptools-native).

The jevents stuff is purely about generating some tables [as a .c file]
at build time, and that requires native python, but does not impose a
dependency on python on target.

> Since there's no way to make packageconfig 'a' depend on
> packageconfig 'b' that I know of (RP will correct me if I'm missing
> or forgetting something here), we could always add a test on the
> final PACKAGECONFIG and error/warn if jevents was enabled and
> python wasn't.

I don't think it's correct to force jevents pc to include python pc, as
the latter will make the perf binary pull in the whole python
interpreter etc.

If feature A depends on foo-native and foo and bar, and feature B
requires foo-native, I don't see why one should be forced to enable
feature A in order to get B. [Conversely, even if the dependencies of
feature A today happen to be a superset of those of feature B, I don't
think selecting feature A should automatically imply feature B.]

> It is always a bit annoying that perf turns these on, and we have
> to explicitly opt-out .. but that is out of our control :)

Indeed.

Rasmus


