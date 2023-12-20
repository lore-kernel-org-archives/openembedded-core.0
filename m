Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60522C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 13:13:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20896.1703077987243203807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 05:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O/jbuHtR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=071816a208=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BKCL88D012743
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 13:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=fqWPfHZbMXTbz9a92E
	U5IZfVZcC8evPX2rXDAU/5838=; b=O/jbuHtR7Uj/hhNV8sFUaNYZf7EcTHHU77
	957eiqNt9o2jhzb/k8goo0RnUMNLuvqjimimd33EwV9xWyke6msw2SoEqo+TDBN4
	kgq7PKtI7mfxeSU2XbUhfeYyuHXmgVb9yn0NFHJGV1PhDR1I6+kHdNxFiIZN9b8h
	TXX4+r56PDjvVJVI3oryvEnlXRovyIADJApvHFPzZ+T1l1yzNr1XiYm8zCL+RpgG
	9OZ684rRfWIhTgO5BN8xkYAR1b5S693ib03+6IfNx//Ld1euWPjym9BClLlcSUrL
	eQ3GVbpm5pYDKPQ9DeKNOXAB5p6tV4bblTySWH9K+56mjxgsStGg==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5ve2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 13:13:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzlRl+TTFPxc7iEJOwbUDCtz/baHfY5cvrym87OmydOL1/naGG9ghG3dV63zWPChiub/RxGdhJaVedfVHjnut3IEZWce9Zv7kPTYl1ZDEh74CcFDCkDhtp/3IoU++SWQTHHnnoZ89EwPGZsQOIgcca8ATgPxwYyUsDx+CjFh3JC88MVr5wkgoreHE5r1oJQ8mOlayPqb1U1vZDme0+JyNQjA9dCNuWT9Ybviq2jwG0DxmRZKnS/IWvV7fvgLAvN2rReY4jgEYGluIWoy3SOgYxzQbPaML/AVXo8AMD5PvhN/nOIh8s36HoUrj6QfL/b5Cuo0/Ga5hslV6C/wCNzT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqWPfHZbMXTbz9a92EU5IZfVZcC8evPX2rXDAU/5838=;
 b=HzrcePNBDkb83E+i+szujsLtmI/k7G9iLv05ld1aj/KgUMR65pFt0mt16sJasdjQooLVsLcN8JeLpRdnirnJLS0ZdGFKVXFTnVCHLwbQmj8+8wgx0rlFjBsnmCIWC7/d2O13BjMUm9R8XgocSintqQicvbXpVh2a7ikM+mqLIAa6/0HAhK25b53YqGviwV+xxeC5VYGAUPUHmXMs88z1GQ0o6NGNzrb0+69vghMt9mIRLOQ4h30RX5vaGS6z8Jem9FXj9fvmd5S1IQvmu2KgQcYvxeBLHTNGHMZCINl5WhEU6n4qwxwdnUPoCS7cGZt7O7IwYyMT1I96wYRQIun9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 13:13:02 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 13:13:01 +0000
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: RE: [kirkstone][PATCH] nativesdk-sdk-provides-dummy.bb: Update host
 tools for rust-cross-canadian
Thread-Topic: [kirkstone][PATCH] nativesdk-sdk-provides-dummy.bb: Update host
 tools for rust-cross-canadian
Thread-Index: AQHaLC1I6SyuVPc3Ykypw4jcdCJ6trCkMs4AgA4Ay0c=
Date: Wed, 20 Dec 2023 13:13:01 +0000
Message-ID: 
 <PH7PR11MB644963CE328B3CAE639127BA8D96A@PH7PR11MB6449.namprd11.prod.outlook.com>
References: <20231211122613.2429111-1-Deepthi.Hemraj@windriver.com>
 <cd25a9d6-8422-4539-82a0-1418ffc6b52a@windriver.com>
