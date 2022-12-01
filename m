Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7ECC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 02:47:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33131.1669862852723146369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 18:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EbT6Z9hL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9334ca2844=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B12hjQx009129
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Dec 2022 02:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=8coRxlq9jumOYMKL1ByqZB3KlVwAPYdwpjmOB32U5sc=;
 b=EbT6Z9hL1WCSsZeVJ7kTpea5G+6KPhFl4Te7hcdALItusdTf+N5F2gQxgd0AeLo7BGmW
 JorgEJFKNHWG+uul4G/POnrCtz6HX89TIcYZogh3smwzMeAEMRZcczubjiR3+rgI4TzT
 nYlI1yNGF0yQnUfY8C6lL/fKkUcKE7NCmCguHVincSJyAik+EhC4ewJyXux3wsb53fAc
 rb7Iz6slkItSiDg5JjZap+CZeKTrJ6L7XcXbNd64Ch7hwsujkaFwqtbC8bfQ6iXI86VX
 UL3IV/nQ0gLV5VVVbZV0B4CtbJjhgwnu9C9cuVG2Kb/D6N+sZ8iTU68rRCfHYM/90X5L Cw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbuxsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 02:47:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxEFtZg09EmH0f4AxQgFFtc4oYm2hzBMmDLETQENNaJYpfF+Ns5omwk/kM7zs0gcG/XNMNCCLI4bB7VRD6wjfq6y9zWe77BYAc5YFv9Cz0uKKYXJgsAOs4qR29vWn51Zerwgq3+D2drUu2usboPtypZqN3J3XTghvLzUUj/Q1qTwpUcoO3zybc5NZANBLvDTj0DM85pH+a1ZWM1uUYNWrV4YmFsQm5+8rZYOS7nPzZa5mWF6zV/RrKvCbDIGorcHQoCyqVYh6ZOn4N/rVr+Dz/1exrH03+Ul+1Chcbs2c9kME7601yb+K68cwWCg+YPN8AAgOo7vo4UAi1okUjTgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8coRxlq9jumOYMKL1ByqZB3KlVwAPYdwpjmOB32U5sc=;
 b=DN/EwOgC3En0NSlJUPOkFXalPdiVOM7FmNHz33BEEOnbLvgaMcMJQDGqNGaeN7QBIwu1LJwLohw+d1ZqmJRO1P8zV8KbWPEazq9kgHDSDNUDPmQy/QkroB/RprNOEdq25QFpbDgs4WwDMX/aqwDjm0x1i+saQpWXYcu4GHIdfHczdBF7FCASbxeiHGMCXkA22PrefDV8pcDiGJYeW5n6iZp25thYHkMPhwTtAO5wJqy9ri1+qX18rcnx3oNxSqJWDvu9bB4fmbnCSb/+JbwOlmfEnt/bsWZWv1/6RhzTACpI44cM0RCDJIcIclAeN5J+uKOobwZWHjKXPk/3MdveOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 02:47:27 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::4996:ee3d:eb73:3094]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::4996:ee3d:eb73:3094%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 02:47:27 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] How to run yocto compliance against openembedded-core layer
Thread-Topic: [RFC] How to run yocto compliance against openembedded-core
 layer
Thread-Index: AQHZBS0nEogNuysPB0yVoPcSuJdhVw==
Date: Thu, 1 Dec 2022 02:47:27 +0000
Message-ID: 
 <PH0PR11MB5014D1EF18B80173A9C9EB30F1149@PH0PR11MB5014.namprd11.prod.outlook.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5014:EE_|SN7PR11MB6945:EE_
