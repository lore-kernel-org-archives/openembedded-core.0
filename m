Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C610CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:26:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.46])
 by mx.groups.io with SMTP id smtpd.web11.50589.1727688388739857150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=PkI8OwnY;
 spf=pass (domain: cherry.de, ip: 52.101.65.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrAen+nDSFJa7Nqlrkt06LHlb6ZmEesf0QQvUffVfnGr0sBiJkB/tdHeLJAgtC4HfbwSVeJ1yUA3LowsanASyWFEO6HjQ7HStvi6Cab4In3c8etfzgsdGD8eZb6YPbaJNdHdnVfmXgeI/yL8Sx9L32OgAfd1hCAUVWgf/4aLNTTbE9QuvQZ8Se0LldAAG82ZJzhmGzcMmOe2315p7NBpKGs0IzLbY2eUQMTl+hKqzS5NA40jNXbEZSvgmk6u+FjV6pyRKxTEu2uudJtZUcku0aRQHaaYmCptMqmiTWw0OZl9lV/UdeRc1np/2DB9ix9awZn/b/b0Itbj91B+JwUiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbmWdBunNZXxzBxyFEZAmSuZ1szNURoOsEYE/MHK6cY=;
 b=FsY21xUgSH70zOJbb1H0c3DhYv3lqQPvHlscDDg8wbhLK8NfxOI9LsQoce1OVXmOzRqCj0HVUQI6NoA9XjGR1d/pBrHoBAmLUEmnwyIYyUDIEpGnzqt7KzEN+UZtM9oFs59IHgIe21u6SSRXqtpJMyzuEvUgC3UxwZCCvcFajoAuQk1eyFO6pYafkhqK/fgx/elL7tKvd6DoruARvLNaEjncm9Rte0mBp/z9DOiskvPqpJvbxjuf2fhgzuJDNEnzKdh0lHhmaSF0K3f9AHlMEMmsjaphSqhOTQ8MDwxN7A+9ARQ1ZcUieWCO4JlGBZ+92vvissbe5aBGhJcmmpm/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbmWdBunNZXxzBxyFEZAmSuZ1szNURoOsEYE/MHK6cY=;
 b=PkI8OwnYDhB77+UWSxj02RGDxuIwSi/lrcI4N37oSL2jaTeu1Kdf5j0ccS3eJh+sisgbZ8boeN+CT6Y8GEIbkdc1xYW7HUb1w5YzTg0gQEiiQWDMrc2RwQDJyQ60U0K1AXruAGldSQZMknMK4BYVCmo2RvuglFxw33A/U8ZFC2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM9PR04MB7570.eurprd04.prod.outlook.com (2603:10a6:20b:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:26:25 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 09:26:25 +0000
Message-ID: <1390f5e1-73b3-4f2b-92ce-004a597b35ea@cherry.de>
Date: Mon, 30 Sep 2024 11:26:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
To: ross.burton@arm.com, "jdmason@kudzu.us" <jdmason@kudzu.us>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240920184135.789227-1-jdmason@kudzu.us>
 <984F8D25-7B5A-4071-B020-FBF267575ACC@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <984F8D25-7B5A-4071-B020-FBF267575ACC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::7) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM9PR04MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 621e4231-a4eb-4022-4272-08dce131f49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3iRFcyXZYnerp8+XMC2QUpcAeijLcFdhOLGv13/b8bZSuGWFTW3ST06vnC3v?=
 =?us-ascii?Q?TCmOlZOgkZkx4N03eBjYP4yxKDg4zcDqL3nrb3pu3q8jz0skjlyT5+f2F6Sd?=
 =?us-ascii?Q?gsZ5NiBZTbWlWZok1UwraHyvFN5OgfBGyOq9huBG2/eWL6cUZCvYlsU540J3?=
 =?us-ascii?Q?Rg1JRr127oYX+U5tqAYxU0eUa1QJy8tOBP2HWJa8BLZ3Y97mWe8ZU3z2moTh?=
 =?us-ascii?Q?cd8eQyBRv0WGsLgS61CE1k8mWZaGyI1fZT7ZTt5ixNKrGwnWnP5WfDF8kRKL?=
 =?us-ascii?Q?/qRPkvT2D13JX+dhM3s/I7Tit007QmoZh9j/WHqDeDGbp68ode8FZl69qMUN?=
 =?us-ascii?Q?P3wofUHOwRAbBNJ/L06A2aDsB4VYzKsR4a4Q54GIcqMfRwmvyTH4hxJpG0SA?=
 =?us-ascii?Q?BbEz5GvyPjQvLPrc3tUtrKYy4IqDH552YCYTzCLousiVmDfPIqSKPknCwFjL?=
 =?us-ascii?Q?O+Z7hN99BGm+L5DbRxI7rBF1rbhdLMAc2mhis3zQF6d9pMH3KUzAHzbR8CSg?=
 =?us-ascii?Q?9juPhLQMkJBjpZKKiTp65MG5yNh8h9oFSFTUiJvvoOBZUiqngWjSZqrzUsnb?=
 =?us-ascii?Q?cT+KyUuaHqXzuQvY6RPbNUY58UwQ3Rob+3rNFrwyqSglU+TCiKkEnrWNeko/?=
 =?us-ascii?Q?F4NFEYPMGZjDIyO2FmHKYbkODXW4UCrEB4eRiDIPl/lrwGV/pswQlbx/jrNn?=
 =?us-ascii?Q?K+lE3/CS0pKJeJV8krC+eExm8moFw7v+3BofWyXMpGj09Eq24Y3hk8196vo1?=
 =?us-ascii?Q?nKj9TTyEZKsnHY42NxMPVZHWMd1pGVsbv6mE4DghRwjyNr1tM8y19ReHpaF6?=
 =?us-ascii?Q?qNs4V1Aj8KN92XWW/I5DIii6e1MWOFP0K5fzRc7Z0qBe1aHsvfZprTDK/FuZ?=
 =?us-ascii?Q?JWo0xkU1D7SereA1OG81cILwe4YDZM5Tqav2V81IWU05MKaL/zIJC/6YeZ9Y?=
 =?us-ascii?Q?SADHHRsKlw2dzbFP7kRuVvyGC7mcboKMTfHfLcVApd30rARZYHuIIpB8BmeL?=
 =?us-ascii?Q?a6gj/fF6qWc/E8UDS1UAK8YsIHikkObJqx1mOgh+bgskb5XHt06UOMlGDoZk?=
 =?us-ascii?Q?FjJzvnhnCyWcsc1aM9cGajn3dDSA3mip3JfPMdkTBOJ0c+dFfpMuQ62Bzvkr?=
 =?us-ascii?Q?WXlSpgeawoNKQB2nsDLILh7ZfrcJB41Hawo3FrIZrpXNBMHL8rAZq3Cc5RBo?=
 =?us-ascii?Q?lGaHi+ov4rLr5HZPb8PAlSbNf9tdmhn+Z/+OoU/9sbxsZZqvgp+azkbutTQf?=
 =?us-ascii?Q?4S/nb5JYO1PEo/2YKRTp52WgP1IQxxYx5sxmgEbxmQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?53F7fIoKOoKkwzBiCnZV+rsL4lKfN1O2Z9YBP06peaj+mu6VMvMINLzEwkEV?=
 =?us-ascii?Q?/L2ldzZQ36urhTnAKpr8+o7mHA0VXj5KIEmsFeUHEU8xy988197VM+j6G1D1?=
 =?us-ascii?Q?pbv8rHgPxmF06bl9ei6msH66Qqhak0znK+6fygwoaerTHWjzx48fw09efqXO?=
 =?us-ascii?Q?T15oUYoUEGf0Z365us1+2yjBme49ZiwajwNB1UcwoARZPkmiZ32s4Keg2Kth?=
 =?us-ascii?Q?pfJDLc9J+66sRuI/tTSeo2Ut35fkRvW3aecj9Uqz4gcqKu98oRKrEYMGtJTC?=
 =?us-ascii?Q?ULoxPankTuY/xaeMQMGMYFKmyUn7xTEoq2BNgkb7LFjxm64XMw0zIKybUgnW?=
 =?us-ascii?Q?REYi8FjsYKn35pRYJRaT8VedFl13tLw6pUpVQH7JPU3rJGzhZQvwbx0PAex5?=
 =?us-ascii?Q?PovUQDlJJLWMTJvJ6/HOGzC+B5DyEFEDUMN+NW570hPukdyRZcWL9s4AneIl?=
 =?us-ascii?Q?5f/xmw8pzk9uwbyOESiUnSC6wLf6+meMiQFgEAOyFPz+9fpIejvgggTd8sra?=
 =?us-ascii?Q?8//ecHG7/4tBt1EM70JFmNF/q5Yu8ctC6akyPP5Q3QS4RBqmTYobx7CNQh/p?=
 =?us-ascii?Q?4Nqj8X4SnSrZkHMM0DYBNVJHnI44KqA5SyH4NJ1b5GLSPIiQNQU/my99rCqt?=
 =?us-ascii?Q?YEHBAnbVmVQECRyVjdV+11VLB0Dz79bEIbyc92Z3x00dNIclfwzqQ/KqoML/?=
 =?us-ascii?Q?DeLj05hPGawUIJ2CDD0aBzvrc1ZMo9tSL58KIwy7OgsrSZYCw3Gyuwz1dwSV?=
 =?us-ascii?Q?iiMC7lB/B7pKMf9L+LIXDuX0l7npHn1xJ9b5xtHFVHBubfOVVPkWguJerHnw?=
 =?us-ascii?Q?QyVi3JHWED0EUa2dDYSO7de2RjHeiQNd6Y0oi+d/3rcSnUHqenJJLzMeptS5?=
 =?us-ascii?Q?QZhUsTxa1XjOfiqB/nemvhkHhZGyKoCQIPPt+O3J/uB7EhxCgfrM0bLhU0vR?=
 =?us-ascii?Q?8zK6L+9yxFFLhKNycY4/Cu227C2IFGUErEzu0zx8WB3aQYesvdzVIICuufD6?=
 =?us-ascii?Q?E4rGw4hX0XunhMm7IxO1iX1StyU+iF6MtGOroJO+61zB8I/pCm7Ji9xdZQ72?=
 =?us-ascii?Q?N7hZcXbOQhoclX6NxSHHB0GpEOaQZyfO5Y1IQauKMHudnfFx8PRO3KZxhlLM?=
 =?us-ascii?Q?J6EOZIwRDhyZDOU8njEaM2amq/Nuk6DneixumJoXA8lG4+pGKT1b3AYWT0b7?=
 =?us-ascii?Q?9PqIsg/k03vb0ttbW1mMXR04qw3LKz9Kvrt23EzkH0o0ei49JRM2fEFkfJsq?=
 =?us-ascii?Q?Q7qGPL/vcjwuqpvd8TrtVJRZ+vG5h7I8jhciVC+M27uGl/aZNbeFff90o2O8?=
 =?us-ascii?Q?O8Yff5t0ECbaXL3NVC3sH/IUCu2Fuf72ZaWBlO3JguAHEjTaIi1yQBsRPt4b?=
 =?us-ascii?Q?tA/aug/aQ2BxyiXzHOGdT9sKIXg1pKW5gzxKaLt6L7kX1jiJog9+yiRDOBIY?=
 =?us-ascii?Q?tbt7mgIOt10SnpeGuadF3R1EJgfCDai9dOjQxnav0/5Z5jJ5E5DZZzUvTTgY?=
 =?us-ascii?Q?tn3LfHsVel6zqwAysQ3DplCElbbsVUVjfofTLIgCNITPJVR4fUY5FPsRHJHi?=
 =?us-ascii?Q?kp5hkBcMgTFiVeHFt++59Z4xsijh2ThiOGBxC9fEH1YqMRPE/FHbLy9iwS1Q?=
 =?us-ascii?Q?PQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 621e4231-a4eb-4022-4272-08dce131f49e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:26:25.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRzlkI488lb9H9a4T16yVvwo2hK20NMpUPC8JPFpFThJ0SQeiTh8vwkxv95NV57QsKVOraeWdcYgDfSiOmHHXP0iHnocwzkw9FzVQjyMDCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7570
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205106

Hi Ross,

On 9/24/24 1:35 PM, Ross Burton via lists.openembedded.org wrote:
>=20
>=20
>> On 20 Sep 2024, at 19:41, Jon Mason via lists.openembedded.org <jdmason=
=3Dkudzu.us@lists.openembedded.org> wrote:
>>
>> --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
>> +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
>> @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --la=
bel platform --align 1024
>>
>> part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
>>
>> -bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 con=
sole=3DttyS0,115200 console=3Dtty0"
>> +bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 con=
sole=3D${KERNEL_CONSOLE} console=3Dtty0=E2=80=9D
>=20
> My understanding was the .wks files had to be .wks.in for variable expans=
ion to happen.  Can you confirm that this is actually just an idiom and the=
 expansions happen always?
>=20

meta-rockchip also does variable expansion for wic and only has=20
rockchip.wks (and not wks.in), so that's one more that works with this=20
(though if that is a missed corner case that we aren't supposed to=20
support is another question).

Cheers,
Quentin

