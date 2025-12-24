Return-Path: <k.kurematsu@nskint.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9400E7490B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 03:55:18 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.87])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.114399.1766548512630585712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 19:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nskint.onmicrosoft.com header.s=selector1-nskint-onmicrosoft-com header.b=S9EC6b1m;
 spf=pass (domain: nskint.co.jp, ip: 52.101.229.87, mailfrom: k.kurematsu@nskint.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5HGhGly29VrGl6ndI9OObYApYaEo/FskBknk9FUhujAh53XDSrfBJ+jOOu8s6uPb0LJ4Xl5Sdb006+s5dZHc3NzM5Or8o8kfwUdTkx9RS6blaiPhOi6zI1fnnnSEqSTxRFk4DUPOOvsF2Cx8CcaB8t8ioZkVfVZwR60DEkc9R0ZS2PLnEDYf6wCFRZwligc8Kne4X9Gmn66O6PgFNx+Romkwtfv7jOQat8i8b6nS7wMfj81i33oStGHkvVPSEMCxtxpl4vEHkwsNlHS1/bz14pAagcEM16lyFHHFokxyYWY+5juXMWCRCQBNZZj1GiSPGv499srVFUb5zHaadAHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvyff2juCwFxHRRI49qP4CCH28pk+4oziv8rbFgn9XU=;
 b=xK2Y4fAK/TSBcl0xoQyByI4tC0sxA2jM6HR+fdn6xRSC2rwsQxm2JYwgLEvhHehRpfskdqgS8InIftEOIawSjtL9mHQvZhGIeJz/34CQiNXXVoBDqNYezf1wh8W+aRG2F8tLKR4kxCm0xxaSIyykKaisxbMlEcLc9xKVUPO/6vrqwsRryv3LQH5nTepy0dx4IUrOGVh7SuE7oDTXNsFrooWte8g1WxZ4Jb3CTtbL7erMBKnmTLB66tktOEGF2xzr5vqCLkZkzJUjRV9ooAgF3e6WbjZDhN5G+mAE3rWdeK2YSx6/tEM0RGNoq7adkJ3TEwp+BNpfBZLeB1K9piqv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvyff2juCwFxHRRI49qP4CCH28pk+4oziv8rbFgn9XU=;
 b=S9EC6b1mg9aKZ0JkedHUTfNaCDa4rsoowCfiGRzuHi9dN2a9HqIPbNnxAybrDTSlAWEm8nTLfcJLpvbG4Ajw+LaZoe356G+lgHxdN9Qm9cQJH254x3ySJYmLPky8FGEVD0AIxgoC6H032gvkpqCCSEnVSTFAPA3f9kjLnzKo1eE=
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ef::11)
 by OS9P286MB6061.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:3ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 03:55:07 +0000
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a]) by TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a%5]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 03:55:07 +0000
From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
To: "randy.macleod@windriver.com" <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton <ross.burton@arm.com>
CC: Masahiro Mizutani <m.mizutani@nskint.co.jp>, Yoshitaka Ikeda
	<ikeda@nskint.co.jp>, Ken Kurematsu <k.kurematsu@nskint.co.jp>
Subject: RE: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Index: Adxwm3RV7PLHzcUFTp6yQbLT2jCIAwC2WhaAAAnYezAAANmfQAA16xSAAAPhnBA=
Date: Wed, 24 Dec 2025 03:55:07 +0000
Message-ID: 
 <TYRP286MB5995B67B327F77AA92B68533DBB2A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
 <1883AE2C045A1BB3.1614991@lists.openembedded.org>
 <TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <c2a296a3-0345-4814-ae07-257440b67fef@windriver.com>
