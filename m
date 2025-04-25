Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B05C369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:15:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.48])
 by mx.groups.io with SMTP id smtpd.web10.1809.1745565341310760121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 00:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ksvp+uak;
 spf=pass (domain: siemens.com, ip: 52.101.65.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucbaFls0Ldlcwe2z00zvrOmakuKPGINk8fVBNqi7IOxwyjoLMimYcZ8mNAZqSqqByKF2JAnDML0thFr8E6mefkUifIFa8jD95BVvIjpG4jR+z+6thjaGoJrY087Yei3InTq23jjQDGQ/eb0ZO0pdJCGvRpaNGLqDTTVmqvSsfo+AfcEzRsWTXHjeUnYjXnjeknFpn1iJSEDqL50cmEwE52dV4y/dq8atdwq8kWKtvQUajkm591LQMyKv0uBIwVoLpdOi548Z+XN4vMPVa5HtgQewZ2A4c1pMuPwjzxDzDHj2cY5+ii5CTCI/2QdMMLaqqBsHWc9MyKTvq8Z8noBKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsfh8EoR5Vb3vNxwxyAK0E51mAbfuFyBh7GQjIvKmn8=;
 b=cwtcTTdaoHe5UbIfrVoUYUt6JUUz966PWLxzN/4XXt37LuVT72YpkFPxExYvFt2fP9W+GW149Iws00onHcymrEQMJP/ClOEaVEPO5v8yAb6I9l4dGznfCFfOQ0bstNCsYWLzgCiF1ZZIrVGa9A8I5VF5KvwdkaCjjaCgY7Utgcm/c4GZxeGmUgncZRFilWvHW7g6F5Xj/Gw6kbo+/c8NS32UllasXcSCCKCeXXJTHALtLXF5MsiV8g1qAnC4WZy3BaPlqtdoINMMb5rmLl+PdsHue9B1T5TEdvf7RKr7btLN8VmrN132RLBrdGaWObR2aShRXBgezxzUsOScwgnDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsfh8EoR5Vb3vNxwxyAK0E51mAbfuFyBh7GQjIvKmn8=;
 b=Ksvp+uakJ0E1do+BgQsUkcW+WXkVRkSREWCxJkkW45WVYxIUjlcuoG5u5meDLclOkI7mP8oW/9MW/yEMlV47xtHoPxkEYlvdrEAztcgeKEcDKHQqLfIuyeUUEiD4J69ao1KUZ89NLk1je1IgnARW+bPP6vAJuiYcUO57LUZ5AMAgMgoZFnkS9WGBvuozjleVrkigdy9sFZAiVCGDpbmHLXoBWxI1eHxcfSZDZa1x0CvMFvOiL7HtzuNkqwq4+GAfADBIjZLM7vrq6uXlqyMtexpg8ifpFqH8PcY8jQYJi/GvTgJb9zkgF7LiL/ioxG1UOJa3Z6ZxDa8vyvyoyVB+GQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 07:15:37 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 07:15:37 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] wget: use libpcre2
Thread-Topic: [OE-core] [PATCH] wget: use libpcre2
Thread-Index: AQHbtSnpXJt4vS23pkC0Dvpt383k0rOz+GgA
Date: Fri, 25 Apr 2025 07:15:37 +0000
Message-ID: 
 <AS1PR10MB569732ABE0E8E4E01B69728EFD842@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250424150148.1749041-1-ross.burton@arm.com>
