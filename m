Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9316C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 05:57:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2185.1686117467634325989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 22:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qEG0G25J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5522d77b48=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35750uB3009782
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jun 2023 05:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=eLnUl9+1ZSIEp23KCqPJaNsyrdmv8/jRU5/2+ApsMUc=;
 b=qEG0G25JDe/Y6tzkUerPT4eStAps74tV66tWS/Y8vX62wVlAE3OKGpAMT83S32BTmwjP
 IRaXkLAOqmueLOluxzFaQvgH1WZehBCrjYmUDq5P8qcR6vtGlsvOqTRcPnF6GFGh3oj1
 lGco/Hn/nW9dEWQIuS2bK2wcwFDde5vZJwOcyjN3ASV72an8FmfSqBVyH5VpzKDZL26o
 oc0wh73sizeRT6RvB/juyOMUNXsSuORUwxzimrr9/cpbMS+LJDrn+CAXYqfG9gLG/Y9g
 HhQ1N4z7I6p5k5QKK+0ijoyaeFzzcN38ByZIBADThFGwWkhSG3xJDciDsPTdaAylhiRV ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2avq0byr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 05:57:46 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3575vk7c008572
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jun 2023 05:57:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2avq0byq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 05:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXANOx1bJmYpdKA/R4XYJAPH1kTRXFfmtUj7yUnGupBsk5Eq0HmUuDQsPIXtl5CodQrzNjKuDNS3igMI2IwMdACDCp/xxYxjs3CbBxtUY+GDsfVnGcXFcHunJdk4if12AcOgomWiDpaBwae0FQ9vbGHGaPaGUkHobSF5+FHLppkpIwg0SV00TzptcvTf8OFlPuUxK9h7QnAeKY3vSO18g3k7/36kbr4sUOJ1H423uSmyFb4qcnL/BSeWRNwW1MIZe/s4LhqfdF7SxQMXOOEOGxPHxX02ITKJqbOKYm8hhAazCtCXzDGCeNFIBcU20XK3joOlQtqYMSK8CJSELIqM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLnUl9+1ZSIEp23KCqPJaNsyrdmv8/jRU5/2+ApsMUc=;
 b=l8+7bgNpabrBXkYhUbmDcdwubVF+10M7ytR7AZTsohmse8yS4DGK0bfR6HTs9SzWEV+UXNO5ifFYwfuqvV7oKTuBdqH1owVWCvX82S9LpE63kF6LVkcLNGC6KGn6X2LdsWudNY6y3YXffz/HXzrS9iAPJIG4fRIIhYllnjM6AKFld8tl2n/vcpdIdMEE8hXuGkytgW7a7i9+xEe4BEhdYlh3H2rH4HSwjja6cgPqU0upSArmvyPorTFx565ZCQMqCz8ggsHejrfjaL5+7MNt8lBgt2pMDLbxVI6LjSJDa3c0JtPXQAdLNEVRmzCry/c2vcZ4Gyt/ClIlRpuWM/+l6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by CY8PR11MB7875.namprd11.prod.outlook.com (2603:10b6:930:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 05:57:42 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::7b69:8447:ce7b:8e80]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::7b69:8447:ce7b:8e80%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:57:42 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com"
	<steve@sakoman.com>
CC: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
Subject: Re: [OE-core] [PATCH] perl: fix CVE-2023-31484
Thread-Topic: [OE-core] [PATCH] perl: fix CVE-2023-31484
Thread-Index: AQHZl9WoDu7Bp6LtZE6f0X64NaxrFq99nfmAgAADFeKAAHQPAIAAoSb7
Date: Wed, 7 Jun 2023 05:57:41 +0000
Message-ID: 
 <BYAPR11MB339738AE4FAC5DE0F688D9548153A@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20230605174616.2559077-1-soumya.sambu@windriver.com>
 <a29c16f23d36d0a4c5b714285329c74c03e89200.camel@linuxfoundation.org>
 <BYAPR11MB339703E6629D812AD19D49C28152A@BYAPR11MB3397.namprd11.prod.outlook.com>
 <7daf0202-d27a-32be-8b46-3f4763720ce4@windriver.com>
