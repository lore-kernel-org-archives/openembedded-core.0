Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FC2D78312
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 12:15:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web11.172575.1733141732195474459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 04:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iyDmHxbk;
 spf=pass (domain: siemens.com, ip: 40.107.22.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjJKBBymewJRjCHjfaIN1qvmAuM06/AklVhTYHOM65jPyiSiWlXg4OFyOoWJpNJc3mszapUR4gtJn52fxj0mjQitGXlCdvxINQf0QiUBakQrR0Om+4fCrPvjdSk8q/H0LGNj+sA3E5ScIXj65qivPm6UvVuMzC/I70S1V+qCVKg7cobsMpPEvkQQAekr00XwFgQsLljxPgXU4dSJdu0U45a94K30OKxvWF/b+lOeE2DF5IP6fAvK/CPzTG/SF/+TK58wVmO5XThjolxE0P9gQAuT/C86AJPVdEUWZ+bAJTceynT7qJn+qCMbrQ7xInK4qjMrEENrMT8f91IHSMaCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up54+NhvHF628YdYB/klyHmy1e5iU8OpNhXw1ZIH87o=;
 b=cGuSVQEmVr3iJCP1s/PxjueJiXMXz4mHnXib/rXXYM7FLevgiJqN00D03EWprRIsqrXKSbEzwxMZxDWfWHluKcyJ0h87LF7kF0jmah1lXNhbjGTfwmls+oWCTWuElSsr+cDje7xv6na4HZN+oJtshV3rizweQBwTvUuNtdg4GeFMT8T/gXlvbtroO0rPIuXsKbPHKrgZjiyZHJl43UyFp7/MW/i0h+y2KdGwXetCcBP0sfULKEqQ3hHeLnG3yImo7Q9ikeyirYK76GfrmCCb7MMIb4j38BcTmO2sxvyAuJJTpBAbv0F6Cb8qSdrZR3cnYtsbYZggP1gP3o+eNqD7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=up54+NhvHF628YdYB/klyHmy1e5iU8OpNhXw1ZIH87o=;
 b=iyDmHxbk2ZyHrH1BEM7mnfyolPjzn3SqWvcbTcnZmstYLd1lX/LxEwmVdQalfV9+Uc5eaojUJIvOal7uJ+7M8VGvCX2K2LDtSsykv4FOoQGtjd2850bH92RBYjmTefbSTnXrYY5vCS8OXoJpV5fIqtvx5olOUkDYWdNYtKh54P+yG9dOmWLVK7t7BNln33DpH304Ly+XgaCvsgyTLY+JOmquAMbBIFLFGwCqztRSwkj1jYCv7Rl68Ii8KGGTKQyVPsTk1aTS8MSUIhAu2b1thIJJeQWMIOvNGVmRR79A+MJsR6pqvCIEJQzq8JB+h4oMVJQlo6hRT4YFmAfwXcQczg==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by DU0PR10MB7357.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:447::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.8; Mon, 2 Dec
 2024 12:15:27 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%3]) with mapi id 15.20.8182.018; Mon, 2 Dec 2024
 12:15:27 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"colinmca242@gmail.com" <colinmca242@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cve-check: Add versioned CVSS vector strings
Thread-Topic: [OE-core] [PATCH] cve-check: Add versioned CVSS vector strings
Thread-Index: AQHbQ1BseB1xYkWNGkikKuW+AvGEFrLS1WkAgAAJI/A=
Date: Mon, 2 Dec 2024 12:15:27 +0000
Message-ID: 
 <PA4PR10MB57070ADE2916F49300B63B4BFD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20241130175038.870014-1-colinmca242@gmail.com>
 <Z02bDqe_cY6uqij-@bootlin-mathieu>
