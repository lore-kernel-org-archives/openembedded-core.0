Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9405EC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:27:57 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.73])
 by mx.groups.io with SMTP id smtpd.web10.712.1743092870395535345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 09:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=IvYVY24W;
 spf=pass (domain: cherry.de, ip: 40.107.247.73, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPh3Zsmgwcv1ce67aWHbdfTvMd+GCE5XYv/33XJhh7kQA7RxpAWqCo2raOztubvabYVM19J6GhXDGDR4Dl6wMjaQPppNA+pv55oZVHoa2xeSLm6DPbARYgJI0i8YScWen3siR9WxNx/zvI0UhpnU9f9UDCG/srJXPgaP7s2rvkU56NRAfVemsGpqhgea0PyN4ANXZh6noj1XDQ+TvX0K4tQeBtMqurje7mKAXgr7AadfDMvVLqM/YxDIVIlj6NaB/EaNEA//vhadcjMdsA9QTJDKEvkUOKdNU/UvAT4GVcTN1fIq+m1EVxGr+eDNcZzjooV7qzedB7uvrQQWNSCuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWBH/PPZ8izGouS1bByBCpNmruMtM/PeNixdT0zzYGA=;
 b=WiJxl5v1ZBmhTHiV6JASAY/hEHIKONKJGQRkOeGGPi0O/zdQQMN2Xet1m4ZWCH8kElf7zkgLwYcQJvNPA5dF6RQ/5WfG25T4qo9WwEU8WJEtiUZ2kdZaiExwTeQWQRXto849PvlWJpDlWNoRLY22bRpLftBMmlDZHNFQvsSLzePSLXf5bIz6MsVJsSp/b8v6oO6n+wNtCzu1Jhjaw9pttQXQDqr/K6s2rfjaEQViMrlcrFf267uDBVNUk2B+7VSJMfTXOGQ8P9/bArSd5fTbnIitMLb5yuokA72Zz/aFZV/+C3cyza5gcWCQKtKGMDNei4wNklTensuIxcGlA6K84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWBH/PPZ8izGouS1bByBCpNmruMtM/PeNixdT0zzYGA=;
 b=IvYVY24WdVfrgLujrfxGT0xEoTghEnHxvTbEhulU1N/sADICxuBw0PORok1cJK3rFBrHoQ3zTb8k48cMBq/kKAEj/UkkXy0McBwkO/9Sa9m1P7U6U7vWZqGC3qfrx3U7DxlnlWCmi+XX/Ed7n0ZoDye96zafM22hltyufg/wzQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8115.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:27:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 16:27:46 +0000
Message-ID: <5a7b5f6c-1be9-4c5d-bf2e-59e115762d6a@cherry.de>
Date: Thu, 27 Mar 2025 17:27:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [styhead][PATCH v2 00/31] linux-firmware: upgrade 20240909 ->
 20250311
To: Hiago De Franco <hiagofranco@gmail.com>, Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Hiago De Franco <hiago.franco@toradex.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
 <CAOSpxdZR3JA-h_4ujbOzDK2YaX=9pBztTp-O3R111JE6DYK77Q@mail.gmail.com>
 <20250327161904.hjqfngvg4irhrk7e@hiago-nb>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250327161904.hjqfngvg4irhrk7e@hiago-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e32081-e3d3-40ba-b1e4-08dd6d4c4e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KDdG1XL4Dm4MY/kLmB8mQLOKpAi9m0CvVP1jSoxO7rBu6Frxc5I+xiNWyVqP?=
 =?us-ascii?Q?qgt4PMEcBOJdf8lT0KI/59Ss02Yuwu/BMbF4arSfgUQfnh1QzE9DHmlTzDyi?=
 =?us-ascii?Q?aHwWLJ3qvLhthRC5h1xkpWiX0NM6/Kjug0ooi6MMm9LxuZ4dmvkAlqr4/GBv?=
 =?us-ascii?Q?PkFz9zoHJgObAaLLJ1asVaxCDGYBmMhpSnYxWikvC/Tp6UCzyqLg4RgvLkK/?=
 =?us-ascii?Q?U+aKItFh/HqeS8f0IyxhwAqEFUDehZApDUL33GeWdIaDv60pQwvegQh4i0fG?=
 =?us-ascii?Q?Am28YWfb4tu3lMrANQYAsm+KWkrmL9nfB9Kn1B+AsRVmkmxODvNVV/Aw3lpI?=
 =?us-ascii?Q?IRpbcDkvAccEisffHmv4PyVoNkr+OI7Q1chghO+bEZ7XegBJzFJr812YPsGd?=
 =?us-ascii?Q?1w5B0W0vUz+JUUnrBMiNcDTFP+KRxAu1CZ7R2fbTvDtXyOG9X3jtw1oIiKI0?=
 =?us-ascii?Q?pRisUvWM4VtZTplz1yftz0kcf0HioBvgeFoiKzv3E6KBbA/H89vfJXaTHa4J?=
 =?us-ascii?Q?Ly/L7dcCYFsalbOSNXnfjNT/ZMhOUr/pfqZZdXgwXKl26HnKqX9J9cJTaCxq?=
 =?us-ascii?Q?BhrMRZbm5pnLHiap+XFJjctYXr1BfSeEvcN9MM7liXhIbaxf+lxPVXFQpzTo?=
 =?us-ascii?Q?B7g4NsYQNShpbNvNGNXCQ+KKdbD1J8qa5UXQ2//3zFNg2FX3RG0ldRJPIgr0?=
 =?us-ascii?Q?jKcv2NeUJLovyKD/Gpic9zmTmVVG4jkSSrcSz3wNs2QeHWx9MvEmwDmPBmBy?=
 =?us-ascii?Q?aeYwPAn6Rb+ooMA5AA8X+PxuJtAtNkvWI2B4EPY4Y0Y+IsLEYQ9sj+EcGpc+?=
 =?us-ascii?Q?uWJAgnj5EQu1iYJy4mbFJ2aeNdwBQSOhNGGTUxtHNvAFK+hdk+Mzmm1W4eNA?=
 =?us-ascii?Q?06d1OvEi+oxMjplrscSmOLzLntw8qcZMhgeIWkfOGmmfzl1GE/z+mLdbgW2b?=
 =?us-ascii?Q?ry6mW2Y2jOfO5vbI4rKs96rJGnRaLuJoFHMj1b0tM5qS8WHpl6lZRmt85gvy?=
 =?us-ascii?Q?JZnG4POx+HrQaoIZJzpabhDX7lbC1ANB/ECzwtM0BXHs573GdhO6LDeuxGDl?=
 =?us-ascii?Q?vJm3psnE5kluH3f4WNqPzQJlegfveqBXHeYDCkKGMQl0ImGew/VMwwUGWWUb?=
 =?us-ascii?Q?eKeuy2w8q9kOCruZF8BeS/yY6Dts3kxL1nJJoKxXJxMwKpUnbxFcuAqQ87cW?=
 =?us-ascii?Q?seDwzTHgysnnpk/Aa8m8yvUYGsXJFFXJeupfem/ZftNggXoYaoBFS9/HWIcp?=
 =?us-ascii?Q?UH4SSg+4t9f8CjvFGgGFM+3Y4yW404O7vq7P1rH1PDopVmYg3qRTtDOCM0u2?=
 =?us-ascii?Q?W9kYpevh44npPWgNVdPwatvosIJTYpeZKPXfMnb8mTDEiQeIjdtoj7+r+RN5?=
 =?us-ascii?Q?OlAUcB91ZE/xotZdr7T7lrz/vNLJwnEdMzG16jkGanm4YwXCNNXKDqzPl1f3?=
 =?us-ascii?Q?KawbU6PLojM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jxk+qkKpaw9TeVO5f7kSUZT36vYGCwkXTIMM3IBdinDUDoqyxp26DDQB/Nqo?=
 =?us-ascii?Q?lCAm8BkPUc0pA4orJIev/u+YtfcdrjSjb83OvsV42DusXs6p2To/j49dUAqu?=
 =?us-ascii?Q?Fm0U5H56sE+KfhGx+QegTsLb91loa6pp9YDSbUiED2TCXxJ8gm1EaOr+w953?=
 =?us-ascii?Q?q8XfFcaXyq7zMVXaFd2JHc3fH3JEYmyJrWx9RJEU63JXsUjdbKtf/xHB4iXS?=
 =?us-ascii?Q?OgKVGk98UsB0Ho31lbiAJI5Llc4x+wKKIHAwCX3Xglbc2r0SZDeQOmWDs0iL?=
 =?us-ascii?Q?9MeieGyHzM5dJBrTK3KDSb009qpVzQxbTUZGJG30lTIuOdU3GmULm3W2BsOO?=
 =?us-ascii?Q?LTNtLrOTjzTiRpavvx97pV2xZmBUPyfkf8m1uUSNqn6iNx3/oabuwEo/9zQK?=
 =?us-ascii?Q?Pv7nOEFd0GN1xGuXgb24cyUEh+5Bi8N81U9O4KxBAzPls12FIBsfjLNdn374?=
 =?us-ascii?Q?w08mhmaijmfcguG47uNVd5g338g7aMgP1rGryRtxB6917UKHU/55oFzpGsSe?=
 =?us-ascii?Q?NkNYiUGLqZ2YK8AN/lE4UDQpb1q79NOfMchK1HmuXhb3kp++ARqlSzUPUbnj?=
 =?us-ascii?Q?kxxrde8ZTNfWXbNIzR1dE02MjvxKDVqX4ztVJllTx+0frJWWgprIh7wO0tD8?=
 =?us-ascii?Q?bRLQaUtRs8AH4xLrof3B8bGDqCqNuSMieUKPVkbvMJpoSJoA/OqUIPAzS/HV?=
 =?us-ascii?Q?4hsmmok+t28VrGV/FmMikCLkLGnOuRnKAye+QBRo31gHH7GiamP1N8yDqu4t?=
 =?us-ascii?Q?8DpfTrgplqNHN++nV395Al2rDbKUcF2z0LmQlkZ7nKeAz7BzdhSEJFATureM?=
 =?us-ascii?Q?oV3AXyTomIx2ZnLWcNvNtXMJjLbP25QzkFmRBbsKcN5S396JgSLazI1aSplo?=
 =?us-ascii?Q?YGdxMsRSUEKif7S2ZgkY+M11DPees/r3RTi+g3pv3UZwPXbVeCLH1bnHZsS2?=
 =?us-ascii?Q?dAzmpg6eNFemgAkNYd0uywjA3w+tQBY8XACUMNZtueCxDl9RGeYgaPHT4UUN?=
 =?us-ascii?Q?xDMauZzG5XiU7EbcZgGtFslBMzKJj52Iy/+DNuUK/Z24uQsP8/M/gPq/ouWw?=
 =?us-ascii?Q?ZrCZIKxVOnRfQZzsjNMK7lbgOSKHClDD7s7jPRlgYZIDnuF1FIQw4RaQGVr2?=
 =?us-ascii?Q?s61TvN0uyKGTrZrmbc0WRofQp53Up8URajcYyo36AyCfNSopmYdzL2vdwuqi?=
 =?us-ascii?Q?syEwSW951al1X4aNXwwNMUpH3TEs/cs5ZAU3xS5O0AN7B+NZliNKSs4kj/AK?=
 =?us-ascii?Q?yk0W+shqMHfNuTmNDVhgNCun8U3hfk9pq+Lq8rV5meiETm1UjEmDRT9BAukP?=
 =?us-ascii?Q?Qbw+VqCYa6JVgAWD/McIzn0Hvx4Q2Zy3tNiiHzN/Fw5xLSosF5O+uqPJFAng?=
 =?us-ascii?Q?Su+EOU4mDJt6YDrtZ16o7YnWdit0uWkiP/TEVcivHXPViBscs6i442c+ZOkL?=
 =?us-ascii?Q?vIeq+TlzrcOPjZV/T/aOh5Nr0FlmZRw5PpIN2P4BN1DcMufJ+QP0QGdFc+pV?=
 =?us-ascii?Q?9j9ooSk/xfHAYVNAh6Ig2wa8DoE4mF3iTk93UAxfCK0l8XrL2S8O6HbRurZP?=
 =?us-ascii?Q?LI00PpqKiHrZlCtyGIXkrDblVPuyJjxQ1PeZMFFgUmh7o3ExEMtw25zjqkCU?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e32081-e3d3-40ba-b1e4-08dd6d4c4e7c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:27:45.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbz97+dIvSAU5UZg9uO5wAuk6d2ZkEJiciLsxvU46qzynZJYZug2cBqK+MxmZOLbJe/39l4guj99LvGk91usj8YE4ahMinJgQfg8aiMJ4bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 16:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213763

Hi Hiago,

On 3/27/25 5:19 PM, Hiago De Franco wrote:
> Hi Steve,
>=20
> On Thu, Mar 27, 2025 at 07:54:53AM -0700, Steve Sakoman wrote:
>> On Wed, Mar 26, 2025 at 1:29=E2=80=AFPM Hiago De Franco <hiagofranco@gma=
il.com> wrote:
>>>
>>> From: Hiago De Franco <hiago.franco@toradex.com>
>>>
>>> Update the linux-firmware recipe to the most recent upstream tag.
>>>
>>> This is basically a backport of the commits from master into styhead,
>>> related to the linux-firmware recipe.
>>
>> Sorry I missed seeing this yesterday.
>>
>> The final release of styhead is now in QA, there are no further
>> releases planned.
>>
>> If this changes for any reason I will consider this series.
>>
>> The project weekly status report publishes the complete schedule of
>> releases for all branches.
>=20
> All right, thanks for letting me know. I did not realise that.
>=20
> I think the real work is on scarthgap and kirkstone, which I will send
> another series. Can you comment if this is the right approach for
> kirkstone and scarhgap as well?
>=20
>  From what I understood, I need to backport these patches for the other
> LTS branches as well, without breaking the compatibility. Is this
> correct?
>=20

Will let Steve confirm but seems right to me.

As for the compatibility part, for firmware files being split into a new=20
package, I would suggest to have the "old" package the firmware used to=20
be in have an RDEPENDS on the new package so that anything that was=20
requesting the old package still gets the firmware, except from the new=20
package, but it gets brought in the image via the RDEPENDS mechanism.=20
That could be the case for a bunch of files moved out of the catch-all=20
-misc packages for example.

For when firmware files are moved from one package to another that=20
already has other files that's a different topic. I would assume we=20
simply do not backport that part of the change and keep the firmware in=20
its original package.

Cheers,
Quentin

