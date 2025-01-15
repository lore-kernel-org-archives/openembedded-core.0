Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5602FC02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 12:36:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web10.19868.1736944557595674989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 04:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H2ku5+MG;
 spf=pass (domain: siemens.com, ip: 40.107.21.75, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSKJLcNEXchOVvP4t86tjl323KFsi3Es+dji6rMZDHYSwsvko18N6Vn++iuh2KFFmwl9/jaI6ZGLxzZscgnhW/MZa2/jw98UVdwq5AeMApEDivSMLxbnvf0Qmh0XxTWtXUzqzFWzwCsKLIRWTjyzqB1T0VrUATTBMxQK89xodg3JOz8+W0n1ShxN7PDFO2Mr8VfftA0htbHGfrNlicAPHC2lyZI4ACdH/pnVi8geAtNRYo5jRsG9xbvaOAHnUpMAHbSlIqLrDXKxYeUUYSz4E+w3jP2kvFiPvdzEl0DqbqNookAOR89Eh2Z1PsDfsQDpx+D4alqd24q4Bvbu82OU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V0p3z03EJl1gNACYJ9k/URRCSrrxyHl8DTYx3PIKQg=;
 b=NiMJ1zIWsPQ8LZiXogfWEV3mgzu4F9CLBDs8qBLS29DvFtwHgn2KlX5AvlNeht0BqCEYv/tlRbHGe5e0ldea+f+FMg4E1qUaM6N73U7q8PidJ+DPct8KaS/Dbe4QU+5miQepdXgMxFjyuz83C9wW7PT3rl4u1vjmuB4d4XnhU3e+ofSQ14ekG/NstoFvALCMkldaqLEGVV99hZUDxkZUOU4+7f23RGmaQYhZKjiaMpEoMDW/DD7EvVxzS2XE475d8l1Y5XbPFrkxIGeQiSMT/hFtaRU63ILYXKECcb6gl3E5a1r4oSqNRHB8hi/fjCPBJjkD7D7c5WtBx+lyJvOuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V0p3z03EJl1gNACYJ9k/URRCSrrxyHl8DTYx3PIKQg=;
 b=H2ku5+MG6xoszD/0tH5JK6pC91ZDK9qT1jt6e1z3N8l1QhXITlZ0Ooppgke8N25oNt9Fgxa9bkRUyiGFc6GLPhs4+SqlXfKi6VnG5xA9MLMzcywqnVNXPFMLTjnoDonEFV0XvNRLrrQE/DBs/3aOI1cgc3hFjxDN7Xv8Y/dde0DvcY/Eu7/wvKlI3QbLCMOvcDgxU0yLCNiB3w302tZjKVH4yq9xLhoDCfTprIByx1R0U8HmEiw+XQu8xQAeGJf4x5IwOLkNz36ZWShOZiNC+4MscAtR4SXsmfNZSIe7J+xFNreJ31Xmtirxx944ly+096qHTxhqZw797WdStCM/UA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6330.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.11; Wed, 15 Jan
 2025 12:35:53 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:35:53 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "mmeerasa@cisco.com" <mmeerasa@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [master] [PATCH] db 5.3.28: Ignore multiple CVEs
Thread-Topic: [OE-core] [master] [PATCH] db 5.3.28: Ignore multiple CVEs
Thread-Index: AQHbZ0L1Xw022E2HtE6JrqGX5pPkSbMXwvVw
Date: Wed, 15 Jan 2025 12:35:53 +0000
Message-ID: 
 <AS1PR10MB569766853B99AE95569923CBFD192@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250115110857.1372278-1-mmeerasa@cisco.com>
In-Reply-To: <20250115110857.1372278-1-mmeerasa@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1a5cf01f-d002-4eab-87fe-ccbfdec16cd2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-15T12:26:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6330:EE_
x-ms-office365-filtering-correlation-id: 6fa3f529-c1d9-4749-b40f-08dd356126e7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?lhFwDtyN2FzKP/DvTEJOkgGPgXcmChxyjbDaFr2oYScsQ465i84DWTM2zj0R?=
 =?us-ascii?Q?RvYTfkGN3oWcZcNABNDg86h5RyQT5kYukJvqa10iNBiQzF7XoBDm3QM65g69?=
 =?us-ascii?Q?01xx7NeRAZRP9RCbQ33IRPNnGJRyTY/wiw3rU5b1YdX/xAYWhZHEgUuJ2e1V?=
 =?us-ascii?Q?hEHkdFgv619vO2aVIUH1YOADCdunxKp8+hMlzYm0QbkdRF6iAUW6lFJ4J2ce?=
 =?us-ascii?Q?PQ26Vf4RrBcDLijmiDsBqp6hSrJfBETUophFcmYSFcWV8O3J8VXlDx0E2o/G?=
 =?us-ascii?Q?rqI/kjTSG6jTDHf+bEc9r5LPv0hoSaJnm3mwH2K3mpMJVyCq2+5XqMv79Oc2?=
 =?us-ascii?Q?kkHCWrdwRpXtEaVpmNUQhSIKO047pDi+aKac4lmm06XGvXc7a6va7HUmg8LZ?=
 =?us-ascii?Q?el/mnvkyUSXjvsW9EZTB87SMSZcqYON6gtgXWO7NMnGx1s4X7nX3j1LCNCqK?=
 =?us-ascii?Q?fruL4qmr9ewPfUYKNiEnGFPrw8LsaLtD/d5AkS27y8eoknAFNo3FRFdKFmnB?=
 =?us-ascii?Q?LBPQMD4yTkz7QaUoN0kxJCuoklV2VbOhZXRkxHSwhagxdp/K+BBdukB59RsR?=
 =?us-ascii?Q?iKkgrtzMNSTukGydhmncfSeni74CRyErn22U3ZwC1GX1XlV8UqLAwQA5yXs8?=
 =?us-ascii?Q?B5qu5wFC56C+XGIDEM/oscZdte0xjlbSUT7dn5XKlDdQk+d6dO0mx2rVdInr?=
 =?us-ascii?Q?jHlXAkqXwPjXIvEx6MKzhCdoU87adt8kS99F1eYi0zKwAcRiCCHMVgP2/E7j?=
 =?us-ascii?Q?TOmKT3qYa/xlPU7++EPSoDGIDthfIfLtWNdiFgNmFnBTVA6y1p/Fz0fDKI89?=
 =?us-ascii?Q?Ep3Z81uMzys44vYEFr269F9Nt2ROhz4n2H6pBWFUI+cpGTsyxQIsPiGlANRi?=
 =?us-ascii?Q?1ZcdSKo3w4uVpgvRG71v8OQZbOOtUdhwt5kBpD/IhsjzQFXMKOgmJvfY3y1G?=
 =?us-ascii?Q?1lihS6pCTehNgzYnvSbhjxJD3d08xcAgMPgEorajjhJ4rCn1vUjBtljJOeY6?=
 =?us-ascii?Q?0eJfd1OG+bFAuZ+eDRG6ZzL7NhvOShpF2gXhr055xhRsKWlPh+FTZ9f1ay9s?=
 =?us-ascii?Q?7sRabUiDiqRb+S/6S0auaJE0HCYTOIbt9gJZLOjqsFjAdD7IHzp0WkCAkB07?=
 =?us-ascii?Q?19lIMk8mkIs1Xe5fk4xbwUSZQRRMwtl04S+Rt4Ip9mbOMjmxqOa68532cReg?=
 =?us-ascii?Q?+mg0WsGFZI9jpxrk3V6di0SOr5ty2IhjSp08HASSTWv4Ie8VIpxFrduA9q+t?=
 =?us-ascii?Q?U/JRTRoyUhakiA7m9YVIr1Ls0I2lENqeJMiJvG93SZ9PIlOUgD+cQLgZg0Bp?=
 =?us-ascii?Q?7hL3P7thaOqyJ9/vl/514gtzE2Hsfd+5SlvFhHVVEKxEx/ck9sTMhaE1yVUZ?=
 =?us-ascii?Q?yUG9FWrqobdVS3p3ApeGKFd5/l25gHsbceOtRqOSzXGPXDrRahRu8LeOEvuY?=
 =?us-ascii?Q?jyMdd1EnIuCk7aCwfGfTxgTPkaHvYajK?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AuCRPMgnX3aTHjSu1jf9e/leYzwCLl2/jZ4YjDr6PCemg1n6cYOMRI7cvOrz?=
 =?us-ascii?Q?eTYjm4zfKP8iw4a0mwfJPkreXKQaXd2B7M5WoBK5oFVt5uHPbHAvyzQxQSw/?=
 =?us-ascii?Q?AcwV+/6wtodOksfCArTDUCctJ07QrDCJwcGQjP3oB37AhGRvNeYzLeXMJ8KN?=
 =?us-ascii?Q?0APM3Q2Njr+DMPqdmwZ6H5XSEqKX+jIFQ8vBZW0yGQT8FJwKgaJNzYyNQkM2?=
 =?us-ascii?Q?Am6vjzw+29bL5g1yytxqDAJ742Rek4yOIcznokbmVvK/x/6jVHkmWcqkSEaR?=
 =?us-ascii?Q?/tmfF+1tKEkaMojxUH2Surj61L3o49+wpUEV04MTz+1fX5Ilh+Tb/y5nJnXB?=
 =?us-ascii?Q?HSP760D8oCbwj16yIjcXxRsAz/4Zk4ywWnB8W0WGza/GF3crlkpfzceO2sBY?=
 =?us-ascii?Q?FlcmIX27tv+D6qq9vhFMF0BwMrQJ/yeTWYhcXbXEYuLx0H8Gn/CbxaqUPyn6?=
 =?us-ascii?Q?17v/xZgG50Eej2JPl1XUR2rtxS1Afd+yia3SNLk75aQii7rOHzA9+Fko5jlF?=
 =?us-ascii?Q?DHE/h58d2UzMIQ3Q/zs0B83pqRbRh5orDoYAUsQwDCl2bpsPHz9DdFfAmJ3l?=
 =?us-ascii?Q?DW3iEAZYj4YEWKEt0Qyqrm+5B1jOL8Tg/TdJ02+6Z1midRp7KuwpweImxLU6?=
 =?us-ascii?Q?DePlkG01CCnS7Y01ta/p1rEawnvBqIRIaBtm5f9dU29hhsQTXkilQTXwp2rp?=
 =?us-ascii?Q?8Uh1WLkGRvRqWzadlrVhHCVCHCzc4mRXMFiwaTnf8OZ3CZJnWuZyV5ZbQWIE?=
 =?us-ascii?Q?LmaDxHbtCbnt27WZnHI2jWoBkDp/vaNMa4D0oYfmn/zTE7jZdJvKcBmyZ6IS?=
 =?us-ascii?Q?a/V/jEKcU8s0umGlLWPBEMYelOIkYVic5G5gH+3fu8BM1kf0sfqwlVUH0NoP?=
 =?us-ascii?Q?6A6FA0ttVK0x6ddLqSCiDIcRmLbRpwCzcCTOPTE+XwRY9ZTwAjFIs0ur1Xzl?=
 =?us-ascii?Q?hMrfi0bFv8C0WEP/wisUTJmPgChEYdGWmSem1YZfpgIhyOhE+DXtslu4bT7o?=
 =?us-ascii?Q?wmRLIz3FkctyZ3UL5NfQcZRlyrNNrvBOADEs+k7lBLgXDcfje5XRkT7Wswhr?=
 =?us-ascii?Q?ogLZV65N8PSl5EwbB9eDL1AbCs2Y/GO89joWRMt/kIpI6GJv0VvK/RoTCKNC?=
 =?us-ascii?Q?IGKVVXdUFOXy7c5BHtEBrroCiHHQm2OakRWz2kpYo1BAkt2azKwZtr6T5wmL?=
 =?us-ascii?Q?Ioxemv8qHMWpn6gzI1lDZAduV3tvT+AiwUU9VNyc+WRkbSTksglOWdsmGWWq?=
 =?us-ascii?Q?FVzIK8VhUnqr6MWmfeVzUvcP8eDNFygk41IYshPghHOUvdVU8wuGNZpldmMg?=
 =?us-ascii?Q?snkd/0wVj4r6gKVUwQJCxHykX+O+KREYo+yQNIGk8MuwpmuClYxh0lGw9lAW?=
 =?us-ascii?Q?NMzVBkDg1JvJ0uzZ2byXqvXRygTb7/6RC92TCX/NwgMxebWhQGB16eroj4AF?=
 =?us-ascii?Q?0eR5o0jmDwVgoOYUpF96ME1PW5ET/gB0AWWld7MkIIksR6pnz63WkqDAUnLB?=
 =?us-ascii?Q?gjhvqUvQ13dzICYfvTEOxS6cG5zqIwmtasNMcp7ZPv7Kt/4j2EeMVt8bwBom?=
 =?us-ascii?Q?ROyJiwfFMlfxCCvFZxt5Cvnqp715IbMWqcW3Wh0p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa3f529-c1d9-4749-b40f-08dd356126e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 12:35:53.7140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0v8jUzVMZafBDYqgvH81mylxMXiCtNx9LWIeeO5I2jacW7e99MPhYGF4lXe14FiRmtKMqfVpvgsY4e+eQqQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6330
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209898

Fact that the vulnerability is not exploitable remotely without authenticat=
ion
does not mean that the vulnerability is not real or that it cannot be explo=
ited.
Local vulnerabilities are food for LOTL attacks.

Also note that if you want to get these from your cve reports,
you can simply include oe-core cve-extra-exclusions.inc which lists all of =
these.
Maybe we could enhance comments in cve-extra-exclusions.inc for future refe=
rence instead?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mohamed Meera Sahib via
> lists.openembedded.org
> Sent: Wednesday, January 15, 2025 12:09
> To: openembedded-core@lists.openembedded.org
> Cc: Mohamed Meera Sahib <mmeerasa@cisco.com>
> Subject: [OE-core] [master] [PATCH] db 5.3.28: Ignore multiple CVEs
>=20
> Analysis:
> - Unspecified vulnerability in the various components of Oracle
>   Berkeley Db was identified as potentially exploitable without
>   authentication. Later these were closed by the Critical Patch
>   Update (CPU).
>=20
> Reference:
> [1] https://www.oracle.com/security-alerts/cpujul2015.html
> [2] https://www.oracle.com/security-alerts/cpuapr2016v3.html
> [3] https://www.oracle.com/security-alerts/cpujul2020.html
>=20
> Signed-off-by: Mohamed Meera Sahib <mmeerasa@cisco.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-
> support/db/db_5.3.28.bb
> index a7d061e0da..d93e77a1ee 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -120,3 +120,20 @@ BBCLASSEXTEND =3D "native nativesdk"
>  # many configure tests are failing with gcc-14
>  CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-function-
> declaration"
>  BUILD_CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-funct=
ion-
> declaration"
> +
> +# The risk matrix of Oracle Berkeley Db was published in July 2015 by wh=
ich
> many vulnerabilities
> +# in different Oracle products were identified.
> +# https://www.oracle.com/security-alerts/cpujul2015verbose.html#DB
> +# The Oracle Berkeley Db issued the Critical Patch Update Advisory in Ju=
ly
> 2015
> +# which determined the status of the vulnerability whether applicable or=
 not.
> +# https://www.oracle.com/security-alerts/cpujul2015.html#AppendixDB
> +# Apart from this, different CPUs change status of the vulnerabilities e=
.g.
> +# CVE-2020-2981: https://www.oracle.com/security-alerts/cpujul2020.html
> +# CVE-2016-0682, CVE-2016-0689, CVE-2016-0692, CVE-2016-0694, CVE-
> 2016-3418: https://www.oracle.com/security-alerts/cpuapr2016v3.html
> +
> +CVE_STATUS_GROUPS =3D "CVE_STATUS_INGR"
> +CVE_STATUS_INGR =3D "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626
> CVE-2015-2640 CVE-2015-2654 CVE-2015-2656 CVE-2015-4754 CVE-2015-
> 4764 \
> +CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 CVE-
> 2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-
> 4782 \
> +CVE-2015-4783 CVE-2015-4784 CVE-2015-4785 CVE-2015-4786 CVE-
> 2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2020-
> 2981 \
> +CVE-2016-0682 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-
> 2016-3418"
> +CVE_STATUS_INGR[status] =3D "fixed-version: The Critical Patch Update of
> Oracle Berkeley DB discovers these vulnerabilities may not be remotely
> exploitable without authentication."
> --
> 2.44.1