In-Reply-To: <Z02bDqe_cY6uqij-@bootlin-mathieu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=34f1eb5c-ee53-4103-a6ae-7d28eff9cd2a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-02T12:06:16Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|DU0PR10MB7357:EE_
x-ms-office365-filtering-correlation-id: 5a900ba0-09ba-4c62-1a8d-08dd12cb01f4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?biv/wlx2xewRNh09EKIw2iN8vew6Rcx+blL7MgbthBv4rDmN70rL0uNWh1LO?=
 =?us-ascii?Q?xxDkjIy55kzyXEd+e099nYRu4Vq9tHMelrk3gZJZtGYUiC+RcqN4p5aPbzaN?=
 =?us-ascii?Q?4vEDq14ZXTKCALgtJKcRGWC7dA+D31X0bP0Ekxif/rYMnw/UsNH0PPEhZn+s?=
 =?us-ascii?Q?gfl068mioHfeysjA64MGQUlaQZ1WxpooxRF2BWpC/PRiCQgFjAvTEA/E69zA?=
 =?us-ascii?Q?SlkETNNNriMUkOYo/pV8JNobuBXuinPcGJZ5jBVJrAWokayLJFUZJZRArk3R?=
 =?us-ascii?Q?z1n4GHQVbpfYgUv3Iow2gSK1yhWZgAtZgEg1LJJMECUmmMJ2xeuNdLm1H2Bd?=
 =?us-ascii?Q?xOiqoXdXf02EjS/L00nqJJgNHZdvv1KyNeRNgl7Y4c1/QR8HE2VPzAQrSQ5G?=
 =?us-ascii?Q?RZK9wNjyxxl9R363+1jejVuQP/DWXh7xyc0WD2xbEqazQNVQi+t26LRQEbWE?=
 =?us-ascii?Q?BAEpOBA1CvMskRv8s4yZlrjfaCTknJ+e49YhuQR4i05uurbQF2QdIHOh81MI?=
 =?us-ascii?Q?YzaibHlXcTE0NmUFrmksmw6eLVSPItAEnQkUDFI2Z3l2pmLZSVqCq68IPO8Y?=
 =?us-ascii?Q?ewif/lv4+eQ/0rBSmdgihYyLPznbHCqixRVQgrdYhMAwnmSzaZ7WTFysQvrz?=
 =?us-ascii?Q?R7+GlCXTcNvyCTjLKiGSIX9i5YxlMYkcUmwUpDTlODb+CaplhxPdv0ODmAsY?=
 =?us-ascii?Q?idxipp98lm7zP4gqhgFRAqp8Y58L3ZIkr+WddJcdqHQc6wXILFq7PAmPAfM+?=
 =?us-ascii?Q?FQdAVHixOdtO3ZOc7uXXPjqOcbQCIOrpuuWyQ7smk4GsSefkZtdxrlXJw7Br?=
 =?us-ascii?Q?XqYIZk6IYsW/idHnP+Ue1XA8vITElK6R7oh3TO4srUzL8QcTt3iFziiOBO+/?=
 =?us-ascii?Q?kaKhzjOzzu4m44f2x36W5KLjQwDoK/WVCWjlVOOOEG0cV8hjMFH96JLA3XCT?=
 =?us-ascii?Q?cmD9Xk9qa46VDTPnyl6/ofLDVHb1meGNh15rXAMzWJZhf5ozxgIsyMDsgAZc?=
 =?us-ascii?Q?BCZb2nJDzqw5QU5yYNmDTNoBjIt2vSRaB4aTwVYh542maN3jWN74V7AxU3rG?=
 =?us-ascii?Q?e0bJtVWqk1i88fpOH7MlNQ0pdYAp++tI8E5mndUANiofSp0aBoe/QbCTXByN?=
 =?us-ascii?Q?jp1cDi7kKJpLnqZzlvpYd9OXDRbdNcsj4eVjL7Kj0yCCPPqef0eAtqBtWV5k?=
 =?us-ascii?Q?cz/8HIH9mVKjKhKtAtb85jJGTyTJA9NHvvb2ZW8EPsaHSlDDbngieknbOd5P?=
 =?us-ascii?Q?7eST1hnin+XhLoMghpBJEzHCJRR0ohljeeb219B8T+Z4eilf211agmuLmiBx?=
 =?us-ascii?Q?nHRf5jhZtNnIjrOGwI/yCbxqRQSUqc9JbkXoPb1+8HyVKg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JMT+ndqP+1c3Vsz649yqNzDDFR9iIzmuj2r2oK9wPelY5kbu5TKTIt4HUFsb?=
 =?us-ascii?Q?eNYKpjMDpTrO60xMQJaiI33D3/qtjPf52y8ZJQ+vDHkMKyFYCJrkLS70s0cF?=
 =?us-ascii?Q?8sSLcp/pAK+IrTGJZdgfvY30jKV6x7ofncv4YzEoxnZsSX6T4oRoV1Vusb3x?=
 =?us-ascii?Q?ll//NXAdeB0DGE9WwxIVhnorHWJVohB5sRS8Ja075hH7CGZf10ITSgOacc8h?=
 =?us-ascii?Q?sRUoen/vcOoTh5f8oaptg5dGRnZ83iJvOk6L2E1h0pf9dK5MYIWXo904+Ob1?=
 =?us-ascii?Q?OQpPMdpd08Svgf2vOg8Ru/jNVIQDoHv56gUrfR/jFCNXpG+kRHMtsACBTJBx?=
 =?us-ascii?Q?N+DJ/xrxWXZPVfwSE6Jlh0AggMqH/kA8UK5faesmqXIX96DUW5+m4ZhKPJh3?=
 =?us-ascii?Q?EpEK8+GRVeMMAnd3UXpu8UAXeBPYqULksoNXisoGCBVTAS7U7vBxC4QiqKIB?=
 =?us-ascii?Q?0fyzi0GyYgGfqVygEMMxyG4B72Yt8Q3w1JrXocS1t0oDtMJoZPNthJIB3FUI?=
 =?us-ascii?Q?glOXIrZm6zaZ3ukWwNHpeHcnrpuMGzeMYU2/AnUW+R+qikiyikX6Rm3d2G8G?=
 =?us-ascii?Q?ac0B/rSRic6ITJvhQ0Qb8C6BP1Jnsl5e5Iiwh8MspU42Yh0hpn3mibxfMs6i?=
 =?us-ascii?Q?b/jZ6AyL56nGTuPtkuUMeKRi0Pasm9cg69KJkRS95cO6WLiTlojRgezy23Lq?=
 =?us-ascii?Q?Ub65Qp3AinbZlGv/z3LaBkxhYN7NWpxGnhu3wrExIVedBPsOdVrMY8w/nWOC?=
 =?us-ascii?Q?ZNTCA2x8ozTZNdl+JaXX++2CTH8tvJbZxaz8i+kcQG/Zl9YPu0wSBTc6+32N?=
 =?us-ascii?Q?KD92sdZVSK/zEXj6niAprsL8uGM2TCHKwopv/3UiEQXNxvXNQkxMqHS9Vu0a?=
 =?us-ascii?Q?Niw0Qh9UXKlEASiPr860sFklFCpGx0NKcYDgPjuJ9QAobIom4S/8nba+PdP/?=
 =?us-ascii?Q?lbS/qNq4FfuJuDC0FyEhQeyCZzG4pNschYtHJB6Tfm7m+1+c21tixpwVoIIZ?=
 =?us-ascii?Q?qNaN/jzo+1+/3+2v+AzxoiCjD/k5S0UlZKfbJX+dXPM4e8bHCL7dD5+znrJq?=
 =?us-ascii?Q?rrDD6KmyA6LtxNL2adG5vMPzn+c0gcH0Fl0LqLp+qg4QA2g2nMPlVgRuwXIs?=
 =?us-ascii?Q?bEtlTTpkX4GOmwB3hc566QAuGQO4zz3G/ZpIKcO/CzoorL3arzRfDbdfn6GF?=
 =?us-ascii?Q?aY5c8yN8aAnuGKOUlprp1hdG4hji9+g30kdbgiKnggsgCihtF24bWW+9NVaU?=
 =?us-ascii?Q?oAHAnob9Kj2T8YUKOXu6Lsbu+EXqJ9Lva2IHEx3SqPrIwPhmiW10DDkl04Q0?=
 =?us-ascii?Q?rTcCG0YmiqpMnOa8kUhPwse9dpMSc/XcYrjaaSQ8rPY5czBNc4I4GWZ0h5Q7?=
 =?us-ascii?Q?7OjsSWRB02orN6KAezkvrFdN81VLEnErw9tWaeBHHfdRUM4BGeWz639o93c5?=
 =?us-ascii?Q?7rnq/cvYqfPe/WsZiDQvxytBg7CPXJlPP0B2zhRzqk3PQBiEWNqwuef24AZs?=
 =?us-ascii?Q?rTIvK7j5j7zmy0UMlFFxQAcrZudywmjEBAzBRnfit5B7EacKu26600O1cPF6?=
 =?us-ascii?Q?I2W1mc331kadnFOaT2M/YBrlFF7ThZVrmXNXh3GU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a900ba0-09ba-4c62-1a8d-08dd12cb01f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 12:15:27.6398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBYC76jHMgwB+BfVEQsKs+oA6EMmqH72XOvYBq422E8ngZ9werK3rKYfbwB6IleQIS/eg4AJ/9VzauWBhhvmCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7357
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 12:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208141

