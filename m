Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C843C7EE2D
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 16:16:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15968.1685031402656233837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 09:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dr0c0vAs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4509a6bedf=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34PBx4Bv032598
	for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=WaVgyLeSz/+D61aUqEBMNoQofKYwaA/MuwIhfZ/0S9M=;
 b=dr0c0vAsshTacPqu8b+VFxS9zPwWCxnIPInY3EWV+bFLRP1HGC/ETWeebbcC35uv25Ug
 KNKjutLy3d9mP5u0CEt6+/M1lCNnOW0LCyAy53onIq8UX3vNsHvsYsOCP6voO4LOef2k
 mzRHP0GCEe32buEiHRgFbieiQ515sujngNm1NKYvdO6XAyjtngMGwr39xyZdR0KyKtJA
 OAeQhxZFrUKWeYQF4dDIAHk4BZQY4lQnZ+zLmjgVXrvlUYyHbq/civRpEvmqTKjBXh2d
 OkZ1GB3vHRuTNqotPzoAyif6SCX3df7E8OkcJjcSqA5ZlQd7a/qyJWCMTZILL90+FNDa xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpn67n8xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:16:41 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34PGE5Be021589
	for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:16:41 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpn67n8xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 16:16:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWrTW70rve+NtzTN0iOiv7Ip3nEJ7GM5Citms3jZ/U0riozWWLK0KCg4NfOazJV7c4Q0TX2GJAltK1UaxGqafz72T/WHj7rKMsjp9YT4HAcXDcXCBcSMzxp2iZ5xYoXSft0H74afVaMcdg7hLolHxQIe9zVbXtD+x5hIZ9sjUBMPteFkgWdSeN7zhLhCTfgnVxe1cczxPCV3tQB1niROt5iuc9bNb3jD0L8wyFgOV5iXhlsqyVWgj45evgMtOqpTFM9Lk51UkTc1Wec6484pGFOQlE38xOMZxSgDzIcozvBAbEpj3/FmYGcX4QgMJ4zzI6rW8qmsw59uHD6LQs9MaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaVgyLeSz/+D61aUqEBMNoQofKYwaA/MuwIhfZ/0S9M=;
 b=nbQTlPy+b6+ymSO4XHfmO5cE/nW6TKkPsmnMTnrFGHmgBAcRG4uvY2LckYl/9n0NVEpwIZ24n0j4mto07NylcXX7aGXliDdql4fFS0GOGW8Xl//7T84lb6hyX8VtyIA9AA3viEgKgdQ9mKHsIK+/wQG278g8DaGdqHmMnZ8bTDuiX4j0tyi6Vd/C8+LlgCqyFQMKhCWa/3+HU+Ach3H+qmoHFGbqBARVjy+qeHLuxcAY0ZMbCEw6CUvz0qpXzUPTT+Pj5le6qvY0ZR9IE8vi79I7YEIDwDOFQarDryyOl8oGY5Y4RqIAFgot3qYSvPXEkxu0u1SrU8vf0m1ilDpCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by CH0PR11MB5441.namprd11.prod.outlook.com (2603:10b6:610:d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 16:16:37 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::a57e:9abc:7716:6946]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::a57e:9abc:7716:6946%4]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 16:16:36 +0000
From: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        OE-core
	<openembedded-core@lists.openembedded.org>
Subject: rust reproducibility - QA warnings in Yocto
Thread-Topic: rust reproducibility - QA warnings in Yocto
Thread-Index: AQHZjwzqOeYuVJcI1EyZPXGm737uLg==
Date: Thu, 25 May 2023 16:16:36 +0000
Message-ID: 
 <CH2PR11MB447024369DC76958BB67634E89469@CH2PR11MB4470.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR11MB4470:EE_|CH0PR11MB5441:EE_
