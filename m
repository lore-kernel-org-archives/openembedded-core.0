Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23184C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:37:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25171.1671644220591475317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XAi3JOFU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93546e471f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLDcWmo016883
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=zHYelv9ZeqbK7G0zL8cHa53oVsDZBe2Nuqnq2axfmTY=;
 b=XAi3JOFUWsbxJAgpjPcgjT1cS07TOvoCNHG0DLO3azk39UelJ2Y52DHS+N1Bq1l7R4x3
 OVuJUFNlra5hCCAflA9qZN87FbYBuJSa4zu7zkdVIbXnEHnokfrfrgp1IpMFwZjTUGcW
 k9HMC2L8NqkSDyfBkbco2lib9GaftI/xdm15U9BeLmBoBh0WNnPTAKPFXPkPxWO4nokZ
 BUkHFNUYxrFdDtLMkuLkRuWcInnh7xRyCMZps4BVGKzdBMSLgAiKhrF3mr/udq5nMpGi
 SnCJ8hFsYBGkqlwtGMeeRP1jZumC8+IUBV+/UOCSR4VhYb0FCNu2fqbXQkNnEeVs8B8Q pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9bb2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:36:59 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BLHVFOu021880
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:36:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9bb2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 17:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfArPQesUynSc/zhhx6ESzRYvqPysrgxq+Ig+hGKM2nMgM3p6plwAZMaB5E5TSmDAyaGb8FB50OBOsjTRXp2bImGK47wDgsuadygaa3R33uM5PZZjmZftByG8pixxaYSekdV7qBJm8S/ZIqdZjL2hWibuuvAdjfOvJXpCFkhBTi1oOrRBQzF10ru8UkYE6qhZ6HphhzpDbbuiNJMmbOXtd8d5rDHldjw/7bAmgOY6HSFi1e8I8LXausyT61b/utzOS+wtB6ZP06zf/yJvlb4gfX++5thz0Kvxt4+7dlcwrckFKtICdvc6Tw/yDmKg5EolWva8dy/pwN/BoB5oAHZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHYelv9ZeqbK7G0zL8cHa53oVsDZBe2Nuqnq2axfmTY=;
 b=ScNs63LpazRWqZpZSV280TRkxV/dbS9xvvGvXNpUjip6ae4dcQc8/HGqkLiQuauL/w7fCwUw6W0pAQHUULWrOdkgoJ6qn8yhlG6Au3QbSn9PdZsHAVw7hYJpwxJmgz2Dw/5x31wMYqsvQb367TR9adMUq6Ulhbs/s11Cfea8QP+FWdCeEItFgkMgVfY9ZAY8xtyNKfM0ZxS/DGDHS54yyyWbc0ROxSdErKCC7pi1esHtMaXapir6SF+3M0vx5mJwQE+P86Ex5HwAicUYT0k810MX0q6jHZhroa2E65p2o9kWLX9D2yoDwNJ0aGFps9StKsZBZo5hXA8zZDyTAkPHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 17:36:57 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::7827:fa46:df42:5703]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::7827:fa46:df42:5703%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 17:36:57 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: GCC Patch Tracking [Pending Patches in Poky Sources]
Thread-Topic: GCC Patch Tracking [Pending Patches in Poky Sources]
Thread-Index: AQHZFV5p+KXhobLE1kixxZ2nFkrnxQ==
Date: Wed, 21 Dec 2022 17:36:57 +0000
Message-ID: 
 <SJ1PR11MB61299AC634FF3D553C33003CEBEB9@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7681:EE_
