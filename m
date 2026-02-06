Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC83EE208A
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:49:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8760.1770374946353288222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=umZlh2OS;
 spf=pass (domain: siemens.com, ip: 40.107.162.24, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8NX2kkAX5EbwTtHyMP45GSoPly/l12D3nUdJyNYg/aUtwEd7LyMFWo+Him+ePJibssF3ZWsedXXDQn9Tn8oNehWtWmnSvEvTuRElSnHszcYBByXkfalmk5KH9nEOIIt+tGUZDm4sMUZms2Dcqame1DCAh67v+LqWAd9iaGE8CHcu0/Faj2cgFkx1oqvWeDlZg9GIeko5RAogGXZujEaCJ/X21vvTqOtOw/+mCaV+yc3DkNOHQmUBZiCe6cGKaLWlrNKwU5bZWuSaA96WTMOk9Eiu8swP69DxYcWSkiDLfXgl0oYuZ4F2KW6/6lLGP/QeBwjtLdPijDlgkGr5zD4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ptyZQPAEO+N+nI51pObRSbZBCrIzE5PJomNrmfDEvU=;
 b=IFW1+1PzFP89FS49uUL2FIKI4CasAJOA4GpME0qaUY2ikdaY8HsukPP7YmYjBKfTyVtl2dHyRywogWzQuIaUGNAkjwy7U+anr0S3SI8kwk4L2W9PYMYL2kEoA30leS76f38wnUw9czybHNZVIrL/avwcOha/mdoseQwXY+aHrzoDFrlUtEFLKvKOHs3kg+69jeQdpQz5ziyo6+PpCarr8vVDfHZ57wHGFH9uAbju1ni/NdI+yhIJ9kG3nqRA1jQwbqvgC1+jNn69OyrE7FKepXemrvSBPQZ+5+djw7kDzZqOXaHjVNrL3dT73xdt7oHMMXII+J8SnAU3ZaT63QUWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ptyZQPAEO+N+nI51pObRSbZBCrIzE5PJomNrmfDEvU=;
 b=umZlh2OSULmw/kH6gOvO1lFuoP/w3cvOYDpCjyoHRWy9ZhheY7VskhKaJ981IG8CsaA6yWU8CIzDLruJzLzONrLNMxdxeUK4eoBFvUJ91zexm6YkfbGuXcVCSAJya3xOBhFau7MZjLTxNUqR6dy5AZ9wqD8B/9LD1CMmIPoAUZKF0k+DXOtm7YqUqzO867vME9fkebZCmFSuKMEn6AjpwJO3zd4gILW6k4XNdR06YpKVxjWZBUtOlsSpMWYKpo7QLqE339svjdwOmY9yBSonZEQMkUz3LjXXsPorKTh2GRpv5vsBDpPh5YJXbhuX5OJsiCUNYg291tntqjvQVgFj8w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB8381.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 10:49:02 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 10:49:02 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/5] vim: ignore CVE-2025-66476
Thread-Topic: [OE-core][PATCH 2/5] vim: ignore CVE-2025-66476
Thread-Index: AQHcl1WEEiDxFuefwUOvYcs+SFhXeLV1fZEA
Date: Fri, 6 Feb 2026 10:49:01 +0000
Message-ID: 
 <AS1PR10MB56975AF8854ECD9772244297FD66A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
 <20260206104322.2604271-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260206104322.2604271-2-ankur.tyagi85@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4f953df1-695d-49dd-8177-f1b941e2b449;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-06T10:48:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB8381:EE_
