Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62A7EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:14:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6829.1686917685232259071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jN4UBcWc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55315b4ca9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GB15C7027726
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:14:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=InkdrwArHMXOEeCgwTNniLaGEAi5T/cZguyXiV8jHTo=;
 b=jN4UBcWcfZ9d1iUhWHjkayaaVPjNjY5V5tIIph3K5NuSIDrMl7uW+OagWWkMlKi6XYJV
 oIP7GH1WYvfS6PzhgWQqOzG3vu3tVJscF5aeu/BXgAR/mpim7htTCxq69FVVNFAIwORM
 /VDt5jKsHZVqICPnzjAT4ZdzkGUT0qkgaKOqbf6VsjtiaZiypjVA6KSZEgKeqw4j2Mjo
 /WQZmSAp1QaeIbT+aMb76LhqwU55W0MweuERgVpcDJd7qbRi6o7eJBzllbWZ7GRqZflL
 aF89DSZL7dBE01epvago7ShU82LptyWsP1o/+iD7yB/HJ2LS2TBPS8MK2umSi8k4jDy7 0g== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf35x7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:14:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlV2dHn/Q29WQjqwpGAMe0dAtTobuOnWy3uf75KmMtBNUg8fobsLw90XNONXGE+MO7QpgmVxOlvJIKK3QeA7K68W75OTMjiKIcCnwJywRrEXVDmxjT15BNeWLxjVrV2Vx33fditM2v1rifhJCYelBTuQH3aCZQh7Dih0bp52qbkPlEZOleKtbWq/UZwO1QP7zn6ivITr9nVl9iBLoQUsYLr3ImZQyBo27LcvwgmkfIr7H6BOcdSdVYzmxLdSJ+FWCpzL6Wt9kQVrHlOUk3uRPtOEr+m8bcbxeAiLYKbGrccK02OKKDvarWQB5na2X9Qag5No2ZC/3Yh/0w9gWPSmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InkdrwArHMXOEeCgwTNniLaGEAi5T/cZguyXiV8jHTo=;
 b=Z766YfbbYEnpMoCtoqEru/GWYE/1Cn+HlVM4ALZ8pz32WKQO6XIk0xqTPddYD1DWFSbsVi7aFlbbvQWCLK1UsBgeZ5ln5M5sX5kV6Ja7MOReV3azv0Wv5KO5zV9mZQpATOHxnMN6FQKO6G8vgySw3CXiMtr4eIx3zWLNEo5mzB5JsA7xVT0l9aEmLlJB9Kb7qLV0OdBuu1Ow+wx/oQ8G8mOmSJ55/8JqsYITOAMUiwpchNBarDZ73akEaebvuBmMcFczGJCcnpvCutgaei9baEZYSxawmT7aQcX0lPOmkwQxGYSMSECAYF/O8EicyfQO7C0j+DlIbqrj1qhIdDsH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 12:14:42 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Fri, 16 Jun 2023
 12:14:42 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [OE-core] [PATCH] samba: fix CVE-2022-41916
Thread-Topic: [OE-core] [PATCH] samba: fix CVE-2022-41916
Thread-Index: AQHZoErjKEsnTxjd4kej3ST7bUTujK+NV5jW
Date: Fri, 16 Jun 2023 12:14:42 +0000
Message-ID: 
 <MW4PR11MB58224FBEE79C570C5CCDE5808458A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <176922320C690689.19085@lists.openembedded.org>