In-Reply-To: <7daf0202-d27a-32be-8b46-3f4763720ce4@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|CY8PR11MB7875:EE_
x-ms-office365-filtering-correlation-id: d3ccf82c-8bed-46bf-032c-08db671c1b62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 96KrKkoA9f1zne30T5WXOxwH65u0UbcmM10SyAEiovmhwVGU1mUeHRBp52k+TBE27UuwZTCugVv6TeF9LRfeebnWYd6f/r3DH/2g4fXmjFb+zZjLEM+9u5gxLp51diXdx7D25RtvKvBx6e9+91iBkEc1h9VP4DjUPTxiFuKPLgKWSH/4eCO5TJm4ian82XlGae/RXSNwDX2v83NopDPC1E9l3vm4Lqf4F4N2n5Bbwg/eAmI6rotUAUtZmxZNh3WAUNS7HvBcRpu9B3PKulqege52rWy5wyIhL778zvjEWXaRf1ROMR/aUFym1z1bhbF52w8WSDkz3JPBgbgsDIZ0Ebg5Lrcy7Jf1xPVQ45r6lD78DNc0o9NlXmXw35pQI8pgDp+MQvDi/4fScnzJBTCXielpfVoeDZ7wd4/5TOlQGvH/Hcxyf2iD0T9fa6ItW45mY7jGryJjKwNuGBKPLxOgeZMKjYcU1IhcIJf6wEBkl1lWYTnjIsfesNG2jCxEWgzGpHP4MSntp5lFxin6YsWi9wBSe7IG+5E5JFc3RZw3YHhX/v2yOqk41rKvtYmzogpzeXXRDmU3Ba9znmScC7eeifgKgTIL4OtoDCiTCFZBzRo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(451199021)(166002)(478600001)(2906002)(7696005)(966005)(107886003)(71200400001)(33656002)(83380400001)(38070700005)(6506007)(86362001)(9686003)(53546011)(186003)(26005)(122000001)(38100700002)(5660300002)(110136005)(316002)(19627405001)(8676002)(8936002)(66946007)(76116006)(66556008)(66446008)(4326008)(66476007)(64756008)(52536014)(66899021)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7CuWt5xF2nF/QBb33ERW79N+uZPBXS9qUClH6HpFzYcrtuAhCu/QFVqEFHZS?=
 =?us-ascii?Q?k9T4lDV+pk36uXJ4YeyI/cA9d/DTeW4rkj9JUvKYgE64o5Emulk6+/rsUfRx?=
 =?us-ascii?Q?AXpr5JoKKH9598xdbeDHbBoS4ldrZsrwwOLt9OGnonFahwxobG7SQdh3KM+h?=
 =?us-ascii?Q?B8TSHmEeHzpiFZioBfDF4j/kt2aWI0XPVbv03PnUH1+kRnt4CIlT7Bg+KUWo?=
 =?us-ascii?Q?3kYD4/JkXkGcmthuMRC859tFmlPn7QLcpMrq6+NMgGUL/di9VwKTX+0rRAzU?=
 =?us-ascii?Q?yNoEVrcllyJdmIiOjEEpTjzuS11Dsj4U29/I71F8BL/Yukk/fRu6RP4fpcDz?=
 =?us-ascii?Q?+8X7482hErGUZ6wgw6D3afv+EFBwnWMoiKBwroW1ylx09ODEZjktHM70mPtB?=
 =?us-ascii?Q?dQcKwcU2brxqLXOV8NPUDPlimWAsQFFRPf7z009hspCatOAY8ebGf6n/uc3d?=
 =?us-ascii?Q?ucUvp8jmIUB7GgpHjy9ct3e+qWGDIV7KhwLm8eDf3yVvGopZGjh9PK9f9opj?=
 =?us-ascii?Q?+v7u+Kjpe7JOtaDUwejU+cwOYspRYHiTjWXQXH7B8817PZP1rjCQxTrNg1i+?=
 =?us-ascii?Q?ZzfIJYP6OP48yK6RxgL6AbV/kqzRbnZSqH+f7mg3S4zsTpCzzrBl4UF7sM+I?=
 =?us-ascii?Q?wmLVYaGd0vr5dzO4aDuF0hyzrJ/sSSqIm79SuwJzc8CEP7zONjLyelPHAtB7?=
 =?us-ascii?Q?KHkwXR/zTJdEFN43emy3/G7IKp5XP0su91i5RHYRQzLILI+RV75lReoG7sWZ?=
 =?us-ascii?Q?HKmDX1KgH2wM0AsLPNXmpyMnKW6hL+N2pT+UN6GtYJEFogz6ybOXX4QgcaVq?=
 =?us-ascii?Q?C10yO9OroWEKBgtIkE1EG7IgACcS6COrkhlKjKUxE3qynPkUzuf7KR4+9Ps5?=
 =?us-ascii?Q?SHJxVtvKIH0998QWM3qB76iCABpKGtc7vInNe8QY7XXXWBN+qwxVuPPEkn2O?=
 =?us-ascii?Q?0zqdc28dcoFVi1nMj/pxxyoRBpFYZkI0MNJPmxab0UtLgmboDWSncrUPBctq?=
 =?us-ascii?Q?lanBHwW6CKzLqqFWmSEN/qRgcVFvknvjxCKvOp5P/kp9kxYskRnDaR3yBuwL?=
 =?us-ascii?Q?cHLVPSfasIXnglb3a/6GpJHLusHm+1yenkxcbKUZ50ABRpMp7lwUaatUopWJ?=
 =?us-ascii?Q?Toqc+EMjQ5R7trLR7S/+f/xsXTIn1EtmgJcqdMDocR8CnSzzU5unTtMGJbqn?=
 =?us-ascii?Q?OukJA0zplwzyDqxqGRq1iwWYzvOSeXDZwC+0+wDCjX6brjk/GQ5f8jtbh5ml?=
 =?us-ascii?Q?8A9aqliMFnv8EHyPibzDHGSuAYmN/9sN4lP6kGmGeWoiCqKBk6/CvbsKM0g6?=
 =?us-ascii?Q?HvNvzKOTlKWXBY2F4SJebebV4XT9JZg/tTnBjzpVdloGTgKFvYZ9857T98gw?=
 =?us-ascii?Q?nj/D5zvElgv3lG7Qyf0pCZRTF9DopEouRMNWWmWB0iINnUL75cO0m9EPiS7d?=
 =?us-ascii?Q?/yEI9aHZvI8b0qQHxuTQmWyGwWhHAETYh49xAr8e7ULPjvzcE5aYsrJ6bp8K?=
 =?us-ascii?Q?260z6yVMSzRRuqFY2fsNB9qkDYeRyiKwnNmU5xH9t4ISFH77A7UwMU1bfEGi?=
 =?us-ascii?Q?hFhOlOgfmCx7uYxGV/QdqVXO82BVgGBzTaJ0EVJD?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB339738AE4FAC5DE0F688D9548153ABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ccf82c-8bed-46bf-032c-08db671c1b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 05:57:41.8597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntbhZKGGnQleB7tyfy6KgisDsfJ1aJ2cc8Qd795615FhXoMqXt4cJJs+Vbl48tsMn51LlfAoBwrytnF3ysSlhKUt2cRP6d/qfSDtv8iVgWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7875