x-ms-office365-filtering-correlation-id: 3650a33e-39d5-46fb-acdc-08db5d3b6a28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z2fBfxCEu0AI4L1YYVSZS39jDiwncbmC+EzObKNSjOZxATWKmCzVwHxeRhcxCC2tpABVsHcdmpFztP7jsCRZv9yKO3zpdLWYWKHV1DWK+/6cn8O18nr7muUAZ9HzVX8CPOm3FHptYL7KDsoScRHXk4vJ66owe1huAgPqDelTKqlj36Cg/OrH/x5i7XxQewGzGX/GUvglY/XL2hPXjZGL75gQpBHWN5qSr0XJ34lUoZ2owRnv4XOqz5ZXHX7bVQz11T22T+NzLu6mcNfYWs4RLUXe7Jn73JgOcI7+GyDwkw9kmUivqxeGQIV0OFa+Rx1a6K26yOZyjPUQbt6TFF9XYDwh1WPWj1CHaQPmGk2vgZhGR3wBTZGN0qpYwTX1PQZQwHH/2PiFOV9wP9CXc9hWKE9HbspPYbXzUFMm6U6D9n/+7XhzPlp+qe/K7Fn4cHLTfcAkLeNEQpAXhbT1vpRBK7BXoYczwQg3okwq9JGhOYQBgn6dE14ItiM7s46Sf1lGlt0ahu5gsqsPne5sjiKwWIr7yqBAnzsq/K72/MNIjXJ6arfBG35SqN2nPlhC/OM75Ah0kAqAMW9bHgHWdtqNRYL5Abomp2gHRlTwhS7gsTttc8w9YptcZ64bqXaIZZng
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(451199021)(71200400001)(478600001)(33656002)(83380400001)(99936003)(86362001)(55016003)(38070700005)(38100700002)(122000001)(7696005)(9686003)(6506007)(26005)(41300700001)(186003)(316002)(2906002)(5660300002)(52536014)(19627405001)(4744005)(8676002)(54906003)(8936002)(66556008)(66946007)(76116006)(66446008)(91956017)(4326008)(6916009)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2GwQz4/+dkwqazvSwQBgRqweBtrvQKkhGpo3f4VLNGQftxBjayqq02aoYE?=
 =?iso-8859-1?Q?rBDgZjKjoJQtafUmvhqYqOhTosQHN5PjG/E6HCII3DcOmtLxCcFRCs4hoB?=
 =?iso-8859-1?Q?2Dp1AOeJvvela37wjcmz1kxOvhHOeyGZ3hG6xQAYh+6Co2wuH84GCJmJxW?=
 =?iso-8859-1?Q?yINMZz927GweWhLUzWrIUCzAi96RzKrid7/DmkKrJv52VxIa9FLzgFk83t?=
 =?iso-8859-1?Q?95YPwZh7fuLUKaYzHzQ8IRrpUcr2+APUzKjTn0n7Zs9LPKJcbHZkGEwPXe?=
 =?iso-8859-1?Q?fu9CVLxS7lgYZvYH0QLLi8AtqubS1rsXlJUeCvDaZ0ESXQgdh4FhgATB8M?=
 =?iso-8859-1?Q?tmcy7QtexW39k4g+IhgHusY4UhTU2tI2YydudL6gvosUrES2g/88sGudSh?=
 =?iso-8859-1?Q?2vz9sZuF5tcAXCFwLNc8+HII6esgF/t7Ro6v1bFUDfwghA9aMZImx4nWR6?=
 =?iso-8859-1?Q?60NVGvlTCrtp00nz9Fqp7TgU70bLwGfTdMoPeSkBZOHPgLSNvZVXerf5at?=
 =?iso-8859-1?Q?47pcNzrNgGPOOGWIkpZqbsCPHfi/SZ0tf9Q3RdJozHCpC4D9cKjpQiUykz?=
 =?iso-8859-1?Q?OyeEAiMiCpSQnezitfP/9y++WNI72v8nzkKIt3pEFiOwIAkfzBrV/jn7hY?=
 =?iso-8859-1?Q?3/opRvwXcd+PqigDonkgdY9bTwPSN9uswJT5S65nm7LQ4VoV7YGH5jBPmg?=
 =?iso-8859-1?Q?MYXWYf/rZ/HKJSicJxHgSun0XGT+Qzc+FdhG9aoet8eOGGlaQSgj80URMA?=
 =?iso-8859-1?Q?PlNH9sXjOaHSkn12xwZxJEDcjLWnyZNMZ1CRwwGzgHZBH2lgA43xhsYdcU?=
 =?iso-8859-1?Q?fGuvAn14Uo7XfeGGFrhvdn6zqCONjRWeS3Z24qu4lZSDvtvKd65093o88Z?=
 =?iso-8859-1?Q?pQlN5Pm6Rx0YBFBjd2R6NwGDpLho/tOO1OH1Rp04EyvJd8nMmfPKOmtnrV?=
 =?iso-8859-1?Q?ax6YZIFZnKqHwDGBF8Q0k/LJt/Ed3kVQw2DS/Y+0YSglu4kHpF/y3yGJts?=
 =?iso-8859-1?Q?G2ZqH7GpEqvi0P8wwuoGKaKrztWaXRAmCykQl8K5EfRgQgFqae3DPu8RuE?=
 =?iso-8859-1?Q?xZAeoH+N/JQ7+VhQy0GM5dXBx4EkeQ7ZZDL4FGPDqClVR9aF2QCmt0AVe+?=
 =?iso-8859-1?Q?vFi0Dod9bGKMEd1d2xPGmZDIqj185xJFjCa2c3JBj//VDWsX5UXE212yHj?=
 =?iso-8859-1?Q?K+3jGYKU4K0zBz2skWIkiF0zQx+6sxZX9An4JUmD38wYUHXNzhpMCdIL8q?=
 =?iso-8859-1?Q?/tMmIZ9FbbJ30dmc+mNuv/GT29zPPZZkS1mlKyOsyrT651xc7x9z7hlaE2?=
 =?iso-8859-1?Q?Q6SLK6rop/PF9bnleY0j6hnfsugSgirRoa/SAyGko5bzTUdhc2bAZpUrY4?=
 =?iso-8859-1?Q?cqgc3JkQdzDyWu+nwtJqcSibIruen4ntOEGy49jPSJbVzoC8QS/nTzs5+G?=
 =?iso-8859-1?Q?ORqksV6HkjLen65EFm2Sik1UZm1foHA09HB8wZ6I1NKTdBSgWv4iTqBPzq?=
 =?iso-8859-1?Q?tECzZAcNSoMm6sIfD3nKXm0wCgQl3a78XvWEOKVLc1ZobK4OzxAy5hINwj?=
 =?iso-8859-1?Q?IgMrbd5EN0zi3aFePjJk2z7B1/peyQJgrPWxQDNqg+zfOzjLOpuktD685t?=
 =?iso-8859-1?Q?x81usJZegK1Os2l65FZh/Q4WjhXsdGSeM4Hn+b7Zpy0vURbut/AAwdLA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_006_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3650a33e-39d5-46fb-acdc-08db5d3b6a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 16:16:36.8020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXJkBBebBnCSOLbDAExknsVsZRFYZ2bWiKWurvLLJpOluAfPEmiew1IUtYr3gYZY8uCZ8dNO8dfuNz/+7ItZFdfCsURJ8t2fvTYsHqOgq7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5441
