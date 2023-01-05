Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BE2C46467
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 02:10:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3606.1672884632728817364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 18:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PI8BS3Yn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0369ab31eb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3051n0D9007176
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 18:10:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=k4UuiDNN15WWuSNO8IBNmcHdS5sr8RyNo+ShiHq34Fc=;
 b=PI8BS3YnDeaxp0bO7FI0QDGByLInmUBySItUFFbQGZsAIh6eaQimrYED+mEQ45wtktUl
 KthmhgvEKibyqzbleh2HYGVAhGBdXNgbxpcsvaQGombpKmmeKjEbfLyeegKO8KV4Guua
 k6JzuuvvccRHnFv7Y2M7+Sdx5e3x5xLm/0nSPP6vC4h7uwHvx5/TbPBnCZc52mrN8zzw
 TlJq3Cfkt3BVUjbTuA+ALtUdeVXPvvNYxc+89HusiyE/kNq3RfPXMz4laRjOU5QqOXZM
 XwTHvl2HX8xJDH4YrQo5Hv7kvZ0Zh2dhPen9Auw8UlRYTe1lMIsfy9ekyXcIMzKFjMJC PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87ttgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 18:10:31 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3052AVB5026346
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 18:10:31 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87ttgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 18:10:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP3mfcPdgUsUzsI9B3EP4SQ92UpTEMucuUiux++UrDD90CzJW096NlMYsZPMoLuMkSGj842zSWcVYuERmPLHzfCRN3dHVg8feYKLgL41PxJFAIRb3vzfkC3/sI+TrZrx3qwSCuvl8nXWe9VuNuu0eZUfB/BpoWzu6pEl2R+cGTzNIJS90zV4ghzZiG4+rw9xBcGYzRMNpdc0PzIklfm4Pos3Peey2R0MQTvPlO2aeCH6n5yFDtBYOXL63dFJnO/4WZoI2unKIOfMBHqKaDEJUksYXR77i8Y9O6nwJjsyxhdrMfauVsR+ZCKJfbAK5K1FDg/MvW0WD5TZ8MsrS3BliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4UuiDNN15WWuSNO8IBNmcHdS5sr8RyNo+ShiHq34Fc=;
 b=ejM2UZ6tEu1SUgoaCVI9K1ln1ZDX6n0eVMsSnsBWxAsqvxJMxgXcGLGz6OOvFYAPFF9D0lHrgiEIaTECBJIwVNWVem2FdMhCRvlYpWazu44kM1BouBUjBBa6Wfa59R/CMM/RJAAia1vxtdVeS4noBbm2xKlosApo4BptkX23CPofqqz0Vra0OEpz0ntBa3GYXgrzTEfVmHlPQ3GgkKtnCvs/s1t4MsjNJuw4jBg9oZBWm+H74rggqs0XqKMfvuafCeeHL9j92lGISwlyG4IflEALLOGP750E36AXXSBKWRlsWwE1kPq3aK2iq7AA2ED80X/HZO2fK9ku3sejdXar+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 02:10:27 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 02:10:27 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
Thread-Index: AQHZFrL/QuopzLqlx0mtgN/wjaOY+66PJ8/N
Date: Thu, 5 Jan 2023 02:10:27 +0000
Message-ID: 
 <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|CH3PR11MB7673:EE_
