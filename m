Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CBAFF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:13:16 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45879.1777299191787004983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 07:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=VZUt41qq;
 spf=pass (domain: cherry.de, ip: 52.101.65.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoN170qrtM2WPOmCnmwQsao0mn6OpltnXqKujoDcsk5tQOGZpfgaTWTTHA7uxPP41wGXmsRTfJLkI5a/I9Q/5hHhCrbSId5evynf812fDT0eg3TXVQoZptVCalAEvGJrc3jCPbNK1q2ObA7arcSKYJrUXEHmGqJ4y5yPcRCZ4XenvLiQQnobeBF/kWqWAouvVLKmndgdy7c+imcdneKv9lmXGdm7NX+8U8v0Rb6p3rlJOVSPg4t7shuO+Gag91TIx0kV4czqY/Ams9bm590zV2rSImEt9JmSDTu18I3Qo5B0Rg/aHlLKe1Pm5i0Ik1Is0epgjmRpbkdtrZZH3XbvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bmSweL3vTJRIpBxkoFMMhQqaIQWKGugMZI7nW8alxw=;
 b=bQj4hEzZowB5ZW1s/H4MI/CBpi/qcUDu5Dp6f/54VjvQh+/3e7U16jK3eQ9iuizF607izN3QZeMGJ9X+vVvtMlTxwjnzrNl/4L4rJb2H+Bkdg4ctXu8iZDEAA/SNL7iw2Hi85Lc8SHn43YLix86WSNK04YDM8KU5RxWYVGGyZXgSdduLLlK6qz5EP0PMxIk6s4QLsu1I56QxCFJYC1IrXeO49YEMxfqWX1MEYP5Fn3AWBs43JlepQ8J5lnt6K7Jde6HyoNzXEN3n/z6w/uT9SyCBV8ePMQzKlTK94yj1e8sKZS0E9SoW+8MlGAoyv610yzYdymZf+PTlLg8K7bWlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bmSweL3vTJRIpBxkoFMMhQqaIQWKGugMZI7nW8alxw=;
 b=VZUt41qqeso7p6LjFkXyIq2MuekYnajpB3fZPVzNQCEavLMin+LzrICw7PAK/59Be4UPjWqrdFfdiTkbN8m+sm0zg+Xt+vYyZnP6/V1hC+5icdbj8/kFi0oaERgK3ALYt1Lvqp/0ZI0A1jG+bt/XkLxW4mc6u/0lIcapX973NFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:13:06 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9846.016; Mon, 27 Apr 2026
 14:13:06 +0000
Message-ID: <6a648389-c229-473e-9eed-02fe3d3a2fea@cherry.de>
Date: Mon, 27 Apr 2026 16:13:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] meta: simplify conditional operations with
 bb.utils.filter
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, qi.chen@windriver.com
References: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
 <20260427130846.96013-2-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260427130846.96013-2-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 03adc474-59a2-4ad8-d6e9-08dea4671a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	WwUsPwl32cvSuuwpYMqL5M0f+7ahaFRBkwma5S9Kopo+/bLGRRW+iixxFwapWV//kbQnVFbaO1hTHhKED4cVuO31/RaCaF3BDOEx9/ZtXqZY2P/whbWGTiO0t1e8Wy3GI/jA8P+hReREhyVvug/ZfQH+rfDcGEwIuA0ENvGBtPrXaOME8yYwe+6MtNbLoXa8t645OFqftl1ahFN7vgn8CtLtvqPg1kGF8mMdAm/73wW0+xeSqdjkXrP+Lk3KdSCcruJQWofsRvq1/B0WpwFC2KQFhPsba/zNjSUrc+k2PUi0lC5qiEe9bYnPc2tTvbUNAWngxfZ6KOBq9mLikIIEOvZEKAKwYVsGo0OfVfALlWv3WkLw/d8V42C95Pus2V+8a5xNJip13i/S7Jh/dG5scPlkWyF7HzfTq19D68L2V3vRUTboebR2bWRNbLkuxL466X95upx5bK56bmnoTa/m3lDz5rTDom7tkl1E3CDc3xJ/c29/bOYB0MBJb2+tYFVF8X8jv4b678HrAjqk4avj7g6bt07hYsFRMGQ9DjohAPbUHRXNOB63OUEx2qEpT9+kVc6FsQVDM6gH70GZMWy4YrvHo2FHIYcoxtt+b6JxqY8zmEDd3jDEHYHVNAvcqsDmYLWnS5MMDQwQfXr1lRimfgXuUJfrJHQ/Sr3E6iHGI95qfqJn/F9uHtFtxH4fYDZ934gJi6HETZ2vUjKAD8EWHacydxXP6C009Kk7ts0Ai+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7OojWxFAn2pf7lljkrOkPDfGOLKzmrh4LcsPDpij20xM1DOHPp2UZz59F9v2?=
 =?us-ascii?Q?1RNKHr947Gx7SN9gHYjVbqx64Gd6W7tvT3mF5hF/H7Gd23IpuBPJEXCmDXHf?=
 =?us-ascii?Q?3E/fKsNb5FN4+42Wdd9Lrm/MYhIhcYx3kd3CjMi+Px2R5P1DhPG62N45mfzh?=
 =?us-ascii?Q?DHjO4rzqYv/QWtVfSREntUK4q82lc/9QOv+cKXtiQyj2BX2P193Exx6Bb0yS?=
 =?us-ascii?Q?Lc317GpFIQKq1MRHl8U1WMOeqqwwQKtSSUn3indt+0r2+qWluqIWSDTxas4E?=
 =?us-ascii?Q?UTG5JXq/pRdrbt7yCwS969UyvtBAMhQAt+WggPQp6YmSbj19/wf0+AQhQLKU?=
 =?us-ascii?Q?Jn3BASFigJYjx8/QvN/6S6/+b+3W9GMMBcEor+tENRzGAwoqba489ASs3vwg?=
 =?us-ascii?Q?uyX7PcYFIl1heaHxwvBV2BsM+Dmqa3ypkz1nYGLpz8b53DpWAfL1afA8XRkx?=
 =?us-ascii?Q?WuoZRwDPp7Sf9DChPcj00FK+HDPn+4uWqJcz2PGVRL0VflN18S4hx37+Xl80?=
 =?us-ascii?Q?sJ+aaMwjksxV+n/wdsFlCjlWlhf7ZzDY+5uomCNBEGHWej2CBTITwIxsZG5C?=
 =?us-ascii?Q?c/Kd5W1ch+2IbdlxMfW9bLMqFF6xxC97HaxlA/g4egbD7m+Nq3Pwv4KCO/I9?=
 =?us-ascii?Q?XOKiQ7B/gNcE6eMpYpIehJ3AykZDCPCjEan2jrUKtDdSpwzWj2eq7PNn4FUh?=
 =?us-ascii?Q?qSCCqrhWGKlrtQvZxQgKLg7YMEJzJ4nhL/x7g6DGwcTFCo+/3cjHQlZJntjd?=
 =?us-ascii?Q?dqf1WgWMyrIDLMg9Aq0lrU+MZT4JcXSqQMW2sJ8Wyh10c+fbPXXS3o7p+HNN?=
 =?us-ascii?Q?aeMg3QiRo7Esb8QWJMLQr2eRx+xfhq/Uzm3YKN8yNsknfxD5ieKQumRPHGDs?=
 =?us-ascii?Q?iG5SXbujQWdRM4EOpZZld8UPU6i1u6NcwRGddxVpCu9VPwtBZdOHSkG+nYtb?=
 =?us-ascii?Q?wLhffjNECHZ81w1iztJdcoHJkNsuF/X9EOFDlR1YGruc7hLv6naciC4KQcY9?=
 =?us-ascii?Q?el7Cuq62qr2jMhU2ltCoDR1mrucafLqBjzPi0Ge3sqbdXsmW1yaOrtQTfM04?=
 =?us-ascii?Q?OnAaZFTn/N3MIIVKe+1CLQxmBpORmsyLgIYR8SNHQvcXO+qgBItpawSor8Sn?=
 =?us-ascii?Q?r4d70unyEMiS8fnlnS0GAE2CAjNtzKvPWPccxTP+yixbFsJq7V193QhlUmb6?=
 =?us-ascii?Q?IN3+N24K5hJwem7LH3nRO3JGN5De6E4eQl8sQh5w2iEMzS1i3TWiXIhUWdeQ?=
 =?us-ascii?Q?GyIvC3Dj5xkByC6WZHtg8XgSju4bzIHDwUi1aVuVuuBEaQH3YI9YltECnHdq?=
 =?us-ascii?Q?2B3WAMy38DqDAIvQGO0ZE0LiDYrELgIRHb8Jp/590X1bfxNXb/GghFX3zZ5v?=
 =?us-ascii?Q?r7RVQ1bc+BJ0I5DJs+fe3zO39wvT9mj7Ow7ijogW9FqC2t51GSXtp07m1jDK?=
 =?us-ascii?Q?0GeomGYZHc+sLrvmHJPs+wbwvRu6ypaxdL54SpE5W36smiKPBqAnbQ6IlYzR?=
 =?us-ascii?Q?FkzbQrwvK9goE/oUl5Cb90qMZCYUNSglnCWkYDRDMXaHJl6T9DcLC/hbtb1L?=
 =?us-ascii?Q?lZHVQWtwUSPsz5rdw3RYmYrm+H6SZrMQKXeFqWrNFPkfLEmU+tYz3s+6aT4Y?=
 =?us-ascii?Q?i+87YlEb+kuILkIEhK7h9IaEMfJELEinbe71Ng+8fONrt49ZjnDgQm1Cd8ay?=
 =?us-ascii?Q?e+H5o8/fo+benploYw1JmTWrDEXfb7yw2kfKs97q4va75jrTSlrxexbSMkPq?=
 =?us-ascii?Q?0zf5d9IocHBjSBFzZCX5JSdx3ht5DHjBlM6s7pf7uZf5eVwzxIvV?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03adc474-59a2-4ad8-d6e9-08dea4671a60
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 14:13:06.6256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnvi+/aF+Cj5xlJ12rJWz6FryISJLMHmks4bNJKNoQsgsDNirxAipKv+vHvxz8v0RhnxzxlotO43mbMa6e0/1n6tA+hfiBIC3mJdlTUizSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236013

