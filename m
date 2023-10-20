Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23208CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 10:03:57 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.111])
 by mx.groups.io with SMTP id smtpd.web11.51013.1697796228167267319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 03:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=HD3b0+22;
 spf=pass (domain: prevas.dk, ip: 40.107.104.111, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZubdfOw/qUpk0Nt/bUX7vqjH4F5ect5XPmKuxxbmc1DgjbDvefzVKyniRt96j+ray34IAxJiQABvfK+SuaY9Bq9FvgEi1beJP+s44qkao3+/YxiZ4RDbuPooZtlWIH8LGU05onCfwhQ+vRfnSxBQOL8v7NPTLhWlEvTOC+3J81CCLOX4IkVm25ALx4hAayijtQiiwciZW35FE84hD04ORCN9xQEy8pKvbbBcQaUgHlDVv8t4s2/wEHkH12g7UcB1NlAkj2G4KGVQbF/7/O8WSDTCMxPJvPpgSuQt+qOoj5AOR3sfi1pJjIbMZTlU+4Nq480WsnxQIyBjWP/I4ls3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62QNDx0YjW7nL0ekDthHgJIhAIwHHGzyfIinCp+w1As=;
 b=BashsUkS48TB32J6Uw37JgJ2EWlaG9kdL00fkUYYa+eub4vW2sf/x42k6bwumwAX43ncNpb/5lxl3dWhLQQX7uta+zjR8dR2kyBk7RPDiWqHqkSENw9h/88O3r3HebyxSN3eMbazVC88ZgHDAALYK/sGbeIOXoTveRj+XDlmC0QxQOZRCDfVNrUgVGgqmpahhFuPTVnXZmNci981IOop8bIvQYosa959C6o6XZo3QoOqasYnbp+IjotiPaAB6c1l0eEApk2vvccDXGGcfVlKjuiG95go5IB+bhUodll1jTP32ZEl65FRGlRZAilbvsLFE7RSUdXfuJw9JVPhlpwR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62QNDx0YjW7nL0ekDthHgJIhAIwHHGzyfIinCp+w1As=;
 b=HD3b0+22GO88ndLfI1pXKgsFsA9LHKXrj+RW5R9FmvGBpjbRQ1r7R5txiU6m6fL+UKQOehvtk3U3W6Zq707/uWVQHtj5e4NJIG+j/yvauj3ocF7qiDhxr2+DuT6gcHC+zL1N/1TeWH+ft7fAk+2o/Dd+SP+oWpQTgW2Va8Ygd4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS2PR10MB7346.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:606::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 10:03:44 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 10:03:44 +0000
Message-ID: <ed261cdd-e97f-446a-97ee-f19e16d54aa2@prevas.dk>
Date: Fri, 20 Oct 2023 12:03:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of
 security_flags.inc
Content-Language: en-US, da
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
 <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk>
 <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::16) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS2PR10MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae4c96b-30de-4b5e-8366-08dbd153d800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hcYXIK4DR3lMFM1JneZa6uCsfOBNis2/Kt8KQbEgQRcFcuN5auEAWXN8C6cfGAFUR0PbeMXnHnZMhAzObcTRwq+2Kbv5FxxWQpdOGhHFfk2gLfpaLD84zv7eVJ+A7jAPrsk4oLKebXxERJHeuweXnpi8NMbxov78Z1cCWIdnTErpTQ+blWyPICLzgXb28q0ZKzWclQMFPHnZGMP4qtCGu+z4Llt4lEcOL0o39Rlnk61nQvfuhGeLUjyCp3CXJ/w84fzSzq0nxKd7r3+tSQxo2APpImdE5eG/4OBDn2voISeLzh0oK07S6++gBikCxoVuhRTBkehLojuEPvjmEMsG12MFzCiHN32zo6zHBbQnCNCnHXUbKiwqEp+njXmKun2eRM6B1TCjM/VHqnbCHA97z0i9xXVpON4ghXzmz4EeWMWHdMnITqfrKOXAVKnEPokYmwnHQxVNxID2EotBVMDyoHZlBagPDcSuXf+ycCjbpuZKq766FukFkveQt8oKK+pKvTyIT23piRP+eBG4THnp0bIq9E/2mWd62J2NOEJyFZ39erT14El8V/uRYVQQfmB9B25+sjFpZVcdOV9qm6tbPxzDTZSV9IxZBsvpeCX2/QgYspDdxzYB5JlS95mBk+rolL1tFZnTYDJVBQ16IebVcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39850400004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6506007)(38100700002)(2616005)(26005)(41300700001)(8676002)(2906002)(15650500001)(44832011)(4001150100001)(66946007)(6512007)(6486002)(8936002)(66556008)(8976002)(316002)(6666004)(4326008)(66476007)(5660300002)(36756003)(83380400001)(478600001)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bgm5us/HpgugCPM2bdfIBK0H7D1JEyGpOn42MKueKJsW4+wXAwVUYeveHz0p?=
 =?us-ascii?Q?+fDwvL1ILLSioNtzAKWWcJtn20bKbzkRNN9HIsmDbcOKzM/zQZCbpJh5auUZ?=
 =?us-ascii?Q?h3XJYazGp/js/2s8qeYQgTipENF09sAkdqJm9U8IKiOewcOItvXyKyb59FWo?=
 =?us-ascii?Q?kQu56NZe28MwT4M2KOdqMeLSrKe+ABFCVnCUybIuDtS63jNz7VJavlBM1eQZ?=
 =?us-ascii?Q?W8IU21kSWLHdxmzgekwl3ekkW7t44OfJihScNvo5qI5obyzl+RqUddmU0pYf?=
 =?us-ascii?Q?UXoZEROQ5204bTlStgdEPg3aio4mlL0CH9eUTFKbu/8L+vJkB1G+ZscQiaFu?=
 =?us-ascii?Q?kedY3DSL+TB6GUVH7KmqofVUzyhJDgKuc/oJAcmU+vKqgSecRplaAEodMPpS?=
 =?us-ascii?Q?fsXeewI2hch3YoiQngDNBp7Rvo1N1BfQkXurE/ncArEe0GmXMINMg331NTmR?=
 =?us-ascii?Q?moHdwLhY3NEuNRTej+I6WA7hr4O9pLCGiRYVIBRm4J/xkSRYZfBcC/JgIlKF?=
 =?us-ascii?Q?e+rAHLAoTuYKpuwvRnhrcy4VqTd7bLgUVX0WZqOGqmFONydt43xS9mYXZLGm?=
 =?us-ascii?Q?7QuPJvvZuFvSQDT5zPJeW8n7dfejZIeWcd7g6lrdFeLrNUYBL/3xybO6SugF?=
 =?us-ascii?Q?pk7vWlG+dqJG5nro40XE1IUuS5cFg+xHVIqbvrnR+YLuCJmP0crTiAcu9G9X?=
 =?us-ascii?Q?YwuT61Jxfrq4Nbv2E+ITliRvxEsPUbIIbuvVlHuQbyuLm84U+IB6i9mLIqWJ?=
 =?us-ascii?Q?+nRq7rqRat/xIo7oJrxZMFWPGB+sJiRflrz3tKEEcwLSmWLKnH9waR34eo2L?=
 =?us-ascii?Q?FUK2/3VlWXYd0fPJAWSGPH95AhJwrgNhWL3eoKZvIjaCN+JkJfQa93m83/pq?=
 =?us-ascii?Q?lU317TYbVT2nj0PlO14p4x7CE10cVy4BhMxrALeXdZAwO01JnzgRgxubTgEg?=
 =?us-ascii?Q?+/65ahONNK+6Ub3Nlk99Z/h3Ki/2bDUb7b9G3oYJ99+IX5+kvtdsTIgCZr6R?=
 =?us-ascii?Q?IZQozPALdCkrEtZienzU9eQf6pNCMFPFsxOEI4AnHCcsW5RXmL+KUQNBnvdK?=
 =?us-ascii?Q?uv1PXxHPQ+BCLeNB7ksJczgHfN8kh6ILPZUBmD/G9XSWCc/BLIMdlpg59Cb9?=
 =?us-ascii?Q?btS7JpL/ZHspxrYerQYw4ZUXuQ7Er+tLyFxEPpsi5X6rgLbcETKyoGZBKvQP?=
 =?us-ascii?Q?opxxlH4HYd/WbG8y7PD5EmAVXLFUQizH0Bbz5TVxZ2OLWyLqw6xE0OWoGEug?=
 =?us-ascii?Q?zL/JrTxq8U3dR8h9Jfk/+Tm+cHUBV3/3fAFqbCEeML0UWV/inWU0126GRvjm?=
 =?us-ascii?Q?grUNozAp8vYBAY8dRl2KU7j24do9EI8oYeCc5uAjgXBCvHflsmQzJ25QKTeX?=
 =?us-ascii?Q?Kg8OptT14lwgTBhONZWdzAg2IEz7HXlMdv/2qvfGcXg9MwT4r0i1YORpTd6N?=
 =?us-ascii?Q?3jP+buOdd13r+5MyonrueWH9GzuqVh0+Z5KXRhvg2BtBH3spsK7aIxSTy7QG?=
 =?us-ascii?Q?3ETd64n2n+1alm/PszLhnVyDPNyNV6baIrxBblYL0piRhXipUj2h2z/dvV2z?=
 =?us-ascii?Q?6wNFMi4QcqQxniEaxoQ0pbLP03unYsq9Qqq0WgoX8G/1asBIyacDj78cQ6Uc?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae4c96b-30de-4b5e-8366-08dbd153d800
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 10:03:44.1285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3ShdEA9u5uCFqIpOBRwdRgS/EK+erKrq3ssoXLkG4QFZPJSZc2bz3GsEIUnoMvxDnDVsIbuqGQ6ftEdQXngNa7eRIFFI6FF8B0qs4mej+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7346
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189513