In-Reply-To: <176922320C690689.19085@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH7PR11MB6007:EE_
x-ms-office365-filtering-correlation-id: 819f1b9c-eb04-4c46-4000-08db6e6343cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Gbvx9s3D8F7sGRFS5pn36kbZnIrN2Iop6f2LzkRjCyXWaQJcrkdPihsa+EHhMRiyTk3L11+PGY96050f0NMExRuLAbsoC81RP/TP0bA1SIoIF1yWk6aZ68EYKSjl5kk5wEylg3HlFA7K0JCJt4sDR7d9lrf1FEZASYq0noD4XLLwDVUICpAZEejoL5IvNd+hDIAROmftOjOmHqZrsWtXLGME5eMIRM3zAKF+/UR8c/xjXgyc6yFcSwwlftJjUdlE/tgItbhq6fv4Jz4Mbj6SIgHabt6OhC0B6CToKQVsrmkXdEJM+vv+xFsveUXj0s17VdC+wZMsroxR5131jbnAcmhuIGW+mswUx0ZqcQMKeLgfGFGRjanEhW7GEiwtgn2W6vvVj0U6pIySPdE3GSEDYgDIjZW6nCeXTo71B3/nlIW4uErAfY8tKUsVr2kNs8jbV0WhFIQngvAs3aruIUcg24+nE3Wvp7QZOh3eQj7/E1swXZuOplykel+YbyNpcn30IwSkbFPiCxLJNBll5yaafSvjAB8WRqJvo1bdt7uT7uYllJMQe/uxxwZBoVptG4JHSN/DxxjvukgkR3/UwpsYFgU2+K5Qu/oym0yMRkN8m0XyfmWD+11MjMF3n0UhIPWIzxPy9F6Rr16xF1xjVV2F3g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(110136005)(41300700001)(8676002)(86362001)(7696005)(64756008)(66946007)(66476007)(66556008)(66446008)(8936002)(316002)(33656002)(71200400001)(19627405001)(91956017)(4326008)(76116006)(38070700005)(478600001)(107886003)(9686003)(55016003)(26005)(5660300002)(166002)(966005)(52536014)(83380400001)(6506007)(55236004)(2906002)(186003)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?U2DU93aQJELOOjwS6/AD2TmTkJn+wqr5o6nX6emJoANyTtBdpZXejU7+JLg8?=
 =?us-ascii?Q?rCxRC/Z/a5+KxcyTLcQv+y/ugp6Jvfk20WjQcNsSKVO3CV02xC9zAvlGPM/y?=
 =?us-ascii?Q?1262bhl6qvfAc1epQQtdpk6ffbiCGKjX78M6cRqDtKM9ep0erhYxlueq870Q?=
 =?us-ascii?Q?vJqlH/7/5+LIFsLV6Zo78OHw2HY1lZpQukZ9GGsC0asI8mwXyC8pc3obj1U+?=
 =?us-ascii?Q?YbNOzAvSrYeDjoAFUQVajqANSTxpWuAa9kT2yjDXNm3oSPPAMiz6roLzn1uk?=
 =?us-ascii?Q?qbD+QgFHAebp59OzjnjXnj8T4ASaglpUmjo6zJ7EMhUiQDbXGqurfzrRjNyo?=
 =?us-ascii?Q?nWOFLDzqB7yw4d5HHj4BtuiXPueQDp7DQCQmG0OCqHAouhW2Fr1esU4d+kOW?=
 =?us-ascii?Q?ppTTMd0RpZ4vc5snkVibwIFg1EChqCUMD4wZTH3lJb9IJijB3qQztWzAxll7?=
 =?us-ascii?Q?x3ZEhq29x0KQNpDTVHI7NA+DevV3VnoHPPhTwzZfXx/GIPpi2kkn4CjjycbZ?=
 =?us-ascii?Q?2bbC2/5Z3naCLaGZaZZvp2xP3yXG0PsJ77IW1xoxekUTIxePZts8qXgaCf6J?=
 =?us-ascii?Q?LT0OL4znSlK2K5ChG3PoK3nPPD2URyJnw5RG23BU518EIVSfDApDvtHhFTdY?=
 =?us-ascii?Q?zLJq8dW3hI1yxlGXG1JQDEsB/FS9x+gXVkYe9xKil6S8FbiLQTQEXL6vETUB?=
 =?us-ascii?Q?ElX+E0GSgwJewKgBmJTKX0k+XE+a/iojXwD14Ib6tKWfW9x11E+lYNedG9Vj?=
 =?us-ascii?Q?uE2k3N8gLJZsi0y8scm5KkkXBl4SIPTBmStsJFcmqmU9/GFvi0wP9hq8T+In?=
 =?us-ascii?Q?TdvgFe225O2tm+eX5PYSmZt3i/sjWJ95w3kZuHH2RH0/HjAd3/81TvGRvII7?=
 =?us-ascii?Q?19RRuJZAuGpZX9gX8MTOvOLPL+NTWQDGlqqHlGL7Bi4UvKREwqDTk22DRuNI?=
 =?us-ascii?Q?QxCDJgYw+3H4QEhf9UWtTWAOwnTKtkllAsp4FmkrIDe0vaCHdWYZTlnR0KEM?=
 =?us-ascii?Q?L20X2dRB66urEvDLGQh2Q0Z4m9hvJ2UHSTSSRztbmNFqCBJ7Civ2JU/y43+Y?=
 =?us-ascii?Q?fHEppiD+xmPrzzqghNauFTCIb+nd3GctQ2Vv77g0rt1D02EYb0mLjgSHI9fN?=
 =?us-ascii?Q?zJf3nIbILQbl29CiGBifZ6veUCQL++E+o/pxD3shstE9sgh7ggrnkEN6atX+?=
 =?us-ascii?Q?sbuSdPxIA66m+tqK2M7mrJgrMx1IAiW6W2J/vALDhFhGwVKxrdFfCNRKdKdF?=
 =?us-ascii?Q?DQzpOGu8z3sr3aGsBDb2pzQuke8CJOrWStElOSJgrfkrIUgvaVpSaChJY3EW?=
 =?us-ascii?Q?nYJ6I716Dp/x29Qtb7K3jBdBRbdHi3dXaTwDR7HRkiV7QCbvUJbQgvslxzSK?=
 =?us-ascii?Q?f5DesSPW9TIzxcqa2YBRlYG/G0XOSRTI+aMzpsyRVCKrBtI2i27TFmnTHCpM?=
 =?us-ascii?Q?NzGGz4JHTedFz7Tx5MLbxZXFEKCBV8Bfl3AzPIzJY6A49PJhPDlSy8grDJb5?=
 =?us-ascii?Q?Udl5aRIQ7uNDM54hiCyH47cpw3BXVVyHKGnP58UcnDZHpEXxoBgHn3ApSzgM?=
 =?us-ascii?Q?Sb6/z0rq3VcnOfqeFzDbT02TJSBErKU5RoK0/bYKSD+Glg6ajUlh3uZzOLT4?=
 =?us-ascii?Q?Tw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58224FBEE79C570C5CCDE5808458AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819f1b9c-eb04-4c46-4000-08db6e6343cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 12:14:42.1133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+lQ5MzUgx7HQx2/YOAjEjtKkIS37YYy5zz7VORXb4+TFdZNi7APpd3ap4UH7PNCN3l4l7JElj9lhI+UOiPnTIqO+fqutG5Plo3jwEY5UP39urYJ76TFt21L3JKUB0Q3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-Proofpoint-ORIG-GUID: D40vMolUwbMfv_0vXQ_9YvkUI2VRM_AK
