Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C100AE83EE6
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 07:23:14 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14701.1770189791313987389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 23:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rwLRDVMs;
 spf=pass (domain: siemens.com, ip: 40.107.162.15, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyFZ+kea1QT7U3KpAhVqYW2syDL0iyGDfgXJtqcGzQtRZh/d35mG1YC/UJbjtRVXznRg+GuCAhYYYCzeeOxIPhTQnCy9tYZbAyJFsss1WakBqrnBJqxTqYk42aiu1NZaWODrhzTQ88rObXLxnwfp3jXONHgr5RasPHERSd/zO5BKXULk/kZ2I0HbOLj4IYpxz9PSHAIxNrgXCJKjzddANam38XF5HOYhlIoaQswlLteN9JTmAAoxiLQ3n+m64551F8/7bFB89Gn7kxhQkGZs4X8lYwXLwhh7+EqcghJA31HcvvEoot6jgzIcweBJC5yz2ucTpKVHMvaf3fqOU9qyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJHTc95bYa4nqLjK4cD/sI8ilHgIE6/gmi/bJeAbQTo=;
 b=UNngWHBWP9T8m+uTo/GkgiHuvB9mdkY4h+FyFzKpdDxZ2MXbaxHzAf5TQeP91Eu8UTqaVrOpPFbJB53XEuC8VQT5BZqyAJbg8KWbsVq0wcl5CuqpZRMU/94sF3XVd0YCQbsrf43TV755zT3ri5YnBn3y+BI4cRSQXYTsCiFG3Ng6TNALjiMLwFluBGw6U7x1TUJykbSA+KOICUZ/DOFr9RVEKUHBkZNqIpWPU1a53Dp4YEaJEmua2Qyxq82bDX53R3xR5i1wEZ/v2aBoEPLL9LFtZBVua6hUfBFduK5pHvAGBABaIr8XTJuaQtx58W2eOsEYsD8AqZzbw1tn6jvGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJHTc95bYa4nqLjK4cD/sI8ilHgIE6/gmi/bJeAbQTo=;
 b=rwLRDVMskiayLzNCUp8EFoGo03pk4oe2Ues4Hj5PyVvbSCn6NJvAs4K7wojhXPEayNqw3xH8XkaDV5jGipcfem3q39EbVu+v6RfVKPCoYgqRYa0x+UWFeStfGviydW6rVNZqXgSftVzc60x070kExywRrODX2kLXiyRS8qNmijAGIg4qoO9NIVoPiWUeFIKEE2JbaA/D+oON6QltiMA9Qh6kPh5Fl+QmRNxT80qWgo/trg77WdkUjqtrUR5WsUhGtz+2TCpt0DcvZf1+NUsxNaaMyD5n6PopUc34AvWySf47Tso4BEX0fwHDXEYMKPDTdZcY5Zd2k8fos8XraRK2Vg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5343.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:23:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 07:23:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH 1/2] libpng: patch CVE-2026-22695
Thread-Topic: [OE-core][scarthgap][PATCH 1/2] libpng: patch CVE-2026-22695
Thread-Index: AQHchbV3SPf0K3e46UacGeKZ6kUlLLVyQhXA
Date: Wed, 4 Feb 2026 07:22:47 +0000
Message-ID: 
 <AS1PR10MB5697871977535CBCA31A32FAFD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <188ABFD65FF0FAD4.2595076@lists.openembedded.org>
