Return-Path: <k.kurematsu@nskint.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E8FD4A5FD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 04:27:39 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31.1768537654029171654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 20:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nskint.onmicrosoft.com header.s=selector1-nskint-onmicrosoft-com header.b=DcF6Nrv0;
 spf=pass (domain: nskint.co.jp, ip: 40.107.74.78, mailfrom: k.kurematsu@nskint.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K822VT7lDbDKFAQm+2pLq8tPAG7XdgIxTKODd9p6LiNt0ZkWy4uR+246N//SQ92yhs+Y0FKwUWhpv/om5uGhrlC5es40voeKS+H6TGiPuuSHNcyOav0+ET1GmOZXHIEa9HTnzm84dEb1/CZO0umf+pMp7hKOHFBaYUvlWeha9qzjlkbHNoK+zs2ilDUL6dfXdeG/C9n4YT7GneiCa555K9SmSNLRULwjWNb+kdk4l8QstReCKIL2/LtV2uvAbpSRLqF6+BW8BTPBaqSuZHe7vHhgquzhZzxi6DjSUuaAImE6v4WR4gnUm4oWzxUjfmWihYZ0K3ur7GBJxZmBr1aP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU5/xKVgyNugdS2jg5w0kJrGJpw4Gsl64CAQPVr9xbI=;
 b=cX0AgiXClFzrgiL41aOa/HwpBWhLqZYO8ILl/Yj9DpsZgozkOVX0HzBhXIoY7ZybgHKWK+tGkkzrZx+5M6/jE15UkCDDeB/NsMzLS2PVTRQ646HOyVO6jxXf8qPluZaChSh/zoNRrYvaDlzgkSioUl+VgaLEg1Tst804dNYtW+V3j2ev6qcHMKGfoWA7+grHfxwraixVX2JWX06pAYmJ2YkNngIO3bHmRNIUsnLzCBYwCOcAqi4/h8VDTbhKw7pwLT65C+r64ZlzgyOiFnKx7HPDX+kykXUx7hFTwTiaa603TftvKgjqpaTKD+SyaAH1kTcDjn7gSXsbwR8G+XBYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU5/xKVgyNugdS2jg5w0kJrGJpw4Gsl64CAQPVr9xbI=;
 b=DcF6Nrv0te2T2uzp21+/NV91accnQhBuma/Lm78f81643qxCDgjRXNZSnvWhR3htcSWnCzG2JyuArqtJOITd5Vn49zcoWRS1qt/xRtd3ALFRcWhK8SkuOhoavQfmhmf0ltAVdTGPEPXnyY4JLI2Q9XTqMY5GHZmSyY1ylh/qzGk=
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ef::11)
 by TYYP286MB4765.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:145::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 04:27:29 +0000
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a]) by TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 04:27:29 +0000
From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
To: "randy.macleod@windriver.com" <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton <ross.burton@arm.com>
CC: Masahiro Mizutani <m.mizutani@nskint.co.jp>, Yoshitaka Ikeda
	<ikeda@nskint.co.jp>, Ken Kurematsu <k.kurematsu@nskint.co.jp>
Subject: RE: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Index: 
 Adxwm3RV7PLHzcUFTp6yQbLT2jCIAwC2WhaAAAnYezAAANmfQAA16xSAAAPhnBAEhk0HcA==
Date: Fri, 16 Jan 2026 04:27:28 +0000
Message-ID: 
 <TYRP286MB5995A204B7B9AF877CD7B64CDB8DA@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
 <1883AE2C045A1BB3.1614991@lists.openembedded.org>
 <TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <c2a296a3-0345-4814-ae07-257440b67fef@windriver.com>
 <TYRP286MB5995B67B327F77AA92B68533DBB2A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: 
 <TYRP286MB5995B67B327F77AA92B68533DBB2A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRP286MB5995:EE_|TYYP286MB4765:EE_