X-Proofpoint-GUID: D40vMolUwbMfv_0vXQ_9YvkUI2VRM_AK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=941
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183016

--_000_MW4PR11MB58224FBEE79C570C5CCDE5808458AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, June 16, 2023 5:35 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [OE-core] [PATCH] samba: fix CVE-2022-41916

Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.
Versions prior to 7.7.1 are vulnerable to a denial of service
vulnerability in Heimdal's PKI certificate validation library,
affecting the KDC (via PKINIT) and kinit (via PKINIT), as well as
any third-party applications using Heimdal's libhx509. Users
should upgrade to Heimdal 7.7.1 or 7.8. There are no known
workarounds for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41916

Upstream patches:
https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03=
af80c2c

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-41916.patch          | 38 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-41916.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-4191=
6.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.p=
atch
new file mode 100644
index 000000000..07f4a18a2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch
@@ -0,0 +1,38 @@
+From eb87af0c2d189c25294c7daf483a47b03af80c2c Mon Sep 17 00:00:00 2001
+From: Jeffrey Altman <jaltman@secure-endpoints.com>
+Date: Wed, 17 Nov 2021 20:00:29 -0500
+Subject: [PATCH] lib/wind: find_normalize read past end of array
+
+find_normalize() can under some circumstances read one element
+beyond the input array.  The contents are discarded immediately
+without further use.
+
+This change prevents the unintended read.
+
+(cherry picked from commit 357a38fc7fb582ae73f4b7f4a90a4b0b871b149e)
+
+Change-Id: Ia2759a5632d64f7fa6553f879b5bbbf43ba3513e
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/eb87a=
f0c2d189c25294c7daf483a47b03af80c2c]
+CVE: CVE-2022-41916
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/wind/normalize.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/wind/normalize.c b/lib/wind/normalize.c
+index 20e8a4a04b..8f3991d10e 100644
+--- a/lib/wind/normalize.c
++++ b/lib/wind/normalize.c
+@@ -227,9 +227,9 @@ find_composition(const uint32_t *in, unsigned in_len)
+       unsigned i;
+
+       if (n % 5 =3D=3D 0) {
+-          cur =3D *in++;
+           if (in_len-- =3D=3D 0)
+               return c->val;
++          cur =3D *in++;
+       }
+
+       i =3D cur >> 16;
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index cc07d51dc..fcec63752 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -31,6 +31,7 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-3437-0007.patch;patchdir=3Dsource4/heimdal \
            file://CVE-2022-3437-0008.patch;patchdir=3Dsource4/heimdal \
            file://CVE-2022-45142.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-41916.patch;patchdir=3Dsource4/heimdal \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0