In-Reply-To: <188ABFD65FF0FAD4.2595076@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=90244832-11d4-4329-98e0-976aab3ea8cd;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-04T07:20:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5343:EE_
x-ms-office365-filtering-correlation-id: 5139f0e7-566b-456d-c944-08de63be32d0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?UdNVAXZeRc83xomc6VCdzFuAZRn+V3JKDMdUMf0gi19C7oniu0+Xy/go1nuX?=
 =?us-ascii?Q?rFV7g7xCUnXpQSU6lsKVvlklmSmsVIU5UWdHKIj+Y3gIq8YWTJdLPsYa4rdC?=
 =?us-ascii?Q?cA9agAQPLl50FgBehrvHipUmSvTcryTrtMJARkj4uA/7IGrPZ/0usUzUBd3C?=
 =?us-ascii?Q?xFndruUq+ft1A+9d2Q6ONJ1f1nF5hLfDcl778Bd6c5gkfNhDTMrZI14yA1EE?=
 =?us-ascii?Q?SjbYuOoFYLUmj4Zlm5WaannQrcgnxeExODIuUqIiNn7jX6T3px7YcQkbiP6B?=
 =?us-ascii?Q?kkj2HS2Oligg+PgKKzhbC0Wffv4XhB2L3I5XgwY2qTCOsVhKjtIhcN/+7XHM?=
 =?us-ascii?Q?7JAMTnUra+BNIL10rgmXba+G6CoNouaGX55WSSQYFSxQkasDeDeQ5nUnsJdm?=
 =?us-ascii?Q?OtyMfZZ4+ebx2greZFgVlYiEfLd6SMr3CG6/HN5P8v0EH730vNQi5SGMy2JU?=
 =?us-ascii?Q?k+GGhZ860Ql5X8fOHMzFhhkDEAvSsyW2om9NhDNE/JcuBfncO47TRPUmi2Cw?=
 =?us-ascii?Q?AINTIY1Nou1Il3x1Hlm3z7NeM2OlD+V8+k651WMswPVRo+VVnndfdgcoGRWK?=
 =?us-ascii?Q?b9NGEpHaHYOa1/+iaeOSoGUInWwMfJQlU9uLnxe/dQoZ4DrCuuidscv9RumI?=
 =?us-ascii?Q?RjopVZxsChG1wTdRo5NXdsBQFxzHruyZfNw1ei6kIkKm7miPF/ECe2A4IQyk?=
 =?us-ascii?Q?HNgbnb64lQ3zSNVufI4GTIuuzlsUTYHd3sIDK/C635aVfeEI5EdU5AEUV883?=
 =?us-ascii?Q?FyqgaK/yvPZSQv4lbMsgMNvT5j3S9ue+W/n9M3aw+kwGiHELtUf5QJR8HntH?=
 =?us-ascii?Q?D8sRTUgBp+C+rJ9EtqsLLZycP9N118C2s6chUsCNY2AL1iGwl3xUoMSp3LGU?=
 =?us-ascii?Q?2VYOyK01lqSky6zHMhZpyb1zGTEOnyvCGx1bqTsq6uOi2Ff5S78tjbENZzx6?=
 =?us-ascii?Q?pu/PWzMwjrvUlddA55P6xuAlPjKJnOC8qwMcSlDteIyJMRKSRWyu00QjFYG8?=
 =?us-ascii?Q?QieqcHbYqncvctcrLs4o0YhO7Ad74wH+TCgE/pnBfs56/+bZwNt4NdNRNoXB?=
 =?us-ascii?Q?9BToiaXJ2pp6YOa6pDcTowqNQqso4HUx8Fgi7K/ZkG/q/iUKduNIoZV1krzF?=
 =?us-ascii?Q?3kaN7wBIIbgBDhmBRwef3z9HQQsI0onh8cb2fYZ/CDGADBHvykvBQ2Xc/skC?=
 =?us-ascii?Q?JyUv4Syd35lpkKblbX1Fe8lHxKVs9NLAQY+Rc/Q4Lzbf8uuVVD1MYNaZGkqh?=
 =?us-ascii?Q?+T1+oHdlhWXNvgOcwsRGQv3XhgHlMzlYo15reEMXZYqcczK71ILzqfIUm6tm?=
 =?us-ascii?Q?DpAJ56qi0IXQRST0sBtau11U2MjBl5COaCvFEDuR8unGz5rGt5Llvpt/N5A4?=
 =?us-ascii?Q?Z9+eBsEXD+UxPUyeTUrZ325fGOlheS2jT+ol1/6Ly8OAMsaOSwa3HVnNa/pl?=
 =?us-ascii?Q?iIqsXcan+YG599pHbjCpGbRcVeUz4j+ydPwGFa+cdAWfyzuIoUYHqrEYdLP5?=
 =?us-ascii?Q?zgu3QlqQJHNN+D4LgQzN8xpNCi893yBglXqYdZ6Xz2r5pNHl5lfKOPqADQ2S?=
 =?us-ascii?Q?55Q+AgGKNcMiThrpEa0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?k4pfCWWTT4x/5nGbNvFazlf23eK38dO+1/vzgredk/IC/T/F0ObMITCUZxQc?=
 =?us-ascii?Q?idCoC7zWK5ygcDLJP7MA8cqbmads61yhJjb/h+V2LQ15+u97kk+Wi0xPayF5?=
 =?us-ascii?Q?0w+bCYEBByRma6dYWcPGt1B170IDU+gz37JMUw+Zz0Q0eSc93l3ADRV7Lc9B?=
 =?us-ascii?Q?TTL2iM1kvBhk2fb6dLTqKyM7XGaZPoEejSQol6f6ae1YrdlOir1ba4b9xmZc?=
 =?us-ascii?Q?T/xLKA47ELC0g2o3do52Xm/FbYaR5Ew3t32cYY5smQGXn124XZA1rVlA+OKh?=
 =?us-ascii?Q?mE9RrkwI6nqyzqma3pTV792TQNRCeBxjeBIjZCfN/ZTR+kjHuP46AuoNo8p1?=
 =?us-ascii?Q?Chx2tA4JPS6BtvTcY4S1s3s90w7z8T54hI6dTH7fYY/vjg5y2pjCa+elQuKb?=
 =?us-ascii?Q?5WDn5zidfZis5JPbv8/B4d5/eJolztP0nxBhu6xP7DKuckK4S/O4GeMUZDea?=
 =?us-ascii?Q?kfdxSv9PrUFdWO09G2HTAaAx/WFDdmqTTUzvWiPc0JL9N1WcTj5cKEdFxQlD?=
 =?us-ascii?Q?nkrcU/jXwyOfhdjhp78i0RcUdNAHRx36k1p+oOnwkhmpYDZg/tHVEkN0LAW7?=
 =?us-ascii?Q?jcpw6Tuls4cqhPy6H1pOk8lII5pNguRjtO2G2zov8vBC7IOGRjU/dejLMihh?=
 =?us-ascii?Q?DRiFEFDfeT/KdfjDAzgYWWdLNrBHjP+jrvEzzKMNLX2RTW75B1CwnAQM/6XY?=
 =?us-ascii?Q?w7u9sZ8PgjoCF/Pei8itRstslchhLRJrDvfrRx4jzFrjlhdSCBF9y+zuNLQx?=
 =?us-ascii?Q?qluU8bFC+/TdfgXzhaXMzEdkb8MOMXmoxRp1Vd2G1hrOjndCm4sQ3R754zfK?=
 =?us-ascii?Q?aV302qGHsD8QMC8YXVkK9QSDSHLDkBHo/pbindCMdoay7dw5iPTicrzyu02k?=
 =?us-ascii?Q?chFgawOUz8YTjVl3aWgCkxIIMMrikIgQ+7ChsckXM5JIc9g3upQ2dG7nJhk/?=
 =?us-ascii?Q?dP4YL1/wdV/p7x1vgarVP+2WiKIPnSCpiok1eUbKwQmMX6V0IyyIDyBvZZ6w?=
 =?us-ascii?Q?ZCLQzKF29trd0Db87h+tZMd3myjNKPq1gppZRGr+EZtpcMc/Dwd2OIyBNko/?=
 =?us-ascii?Q?UcRUlDkjOi+ImJEbPQmtEeexF1z7OOjOvEgkAyipDy5yETLy5+MmPWH2XFLt?=
 =?us-ascii?Q?vzOjkudMG+i0ME0bDiKQC4VZPCO9VpCW39K+oKWXPxNlUNAnWFKj1hVK89gN?=
 =?us-ascii?Q?7Sd93Y2T+FuCkoC8VVsFgib0644cdBeP4FS1M8Xe2ZZ2PzccQf+iN97NfuVH?=
 =?us-ascii?Q?O3tWukUX7HrkCe5MDcGhIQDE8ueH2e/5LZdkb9vXCeVDBjbB12njEXzBJiJc?=
 =?us-ascii?Q?vOzMfKg+luGNQ/hC4vpLv7/A3xm0OByFsNURgR5ZWJWMdA9dL5DICC0He9v8?=
 =?us-ascii?Q?4RZGry/S+XLtz+WiiUKCbEKr5buxg+iBnC3rJ5YyPBzcLR5roP8RxHIA3mnR?=
 =?us-ascii?Q?I5Z9Lwj95ymL7Qn9Adx9lEzOQKOM8d0fLde9nfSnqN+Hh1l+ScXeYO8IxcKU?=
 =?us-ascii?Q?0A3y373IcQX8YI7k0qlGPW3uChvkwmi97UBLyB+eVh5RY8sRCxzpXX4LYJPm?=
 =?us-ascii?Q?MglyjDyY0E1W3I/A8HsbuiR8nEsR4TeKoOyGSideFNxYXDwdk74h7FB5W526?=
 =?us-ascii?Q?QkctVdaMaa9M/EIOS0kFKqRnQjCbziA4bP6/LuNQAVRoyEH2QAkC0SZhjj+E?=
 =?us-ascii?Q?LhAwlCTsBHoqISNmgRtcJI7u+BvNvg4mGA4lF381N7n7UYdFfWmp7f6K+xVk?=
 =?us-ascii?Q?3C3QyxNK9g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5139f0e7-566b-456d-c944-08de63be32d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 07:22:48.0121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GwmVI+QR1VVKcSI6/xDfEoY9BxSlnm31UPEidYZKbQvy4+z4K8Jq8zvopmuiEN+gBz+b+eeR3AYaspZfX/hLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 07:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230500