x-ms-office365-filtering-correlation-id: 865f7f8d-609d-467f-0b67-08de54b78f14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?CMlRDWE9G9WU9TGX32FKmEi9PXWzXDRuffGVJK7knO4Q1qUDdJWE2LM5MClM?=
 =?us-ascii?Q?Ybbayrjqx1QQFvtGDfU2Jy2h6Q+r7bYuO2LnC+LptZpQ81u35n1BZI9Dn3QL?=
 =?us-ascii?Q?6SERlLPr585PxC7chYX84Gp2KFg3jvz61IirkVoDBvBn6z4uSq+4zyapluu0?=
 =?us-ascii?Q?fn8Rd01wLtLwYRGI2FPzI/QauDPbJ1JN7V6b8YYfkQAVRfpPqxgyG2Fxzati?=
 =?us-ascii?Q?1vMpbrV5XZFvEO+99fpd4KtVckELAOuF4eDsTCaTyWBNaOCwpcREifAg8Pow?=
 =?us-ascii?Q?qjH5tzW4VEha4O7KGUJNftMNfs8bDFzZIwlijffA3zE0nGDCrOBTN8lLBEfD?=
 =?us-ascii?Q?qhQUlNxctHDQ3/v7YVICe4SptcAqfzASvVruOn5JVyww7HkyDmaxv9G4+oia?=
 =?us-ascii?Q?4T/gX3/ex12RtodNfIUvrLSgKQooOp8XfSsXPim3vMRryp8ZOTh2ce2TDiOU?=
 =?us-ascii?Q?IYxj4b6t/KuO+N1LGVOFqMaHCQlJDlGknUoVbqEEIQJTmLn8BDhckb1bgQHV?=
 =?us-ascii?Q?3djZc/u3MMI79vWMrQBniJqc4nDVujtz967V10LMqQRXP/fa8L1He7wkZg/Y?=
 =?us-ascii?Q?WGOjq34MLk3+OoSf7+AomC7A3lCn1fBhHNRrItt7Vh3zOcPiyLwV0GsaFvWT?=
 =?us-ascii?Q?Tx5XhqKqE/6GUXpVc+ofiv/jY/tH2QOwx7O+vdBSVURE30uol/T8Fb0YWE0D?=
 =?us-ascii?Q?HkZpkEt5LTqWPIQ4XUeQjxiOsPSh+iEiZpjwhg/ViKbYthxtbQ9HRo13mg4r?=
 =?us-ascii?Q?XxTBNx94sk91SxVGGZK6hXv3MwZ7BZb4Zp5/xl6WLrXsAduUB6CoUib/r3h+?=
 =?us-ascii?Q?hpxprA5pWTVnh0cfDC2JqRRxpBtla6YVHh0/3OJ8h/NBXYCNhw42FKt8ax6V?=
 =?us-ascii?Q?9nQo7xeDSX6Sob2C1IVaulBL2BtfugzdYklqUGJ8yAiB6C58b7qcO+BvzJXa?=
 =?us-ascii?Q?9cA3aZbE9Esgk90TBAC36N86XIHeIMBEVSHYqRYNYk0RdXFVNRB2u8sgVKQt?=
 =?us-ascii?Q?m0AUtufgR1ez5aDGBsjl81OLLjzU0Za9G8KNpyxWQDV+DsLn7OOQlrrJSa3B?=
 =?us-ascii?Q?812CFqsw4bz75/5yqKJIqz9evaAfEH1mkx+9mnTRuvXwF1m1KYHKhDNuDjVT?=
 =?us-ascii?Q?jRxcLnC9vE8qOMNnsUh1T4AA/xjdQmBn+qOoVa11bog7ntL4vv7zgkovv6e+?=
 =?us-ascii?Q?SOmj+Ug0VtnzfUvnT89AxT6E1C3xF47dBc8svt1lQoj399PGLZ8bcrZViJor?=
 =?us-ascii?Q?Blng44R7DNPLCo46F2nmmdk9orBScrwUcHkpXy9wfg+mNefp0iNpCo5lDvT4?=
 =?us-ascii?Q?2BGyhaCrgj4MUx5yM6QKWjJXTMb+JqX2RtqrG50mVUwWzzdVszxbIK5xSMMA?=
 =?us-ascii?Q?SZjj3r43zFGhlil/8Ui4CZDNkNTy3C7zpInTNM2acqoQdYyvIA8lZjjzS181?=
 =?us-ascii?Q?wUTG/gs8hrLccq4hYkMMFkJgzb5V1oWeTR7J4G3N+xaH8hJKEWVuU5ZTHD7B?=
 =?us-ascii?Q?UOjkZReKT9WBmum0ZNByouLMpUG+5iiarUy7HRkRb2Wfoo2jviM7QzZqzKIr?=
 =?us-ascii?Q?r92v9MvvfBm2GsrkAhs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ryCOZIzCCOyXdgiwHfdRECWveV7KTiI5ZrhZvvYMaldKNKg8GE+wH2BdpvL0?=
 =?us-ascii?Q?voupfuk8Nd4/Os+vChJaIbfU726tsYAPFHlz+9ayciu4wyA3RWbsZQ9nMQhE?=
 =?us-ascii?Q?Ql0z0R23QV/FTTVK5TGifnqexAe2gpNRhTDleS50NTwyzsC8tfJfyUR6ARNt?=
 =?us-ascii?Q?55K1vaf0G6IP8o4XcN4VVo2/Y7Je3Wl7E8eK/AHRyLAwJPHQe7p28qmXiIdh?=
 =?us-ascii?Q?3Etr9t8fi3HtQGkxMjsIBrZwvQd3FLkGLMvRdwsM9nPQOkB9N1r5PwIJtMkG?=
 =?us-ascii?Q?BYHIOpjeFVflhi9wMVSqCin09H2GVn6oLsm5xmCHrFyMPxVbOFMXtQIDn6tu?=
 =?us-ascii?Q?ex3QnkyrVb7xckGjJOJ407ErtmQfmpesa12OsL/sE/cNVn+lWK6urgWJgLeb?=
 =?us-ascii?Q?kBTnZ413X2VvFdyTpvbEosdvdmQOFUXgbFmgMQaNr9gfTOIab5IA2dW+x9sT?=
 =?us-ascii?Q?JttbRgoBLmJe5i3YEHtQShMaQgkbfarZ9mp07QOedO+G3SIdtmc91Bhlrz2j?=
 =?us-ascii?Q?3V5zNbIfAfriA9FmxIg6rsIbNeN/7WcSnzbdlY87wdeh0Q3z1QQKaKobcMkO?=
 =?us-ascii?Q?sUpKFFL1+js9eHu/aM6I9JASgnhMwDAHz95KDnXA4iQjoOMNaMQmue3QtVZD?=
 =?us-ascii?Q?eStYByp+sQ2fXwchR8hHhOxe7zwBbzpTUloK642/7EpmADIFnX9b/khYo1aI?=
 =?us-ascii?Q?sJ9fUQd4iC9x4yAQYIZkZ4bBXBQh1965eW10BumV/cK3I4DKCmm+v+IN2tee?=
 =?us-ascii?Q?BbIq/EKJgIJ3q9j3NpYm/FE7IjRlKA17kLUEDXBCG/R4MGwrUBSo1f06f9JQ?=
 =?us-ascii?Q?HOUdQBTYBTsQFMjfIZknuBM/sXIawaBYD0uBrDT53jFJAJm1Kyq3dPWnLXZi?=
 =?us-ascii?Q?6O0Pu4gXeEa8mh9q2iIC2A4m17iD3nAFKcn4/+ehNdYTmPrWJkdNGVukLTFR?=
 =?us-ascii?Q?mGYTyjevcocoYpXwFjPFqU6eI3ggIF/wu7L5XDTnDw0v9HTHlTkpLtBzAbc/?=
 =?us-ascii?Q?+agBxTQxE8a+rzwV8vwSkJ0hqFwfHw9NSF/i99Jx2XLvoJIQboHZPTNXh1hr?=
 =?us-ascii?Q?t5fpj6M8VB5AjwFTvWixB3/iU8NKkHBpZgedMzR6ihxh7TvILeAj+ZuhU5e2?=
 =?us-ascii?Q?mKn1vmveGUo2XQOMNyujQUkSOW4JW1VxOqjcgBWdKDJsCGifg0AVu5+DMIs0?=
 =?us-ascii?Q?knTxk7T+3haQAO7WYsXarD1nkU8bwtEmVC9UgO9u1fvdwxofbmfizGnxabxL?=
 =?us-ascii?Q?Kfb2WV7V+LKE9dg6/FmrFP0SsdabjqpEXqWuPuLcrI/FKCRErU9XX4QbaNaE?=
 =?us-ascii?Q?Xe/zIDAX504kP7jpw2fZZGCHwp2NcbZhehcXhKwWdvbqqyYq7oMqMqY8okUA?=
 =?us-ascii?Q?Qs+SK2MiJ4ZGUVZ1vQshVGVH9uJE2OODVLNthaW5kfMNmybl/3iYzPfR9Grh?=
 =?us-ascii?Q?C6FWl3x8OavmA89QyatFarrRxQrVdbR00xT1cR8DAOw0u6wCDwh0xRIWGInr?=
 =?us-ascii?Q?CuroUPJjWLhsahRlG2YrG2+Vuq5tVWCLRYjmGbIu/jshXiCAlG6Jg5n6iEhb?=
 =?us-ascii?Q?PurC47OS8jtaVXZyb+SZXoArQTkey3O3yExVINAb5kYR6iI5S2InPVfIyGxI?=
 =?us-ascii?Q?ATRHRXPAXYR8DEtjT/UVRMNZbfh2SQibIKguHx860MQPhEhbQYsw4DPWyXMF?=
 =?us-ascii?Q?c5U2bsx8Kxowx+B4g9DsW85Ycw4sAFT/ahw0tD2kfKMXJ+6RtX3/qd/UDqdT?=
 =?us-ascii?Q?4NHNk2BWng=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TYRP286MB5995A204B7B9AF877CD7B64CDB8DATYRP286MB5995JPNP_"
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 865f7f8d-609d-467f-0b67-08de54b78f14
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 04:27:28.9236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0xOcNEg+E1vw9R4CNgONAcjfijWeLkGED/oWy+cSK5ONWu/rRizVI95U0xPTovyJmI+HAmvDwZ/XH+anypG3l4J3AACc7SxDjPEXd/vMXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4765
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 04:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229520

