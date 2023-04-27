Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8DEC7618E
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 02:19:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11259.1682561962472075511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 19:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kB8NNJ3i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34817e955c=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R1Qrjm011779
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 19:19:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=W2FhehC5xisN56O5sCQJDeTGsJ1OKnawcIxj1/XT3Ts=;
 b=kB8NNJ3i5LyosB0s8cy4P2x7LmA9/hsnguVUe4kPkyf6bijyAFa4wotL8ixbCt7aI/b4
 E347to6WD1UoALib76lI+sNEl1HejA+ljMc8b4wRGs8bR7UORm3LbaVsXZ+C8EnrFaIb
 UHM79bym0QwVz9UJ1hKxpU5UbIbyF50vBXI3QwrgEolPAtMmjED741Q/zBvjT75qPkn/
 vjoczaWT+a2Eq0OMxFYWJYqt/DZ1cPL1jCECpww6R025FVMunObNbbdt4/QFmfPmtASN
 wvh94C9cJ6Bcqa+AvrEevZfkFRZZa94xv4FUbXVKCgDkIxVx8Rs1sZaxT3ONFMIWv8YI uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4f3mmpjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 19:19:21 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33R2JLm4001082
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 19:19:21 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4f3mmpjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 19:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kT6GZLYGp8sIUh7YXPkeoFdl8i3vUjrku82Mai2j5LO9p5pY1kbxkwzBPhEfVxb42iBU5panvPSWn7Q3K+1O/uRMMFNAx2KgLP4rVoOUkxHiVXH5NPb46QaUrohn8r/ZHf6IM7ZJokG6R6HFeZ6RmdbbavDUSN4SkJ/75AFC+g55G7VFg78Sdy9ixfhDOwTW+8TccYLo2UK+/NfBwNTkdlItDnO6lApsjlvL0xKc+ilf2YlonnaEZYLUaR5lTuh9NM07wGEHo4THZgROkD+tWi9qeHIk60WSl8FzFR+nEnrNU07j4ENQKLyO9PRah1mtuocP1yfnN3LJ5K4fn3xY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2FhehC5xisN56O5sCQJDeTGsJ1OKnawcIxj1/XT3Ts=;
 b=JS7tPW5/3bOCEo7WW7+Cvxzme4iAmvLIPK5q0hbL4EQY47z0PnGQI5IHpCSHuImKI0Z/mKKM9EbCAmKlat4/ZiWRlzO3AFi2NRLt7qR3zagB5tflcj9JU7wS2QzOstJaYGyFjuVoOEJhfI+DpMNc4IZtXhopHPX3JEtRiK87fzq88JVZEGlqSf4nfnbti7wuLBaRnB3sIJwmg55j5PxflRVq9zNlsEaxnO79P7I8sJbsBPj2QhOdArn1ZipLQjNriRWODPkFVXXodbU623XXvOvR7O8bIcFQboR8mYXhP0bjFN+HMjzdO5G3QmZpO8b1DjFTjY5DaVCk7tkwi3lBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 02:19:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6319.034; Thu, 27 Apr 2023
 02:19:19 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] unfs3: fix symlink time setting issue
Thread-Topic: [OE-core][PATCH] unfs3: fix symlink time setting issue
Thread-Index: AQHZdzONSD1g4neNpkKn9OXpReiblq89VQgAgAEY7RA=
Date: Thu, 27 Apr 2023 02:19:19 +0000
Message-ID: 
 <CO6PR11MB560213B32BEAB9F7EA1AFF9BED6A9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230425050517.2562368-1-Qi.Chen@windriver.com>
 <20230426113020.5576e563@booty>
