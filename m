Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A973FD0E6E1
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 13:10:49 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16671.1764076244441764904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 05:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DZYxDSwz;
 spf=pass (domain: siemens.com, ip: 52.101.66.26, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipvr9IC4BWdcTknwicYx0TT+ZfMBRWJB/3N3ieSmA74EQ77QCDyB5CmzRrip8560/Q6x7B3jU3+olapSDdMMvhD6KnbkY3yomlXQ6kf4d6UYheq2X1SAxkk6wDPWAkHi1gSUUMkEbtPqJ/swzf+A3UmOx9lrrDNR1cuBXM7mfXv8f26yg0k4zhwK3+RHD++Wz45NQ+bjGkw6ChL0lw6G4LfSZ1q3MWcpwIQSTsgLqSJ8XdU+70/9qdj+VBk4uptiLhBR8oW9n6NWhAZeI0vj5AIOdG1vz+WTCv33ABLg2XOAm7X8v4doJbFhO8w5HK+F9FZ2g95hX0kP6ernIBKcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdlEdDhWOMp251s3udW8SwOhaUApOXeof4LKu2gol+I=;
 b=H4MIPrtDaIsTnG1PRJUCYdbaQE9asP+pRh9DE68KsPhUyuey93GeXVKc+jLGvrndCEwPmvu99AP5L4+8eDWNGpx7yVbRjlvBC4BxTiPk1IVwifg8VVjdu4B4XTAnhxaFtlO/ayIsNFZvhXTvHcU8f1XCRBzP56sN6lS8HJdNf5Au7sDHey9sw9FW2t6OTBSCreHKtDZdtXWU7RFedJ+Zm8mR7ZjO7w9BrG3xmVlIDfkhohbhG43WJj+hHFkTThyuPY2cy008OBhqlfdqtPHPlbzrJlYHTO0P5hZ9wdpLu7/RPY9pUOC1vbE0fno02eWHgCDYrckysUPqcK7hbG4Ajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdlEdDhWOMp251s3udW8SwOhaUApOXeof4LKu2gol+I=;
 b=DZYxDSwz3EoE7CpPY1rsVffoIswMO4exK1OSNAv6KQ2HpdoqcFwkK2Jm1OumJz3Eq4RudvrVy9tz/CXYTAaqtDDswfOoIvaauOXnnB21suVjRxChaSsJkmCwZ9ArfrCxFMsdYoJUh/zC5eSBuTDpzbW+L9jKxhoSXdK9vRWrhnlIC83DES0P5M5d5vxYr2c7qCYVV6l3iaDy2hz6wgncle27lKt2WVDQyk9NQV+ErkKQGjcKFJKptI/PBT8AfI+nS73ctMQ/oV5yCyc9iq3cazxHFvHCEX0LzrlU0v9h42ML13hkZBHSNQXQjennz5Uov13dLc/AL/exwUoVq8Q8Qw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DUZPR10MB8291.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 13:10:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 13:10:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
Subject: RE: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Topic: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Index: AQHcXd4a4JqGrneHwkiX+phh+Y2I2rUDECDQgAA9dhOAAATwYIAABkRzgAAE+LA=
Date: Tue, 25 Nov 2025 13:10:39 +0000
Message-ID: 
 <AS1PR10MB56979EFD187DC70F47A4A868FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <PAWPR09MB803066084BE4261C627B09BEEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <AS1PR10MB5697B560F53B3853DC0107F1FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <PAWPR09MB8030A52B0E6122B81CEED6ADEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <AS1PR10MB5697DDEA8FD729A473CD61B7FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <PAWPR09MB80303FA72C627A38CD6CA754EAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PAWPR09MB80303FA72C627A38CD6CA754EAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7c23643d-cad5-4db2-8ad1-9b6dc3da2f90;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-25T08:31:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DUZPR10MB8291:EE_
x-ms-office365-filtering-correlation-id: 173c6807-47e5-4828-72f3-08de2c2407e4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?s/QTG6ao7dH3rOUq+PYIq3mhzgTboPw5OqpV3agVO1oWdHd2hUQULlXe0TPg?=
 =?us-ascii?Q?ybK3vCXerN2unLEPnxj6nxSPhcvIWwPj4OV/bwkR9yKII3rBWeLBzUbUFIZi?=
 =?us-ascii?Q?jM3DyT0F2XXb10uII5u6rLdRAbH5VsO2Hu2knQJfub14Fm/gC09FEeo6mnBn?=
 =?us-ascii?Q?SYuCgzHZ2LgvnkIKcMhyrZsqmuOAfPwYi+pPJSGbRCGpSsN4u45+zSrEbI+m?=
 =?us-ascii?Q?Xeg8QqZpf+4ERFgYx6+uXBujLpnA6YdSEoDx2W1c1Um2YiiRn8AeHeU58/XX?=
 =?us-ascii?Q?czKMRRRgYQExHWDNiS8nVxGRBDMRd56BNyqyTS5Hc82WNP6LfbHUsG4D57hI?=
 =?us-ascii?Q?lO2kxIZHJnys1gYjIAGfo5hQ2E/A90Bi8ExBi78dpWDGO5E2nJ2xZRCbYHho?=
 =?us-ascii?Q?2s30XXqdTQJGlTLKzoKJTxX7jjkYIrGSrtd0G1BUld96tNSDAcv+TmcqKm5S?=
 =?us-ascii?Q?Shq1Di7KHwh7iQPDZ3IP3cbzmP0KMS7JyBxpAt9AaPW0jxJWHOBS9hxL1PO8?=
 =?us-ascii?Q?e2RnV3jhqxQjp0wAkVavJMlHEUXBVIHA/9M5LV+FZgRIInNTgeSdr/deKl6o?=
 =?us-ascii?Q?D6Fw/n7I6u3oE+ry29v6p48wBvR3/gdkqJ1rKhznkWnWzDw/JIy3fKJJ36LH?=
 =?us-ascii?Q?Vd+JjTUO4k0NhjitCSD0QItfbvekKtgfYo0sXDB9yemgnjqIEi7tHUmgOWIy?=
 =?us-ascii?Q?wEMREFsIJEc4ivHCFVywhslh+1jbQ2kSmcDkwobm9otYv1Uc39OcfiyOotPQ?=
 =?us-ascii?Q?NdioZlX/pZynomicN8jhKZXVQABebofcmr4CN1jajymt97ksSu/bJ5+kx5kU?=
 =?us-ascii?Q?/dL89os/NZ5R6R0HxTtF8FX55IUfVr9juJLXB6GNYK4t1eeHjgEshBt6wRRj?=
 =?us-ascii?Q?VuxrLGFdKB6cwqRx+PCpa5RugK/tXL3vUbYnu09HQemBlAY4hnlhzoPabqz4?=
 =?us-ascii?Q?lmRGMhVzajgxvJnKM78OjuLIuzB9/cdOssH8yOy4o36Ap+RpUcuoJjaStVl2?=
 =?us-ascii?Q?+4NmTZJP6nyI8ulF1nGSt/5Apm6MEAOSJ7soVa6t/9O2O3L4cxXQhr9t5u93?=
 =?us-ascii?Q?4KJ9Ogscac8jR4eY3uqj77uzC/SzBkW38+Y/UqSwJllxk/P8AVcKL8XDzxGK?=
 =?us-ascii?Q?2+i3P+te8q/LZIrDTxH3wiSUYVsDI9GFtQcays4plrJxZtHqUxKOdusPDW2N?=
 =?us-ascii?Q?WMT6kaIdJapNxbR78jq88qeqLHRWCmcocTkpNG27KYnJBIjd+AQCygAFx/18?=
 =?us-ascii?Q?Y/E4jFBJ/IGACHDgdmpV5zdTFy/zUStBP9iIxDOSCoEychCwACPQnyTd9NVi?=
 =?us-ascii?Q?gXxQBaMCac1tFJVb9z8WMbdS89r+8hbvUCCPeo7E3aUpjtX4ResmiW7d4JtQ?=
 =?us-ascii?Q?qduiDhx2BCcdRQOLoitBDo/Jl7JoJ/+6APtm2BElMKiDLUz6vGfILGTyhR89?=
 =?us-ascii?Q?M+wN9fIrKqsvMcygJF6iXkKcMTZzycRbRUdvdno+y8n0Wqtg4ZwG1f4g7xrB?=
 =?us-ascii?Q?ilHg3FrQSsqElkZf2w28OxsNlqCDCxTyxPqF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JAFcI/sWnmlaAkUOAI7Gl0HlTL/7ihgREmRbqLT8bsSQlnpzSx3WFz2i16qk?=
 =?us-ascii?Q?IQJQ7zD9nzk9vDbtoejuGf/tgIhH4i8aFYJ28HPMz3un1OB6BSSnxr0cSVtC?=
 =?us-ascii?Q?bq5KgIFLVUGLXVN8wYwXSNsJy6Y3U9m8pQpJ8Vhq/wNwbwoIB9VEAY2pYNoA?=
 =?us-ascii?Q?JXU0k/dcAqe2AqUMApEwQG/FnlkMaocGmcohoii+Im3iiYkC4llAOH96Yb2v?=
 =?us-ascii?Q?rreOQW3gt76DL395qcDlsFxIxb8fFwqYeh96aOatJ34vqJMPa+a9vktzKTA8?=
 =?us-ascii?Q?cG4ejTfuTQT4DFSx4H3MAJTtzQv4A9wNyrfzJ87/FHrAc1tx/DrC3roVXbUO?=
 =?us-ascii?Q?PmBN88QkZ8752Lj1jtiHwmkOtgNYAEDkRMuZl7KXf2Q9f5N304IAgd28X2+T?=
 =?us-ascii?Q?SDMRmAX2QWSRZlyqpfJ2/RBvdn629sBq4qj75du4OM5TAw0I1zz33S+5iW5s?=
 =?us-ascii?Q?YeXs0JlOq1EBW1/rw5pee4ZZCSrqM/0QFhzwk1AoC0RFNZ3HRcZdM7XvybGH?=
 =?us-ascii?Q?c/fSc+3d3JgphnfBttzXLlYU1/jwYfn2aBbSp0nhZRw2hPnf30Xri14iISU/?=
 =?us-ascii?Q?4XFK3VrtpaS67dzzA5XMlZYtUpyQ4Yj5aCXRMSyr1ny0L8JRkcodQv/rHbN6?=
 =?us-ascii?Q?zwep+/KTEi8rZ+qedVMkFWy6PvOZeiqsvXVjfulLuYsxPcewV6FCwFOCcmnG?=
 =?us-ascii?Q?+6UV8xdpcdOH6/wkhWyor+BGWaZnTJr8B/zj0/Fj7W2uFnmLjkd+g9sPxeAG?=
 =?us-ascii?Q?5Cgfho+wFIKu8SKYxLYV1T9CQ9c3cYEVmZrp7ntowdauAyr5vd0owEueLDyG?=
 =?us-ascii?Q?p6xlDgZ5WRj11SYYRlQhWLZVpf4yuP2OVa9zvLf4+DqmdGNbombYJFm7fUQt?=
 =?us-ascii?Q?e+qHvDDN1sxRlTeayl6K+pM+G1iJUyaaoLW5rciqYt9x5XtB+zvPyfWDyySX?=
 =?us-ascii?Q?A1syAN2ke5CNAdF46vwhfGModbfifpH6byyLFV3pGIhijFA+/ZUljNOmfLMX?=
 =?us-ascii?Q?fVVElq2+XvqbNANQzppYXO2pOacHGvaCxutc0iJDkFoRTqdBpSLu/jFlX2vE?=
 =?us-ascii?Q?zzh9ZZKch/4E+v5sMszIX5ZRt9XQXl71+J2b28Fd83S5D25zUMPn/85niYVf?=
 =?us-ascii?Q?s8A/0wdHm0nYD4fur8n0gTJfDCMxZsb0Ng0YVC0y7bEh8mBfBSTzQ6aS3l+O?=
 =?us-ascii?Q?FjXnoMTOGXnaXADeuE94ZlEsFp8xNkkv55XdzjjqByAXHtQ6EnWwcFATs4QZ?=
 =?us-ascii?Q?8eoLZld25BdBvmyiyeMBSXPLg1t0yeBqSogXTEN9aWmI7qvAw7vrNU4KnxpY?=
 =?us-ascii?Q?rr7AmxXDeHC3xFMcGG7DEAVIXfoDB+Z+eNjGvJ6U2/di5Xr1XMk90V5O3BfQ?=
 =?us-ascii?Q?jF6Y+n4qMhzojkBJr6d1hmHd71peY1IsfbWbCG0NnhwJC635R9mdbLKwbOBX?=
 =?us-ascii?Q?D3RacQp9gojGqMPHJTaP9RUoJKlVOYqvxxUgkAJbWRoJhmChMDVFLHQnqgHy?=
 =?us-ascii?Q?7x9ACyzj5kxW8+XR/AkhKmomXiNye5TyZqepqqpemMP1SqJ9trtPVGqnWhae?=
 =?us-ascii?Q?1fi+pfn1m52hInD8p5AlWMPEW3TsM/soUBfY04ei?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 173c6807-47e5-4828-72f3-08de2c2407e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 13:10:39.5820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3EGfhRIVg4eUVIoFBzLaofBNC+a/ug5+EKILIPIYdcdaXYWP7uOglqsaQzvkN/u5F0ludfFuPxxjqr4d3ARbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8291
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 13:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226767



> -----Original Message-----
> From: Haase Moritz, JD-61 <Moritz.Haase@bmw.de>
> Sent: Tuesday, November 25, 2025 14:06
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> openembedded-core@lists.openembedded.org
> Cc: matthias.schiffer@ew.tq-group.com; richard.purdie@linuxfoundation.org=
;
> steve@sakoman.com
> Subject: AW: [scarthgap 8/8] curl: only set CA bundle in target build
>=20
> Hi,
>=20
> >> just so that I get you correctly: Your suggestion is to add additional=
 env setup
> >> scripts for opkg (and possibly other affected tools)? That should be d=
oable,
> but
> >> we'd need to add (and backport) support to read the env vars and apply=
 the
> >> necessary curl options to opkg - or patch libcurl to do that automatic=
ally (and
> >> thus behave like curl CLI)?
>=20
> > Having custom patches in curl recipe for this is a bad idea.
>=20
> I'd agree. If at all, that should be an upstreamed, opt-in feature - so a=
t best
> a long-term thing.
>=20
> > Having some wrapper or environment scripts inline with what was done fo=
r
> > curl-cli/python/git is probably the way to go. Links you provided show =
that
> > libcurl is respecting environment variables when those are provided.
>=20
> The code I linked is from curl-cli, it's not part of the library. I check=
ed the
> source code again and did not see any CA-related env var handling in the =
library
> parts. So this seems to be left completely to the libcurl users. From wha=
t I can
> tell, opkg (master) also has no env var handling yet (as opposed to Git f=
or
> example), so it'd need to be added.
>=20

In that case the other workaround I proposed should sork (hardcoding host /=
etc/... for native and nativesdk)

> I'll send a message to the opkg mailing list regarding the issue.
>=20
> Moritz