x-ms-office365-filtering-correlation-id: d0833bb3-e06a-4188-b5e6-08daeec20347
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g0QdKrzG1ufy4XE9eSAizXd3tWnWDAXKcYSUtxheHA/DzGe6pdWYnD156uF/6hdMHKcPv8E+4805NA6nW1O2TUa8onCKPzDPYJv9/uJFBnCmMG5qHfTrYhYpucNJ+Hn72Q8lhB/9XpF4FyOUaOdE/25HTzY0XeGy0jHkxzJgDRzwtan4Zhzz+uG1WX/QhhPnD6Bef+PsY+RA9CXgENFFxxzE7iyqX04OIm9t8Dd6EIzPHEUCGoQRRDWdIt+ALGbtJZfwy3S7Rg+DkMmRnYQGRc8sORKDegRgr5ko5NoPzObWgG7qakZ/4M/ZJxy4bWDbN/ESDklRKdu0I/vQAx0mmt3q6rEbbnzk2ypvsAoKvz88eNEyFEvkmk1dCWwQnAiN3TNrYBM9jEZPPFAwAHVv8cefctdDun5Pt0+9Ij6YLWq+ocy+ppPluU+AAM45DqzXu4WQ3L6wM6io5pD2abOPevRKvm8YJwyWNpuC8xXiMUPjidP2ipjLqWWe54GDeEe8ZMYrIYh2JmqSP8Af5ZltqxJA++M5FN8lm2xRVvyy+42xXEkKfZZQ3k1zm7wQw8B0fw5IaCWE1S76mQqJQlHCUjiBX0S1f/x8CZyk3Dai0yyLUvf9J+7YORHautUfvPyGhXAl6xN/a7kImKnuLOEVdJL090lnJeDfp0FnR0TpFnIQ7HGvU6B9ZVSiO0dVUg5/cO0LqHRxCeKHaYQ1QTJLaTmuSj+aBzVtvG3Is192nzqNZ2OLZ6grjpAbkNAsJf7agyp/v2vlZS8eQpGL0a1usw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39850400004)(366004)(451199015)(33656002)(83380400001)(186003)(26005)(166002)(38070700005)(38100700002)(55016003)(86362001)(122000001)(66899015)(9686003)(2906002)(6916009)(76116006)(19627405001)(66556008)(5660300002)(91956017)(66446008)(66476007)(8936002)(64756008)(66946007)(8676002)(4326008)(52536014)(316002)(53546011)(41300700001)(6506007)(966005)(478600001)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Vgj2iBy7isPXshahBfzndY4T3tLUp41eJJ+02KgYkyfNrNKMI7v0vybSd5vK?=
 =?us-ascii?Q?XCadJKKV3FPSR+tPfE9cYG4wqUZtbENHnSUhZSFf1wm7+O6dE0ThBdq2nFPa?=
 =?us-ascii?Q?JdXEHNHdKYG4zAicUj4W+ZgHyxQhUXo4o0m7Ja22R4PTulddIkFRBC1YistX?=
 =?us-ascii?Q?BCkDctZPqAPMbML6d/tWCFME0WhviIJEL/OG/mrHsIczTFyRX6BgEDZkHkh6?=
 =?us-ascii?Q?gmOaEMYzW272HWiHr3pkv79Vy1AmYihOXMsclrs98esNI22VQnRa9dZco5op?=
 =?us-ascii?Q?ZZ2Zud3aaCNj2IOZbErMCxLqzMacM3lTex+2qy3Z/zMKd/dySdTeRXK779i1?=
 =?us-ascii?Q?62kQj3QXhluPdLVZ8qoIrKxUV7pPGIuVQbLLHvMwsz2OfAY8OAkspx8s+WHE?=
 =?us-ascii?Q?T1zTNgkcggYHnBrzGOdZxoNhqGduzZ3UCMNa8vo3zOUsWQATVsM9kgKpS6GD?=
 =?us-ascii?Q?E/jn/dM/+rPbcz7AU5S8AA+GkT6X4EGXg6+8in0Ufm+3kjZ/OAr6CdzQvO0b?=
 =?us-ascii?Q?p5y7WdY2Jm8B5LeNUSy17O65HDU2h0JqcPvr8cNVCMcH8xPbwsPN4EhIymmn?=
 =?us-ascii?Q?TiMOygHdJF8I2SIjJ1xY4YBj/B+OQv62MH/yNeAJ7VO6AdITwv6gmSIUNE2j?=
 =?us-ascii?Q?1neQxpvLjsFB6UoqKLEiukT4lUKhAOx4RpkF3Qvveqf003h6WuNDfNJJOiPA?=
 =?us-ascii?Q?jLNxZs7Zylwqp5wQTPNnFqm3VKRlCQ1bTZOt4JlcDdXWi9/IT8VhEVq2s9gN?=
 =?us-ascii?Q?diYrZv6qETPAF9ga5uGZrOQPTJTnJQ5mTQRjjQC/Nys4uYbLe+QSKSVCE+Aa?=
 =?us-ascii?Q?v47gDfl7+/tjR9UUH3TSPut3lsTGP6Gr0LT/UOYv7F3m8iiFRcERjbh3nWZ9?=
 =?us-ascii?Q?bTDdH8OXrobaieynNyiLrw0VN7oeelBU8RGZXGBFMrUUIwrX38rpXjl0dFw9?=
 =?us-ascii?Q?0fiDelHCs8QiLLjrboJPvnsTVBtu56OIiuVOz6OEdHvg7xZadr/O3vy/w6af?=
 =?us-ascii?Q?W95mHxZuAjvwSRoq12nORdsd+fpqJuvilyrgj0M87FzIXo49gfSiFmrWktbm?=
 =?us-ascii?Q?Oa2wRcU7Wesow084nkeyBSnMCXkbpKDrkwrF4NmPb+r09Qn/iwnyOSq97fGw?=
 =?us-ascii?Q?8H/m94o14bJWTvXHpatLgE36oGHKBolpGb9vs7fzrGWqPa/TZJtI097QKNer?=
 =?us-ascii?Q?2YL6+6cpUmeba0UsvQX+Y3Mpbdmo8RR0/xsmZEUhxN8ebb1/WVg8VSGwlI0B?=
 =?us-ascii?Q?vvivxLlX/VLc7jiz1NQETZlat1y3i4rgUlPQGzzzGAtu957sCXP0eXUQbJqw?=
 =?us-ascii?Q?rqXncXcXXbs3F3qCEI2o7k5LgxR/R5Pj7dufwu+56VQ6Tdmy/L4kZs71PdMy?=
 =?us-ascii?Q?3wYjX8TFs3ByLSPHfn1MMPMicSE+1xCJzzIOsiyuvNzxapnMMJxFvaJOVhXa?=
 =?us-ascii?Q?2wVn0Pd9mnYFyrbG82CF/Xn5nEiAqvy3Q7NcE4b5I42UxQZLd395HnJl7hjq?=
 =?us-ascii?Q?nh8ROrR+pyBp3bHFVo1SJfNuCWouYxpivR6MtuPA+H2XJ3NwJ9q+sYu7ZQJt?=
 =?us-ascii?Q?tZiQ2EyIuZzyMH5n+7j0p4E87XPc7mg6GZZzGXr9?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB50090C2DFF0949D0B90ED483F1FA9CO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0833bb3-e06a-4188-b5e6-08daeec20347
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 02:10:27.1992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCJknRpWjFGk6j7j4yyPgsv0nN2p/3Si80RRMFXC3gwVD/S1B7jF1UKgNIycLoe1xvsYfNUH5ScL/9wnA3J1tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
X-Proofpoint-ORIG-GUID: 4fxQO69akpm-RbaWa1NyK8ZDVjB96-pm
X-Proofpoint-GUID: -kK-kBuJVGm2n3Ynm0rpXDoXwXmR4Ruy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=959 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 02:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175512

