Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D981FA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 05:19:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5973.1667193552681251679
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 22:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jQJrweKN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8303463e3f=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29V5BABG013604
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 05:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=gh5QMtpoPnr7WAkNrWuH/nWB++q/axMRGRSmMaecuq0=;
 b=jQJrweKNRXiMpenkKH20h4vJbSqMhywXR6ebF/ONrDK1mkkgGJeJ8ii7CdqZIL9xeBuZ
 Pbhu/th/ATVSp9jst/h+gZNz4HGAUbm/src/NvhFVHfe7HHLsZz/1J7KWIcgIpflpGmU
 5C8S5n9RPPrKLOdTOO+5GJi5zLQp6Bpp18R/bZuMCmnDU+y8nMchP4Q5Kq9/PmAH/2qi
 36FMdkqoqQANh5pTqQdKoLHs5eNNiIZ+DvyveHs5Ib/rpPHVQJtRk4zPHqRIxQaQxEO4
 o2V7jkSkRxIJscb5ROGYAt2jZJwydhJgAMbrsD3Fafv6CA1Es4oefJ9zouM3ou5E0HlP uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgsd1saer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 05:19:11 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29V5JAAa026609
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 05:19:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgsd1saeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 05:19:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=momJP+ZCBxuJv+QZ3N9AUQ1UhH+WPg7WyF3L23JEz5O4kSC4Bg/Ez2ySnBTKFyiAccM6ONd0FMx4dQH8YorxiNn3JNRaONTRQ+wvNrmxXCezDWvFV7emz1hoHl+pfYo5Gs8g3iKmvXv+8wCui3HEEPYGpkWssz66C/qWY02DotBwRIZ2c+M9J4LaSwxE1Bv6znQNO1WWMW6dErJVCfjQ223Aymd1HM98PB5ndiSfhihAENhYrUoTvcQL4JJU1T4iiMIc8uGXo8RTnEu2kEPladOI1wyUziv1h14mLSjso8gIf/GW6DgAC5HerJw+kQSYi4/JxaZ4ZbYfgOE6SQBLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh5QMtpoPnr7WAkNrWuH/nWB++q/axMRGRSmMaecuq0=;
 b=I+Ra1Ozyn2p9rlqBequrYV+Akm2w9VrPkJxIEAIoDEZwLFBco09O0alD2uoXk1o+s11WVgOF3MamTSVo6CiGnDM7kKEnl/KZjZcQFxhyUJQK1TOKOIOX4z4jPaDzdYlU6/N25R3XHkYKbONczkojJdJqDuzvNWMk/yvvIagfoTcLU8sKGMGSJZ6nIi3uuWa9GMJKLWcZT6WCQfHWIzoc6lx2sMyEORo0m+0VX1KezDtZyOtFxP8s30IgedOiLuKGgw5pTfUvvNmR6fEHrlF9PmbO0iRoJKtdYl2Is0tYbaW/UCo+D63KM/wyUrl28uy321s5E8URVm8oHbdCHjo9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 05:19:08 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9%5]) with mapi id 15.20.5769.015; Mon, 31 Oct 2022
 05:19:08 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>,
        Alexander Kanavin <alex@linutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: RE: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Topic: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Index: AQHY6uW1vT/KaIwsjkyLfX/7li2C264j9rsAgAAAYMqAAAL4AIAD/exj
Date: Mon, 31 Oct 2022 05:19:08 +0000
Message-ID: 
 <DM4PR11MB555057718570B1D3A1246E6BE4379@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221028155331.1594577-1-narpat.mali@windriver.com>
 <B23AF8E8-1CBA-49E5-90C7-404C1B9F322B@arm.com>
 <DM4PR11MB555097F6252E7B857E5A90EBE4329@DM4PR11MB5550.namprd11.prod.outlook.com>
 <E812133F-F6BF-48BA-A463-A7C8B7333327@arm.com>