--_000_TYRP286MB5995A204B7B9AF877CD7B64CDB8DATYRP286MB5995JPNP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Randy, Ross

Ping?

Could you please comment on the post below?


--

Ken Kurematsu <k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp>>

From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
Sent: Wednesday, December 24, 2025 12:55 PM
To: randy.macleod@windriver.com; openembedded-core@lists.openembedded.org; =
Ross Burton <ross.burton@arm.com>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda <ikeda@nsk=
int.co.jp>; Ken Kurematsu <k.kurematsu@nskint.co.jp>
Subject: RE: [OE-core] [PATCH] libtheora: set CVE_PRODUCT

Hi Randy,

From: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lis=
ts.openembedded.org> <openembedded-core@lists.openembedded.org<mailto:opene=
mbedded-core@lists.openembedded.org>> On Behalf Of Randy MacLeod via lists.=
openembedded.org
Sent: Wednesday, December 24, 2025 10:48 AM
To: Ken Kurematsu <k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp=
>>; openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>; Ross Burton <ross.burton@arm.com<mailto:ross.burton@arm=
.com>>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp<mailto:m.mizutani@nskint.co.=
jp>>; Yoshitaka Ikeda <ikeda@nskint.co.jp<mailto:ikeda@nskint.co.jp>>
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT

