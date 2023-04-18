Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF40C77B76
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 11:46:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6382.1681818381348241466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 04:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pMb5lFr4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34729cc6e2=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IBhonH006949
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 11:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=j9aTpkDoQAJT1Il1m7qUUS5gklfZkp/9G4EvTkDMqqU=;
 b=pMb5lFr4TYVD0zzvdVkgxhleLI5CgDpzvKX/fuEU9qvvdkxYz7VDDOz0jCXH6LxU7gxi
 0hYNKajKP6Yu2z2sJqNQbeNLez6yRAqI6SKt5xan05gtJg3uZu/z0tsVeCqazGAxm3Pj
 F9TVKcUXGfOVdmUmh3sIhpZXboR3iXK2MYqCwE0V4Bwpbz0PrBwUE/UpQyeBOPkzbruX
 USH6+8Wtj4j+hL67VtsuuZj0GWSyubfOPdxzTi0NovoKsoMViLaK5sbpfjk4sE54rUZj
 6wad85mQMWq0hQ2g4ByE1nvx8bpeqxd4bVBJ8LeXLKMxkn3yGP0KtnfJLdXhgYGLqXOp nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyh53m2qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 11:46:20 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33IBkJwh014920
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 11:46:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyh53m2qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 11:46:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTlGKFzvzfg8qUI8L93iP1Ye97ZYKRg0jjW++K+xfLO2/VtMyp3X1a9Fp8Zdm2F55Atc4H/GzfZdebjw6d1Hjc/N8+JBDp5qAYt7uGYIDuFWvo3U0q9X0OsjuKZ3UYzPH0M8JmL/pN+7HsjpFpnyn00nolvIVFJN4weN4fTIuREiSk5qx1bW/060j+GM7WF6k7EimwfqTXrHqbDT4f5mjhrjeAwFfKodjyB85U1UMyWdp+nqsFC6IZ8iKUSJ4UvLLq335yEzgDAj+HCFP5cwUWeR0NhoWpt/Qw1vc8DeZAYZVcU5kJYUVFHrAcf1Xgc6PBzVncWLPkJ39ldSLRGWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9aTpkDoQAJT1Il1m7qUUS5gklfZkp/9G4EvTkDMqqU=;
 b=DcpSUDmP5JE38IR+33If+vej4+YkCoeam6/S6w/19H4lSdCkXaK1TNCUd6SbJSdWhhD+lysfXHwxJKyzGvmOBKRk4M4ZPZEMgFR5XP+t/qAocUo4QI8AaK51tDXKYZmQrg3Q9CbIbRq/0wsiP36VxG1U/WfmMYN21n675M3ygDWw76F5CiPXMDPBn6d4Y773GI5qoeK3mK9rwBjmd5j+zc9KihcuK1xVlpH8Z/f2OM/2Jx7l5BFnJ5m96CemO26ViUbnF9sHXh0pBzWNojUfrcPNXPZ2T5LPsPJX5bFJTjrLuZGT9u8868yJQHN5uOSdVuU1okZaq8Swe+91xLX10w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 11:46:15 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::b3f5:ed6:584b:bf80]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::b3f5:ed6:584b:bf80%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 11:46:15 +0000
From: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] cargo : non vulnerable
 cve-2022-46176 added to excluded list
Thread-Topic: [OE-core] [kirkstone][PATCH] cargo : non vulnerable
 cve-2022-46176 added to excluded list
Thread-Index: AQHZZXfotDhV+gwTSk+3NqjpEcteza8xC3lR
Date: Tue, 18 Apr 2023 11:46:14 +0000
Message-ID: 
 <CH2PR11MB4470098ED8A0713564517D43899D9@CH2PR11MB4470.namprd11.prod.outlook.com>