X-Proofpoint-GUID: RODXN_DkGUQjneLPc46Eww9Tuj0JHdS9
X-Proofpoint-ORIG-GUID: TOfAdHhkW6x-3HBzuMGVKl1toM4VrkO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_08,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxlogscore=633 phishscore=0 clxscore=1011 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181721

--_006_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_
Content-Type: multipart/alternative;
	boundary="_000_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_"

--_000_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On the latest rust-1.69.0 sources by adding the '--remap-path-prefix' comma=
nd (as in attached remap-path.patch file) the generated binaries from diffe=
rent path are identical.
So, I've taken the same solution and applied on Yocto but it introduced man=
y more binary differences with a lot of QA Warnings (attached in Warnings.t=
xt).
Do you have any hint on why this difference in Yocto environment and any po=
inters to fix...



Thanks,
Sundeep K.


--_000_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello Richard,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
On the latest <i>rust-1.69.0</i> sources by adding the '<i>--remap-path-pre=
fix</i>' command (as in attached&nbsp;<i>remap-path.patch</i> file) the gen=
erated binaries from different path are identical.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
So, I've taken the same solution and applied on Yocto but it introduced man=
y more binary differences with a lot of QA Warnings (attached in
<i>Warnings.txt</i>).</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">Do you have any hint on why this difference =
in Yocto environment and any pointers to fix...</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sundeep K.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_--

--_006_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_
Content-Type: application/octet-stream; name="remap-path.patch"
Content-Description: remap-path.patch
Content-Disposition: attachment; filename="remap-path.patch"; size=749;
	creation-date="Thu, 25 May 2023 16:03:19 GMT";
	modification-date="Thu, 25 May 2023 16:03:43 GMT"
Content-Transfer-Encoding: base64