In-Reply-To: <c2a296a3-0345-4814-ae07-257440b67fef@windriver.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRP286MB5995:EE_|OS9P286MB6061:EE_
x-ms-office365-filtering-correlation-id: 2a728985-deac-4d4f-8e1a-08de42a03a6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?JgvLOKQIXLKcxnWvVR/8vYCWUw6zgMrde4idMbXnIKkLEj/hZAuhsJtoJFQd?=
 =?us-ascii?Q?oa/ysALXQPNVzaaJprtEw2Ieq4SzNdP3Z5/GI5XKegzfijNh7N0qbGeIOF6U?=
 =?us-ascii?Q?/Zij0FOABf3ALQH0mmYGeiDsi2g7Gp/ZNYFL0pdlvSxvHG4jPRTWLzR569Ky?=
 =?us-ascii?Q?MdiIKVv4QeK/lSZq+7JH27zRYR1K4dSFXDAMRuFpHDtGVPFnFUyUnhmWS2HX?=
 =?us-ascii?Q?N8ALfrATC5nqRL0rUH2/XbUrAzWYJykt4LZz6fZJqo8JBtmYgSGSwYdNTKpT?=
 =?us-ascii?Q?JObAkhKjDXYHYYWV6uBjR9EQL2QyT5PgU08suSTsXirJE+zoifXpVnQqBqbN?=
 =?us-ascii?Q?cE2DG/UdRClUX7Js/uXPFfhtUWr6ZlM/JMrg+mpnsoDdGzc5iBua15seyYzI?=
 =?us-ascii?Q?89UTPZ8EJAMaD9kxWOLWCWyPUa2ZxY29DhrpQoiFpbScXmrInIiDkXjw4GGw?=
 =?us-ascii?Q?j2Nsys29IwqIVneM4LQeeixtQCovNQPTDxkGCDQ3bPv5iqWYhWZCAiJcW+0m?=
 =?us-ascii?Q?Cfb+aL4hygXGsjyM/Tw0S7n6hSOH4IfAbQdJHaz4bFWTEINdCLPaeq+FiWIl?=
 =?us-ascii?Q?GaOCYXktI+lU2ap8AKLH3eXvHa9yWSIcK3gCwuAh4biKBWZl9u2xgUFgoi5G?=
 =?us-ascii?Q?4a9obbPcpXXYyBotxC/Wy02tsTIAEArwMWrXtPAzkYqW8Fl7O/cotjQwA6Bu?=
 =?us-ascii?Q?cNZRwe7/pFuPe9Sna3Wq0gBNzmwcVQauey2oDXqCI308gk9I2KnFsh4Ya9XJ?=
 =?us-ascii?Q?tKosaMcmo6/Sx/KM0dPCprHAGY3PobLgfqv6msp5Gy9RNr7uDvmG1DVsdwuq?=
 =?us-ascii?Q?tIMXv7Z+9WE4zgAnZ+LbuUzdov2m4cCIK4KI6l4tRWOFJrozyctVgjkm2GWh?=
 =?us-ascii?Q?R46lLOhe3906mzmfdewcKArZdKZkTSXWONVBDr+XLuYUBJ77vlnLo1qTzAbx?=
 =?us-ascii?Q?HCvFs2g4g32MEuq8Vg+w/fzsLWfy0BRIYRoYoj/zE0vcthX7MzYdPZDoNpuV?=
 =?us-ascii?Q?pMwTrC5UoRgD35sdCBqMahN0nzsmx64r4gICRN51XnBiMPUUahgZPXxdM8Fr?=
 =?us-ascii?Q?W0o6n/13F2fzleOuiENAbRDyO4vhcDxFYP0rWSHySfL3CZ5ZUlnPX0iQnT3F?=
 =?us-ascii?Q?0iXX/+sBjU08PCScANkWFhPHnUryEeTuAlAtmcfQHYPhR00MxwuQ0zsJF5ZH?=
 =?us-ascii?Q?nvy4Ef9du2A6ZlH6aB2m7WryPz3x3vxyJw2UpxWUx69v0LHSvjz7wOdM7u3X?=
 =?us-ascii?Q?X2CSe/QE8Ie9X0VKoqYZJfsfxRbeSrwkjNOI2xDBpBdua4doW3ht68RVfe/L?=
 =?us-ascii?Q?h9i/HnIk3g6Bc3LhGyrMxPZWwJ4CCmFQ4a/M8xVjdoreTzQy+xKHOij9g5Ho?=
 =?us-ascii?Q?tXqJNVokT1TGIRrg/j2MVvlHqZrv4W/Aq7kn2EHyk5TVMeEuVoHpIJATT3Az?=
 =?us-ascii?Q?OEmxBq1vh9eHmklybit1FKy05moi6umdZALehiYL4z3Wev7nQJ4UOA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SC164E4nTgQJBNKseGlwCSjbQJjYJKeyCFdyu83nYbxf2pFFGgp/b3UWL0Lg?=
 =?us-ascii?Q?Ql6Zat1stC3Rqv2zgWTloecSc0ox/sTQ/d4KSbxI4VfInQukRFDGfuww3NoN?=
 =?us-ascii?Q?2WTGlXDQwiGbWZ9/1nXTe6Xe86vB7XZjveHvGllCIft9xIrTSvJC4Tbistea?=
 =?us-ascii?Q?J+0UXTn/wNNuPtslxmmfCTyOXje87Cm1Bqv6jjZ2M5GRq4j67nKs4X6ZKp0H?=
 =?us-ascii?Q?P8ozE2Nom10eLvLOLPUraJCMuUwEx8C1wMNdZgvkrg0X4UMfa5JIvtdWV2Yf?=
 =?us-ascii?Q?Npmwo7SY5F/aJXEpCSlnTJTnXTo/6za6FWJc+s4zsvJdQbjJ/X93CAP0IcOb?=
 =?us-ascii?Q?QG++NNtWryFilvddxuUyrSzNRShqY/rheNzatU14DSY5Sr9elIWgL8J86snp?=
 =?us-ascii?Q?CUUvlrpl4N/iXPN+NzHGTx4xzGwzZCEIoRSHDIOUvG9NjlTJt4l2z0i3cWaU?=
 =?us-ascii?Q?3cTHtaknZjJPA8qJP9oFtDPh31SoYatrOiDrgMFSMqyRc62x2yCX1WNLXZI8?=
 =?us-ascii?Q?eWf+nnUGTl9zLzHCBc7aonKHj9Ccn/qgf2U/8X+fmL9j11Tsjd08Z0e4nhDJ?=
 =?us-ascii?Q?eGUJ7Ziy32M2hLhhIQUptDF1E9R3zbMfg2bTWslXkbOWXrLApMv2jlmnkYKu?=
 =?us-ascii?Q?yWH6SBmfrZMqSP1DeWiZ6NRpwkbCwwVitbJkt2E4xQBchhPcSE3/7oDeDxaK?=
 =?us-ascii?Q?xdd740eKTTH8JFrrj/MBlQJEdgSsdeKdtmy4klY/VCYCHaDd5ab0o6GO4lhd?=
 =?us-ascii?Q?b8AXVLBIoSRtP4L/OVjo8MXiOt+n2IoTTVuEswLxPI7owjnEtwy2TEhxjcMU?=
 =?us-ascii?Q?wccltWeRVmg6givCFwas/vMg5MFNkK3J5sbtGcNW+nH03JyyzOgJwsaaMmkM?=
 =?us-ascii?Q?K4PuRqJrG1t48fg6kAkcO15Z7yvd++TW5TTo8ToSxAffAlGEK93nCUxVwugx?=
 =?us-ascii?Q?ZGeyVsqzlFDDkMbz0R4IfkqRUuORrohXjH39DZ+0NTYp4ZdTbE0ihDXqggwy?=
 =?us-ascii?Q?mdQJ2Tr1ekjZOQUvh3Y/3Dac+j/5FxqQA3TsUcETqvu5041soY/nGwOGwj9d?=
 =?us-ascii?Q?BIbfbI7PuZk12Ej8nqmGQzgj3ak1uMuXkvryK4uRa8RT3EjUB7VXuiruAzDo?=
 =?us-ascii?Q?1/pmkl1k49t1+JZMvwBmd0gWHfVxnkQQzAoFd3uXPu1QiAXj8InKv0Sodetp?=
 =?us-ascii?Q?M7iBMzj4NCMgryUwtr+W1srhNRZcvy/Vhxk8p6xsx1wpv0AUqOOl6AQip03l?=
 =?us-ascii?Q?muf+vbaEWjRmOATH9dV7xhiW8X1kaaBEfFUi+gQMxTq8dCOYdWpbF1+rquJD?=
 =?us-ascii?Q?0RGcznU5Ik6woGAz7abiE3dWDSwKPIdm/QELcYBLlco3T+p6Qqp7WtrSpvXB?=
 =?us-ascii?Q?ZcTsAdTNiVVaFBIxfFmkB4Fyf3p2ZM0LdwGj1srQhVAhLmYP6KbWrvKAcRDb?=
 =?us-ascii?Q?fIzeghNJs2vdb/AuzQX81GoIqkbNSxz3OCCwzVUwNdWGBH+V8n52sQZXkbqL?=
 =?us-ascii?Q?GDPuC8hmjOEcXPeZaGVKlo/3JV1aIlZaA+7h/GzZqYaVb20RQzf7JjD6NN3S?=
 =?us-ascii?Q?K3iYQiws7TVQlbv75l3zFfo2QH6O4P9xUt5jWYS/LD6ZfTKGTXDc9y4FyLi5?=
 =?us-ascii?Q?uof3KVnRlpGtNk0+lLYPrMnQqkHgN3HI52eJa3KPZSDb+lOc1aDu8dDY/k7i?=
 =?us-ascii?Q?CLm0ZoFP4rh5oqcGyX/I68on3Lff9yLLrzkvKM0PS1jQ+Zvk9HRO67b4SSCf?=
 =?us-ascii?Q?bUMKzhkCDg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TYRP286MB5995B67B327F77AA92B68533DBB2ATYRP286MB5995JPNP_"
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a728985-deac-4d4f-8e1a-08de42a03a6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 03:55:07.5545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7a4G8v1Y/hxiLJ1B3xfUcRtK0qtPZ8ddGMTdrJhKTUM16KPxSVJUjjtDu+ENwmSHW3E9KjBpCaAPi2SfNIJP67enLrnYYq1hW1fR9XzD4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 03:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228518