References: <20230402152836.9157-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20230402152836.9157-1-sundeep.kokkonda@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR11MB4470:EE_|MW4PR11MB7078:EE_
x-ms-office365-filtering-correlation-id: f9f4f12f-9830-46fc-5fbf-08db400283e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wK1VF78daYUzzEiCbcnfE+8sMjF5ba9IgLFicEOKFAnE8nBl9whmXQ6jf7YQC68npvc6tKi20+JaSdgMMFIhCwo3SomrPtQRSZWgpejIJ06AvDZYhcBNUzBfKkJcgdWW06K2RgbRranIPcxcU0G5L1YMnDcua+4vdXGRJyj2MRPoyTk1svqEaDHSkQlEnTzbTL0abalwBzE+2OwI7Bd6wAvQoToTysvx5P7rimhnuJ3WSpRQYilam/w9YHtLToehIC7hdySM8Il1uPzp5VWLnwoD70R14KBzv51NbK3PS1vmVdVIDt9wn1HSpy/YN07Y1lIFjRM0/bnpwSNxFEwkB257Gl1IzpFooDp6P2M5VhdK0mnKQpALFSvRfPfASKIxneKMV8mraIhH7NaRaJFkuKM4E8JkYVAwI7TZZT/YOCe1qUOoA16A6ljqHwKrhFmKKVTYhA1Vk69/fkjxQK9AHevBxHWhXCbuA6vyfv7d97EYU8vJo8wm/rOzK2b7ycHST7lrYzkKORiAvWVGxUjT/6iOVgy4bKeG7ztM8bLQ9cXL6kj7GIh7c2BLDFMxVzmsV/uz+jNNlxlqQUmyL/EVHByhIWE5hLPBUUiQrINatG0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(5660300002)(966005)(71200400001)(7696005)(76116006)(6916009)(66556008)(66476007)(2906002)(66946007)(64756008)(66446008)(4326008)(91956017)(166002)(21615005)(33656002)(86362001)(8936002)(38070700005)(122000001)(41300700001)(38100700002)(478600001)(316002)(52536014)(8676002)(55016003)(9686003)(19627405001)(6506007)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5cnLRUgAYH8TEqUeWyI+oVI3iE5w5LBFCeNTEp23UE5EvSnKi6MleRVtAbZp?=
 =?us-ascii?Q?qfwxa8YezMRd25Pu4jzsS6Lbhd5i3x9L+hnAPn+aAOk+zb0WanWT2OIdly62?=
 =?us-ascii?Q?VjyzUEcpM6VtIALN5M2CE9suk+HGorDMwzgB+Cada32bjO5+rKeEmHtVrQP+?=
 =?us-ascii?Q?azVTFspn6v1Rz1EicIdVhggO1HY4EBcnizuljFklrJxaZoOtjjeZmI+XvN+b?=
 =?us-ascii?Q?O/m/DTmO5ROLm5qhk4lgkYmIqWXscmyzj9WRrjMCH8Rgyws/9gTsn5Em0o2N?=
 =?us-ascii?Q?B6dA1omGoIcsyYe7QV0AgUD3x7BBfoTV2ZjSRZXfJVUZojxnXyjTY8ZDrljw?=
 =?us-ascii?Q?mGHi4acpWdz5mdHQ722vdkerVyDyWacVwQnZKmoEW/kvsTUnyLCyaSQI7NLJ?=
 =?us-ascii?Q?lWylf5oaewPy93uR6FXgddf5atc+hZjD0LHuGandrWT2h7eshB56Zx1HMCya?=
 =?us-ascii?Q?t7+tBdHRSoTaC4EB0H8ZnAVZQUGXpFrd19Fa9tyGN2qUvrKoc5oNsLPUb+ON?=
 =?us-ascii?Q?HsyCYfauKI5QOu7+PHhWrMwlsTE04PPDbNjcI2cDZKxBu7sy8Ngi54az23Je?=
 =?us-ascii?Q?DfnhQwq7RvfbfDynuxdQeb+m5nFIaFpw2M+DnCPbXm4ph4PMffJyLhohZhTy?=
 =?us-ascii?Q?en4yR7R5g1hVm7qIv0b4D+ifklwHouSRrW2LHXYvncFH3qQ4ZynDP8JlYnrM?=
 =?us-ascii?Q?WKKEpuqblvNgA0KPnsib9F2ph0SaLSUvtLLVX0/ElDavxVHoP4aQ8G7sF0gL?=
 =?us-ascii?Q?mVNgjwcmo/Y2TVk5DdJLje26V77cS/mxPu7rAONapQVmI5lEgjcUiyGDy3lQ?=
 =?us-ascii?Q?BRxVH3Dzgnd6I5/LCK+PAQRFYZpkmmTMuyL72XLKj9tOfpVm+93igPosLPDS?=
 =?us-ascii?Q?WqQ63sCSvdq8HNiOb98FIeWpSqZ2wclyn6ajsOQRwecf3U9AOmM906WXll/k?=
 =?us-ascii?Q?seK4Ys7dprXaSB760QMk5jR8s4IelKVK8pgPOq7F8gAQWbrHbLIR8RNuRAV+?=
 =?us-ascii?Q?gkvhRjjW9gUUPMnbFwsUzRzaU5jdBls97ZCuVTu2TUQcZWGd/cNs3B50hVwF?=
 =?us-ascii?Q?grxI4YtXv1IHLeB6ktNu1bsPwcBfmf+JbRGYxIHgWiIVVHlGmuHw629IVFg9?=
 =?us-ascii?Q?Y8j/NUR4TH99flTum8XfteJjgKxpPYmmotzoksCRR1KhHTYvG/FEwHL7KOAE?=
 =?us-ascii?Q?9CUMGu1/kWJ5w5BTr1OSxcHNvnhFmpUjRWptk74QRBXAovunwk0T4gsnJIL2?=
 =?us-ascii?Q?1mKdKaCxUn/wEPfd9hreTvC7goRwG7XZZVrVj+Y4Xbsb7CbAI5AUa6420Sm7?=
 =?us-ascii?Q?CFa4TeWpYcHr0VLDwGniiN3b2vueOg+A5Z4oShuLJ5opDEOu3mNaDYILyqAO?=
 =?us-ascii?Q?oHvvdc4ItTlL2EgU6W8Rymn28UAnnPzx0l/xkAGFeY+7r8iWLy0zqGE3FxNj?=
 =?us-ascii?Q?1PpD2k3gogTHFl2+7neai3cFH1dOjYNq16iLOQPe1HY7IEgHZFzrHaXEBYur?=
 =?us-ascii?Q?K1BSIIJne8AB7IQKlFtKda46vJmxND9QGVJHanAJtUxz3DpMBkqo359eFICC?=
 =?us-ascii?Q?For2mEJjykgCVovaGfK9S0x5JEL72GhEJm4WM+mCUjGx2i7UxtQBnKRhX399?=
 =?us-ascii?Q?zBTcQ3RUXCETRfZT20iFTY/5oeHntKZ+1wLhqxwmk+yfoypNKbyfCMJw5fAP?=
 =?us-ascii?Q?6clqow=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CH2PR11MB4470098ED8A0713564517D43899D9CH2PR11MB4470namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f4f12f-9830-46fc-5fbf-08db400283e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 11:46:14.9473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /b4L3j5xMbdAb+hSOocSBJWYN69atEWN3F5fipHNR0MTuqLT74s/sdPNu4b03qBEZBuxPjXZxy4sXnyL+ndnJCRvJnSS/r6ZPstPpDwxvJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