VGVzdA0KDQpVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3BhdGNoZXMgbmVlZCByZXdv
cmtdDQpTaWduZWQtb2ZmLWJ5OiBTdW5kZWVwIEsgPHN1bmRlZXAua29ra29uZGFAd2luZHJpdmVy
LmNvbT4NClNpZ25lZC1vZmYtYnk6IFN1bmRlZXAgSyA8c3VuZGVlcC5rb2trb25kYUB3aW5kcml2
ZXIuY29tPg0KDQotLS0gYS9zcmMvYm9vdHN0cmFwL2J1aWxkZXIucnMNCisrKyBiL3NyYy9ib290
c3RyYXAvYnVpbGRlci5ycw0KQEAgLTEzODAsNiArMTM4MCw4IEBADQogICAgICAgICAvLyB0aGlz
KSwgYXMgd2VsbCBhcyAjNjMwMTIgd2hpY2ggaXMgdGhlIHRyYWNraW5nIGlzc3VlIGZvciB0aGlz
DQogICAgICAgICAvLyBmZWF0dXJlIG9uIHRoZSBydXN0YyBzaWRlLg0KICAgICAgICAgY2FyZ28u
YXJnKCItWmJpbmFyeS1kZXAtZGVwaW5mbyIpOw0KKyAgICAgICAgbGV0IHJlbWFwY21kID0gJmZv
cm1hdCEoIi0tcmVtYXAtcGF0aC1wcmVmaXggUFdEL3J1c3RjLTEuNjkuMC1zcmMvYnVpbGQ9L3Vz
ci90bXAiKTsNCisgICAgICAgIGVudjo6c2V0X3ZhcigiUlVTVEZMQUdTIixyZW1hcGNtZCk7DQog
ICAgICAgICBsZXQgYWxsb3dfZmVhdHVyZXMgPSBtYXRjaCBtb2RlIHsNCiAgICAgICAgICAgICBN
b2RlOjpUb29sQm9vdHN0cmFwIHwgTW9kZTo6VG9vbFN0ZCA9PiB7DQogICAgICAgICAgICAgICAg
IC8vIFJlc3RyaWN0IHRoZSBhbGxvd2VkIGZlYXR1cmVzIHNvIHdlIGRvbid0IGRlcGVuZCBvbiBu
aWdodGx5DQo=

--_006_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_
Content-Type: application/octet-stream; name="rust-bb.patch"
Content-Description: rust-bb.patch
Content-Disposition: attachment; filename="rust-bb.patch"; size=1427;
	creation-date="Thu, 25 May 2023 16:03:20 GMT";
	modification-date="Thu, 25 May 2023 16:03:43 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYw0KaW5kZXggOWRjZWI5
