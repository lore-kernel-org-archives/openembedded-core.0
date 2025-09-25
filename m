Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6FECAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:14:30 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.2])
 by mx.groups.io with SMTP id smtpd.web11.12869.1758809665927137458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KM/pVkca;
 spf=pass (domain: siemens.com, ip: 40.107.162.2, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7pSdT/zyooq2/AeREXDpzkAmBJLWmDfAoGocvGYhF1UBH3km0Bg+HzkNTMqnuLpX1umx8HPl9n1ymYGbNCc1pVmLbNZVBCvDwSkf/156hD7Z4smC8ovUiM4c45Dog0RBLjv/KcnmmLvDkCz/VduraIf2IpxZp+7voMCwnTP9rHNXF1d5VCVLgNyEFeyRrWGADqf++EQOCTxGwsDkrenu4X/wrkukiVC4WUKOLCzY+Hvizongvfk0iSTWuSqBcMqasnj30KR/ZWf8Rmsxw0TPQlZq2oQproSUTW4fFLWqClER0MI8HPMIfR3HV+NWvyFyC4Dot5WBJQk5cum6IJE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DA12V39VINasgaurPSSICmTqQeY7BVCDuXGTIWyd0nA=;
 b=BcxNqiIayr4pGMwQmBeW7XWBfdBBRxJFked5T4mnhKwZzm4wIb3uwKMnihHkqySjmwzZErsZgefNq2cUT7L5AFUJ1ZRh/tHyBxof+pZmP/7AOlMujFPUrq8GZJ8YLfe8lLZWSaY29I/rf+HEfa41VpgLyLNqaKGRg3K9XqnUCh0M65yvwAcpqJTfJNwtle/yNL9cFs/3y0iJ6Cr7Mvks+oYNNmh4n9zJrYUrVpZ0ATLQv7gVuBlt4ZcFqM/nNr2smWaSOXSsdD1jPkBWt1Jt6fuOXi3Gxx+LFmAM5khNQoL7PzAfK90MMjYaub2UMYa8W22oOVoKKDVpgdvwrNwFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA12V39VINasgaurPSSICmTqQeY7BVCDuXGTIWyd0nA=;
 b=KM/pVkcaTHlXXNd1HHIfieOy2seFEQDMuSGT1gG5J2y25HNY5uqbXLyYalmP3KZAqt+Lsnl4v6CPYOO4aqg+M1bcef44qbfU1V0T4svlSJb7Bgcix9a1N0H/rxZYflbQR6k+41bLlWhzwAkiVrgBva7qAxgTIEr1uUKZzsHg80Ter6cTlWEKVelU4QB9k8fUNJCZscfB87C3ryszHptbq4YGZwVnak320k9SlS/HonJeafMWOH8mJr/EzARJB500T3DfXjNklJgHjPvC7oqz1C3E+YhHugxl8xx2u99RekLKOGbhEIYh2PTY15vdgIezqeWm+eq1kWMv1HtQjkQaxA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU4PR10MB8878.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:569::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 14:14:22 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 14:14:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][walnascar][PATCH 01/10] gstreamer1.0: set status of 5
 CVEs to patched
Thread-Topic: [OE-core][walnascar][PATCH 01/10] gstreamer1.0: set status of 5
 CVEs to patched
Thread-Index: AQHcLiWJtNXPveRU+E2f9tA11HJgF7Sj8GXw
Date: Thu, 25 Sep 2025 14:14:21 +0000
Message-ID: 
 <AS1PR10MB56978E075F9FCE2E68816427FD1FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <18688B9CE19CDF0C.29753@lists.openembedded.org>
