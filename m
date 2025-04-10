Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E636FC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:29:00 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.89])
 by mx.groups.io with SMTP id smtpd.web10.34138.1744291731374843639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=FKAf0sH1;
 spf=pass (domain: oss.nxp.com, ip: 40.107.103.89, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmLVbTeKnymsX4ZW4+EIcCPvgpFN5b/SrBcFEHlZVMEz0YIT7vPp/QUQuu/L87rXF4BheutOx61ON8xdmsEy492NcCZoN8XhLHOa0+6WJ2/C9OgTaACok8NmbiK9h01+4UvubEF+ZFwNrU8Q15K5P/jRj+SgiJH2XE+iTD9Mcqwt+n1tecBjwFI1AfphdjHTuskkanJeQyd7mZLtHbv3Y7ZgWYHbrnS+blfgqmo9w7NktqiObTw+V7nJaUJ1LZsGpdkM+ExM0T4vozjznwZs+X9oASJj08bdJQkB9vlW5PoLUhHYCU/RuvywjXgGYMpqsBaESZ9yEpoBwcFb4WAE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=272uf5VT7pdOwPdJEomWmFBetOrGzQ3qKsgCdYgt/BU=;
 b=IDgwyNueHZDYGzhbu7ns+usYg54N6IHcdjXbcZN9OvZFS2eoK9t1Yyr7VBGqwUxsOgZUug8t8r8i9U3XVkj7hRAwe5+qir/7XZXSm8S/QiJ1Zc47VrhT3lJpWOkjfKZslQX3cdihvvng+Qnbg3I4PtnS8EdtnAo4/C5USQbSRJC0L4t4qaSRRmN5OmTvBmlDPeFCdJ5gGDV6jmfgx47hKwHttz9f8Oqlr1ZJs3atNsGFXu1JMeqwnFX5s4PGS3IVDhpfVVn+nvqBQJQpWVk9u1zEhVP1/Hn6tIexm4qq/QiuVWTWhbLCKe3JXmvlZzU67YL9o9IxcLDTe4+iAD4JJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=272uf5VT7pdOwPdJEomWmFBetOrGzQ3qKsgCdYgt/BU=;
 b=FKAf0sH1yfCBWDNXAJkvx2lih8YSWaduulGV+OUBTpx9tgPC2loSQiogHejSopYO5PPFRPlXDylyrfUgkaxtTWhNxNBh/p9XmXjiUN7vJQDl98ChTnIOWX918AeLurphbO9hrg/7RkVw1yZNMrQEBgcpg/9ETd9rTKUEdyu2oND//JOB5MfHo4wfeF7/lez2Wt5JkytR6A+bWtuFTiGKAMNrVqHGQ284cRO+7mS7p0QNBQjHgM9YLuJXOFn9YqhOM1L4l2392iB++wtpfkbEsZIPiyUIV9vvMyic9AeAwCp6X6EAHprkc46BQ7KIa1KRfBF651erVW90qQ3BsSks0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8561.eurprd04.prod.outlook.com (2603:10a6:20b:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 13:28:45 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 13:28:45 +0000
Message-ID: <3070510f-a5d7-473c-9c45-101bc4d70a60@oss.nxp.com>
Date: Thu, 10 Apr 2025 08:28:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to validate
 host/build target assignments
To: openembedded-core@lists.openembedded.org
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
 <183460753CA35884.31078@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <183460753CA35884.31078@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 492ae413-1137-4d9b-dfa3-08dd78339e54
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2OtgTywQ6F5rlCZMIjKBxvM5pThgQglkwQG+surd8jxzsewzoZh289tu3N6e?=
 =?us-ascii?Q?+04sKv7h8u8Ts8F8jeDX35muXo22b0JEJb/eCeX+reEuVdevOt2ir2vqCrHO?=
 =?us-ascii?Q?VlYOl6fsaXnAauohra4AMjAap9FMoe7S5SsmhZ2yGjkbc7On9KpldeGUvVyn?=
 =?us-ascii?Q?a7js7URGkjYiHHZhUG3RRhN7wdh72usU0u5BuYwW9j3lx9/dD3zYok3t35uP?=
 =?us-ascii?Q?ZK0PARkmN/rT3Pf5TrgmmLeUHsZuEGeChgYjkEhxEHMx6yegveVKI/HpsXUK?=
 =?us-ascii?Q?ZGs9ondrwDC7gmyvXrN890cnbMMHflj3IM61HaH5fvi7blzCcsUvVrjKatEc?=
 =?us-ascii?Q?hElerc6x94he0cUWXkOpj2p4MycqXPJHCugmQuFICZ3n1jE/vAUbOM5JCehT?=
 =?us-ascii?Q?tgvOT+0Z9f7iBXAuRvQtOL8I33u9gCSdZxeO2B1OPlGDL+7OAZutXC4z6eZv?=
 =?us-ascii?Q?YnBOZ0ySDwyQZ+Jhbklnc0EcM6Dh4H3fsxwqgZ+IOJzllzA1deZlTJ9AO8bd?=
 =?us-ascii?Q?MKjshua0C/m8eRPm4ULSeJ/CqbaEi/tZY9O/IfQHnUNmDGBTOMxy2gtsRclG?=
 =?us-ascii?Q?FuRmQPruUGwE0RYH4rlA8SvgAzwbz1Zz+1I7upJ4HorQcHV95wdy81qBoJJa?=
 =?us-ascii?Q?8gdS24BH/jxBymQ7Zmi6GPYtK5FcPVhR0lW7GxA6sVtABI8UGUmq15ihwn6s?=
 =?us-ascii?Q?fp6p3JhPJUcaUpBdohnByxg48tNOksrba2qbgnxCOpiwd9LhTsjkfW/pgrSd?=
 =?us-ascii?Q?PcU1LGlc28JUN6Imq6uqLui1RcgFJ6dQBER/Zft7JCRksaOvIljrbZzWrXgR?=
 =?us-ascii?Q?DtzU36q9J/MogkWuVci+3jhioDXH+ekjAtA31q9Mm/kZpjA27jcLJJYRxXEf?=
 =?us-ascii?Q?b0X8fvFO1WPwtrIRYb5fGtpWGCOG3yCZx2oYFShpXotnTUYLwLWZIocAyJT5?=
 =?us-ascii?Q?gjaAL/kSDRyiz/tx8nOfL1TXes+KZY4vfUpxlV/nHtNF+IxVp0grmiVWCHrA?=
 =?us-ascii?Q?Sb7X2VgROUhOYqAoXOsyv7AMf8oKi+SbYgQKEIwwP02UFTi3oW7tq/UqBuRo?=
 =?us-ascii?Q?P+NaPwNwdS/c0qzPmrO7ghY9IMEGuBS4KYV+NYuQivKDWV4R7Y06tjNvdkhL?=
 =?us-ascii?Q?9KCRZg11atL84qmbuUw5KYwfmhf41E7LCSH0Yy4+iHAGh/qoU9L1bmU22fq/?=
 =?us-ascii?Q?0RtlwKVzzlrLubSKxWXyz7PJ4iMhAhSWxNQiELE5bURFWFIn5YB1CBASwg9h?=
 =?us-ascii?Q?Bu5dGiyPdWU24q3atuEgA/vqMjFxLcfF6OaOSBTlpOXvYSSe/7ZZTDfojbrO?=
 =?us-ascii?Q?96esuYwGmUPrPSnxjjQatVeS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5MnFrrOHgtJtUM3/iF3oYr7ZBoFcbheV8XlZnP44WTTGbmeLZvRaOEuYO8P5?=
 =?us-ascii?Q?fFIggabSqVNkr3qjn8EUxHvBHlIDnnqV78I95HN83OXdz5kksXaoeV7Lulma?=
 =?us-ascii?Q?KCLdv5fH9eMS0k1e4Fjs86ews/J23NBqhBW0btL0faLzuTlOKT30CiC01IhD?=
 =?us-ascii?Q?xidb7pEBBX8vPORo37t9gbG02XITgyypMsvVuDjuEETgIN6lH4gLlqUoPq3q?=
 =?us-ascii?Q?4gyFxAKC87FKpGpJRiTGr0JV8dNJ7YQMKjpmUESDfXO0vLIMQhGOqaxdUIBc?=
 =?us-ascii?Q?GxIiqUMOhTtwRGgoV7RsaWPL7JZSEdKtQx+MBjs9hpbat9V2Zqu6qUBnCOFB?=
 =?us-ascii?Q?LNg/fXVC6WPWNsWWQqYV2uBgPvPB7J0hwFkzlAoPTyj4BaiJkSKfLZstVv2d?=
 =?us-ascii?Q?oIaal6XVLnYmu3QyCMHhCroZbYQgaTE1GgQXufOG1ZDFV7ShkKxKyPOVzCoi?=
 =?us-ascii?Q?jJKzBOaVUE6z9CiRcf3zAFpw3m32aZaEWpUCmI6LX17adIPu/bi9uXm4vsOM?=
 =?us-ascii?Q?NMrySW3gBhXQ8oGpVgigDws5hMCRp5v7jkW9ZtAwt61vd7jX4dtMvFM4E7Vl?=
 =?us-ascii?Q?owSH00y3o1eNfLWqGhKtaLmL9H7blM7EQz3byuMZwbRBeGaeCx00xyJ27wyZ?=
 =?us-ascii?Q?iqBvM+xIhfGL4V78x3361z7JfhmFiK8WhI7a/UVxh86TA6WOR9b6gx+uvl/8?=
 =?us-ascii?Q?xQzIZlB2tYM2ju4nom64/LQgKGGyroFb1/9jnebAwoRJmyuVQKguCeFrM+dN?=
 =?us-ascii?Q?V1gXwxGDY6ZfKjjpmvTvDLc2aA7prJxXObFU7yUR0j8/jzmbqc1Po3slCHZ/?=
 =?us-ascii?Q?Sh4L8V30PcxsqrMYOcn5eLGNr8mbXeyPHGoi3gl0GcDDFLWWUv3Z2N/+o2BH?=
 =?us-ascii?Q?DeVu/g9vvBRvAzxBt7wT66QUdppxnSSo2402hKZmoWfYLmJLr/IKAe3Jucmw?=
 =?us-ascii?Q?dp2LAYNWh/RjiF0qGdtvMeFO9eFK3ws0Adkd9vtozpFg8W0ek9rTVI1M67Fh?=
 =?us-ascii?Q?LnW9sDXt+TRadpB9KSa+hUAR5C7ZgQXB924BJO9ksdJJ6hhE8yllT4KcYV36?=
 =?us-ascii?Q?5MUgxOnbLJ2xbL40IIl8Z7FAbngmoNyQqqnerl9x24LLW0vnn9mlb6/rvhQF?=
 =?us-ascii?Q?g5oRnuE5kX5B2EGuhhao+wF2U/e2TppbKtMefvViQEzZdrKE3sr6pZr9A4y0?=
 =?us-ascii?Q?LWY9mppFnKVXpHy6aj3xXejrTnu95R58Z+ie4Li1UIAs6hILpTK4o8ZnYZAG?=
 =?us-ascii?Q?S8KuX/wC+GQqOm6IzElnQB/dZvI7rxbMdx3uJ28ceqHlhnKJKC3zLKkUFw+Z?=
 =?us-ascii?Q?P6gX1WeUIFSW7lBiCctDeKSCThvmBpo0iYiwRjzYbxo/ajdcesBo1211+j14?=
 =?us-ascii?Q?hE34JvesC7uVZHeJMkElvbMO8NORbOLmLizp5UT6j4OMvxFgqYVrP2igs283?=
 =?us-ascii?Q?WwRvv6u7+Q7Mr7D3lzddO+nFkVxp8jxyMdDwjbWTOKYyyFsn+lw7XYJIOpzj?=
 =?us-ascii?Q?W/EJU6DK3sL2eJDzp8MXtihym0zhvT0pAUNl16xuYU5MQWD2F5nf4Gbj77Wj?=
 =?us-ascii?Q?b/hs8i1TCDRFeWWQp7cUB9R/y3LglPpQhPyfSX07wUEPZb70Uet36oS9xwQ+?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492ae413-1137-4d9b-dfa3-08dd78339e54
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:28:45.5456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXQWXlnoQ0snl1/5n+dRkdlnSHOv7vWo/sux+630FvQpp0AmWl0ElZPJ35IcwoX2N0oRPMll/fB+yl2Heer9dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214669

On 4/8/2025 10:10 AM, Tom Hochstein via lists.openembedded.org wrote:
> On 4/8/2025 8:37 AM, Mathieu Dubois-Briand wrote:
>> [You don't often get email from mathieu.dubois-briand@bootlin.com.=20
>> Learn why this is important at=20
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On Mon Apr 7, 2025 at 11:18 PM CEST, Tom Hochstein via=20
>> lists.openembedded.org wrote:
>>> From: Ross Burton <ross.burton@arm.com>
>>>
>>> Use 'meson introspect' to dump JSON describing the build configuration
>>> and validate that the build and host architectures are correctly set in
>>> the meson.cross file.
>>>
>>> Also instead of calling ninja directly, call the relevant meson=20
>>> commands.
>>>
>>> Fixes: [YOCTO #15485]
>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>>> ---
>>> =C2=A0 meta/lib/oeqa/sdk/cases/meson.py | 18 +++++++++++++-----
>>> =C2=A0 1 file changed, 13 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/sdk/cases/meson.py=20
>>> b/meta/lib/oeqa/sdk/cases/meson.py
>>> index 1edf78720a..407b94d242 100644
>>> --- a/meta/lib/oeqa/sdk/cases/meson.py
>>> +++ b/meta/lib/oeqa/sdk/cases/meson.py
>>> @@ -4,6 +4,7 @@
>>> =C2=A0 # SPDX-License-Identifier: MIT
>>> =C2=A0 #
>>>
>>> +import json
>>> =C2=A0 import os
>>> =C2=A0 import subprocess
>>> =C2=A0 import tempfile
>>> @@ -39,10 +40,17 @@ class MesonTest(OESDKTestCase):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 self.assertTrue(os.path.isdir(dirs["source"]))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 os.makedirs(dirs["build"])
>>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log=
 =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno=20
>>> -Dx11=3Dfalse {build} {source}".format(**dirs))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # C=
heck that Meson thinks we're doing a cross build and=20
>>> not a native
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.assertIn("Build type: cross build", log)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f._run("ninja -C {build} -v".format(**dirs))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f._run("DESTDIR=3D{install} ninja -C {build} -v=20
>>> install".format(**dirs))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log=
 =3D self._run("meson setup --warnlevel 1 -Degl=3Dno=20
>>> -Dglx=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # C=
heck that the host (gcc) and build (cross-gcc)=20
>>> compilers are different
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a =3D json.loads(self._run("meson introspect=20
>>> --compilers {build}".format(**dirs)))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.assertNotEqual(data["build"]["c"]["exelist"],=20
>>> data["host"]["c"]["exelist"])
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # C=
heck that the system architectures were set correctly
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a =3D json.loads(self._run("meson introspect --machines=20
>>> {build}".format(**dirs)))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.assertEqual(data["build"]["cpu"], self.td["SDK_ARCH"])
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f._run("meson compile -C {build} -v".format(**dirs))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f._run("meson install -C {build} --destdir=20
>>> {install}".format(**dirs))
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 self.check_elf(os.path.join(dirs["install"], "usr",=20
>>> "local", "lib", "libepoxy.so"))
>>
>> Hi,
>>
>> Thanks for the new version, but we have a new error now:
>>
>> Traceback (most recent call last):
>> =C2=A0=C2=A0 File=20
>> "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/meson=
.py", line 47, in test_epoxy
>> =C2=A0=C2=A0=C2=A0=C2=A0 self.assertNotEqual(data["build"]["c"]["exelist=
"],=20
>> data["host"]["c"]["exelist"])
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~=
~~~~~~~~~~~^^^^^
>> KeyError: 'c'
>=20
> Thanks, Mathieu.
>=20
> Ross, can you have a look?

An update: I thought this was working for me, but I realize now that I=20
may not be running the modified test. This is what I ended up running=20
after looking around using oe-selftest list commands, as it was the only=20
thing that looked close to an SDK meson test:

`oe-selftest -r devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_meson`

How do I run the modified test?

>=20
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/1330
>>
>> Can you have a look at this please?
>>
>> --=20
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214542): https://lists.openembedded.org/g/openembedde=
d-core/message/214542
> Mute This Topic: https://lists.openembedded.org/mt/112142020/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [to=
m.hochstein@oss.nxp.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