In-Reply-To: <E812133F-F6BF-48BA-A463-A7C8B7333327@arm.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|PH7PR11MB6859:EE_
x-ms-office365-filtering-correlation-id: 6d8ccc09-c704-48ae-afe9-08dabaff6fc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2Pgp9dXM/ZdgHDMeqtnTmiz1B94gBe2lqyf+oqh+SGMNkZlbwfvL+KvjuMGkxsUeYXRCewOmfGVewwrHWFZ7/c4MX8m/bwGvSDVreFM1v8RPI5DYZUoi++fDWdy7rERx1XU4OU+BhrcPTwM3+1LQfoOJv13FcmpPl2dG4KentwOg5tgpWaSAaSGvwSl6dp1QRENFOvRzez1oRAWEqn2d3iuRmO5E5NzHJOKQqiuyjrL8fJtmbnAR0Mb+k2GBVtKu1jLeWXZBpW+D2gxWQG3E7+JkG8mzO9hQYiIfnJjkKxgYUfIU+22N0CgqB+D9Ev3Q3zWYdUuk7Gggn28YovBZnIohXa2ifwVk1wLGCaMfMgaHCmElQQF8rpJG7LqVM0k2jGcrQOnx3sORtSQpGJUtXtOqFnfnqvtNN9qQqLu5FqZ5CS7Es/YRI3q/tSh/6uSLVoi82CXrQUschV31Y45l/zaSohS8wKR+8YG6+woUNuBN4mW7nUb68xqobkGjz6pqtL35RgvJcBAXpJpX0cQkfoRLVmSvtFrQw3ByP4zAfnLbCo8TJydDOlH9HdkpkoNmfH3s2V+x5QAkiX3ZhSSYSSZ/8x2QyFNlgnEDTkOYKs2RoaEYbWx2hqdPhcHldDyAvgmr/AVwX16yz2Xp76c9l2hwUcN8iV5lHJS6Qf63p/IxwqRTPr9m4cgLD0dhJzsUTdBA4i3v14biP/40hwv2qg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39850400004)(396003)(366004)(376002)(451199015)(55016003)(6916009)(316002)(6506007)(53546011)(91956017)(8676002)(33656002)(76116006)(4326008)(66556008)(54906003)(66946007)(7696005)(66476007)(66446008)(64756008)(83380400001)(38100700002)(122000001)(52536014)(8936002)(86362001)(166002)(26005)(41300700001)(9686003)(38070700005)(2906002)(15650500001)(5660300002)(186003)(966005)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?SpIJbF+8lXllAf5ZspTliGs236L+urgUBr+DiNFjuiwyMF4BZHkGl5f5?=
 =?Windows-1252?Q?PsSiw6b5Bsae268s1NnFpcO0pbD8SLHsKwOH/MakuQi0tV9jUncf01J8?=
 =?Windows-1252?Q?65GdlI/s44qrm0FK2ps64/fLMD+TDMnLJE/EiCFdF0mDRL/w8IDkt/Ry?=
 =?Windows-1252?Q?TW+0y7NlMvaPO6RsaKj5QRgN5K+B+9FLcmJr4zkVElfW0sMqO5nX4BZg?=
 =?Windows-1252?Q?is1qa7hEIRrb4MY92hROzZVVwv8Of6nCzYQ7QZ7UZMGqJMrLsKP8HF6i?=
 =?Windows-1252?Q?HhvhK8vB5nHuIhPeDPaStiZAU9JxPUgsJfcbPRzNnCiespPVN4C2PxMG?=
 =?Windows-1252?Q?0e77T7oVDgCLs98guYYNzGbINhuW8IjTHCai5HserCoxgiMdZXpARsxg?=
 =?Windows-1252?Q?8T6VitL2GPkMfDtHy8rH2bIc0IuYRPFBOYKnpA6qjgUEAJF3uxpfDAW2?=
 =?Windows-1252?Q?/uIWOErVDmiIAePRlgn3OB6GIFDRgC8DLhaAdgGjp3C1QQCNO1QHuq3c?=
 =?Windows-1252?Q?TMYLCckLMe4D+n7nvTY8shmFabTDZoryxIEk+sFpEeaoR18u6G6VdWqw?=
 =?Windows-1252?Q?Y/fPKwSC5DafL2XF3pvsk5FDEEYzwGwC3UgDOjHFimEw5i25xzdnBDDD?=
 =?Windows-1252?Q?2ZRc+K7ve5gMcSX71dC7HQSF2QMb9z0IuqMLkWiVYOKEhcKKOTTHBHPA?=
 =?Windows-1252?Q?x9ggw7v1j/Ppwc7mZlFo7oduFw8RbfXUiAZmyuEEUNUoHk+BYno41b0o?=
 =?Windows-1252?Q?MQP45u/UqQchoo8ErspZzWWn7amRX+0GysaEJ5JRiUpwvgdoXrrqzR8Q?=
 =?Windows-1252?Q?OdSQ2LVuwxrAesAMDXOdJXC5HX61gXTZIhq9kWFK28454T+l+rgUpYD6?=
 =?Windows-1252?Q?BjxYHIwLVkm5qAiA+Yu6sZ/4/0Pg6Qfx3/iKLgvEyM4Zk9UuJxMYTvgS?=
 =?Windows-1252?Q?c4HbeHuuVnYm4G99U05cOgP5zaUZYbY48/iNKyyIBOoabBX8A1t8eppl?=
 =?Windows-1252?Q?YkTwd//nInKVKQGfO9+RBRtP+acnPV52kjVjIDfwnfcvh0KgEpUBFKmV?=
 =?Windows-1252?Q?V117TWYGXYCpWhCty55YYB2JdnJxtIMKwHKAtLWTZyXonjeOsnHiplyv?=
 =?Windows-1252?Q?2id7kepDFzH7YR5HEY3aSa/3AprhHDK6aH1urVMdxHRxbPJcjZwhsqUr?=
 =?Windows-1252?Q?r/4QyPqvO4gBwS/KDNN6UbFN5DOwlxfiSqYfghQYaonwNkzOttbGUSzE?=
 =?Windows-1252?Q?Alor2aj422HQKeNwgyihft3TCEagdnKalkSUY5cZ+ANHu4M7geTtZ035?=
 =?Windows-1252?Q?lOQYEgp71+Ip0Ub0ORvfiq6RVrVcRh5xW6qmmsazfNBeaAY3RSMg0ibD?=
 =?Windows-1252?Q?SILFngi3CG3tP+r9ZKdQ6evPn5p1Bc/c+ZTyazdmkeBWR3ulr27yv0vd?=
 =?Windows-1252?Q?hbowWCIYbaLs8n3ERGuFvdn1doi2Nh3kIB+YyAK1V7bUkWmxLYPSuwZM?=
 =?Windows-1252?Q?T0ll4BUeeRmFKbz9RLpQZ4hTsfQ7D9wzf1w4pIDv9D0yQYwPhlXGVCkr?=
 =?Windows-1252?Q?c4TVidxLYPtNUUKVMVvHsHErpniQljem1FJhDM02rORQWpYGxRMrh8sT?=
 =?Windows-1252?Q?uWBvubQqeE3/ccLH2kdLqUnwlUwUnsQQRrEur7LKwEEG811thPjxhGdG?=
 =?Windows-1252?Q?bt7oRzz4ALtytjNEFxY13JG1u20/k58m653i3CqgCt8k1tDrAuc40I2j?=
 =?Windows-1252?Q?Mr1cwNl4ZC/jvXtwLW4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB555057718570B1D3A1246E6BE4379DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8ccc09-c704-48ae-afe9-08dabaff6fc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 05:19:08.0531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YULj3fO+9Ot/ONDdC6eoSHirDuMjkiB+6Yq48J2xEa4ZjU0G9nEkFd4HjDRWyqXXQy72ITDNZWn6uUeXKFffvy92UvIqTZQCPrDqMM4we78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
