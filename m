Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21612C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 07:58:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3556.1710230300040057227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 00:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BPmOZAbE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3801017dec=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C6WBpo020050
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 00:58:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=cHIVuhkLO+dVV7G4fS
	7I9RRGWvHAon/GbJAtiwOXzao=; b=BPmOZAbEoiYrUGDqcOuE60S/x0dTWeHcAU
	Wi2zF5KSnPjkHoj2o35SVnLi+ngaIb6eKjzBHIznJ+F43N/XGfk1X72AIi8gTxO+
	7LzI4O3T28mM9poKIedidQAaYxxUSQ9UHn1gcjZFHigh7CGbCE7WFT4PhZt6KMsw
	nBM5qBRu+1mbTPm+gAUpem7lWtNM6xVNxSQusKvBLRtk+n/x/5+Fpw03F5ttSpK9
	GsIqgXee2J7LbAWf3Uy2uHBx3j4YP9kX4srgJ/ewq7w/3XT+0nZ8bSd4EmlDeRLB
	rmLx/Qq9rcZeyP5adyux0dbPRUlx5SUcPSf5e70EcUaDFg5/PCNg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrkx4aaba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 00:58:19 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42C7wIHu009060;
	Tue, 12 Mar 2024 00:58:18 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrkx4aab9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 00:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqBeaiIFg9lD3FIb/CsqBd6YwhXP/7r6nls+hO3eedPEVLKqwCBJcqdR2g60teF8RVRmHHQl+JWeSvyc/TGQODJIfTY/kaJG6cpEqHSXl0GeyUyorwE43Yx+A7uD0Ylp9FkqEPEczhtATvN/Yks6FSiN9+liBQr9mfaBUvOdkvUME/yA3dBk5iaTXLusut6JipsTmeQ/XWJHB2xK8EAhbr4ecGT59wY7h3axhCNkngyXv8Ue0/yoL/PVLS1NenDQE0cPcS5KCMNxuwhCindXbPbqa+7PDE90ZWQGMsR7En6V3tgBz7+0GQuyHHzcm5nT/RlfCo6+/SYgDz9gLB25Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHIVuhkLO+dVV7G4fS7I9RRGWvHAon/GbJAtiwOXzao=;
 b=AU+Kch1RgRYr5E9xYRwE+ambwIdz3sTAJvKA2pgyDYB8hAtRHsYeIdWdw0EqXKBhkxa/MSWPAADumLMeeNiK5Ouu10JeFal/rWQPFf02+vCbyHsFUoJ2AWLKdFsr41atQLGCoqJZ9suP7UEhnoLIBalab4XA3OfzE8fg4fIrdz6WGVGD2ktHTk6vKlDwYPp/9CYS3c89dQW+QBF4fMYAdjjb3DSQojvnyU53E8BLWlE8FXFpQ5t3BsqViTJRbCKc1cfVd9gr2G1Mz1FYkOBjQtPF12Pxp6TnxT59Avm/dSteb4ho7MrOrJITIsULdalvh66qofHm1/RIOqGYndzkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 by CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 07:58:15 +0000