In-Reply-To: <cd25a9d6-8422-4539-82a0-1418ffc6b52a@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6449:EE_|PH0PR11MB5674:EE_
x-ms-office365-filtering-correlation-id: 8867d84c-3597-44d5-7aab-08dc015d64df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6tgfVxQyoWv+I2MmcyLr1/sxtuIgntqTC0qEcu4VRnrt00nBg/Re81Osa5NLKgy0ExbCY507w0HDVatUZEYdRky2fQ8VCYzCnqHqIcACw5fnUI2taBO3gVNprs2Cq850jaunnmLazN5etMm65DqTG2o3UbIstiNoKQgFfm0b7e9rj87Rw121bkW0trXvCoZjugi7mKZ0nIzsRL3hV+IvNvTX213HUshzo/PpQu9zLplxwfw+DmAJVprfESq3VgfY++zilanhW1OucE+Xest68XbE5B0qy6SbdtmFuTCIS13Pn3tYxHeoL/6bUQ3pSBCBf5Cmqf6NeD1Pt49jm4OETi/iypy2XQGGy2cC5MqRyVSMwobZ5WpNeIf+DHlbO1MUceFjmqzFNq9pM1FyWbpVv//P3ZSZ/WfhY4COuqcNS2aZKQwDNMK+ouA5aGWHk6SF4v3Ox7QQFOXx6QSaLt/icMSIGuFUyO92WPfthQJzPRg6/wcsujTsa1CBc18iM5aUv2BW2rQ7n5yjLhzjKwyBUikE31bmd821JMmRbD5stKSN84+5UFnKb4twhLwAz8MqYl3uzPQHY/osT2gUJRpaB6O37Yf6PJ6SecsTcEGd7ng=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(39850400004)(346002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(478600001)(110136005)(66946007)(76116006)(316002)(66556008)(66476007)(66446008)(64756008)(38100700002)(71200400001)(38070700009)(41300700001)(86362001)(6506007)(7696005)(53546011)(9686003)(33656002)(54906003)(5660300002)(26005)(15650500001)(107886003)(4326008)(83380400001)(4001150100001)(122000001)(8936002)(9326002)(8676002)(2906002)(52536014)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wzJWMdlTsf6tofCyxkkASlaBGlmJ4rO/qraHOz095VzXWMdSnpZ6U7aEGPBh?=
 =?us-ascii?Q?AZn0r8hj+QreG0mSd+KpZWJozz9dMqTe/5Ot2s0rJmqtqD4bNUs1bB52vJkZ?=
 =?us-ascii?Q?+wh2kT0IN0AT19dfg4DsKwu0/gTbO22Q8/9pipvGa+QoNLsIf+GeV3lrwjtf?=
 =?us-ascii?Q?/N3+hKMrVwl38omkXFMwhiuVDbFqL669WYHeqiYNzdWm9xThTUi4Gj409PR+?=
 =?us-ascii?Q?JBC0hgcWNhvo7oOrVpRaTvIY4JhUzxLBTS8womF4H05Es+T2exSx8L4k0tSG?=
 =?us-ascii?Q?6fisnZxFiTszlEZ+nS+eQfPhr2As0YIdReLxMIYwiEBDYer/VtFSZ26Nb70Y?=
 =?us-ascii?Q?rjGUDUzrAydpFEvivMlEot422jKw/GYef+1/2KUDAm78I1LeE7u3ntYaFEdi?=
 =?us-ascii?Q?n9iF8mADWCTaDm+hsfEFe5xAsDspxWFnIGD039XL6EmiKj5/bKoZfO2GC9nd?=
 =?us-ascii?Q?4tK9Q1kJoFHQLzSuXMxLoqXneQcwE8lBhM2C7XXHzig0YvShGEFA74pevgbE?=
 =?us-ascii?Q?eTo6x5jSEwmtPZgX4qohTMkWd93+Aa9r/ZyydyC2QQQ7aGGUrJ/c0kbyOjYl?=
 =?us-ascii?Q?cRCy1ctArLnNZaUuuXS68vEzJpW/DuUMkdBjJI9ESCG/saV3so1UkOyFt2KO?=
 =?us-ascii?Q?WU1CZFbo12H4uEyibdRaYwZA6Fm/9iam5LSSGBNjFkAin75sXK5CDKKuX+qw?=
 =?us-ascii?Q?IBq2xfUPRplj3M0zdKm+iUntBxtuga4xOqm6nZS2xCSDFc5cJm3kneFcwio3?=
 =?us-ascii?Q?HMsc+wckAL+i3e+petLN02hDJx51JiiVryVSa31lfZBv8zQKimWZx0DIkNaL?=
 =?us-ascii?Q?kSJQ/SXkmb9Woz5sPFNSUJ7pZl+BJM8NA3JHcoGe/RsCu58QcI3ndPlVqcFP?=
 =?us-ascii?Q?zeOFnAQnkppvlkA9B/AFp6oTjoH/g18Hv0R7fVfTy5Kvn60pEIZm7oJUN1lz?=
 =?us-ascii?Q?N3Y5UWFrKzFCJ1idgXzr4vvjBKFRshI51jAvDJDfe/N9XVfVaOKuoUI1aQ19?=
 =?us-ascii?Q?ZCkl2RykToBL4CufKUQOOmQ/opDLehh2QgJtTL7D26W67zQyGZT4qi0hQuAB?=
 =?us-ascii?Q?uvaz5s2wX4kCEjqrbllVotQbz6AKovt378fRuPbpyqSXwAHpdNdK6Hzeenqt?=
 =?us-ascii?Q?HDWAADih61XFIPusAsH7dyzxSmKvNkZYOP7/YMA6CHByxlisPK9A6NT/JS7q?=
 =?us-ascii?Q?bnyiH8Aq4Gx2CyYEKYVtfjduppGsfBKIaSE1ySyy2BhFprVU0dF5RN4893Wq?=
 =?us-ascii?Q?hipoEWA1+TcuvcLBF1OUMF6P19zvM2X5GFxkAlq7/t4O1m2271JaT/zbb/GC?=
 =?us-ascii?Q?kr/VN9AMsPEqqtqRICQ7VHDYUEm+McoM7M7c61uqaONEJAmOpHsUBfn9fw/S?=
 =?us-ascii?Q?XaiwGs18KZW0nqLv5Dsa9Sg3TXVT54FTZaFxOvEL8qmLqSl+dpOXrVmxi/m6?=
 =?us-ascii?Q?CYdz5qtrqaw9KCU65kKgofKxtcCeaQUIHBBCajm+OwGWUGarz+7iMnMgNtPk?=
 =?us-ascii?Q?dVUBrLRC4dz/XKaJFo0567uR8sXmVy57YbMdVLeftRlCfNzxTDawmiFa6f9j?=
 =?us-ascii?Q?M/lqSMFVkm4hePvSB1DH1Au6mmF7uNvGyOZxAhTClVR60ChbDA2JVpAbBbLU?=
 =?us-ascii?Q?ex7xHR7i1hi4PqCcIzg2aro=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB644963CE328B3CAE639127BA8D96APH7PR11MB6449namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8867d84c-3597-44d5-7aab-08dc015d64df
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 13:13:01.5152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U81mXA13zsuQhWZ727BRKLSM37vR49FWsq6g+Sr/Ad9hCkzpCyqMmUx5OHA6M39rBj6Mb0Ns3aXqB8Jeg6Y1sUaLrt1rW4FPkbqP0eF4eV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
X-Proofpoint-ORIG-GUID: oMrEO1jxHlA44B05OjkTdpkFZ8-GU-8j
X-Proofpoint-GUID: oMrEO1jxHlA44B05OjkTdpkFZ8-GU-8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=908
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312200093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 13:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192799