This is due to current NVD DB stability issues.
WARNING: cve-update-nvd2-native-1.0-r0 do_fetch: CVE database update failed
This can happen only if API calls to NVD DB fail.

So either valkyrie infrastructure needs to increase the retry settings to 2=
0+
(via CVE_DB_UPDATE_ATTEMPTS, I did that "temporarily" two weeks ago on our =
infra),
or this change needs to wait until NVD DB infra is fixed (which can take a =
loooong time).
Of course the increase of timeout may mean the update job may take 3-4 hour=
s more...
But once it completes, the DB file will be cached and all should return to =
normal.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mathieu Dubois-Briand via
> lists.openembedded.org
> Sent: Monday, December 2, 2024 12:34
> To: colinmca242@gmail.com
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] cve-check: Add versioned CVSS vector strin=
gs
>=20
> On Sat, Nov 30, 2024 at 05:50:38PM +0000, Colin McAllister via
> lists.openembedded.org wrote:
> > Currently, cve-check includes a vector string for each CVE included in
> > the issue list for each package. This vector string is the lowest
> > CVSS version that's available. For example, if a CVE has both a v2 and
> > v3.1 vector strint, the v2 vector string is only included.
> >
> > This patch adds each supported vector string (v2, v3, and v4). For v3,
> > v3.1 is preferred over v3. If a vector string is not available for a
> > given verison, the string will default to "UNKNOWN".
> >
> > Signed-off-by: Colin McAllister <colinmca242@gmail.com>
>=20
> Hi Colin,
>=20
> Thanks for your new patch. As for last week, it seems to be triggering
> some issues on the autobuilder:
>=20
> ERROR: cve-update-nvd2-native-1.0-r0 do_unpack: Error executing a python
> function in exec_func_python() autogenerated:
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_unpack(d)
>      0003:
> File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-
> core/meta/cve-update-nvd2-native.bb', lineno: 105, function: do_unpack
>      0101:do_fetch[vardeps] =3D ""
>      0102:
>      0103:python do_unpack() {
>      0104:    import shutil
>  *** 0105:    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"),
> d.getVar("CVE_CHECK_DB_FILE"))
>      0106:}
>      0107:do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}
> ${CVE_CHECK_DB_FILE_LOCK}"
>      0108:
>      0109:def cleanup_db_download(db_file, db_tmp_file):
> File: '/usr/lib/python3.9/shutil.py', lineno: 264, function: copyfile
>      0260:
>      0261:    if not follow_symlinks and _islink(src):
>      0262:        os.symlink(os.readlink(src), dst)
>      0263:    else:
>  *** 0264:        with open(src, 'rb') as fsrc, open(dst, 'wb') as fdst:
>      0265:            # macOS
>      0266:            if _HAS_FCOPYFILE:
>      0267:                try:
>      0268:                    _fastcopy_fcopyfile(fsrc, fdst, posix._COPY=
FILE_DATA)
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/srv/autobuilder/valkyrie.yocto.io/current_sources/CVE_CHECK2/nvdcve_2-
> 3.db'
>=20
> https://valkyrie.yoctoproject.org/#/builders/76/builds/524/steps/15/logs/=
st
> dio
> https://valkyrie.yoctoproject.org/#/builders/35/builds/532/steps/14/logs/=
st
> dio
>=20
> Is this something you can fix ?
>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