MDRiNi4uYTZkMjZhYmFjZSAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0
L3J1c3Qtc291cmNlLmluYw0KKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1z
b3VyY2UuaW5jDQpAQCAtMiw2ICsyLDcgQEAgUlVTVF9WRVJTSU9OID89ICIke0BkLmdldFZhcign
UFYnKS5zcGxpdCgnLScpWzBdfSINCg0KIFNSQ19VUkkgKz0gImh0dHBzOi8vc3RhdGljLnJ1c3Qt
bGFuZy5vcmcvZGlzdC9ydXN0Yy0ke1JVU1RfVkVSU0lPTn0tc3JjLnRhci54ejtuYW1lPXJ1c3Qg
XA0KICAgICAgICAgICAgIGZpbGU6Ly9oYXJkY29kZXBhdGhzLnBhdGNoO3BhdGNoZGlyPSR7UlVT
VFNSQ30gXA0KKyAgICAgICAgICAgIGZpbGU6Ly9yZW1hcC1wYXRoLnBhdGNoO3BhdGNoZGlyPSR7
UlVTVFNSQ30gXA0KICAgICAgICAgICAgIGZpbGU6Ly9nZXRyYW5kb20tb3BlbjY0LnBhdGNoO3Bh
dGNoZGlyPSR7UlVTVFNSQ30gXA0KICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5vdC11c2Ut
TEZTNjQtb24tbGludXgtd2l0aC1tdXNsLnBhdGNoO3BhdGNoZGlyPSR7UlVTVFNSQ30gXA0KICAg
ICAgICAgICAgIGZpbGU6Ly96bGliLW9mZjY0X3QucGF0Y2g7cGF0Y2hkaXI9JHtSVVNUU1JDfSBc
DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdF8xLjY5LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjkuMC5iYg0KaW5kZXggODNmOWJl
YzY4YS4uNDYwM2JlMGYzOCAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0
L3J1c3RfMS42OS4wLmJiDQorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEu
NjkuMC5iYg0KQEAgLTQ3LDYgKzQ3LDEyIEBAIHNldHVwX2NhcmdvX2Vudmlyb25tZW50ICgpIHsN
Cg0KIGluaGVyaXQgcnVzdC10YXJnZXQtY29uZmlnDQoNCithZGR0YXNrIGRvX3Bvc3RwYXRjaCBh
ZnRlciBkb19wYXRjaCBiZWZvcmUgZG9fY29tcGlsZQ0KKw0KK2RvX3Bvc3RwYXRjaCAoKSB7DQor
ICAgIHNlZCAtaSAiMTM4M3N8UFdEfCR7V09SS0RJUn18ZyIgJHtXT1JLRElSfS9ydXN0Yy0xLjY5
LjAtc3JjL3NyYy9ib290c3RyYXAvYnVpbGRlci5ycw0KK30NCisNCiBkb19ydXN0X3NldHVwX3Nu
YXBzaG90ICgpIHsNCiAgICAgZm9yIGluc3RhbGxlciBpbiAiJHtXT1JLRElSfS9ydXN0LXNuYXBz
aG90LWNvbXBvbmVudHMvIioiL2luc3RhbGwuc2giOyBkbw0KICAgICAgICAgIiR7aW5zdGFsbGVy
fSIgLS1wcmVmaXg9IiR7V09SS0RJUn0vcnVzdC1zbmFwc2hvdCIgLS1kaXNhYmxlLWxkY29uZmln
DQo=

--_006_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_
Content-Type: text/plain; name="Warnings.txt"
Content-Description: Warnings.txt
Content-Disposition: attachment; filename="Warnings.txt"; size=4072;
	creation-date="Thu, 25 May 2023 16:15:33 GMT";
	modification-date="Thu, 25 May 2023 16:16:36 GMT"
Content-Transfer-Encoding: base64

