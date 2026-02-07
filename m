Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6B1EE0AEE
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 17:29:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9258.1770485381476486458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Feb 2026 09:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=TNVEat6n;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.64, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrRJ6t3Ur35RSsFU4jRjbQDFb/feMlCQodg3OycGiXknYI9k/e2X6Y3EyCzQygqk9RLXEYBXHbftKfi56wwrCtOSV4g4ridAeXC+vLKiNYtqSQYo6WGzezehG0T0XsU1F2LjWxwMK7Le2SfJFSHauLveJ9R4klcUxbD6V9obFBYunIRFmTA/j5QVrjfi7Cc/0pxxkuyTJaNj7HXWM5If7/dqCr1hjxLm7Z3luKQOUFp/J0Z5/Jzvrvaw1k+QW+MAQXkAC5ilzmlJxqKLjzzxnymTtRMHwwUbquPmOcifoDpM2gSHgF9KYW7Z768+qik6WutSEK11cRWCgnW26pwS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26MUyuMr0pJu+J2nqocN6leB7rI0XQwZdkjCKqx7yhI=;
 b=pK6/G+vN6txN7rPgEkESM5rmekAToRD8L0vkrciaj5wmaexf69OQp5GeMjTYQqa8ZncUldBcSlJU1BWxzq7EfX32K7cKMpk9qL9WrewGuz0EQUsl4w1WDiMUJRV8T/ZQdpdbHZb7QbHgzMtJmq1qLe1sBgjNRC4qKYitUceWvtXtzioIhnKxLTQMEtRQbBCjzp+Ay/pPStizzYHYMFZcP1oFeJ8fV/KsPtwoEH2+bMbhZJ+on7/S2qjRn7Oy6ttgS7NdHyHHirAQkpX8aANp9N2PGzyuxsltPNNbR+Uf6Pji3hdeLyNqJ2hTXhlgQsq2Q+k+dW+OJavNEiQ5gWM9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26MUyuMr0pJu+J2nqocN6leB7rI0XQwZdkjCKqx7yhI=;
 b=TNVEat6n0dAEAVmj/3KDzOlaKZnkDFxtaogu/LTnZbxaMV+vAbzvZjzS32Kf+6y79Tow1HqnLvkFpBFMEoWYLnTvF23Y/M/S6d0w3j5t9iFyZ9Hbff3+C3djmHvX2KL7MJeeB1t58c/pgH71URvxiT3LpYM6+NgpKB18R36w3ZU=
Received: from AM0PR06MB6323.eurprd06.prod.outlook.com (2603:10a6:208:174::32)
 by GV2PR06MB10580.eurprd06.prod.outlook.com (2603:10a6:150:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Sat, 7 Feb
 2026 17:29:37 +0000
Received: from AM0PR06MB6323.eurprd06.prod.outlook.com
 ([fe80::90f1:4ff0:62a5:8d3a]) by AM0PR06MB6323.eurprd06.prod.outlook.com
 ([fe80::90f1:4ff0:62a5:8d3a%3]) with mapi id 15.20.9587.016; Sat, 7 Feb 2026
 17:29:37 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] license.bbclass: directly expand LIC_FILES_CHKSUMS to
 apply inline python
Thread-Topic: [PATCH v1] license.bbclass: directly expand LIC_FILES_CHKSUMS to
 apply inline python
Thread-Index: AQHcl8jBuzJilm98T0+4HFxcdU8FX7V27vKAgAA9q9E=
Date: Sat, 7 Feb 2026 17:29:37 +0000
Message-ID: 
 <AM0PR06MB6323F7EFEF055C90E00DC908BC67A@AM0PR06MB6323.eurprd06.prod.outlook.com>
References: <20260207002856.2847527-1-johannes.schneider@leica-geosystems.com>
 <3d9da9404610ce4c80ff8b086a041ca242422e8d.camel@linuxfoundation.org>
In-Reply-To: 
 <3d9da9404610ce4c80ff8b086a041ca242422e8d.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR06MB6323:EE_|GV2PR06MB10580:EE_
