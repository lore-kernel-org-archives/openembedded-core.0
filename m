Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E693CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:02:38 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15635.1762156953869356164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=BSnuZNf/;
 spf=pass (domain: siemens.com, ip: 52.101.69.53, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/YY2M6CEa2h+54ViRt99Qoe8jtsAuSsHGZit3b4SSmmj3z9SHK6vuzdYfvWIXaOLLyGl5zxC1VPo7lw21yFE8BqQEyPMKXrYgW+yexC2V/b1+WuFdWVicHbX6Km1JciHC/LizXJxNacQmSG0M7SHiKFKQ+Q/QtFW6V9LRUmX7wmhdCdh5xHqkYwyzL36bP2pnJDWHe0CfXXsopMhm0SD0uaoPTDjNkRzbFooRD0VLo5eTzG28mexpiMAlhKLskeneLUAaZBPtKUe1JivZIgVHP65VUfZHuwlBSKVvNXIyWOeOq1N4tMAcTqyxlt3ovTz0zgaRoMgDxgaRWqozOJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPEpxijcnrQqQv5iiE/5/xP1H+NFnC0oSyLyN4lhm+M=;
 b=u/S2/+yu9U6/EkRsnWWiHYTZkdiFht4Yv1H7rPseQhReW/cSxFt9dBBmEQeFwPr3AWvMzUVLFYBfaom+t/k4vXAVd3r0HuoWILmRh3uB9avzdnAx3KRKK1kzhGYJPeJPmNJZuEzbhAkcN/OBxcP3I3ywe6qt7MQDXYdAv4OnFAfOfsHAirmAUTvzMT6MxzRB/K7CYCZVRCFA07z8Fk5+7IdKEtDUdCnRdpAVltVPz7Gw8bITnfArhYTdzmNxacIvp9GUVMYKxUheY1EjAf+jwC/lQuV2X/W5tFLIVs6+jMCHr9sZK/bYPKV1Zg8cSyndNu8f91Yo6DPPR5epfxYe0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPEpxijcnrQqQv5iiE/5/xP1H+NFnC0oSyLyN4lhm+M=;
 b=BSnuZNf/d1iHOWVPQ2ZAUdQMiTjZgQ3RyZADqzsnJKU0Fs7zh3WPcQ66iEFC7bAMYQujYpr5EtyUVr2bUBDNBh4kM0hFKFmJ/Thsr60lkXrQRynEU4q7KBPpPpTT23BV7GK5PSDr6wBtJMnNpjvTvLHuAIZz9h34rrqyEZIAll3O/Cl7+vsyyrdhxIIY13zbAG7wlACXChM6z8fuEOglEw0SyXYH7yINTBgB6AGx9wYFIzWcCCv10GPvT+X3Ia3cXJiNYBKs5IYcjWwtIZb7ZpFX5A7OQUhML/I6CMv9eK6f6qEwJ7v5+R73dVW8mYtglWz9aaus4AZOF675hmrE9Q==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by PA2PR10MB9017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:416::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:02:29 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5f0e:551b:a85b:ce7]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5f0e:551b:a85b:ce7%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 08:02:29 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] rust: add missing zlib and zstd
 dependencies
Thread-Topic: [OE-core] [PATCH 1/3] rust: add missing zlib and zstd
 dependencies
Thread-Index: AQHcRyyLu+jKnv3BeUm10W+ojPiVjLTcWt+AgARGWeA=
Date: Mon, 3 Nov 2025 08:02:29 +0000
Message-ID: 
 <AS2PR10MB7347D1390E9116FA35919A37DBC7A@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
 <20251027102900.65173-2-peter.tatrai.ext@siemens.com>
 <6BBAB12C-61DC-428B-9C3B-422EC35F114E@arm.com>