--_000_CO1PR11MB50090C2DFF0949D0B90ED483F1FA9CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Yes,  The setting REQUIRED_DISTRO_FEATURES =3D "opengl" is in gtk4 recipe. =
Apart from that, gtk4 depends on libepoxy which also needs opengl distro.

Thanks,
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Friday, December 23, 2022 17:43
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.
Is OpenGL really mandatory for gtk4?

Alex

On Fri 23. Dec 2022 at 10.32, Yu, Mingli <mingli.yu@eng.windriver.com<mailt=
o:mingli.yu@eng.windriver.com>> wrote:
From: Mingli Yu <mingli.yu@windriver.com<mailto:mingli.yu@windriver.com>>

Fixes:
  $ bitbake gcr
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/oe-core/meta/recipes-gn=
ome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!Aj=
veYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5E=
t5Kwi6bPycXwXHb4CuXgAucUmL4$> DEPENDS on or otherwise requires it)
gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_F=
EATURES)
  ERROR: Required build target 'gcr' has no buildable providers.
  Missing or unbuildable dependency chain was: ['gcr', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com<mailto:mingli.yu@windrive=
r.com>>
---
 meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http://gcr=
_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6=
JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$> | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/=
__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAA=
nzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$> b/meta/recipes-gn=
ome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!Aj=
veYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5E=
t5Kwi6bPycXwXHb4CuXgAucUmL4$>
index 264069ffd1..22edd386fc 100644
--- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http:=
//gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mg=
KI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$>
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http:=
//gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mg=
KI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$>
@@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz=
"

+REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', 'opengl', '', d)}"
+
 SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agent-=
opti.patch"
 SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6e986=
4341c0161e171173dcec7c"

--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#174976): https://lists.openembedded.org/g/openembedded-=
core/message/174976<https://urldefense.com/v3/__https://lists.openembedded.=
org/g/openembedded-core/message/174976__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx=
-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgJaHBHwR$>
Mute This Topic: https://lists.openembedded.org/mt/95842308/1686489<https:/=
/urldefense.com/v3/__https://lists.openembedded.org/mt/95842308/1686489__;!=
!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gki=
Y5Et5Kwi6bPycXwXHb4CuXgFA08ADx$>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/u=
nsub__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXR=
ulca1gkiY5Et5Kwi6bPycXwXHb4CuXgMLu9URo$> [alex.kanavin@gmail.com<mailto:ale=
x.kanavin@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_CO1PR11MB50090C2DFF0949D0B90ED483F1FA9CO1PR11MB5009namp_
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
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Hi Alex,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof ContentPasted0 ContentPaste=
d1">Yes,&nbsp; The setting REQUIRED_DISTRO_FEATURES
 =3D &quot;opengl&quot; is in gtk4 recipe. Apart from that, gtk4 depends on=
&nbsp;libepoxy which also needs opengl distro.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof ContentPasted0 ContentPaste=
d1"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof ContentPasted0 ContentPaste=
d1">Thanks,</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Friday, December 23, 2022 17:43<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FE=
ATURES</font>
<div>&nbsp;</div>
</div>
<div><strong>
<div style=3D"border:solid #9c6500 1pt; padding:2pt; background:#fcfc03"><s=
pan style=3D"font-size:11pt; color:#000">CAUTION: This email comes from a n=
on Wind River email account!</span></strong><br>
<span style=3D"font-size:10pt; color:#000">Do not click links or open attac=
hments unless you recognize the sender and know the content is safe.</span>=
<br>
</div>
<div>
<div dir=3D"auto">Is OpenGL really mandatory for gtk4?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Fri 23. Dec 2022 at 10.32, Yu, M=
ingli &lt;<a href=3D"mailto:mingli.yu@eng.windriver.com">mingli.yu@eng.wind=
river.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; padding-left:1ex; border-left-c=
olor:rgb(204,204,204)">
From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_b=
lank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Fixes:<br>
&nbsp; $ bitbake gcr<br>
&nbsp; ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/oe-core/meta/recip=
es-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!=
!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gki=
Y5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=3D"_blank">gcr_4=
.0.0.bb</a>
 DEPENDS on or otherwise requires it)<br>
gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_F=
EATURES)<br>
&nbsp; ERROR: Required build target 'gcr' has no buildable providers.<br>
&nbsp; Missing or unbuildable dependency chain was: ['gcr', 'gtk4']<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
&nbsp;meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a> | 2 ++<br>
&nbsp;1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__=
http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnz=
q3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" =
target=3D"_blank">gcr_4.0.0.bb</a> b/meta/recipes-gnome/gcr/<a href=3D"http=
s://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx=
6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUm=
L4$" rel=3D"noreferrer" target=3D"_blank">gcr_4.0.0.bb</a><br>
index 264069ffd1..22edd386fc 100644<br>
--- a/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a><br>
+++ b/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a><br>
@@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
&nbsp;inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-ve=
rsion-is-even vala gobject-introspection gettext mime mime-xdg<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;gcr-(?P&lt;pver&gt;\d+\.(\d*[02468])+(=
\.\d+)+)\.tar.xz&quot;<br>
<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains('DISTRO_FEATURES',=
 'x11', 'opengl', '', d)}&quot;<br>
+<br>
&nbsp;SRC_URI +=3D &quot;file://0001-meson.build-correctly-handle-disabled-=
ssh_agent-opti.patch&quot;<br>
&nbsp;SRC_URI[archive.sha256sum] =3D &quot;c45855924f0ee7bab43e2dd38bfafd2a=
c815c6e9864341c0161e171173dcec7c&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174976): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/message/174976__;!!AjveYdw8EvQ!=
aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPyc=
XwXHb4CuXgJaHBHwR$" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/174976</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/95842308/1686489__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcY=
aA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgFA08ADx$" rel=3D"=
noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/95842308/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmL=
cYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgMLu9URo$" rel=
=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CO1PR11MB50090C2DFF0949D0B90ED483F1FA9CO1PR11MB5009namp_--