On 20/10/2023 11.38, Richard Purdie wrote:
> On Fri, 2023-10-20 at 10:10 +0200, Rasmus Villemoes wrote:
>> On 19/10/2023 14.48, Richard Purdie wrote:

>>> The fact this works suggests perf is ignoring TARGET_CFLAGS. Is there
>>> anything in the perf build system where we should be passing in cflags
>>> we really want used?
>>
>> Well, IIUC, the normal way TARGET_CFLAGS would take effect is via the
>> 'export CFLAGS =3D "${TARGET_CFLAGS}'. But in the perf recipe, both
>> do_compile and do_install start with
>>
>>         # Linux kernel build system is expected to do the right thing
>>         unset CFLAGS
>>
>> And perf's build system does indeed add lots of flags of its own, at
>> least for most TUs, but nowhere is any -f(macro/debug/file)-prefix being
>> set.
>>
>> So I do think that TARGET_CC_ARCH is the best place for flags that we
>> really want used. At least as an initial step, because this is known to
>> work when using the security_flags.inc file. Maybe there's some cleaner
>> way where we don't unset CFLAGS, but that could be a giant can of worms.
>>
>> And yes, a comment should be added. Is something like
>>
>> # Perf's build system adds its own optimization flags for most TUs,
>> # overriding the flags included here. But for some, perf does not add
>> # any -O option, so ensure the distro's chosen optimization gets used
>> # for those. Since ${SELECTED_OPTIMIZATION} always includes
>> # ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
>> # ensures perf is built with appropriate -f*-prefix-map options,
>> # avoiding the 'buildpaths' QA warning.
>>
>> too verbose?
>=20
> If it were me I'd probably write:
>=20
> # The perf makefile has "unset CFLAGS" as "Linux kernel build system is
> # expected to do the right thing".=20

It's not the perf makefile, it's right there in our recipe itself. I
don't think upstream perf is to blame.

> It doesn't and we need our prefix=C2=A0
> # map options=20

Yes.

> and security flags amongst other things so force our=C2=A0
> # cflags in.

This has nothing to do with the security flags. That file still contains

TARGET_CC_ARCH:append:class-target =3D " ${SECURITY_CFLAGS}"

and TARGET_CC_ARCH is included in the CC value we pass to perf's make,
with or without this patch. So if the distro includes
security_flags.inc, perf gets built with those flags as expected.

But when that file is _not_ included, we do miss the prefix-map flags,
which should be passed regardless of any security distro settings. I
think the line I'm moving out of security_flags.inc have never really
had any business being there in the first place, regardless of whether
adding ${SELECTED_OPTIMIZATION} to TARGET_CC_ARCH is the most
appropriate method to get those prefix-map options passed. But since
that's how the poky distro has achieved that until now, it seems to be
the least invasive and least risky fix for distros that don't use
security_flags.inc.

Rasmus