x-ms-office365-filtering-correlation-id: 9411dc22-1cf7-44d7-32c2-08dae379f547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jyAOYyyIzAXwy2MRT6LV+blJEkFnXWm3dXtEjm0Wl0+45l1NcoXLjWl+xmG9CZrzWPF5pkIa35Glt9tzpa9TGb9RonVFU2zxoo5hA2dWyFTXzF6qNT5HH5qDpkbm5/OBwMOBfzsQacvYK9Q/anVdr+/uNOippVgbtU1Zpx6XEVyZjDF+qqsAN4p8dutrGJllLmXLk+W5xtgkmY4B3AftIDS6p1vLu34iKE0pQTnQ/U/FgotsHEzkJbqzIgv6xPZR74wzkSDtAil9LxsQW0TxDdJhfo65R/5L7ksynV3F0r4fiBfNvnUmPAYAd1f6n2YVSRiHalHmsK5ei0Q0JIdJXEDIt8luMXaqPOhLcrHAxlxKN0NmbMEYMEuWxXVCzXfchGx0xE7AbLMtvjokkNhKLwLVioka/SWyoHDsZ+4suf2jiRDolrFUrXH8P1hVf3TKzYxU9rIgFMBhTxXE15S+34CmsUTgTW1ersNCcsFS/TFD5P6vJNCXMnovx3dKBvy3+CtHSnrFK5f0PtUyFBuqq7B50p/XRf1xRsZNnNCfQRM6kxJeXeP+d8/5ZhVQbEqa+86DdnxYcEgCccSTguzql5W2j/jRzO+0HF/4guhaO2Dvmzp8Zsu3r95Lbb+ZWntQrmPCf2pFPsEbLe+JEezSgatmdzW2IzLfn1JsY+nx0RwnLh29s5+yWd5efrPYwe16f6X1h4OJ/aEauKsgZfWBWg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(39850400004)(346002)(451199015)(71200400001)(52536014)(38100700002)(6506007)(186003)(478600001)(8936002)(7696005)(55016003)(54906003)(110136005)(41300700001)(2906002)(33656002)(122000001)(26005)(9686003)(107886003)(86362001)(316002)(5660300002)(8676002)(4326008)(66476007)(66446008)(66946007)(64756008)(66556008)(76116006)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?yK3/1JreXGSGBoj9mh9tY9eX6MasJ7dFCgdNcUDZfW35rvsNWXN/Cswl?=
 =?Windows-1252?Q?QFX8pjfEREtL9ZXyhgwvaLQiqGnFwxYp87A0bTrhkTXbgUyRRTbtdexw?=
 =?Windows-1252?Q?2Axf5zppaISMVTL//nu943zlkM9wQICEJK3V8eVHLZWvI5elquTAtr16?=
 =?Windows-1252?Q?wCj1DOzhqs+8CHqLmQXSPpjfbUdviX0AqQXLIC+Hc/tjcU2ObM2KcFF1?=
 =?Windows-1252?Q?SJiABRA0GdePchRSLZ4keE1Gps6v+F26kXfiuG4h39LOa7s7HD+RSyUb?=
 =?Windows-1252?Q?hMoqaoqBv81ubQhaRO+WDfU9YJZh2W6hI3FmsCRKnSNOJfwOlIVFwKU/?=
 =?Windows-1252?Q?yK4h1QnnWtlmnNDG/MW5ASSEFs4NokX0tiDIJhh/hHsYpFlTK+SFnwLU?=
 =?Windows-1252?Q?HATYtIknwPNTcI17SKokWV29R4m/HCnNKKFGhoFaQnnk5mbKWi+7BYWg?=
 =?Windows-1252?Q?XawB8f4XoxMFP+bAwkgV9Q3Lem2q8ca3PHnQDyq7iBkcFoctov2F+HkS?=
 =?Windows-1252?Q?sGRuCnGtFP+gi5nq+y+kpfgXLqQWAemX4Ups55qeijhJR9WAXp8ZxKwh?=
 =?Windows-1252?Q?o7FMiSa4IDF7Pb6zTVGqccWbF72QdiHEW9kKdoR4hg4C4AiIJ6N+Pqpu?=
 =?Windows-1252?Q?ShVFTOtt40bT6di9LdG7a9iTqS8wx+e3MfToNwSVfdKBfMHA3+3faFBB?=
 =?Windows-1252?Q?2/LeBwraJUvj2TNJlXo5Q42eHkogfeFffuOeB0+6gDP85w6kpEhtyB84?=
 =?Windows-1252?Q?OKb7MI4KteqKJsRy/nr1kCmNusZyLBq6NXdr+p78eoiAUEtzYXkQntHE?=
 =?Windows-1252?Q?XBtnlRn95cz/QKa23bxs4SValGGtQYXC2+aRRoRm7xPhnquk0z+/H8MM?=
 =?Windows-1252?Q?BOVS9ruz23+4h79Pr6EVE+QZufAhnPBySNUm/SXB07CN390gg8VYExmy?=
 =?Windows-1252?Q?RUFOc3nv4AJJt0OH2VOsID951lTyMsSV9Qvz+f7E6GrkYGq+B2JYdWYX?=
 =?Windows-1252?Q?sN1uVr8V1I4L2XiZyLJT6fKKTJF6+Ti8iqK4Jede9G619Yk14/c6KtaC?=
 =?Windows-1252?Q?Z0936B1FT+cDdrioGRJad6g6ilQ07JugJwfeHAuBaRXST/R3pCT26Mo6?=
 =?Windows-1252?Q?mUfjNRqwFRjkcwpvE/uawOoukPnLKY8rloUEMSXhMhO3oPMoUSRTWSCP?=
 =?Windows-1252?Q?xIt6HhK4tycS4b6n9Jl4rtWAmavwyAQI9iV0brvK3p0z28tTBgwqG+hL?=
 =?Windows-1252?Q?oK03p7MqRo356U2wezLzI5QxA007zFZFO6HxGgEwp3L13GsJybYBvA6Q?=
 =?Windows-1252?Q?kFPdzMQOllql8l1uUekERBTc5xq7txWyo0zcQuK+fc5o08nT9naeguGS?=
 =?Windows-1252?Q?jAhDbwEpIXnnhCGGcAWl0m/P8e6xqa8N82y9xhNCCll5jYY82E5utwTb?=
 =?Windows-1252?Q?Puv3rW6v2M4y641DuALLgQpPKn58HDPyVy3lINoKPUZ23EiSV+g9Lw/2?=
 =?Windows-1252?Q?R+W3b0txRB7+FxnHqQxR9qpSAHzdCqZDny9OKRGbFwhO9Yutwajg0FMx?=
 =?Windows-1252?Q?TJi4EKwjOU8jsV4DLqhKq9iOs+ojIX0KEposaT4Dc1TzLSSp21u/FG8y?=
 =?Windows-1252?Q?zoeGtmSjPD4yTaF8iqJ9PFhGUifn0ZUCi+UdteMju+ze+JuvVJtxJHQ/?=
 =?Windows-1252?Q?giJbiSJmAsUoLXyjMMQ0O+NYkvBGYyJE7ioegnDtq6laBUJwMTejww?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB61299AC634FF3D553C33003CEBEB9SJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9411dc22-1cf7-44d7-32c2-08dae379f547
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 17:36:57.1509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1H6b2o/46ocHkUWetEHkzRo8y5p3vEGN0Q+tlgEcFkzZqk4P69iYB8AoRqGk19hGuGiCET/ieJGH5H0sBwQlHv0SRNwFPoExByppoUUwOHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
X-Proofpoint-GUID: i6oujmh2VmrieAoov5xxvz4WYtMxT2a7
X-Proofpoint-ORIG-GUID: y9x0xM0ccOhjKD2VsdFTEVMoYvDdahTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_10,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174925