X-Proofpoint-GUID: eL5YsQ0p2SBantBBLScsVrO6DmqU_-Dq
X-Proofpoint-ORIG-GUID: eYStyOLP5MFvULVTN0S_TpatS_D_Pe0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_08,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=958
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 11:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180186

--_000_CH2PR11MB4470098ED8A0713564517D43899D9CH2PR11MB4470namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

When this patch is planned to take into Kirkstone?



Thanks,
Sundeep K.
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Sundeep KOKKONDA via lists.openembedded.org <su=
ndeep.kokkonda=3Dgmail.com@lists.openembedded.org>
Sent: 02 April 2023 20:58
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: rwmacleod@gmail.com <rwmacleod@gmail.com>; umesh.kalappa0@gmail.com <um=
esh.kalappa0@gmail.com>; pgowda.cve@gmail.com <pgowda.cve@gmail.com>; shiva=
ms@gmail.com <shivams@gmail.com>
Subject: [OE-core] [kirkstone][PATCH] cargo : non vulnerable cve-2022-46176=
 added to excluded list

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

This cve (https://nvd.nist.gov/vuln/detail/CVE-2022-46176) is a security vu=
lnirability when using cargo ssh.
Kirkstone doesn't support rust on-target images and the bitbake using the '=
wget' (which uses 'https') for fetching the sources instead of ssh.
So, cargo-native also not vulnerable to this cve and so added to excluded l=
ist.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/=
distro/include/cve-extra-exclusions.inc
index 8b5f8d49b8..cb2d920441 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -15,6 +15,11 @@
 # the aim of sharing that work and ensuring we don't duplicate it.
 #

+#cargo https://nvd.nist.gov/vuln/detail/CVE-2022-46176
+#cargo security advisor https://blog.rust-lang.org/2023/01/10/cve-2022-461=
76.html
+#This CVE is a security issue when using cargo ssh. In kirkstone, rust 1.5=
9.0 is used and the rust on-target is not supported, so the target images a=
re not vulnerable to the cve.
+#The bitbake using the 'wget' (which uses 'https') for fetching the source=
s instead of ssh. So, the cargo-native are also not vulnerable to this cve =
and so added to excluded list.
+CVE_CHECK_IGNORE +=3D "CVE-2022-46176"

 # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-0006
 # CVE is more than 20 years old with no resolution evident
--
2.34.1


--_000_CH2PR11MB4470098ED8A0713564517D43899D9CH2PR11MB4470namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hello Steve,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
When this patch is planned to take into Kirkstone?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Sundeep K.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Sundeep KOKKONDA via lists.openembedded.org
 &lt;sundeep.kokkonda=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 02 April 2023 20:58<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> rwmacleod@gmail.com &lt;rwmacleod@gmail.com&gt;; umesh.kalappa0@=
gmail.com &lt;umesh.kalappa0@gmail.com&gt;; pgowda.cve@gmail.com &lt;pgowda=
.cve@gmail.com&gt;; shivams@gmail.com &lt;shivams@gmail.com&gt;<br>
<b>Subject:</b> [OE-core] [kirkstone][PATCH] cargo : non vulnerable cve-202=
2-46176 added to excluded list</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
This cve (<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-46176">https=
://nvd.nist.gov/vuln/detail/CVE-2022-46176</a>) is a security vulnirability=
 when using cargo ssh.<br>
Kirkstone doesn't support rust on-target images and the bitbake using the '=
wget' (which uses 'https') for fetching the sources instead of ssh.<br>
So, cargo-native also not vulnerable to this cve and so added to excluded l=
ist.<br>
<br>
Signed-off-by: Sundeep KOKKONDA &lt;sundeep.kokkonda@windriver.com&gt;<br>
---<br>
&nbsp;meta/conf/distro/include/cve-extra-exclusions.inc | 5 +++++<br>
&nbsp;1 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/=
distro/include/cve-extra-exclusions.inc<br>
index 8b5f8d49b8..cb2d920441 100644<br>
--- a/meta/conf/distro/include/cve-extra-exclusions.inc<br>
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc<br>
@@ -15,6 +15,11 @@<br>
&nbsp;# the aim of sharing that work and ensuring we don't duplicate it.<br=
>
&nbsp;#<br>
<br>
+#cargo <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-46176">https:/=
/nvd.nist.gov/vuln/detail/CVE-2022-46176</a><br>
+#cargo security advisor <a href=3D"https://blog.rust-lang.org/2023/01/10/c=
ve-2022-46176.html">
https://blog.rust-lang.org/2023/01/10/cve-2022-46176.html</a><br>
+#This CVE is a security issue when using cargo ssh. In kirkstone, rust 1.5=
9.0 is used and the rust on-target is not supported, so the target images a=
re not vulnerable to the cve.<br>
+#The bitbake using the 'wget' (which uses 'https') for fetching the source=
s instead of ssh. So, the cargo-native are also not vulnerable to this cve =
and so added to excluded list.<br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2022-46176&quot;<br>
<br>
&nbsp;# strace <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2000-0006">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-0006</a><br>
&nbsp;# CVE is more than 20 years old with no resolution evident<br>
--<br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH2PR11MB4470098ED8A0713564517D43899D9CH2PR11MB4470namp_--

