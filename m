Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B477EC88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 09:03:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16249.1789376604334886979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 02:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nIiGOM6o;
 spf=pass (domain: siemens.com, ip: 52.101.65.5, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeVklT3oSNP2WbbsKdNv9Hx4Pfz2BtkUsuAuLG1DxJPtwG0Wwov3YX0i+oXoNArcYlgVBL2Vw+UoidDbSVy70peJy7teeQFma7WSVSg8KdA+LFp6pu5NzS7Y/9Chs6BI8y704GMiTnJQvzwbIQkOwF9xM/ZOZTyrnO3ujbIl3lWD0rbiCXpN1u3ec28UVdzpJBwebfnCwEdZ/xViI3FBM3uHVbYigRN4DQZ6I+TWCNLgzuPVEdK/ldpCr73vEtj9foilaeF+c9z09H5XOIIp+bhJsTqqifWj7kgW+G8gui4WKCPT6GmBwRcnPcd+oweoF+U8tqEI1qRWI1kLyobxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q9j2gkRJgivGUgPoKXscGD7TEIoCGE7xw3RiwbUxfA=;
 b=MpnTbbpIAcMhW4TqUz7WK9HhhD7Pem8rme9Iw5OsFrU7OOZN/xt3I59wbV7GBMOugLH1zTVTr/HgJTxx2fJWyoFVxIlrfzAEOS54j1hoZIb/D5czn0+FHELHVhgADpdNjswtsXYAgzaMfeBhL1XpGUOzbavw+1VGGe8bPRa1jRc+Fb1S//ze00wSIXg5TvdwnCTh4M8E1O+K/Wp0+A6leBVWTdKgWE3V06pejoLVY82j/NRmLtDuZAQq9fIKP//TzPQEyZktrwLzTyHpPjKIqTEl67W4kKuPVUcpZRrFbJYNwE6qn/D9ECpeR4rfwSbLG0hl3uHbW3xxmGC0+mrbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q9j2gkRJgivGUgPoKXscGD7TEIoCGE7xw3RiwbUxfA=;
 b=nIiGOM6obrVB2cMgDyzyhvcsIGrbJvbw7TqvlPpiXHk82gwIzdttfquldszNscmAVnTGncjf4KJ6lw60291pFtP7LkYGNnZXVagOigCOR/rfN0U/cLks/oTDKvjbUWW7Y+awf4e1GJJLZgKJZ7G6fb3EVJ4/AjdyOLcY6jC4NqWZIKblI7KZ6b88iyU0x7dBw1QYFP25Qkrixobeos+FvPoNTQb50WsuK/QgKaXEHs0I3srMsBJ8IDuO7J2bl3Ju7E9xmpiWqFTsy11eS2jZ+KtODih1LqBHINAllpV1ZaXfDjP2NQAwjgt3oue1VfpgoccqiHp1CMWJU/v8G9gA9g==
Received: from AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:144::19)
 by VI0PR10MB8866.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:03:20 +0000
Received: from AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8a06:addd:5bcd:c7b8]) by AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8a06:addd:5bcd:c7b8%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 09:03:20 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH v2] testimage: avoid symlinking
 missing qemu boot log
Thread-Topic: [OE-core] [scarthgap][PATCH v2] testimage: avoid symlinking
 missing qemu boot log
Thread-Index: AQHdPvnmIk2nALrdMUyTWDRvnfonWbbJVWOAgAR6yaA=
Date: Mon, 14 Sep 2026 09:03:20 +0000
Message-ID: 
 <AM0PR10MB3570E8E68B19FAFE5DBD942BDBBB2@AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM>
References: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
 <20260907185127.493115-1-peter.tatrai.ext@siemens.com>
 <DLCHN8AZBSON.6FA3PJWOP4EM@smile.fr>
