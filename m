Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9125FC3ABC3
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 18:39:47 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.84])
 by mx.groups.io with SMTP id smtpd.web11.34066.1746988779061751033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 11:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hO6x+/ZK;
 spf=pass (domain: siemens.com, ip: 40.107.241.84, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLDsAVhmKT6YWrfYWv8U5VKzy92vLdju7k0fV0eRbKDcZEING70vd3NRcyz7hzk5eUUTqt3ND9VLMx41m/9bGjpA5PmDXYaWvjUrIavcQCGFous/3AOHhJx+kwQ0GxlYwBO0llEM53mYhdcDd9GepDpf7twv0JAinh09sY0LDp+bc7k0lY/xifiJV4PWB/8LqokCvwS9e8kbyNTyuEgIWCr1Y7xNMDmAmPWWPVKtVGbJR22C2j8kws/3UUF/ef5iV4lNpmEjjnEBljeus5CDcJpN3qBwu+0EdWGkeYLW14raAVbUGEEJZOuZYXKsKbtun/lHsPKkwFrpAnhW/NwmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9ZsBn5JVJ/ibsmGMVwM4a8i496gMgQrADdOc7qmJGI=;
 b=JYTtoZzGtoBVnDOv4S3fsxZ+J0JIodFOuzYV9bo7A6Ih+T3pyYtd8/WNynD6ujrzhTapw5hIlRhPWdNJxbezA5QBRA9IHmXBr61Qru9zAI+D305ijue7us3lQC1Rpu0YbO4WJe6dlKvGinGzjlUONiFaI4XGmAi9NBErz9zu7R+rI26ZDY8op6AjQjQLbQZPTXaH2KzNFNgJIIP6kL6jOta9CW0rx3iC05cEFpHVFKK8+7MHxREqiaRpKe6hFK9HJAEwelkg8iY19qOr7c0OrF3FR6fQdCMrSjgwmRNBhwJWyh0A+bjPFXKhMeyo2mbaOtZgKYja+9p/syStBmev5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9ZsBn5JVJ/ibsmGMVwM4a8i496gMgQrADdOc7qmJGI=;
 b=hO6x+/ZKXzkGUKb4gASOUVsAmGW9GuI4jaQvMfBiFvGq6/MVQEI45ntE63+wPlq6n/a1Edha3fzGgKya574tHgV1w+eLyonGdVa9eEajXTmr2AkLOZZrlEPXTWH9z/c2+1f/FmXk85OEqWC97vs+HWLviLISBYQlEeNxB+id1fjDT5/deXjxz3tdXd5NC1X0+JHCI4PgFb6VsVx2v00Hv9/LttRfj4oGgzk+qcQiVW5kyADV0cW3JY6dQv8l0B1eaiybE1NXlZoisVnUGoriRt60NGftlH5X0tTWM7HZz761KD27UVHYlGcOvqeBwFuvpBTqlukXSlV6T1xpgoZtbg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB7983.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 18:39:35 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.021; Sun, 11 May 2025
 18:39:35 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [yocto-security] OE-core CVE metrics for walnascar on Sun 11 May
 2025 01:49:49 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for walnascar on Sun 11 May
 2025 01:49:49 AM HST
Thread-Index: AQHbwms4yI6Y9ZGS1EqNnHRedONdv7PNwtwA
Date: Sun, 11 May 2025 18:39:34 +0000
Message-ID: 
 <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250511115243.D83E9100407@builder.sakoman.com>
In-Reply-To: <20250511115243.D83E9100407@builder.sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e9914887-1b84-4b22-8ffc-15df37237053;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-11T18:38:11Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB7983:EE_
x-ms-office365-filtering-correlation-id: dfc1b0fe-a80b-4332-3e50-08dd90bb2d4c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?sJDig3qfu+TOAvXZgK3hJ7VZyl1p9BLgBCZ2z5Q0xJ5Lx2MlHfJyoYfE5F8X?=
 =?us-ascii?Q?Q1ON0mRhuUIN8JygaJk7Z7zxWNoERp0mPOFUTx7wbYBrgUl19grNgrfAwSSj?=
 =?us-ascii?Q?ETO47P0CIfPjwudP7Jc7P0Tl/Nvbor9oXg1VuKVtwa0LXJL/s7t867upjmWO?=
 =?us-ascii?Q?8Ea+KCtDCg4Y0cwbAGWIEAnDjzZoRgsOvJKbv4nanLFSHqpcHY+4vRA5v7Qt?=
 =?us-ascii?Q?0pHzMG5PgfoCzdtRZ9MKyUuMmypQ0eaCg+qHGFJ2gVXYBnHWUGN684felSHk?=
 =?us-ascii?Q?p8JFquRfed+foxgmNuWXIoeWmACPgYHis+sm6KnWMR3Y1gRyX359M8YLIzt4?=
 =?us-ascii?Q?7T3sOyxS6/lHdT/HK/6sCPYVF1tCeC4aeXwhtRhz8Z1Odjtn8L9qt6HCe4iu?=
 =?us-ascii?Q?sCQjLzwCPTMvF6NBCguUnhLrtTHGeYq5Ve4/9nD7jjkqDW/BJ0MsUO8L5z/e?=
 =?us-ascii?Q?V4Bb4lBseEjc1XVPItvn880KTmo8s2O8jdSkifx3dVaU+ofP/IHAt41yHUqt?=
 =?us-ascii?Q?Pbo+g7Iswvhw1ahpawaglWwEqj+MI4AzLfZhpGo38/ykRcOmvcXr+ttL/FbD?=
 =?us-ascii?Q?3c85kTAgTS2M1Cl1eTch22ZyY5ImWrHFvynZDxDCNuwVB0yRyMhsfv0MNK0l?=
 =?us-ascii?Q?c2QXck0LT3H+CWxsHQk4PahMm01RPEDAsmfOQZBVtUUL0pZMInY5j+TGCose?=
 =?us-ascii?Q?Q6QZprQ9ITAhBFIdW0vlo5MIyhcfFii1yXe0dGB6Vdd2BRlZEQXUECv525bR?=
 =?us-ascii?Q?XlYHE7FL6KaZw9SlgBpBLlZelLrnG5Yw4wdY1sHsn47fjLaAlcyYDmRO+4Bi?=
 =?us-ascii?Q?IeZk5JoxJxNwK8u2x/jdsy+zgrfZSvtMUcmNCYuEY+5KmIpBkSKm9Y/+fMi1?=
 =?us-ascii?Q?jrqSWpE6aPforC3AyHKlMfA7oGgq3eaHJq6aGKdZT+7AVPX79SaqW+lMVzOl?=
 =?us-ascii?Q?OQiZt/cctOhD2i1pivEywwCfWKJn1WuMhwvrH7k37kOYhQKC2by/zTjRKmeP?=
 =?us-ascii?Q?cs/srMzR4Wpkr2eqiSyNtrQjamSto+jhYND0Kkb36p8NaOKroRqu0O6zX4l9?=
 =?us-ascii?Q?wFWAQj5XeWEyNu4MVgFb/YUtNpqUukDDXRiVzUlwASJl8U1bILiUS/8MihIJ?=
 =?us-ascii?Q?PN/QgARmBpEfS+bCfxEnn0Vo6BKnpUiIw5ZhKnzJGKfxtMie/8r2KhGv17h+?=
 =?us-ascii?Q?PF/SfAjsXYwzXSDRUA8JPwR0rnb1n4WJdsKE5oS025PCoZHCgkqCH+sKe27R?=
 =?us-ascii?Q?BmKyqBy5gH07ld/vk0Ip+dmngghNZT5GGcJCIfvPYyBT4CTw8R6nw7vZ67kC?=
 =?us-ascii?Q?ejqVGZcUMXzNa0MlybMDKblxtvn+Hw6rt0GQqCJgr7k35Flnv94S3RWiuasP?=
 =?us-ascii?Q?DwGj06TA78bitg8O4QP/7h0WAECs/RrW1IhnnzP8eRhqwXw2ycASv6ETQ7qS?=
 =?us-ascii?Q?tC9kUlwwnp0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0KHwCS86Vgt6kHJQG3LH9LLpMXznNSG+lv0oOnFdYW7otchqydMNswRzT6Ys?=
 =?us-ascii?Q?7BcSzIbhQJ2YCjO7S4Jz92H3l6hyOEWGBrczAg6ybw3cJAdYgVDKb8M8v75M?=
 =?us-ascii?Q?gs+EZiXTk6/O8DWy+sfJhwHSk61hJgxoK0hIDyoNpa6aE8FArh1Dm4EQxL2s?=
 =?us-ascii?Q?7QoomtlEts5ruPR+FBLabXwZ2epg2oOEt6xR5nx26cSPqrqasrxxagu8a/qD?=
 =?us-ascii?Q?Y5euiFBm60+yd2VkdeOwCOVOgY7Y/MAR1JRbQyqpaye/K2zAvwN+UU/QRI5s?=
 =?us-ascii?Q?T71IFqYINm80CcJ4oWqdD4PO4QkJXqjNSAmfJZ8qZYYIXB/5ji0lBnVyi2fH?=
 =?us-ascii?Q?okIuVB1wrnJbQJnibb8g2UIBZWZ8VIKEqgqDhhgRIw4lZDGIQ8r6xX8fEk3A?=
 =?us-ascii?Q?PcxnTLrYmYZQn4hd4fliZJKURYp1YYXc34QcsIqeTziANySTM3FS/x6yO5LC?=
 =?us-ascii?Q?4O1+MrXkfIPedRzb+7Pz+5n0xg5VI+EDpVXmEY7+pgft9b8Itmqfc+i8SDpK?=
 =?us-ascii?Q?HuEhh4cK7LuGGQWKNHkxXCtg+OCXKjODcF9UNe0Ei5QpRldrDRq0QSoDkCFV?=
 =?us-ascii?Q?akN2jJoZ/pnDDXmO+dPdDodwcTCAzEglKRPw5OsSHkaQZ9OQGA8WMNDgrsQO?=
 =?us-ascii?Q?G5xvkg6Xtql/PaADnaCTDd4YXZjL6YsGesNox4gW/ggMFU8XeszQBHwMPlUT?=
 =?us-ascii?Q?OnkClfhE91Xwu6CVA0yGD8f5WpTC1UZ3qly0A4cJtjgxMsrYWDtGwneIEUy9?=
 =?us-ascii?Q?iKoWP40KS0RRy4cgKRs6vqkWvvb8WZcr57fvLXy56x1PbqY9AQiSDdfpmlFn?=
 =?us-ascii?Q?b4LnR65xWvqMQceKBK8G9NLHlCtrOZfeLBQ+HEL6ndcsdF9F0NEw1K1HXgnZ?=
 =?us-ascii?Q?IzfTcteHoVMM5EdmAjkvamYyFP6TDOz0b8bcenAiO8dH2grllM6PR34WWTqn?=
 =?us-ascii?Q?xQPTaoQNePEhFKNPR+voIKjf6k70nMJUvFVdkkFag//YHtKCkSEwrwQcIUey?=
 =?us-ascii?Q?LJExgoL6Tx3Tal3uMZpOVdEhpn4iTs9VVVa4jqY/QdXWWBMqHgquhKmWvU2i?=
 =?us-ascii?Q?GIo0EtbDw8Oqcw0hMHHqsUe68fF3tU+Z6UDVw5HtosuHt7lNon66S30Dyhah?=
 =?us-ascii?Q?6pqLOzUTuiyxvY4tdRzkHg0cvEx2ONIv/PCEH1hpYbPUL9Kx/xBxVFLq7/QV?=
 =?us-ascii?Q?b4KHx5NThN8Uq9GiKcOZkWrs9RIT4ZjMb4pFp8URNemcZ+Cg8Zpc7QHXhr+e?=
 =?us-ascii?Q?BwSOrfMqhgBg1Gt0GRbd7Xm9n5jka4u4UqW7v/eninehi/0fZKRhQEGIrzxy?=
 =?us-ascii?Q?FdcAmLI2fHOFJ0cDA/nDkez5guT+P1gySYnQkRJkjEO2FCdVwytjzPEpdxJz?=
 =?us-ascii?Q?AEdQXJ5G9W0ucevm0gKWf4EKtKn5kABtvYM6XUVu0oMr9/TSQE3gYNSJzuvf?=
 =?us-ascii?Q?z6eTEpQyjBy7LRLPVFGATqX8jrJ7nmu7y/xgJTHQejWHf1IUwz8XxEb+qaYB?=
 =?us-ascii?Q?Ds+TkcQLEvRsVcUca80ywlnvCUWMwD76BsqQASVDD7izvvR3ex74HGdiDJ7w?=
 =?us-ascii?Q?BOQiNsLe69IAuiLDjAmomv9vHtVjbcQX0om2V+Fa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc1b0fe-a80b-4332-3e50-08dd90bb2d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2025 18:39:34.9557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqGQwtaBcElkDsC0FitqiUgZEmw43tXDBxdjsB/OgwVwJkMT2yrMpxY/7t5o6WHxss0LweIRJyJy7Qmqc7rNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 18:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216290

Would be cool if also autobuilder/valkyrie metrics would include walnascar =
by now.
Peter

> -----Original Message-----
> From: yocto-security@lists.yoctoproject.org <yocto-
> security@lists.yoctoproject.org> On Behalf Of Steve Sakoman via
> lists.yoctoproject.org
> Sent: Sunday, May 11, 2025 13:53
> To: openembedded-core@lists.openembedded.org; yocto-
> security@lists.yoctoproject.org
> Subject: [yocto-security] OE-core CVE metrics for walnascar on Sun 11 May=
 2025
> 01:49:49 AM HST
>=20
> Branch: walnascar
>=20
> New this week: 6 CVEs
> CVE-2023-1386 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-52904 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52904 *
> CVE-2024-56406 (CVSS3: N/A): perl:perl-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56406 *
> CVE-2024-58097 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58097 *
> CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-32414 *
> CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-32415 *
>=20
> Removed this week: 1 CVEs
> CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-
> 2025-1153 *
>=20
> Full list:  Found 32 unpatched CVEs
> CVE-2019-14899 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-38096 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-1386 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-3079 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3079 *
> CVE-2023-3397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-52904 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52904 *
> CVE-2023-6238 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2023-6535 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535 *
> CVE-2024-50613 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50613 *
> CVE-2024-56406 (CVSS3: N/A): perl:perl-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56406 *
> CVE-2024-57995 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57995 *
> CVE-2024-58097 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58097 *
> CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-8354 *
> CVE-2025-21751 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21751 *
> CVE-2025-21833 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21833 *
> CVE-2025-21949 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21949 *
> CVE-2025-23137 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23137 *
> CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-29087 *
> CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-32414 *
> CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-32415 *
> CVE-2025-37838 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37838 *
> CVE-2025-37860 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37860 *
> CVE-2025-37925 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37925 *
> CVE-2025-40014 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-40014 *
>=20
> Summary of CVE counts by recipe:
>   linux-yocto: 25
>   libxml2:libxml2-native: 2
>   qemu:qemu-native:qemu-system-native: 2
>   libsndfile1: 1
>   perl:perl-native: 1
>   sqlite3:sqlite3-native: 1
>=20
> For further information see: https://valkyrie.yocto.io/pub/non-release/pa=
tchmetrics/

