Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF7FC7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 07:42:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16831.1684741327060594868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 00:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Perf83V0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45066519dd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34M6AHEd004835
	for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 00:42:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=fE4EgPAX7OPz+Hw1e7BXU/IMuvvu/2wgZdWw3qTtezE=;
 b=Perf83V06VUb9HPjyeIL13FuTO017BnmcScVv83b2CnyZ8Js6TSrantbAnf5+yJ5VgGo
 OWwSiXmqi4bg5J0HjanmYgEU/Aopu9P0S77ehldyJgjf5PVU3OXL5ZZEKjromHvkDOi2
 p+rImhCYUIjkGiB+MZkDy9LWv0LNqQHBOeH1sL9ILIC6qTP9NHR1xfr0ZLjXo5rPMiur
 BdCwJfaPoq8zwEOvVuO+M9K7Qe1Ry/KgQ31xIbVcsRHUHAwWhi8dZoWze+nDhUAqiMvi
 yQ6eeGtpOkQx8PdPLUJ15EwMssBTDuflx3PAevZmQRxNiixbKRRZzCiZgTc422eBWiIl Nw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqh98ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 00:42:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjvWsC3RwdzjafVVF+Al9h+pLJMG2v5CxMK3+w55yfqFXDWpgAyndy/yV+jtWoRSkfb7rtE3tBYCIUsuFx9ide8tZn9ELgt6I4a4Qsn7syxiNEe/srAptMOnXk+SD743efcvcMBhxq1pwx1F+4DLGdWrY2au450oUr1jwgd3fxVmLEOhTYLzYSSsPXfnaENW0+GHiqxuJAKMEFwdiMjRlKaIS8e3Fr8CUI58v1e85ok5LYdVBwcNzURyZ1tOL3wWx2KJsM0R+2p2fLawR2+3Q5l4oEMZnp6pmOwl2FZMGqHGDUlo20YDJKubMC7QKCbaV3G2DUJeRGzxNFkEKBMo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE4EgPAX7OPz+Hw1e7BXU/IMuvvu/2wgZdWw3qTtezE=;
 b=CpKuMHIDDlq0UXEHAOXsyebdWjUV00inDIFy5cyBoPy4Fxpb35rc1Zm5DktdKZ6YnTDpCHFUy41ayqGrAc90rfTbshaoiFBHbWdF0xCM7KYsRCLzYRRNechslXgUQgqsyMglY+dSAfrs1ue+fL95jtQAkRN2aSYWJHzKOPGpNoJXM+GN65FK+pCtPTPi253Rooy9eEfsEQ9rf4c6n9qMom2BjqagUhE7fYZhLm5SLqDWsjYu0/Ahoi5Xyv9VnWuuPdquveXaPiBKoOjgFBqrzgVlUF3S2brkfXSTmOY8WTsmgHe4mKHtNAyJzAu0uKgghJWEVyrSqVlREp9hj+8HHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 07:42:02 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::807d:863b:7a29:4e59]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::807d:863b:7a29:4e59%5]) with mapi id 15.20.6411.021; Mon, 22 May 2023
 07:42:02 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] git: ignore CVE-2023-25815
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] git: ignore CVE-2023-25815
Thread-Index: AQHZjIBhGcNF/fhOtUaIHzL9RqN7aq9l58wK
Date: Mon, 22 May 2023 07:42:02 +0000
Message-ID: 
 <MW4PR11MB58221213AD084284220E10D884439@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <17616718B5319F0F.20228@lists.openembedded.org>