X-Proofpoint-GUID: E8teFSMPJsLKVhIwx5gYX4i3kjwk6if6
X-Proofpoint-ORIG-GUID: A9orDCmqbcs5dQtbqyyQRHo8LZ7K9BBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 05:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172289

--_000_DM4PR11MB555057718570B1D3A1246E6BE4379DM4PR11MB5550namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sure, Ross.
I will send the patch to backport the "CVE-2021-3782" fix on wayland 1.20.0=
 version.

Best Regards,
Narpat

________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Friday, October 28, 2022 9:41:28 PM
To: Mali, Narpat <Narpat.Mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Polampalli, Archana <Archana.Polampalli@windriver.com>; G Pil=
lai, Hari <Hari.GPillai@windriver.com>; Alexander Kanavin <alex@linutronix.=
de>; Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21=
.0

[Please note: This e-mail is from an EXTERNAL e-mail address]

On 28 Oct 2022, at 17:08, Mali, Narpat <Narpat.Mali@windriver.com> wrote:
>
> This latest version of wayland 1.21.0 has the fix for "CVE-2021-3782" and=
 in master branch, it has already been upgraded to latest 1.21.0 version.
> Our product is based on "kirkstone" branch and in "kirkstone" branch, it =
is still with 1.20.0 version due to which "CVE-2021-3782" is vulnerable.

https://gitlab.freedesktop.org/wayland/wayland/-/compare/1.20.0...1.21.0?fr=
om_project_id=3D121 shows that there=92s a lot more than the CVE fix in the=
 upgrade.

Can you just backport the specific fix?

Ross

--_000_DM4PR11MB555057718570B1D3A1246E6BE4379DM4PR11MB5550namp_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sure, Ross.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I will send the patch to backpo=
rt the </span>
&quot;CVE-2021-3782&quot; fix on wayland 1.20.0 version.<span lang=3D"EN-US=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Narpat</span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Friday, October 28, 2022 9:41:28 PM<br>
<b>To:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Polampalli, Archana &lt;Archana.Polampalli@windr=
iver.com&gt;; G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Alexander =
Kanavin &lt;alex@linutronix.de&gt;; Alexandre Belloni &lt;alexandre.belloni=
@bootlin.com&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 =
-&gt; 1.21.0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-ma=
il address]<br>
<br>
On 28 Oct 2022, at 17:08, Mali, Narpat &lt;Narpat.Mali@windriver.com&gt; wr=
ote:<br>
&gt;<br>
&gt; This latest version of wayland 1.21.0 has the fix for &quot;CVE-2021-3=
782&quot; and in master branch, it has already been upgraded to latest 1.21=
.0 version.<br>
&gt; Our product is based on &quot;kirkstone&quot; branch and in &quot;kirk=
stone&quot; branch, it is still with 1.20.0 version due to which &quot;CVE-=
2021-3782&quot; is vulnerable.<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/wayland/wayland/-/compare/1.20.0.=
..1.21.0?from_project_id=3D121">https://gitlab.freedesktop.org/wayland/wayl=
and/-/compare/1.20.0...1.21.0?from_project_id=3D121</a> shows that there=92=
s a lot more than the CVE fix in the upgrade.<br>
<br>
Can you just backport the specific fix?<br>
<br>
Ross<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB555057718570B1D3A1246E6BE4379DM4PR11MB5550namp_--