x-ms-office365-filtering-correlation-id: e7adf5c8-250e-4a46-f88e-08dad3466228
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W6Wmwk0G9HrOXlvxFVDHXvA5ZmWM/wL45NDA+9RTN6TrkiVVfcLnyvTKJCZfhE+mwj9Tsq+Z4T2WqkwXoiRzItGeRiBmXCzgAHLZk8y38+pavHkXoV+zm0pHdcMoO5fvhaTbqoNl4bZ/lN8VsJuTikgQqjPFr+H9y1bzKAxAxQiYEozJXfOy+B5nf6a90sTZw3QQBrlmDENAUZbJu++ht0tcQVtpmpB772hvDkR4fAxai0iUQMqwyI7xIClj1Irv8Rbses6FYFXR4zpwDX5b+cR7ZkDQyyz2KTw4dRh83El7Lkf0herbOhUYsZM1R0mvSMUhQi4eiQeoV/z2mxlr7BBh8S+DUdXWuM0PGvMyM/sfk+xN3+ddOMHVUZCyOuTTIZt0L/orxPTb2DEIQUA/SbB1Nr+nffvtMqzTy1c3lDIldm3WoxGJ3prbxpam5IcFA4h99UVGaSfqK7B+Ibn092FSXCZgfX5eBvLxJdZfOIGDOvKoiw5dvvO7RVh+Ok8+x/9ftWSV9yJUnLTE3pIEMVsGJyvoL6GCsVYtXL6VhiwGsWjmAUO3Zk3W2CozUFdga2HoFlV+cFwxK9IlZPrIUKGEL5y5B/9qifQvxvRaU1OvtSTprBUg53v6s/ZEQRncnz7OAA6PBeKKm3rRBALDplqxMxnvmm30y+kLi3gMXqyXccepazISgOyuvpKpjGGLnQGwj7bXIMi5Q65B+nOzlw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(366004)(396003)(346002)(376002)(451199015)(19627405001)(186003)(71200400001)(86362001)(122000001)(6916009)(316002)(38070700005)(55016003)(33656002)(38100700002)(83380400001)(6506007)(26005)(7696005)(8936002)(478600001)(66946007)(41300700001)(4744005)(9686003)(66476007)(2906002)(52536014)(5660300002)(66556008)(8676002)(76116006)(66446008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1ulvzbFDq0D075n77yoXRy9/ZIZ3yn/OhUvAQxDU2C31cXUFnBclrsHpst?=
 =?iso-8859-1?Q?D68aTWMVeevqAXwkg5EIaHB3GFLR2OHXHI0rMKo45dht4EfHQLx9GADAJZ?=
 =?iso-8859-1?Q?4XQ+3RWd2IGGu7TSFt1T/oi5CwDanxdlPhzbZGbSwxlNSRR0GE7wa9B42X?=
 =?iso-8859-1?Q?Lnlj0Bwmt8BrduD38tLKZwR5ZQGwATvjHPK/SO1t9rA3yosr4IFSrEJoNW?=
 =?iso-8859-1?Q?KNT3EJz3xyn0HxPDsjxf6npAWXxj2cWrv1ypYCf2BIUglZ/RW8qfNY/RVr?=
 =?iso-8859-1?Q?ewFuxixbN7Z96VtRyItHA+dg+iwypTOwwoYkQq+spd1ZJ8Q4S5oMI8EBus?=
 =?iso-8859-1?Q?XG+TeKcmNA2vHHNJkyJvTz2s43u+bYXJWOo3SDdVVzmzlm7jsI6N5Ffk3I?=
 =?iso-8859-1?Q?WOcL8ABc3OPzb9L1WBVSg20pmHNmt+awfyKBg32/Z34302t02ePp/9uXH2?=
 =?iso-8859-1?Q?LD+zNjd/kDELlidr4iKD4sByh2Nra+OHPVXStv+0kiL9ddeJYv9FRDM3H1?=
 =?iso-8859-1?Q?c27EdUYVM/AKUD3UuHxh0NXgCgg5TrMATLfgbhY7Xvh5Z7IQWAzs3UyNm+?=
 =?iso-8859-1?Q?7FZ5sk2ZRyIa4pIR0s+97Xk3J1QcTCLWiXVpAkJ7c29NwY4k6WzXt0DhAW?=
 =?iso-8859-1?Q?xlGgN0pgNicgNaKO2+CxGsGn69w2CM3s9AH2euvHbYyTsVXD2zHVqPVg7B?=
 =?iso-8859-1?Q?uYzXMQEHbHGjI15W14Z/F6+jf6rNcr5NFLpeUByl9NiWWw+GginQCt9Jmf?=
 =?iso-8859-1?Q?Bux/j5/j7AUH687fd9YmUmobTvt/xWM92n/BWG9PnkHLG7ypkbPoBhIwcA?=
 =?iso-8859-1?Q?forykV8t8yitNjTPEEnGZvcuawYVdB6nhC2LE/aqPjOsstRGBs0ga/xGRr?=
 =?iso-8859-1?Q?OYKVf2QHxqpTXIl6TbWl1B7mEqUEyUZJrfYcVNS31sH7lElIXaUkdA6yJn?=
 =?iso-8859-1?Q?2m4Sev4IrYkCKnYZcsJnWL0X2csf5A7reyugT9OojmMr8JyjWiZB9IPl4q?=
 =?iso-8859-1?Q?FNsws6RyHVU+GrjzQ6a2tXaXckdhADD5IwbylL9LyeTmzvwyogUvld41wB?=
 =?iso-8859-1?Q?QhgdvwDs909flqCsojcQAnn8yX/aZAxztzKO8K4mJINQv8lQGk4VFAR0dT?=
 =?iso-8859-1?Q?VxJAlwa2wS/KAk8DIjRjrf8qoqyJbuO4cZ5WLCf+gQZl/NR3xUKJUXwDfu?=
 =?iso-8859-1?Q?O+xsvzCWWrczmLlNwnoQo1+sDIVsPObQaLsCeazczL78c/lznt1o66y7Xn?=
 =?iso-8859-1?Q?ftFwvEPovL1NFDfd3mss1frnxjtnCkstPIlaYfsnQqPjdXxTBcqN/+Eex0?=
 =?iso-8859-1?Q?bWrxHYvWokOhoj4Bs2RSnzC+/hXOlEffxnkZC1iz5h0iZuXHFOsKoMaGD8?=
 =?iso-8859-1?Q?QATAsJBDhZNxNWYR5I0cKn5CzgSJR5ePRLDzyslmvUxeVdrxWYF4Tq9Kb7?=
 =?iso-8859-1?Q?tkydVc7nraVUILl7dsqt54v1Tk3O0QibkpqTwPZpgwrgAYJbB15ttbkbg/?=
 =?iso-8859-1?Q?68aHPDAjeXwm6eHQh0sVWfKSPb6MuGeADMm++5q3vs50uN2kdT8TNA4k1J?=
 =?iso-8859-1?Q?iPrvPWYBljlmmqiH0LOttjwm5R+BbPk7IiPZon+JkbMhJDRq9rHHeuhw3r?=
 =?iso-8859-1?Q?TLFvHCI/Nj4Y7WdC9wt/qe7iJIQQGuGaW/?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5014D1EF18B80173A9C9EB30F1149PH0PR11MB5014namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7adf5c8-250e-4a46-f88e-08dad3466228
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 02:47:27.4213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1OmPV/OjUx9FV1gpfRxGmlsK5tEW0yRzbXtV13/EVCxeLJhBFmL64MRL5fOFXqvrPrMM7gSPW03f5Bqt/6NWEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
X-Proofpoint-GUID: h_Wu9WoibZXlBtGGi-OADFUXvXfe83Rj
X-Proofpoint-ORIG-GUID: h_Wu9WoibZXlBtGGi-OADFUXvXfe83Rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_02,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=801 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 02:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174035

--_000_PH0PR11MB5014D1EF18B80173A9C9EB30F1149PH0PR11MB5014namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

There comes below error when run yocto compliance against openembedded-core=
 layer.  Any hints?
1, mkdir -p /yocto
2, cd /yocto && git clone git://git.yoctoproject.org/poky
3, cd /yocto/poky && . oe-init-build-env build
4, yocto-check-layer-wrapper ../meta
[snip]
INFO: Detected layers:
ERROR: meta: Can't be DISTRO and BSP type at the same time. Both conf/distr=
o and conf/machine folders were found.
5, ls ../meta
classes         COPYING.MIT  recipes-connectivity  recipes-gnome       reci=
pes-rt       site
classes-global  files        recipes-core          recipes-graphics    reci=
pes-sato
classes-recipe  lib          recipes-devtools      recipes-kernel      reci=
pes-support
conf            recipes-bsp  recipes-extended      recipes-multimedia  reci=
pes.txt

Thanks,

--_000_PH0PR11MB5014D1EF18B80173A9C9EB30F1149PH0PR11MB5014namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted7">
There comes below error when run yocto compliance against openembedded-core=
 layer.&nbsp; Any hints?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
1, mkdir -p /yocto</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1">
2, cd /yocto &amp;&amp; git clone git://git.yoctoproject.org/poky<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 ContentPast=
ed3">
3, cd /yocto/poky &amp;&amp; . oe-init-build-env build<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 ContentPast=
ed3 ContentPasted4">
4, yocto-check-layer-wrapper ../meta<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 ContentPast=
ed3 ContentPasted4">
[snip]</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 ContentPast=
ed3 ContentPasted4 ContentPasted5">
INFO: Detected layers:<br class=3D"ContentPasted5">
ERROR: meta: Can't be DISTRO and BSP type at the same time. Both conf/distr=
o and conf/machine folders were found.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 ContentPast=
ed3 ContentPasted4 ContentPasted5 ContentPasted6">
5, ls ../meta
<div class=3D"ContentPasted6">classes &nbsp; &nbsp; &nbsp; &nbsp; COPYING.M=
IT &nbsp;recipes-connectivity &nbsp;recipes-gnome &nbsp; &nbsp; &nbsp; reci=
pes-rt &nbsp; &nbsp; &nbsp; site</div>
<div class=3D"ContentPasted6">classes-global &nbsp;files &nbsp; &nbsp; &nbs=
p; &nbsp;recipes-core &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;recipes-graphics &n=
bsp; &nbsp;recipes-sato</div>
<div class=3D"ContentPasted6">classes-recipe &nbsp;lib &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;recipes-devtools &nbsp; &nbsp; &nbsp;recipes-kernel &nbsp; &n=
bsp; &nbsp;recipes-support</div>
conf &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;recipes-bsp &nbsp;recipes-ext=
ended &nbsp; &nbsp; &nbsp;recipes-multimedia &nbsp;recipes.txt</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 ContentPast=
ed3 ContentPasted4 ContentPasted5 ContentPasted6">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 ContentPast=
ed3 ContentPasted4 ContentPasted5 ContentPasted6">
Thanks,<br>
</div>
</body>
</html>

--_000_PH0PR11MB5014D1EF18B80173A9C9EB30F1149PH0PR11MB5014namp_--