V0FSTklORzogcnVzdC0xLjY5LjAtcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IEZpbGUgL3Vz
ci9saWIvcnVzdGxpYi94ODZfNjQtcG9reS1saW51eC1nbnUvbGliLy5kZWJ1Zy9saWJzdGQtZjg3
YjgxMzBjZWI3NmM4Zi5zbyBpbiBwYWNrYWdlIHJ1c3QtZGJnIGNvbnRhaW5zIHJlZmVyZW5jZSB0
byBUTVBESVINCkZpbGUgL3Vzci9saWIvcnVzdGxpYi94ODZfNjQtcG9reS1saW51eC1nbnUvbGli
Ly5kZWJ1Zy9saWJ0ZXN0LWYxNzA3MjNkYjNkZjQzY2Euc28gaW4gcGFja2FnZSBydXN0LWRiZyBj
b250YWlucyByZWZlcmVuY2UgdG8gVE1QRElSDQpGaWxlIC91c3IvbGliLy5kZWJ1Zy9saWJydXN0
Y19tYWNyb3MtZjg2MjkxZGMxZmJkYWE1NC5zbyBpbiBwYWNrYWdlIHJ1c3QtZGJnIGNvbnRhaW5z
IHJlZmVyZW5jZSB0byBUTVBESVINCkZpbGUgL3Vzci9saWIvLmRlYnVnL2xpYnN0ZC1mODdiODEz
MGNlYjc2YzhmLnNvIGluIHBhY2thZ2UgcnVzdC1kYmcgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRN
UERJUg0KRmlsZSAvdXNyL2xpYi8uZGVidWcvbGliZGVyaXZlX21vcmUtZDc3YzkwN2NjYTE4YjUz
Mi5zbyBpbiBwYWNrYWdlIHJ1c3QtZGJnIGNvbnRhaW5zIHJlZmVyZW5jZSB0byBUTVBESVINCkZp
bGUgL3Vzci9saWIvLmRlYnVnL2xpYnRlc3QtZjE3MDcyM2RiM2RmNDNjYS5zbyBpbiBwYWNrYWdl
IHJ1c3QtZGJnIGNvbnRhaW5zIHJlZmVyZW5jZSB0byBUTVBESVINCkZpbGUgL3Vzci9saWIvLmRl
YnVnL2xpYnNlcmRlX2Rlcml2ZS1jYTVkNTA0YTdhZThmMWU4LnNvIGluIHBhY2thZ2UgcnVzdC1k
YmcgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUiBbYnVpbGRwYXRoc10NCldBUk5JTkc6IHJ1
c3QtMS42OS4wLXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOiBGaWxlIC91c3IvYmluL3J1c3Rm
bXQgaW4gcGFja2FnZSBydXN0LXRvb2xzLXJ1c3RmbXQgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRN
UERJUiBbYnVpbGRwYXRoc10NCldBUk5JTkc6IHJ1c3QtMS42OS4wLXIwIGRvX3BhY2thZ2VfcWE6
IFFBIElzc3VlOiBGaWxlIC91c3IvYmluL2NhcmdvLWNsaXBweSBpbiBwYWNrYWdlIHJ1c3QtdG9v
bHMtY2xpcHB5IGNvbnRhaW5zIHJlZmVyZW5jZSB0byBUTVBESVINCkZpbGUgL3Vzci9iaW4vY2xp
cHB5LWRyaXZlciBpbiBwYWNrYWdlIHJ1c3QtdG9vbHMtY2xpcHB5IGNvbnRhaW5zIHJlZmVyZW5j
ZSB0byBUTVBESVIgW2J1aWxkcGF0aHNdDQpXQVJOSU5HOiBydXN0LTEuNjkuMC1yMCBkb19wYWNr
YWdlX3FhOiBRQSBJc3N1ZTogRmlsZSAvdXNyL2Jpbi9jYXJnby1mbXQgaW4gcGFja2FnZSBydXN0
IGNvbnRhaW5zIHJlZmVyZW5jZSB0byBUTVBESVINCkZpbGUgL3Vzci9iaW4vcnVzdGRvYyBpbiBw
YWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KRmlsZSAvdXNyL2xpYmV4
ZWMvcnVzdC1hbmFseXplci1wcm9jLW1hY3JvLXNydiBpbiBwYWNrYWdlIHJ1c3QgY29udGFpbnMg
cmVmZXJlbmNlIHRvIFRNUERJUg0KRmlsZSAvdXNyL2xpYi9saWJydXN0Y19kcml2ZXItOGEwZDU0
MjVkNTdmY2EwNi5zbyBpbiBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJ
Ug0KRmlsZSAvdXNyL2xpYi9saWJ6ZXJvZnJvbV9kZXJpdmUtMDZlOGM1ZWNmYmI5Yzk0YS5zbyBp
biBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KRmlsZSAvdXNyL2xp
Yi9saWJydXN0Y19tYWNyb3MtZjg2MjkxZGMxZmJkYWE1NC5zbyBpbiBwYWNrYWdlIHJ1c3QgY29u
dGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KRmlsZSAvdXNyL2xpYi9saWJ1bmljX2xhbmdpZF9t
YWNyb3NfaW1wbC01YjIyMzdhNDc5ZGU3MmFlLnNvIGluIHBhY2thZ2UgcnVzdCBjb250YWlucyBy
ZWZlcmVuY2UgdG8gVE1QRElSDQpGaWxlIC91c3IvbGliL2xpYmljdV9wcm92aWRlcl9tYWNyb3Mt
OTZiZmMxZjlkYWNjMzdlNS5zbyBpbiBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRv
IFRNUERJUg0KRmlsZSAvdXNyL2xpYi9saWJ6ZXJvdmVjX2Rlcml2ZS0xZDYwMmFiZmZiMmYxYjM3
LnNvIGluIHBhY2thZ2UgcnVzdCBjb250YWlucyByZWZlcmVuY2UgdG8gVE1QRElSDQpGaWxlIC91
c3IvbGliL2xpYmNzdHItZTc5MmU5NTY0NWZhMDIxNC5zbyBpbiBwYWNrYWdlIHJ1c3QgY29udGFp
bnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KRmlsZSAvdXNyL2xpYi9saWJjaGFsa19kZXJpdmUtODgy
NjIwMDJhNTEzODc3Zi5zbyBpbiBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRN
UERJUg0KRmlsZSAvdXNyL2xpYi9saWJzdGQtZjg3YjgxMzBjZWI3NmM4Zi5zbyBpbiBwYWNrYWdl
IHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KRmlsZSAvdXNyL2xpYi9saWJkaXNw
bGF5ZG9jLTBlYTJlMWQ2NzM4N2E2ZjQuc28gaW4gcGFja2FnZSBydXN0IGNvbnRhaW5zIHJlZmVy
ZW5jZSB0byBUTVBESVINCkZpbGUgL3Vzci9saWIvbGlidGhpc2Vycm9yX2ltcGwtZjBjNTUxZjg1
YzMzYWZmMS5zbyBpbiBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0K
RmlsZSAvdXNyL2xpYi9saWJwcm9jX21hY3JvX2hhY2stMzUwYTg2OTJjMjhkOTcxZC5zbyBpbiBw
YWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KRmlsZSAvdXNyL2xpYi9s
aWJkZXJpdmVfbW9yZS1kNzdjOTA3Y2NhMThiNTMyLnNvIGluIHBhY2thZ2UgcnVzdCBjb250YWlu
cyByZWZlcmVuY2UgdG8gVE1QRElSDQpGaWxlIC91c3IvbGliL2xpYnRlc3QtZjE3MDcyM2RiM2Rm
NDNjYS5zbyBpbiBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KRmls
ZSAvdXNyL2xpYi9saWJ5b2tlX2Rlcml2ZS03NDhhYmNmZTM2OTAxYjAwLnNvIGluIHBhY2thZ2Ug
cnVzdCBjb250YWlucyByZWZlcmVuY2UgdG8gVE1QRElSDQpGaWxlIC91c3IvbGliL2xpYnNlcmRl
X2Rlcml2ZS1jYTVkNTA0YTdhZThmMWU4LnNvIGluIHBhY2thZ2UgcnVzdCBjb250YWlucyByZWZl
cmVuY2UgdG8gVE1QRElSDQpGaWxlIC91c3IvbGliL2xpYnRyYWNpbmdfYXR0cmlidXRlcy04ZGQ2
NzNmNTZmMGNiNTY1LnNvIGluIHBhY2thZ2UgcnVzdCBjb250YWlucyByZWZlcmVuY2UgdG8gVE1Q
RElSDQpGaWxlIC91c3IvbGliL3J1c3RsaWIveDg2XzY0LXBva3ktbGludXgtZ251L2xpYi9saWJj
ZmdfaWYtMGNjNTgwYjE1N2ZlZGY2OC5ybGliIGluIHBhY2thZ2UgcnVzdCBjb250YWlucyByZWZl
cmVuY2UgdG8gVE1QRElSDQpGaWxlIC91c3IvbGliL3J1c3RsaWIveDg2XzY0LXBva3ktbGludXgt
Z251L2xpYi9saWJwcm9maWxlcl9idWlsdGlucy1mNThjM2FkNDZhZTA1ZjZjLnJsaWIgaW4gcGFj
a2FnZSBydXN0IGNvbnRhaW5zIHJlZmVyZW5jZSB0byBUTVBESVINCkZpbGUgL3Vzci9saWIvcnVz
dGxpYi94ODZfNjQtcG9reS1saW51eC1nbnUvbGliL2xpYmNvbXBpbGVyX2J1aWx0aW5zLTYwNmVm
ODE0ODI0YWNhN2MucmxpYiBpbiBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRN
UERJUg0KRmlsZSAvdXNyL2xpYi9ydXN0bGliL3g4Nl82NC1wb2t5LWxpbnV4LWdudS9saWIvbGli
bGliYy1lNjJjMzA1NWUzNjJiYzc0LnJsaWIgaW4gcGFja2FnZSBydXN0IGNvbnRhaW5zIHJlZmVy
ZW5jZSB0byBUTVBESVINCkZpbGUgL3Vzci9saWIvcnVzdGxpYi94ODZfNjQtcG9reS1saW51eC1n
bnUvbGliL2xpYnJ1c3RjX3N0ZF93b3Jrc3BhY2Vfc3RkLWVmOGM3YjM1YjNmMzUxMmIucmxpYiBp
biBwYWNrYWdlIHJ1c3QgY29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUg0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMzQxOSwxICAgICAgICA5OSUNCg==

--_006_CH2PR11MB447024369DC76958BB67634E89469CH2PR11MB4470namp_--