--_000_SJ1PR11MB61299AC634FF3D553C33003CEBEB9SJ1PR11MB6129namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

0002-gcc-poison-system-directories.patch:Upstream-Status: Pending

0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch:Upstream-St=
atus: Pending

0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch:Upstream-Stat=
us: Pending

0006-cpp-honor-sysroot.patch:Upstream-Status: Pending

0008-libtool.patch: Upstream-Status: Pending

0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch:Upstream-Statu=
s: Pending

0013-Ensure-target-gcc-headers-can-be-included.patch:Upstream-Status: Pendi=
ng

0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch: Upstream-S=
tatus: Pending

0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch:Upstream-St=
atus: Pending

0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch:Upstream-St=
atus: Pending

The given GCC patches are with it=92s current status as =91Pending =92 in t=
he Poky sources(meta/recipes-devtools/gcc/gcc/). Please let us know about w=
hy the patches are not submitted or let us know if there is any problem in =
including it in upstream.


Regards,
Yash.

--_000_SJ1PR11MB61299AC634FF3D553C33003CEBEB9SJ1PR11MB6129namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">0002-gcc-poison-system-directories.patch:Upstream-St=
atus: Pending<br>
<br>
0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch:Upstream-St=
atus: Pending<br>
<br>
0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch:Upstream-Stat=
us: Pending<br>
<br>
0006-cpp-honor-sysroot.patch:Upstream-Status: Pending<br>
<br>
0008-libtool.patch: Upstream-Status: Pending<br>
<br>
0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch:Upstream-Statu=
s: Pending<br>
<br>
0013-Ensure-target-gcc-headers-can-be-included.patch:Upstream-Status: Pendi=
ng<br>
<br>
0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch: Upstream-S=
tatus: Pending<br>
<br>
0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch:Upstream-St=
atus: Pending<br>
<br>
0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch:Upstream-St=
atus: Pending<br>
<br>
The given GCC patches are with it=92s current status as =91Pending =92 in t=
he Poky sources(meta/recipes-devtools/gcc/gcc/). Please let us know about w=
hy the patches are not submitted or let us know if there is any problem in =
including it in upstream.<br>
<br>
<br>
</p>
<p class=3D"MsoNormal">Regards,<br>
Yash.<o:p></o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB61299AC634FF3D553C33003CEBEB9SJ1PR11MB6129namp_--