In-Reply-To: <6BBAB12C-61DC-428B-9C3B-422EC35F114E@arm.com>
Accept-Language: sk-SK, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a83a7ad8-237a-4a12-b860-b2370e78a62b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-03T07:59:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|PA2PR10MB9017:EE_
x-ms-office365-filtering-correlation-id: 499bcb7b-1efd-468a-a134-08de1aaf55ee
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?zAcs2BwWq3VT3y/D5JB9WkjEPb3viPC5vg1RSqurO3YnX3JF1cdoqCcFFrju?=
 =?us-ascii?Q?Xj3F7+gF/itbi0rKq0HvYK/1+Cbc7MGTglahCaEDva1wShWca1bLyrfwdhFA?=
 =?us-ascii?Q?1xXDMmpCSTpTeHMY6MjiptbBz9GanTqhoiiVrJmOCHtZ2Of+ISsIwvlkaOik?=
 =?us-ascii?Q?DcA+dc54gnYeGm/Uwh4rHKavBeU6Bwiywq0k5kZp41ScPuFt93eaOXowihuD?=
 =?us-ascii?Q?d5nMiSqvmJCgh4FWx948UdrDAfUbUjFQYRDaHMQGdHdEtvzK7XhO8s0ue7yS?=
 =?us-ascii?Q?cbvaUf9u3A/S+p7sEcxQqQY/NE+fRlxdaOtrUkW4MhyS3gKDALZUJ8uoslLQ?=
 =?us-ascii?Q?ZAHpNwFIkdXRhO/1LgFF6yYOrKGSISASYM5DP0q5a6rHVxGgglSm49WGlqaK?=
 =?us-ascii?Q?odaJLyswy8EQoFzM7EjqZT51mJfgn+zNIzFqP78v2LaPclZQsYd27eEGR5YV?=
 =?us-ascii?Q?8ZD/Yc5g3Z8S6UUA2kFxFRa7+0ac3rzFrO0yeAvOgUr86AtPehsOSg2a515m?=
 =?us-ascii?Q?Fs9bmqoqsuf/dbrAKM5r+XuTzNPABIqvyY2b5sVeLDYvjBsLt+CURjyCkMoq?=
 =?us-ascii?Q?e5t998YQEq+OlrOb6BB48PDmE9eXSUTVFeoxfGhV7uwxvwcDDbePHESs8/ft?=
 =?us-ascii?Q?544tFDGO6omgYPB0vWdPj/0LqWU6ushmOgsgmus818kfQ9L7DICLO9ECZxVQ?=
 =?us-ascii?Q?w+TpLe1FP/5xmvIpDBokEq82Xgben8UpiU/0SXslnqgvAPIJs+FiziQKsR0k?=
 =?us-ascii?Q?Xi6d2SK1pNenmPoVGArJyr4sZv1XpIufDgoGe8R5euhp3xW3TaunzPvNmcdw?=
 =?us-ascii?Q?nGZMDak+bJfE4P/ns5sir+spn/QYyCv3eH+GjWZdPQA3Qr+IK5amd0nxSyu0?=
 =?us-ascii?Q?5cToEW6xqlNxOFev2zrQmrUI8/WSby53lQyPjHonh7To4Ud45UKNO/QdZEzj?=
 =?us-ascii?Q?jF+qLB6Zhhva/6X3/gHSzs+vvVnabnsRQLc07A7FdMNdaA6U1yFEnifoSxtV?=
 =?us-ascii?Q?/yTUv1MiVYIkvykvQy2EnGIOpSsLRnZ+wnCAaMPHXDBXM1n1W9w8lyr/40ub?=
 =?us-ascii?Q?I1feLX1rsB6Ox+SC8ErCp+re69uzci3SzJ/dMaJmmG0m8lewm3IoZfUQ8V5S?=
 =?us-ascii?Q?WbEJ0XYMXTjQt4U3PnPItGVOdy5iA4mM4xpLKujo4Y7KU+c2KYI8f6fcArIy?=
 =?us-ascii?Q?UIqBqCtT7gbs8LaNFXDvrj7HtyRtQjnOnjb7FZkfGQECCXx52bFy1gIGripf?=
 =?us-ascii?Q?OorGnwV7VVBm7t/pSIam67pECD3JO4pVMPMYtI5iZTaRX6Kf2JyYelEVcckJ?=
 =?us-ascii?Q?FYFL2N8KbUgeVipJH6p7+L0Bs2c3QiLSXbsmuBmyLjXLMW4a2Jlj8WpXrPDh?=
 =?us-ascii?Q?HXBYtN2pE8t1qGHmp81xWHlbGemrZgmrh4HkURf6jP6XkTsOjr9oTdN1nA9S?=
 =?us-ascii?Q?bznM5EZnyhQA2z0COz5G4C8Yi69l88349FGfzaJ8HaHDxL7o8BQPvcDS2R/S?=
 =?us-ascii?Q?QVj23U1FOK0iJEDTZdxsmCLZGm5Jw4KPixhE?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IV8KERxeTe+GxPpSetCBokTo4OjGazuIsXB3JDu4CsjKkmG105jOgTAgLRSX?=
 =?us-ascii?Q?Vf/ldzx4wJ9Q+ZnS7nyMQZ+g+fMFSX0Xsb54du6eVmCLPXDl+QeLb4HsRnqo?=
 =?us-ascii?Q?6KC6ijpXZq67ZXZzbm6nthSQ7esJC4oU9CuNNYMqUfZUj/3irXizT3uhYOMG?=
 =?us-ascii?Q?84sCA2zpKhGxARA8P5FPK9bGbasZUVBlSlz2rgy6qDI3Ga6Zk2fsFC5Bcwp5?=
 =?us-ascii?Q?28EJhRYcZYcNgy7v3pJ0y/33mY6kytIy+pLS8kSPynKliTu6cyxkAkYUF25K?=
 =?us-ascii?Q?H0vdA6wHMO1QGDKZkhBeVSatw6KOU1nn4sEIsqfj4VHOvE1TCUc26jBZ4Mqz?=
 =?us-ascii?Q?VdDLzBwdfhlS+NOUk2bkWMAgrV+TLTzBDI06DTUaFPL+wU97+9gNSeKirpNg?=
 =?us-ascii?Q?kNX8XpoY3kEXWUCUAYNvmSOdToGBbAyBJnn6Y36dHu5twnw3ZqYWLfz8YzrN?=
 =?us-ascii?Q?FAB5RGuQ7xfKApCc2sb2LrOR7oMAEtwr7yxXuDdtuW+C8/T0paFpp7S9DU/V?=
 =?us-ascii?Q?qSYgbTAWRCT/Gyez6B7X8SRVXpIZGdLU6f6vcdYRJeHzr5/IO7mEw8IMZ2Z9?=
 =?us-ascii?Q?pyR+vdv1EG9TAH8B6/pQnb7ShcaY1ohIP04LE5+mcaNk+6/er8Inz0xoaLKC?=
 =?us-ascii?Q?fSLfySGNAVWOWU+F7jKcckUsmuH5PPfxb7l0p3L+IFmP934NddpJ3qctmL5I?=
 =?us-ascii?Q?/XCx8dTMPnZ2U8BzK25ksNu0jBjZrn3OjxclOdRUYvEAtIq7Z1GtfBJqMkUd?=
 =?us-ascii?Q?C595RpNATZzVh+1geVm0Gv4YNpdAcYADoJJBGA3gJ8P9rMvmTKFNVlWZu13W?=
 =?us-ascii?Q?3n1284KeChDvvGa1qTTyyw7Kj+JXHchi8SgVHD0x1HPYKl77leZ3YggC3hm+?=
 =?us-ascii?Q?bUA7DtwfA981DjjtnlV0Y7mxtRIinwRKhjUWu+rugOML6QLUwrCbuWFhV1Nm?=
 =?us-ascii?Q?NprMsXWzc+b/QPT7+sGBklyoITASoPxbafDcZXgWNFrZ0Q8r4D5+93j+H4X0?=
 =?us-ascii?Q?dZ3O5ECYQR2RG2BZ+qrJjol+KBwkPOHLKTOilz7IU5DulSGKU5L0oMJPwMJF?=
 =?us-ascii?Q?Z65UsJxzIL/gfTTuCQSAwEisWVt4IhpG/GAg7d8x6NCFXE7KqRxTOfvb69Bn?=
 =?us-ascii?Q?YymOnIuFETOdEukv0X03gyzp3wEB/y502PqCMh2i82yP2o0ATEVRishzL/Hd?=
 =?us-ascii?Q?WVAHvPWv8RVQ0fnJ8P9gaQ76EiB2hoGWOZbt/TPpnLi60hHqfd0E9pZO8bha?=
 =?us-ascii?Q?v7XOgRB1snxEUs1z/Y0X9zTv5jUwISjmYu2mpz/czw6GeDoj3dXSfdBC/bD2?=
 =?us-ascii?Q?jzggMiM79kLHdhSwrXA6fk1s1ol00zbteU45maL5LQhvquCeAJOczntrgtIz?=
 =?us-ascii?Q?MM6BV0DOTuQxkVnq5sx6ijjlQ7cf2ANP5VLR8DWPspK4bkeCYDSzVndGLlMf?=
 =?us-ascii?Q?zSI8ORz8QoqCM901nMNMvq04HKa1//OyuYrfYxcY3WjJqprN4dyUL2Nkseww?=
 =?us-ascii?Q?YOCHNB33wSZcxiSP3OUH17DnII2iOaCDarA5zDYszKge7+7nKCK8/9fj6JPQ?=
 =?us-ascii?Q?f19Lfyl+EdRk0Yqa3Q5rawDe9Wx5H3LgCHHQGfX7LlzKJ68c9Iv3vIvmUdxh?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 499bcb7b-1efd-468a-a134-08de1aaf55ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 08:02:29.6037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vv9Vnj5KgKW5dM0I+7jEl6Zd8Ue9kS9fY0c0IW56hWFdPKV1VvpKspEbnJT7N4hw4BtkgZoBJwAJnxZaSqFLxb3NM6EZSnrwVOwz9dmypZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225612

> Notably, the patch to switch from rust-llvm to llvm included this:
>=20
> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink-arg=
=3D-lzstd"

I realized that these RUSTFLAGS exported at the recipe level don't propagat=
e=20
to the rust self-test. The test directly runs 'python3 src/bootstrap/bootst=
rap.py test=20
--target' in an environment where recipe-level variables aren't visible.

I'm sending a v2 that fixes this specifically in the selftest harness=20
(meta/lib/oeqa/selftest/cases/rust.py) by passing the link args via RUSTFLA=
GS=20
in the test command itself, plus adding libzstd to the QEMU test image.

This approach is more targeted and only affects the selftest execution.

Peter


