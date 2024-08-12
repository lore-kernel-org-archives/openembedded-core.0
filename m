Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042CEC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 07:27:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.62])
 by mx.groups.io with SMTP id smtpd.web10.40801.1723447653450854578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 00:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=JAdnjyUc;
 spf=pass (domain: siemens.com, ip: 40.107.20.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ0aaBD2gE+mzs/VfkQMAhax2WfuqlPaYNr/AqNyrVT/wBTnycdo1DsQpPlJplRUsAZgJYc+XSTPEEXc9NllUrlvaO85kUetJn4f41YYCGXNDWkIQjOnno6gKk7+HUugPpnLt0rD16UBEXwLw+K0s6aizHiai8R6Lviyw3C5vA1A081yZ7TP15/jIiVvex+ZNLbAfgUAK9oE/gaavsWt8ot/OP7//PwThMjDmVVRW2F/cJaxlEffVZzMtc4dwF1Eg7EKYUJlJG75PAx+UmFz/yWHZaNzXFwOubg2NRbhpTOzh267KlarKYs1QRXmgvH1K828MucTDD8JbztsudUcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFQqfTbZiKqp0LUQ11+vnbW3MgNX1MhS/qDtrjfwzzo=;
 b=LUiIg6dGfoy1CjOG09KBs1f7p4dzBTVg6eGotFL+ErSRcd9T/DAuS10+gihQu1+hUeWLEV6gR60FfeWbWDX1h9YTwOWwW9YsC+FEnGEpWIYM6tilhEsdT0+YBSgZW54P1ejRCILn9Yca4hfyepP67LyZtP2h3qI5vAzVgf5aQJKBxQvVKqVckv5P1m2BNIZnyjajDQFGi7XwxdQJ95AVXFMZ6XzxCQCcel2HlUEZBIXMs3dVybjdl7H/1/xTuZHRgV79giMuGjM6GgN6tD/bkLcShpGsoWgcs7v7HPh42GNcgOfO2MpOo5W1MZBnPZdhkI5zeoZMwDuWtWeosIpSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFQqfTbZiKqp0LUQ11+vnbW3MgNX1MhS/qDtrjfwzzo=;
 b=JAdnjyUcmnwJ/gf2ZuNc1/8hnqaDXOT2YWoEOXDfXG6qjbzrowk032WfU9VekLaTQhh0vxN7v4xLhZv24vNkAJKvBjDyBfD2v/rhwlUE/ZOuHg0taSoFbPOnVOgo/N2AqYNpe1cl6moeF5VbPyww5S1jf3rqAQhb4p2D+mx5IdeCx7wwaK6ZL8nLDznoLuL4MJGWIEajESwQ3t/T1kpW+6BLHdMb/ULXSlMhdLspt1xIu/h7zBlvSM+JzylMsvUPWIgUp429yYSUPgO+rK8brDmsFv8WjiLvgImw70uSDVeKbseJ7OXSKAguZpLG47jvkXyx0fAZRtWWHKBewcX3Pw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6183.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 07:27:30 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.018; Mon, 12 Aug 2024
 07:27:30 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: RE: [OE-core] [PATCH v4][OE-core 1/6] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Topic: [OE-core] [PATCH v4][OE-core 1/6] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Index: AQHa7G1xUV6x2HWln0mGBbUe6kjEGLIjNoMQ
Date: Mon, 12 Aug 2024 07:27:30 +0000
Message-ID: 
 <AS1PR10MB569726A08F833A7851C785EEFD852@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
In-Reply-To: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d10487ee-9e71-4eb9-b4bc-6dff33c5b036;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-12T07:17:26Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6183:EE_
x-ms-office365-filtering-correlation-id: e630ce74-cb19-41ac-6e5b-08dcbaa0397c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?KQ9XyAE2gSLniW3xu5pjWs4aO5TJxOFpsE4NufJN9bcpByAIvurpXAu2Iiip?=
 =?us-ascii?Q?lrzAw8GO7aIETZbfF7szvqdOMInvbyLdqcc8SnUMG5sAd0Tht3AXaJWjzk8l?=
 =?us-ascii?Q?m48ZusE9lE/NmFOxPqyGJ8g+PyMn9pZlhavLacyRvVg7DY3PD258GQYcyVYo?=
 =?us-ascii?Q?5RWhK9VJfMnlQTMe+b1z4q090luJJ5mXFejk1v6BqlhuAGLY4UhfoWVmbgol?=
 =?us-ascii?Q?tBgiy5sV696l3kGX9delN+wDYuEthZiJ5FZR1fKg4CRgXleye7+cxxLUiPlJ?=
 =?us-ascii?Q?caLiIN7kxZV3ILumQPQARoRG+hL93rEFvCxr/+k3E3kt+s5MNJlra+N46iiK?=
 =?us-ascii?Q?ttIJGGBsOIUy0Qs64BZwGpfibWq948i16fBioCpYDZQ3pLfu0TwOD1yUmjWP?=
 =?us-ascii?Q?U2G0DBkVrapsGJfm7RzuHeFerTLEOgpp92eFh06b0PTkVxffnHeuxEOSY7Ts?=
 =?us-ascii?Q?5wgxk6jKzC1fja+O5ty5twZ+VfOWiJfDmUiLpzhzAXzZn0ey5khYg3ySD4rF?=
 =?us-ascii?Q?yTiokmTopXVuv5yZFVceZHtr7pYIbO0SjQcDJIkq+VZFfM5/FI2GxM4aFO7n?=
 =?us-ascii?Q?QVn9VEO+t/tDzMwlWZc/0vI4VoKBqTn+nvhcd7XG60mXzWntFVFA4wfRKCJl?=
 =?us-ascii?Q?7jFKD6JL/NS98Q7X2Wa3mH02D14wLGXR8t3jDYltikJYCFW9EmekzYKBvIDE?=
 =?us-ascii?Q?qiFMqKGEKT9MeFHjl8fxUKzhT8Nkbvg1Lme7+hSUIrty0kgKXaEjaiKBLQyr?=
 =?us-ascii?Q?vgv7W6fzXrxZHOAYVDIqWYcZhPpn4UDHw6cVdyBM+KidFazW4ADgNqYBb4tJ?=
 =?us-ascii?Q?X7xfM9GRXYCiicFCGj97se7tuwEZf/pFhhLhe1erOG9a5vzI6H96VW10t7y8?=
 =?us-ascii?Q?iP+MiV4QF71YT8CYzocQtwlEvrPjq8CfWSG686n/pWhP3d29YHjDajBzAiw1?=
 =?us-ascii?Q?MVzN7PSWIsgn2KmgsHzNNEbbdLX9EDDLZHQqzq2eCZA8Z3EY4gM7JKGRdDqq?=
 =?us-ascii?Q?rDxJbKDG+efeCkl+UBUIFFO3PjIbGt+t64CTN9DAj5nPuM3JgLjFCTgP4Sgw?=
 =?us-ascii?Q?r5ymIHcJJdr3FlB2VplRt2nuO7VRlAHoAUfqNZVwvEiWHBkp0qeUWcEsHSWl?=
 =?us-ascii?Q?eJvwcdyASQ1EuR0cxpFVM+fsZ83UupGoPjFTc4qu4s+yvKc10IRa8n6i4lkF?=
 =?us-ascii?Q?Hhnrs0O7XDdUZwBaYuvk+2exj5IjsVf3KYQNbp9bmvsWUaQqkMnpKYLSChE2?=
 =?us-ascii?Q?c20HbXZR8PhTDDDncVJpfUgflF/4GCyetf8YBr2oI2YPeBitnRSGJC/8DqOL?=
 =?us-ascii?Q?W9bOAFuZja8MaoZflmEOYIodeHSduNp9E9uPfQZJ5q3buSm0KbLrPFfnn/S9?=
 =?us-ascii?Q?JFgzEn0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5mNyfRVKKJSBINTqq3HVbB1zsbs88L5TsAbzh3GmPZslRAqLwiJs4zUycZp5?=
 =?us-ascii?Q?xK8NqZXP4+h9gqw0PHSI73FIBkDYAYkyRIk3jgNj0oFnNlN3dtMx5aeaZFyt?=
 =?us-ascii?Q?YVejis0qkukptUkWNbdPAm7tOjSij0qTlulNsCWgMtKqTUSlNnK1WOaR2FSJ?=
 =?us-ascii?Q?G1Evi5PQD7+XcqaeP3p86F5K7CRBj+i1ZcDm2c0Rd+ibjBN9TNoOoBaT7sBX?=
 =?us-ascii?Q?jgiurNnjHm41qkrEkx8lR1X2iBOB745xfzVhzzFLyUkuFDxkf0CfDCGrxiye?=
 =?us-ascii?Q?nPRa/k8hFJRScIHdn8vKD0ObmkBQugxPDgruL57IXFVGEFozpZiD3islMW0U?=
 =?us-ascii?Q?BrLVZLyCxVKPlOCu302PcFhwz5vetUM/bSOgtW3I9Dgk20KbfBaKTxYlWif0?=
 =?us-ascii?Q?mfigF76XjuHCwTwnyaoz0Fk4GaYu/+Y/YCpgxsuEZwzVkc6AiPSuARm4t2tj?=
 =?us-ascii?Q?jqx/Oyxt38sIgpNtYOo3nND0Qb5A8sv/YVp2OqfGeUqSgaDGYYkIYqc+t8ki?=
 =?us-ascii?Q?mCip56Qg4FQ7Cm8js6irP26tt40ZpOIwhP9eQ0UWgnNFcSlFnwX1VHWaWbwf?=
 =?us-ascii?Q?qIyS8Z7RBcI5UvD5eHnfPFOD3WSBRpnN8Q/IV4BBkniF1HWRt7Tgn66HHZao?=
 =?us-ascii?Q?8vgRvEcfh4dyVi3ZWHKMjuBmvtxfspzcahKOBvBPd0428k/X2MHnNUJGuvcc?=
 =?us-ascii?Q?lZ+wxZ0sDhjVjenb1fhCGo+cBPZ+mAOK19HhGBVTgXkQIFXY1jZQcp3MC10V?=
 =?us-ascii?Q?mbymZQOX9UNQCWmrZChG1vt27gp/73pxxvwKU46rq0fVMM2nil+tSJvXraYN?=
 =?us-ascii?Q?AXo8OC5XOChnjXF/+lOcpmkBVVYmpxgUktKTwvxcCsgFl6ObSvOZ8saUpCzr?=
 =?us-ascii?Q?Yr5p9/yPFkxl93Ydd7+xhyc0bXQw5aY2Z/Kg9KfGPB8ORrZwPN572k5eFIFa?=
 =?us-ascii?Q?0kJULOR0n3X15vnZQ3lcGr1zQIbGF9lupVMUhuOvLBB8ggCQvLOsrUyqt7xZ?=
 =?us-ascii?Q?bEhmtE65Qq32dNQiwzgDOyBrQ/+Q2TsPUGAolo6OqkU9pK3cCfv2LFGIDxzX?=
 =?us-ascii?Q?bR2dZ+Dv71XQybQ4MFg1wKZSIu4gnrsxQTQhjWNQix3gJnBoseXJuCjF8oOK?=
 =?us-ascii?Q?ckJ3BurssDGyu0NVwOagw198zaChJSWL8UHOWby20KNNNngKw+jFeHMrdg6n?=
 =?us-ascii?Q?pOmdPCbweoBlrJAo8icbDAaJVhUFTxGnX85gVyvqdBfasqONi34SGO+yCkvg?=
 =?us-ascii?Q?CkRJsotKK2xy29OUaFBsJMkSygwL7ihC3K1b7XRVJMX7cnMUEjFMdg3lZOVM?=
 =?us-ascii?Q?vVl7IkmXEppHuUQ2Ivnb5MJZmaJ1Dgi5n571FJoowoNtHq9ZyMZuqXXlFwOE?=
 =?us-ascii?Q?mD+ij06CyRIQVYtz39XAZSo1wkxZeHUDlTQs2kNBwYZebEzBFvfz1fum+l3K?=
 =?us-ascii?Q?Ndn9C51PG1fR5EqnHVPaHCkQCYbITRulcuHkYhPg0CObuu+tJBdzeHbAPnmL?=
 =?us-ascii?Q?Xny6kPF7pjuIV0ub5AxTMIGgZ3r6blX6q9dE4oNS1vJfcnbmUSURsBH4C3oi?=
 =?us-ascii?Q?4fxsauUTJYb2n28sL3B3c18s+BcNC/SLBalpHxQ/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e630ce74-cb19-41ac-6e5b-08dcbaa0397c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 07:27:30.1152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LddhMiWdWAa3EtcxqEJVFb1Xles8BvIfYugSiCO2SFbQ4VHb1zg9OA46q8TMS3X8G4AWCqgMzn+o08qQKpWfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 07:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203202

Hi Marta,
I have some comments also to this respin.
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Marta Rybczynska via
> lists.openembedded.org
> Sent: Monday, August 12, 2024 6:09
> To: openembedded-core@lists.openembedded.org
> Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Subject: [OE-core] [PATCH v4][OE-core 1/6] cve-check: encode affected
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
>  meta/lib/oe/cve_check.py       | 34 ++++++++++++++++++++++++----------
>  meta/lib/oe/spdx30_tasks.py    | 11 ++++++-----
>  3 files changed, 42 insertions(+), 27 deletions(-)
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
> index ed5c714cb8..26dfdc1a54 100644
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
> @@ -227,19 +227,33 @@ def convert_cve_version(version):
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
> -
> -    status_split =3D status.split(':', 1)
> -    detail =3D status_split[0]
> -    description =3D status_split[1].strip() if (len(status_split) > 1) e=
lse ""
> +        return {}
> +
> +    status_split =3D status.split(':', 5)
> +    status_out =3D {}
> +    status_out['detail'] =3D status_split[0]
> +    if len(status_split) >=3D 4 and status_split[1].strip().startswith('=
cpe'):

Better is to do exact comparison with '=3D=3D"cpe"', otherwise you still de=
cide wrong in case of:
ignore: cpe is wrong: other text: more text: even more text

> +        # Both vendor and product are mandatory if cpe: present, the syn=
tax is
> then:
> +        # detail: cpe:vendor:product:description
> +        status_out['vendor'] =3D status_split[2].strip() if (len(status_=
split) > 3) else
> "*"
> +        status_out['product'] =3D status_split[3].strip() if (len(status=
_split) > 2) else
> "*"

The two clauses about have checks for len which always evaluates to true be=
cause here the lengths is already >=3D4.
So please drop it, just do single assignment

> +    elif len(status_split) >=3D 2 and status_split[1].strip().startswith=
('cpe'):

Same exact comparison as above should be also here, if we want to keep this=
 warning.

> +        bb.warn('Invalid CPE information for CVE_STATUS[%s] =3D "%s", no=
t setting
> CPE' % (detail, cve, status))
> +        status_out['vendor'] =3D "*"
> +        status_out['product'] =3D "*"
> +    else:
> +        status_out['vendor'] =3D "*"
> +        status_out['product'] =3D "*"
> +    status_out['description'] =3D status_split[len(status_split)-1].stri=
p() if
> (len(status_split) > 1) else ""

The description can be crippled here in case of
ignore: cpe is wrong: other text: more text: even more text
(only "even more text" is chosen over the correct "cpe is wrong: other text=
: more text: even more text")
So the status_out['description'] assignment should go to the if/else clause=
s with hardcoded index of "4" of with new split to only two parts.

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
> index 03dc47db02..4864d6252a 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -488,21 +488,22 @@ def create_spdx(d):
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


