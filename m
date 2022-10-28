Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F469C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 16:08:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1339.1666973286253303032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 09:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VbbFrQsQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8300e855dc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29SBMTtB028959
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=LFkaETqYYHkHXn1sQuy7eqeXNUMEjumOXGQfRPb3o4o=;
 b=VbbFrQsQ11NhWWtwxW4KRqZAgL+fS0ELgsRmPDICQsgBnP8ziyAreN+h7DbPUjPJfsRU
 G1WZjno7/6Q/vGuYfGpWz0BBlG08iWfB8ViU1Zm29paZOU6rLaOIU0JQy0lsnXxsEg60
 qyrqW/lKWHZvSrqJk+Vv5pgWjfnanOFfrtLmHCxNCLu+iyrEUV89Pl/YinG30r1LgoQ5
 4gogugCRMrQnEGezPkZ62t7pHL4zPUjzORNHccRUACmm4HCLIzQe9wZe0Tf/NWARmNXC
 xPmJFAAZeRCSCflbYz531oZjYtJpIVHuAE4wEd+bu15c7MWWFAGZFtg9qLQXyYzpF4Yw QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56hk0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:08:05 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SG84G5022439
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:08:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56hk0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 16:08:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoH3oK5svvwCViF6dzRcwp9xhVxYfMV6BRlNnQEyFJq+3ASWOc6/tyQ4sBp9y1nIWyIzkh7yT0OnIZ7GVIQi4gUotoVj+UOX4g323VL0LaRDgv9KnhvNSLhA6RFssaWvWLRo4ncIMQfT9lJPOKB7we4no7kUzSk6iARQYh7rIrsZnRIU0CnxyGTvfvRdQ8AvXmbrAqryHSm9seHv9VHzCjqnAGgvUot0/yQaDowSyN7uNyzUErHXAkkmKafdkliJmiQLD1u3/d686zg1P+97J030cbdWl97g01L/w6Aea5cbbUgO2C8R/zHEIJ7JtEY260XBbIlOHOf/VpljOs0OLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFkaETqYYHkHXn1sQuy7eqeXNUMEjumOXGQfRPb3o4o=;
 b=W24kDS0nxeBDWUayAX6SHRgSweY+QGjTFrAyFcWkXTbu6nIZqn5dPGJJAssyY59Tz3x7OrfZo0awDPPYoSRTpkfmGfQB/ZrM5eXvMDf/5RRNyVC6U8QlmIFqstTNOm1fpqvoNGQKAgufwuQQMSFs7VBBM606HSgt2k/hS2UvrHIxiPGnFzmYxZ1stYG/RFuWSHWoZ+EQb2C0qnDjwDVB8EzkoS+6dLFji8QAhS1GsrPl1spehttUPiifGCSypKB3A3cZ10Xw5x0oY1+0Us1zH9bnDjwqFa/UFWe7hi3wxhkkyq16JHuYrL3EIaFbX/fRwbNjiXF7H8zFPY+5eq+iiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 16:08:00 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9%5]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 16:08:00 +0000
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
Subject: Re: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Topic: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Index: AQHY6uW1vT/KaIwsjkyLfX/7li2C264j9rsAgAAAYMo=
Date: Fri, 28 Oct 2022 16:08:00 +0000
Message-ID: 
 <DM4PR11MB555097F6252E7B857E5A90EBE4329@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221028155331.1594577-1-narpat.mali@windriver.com>
 <B23AF8E8-1CBA-49E5-90C7-404C1B9F322B@arm.com>