In-Reply-To: <17616718B5319F0F.20228@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|SN7PR11MB7468:EE_
x-ms-office365-filtering-correlation-id: 2dfddd0e-ea57-4b1f-e3fe-08db5a98085d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JpqBel08mwZ4w2Mj3B1suwle27jWFZ/Iyr5WKkm4Y6GvhsF0y/Ydg8ko6w656PTo/wXLlwZqgZz9yIdXVL/toPhAbYfx9nT7EzMn9C8r3wHC8esJ6SZvPMsnsTOVrsAjedQ6CjhGWPq4pvTS1oFb0lvY4cN7sGBa/HkIvY8smWL1VDKIfwF6ZIa3JcxlWf9e7SdQXYD8qceE4ARIQNRd0k/oeoyisJBhrwTt3GYj7IwEjVZY6WN9LpAO5r6CmWHNuxKRv1YIGmKLClHOKN7lG2YyjSDeWDyIGEquERi6wJX6b9RbtKpBBuD881jx9ORNma4XrSWxmrQYY+nlev20KRnDj4GIbAYld8ej8xQm1m+yPF1PneWpFZiBUwmA3Wjggxb3jXLOr6UqTtV+157lajBWfSVnS0karj/ya2lPsPvg/rQ4oeJ695gkc23SarxrdZU6XRmfRbFiKBNCAGU15F77HkeCOVjzZvYQj9S2HYrrzsfRcpyFDV0+aA+OTb1RNg+9C8fRfBxivdxKvZXcORssWTVUcUJJaR/mEC0I/qWCUV41MeEb+XSjfnCHlc7dRhthsjSjD4jULY/FjnrncK0tcantE9gsdHmrt5Ilb/0txX1Lql+5i5T4T9wsAQTzQ9w7+9W2zDpL+2XN3VZDy64ibAt8MeCtiN8jbrlxlns=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(451199021)(1690799014)(966005)(8936002)(5660300002)(52536014)(8676002)(83380400001)(33656002)(66574015)(2906002)(186003)(122000001)(166002)(38070700005)(38100700002)(86362001)(55016003)(107886003)(6506007)(9686003)(316002)(71200400001)(66476007)(66446008)(64756008)(4326008)(66556008)(19627405001)(478600001)(110136005)(91956017)(76116006)(66946007)(7696005)(41300700001)(460985005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?G19ry/QQnlMCC6wDlcK7c6cOLplTHKbew5lGLSZN/K0bwwRUZLrkkkGoqI?=
 =?iso-8859-1?Q?0IizSRNO9MTqcrO7cUA5nHokvkJOF9yHFej+mRtU2wF7AEQ1376cXxXefX?=
 =?iso-8859-1?Q?VDkUJJV1hEeFsMm9hutQiPggAgInVGuGGU4oGau2ot4NgVFJMLmVjpM408?=
 =?iso-8859-1?Q?3NGKNUAREgVm6Wlp8DBbLvHjABySoQuROEPc6gZ6yDw0vilEQAQtzm/P2R?=
 =?iso-8859-1?Q?qPQ2uwkzd8mWJX9oU5aIV7hr3mdR/XI6orT7RLSx7rEQmxqba77b9iCmB6?=
 =?iso-8859-1?Q?cwchWiCboLigU4Kh3VAgbr+FE+Y9UtrljZZtguKQQevxoOispsu+AulZat?=
 =?iso-8859-1?Q?S3uX8ndsc2TSFXxjbV2JbedKaeJjxv3JdyKKP4dR3ho5dLjj4Pe/AG3zuF?=
 =?iso-8859-1?Q?ACKg1zUkeZhAh9huNbDifP0xVa9XNSe+e41qnqko2pxVHSS7IU0H/41Box?=
 =?iso-8859-1?Q?h1AcVrlZ3QB5eg0XPEhV058QlPCNaorCAPpWtIPaOqNmfkDV/o79l+my6k?=
 =?iso-8859-1?Q?obN1VY/tg5NZ9jbkGhHypkGTUse8OsV9RLwwY5SUdKuxY4DIz7ANeWXJD2?=
 =?iso-8859-1?Q?B4j2s2S/TbkKn/Xg3cKdJnWnPszJv06QRqYiSjG7UPhSRQGopew2XLuUqH?=
 =?iso-8859-1?Q?DRwU5NQfXOEHoRUBo02RicSi3SKC2sY2xmjenJ++/YBKMV0N70o/uGtSSn?=
 =?iso-8859-1?Q?N7VnVg7MUvYHM5vdN73XC08kSb/EwFaK26T8kqOFHpejUB3nEF7WcAJ6/Q?=
 =?iso-8859-1?Q?XwiQ802eOdR3ibzqExJA8tLda9Z7A8LQXaHNKSGqTCJLIB9lJNSIuQwSUH?=
 =?iso-8859-1?Q?g64aBVs1oU5XiFHhNm/PKi/lj/v3yx8Ii5Mw3otf6JHD5Kgx8kSTf0z4UT?=
 =?iso-8859-1?Q?lD2tW8FvH2PNdWVlEFePBZQDhqLBcu0lxOBS+HL223PPb5gaJZomm+SXM0?=
 =?iso-8859-1?Q?VB8gZ5rjikRdslD1L/yK9iHemQLt2UsfGbhzhzaDZMoayE7lFhQJo4WjzL?=
 =?iso-8859-1?Q?2H9wAt/K1K21hmhrOz0d5CAnPfM+jAgg7eB9lMEE/HzGIXyZFtrX+YVGeA?=
 =?iso-8859-1?Q?rt1n/WAnKpncaHKDwRI1aE8xqyf78mFvjNMKGHcVUBKlaeru3bMb9LHuhn?=
 =?iso-8859-1?Q?0GFV0S7Z/HtsE5tcAUeXr1vbfs2AQgXmKsc9j3FjO48lcfPm2OyzQy+p8K?=
 =?iso-8859-1?Q?G/CAsiFV/XjtP1uXI4sZJy31fZQ3stjXXtLuZTlG9G/vroeo0WI8IPbeIk?=
 =?iso-8859-1?Q?gKmpaLutx5XWQdeh8pfUgTQdQUjKbDFGxLJrJljCnTG0g65UXeCP7AncJa?=
 =?iso-8859-1?Q?VfSXZHZSDxEg3MOZQK1WdMRTQ1HyG0ZwI8y4Pz0lzKHfkQBbH+vGwV5MWf?=
 =?iso-8859-1?Q?EIDb1217yDD6JldV/N2LVEc43ZkqFhJ5CnBbTqGNGo4ltZdBrsB096q+N6?=
 =?iso-8859-1?Q?LthDfBt2ygPrm8ZzJQZiD4wAzKd4/BCn/r0ULucp6D8R+qlpU2DLfiyxyG?=
 =?iso-8859-1?Q?39/e97HafAXH8C8zZvmwFCy00htJJpJ66E+jwPVsUGKtL3o55qBV2/GOVz?=
 =?iso-8859-1?Q?LAt+clfn2uPki1gGnZ+kjEiHvq7g08ukSvZmoiKXyGykiC6CYMFNvfXiEC?=
 =?iso-8859-1?Q?Y8bdsLaUS/OLnF7MhTnvRtaNBdNWUYyGyOrl4tvD/eRhvALbms73bzr0V2?=
 =?iso-8859-1?Q?6vs+R3k3ERZiwuk0WECnBvXv0eT2qxI3kIe3E4HrgXhGVAyqxdGPFbPTQ2?=
 =?iso-8859-1?Q?XXig=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58221213AD084284220E10D884439MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfddd0e-ea57-4b1f-e3fe-08db5a98085d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 07:42:02.4533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bf5/4c/YK94xkcMBBM72/WzJxaYJ+pCiBmAoc4BRrMb7LVbnW/SgoN0FyK3Z/43ZLoFWYTKHD9d+dp4n/mKqEfQdYpZ4/GBm/u+oevyYkcS//AjLqqIfPVJ3AT4ySbQP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
X-Proofpoint-GUID: R2ypGLgc1antpscKGV-oaSJYEqNOtaWJ
X-Proofpoint-ORIG-GUID: R2ypGLgc1antpscKGV-oaSJYEqNOtaWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=755
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305220065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 07:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181583

--_000_MW4PR11MB58221213AD084284220E10D884439MW4PR11MB5822namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

NVD site  https://nvd.nist.gov/vuln/detail/CVE-2023-25815 is stating that C=
VE affects the Git for Windows and Debain security tracker - https://securi=
ty-tracker.debian.org/tracker/CVE-2023-25815
has provided the CVE  fix commit https://github.com/git/git/commit/c4137be0=
f5a6edf9a9044e6e43ecf4468c7a4046 and stated that CVE fixed in Debain unstab=
le version(sid)


Kindly review the CVE, If it affects only Windows please approve the patch =
else please respond I will try to send patch for CVE fix.

CVE description:
In Git for Windows, the Windows port of Git, no localized messages are ship=
ped with the installer. As a consequence, Git is expected not to localize m=
essages at all, and skips the gettext initialization. However, due to a cha=
nge in MINGW-packages, the `gettext()` function's implicit initialization n=
o longer uses the runtime prefix but uses the hard-coded path `C:\mingw64\s=
hare\locale` to look for localized messages. And since any authenticated us=
er has the permission to create folders in `C:\` (and since `C:\mingw64` do=
es not typically exist), it is possible for low-privilege users to place fa=
ke messages in that location where `git.exe` will pick them up in version 2=
.40.1. This vulnerability is relatively hard to exploit and requires social=
 engineering. For example, a legitimate message at the end of a clone could=
 be maliciously modified to ask the user to direct their web browser to a m=
alicious website, and the user might think that the message comes from Git =
and is legitimate. It does require local write access by the attacker, thou=
gh, which makes this attack vector less likely. Version 2.40.1 contains a p=
atch for this issue. Some workarounds are available. Do not work on a Windo=
ws machine with shared accounts, or alternatively create a `C:\mingw64` fol=
der and leave it empty. Users who have administrative rights may remove the=
 permission to create folders in `C:\`.


References:
https://nvd.nist.gov/vuln/detail/CVE-2023-25815
https://github.com/git-for-windows/git/security/advisories/GHSA-9w66-8mq8-5=
vm8
https://security-tracker.debian.org/tracker/CVE-2023-25815
https://github.com/git/git/commit/c4137be0f5a6edf9a9044e6e43ecf4468c7a4046
[https://opengraph.githubassets.com/378f0913a5e21a34e25674de17d23163b810deb=
2ea3446cc80bff6a0804522c7/git/git/commit/c4137be0f5a6edf9a9044e6e43ecf4468c=
7a4046]<https://github.com/git/git/commit/c4137be0f5a6edf9a9044e6e43ecf4468=
c7a4046>
gettext: avoid using gettext if the locale dir is not present =B7 git/git@c=
4137be<https://github.com/git/git/commit/c4137be0f5a6edf9a9044e6e43ecf4468c=
7a4046>
In cc5e1bf99247 (gettext: avoid initialization if the locale dir is not pre=
sent, 2018-04-21) Git was taught to avoid a costly gettext start-up when th=
ere are not even any localized messages to work...
github.com

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Monday, May 22, 2023 1:06 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] git: ignore CVE-2023-25815

This is specific to Git-for-Windows.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/git/git_2.39.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtool=
s/git/git_2.39.2.bb
index 222e545f60..9fac9d13f8 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.2.bb
@@ -33,6 +33,8 @@ CVE_PRODUCT =3D "git-scm:git"
 CVE_CHECK_IGNORE +=3D "CVE-2022-24975"
 # This is specific to Git-for-Windows
 CVE_CHECK_IGNORE +=3D "CVE-2022-41953"
+# This is specific to Git-for-Windows
+CVE_CHECK_IGNORE +=3D "CVE-2023-25815"

 PACKAGECONFIG ??=3D "expat curl"
 PACKAGECONFIG[cvsserver] =3D ""
--
2.40.0


--_000_MW4PR11MB58221213AD084284220E10D884439MW4PR11MB5822namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Hi,
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">NVD site&nbsp; <span style=3D"display: inline=
 !important; background-color: rgb(255, 255, 255);" class=3D"ContentPasted1=
">
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-25815" id=3D"LPlnk2821=
93">https://nvd.nist.gov/vuln/detail/CVE-2023-25815</a>&nbsp;</span>is stat=
ing that CVE affects the Git for Windows and Debain security tracker -&nbsp=
;<span style=3D"display: inline !important; background-color: rgb(255, 255,=
 255);" class=3D"ContentPasted2"><a href=3D"https://security-tracker.debian=
.org/tracker/CVE-2023-25815" id=3D"LPlnk126987">https://security-tracker.de=
bian.org/tracker/CVE-2023-25815</a></span></div>
<div class=3D"ContentPasted0">has provided the CVE &nbsp;fix commit&nbsp;<s=
pan style=3D"display: inline !important; background-color: rgb(255, 255, 25=
5);" class=3D"ContentPasted3"><a href=3D"https://github.com/git/git/commit/=
c4137be0f5a6edf9a9044e6e43ecf4468c7a4046" id=3D"LPNoLPOWALinkPreview_1">htt=
ps://github.com/git/git/commit/c4137be0f5a6edf9a9044e6e43ecf4468c7a4046</a>=
</span>
 and stated that CVE fixed in Debain unstable version(sid)</div>
<div><br class=3D"ContentPasted0">
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Kindly review the CVE, If it affects only Win=
dows please approve the patch else please respond I will try to send patch =
for CVE fix.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">CVE description:</div>
<div class=3D"ContentPasted0">In Git for Windows, the Windows port of Git, =
no localized messages are shipped with the installer. As a consequence, Git=
 is expected not to localize messages at all, and skips the gettext initial=
ization. However, due to a change
 in MINGW-packages, the `gettext()` function's implicit initialization no l=
onger uses the runtime prefix but uses the hard-coded path `C:\mingw64\shar=
e\locale` to look for localized messages. And since any authenticated user =
has the permission to create folders
 in `C:\` (and since `C:\mingw64` does not typically exist), it is possible=
 for low-privilege users to place fake messages in that location where `git=
.exe` will pick them up in version 2.40.1. This vulnerability is relatively=
 hard to exploit and requires social
 engineering. For example, a legitimate message at the end of a clone could=
 be maliciously modified to ask the user to direct their web browser to a m=
alicious website, and the user might think that the message comes from Git =
and is legitimate. It does require
 local write access by the attacker, though, which makes this attack vector=
 less likely. Version 2.40.1 contains a patch for this issue. Some workarou=
nds are available. Do not work on a Windows machine with shared accounts, o=
r alternatively create a `C:\mingw64`
 folder and leave it empty. Users who have administrative rights may remove=
 the permission to create folders in `C:\`.</div>
<div><br class=3D"ContentPasted0">
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">References:</div>
<div class=3D"ContentPasted0">https://nvd.nist.gov/vuln/detail/CVE-2023-258=
15</div>
<div class=3D"ContentPasted0">https://github.com/git-for-windows/git/securi=
ty/advisories/GHSA-9w66-8mq8-5vm8</div>
<div class=3D"ContentPasted0">https://security-tracker.debian.org/tracker/C=
VE-2023-25815</div>
<a href=3D"https://github.com/git/git/commit/c4137be0f5a6edf9a9044e6e43ecf4=
468c7a4046" id=3D"LPlnkOWALinkPreview">https://github.com/git/git/commit/c4=
137be0f5a6edf9a9044e6e43ecf4468c7a4046</a><br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1">
<div id=3D"LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL2dpdC9naXQvY29tbWl0L2M0MTM3Y=
mUwZjVhNmVkZjlhOTA0NGU2ZTQzZWNmNDQ2OGM3YTQwNDY." class=3D"LPBorder248009" s=
tyle=3D"width: 100%; margin-top: 16px; margin-bottom: 16px; position: relat=
ive; max-width: 800px; min-width: 424px;">
<table id=3D"LPContainer248009" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td>
<div id=3D"LPImageContainer248009" style=3D"position: relative; margin-righ=
t: 12px; height: 120px; overflow: hidden; width: 240px;">
<a target=3D"_blank" id=3D"LPImageAnchor248009" href=3D"https://github.com/=
git/git/commit/c4137be0f5a6edf9a9044e6e43ecf4468c7a4046"><img id=3D"LPThumb=
nailImageId248009" alt=3D"" height=3D"120" style=3D"display: block;" width=
=3D"240" src=3D"https://opengraph.githubassets.com/378f0913a5e21a34e25674de=
17d23163b810deb2ea3446cc80bff6a0804522c7/git/git/commit/c4137be0f5a6edf9a90=
44e6e43ecf4468c7a4046"></a></div>
</td>
<td style=3D"width: 100%;">
<div id=3D"LPTitle248009" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: wf_segoe-ui_light, &quot;Segoe UI Light&quot;, &=
quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Taho=
ma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor248009" href=3D"https://github.com/gi=
t/git/commit/c4137be0f5a6edf9a9044e6e43ecf4468c7a4046" style=3D"text-decora=
tion: none;">gettext: avoid using gettext if the locale dir is not present =
=B7 git/git@c4137be</a></div>
<div id=3D"LPDescription248009" style=3D"font-size: 14px; max-height: 100px=
; font-family: wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quo=
t;, Tahoma, Arial, sans-serif; margin-bottom: 12px; margin-right: 8px; over=
flow: hidden; color: rgb(102, 102, 102);">
In cc5e1bf99247 (gettext: avoid initialization if the locale dir is not pre=
sent, 2018-04-21) Git was taught to avoid a costly gettext start-up when th=
ere are not even any localized messages to work...</div>
<div id=3D"LPMetadata248009" style=3D"font-size: 14px; font-weight: 400; fo=
nt-family: wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, =
Tahoma, Arial, sans-serif; color: rgb(166, 166, 166);">
github.com</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, May 22, 2023 1:06 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][kirkstone][PATCH 1/1] git: ignore CVE-2023-25815<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This is specific to Git-for-Windows.<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;meta/recipes-devtools/git/git_2.39.2.bb | 2 ++<br>
&nbsp;1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtool=
s/git/git_2.39.2.bb<br>
index 222e545f60..9fac9d13f8 100644<br>
--- a/meta/recipes-devtools/git/git_2.39.2.bb<br>
+++ b/meta/recipes-devtools/git/git_2.39.2.bb<br>
@@ -33,6 +33,8 @@ CVE_PRODUCT =3D &quot;git-scm:git&quot;<br>
&nbsp;CVE_CHECK_IGNORE +=3D &quot;CVE-2022-24975&quot;<br>
&nbsp;# This is specific to Git-for-Windows<br>
&nbsp;CVE_CHECK_IGNORE +=3D &quot;CVE-2022-41953&quot;<br>
+# This is specific to Git-for-Windows<br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2023-25815&quot;<br>
&nbsp;<br>
&nbsp;PACKAGECONFIG ??=3D &quot;expat curl&quot;<br>
&nbsp;PACKAGECONFIG[cvsserver] =3D &quot;&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58221213AD084284220E10D884439MW4PR11MB5822namp_--