In-Reply-To: <DLCHN8AZBSON.6FA3PJWOP4EM@smile.fr>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6ec53bdd-9802-4b42-bad1-2456d7e7a7c2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-14T08:57:25Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR10MB3570:EE_|VI0PR10MB8866:EE_
x-ms-office365-filtering-correlation-id: 2efdd9d7-f913-4fb3-36e3-08df123f060c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|55112099003|22082099003|18002099003|38070700021|11063799006|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info: 
 sQd+LhQOjxqKWQ5SShbZJr83GTu6485rIfgMDP3JfLz7Bl+VOctd/XQ0FlklfwcBTOJGxpRMUak7huj0RTjBsEo1InO5XaT1+wTJ0yty/3fvLpofgQj5UwhNDMFZWesX1VV5iSIiM0QCgai3GazmLmHLzl0viEv85I/OTy7SEQpeB09kO8dmHS4xjPMXANX7s1J1Dxyl5fRRs7Tn3ap0eg0+NHnc2S70XbFt9Or3+PUq9+OGg27WPxg/OPRntzGx9qlk9jyYdBVnLj3brdnOd2LYBW4yO8qVwJ0KULo+pmtojPHzueYq8StJigbGi98+5naJ/er/Ot2YouyIscUKFQyfo2n136h2L6Q9o8+MeTGftIFS1e1B1u9CpBGFtlDyOkJhZQS/oNqpGihN/G33ScYH2eFjem/e73TWYfkscZjQ9KFZneg24qqwti5ZwSnSJYRN/dnxLmAsaFBNomOrZZZ8xlLms+VrpuoxiRekoHJOo4fA4GeFB96zMupMOC0t4OVAw80w1OlXxoc7b5y5E40Kk21Vm2HFhockXH19CvTR9aAR5hTgG6eAPdZq4hLuUK4APJ62NcDKBiinRx0w8LdMMCnRaNajYO9L0Ddnqz6MZPj1K9rKVKbA1UPuf4BY76bz4uVr7ye7tqKf25RUyssopCIBFXWo9tY5mB0PLZF84c4M6sMqJs82UzSQZul3tcYEUNMfSsiw0c6WjpARjEb+nFh1eFVpr4aINIQNDKw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(55112099003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Q5MznW8meyOKOnnpM6KI6NlWxUeYoZLLYdVbsdj9UzM7Rap2DOxtozOcYjBz?=
 =?us-ascii?Q?VajP57fLCzE7ExHc951xKhq6v9bByRgnfgOTiYJVLpv3ckVKwSedDxOc5qps?=
 =?us-ascii?Q?HgLiGY0LXrAdrLErKCHHQOjhZWw0tcx5jmqvHAL5a/UhaOhsDGHiNaAWjJV+?=
 =?us-ascii?Q?VLsMAdjUqaRPAzl+dPnafWFnMaBBUCMj97tmHmDa/aw2dJ6/bNF5U3RYKki6?=
 =?us-ascii?Q?hS1AgNkNmXHsIMd9QFCdbRYiMJdP/Re4Ti0xxPLVjFrenrbGyeb3qNFOFMIC?=
 =?us-ascii?Q?K/xX/tcoxFsErpIy3YUzoNa/y86ns0IRtkRiIK7HbBByYgX3LZmYcltSHfKC?=
 =?us-ascii?Q?Bt/dotVmtnT9dptP8Wsaan0Z/C5AIHzsyR+uIbIaRK9TETckjEF8kOZqBnfM?=
 =?us-ascii?Q?CHpoogae2QO4im+/Qia4q0vRRnSY9o5Lt0PSsOKiI7IP2IUK4jB45BljjQXW?=
 =?us-ascii?Q?U7jhei9sdA0LzfsWoa6bWjWj/yrFBWhe6E0ZfL9/AmuNAw5YXKnx85zxhG1W?=
 =?us-ascii?Q?4O1Q+rJVXlCYAG4nEgE64+r/JpP7BKepoYccELmePO7xPoAabvmclhKcFSYx?=
 =?us-ascii?Q?6mQfoNd9OR9BEphvg8PV8Z/LIy/Bx/etWmh88ntXcPMKH2MCS8PFHBKa3RSl?=
 =?us-ascii?Q?J2huAw+VmangU9AKfe3dWJI/gzPnKs0NVhlxExFHdqw0LvT/nE/XEiBLiT38?=
 =?us-ascii?Q?UjVHFRFphaECEXMWy3cf0tKzov3qS9XVAtQRvq5ILqTQsn8RbB7vtzfyBtkI?=
 =?us-ascii?Q?iGtV/L4fdg+PzEunwm3UCob2QnoyhSnKPF3munaFphRg+QRIskoDQ3Qc9gyK?=
 =?us-ascii?Q?msqZT9hzTXYqxgzO5N+kLykD/JLBvsatBTYQ1OeEnQRGlnntCkS7+JT/QNOE?=
 =?us-ascii?Q?nelg2TDbzsz5UBSfJWKkcl+Fpf8p6ybH48purWQ9QuboO0yZCEdgOE5l0A7e?=
 =?us-ascii?Q?a7x8HFTrtu6uVpE/+SCWFbrCL9S+FoixQ7L+Rjr+Atg2sEZj1SNZQcXCtGnw?=
 =?us-ascii?Q?CRhLa2SJ9ckIk2VtUyVAo0osQXG/NMStSWg5ZiZFpplLlDGNfGxM96NIUG6+?=
 =?us-ascii?Q?QeW8TEr8W1daY8bpPgcGnVb9vjwNPwbJoeaBmKC4cw+/3U8HWL7fs7mFzE9B?=
 =?us-ascii?Q?hFwBPhRlvTy8gE7xDB8z0wGxuuXmlBq6qdR9uQOD4ROkHd8FRUhfVDlXlmop?=
 =?us-ascii?Q?KOHsIv/AZQ7tw65VCY24skMJsXUxKO/mIEBnVBcwCOGJd3njeSv9YxxerUyO?=
 =?us-ascii?Q?R2b6fSlHz3MGoC+5rMeKDkNPAvVTVA729zU4/+98zQyIz+81QeCQQBww/aLD?=
 =?us-ascii?Q?sLca6tf4S3f6iWfKYUkGiKhTuPMT8wFSipYyrmTohNMYsvRI2r90vibZnaU0?=
 =?us-ascii?Q?l1Jh4rzBNsjsgwyjNuw4VGfcJWJTco5SmIneJ5Tcko/oBcdZ8xC5evE/PEpH?=
 =?us-ascii?Q?mHW83MPiVmtKVZxdtRnCuw+RgEJA4L5PZIF3/3ApvwE2ZWcMBi0mELruc6Iv?=
 =?us-ascii?Q?E92U/kW2gC51iz4xppje2qbggi33h5T01hcq/NdI1bFLo+o/6qGiAUVtX5mg?=
 =?us-ascii?Q?jflTTNB0HzKzIplLJaKbLfXJQyG0abwYnhARHKmu3Z+GIj+mLgT1dZONca3+?=
 =?us-ascii?Q?EmPw5g1SalRfhx8gjO3WNaxEMVMHmF3jNDrXwgY34GZDw6WDZr+MC0Ya5iji?=
 =?us-ascii?Q?KHkqBKGNZI4ksGGG2K3L9NxhIg4FJeEChMwb5NsoP4MvjEhxRGi13qEpnn+i?=
 =?us-ascii?Q?dBGjClaOMg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efdd9d7-f913-4fb3-36e3-08df123f060c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 09:03:20.3500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0335cuG4JAZgSBV6sIfSagCjjsgsDzbhbgV+JXhwknUnBQmAFTcE/m8ODaJxNz8xRQrLrCeHyaOk55CKLPJJeWm/zqsqb4uVi+KiI/outnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 09:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245760

Hello Yoann,

> Where does this FileNotFoundError happen in scarthgap?
> os.symlink() has no problem creating a symlink to a non existing file and=
 I don't see
> where we would open bootlog (we do open bootlog in wrynose/master though)=
. Are
> you sure we need this fix on scarthgap? Or maybe we need something else?

You are right, thanks for catching that.

In scarthgap this does not fail in os.symlink() itself: it creates a
dangling symlink when the base bootlog is missing. The FileNotFoundError
then happens later in our CI pipeline when collecting/copying the oeqa
log artifacts.

So, the issue is narrower than the v2 commit message says: the patch
avoids creating a misleading dangling bootlog symlink in the result log
directory. If that still sounds acceptable for scarthgap, I can send a
v3 with the commit message updated accordingly and without implying that
testimage itself raises FileNotFoundError.

Regards,
Peter