In-Reply-To: <B23AF8E8-1CBA-49E5-90C7-404C1B9F322B@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|MW3PR11MB4748:EE_
x-ms-office365-filtering-correlation-id: 5d1266df-eb7f-4da4-2408-08dab8fe962b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GPgPEy9YYX1e4hbE/kxPj557L5PLT5bi8lMP2wMokFJWluwTWcKR9zOoWGF7t0Ap2i+yRq0cF5inmKA/87W8YHd506g6ojU/FHDsa+paqMy/b7fpTSZzRF/Ni2wYycsmB/f+E4XXZsx2P2wSw3wcZ5CXZlVVBQ5LxMRzjchVmrj7M0E1tLJ2QZ41kg3ID/+PegUBSYJx6XxkYIcO6vNalZs3Pfg6QJptM2P3iW+vlIjAF0cNDCpUjqDrZVlq8UqvBCF6MqkTmGw2RlQw2QyGm9Ob5c32Kd6Ju+woP7+HPgfSNOC05brBFjmO1HEuR2cKIe5Q/IlZNLNo3FiYJN1xRmloxSmvEaI1DFj1MDw2RAnFLRmOfV0RsH+vCKrkVQBuCPXL19bsjT22Sn3hFgTdyygsFZtv7hJTOKw3bQmDxmJ8Gcczwut9nDXK995pYXzrfMyQ2WBczB62lmueZ9fIDzAU7a46QvKlESG085Ll7F+nFopkn4/EYxo716u3TX9Z+Q4HGToZ5EH/PeIoxng2cbObRsbQQ+fmFXYoAcoOpxbKIWEQFPRw3+NTmiP+al7REkdPR4CnbesNmRrb3K+1VHDA+hkhttnXctDlp+392UZwWVKtbjSZGkgtWATAKt6Zdm7RoTwTT5OD7LW7B5Xs4vzOTjdCD5oD/h9IWUxiMwZHgBvneU1Z4jPj1r1TfwobUirGc4fWSq3FNRZ+KgYlHE8ZbTzEfsomtwhajIyYqe2lMcy4UaXaP3HnfYdbFQcqBreZkh9PsuCXKQ6Xq9brJ0LB/h3bE6bfT3qK4qCNricv7RraNlB07ugvcvy/mDfKY+qJ9wl53Es8jq1IF413cjJj3BwQOG672LKFoLwA7UIr+eMp1Lnp7S1QzvrEMGZs
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(376002)(136003)(346002)(366004)(451199015)(83380400001)(122000001)(21615005)(8676002)(186003)(2906002)(18265965005)(15650500001)(38070700005)(71200400001)(66446008)(64756008)(66556008)(66476007)(86362001)(4326008)(9686003)(38100700002)(6506007)(166002)(66946007)(76116006)(53546011)(33656002)(7696005)(52536014)(5660300002)(316002)(8936002)(91956017)(41300700001)(54906003)(6916009)(966005)(478600001)(55016003)(19627405001)(66899015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?Balrqe98ytrFv0RcrJ/ByQbrGoa03bjnzWQ6n1dabYzj04qq8pNHHu3b?=
 =?Windows-1252?Q?oJOecvdxf7ry1atWRWSDgdl8p9No7UeZ4jtyx133uNoDdJNpkuH0fUeS?=
 =?Windows-1252?Q?32QCBkrJh+8LwVLpsZIlU0QKef+TyiJEs9yLYyKyWB6LAMU1UuNGWFtQ?=
 =?Windows-1252?Q?6f8mEBJo8Xq4XsaGXNfU6YO17xrmoAZGwteVQyzF6N3fIlBTdkXyGDy5?=
 =?Windows-1252?Q?u5XgRgAPFMy4jOVUM7ouhCO7Y7zioFZgz7qwd6w1hFHjEARMSmCJDBWd?=
 =?Windows-1252?Q?F3r3AeFKCjezh5ur3wgniH0CAAJIPvrbYjcFJm36zjQHiqOdSTFV8rDX?=
 =?Windows-1252?Q?YLva3F63xessN7/jzMTY+xvI6B+rgO5cEmuE+ZT1pNMXTMp+5gRKxo8y?=
 =?Windows-1252?Q?P/tclpg7Dr1oZIFC5GTjr82yLU3iilxRSAUDdNK1C+zW8t2XwlfNwbb1?=
 =?Windows-1252?Q?LG0/a/cv5UerCbrD/75n2f77RINTlcxyWHHach21wpjkN6gBQHQv3yv9?=
 =?Windows-1252?Q?7ehCr1dJqA2b6tTsSnvEEEZUtgMhG0J4EuHBVlS01NgH+PjUGeI0m6ul?=
 =?Windows-1252?Q?BB4J9LZrw980lN0g4EfQjpT4iGxINQitGTKgjjYNcq6cIxxo+7c0z+Cz?=
 =?Windows-1252?Q?eM5uekVYeS5B1DqSPkR60EX7iE0+TJHnIZqCPkEB2qQLbDhtsnDZ8iui?=
 =?Windows-1252?Q?iIHaRmr+MzxPd2tVtv82GtntIh2usDdvCleUEAjhB/5/FYfUdwCQjSJR?=
 =?Windows-1252?Q?cSPnFh/fJVjNUQBPEI0yOBqA/D7Lvv30kLc8CuEwaBf0hxfLfu6Hpk+X?=
 =?Windows-1252?Q?NAndpwv/X3G4Me++dGjfRtjeySC/Wk7AmcHHaJVV4qlK7OcVUUTTGuXA?=
 =?Windows-1252?Q?O5tMdPuucE+XsOvX3J0tuli/bFYLfxPJNOpiNHEoYOjX3ezys0T+StKY?=
 =?Windows-1252?Q?/vOMsp2SQx1GPiPYZHlpDE1cRr/e/c/ruc6VEWiqRC1fzlbP1u9EBGoB?=
 =?Windows-1252?Q?xQGedEO6p+MgpXHHLNE/VWR0d1IyhWCfDQ2GxwUe58KgN59+7ylykyDr?=
 =?Windows-1252?Q?qea9unst8HYrhpLDGKmhBtOWrAyF6bQNp5KNNaImzesVNuqyrjB9aR6s?=
 =?Windows-1252?Q?hV1gvgJf4CoW5ZXx4iESTrwUFeCpS3YCbVrF/4G2rbkHrAb4TU4y8bup?=
 =?Windows-1252?Q?TfC0dW74ui4rGG3X0UmnR1E4mlo3mnxvOOVP2Y0GkJfrFwVvEUcKiSNJ?=
 =?Windows-1252?Q?9gNuqmfRLDEms+n3gYebAxo/k4rDJMo/SC2wsHifHQM5dj1BubNLh350?=
 =?Windows-1252?Q?HqrllRMoG275sDWMKnwHNqh3Ume9JqKtaEsM5yaX+GlN/7JymhlsJvJj?=
 =?Windows-1252?Q?kHaSc3o/dnY802e6AwpZEQPqEd81bBxmsqCrqp83OHv8NGyL++CRLXq9?=
 =?Windows-1252?Q?3R1xtQXya8InHz+L9JU2qzKfL0PnFJXGWYjauu9SUM3Gq2V8yT84TVd5?=
 =?Windows-1252?Q?mSyMjaTPGaCAsg1jfNlEXTjfOoA6Voms8e2scaIlilN6jetpPdRGqMIf?=
 =?Windows-1252?Q?5NTkP5TjujVixmqARgWLPFZQTNVFWWwXwutSQ5ldPiCLPpkEVEoP8LHV?=
 =?Windows-1252?Q?uGCG6vs0ucFz7KIsG6DRNp8XWoQazC/qn0NLraXfWsKbAcyfpXv1oAxC?=
 =?Windows-1252?Q?j5FRg9pLhILbSY70miSlCJ3pVHrn9FKwYdBOB5ZJj4W6TRTbKALf8Y6P?=
 =?Windows-1252?Q?4wkWd+jalo4MoWlF6LpDUmNkVthN3Io1Sw7PtUDU7m0oMJvCQ6PIu6YI?=
 =?Windows-1252?Q?8D2ACA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB555097F6252E7B857E5A90EBE4329DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1266df-eb7f-4da4-2408-08dab8fe962b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 16:08:00.6491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exFNzO/Ljylu3OzLGAdvif8spvNgIuRsuI3jztw1tQwsFX+jBW2DtKOiTI2wOR5l9kKQCmeXX610BZ9Lem48njsq0t3tU1ryb0JVj4PZtLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
X-Proofpoint-GUID: 72qhzcLeKniclC--5ugj6oDYcxnDe-57
X-Proofpoint-ORIG-GUID: 7_9Nmzm5WkWh0CdixbUUawT4lwPbqsHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172264

--_000_DM4PR11MB555097F6252E7B857E5A90EBE4329DM4PR11MB5550namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

This latest version of wayland 1.21.0 has the fix for "CVE-2021-3782" and i=
n master branch, it has already been upgraded to latest 1.21.0 version.
Our product is based on "kirkstone" branch and in "kirkstone" branch, it is=
 still with 1.20.0 version due to which "CVE-2021-3782" is vulnerable.

Best Regards,
Narpat Mali
________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Friday, October 28, 2022 9:29 PM
To: Mali, Narpat <Narpat.Mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Polampalli, Archana <Archana.Polampalli@windriver.com>; G Pil=
lai, Hari <Hari.GPillai@windriver.com>; Alexander Kanavin <alex@linutronix.=
de>; Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21=
.0

[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrades are not usually taken into the stable branches unless there=92s a =
good reason. What=92s the rationale for this upgrade?

Ross

> On 28 Oct 2022, at 16:53, Narpat Mali via lists.openembedded.org <narpat.=
mali=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Drop the patch, as it is no longer necessary
> (genereated .pc defines everything as relative to the .pc path).
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Upstream master commit:
> https://git.openembedded.org/openembedded-core/commit/?id=3De525db4eb9556=
979c67f6a908f6646363154cd06
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
> ...hardcode-the-path-to-wayland-scanner.patch | 27 -------------------
> .../{wayland_1.20.0.bb =3D> wayland_1.21.0.bb}  |  3 +--
> 2 files changed, 1 insertion(+), 29 deletions(-)
> delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-hard=
code-the-path-to-wayland-scanner.patch
> rename meta/recipes-graphics/wayland/{wayland_1.20.0.bb =3D> wayland_1.21=
.0.bb} (93%)
>
> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-t=
he-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/00=
02-Do-not-hardcode-the-path-to-wayland-scanner.patch
> deleted file mode 100644
> index e3e71925b8..0000000000
> --- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path=
-to-wayland-scanner.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 3e7cd56611aeec274e48a4816bc7c21f74f15be0 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 17 Feb 2020 21:46:18 +0100
> -Subject: [PATCH] Do not hardcode the path to wayland-scanner
> -
> -This results in host contamination during builds.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - src/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/meson.build b/src/meson.build
> -index 15730a3..61edbc8 100644
> ---- a/src/meson.build
> -+++ b/src/meson.build
> -@@ -52,7 +52,7 @@ if get_option('scanner')
> -                     'datarootdir=3D' + join_paths('${prefix}', get_opti=
on('datadir')),
> -                     'pkgdatadir=3D' + join_paths('${datarootdir}', meso=
n.project_name()),
> -                     'bindir=3D' + join_paths('${prefix}', get_option('b=
indir')),
> --                    'wayland_scanner=3D${bindir}/wayland-scanner'
> -+                    'wayland_scanner=3Dwayland-scanner'
> -             ],
> -             filebase: 'wayland-scanner'
> -     )
> diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.21.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/wayland/wayland_1.20.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.21.0.bb
> index dd48a29dc4..2092deac92 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
> @@ -14,10 +14,9 @@ DEPENDS =3D "expat libffi wayland-native"
>
> SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz=
 \
>            file://run-ptest \
> -           file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch=
 \
>            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>            "
> -SRC_URI[sha256sum] =3D "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82=
274f6ec5d7cd8725"
> +SRC_URI[sha256sum] =3D "6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d465=
6285bb9594ef11ac"
>
> UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
> UPSTREAM_CHECK_REGEX =3D "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172262): https://lists.openembedded.org/g/openembedde=
d-core/message/172262
> Mute This Topic: https://lists.openembedded.org/mt/94629704/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_DM4PR11MB555097F6252E7B857E5A90EBE4329DM4PR11MB5550namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Ross,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
This latest version of wayland 1.21.0 has the fix for &quot;CVE-2021-3782&q=
uot; and in master branch, it has already been upgraded to latest 1.21.0 ve=
rsion.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Our product is based on &quot;kirkstone&quot; branch and in &quot;kirkstone=
&quot; branch, it is still with 1.20.0 version due to which &quot;<span sty=
le=3D"background-color:rgb(255, 255, 255);display:inline !important" class=
=3D"ContentPasted0">CVE-2021-3782&quot; is vulnerable.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Narpat Mali</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Friday, October 28, 2022 9:29 PM<br>
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
Upgrades are not usually taken into the stable branches unless there=92s a =
good reason. What=92s the rationale for this upgrade?<br>
<br>
Ross<br>
<br>
&gt; On 28 Oct 2022, at 16:53, Narpat Mali via lists.openembedded.org &lt;n=
arpat.mali=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; Drop the patch, as it is no longer necessary<br>
&gt; (genereated .pc defines everything as relative to the .pc path).<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;alex@linutronix.de&gt;<br>
&gt; Signed-off-by: Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;=
<br>
&gt;<br>
&gt; Upstream master commit:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3De525db4eb9556979c67f6a908f6646363154cd06">
https://git.openembedded.org/openembedded-core/commit/?id=3De525db4eb955697=
9c67f6a908f6646363154cd06</a><br>
&gt;<br>
&gt; Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
&gt; ---<br>
&gt; ...hardcode-the-path-to-wayland-scanner.patch | 27 -------------------=
<br>
&gt; .../{wayland_1.20.0.bb =3D&gt; wayland_1.21.0.bb}&nbsp; |&nbsp; 3 +--<=
br>
&gt; 2 files changed, 1 insertion(+), 29 deletions(-)<br>
&gt; delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-h=
ardcode-the-path-to-wayland-scanner.patch<br>
&gt; rename meta/recipes-graphics/wayland/{wayland_1.20.0.bb =3D&gt; waylan=
d_1.21.0.bb} (93%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcod=
e-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland=
/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e3e71925b8..0000000000<br>
&gt; --- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-p=
ath-to-wayland-scanner.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -From 3e7cd56611aeec274e48a4816bc7c21f74f15be0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; -Date: Mon, 17 Feb 2020 21:46:18 +0100<br>
&gt; -Subject: [PATCH] Do not hardcode the path to wayland-scanner<br>
&gt; -<br>
&gt; -This results in host contamination during builds.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - src/meson.build | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/meson.build b/src/meson.build<br>
&gt; -index 15730a3..61edbc8 100644<br>
&gt; ---- a/src/meson.build<br>
&gt; -+++ b/src/meson.build<br>
&gt; -@@ -52,7 +52,7 @@ if get_option('scanner')<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'datarootdir=3D' + join=
_paths('${prefix}', get_option('datadir')),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'pkgdatadir=3D' + join_=
paths('${datarootdir}', meson.project_name()),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'bindir=3D' + join_path=
s('${prefix}', get_option('bindir')),<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'wayland_scanner=3D${bindir}=
/wayland-scanner'<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'wayland_scanner=3Dwayland-s=
canner'<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; filebase: 'wayland-scanner'<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/re=
cipes-graphics/wayland/wayland_1.21.0.bb<br>
&gt; similarity index 93%<br>
&gt; rename from meta/recipes-graphics/wayland/wayland_1.20.0.bb<br>
&gt; rename to meta/recipes-graphics/wayland/wayland_1.21.0.bb<br>
&gt; index dd48a29dc4..2092deac92 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb<br>
&gt; +++ b/meta/recipes-graphics/wayland/wayland_1.21.0.bb<br>
&gt; @@ -14,10 +14,9 @@ DEPENDS =3D &quot;expat libffi wayland-native&quot;=
<br>
&gt;<br>
&gt; SRC_URI =3D &quot;<a href=3D""></a>https://wayland.freedesktop.org/rel=
eases/${BPN}-${PV}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a h=
ref=3D"file://run-ptest">file://run-ptest</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch">
file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a h=
ref=3D"file://0001-build-Fix-strndup-detection-on-MinGW.patch">file://0001-=
build-Fix-strndup-detection-on-MinGW.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quo=
t;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;b8a034154c7059772e0fdbd27dbfcda6c732df29=
cae56a82274f6ec5d7cd8725&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;6dc64d7fc16837a693a51cfdb2e568db538bfdc9=
f457d4656285bb9594ef11ac&quot;<br>
&gt;<br>
&gt; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://wayland.freedesktop.or=
g/releases.html">https://wayland.freedesktop.org/releases.html</a>&quot;<br=
>
&gt; UPSTREAM_CHECK_REGEX =3D &quot;wayland-(?P&lt;pver&gt;\d+\.\d+\.(?!9\d=
+)\d+)&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#172262): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/172262">
https://lists.openembedded.org/g/openembedded-core/message/172262</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94629704=
/6875888">https://lists.openembedded.org/mt/94629704/6875888</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [ross.burton@a=
rm.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB555097F6252E7B857E5A90EBE4329DM4PR11MB5550namp_--

