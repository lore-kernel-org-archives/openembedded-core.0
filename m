Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B0BCCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 15:27:12 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23852.1762183624114518893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 07:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=IWqsnYbF;
 spf=pass (domain: siemens.com, ip: 52.101.69.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y200tnAaS7AqpVNYR4sQhQ8POK2FBNEmVMvmiG5rl341b3RFGE5XMstoUMFom/dnkLE9EsRuHPMGVk+/dW78SbKAvrkovZofXl/sLDS1y3arlFwk4ai8Nn+HwlMvbMICA5fDwyf5tiu4YzjuO+RGafpADmyqa3UD4Qbahp7NvL+QyjftjuXTOApVlwu/9NRP3tT27CIua+sei8TRIriA3gwpKcdeJTjXGRpq5IavFqhJjZMp8oKJnhEGxf/F9OzqHNN/WnMz1aW9eWRsya2sqc1h/y5WM69hNZWISKCJLonHUBsnzHN+YPRHRXRqI9OecrBLdkJ+Iu6KbvCKsIhIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kvhKTz8PpRTVb2jGlIPB4BSwk7mIDcXlzl2P0XKd/o=;
 b=ERgeRTjzXNqqtpPUtq0Wqo05cih9gl4P9dmttRcaD7mJqK6PmXFTJZQztwgtDhyixOblhftTiVbwkKz5Ayu4qi8uOMuWt0RF6bj2RcbbSZ8775UDrPESNPhDx+hag19YtvGvAgWGkcCpwiV6VSY9UzKSOGzf+ety3aktCUMg53he4jPLNLICIBI2YLZWCgCuoAx/8F2+Sgn4SOJOTjojWXyfRBMHFfwypJgMJCyZW+addMeC84CyXc1m7zr8rAiwZoGarSDwqAa+IS16P0WHfAArD2l5mEwxrXrcYzRmnxIlqWx4v/uxOFqr4AmIJ3j6bmS1jbP1p2qRsmaFFamd3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kvhKTz8PpRTVb2jGlIPB4BSwk7mIDcXlzl2P0XKd/o=;
 b=IWqsnYbFsxNgOZccCt/OJ/EYTkHqbG7flE0sheuXCsftt8qMa34tiwqFYjpDrbGsXkyffpvmhyxGDpziYyK3FFMoE4cGIGtP5/AoYUjfGlcSyYzZMZFGFuiHITqlT76xWImEZzlz5aAXM2myL4H1WXGMv7YK0x24XPsAZJ0O1cIix0gJxOoQKl19+hy7uJ3/0b48sC/Mu+GH1FE1QUMlWbMhsUs/ZLS0hut1Sb2WE/O2IwSpVS7Q9os1At33EUrbSrVQGk2TWqcmHpi7iyrbDouUfxr6zImBQqnh/m0rQxYT3HREEos6vPcIx8blnKen1cH5uKsEDKxzSY2xUuG9cA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8986.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:26:59 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 15:26:59 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Niko Mauno <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>, "rybczynska@gmail.com"
	<rybczynska@gmail.com>
Subject: RE: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
Thread-Topic: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
Thread-Index: AQHcTM6pqOH003pEYUiVj5V0f54WjrThC9LQ
Date: Mon, 3 Nov 2025 15:26:59 +0000
Message-ID: 
 <AS1PR10MB56971268C925EB139090781BFDC7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-3-niko.mauno@vaisala.com>
In-Reply-To: <20251103143157.315178-3-niko.mauno@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4b1e430a-f84a-4f67-9226-d927bdaa4831;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-03T15:01:22Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8986:EE_
x-ms-office365-filtering-correlation-id: 77ad2a92-07e6-48da-6c92-08de1aed6e77
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?SktdRnDWhqS8hf7LfD/zR4mmUNobNsZ1H3te1wRoB1P5ZYanu4KBShCZ2fTO?=
 =?us-ascii?Q?jjGG7Tkf5zZgZ+EyabDyzD+nwEnoY9xbvOVUT9A1PglOLgWRwvrXJNRsbrk7?=
 =?us-ascii?Q?4/qJcmd2Ipfa1T+VthK56j98C69USze58j33diYrrwaD34PI9OLP2uXLuNnw?=
 =?us-ascii?Q?9nrHT6z0aepIU2ZQQKsP/JQNYKk8F13//zNCbV1kW7IK60d14QPnW6bxIUL4?=
 =?us-ascii?Q?1B68oFZrPY7+2qBGESNUoV/qnfk1xhaRz5mxtSxeXOaTjfuy+6ISvLwP1opa?=
 =?us-ascii?Q?xVUp1DqNGb6nzsw6ZIfkgAYQGyguQrFktVf6h0Q6lSn2wZj/i3R3G3CzyhLQ?=
 =?us-ascii?Q?cJKN7qqKE22VvNoP0xeMzYSRrayA6+ttfASDZ6srL1W2cakQ4V/H6xiELRfF?=
 =?us-ascii?Q?4Fr+UvFFS7aF/4Ti4Lv3f6cSawQZBeZoHTdPHGlGENu+eRU/Xl7wlXGUJrCG?=
 =?us-ascii?Q?awtPgCgR2hzBVkcuefd+yr5muN+5R3iXFEQftqMScaLiOyl82VEH8zYgbncD?=
 =?us-ascii?Q?9XKLYHOQ+krNhT/SnmIt2I18sv7v22za4vQsAzmgTJnqc1ktpBew5S0ogodJ?=
 =?us-ascii?Q?ePoL6ekvhxeyd11le0IYNKCyDGS9ShmJD+Bcp7ypW6CTvRavedVYZ207O7CS?=
 =?us-ascii?Q?8NDU26XqPlS97aL0+C0jInvV61pbbQuXfTtR1J82/fJbkVJ+SDpeRDqY+HoB?=
 =?us-ascii?Q?zdp6YyIj3OoIEHDmNKgLB4u/lk/l8HSDUBW0POI/2PFLYVri/LYuBpI8aa1A?=
 =?us-ascii?Q?iPwOj9qy6Oez9WzJ33/AhaK/tDQoMjlx4wPh9IR7z9Ro/aY4WQiOQNaBiS6Z?=
 =?us-ascii?Q?HEdjnugQY6jOmCGg2VfOiTlvGNkrQEi5SQxOdjePHrrtFsKHvYURnCs38C63?=
 =?us-ascii?Q?VX/QQdki6p9Et+NGUgzQMcjQWVCrWtZXo6qydj7JDxRPov7WAPdOnxBfS0H2?=
 =?us-ascii?Q?c5R3TG/zkDr9585HKnCdF2FbVcX6ka5Ns/ibDVK5b/1si6Wm/9CEJhmvd/nZ?=
 =?us-ascii?Q?NK/+bWQ+RlU9p/ngWqLG2n5vPaS4u+/ZuBoz4KcmyjU1B/VHSfD7USRAY4y5?=
 =?us-ascii?Q?cxkDpm8wG6AX720LSpgefHurJvugOi1BwDFc5rhMRhB52TEQjI/Ne9nqx8VA?=
 =?us-ascii?Q?sEX3tM98GnlfslAWduczwynDP+rvu/VEfvXmUmKlkmU49IudfZxaw52zYWuC?=
 =?us-ascii?Q?czNRBmqyxD+Tq+kZvGA4GJucME9p9X0zgbXvzxVuRCYhW5nAO+Zi+UndPoDI?=
 =?us-ascii?Q?JbGiyqhC7HK9+iRiXi4X4Y+g3/79DUpieAXgpW1PJ9hPp6LwtaCAMDvbjac3?=
 =?us-ascii?Q?n6OZwp5120snq74pHdjI0dahz8yFa4jxX6KgFW25mIX+xutcQE4qeRDFov25?=
 =?us-ascii?Q?gcG4+iitTLw3H28DYG8IpigfrNUtbufKSXU6RGa00fIY0Ufm/3dhePjBJIAK?=
 =?us-ascii?Q?VHINYxaBUwsfEqhuoSBVJQdb+3wq7n7sG7L83MkIVCbJSP26Njga/ie1icbX?=
 =?us-ascii?Q?WQ2voBntY6sG39UdgAu5pBHDnefExXuITgjawFBrUvy480/MbbdlEOtEgg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?46XRC1XM3Gf24LBlMRfLCu6pmlH5YrTLTeVv9lfA6D26Kcf67xW2rFM5C/pb?=
 =?us-ascii?Q?VjxLETsatUXKL6MViatB/kh7xr2PUODuP4QfFl8Y/H1aFcdup76hh6jM46D/?=
 =?us-ascii?Q?qPXRmssjJBFQjS1BHjUEZrNqslvT9Yx/on6j9OGWYc4f9JucYXbknBBRtDRw?=
 =?us-ascii?Q?+1x5uM1GTkzS5ok9JuoZtvmCYnUDk1oeoXpAWjcaqnsBn4naPn9n7HxroFsV?=
 =?us-ascii?Q?UUU3foD8C+6OcnPmzkJe8LWSFDeV4lCBeueelKrIN/twZPxQ9QSMBA92sPRm?=
 =?us-ascii?Q?L2T4tVtKKGq0oVuirJGrL4jbxcKlFmYKuP3wo/SVYSHzgK6l8HciPa5BiYOg?=
 =?us-ascii?Q?34oSt8jvOTDqDh6WmRI0mkMECwiH6ieWDoFPSFWdHIGM8ZjKNl99J9MKGed1?=
 =?us-ascii?Q?L64R2TzApXRJ7kKa8QlksB/3DaLobb3Ma+erc21FsJyEaDDiRSjBMO7nybdj?=
 =?us-ascii?Q?8cU647/Cz7TcnGK3obNLSM2LuktFN2QTMwYMWykhdaMY16gLAUk1vDMASfpA?=
 =?us-ascii?Q?V50n5mNtpGcNDlyzSZ7pevpLycoZSNE6hhznCB7lI1xMyB/fWuffsIDYND2T?=
 =?us-ascii?Q?3Ir60YAL+ihBh+1W50fpKxvZNINGJIE6oGKWT9x6gtsjQdIPlPAg6yHLoGLN?=
 =?us-ascii?Q?p9DmPwFwbD903tRLQpSl1JVxTq4zvTKHQ14bk5zUibXFxfv4/zLGs/n/cNme?=
 =?us-ascii?Q?Q3FbVUG1L+OE1+Y4xOCqJdsmJ1KVMQJYGyDxvblABXfR3LUaZCV1glwuAUSj?=
 =?us-ascii?Q?GqKXazc3O3EldTncadGQSS3CjWmuLNAFDkbcUmOwPnmQyggX0xVB0bS9SSPC?=
 =?us-ascii?Q?BdEtURFvL+xMObNgV6T7VOMJ9Ul3aF84Ct56FGI3kH9xx7HP/cGB17mPgyiz?=
 =?us-ascii?Q?/eQ715zQbFr3DUh+he3/I7YfxAXolh1VZhGAQ3aytAgl/8cRBPkjJ6gQj0UI?=
 =?us-ascii?Q?i3UGhq0IfN7fUiY5eahhpGJXd0Odrc6ilN+tRpQrt72HaNiQZPBYaVg01GyP?=
 =?us-ascii?Q?qEaNUjSHjBbG2VxHkq3Qt44hSBKYCn3hB2Powyue3gdE0r0J9LWlt90c2x9w?=
 =?us-ascii?Q?8u55qTzqVEa8XH1RLCyuYv5/2kHkre9HTccPG9xTVxeZbuApClyKCHeYnPqW?=
 =?us-ascii?Q?Lb8iF7HxzpkosR2fVskvh75qixahsxsvfET0K8Ys8w13Hrdoc9g3f5V44vru?=
 =?us-ascii?Q?iQHkP4cdrhlma1TUR4c3jZMykUbUItNITgMfoLzF2I534Fv+ARiHjG7kJfNx?=
 =?us-ascii?Q?JR5KfLT07j61F79WrfQ2aRAGfBP5rbd4FKZJUGwjNDTF+pE6qd/YhauAV4ES?=
 =?us-ascii?Q?sgPw/6KR2z7EsrozRAlWbvtvw5797lWsluPnRvpkTBCipo3UxrFQjDOYr8at?=
 =?us-ascii?Q?8au6yG/awUZTsIcQas78uwTcggPX/glQKywly4Z7YyykOWqh7oPB1+wEB+RC?=
 =?us-ascii?Q?XpDdMt1wCIMf6OT5hfAVAA465lBxaPVQ6AqJE9t/HtuSqSK3/33lJ9ApWVtW?=
 =?us-ascii?Q?+I4j0CeKOVqbJDWSwJuZneF+RuNSMd5Vwn128h3UZmVzXMIldI0c8dkViP4S?=
 =?us-ascii?Q?4uOwfqJMjSPAZP9oc5W+bdAioeh4xBO6F9ld1+wW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ad2a92-07e6-48da-6c92-08de1aed6e77
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 15:26:59.5882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fObWO8fhss5a1mww0p+F+JcW8O8Eg3Ptv6HxsB7EmLoFsPpJuS9Xq8PMSz6OgfUulVYsIdCzUDvv/aSassHeJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 15:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225663

This should be commented on by Marta, I'm not sure if she brought this back=
 even though it was not working anymore.
In case it's accepted, contribution to yocto-docs should follow.

Peter

> -----Original Message-----
> From: Niko Mauno <niko.mauno@vaisala.com>
> Sent: Monday, November 3, 2025 15:32
> To: openembedded-core@lists.openembedded.org
> Cc: ross.burton@arm.com; rybczynska@gmail.com; Marko, Peter (FT D EU SK
> BFS1) <Peter.Marko@siemens.com>; Niko Mauno <niko.mauno@vaisala.com>
> Subject: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
>=20
> Since enabling NVD1 as NVD_DB_VERSION nowadays leads to BitBake failure
>=20
>   WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE data=
 (HTTP
> Error 403: Forbidden)
>   WARNING: cve-update-db-native-1.0-r0 do_fetch: Host IPs are 172.65.90.2=
6,
> 172.65.90.25, 172.65.90.24, 172.65.90.27, 2606:4700:78::90:0:180,
> 2606:4700:78::90:0:183, 2606:4700:78::90:0:181, 2606:4700:78::90:0:182
>   WARNING: cve-update-db-native-1.0-r0 do_fetch: CVE database update fail=
ed
>   ERROR: cve-update-db-native-1.0-r0 do_unpack: Error executing a python
> function in exec_func_python() autogenerated:
>=20
> Remove the support for obsolete NVD1.
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/classes/cve-check.bbclass                |  8 +-
>  .../recipes-core/meta/cve-update-db-native.bb | 87 +++----------------
>  2 files changed, 15 insertions(+), 80 deletions(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index c63ebd56e1..259c699af2 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -31,11 +31,11 @@
>  CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>=20
> -# Possible database sources: NVD1, NVD2, FKIE
> +# Possible database sources: NVD2, FKIE
>  NVD_DB_VERSION ?=3D "FKIE"
>=20
>  # Use different file names for each database source, as they synchronize=
 at
> different moments, so may be slightly different
> -CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdcve_1-3.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD1' else 'nvdfkie_1-1.db'}"
> +CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdfkie_1-1.db'}"
>  CVE_CHECK_DB_FETCHER ?=3D "${@'cve-update-nvd2-native' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'cve-update-db-native'}"
>  CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
>  CVE_CHECK_DB_FILE ?=3D
> "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
> @@ -108,8 +108,8 @@ python () {
>      extend_cve_status(d)
>=20
>      nvd_database_type =3D d.getVar("NVD_DB_VERSION")
> -    if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
> -        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1,
> NVD2, FKIE. Defaulting to NVD2")
> +    if nvd_database_type not in ("NVD2", "FKIE"):
> +        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD2,
> FKIE. Defaulting to NVD2")
>          d.setVar("NVD_DB_VERSION", "NVD2")
>  }
>=20
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-
> core/meta/cve-update-db-native.bb
> index 3a6dc95580..4423216be5 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -11,7 +11,6 @@ deltask do_compile
>  deltask do_install
>  deltask do_populate_sysroot
>=20
> -NVDCVE_URL ?=3D "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
>  FKIE_URL ?=3D "https://github.com/fkie-cad/nvd-json-data-
> feeds/releases/latest/download/CVE-"
>=20
>  # CVE database update interval, in seconds. By default: once a day (23*6=
0*60).
> @@ -108,30 +107,12 @@ def cleanup_db_download(db_tmp_file):
>      if os.path.exists(db_tmp_file):
>          os.remove(db_tmp_file)
>=20
> -def db_file_names(d, year, is_nvd):
> -    if is_nvd:
> -        year_url =3D d.getVar('NVDCVE_URL') + str(year)
> -        meta_url =3D year_url + ".meta"
> -        json_url =3D year_url + ".json.gz"
> -        return json_url, meta_url
> +def db_file_names(d, year):
>      year_url =3D d.getVar('FKIE_URL') + str(year)
>      meta_url =3D year_url + ".meta"
>      json_url =3D year_url + ".json.xz"
>      return json_url, meta_url
>=20
> -def host_db_name(d, is_nvd):
> -    if is_nvd:
> -        return "nvd.nist.gov"
> -    return "github.com"
> -
> -def db_decompress(d, data, is_nvd):
> -    import gzip, lzma
> -
> -    if is_nvd:
> -        return gzip.decompress(data).decode('utf-8')
> -    # otherwise
> -    return lzma.decompress(data)
> -
>  def update_db_file(db_tmp_file, d):
>      """
>      Update the given database file
> @@ -139,12 +120,12 @@ def update_db_file(db_tmp_file, d):
>      import bb.progress
>      import bb.utils
>      from datetime import date
> +    import lzma
>      import sqlite3
>      import urllib
>=20
>      YEAR_START =3D 2002
>      cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
> -    is_nvd =3D d.getVar("NVD_DB_VERSION") =3D=3D "NVD1"
>=20
>      # Connect to database
>      conn =3D sqlite3.connect(db_tmp_file)
> @@ -155,7 +136,7 @@ def update_db_file(db_tmp_file, d):
>          for i, year in enumerate(range(YEAR_START, date.today().year + 1=
)):
>              bb.note("Updating %d" % year)
>              ph.update((float(i + 1) / total_years) * 100)
> -            json_url, meta_url =3D db_file_names(d, year, is_nvd)
> +            json_url, meta_url =3D db_file_names(d, year)
>=20
>              # Retrieve meta last modified date
>              try:
> @@ -164,7 +145,7 @@ def update_db_file(db_tmp_file, d):
>                  cve_f.write('Warning: CVE db update error, Unable to fet=
ch CVE
> data.\n\n')
>                  bb.warn("Failed to fetch CVE data (%s)" % e)
>                  import socket
> -                result =3D socket.getaddrinfo(host_db_name(d, is_nvd), 4=
43,
> proto=3Dsocket.IPPROTO_TCP)
> +                result =3D socket.getaddrinfo("github.com", 443,
> proto=3Dsocket.IPPROTO_TCP)
>                  bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in =
result)))
>                  return False
>=20
> @@ -192,7 +173,7 @@ def update_db_file(db_tmp_file, d):
>                  try:
>                      response =3D urllib.request.urlopen(json_url,
> timeout=3Dcve_socket_timeout)
>                      if response:
> -                        update_db(d, conn, db_decompress(d, response.rea=
d(), is_nvd))
> +                        update_db(conn, lzma.decompress(response.read())=
)
>                      conn.execute("insert or replace into META values (?,=
 ?)", [year,
> last_modified]).close()
>                  except urllib.error.URLError as e:
>                      cve_f.write('Warning: CVE db update error, CVE data =
is
> outdated.\n\n')
> @@ -224,17 +205,14 @@ def initialize_db(conn):
>=20
>          c.close()
>=20
> -def parse_node_and_insert(conn, node, cveId, is_nvd):
> +def parse_node_and_insert(conn, node, cveId):
>      # Parse children node if needed
>      for child in node.get('children', ()):
> -        parse_node_and_insert(conn, child, cveId, is_nvd)
> +        parse_node_and_insert(conn, child, cveId)
>=20
> -    def cpe_generator(is_nvd):
> +    def cpe_generator():
>          match_string =3D "cpeMatch"
>          cpe_string =3D 'criteria'
> -        if is_nvd:
> -            match_string =3D "cpe_match"
> -            cpe_string =3D 'cpe23Uri'
>=20
>          for cpe in node.get(match_string, ()):
>              if not cpe['vulnerable']:
> @@ -290,44 +268,7 @@ def parse_node_and_insert(conn, node, cveId, is_nvd)=
:
>                      # Save processing by representing as -.
>                      yield [cveId, vendor, product, '-', '', '', '']
>=20
> -    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"=
,
> cpe_generator(is_nvd)).close()
> -
> -def update_db_nvdjson(conn, jsondata):
> -    import json
> -    root =3D json.loads(jsondata)
> -
> -    for elt in root['CVE_Items']:
> -        if not elt['impact']:
> -            continue
> -
> -        accessVector =3D None
> -        vectorString =3D None
> -        cvssv2 =3D 0.0
> -        cvssv3 =3D 0.0
> -        cvssv4 =3D 0.0
> -        cveId =3D elt['cve']['CVE_data_meta']['ID']
> -        cveDesc =3D elt['cve']['description']['description_data'][0]['va=
lue']
> -        date =3D elt['lastModifiedDate']
> -        try:
> -            accessVector =3D elt['impact']['baseMetricV2']['cvssV2']['ac=
cessVector']
> -            vectorString =3D elt['impact']['baseMetricV2']['cvssV2']['ve=
ctorString']
> -            cvssv2 =3D elt['impact']['baseMetricV2']['cvssV2']['baseScor=
e']
> -        except KeyError:
> -            cvssv2 =3D 0.0
> -        try:
> -            accessVector =3D accessVector or
> elt['impact']['baseMetricV3']['cvssV3']['attackVector']
> -            vectorString =3D vectorString or
> elt['impact']['baseMetricV3']['cvssV3']['vectorString']
> -            cvssv3 =3D elt['impact']['baseMetricV3']['cvssV3']['baseScor=
e']
> -        except KeyError:
> -            accessVector =3D accessVector or "UNKNOWN"
> -            cvssv3 =3D 0.0
> -
> -        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, =
?, ?, ?)",
> -                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVec=
tor,
> vectorString]).close()
> -
> -        configurations =3D elt['configurations']['nodes']
> -        for config in configurations:
> -            parse_node_and_insert(conn, config, cveId, True)
> +    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"=
,
> cpe_generator()).close()
>=20
>  def get_metric_entry(metric):
>      primaries =3D [c for c in metric if c['type'] =3D=3D "Primary"]
> @@ -338,7 +279,7 @@ def get_metric_entry(metric):
>          return secondaries[0]
>      return None
>=20
> -def update_db_fkie(conn, jsondata):
> +def update_db(conn, jsondata):
>      import json
>      root =3D json.loads(jsondata)
>=20
> @@ -403,13 +344,7 @@ def update_db_fkie(conn, jsondata):
>          for config in elt['configurations']:
>              # This is suboptimal as it doesn't handle AND/OR and negate,=
 but is
> better than nothing
>              for node in config.get("nodes") or []:
> -                parse_node_and_insert(conn, node, cveId, False)
> -
> -def update_db(d, conn, jsondata):
> -    if (d.getVar("NVD_DB_VERSION") =3D=3D "FKIE"):
> -        return update_db_fkie(conn, jsondata)
> -    else:
> -        return update_db_nvdjson(conn, jsondata)
> +                parse_node_and_insert(conn, node, cveId)
>=20
>  do_fetch[nostamp] =3D "1"
>=20
> --
> 2.47.3


