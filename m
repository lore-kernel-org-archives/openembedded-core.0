Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C328DC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 17:00:16 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.12])
 by mx.groups.io with SMTP id smtpd.web10.93210.1754067611943772656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=o7X5dZ3E;
 spf=pass (domain: siemens.com, ip: 52.101.83.12, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0F6GTAalWodFkYDGe5Nc1wW3BTlFRs8eeHkEw6t1aR5Ykz2EDs+92CeNlQ+mcO02Do3EthI8RnAvQZ/DkflJPFzezEt8L/GR+EW0gobJCvUVVYD2v8diBSETWaNfUvbcatrdVLTNDc3B/0PRly5qObN+uZCigA1pzJQF68KyDBPa9gb0viKvuWj8nzEpUc5bRKU0AR1z4UzPlsu2xEGVGz/CDFxj9/UOzrrY64XJLoPKfwZJIgxH/s6uz1GwQn0R2nAOUlD4e5jspKWsYvUJt2iH+8UVX0UX0QzBBQmOSYSqn7sYbyUzk3m7bwdLNYextZgm2dWySQNj35fwv4o/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmCJgld8VSCfCPT27gQ9eVwRH9vFHxF8gk55aY7dU80=;
 b=WI4ET4WG8sl1+H7s2M2ZiLKeWM5Zohg2y0laSNg1EE5wb9I8+vCYMHzoS1R8I5l25NwDjU4mDPol9GWaPeYct54MRcmoCnWldw2fEvgILUpQAB89GxbSLQuW7Pqs8VzfdWFcg/8E+7P0C/PvR7bwxnhkBMT1Fb8GRD8Az2ZL9a4QGRmfoxkHgXqX3qkmYZFluWe9BEq7j0eMJUkXD3OBldBpeZJVpZtQokk63w1b9s1s7jTHb918RVISEdlgBNlmQNYYA0BstcGyvLhWUSQBKIaEokqXnqFObw6aHPoON1e+5FZtztvxUDMLmz8RGqmy7ncJspnL1Y23ZuLa2xTzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmCJgld8VSCfCPT27gQ9eVwRH9vFHxF8gk55aY7dU80=;
 b=o7X5dZ3EEfWvZSq/y1O2QtUnspfZ6N46zR5RjxY0Nw7PljoaA8HSJdb2ku2XjdLJ+5EZWJwOnskcjZlr5SjYtd7romYegHTTz2gDBYxZbxPdcmvpYKHZdGp8zyFEdHLwL4PfiWP2iRzzzjM7XAp76ia2IZK1ReHe8+8ILaBL2fiPC6NmdusNXErdYSI/1z7HMKb+609zQeHkG5Y0dOH7PypF5TaItLa66ac0GCfnSEqnofyEfa5HtLSPYdbPgC+RLLtFdEtDRKvSeAMq8sKRnlKmbnvfX0IPgWonEJbPCkee/AJ1SVI4vngJRQwDtMEzoWdsAvJKkg5uQrqMMYvsJA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3578.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 17:00:06 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8964.024; Fri, 1 Aug 2025
 17:00:06 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][walnascar][PATCH] glibc: stable 2.35 branch updates
Thread-Topic: [OE-core][walnascar][PATCH] glibc: stable 2.35 branch updates
Thread-Index: AQHcAZ7Kk63ffeFjG0mPW55Mkz3M2LROB9vA
Date: Fri, 1 Aug 2025 17:00:06 +0000
Message-ID: 
 <AS1PR10MB5697CE960A0CD91BA2192624FD26A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250730220952.14457-1-peter.marko@siemens.com>