In-Reply-To: <20250424150148.1749041-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=342261cd-cb85-4629-ad0a-f9d0130354ec;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-04-25T07:12:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6308:EE_
x-ms-office365-filtering-correlation-id: a9a4126c-65a1-4aab-3153-08dd83c8fa91
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Ti0X23Wue8X5zxTUOvSe+mUO0/cXBLKfx2czut/+mW8Z0zmyghVOgh33gjul?=
 =?us-ascii?Q?/xrpBWgg5xYNjwN7OjmEAs3eKAaf8TNf4F3IzGJZo1PGT+cKhAABDQkdeAPU?=
 =?us-ascii?Q?ggSKzEHj+6bh5SQbd96l2HW6RRxRGn66noB551Cw2FD0zngS3RrTy744mZ6z?=
 =?us-ascii?Q?ovwoSO5RuWxRen7lzO7PkS/9pSMtJ/tbI4wLrposr4PGua47WV97c1f5UmYG?=
 =?us-ascii?Q?gyuITQ9oZMQmn4dFUvgNIPKZ/yYRwwDd+h1ET8JShnBGDZsBH2Fb9v8RFZSi?=
 =?us-ascii?Q?Su6o7k2vq2sE2A0zGCZGiJJZGqPXR6xEIiUs0S+xGadr5c/qRcyEAgQr4o54?=
 =?us-ascii?Q?hmKmuUqJxyQV3Pv2STsIjWGnoAWAbRXJ6aososM4n7gx6sMB3b55aiMsCeTK?=
 =?us-ascii?Q?qBUBLcHOlwgD/K2PhZrL/IpjxzyP8E55oIsDR+7Cpv2SduMeKRZbhS1NkPCm?=
 =?us-ascii?Q?Bjq7BCqWV/uqN/UI24QFWZrKLqmhJGzxTO9C8kE6icoo7mx0aKm/C/AXZg1m?=
 =?us-ascii?Q?T7q6mthvXEgQF6Uh3Ws8BN695mfvVUVFDVYDiODSEEMEZ13LnqIIGN33fsaK?=
 =?us-ascii?Q?rujFWODnCSHRsBXn9ROK6JCzFVGlqhsC7Zcg1MY+ZOeDS/dzt8ZiwcD9mpWI?=
 =?us-ascii?Q?fUH+vPvD9TC0yCJNoBiwA0lwv4oZ38/A1AFwvA1F6dp+LKunpizAsv5aD/lY?=
 =?us-ascii?Q?3hyceW1ZZ3T6qJ0Qcn0ZpAGfQjRXvVWLEiWuNClNFZW25JZzeoA+BNIjgnPw?=
 =?us-ascii?Q?3E7Xd1IOy7IiPfxE35Fdbj19X9hmnESXpHf3a7t0J9d72ETFc+X45xRIYeH2?=
 =?us-ascii?Q?NDVvAGti8bd1N7TsktpCrpKo64zyJTOkH8tEbyRQ7z0XkLJj485DAteIr2KH?=
 =?us-ascii?Q?atIrxbFZLqDiSuTqbFJAP6XltiOC64/fSaK+isbk2Dv4VVkBqJ414pDgQZwX?=
 =?us-ascii?Q?NPU4O0EVIVWFkNiD7YCl1KxEOtj7UJ1Vl+FxOEXSVaKo9tl4LlbygyTYnTBe?=
 =?us-ascii?Q?+OXeojlH33e7C57tHE8ipngurNBT3r8H/HQZM1lBh9WKyuZZtzqY9Bf062V7?=
 =?us-ascii?Q?Hljqd3tX5Pj/V5QDLApw3QCgKXTMwhadLPNG8eYzQ9cusIQpSmlQ6yyhTnpr?=
 =?us-ascii?Q?SINyCn5Wx/pHnASKUNyguQ5BFIQcDx8BKpHQSK4TQDaLNfdFmnWzCeWIWHFu?=
 =?us-ascii?Q?ym2yaYEUsrABGJ8a7CIf2Wy2cG5Q2rRFN9URws2U3xq4Zn0uLvpdGdl+It+k?=
 =?us-ascii?Q?UsgI12aUwW1sdi1580sh4TKyPERe95B4B9s7EVsWy7BNk2Pq91fpXmQrg/c8?=
 =?us-ascii?Q?aefwnN1BKaHaCpePaOA38cr4oM+fnFuztm1K/opIfT2//5o4ciT9CzZVXOui?=
 =?us-ascii?Q?FYE5xUav7NSJDmVE/9wfs+UKdhncfpdzwom8LZwB2Y6bjQ7zIwDmLYt2M7Jq?=
 =?us-ascii?Q?Z8snMZWK419jQ3K82dwb+B2dXvevI4WfErghbsUB11U/c9b24zHIMlEH1LzM?=
 =?us-ascii?Q?157pKpOm55EuflI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?76J8Wyx7gG9e2FAbc6214XLbxX3He3/ePCtL+QojMekxNn1lz19I5pTMbIMV?=
 =?us-ascii?Q?WLb6Ox3Joyj5e6qH8syoU/OmkuZOrENh7iT3bseCip5Ba0Povf+clKXkGzo9?=
 =?us-ascii?Q?22TrDRAn3YPxujg74k2oO7+5E0sMX4efmXzrccmFqRzy7dV8X842JPN2R2fR?=
 =?us-ascii?Q?ESYlwxa9xu3OnFLDtZNFFpTZZOO+0adIGWAq7Ny8h/3fMwt2bGqSUZ/1zXZP?=
 =?us-ascii?Q?LbMpXaGGXq8xSdLWN67w6TfEa2oRCL/cW+pmOcd0SBILACovCTBBqwnu54vw?=
 =?us-ascii?Q?ks9AMIbIITEaBpS+UDG/AQ2uBjIO8LVG/iTHfageqIUhk1uh5kvVfHQVTBc+?=
 =?us-ascii?Q?egzTtfnU5izH9gaN9pgidGocwzPnyZkyE3WfvuCiw5KEl5VPmOZCgpljCc8x?=
 =?us-ascii?Q?aYkend1i+4g2FEQ6QN4uuUZMxNywtwwoKEvj7DNa4glZ1dyZ+xzsFd7z/0id?=
 =?us-ascii?Q?8mGdaV8+hPGHv48WFdErH3DKtBhDHOqpZ26W93vy3xfSW962ZeesFWckn9lX?=
 =?us-ascii?Q?VtGl4XC/qfm8CdwW9cUNqMBc3r9iIxeosPHUeJWEZGU03etsraHAPd+My1Hu?=
 =?us-ascii?Q?rQY+SVInLt0ZHfbOt3JPCtS3myRa1BmJgHWsCLyCdNqerGTdjJXL7XbZFN+a?=
 =?us-ascii?Q?bK8LqiDAXHeTv0XZMzwiKsjT5/u5vc0XRMEyW4Bd74VCtxdVVZkjijrbp4p1?=
 =?us-ascii?Q?rDvQAV+F7THHx5BInA2lDf3D9qD3o40oXz8qdv3IwcErtd9M4XIMx66KKMRJ?=
 =?us-ascii?Q?ihUOhPzWXdho0fzN4T1v/ZefOAi1L0NBm23RuWPPZ5bKdO3OqqP13j6M3uAj?=
 =?us-ascii?Q?h18e6X6RjYROMqlG5tcrpzvG63+dSvfxOV0n7hmZXnwHwcCvBmeLGMsXGa2V?=
 =?us-ascii?Q?juZEmQZN1flg2l2d0B0kCK+f8vsvsbjaTqsMgJq8Qk/82brp8C+1fDrSH3cU?=
 =?us-ascii?Q?HDvCtVahG8Dj+/JEsXBlzLzTYo9kTn2G9ihbYWxEGe4i10DxdP6GwomBnrIa?=
 =?us-ascii?Q?kHJlaLGnrpyExgdWfU3YScsreiHUavcU/H++OLz/+5PC2d5SqWpegH+GIP1k?=
 =?us-ascii?Q?0C8IElGiDCsn1voIMOxD1GeMLam6I5erz+I21pkBvcDv/i8LhzfZykv93HFJ?=
 =?us-ascii?Q?1cNZ4es7e0FP1h5y2bLLRqd3LJRa/zhTm02ehDJ647GJugYLr9gVDTL2u3SE?=
 =?us-ascii?Q?OXtC2jThy0l0Ks0bImRlmFHVdYzAEMifBAv3RsEocKsnt7BGR0APITxBBMTX?=
 =?us-ascii?Q?D7AIU19tMvtOwrDxhrPBYAl4GS8cyhKm+I2yno9Xnmuxxgm4Ek08f79WjtwG?=
 =?us-ascii?Q?IsKr5fRVDYb8DL4q+0FesFDngvFN+nZ5ZPGEFmTLMtbdAe2LYN1bYAfyR5de?=
 =?us-ascii?Q?2r3hxL8kIzFryM/xkYPPnR2bvrhW2bbjDOEvsaqUCaN3Xr2Lzi6Dvwmx6vhd?=
 =?us-ascii?Q?3ZVw7o/WUB6i28HZvu83lOAeqr5WsSlIb2zAavo3NASeNr5XhAqX0qQQLMX9?=
 =?us-ascii?Q?5lC/W7SzXu1IUYG1xy6GH4XC58BiRZBeY0i4uJ1T/ybs4hJSuX3JBhCpJpMc?=
 =?us-ascii?Q?7wJ+VXvDfiyfIICZ01TJuh0uM4CBN+3rCZS9eGHV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a4126c-65a1-4aab-3153-08dd83c8fa91
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 07:15:37.6931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxbV3BIzOn7E7rPHfFitZs1PVGYpSrn4t3Do15oegWgOtN37jyjSq6K05hLlT9sdK83Y+sN7zxUdtzRKbbc2xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215432

Shouldn't the pcre be explicitly disabled via EXTRA_OECONF?
Without that the configure may try to autodetect / search for it...

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton via
> lists.openembedded.org
> Sent: Thursday, April 24, 2025 17:02
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] wget: use libpcre2
>=20
> libpcre is obsolete and unmaintained, as wget supports libpcre2 now we
> should use that instead.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-extended/wget/wget.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-
> extended/wget/wget.inc
> index 151aeabcdce..d2f772e4090 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -36,5 +36,5 @@ PACKAGECONFIG[iri] =3D "--enable-iri,--disable-iri,libi=
dn2"
>  PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libpsl,libpsl"
>  PACKAGECONFIG[libuuid] =3D "--with-libuuid,--without-libuuid,util-linux"
>  PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
> -PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
> +PACKAGECONFIG[pcre] =3D "--enable-pcre2,--disable-pcre2,libpcre2"
>  PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
> --
> 2.43.0