--_000_PH7PR11MB644963CE328B3CAE639127BA8D96APH7PR11MB6449namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

I tried adding nativesdk-libstdc++ to DEPENDS:append:class-nativesdk =3D " =
nativesdk-libstdc++" but the issue is still reproducing.

The nativesdk-libstdc++ is not having the GLIBCXX_3.4.30 symbols. Below cmd=
 shows only GLIBCXX_3.4.29.
"strings /ala-lpggp31/dhemraj/kirkstone/5082/poky/build/tmp/work/x86_64-nat=
ivesdk-pokysdk-linux/rust-cross-canadian-x86-64/1.59.0-r0/recipe-sysroot/us=
r/lib/libstdc++.so.6 | grep GLIBCXX"

So, I added libstdc++.so.6 as dummy in <<meta/recipes-core/meta/nativesdk-s=
dk-provides-dummy.bb>>

Also in the gcc documentation (https://gcc.gnu.org/onlinedocs/libstdc++/man=
ual/abi.html) I see that, libstdc++.so.6.0.30 is provided by GCC 12.1.0 but=
 on kirkstone the gcc version is 11.4. I think libstdc++.so.6.0.30 is not s=
upported.

Thank you,
Deepthi

________________________________
From: MacLeod, Randy <Randy.MacLeod@windriver.com>
Sent: Monday, December 11, 2023 8:50:32 PM
To: Hemraj, Deepthi <Deepthi.Hemraj@windriver.com>; openembedded-core@lists=
.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Gowda, Naveen <Naveen.Gowda@windriver.com>; Moodalappa, Shivaprasad <Sh=
ivaprasad.Moodalappa@windriver.com>; Kokkonda, Sundeep <Sundeep.Kokkonda@wi=
ndriver.com>
Subject: Re: [kirkstone][PATCH] nativesdk-sdk-provides-dummy.bb: Update hos=
t tools for rust-cross-canadian

On 2023-12-11 7:26 a.m., Deepthi.Hemraj@windriver.com<mailto:Deepthi.Hemraj=
@windriver.com> wrote:

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com><mailto:Deepthi.Hemraj@w=
indriver.com>