On 2025-12-22 7:05 p.m., Ken Kurematsu wrote:
Hi Randy,

Let me confirm one thing about your comment.

If I make the corrections as suggested in the comment, when I retrieve CVE_=
PRODUCT with bitbake-getvar,
only "theora" is included, not "libtheora".
I expect both libtheora and theora to be valid matches...
I see.
(This is the result of an old test environment, but it was the same in 1.2.=
0)

$ bitbake-getvar -r libtheora CVE_PRODUCT
#
# $CVE_PRODUCT [2 operations]
#   set xxx/create-spdx-2.2.bbclass:11
#     [_defaultval] "${BPN}"
#   append xxx/libtheora_1.1.1.bb<https://urldefense.com/v3/__http:/libtheo=
ra_1.1.1.bb__;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF=
-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIROdM8lL0jRA$>:23
#     "theora"
# pre-expansion value:
#   " theora"
CVE_PRODUCT=3D" theora"
but  it doesn't look like that.

If libtheora should be included, I think the following correction would be =
best. What do you think?
Sorry if I misunderstood.

CVE_PRODUCT =3D "${BPN} theora"
probably not.
Ummm...

I replied to your email in response to a discussion in the Yocto patch revi=
ew meeting.
IIRC, Ross Burton was the one who suggested the +=3D.

It would be a good idea to attend the Yocto patch review meeting and talk t=
o you.
However, I'm not very good at English. Sorry.

I don't often use the CVE check scripts in oe-core so I'm not sure off-hand=
, how to confirm
that the BPN is the default.

The default value is defined in cve-check.bbclass, which can be found at th=
e following URL:
https://github.com/openembedded/openembedded-core/blob/48e98a6e3fd26c418902=
b76be8865102bd903189/meta/classes/cve-check.bbclass#L31

Ross ?

Ken, please be patient, it the winter holiday season so Ross may not reply =
for a week or two.

Ok, I'll wait for Ross's response.
I will also be on vacation starting next week, so the next time I can reply=
 will be after the New Year.

../Randy




By the way, the NVD records have the following values, so I think theora al=
one will be fine.
(itheora is a different product)

$ sqlite3 downloads/CVE_CHECK/nvdcve_2-2.db .dump | grep theora
:
INSERT INTO PRODUCTS VALUES('CVE-2008-0797', 'itheora','itheora','1.0_rc1',=
'=3D','','');
INSERT INTO PRODUCTS VALUES('CVE-2024-56431', 'xiph','theora','','','1.2.0'=
,'<');
$

Best Regards.
--
Ken Kurematsu k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp>

