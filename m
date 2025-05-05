Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A786C3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 10:43:46 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.49])
 by mx.groups.io with SMTP id smtpd.web10.47128.1746441820019944607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 03:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ZuH0mYK3;
 spf=pass (domain: axis.com, ip: 52.101.67.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF72p+o2mVndgnW2W0OGo/o26wsEhQj4bTAxayPYNdFJ7e4vTZ+iX5dYQtRq786vklCflMUvTmIW3A69F2um31e7byQhXLzUcH/XHGTj/nPOwodhkaDOBuImLvG+0K2S4kfi072RAvASjvcHLl0SBfAVFKTp5sA6HNFJzrjiN16OPU2HeornLH0BmiRjRc8vfUItYFk7dX3TgtXrxaj0S3nuoVzDa1sY3hvgj8+GyDcWTUdqB7X4C0dvtiFB5dVjdpFG/grmHCC5OYwOzCeX1ef9d6YcCtCy+55uU4YJE7kzV2gA/m6DY19ad6gG7WPnZKg1DDUJIQw7GAFxYdrDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSjvfCmE8y23MTIqFpktb7hVREEX0XHLzZk+2kQzdGs=;
 b=DLidBd8iD20q96uGf8tqazhjI3Pz1y5sD7eJOPmaaF2o9k/uZiDRZvKP+SlLbmWyrhs+y767beEpmguwEoe0zfshRWRZBVjmKcshVZcaNlW9Xt5AXexOQPiddl4qN5jL9x0BcsC4FadSvWtPzj0AkqkxndsGXyLKSDCyzkUyn92OhLSwSSf2b5FWWoTf87VBxXQVPWzhnbR4NKx6M6UHlTdck5VxQlqCEVdcuOXexQJ0La6eRtHwwE1NPNB8cy7ttBuGyI4rapi7QdDsabzAP4OEFJ3PuKjjfb6eHUMs0LhOSPAixvxq8mgrLOAWmfa/ggcnRMO0bKCxOW6lJu95vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSjvfCmE8y23MTIqFpktb7hVREEX0XHLzZk+2kQzdGs=;
 b=ZuH0mYK39F83+317V4xAiCFLpEPtjb8wlsuZR3kA+tfFSUk+Yskwrq4xsDtxE2DR6D0xzNRuvub2rUnYqbjD6BzLPg4zaHXzZmRE0eAmfwGm099Dd16Yfx8oEdkBT0V4Ni6rxs0F9huTNfLqYqAiiBlnSm5iFfxmH/qcRmt27NI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB10885.eurprd02.prod.outlook.com (2603:10a6:150:164::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.12; Mon, 5 May
 2025 10:43:34 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8722.011; Mon, 5 May 2025
 10:43:34 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] bitbake.conf: ignore ${HOME}/. files in
 pseudo
Thread-Topic: [OE-core] [PATCH v2] bitbake.conf: ignore ${HOME}/. files in
 pseudo
Thread-Index: AQHbvZELQC92yvwFp0S+Fn92DhvfOLPD2G4Q
Date: Mon, 5 May 2025 10:43:34 +0000
Message-ID: 
 <DB5PR02MB10213D88EE092C43451F3CC47EF8E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250505074031.920194-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250505074031.920194-1-mikko.rapeli@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB10885:EE_
x-ms-office365-filtering-correlation-id: 34380f69-bd50-467b-6e77-08dd8bc1af42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?6Zkq+eFXZ+mq9YmGLTlmyKC0T0E7UoGPCNgLlkLg/F7+adLB8kAhaR7aanxZ?=
 =?us-ascii?Q?mIwobqZlAnLANh3jH541oSAPRIso68ZrW8jSZaXFf6pvMCyxOPUZYvC3NKXK?=
 =?us-ascii?Q?LEirN8m7Y1WniIeNUdFbHnvRcbhTFPC8GQAmmjJufoxMgFAZd6rKQVsroSVA?=
 =?us-ascii?Q?8ebeNvQiGZ7Fxph1G1GH7xAQhzGKWskJuDbJ3olGOm17ahgIFadpi9tjD0Vv?=
 =?us-ascii?Q?C7dHelhekYYEQ/50gYafHfKHe7Z3eIevpOR98Xpli/tWeE0qW53m679Po2Fx?=
 =?us-ascii?Q?ikvvTIwpC7E/9xMOj1zNmRapL9w/OBUz+qxCAJYDcwjMU9AvNm6N2mzqzjJf?=
 =?us-ascii?Q?ZjTnQttUOo7Z/YpoY17+Vm/8XwESett08b1dQR4t6Sb9BWYXFPXH2hmgjpV8?=
 =?us-ascii?Q?PGtcehBLNHIeNB6pzff8TeeiYc1EmBB+em+RRWexhLZbTbopCyLu3N8osSm7?=
 =?us-ascii?Q?98egN10qiZlw7fmWRRsEl6qN2/1GPvVv0i89jNBz7Fa4DgCbBfmEv6EFD4ue?=
 =?us-ascii?Q?TkpJVPHouNd0zDnV5w8cAexKrEx1WMby2+DQ5DRdEKB+u6sUQyk+C6jmp3Xf?=
 =?us-ascii?Q?3DBDDXLRH8E4KvFR7MoXqH88uQP00euyLNzvZcwlD40HkPfEIHF4L1fMHarX?=
 =?us-ascii?Q?pp9FsBvcYBZH+1OxI03Z1mzQrO7rUujBOAke3W1AJMlBCUqKvErKl3ayZjA7?=
 =?us-ascii?Q?uML2sZnFjM2MbhJhyVtZvRbWBWVbdmBDow3Akxxd121PjaVbL4/+PZQUpgbS?=
 =?us-ascii?Q?JSNvKbuiYs7bDDyvi4zqdIbt4ctEMNvW9J6qZLcuz+Y3phmEd1Qx9li/3bln?=
 =?us-ascii?Q?DDqqaeMj7TbpKnrnmed6Wln97NF/h0dxvLHNOrLUIBommFM5nosB5y8B/RQr?=
 =?us-ascii?Q?4peZ7FcXt5BsNuvZWRTHXe75nlqiLM8p3xJgKMHPaSavTXHnmNcFXcrsezjY?=
 =?us-ascii?Q?Q7k8qwAIK0boMz4oId5yyA0CV/cq4l9OxiwsSvVJkP4hRcZN69k7UueFHKOu?=
 =?us-ascii?Q?fi3rZmNGg8AP2cqGpAe7g8HEakdBrUL0GVAYisxHaTzjKK4kjnQf+AfUFYrB?=
 =?us-ascii?Q?ultvjhMCOJECgAJaICSsjjf6Z/OQjDpKqs5LYRyH6xwoBnpKs6zyqrZRBz+y?=
 =?us-ascii?Q?JRllvU2bry+5lYlikw4Ml8u9sFTrtuq3K7IJM74DMfj9wEFlXalwT1Ygb02C?=
 =?us-ascii?Q?8R+s+cKqPUzCVZ5MRAPH4Gc//2+cdgz9mf1phFdzbnFPhzvCTapN9cj3jbhL?=
 =?us-ascii?Q?JRhIyqtdygGC5xGUOSS3+AXd9bbTPnYNnAbpUwLiYsixXRqampyIsz9q1DYV?=
 =?us-ascii?Q?1b52V00/FH96bAUHHlrz6jkIJEL1/e1FAwT8jgNNSCRxTc2gFfa5rLvx2Old?=
 =?us-ascii?Q?JKcT78+z3oJLWj2QyoYe0YFM14q3vYloeupZKeUoF2rcV5+9bpI5nScaPJ59?=
 =?us-ascii?Q?TazaquE+bRw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rSYQcP/GCldhqOxAhHA8uPZOcD0geSc2ShwHytULsuH2YcQudd7QT5JjChJU?=
 =?us-ascii?Q?z+mFWHaNUd4IcMRzbk1ZluNae3TV3bwxFc/yRjmLwYRiGEZB64LXtBj4axg3?=
 =?us-ascii?Q?eaIAMl2XtLzG7TXuFkvzkk+1BspYfJ4ae19N8/w0/w7fCvmKCqW7zsb69PY4?=
 =?us-ascii?Q?FZP86jwmyoZinOpljPX3ViDmykIo5oJRT4x7dIkwGgDpF+QUNioLB5bZUPOI?=
 =?us-ascii?Q?XRJcaoIIHF/NnT8ifHnh92saFOTGglxarD/FlmDcveElYw+q9n+3w5B6Q1Y2?=
 =?us-ascii?Q?DJb/qISPCe1d8Gda3lgAj5yYcd98qnKzhtNqkrz4k84LTalUjhTxxajocQcD?=
 =?us-ascii?Q?b/DQW1uvLg8BVTL3K6sg/yPWjXRxWnwCH1xo9IKInTCatJO4NTBxEMg0Tkbn?=
 =?us-ascii?Q?XzlR8IwoXKXSpKkztpvX8d2HCMBUQu7axHGaSkcjnyCnE84neT0vkJOsH3G+?=
 =?us-ascii?Q?1GE+zNmBBaETO0QBB0WH119oXXC25QPKvjHnTJuFMQiD7ATIM3X61RMREvmJ?=
 =?us-ascii?Q?6MEPAwpeA7hW0/J/mZEabYke2jbwpe1wP3j89uxRKTiwryvBZPlrUdK5Sz8N?=
 =?us-ascii?Q?z4eq5msi1SFzZ+NbHCw2Fj/USF/xl8iFWvtMFjDpysidHxTfLWsPmNlCp+0H?=
 =?us-ascii?Q?Nhkm/XVdlwafmV76glMn4cP8Zkl0RmWxoRRem+UyldpzR0mTBHS/Ct/P204S?=
 =?us-ascii?Q?EjeYBuc8OcI5Sz5Q4StkoToBhnWrWst8r2JVywid9xqishje6cAL/Y3z5B9r?=
 =?us-ascii?Q?He0H0oKARHgYvhgghZaJbaDPvrujFOC1mJJV85DZnZAAHjAszRiuV5YTs2Vf?=
 =?us-ascii?Q?E7BxVISf+CUQSXbgfSZddtwfVkUiAoMNAzEWIyC8YYIGKFMpwaLWhTwGGg/k?=
 =?us-ascii?Q?7OkccyDjYUsIvYjTyFYhYgo7duF3LXW5wWK3DRSn62Bpwxjrx2yenvOoyqY0?=
 =?us-ascii?Q?gCDoedTHT2aqpK3i45WN+hDkE3GL+C7KLOSFk795+pBG4IhwfR/f48O+TObD?=
 =?us-ascii?Q?IFCDqgO9Z0LzdrUhfGUjgH6ISDcm7hPyy+dPLWEUSAao0y2L6FBw3PdbgTIu?=
 =?us-ascii?Q?UqF2GKR3xyTxriPqno1qs4VFM9g5v0O/CLEAzkgLY/wFJUcd5HALKbH2VnzX?=
 =?us-ascii?Q?1GAUAOF2B4GXt414mROYoL6lFAjFKDRlW1ov2m/tS74caaeQaCU4ZJgEWKfe?=
 =?us-ascii?Q?unpYrUvm+7uuRwlD/NIEg+NxAF69NnxVEU9V1JQfsHIlTRO9J7mXRU3Qk+EY?=
 =?us-ascii?Q?Hf4iJDHkq2b0bzQIK10aZKmy4xx8z08QVDOURqb2eesvtY9S5vk459XdzJoC?=
 =?us-ascii?Q?G9/n7rsYbgdNYllA1hVszRRoJAN5gm699RfYsmqEZSzM18bF2mrtjXStZpGc?=
 =?us-ascii?Q?q1pW1Sizgg/hBhYiXVpjR7HbYbu6nAL5FJplRlWxpDfEidJGcFg4pOlzrSfe?=
 =?us-ascii?Q?7Jy7WOdrbMcDZp5eVb966fQMspJZ401F4omTqH79XziHwOhZg6YnsejScwHj?=
 =?us-ascii?Q?ttZh8IgGRB5SMYJMGK+/Sf9wk6HanxP4i8pI1bYx1eZHtm3AJ3tEcTsf3IBw?=
 =?us-ascii?Q?K+7nZEEkyZpcrMHLmZE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34380f69-bd50-467b-6e77-08dd8bc1af42
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 10:43:34.1220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hHAqdTtOoWQFQWmL3+inqCwnaAUu7447b5wdLRdq2fpzRiQC0ZYPT1Dt4+k9jfk0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10885
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 10:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216005

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Mikko Rapeli via lists.openembedded.org
> Sent: den 5 maj 2025 09:41
> To: openembedded-core@lists.openembedded.org
> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> Subject: [OE-core] [PATCH v2] bitbake.conf: ignore ${HOME}/. files in pse=
udo
>=20
> vim and less always write to these files in users home directory.
> Using vim and less via pseudo in "bitbake -c devshell recipe" and
> outside of pseudo triggers pseudo aborts which makes interactive
> use of devshell difficult. Fixes vim and less crashes and related
> pseudo log entries:
>=20
> inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in =
request.
> inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in =
request.
>=20
> Ignoring all files with ${HOME}/. in path since many tools
> with e.g. GNU readline support will write files there.
> Hopefully no-one compiles in such paths.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> v2: ignore all files from ${HOME}/. instead of just ${HOME}/.vim and ${HO=
ME}/.less
>=20
> v1: https://lists.openembedded.org/g/openembedded-core/message/215986
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b1dae17267..8d71c8f50c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -748,6 +748,7 @@ PSEUDO_IGNORE_PATHS =3D
> "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysro
>  PSEUDO_IGNORE_PATHS .=3D ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats=
,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
>  PSEUDO_IGNORE_PATHS .=3D ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-pa=
ckage_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
>  PSEUDO_IGNORE_PATHS .=3D ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/c=
ache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"

Please add a comment here because it would be all too easy to mistake=20
that for something that can be simplified to just "${HOME}" (by expecting=20
normal path rules). E.g.:

# Ignore all files and directories starting with a . in the ${HOME} directo=
ry

> +PSEUDO_IGNORE_PATHS .=3D ",${HOME}/."
>=20
>  export PSEUDO_DISABLED =3D "1"
>  #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> --
> 2.43.0

//Peter