In-Reply-To: <20250730220952.14457-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4fe587fd-38f5-48bb-87f7-39e8bd28825a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-01T16:58:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3578:EE_
x-ms-office365-filtering-correlation-id: 534c6a19-395a-4e1e-9faf-08ddd11cdd86
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+49unSYqOmaRZFcyK4RViJis4rWeiMjZ8byv4xjpo+3UyRXOyeiNx1/ra3Q/?=
 =?us-ascii?Q?e8F2NyJK6vsCL9JIhHRK64hL7OIvZ/B956Yp9F3N2Sis9C9Plclmmk2S6fbd?=
 =?us-ascii?Q?OeGW6bJJCJjvIUoNZIi7Zt52Et4gw4L54UUDAz9ZOI3n23HT3Ul4d27AYUaz?=
 =?us-ascii?Q?kGDOr3JyVoM2bqz/1fY1NpVneYudRs1ZvV0bqz9iZQ4Rx9A8Ks2JBPr2ZNP3?=
 =?us-ascii?Q?6Z/Zyw7v1fDl8/mncopL2DjN9peEolhmYtxfkzlsmyLEAw6WA4fwaMjmrS1Z?=
 =?us-ascii?Q?vG/3Xy4IpHHsvyO9RW6VOHBpzWLCRW7IRMTM+PViJjzuIz417QhKD31EUMxA?=
 =?us-ascii?Q?er4NSgQoyK8eZS5tvvU0SL65gIFp1WlMEsS4gd8JcA5XzpKnIAmQy1CcKsX7?=
 =?us-ascii?Q?TLtDUE4q91RiYLdI1joAaJV3D9oDreOngm6Mbbv93OT40Cknc1GpmGwtEUP5?=
 =?us-ascii?Q?ogb3b8c6Q+aUi5b/rmWleq0GAbDCsn6N4oVwBEdZ0JyAqx2bGgkARJoyWErx?=
 =?us-ascii?Q?tPhoYS3IuGzd0unZkFi0k5eTGYeyQ5t2qR+bY7wQ1/OYk/8DMNNAxVK5kInS?=
 =?us-ascii?Q?8OFkGZsKTdql7/+GlAlYpIw32odEIWT7EHsE6HjF3yc9ALJvK3ZYG88tz4AA?=
 =?us-ascii?Q?shJO4CstT2ch5xrmWupXw9DSI3673Vt89sUy2MmYMns2EF++BHKxg5hKZTFX?=
 =?us-ascii?Q?mkXz6UgfEYpvjO6TTSjqu0XBxFznvvgk4nCGKZg4aMK5c1mEpoQEYDc8rNCh?=
 =?us-ascii?Q?LUTYYXUDtrMAXcBl4IVtuglSqJMCnQ30yxINy93CvVKfC8eMdfRtv+GKYFPv?=
 =?us-ascii?Q?wixYRjyEzHt40if47cAoZ9tPSbpQKMqSZ38NRA4lAAO6Vhm/EpdcC/7R1PQQ?=
 =?us-ascii?Q?vt1bWNdEHsRFhPeDsQ2ZXfmbskPfp5JbYbc/gs6WaG/cEpJHPwqqKMSlZ3IC?=
 =?us-ascii?Q?i6HNx4eQVgegyQFk4GOL93XTW5rZruxcvG9mZIsTkUvCD79rhR3vXwJTXcYV?=
 =?us-ascii?Q?xvYV8DN6MXhXrA6s6B5qySF3PX9Gm8C9dJ+CYiIg+mlI91KtA5xtk12xECas?=
 =?us-ascii?Q?O37s6XIH4zQ42QZsMGrYDg5/ImeeMsN9YaDes4gVgaNIDO5wLjykg61UxaBk?=
 =?us-ascii?Q?r0m2+GY2DQQtx6/94u2thojMVfKuQ+8fdWribJryl21IrV/4xjoZCC06o5lX?=
 =?us-ascii?Q?QI/o4D4qgxTtIm6zHABh6nmANnd3dw7uVwAjlFm6zxXD8HvzzFZsOzCspQ0T?=
 =?us-ascii?Q?9ukmnVKh8FlliR8JYiNT+X6VborqI002msp//F44dSbMNi93kUKOiBINW6Pb?=
 =?us-ascii?Q?m/qKw5Yko+O3KKqsNVZZ61N/3yXrPSmlDg+rPijdakzAsdv1fdLDVGymVhgh?=
 =?us-ascii?Q?3xgE2P2Uc0iumEAl0tpigGdMHiHmwNidHUJI8oiB29noyp1/MnRyNg7Vg+7u?=
 =?us-ascii?Q?zscAgfay6qBfAU1H5zm1vLTaFJvP8W/paZ2rdR/h5guZOWNZmeH4tw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xDBmFYWlQVtC11wZg4CM1mcQ96R1kltzrXTGQzijW0qILU7Au+508nrNX6vg?=
 =?us-ascii?Q?nwIsU1h8OyvJizjPvsEwl6k1GcztSd8Caf8RgBGaVoq0Dje9KxBF7dbPLN7x?=
 =?us-ascii?Q?gIkvWkiTicrdR1pBuq/BjyDBZe9drobdb4waacZBB+Fx/bkL+Lo5q1tsbVg6?=
 =?us-ascii?Q?mV/nw7LhjYemM9G2+KK3DbFN8uocxjQZObo50CZVTK4vMIG2DsO/Apnx/nj8?=
 =?us-ascii?Q?fW4dQcN7IXO3J7P71ysG/fIfhD4N7ifdLMosgcXJeTSLqACAWLyUck9SqDxT?=
 =?us-ascii?Q?w4KdAsdgF848XKQI6mysYvtYUz1hpKm4jT/BFTl3Bft09FK9UActfGvy9kCF?=
 =?us-ascii?Q?gZ9QP0IL5PdqXcrz8h1w7dAAaxwmuUGYeklJ5bqAjmsicfdvyc3ixecaA4Kg?=
 =?us-ascii?Q?+ENUcXD96qmhywVv0ThS5VsPva0Bah4GGs01oYo+uLgC2qg1AY/CCopLU51r?=
 =?us-ascii?Q?1IXjK1+TCqHZUsjaSzoVU8NIqnueskBuN2RFSUtHtfJbmWESYOdmEo+IYAc5?=
 =?us-ascii?Q?5iuof5wGL4VjEQspNDBcsGw/B5ObSkYzcX/V6WQH5O50gUo1YtRY8y0r9h0+?=
 =?us-ascii?Q?LSc2QHGjCvXT1rS2yccVvaquCn8nP+391x4dM7sFB2uShBbP3jpGLGxfFHAL?=
 =?us-ascii?Q?oLD5aVwEjHsxeSmST6L7P6JlmWTDc1fjKtVD/BSN7cV3bhOnPYEOr8YkUEqj?=
 =?us-ascii?Q?yycbitcznj1Yv5kLVamz02q4YUoHjFGsGuZutlvRSe32SfAhw/hKIpgFxAYc?=
 =?us-ascii?Q?W5RSbImj+fS1mwBrKAT6myyX2q/VDBVLul8avJgIXTLWa8Kpo4PMdDEkkwy1?=
 =?us-ascii?Q?iwN9HJKobZ5S1nUaNVTmCY88rn8GBqYg0XqVdm6Apf+D6CBOTFUG51mOq2Vk?=
 =?us-ascii?Q?Vjzc3iBsJ6IBafftbd8qz7mmIjGTBRtrO7m+ybimq8P+u46m3dbp4g03ieH1?=
 =?us-ascii?Q?pI5VXVUKiYR2GMIjus3QGaBm53SF7qfhr1BiiCotH8xUdokQTP2wCl8Lk7yr?=
 =?us-ascii?Q?OZLlOj9T1GtuG2/9LCvvMEwYFahFOF9zzHb0WVpzQlNTFgONoBkgFWdpPdKs?=
 =?us-ascii?Q?VoipSy/VpbayHymvGbDuo99CvuZKs75+YuOjltsWxuTiSR0Dt9s/ZnU1fDCZ?=
 =?us-ascii?Q?W4P2OiE/y3oOOm3IGI8VQoHjQ69Xg4YlbMRQU2sZUkoLM0GGiosL22VFI9uV?=
 =?us-ascii?Q?UQ0VmPodTbcVoFKBhbVwzne2jKoYPnZL0LzVoyPuS2Nbmcpg8jmL5F5T6JAX?=
 =?us-ascii?Q?J1QaYbm+0j283uBFMfirNHAUSf7HzoqCqontAgMN8GS4nMF2PpGI9/IdUiah?=
 =?us-ascii?Q?ZSDWaaPGg7LIUljs3yPQloRwSWuGILvDHkR14x+NZUFL+pgn0wMVXAQcTMWf?=
 =?us-ascii?Q?jwxUWUmKkPGLHcE2eaM55mmVBEgUSXBpRjpoeP5IkF3DwyvvxO/nBqiHZYAr?=
 =?us-ascii?Q?pQEeYdkxpyNVe/YJ977kIlR5XB2OwQ60st05WA0MV+wUcx/rLppDzDopua8s?=
 =?us-ascii?Q?vy8YfyyZCFtTH9FOj7kSuiTaFxazAC+5FW8ygY7czuifeWiNcs7m+kTAgS8p?=
 =?us-ascii?Q?5d6p4ulvyf+F5oakkL4DxEuqJhoHOJg3z90fWfFP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 534c6a19-395a-4e1e-9faf-08ddd11cdd86
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 17:00:06.2303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FI6TWkuOCbKsKPUg34YSo86OURXd86XcRaHxOmCH/7wMSk/bbtAT3aLQMp7zoORpKTlpDRWhlUZsJELxJJo6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 17:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221370

Steve,

Could you please amend the commit title from 2.35 to 2.41?
Or do I need to resend?

Thanks,
  Peter

-----Original Message-----
From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Thursday, July 31, 2025 0:10
To: openembedded-core@lists.openembedded.org
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] glibc: stable 2.35 branch updates

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 6e489c17f827317bcf8544efefa65f13b5a079dc..e7c419a295759=
0fb657900fc92a89708f41abd9d
e7c419a295 (origin/release/2.41/master, release/2.41/master) iconv: iconv -=
o should not create executable files (bug 33164)
1e16d0096d posix: Fix double-free after allocation failure in regcomp (bug =
33185)

Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commit.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.41.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index a2cfd0f308..881a9cce2c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.41/master"
 PV =3D "2.41+git"
-SRCREV_glibc ?=3D "6e489c17f827317bcf8544efefa65f13b5a079dc"
+SRCREV_glibc ?=3D "e7c419a2957590fb657900fc92a89708f41abd9d"
 SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glib=
c/glibc_2.41.bb
index 7ddf7f9127..8a65e8ce9f 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not =
an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
=20
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745=
"
+CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745=
 CVE-2025-8058"
 CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availabl=
e in used git hash"
=20
 DEPENDS +=3D "gperf-native bison-native"