From: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lis=
ts.openembedded.org> <openembedded-core@lists.openembedded.org><mailto:open=
embedded-core@lists.openembedded.org> On Behalf Of Ken Kurematsu via lists.=
openembedded.org<https://urldefense.com/v3/__http:/lists.openembedded.org__=
;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKm=
GkE_mqMu67Ekm6WVIz8qZmIROdOLXrdmwg$>
Sent: Tuesday, December 23, 2025 8:43 AM
To: Randy MacLeod <randy.macleod@windriver.com><mailto:randy.macleod@windri=
ver.com>; openembedded-core@lists.openembedded.org<mailto:openembedded-core=
@lists.openembedded.org>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp><mailto:m.mizutani@nskint.co=
.jp>; Yoshitaka Ikeda <ikeda@nskint.co.jp><mailto:ikeda@nskint.co.jp>; Ken =
Kurematsu <k.kurematsu@nskint.co.jp><mailto:k.kurematsu@nskint.co.jp>
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT

Hi Randy,

Thank you for your review.
I will reflect your comments and post v2.

Best regards.
--
Ken Kurematsu <k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp>>

From: Randy MacLeod <randy.macleod@windriver.com<mailto:randy.macleod@windr=
iver.com>>
Sent: Tuesday, December 23, 2025 3:58 AM
To: Ken Kurematsu <k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp=
>>; openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp<mailto:m.mizutani@nskint.co.=
jp>>; Yoshitaka Ikeda <ikeda@nskint.co.jp<mailto:ikeda@nskint.co.jp>>
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT

Hi Ken,

On 2025-12-18 11:01 p.m., Ken Kurematsu via lists.openembedded.org<https://=
urldefense.com/v3/__http:/lists.openembedded.org__;!!AjveYdw8EvQ!eK1ouKPWLX=
aDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIRO=
dOLXrdmwg$> wrote:

In the NVD database, the product name of libtheora is theora.

This was set to ensure that cve-check works correctly.



Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp><mailto:k.kurematsu@=
nskint.co.jp>

---

 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++

 1 file changed, 2 insertions(+)



diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/re=
cipes-multimedia/libtheora/libtheora_1.2.0.bb

index 04de8507fb..bacaf3aee6 100644

--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb

+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb

@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D "ebdf77a8f5c0a8f7a9e42323844fa0950=
2b34eb1d1fece7b5f54da41fe



 UPSTREAM_CHECK_REGEX =3D "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"



+CVE_PRODUCT =3D "theora"

+



From YP patch review,
Please use:

CVE_PRODUCT +=3D "theora"



to catch both libtheora and theora





Thanks,



../Randy





 inherit autotools pkgconfig



 EXTRA_OECONF =3D "--disable-examples --disable-doc"








--

# Randy MacLeod

# Wind River Linux



--

# Randy MacLeod

# Wind River Linux



--

Ken Kurematsu <k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp>>



--_000_TYRP286MB5995A204B7B9AF877CD7B64CDB8DATYRP286MB5995JPNP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"MS PGothic";}
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	font-size:12.0pt;
	font-family:"MS PGothic";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	margin:0mm;
	font-size:12.0pt;
	font-family:"MS Gothic";}
span.HTML
	{mso-style-name:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D";
	font-family:"Courier New";}