In-Reply-To: <18688B9CE19CDF0C.29753@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=568af407-5009-4eef-a63b-b70e8d7b01c7;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-25T14:11:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU4PR10MB8878:EE_
x-ms-office365-filtering-correlation-id: bf7181b1-4979-47c6-f50f-08ddfc3dd308
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?YJAC5hLJrhmjVIepod4seOSY3HuHiAwrNoFl4iSV+qqKkmocrQQ0XXUr5t+q?=
 =?us-ascii?Q?Pfkt+lmnpD0B43TLiigWcqdpB6TIel8LNVx1GWWAktWggxmbQ7M4p17KGxsq?=
 =?us-ascii?Q?sR8W3J47F/pXyfxo8ZWAZz/pahoQIIysWzAtl4XlL2SoR+b32q9Xyy/Ayyev?=
 =?us-ascii?Q?U1ehF7JJm2mOK0qkKTYOWhv9cFFzPyPDhKkGnA6yaRMzh3xpRsK1qvv8R8Nv?=
 =?us-ascii?Q?IZsYQtQRKRowdlYW2kd4v2iXCG5puVxuYIHnwy6k8L0WbewWxwHx+brJMuSO?=
 =?us-ascii?Q?ooICDVTpZPtc204dF4p4FinANtDmSO3JsVXqVRALQMGUCnidBIBAfodLSF/C?=
 =?us-ascii?Q?+xvnKbpVwNYaHz/nQqqZL2wHK81glT/+t6UVgZ4vYImYIAS9aMqkrGnQdJZt?=
 =?us-ascii?Q?i80x69g8lgpO33OgYxMAcINL5asc25MQ/Wab7zRThArAJU9JMuxone0S/Dnk?=
 =?us-ascii?Q?ORvEg990y3ovz8ZMF59EJ3eQRn38DSITOEVJjS2dLjM/a6aAVyU1KiFtjIaX?=
 =?us-ascii?Q?HhNfuuzqYXxd+aMWrXFNwynXa3gv+LyBMXrG3OxA8UNLjWvZUjwjn1ndv82d?=
 =?us-ascii?Q?8wbD6zk/YhoEulo9gGm8g3yU1uBGghfXLV8R6bdHxNmN8ZONxKEr1nXJh+HL?=
 =?us-ascii?Q?O4vVMLa93WgWhNHjnm7iCN1NsUKSKCRXB8YjBHOJ8DgQrg23aOpc7Fa8UGrU?=
 =?us-ascii?Q?NxHY1zw2sMbb0g6eKszL7Q1EMjFP8v4qLZzqhGiLOFp204BinZdqlPdx+yp9?=
 =?us-ascii?Q?+qHNDdMI0tvQuBX6WJOx8yfcrjR0JyqsB92jCCEsCM83E9jtLBeVzXU2/25M?=
 =?us-ascii?Q?hpg6kJDhU+HBDFc50EryhWtsTaEMwQZA23qk+rW8RLou6RBiceOuaoA1b1p/?=
 =?us-ascii?Q?jZupbeX068Md+t83mtXkCNHjVxLJ0bhkfMkNQmAJOv7LSMIKP+B8BmfvIROe?=
 =?us-ascii?Q?cd0cgh5KpnSBZ2E0QYhVagwdcsXwC68hRUDZXHOi+Z8CkdtdRehfHZVZWQYd?=
 =?us-ascii?Q?2KF1SpMYelrFxws//j3uML+no4pinMB6EHe2AM1WB+kxFVnZbOkDpVu2Acj1?=
 =?us-ascii?Q?4Q/NRRv7eDrIH1uRZUv6i4vsOqbr5hT27l8aMqqZ9iHOrMMyXT3BoNB5O9rv?=
 =?us-ascii?Q?FbH3hfHyOGqw85Y47ChLv/1izc+t/nuKVlPDvWxyS1sJHWfwADIViGfbBi+t?=
 =?us-ascii?Q?eFSX/diYO3FpLoMkX6pIvazpxpMnFliXVdmDKQaXHHcKm1tIANMd7HVJp41U?=
 =?us-ascii?Q?kP6rOcw1/SATgsFVI4Qp+FuFMpNFNJ1QDIIsEYE3MpNc7p+QpuK6/ujjnMDJ?=
 =?us-ascii?Q?Ol6B8KvwAgA1fsHk14GtaimqIkQM4403kNYtE1BvuiVlVQEl2rM6JLgZTLmi?=
 =?us-ascii?Q?63DXNMadRGRhoqVy7aizUzSLgj2i2xy7lMdbt/1423FnwE6QZF/VN7cM8POo?=
 =?us-ascii?Q?IpJFlXjEvKJFp7BGTlWBvhF5Yb0TDFApC6sTIOeuURrkLUcr/cfrUIfYQ5x7?=
 =?us-ascii?Q?grn+8ayaJ/VSlKI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zgcTv6/4AC4AMqzpMNpvz1Lp5VHi/2XK8lrrVKauZx5q99s4SZe65ZFNQqKH?=
 =?us-ascii?Q?psTe1VKimfU5JVo9p/BBHsuV4APceGr6fb5ypG0swDfvFZ1seSuf/BwE1Hax?=
 =?us-ascii?Q?XXTRIB9Vde/dAqAYSl4VzoR+a+h1tCAs9I6JSwVWzo4Jy9/MAPbqODQNRCMS?=
 =?us-ascii?Q?pxdrFzhRC8Ls0HrVMkMhOqTOMK2fMU3F8Y7m0dGHhiAFF0fb+Ocx0bAL+NSZ?=
 =?us-ascii?Q?pRlmJ4OHIf0vszqAn6HKGz5D6WD5WWUKSEkk+27WzvBuQinKKGOJBkRITSmA?=
 =?us-ascii?Q?2WgWdk/B6mgbOk2rSwLDy3gcuTPUTNn5rQjBR7wIZVgXn3aigKKH6cqjv2F9?=
 =?us-ascii?Q?VVVCL68r5dfEILZgFfZAiSE1Ju4McDlMftW9ntWlREljtiqq5JVz8Z0dJzj5?=
 =?us-ascii?Q?HfvuMm2UJxY5R2bIBcTv7Baucm+ef9Tw2seWD6rsnsfD1WpOjbcIm3HJBTKv?=
 =?us-ascii?Q?Zd08SLC+C8e/xZFgeKO0ObTsU5aewAZlaacFxCRZp9N2wCUkEciCFIZz8e2S?=
 =?us-ascii?Q?PsgPerHrY2eq8DVK8OatZCA+ciiGxELt25y07iFjhv1RdFpqJadzomsqwTi7?=
 =?us-ascii?Q?1UcpOuY4Iez39nsdTFy531fHSZsUD80UiUaLgk8Lqi6dPALIpYhvpT+PXiU+?=
 =?us-ascii?Q?K4ydrZpbv9sOlu21THi8VaJcRtzmtfDhJAUXcxYTR0PzxtgW6bamyEhzFcfs?=
 =?us-ascii?Q?c7e+/eGCz2vLoTJGdCWjIUaLaW0+nYuSzbi0ym0nhl2+j6iLHSzWUcdwzUKI?=
 =?us-ascii?Q?h2TLQ8xRxp2Wadwa/Lb5KwlFUhy43ILoOS2RsTBA74fcpxDOXsr2W5Onu8HA?=
 =?us-ascii?Q?8TTGLFs38wiBWoTfRZ0MH2+wTzEu8ycPU38iAKta9X6zcRHYrSaDG0MVybMF?=
 =?us-ascii?Q?nSyWVkXb8h9sR5p0GsdHw2WP0UIyqAYq0R5aLqi/WKk6/npxQhNyib/QTkKF?=
 =?us-ascii?Q?GL25YUsd4ncJ4DM1QjLs9bPQQYjc25QfPBvBPGC/dAfs2V/Gi0tQI98ioIe5?=
 =?us-ascii?Q?Z4ilj5RDGPL1zSYsljFVqRSa1dDnsfmIw8oUDEPNFfOFmBXh9PcXq5hXTXnf?=
 =?us-ascii?Q?p5x2PJoNW9LJ2t7Ua2ipY/I2Eo2HHcVHJWsQpLYrYxO0a5RbezLCOwxjV/nG?=
 =?us-ascii?Q?ZTdSAYitrv2HaPoYI4oGozNRCp4rptsprendrCUnZhdwZYcUZww+c3efmy20?=
 =?us-ascii?Q?IrE1xIOvbixVxeR0djssgg1kIxCRp2VHup1ZRrC+Tyq++qq4tl2QU2nf7XCq?=
 =?us-ascii?Q?OvxGJfi7t83s9qs+uXv7/zGDs6Yl9dW+0P1Ry2kS4Y3H4HdKopQRSaj9MrGP?=
 =?us-ascii?Q?vpXglngZ7KHlZuW210tfFWz0ikI49c6XeoVa1Fvq9OVcLy7YFrW0ccSy3P/G?=
 =?us-ascii?Q?4LX16OAFgSvXUluiQdSG3mJmWuypiFE5/tV6td6UyeUDFYlYV2VLtnSmK9Lj?=
 =?us-ascii?Q?KECQRWSwOa0Tj4znUoijvNjNQEzlvLoIrO+toxFwyEt2ycRQbn6MbYVoTRcq?=
 =?us-ascii?Q?8Wno14pieOZgK1LkpANMOyHVT1Ip1ISRfTOJhsIreUKs2++JtveAR6yDHj1M?=
 =?us-ascii?Q?g8iEqBk7r48STyF6tdBYKLZeUI7GcVssItIbTt89?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7181b1-4979-47c6-f50f-08ddfc3dd308
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 14:14:21.9744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ej4a9sbnWiRlZSspXMzDTQIjuEPHbisA2K4i4KPF6hET9S2Ozap4ErzcG1bm3RR+Sb9yPMwX6IptC0n5WYLjtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8878
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224041

Hopefully, I'm not too late for the last walnascar release this weekend.
These are patches for everything which has known fixes and was reported by =
the last Sunday's CVE report.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Thursday, September 25, 2025 16:05
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][walnascar][PATCH 01/10] gstreamer1.0: set status of 5 =
CVEs to
> patched
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> These CVEs were fixed in last upgrade.
> See commit message for 340b182d5fc972175f1d2a89127f807073c10255
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
> index 6ed00f9aa4b..db662dfec17 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
> @@ -71,4 +71,8 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-gcon=
v-
> iso8859-5"
>=20
>  CVE_PRODUCT =3D "gstreamer"
>=20
> +CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORT"
> +CVE_STATUS_STABLE_BACKPORT =3D "CVE-2025-47183 CVE-2025-47219 CVE-
> 2025-47806 CVE-2025-47807 CVE-2025-47808"
> +CVE_STATUS_STABLE_BACKPORT[status] =3D "cpe-stable-backport: these CVEs
> are patched in current version"
> +
>  PTEST_BUILD_HOST_FILES =3D ""

