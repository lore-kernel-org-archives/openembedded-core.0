Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36631D42B82
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 13:47:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.87211.1731419233915977376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 05:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=lz7yPKDU;
 spf=pass (domain: siemens.com, ip: 40.107.21.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=couVFj4eKLRyKTokW/y+xjdFGSvzObDBkGhz2VKkobZ+f58yArq13xgY0GvMSgkDTpiD61bJv7F8Vra131cy8u6s28rUhpc1ia4fuPvpOyHPvXgJ4A+ZGaqXHjjpt+skPinUVvCaewmJT7A0Yky/0CX1xG56050zx7PukoqqUekMPfWz4RoH1ihwddNKHN64ys2B/Xj3WJMrYPALkaExbT8F73oHw1+p2DsDOkLYdfD2ODqlzyNeQ+7mOo0xog816dW7WsqTMKj8r5V3I85+lMmoY9foPnRhi+H4P9dDw46kYjGhxIc3WeG+TWdo/GHBiXLE7dsapCCMMiTFORRDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAs7HtfDYtLv3anunzfvC14A78LSLcbWRIfYcQH3mfw=;
 b=pQqFuPvEOWMXnhTzfe2HD/f7El9LW2xL6JZvWY16UOezLz+pHiS13QcT1LJoBAMqR+lBZQmm/EaSlUcmTyT/tLXPOC7Ym3ff2TxkUOOHLP6fpLnxI9x9rNM1bPSuSqSjkBtilYJI0F4q53Ht9l2EzJY07pB0f4jsoWKmyqhuDwQgyX+NkTxP9ME5zam7UdHkE32oAxV4J5hfCiEh/8tqZ7FmQ03RihIbwweSBk7F6N48TTyUnj9l3C88melnB0tKXifvm1WwocsK2UWBHCwIqZbAYvA+x9OQtijqs5HVdeSxs9cklU/+H8k14l9CC36BLjM+6tSvdC8qXZXPy3ebtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAs7HtfDYtLv3anunzfvC14A78LSLcbWRIfYcQH3mfw=;
 b=lz7yPKDUwfq5pI6/nMc5gYwt22XQhOXc5OVj7w7Pc8MpZF8Rsr47TCpnLBTpfE6+Ajy15aAL3UvUS5YX0uFQbenDKeLk6moWiooMReyGmQjKDgoDETzvQl40hu/JcPD/ldD0R+fT1Tq9FgvHAUAEomOS/pElPwRQAOCJ8tl7aGm+Yxbn04aCY/LekqlCs95MIXKv1XYx7Kla3ql3v0o1xfA2VT6hkjLUvVJr3Z/D4o2+Gb4b4JNtdSfoN6myIUDtfI2qHK758YEwGj3PwXznIC2GC9I7X4HRuWOehLqWVcyiYbcIO5GrZTMIXaIl7R+ihbFsV1sJi/GbQ12Ik12f4Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA2PR10MB8394.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.15; Tue, 12 Nov
 2024 13:47:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 13:47:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] curl: Fix for CVE-2024-9681
Thread-Topic: [OE-core][kirkstone][PATCH] curl: Fix for CVE-2024-9681
Thread-Index: AQHbNQeCuiRaJLQRrkim+pli6XoTELKzqHTA
Date: Tue, 12 Nov 2024 13:47:08 +0000
Message-ID: 
 <AS1PR10MB56972FC07BDF7F76588523B5FD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241112133330.2828105-1-vanusuri@mvista.com>