X-Proofpoint-GUID: LiV7ZpVGjpuQSCvlxoUXFqj7TZedG7VJ
X-Proofpoint-ORIG-GUID: Bpvzzniv0hG3LGSgmfi2NoAJgFkdLZuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_03,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=755 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 05:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182455

--_000_BYAPR11MB339738AE4FAC5DE0F688D9548153ABYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry for the typo/misled with attachment and I have already sent v2 patch =
with kirkstone branch mentioned - [oe-core][kirkstone][PATCH v2 1/1] perl: =
fix CVE-2023-31484<https://lore.kernel.org/openembedded-core/20230606092535=
.767943-1-soumya.sambu@windriver.com/>

Regards,
Soumya

________________________________
From: MacLeod, Randy <Randy.MacLeod@windriver.com>
Sent: Tuesday, June 6, 2023 11:42 PM
To: Sambu, Soumya <Soumya.Sambu@windriver.com>; Richard Purdie <richard.pur=
die@linuxfoundation.org>; openembedded-core@lists.openembedded.org <openemb=
edded-core@lists.openembedded.org>; steve@sakoman.com <steve@sakoman.com>
Cc: Polampalli, Archana <Archana.Polampalli@windriver.com>
Subject: Re: [OE-core] [PATCH] perl: fix CVE-2023-31484

