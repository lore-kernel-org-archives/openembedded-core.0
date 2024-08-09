Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC3AC52D71
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 07:07:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.78807.1723187265650888783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 00:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=kNuOYMIi;
 spf=pass (domain: siemens.com, ip: 40.107.22.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiVpohG3n1KEClJAoMg2QaNltA4+cRaL9yevU+E7+z+wi7LdKrpJFT/lCQtMN2L8NGVZIAkmHsxOVrVQoVuRqFIsQAC1Jb4km2Gq0GIcLx3Du8IHvHXqDAepQmMpyZE7RHOJthf87LRUYuhBz4uoZnE2Pr4loxDEyAFv16Ccet3SPjIIBpfuIcCj5VqNTRq8xsmDR1/nqxHK8LSadWSF7xR0gMxzsPc5MSQ3xH341QYwGsLzvFQ8RhgB+zjGrh57ZRC/acro7ccS9BuFQr/mbH+MRZm5et+eBrycYFIZEviuNObtF7IXMYqmgUZ3sprjm4pXGIEzavKG6W3yxA9r2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtnZiALIJWSc9tt6Q3NzDrSg7nC2HzbobIhgEzcbaZM=;
 b=fR95hIHQEubpV7iTkNRJjZ4MNaX5OaYModEzaxhFF7jAruNBubyFPc0eZg9SF4Jp01YqdaLGjUvp8CI9R8MWuNa0H11+kgD5Gfd0guWHPon9I/y1OAdqS27sfo7OrZv5ZnYbIrc4w8Td4DauRaIzEnTCK6lIAmwlxyfILtGGe08AbvCRwt5ZrSVWhgZ8+GdmVCWNlNsZzHOduNOndR7yk/9+TZec/ROc4jFO6+skfG2xFgR5BKVO+vSlaMoVYKya04CXqQhjLg1VX0FDPAAP76MiGB2rYHSI9Tp/bDsCTUoCtYQ6qIzDIZogt0JOQs73YjZrVj+lgInoWW43w+vAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtnZiALIJWSc9tt6Q3NzDrSg7nC2HzbobIhgEzcbaZM=;
 b=kNuOYMIidjpEx95X6FlNA9JgywOQhNq0IEi8Eg+OYQmpfYzB0qcz3ybButIE02oqTTGVa3VIJK3NY11dgpKgJYDUAPGSZxHlRFGx9la0n+GEJdw2IJQrnGuQBghIorFig3Dal6bPU4KYMxwGvx+ICRMw0Q/h6JbX4lUD9zUUr4jywuVIORuYgx5WpN9QnYHRvXaje/pQEmXpULt5L118RIpBBpNXt9AhY81XZdqFK93L/jVHWNZMGxkIu4ztFEDiGh4su3+YG3/yNr4WZDVQyTNEUcsgxZB38OUj+E0zUjD7E/cRQsGs1SyBYEDK9W0+h1z3B6WOLJXq1ilpBRligA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB4PR10MB6168.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:387::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 07:07:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.008; Fri, 9 Aug 2024
 07:07:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: RE: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Topic: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Index: AQHa6iS5WMvAXQQOR0OfKkS2qc7kdbIeevFQ
Date: Fri, 9 Aug 2024 07:07:42 +0000
Message-ID: 
 <AS1PR10MB5697F5AC1D5981DC3523D59BFDBA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240809062339.15465-1-marta.rybczynska@syslinbit.com>
In-Reply-To: <20240809062339.15465-1-marta.rybczynska@syslinbit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b3b3e178-f436-4f72-a614-851e7b01f428;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-09T06:44:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB4PR10MB6168:EE_
x-ms-office365-filtering-correlation-id: cec7ba71-d464-49e3-f4f1-08dcb841f618
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?HPBz+gAl78gBCnuxlzoNgNDUIU/zuC6yfq8vWxNDXSpvP19fGUO9oDsP+aj0?=
 =?us-ascii?Q?jZeCI1OXRw0HnqLxWBwFNyxFo/Drj3CqEKCTSmI+tXPDb9dY8NGRDZv9zS/Z?=
 =?us-ascii?Q?cJSqC67Y91XLVVaCo+W6dC/vgQVJIVZrJMKrVo/U1VmNNSHxj8VTQGiIEzvE?=
 =?us-ascii?Q?9OhF53aDqTO3kwD1YCfDmQemovIN/7m1+LunfiW9G44T7tgdf/D43ejwO4n/?=
 =?us-ascii?Q?pRdbHUH+nw0GvSRS7vf00aID0hSCndC5nmat5W3tyt6nF6ZKp4Vv4GR7BCxy?=
 =?us-ascii?Q?XdFagYrmNTOlJkuITtLpM1PIiPJOSm7U2Qi9WCAIS4AUVD8WFhI+4MTTPk27?=
 =?us-ascii?Q?F+HJuAYpUSX2SU+mJrYbHULKxTYkMe86sDot5amowkiw4HMMoe41n0bOxI5f?=
 =?us-ascii?Q?YEWT6UiYROtCpB+ySR0YKB+Yaj1X8BhgrJ2BApTRzp73Ygep1CFkYpDeOrrP?=
 =?us-ascii?Q?UPhjf1iXcT5d57VKlDr7DqNgj0p70f2hBirU3UnBJnyrqfA3UGTcGam0xbeP?=
 =?us-ascii?Q?N7VKN6hK1hVVpZ7MHWTzr7HD2iEiUJamXAQ6JbxBJO2BdcNafEQE6NhTC1AA?=
 =?us-ascii?Q?Tf2Qm4mgw0LBhXMK6wm92gmcCMoz/d4Q9ClVRq+hkNBmQKItWYZFL9FvSMW2?=
 =?us-ascii?Q?Qhz8PFkfxe5d8UPtcUNt+LxeLQl58jDd9uewUktyO0ocbw2lSMW/p4s4AzMq?=
 =?us-ascii?Q?al+kg6Ws8oghqzTvxF4ryX0H2RG2xZZqscA5kk2UzB89SgStk+z9BzvlHnf8?=
 =?us-ascii?Q?s35ZOXFmaLoodiBN2ADow47np7Bu9aVUZNRFcfR+DD6Apgqwhso0mZO3Owey?=
 =?us-ascii?Q?KfO27oT2uV140oyEwgBLkz2FfG9yqf3sTewRfe/Lgm6OlxZn1ERn/CaKecUA?=
 =?us-ascii?Q?Oi2BKgazB3SHHQe0GYIkTtyH3qPikmvfmJqhnDxvNBmoTkim9733rWsHuIQ/?=
 =?us-ascii?Q?OC+tgsrUnffSfnmrKCZ1xDriZftL7cNVN1+pYYWQyCuHuPxLB9AUSN17BVKu?=
 =?us-ascii?Q?HBjwRWeaAeF6aPxqvX6GePcHB/3ZKz3m8ZntFEudIQ4iS3azNUj9RtCJ9XvK?=
 =?us-ascii?Q?earCucr9ZAtr2vRWVMsFCP08bMQ4R0ZJKiTToc6Bkg15EBGzrhd1E+VTg7pb?=
 =?us-ascii?Q?uY+/m6uK9GSslKRue+gafnyM7Ltvta3PDDRgampLSszhR1A1ZdJNeMJnHrRF?=
 =?us-ascii?Q?gl5GBw9gscXW4jZSmL0kvOSVJiedCmDdEwErypwIyCuLtiVnVyBvAedlt4Pj?=
 =?us-ascii?Q?piwmaxPzJCTSc4sjvKJXn0IpQ/AOK83Y6x1j/Mf+kYdOwKqgmTd21W/g1JzE?=
 =?us-ascii?Q?nT6A76kB1DI74ZfLq619BRUG6W1mlyEeT+TQj6YnDRjYjsIQwLj2oX3uwiMU?=
 =?us-ascii?Q?LnHaKm/h19D9M1yJW5UxNz1X0O4wWZqd43jM6R6msJQx3gtHWw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hMW51USq7OHOhHY91UWFLqAy3n3bBpXwTDrPejPOLIvXtYIzjiW+O56IuGqs?=
 =?us-ascii?Q?HtQh2VGSXfezbDrNo5n/oHdj5ai1YCBHJygaIXZrHP6SOll7sDWJEccGN4Li?=
 =?us-ascii?Q?f5RFrvzblH2eRPs18QOVaGRsl8zCTgdpKdDx9cQ8mGLhU3VujZX9loH+i2ju?=
 =?us-ascii?Q?3mBTYnefcXmDWPfGjwJiQ7TNcrHe35hTXgqi2J89Rvr2EiUc8aYQk9wrko7S?=
 =?us-ascii?Q?AKDexUzE/gW594bRgu8tLfow7ehTpf6Xiy6ljoJC9mFZ8Vr4bRMygCM+zoTk?=
 =?us-ascii?Q?6eDdY6uKAxQAY4n1Yz/ubXLha862mMWchdVPmR7R2oIZQnDZVJZutA45Y5In?=
 =?us-ascii?Q?bLmDZ5F0+1gjKdAtIcNlpu9XBbvBT1vfwgA0KS43JqLy9qKsAcfY6gYPqL9V?=
 =?us-ascii?Q?bDSuLFNbPxhWw28Z6foBVuwX/pLTZOfp0Eq9r3fGK/EL65VW0/V25X3iOAaH?=
 =?us-ascii?Q?qQagKlQbdzBGb5i7HHb3908u6yfsVyViyuTFki/DNUX9DaYF2yaim2i5jMyN?=
 =?us-ascii?Q?kSHgb7hZ1mCD4rePPYhczue/XnkANLoukZ8UCYEHioaCcVw3UC6s/MoMWxFB?=
 =?us-ascii?Q?d4u2KuVctlvcdoNxZDdb1LDaGEVUAz67nwU5zQ+xQS9GM4L7xNSKn4dmkao7?=
 =?us-ascii?Q?UbZrW7/zSZG4ggLM1zWrGA9LI7z7PdBIxjzk6m8TNOV6khjzBdxQObzw0UT4?=
 =?us-ascii?Q?kbCme0lldjLqrgW4YcsfKYCwNXsEMxCyuXLkDNqueZB2BL2STHYrd2cufuvj?=
 =?us-ascii?Q?0jBdwzGRC1Rjikrg/9W5/Qns0Xb1JtMtoZhh2OnrS5JeKPzFyGS/stQVqSMr?=
 =?us-ascii?Q?CgGjw5VnA8afE95pLmyvtSK/slP8j7uPIlx0E4h8hyc7M8DCVpppOkuB5mmT?=
 =?us-ascii?Q?P0/U/3229Sd4/bjAyQONf1qGDoGBCaoMgf+A9RT/crP6X7bxaBQqNu1yq6Yx?=
 =?us-ascii?Q?K9hC8GBB9kbWCga6VC/i2LVt4Pz/GNIx2UxExTH+PhPkXg97KnlPtNCyG9hF?=
 =?us-ascii?Q?I2SohlN+AbUwNmykulHdJsNFLyIozrJ+o9Kx9r0jc8Pl97EOjKUmT0QHL7+Q?=
 =?us-ascii?Q?AgMItd4GZIYGmwyfD7UMff3MD2AKuEKXk05HriI3fIZVHxC+RGozog8LIChK?=
 =?us-ascii?Q?LWHNvD9U1N0keo7qPIgWuRKkru+gdOAMkAbodncgeGLuvfyGn6kRRj3H78rT?=
 =?us-ascii?Q?mMu5JmiLUpHYSvzeLJbMGtZ5/eidH6xqM241kk9xjseLonGV8TSXXyjE7W3C?=
 =?us-ascii?Q?AES8pNLnPAHD7aKn22dCHeelfUSqoR/k63DcjuVOkF6IMUW8V8qM9EDxqbyS?=
 =?us-ascii?Q?7+Zf84YB2icSCvEyu91FBq3EHbmwmYs6+aZ3DoiSl2tZ4LEK0RdjYjWc8hsh?=
 =?us-ascii?Q?e3Y2dB89LZWBQI0GiUMpJZvCdhV+RS6bZo+O2nVnva+93Q/MtKFci2OLis0c?=
 =?us-ascii?Q?mbLkglQfeQJKVaYS+JbqOGZ0LWG+8xuVYL+jdA8rp6F4B2r0I//LG1kZqw7Y?=
 =?us-ascii?Q?dI/9tqyTEh6jVC7cY4ENgCTlgb+NDW83HCVhAYDaenR4JB/qUgJqZVJ6cCGH?=
 =?us-ascii?Q?3DJtJHOPFSZFXFnf+pQYXkTAQBH+ro9+P2G8VIYc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cec7ba71-d464-49e3-f4f1-08dcb841f618
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 07:07:42.0451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJNtR+Iy59eSrTmrvRg1gbhSPLZ1nlS7EZToxgmeSxfbmhbRAcUOPGBVRLrt81gHLrR1LD3mBks8Xl9cESs1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 07:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203157



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Marta Rybczynska via
> lists.openembedded.org
> Sent: Friday, August 9, 2024 8:24
> To: openembedded-core@lists.openembedded.org
> Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Subject: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
> product/vendor in CVE_STATUS
>=20
> CVE_STATUS contains assesment of a given CVE, but until now it didn't hav=
e
> include the affected vendor/product. In the case of a global system inclu=
de,
> that CVE_STATUS was visible in all recipes.
>=20
> This patch allows encoding of affected product/vendor to each CVE_STATUS
> assessment, also for groups. We can then filter them later and use only
> CVEs that correspond to the recipe.
>=20
> This is going to be used in meta/conf/distro/include/cve-extra-exclusions=
.inc
> and similar places.
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> ---
>  meta/classes/cve-check.bbclass | 24 ++++++++++++------------
>  meta/lib/oe/cve_check.py       | 22 +++++++++++++---------
>  meta/lib/oe/spdx30_tasks.py    | 11 ++++++-----
>  3 files changed, 31 insertions(+), 26 deletions(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index c946de29a4..bc35a1c53c 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -324,8 +324,8 @@ def check_cves(d, patched_cves):
>      # Convert CVE_STATUS into ignored CVEs and check validity
>      cve_ignore =3D []
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> -        if decoded_status =3D=3D "Ignored":
> +        decoded_status =3D decode_cve_status(d, cve)
> +        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Ignored":
>              cve_ignore.append(cve)
>=20
>      import sqlite3
> @@ -507,11 +507,11 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
>          write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDP=
E"),
> d.getVar("PV"))
>          write_string +=3D "CVE: %s\n" % cve
>          write_string +=3D "CVE STATUS: %s\n" % status
> -        _, detail, description =3D decode_cve_status(d, cve)
> -        if detail:
> -            write_string +=3D "CVE DETAIL: %s\n" % detail
> -        if description:
> -            write_string +=3D "CVE DESCRIPTION: %s\n" % description
> +        status_details =3D decode_cve_status(d, cve)
> +        if 'detail' in status_details:
> +            write_string +=3D "CVE DETAIL: %s\n" % status_details['detai=
l']
> +        if 'description' in status_details:
> +            write_string +=3D "CVE DESCRIPTION: %s\n" %
> status_details['description']
>          write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
>          write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev2"]
>          write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev3"]
> @@ -637,11 +637,11 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
>              "status" : status,
>              "link": issue_link
>          }
> -        _, detail, description =3D decode_cve_status(d, cve)
> -        if detail:
> -            cve_item["detail"] =3D detail
> -        if description:
> -            cve_item["description"] =3D description
> +        status_details =3D decode_cve_status(d, cve)
> +        if 'detail' in status_details:
> +            cve_item["detail"] =3D status_details['detail']
> +        if 'description' in status_details:
> +            cve_item["description"] =3D status_details['description']
>          cve_list.append(cve_item)
>=20
>      package_data["issue"] =3D cve_list
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index ed5c714cb8..f71fdc672c 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -132,8 +132,8 @@ def get_patched_cves(d):
>=20
>      # Search for additional patched CVEs
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> -        if decoded_status =3D=3D "Patched":
> +        decoded_status =3D decode_cve_status(d, cve)
> +        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Patched":
>              bb.debug(2, "CVE %s is additionally patched" % cve)
>              patched_cves.add(cve)
>=20
> @@ -227,19 +227,23 @@ def convert_cve_version(version):
>=20
>  def decode_cve_status(d, cve):
>      """
> -    Convert CVE_STATUS into status, detail and description.
> +    Convert CVE_STATUS into status, vendor, product, detail and descript=
ion.
>      """
>      status =3D d.getVarFlag("CVE_STATUS", cve)
>      if not status:
> -        return ("", "", "")
> +        return {}
>=20
> -    status_split =3D status.split(':', 1)
> -    detail =3D status_split[0]
> -    description =3D status_split[1].strip() if (len(status_split) > 1) e=
lse ""
> +    status_split =3D status.split(':', 3)

This effectively forbids usage of ":" in CVE_STATUS.
Since "grep -RI 'CVE_STATUS.*:.*:'" already yiealds 8 results for oe-core +=
 meta-oe, this is not a good idea.
I'd propose to keep the original split and check the first word of the seco=
nd part; something like:

if status_split[1].strip().startswith('cpe:'):
    extracted_cpe, status_split[1] =3D status_split[1].strip().split(' ', 1=
)
    # fourth part is important here to not keep possible trailing ":" in pr=
oduct
    extracted_cpe_split =3D extracted_cpe.split(':', 4)
    status_out['vendor'] =3D "*" if len(extracted_cpe_split) =3D=3D 2 or le=
n(extracted_cpe_split[2] =3D=3D 0) else extracted_cpe_split[1]
    status_out['product'] =3D extracted_cpe_split[2] if len(extracted_cpe_s=
plit) >=3D 3 and len(extracted_cpe_split[2] > 0) else extracted_cpe_split[1=
]
else:
    status_out['vendor'] =3D "*"
    status_out['product'] =3D "*"
=20
> +    status_out =3D {}
> +    status_out['detail'] =3D status_split[0]
> +    status_out['vendor'] =3D status_split[1].strip() if (len(status_spli=
t) > 3) else
> "*"
> +    status_out['product'] =3D status_split[len(status_split)-2].strip() =
if
> (len(status_split) > 2) else "*"
> +    status_out['description'] =3D status_split[len(status_split)-1].stri=
p() if
> (len(status_split) > 1) else ""
>=20
> -    status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
> +    status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP",
> status_out['detail'])
>      if status_mapping is None:
>          bb.warn('Invalid detail "%s" for CVE_STATUS[%s] =3D "%s", fallba=
ck to
> Unpatched' % (detail, cve, status))
>          status_mapping =3D "Unpatched"
> +    status_out['mapping'] =3D status_mapping
>=20
> -    return (status_mapping, detail, description)
> +    return status_out
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 9d5bbadc0f..fd80713234 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -486,21 +486,22 @@ def create_spdx(d):
>      cve_by_status =3D {}
>      if include_vex !=3D "none":
>          for cve in d.getVarFlags("CVE_STATUS") or {}:
> -            status, detail, description =3D oe.cve_check.decode_cve_stat=
us(d, cve)
> +            decoded_status =3D oe.cve_check.decode_cve_status(d, cve)
>=20
>              # If this CVE is fixed upstream, skip it unless all CVEs are
>              # specified.
> -            if include_vex !=3D "all" and detail in (
> +            if include_vex !=3D "all" and 'detail' in decoded_status and=
 \
> +                decoded_status['detail'] in (
>                  "fixed-version",
>                  "cpe-stable-backport",
>              ):
>                  bb.debug(1, "Skipping %s since it is already fixed upstr=
eam" % cve)
>                  continue
>=20
> -            cve_by_status.setdefault(status, {})[cve] =3D (
> +            cve_by_status.setdefault(decoded_status['mapping'], {})[cve]=
 =3D (
>                  build_objset.new_cve_vuln(cve),
> -                detail,
> -                description,
> +                decoded_status['detail'],
> +                decoded_status['description'],
>              )
>=20
>      cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"),
> d.getVar("CVE_VERSION"))
> --
> 2.43.0