In-Reply-To: <20241112133330.2828105-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=351ef9d9-02e9-41d6-ab76-f628d062201b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-12T13:46:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA2PR10MB8394:EE_
x-ms-office365-filtering-correlation-id: 6e50348b-da04-4227-aaa2-08dd03208073
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?/tfMGAtLjChr0707jNI5KNBjmUkBH+XNoMfgM1ftgjOYXvXWThavqKi1dVFD?=
 =?us-ascii?Q?L4ROygvyYbn/vi+3tV3nN1feil8ndrMK2pXa+QpnfexFj+KsjyI8AqpIz/Uw?=
 =?us-ascii?Q?Rl2eawz02weS0mwQY21a7QJ5tO0mQHTZzEhUA18acfG3BJXUnGqQ6YhZgPJ0?=
 =?us-ascii?Q?ZPIX+yvc/ViExURDMz1Lr4rySD4SOZHfxW2zUeaXjjqfRy/+uHN7WXLfrUDu?=
 =?us-ascii?Q?x82Dr77rSXhzL2Nwoa969U249xjERQ9NnDQNpW2bBdDFTW/fF0sPUEIollq4?=
 =?us-ascii?Q?/wmbivrRFGXutLjks5gjUF4BSvEZYjXIGX+H7904e4oXHWMAvmaOQ+wdlSol?=
 =?us-ascii?Q?Ixb2y8JP0J7A2978nXXRXj+Riy2RULIA0klYhfm8vElpE01J6niLYy9DmRXY?=
 =?us-ascii?Q?9VAWdzjYzICV0Lcrf9zVEaDX/3P0PepikJAaIa5UJM8objfiqUxoakmwfe2q?=
 =?us-ascii?Q?E/WhrwuZ5M0hplwaQle6BSInmbA1C0NrVMRIwjn5M8a6CvB0KFpTa6mDhqFN?=
 =?us-ascii?Q?WXTmQYqH6a/PriKnmlLqHuQstHbsHtnS5vtuHo/e4R4O6uB2UVmYrHwB6bZD?=
 =?us-ascii?Q?66PSXcAxSyl5aRctM/EstslD1TyFOgyP3JUndwmUpkw6okvgWOGzGlOi3c2f?=
 =?us-ascii?Q?4DwDo5vdXT/MZg3WGJAMPBeig+YtNJPn7nLnP31ynYabSSWjuVOT7YBjQ66Q?=
 =?us-ascii?Q?eVt6HbeZfOE97bFxB/DtHL+hxjaucAFRYGTSYZd3POQelc31nOAhXL9kCLcH?=
 =?us-ascii?Q?brQHT6c1B2eARFXqaTmHxGi6a2k/SOwRqStzen7ZjKgn1G1QawZGQiD8PB4d?=
 =?us-ascii?Q?9UdLNwqEKN+QlMo6hTGAZLnMQDv4IqyhoVSyWvPZPdgieBV5rVQh3ZdlkK7B?=
 =?us-ascii?Q?ly/xDHU2fMU02NJefxau7prhDv6J8c++UpUSSg9hL5MMErBrNqkT4nFst5vu?=
 =?us-ascii?Q?BIOFr6gdF13nJr8wYRqpuAopyshzsuPcbs7mPjhiUIypvczyVVeCPdo2oYN9?=
 =?us-ascii?Q?jZH2b3r/3lyK7wzdKg/9XQ9IvpB2Eo3KuIzHiDyXhmuKkrUzaLgHn77fTg38?=
 =?us-ascii?Q?R8iJMPR1hKD2upo2kKmayiKnTd472OUEQ/mDUcEpgIn936iDd4bJMURV6+jN?=
 =?us-ascii?Q?CfaxwkDhHLbyLmf1HNJkdzzQpP2VKKekkoIC9yCy9/SrBzkHwMyqqs/mVgTK?=
 =?us-ascii?Q?0LCvVxReD202T8v/Ic9gb1RkEdqn0WjI4lVrGs0lZTA0B4KUflUkJJDuVClQ?=
 =?us-ascii?Q?3ONpg49v5oHzLKBbZDRcpbFBggrT4smZEKYl7qCWhNfhAjpjnRw9iuRudt2+?=
 =?us-ascii?Q?38NU2covbK1A+BIK/yhY/Tvc?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qLiNYPFVC/za5dQxLvnRNkM9IkVOHZm22HsEdqG09mvqni1VrvW4tnzgzVel?=
 =?us-ascii?Q?u706DpP/VLAQEoeWB/YG1lRQzilUGEur/cHqW+cozHhE6nFswBjVcy+ki4/E?=
 =?us-ascii?Q?a1riZT2Ws9GiH02cnazvnQzPr7wk/IVTIFIXJ9SLF8YwU+vu59qV48/EeDyK?=
 =?us-ascii?Q?YyiMX55da+xSrf7RbjZWHaOn8avkIzp+aT1MtSq9n1EvyM75gHhmTltsosf5?=
 =?us-ascii?Q?fRyUwCxhEByF0IvLUGv9YtiTd2oQ6rc8tFT2Bj7z7BS5iTfsTOovR/0Qgvau?=
 =?us-ascii?Q?IJelm7doFQZ5Be/984ukGICEreyeB4zVxwCU0s/qNO+wfdas2t/aOtJYYC8R?=
 =?us-ascii?Q?P/HhvjgeUe8dTLSpTY7TYt/G/S/LZcqWpId5SymI7iwTdCDgqGL92uHrgTjD?=
 =?us-ascii?Q?h98FUe+n2YFcIu3nX7MjCG93t+SgmFIJiU7F/YsHPLr5VL1RHmQaQHoRE1hp?=
 =?us-ascii?Q?bOESv6plWClx/4lEOyns0NLIckkocDGXHS4BhqVQU90KjYNHRd2nAIfXKnxJ?=
 =?us-ascii?Q?zGNl+EJfgSc/eokHHxQnf6JZCCsd2G5k0VlgDaUTR/thtsILLZ6RbZJTEL3X?=
 =?us-ascii?Q?GNYYBdWhKwMVsknepXnn93iYQBrAsA+6z0e8n/8ZRSfgIcaNtGC+tGrWWacu?=
 =?us-ascii?Q?jwVsgQSDlIGAD3dTaRaSu/tjuzLN0+AlqbQp1UbCeKn4egpyo1CB2jpm9IO7?=
 =?us-ascii?Q?+Md9fuKf2bPBO+/TamO8+tDS6U+1ZocvdVxS+vp79K9Z9wnaLdUjx7B/kd/u?=
 =?us-ascii?Q?WsmAP+WsOiYtRdss/6mDodKD8y52PuHD/fVQxuDeFQrFq7FnI2cuD561korW?=
 =?us-ascii?Q?lzMw8/rQEzG6P+sQtZZCmACZfbPg0VtJeUwpK4U0zG3zKW6bVt0B+5keIL9Y?=
 =?us-ascii?Q?SpMp26sqw8iBHGcIeBLRK2Ui2rPeX+Cj7B4kHEn5Gl7VkLfBFdyZeWiEpmQq?=
 =?us-ascii?Q?7fcafouaS3CXMAauMCHfAZIi0rU0XzpO1sZrrlAfIAQcclSy+/8doFL6ydH3?=
 =?us-ascii?Q?6HOtNmY9EEzfC/BhpiWFRFuqmSQtLyG+EfrHFqSpQPofmtmWlHPgNRZQjy7G?=
 =?us-ascii?Q?hG7rK4gk5IzuKFBpcXMyHwM3ihRXsmhmKCTp7yKJC5WZQDrWnd4di1wBmq8H?=
 =?us-ascii?Q?TF3jk4KdicBfyD2+P7CuGMvMsHctQoCadOFFlC4tf0kkYFoAjIPOHlGWTGEi?=
 =?us-ascii?Q?sD2O5K8AfeoMgYciwoAc5fi0zcAF4IN16AUs3195XjMAXaaUrPDL8x6aHO9G?=
 =?us-ascii?Q?lU3A92vQGC6Do8D++WVe+MMe9iZzH5fhAbXh3CHbFtX4LhTcVzZEyXPnCKSt?=
 =?us-ascii?Q?jHvawBqZCPRG4U2camjQXsSuQ42hRSoKAIh5S1TEQexsKiO6xWD8T7WBWVoo?=
 =?us-ascii?Q?QXkf457BmOxQ80f3CSnSJ6BB/F12ERX17WReOrQ4QjcDHRWk1YDMipFc5GCg?=
 =?us-ascii?Q?P92ozrjPfDfdXjJSuXtzg9t+d7N3a/UC35lccgx0c5st7O90dsL0R3pXt8ug?=
 =?us-ascii?Q?u8gOL+5vASo24U/gTiNNZgMa3VCYaWc/7nCNkU1U501GroHc7Tmds2oGTkXm?=
 =?us-ascii?Q?bBZcU64ydovSJk3koAVAJnSpu+oaFnhvUj7BPOv0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e50348b-da04-4227-aaa2-08dd03208073
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 13:47:08.5037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wW4j28HEv6E/vAB0cdwW1pmAcqQHCvPuXhU7pm02odt3st/RTPKLK5Wv4o/VZcktXUwShGAiR6Scrt14MNzEnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 13:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207053

