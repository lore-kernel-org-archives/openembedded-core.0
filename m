Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0092C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 07:25:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.37])
 by mx.groups.io with SMTP id smtpd.web10.96247.1747207550304061365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 00:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=I4CEQQGv;
 spf=pass (domain: siemens.com, ip: 52.101.67.37, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIW4s3raLHUtEYgk7KzFVj69yCi62wDU4l54FpYLVGgIkqIEphwHCNbYXFM/QriO2E9zrUtgcSMO5UBDZww2DwGVZ+W/2b56LREg4FtmblnqzbeWAMe1cmd78FBhW/hk2FW42nv2mm/Nv7SqL4NKALbHFvXViNXQiwgQ27Awmems0UPn9J4ZkJOBuDOmRlZucZICFeBf+u+Bal58Pw8aHddzUBZs7E0rs7uDQMtGEsWGNZj7p1fYoyTn65aoEv7y9Y1M/yzpTIH4P2EnNlkGUTHMs6mzyj+1OsXKyBfM1BBgSM9ue7ORiMphxitAX7qID6sgYW8dvnHB5tGaosOtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okxcU/5vPl9p1715y7PHqaOpV6wvlD5Mc35c5nVE4Pw=;
 b=rEP0Eh3oymYlccphzrtmVoUDDf9iPKyKwU22ij1LAas3PfoBlo+BgT2ka4LioT1uQfwchvDnZDlPasvjeeSRPyOZx1eNx/NVIpuNf2HTyMj6VF9MHtyWiE9s84EAZ298qyoAuffbHeGhNjyTNwHByb7UZYFAkrzNiDL6PAkMtcB+LT+tL6UzbD1UdpEWKRQ22YNrEKjjmstTsSBttcKzbKInyNWSE0Zmmz762phhU75h7oTQX7PmrdG5lre9YZm+nYUimUZYhadr1si0Sxm+LIf873vBo03rdY+8iCR/Oz3tPA82nrtZo4gtz69ELVvBzLXe79sqf2YjuhaveVQN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okxcU/5vPl9p1715y7PHqaOpV6wvlD5Mc35c5nVE4Pw=;
 b=I4CEQQGv3N7diRG5ED+Wml6hoPQkNJNojXwKXcFIyNanssU+7ZFYayg9tz6toKTBXN971pdOkA9LKWh2B2h/LOozj2yoOm+eSn/MEymspAI/m1xz0DCbcGF0TBaRwOn/uxdR2Op1GykvLJlwlw9hpTz6qnZvltx/JhvTv7BJBT2olI9OahqvZOla6SWubdPMHFJ7bOvvIsJ0VkmP9LXNtyoyLyUEngvWP2q5mnA/zGXVsgFTeeLRx/4EkbCXcDRZepMbqfo8A4qmNOjAztLlQRAvu7ZPsFIFl4TdYVSmAYIrbssUhFg2MRK7E30qQtUtzi/gOgCgQumpGQTdsBxHmA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6290.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 07:25:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:25:40 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for single-binary
Thread-Topic: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for
 single-binary
Thread-Index: AQHbxKA/noCoQ8sPNkaeuP2kvlKnX7PRuP6A
Date: Wed, 14 May 2025 07:25:39 +0000
Message-ID: 
 <AS1PR10MB5697052E3C295B1843480375FD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1747206852.git.liezhi.yang@windriver.com>
 <7d13d6ecafaaf0f06955156bcd9e19b61a92ea80.1747206852.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <7d13d6ecafaaf0f06955156bcd9e19b61a92ea80.1747206852.git.liezhi.yang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=73200168-6eb2-4b6a-bb41-47d238b2241c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-14T07:23:43Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6290:EE_
x-ms-office365-filtering-correlation-id: 9ae0989b-112c-4761-0ec7-08dd92b8876d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Qdmsy9PV03f/C4p70H/4+s+ZhQJyii+STYMt+EzL4Lxm2gNleMvNNV9qOgBc?=
 =?us-ascii?Q?55H4suasvEDQjPc8mXPUsdkkN/oE/X2dJRE0P7T+mg00t4rJXe5OCyjiw4pd?=
 =?us-ascii?Q?PvaHzXzOX1q6IPXLqZ7KB+5FhRQxBCzpoqy+oOpw9OrRIzLfeLTxs7XsGh2w?=
 =?us-ascii?Q?A9YBiqG8D6WJSCxD1Rhu+rihL/NwynPNkn7cmqbpi7GZ+BjsWqxGkb7lhT4c?=
 =?us-ascii?Q?VEYA572f10qeu71p7tknVHg8nv2aSzARnZBHkCp1cyAnqBtnpIFVmURZgnIR?=
 =?us-ascii?Q?0goSlVH6DX0POqMm6eRfxOkYDrjiLJylBQjN7vFwrcnBMm+agnOYODU8iMk2?=
 =?us-ascii?Q?CI+zfxJlXy0LPOxgQDcNjO1yvR0qjNzTWdnU2aGB3vmQl3u1fjnzIkuIa9RB?=
 =?us-ascii?Q?+Rx+1VyosZkn/NY8Mvx/zDQn8iRtllUWyt/ggzOQKN4NJPsuxlL4LyVHfXm5?=
 =?us-ascii?Q?E5TocJonM7+bjmfX44L9T4EqcpwVyB/AMQefZiAiAxgEbmoX00fo7/Jh5uAM?=
 =?us-ascii?Q?NcIceuGfnuiPgfB42A29FaUEndZP8AMa2n5qUH6J7/9b+17WBjQtllxbVLih?=
 =?us-ascii?Q?icvj/rFZMSf7lv6MNzs+BIsrPyvWdkkFmmRYdXSFvpT0rpvt/OlmbUKa9cnt?=
 =?us-ascii?Q?R2t65qXrGEoj5dPIIduXFvq4Q2vhrGvqrCVyJqhxkLKWsHdTc5ez8Br64XsD?=
 =?us-ascii?Q?YsHwdDBrptV0QKie1vGzMbmt2PC+POCBeibyLvY8neiau+l2OAj1aOlu/dGU?=
 =?us-ascii?Q?dksobLqEPy9cevHvMy0KZ7U6J0SwQA+rUyRpkWSpJ3rR3Vx5/ywI2VDSx7Ph?=
 =?us-ascii?Q?7yMa41fbXNtKf6pHjZHVHQzSN40xDznUTHyufvNCEGeQ71bd/ZiVWkET/LJa?=
 =?us-ascii?Q?yGm2CjDd0XQ6RUF6q6b9sPx39AkoSi0FixZr3NvVCx7ZP//dRMTRLQ9NKRm0?=
 =?us-ascii?Q?Vg4hCqSg7a6PLAauqQyu2gQDR4bmDq/9aVF3V5hvrjCFk3Tw6K4XBxXET3I+?=
 =?us-ascii?Q?ATzWuovlS6au/ughqMSvz5pWpt3AK1N6byiIuFynzzZlSOWy9FWSXJd5LPkD?=
 =?us-ascii?Q?Iunqqfz58ffJqJSWZbw8sgvedl+kxR1UeBux4Cw9+A2UEGwwcCjrXhsnyVhJ?=
 =?us-ascii?Q?kRLte3u+LwZCcOgz2gYkXU3UiAZeUhMCGRunluFjbEFnAE+WVz07FXyvlFfa?=
 =?us-ascii?Q?ESVdLqP3DxWMKIV2fqtdI+Romp/KZReiGOZ4mgduYkHbXfET7yNQ9kVqpAqP?=
 =?us-ascii?Q?jFZ2KACjzb/OgRRu2PbMPLxqD0D4Yp56Kt2dyKxrUpN8RGb7cE0oxd0n7vWj?=
 =?us-ascii?Q?XahVSv1xS46lGKzI9ldLlPM6/4fxWCa3L1W3DE9HRtx7QNqj76atXv2X+itx?=
 =?us-ascii?Q?GDRahl4abg8jrU3sv5BaVrNC+wN2qH6hJS1emhICrZTfOrUNOfYSXZrPCkPe?=
 =?us-ascii?Q?nVnZoeqOuIgIraTVVcMW0PW5J5ZvxbSiqc3CLj7fZdweSGoZ+czTJw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2wbSdoEj4fsDI3XjdiRImzfed9zQ02aaDG9z2IU6jzOl6J8Fhm0OTc5ayNZK?=
 =?us-ascii?Q?77EBLXU/mqZ8PJ7VakaStY0oRMdkCs+jI9cag05qAnJo3v044KMZFIRNqJo/?=
 =?us-ascii?Q?va2LFw+E9+yLQzlJp5/OfN4bdC+qt4WCAtSkDDHChodv6djGQgi8vU1RHRjs?=
 =?us-ascii?Q?6UFK/bNGZ9y+F4tKYuNb6R/UPi1kUYmcCWaoXSydoZstPIhYJF1sIn906dPA?=
 =?us-ascii?Q?mmXvsQok4wp8mDIawGRUderP+DYXKd0b4metm6PmP7fRI8MlVn11i7hm3Ldh?=
 =?us-ascii?Q?+VbaCLij6+pXWAVZJBR8vVXln6WUoFr3bD4o/IkJtEnvEy1jLBSHGRKQ5KqD?=
 =?us-ascii?Q?yQL24rvjF5o4IMjwHAwzEzn1ITBaMMjrGNGBIpV3JDUoktc5yr5UcFhbcqUb?=
 =?us-ascii?Q?9TTMEcXOWlyCgeCIhdYb6dMUg3FvP77LoHvxqfFm2kPzciAgbi0YTUsbIKMC?=
 =?us-ascii?Q?TestlqzPvv2cLpmCEE8AUrtSsJererdvSB5UAmgMdUKTddy8r5qAlgwU/V5+?=
 =?us-ascii?Q?VHJsdYJQUXx/4JJ+tX1i2flzCTZKadAPf82MaUKIApv09j1AP5EBemQT74sI?=
 =?us-ascii?Q?mMRdX5ZmZSe3xbzsfLsUZ4Brbvavj6S8v9/ynA3l6qEqxcxk63O5WHVwCn5C?=
 =?us-ascii?Q?OSO/98Qhh27HVcGnJ/WqgYtSMF7axbpx+AjX86Z+H5AqgPQLDj7+BrXPr9Le?=
 =?us-ascii?Q?TC433QB4p9xFy26VOtNs9l8QTtXktLDTUQa54FWNWX63fMwclPmnCmZ2CJtz?=
 =?us-ascii?Q?kMwFoI3DtVG2IArg4eq3hB8MfsooNT84fknTyXNKvDrczLZgD8ZP/rvT677q?=
 =?us-ascii?Q?OlwDEs5RyzBBBRCM4kqIKjq7kYXWPMaTBud0oUEk04lzdZB/Ab46p8tqnnD9?=
 =?us-ascii?Q?ATpd1GNqydJhXSolMF7FZYZ2lqDqyhoQHAzUM0Yej+GE8QQ9TE9m1Bgy1rzI?=
 =?us-ascii?Q?gyckP7ZdwuE3g1v9H4jRC978eecTS74aVvJrtag1JFgeFCAZncUuWuJOxQoZ?=
 =?us-ascii?Q?WxaVlE10Ul3RFwV9dq3K8LvKi5eZUC3BVDdvfOt3IQsMp33H+lDsre29BTip?=
 =?us-ascii?Q?dv4adgNDEfAl6UV6qlnUV0BoSP9rVGTgstQ9x08kBvF1uvapFaRBX0sU+65T?=
 =?us-ascii?Q?t7ivNaN4BVa3RhhZdfnpuWT7jdI3MeowJl7kzLBeuB/RddL5JOqpN2m1Wwxz?=
 =?us-ascii?Q?JDbw2YbBNgpPgu38vdBr65eaI8TdZ3hTEalsgTk0L6dA9XZWcWSHLdHERHid?=
 =?us-ascii?Q?rv2bubK0nEWSRTxoWeMt5lnttY5C5tSGj7Wme7mtfrRovRgpV+yKMwKgsakK?=
 =?us-ascii?Q?VjL3hH2UeucmTRrivS1mFkOkRANDaL9RR2Y3TXKSFRzPSzInFWTEG8XhjWhG?=
 =?us-ascii?Q?tTuujsDFU3N37pIHGuBTDrlXR4NrD/jadRjyptUN1OPHgJbowYX32oO+ccnJ?=
 =?us-ascii?Q?rCXwtwDEiiFdeAJ0fUXPHXw0qSpaJOCutQfMlHudO4tusPWPjZBdZ/uTZmRt?=
 =?us-ascii?Q?FHzJufN+e9xKLXap5x9y+6q2bfxJ+vVBSy4c9XjNgRCW4A/gEHTYvslClW+w?=
 =?us-ascii?Q?bABVmQMV2wanPBuL/cjMQs3UVCvBe6cT2Z+m5Kkv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae0989b-112c-4761-0ec7-08dd92b8876d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 07:25:39.9715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mfg8ijwkJe2QcCew+F7Luc6WryGdFYpZyn/g3zXIsYC6kgAp+2Pit0J/E8tXGD9zyvUDf1IfIWefgNyI+WA+AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216482



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert Yang via
> lists.openembedded.org
> Sent: Wednesday, May 14, 2025 9:17
> To: openembedded-core@lists.openembedded.org
> Cc: liezhi.yang@windriver.com
> Subject: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for single-binar=
y
>=20
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> Fixed:
> DISTRO_FEATURES:append =3D " ptest"
> PACKAGECONFIG:append:pn-coreutils =3D " single-binary"
>=20
> $ bitbake coreutils
> ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: /usr/lib/coreutils/ptest=
/src/yes
> contained in package coreutils-ptest requires /path/to//tmp/work/core2-64=
-poky-
> linux/coreutils/9.6/build/src/coreutils, but no providers found in
> RDEPENDS:coreutils-ptest? [file-rdeps]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/coreutils/coreutils_9.6.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-
> core/coreutils/coreutils_9.6.bb
> index 6e1867f3e4..c9fd3719d5 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.6.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
> @@ -211,7 +211,14 @@ do_install_ptest () {
>=20
>      # Tweak test d_type-check to use python3 instead of python
>      sed -i "1s@.*@#!/usr/bin/python3@" ${D}${PTEST_PATH}/tests/d_type-ch=
eck
> -
> +
> +    # Fix for single-binary
> +    for prog in ${D}${PTEST_PATH}/src/*; do
> +        if [ -f $prog ]; then
> +            sed -i "1s@#!.*/src/coreutils @#!/usr/bin/coreutils @" $prog

This should have ${bindir} instead of hardcoded /usr/bin

> +        fi
> +    done
> +
>      # handle multilib
>      sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>  }
> --
> 2.49.0