span.23
	{mso-style-type:personal-reply;
	font-family:"Yu Gothic";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"JA" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-w=
ord">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Hi Randy, Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Ping?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN" style=3D"font-size:10.5pt;font-fam=
ily:&quot;Yu Gothic&quot;">Could you please comment on the post below?</spa=
n><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Gothi=
c&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<pre><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Go=
thic&quot;">--<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Go=
thic&quot;">Ken Kurematsu &lt;<a href=3D"mailto:k.kurematsu@nskint.co.jp">k=
.kurematsu@nskint.co.jp</a>&gt;<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Ken Kurematsu &lt;k.kurematsu@nskint.co.jp&gt;
<br>
<b>Sent:</b> Wednesday, December 24, 2025 12:55 PM<br>
<b>To:</b> randy.macleod@windriver.com; openembedded-core@lists.openembedde=
d.org; Ross Burton &lt;ross.burton@arm.com&gt;<br>
<b>Cc:</b> Masahiro Mizutani &lt;m.mizutani@nskint.co.jp&gt;; Yoshitaka Ike=
da &lt;ikeda@nskint.co.jp&gt;; Ken Kurematsu &lt;k.kurematsu@nskint.co.jp&g=
t;<br>
<b>Subject:</b> RE: [OE-core] [PATCH] libtheora: set CVE_PRODUCT<o:p></o:p>=
</span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Hi Randy,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-co=
re@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists=
.openembedded.org">openembedded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Randy MacLeod via lists.openembedded.org<br>
<b>Sent:</b> Wednesday, December 24, 2025 10:48 AM<br>
<b>To:</b> Ken Kurematsu &lt;<a href=3D"mailto:k.kurematsu@nskint.co.jp">k.=
kurematsu@nskint.co.jp</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-co=
re@lists.openembedded.org</a>; Ross Burton &lt;<a href=3D"mailto:ross.burto=
n@arm.com">ross.burton@arm.com</a>&gt;<br>
<b>Cc:</b> Masahiro Mizutani &lt;<a href=3D"mailto:m.mizutani@nskint.co.jp"=
>m.mizutani@nskint.co.jp</a>&gt;; Yoshitaka Ikeda &lt;<a href=3D"mailto:ike=
da@nskint.co.jp">ikeda@nskint.co.jp</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT<o:p></o:p>=
</span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">On 2025-12-22 7:05 p.m., Ken Kurematsu wrote:<o:p>=
</o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Hi Randy,</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Let me confirm one thing about your comment.</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">If I make the corrections as suggested in the comment, when I re=
trieve CVE_PRODUCT with bitbake-getvar,</span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">only &quot;theora&quot; is included, not &quot;libtheora&quot;.<=
/span><span lang=3D"EN-US"><o:p></o:p></span></p>
</blockquote>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">I expect both libtheora and theora to be valid mat=
ches...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">I see.<o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">(This is the result of an old test environment, but it was the s=
ame in 1.2.0)</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">$ bitbake-getvar -r libtheora CVE_PRODUCT</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">#</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;"># $CVE_PRODUCT [2 operations]</span><span lang=3D"EN-US"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">#&nbsp;&nbsp; set xxx/create-spdx-2.2.bbclass:11</span><span lan=
g=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp; [_defaultval] &quot;${BPN}&quot;</span=
><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">#&nbsp;&nbsp; append xxx/</span><span lang=3D"EN-US"><a href=3D"=
https://urldefense.com/v3/__http:/libtheora_1.1.1.bb__;!!AjveYdw8EvQ!eK1ouK=
PWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZ=
mIROdM8lL0jRA$"><span style=3D"font-size:10.5pt;font-family:&quot;Yu Gothic=
&quot;">libtheora_1.1.1.bb</span></a></span><span lang=3D"EN-US" style=3D"f=
ont-size:10.5pt;font-family:&quot;Yu Gothic&quot;">:23</span><span lang=3D"=
EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp; &quot;theora&quot;</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;"># pre-expansion value:</span><span lang=3D"EN-US"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">#&nbsp;&nbsp; &quot; theora&quot;</span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">CVE_PRODUCT=3D&quot; theora&quot;</span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
</blockquote>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0mm;margin-right:0mm;mar=
gin-bottom:12.0pt;margin-left:42.0pt;mso-margin-top-alt:0mm;mso-para-margin=
-right:0mm;mso-para-margin-bottom:12.0pt;mso-para-margin-left:3.5gd">
<span lang=3D"EN-US">but&nbsp; it doesn't look like that.<o:p></o:p></span>=
</p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">If libtheora should be included, I think the following correctio=
n would be best. What do you think?</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Sorry if I misunderstood.</span><span lang=3D"EN-US"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">CVE_PRODUCT =3D &quot;${BPN} theora&quot;</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
</blockquote>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">probably not.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Ummm</span><span style=3D"font-size:10.5pt;fo=
nt-family:&quot;Yu Gothic&quot;">&#8230;<span lang=3D"EN-US"><o:p></o:p></s=
pan></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US"><br>
I replied to your email in response to a discussion in the Yocto patch revi=
ew meeting.<br>
IIRC, Ross Burton was the one who suggested the +=3D.<o:p></o:p></span></p>
<p><span lang=3D"EN">It would be a good idea to attend the Yocto patch revi=
ew meeting and talk to you.<br>
However, I'm not very good at English. Sorry.</span><span lang=3D"EN-US"><o=
:p></o:p></span></p>
<p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"EN=
-US">I don't often use the CVE check scripts in oe-core so I'm not sure off=
-hand, how to confirm<br>
that the BPN is the default. <o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Goth=
ic&quot;">The default value is defined in cve-check.bbclass, which can be f=
ound at the following URL:<br>
</span><span lang=3D"EN-US"><a href=3D"https://github.com/openembedded/open=
embedded-core/blob/48e98a6e3fd26c418902b76be8865102bd903189/meta/classes/cv=
e-check.bbclass#L31"><span style=3D"font-size:10.5pt;font-family:&quot;Yu G=
othic&quot;">https://github.com/openembedded/openembedded-core/blob/48e98a6=
e3fd26c418902b76be8865102bd903189/meta/classes/cve-check.bbclass#L31</span>=
</a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot=
;Yu Gothic&quot;"><o:p></o:p></span></p>
<p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"EN=
-US"><br>
Ross ?<o:p></o:p></span></p>
<p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"EN=
-US">Ken, please be patient, it the winter holiday season so Ross may not r=
eply for a week or two.<o:p></o:p></span></p>
<p><span lang=3D"EN" style=3D"font-size:10.5pt;font-family:&quot;Yu Gothic&=
quot;">Ok, I'll wait for Ross's response.<br>
I will also be on vacation starting next week, so the next time I can reply=
 will be after the New Year.</span><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p></o:p></span></p>
<p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"EN=
-US">../Randy<o:p></o:p></span></p>
<p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"EN=
-US"><o:p>&nbsp;</o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">By the way, the NVD records have the following values, so I thin=
k theora alone will be fine.</span><span lang=3D"EN-US"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">(itheora is a different product)</span><span lang=3D"EN-US"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">$ sqlite3 downloads/CVE_CHECK/nvdcve_2-2.db .dump | grep theora<=
/span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">INSERT INTO PRODUCTS VALUES('CVE-2008-0797', 'itheora','itheora'=
,'1.0_rc1','=3D','','');</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">INSERT INTO PRODUCTS VALUES('CVE-2024-56431', 'xiph','theora',''=
,'','1.2.0','&lt;');</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">$</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Best Regards.</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">--</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Ken Kurematsu
</span><span lang=3D"EN-US"><a href=3D"mailto:k.kurematsu@nskint.co.jp"><sp=
an style=3D"font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">k.kurematsu=
@nskint.co.jp</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
</span><span lang=3D"EN-US"><a href=3D"mailto:openembedded-core@lists.opene=
mbedded.org"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">openembedded-core@lists.openembedded.org</span></a></span><sp=
an lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;=
,sans-serif">
</span><span lang=3D"EN-US"><a href=3D"mailto:openembedded-core@lists.opene=
mbedded.org"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">&lt;openembedded-core@lists.openembedded.org&gt;</span></a></=
span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calib=
ri&quot;,sans-serif">
<b>On Behalf Of </b>Ken Kurematsu via </span><span lang=3D"EN-US"><a href=
=3D"https://urldefense.com/v3/__http:/lists.openembedded.org__;!!AjveYdw8Ev=
Q!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm=
6WVIz8qZmIROdOLXrdmwg$"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">lists.openembedded.org</span></a></span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-s=
erif"><br>
<b>Sent:</b> Tuesday, December 23, 2025 8:43 AM<br>
<b>To:</b> Randy MacLeod </span><span lang=3D"EN-US"><a href=3D"mailto:rand=
y.macleod@windriver.com"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,sans-serif">&lt;randy.macleod@windriver.com&gt;</span></a></s=
pan><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,sans-serif">;
</span><span lang=3D"EN-US"><a href=3D"mailto:openembedded-core@lists.opene=
mbedded.org"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">openembedded-core@lists.openembedded.org</span></a></span><sp=
an lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;=
,sans-serif"><br>
<b>Cc:</b> Masahiro Mizutani </span><span lang=3D"EN-US"><a href=3D"mailto:=
m.mizutani@nskint.co.jp"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,sans-serif">&lt;m.mizutani@nskint.co.jp&gt;</span></a></span>=
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&qu=
ot;,sans-serif">;
 Yoshitaka Ikeda </span><span lang=3D"EN-US"><a href=3D"mailto:ikeda@nskint=