Received: from BY1PR11MB8005.namprd11.prod.outlook.com
 ([fe80::145d:b485:ef6e:8fc5]) by BY1PR11MB8005.namprd11.prod.outlook.com
 ([fe80::145d:b485:ef6e:8fc5%3]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 07:58:14 +0000
From: "Gupta, Meenali" <Meenali.Gupta@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-52426
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-52426
Thread-Index: AQHacOzN+lS++Yp/q0+kK5Y2TdX5GLEx4I4AgAHiz0Q=
Date: Tue, 12 Mar 2024 07:58:14 +0000
Message-ID: 
 <BY1PR11MB800540D49D0C29C3ADE8794BE52B2@BY1PR11MB8005.namprd11.prod.outlook.com>
References: <20240308000807.1078261-1-meenali.gupta@windriver.com>
 <61c8e841e7ddb19af71838d171967220977867c9.camel@intel.com>
In-Reply-To: <61c8e841e7ddb19af71838d171967220977867c9.camel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8005:EE_|CY8PR11MB7873:EE_
x-ms-office365-filtering-correlation-id: 107ccb2e-f5cb-4e12-a267-08dc426a2bc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5skv4ClnOr7NMO+ci8nMjHneX6IaHE5pvbXm3T1tYzYTsag+4XlH4yTHe9qBLu6HBblFmB0AJF7jw8swJ0Vs0Mg0huN8M//lE8rw//Jm8b1R8OCWxkVh5ZWNNGilEbgjAOUGT4zxTyMVMqUF4Vu+K3rWR1mQTXJ6AbyfGZf1FyFPnndE3b6KgkLuZcQTbT/echiHkGuETXiHH7bF2ID0d+uQrOwoRzX2wtEfST2AmNM1KRLX4kBo9kNsKeYQa67bwLnwGlQFbo4MGpmx0eYQhypJ+ik2hR39URxz1UstJiY/YN60yjzaSopf5ifFUnKj0BKMO4+0LRENcteyejJcqwyjFunBo9Hd3du1Gg4/m2Zc9hyltemI0ekVFNCwYs6SQ5QWe7aJobYnbOgSIevQ3ZNOk5LvZ3Lbu4olVH1sg3WN7KmfwuOOnUz2p/hwDQdLt7VdRM5rPfSIDzJxXx/p57zDnRXJbHxh3JyiFAh1swvkZg1B3CRnGPpXYmYT5a5/6eTsyWtAsZeT42725srs0mHdzAveZJOmIp19uNHP0YtNOdQFL0oMKa2DTJ3eACIkTt898feD7onCOWJI1HoyhORMl8juQj41hYkf9EH3DM03Ak1gabBiaZ+T5nHMbQIq8HnWUqLhW8Nyt9dpq9xXd+Ke2wViKZfosjRWmFAgpgk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+V5OuyyHvCAEqznObebKBAjKcb5CEgdUHcwbbVUngbTzkB+jEj4BOnzOipQb?=
 =?us-ascii?Q?H2NXaYN/d1FN6F9ACq5UWxSBxzj0NetO/RIepvUmEHxscxUX0qSe/izVJKn/?=
 =?us-ascii?Q?T0BPvoz936OnCTaW73rMUiNczeJThsIdZcceUSJl7YkAMYLBCoFCCTqEn2M3?=
 =?us-ascii?Q?OJfSqCiYgj0r3oYR4rCLDWYRLfAz9mNFHeSIrxbwyHrnMcLTVFwbIfU9xBP5?=
 =?us-ascii?Q?7yayT3sn8gWmv/lduXljjV5PYPBdxmVQKPtlMMbS6yt62lgreSzeXnrKuusA?=
 =?us-ascii?Q?laRthIdwpGz6A6Zm8HpuwN3mtk2BlBWhdFg8+p3ZrQ4bvWLj3dQPcLC6wb7N?=
 =?us-ascii?Q?1t4xZV8Gv6ammdflMtn04Wnen4JhccbFF6l+NNzhHWT7mSPN6xV2vGZV5qWx?=
 =?us-ascii?Q?wDUqVydhYe+x/m9xifaGS7BraiVWdc5kIcN3aI0AgrDuz1WHXWjI4WOdrPIX?=
 =?us-ascii?Q?H44gmzUEH+64gq10KOBnJQNAMZreu/F4ilsHwyRslBVP7NAY3xHB/vxdJWOC?=
 =?us-ascii?Q?gGJeTbFg+0IJ+fV0wODCtp4U7WuxHrSfEdbn7c/fCYS/jZzMXQm0qN7wz1qK?=
 =?us-ascii?Q?/3ECa/V7xmRrsHLlRxDpahrtuB5GPPjDwOSgBhscjyXP2hZuJQYhevbiB3t4?=
 =?us-ascii?Q?QiSQpmmT9fOr5kfnjZEE9bPMQMAyggUgmrCfB2P3H2VknK5W+IWMEQWj6iZk?=
 =?us-ascii?Q?Xe07PRJ4uf6hqUQUKrp5/aHlN/mhYkDygbc+pP9tHDWDkwSQ28Hq2PxdCnxG?=
 =?us-ascii?Q?AMsTqIahBInGVZYjmhK13vuwsySw5aLBgZAy3/CL8XaBb7y/2Nw+zhgmE8T5?=
 =?us-ascii?Q?Fm7eeh/rHORgjUEFj98vPk0rErmcAE/U1rEfI23XQDprb7Uh/+pIEIqeBwqJ?=
 =?us-ascii?Q?k6xck3BYAMZIhUSqETalkdvupCaz/Nu6Dvz9IPRSJ9ZNP4FUngfjseSElA/5?=
 =?us-ascii?Q?pNTIPPJrAPZK0jH3f/ExhyKIWL2dcZcx8DLyzq4P/WeZvHJDSIkqshs6qnHw?=
 =?us-ascii?Q?qthr2hR49YevmvW3cGzNL1Ime/1DOd4smAYyOF356L85APQ7FshCcln53S6x?=
 =?us-ascii?Q?wijqlj+2bk5fRIKs3jHumWlycAv8tv+v+dQgtWH3reaUn8J8nMQxWr2e4A+2?=
 =?us-ascii?Q?IVzxJ60zchbNsUwSfPwlNCprpksiZ0pG8a0HGbD3XncpIopHNkZjgZfBIV2N?=
 =?us-ascii?Q?BXgbB3MSo+nUMqijeDgmTN00IMZDUIkqm2EP4NMamBbkFkEcXNR5IEosiAPe?=
 =?us-ascii?Q?ghhY6I5R54DrY3gR6pIB3DNGXthUpBHVCvYzWNayiX1l26vqq2262H+EjXJC?=
 =?us-ascii?Q?cx7yrUeKDndssoUj2F2SvOCRka93lcI36dkZvMEZVToH1YJal04ei5O71IFw?=
 =?us-ascii?Q?y2mnDnWvpgGELzXf89oj64wTeQU9V6JP/OC5am3d0+3Zp9WqFEzOa7KQwGMy?=
 =?us-ascii?Q?vFXhcB636QV7gHjUAoc4dNW85nLadBB1wTmhdq5zHyw4pLOG+mypRPo2kz+T?=
 =?us-ascii?Q?Jstmj3TzmIeWgeECIcxpKgw2P48emdclh5K6gz5SxjLGs4JlAXh4OxGPzyFt?=
 =?us-ascii?Q?6QsYfB4fcoa1+X7DW+07fEIzwhf4XRAobwSat3Yk?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB800540D49D0C29C3ADE8794BE52B2BY1PR11MB8005namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107ccb2e-f5cb-4e12-a267-08dc426a2bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 07:58:14.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKV1fjbFmkyr3+JdBbk1zQ+HP/MlJhgeFIkPr5Tt3ly0HSLvlK4SI7/XuTKenj7Oaxq0GhM6RDRAdSHx9HkRUtiV2kZsTXP4p8nB8eZzr10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
X-Proofpoint-GUID: ksmFb2Nb6WmVpOSYbuAK5pLLGcM3iXWa
X-Proofpoint-ORIG-GUID: DBRb5gfBWXP1MmmEOdwlaBMgGg3p2QYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_06,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 07:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196973

--_000_BY1PR11MB800540D49D0C29C3ADE8794BE52B2BY1PR11MB8005namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

I have sent the upgrade to 2.6.0 , it includes the complete security fix fo=
r CVE-2023-52426 and CVE-2023-52425.

Regards
Meenali
________________________________
From: Mittal, Anuj <anuj.mittal@intel.com>
Sent: 11 March 2024 08:37
To: Gupta, Meenali <Meenali.Gupta@windriver.com>; openembedded-core@lists.o=
penembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-52426

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2024-03-07 at 16:08 -0800, Meenali Gupta via
lists.openembedded.org wrote:
> From: Meenali Gupta <meenali.gupta@windriver.com>
>
> A flaw was found in Expat (libexpat). If XML_DTD is undefined at
> compile time, a recursive XML Entity
> Expansion condition can be triggered. This issue may lead to a
> condition where data is expanded exponentially,
> which will quickly consume system resources and cause a denial of
> service.
>
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ---
>  .../expat/expat/CVE-2023-52426.patch          | 429
> ++++++++++++++++++
>  meta/recipes-core/expat/expat_2.5.0.bb        |   1 +
>  2 files changed, 430 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2023-
> 52426.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426.patch
> b/meta/recipes-core/expat/expat/CVE-2023-52426.patch
> new file mode 100644
> index 0000000000..b78a8ee0dc
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2023-52426.patch
> @@ -0,0 +1,429 @@
> +From 0f075ec8ecb5e43f8fdca5182f8cca4703da0404 Mon Sep 17 00:00:00
> 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Thu, 26 Oct 2023 00:43:22 +0200
> +Subject: [PATCH] lib|xmlwf|cmake: Extend scope of billion laughs
> attack
> + protection
> +
> +.. from "defined(XML_DTD)" to "defined(XML_DTD) || XML_GE=3D=3D1".
> +
> +CVE: CVE-2023-52426
> +Upstream-Status: Backport
> [https://github.com/libexpat/libexpat/commit/0f075ec8ecb5e43f8fdca518
> 2f8cca4703da0404]

The PR that this commit is part of includes other commits as well. Is
there any reason why only this is included or required?

I didn't check in detail but as an example, it seems this commit uses
EXPAT_GE which was introduced in an earlier commit in that PR:

https://github.com/libexpat/libexpat/pull/777/commits/daa89e42c005cc7f4f7af=
9eee271ae0723d30300

So, is this supposed to work as intended?

Thanks,

Anuj

> +
> +Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> +---
> + CMakeLists.txt         |  8 ++++-
> + lib/expat.h            |  8 +++--
> + lib/internal.h         |  2 +-
> + lib/libexpat.def.cmake |  4 +--
> + lib/xmlparse.c         | 71 ++++++++++++++++++++++-----------------
> ---
> + xmlwf/xmlwf.c          | 18 ++++++-----
> + 6 files changed, 62 insertions(+), 49 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 2b4c13c..183c5c2 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -381,7 +381,13 @@ if(EXPAT_SHARED_LIBS)
> +             endif()
> +         endmacro()
> +
> +-        _expat_def_file_toggle(EXPAT_DTD _EXPAT_COMMENT_DTD)
> ++    if(EXPAT_DTD OR EXPAT_GE)
> ++            set(_EXPAT_DTD_OR_GE TRUE)
> ++        else()
> ++            set(_EXPAT_DTD_OR_GE FALSE)
> ++        endif()
> ++
> ++        _expat_def_file_toggle(_EXPAT_DTD_OR_GE
> _EXPAT_COMMENT_DTD_OR_GE)
> +         _expat_def_file_toggle(EXPAT_ATTR_INFO
> _EXPAT_COMMENT_ATTR_INFO)
> +
> +
> configure_file("${CMAKE_CURRENT_SOURCE_DIR}/lib/libexpat.def.cmake"
> "${CMAKE_CURRENT_BINARY_DIR}/lib/libexpat.def")
> +diff --git a/lib/expat.h b/lib/expat.h
> +index 1c83563..33c94af 100644
> +--- a/lib/expat.h
> ++++ b/lib/expat.h
> +@@ -1038,13 +1038,15 @@ typedef struct {
> + XMLPARSEAPI(const XML_Feature *)
> + XML_GetFeatureList(void);
> +
> +-#ifdef XML_DTD
> +-/* Added in Expat 2.4.0. */
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> ++/* Added in Expat 2.4.0 for XML_DTD defined and
> ++ * added in Expat 2.6.0 for XML_GE =3D=3D 1. */
> + XMLPARSEAPI(XML_Bool)
> + XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> +     XML_Parser parser, float maximumAmplificationFactor);
> +
> +-/* Added in Expat 2.4.0. */
> ++/* Added in Expat 2.4.0 for XML_DTD defined and
> ++ * added in Expat 2.6.0 for XML_GE =3D=3D 1. */
> + XMLPARSEAPI(XML_Bool)
> + XML_SetBillionLaughsAttackProtectionActivationThreshold(
> +     XML_Parser parser, unsigned long long
> activationThresholdBytes);
> +diff --git a/lib/internal.h b/lib/internal.h
> +index e09f533..1851925 100644
> +--- a/lib/internal.h
> ++++ b/lib/internal.h
> +@@ -154,7 +154,7 @@ extern "C" {
> + void _INTERNAL_trim_to_complete_utf8_characters(const char *from,
> +                                                 const char
> **fromLimRef);
> +
> +-#if defined(XML_DTD)
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> + unsigned long long testingAccountingGetCountBytesDirect(XML_Parser
> parser);
> + unsigned long long
> testingAccountingGetCountBytesIndirect(XML_Parser parser);
> + const char *unsignedCharToPrintable(unsigned char c);
> +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
> +index cf434a2..61a4f00 100644
> +--- a/lib/libexpat.def.cmake
> ++++ b/lib/libexpat.def.cmake
> +@@ -75,5 +75,5 @@ EXPORTS
> +   XML_SetHashSalt @67
> + ; internal @68 removed with version 2.3.1
> + ; added with version 2.4.0
> +-@_EXPAT_COMMENT_DTD@
> XML_SetBillionLaughsAttackProtectionActivationThreshold @69
> +-@_EXPAT_COMMENT_DTD@
> XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
> ++@_EXPAT_COMMENT_DTD_OR_GE@
> XML_SetBillionLaughsAttackProtectionActivationThreshold @69
> ++@_EXPAT_COMMENT_DTD_OR_GE@
> XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index b6c2eca..e23441e 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -408,7 +408,7 @@ enum XML_Account {
> +   XML_ACCOUNT_NONE              /* i.e. do not account, was
> accounted already */
> + };
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> + typedef unsigned long long XmlBigCount;
> + typedef struct accounting {
> +   XmlBigCount countBytesDirect;
> +@@ -424,7 +424,7 @@ typedef struct entity_stats {
> +   unsigned int maximumDepthSeen;
> +   int debugLevel;
> + } ENTITY_STATS;
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +
> + typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const
> char *start,
> +                                          const char *end, const
> char **endPtr);
> +@@ -562,7 +562,7 @@ static XML_Parser parserCreate(const XML_Char
> *encodingName,
> +
> + static void parserInit(XML_Parser parser, const XML_Char
> *encodingName);
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> + static float accountingGetCurrentAmplification(XML_Parser
> rootParser);
> + static void accountingReportStats(XML_Parser originParser, const
> char *epilog);
> + static void accountingOnAbort(XML_Parser originParser);
> +@@ -585,7 +585,7 @@ static void entityTrackingOnClose(XML_Parser
> parser, ENTITY *entity,
> +
> + static XML_Parser getRootParserOf(XML_Parser parser,
> +                                   unsigned int *outLevelDiff);
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +
> + static unsigned long getDebugLevel(const char *variableName,
> +                                    unsigned long
> defaultDebugLevel);
> +@@ -703,7 +703,7 @@ struct XML_ParserStruct {
> +   enum XML_ParamEntityParsing m_paramEntityParsing;
> + #endif
> +   unsigned long m_hash_secret_salt;
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +   ACCOUNTING m_accounting;
> +   ENTITY_STATS m_entity_stats;
> + #endif
> +@@ -1163,7 +1163,7 @@ parserInit(XML_Parser parser, const XML_Char
> *encodingName) {
> + #endif
> +   parser->m_hash_secret_salt =3D 0;
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
> +   parser->m_accounting.debugLevel =3D
> getDebugLevel("EXPAT_ACCOUNTING_DEBUG", 0u);
> +   parser->m_accounting.maximumAmplificationFactor
> +@@ -2522,8 +2522,9 @@ XML_GetFeatureList(void) {
> + #ifdef XML_ATTR_INFO
> +       {XML_FEATURE_ATTR_INFO, XML_L("XML_ATTR_INFO"), 0},
> + #endif
> +-#ifdef XML_DTD
> +-      /* Added in Expat 2.4.0. */
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> ++    /* Added in Expat 2.4.0 for XML_DTD defined and
> ++     * added in Expat 2.6.0 for XML_GE =3D=3D 1. */
> +
> {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_D
> EFAULT,
> +        XML_L("XML_BLAP_MAX_AMP"),
> +        (long int)
> +@@ -2537,7 +2538,7 @@ XML_GetFeatureList(void) {
> +   return features;
> + }
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> + XML_Bool XMLCALL
> + XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> +     XML_Parser parser, float maximumAmplificationFactor) {
> +@@ -2559,7 +2560,7 @@
> XML_SetBillionLaughsAttackProtectionActivationThreshold(
> +   parser->m_accounting.activationThresholdBytes =3D
> activationThresholdBytes;
> +   return XML_TRUE;
> + }
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +
> + /* Initially tag->rawName always points into the parse buffer;
> +    for those TAG instances opened while the current parse buffer
> was
> +@@ -2645,13 +2646,13 @@ externalEntityInitProcessor2(XML_Parser
> parser, const char *start,
> +   int tok =3D XmlContentTok(parser->m_encoding, start, end, &next);
> +   switch (tok) {
> +   case XML_TOK_BOM:
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +     if (! accountingDiffTolerated(parser, tok, start, next,
> __LINE__,
> +                                   XML_ACCOUNT_DIRECT)) {
> +       accountingOnAbort(parser);
> +       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> +     }
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +
> +     /* If we are at the end of the buffer, this would cause the
> next stage,
> +        i.e. externalEntityInitProcessor3, to pass control directly
> to
> +@@ -2765,7 +2766,7 @@ doContent(XML_Parser parser, int
> startTagLevel, const ENCODING *enc,
> +   for (;;) {
> +     const char *next =3D s; /* XmlContentTok doesn't always set the
> last arg */
> +     int tok =3D XmlContentTok(enc, s, end, &next);
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +     const char *accountAfter
> +         =3D ((tok =3D=3D XML_TOK_TRAILING_RSQB) || (tok =3D=3D
> XML_TOK_TRAILING_CR))
> +               ? (haveMore ? s /* i.e. 0 bytes */ : end)
> +@@ -2831,14 +2832,14 @@ doContent(XML_Parser parser, int
> startTagLevel, const ENCODING *enc,
> +       XML_Char ch =3D (XML_Char)XmlPredefinedEntityName(
> +           enc, s + enc->minBytesPerChar, next - enc-
> >minBytesPerChar);
> +       if (ch) {
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +         /* NOTE: We are replacing 4-6 characters original input for
> 1 character
> +          *       so there is no amplification and hence recording
> without
> +          *       protection. */
> +         accountingDiffTolerated(parser, tok, (char *)&ch,
> +                                 ((char *)&ch) + sizeof(XML_Char),
> __LINE__,
> +                                 XML_ACCOUNT_ENTITY_EXPANSION);
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +         if (parser->m_characterDataHandler)
> +           parser->m_characterDataHandler(parser->m_handlerArg, &ch,
> 1);
> +         else if (parser->m_defaultHandler)
> +@@ -4040,7 +4041,7 @@ doCdataSection(XML_Parser parser, const
> ENCODING *enc, const char **startPtr,
> +   for (;;) {
> +     const char *next =3D s; /* in case of XML_TOK_NONE or
> XML_TOK_PARTIAL */
> +     int tok =3D XmlCdataSectionTok(enc, s, end, &next);
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> account)) {
> +       accountingOnAbort(parser);
> +       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> +@@ -4192,7 +4193,7 @@ doIgnoreSection(XML_Parser parser, const
> ENCODING *enc, const char **startPtr,
> +   *eventPP =3D s;
> +   *startPtr =3D NULL;
> +   tok =3D XmlIgnoreSectionTok(enc, s, end, &next);
> +-#  ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +   if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> +                                 XML_ACCOUNT_DIRECT)) {
> +     accountingOnAbort(parser);
> +@@ -4284,7 +4285,7 @@ processXmlDecl(XML_Parser parser, int
> isGeneralTextEntity, const char *s,
> +   const XML_Char *storedversion =3D NULL;
> +   int standalone =3D -1;
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +   if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, s, next,
> __LINE__,
> +                                 XML_ACCOUNT_DIRECT)) {
> +     accountingOnAbort(parser);
> +@@ -4491,7 +4492,7 @@ entityValueInitProcessor(XML_Parser parser,
> const char *s, const char *end,
> +     */
> +     else if (tok =3D=3D XML_TOK_BOM && next =3D=3D end
> +              && ! parser->m_parsingStatus.finalBuffer) {
> +-#  ifdef XML_DTD
> ++#  if defined(XML_DTD) || XML_GE =3D=3D 1
> +       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> +                                     XML_ACCOUNT_DIRECT)) {
> +         accountingOnAbort(parser);
> +@@ -4707,11 +4708,13 @@ doProlog(XML_Parser parser, const ENCODING
> *enc, const char *s, const char *end,
> +       }
> +     }
> +     role =3D XmlTokenRole(&parser->m_prologState, tok, s, next, enc);
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +     switch (role) {
> +     case XML_ROLE_INSTANCE_START: // bytes accounted in
> contentProcessor
> +     case XML_ROLE_XML_DECL:       // bytes accounted in
> processXmlDecl
> +-    case XML_ROLE_TEXT_DECL:      // bytes accounted in
> processXmlDecl
> ++    #  ifdef XML_DTD
> ++    case XML_ROLE_TEXT_DECL: // bytes accounted in processXmlDecl
> ++#  endif
> +       break;
> +     default:
> +       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> account)) {
> +@@ -5648,7 +5651,7 @@ epilogProcessor(XML_Parser parser, const char
> *s, const char *end,
> +   for (;;) {
> +     const char *next =3D NULL;
> +     int tok =3D XmlPrologTok(parser->m_encoding, s, end, &next);
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> +                                   XML_ACCOUNT_DIRECT)) {
> +       accountingOnAbort(parser);
> +@@ -5728,7 +5731,7 @@ processInternalEntity(XML_Parser parser,
> ENTITY *entity, XML_Bool betweenDecl) {
> +       return XML_ERROR_NO_MEMORY;
> +   }
> +   entity->open =3D XML_TRUE;
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +   entityTrackingOnOpen(parser, entity, __LINE__);
> + #endif
> +   entity->processed =3D 0;
> +@@ -5762,9 +5765,9 @@ processInternalEntity(XML_Parser parser,
> ENTITY *entity, XML_Bool betweenDecl) {
> +       entity->processed =3D (int)(next - textStart);
> +       parser->m_processor =3D internalEntityProcessor;
> +     } else {
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +       entityTrackingOnClose(parser, entity, __LINE__);
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +       entity->open =3D XML_FALSE;
> +       parser->m_openInternalEntities =3D openEntity->next;
> +       /* put openEntity back in list of free instances */
> +@@ -5813,7 +5816,7 @@ internalEntityProcessor(XML_Parser parser,
> const char *s, const char *end,
> +     return result;
> +   }
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +   entityTrackingOnClose(parser, entity, __LINE__);
> + #endif
> +   entity->open =3D XML_FALSE;
> +@@ -5892,7 +5895,7 @@ appendAttributeValue(XML_Parser parser, const
> ENCODING *enc, XML_Bool isCdata,
> +     const char *next
> +         =3D ptr; /* XmlAttributeValueTok doesn't always set the last
> arg */
> +     int tok =3D XmlAttributeValueTok(enc, ptr, end, &next);
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +     if (! accountingDiffTolerated(parser, tok, ptr, next, __LINE__,
> account)) {
> +       accountingOnAbort(parser);
> +       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> +@@ -5957,14 +5960,14 @@ appendAttributeValue(XML_Parser parser,
> const ENCODING *enc, XML_Bool isCdata,
> +       XML_Char ch =3D (XML_Char)XmlPredefinedEntityName(
> +           enc, ptr + enc->minBytesPerChar, next - enc-
> >minBytesPerChar);
> +       if (ch) {
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +         /* NOTE: We are replacing 4-6 characters original input for
> 1 character
> +          *       so there is no amplification and hence recording
> without
> +          *       protection. */
> +         accountingDiffTolerated(parser, tok, (char *)&ch,
> +                                 ((char *)&ch) + sizeof(XML_Char),
> __LINE__,
> +                                 XML_ACCOUNT_ENTITY_EXPANSION);
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +         if (! poolAppendChar(pool, ch))
> +           return XML_ERROR_NO_MEMORY;
> +         break;
> +@@ -6042,14 +6045,14 @@ appendAttributeValue(XML_Parser parser,
> const ENCODING *enc, XML_Bool isCdata,
> +         enum XML_Error result;
> +         const XML_Char *textEnd =3D entity->textPtr + entity-
> >textLen;
> +         entity->open =3D XML_TRUE;
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +         entityTrackingOnOpen(parser, entity, __LINE__);
> + #endif
> +         result =3D appendAttributeValue(parser, parser-
> >m_internalEncoding,
> +                                       isCdata, (const char
> *)entity->textPtr,
> +                                       (const char *)textEnd, pool,
> +
> XML_ACCOUNT_ENTITY_EXPANSION);
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +         entityTrackingOnClose(parser, entity, __LINE__);
> + #endif
> +         entity->open =3D XML_FALSE;
> +@@ -6105,7 +6108,7 @@ storeEntityValue(XML_Parser parser, const
> ENCODING *enc,
> +         =3D entityTextPtr; /* XmlEntityValueTok doesn't always set
> the last arg */
> +     int tok =3D XmlEntityValueTok(enc, entityTextPtr, entityTextEnd,
> &next);
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next,
> __LINE__,
> +                                   account)) {
> +       accountingOnAbort(parser);
> +@@ -7651,7 +7654,7 @@ copyString(const XML_Char *s, const
> XML_Memory_Handling_Suite *memsuite) {
> +   return result;
> + }
> +
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +
> + static float
> + accountingGetCurrentAmplification(XML_Parser rootParser) {
> +@@ -8382,7 +8385,7 @@ unsignedCharToPrintable(unsigned char c) {
> +   assert(0); /* never gets here */
> + }
> +
> +-#endif /* XML_DTD */
> ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */
> +
> + static unsigned long
> + getDebugLevel(const char *variableName, unsigned long
> defaultDebugLevel) {
> +diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
> +index 471f2a2..be23f5a 100644
> +--- a/xmlwf/xmlwf.c
> ++++ b/xmlwf/xmlwf.c
> +@@ -1062,9 +1062,10 @@ tmain(int argc, XML_Char **argv) {
> +             " (needs a floating point number greater or equal than
> 1.0)"));
> +         exit(XMLWF_EXIT_USAGE_ERROR);
> +       }
> +-#ifndef XML_DTD
> +-      ftprintf(stderr, T("Warning: Given amplification limit
> ignored") T(
> +-                           ", xmlwf has been compiled without DTD
> support.\n"));
> ++#if ! defined(XML_DTD) && XML_GE =3D=3D 0
> ++      ftprintf(stderr,
> ++               T("Warning: Given amplification limit ignored")
> ++                   T(", xmlwf has been compiled without DTD/GE
> support.\n"));
> + #endif
> +       break;
> +     }
> +@@ -1083,9 +1084,10 @@ tmain(int argc, XML_Char **argv) {
> +         exit(XMLWF_EXIT_USAGE_ERROR);
> +       }
> +       attackThresholdGiven =3D XML_TRUE;
> +-#ifndef XML_DTD
> +-      ftprintf(stderr, T("Warning: Given attack threshold ignored")
> T(
> +-                           ", xmlwf has been compiled without DTD
> support.\n"));
> ++#if ! defined(XML_DTD) && XML_GE =3D=3D 0
> ++      ftprintf(stderr,
> ++               T("Warning: Given attack threshold ignored")
> ++                   T(", xmlwf has been compiled without DTD/GE
> support.\n"));
> + #endif
> +       break;
> +     }
> +@@ -1120,13 +1122,13 @@ tmain(int argc, XML_Char **argv) {
> +     }
> +
> +     if (attackMaximumAmplification !=3D -1.0f) {
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +       XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> +           parser, attackMaximumAmplification);
> + #endif
> +     }
> +     if (attackThresholdGiven) {
> +-#ifdef XML_DTD
> ++#if defined(XML_DTD) || XML_GE =3D=3D 1
> +       XML_SetBillionLaughsAttackProtectionActivationThreshold(
> +           parser, attackThresholdBytes);
> + #else
> +--
> +2.40.0
> diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-
> core/expat/expat_2.5.0.bb
> index 7080f934d1..e427020534 100644
> --- a/meta/recipes-core/expat/expat_2.5.0.bb
> +++ b/meta/recipes-core/expat/expat_2.5.0.bb
> @@ -10,6 +10,7 @@ VERSION_TAG =3D "${@d.getVar('PV').replace('.',
> '_')}"
>
>  SRC_URI =3D
> "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_T
> AG}/expat-${PV}.tar.bz2  \
>             file://run-ptest \
> +           file://CVE-2023-52426.patch \
>             "
>
>  UPSTREAM_CHECK_URI =3D
> "https://github.com/libexpat/libexpat/releases/"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196837):
> https://lists.openembedded.org/g/openembedded-core/message/196837
> Mute This Topic: https://lists.openembedded.org/mt/104800121/3616702
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> anuj.mittal@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_BY1PR11MB800540D49D0C29C3ADE8794BE52B2BY1PR11MB8005namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Anuj,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">I have sent the upgrade to 2.6.0 , it includes t=
he complete security fix for
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px;=
 color: rgb(66, 66, 66); background-color: rgb(255, 255, 255);">CVE-2023-52=
426</span><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFo=
ntService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">&nbsp;and
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px;=
 color: rgb(66, 66, 66); background-color: rgb(255, 255, 255);">CVE-2023-52=
42</span><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFon=
tService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0);">5.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Regards</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Meenali</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mittal, Anuj &lt;anuj=
.mittal@intel.com&gt;<br>
<b>Sent:</b> 11 March 2024 08:37<br>
<b>To:</b> Gupta, Meenali &lt;Meenali.Gupta@windriver.com&gt;; openembedded=
-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&g=
t;<br>
<b>Subject:</b> Re: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-524=
26</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2024-03-07 at 16:08 -0800, Meenali Gupta via<br>
lists.openembedded.org wrote:<br>
&gt; From: Meenali Gupta &lt;meenali.gupta@windriver.com&gt;<br>
&gt;<br>
&gt; A flaw was found in Expat (libexpat). If XML_DTD is undefined at<br>
&gt; compile time, a recursive XML Entity<br>
&gt; Expansion condition can be triggered. This issue may lead to a<br>
&gt; condition where data is expanded exponentially,<br>
&gt; which will quickly consume system resources and cause a denial of<br>
&gt; service.<br>
&gt;<br>
&gt; Signed-off-by: Meenali Gupta &lt;meenali.gupta@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../expat/expat/CVE-2023-52426.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 429<br>
&gt; ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-core/expat/expat_2.5.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 430 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/expat/expat/CVE-2023-<br>
&gt; 52426.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426.patch<br>
&gt; b/meta/recipes-core/expat/expat/CVE-2023-52426.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b78a8ee0dc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/expat/expat/CVE-2023-52426.patch<br>
&gt; @@ -0,0 +1,429 @@<br>
&gt; +From 0f075ec8ecb5e43f8fdca5182f8cca4703da0404 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Sebastian Pipping &lt;sebastian@pipping.org&gt;<br>
&gt; +Date: Thu, 26 Oct 2023 00:43:22 +0200<br>
&gt; +Subject: [PATCH] lib|xmlwf|cmake: Extend scope of billion laughs<br>
&gt; attack<br>
&gt; + protection<br>
&gt; +<br>
&gt; +.. from &quot;defined(XML_DTD)&quot; to &quot;defined(XML_DTD) || XML=
_GE=3D=3D1&quot;.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-52426<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://github.com/libexpat/libexpat/commit/0f075ec8=
ecb5e43f8fdca518<br>
&gt; 2f8cca4703da0404]<br>
<br>
The PR that this commit is part of includes other commits as well. Is<br>
there any reason why only this is included or required?<br>
<br>
I didn't check in detail but as an example, it seems this commit uses<br>
EXPAT_GE which was introduced in an earlier commit in that PR:<br>
<br>
<a href=3D"https://github.com/libexpat/libexpat/pull/777/commits/daa89e42c0=
05cc7f4f7af9eee271ae0723d30300">https://github.com/libexpat/libexpat/pull/7=
77/commits/daa89e42c005cc7f4f7af9eee271ae0723d30300</a><br>
<br>
So, is this supposed to work as intended?<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; +<br>
&gt; +Signed-off-by: Meenali Gupta &lt;meenali.gupta@windriver.com&gt;<br>
&gt; +---<br>
&gt; + CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p; 8 ++++-<br>
&gt; + lib/expat.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp; 8 +++--<br>
&gt; + lib/internal.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p; 2 +-<br>
&gt; + lib/libexpat.def.cmake |&nbsp; 4 +--<br>
&gt; + lib/xmlparse.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 71 =
++++++++++++++++++++++-----------------<br>
&gt; ---<br>
&gt; + xmlwf/xmlwf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
| 18 ++++++-----<br>
&gt; + 6 files changed, 62 insertions(+), 49 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; +index 2b4c13c..183c5c2 100644<br>
&gt; +--- a/CMakeLists.txt<br>
&gt; ++++ b/CMakeLists.txt<br>
&gt; +@@ -381,7 +381,13 @@ if(EXPAT_SHARED_LIBS)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; endif()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; endmacro()<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _expat_def_file_toggle(EX=
PAT_DTD _EXPAT_COMMENT_DTD)<br>
&gt; ++&nbsp;&nbsp;&nbsp; if(EXPAT_DTD OR EXPAT_GE)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
et(_EXPAT_DTD_OR_GE TRUE)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else()<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
et(_EXPAT_DTD_OR_GE FALSE)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; endif()<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _expat_def_file_toggle(_E=
XPAT_DTD_OR_GE<br>
&gt; _EXPAT_COMMENT_DTD_OR_GE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _expat_def_file_togg=
le(EXPAT_ATTR_INFO<br>
&gt; _EXPAT_COMMENT_ATTR_INFO)<br>
&gt; +<br>
&gt; +<br>
&gt; configure_file(&quot;${CMAKE_CURRENT_SOURCE_DIR}/lib/libexpat.def.cmak=
e&quot;<br>
&gt; &quot;${CMAKE_CURRENT_BINARY_DIR}/lib/libexpat.def&quot;)<br>
&gt; +diff --git a/lib/expat.h b/lib/expat.h<br>
&gt; +index 1c83563..33c94af 100644<br>
&gt; +--- a/lib/expat.h<br>
&gt; ++++ b/lib/expat.h<br>
&gt; +@@ -1038,13 +1038,15 @@ typedef struct {<br>
&gt; + XMLPARSEAPI(const XML_Feature *)<br>
&gt; + XML_GetFeatureList(void);<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; +-/* Added in Expat 2.4.0. */<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; ++/* Added in Expat 2.4.0 for XML_DTD defined and<br>
&gt; ++ * added in Expat 2.6.0 for XML_GE =3D=3D 1. */<br>
&gt; + XMLPARSEAPI(XML_Bool)<br>
&gt; + XML_SetBillionLaughsAttackProtectionMaximumAmplification(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, float maximumAmplificatio=
nFactor);<br>
&gt; +<br>
&gt; +-/* Added in Expat 2.4.0. */<br>
&gt; ++/* Added in Expat 2.4.0 for XML_DTD defined and<br>
&gt; ++ * added in Expat 2.6.0 for XML_GE =3D=3D 1. */<br>
&gt; + XMLPARSEAPI(XML_Bool)<br>
&gt; + XML_SetBillionLaughsAttackProtectionActivationThreshold(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, unsigned long long<br>
&gt; activationThresholdBytes);<br>
&gt; +diff --git a/lib/internal.h b/lib/internal.h<br>
&gt; +index e09f533..1851925 100644<br>
&gt; +--- a/lib/internal.h<br>
&gt; ++++ b/lib/internal.h<br>
&gt; +@@ -154,7 +154,7 @@ extern &quot;C&quot; {<br>
&gt; + void _INTERNAL_trim_to_complete_utf8_characters(const char *from,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const=
 char<br>
&gt; **fromLimRef);<br>
&gt; +<br>
&gt; +-#if defined(XML_DTD)<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + unsigned long long testingAccountingGetCountBytesDirect(XML_Parser<b=
r>
&gt; parser);<br>
&gt; + unsigned long long<br>
&gt; testingAccountingGetCountBytesIndirect(XML_Parser parser);<br>
&gt; + const char *unsignedCharToPrintable(unsigned char c);<br>
&gt; +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake<br>
&gt; +index cf434a2..61a4f00 100644<br>
&gt; +--- a/lib/libexpat.def.cmake<br>
&gt; ++++ b/lib/libexpat.def.cmake<br>
&gt; +@@ -75,5 +75,5 @@ EXPORTS<br>
&gt; +&nbsp;&nbsp; XML_SetHashSalt @67<br>
&gt; + ; internal @68 removed with version 2.3.1<br>
&gt; + ; added with version 2.4.0<br>
&gt; +-@_EXPAT_COMMENT_DTD@<br>
&gt; XML_SetBillionLaughsAttackProtectionActivationThreshold @69<br>
&gt; +-@_EXPAT_COMMENT_DTD@<br>
&gt; XML_SetBillionLaughsAttackProtectionMaximumAmplification @70<br>
&gt; ++@_EXPAT_COMMENT_DTD_OR_GE@<br>
&gt; XML_SetBillionLaughsAttackProtectionActivationThreshold @69<br>
&gt; ++@_EXPAT_COMMENT_DTD_OR_GE@<br>
&gt; XML_SetBillionLaughsAttackProtectionMaximumAmplification @70<br>
&gt; +diff --git a/lib/xmlparse.c b/lib/xmlparse.c<br>
&gt; +index b6c2eca..e23441e 100644<br>
&gt; +--- a/lib/xmlparse.c<br>
&gt; ++++ b/lib/xmlparse.c<br>
&gt; +@@ -408,7 +408,7 @@ enum XML_Account {<br>
&gt; +&nbsp;&nbsp; XML_ACCOUNT_NONE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* i.e. do not account, was<br>
&gt; accounted already */<br>
&gt; + };<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + typedef unsigned long long XmlBigCount;<br>
&gt; + typedef struct accounting {<br>
&gt; +&nbsp;&nbsp; XmlBigCount countBytesDirect;<br>
&gt; +@@ -424,7 +424,7 @@ typedef struct entity_stats {<br>
&gt; +&nbsp;&nbsp; unsigned int maximumDepthSeen;<br>
&gt; +&nbsp;&nbsp; int debugLevel;<br>
&gt; + } ENTITY_STATS;<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const<br=
>
&gt; char *start,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; const char *end, const<br>
&gt; char **endPtr);<br>
&gt; +@@ -562,7 +562,7 @@ static XML_Parser parserCreate(const XML_Char<br>
&gt; *encodingName,<br>
&gt; +<br>
&gt; + static void parserInit(XML_Parser parser, const XML_Char<br>
&gt; *encodingName);<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + static float accountingGetCurrentAmplification(XML_Parser<br>
&gt; rootParser);<br>
&gt; + static void accountingReportStats(XML_Parser originParser, const<br>
&gt; char *epilog);<br>
&gt; + static void accountingOnAbort(XML_Parser originParser);<br>
&gt; +@@ -585,7 +585,7 @@ static void entityTrackingOnClose(XML_Parser<br>
&gt; parser, ENTITY *entity,<br>
&gt; +<br>
&gt; + static XML_Parser getRootParserOf(XML_Parser parser,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int *=
outLevelDiff);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + static unsigned long getDebugLevel(const char *variableName,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned=
 long<br>
&gt; defaultDebugLevel);<br>
&gt; +@@ -703,7 +703,7 @@ struct XML_ParserStruct {<br>
&gt; +&nbsp;&nbsp; enum XML_ParamEntityParsing m_paramEntityParsing;<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp; unsigned long m_hash_secret_salt;<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp; ACCOUNTING m_accounting;<br>
&gt; +&nbsp;&nbsp; ENTITY_STATS m_entity_stats;<br>
&gt; + #endif<br>
&gt; +@@ -1163,7 +1163,7 @@ parserInit(XML_Parser parser, const XML_Char<br=
>
&gt; *encodingName) {<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp; parser-&gt;m_hash_secret_salt =3D 0;<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp; memset(&amp;parser-&gt;m_accounting, 0, sizeof(ACCOUNTIN=
G));<br>
&gt; +&nbsp;&nbsp; parser-&gt;m_accounting.debugLevel =3D<br>
&gt; getDebugLevel(&quot;EXPAT_ACCOUNTING_DEBUG&quot;, 0u);<br>
&gt; +&nbsp;&nbsp; parser-&gt;m_accounting.maximumAmplificationFactor<br>
&gt; +@@ -2522,8 +2522,9 @@ XML_GetFeatureList(void) {<br>
&gt; + #ifdef XML_ATTR_INFO<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {XML_FEATURE_ATTR_INFO, XML_L(&q=
uot;XML_ATTR_INFO&quot;), 0},<br>
&gt; + #endif<br>
&gt; +-#ifdef XML_DTD<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Added in Expat 2.4.0. */<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Added in Expat 2.4.0 for XML_DTD defined and<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * added in Expat 2.6.0 for XML_GE =3D=3D 1.=
 */<br>
&gt; +<br>
&gt; {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_D<=
br>
&gt; EFAULT,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_L(&quot;XML_BLAP_MAX_A=
MP&quot;),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (long int)<br>
&gt; +@@ -2537,7 +2538,7 @@ XML_GetFeatureList(void) {<br>
&gt; +&nbsp;&nbsp; return features;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + XML_Bool XMLCALL<br>
&gt; + XML_SetBillionLaughsAttackProtectionMaximumAmplification(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, float maximumAmplificatio=
nFactor) {<br>
&gt; +@@ -2559,7 +2560,7 @@<br>
&gt; XML_SetBillionLaughsAttackProtectionActivationThreshold(<br>
&gt; +&nbsp;&nbsp; parser-&gt;m_accounting.activationThresholdBytes =3D<br>
&gt; activationThresholdBytes;<br>
&gt; +&nbsp;&nbsp; return XML_TRUE;<br>
&gt; + }<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + /* Initially tag-&gt;rawName always points into the parse buffer;<br=
>
&gt; +&nbsp;&nbsp;&nbsp; for those TAG instances opened while the current p=
arse buffer<br>
&gt; was<br>
&gt; +@@ -2645,13 +2646,13 @@ externalEntityInitProcessor2(XML_Parser<br>
&gt; parser, const char *start,<br>
&gt; +&nbsp;&nbsp; int tok =3D XmlContentTok(parser-&gt;m_encoding, start, =
end, &amp;next);<br>
&gt; +&nbsp;&nbsp; switch (tok) {<br>
&gt; +&nbsp;&nbsp; case XML_TOK_BOM:<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (! accountingDiffTolerated(parser, tok, s=
tart, next,<br>
&gt; __LINE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_DI=
RECT)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(parser);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XML_ERROR_AMPLIFICATION_L=
IMIT_BREACH;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* If we are at the end of the buffer, this =
would cause the<br>
&gt; next stage,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i.e. externalEntityInitPro=
cessor3, to pass control directly<br>
&gt; to<br>
&gt; +@@ -2765,7 +2766,7 @@ doContent(XML_Parser parser, int<br>
&gt; startTagLevel, const ENCODING *enc,<br>
&gt; +&nbsp;&nbsp; for (;;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *next =3D s; /* XmlContentTok doe=
sn't always set the<br>
&gt; last arg */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int tok =3D XmlContentTok(enc, s, end, &amp;=
next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *accountAfter<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D ((tok =3D=3D XML=
_TOK_TRAILING_RSQB) || (tok =3D=3D<br>
&gt; XML_TOK_TRAILING_CR))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ? (haveMore ? s /* i.e. 0 bytes */ : end)<br>
&gt; +@@ -2831,14 +2832,14 @@ doContent(XML_Parser parser, int<br>
&gt; startTagLevel, const ENCODING *enc,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Char ch =3D (XML_Char)XmlPre=
definedEntityName(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enc, s +=
 enc-&gt;minBytesPerChar, next - enc-<br>
&gt; &gt;minBytesPerChar);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ch) {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NOTE: We are repl=
acing 4-6 characters original input for<br>
&gt; 1 character<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; so there is no amplification and hence recording<br=
>
&gt; without<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; protection. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingDiffTolera=
ted(parser, tok, (char *)&amp;ch,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((char *)&amp;ch) + sizeof=
(XML_Char),<br>
&gt; __LINE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_ENTITY_EXPANSI=
ON);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (parser-&gt;m_cha=
racterDataHandler)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser-&=
gt;m_characterDataHandler(parser-&gt;m_handlerArg, &amp;ch,<br>
&gt; 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (parser-&gt;=
m_defaultHandler)<br>
&gt; +@@ -4040,7 +4041,7 @@ doCdataSection(XML_Parser parser, const<br>
&gt; ENCODING *enc, const char **startPtr,<br>
&gt; +&nbsp;&nbsp; for (;;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *next =3D s; /* in case of XML_TO=
K_NONE or<br>
&gt; XML_TOK_PARTIAL */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int tok =3D XmlCdataSectionTok(enc, s, end, =
&amp;next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (! accountingDiffTolerated(parser, tok, s=
, next, __LINE__,<br>
&gt; account)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(parser);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XML_ERROR_AMPLIFICATION_L=
IMIT_BREACH;<br>
&gt; +@@ -4192,7 +4193,7 @@ doIgnoreSection(XML_Parser parser, const<br>
&gt; ENCODING *enc, const char **startPtr,<br>
&gt; +&nbsp;&nbsp; *eventPP =3D s;<br>
&gt; +&nbsp;&nbsp; *startPtr =3D NULL;<br>
&gt; +&nbsp;&nbsp; tok =3D XmlIgnoreSectionTok(enc, s, end, &amp;next);<br>
&gt; +-#&nbsp; ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp; if (! accountingDiffTolerated(parser, tok, s, next, __LI=
NE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_DIRECT)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(parser);<br>
&gt; +@@ -4284,7 +4285,7 @@ processXmlDecl(XML_Parser parser, int<br>
&gt; isGeneralTextEntity, const char *s,<br>
&gt; +&nbsp;&nbsp; const XML_Char *storedversion =3D NULL;<br>
&gt; +&nbsp;&nbsp; int standalone =3D -1;<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp; if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, =
s, next,<br>
&gt; __LINE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_DIRECT)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(parser);<br>
&gt; +@@ -4491,7 +4492,7 @@ entityValueInitProcessor(XML_Parser parser,<br>
&gt; const char *s, const char *end,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (tok =3D=3D XML_TOK_BOM &amp;&amp; n=
ext =3D=3D end<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &amp;&amp; ! parser-&gt;m_parsingStatus.finalBuffer) {<br>
&gt; +-#&nbsp; ifdef XML_DTD<br>
&gt; ++#&nbsp; if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! accountingDiffTolerated(pa=
rser, tok, s, next, __LINE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XM=
L_ACCOUNT_DIRECT)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(pa=
rser);<br>
&gt; +@@ -4707,11 +4708,13 @@ doProlog(XML_Parser parser, const ENCODING<br=
>
&gt; *enc, const char *s, const char *end,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; role =3D XmlTokenRole(&amp;parser-&gt;m_prol=
ogState, tok, s, next, enc);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; switch (role) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case XML_ROLE_INSTANCE_START: // bytes accou=
nted in<br>
&gt; contentProcessor<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case XML_ROLE_XML_DECL:&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; // bytes accounted in<br>
&gt; processXmlDecl<br>
&gt; +-&nbsp;&nbsp;&nbsp; case XML_ROLE_TEXT_DECL:&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // bytes accounted in<br>
&gt; processXmlDecl<br>
&gt; ++&nbsp;&nbsp;&nbsp; #&nbsp; ifdef XML_DTD<br>
&gt; ++&nbsp;&nbsp;&nbsp; case XML_ROLE_TEXT_DECL: // bytes accounted in pr=
ocessXmlDecl<br>
&gt; ++#&nbsp; endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! accountingDiffTolerated(pa=
rser, tok, s, next, __LINE__,<br>
&gt; account)) {<br>
&gt; +@@ -5648,7 +5651,7 @@ epilogProcessor(XML_Parser parser, const char<b=
r>
&gt; *s, const char *end,<br>
&gt; +&nbsp;&nbsp; for (;;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *next =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int tok =3D XmlPrologTok(parser-&gt;m_encodi=
ng, s, end, &amp;next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (! accountingDiffTolerated(parser, tok, s=
, next, __LINE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_DI=
RECT)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(parser);<br>
&gt; +@@ -5728,7 +5731,7 @@ processInternalEntity(XML_Parser parser,<br>
&gt; ENTITY *entity, XML_Bool betweenDecl) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XML_ERROR_NO_MEMORY;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; entity-&gt;open =3D XML_TRUE;<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp; entityTrackingOnOpen(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp; entity-&gt;processed =3D 0;<br>
&gt; +@@ -5762,9 +5765,9 @@ processInternalEntity(XML_Parser parser,<br>
&gt; ENTITY *entity, XML_Bool betweenDecl) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;processed =3D (int)(n=
ext - textStart);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser-&gt;m_processor =3D inter=
nalEntityProcessor;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entityTrackingOnClose(parser, en=
tity, __LINE__);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;open =3D XML_FALSE;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser-&gt;m_openInternalEntitie=
s =3D openEntity-&gt;next;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* put openEntity back in list o=
f free instances */<br>
&gt; +@@ -5813,7 +5816,7 @@ internalEntityProcessor(XML_Parser parser,<br>
&gt; const char *s, const char *end,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return result;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp; entityTrackingOnClose(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp; entity-&gt;open =3D XML_FALSE;<br>
&gt; +@@ -5892,7 +5895,7 @@ appendAttributeValue(XML_Parser parser, const<b=
r>
&gt; ENCODING *enc, XML_Bool isCdata,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *next<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D ptr; /* XmlAttri=
buteValueTok doesn't always set the last<br>
&gt; arg */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int tok =3D XmlAttributeValueTok(enc, ptr, e=
nd, &amp;next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (! accountingDiffTolerated(parser, tok, p=
tr, next, __LINE__,<br>
&gt; account)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(parser);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XML_ERROR_AMPLIFICATION_L=
IMIT_BREACH;<br>
&gt; +@@ -5957,14 +5960,14 @@ appendAttributeValue(XML_Parser parser,<br>
&gt; const ENCODING *enc, XML_Bool isCdata,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Char ch =3D (XML_Char)XmlPre=
definedEntityName(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enc, ptr=
 + enc-&gt;minBytesPerChar, next - enc-<br>
&gt; &gt;minBytesPerChar);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ch) {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NOTE: We are repl=
acing 4-6 characters original input for<br>
&gt; 1 character<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; so there is no amplification and hence recording<br=
>
&gt; without<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; protection. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingDiffTolera=
ted(parser, tok, (char *)&amp;ch,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((char *)&amp;ch) + sizeof=
(XML_Char),<br>
&gt; __LINE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_ENTITY_EXPANSI=
ON);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! poolAppendChar=
(pool, ch))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return X=
ML_ERROR_NO_MEMORY;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +@@ -6042,14 +6045,14 @@ appendAttributeValue(XML_Parser parser,<br>
&gt; const ENCODING *enc, XML_Bool isCdata,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum XML_Error resul=
t;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const XML_Char *text=
End =3D entity-&gt;textPtr + entity-<br>
&gt; &gt;textLen;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;open =3D =
XML_TRUE;<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entityTrackingOnOpen=
(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D appendAtt=
ributeValue(parser, parser-<br>
&gt; &gt;m_internalEncoding,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; isCdata, (const char<br>
&gt; *)entity-&gt;textPtr,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (const char *)textEnd, pool,<br>
&gt; +<br>
&gt; XML_ACCOUNT_ENTITY_EXPANSION);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entityTrackingOnClos=
e(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entity-&gt;open =3D =
XML_FALSE;<br>
&gt; +@@ -6105,7 +6108,7 @@ storeEntityValue(XML_Parser parser, const<br>
&gt; ENCODING *enc,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D entityTextPtr; /=
* XmlEntityValueTok doesn't always set<br>
&gt; the last arg */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int tok =3D XmlEntityValueTok(enc, entityTex=
tPtr, entityTextEnd,<br>
&gt; &amp;next);<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (! accountingDiffTolerated(parser, tok, e=
ntityTextPtr, next,<br>
&gt; __LINE__,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; account)) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accountingOnAbort(parser);<br>
&gt; +@@ -7651,7 +7654,7 @@ copyString(const XML_Char *s, const<br>
&gt; XML_Memory_Handling_Suite *memsuite) {<br>
&gt; +&nbsp;&nbsp; return result;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +<br>
&gt; + static float<br>
&gt; + accountingGetCurrentAmplification(XML_Parser rootParser) {<br>
&gt; +@@ -8382,7 +8385,7 @@ unsignedCharToPrintable(unsigned char c) {<br>
&gt; +&nbsp;&nbsp; assert(0); /* never gets here */<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + static unsigned long<br>
&gt; + getDebugLevel(const char *variableName, unsigned long<br>
&gt; defaultDebugLevel) {<br>
&gt; +diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c<br>
&gt; +index 471f2a2..be23f5a 100644<br>
&gt; +--- a/xmlwf/xmlwf.c<br>
&gt; ++++ b/xmlwf/xmlwf.c<br>
&gt; +@@ -1062,9 +1062,10 @@ tmain(int argc, XML_Char **argv) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot; (needs a floating point number greater or equal than<br>
&gt; 1.0)&quot;));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(XMLWF_EXIT_USAG=
E_ERROR);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-#ifndef XML_DTD<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ftprintf(stderr, T(&quot;Warning: Giv=
en amplification limit<br>
&gt; ignored&quot;) T(<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;, xmlwf has been compiled without DTD<br>
&gt; support.\n&quot;));<br>
&gt; ++#if ! defined(XML_DTD) &amp;&amp; XML_GE =3D=3D 0<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ftprintf(stderr,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; T(&quot;Warning: Given amplification limit ignored&quot;)<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T(&quot;, xmlwf has been compiled =
without DTD/GE<br>
&gt; support.\n&quot;));<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -1083,9 +1084,10 @@ tmain(int argc, XML_Char **argv) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(XMLWF_EXIT_USAG=
E_ERROR);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attackThresholdGiven =3D XML_TRU=
E;<br>
&gt; +-#ifndef XML_DTD<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ftprintf(stderr, T(&quot;Warning: Giv=
en attack threshold ignored&quot;)<br>
&gt; T(<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;, xmlwf has been compiled without DTD<br>
&gt; support.\n&quot;));<br>
&gt; ++#if ! defined(XML_DTD) &amp;&amp; XML_GE =3D=3D 0<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ftprintf(stderr,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; T(&quot;Warning: Given attack threshold ignored&quot;)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T(&quot;, xmlwf has been compiled =
without DTD/GE<br>
&gt; support.\n&quot;));<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -1120,13 +1122,13 @@ tmain(int argc, XML_Char **argv) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (attackMaximumAmplification !=3D -1.0f) {=
<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_SetBillionLaughsAttackProtec=
tionMaximumAmplification(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser, =
attackMaximumAmplification);<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (attackThresholdGiven) {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_SetBillionLaughsAttackProtec=
tionActivationThreshold(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser, =
attackThresholdBytes);<br>
&gt; + #else<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-<br=
>
&gt; core/expat/expat_2.5.0.bb<br>
&gt; index 7080f934d1..e427020534 100644<br>
&gt; --- a/meta/recipes-core/expat/expat_2.5.0.bb<br>
&gt; +++ b/meta/recipes-core/expat/expat_2.5.0.bb<br>
&gt; @@ -10,6 +10,7 @@ VERSION_TAG =3D &quot;${@d.getVar('PV').replace('.',=
<br>
&gt; '_')}&quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI =3D<br>
&gt; &quot;<a href=3D""></a>https://github.com/libexpat/libexpat/releases/d=
ownload/R_${VERSION_T<br>
&gt; AG}/expat-${PV}.tar.bz2&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://run-ptest">file://run-ptest</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-52426.patch">file://CVE-2023-52426.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D<br>
&gt; &quot;<a href=3D"https://github.com/libexpat/libexpat/releases/">https=
://github.com/libexpat/libexpat/releases/</a>&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#196837):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
196837">https://lists.openembedded.org/g/openembedded-core/message/196837</=
a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10480012=
1/3616702">
https://lists.openembedded.org/mt/104800121/3616702</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub">h=
ttps://lists.openembedded.org/g/openembedded-core/unsub</a> [<br>
&gt; anuj.mittal@intel.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY1PR11MB800540D49D0C29C3ADE8794BE52B2BY1PR11MB8005namp_--