Hi Jo=C3=A3o,

On 4/27/26 3:08 PM, Jo=C3=A3o Marcos Costa wrote:
> Some recipes use bb.utils.contains to check for a string inside a
> variable, and return the exact same string if true.
>=20
> This can be simplified by a call to bb.utils.filter, since the result is
> the same, and the inline is shorter.
>=20
> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   meta/recipes-connectivity/connman/connman_2.0.bb                | 2 +-
>   meta/recipes-core/coreutils/coreutils_9.10.bb                   | 2 +-
>   meta/recipes-core/ovmf/ovmf_git.bb                              | 2 +-
>   meta/recipes-extended/at/at_3.2.5.bb                            | 2 +-
>   meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb                | 2 +-
>   meta/recipes-graphics/waffle/waffle_1.8.1.bb                    | 2 +-
>   .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb                | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/reci=
pes-connectivity/connman/connman_2.0.bb
> index 6f7093301b..e9873f3163 100644
> --- a/meta/recipes-connectivity/connman/connman_2.0.bb
> +++ b/meta/recipes-connectivity/connman/connman_2.0.bb
> @@ -169,7 +169,7 @@ FILES:${PN}-tools =3D "${bindir}/wispr"
>   RDEPENDS:${PN}-tools =3D "${PN}"
>  =20
>   FILES:${PN}-tests =3D "${bindir}/*-test"
> -RDEPENDS:${PN}-tests =3D "${@bb.utils.contains('PACKAGECONFIG', 'iptable=
s', 'iptables', '', d)}"
> +RDEPENDS:${PN}-tests =3D "${@bb.utils.filter('PACKAGECONFIG', 'iptables'=
, d)}"
>  =20
>   FILES:${PN}-client =3D "${bindir}/connmanctl"
>   RDEPENDS:${PN}-client =3D "${PN}"
> diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes=
-core/coreutils/coreutils_9.10.bb
> index 984c5b5292..744d930272 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.10.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
> @@ -222,6 +222,6 @@ do_install_ptest:append:libc-musl () {
>   }
>  =20
>   RDEPENDS:${PN}-ptest +=3D "xz  \
> -                         ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'a=
cl', '', d)} \
> +                         ${@bb.utils.filter('PACKAGECONFIG', 'acl', d)} =
\
>                            ${@bb.utils.contains('PACKAGECONFIG', 'xattr',=
 'attr', '', d)}"
>   FILES:${PN}-ptest +=3D "${bindir}/getlimits"
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index d731bca7f2..38d5d090b4 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D=
06357ddc23f46577c2aeaeaf7b776
>   # compiling OVMF twice, so it is disabled by default. Distros
>   # may change that default.
>   PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 'tpm=
', '', d)}"
> +PACKAGECONFIG +=3D "${@bb.utils.filter('MACHINE_FEATURES', 'tpm', d)}"
>   PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 't=
pm', '', d)}"

I believe we could actually use

bb.utils.contains_any('MACHINE_FEATURES', 'tpm tpm2', 'tpm', '', d)

to merge the two tpm MACHINE_FEATURES that enable the same PACKAGECONFIG.

It also irks me that we're using +=3D here instead of

PACKAGECONFIG ?=3D "${@bb.utils.contains_any('MACHINE_FEATURES', 'tpm=20
tpm2', 'tpm', '', d)}"

(or ??=3D), but maybe that's fine (or in a separate commit anyway).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

