Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADBCC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 08:52:27 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.65])
 by mx.groups.io with SMTP id smtpd.web10.6935.1737103945869922388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 00:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=D4yA83dV;
 spf=pass (domain: siemens.com, ip: 40.107.241.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYO1x0+1Y6ZiLw7+gATrmKwzls/wUc3wx/Vg/3LyIBEpcdRNk0J3XpaPzDSmmlzcw3f4W6YTkwBDITOTY0GG4NKDIBWk5XmzlISthus+ZoLrNFtoMq7avFFzmEYHiyPlHpX5XfZUlo8FVE+Mf76WORxtpiXPko0LVkODZGOcKKUBnRdkSzQALQ2HVWQMlVwnYxyp8fye8xc3lUJkyDU+YMpaGCXT2k4PtnBMeUnDD4cFWq33Z6t34c0AY3mmLvlJyAhTRzf9KVcccCxOYLY+CXSn+YLo2FddzW3rUV+KT7Iup0Tn9BgAr+UjfcwuVFqAvDe0rHG5JbwJu5CyweJ3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUYhAA1r9yZx+tMUcsRug3lGJ6hD5Ioie6mpzlznXN4=;
 b=Lbe9shalT7XgOSTYWP2k+aySCwuqc6zkx4UEvyW3MqG+NeR7RT5sMZ3WWblmbDCoAlFQbkJ9PfCoGHl+VpH+jF3lCDEhvjtmCUOjvutR7J581u8UeyZrHWfhPyeIEUauaLsYlsWVCIWnGSwE1aAn273ktEaORaOwVvYsP3fBpXjLk+6zVh5JBE3IH5CWCQt1f2lpeDNjRKBhjHy2+hvxSi/t9aS0DZGIDsSv2PFmgCyG7wg2psg5posCMyRBqRzITbDoSDKpR80gFvwuQ1JEJCpATiQThCJ5wRc+c3swqzhvKtYfkUtZkyv5LTaLTIlHdEecVddEJCxOA2G+lPuqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUYhAA1r9yZx+tMUcsRug3lGJ6hD5Ioie6mpzlznXN4=;
 b=D4yA83dVDdc4hm8zkcxC3gaJQHzmdv82zZs5vR1+4BgdJEK9lsgBYxqdirsrJk8PLDly1x/2dRRemIcwrY0RRxJqddfvSzurxQZB6SIJRcxFSbh0w+gaJbks31UJ8ICeVDhskQYMHMGDhPKsRpzPtLrhcA7N8XXVd/pej9BJxzuPrCL2cg2JfyXFDQAHYJWNxoMiNVI33LeiGLGA/UHeH4dX4OBQ1qkjw6i9cFptqWue3Yfqk4FEfsGKt3dUNmqq3qwQY7WLndWUjQv02dmxdkU74B3/XACaKCIEJrxMZogR4Sxvbe7rYyvb6pKUq7Mlr5HXKJvHRCetBSajIQF3gg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3543.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:137::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.8; Fri, 17 Jan
 2025 08:52:22 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 08:52:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "spushpka@cisco.com" <spushpka@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [master] [PATCH] glibc 2.40: Deferred CVE-2010-4756
Thread-Topic: [OE-core] [master] [PATCH] glibc 2.40: Deferred CVE-2010-4756
Thread-Index: AQHbaLbm/1/6yxh/rE+gduTcXzLuiLMaqEQw
Date: Fri, 17 Jan 2025 08:52:21 +0000
Message-ID: 
 <AS1PR10MB5697525B6AE67DE62C2176E3FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250117080709.3112142-1-spushpka@cisco.com>
In-Reply-To: <20250117080709.3112142-1-spushpka@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=eb8799be-a24e-4b9d-bcea-787e4e278e46;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-17T08:50:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3543:EE_
x-ms-office365-filtering-correlation-id: a377cfaa-2cc1-473c-1fe7-08dd36d441b8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4KA51VWawWzBzqGsRS73AOQ49aL0HpRtob4rG1zpDOxicqqA5cmrqtSe9OoP?=
 =?us-ascii?Q?huw7N/THdrwbIWyRWBaCrEpf4vSVLS19d/yqr8BcyEr1YTMU2kRrTXC4QQ9m?=
 =?us-ascii?Q?rLJwTvkaPDyapbp2VTKiUHtUNAcA7qt7rZQmftySrabdJzsw6RFLz/psflJ/?=
 =?us-ascii?Q?3mYQ7+pJPtvxZegdNI9rf6wYNmeNoh5bCcHuCWNIM4JT7sgcbXog/8iUhOV7?=
 =?us-ascii?Q?qfcCSviiFeHqHIk7ZFRk6WL41Y6pcZSMZPjJePQxFbA00rP/oTyBHklTkMV5?=
 =?us-ascii?Q?odVOG03D0eQJjrAOtp9HVZZSuER5WU4L60aUodGN3qK0GjKwMkeKwFXrx1JV?=
 =?us-ascii?Q?jBHC01lzF3ZrxAU7L/bnVRO65s8BaSLgkQiZoSofbHw3WLUACEB3wACkoiNG?=
 =?us-ascii?Q?nLYon+QJZdMknuuwKdbAihAV4EQv5KCqnp8uwPpd9Yz4Z9DNghqEqj56Eo+r?=
 =?us-ascii?Q?rK7qLbF6U+4p/N6JpT4J6IARjzAl7f1zdINpm1uzZoQ9cQ6Vq1RAEYJTg4kY?=
 =?us-ascii?Q?x5Rl3FoUGRqxxkd2fHy3q0IxWHfTuI38nYQEKmzRrvUDaKA171QcqDqEhCV+?=
 =?us-ascii?Q?chdG39um8aJhHy7zUWnmzSSQPtI2YWMkpv4vRM5Q9hK0cyNzEyKOjyymf029?=
 =?us-ascii?Q?k4g207tpENGTzTG1k+xcDWj1SvRk0PZAYTgd91XaFB7IWX5E/GtSbJnY7GYQ?=
 =?us-ascii?Q?Sw6oC/r08teQYnL8zaWXGWZ56NRTvbERj9R36ODw+bwBoCfuXAL1k5qKxRDI?=
 =?us-ascii?Q?ruy3XUyJ8khV8uBOdUfeiIAn0XmlHyDZlNyUirCCDh0h7R4R22WyrM8ZDD9h?=
 =?us-ascii?Q?2Ej6oM1XOkWDEXSX9jVlnLOfdXF5wB19pZS8qmEomP1zQWLBe4/X8DI3NSrq?=
 =?us-ascii?Q?ZwU6+8Ge2OKzs9UchuLt4rn9kiQWoSvw0KFNUShwTEsXxUrm8CRwMtKVMRwS?=
 =?us-ascii?Q?MLUfjrXgb/nJCkXcHxNI44gMGZJmqY7r7TvQIis8bLQFKurXfyIvjNcIOECM?=
 =?us-ascii?Q?GLUfWJNMaKDT2Pd+Ei7JnG87qVRaQu5A+VFO3SKjzwRcnQhjzecpGrTOnf/l?=
 =?us-ascii?Q?yzTzZ48ZriKR/d1xvXDui8bDLt4PEx7RTwtdadfsxNDxDsTAkFGTFV1wxttD?=
 =?us-ascii?Q?NBb9X40bb9pEazZGlzYvboraHErWUSRfvrYXYNWNDgDOF1PX0roeMH44XBLp?=
 =?us-ascii?Q?eHVeIPohESvvSlQbntiYcrHgfsGYk8xsPhU3MbnerzckkTKAxsNUxltsNRrB?=
 =?us-ascii?Q?gUNKhRFOlAGZQI4i66QH9IfZEOZewrI+E7nDtInEk3ODEIwr9gmPG1yRsHqx?=
 =?us-ascii?Q?sT49kFwmOjugeqgG+tO7AruAFOEz6l5oX37SSGYiTd1oGe1B2bEw6SUL5KQZ?=
 =?us-ascii?Q?UxTu/+yUx+OCFyLuD/2mrSbz31zaOEw1UXw0ZLUQSLWK6uP8XQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?C5UJA0J3n3AMTLYwAomXRI8HYf76ZA2beFNe5VQN1FFAkdS70ngabRnVBDal?=
 =?us-ascii?Q?sBPKSmNqbhmz5q+cAQbhBToaeaozPTLHx7HASQNaBlYl6zmWQyIi7uXFALs7?=
 =?us-ascii?Q?6lcRWK7ehmszSZWHAx+5QKIh1WY1Onpm69GEPjLQluqEHVzhe5G4ktuHkHuR?=
 =?us-ascii?Q?I1qIna8oLV7G3mElTTaZYVZsddcsekbU8fTtoAaAWv16w4V//yqtwpVmpmku?=
 =?us-ascii?Q?8uNLL/rAdFuAGvM4kR3mc6Q7iO4BiRO+/0AyXNe4DqqNmxg4U9exaAGCaZxr?=
 =?us-ascii?Q?mW7UkM8qSQOAJFhAmEVf8eSRTvo51KyAXobOOZrO44tSC8UDaCxRxPFU1PEF?=
 =?us-ascii?Q?hjbBf59UjdrI47+sYP9ImF6J9Eh9ezIMoKnH6sKDtK6Ob3EzgjCqHJisX66X?=
 =?us-ascii?Q?7NdpSgHMAziVISsZqG/pE7fiONseRgp11cmaNTGDtx6USiDM2jzHJWMdA2V7?=
 =?us-ascii?Q?UlO1DIawU5sybXY58Dz7oDtMTGsyF8nMKPDHSt8uaPPI0Ht/8IbNkmEs4IKM?=
 =?us-ascii?Q?sJ0EN1RK0emG+yMVX5SADn68a0JHB+ken/viq6GV/Wex+5bTseS1M7KXCTg8?=
 =?us-ascii?Q?p9Ql7Q11jk/OdD2/gkppKW2pDKQcihpBPZYhKVVWXV4Yi5WTgVvxeemn8suW?=
 =?us-ascii?Q?EWUPftiiwDQoEunWSV93KSBXHJdU2DIN3VF6NeEW7oz6KPjDKKVpJfn1y6XL?=
 =?us-ascii?Q?Ov6mtKOUrJZIueqBp1aS/pRc8hX7qG8uST7S5Z3fUx1xUc74nWEUZlTe3YxQ?=
 =?us-ascii?Q?X2AFaQ1aNA6OV+89qaN0UMhLgMKkUwxOkV7NNioACTTDfqC9GpisXheK2btm?=
 =?us-ascii?Q?TegOyukE5BlVI5MTmpzrdakjhGzNYz94cRITpcEdrGXR1Q8S2brTVctpnXGw?=
 =?us-ascii?Q?dNxkEnUol3XksZ+whQ6OHoQfjdFmMICydMvtA5jQvh9L4ujb6EPSm1kiBJBm?=
 =?us-ascii?Q?MFeOwSUCE1gs4/8MKSci89lr4zSvJju+G8cjir2FVylVf1gbqUihnJfwoBqj?=
 =?us-ascii?Q?I0swLsw8KaYe5Aa3D/CIlsP6mVQFOOIQtlgS0o56G5ZCvDYmHTG9Cjdv88tm?=
 =?us-ascii?Q?NrSDpkKoKHl9J7HqCcfkIfw8o+dFlclFnN7BzPdeekBRkKEjuFYNw+Zb3Eq+?=
 =?us-ascii?Q?bDsmlFx16BckBi13/6OnQx+WIDPGUqGP2Sv4Q3l1rtw8nPdCXOIHhvdvvZ5H?=
 =?us-ascii?Q?k2EeF6kTN+ygF3P7zmpbfKsW33zurDU6VY3d4FFvoZDQYRZs5bQKw1/NAqt8?=
 =?us-ascii?Q?ENI+XWDNt4hV4+42RgTFP7Ax8nGh2pAzR3AieufYollT33FWxxUcKZuobtag?=
 =?us-ascii?Q?cVSGxqd6PLTgtc1tOA1L+3p2Eq43AnKcGeBiVFICbuCJtqLPLwrT4gR7vxss?=
 =?us-ascii?Q?ShZ9lTuJT7L2C8S9x/BhYJ5d4OspA+Tg4FF338aUWbZ1KYvQZS7Hs6e6UH5z?=
 =?us-ascii?Q?X6sQgBxHa+ZeRRqSXrCahPjnItfy3tBIOT25UjpEoMSQ9Flo1DCE+U7zksNY?=
 =?us-ascii?Q?F42p1qiH5oCUWmD4bQasAT5IfkqB2sm85i3BrbUnJ3kas/3w2U5ve0UKrP2G?=
 =?us-ascii?Q?iBfmgA7FD6LcaTz8lWGuPtOGD0kO5g+ZW55F48R8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a377cfaa-2cc1-473c-1fe7-08dd36d441b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 08:52:21.9824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrr5CfVZqNyYe6o0SrHBLs0dQVg0Kg1DybQ9tVx34xB1sBTIdDRyYdSA1nghoDCL9UCZbXSGidPrXqz892hntA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3543
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 08:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209980

This is already done in cve-extra-exclusions.inc
So if this goes to the recipe, it should be removed from that file.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Shubham Pushpkar via
> lists.openembedded.org
> Sent: Friday, January 17, 2025 9:07
> To: openembedded-core@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; spushpka@cisco.com
> Subject: [OE-core] [master] [PATCH] glibc 2.40: Deferred CVE-2010-4756
>=20
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2010-4756
> Type: Security Advisory
> CVE: CVE-2010-4756
> Score: 4.0
>=20
> Analysis:
> - It is a bug in network facing services if users pass
>   in unsanitized inputs to glob, without using appropriate
>   rlimits on memory usage. [1]
> - Issue is memory exhaustion via glob() calls, e.g. from
>   within an ftp server. It is not a security issue, ftp servers
>   shouldn't be passing this to libc glob. [2]
> - Hence skipping the CVE for now.
>=20
> Reference:
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=3D681681
> [2] https://github.com/openembedded/openembedded-
> core/commit/cf282ae03db3
>=20
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> ---
>  meta/recipes-core/glibc/glibc_2.40.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-core/glibc/glibc_2.40.bb b/meta/recipes-
> core/glibc/glibc_2.40.bb
> index 3e855b19d8..3210492764 100644
> --- a/meta/recipes-core/glibc/glibc_2.40.bb
> +++ b/meta/recipes-core/glibc/glibc_2.40.bb
> @@ -20,6 +20,12 @@ CVE_STATUS_GROUPS +=3D
> "CVE_STATUS_STABLE_BACKPORTS"
>  CVE_STATUS_STABLE_BACKPORTS =3D ""
>  CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix
> available in used git hash"
>=20
> +# glibc https://nvd.nist.gov/vuln/detail/CVE-2010-4756
> +CVE_STATUS[CVE-2010-4756] =3D "upstream-wontfix: \
> +Issue is memory exhaustion via glob() calls, e.g. from within an ftp ser=
ver. \
> +Upstream don't see it as a security issue, ftp servers shouldn't be pass=
ing this
> to libc glob. \
> +Exclude as upstream have no plans to add BSD's GLOB_LIMIT."
> +
>  DEPENDS +=3D "gperf-native bison-native"
>=20
>  NATIVESDKFIXES ?=3D ""
> --
> 2.35.6


