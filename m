Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437BFCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 06:02:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.10])
 by mx.groups.io with SMTP id smtpd.web10.7351.1755583362881565616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 23:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oVmMOsRh;
 spf=pass (domain: siemens.com, ip: 52.101.69.10, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWKc64X2hbKNqyJy1mEsqKkO8eh5CsGX7xnafM0/LwCi4ncfG41tGUxEmONlLTXEiSCdLJwNtz6dOWi0Amw1oySXXriRBeiBTZt9L7e/byJfbXDbPDPUSNV9Ejq1zPjQZcTGWlCG5C2RrHKArX4DfDurjmJHNdUILMC41AI4l+t6bij+RXrzTOCwqn0K9mj8e9TbMNOoowVLDW3I904DhEK38h8LYFXOcio5waWRmqMUd3zNiiGje+9MRPaAQTGc8I3yL1QVEEV8J9VkmSe7I58smSWcjVx8imOSIXW6TZpS64q+Bnfmts4xpBe7Ou3fRYqnT+3dnI53xyFvKiz1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HDy1bfZwFpKFx9/GBrmbncZdUOJqNpnps4VmPA5xL8=;
 b=r4Gt2iKi18Ov2Hog+ocrNS5g//YRtKquTmCqvY5aNd7D50Q4sNdLi95v/vpzwROWL3d1dBGZ3Q4zw0hzieuSBoPYufLn3qVGZifRFH8TjuNaUtQ1QyYRLIE9p/8cVjXcSUN9p3yPPvemtF2axbB6IowzJ2sltWiac1L97ozP6uxtlbSxXuiZm1RnOnby3om/3pGUbe+hf7wi5SJF8abjPr5IK6xyU+vtDK9iDLc2ZeVvbSlblGqRfQMJGeJ/omLa22DPJvwiHPKmm3T1k8CmzjxvItlL7tIeKBMrNKUMd8KPGCvLAUGHuG70tyFkJAph+swL0NNU9W3Mw1n3y0u8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HDy1bfZwFpKFx9/GBrmbncZdUOJqNpnps4VmPA5xL8=;
 b=oVmMOsRhrFcylZgMSnUC9+3pwu3PtFOK2SD1MeNaTyBECLgw1I+lDuildUI/5rzcip3Y5MCW4hrbSoJgdMFC64dVy8VP3la8r/9xpnLutG/G5WKpcEYVA5uhFSof0aw1/DH2v3GjO0cQ5wnODCS/9gxmUAzu6ZHuGIg6VQWt5Jab5BfM1XJHK+pBybryCOXOU5+7NuvZO313eqvdl91lK+cRACDb1ZT6uiD8EZehOIBtdTlPD5JXHvE1Yc183XB0WIYzzGNGFk0to2YHbxvt9lO9uA2ASBTAol6nyb3ZHdMq8ayKDicFO/xzpTLCfg0oUH94/Yl60wAdVgJEKJy7wg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:139::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 06:02:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 06:02:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "osama.abdelkader@gmail.com" <osama.abdelkader@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "anuj.mittal@intel.com" <anuj.mittal@intel.com>
Subject: RE: [OE-core] [PATCH] init-system-helpers: upgrade 1.68 -> 1.69
Thread-Topic: [OE-core] [PATCH] init-system-helpers: upgrade 1.68 -> 1.69
Thread-Index: AQHcEJNaF5XH1H3j+UK2KY/SuvRDALRpfEuA
Date: Tue, 19 Aug 2025 06:02:39 +0000
Message-ID: 
 <AS1PR10MB569772ECAEE32EA29F069717FD30A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250818225622.1057866-1-osama.abdelkader@gmail.com>
In-Reply-To: <20250818225622.1057866-1-osama.abdelkader@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1987dace-2874-4ad7-afd8-5bc296c083b8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-19T06:01:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3577:EE_
x-ms-office365-filtering-correlation-id: dee87b9c-8d48-4b51-bb7b-08dddee600e9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?dnUeVJwLR64zpaDGIVtWkcBsWfFeuS/v3W5DWxGO5K1JUPKWknp+4wjZs2Z4?=
 =?us-ascii?Q?vDE8+M7fpX85TRA6HeNovsLIDfDtBWIoQAAGNH6RGwdBU9UWxkMD09pG3HNG?=
 =?us-ascii?Q?R+c8K1kimoTNcpGLh8LwHbmSUM/+PoPWL85Xnefveh/vzTiS6ZPCwOKVaUka?=
 =?us-ascii?Q?I0NwL2q6h8To3YDT0K3iiWV3UX8ohCgJ0mQek6IFivw9n7t7m/7n1jpK9Kx9?=
 =?us-ascii?Q?hgIC5VXwibZUXoyyUvN7XLktJMXXCGY0gtFDoSD9K3fh3NdzMkfUG6DkqHea?=
 =?us-ascii?Q?7Q617kX075RLrVpWEH6IFJxFV2JJqCuqksvBqm/3GkGJqlbJeMRLKKXPvaAi?=
 =?us-ascii?Q?P8U7Bk1AGRBNl4Ggdz5kljrFWDGJWJbUNVrb8dt1pcUbjPG24Ju9lkfYAOl0?=
 =?us-ascii?Q?W+zMk2OC5pk1PtlyU7p8mDlK5OzJkN14IWoiinrf+GHhN1adz0cIx1UanmY/?=
 =?us-ascii?Q?nbkcyFC49w4YyPej2ti5+NdAMkAcnjQU9nadFnVZC/dnPViSgPUZGvCy3Hgi?=
 =?us-ascii?Q?5PEL91o5AfyvAmU8K74RhWCQClQitY89n8L067PtVahwbp6iVZlUrqgG3tM5?=
 =?us-ascii?Q?D42SesBDiIeURscSExETt+rS2ur5pIq/Jna0SAD4JJIQ8DpH9+teVXMqcEKd?=
 =?us-ascii?Q?8ZBKk6NJqdaXjHFkUGFUQ9sGhGUBJ0itecS9y1v7GEf2kefYfdXpMDJu1xju?=
 =?us-ascii?Q?LOmU6/C+lmAEEHahCBrC7HYePWxFa/8tgbE6M5/YJlYX6lSzaNZBvZdYAfyY?=
 =?us-ascii?Q?eX6ZlU9GSnoenAuQT8QfBzDhRPUgiRwtKiemaiGmiTRaAQCGlzyZgg+fjy2k?=
 =?us-ascii?Q?NX1CwEzMRj72Y/oJBw39U4oa38HZUHZkr9bnsZlmjCQ6FMC0/bVFY6LE5xvA?=
 =?us-ascii?Q?+nd4itllsahevImXCG7TLjjY08Ell0qaATXZ84Nq4RT0sTRHMpX0/RfJlA2M?=
 =?us-ascii?Q?HRYOQRalADfuKwqIogYpPUrAY0HvZrwZjDHtbcQzE1QrkpAQDwyiuFXSQCH8?=
 =?us-ascii?Q?LKP/b71gXZMU1Vv5jzgIsxUEXDJbNGQuwrjtH1LgzM2/zTeYjhVZO59Fv9fc?=
 =?us-ascii?Q?DOe1DuAWfTIcAqLo7KWrZ9P6VDJdSv42FTWJZDVRDAOXvTWn+6KPF3+Wi3aP?=
 =?us-ascii?Q?G8TZGfbCDIhm6GwNpmJGSMjRflmBn2Y8i0ox3SMqTXArD9qH+z2yOZ68tHM2?=
 =?us-ascii?Q?sXdw/W48qXd1ImTjuabG9iqSBodyRPmeKWLjEB+uTa4SCRFPzUc6/CiDGWVf?=
 =?us-ascii?Q?GiZKVwsjMNe2R1nIm4l6xjY/g3pDMWtX7r0b+LCMfhUDef4OdIJmQI2kqMZY?=
 =?us-ascii?Q?7eKXMhzpGyJ6sRAVeMRAA7pZHRwhdR/I3F9t9b+IV1SOJ2jzjoJzW2A8e0ST?=
 =?us-ascii?Q?yQRZbsrbTug6G8lFuBX6kTn9RydbNtzaVtaqTmxwP7TdH9pPi9DFPqpUNEpC?=
 =?us-ascii?Q?7R7CnCHnvPU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?njX4/Mq2rBselbDbWsLnaf+1z+Ek2iW4X5Kea/NLqVlfH+1E+gU+0eGYjNYq?=
 =?us-ascii?Q?Odpmn14mZqOLqWI8ZFDSiLQZQWw6+zlHzCuGOMWKEu2/0OiCLNA0OVA4f7GG?=
 =?us-ascii?Q?zEYABfciHQGCJUl8gnbf7CHRKs35DVK8i+rpeHP+g1AwltwriTxPK7wW0sTM?=
 =?us-ascii?Q?bNhtnqokBCOrYI6ufzHukgupi9ckcqFiw9xEcgCHXMvNRln9cp0CLYuDuY9Q?=
 =?us-ascii?Q?qisYZZ4SaDeVrl+F38G8RlPIxUavMA9YixE1Kmdc5k96/4SPv3azA6dU3B/l?=
 =?us-ascii?Q?TKwbhmVMpAcGegERP1SS7+S5J4yPGB+g+Rruli248EbCLe5EqhOCBE571ehs?=
 =?us-ascii?Q?r52IEwLVkdvCDBugNOcmqSmeXetUeKWS6zvbn/JMnrl+m5u3EgWaOSSt5qeI?=
 =?us-ascii?Q?6GUJ+9CH6H4NiU79SsK+OX5yuZOST7JBdOzLfiKzhcOUCp+fQ98VWq4aoPN6?=
 =?us-ascii?Q?aquOatxUvNdnuypqdRTJcVpq3kZJzUUWnb3wpWLs3Boh+Vsz1UocsmLXgmpD?=
 =?us-ascii?Q?HySxXFszyiHcc1Wi9/mvf7nM3DeqdNYplLLNOu2zYTHEofSvpjRNX2BPcb9A?=
 =?us-ascii?Q?gEwfRn1yW415/zb/SCAKxDvaQ7Di6SOB0vOGVE3cejmCfFt3hIHrKIo8iTr7?=
 =?us-ascii?Q?4VtCMtgdr1N7CfRErqQt+QvyWgSy3BYQ1Zwr00PXczGH0/c2cgx1CrlVXeKl?=
 =?us-ascii?Q?3WemFlivuBBHjoA3nDQStcvj0ZoiOGzcflJn5KhKeukVndLaw+Z+mHSUWNAY?=
 =?us-ascii?Q?5M3CkwittTAEWiBOZcEQcGkTMg7tz5THDG5rnWAx/rZtId0SpdNDNyPB924n?=
 =?us-ascii?Q?LznrrGbs9Tnv2jM6pOY42HRNeWKPszLJYeamqpLLPdsw8Rkq4OlMhD+5OiFa?=
 =?us-ascii?Q?aFMgN0OmfIryg3EWE1M9utv6a9GVohq41N3bellSmgQt9c0qnCNsMngiDLzJ?=
 =?us-ascii?Q?cTwDLy5AcZGsbI4tWnAFlRwW63Y3LHpMqZgv53K2anA8MdGYbGiXBL50qDZi?=
 =?us-ascii?Q?bRTST85+E9FbWzZ6AslB8gN9kPo06nSvSCoblx/VMGz6BU53uC5VQT7C6tL8?=
 =?us-ascii?Q?EV1d5HGUYTgf9XvOLV8IIvfDc+m5OqXBd8g+d4h032geFMY3E+MQz80TB/mx?=
 =?us-ascii?Q?G3mxe8a9IixjQGLW1m7i7vlU0DfjBzfkxa8tRDQFje0RwmATeoSqWz7y2hVp?=
 =?us-ascii?Q?xH8enbHuA/Gz9ZbmXIl2urEXyQBBFPEBnjOn8sIeSDV6nHt038uUmFVQ7RWQ?=
 =?us-ascii?Q?b4Pkyso6qmSMlqnUyk1YkEQGZu+F8nPAIzrFW704oy4MucmdM5OrqsoDVnXN?=
 =?us-ascii?Q?kPG/DHPJOOsBTntC4mNwkWZAFHQi8mVYgWdKTb38YMAYRhAlp4rK8IJcDRpH?=
 =?us-ascii?Q?ol98TehMeBvBs1iszNfQBG7kUQqoKLU3idc9qxGUWGls+Hsg7mUJT7/Zws8s?=
 =?us-ascii?Q?churG9wFEyE/q7A+uMX2t8Bih0jVqKm1EFxZ1RdE1qPVBt8B6tvSe2GjOLJm?=
 =?us-ascii?Q?L0ZywI/u/URKdJ7pn+d47LOW6EF9p/rriV73JRWs61QXnfEf+b2BvscBKmDv?=
 =?us-ascii?Q?DO8xQHQGeOjipWEmQCpIyojv4/li9qqEwoM5zi+2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dee87b9c-8d48-4b51-bb7b-08dddee600e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 06:02:39.5377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToyGNmonY0SSnfz14S0CpdGqBHPU2mwc0BIpECUEYKZ63nQ9agktPtl9wBbPkDkfsuWJay3I++rydGF9lDGBMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3577
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 06:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222074



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Osama Abdelkader via
> lists.openembedded.org
> Sent: Tuesday, August 19, 2025 0:56
> To: openembedded-core@lists.openembedded.org
> Cc: anuj.mittal@intel.com; Osama Abdelkader <osama.abdelkader@gmail.com>
> Subject: [OE-core] [PATCH] init-system-helpers: upgrade 1.68 -> 1.69
>=20
> Changes:
> Add postinst to hotfix an upgrade bug on certain newly live-installed
> systems built using Trixie's live-build (Closes: #1111039)
>=20
> full changelog:
> https://salsa.debian.org/debian/init-system-helpers/-
> /blob/debian/1.69/debian/changelog
>=20
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  ...{init-system-helpers_1.68.bb =3D> init-system-helpers_1.69.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/initscripts/{init-system-helpers_1.68.bb =3D> i=
nit-system-
> helpers_1.69.bb} (96%)
>=20
> diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb b/=
meta/recipes-
> core/initscripts/init-system-helpers_1.69.bb
> similarity index 96%
> rename from meta/recipes-core/initscripts/init-system-helpers_1.68.bb
> rename to meta/recipes-core/initscripts/init-system-helpers_1.69.bb
> index 48ac7792d3..83320e6877 100644
> --- a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
> +++ b/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
> @@ -16,7 +16,7 @@ SECTION =3D "base"
>  LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D
> "file://debian/copyright;md5=3Dc4ec20aa158fa9de26ee1accf78dcaae"
>=20
> -SRCREV =3D "78486a4a2a305170b66ce4d907bedadbaed10daf"
> +SRCREV =3D "592518fcedf96c9b763f214a9acbdc1109aaa385"
>  SRC_URI =3D "git://salsa.debian.org/debian/init-system-
> helpers.git;protocol=3Dhttps;branch=3Dmaster"

Could you also add ";tag=3Ddebian/${PV}" to SRC_URI?

>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
>=20
> --
> 2.43.0