Gentle ping for this series

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Thursday, January 15, 2026 1:25
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][scarthgap][PATCH 1/2] libpng: patch CVE-2026-22695
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick commit per [1].
> This CVE is regression of fix for CVE-2025-65018.
>=20
> [1] https://security-tracker.debian.org/tracker/CVE-2026-22695
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libpng/files/CVE-2026-22695.patch         | 77 +++++++++++++++++++
>  .../libpng/libpng_1.6.42.bb                   |  1 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22695.p=
atch
>=20
> diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
> b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
> new file mode 100644
> index 00000000000..6456b6c4917
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
> @@ -0,0 +1,77 @@
> +From e4f7ad4ea2a471776c81dda4846b7691925d9786 Mon Sep 17 00:00:00 2001
> +From: Cosmin Truta <ctruta@gmail.com>
> +Date: Fri, 9 Jan 2026 20:51:53 +0200
> +Subject: [PATCH] Fix a heap buffer over-read in `png_image_read_direct_s=
caled`
> +
> +Fix a regression from commit 218612ddd6b17944e21eda56caf8b4bf7779d1ea.
> +
> +The function `png_image_read_direct_scaled`, introduced by the fix for
> +CVE-2025-65018, copies transformed row data from an intermediate buffer
> +(`local_row`) to the user's output buffer. The copy incorrectly used
> +`row_bytes` (the caller's stride) as the size parameter to memcpy, even
> +though `local_row` is only `png_get_rowbytes()` bytes long.
> +
> +This causes a heap buffer over-read when:
> +
> +1. The caller provides a padded stride (e.g., for memory alignment):
> +   memcpy reads past the end of `local_row` by `stride - row_width`
> +   bytes.
> +
> +2. The caller provides a negative stride (for bottom-up layouts):
> +   casting ptrdiff_t to size_t produces ~2^64, causing memcpy to
> +   attempt reading exabytes, resulting in an immediate crash.
> +
> +The fix consists in using the size of the row buffer for the copy and
> +using the stride for pointer advancement only.
> +
> +Reported-by: Petr Simecek <simecek@users.noreply.github.com>
> +Analyzed-by: Stanislav Fort
> +Analyzed-by: Pavel Kohout
> +Co-authored-by: Petr Simecek <simecek@users.noreply.github.com>
> +Signed-off-by: Cosmin Truta <ctruta@gmail.com>
> +
> +CVE: CVE-2026-22695
> +Upstream-Status: Backport
> [https://github.com/pnggroup/libpng/commit/e4f7ad4ea2a471776c81dda4846b76=
9
> 1925d9786]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + AUTHORS   | 1 +
> + pngread.c | 4 +++-
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/AUTHORS b/AUTHORS
> +index 26b7bb50f..b9c0fffcf 100644
> +--- a/AUTHORS
> ++++ b/AUTHORS
> +@@ -23,6 +23,7 @@ Authors, for copyright and licensing purposes.
> +  * Mike Klein
> +  * Pascal Massimino
> +  * Paul Schmidt
> ++ * Petr Simecek
> +  * Philippe Antoine
> +  * Qiang Zhou
> +  * Sam Bushell
> +diff --git a/pngread.c b/pngread.c
> +index e3426292b..9d86b01dc 100644
> +--- a/pngread.c
> ++++ b/pngread.c
> +@@ -3270,9 +3270,11 @@ png_image_read_direct_scaled(png_voidp argument)
> +        argument);
> +    png_imagep image =3D display->image;
> +    png_structrp png_ptr =3D image->opaque->png_ptr;
> ++   png_inforp info_ptr =3D image->opaque->info_ptr;
> +    png_bytep local_row =3D png_voidcast(png_bytep, display->local_row);
> +    png_bytep first_row =3D png_voidcast(png_bytep, display->first_row);
> +    ptrdiff_t row_bytes =3D display->row_bytes;
> ++   size_t copy_bytes =3D png_get_rowbytes(png_ptr, info_ptr);
> +    int passes;
> +
> +    /* Handle interlacing. */
> +@@ -3302,7 +3304,7 @@ png_image_read_direct_scaled(png_voidp argument)
> +          png_read_row(png_ptr, local_row, NULL);
> +
> +          /* Copy from local_row to user buffer. */
> +-         memcpy(output_row, local_row, (size_t)row_bytes);
> ++         memcpy(output_row, local_row, copy_bytes);
> +          output_row +=3D row_bytes;
> +       }
> +    }
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recip=
es-
> multimedia/libpng/libpng_1.6.42.bb
> index 6dc7ffe2722..fe99e5df092 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
>             file://CVE-2025-65018-02.patch \
>             file://CVE-2025-66293-01.patch \
>             file://CVE-2025-66293-02.patch \
> +           file://CVE-2026-22695.patch \
>  "
>=20
>  SRC_URI[sha256sum] =3D
> "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