On 2023-06-06 07:38, Soumya via lists.openembedded.org wrote:
This is for kirkstone branch. Attached is the updated patch.



Soumya,


We don't usually take patches as attachments since we
like to see the changes in email easily for review so

unless Steve makes an exception this time, please
resend following the workflow documented here:


   https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


See and read the section mentioning:


   git send-email  ...  --subject-prefix=3D"<BRANCH_NAME>][PATCH"


and the rest of the document and links therein.


../Randy








Regards,
Soumya

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org><mailto:richard.pu=
rdie@linuxfoundation.org>
Sent: Tuesday, June 6, 2023 4:35 PM
To: Sambu, Soumya <Soumya.Sambu@windriver.com><mailto:Soumya.Sambu@windrive=
r.com>; openembedded-core@lists.openembedded.org<mailto:openembedded-core@l=
ists.openembedded.org> <openembedded-core@lists.openembedded.org><mailto:op=
enembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] perl: fix CVE-2023-31484

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 2023-06-05 at 17:46 +0000, Soumya via lists.openembedded.org
wrote:
> CPAN.pm before 2.35 does not verify TLS certificates when downloading
> distributions over HTTPS.
>
> Signed-off-by: Soumya <soumya.sambu@windriver.com><mailto:soumya.sambu@wi=
ndriver.com>
> ---
>  .../perl/files/CVE-2023-31484.patch           | 29 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch

Which release is this patch against?

Cheers,

Richard



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#182426): https://lists.openembedded.org/g/openembedded-=
core/message/182426
Mute This Topic: https://lists.openembedded.org/mt/99345985/3616765
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core+owner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [rand=
y.macleod@windriver.com<mailto:randy.macleod@windriver.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-




--
# Randy MacLeod
# Wind River Linux

--_000_BYAPR11MB339738AE4FAC5DE0F688D9548153ABYAPR11MB3397namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">Sorry for the typo/misled with attachm=
ent and I have already sent v2 patch with kirkstone branch mentioned -&nbsp=
;<a href=3D"https://lore.kernel.org/openembedded-core/20230606092535.767943=
-1-soumya.sambu@windriver.com/" title=3D"https://lore.kernel.org/openembedd=
ed-core/20230606092535.767943-1-soumya.sambu@windriver.com/" data-loopstyle=
=3D"linkonly" id=3D"LPlnk710456">[oe-core][kirkstone][PATCH
 v2 1/1] perl: fix CVE-2023-31484</a></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif; color: rgb(0, 0=
, 0);">Regards,</span><br>
<span style=3D"font-family: Calibri, Helvetica, sans-serif; color: rgb(0, 0=
, 0);">Soumya</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> MacLeod, Randy &lt;Ra=
ndy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> Tuesday, June 6, 2023 11:42 PM<br>
<b>To:</b> Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;; Richard Purdie=
 &lt;richard.purdie@linuxfoundation.org&gt;; openembedded-core@lists.openem=