--_000_MW4PR11MB58224FBEE79C570C5CCDE5808458AMW4PR11MB5822namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Please ignore this patch</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, June 16, 2023 5:35 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [OE-core] [PATCH] samba: fix CVE-2022-41916</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Heimdal is an implementation of ASN.1/DER, PKIX, a=
nd Kerberos.<br>
Versions prior to 7.7.1 are vulnerable to a denial of service<br>
vulnerability in Heimdal's PKI certificate validation library,<br>
affecting the KDC (via PKINIT) and kinit (via PKINIT), as well as<br>
any third-party applications using Heimdal's libhx509. Users<br>
should upgrade to Heimdal 7.7.1 or 7.8. There are no known<br>
workarounds for this issue.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41916">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-41916</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7d=
af483a47b03af80c2c">https://github.com/heimdal/heimdal/commit/eb87af0c2d189=
c25294c7daf483a47b03af80c2c</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../samba/samba/CVE-2022-41916.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 38 +++++++++++++++++++<br>
&nbsp;.../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 1 +<br>
&nbsp;2 files changed, 39 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-41916.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-4191=
6.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.p=
atch<br>
new file mode 100644<br>
index 000000000..07f4a18a2<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch=
<br>
@@ -0,0 +1,38 @@<br>
+From eb87af0c2d189c25294c7daf483a47b03af80c2c Mon Sep 17 00:00:00 2001<br>
+From: Jeffrey Altman &lt;jaltman@secure-endpoints.com&gt;<br>
+Date: Wed, 17 Nov 2021 20:00:29 -0500<br>
+Subject: [PATCH] lib/wind: find_normalize read past end of array<br>
+<br>
+find_normalize() can under some circumstances read one element<br>
+beyond the input array.&nbsp; The contents are discarded immediately<br>
+without further use.<br>
+<br>
+This change prevents the unintended read.<br>
+<br>
+(cherry picked from commit 357a38fc7fb582ae73f4b7f4a90a4b0b871b149e)<br>
+<br>
+Change-Id: Ia2759a5632d64f7fa6553f879b5bbbf43ba3513e<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/eb87af0c2d189c25294c7daf483a47b03af80c2c">https://github.com/heimdal/=
heimdal/commit/eb87af0c2d189c25294c7daf483a47b03af80c2c</a>]<br>
+CVE: CVE-2022-41916<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/wind/normalize.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/wind/normalize.c b/lib/wind/normalize.c<br>
+index 20e8a4a04b..8f3991d10e 100644<br>
+--- a/lib/wind/normalize.c<br>
++++ b/lib/wind/normalize.c<br>
+@@ -227,9 +227,9 @@ find_composition(const uint32_t *in, unsigned in_len)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (n % 5 =3D=3D 0) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur =3D *in++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (in_len-- =
=3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return c-&gt;val;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur =3D *in++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i =3D cur &gt;&gt; 16;<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
index cc07d51dc..fcec63752 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
@@ -31,6 +31,7 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar.=
gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-3437-0007.patch;patchdir=3Dsource4/heimdal">file://CVE-=
2022-3437-0007.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-3437-0008.patch;patchdir=3Dsource4/heimdal">file://CVE-=
2022-3437-0008.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-45142.patch;patchdir=3Dsource4/heimdal">file://CVE-2022=
-45142.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-41916.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-41916=
.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI:append:libc-musl =3D &quot; \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58224FBEE79C570C5CCDE5808458AMW4PR11MB5822namp_--