--_000_TYRP286MB5995B67B327F77AA92B68533DBB2ATYRP286MB5995JPNP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Randy MacLeod via lists.openembedded.org
Sent: Wednesday, December 24, 2025 10:48 AM
To: Ken Kurematsu <k.kurematsu@nskint.co.jp>; openembedded-core@lists.opene=
mbedded.org; Ross Burton <ross.burton@arm.com>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda <ikeda@nsk=
int.co.jp>
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

Ken Kurematsu <k.kurematsu@nskint.co.jp>

--_000_TYRP286MB5995B67B327F77AA92B68533DBB2ATYRP286MB5995JPNP_
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
span.20
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
family:&quot;Yu Gothic&quot;">Hi Randy,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> openembedded-core@l=
ists.openembedded.org
 &lt;openembedded-core@lists.openembedded.org&gt; <b>On Behalf Of </b>Randy=
 MacLeod via lists.openembedded.org<br>
<b>Sent:</b> Wednesday, December 24, 2025 10:48 AM<br>
<b>To:</b> Ken Kurematsu &lt;k.kurematsu@nskint.co.jp&gt;; openembedded-cor=
e@lists.openembedded.org; Ross Burton &lt;ross.burton@arm.com&gt;<br>
<b>Cc:</b> Masahiro Mizutani &lt;m.mizutani@nskint.co.jp&gt;; Yoshitaka Ike=
da &lt;ikeda@nskint.co.jp&gt;<br>
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
<p class=3D"MsoNormal" style=3D"margin-left:42.0pt;mso-para-margin-left:3.5=
gd"><span lang=3D"EN-US">but&nbsp; it doesn't look like that.<br>
<br>
<o:p></o:p></span></p>
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
thic&quot;">Ken Kurematsu &lt;k.kurematsu@nskint.co.jp&gt;<o:p></o:p></span=
></pre>
</div>
</body>
</html>

--_000_TYRP286MB5995B67B327F77AA92B68533DBB2ATYRP286MB5995JPNP_--