[YOCTO #15082]
Packagegroup-rust-cross-canadian package requires rust-cross-canadian, but =
the necessary libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library is missing.
The fix adds the libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library requirement =
to the  SDK dummy package, resolving the dependency conflict.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com><mailto:Deepthi=
.Hemraj@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/=
recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4..dc3ae1edaf 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -10,7 +10,8 @@ DUMMYPROVIDES =3D "\
     /usr/bin/env \
     libGL.so()(64bit) \
     libGL.so \
-"
+    libstdc++.so.6(GLIBCXX_3.4.30)(64bit) \
+"

 require dummy-sdk-package.inc



This doesn't seem right to me...

Does the problem happen on master?

I haven't tried it but I suspect we want to add something like:

nativesdk-libstdc++

to:

DEPENDS:append:class-nativesdk =3D " nativesdk-rust-llvm"

in the rust bb file.

--
# Randy MacLeod
# Wind River Linux

--_000_PH7PR11MB644963CE328B3CAE639127BA8D96APH7PR11MB6449namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Randy,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tried adding nativesdk-libstdc++ to DEPENDS:append=
:class-nativesdk =3D &quot; nativesdk-libstdc++&quot; but the issue is stil=
l reproducing.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The nativesdk-libstdc++ is not having the GLIBCXX_3.=
4.30 symbols. Below cmd shows only GLIBCXX_3.4.29.</p>
<p class=3D"MsoNormal">&quot;strings /ala-lpggp31/dhemraj/kirkstone/5082/po=
ky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/rust-cross-canadian-x86-64=
/1.59.0-r0/recipe-sysroot/usr/lib/libstdc++.so.6 | grep GLIBCXX&quot;</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So, I added libstdc++.so.6 as dummy in &lt;&lt;meta/=
recipes-core/meta/nativesdk-sdk-provides-dummy.bb&gt;&gt;</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also in the gcc documentation (https://gcc.gnu.org/o=
nlinedocs/libstdc++/manual/abi.html) I see that, libstdc++.so.6.0.30 is pro=
vided by GCC 12.1.0 but on kirkstone the gcc version is 11.4. I think libst=
dc++.so.6.0.30 is not supported.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you,</p>
<p class=3D"MsoNormal">Deepthi</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> MacLeod, Randy &lt;Ra=
ndy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> Monday, December 11, 2023 8:50:32 PM<br>
<b>To:</b> Hemraj, Deepthi &lt;Deepthi.Hemraj@windriver.com&gt;; openembedd=
ed-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org=
&gt;<br>
<b>Cc:</b> Gowda, Naveen &lt;Naveen.Gowda@windriver.com&gt;; Moodalappa, Sh=
ivaprasad &lt;Shivaprasad.Moodalappa@windriver.com&gt;; Kokkonda, Sundeep &=
lt;Sundeep.Kokkonda@windriver.com&gt;<br>
<b>Subject:</b> Re: [kirkstone][PATCH] nativesdk-sdk-provides-dummy.bb: Upd=
ate host tools for rust-cross-canadian</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">On 2023-12-11 7:26 a.m., <a class=3D"x_moz=
-txt-link-abbreviated" href=3D"mailto:Deepthi.Hemraj@windriver.com">
Deepthi.Hemraj@windriver.com</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">From: Deepthi Hemraj <a class=3D"x_moz-txt-l=
ink-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemr=
aj@windriver.com&gt;</a>

[YOCTO #15082]
Packagegroup-rust-cross-canadian package requires rust-cross-canadian, but =
the necessary libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library is missing.
The fix adds the libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library requirement =
to the  SDK dummy package, resolving the dependency conflict.

Signed-off-by: Deepthi Hemraj <a class=3D"x_moz-txt-link-rfc2396E" href=3D"=
mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</=
a>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/=
recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4..dc3ae1edaf 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -10,7 +10,8 @@ DUMMYPROVIDES =3D &quot;\
     /usr/bin/env \
     libGL.so()(64bit) \
     libGL.so \
-&quot;
+    libstdc++.so.6(GLIBCXX_3.4.30)(64bit) \
+&quot;=20
=20
 require dummy-sdk-package.inc
=20
</pre>
</blockquote>
<p>This doesn't seem right to me...<br>
</p>
<p>Does the problem happen on master?<br>
<br>
I haven't tried it but I suspect we want to add something like:<br>
</p>
<p>nativesdk-libstdc++</p>
<p>to:<br>
</p>
<p>DEPENDS:append:class-nativesdk =3D &quot; nativesdk-rust-llvm&quot;<br>
</p>
<p>in the rust bb file.<br>
</p>
<pre class=3D"x_moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
</div>
</body>
</html>

--_000_PH7PR11MB644963CE328B3CAE639127BA8D96APH7PR11MB6449namp_--