x-ms-office365-filtering-correlation-id: 3b823be4-146c-4e9e-257c-08de656d571b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?xdzi0Y0cKualE5Q479EdLjEzkNMVhjC3Kz4YW/XU6p9JHeRczyZlTGt2m76f?=
 =?us-ascii?Q?HD8cB1DSe/mLn7FT9jYUuhhT0Lx18J9s560cl4u4Af43MgkfvATWAd/m0bid?=
 =?us-ascii?Q?y1Ytc+IPcaUoSltLjgdFcW5R5C5ms8NYTvpYAojEziq+uPV+ncfCnolsO4ck?=
 =?us-ascii?Q?jHdvE1LwjtcQFy/yT19k2piS+ul2pjgUQLrlnE3ek5cqJ+dq5caeckSlblZ0?=
 =?us-ascii?Q?ua+A2oGMf7tT8n850iS2v5RQBJcn3mT2yt6ymNj1dCFipPdtwF9IIRB2PLed?=
 =?us-ascii?Q?ajk6WMJbXcILxhxE1bMDzRuuSkoihz5Tpa6icysTdNbxYnKqRUvWTqJLBMCn?=
 =?us-ascii?Q?XGdoFZynPVAK9LQVyeJ+JM5JU2aAebLUufk2SP7xztpXkt9MHtv4XcIM0DSv?=
 =?us-ascii?Q?8yyu58mJnzFsvDJFAU/eGiy4uXO1l0bkGqIEoHckWIkGO2fA/dcDlGUxgEXT?=
 =?us-ascii?Q?ClZiECTHXrZ9VDCAS5x/7bGEF4ACDmQ8g9x5aW5SRD5nlK/kb8Stxyo3AQXy?=
 =?us-ascii?Q?nHMUz6uekB5hC0Jgpi1wPoD3bRQOWLK6pl+SFYNSkOZjPF2EB0hOvK3bGOt/?=
 =?us-ascii?Q?B6nBGDcCuyQhz0fBbO1lXLb9DQOGPyJ+IBddUtolDtY5fQyXZfhSMS1QyUPU?=
 =?us-ascii?Q?r3oY49D7SmguQbirtDAMEEaC3Jbb/NbeRBwyNkYhE0gJBKGQy6ehVJBh3GO5?=
 =?us-ascii?Q?DKwb689JTBnf3yUh+V+sE/iBjuCPYYeBEOcMZAc859pFqGpPZC6ve4dr7yHu?=
 =?us-ascii?Q?z8LOBaGCoSzlIJjy30KwKh8LaSReTgrvA97cWhc3d8cyVDOtdzHUU0zMNK1C?=
 =?us-ascii?Q?f+7aEbJ81Y7hfUbjtaeUXUX9e0x++Ef7djwbWvJU/rZ7UJ0yliwsE/2U83Zl?=
 =?us-ascii?Q?ltZkMoP4HVgjC/rW4DE4cN+m/sprBMCJuEfabocEUFdRtT/rgXa5VsL9YGbD?=
 =?us-ascii?Q?JoxR99k58XBP5E4n8x+ffCBzM4sM0fvy1zp/mMemI3G6CM8vG+aT1WqAun6q?=
 =?us-ascii?Q?nFaYaUEYgjEJXae9dsfdTtwqZ8Qgckz0fCvAMtAeMntIm0A4rMtoOJIG9kCH?=
 =?us-ascii?Q?FTETeuGZhTjUIB3peGGiRQN90oxwHn8JxU/9aM+pCgXi3Juu9pbo9AINfzth?=
 =?us-ascii?Q?hrCbzOVB7l/5oXh9NYiHwzoe7uz5UX/zA7eEUqclerGsUoYogM5frS0r09qN?=
 =?us-ascii?Q?ToPGNNhBPf1bFE1YYLCk+TxTjDZwr+LG1LBb3PSnbbEzLZ296s3uFZcrSxiE?=
 =?us-ascii?Q?nYW+VXZhRTouPm98QMH8CqioSByFUDOmw8/R0zfITNAm9xH93m6u6ZST1zG8?=
 =?us-ascii?Q?a8hjYdvKDbKvZhPQuDHw8ZbMnL2+PeayBmp0QUlL8FuUD/wqk1ssLjYz+0ux?=
 =?us-ascii?Q?K6JJnBeMusICNIWFWafILO2O0MlaV3wexoIEw6l/PLIgKTm7xtv3tAXzWew5?=
 =?us-ascii?Q?w7N3FMrw+fWdiFgiG62ba+7wSTzveNeknDQ0CfaUqZOTHqqLtYRxHO/p6TTx?=
 =?us-ascii?Q?0jSeeT7Mctxf8s6E5jRCo3EXBQnPVDPaPtYjil2sn1sPhH/3+g32UrArrqUZ?=
 =?us-ascii?Q?PuzLH41ufFp/2OLy/1HnrjrHpw9ODrsv76jaAbRbOFa7WY9EqCiRULavLrs9?=
 =?us-ascii?Q?wXd6pyKOfLeUWagSg7P2TRY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gCjfgIqDBgd091zosBTBo7b/DwKrs7DKAeRbPpSQjDrr2nScSezHPBjfibPh?=
 =?us-ascii?Q?W2kNskImhrvHDn5D1t/FkYzYqflQCmhZvFjTQ9o8+0AmNfBcmgR2lbqqXzP7?=
 =?us-ascii?Q?PiHyW7WZePuxfZseKd5QzVYh0YRHbaYqSk+4nfLuY/ffegUTvU1n2hrH8/Ks?=
 =?us-ascii?Q?iOXiXreQoxEkeM2ixCJwZt2N8+lLn4do/WxrDGej9MV6183kq8uyeglIDRZy?=
 =?us-ascii?Q?YKvu0iCXOZnI+kwhOTyLc8IHnM7MlJWDrla9klIH+lwwCiFBpc0Lg9G+MJuf?=
 =?us-ascii?Q?Bzx2IJ1El2ptHI70LCL7MA61XDn//qDao71DVosvt81BA5suTl+mpzgVgvCW?=
 =?us-ascii?Q?SNtqNvkQZTlHK3wnIMbIFLXlLVjg7TD5kyQHj4JsLgDGO0eUV5QGvwL75rt8?=
 =?us-ascii?Q?ay8GmuY8zb48SvPbDZCNRLGE10yLxrzjPxNjf2Fyh6Y64canW1d8I6aH5piD?=
 =?us-ascii?Q?r7G8f0VjRNMnK+LDsf0uRZwn9pjgNWZFuiqmwClXqnUhc9ECIOcXP3vlM86Q?=
 =?us-ascii?Q?mnIVbGXTFVXqp6JDWHH1dNv3R9je6g/5lkvogYKaZbRUHr0lMaH6mctN59SY?=
 =?us-ascii?Q?Ai8AigZfbO3/qAzDbzj13AybXMPY0uEScDfOm7pmmOr2WkpM6TGJQiBZNs22?=
 =?us-ascii?Q?0h7rIoX90R7qGF93hU3HqqyS4zNYzfDW47w/396DpjuISf4WuXe3e8bkxLTY?=
 =?us-ascii?Q?ANZ3QOZB8sgspIouoslvW634gEPz/4wxyM/+hGrV/A0IiGa+q0UaZpZ0ekHP?=
 =?us-ascii?Q?iVO0yS7sfRZnukTXipDnn2MNkYukSkvzbH3v7qhPe/kt1HXMgbKYjTiiv36z?=
 =?us-ascii?Q?O6+Wvmho9Wy8GLehbayn0cnFuVG3+AqMooRe9O9yhzb5z8ag7Pbccb6ag2rN?=
 =?us-ascii?Q?6uplC4L64Vt9YWzvMsUqGZHalCKj0LuthDnbJWx2bCSmLfASaFcn8p+iNQXz?=
 =?us-ascii?Q?a1wyuJnVoHqqdeI0/xVUJ6JHttfumlgLBrYBBlf+EFIGVDNohbU1ROzoWuoy?=
 =?us-ascii?Q?XBCWkEg35BtWPkl45NgyMEEiqtusqKWxxYf5+1yaenn+DdMlnOaFM2MzsN4o?=
 =?us-ascii?Q?fAt3kxaeICNI+kXR7vHEyXLfoUZXVSrv9/PmPw22o9fENaQXPVz08UmsMekB?=
 =?us-ascii?Q?0ztOQJaM+SooZP5GdctFEicPWY/dOKUlRKqeRckZRqcPW0kqo7lof0TEO1d0?=
 =?us-ascii?Q?WGWPQOcBfHVtetQIdsHscxOWDHKp3lqIZOBk8FR5wNTaReFooMDA8ipvZhRD?=
 =?us-ascii?Q?zlQYgCCT0114ny0LTWg+s+mDyZJqGDG8uWnVRNSDpoC9NlorQnxByz91hGBu?=
 =?us-ascii?Q?+shpcBkf9Aj3Y0x0m+M0FdbrFUTUYkQZfotm/NgMR7dx/QBvHOpBIERQUQ7L?=
 =?us-ascii?Q?XWg8VEiOOf4GUvOmtKUnkHWpm5qL5opP1SvqwuEGrwOK3qJLHzI9Q2J163Zt?=
 =?us-ascii?Q?YolNJYf5WMz+eLtLWCot5Usc7GE7WNnZOWJA3a2Sjw3kp5Hn60XRt7DJO2Br?=
 =?us-ascii?Q?L2cJKI5lKATKbE1WzmNGNHCwAhkGWxxeAE6qDd90RWE75XIwbVVwxHeHvCjK?=
 =?us-ascii?Q?/gf4E4GltG4frfk+x+tzarVwSkdZ7XxFpC2Xf0ST/52HLM+a20XrP8iMdul0?=
 =?us-ascii?Q?byhnl2ujHe5vnND+grM20iuZGZcCukvfwx6M5MMpPUXizz5lBRvL+NoAK+Er?=
 =?us-ascii?Q?802nzjaMr4SnPHE0s+s+pZmCZKf/qVMY0jkw2gKAzQIwrwTdeBXZ34PKikLG?=
 =?us-ascii?Q?uVHMGDbNVw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b823be4-146c-4e9e-257c-08de656d571b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 10:49:02.0109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FuQiuZeMxKDdupzGJPtAMCNuTz+3yTt1R5a0KL/3OKbnYzcXunsTkUzXeZOj869KXPWMaEA34l+sipx2uPGPGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230608

This patch is not needed because vim was upgraded on master.
https://git.openembedded.org/openembedded-core/commit/?id=3Dcf63518d20c3c4a=
61b0e726edf1df2201e88e8ab

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ankur Tyagi via
> lists.openembedded.org
> Sent: Friday, February 6, 2026 11:43
> To: openembedded-core@lists.openembedded.org
> Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
> Subject: [OE-core][PATCH 2/5] vim: ignore CVE-2025-66476
>=20
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>=20
> Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476
>=20
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-support/vim/vim_9.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-
> support/vim/vim_9.1.bb
> index fee9f055e9..c492342ffb 100644
> --- a/meta/recipes-support/vim/vim_9.1.bb
> +++ b/meta/recipes-support/vim/vim_9.1.bb
> @@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
>  # in many places for _FORTIFY_SOURCE=3D2.  Security flags become part of=
 CC.
>  #
>  lcl_maybe_fortify =3D "${@oe.utils.conditional('DEBUG_BUILD','1','','-
> D_FORTIFY_SOURCE=3D1',d)}"
> +
> +CVE_STATUS[CVE-2025-66476] =3D "not-applicable-platform: Issue only appl=
ies on
> Windows"