x-ms-office365-filtering-correlation-id: 7540aad2-3b25-410a-9dcc-08de666e7793
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?GJ5SKNEBrmMS8sQBwV41uQWWFjET3UCLqjGDqJaj0MCFSvdklzL5Lrlg3Q?=
 =?iso-8859-1?Q?jezLjC6r2kBeDJ168QSuo1VN9rZvZhdBlpGMIk/68m8O3/ROfl12Bl05J9?=
 =?iso-8859-1?Q?LLRsPd1PurPoG9DJGHJd8oCok1L/4KJIGLdV+8IUXzW0HjJifDb7cwHhLx?=
 =?iso-8859-1?Q?LvaMPWab1iv1FAN7UwoRICA4udyFbUQ+SvlUebgpV6OaPOn+otWy8X2EmH?=
 =?iso-8859-1?Q?nU28PMBugjiYHcit528vYzKa4eQZPo0WlXjhi0XyphhqaYRW+YZUMyH1Da?=
 =?iso-8859-1?Q?rn0V16QGlDXQNpY/LXP0alGGBdVyApHyzYuiqdCJNMstYEtiNVvg0GjMRi?=
 =?iso-8859-1?Q?1r4ztNtYm5zG7n5SwMuvRNkoPXT/Da9SnQ9sPncpHXnUcWtpOqMbzSdV4f?=
 =?iso-8859-1?Q?v0RX906ilQcyRP5U3eanu34HLYmNUJk2SxwzZMLaS5vac+/sXg6udCzl+g?=
 =?iso-8859-1?Q?htKIS7RKwzKxbOVIIlSQliMLxdMVPfWLxBXGpg1EDeDgSQIqGBevfZofDL?=
 =?iso-8859-1?Q?ucADoZONQ8jzKgS5/5dsMTKtBGu1uhGC33J1dtqnierwtoVF64N+HfMaOg?=
 =?iso-8859-1?Q?zYFBFB4fKxEQFaQDm6GW/kCxUrMCbq7YRaehFdATbiEMRkTApXRQKSyHVy?=
 =?iso-8859-1?Q?p56OEpkKOEB9m1fumHIf7O3Q5bN3i88NuVUx2DB/XlyLQV0xGnYM5gQc7a?=
 =?iso-8859-1?Q?jemp1UQLm2PTtmJQBJiRdaGaSZuluJpCI/Fg8EVlQX0UmUxJQ+GUZSqPc3?=
 =?iso-8859-1?Q?wXBfzc0jLlAj04DvrEwP1+rGdWpF1ZTvBASE7NBc+3nueaC5hiC6hSXPVN?=
 =?iso-8859-1?Q?cVGDV7mUBlx03Tci8XuNukMFsOZFwrPkOrCpE9+7/02/9+lt8AqaP4AbTk?=
 =?iso-8859-1?Q?0Me/GbiRg8y4/IWBiAzKnKiqf1XnVill1iUZdgUWmwxj077dobCwc9vnQv?=
 =?iso-8859-1?Q?twcjTf0WP1H/De0sIsuvYlz+7zuHIiGOx2Ojce4PhnNJZSIWrqbD2glbxE?=
 =?iso-8859-1?Q?0i7utwcV/raRSo+GMWSPFsG6K6BrOOkSmZQ7ybwaAhxejUuCcCmYVRvD3x?=
 =?iso-8859-1?Q?UPaMvHRTYO3Wz7Tnx11P3MJbKGY0eYKyhT6iol/kYgnp/ne+lCJiEZwr76?=
 =?iso-8859-1?Q?44g2UBolnpij1fTORwz3aYSAvwDYbkvqmHmx+mUrM6TB+VhQpDjPQTLHj/?=
 =?iso-8859-1?Q?AakfdVdNmUlopYCqt2sD3qQtPkLz6C8IaDkRJXi6+maU0ppRsDnnSbl/9r?=
 =?iso-8859-1?Q?+covvSk//XjAEnD2IXlb/Wp6K8MO1wAg6/+HBXmkQ1Bph+EMcoOyYBsUBb?=
 =?iso-8859-1?Q?I8+oPu/0ZA2jJpKmPYxnZH4CQqrZ/l4ZPLfUlfte2luwxN9Cpbx9T5YKyz?=
 =?iso-8859-1?Q?Gr63xUnA4DbfyZVB+X2G07CWqn/MgD2dKHJs16QdsVoHqEReGOIrEgwM8Y?=
 =?iso-8859-1?Q?3UkpnDvMyIUZHnACPwmS0b7cYLXVt17Aj++dMnZ6MLI/ryl9U0FJFMamU9?=
 =?iso-8859-1?Q?8O3Aiw9sZV7volm+oyIQIOn+5URYUUe7FhnmsvitntKE2xApOu2/WmrHq0?=
 =?iso-8859-1?Q?9TM7nvhp81vVvAvmbd5V0fMhi5+bMhUtusjWpcHcIwyicb6EmG0DfUdYt/?=
 =?iso-8859-1?Q?mXpL4HkKqu6yyinKG0Pv+QcMQYlSbGLNeAWYFfqvUxnqjOJdtU/f1Tor4s?=
 =?iso-8859-1?Q?uWj7BmojdXkron916NI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB6323.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?mO1nCppFiAovNcJknrEVUQ8GLF1nYPTqgkCOpmZ5jIJbJrt7hPLaJKFyoc?=
 =?iso-8859-1?Q?JCWspjo68OCKo22QukhBcQ4m8EtwLB1an7JPWSx/8GnhDhUmxz1U5gfvmB?=
 =?iso-8859-1?Q?M8QPPw+3JbnoQwZmGVnoTeuLR7IVWfmQDXkkAeSRBIqFz6k4sIlxn0/WfO?=
 =?iso-8859-1?Q?vVcr5K5AT1l5coO5JKJ35tgC49Ge6COVN/mFhV96T16+K9xrWU99v5fcmr?=
 =?iso-8859-1?Q?EQnBMgzNqWH5U/FZpwJ265pLlAEk8Ixb6sHv6KPnrmntD5xBVzKeV/0NIk?=
 =?iso-8859-1?Q?y37O+zu6tp9IcjWVpo+1Mn+thV9xD21o0oI0I5ZBgw5AawJmSFbGHGVGb5?=
 =?iso-8859-1?Q?2+z3nfVkKF06OW2Vvj7zb0wbQJIqHKUcVuEqkBUoRJ+ZwgpieS8d+2bMqh?=
 =?iso-8859-1?Q?DfEib58ffPZRHTPZF7j1fjrE6CKp08ryD7g2WVvTbHZYAps3ldMZO1uyNR?=
 =?iso-8859-1?Q?bTvzwtg1jGD3/vVw17US960L5iSFe6VQHBYTY6tHFW3Js4HZyja1MuTmvG?=
 =?iso-8859-1?Q?QelQ1J1WIVkVoOXaUtiDykVEaMZ2ZFDfeYBMi8hvugtMPgMvPbKrH9D1OK?=
 =?iso-8859-1?Q?XyPyb2TdxTlqcYzoXpO/TZI24VFTu61ALhX/wqIZJUr9PBYHKFb6q9YmV+?=
 =?iso-8859-1?Q?T8nLPDKR9m1QinJ3QUmbhaXf6+ZIKN50N9uznqJJ55EN3FhGUed7vN0s6w?=
 =?iso-8859-1?Q?Rx5lbqt8hbSxxke2Ck1NWm4rw7YBrVDJ40eZ0cntSF7D9pQ6mOGnvRxBg7?=
 =?iso-8859-1?Q?BxXpj+MUQHZf5JlRtyf4ltKC93uf031yB/itXmcf9aBDox7J4niiUPCVKW?=
 =?iso-8859-1?Q?ASs2va1xJ4YfChQ3hlb6o71UNHJL2QujWL17Ng+ELoEMHyxULbWuyzw37M?=
 =?iso-8859-1?Q?BFLB2wD3XE8bdyfKvdVVnkCEbRh/gwoF7sRznZw8SuqWdFD7zLKKA/j+u3?=
 =?iso-8859-1?Q?AjJwZiiODB7DWpnNR5FcLEpLhd0dsu+ij4l+LGlg+aZZaRmbVONQFlGjrd?=
 =?iso-8859-1?Q?d8juIiq0mt340ZO9uTdmNLVDxOST+8uC3AcC07cRjtuhJOcSKAcBBuPwMy?=
 =?iso-8859-1?Q?Ls665VByFQZzXUAoSmZMOhEJ40iDFQKOoNUY854S3XnY4LZQad/3v8cQOM?=
 =?iso-8859-1?Q?klnv2+IcwI4Efna+iUvA2BmYQ+vtNsdcFBG19oVDBdE78BEJnvbECXhZXu?=
 =?iso-8859-1?Q?WA8dPrIG+OMurPceB6PufGGIuQvzUoeHXeJoCWuhTjcEMSaN4Q5CnUjGig?=
 =?iso-8859-1?Q?ohkKyYegZjI6cXXRILceWWJa5WhdjDCTDwBvU5nFvQTmHaCs7rcbWmBEnk?=
 =?iso-8859-1?Q?ncWgaXIsTBC1PBrEl5vsN2R/n/Zu/8Br2/9sxlcJ/VvDC1cFCYVsSFSLMg?=
 =?iso-8859-1?Q?YvoWDYA+tozCV/zN9kcbLsMZd14B+aELgUeqAKUigTBP+/aFRCPmFPIqyQ?=
 =?iso-8859-1?Q?LljCsV5XWPLdIMwtwf3SA0sSbJxQqMD1nZsMla3BbyYwwFxoOuHRPPepAv?=
 =?iso-8859-1?Q?mTpBiVUmJ366RHvgIf96D5aoH0k8pk9FccOcnYKA+5pI4K/vAifCqQLF1j?=
 =?iso-8859-1?Q?mpLQwJY5q+3UoTwHq7wVUtkKRph36yxcaZnnUNzBBl8nrKEarf++CKJKrd?=
 =?iso-8859-1?Q?j9InjGuc4xEktIaSLkQe1shTKzAznwx3jloHXhtcaZZi0EMjuJ1nq5tfMY?=
 =?iso-8859-1?Q?07luzUUAtr2xZfQuCGvRLwJTq8DfKv6NbdwAAxGRhoqpcB8EDbV8yDKs0E?=
 =?iso-8859-1?Q?I5h3omqQ141G/lVVhSMTM9DXY7U45lzI8zkHvz28Xr8CVyx6Zkw4fsZS7o?=
 =?iso-8859-1?Q?L6Jz/pDJB3jLnotFXyM1vtIs5yVOpt019fkliZ+nFzFa6TW5SkrW/LvmhU?=
 =?iso-8859-1?Q?rZ?=