bedded.org &lt;openembedded-core@lists.openembedded.org&gt;; steve@sakoman.=
com &lt;steve@sakoman.com&gt;<br>
<b>Cc:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] perl: fix CVE-2023-31484</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">On 2023-06-06 07:38, Soumya via lists.open=
embedded.org wrote:<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
This is for kirkstone branch. Attached is the updated patch.<br>
<br>
</div>
</blockquote>
<p><br>
</p>
<p>Soumya,</p>
<p><br>
</p>
<p>We don't usually take patches as attachments since we<br>
like to see the changes in email easily for review so</p>
unless Steve makes an exception this time, please <br>
resend following the workflow documented here:<br>
<br>
<p>&nbsp;&nbsp; <a class=3D"x_moz-txt-link-freetext" href=3D"https://www.op=
enembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a>=
</p>
<p><br>
</p>
<p>See and read the section mentioning:<br>
&nbsp; <br>
</p>
<p>&nbsp;&nbsp; git send-email&nbsp; ...&nbsp; --subject-prefix=3D&quot;&lt=
;BRANCH_NAME&gt;][PATCH&quot;</p>
<p><br>
</p>
<p>and the rest of the document and links therein.</p>
<p><br>
</p>
<p>../Randy</p>
<p><br>
</p>
<p><br>
</p>
<pre>
</pre>
<p></p>
<p><br>
</p>
<p><br>
</p>
<blockquote type=3D"cite">
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
Regards,<br>
Soumya<br>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Richard Purdie
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfou=
ndation.org">
&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
<b>Sent:</b> Tuesday, June 6, 2023 4:35 PM<br>
<b>To:</b> Sambu, Soumya <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailt=
o:Soumya.Sambu@windriver.com">
&lt;Soumya.Sambu@windriver.com&gt;</a>; <a class=3D"x_moz-txt-link-abbrevia=
ted" href=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a> <a class=3D"x_moz-txt-link-rfc=
2396E" href=3D"mailto:openembedded-core@lists.openembedded.org">
&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] perl: fix CVE-2023-31484</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">CAUTION: This email comes from a non Wind River =
email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon, 2023-06-05 at 17:46 +0000, Soumya via lists.openembedded.org<br>
wrote:<br>
&gt; CPAN.pm before 2.35 does not verify TLS certificates when downloading<=
br>
&gt; distributions over HTTPS.<br>
&gt;<br>
&gt; Signed-off-by: Soumya <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mai=
lto:soumya.sambu@windriver.com">
&lt;soumya.sambu@windriver.com&gt;</a><br>
&gt; ---<br>
&gt;&nbsp; .../perl/files/CVE-2023-31484.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 29 +++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-devtools/perl/perl_5.34.1.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 30 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-314=
84.patch<br>
<br>
Which release is this patch against?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
<br>
<fieldset class=3D"x_moz-mime-attachment-header"></fieldset>
<pre class=3D"x_moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-
Links: You receive all messages sent to this group.
View/Reply Online (#182426): <a class=3D"x_moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/182426">https://l=
ists.openembedded.org/g/openembedded-core/message/182426</a>
Mute This Topic: <a class=3D"x_moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/99345985/3616765">https://lists.openembedded.org/mt/99=
345985/3616765</a>
Group Owner: <a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.open=
embedded.org</a>
Unsubscribe: <a class=3D"x_moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/o=
penembedded-core/unsub</a> [<a class=3D"x_moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
</blockquote>
<p><br>
</p>
<pre class=3D"x_moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
</div>
</body>
</html>

--_000_BYAPR11MB339738AE4FAC5DE0F688D9548153ABYAPR11MB3397namp_--

