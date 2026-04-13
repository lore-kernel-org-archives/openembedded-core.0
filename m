Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3A4F45A1C
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:42:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.269671.1776080559954704855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SOIrXMVK;
 spf=pass (domain: siemens.com, ip: 40.107.159.30, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQNAxqFsHkfCCs07Ly+c3YVZUY/n8qWD9ZB+ICSKtPkTc2/8otDgwjQHNw+TvwI9w9fqPa15R2CO3DBxd5zbwBPort/XlFugNQmxvNTnJn7un3EB2H8BYKxdSNgGRDVaYQn0hp9BtjTHOX86aeKWI2Tbm6SRLO66MoScbmlWZ4cJt49IskpwzFew4rZ7NtUry53gUttxQYMV1b/C+7xhrlJWotbLz+92Pxo97Z/dEh3HPHfZseNwrMhhjYGl7w1qQQZNk+Ipcx5wQtNUC4U4rQn2EbR1WcO7pShLNmZ8Vkh9HxDr6W+zv/7PHnN++NKmK7pRnpjZm/NR95mZDvgrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBWrUmmPo+lgrFgnlB0i8u5QTGyPbVP6vPU2OA1/Emo=;
 b=blQ6GHXv8xwqUxFDq6i3hlUrUolhjlSD/usIpJO4xv5P6Z6hrSRvW225u+XAKKqh7iHRaHe0L6g/0PK+Uf6/vtlrxpe/wkm9R0AT36jmhOK+PSS64EpW+es2haglU8hIm8H/7C0voLbfUziji80UYAIxmdLtbJrd0NNO7R08LYtQqEnPPbBRK6cpxlGX3WikgnlKSFUJECUilTkI9PPr+D48DoO59V6DslL/RFhGgwElivv0J7gODGWva3u8xDPIgxv6urVz1EM1F3L2zJEibBM7JBwANO2+gnRh/ZzaxWVaRM1k70IlE25AIfjc6k2WoEOD8nypZbZET3gvckN4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBWrUmmPo+lgrFgnlB0i8u5QTGyPbVP6vPU2OA1/Emo=;
 b=SOIrXMVKiTEalss75eUPKJ0v1K5oY4g76Pyb82yF6T1GmdAacv487dHuWnbpsQT+IBRzFkJx5Iw31jrRGNmEdjeHsyUpSCdd/t3yfhnsNNcEV8hIf82gnhZhOT7FGzctgKUV/TqDxqRQTxNppxFn9syFoT9ouwdub0HreGvXifdphwhQR3zuOdrOoRuHJDTAOAmkB5d0wA3mzEOnaHxdB+P2Qmwr9XSQM6/M2J6FFTQfn1QceR7qffMtU8SzsbrWWs2M17yEMoFPm2jFaF1WPV90nxhQwdZosyMz9QkDNBHu2kNigXtKxqiAKsf2et/MYWQJk/3Qgqa1NvMlUruczQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7305.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:42:34 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 11:42:34 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, OE-Core ML
	<openembedded-core@lists.openembedded.org>, Yocto Security ML
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07
 2026
Thread-Topic: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07
 2026
Thread-Index: AQHcyznwHD8mOIjWRkKjC+COc6vVQrXc3Z/g
Date: Mon, 13 Apr 2026 11:42:33 +0000
Message-ID: 
 <AS1PR10MB56971C974B642A7B02678B29FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260413113708.69695-2-yoann.congal@smile.fr>
In-Reply-To: <20260413113708.69695-2-yoann.congal@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4d8056b5-acb0-4777-b9e8-bdb07d219ebc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-13T11:38:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7305:EE_
x-ms-office365-filtering-correlation-id: a0d1875a-c6fe-497a-35a9-08de9951c0d4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|55112099003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 xEUWvhwLYBY2NK0Z7Eg0j1p6po+z56QYDjOsv5lxUlyFyrGW2d4BSd9iIPShjnx9bXONlsxFn9U9UtLVZApGy2OTlHkibRsiappAS2hEHD443xEABXZYh9CODkl2wCrWzun4B3G8Q6nzGHvFsrvGjs9njrGbxeEP6hwGdPIRmQoDmHtXPANFJfNiYMUS66u7kcxEmd/Bcfz+wnRQoP4lWYfgXaMJ8ChVXbVELaIXp2mhj12pwnh4v/XfWsNeUecTeXJY9aVS+b8aq7z4NTbCztSo6yWn9UnkWUnkvD5q1jMK1T0+R4BhpDW2SS4gXFmsI/5u2XpGYcAuf2Ss1c04owlsdfu144RQ46039LRAclA4CplVhI0clNNp/cNIRQJ1O2hUy999ih6VpfWt+oYYdqtThPJelhzBeotmi90jVcKxcY9JZQcZoMk18YeQ1jFPN9AWSwfX5KboQnH8jgsftVf7TmUxx98jE+ZmPU889DYJmQNldOdDjGBbHy4qyBmuAg5ENfxcVVLwP/iK+bK3H5e06nEjpkA4IwCglbplR4nO87LmAjjmI/OJeRY45uONJMPZIzvrDRYqUXEHBYNQCvwrs0nI07H5d1yP8Y+vaCp+4ftUzkqTTCsw/ScDmiR9j7O9NnRE2ZtR3oAHaiShAiNAaygJiaVNbI7AEWaFnncLc7nyR+VniJyeDvJYb0M8dvqSkwIB6jI6k3+ZI00UZ4sS/8XxrUqmsjYvy7H4KxZ23w35iey/cuC3qJt5C1cK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(55112099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PWsPrX7YRWaFC9VDPD9ttuaa1FOx8j1rrZ8V+aYaTk9fPdCabGKeWV6G37OV?=
 =?us-ascii?Q?DoGc9UFrGqYIQNUTAXzopNW/g58mTUFqIfg6ysfyIXhrhRtIj6EAmqaYGeLl?=
 =?us-ascii?Q?iHiqAO2cKaSmJSywjjaU8tpUHysNaXUlpQYMKOjm01QxYsp1KqNnt3d0dZWT?=
 =?us-ascii?Q?SdjYLUsFMg8ORwBnSP1XWqLPdIxXqaCeG/HpRuNF33z79yFsjBVpJMJ2L+Uv?=
 =?us-ascii?Q?RXneEi/Bw+eOZHYI23akeeAV3Du31XniaCQsuHB7gMLhSjiuxEZ5IcBB5HYi?=
 =?us-ascii?Q?F6IJgq+X8nMtMKJjHPiwU8le3onbpYQoYfrVdEnD+oW67hRnKuu87MNMqNYk?=
 =?us-ascii?Q?Cmn3YSetSsKTQWz1mZeYFmYL1qck5m9j+0o2/vF2+n7EDszK95P2enNMKjAS?=
 =?us-ascii?Q?usu/ndb0P9s8HeAdcOJ6tCqIzX5ZBsu3l+uHxLPd7hd5MsTDmqNVEClFHkZS?=
 =?us-ascii?Q?IxN4up/6PDthqd8BYN0u4BjLRRHBbJ2f5E0cbgRDv5qDKiVVfjKH2xB/5rG8?=
 =?us-ascii?Q?EFEpUm3eLtTXR5g6j389nLXDjc6cmMJ7GwlknunhhXTrOL9wMX65ymsomLEx?=
 =?us-ascii?Q?zvN9da1gRpnhCqSx4jmgVN/Gv2kzF9HAm41tWWnrINkBRsO5qBkpKEOpsz5d?=
 =?us-ascii?Q?nywCgQiARYwLlk53mghiEwt7KrHGCCm6+W2t3wWYxnnKlZIxdgUTctJpayfd?=
 =?us-ascii?Q?YlTxi+LnQ6NyK5mESc2Y0fZ1DpToXzfKFiprnu7vlRyPzi4enloooEypv3iq?=
 =?us-ascii?Q?VDLF+7xglkDeNt0uRS21d8wYJJwBSixeBLJhb81xw99d0SN/IQzt98nTNSDb?=
 =?us-ascii?Q?C0bTOw5hMA+QZlritLAK6YZt9TTeVqd1Zz2ryy0ABDrn+txIxb4b50bojKxl?=
 =?us-ascii?Q?DE8EANMwc0wPkJAXqxpk7LswUWWxrp8mnac4Bzb2VyC3ktBbNbMTcl+RaZGD?=
 =?us-ascii?Q?w5QLaZR+lIQuETQcs9VsZbck/u/yxblcYt+88RJT+4yvEZuxtbxWM/NFdgZ6?=
 =?us-ascii?Q?5JrMqM7OrIZ9FT2shGDwAYU1fvsSVBwIs1zyXXA78xohMTHyYfskA9iyIBHx?=
 =?us-ascii?Q?xWCwfLfdHbohuKNWTJ9nbc2u14mjApkBF7mAbCUZ1Y6aOfivbD3Imvgl9Oxa?=
 =?us-ascii?Q?Ur/VbxRBI0WuyU8RS3lrE8C4ZtkssdfF366xl+7Y24hrT1fvBMcACQQEiHLt?=
 =?us-ascii?Q?8JSHQUEpEWhA1KcBJ6VBsq0SZvAs02Jl940Gkuwj1nwGlcpQZY1EvSSGoxXH?=
 =?us-ascii?Q?p8R08jxNGuBN+q5R8dzrSy7v3L99YyHPhSa9w5GIpXn08IL8CE3JHGOjgAS3?=
 =?us-ascii?Q?GrjCXKF1ixf7Brye1kW0NRW5R8lUld3T4gpRj5QiKDeDwOVhORorIEKQ7UqR?=
 =?us-ascii?Q?kFBDuLcUo1346bkPp0L42cDYgx5EG7G+L+T+FPklqwDRIMj+LuBSc++07c7v?=
 =?us-ascii?Q?X2faRz6vp4mTvSvDQ3jv/8mgkohDpzY3x+6tUXuGgH8iHc7pGcoxc5t+lmbO?=
 =?us-ascii?Q?tQ7//I4eZ+Uk7KnLbGpYl5laQ4oGpBw9kcIRZqaCizQAsPWaFsh3E84D1O+8?=
 =?us-ascii?Q?Tm1/v9LmG0L3LAGefVvv0AeDyvWSqleZnW6wnhn0IztITXvM7n2v0fSZ9Vk6?=
 =?us-ascii?Q?0mXXTG8GfUu8CLDoi3OAZpN7IXkMAlKZlirbHwYBeb2bNI25+ZL30vfk9FzP?=
 =?us-ascii?Q?YvBO9FcClWCVj2B3/Ckp1BS95JQLcdgjAqRjwe42EFLKtWo6F8hIPC5eKbnP?=
 =?us-ascii?Q?rV4Gfa1xsg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d1875a-c6fe-497a-35a9-08de9951c0d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 11:42:33.9393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3Nw8sKAj7V4/TbRdafTM2CKJr17/VAv6i/A5yu2BYH3wSsjsFweJzBd6aIoQ+1jYLkLFKT197xSkAUSu6xYNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235105

This is a report with old cve-check, so old master branch hash.
The new sbom-cve-check more than triples reported CVEs.
Especially kernel jumps from 12 to 110 open CVEs.

I'm slowly digging trough the new false positives and will send first batch=
 today...

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yoann Congal via
> lists.openembedded.org
> Sent: Monday, April 13, 2026 1:37 PM
> To: OE-Core ML <openembedded-core@lists.openembedded.org>; Yocto Security
> ML <yocto-security@lists.yoctoproject.org>
> Subject: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07 =
2026
>=20
> Branch: master
>=20
> New this week: 4 CVEs
> CVE-2008-6713 (CVSS3: N/A): wic:wic-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008-6713 *
> CVE-2026-35093 (CVSS3: N/A): libinput
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35093 *
> CVE-2026-35094 (CVSS3: N/A): libinput
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35094 *
> CVE-2026-4046 (CVSS3: N/A): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4046 *
>=20
> Removed this week: 13 CVEs
> CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nati=
ve:binutils-
> testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-696=
50 *
> CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nati=
ve:binutils-
> testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-696=
51 *
> CVE-2026-2920 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2920 *
> CVE-2026-2921 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2921 *
> CVE-2026-2922 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2922 *
> CVE-2026-2923 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2923 *
> CVE-2026-3081 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3081 *
> CVE-2026-3082 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3082 *
> CVE-2026-3083 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3083 *
> CVE-2026-3084 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3084 *
> CVE-2026-3085 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3085 *
> CVE-2026-3086 (CVSS3: N/A): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3086 *
> CVE-2026-33412 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33412 *
>=20
> Full list:  Found 44 unpatched CVEs
> CVE-2008-6713 (CVSS3: N/A): wic:wic-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008-6713 *
> CVE-2019-14899 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-4543 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-3397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-6238 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2024-50613 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50613 *
> CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6519 *
> CVE-2025-12801 (CVSS3: N/A): nfs-utils
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-12801 *
> CVE-2025-52194 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-52194 *
> CVE-2025-59529 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-59529 *
> CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61662 *
> CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nati=
ve:binutils-
> testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-696=
49 *
> CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nati=
ve:binutils-
> testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-696=
52 *
> CVE-2025-69693 (CVSS3: N/A): ffmpeg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69693 *
> CVE-2025-71074 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71074 *
> CVE-2026-1467 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1467 *
> CVE-2026-1536 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1536 *
> CVE-2026-1539 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1539 *
> CVE-2026-1801 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1801 *
> CVE-2026-2443 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2443 *
> CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
> CVE-2026-3099 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3099 *
> CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33416 *
> CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33636 *
> CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-
> testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-344=
1 *
> CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-
> testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-344=
2 *
> CVE-2026-34714 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34714 *
> CVE-2026-35093 (CVSS3: N/A): libinput
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35093 *
> CVE-2026-35094 (CVSS3: N/A): libinput
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35094 *
> CVE-2026-35414 (CVSS3: N/A): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35414 *
> CVE-2026-3632 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3632 *
> CVE-2026-3633 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3633 *
> CVE-2026-3634 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3634 *
> CVE-2026-4046 (CVSS3: N/A): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4046 *
> CVE-2026-4271 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4271 *
> CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-
> testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-464=
7 *
> CVE-2026-5119 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-5119 *
>=20
> Summary of CVE counts by recipe:
>   linux-yocto: 12
>   libsoup: 11
>   binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 5
>   libinput: 2
>   libpng:libpng-native: 2
>   libsndfile1: 2
>   avahi: 1
>   ffmpeg: 1
>   glibc: 1
>   grub:grub-efi:grub-native: 1
>   nfs-utils: 1
>   openssh: 1
>   python3-requests:python3-requests-native: 1
>   qemu:qemu-native:qemu-system-native: 1
>   vim: 1
>   wic:wic-native: 1
>=20
> For further information see: https://valkyrie.yocto.io/pub/non-release/pa=
tchmetrics/

