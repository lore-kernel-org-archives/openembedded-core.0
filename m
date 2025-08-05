Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FE1C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 11:19:55 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.web10.19395.1754392786660466067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 04:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UQbZOwZl;
 spf=pass (domain: siemens.com, ip: 52.101.69.43, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLS8NQIuqs0MTpiA1aEizVkMMSuBXi0XqcUHjOezwkg3zOPgEUos4QbfGtfgKZez+2/s8or3qYl/ejUH2aPVJ4jpU8VsYEJarKLZGI+afceSLIfkocp4oEdfh2AK91q/DhIC7+H76A114Peuj3y1/WpgBzcHiaOQ+PEUOskUHEm/usvi7n1qwix4HTgRSlddAsTFgi7eQn8YJ3NNWtKcjnx9jfiKWQtl6vLthQSZzESoOk4R9rER+2Ydu+388q1FEVG3koqJRBxi0PVEmERNu2d0waY1O/UvW3oc7eR0s0DKvYXSL+hWU/0uR84GlLUZT/X8Ag1glnH9x5lQWhF6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIq1dvPfacqIX0t+67ENA+zCTX3MVja7Z7eRBsvp0/4=;
 b=HR+EohqydY/S4iStSwTyG8+Hsv/kp1kTwJZskK8YJqHOV4rpiWrLaqp4gzCrPs2KM3gvTi8qGa4Y64ZyglVjYUqhCD/EDQsY5o1tgF8D3rSHz8pMW9si6sDbvoEkhoib/VCgZfJ5xFrYxxTC3k5Atvyk/ZyXVQ45JErrird8adxbKakXTRNos04WOmjUyTgFNzJJiUkvFTi9dzm/YMv0Z3Sx4wGfkEJ6MHn3+QrSNtoxhzXTK9fYzlQfIfBZWPZw6gOJdk4BXYcrJN/yocy+Z+7lD6w7dMZlXCh1ptI0Pp95iwS9pYICXAJhr6GAUveE99TdBdzhWbXcJ7pPS3uj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIq1dvPfacqIX0t+67ENA+zCTX3MVja7Z7eRBsvp0/4=;
 b=UQbZOwZlSK39YZ6DgE0iNlROQHEwVTZ9EC+PL/SbgS+gf+tJs070dqSNJEEAVIOb230jiBEmAaTyuZAOKodw3Yk+aKYiSdrUPBGVTr8l3mbpgLUWyDpLgXe2hD3+rLorlOjd4bVjcD3OsFWalbx5lbnXxmUkFAAaZVDqXyToiUpQUOToTKILMFtt0g/DbcuXoML9grEozS9FdcNcC0OsowBRLZ2LxiCjMWwxpf6tvl2gX+BwsVZbIieFG4oazjVqLSpIW/hctRBBiGFMQSFFLpYJeD10Kev+1QuhLnlXqj6tR0+fsnPucuYN9Dc2lrUFlSElkr2m4C90GelBQwn2Mg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6618.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 11:19:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8989.017; Tue, 5 Aug 2025
 11:19:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Divya.Chellam@windriver.com" <Divya.Chellam@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][walnascar][PATCH 1/1] sqlite3: fix CVE-2025-6965
Thread-Topic: [OE-core][walnascar][PATCH 1/1] sqlite3: fix CVE-2025-6965
Thread-Index: AQHcBfmHVGAnHd6MpUiBGQtKSXpAV7RT6Ylg
Date: Tue, 5 Aug 2025 11:19:41 +0000
Message-ID: 
 <AS1PR10MB56975C38EAE81C0E8ADFE916FD22A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250805110938.1612112-1-divya.chellam@windriver.com>
In-Reply-To: <20250805110938.1612112-1-divya.chellam@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ed830d18-61f7-4f85-a34a-b895f7c85aed;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-05T11:19:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6618:EE_
x-ms-office365-filtering-correlation-id: c2388ef9-0aa2-4356-c345-08ddd411f96b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?QRxAXpoWW5TD03g0w1nZwan4vpGaVdEIyFyUrGwq7EZ5Knl7p2fs631YHEq7?=
 =?us-ascii?Q?+3v8CLkredLL4DmWt782JNN4E7z+9lYbBdEsIXa7wYBbz/O46wm9qj3brruf?=
 =?us-ascii?Q?uul2SPnb4CImBufH3wxnTIRtEAoCeriaCPrYNT07gXct+iO+Xquhim6QxVuI?=
 =?us-ascii?Q?4h8EApgcdL04QEcVh+GM7CgPvhYtsDEEgA1wd5gpIMdyiwxScPpRzu+CjLpz?=
 =?us-ascii?Q?9eYiWkzODlya2Biu+Pe8CadhoAbWqy6eGxizCaz3OdoRUJY4Dsxj7leBwL0F?=
 =?us-ascii?Q?by4JvO2pez97bnX1vlAZ4Ua2sHzdwL6wT7qZmzZpkLXL7vtKREvW6I7r2NC+?=
 =?us-ascii?Q?E4QsbHwTgH80asvaW9sBzB0+vOfJSxCWm4E7NI6tu2+DwcdEo48/BslHmWiw?=
 =?us-ascii?Q?KR020seAxYgLGeKfsH2qAKgoRane+Ebnt7nx7V73KUHEqQ8BQ2JeKPhMkisL?=
 =?us-ascii?Q?fkf2V+H097Cnz7ONYcPUHYf3tRu+VPD7qOF98aGO48mstuaoT1dRrUEpaucK?=
 =?us-ascii?Q?IBRV0a8KvAMU9OPVESLHPBUn/VxZFhf9nC1udLjDR8/u4q1/eNZYAcw3L+hA?=
 =?us-ascii?Q?uGRTtSPOaHS2PJlo7DJ6r773ZWnUnOcmKpxVeCPjqKCDxT3wNGaM0a/ZpwBx?=
 =?us-ascii?Q?KvPcU03ZlDS3xoVHmhjBBd+mFwy73/nOeT8z5d7fZh06xMO9N00s6psuy363?=
 =?us-ascii?Q?9W5sm048HUhioMWapmceGsPtBH7+uqIJ0mdGZjuxH+gyBu9Ecyg5qLfsSe+9?=
 =?us-ascii?Q?s0CsD0xxdJoRe6t6JN8gh684xjBYQkI9KTR6R6LfN/ObCCaBbGtOvE9zKz2W?=
 =?us-ascii?Q?27LNEDDcT/M3bgnJ/5VfpM29c4rWFl03PJDkvdTFe+HScAxZO/IMDKE5bL0z?=
 =?us-ascii?Q?tNt+/R2ZUVQkERmmqrxoNr1+NuOaRSqQKIytFrnvKytcPdy8VLVApFZelDgM?=
 =?us-ascii?Q?48rYSJWURleSrQYoyPLZ3LlbdEpfqDg+Vh+iUMTE/OkDx2+z7rAAa3ufdr/P?=
 =?us-ascii?Q?uQ/u8pARD4ZQXi08pA84ceYGFUsT3MV2C/zUqEq2Fln2lJgUzcrN15DVorFG?=
 =?us-ascii?Q?4tPpQk2GsbxVUK2KyDUaVh6zdEF9Se05VhuwyTP/N5xksBybizQ8HmXsazx4?=
 =?us-ascii?Q?7HlLo+LggvG2Qu+OeoJOLfb68/uf7If9fsJKR3/fFof8FEjGHfjKfPsrs+uW?=
 =?us-ascii?Q?z8VTarxzM2wMByt4/FtVLDKqda/B2QcOClaBDH4ys5j5CBrOnURjcsLnROfO?=
 =?us-ascii?Q?sa9APs6S++xkujWnSyZdKIPh/p/b52OuhWyAV+mrfkPsXhOP6tXlHtwpQJ+w?=
 =?us-ascii?Q?AxZrganSepTLyJ5mkQZ2bOM4TOllM7ZQZohGbnSZQFUSF7Ki11u83PliLzN7?=
 =?us-ascii?Q?5CaREGIzytEHN7iZo8OJA6oxI51rGVfHoZnputyjZ8VJf75geiuk69rwcaT9?=
 =?us-ascii?Q?CinWQngsqC+0v9jTfnQrv7txqtstJuT+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?d3zJi/UXEABoLsXt14fiooM6eOGAW6u8nzB3CjoMGIwqxMOL+P/7UD4ymV9f?=
 =?us-ascii?Q?qL1mUKpOShOD2qooE4H42u1wpjjPMV7goZmW5Jmp0F8oOTaWOfXtaDbXGCne?=
 =?us-ascii?Q?K6supaozpwxBmX39K/jOKi8BmjnIYBW3RgV01dHzgUg2tB1o8Lc4q1OFuVGB?=
 =?us-ascii?Q?BuX6edyBmXI35m1kU5V2bShZ9drwPqMOGSEJhRftkz3deTWwTtX69jS4TJxT?=
 =?us-ascii?Q?UpH0GT8rJpu/9VD7WVqwi3Z8qpbsc5jtMybBEmyFXP2kapstIbScaoCr3ELX?=
 =?us-ascii?Q?thtG5l2zi5h6JjnqWKhBLFKJp2wd3aHF6hTcCODynttYeyvwYnAxor6cJKXO?=
 =?us-ascii?Q?3h0m9zO9Gj9eOrP5vVcM65YD5RbFKoxUD6bG5aQPxOoZ9UrpeP4aA35hwjqm?=
 =?us-ascii?Q?UFPWUQi4txN7Z86fJuel6ecnRDfYsfDAq99WAqr1vb11W+z4KpCyat+tq05c?=
 =?us-ascii?Q?y2nEsXHh3M0VawHIJ4O5kHBJkGa+a+NcKMhxhy+LFm9DDg0R9PXxFwY6q/Kk?=
 =?us-ascii?Q?1+XQhs9s2VnEKc62sOKTc8+WrogbGWX6NJLd0kr9DZO6BYL+iJ+BBawzKAnM?=
 =?us-ascii?Q?Gkc9YM+JV9El80aQrFoWvRVbelxy/G1PaAv7JFZByog8D7rgXf+Mn8WiyHVc?=
 =?us-ascii?Q?RFfPaarqxXrN9G1jb5RSHiPDvszJHSiBrQEfbhPOHxfCEirJwgTANXqsr+4K?=
 =?us-ascii?Q?YSsEyvJVn2yFvt7VixVCG5dJQnK8Hlg8XXYuNpukorzs/7zD5Bugdt0//NsA?=
 =?us-ascii?Q?Q3LBNkVAbKEffjz+GqgVFmWJmwgx3eHiz+zDDkj28e/xxEiKgDJRs2Lcz9EU?=
 =?us-ascii?Q?7QQcgGt+kLqL8dI8fHZ98HiXf4PW4pbSKzoqmZrmNrhAuE/p+QAYCvShDrkL?=
 =?us-ascii?Q?Ddp7tZo91Yc02U1X0KhzrYsJkGutsWAio5eR0TePqjhsapQdUhqzB74XZh0C?=
 =?us-ascii?Q?YNZg7fAqHjbdDmiVUPNY1FFhUqBRJLAANdff+6ittpR9P+spqPvNO4gjVoGL?=
 =?us-ascii?Q?yLFDo8fvuxMXAvwemcraEPd21NC9TT9GyGyHhXIQsMUkxnAe8TwvYVBzGa0/?=
 =?us-ascii?Q?+wY+R8/90Vf3An8qzO6aU9bAGnV1k7oVuj3zSlV/TCHzL+bmUL2xNO0BIXnt?=
 =?us-ascii?Q?pQWfTimgsVxrs5Xh7+w4OvmFX0BgN8ceUMVQHivJh8gR6XrZvlu3rbvxoT9E?=
 =?us-ascii?Q?Q4jU5MbhTanMTVhBDe09WrM9Iow25lgi78yff+meNrggP1u+bGvfksW6p3e3?=
 =?us-ascii?Q?aMl4QDxRGdckvwBElYLZm1aY4ZslFhE0KMnC0ZkGtbE2An82NIM8ZTFBE+Wc?=
 =?us-ascii?Q?bwmvktI3AD/NsG4uxg2Mpk8T4p4nHG8AHXpimYc7/+1EC2A65FNYAI5LGo0s?=
 =?us-ascii?Q?iNs6qgt81I2Sk8s88ON9LPQUbRPMGc5HOln4fXrIG+thOljCuckDlGnkZdcZ?=
 =?us-ascii?Q?3FF6nVpa07iHB//x5w2S4V5JXjVzmrQUc0L9xW+uZyY+c2y6iJzWMqvBym/Q?=
 =?us-ascii?Q?bUK3Z5OiI5AbOBeEsL916NMvnNzHzmrhp+WLvWV/ACs+H/de2YDknojEfC6D?=
 =?us-ascii?Q?9g4k3bDHrvpIzwCRgE64oN/ymiehUcXpLqbxbyQF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c2388ef9-0aa2-4356-c345-08ddd411f96b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 11:19:42.0203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXbV70u1tfBs16GwVC0/0fkcnmra/cxN95WCE6DAquOUgv64wMGCvpc+lD5XSDGZHUUcEbo9ir0Hg6DXvwxGpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6618
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 11:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221469

I have set out patch for this already yesterday
https://lists.openembedded.org/g/openembedded-core/message/221433
Is this somehow different from that?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of dchellam via
> lists.openembedded.org
> Sent: Tuesday, August 5, 2025 13:10
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][walnascar][PATCH 1/1] sqlite3: fix CVE-2025-6965
>=20
> From: Divya Chellam <divya.chellam@windriver.com>
>=20
> There exists a vulnerability in SQLite versions before 3.50.2 where the
> number of aggregate terms could exceed the number of columns available.
> This could lead to a memory corruption issue.
>=20
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2025-6965
>=20
> Upstream-patch:
> https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4=
b419
> 703
>=20
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  .../sqlite/sqlite3/CVE-2025-6965.patch        | 117 ++++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.pat=
ch
>=20
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
> b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
> new file mode 100644
> index 0000000000..42fb31ed5c
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
> @@ -0,0 +1,117 @@
> +From c52e9d97d485a3eb168e3f8f3674a7bc4b419703 Mon Sep 17 00:00:00 2001
> +From: drh <>
> +Date: Fri, 27 Jun 2025 19:02:21 +0000
> +Subject: [PATCH] Raise an error right away if the number of aggregate te=
rms in
> + a query exceeds the maximum number of columns.
> +
> +FossilOrigin-Name:
> 5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
> +
> +CVE: CVE-2025-6965
> +
> +Upstream-Status: Backport
> [https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc=
4b41
> 9703]
> +
> +Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> +---
> + sqlite3.c | 30 ++++++++++++++++++++++++++----
> + 1 file changed, 26 insertions(+), 4 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 146047d..c78f58b 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -15257,6 +15257,14 @@ typedef INT16_TYPE LogEst;
> + #define LARGEST_UINT64 (0xffffffff|(((u64)0xffffffff)<<32))
> + #define SMALLEST_INT64 (((i64)-1) - LARGEST_INT64)
> +
> ++/*
> ++** Macro SMXV(n) return the maximum value that can be held in variable =
n,
> ++** assuming n is a signed integer type.  UMXV(n) is similar for unsigne=
d
> ++** integer types.
> ++*/
> ++#define SMXV(n) ((((i64)1)<<(sizeof(n)*8-1))-1)
> ++#define UMXV(n) ((((i64)1)<<(sizeof(n)*8))-1)
> ++
> + /*
> + ** Round up a number to the next larger multiple of 8.  This is used
> + ** to force 8-byte alignment on 64-bit architectures.
> +@@ -19046,7 +19054,7 @@ struct AggInfo {
> +                           ** from source tables rather than from accumu=
lators */
> +   u8 useSortingIdx;       /* In direct mode, reference the sorting inde=
x rather
> +                           ** than the source table */
> +-  u16 nSortingColumn;     /* Number of columns in the sorting index */
> ++  u32 nSortingColumn;     /* Number of columns in the sorting index */
> +   int sortingIdx;         /* Cursor number of the sorting index */
> +   int sortingIdxPTab;     /* Cursor number of pseudo-table */
> +   int iFirstReg;          /* First register in range for aCol[] and aFu=
nc[] */
> +@@ -19055,8 +19063,8 @@ struct AggInfo {
> +     Table *pTab;             /* Source table */
> +     Expr *pCExpr;            /* The original expression */
> +     int iTable;              /* Cursor number of the source table */
> +-    i16 iColumn;             /* Column number within the source table *=
/
> +-    i16 iSorterColumn;       /* Column number in the sorting index */
> ++    int iColumn;             /* Column number within the source table *=
/
> ++    int iSorterColumn;       /* Column number in the sorting index */
> +   } *aCol;
> +   int nColumn;            /* Number of used entries in aCol[] */
> +   int nAccumulator;       /* Number of columns that show through to the=
 output.
> +@@ -116445,7 +116453,9 @@ static void findOrCreateAggInfoColumn(
> + ){
> +   struct AggInfo_col *pCol;
> +   int k;
> ++  int mxTerm =3D pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
> +
> ++  assert( mxTerm <=3D SMXV(i16) );
> +   assert( pAggInfo->iFirstReg=3D=3D0 );
> +   pCol =3D pAggInfo->aCol;
> +   for(k=3D0; k<pAggInfo->nColumn; k++, pCol++){
> +@@ -116463,6 +116473,10 @@ static void findOrCreateAggInfoColumn(
> +     assert( pParse->db->mallocFailed );
> +     return;
> +   }
> ++  if( k>mxTerm ){
> ++    sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
> ++    k =3D mxTerm;
> ++  }
> +   pCol =3D &pAggInfo->aCol[k];
> +   assert( ExprUseYTab(pExpr) );
> +   pCol->pTab =3D pExpr->y.pTab;
> +@@ -116496,6 +116510,7 @@ fix_up_expr:
> +   if( pExpr->op=3D=3DTK_COLUMN ){
> +     pExpr->op =3D TK_AGG_COLUMN;
> +   }
> ++  assert( k <=3D SMXV(pExpr->iAgg) );
> +   pExpr->iAgg =3D (i16)k;
> + }
> +
> +@@ -116580,13 +116595,19 @@ static int analyzeAggregate(Walker *pWalker,
> Expr *pExpr){
> +         ** function that is already in the pAggInfo structure
> +         */
> +         struct AggInfo_func *pItem =3D pAggInfo->aFunc;
> ++        int mxTerm =3D pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
> ++        assert( mxTerm <=3D SMXV(i16) );
> +         for(i=3D0; i<pAggInfo->nFunc; i++, pItem++){
> +           if( NEVER(pItem->pFExpr=3D=3DpExpr) ) break;
> +           if( sqlite3ExprCompare(0, pItem->pFExpr, pExpr, -1)=3D=3D0 ){
> +             break;
> +           }
> +         }
> +-        if( i>=3DpAggInfo->nFunc ){
> ++        if( i>mxTerm ){
> ++          sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTer=
m);
> ++          i =3D mxTerm;
> ++          assert( i<pAggInfo->nFunc );
> ++        }else if( i>=3DpAggInfo->nFunc ){
> +           /* pExpr is original.  Make a new entry in pAggInfo->aFunc[]
> +           */
> +           u8 enc =3D ENC(pParse->db);
> +@@ -116640,6 +116661,7 @@ static int analyzeAggregate(Walker *pWalker, E=
xpr
> *pExpr){
> +         */
> +         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
> +         ExprSetVVAProperty(pExpr, EP_NoReduce);
> ++        assert( i <=3D SMXV(pExpr->iAgg) );
> +         pExpr->iAgg =3D (i16)i;
> +         pExpr->pAggInfo =3D pAggInfo;
> +         return WRC_Prune;
> +--
> +2.40.0
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes=
-
> support/sqlite/sqlite3_3.48.0.bb
> index 11f103dddc..6c9f1ed5d9 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed0
>  SRC_URI =3D "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar=
.gz \
>      file://CVE-2025-3277.patch \
>      file://CVE-2025-29088.patch \
> +    file://CVE-2025-6965.patch \
>  "
>  SRC_URI[sha256sum] =3D
> "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
>=20
> --
> 2.40.0