.co.jp"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,san=
s-serif">&lt;ikeda@nskint.co.jp&gt;</span></a></span><span lang=3D"EN-US" s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">;
 Ken Kurematsu </span><span lang=3D"EN-US"><a href=3D"mailto:k.kurematsu@ns=
kint.co.jp"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;=
,sans-serif">&lt;k.kurematsu@nskint.co.jp&gt;</span></a></span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-s=
erif"><br>
<b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT</span><spa=
n lang=3D"EN-US"><o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Hi Randy,</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Thank you for your review.</span><span lang=3D"EN-US"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">I will reflect your comments and post v2.</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Best regards.</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">--</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">Ken Kurematsu &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:=
k.kurematsu@nskint.co.jp"><span style=3D"font-size:10.5pt;font-family:&quot=
;Yu Gothic&quot;">k.kurematsu@nskint.co.jp</span></a></span><span lang=3D"E=
N-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">&gt;</sp=
an><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Got=
hic&quot;">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> Randy MacLeod
 &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:randy.macleod@windriver.=
com"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-s=
erif">randy.macleod@windriver.com</span></a></span><span lang=3D"EN-US" sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;
<br>
<b>Sent:</b> Tuesday, December 23, 2025 3:58 AM<br>
<b>To:</b> Ken Kurematsu &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:=
k.kurematsu@nskint.co.jp"><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">k.kurematsu@nskint.co.jp</span></a></span><span =
lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif">&gt;;
</span><span lang=3D"EN-US"><a href=3D"mailto:openembedded-core@lists.opene=
mbedded.org"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot=
;,sans-serif">openembedded-core@lists.openembedded.org</span></a></span><sp=
an lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;=
,sans-serif"><br>
<b>Cc:</b> Masahiro Mizutani &lt;</span><span lang=3D"EN-US"><a href=3D"mai=
lto:m.mizutani@nskint.co.jp"><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif">m.mizutani@nskint.co.jp</span></a></span><spa=
n lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,=
sans-serif">&gt;;
 Yoshitaka Ikeda &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:ikeda@ns=