In-Reply-To: <20230426113020.5576e563@booty>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CY5PR11MB6233:EE_
x-ms-office365-filtering-correlation-id: 3d7a0fd0-60db-465c-0146-08db46c5cead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CqvYcA/gOsq6HTSNOll64iEPnLHSOOjptNcHZUYyPU+VwWedcz3m7WmosK2kvSKKRbYQgvfhhEqItHCv/qoAzmhFwDaMTm+rzYxWu5ZzmT0VYc7PLLEjFA3sgAXw7dUWSZHb2xci20GNvuaTb+3oG4bql5cdBp1ZdxVx2PaXruniat9NOTpcVmdm7CRSO1dDXvN+LEMi7priwnr/7fc0DRh3qbue7d4Az+uS2HhWmnZb5soMZ2ZsPAJj2dMuqRRndD62Ai7QtWDlhFuh1xleEqNC4OtttVgs+kTLcjuZZOSX9VUSDMEhNaUD08nxTM/LPoQWfVl3dfkNbNDW4UYlAEQBYO1T8mn2+jq9KVGGwLLe9nWitTgudYtXextmR1oFhAu6Jr34NhUi8jjUx2qJoT/SB1Eok4xwmfY3MAXNDjCjpy3LRT9O4fICmnfpcI8AWDHBwG77hor93sP8IZWBnFslW78VAnxG3mZtjuxc0Mbx4DGjhrIAcLiIsInNqu/hUOD/U35WfINyCpQMenUF1X6zXhuemjNcTqtxTeiap857i6lD2GR4eh/G0MAnzGDPImkkEt/VTn9acadhqdMcO5qRXU/mDSI53aSCSek4MrrueocTGcr9Y5cmP65nPklkL1nQ8bStTGBXBkfF1lKWyA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199021)(55016003)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(76116006)(478600001)(8676002)(8936002)(52536014)(41300700001)(5660300002)(316002)(38100700002)(122000001)(186003)(83380400001)(53546011)(7696005)(71200400001)(966005)(9686003)(6506007)(26005)(86362001)(2906002)(33656002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Z37x1+6udWsgR45iyWBLnAzrHR7Jhy9RP0SKnEhz/a6NDyiX+fcFn3m0gMoj?=
 =?us-ascii?Q?Dm5lzSQCd9X3Kg0PZZa+zMpGNA3lDDfFmNUARHEHaRLkuTsApnVaR92rLxjT?=
 =?us-ascii?Q?SfhaSDcIUOUdwfuhVo8RoxanF73X76oK2O5jXb0SvVmhVf+7BYvWDhJkFsUF?=
 =?us-ascii?Q?waB7Id6F6W/zuARrZd2kxDkp9GLH6iY6hRLqL5mnLKll6n9395lwh/ntEkuX?=
 =?us-ascii?Q?h+amlJSu01u9i5t/kpKSMD8x89L9vOpUr25t8Y0+j0gN3PG+8pJAfeoxtH+f?=
 =?us-ascii?Q?bbq/52iUooYfPyK1jaaoWjEAxcHuIyPdxdB1MqEa4Ocxhpv5ps5Lolz68d/K?=
 =?us-ascii?Q?li5lPsIUBksGfIwzNcT1Pg7KtrQfyGFNTNahQDxvM2lenCqVEFHknbNy74gi?=
 =?us-ascii?Q?RIgXkDwtz3LAha1bh+rhz4+er7jI0DL6fmz+mMpzo/6lO0/JF44sTb3jtvEs?=
 =?us-ascii?Q?rvi1X2zSQUVlvemMIAy6/hWhYrP+eVKaqauJ4GvOOvzDZsERYz+CA9VLOhs5?=
 =?us-ascii?Q?98Avx1MywxJoK0odv4w7crdC6lQZaSNHDXK790X7r7cTyZRzmM2sRTju37ff?=
 =?us-ascii?Q?qgL4De2aD0Q4gg3Xs2mNOcPcsW1gsfxqx2vZzzQ1a4HvYoYueoroUkHpBdsW?=
 =?us-ascii?Q?a//3tcKVOUQsKXD5OgCcZrG0URyZVAM37D1Y3SbkuaNTNBSg4a5+qaIG8NWu?=
 =?us-ascii?Q?nFE+aTKXVyphMD50NDDS66UQVeiKdL5ZrLXrKTkplHC/4Mqhd2fhfRoC8fv9?=
 =?us-ascii?Q?uyGPOZaSYB1L8aK8ROb9uttPxj651P3LYZApOtTR0fRJt5JhdxlU5Vyp9vNa?=
 =?us-ascii?Q?36Bg1aNDic/7B+K9hvOTMwH8tJph5RvZkiTQZusVw0GUg8Z1gYKHaIvUpOq0?=
 =?us-ascii?Q?gMlod/THLAO4HnutW9trETNB4zzb5c5pvKIxcUBAj9bnR/QqqkNJ0CYDucMQ?=
 =?us-ascii?Q?P5L988H4kfl7N13A97qa5TMcmqfiBWxBfMoATjgyVWKSCN5WvFlF6AiqIOsq?=
 =?us-ascii?Q?8jKovTJTR8fkXeSgw2hSP8eCrRIQ35dC1nCgjXF1L2Vy5p/y6gYUCtXd/Pzd?=
 =?us-ascii?Q?3k0kx+3TX/rAKry43zUGPzN1vRW6JHLyLRlhi/IY1OrGm+4YE31fzmNzua1g?=
 =?us-ascii?Q?gEZzoBZVD+uFWqJxa+qvaV2cEgFADlLC8ui7NU1zNyGZRwAAmfHcc/yh3RWS?=
 =?us-ascii?Q?0+BWYzKCJn8sI90VXjDQ24VG+cHfO74jBf5L7U4tQtw0LUJsQOgSN9rMFjVZ?=
 =?us-ascii?Q?TpHC5rEgkY4eNUvnhn+TIajIwDIiDmGRSwQbWlqUyH4aEC0/qvW2c8f9U+06?=
 =?us-ascii?Q?CmO+TV+ZpFAi8GLWPMrr0q5C2P45glQozqxOKritF81D8SSYl+0f0idLOlq4?=
 =?us-ascii?Q?jXvxd0gKHgMWYgJXvN7cD75C+ZrXEXfqu59SONhuPTZEXLajY4s045Wtq0OT?=
 =?us-ascii?Q?VrH1iu2nHF7lJmRVLRR4wWUdrINLbX9c9GgGtPkbJOLCSAoq3+pe2S1xLOtO?=
 =?us-ascii?Q?vN0ePjiiVi6C3lZrMyWe1HnPHZB10t04kD0gIsO61ARy6gn0BBASxQXY0XMX?=
 =?us-ascii?Q?5jaL5Z/+3oTEL3yiiCIaG4IPIhqUlflXGv0Eynux?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7a0fd0-60db-465c-0146-08db46c5cead
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 02:19:19.2679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GudUP7XojQvMIYSlRs5KUCyyx3tDD4DWXoEO2sAZ0u0s5yrbbuUobZ++6Qtmt4vPtKUSsJsxFGEizqBgbklE1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-Proofpoint-ORIG-GUID: p1PvVHRUijdxatXya4HdqfkjX8xOh_c2
X-Proofpoint-GUID: mMcRnbeCCz8xsz4ObhXseXYKi3GF8UbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_01,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=802 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 02:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180461

Thanks Luca.

I found my .gitconfig setting is:
from =3D Chen Qi <Qi.Chen@windriver.com>

I've now changed it to:
From =3D Qi.Chen@windriver.com

Hope this would solve the problem.

Regards,
Qi

-----Original Message-----
From: Luca Ceresoli <luca.ceresoli@bootlin.com>=20
Sent: Wednesday, April 26, 2023 5:30 PM
To: Chen Qi via lists.openembedded.org <Qi.Chen=3Dwindriver.com@lists.opene=
mbedded.org>
Cc: Chen, Qi <Qi.Chen@windriver.com>; openembedded-core@lists.openembedded.=
org
Subject: Re: [OE-core][PATCH] unfs3: fix symlink time setting issue

Hello Chen,

On Mon, 24 Apr 2023 22:05:17 -0700
"Chen Qi via lists.openembedded.org"
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


As you can see your sender address has been mangled, and as a result the pa=
tch is rejected by the the openembedded git server. This is not your fault,=
 but we need you to modify your git configuration to prevent this from happ=
ening in the future. Have a look at the wiki for more info and how to solve=
 that:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fix=
ing_your_From_identity

I'm taking your patch for testing on the autobuilders, fixing it manually s=
o you don't need to resend your patch this time.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