This patch was already submitted.
See https://lists.openembedded.org/g/openembedded-core/message/206904

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> lists.openembedded.org
> Sent: Tuesday, November 12, 2024 14:34
> To: openembedded-core@lists.openembedded.org
> Cc: Vijay Anusuri <vanusuri@mvista.com>
> Subject: [OE-core][kirkstone][PATCH] curl: Fix for CVE-2024-9681
>=20
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Ref: https://curl.se/docs/CVE-2024-9681.html
>=20
> Upstream-Commit:
> https://github.com/curl/curl/commit/a94973805df96269bf3f3bf0a20ccb9887313
> 316
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../curl/curl/CVE-2024-9681.patch             | 88 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch
>=20
> diff --git a/meta/recipes-support/curl/curl/CVE-2024-9681.patch
> b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
> new file mode 100644
> index 0000000000..1ba373a1c4
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
> @@ -0,0 +1,88 @@
> +From a94973805df96269bf3f3bf0a20ccb9887313316 Mon Sep 17 00:00:00
> 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 9 Oct 2024 10:04:35 +0200
> +Subject: [PATCH] hsts: improve subdomain handling
> +
> +- on load, only replace existing HSTS entries if there is a full host
> +  match
> +
> +- on matching, prefer a full host match and secondary the longest tail
> +  subdomain match
> +
> +Closes #15210
> +
> +Upstream-Status: Backport
> [https://github.com/curl/curl/commit/a94973805df96269bf3f3bf0a20ccb988731
> 3316]
> +CVE: CVE-2024-9681
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/hsts.c          | 14 ++++++++++----
> + tests/data/test1660 |  2 +-
> + 2 files changed, 11 insertions(+), 5 deletions(-)
> +
> +diff --git a/lib/hsts.c b/lib/hsts.c
> +index 08e15dc..06d2edf 100644
> +--- a/lib/hsts.c
> ++++ b/lib/hsts.c
> +@@ -247,12 +247,14 @@ CURLcode Curl_hsts_parse(struct hsts *h, const cha=
r
> *hostname,
> + struct stsentry *Curl_hsts(struct hsts *h, const char *hostname,
> +                            bool subdomain)
> + {
> ++  struct stsentry *bestsub =3D NULL;
> +   if(h) {
> +     char buffer[MAX_HSTS_HOSTLEN + 1];
> +     time_t now =3D time(NULL);
> +     size_t hlen =3D strlen(hostname);
> +     struct Curl_llist_element *e;
> +     struct Curl_llist_element *n;
> ++    size_t blen =3D 0;
> +
> +     if((hlen > MAX_HSTS_HOSTLEN) || !hlen)
> +       return NULL;
> +@@ -277,15 +279,19 @@ struct stsentry *Curl_hsts(struct hsts *h, const c=
har
> *hostname,
> +         if(ntail < hlen) {
> +           size_t offs =3D hlen - ntail;
> +           if((hostname[offs-1] =3D=3D '.') &&
> +-             Curl_strncasecompare(&hostname[offs], sts->host, ntail))
> +-            return sts;
> ++             Curl_strncasecompare(&hostname[offs], sts->host, ntail) &&
> ++	     (ntail > blen)) {
> ++            /* save the tail match with the longest tail */
> ++            bestsub =3D sts;
> ++            blen =3D ntail;
> ++	  }
> +         }
> +       }
> +       if(Curl_strcasecompare(hostname, sts->host))
> +         return sts;
> +     }
> +   }
> +-  return NULL; /* no match */
> ++  return bestsub;
> + }
> +
> + /*
> +@@ -447,7 +453,7 @@ static CURLcode hsts_add(struct hsts *h, char *line)
> +     e =3D Curl_hsts(h, p, subdomain);
> +     if(!e)
> +       result =3D hsts_create(h, p, subdomain, expires);
> +-    else {
> ++    else if(Curl_strcasecompare(p, e->host)) {
> +       /* the same host name, use the largest expire time */
> +       if(expires > e->expires)
> +         e->expires =3D expires;
> +diff --git a/tests/data/test1660 b/tests/data/test1660
> +index cbbcf75..662026b 100644
> +--- a/tests/data/test1660
> ++++ b/tests/data/test1660
> +@@ -52,7 +52,7 @@ this.example [this.example]: 1548400797
> + Input 12: error 43
> + Input 13: error 43
> + Input 14: error 43
> +-3.example.com [example.com]: 1569905261 includeSubDomains
> ++3.example.com [3.example.com]: 1569905261 includeSubDomains
> + 3.example.com [example.com]: 1569905261 includeSubDomains
> + foo.example.com [example.com]: 1569905261 includeSubDomains
> + 'foo.xample.com' is not HSTS
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-
> support/curl/curl_7.82.0.bb
> index ba3abadac9..cda42da4d3 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -62,6 +62,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2024-7264_2.patch \
>             file://CVE-2024-8096.patch \
>             file://0001-url-free-old-conn-better-on-reuse.patch \
> +           file://CVE-2024-9681.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
>=20
> --
> 2.25.1