kint.co.jp"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;=
,sans-serif">ikeda@nskint.co.jp</span></a></span><span lang=3D"EN-US" style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT</span><spa=
n lang=3D"EN-US"><o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">Hi Ken,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">On 2025-12-18 11:01 p.m., Ken Kurematsu via
<a href=3D"https://urldefense.com/v3/__http:/lists.openembedded.org__;!!Ajv=
eYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mq=
Mu67Ekm6WVIz8qZmIROdOLXrdmwg$">
lists.openembedded.org</a> wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">In the NVD database, the product name of libtheora is theora.<o:p></=
o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">This was set to ensure that cve-check works correctly.<o:p></o:p></s=
pan></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">Signed-off-by: Ken Kurematsu <a href=3D"mailto:k.kurematsu@nskint.co=
.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a><o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">---<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"> meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++<o:p></o=
:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"> 1 file changed, 2 insertions(+)<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/=
meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb<o:p></o:p></span></pre=
>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">index 04de8507fb..bacaf3aee6 100644<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb<o:p></o:p=
></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb<o:p></o:p=
></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D &quot;ebdf77a8f5c0a8f7a9e42=
323844fa09502b34eb1d1fece7b5f54da41fe<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"> UPSTREAM_CHECK_REGEX =3D &quot;libtheora-(?P&lt;pver&gt;\d+(\.\d)+)=
\.(tar\.gz|tgz)&quot;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">+CVE_PRODUCT =3D &quot;theora&quot;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">+<o:p></o:p></span></pre>
</blockquote>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">From YP patch review,<o:p></o:p></span></pre>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0mm;margin-right:0mm;mar=
gin-bottom:12.0pt;margin-left:42.0pt;mso-margin-top-alt:0mm;mso-para-margin=
-right:0mm;mso-para-margin-bottom:12.0pt;mso-para-margin-left:3.5gd">
<span lang=3D"EN-US">Please use:<o:p></o:p></span></p>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">CVE_PRODUCT +=3D &quot;theora&quot;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">to catch both libtheora and theora<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">Thanks, <o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">../Randy<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"> inherit autotools pkgconfig<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"> EXTRA_OECONF =3D &quot;--disable-examples --disable-doc&quot;<o:p><=
/o:p></span></pre>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0mm;margin-right:0mm;mar=
gin-bottom:12.0pt;margin-left:42.0pt;mso-margin-top-alt:0mm;mso-para-margin=
-right:0mm;mso-para-margin-bottom:12.0pt;mso-para-margin-left:3.5gd">
<span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">&nbsp;<o:p></o:p></span></pre>
</blockquote>
<p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"EN=
-US">&nbsp;<o:p></o:p></span></p>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">-- <o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"># Randy MacLeod<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"># Wind River Linux<o:p></o:p></span></pre>
</div>
</div>
</blockquote>
<p style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"EN=
-US"><o:p>&nbsp;</o:p></span></p>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US">-- <o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"># Randy MacLeod<o:p></o:p></span></pre>
<pre style=3D"margin-left:42.0pt;mso-para-margin-left:3.5gd"><span lang=3D"=
EN-US"># Wind River Linux<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Go=
thic&quot;"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Go=
thic&quot;">--<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Go=
thic&quot;">Ken Kurematsu &lt;<a href=3D"mailto:k.kurematsu@nskint.co.jp">k=
.kurematsu@nskint.co.jp</a>&gt;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Yu Go=
thic&quot;"><o:p>&nbsp;</o:p></span></pre>
</div>
</div>
</body>
</html>

--_000_TYRP286MB5995A204B7B9AF877CD7B64CDB8DATYRP286MB5995JPNP_--