x-ms-exchange-antispam-messagedata-1: 
 zsXrl4GSD1w6IZlzxKp7k/enSK91w9JPccegCZXn6B59SWH+s/Fv42Zr
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB6323.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7540aad2-3b25-410a-9dcc-08de666e7793
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2026 17:29:37.1289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVWkee1C+GLGOJOMSOFBmQwh963QbclFSbJlmo3dLThT4/0IkElz20pry89hJc5Mudt1J2Z/IbT1MkiPf5ZaqnhlVwUZk+FtBZbpU+rhIdvvlD7fs1cCbrdPTIrMy7F5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10580
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 17:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230672

Hoi=0A=
=0A=
=0A=
>=0A=
> On Sat, 2026-02-07 at 00:28 +0000, Johannes Schneider wrote:=0A=
> > Add 'expand=3DTrue' to directly resolve file checksums that are added=
=0A=
> > conditionally with inline python code.=0A=
> >=0A=
> > Otherwise it can happend that the license.bbclass still sees the=0A=
> > un-expanded values and either misses or even skipps adjacent licenses.=
=0A=
> >=0A=
> > E.g. an unvaforable combination of=0A=
> > LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c=
6a58af8d19bee1"=0A=
> > LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '=
 ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"=0A=
> >=0A=
> > would lead to a=0A=
> >  # pre-expansion value:=0A=
> >  #   " file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1${=
@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', =
d)}"=0A=
> >  LIC_FILES_CHKSUM=3D" file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"=0A=
> > and the license checksum verification on 'license.rst' being sometimes =
skipped.=0A=
> >=0A=
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>=0A=
> > ---=0A=
> >  meta/classes-global/license.bbclass | 2 +-=0A=
> >  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> >=0A=
> > diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/=
license.bbclass=0A=
> > index af5f1ed41d..62116ba31d 100644=0A=
> > --- a/meta/classes-global/license.bbclass=0A=
> > +++ b/meta/classes-global/license.bbclass=0A=
> > @@ -125,7 +125,7 @@ def find_license_files(d):=0A=
> >      from collections import defaultdict, OrderedDict=0A=
> >=0A=
> >      # All the license files for the package=0A=
> > -    lic_files =3D d.getVar('LIC_FILES_CHKSUM') or ""=0A=
> > +    lic_files =3D d.getVar('LIC_FILES_CHKSUM', expand=3DTrue) or ""=0A=
> >      pn =3D d.getVar('PN')=0A=
> >      # The license files are located in S/LIC_FILE_CHECKSUM.=0A=
> >      srcdir =3D d.getVar('S')=0A=
>=0A=
> This is a little strange as expand has been the default value for a=0A=
> long time. On a modern code base, this should therefore be the default=0A=
> and the change would make no difference.=0A=
>=0A=
=0A=
of the default i wasn't aware of (or checked ... my bad)=0A=
My train of thought was that bitbake expands variables lazily and=0A=
thought/remembered (wrongly) that this leads to edge cases with in-line pyt=
hon.=0A=
=0A=
>=0A=
> Was this an issue you were seeing on an older release?=0A=
>=0A=
=0A=
indeed, we ran into this with a 'scarthgap' setup=0A=
(oe-core and meta-oe on scarthgap; bitbake at 2.8)=0A=
so not that old :-S=0A=
=0A=
More investigation later: it was neither variable expansion nor sstate - bu=
t a=0A=
change in our ci setup that i didn't get wind of; previously the do_populat=
e_lic=0A=
task simply wasn't triggered - now it is, and it promptly steped on an old=
=0A=
landmine =3D a wrong checksum.=0A=
=0A=
Please disregard this patch =3D> sorry for the noise! :-S=0A=
=0A=
>=0A=
> Cheers,=0A=
>=0A=
> Richard=0A=
>=0A=
=0A=
gru=DF=0A=
Johannes=0A=

