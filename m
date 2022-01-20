Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEC4C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 02:54:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6659.1642647250751734981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 18:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pmiFI8br;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8019138f82=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20K2lKcQ013690
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 02:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=/eEGQPX7/D3R+/OjWe2Cg1v61bvpHYNzLhQWu4wvFf0=;
 b=pmiFI8brEaTIKlb4qT6TAhDxDFmEfH0FwcckVVPgw7yuM/sqFR957ZPyai4OOgalX86y
 1RlUVKf1KCcPHNCg8K1NGT9kAHpaLsEgHCIYfykQp3dvQ3wtg8pM6QMmy9NE7dc31XqX
 CwOc8MyYq4j40pPLLpaXeJWynFQgM7S0FNlJ8fBLmVuP2JosdtK7Zvm/LMfXtwxCE31A
 2RmI0+t1DShZ9JON1vKtwmJoNvC0Jw5BI+P7/AOaXSnIaaTrCesVDAsU4zqBUYXtyPCh
 DOlcCHfoIk+dzUpk6S7erkdN+k0UMILbi7rv/FONdc2JGFjcYoYjAqJ8aaUaBiDvRNj5 Rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dpsfk86a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 02:54:09 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20K2s8Wl023631
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 02:54:08 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dpsfk86a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jan 2022 02:54:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxcVFEjtNZ1u3psSv3TCpECvzNPGFZjD7mq6KxF8rJ+mh01qc1TQ7A7aaSGuVtmb3e+B0eI39SjXFMNEYJFxJ2FEXRaHZK4AcfRUqUKhWPZzlubybKJJwmTPMfVSVhHHn+hBJdkqMpdaZUfPZrooRgYICMqkNpEkEDAMRIFefKcjCWqWVc5ekUaGeebf4Kw3KJWoakJZTNZLXAp6F9tm9dn06k4UaW+85wp5LxJTOwG/DSSLZ3IH7NL/0m9x+H52/UGGk68bZoEDg6BQcSkvKsFvfcqqqyrQhBqTw7MWusrID2n6/bzKVwJwmwUyRrid1jB2onZMWZXDOsnGYKvrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eEGQPX7/D3R+/OjWe2Cg1v61bvpHYNzLhQWu4wvFf0=;
 b=jRFt/QxgVrhjP8SQiydZXhmxL5v3A3Bh3IdfP7RsNnG0SaEPq5OBY8cTxyMg3siX5HCZKMBNZL0UGs1Ikqy73t8or04kuyNxj0KAH2Cqcxj0hXE+T7lIsyZA6JnYfbJsFwPc+vrc4zI6YUmU4DkPeUp/TPfyc29YhEjHAkWXekYBBICVJv1EQHJ85rDdgHsYXFK6mmvQEG8p28I45LeNE58l0N22XRhXpPwidwbP6d9VuY+r34Tr/P9JyDTa/BVQY79M2JfRftbFnhj/inHB0CJ/HD/teS89Oqm1EJBNZer2V13rXS7acL2oNqOSI6GM7mvhmTgDmizZq5UTeV0Bfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MWHPR11MB1582.namprd11.prod.outlook.com (2603:10b6:301:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 02:54:06 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::e8dc:b06e:73c8:d95e]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::e8dc:b06e:73c8:d95e%6]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 02:54:06 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
        "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove package
 manager database
Thread-Topic: [OE-core] [PATCH] package_manager/rpm: conditional remove
 package manager database
Thread-Index: AQHYDOGgc5anNC1K0EqAyuwF52D3t6xqIViAgAEWpDI=
Date: Thu, 20 Jan 2022 02:54:06 +0000
Message-ID: 
 <MW3PR11MB463344722993C35052B97B86945A9@MW3PR11MB4633.namprd11.prod.outlook.com>
References: <20220119030655.3484026-1-hongxu.jia@windriver.com>
 <CANNYZj_07b452gHNi_PhSZPGxQUWqcAZeCejTDzkMzfj4Bo+xA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_07b452gHNi_PhSZPGxQUWqcAZeCejTDzkMzfj4Bo+xA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8a4e35a0-162d-f9d4-80a0-35d368e9c01b
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5c11529-1ccc-40ce-bfba-08d9dbc01fe7
x-ms-traffictypediagnostic: MWHPR11MB1582:EE_
x-microsoft-antispam-prvs: 
 <MWHPR11MB15822906AF2FA267A8D204E1945A9@MWHPR11MB1582.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gJqmxztE7g42aU5487cttnGcfIcTiehewAKDofb/bOq6Rn+C9FNWglziqy7jLLc+jNnv6ZBzN72yQx9A2SVdzXlo3e/aGE/C5VcPlA2jjqLglOmmbSivSsURWDI/LvsJ1YYhQCyVp7xbDt5N5y7l0hzzp05sTAheedvFxwAzXcJ49sgeKIqNpYfyE8ceFhzlVkX91QdkC4hFkmC9fCq/+xUdAYOQIFD4Tt9uJ9AEen24LT+D3dRSJT449ZP79FhaBJLt4EbSQxJS7WHIT2lwj3bTcU4rguxm2j02n/Ak0iYBDh7Lm92XXJkTTfe7kecljeg5Hjg6Lhyrk4K/UbzgorUMshNs9m9AyKjkDXr679k0RogljnFXsyTfnLmMgUeKqueV3bjxBF6nW1Z23N6feepSsoPzcGwIbvx3hea6ba3x7cFy8aRKaXvPlc0CZVOcHWHUF6/4z81aP0fvTLVadnVflEtl2fxKUgXfEqUpTk/OAzxsT7OzLKWCFH4rF2hUTYRp6Qm0Td+K23k2aNtiPmH5OKuiVtVM56dr8Yfdd9P8ChL/HlHc8BfkNh9esScSnC98cQtSW5LKkVmvZEcCNhScfTMnoztF77tVDj4tWfFwTPYyAzozeb+AsmUZgPMLoAJeyUG2xeMrD4UH2R32QbU7AKWBc9FdvE3oJ7gNKFo4JaT2WMGFbOPX5SYrow7XNeqCgzxuKrBRYfrf8QFdhJTBzVIapwwQ1SE/XJPNcFicDumLMgzuuwbbNeKxDXvVoDjZudD6IH2zHQNiICLWnxmQD7l1ety2L/7ZqHp/KPMS1e3BBJ8E45bAsw+CxkKCv705rsmwqM/8l8LejSnZzvdV6HI1v75dKhDTzWW4rJ2sVyPSM73FiApzW3C7fV5t
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(66476007)(2906002)(64756008)(66556008)(66446008)(54906003)(55016003)(53546011)(6506007)(71200400001)(186003)(33656002)(8936002)(166002)(7696005)(38100700002)(26005)(66946007)(6916009)(91956017)(316002)(76116006)(107886003)(4326008)(5660300002)(86362001)(38070700005)(9686003)(83380400001)(19627405001)(122000001)(8676002)(52536014)(508600001)(130980200001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rbqWhyavLuFPi3l0sHaFm5d3iGNivLZZRXoq+CSdvRa+oOnw42cFSy9e2MAo?=
 =?us-ascii?Q?Wu8T0VFEvPM8Yw6ROxDiZixzEVeMwOqCZpch5EPgyRBndQbmpVHK18mEBKKt?=
 =?us-ascii?Q?ohPuuD0KiUhzDvxMYdz3zC7hIGBa12dPXSmwk0bemEN6SifHQV4k4flSNzMi?=
 =?us-ascii?Q?xVr6G2RqBN5Xt0bj4FmBmxVeX9ebvUM9LHWvKmftclrWjhYfo4Ws3Y7Ko4jb?=
 =?us-ascii?Q?vokA4954hiHhU4PdF4QccRTps213dTVeKZFdkHSn+r77GnskGs5Q42pMsB0p?=
 =?us-ascii?Q?ktewCkWjquHSEWC2v4y7t6iL2+ck5k5jBtPz9p9qhj0Q1EnWzi+Hbab2u1Zx?=
 =?us-ascii?Q?/3sy+djjGM4cL5oAoeyGyooxpNTHnbk02ixldR6dbv+GyyyHXVN1MjXPVcgB?=
 =?us-ascii?Q?rx/0J8qzNT88KADSQG8becuvHdc4bxum2V/Z4tBKHS5GzkkDylpjxUC2SNME?=
 =?us-ascii?Q?ZCtkr83DGIaALWJOBIMPxPsGyStXEm5jUJpvevPZ06tyjNH48PA9KvG94ExL?=
 =?us-ascii?Q?/DdjR8Kp1kxE/eIYbiHn/KrDuM144coKhJCMGcqlA/lRdQAyPCPrhV9zLiwI?=
 =?us-ascii?Q?Cf4znMO3tSFOJUGwcgMPJHAgfOam6qTzaJhtbJzkxE/ouszcN0Viz3MNgthT?=
 =?us-ascii?Q?GqbJBEW0nXYWj4pEdiI7M2swCMMnuDmxLKiPh9XBMYiGUavMgcqvzTjK1wqR?=
 =?us-ascii?Q?+wlZrH8RebTMwUZmMiUcUyDxkpt4tcfdFPLxvImzbFMvibL6PcpmPyozATAl?=
 =?us-ascii?Q?TqwYsQailsCdGR7adjs4szSO3bNvx89zOevsFHhOL7qxr2l0uPnUkt8xpnWB?=
 =?us-ascii?Q?gVDW2WFqdkok/1lZBkUWrR8MA3ZEFdOduetPYpF6VUpV7OiQ7xp7JBKAwtpM?=
 =?us-ascii?Q?2dZdwz1BLOBuquRKN1nzecTLF6XDyeEL/MTSRFQofxeZ1W9nRAMg2KW8ibAi?=
 =?us-ascii?Q?09bo2ag5qEUxukOvgZil4/yPolILcD8eW7vxXiRgdAbqvSh91oL6Az+Oui/w?=
 =?us-ascii?Q?Ou0Og8GHSo/dbNqRfucaEDEPiuJpk/BvbscbjSI/YRj8M3affVgaJ3IsmH9i?=
 =?us-ascii?Q?/IX/l/jMLxcSsOPcQneDSw08O5X8JfUjilBevN1dh9BXXXdFOW73foe9nM1f?=
 =?us-ascii?Q?1LqR+oIos8aqXl3Vs2kMb1UV3ufmjjmHdoCz77xL7UXniwLrl415mETipVhQ?=
 =?us-ascii?Q?4zZBUtznMvtWzUNbSmL1NbhkTQEgKOaE8NSGdSHch7YmZhhaJ6d4IisTp+ag?=
 =?us-ascii?Q?q6PVl1l2UJdUojXI8ipByKxx/XupBpeE5H6sC6hpcK2mY32r2sQ0OqsbcUJQ?=
 =?us-ascii?Q?Se67gOafVJH8VZl6AbM1wvub3REjiYYly2sliu8GfOb4j+yxlvB64RhFD9Ka?=
 =?us-ascii?Q?x3ajp8WRVQBF199mfZSXVMvAsDn2Zt7HNKUuMXkLJgv1k+XKtmhwmR5FRun6?=
 =?us-ascii?Q?MReDzMcMiHy3xAIxd3zn5hGByvP5y/1FPUWRF9dM90EcZlBggHSuWikjkIBm?=
 =?us-ascii?Q?Vc2vqc11vopTfIMLo5azP+1bc95zyp19ysPrDEvNUh0iIlbKofizE1DOZwhM?=
 =?us-ascii?Q?tIcT1073bfk8zZ+twRlEMdkBlVBvxTAx+qLsozAea6DHtzy0Rds4cIBEdRSV?=
 =?us-ascii?Q?/aQdG6pM0Ca1JXM7ca+QKqP8g3+24XbOrhiUKUdFmxNN7FppG4siAT6VKOeP?=
 =?us-ascii?Q?ptUObQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB463344722993C35052B97B86945A9MW3PR11MB4633namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5c11529-1ccc-40ce-bfba-08d9dbc01fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 02:54:06.3246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ztCsxRE547WkmBBqTIDo7vWfhJi0J8F88rf2xWDrOzNciBHaVaNU6YRrCbhx+wYr/ybnJ50+tW00BqLwH72zjaRAyfH3N72J7zA1+vgMfQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1582
X-Proofpoint-GUID: a3pTd0LKh7kI8mkHpns17PtwTRbycpjE
X-Proofpoint-ORIG-GUID: sNUNHDwjhUGMmw2wJHubvdEgd86JkXSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_12,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 02:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160748

--_000_MW3PR11MB463344722993C35052B97B86945A9MW3PR11MB4633namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am afraid doing remove operation in ROOTFS_POSTPROCESS_COMMAND could not =
satisfy this case


The background is in order to save spaces in embedded device, user do not i=
nstall

package dnf which introduces python3, and use rpm to manage package on targ=
et


In oe-core, the dnf, rpm and pkg database are introduced by package-managem=
ent of IMAGE_FEATURES,

if package-management in IMAGE_FEATURES, we could remove unused pkg data in

ROOTFS_POSTPROCESS_COMMAND as you suggested, but we could not uninstall

dnf and all related depend(such as python3) gracefully;

if package-management not in IMAGE_FEATURES, the pkg data will be removed

before ROOTFS_POSTPROCESS_COMMAND, that's why this commit are trying to res=
olve


The root cause maybe dnf is too heavy for disk sensitive device


//Hongxu

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Wednesday, January 19, 2022 6:15 PM
To: Jia, Hongxu <Hongxu.Jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>; Yang, Liezhi <Liezh=
i.Yang@windriver.com>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove pack=
age manager database


[Please note: This e-mail is from an EXTERNAL e-mail address]

Apologies, but please no. This adds complexity, isn't possible to disable a=
nd is difficult to understand. You can simply remove the unneeded files fro=
m ROOTFS_POSTPROCESS_COMMAND in your image class.

Alex

On Wed, 19 Jan 2022 at 04:07, hongxu <hongxu.jia@windriver.com<mailto:hongx=
u.jia@windriver.com>> wrote:
In order to save spaces in target rootfs, the user wants to remove dnf and
keep rpm, in this situation, we should remove dnf database only

If rpm was installed, keep rpm database, after applying this commit:

Edit conf/local.conf
...
IMAGE_FEATURES:remove =3D "package-management"
IMAGE_INSTALL:append=3D " rpm"
...

Build image and boot, run rpm -qa on target:
Without this commit
...
root@intel-x86-64:~# rpm -qa | wc -l
0
...

Apply this commit
...
root@intel-x86-64:~# rpm -qa | wc -l
1865
...

With this commit, the rpm -qa works as expected.

It does not make sense to keep dnf and remove rpm, so this commit
does not consider the scenario

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com<mailto:hongxu.jia@windr=
iver.com>>
---
 meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense.com/v3/__ht=
tp://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li=
0GFTZf07eaSBP1gIDKvdp1Putv$> | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense=
.com/v3/__http://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNK=
pv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv$> b/meta/lib/oe/package_manager/rpm/=
__init__.py<https://urldefense.com/v3/__http://__init__.py__;!!AjveYdw8EvQ!=
JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv$>
index b392581069..dce5912329 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense.com/v3=
/__http://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-=
v87Li0GFTZf07eaSBP1gIDKvdp1Putv$>
+++ b/meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense.com/v3=
/__http://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-=
v87Li0GFTZf07eaSBP1gIDKvdp1Putv$>
@@ -80,7 +80,9 @@ class RpmPM(PackageManager):
         self.saved_packaging_data =3D self.d.expand('${T}/saved_packaging_=
data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
-        self.packaging_data_dirs =3D ['etc/rpm', 'etc/rpmrc', 'etc/dnf', '=
var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
+        self.packaging_data_rpm_dirs =3D ['etc/rpm', 'etc/rpmrc', 'var/lib=
/rpm']
+        self.packaging_data_dnf_dirs =3D ['etc/dnf', 'var/lib/dnf', 'var/c=
ache/dnf']
+        self.packaging_data_dirs =3D self.packaging_data_rpm_dirs + self.p=
ackaging_data_dnf_dirs
         self.solution_manifest =3D self.d.expand('${T}/saved/%s_solution' =
%
                                                self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved')):
@@ -237,8 +239,11 @@ class RpmPM(PackageManager):
         self._invoke_dnf(["autoremove"])

     def remove_packaging_data(self):
+        remove_packaging_data_dirs =3D self.packaging_data_dnf_dirs
+        if "rpm" not in self.list_installed():
+            remove_packaging_data_dirs +=3D self.packaging_data_rpm_dirs
         self._invoke_dnf(["clean", "all"])
-        for dir in self.packaging_data_dirs:
+        for dir in remove_packaging_data_dirs:
             bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)

     def backup_packaging_data(self):
--
2.27.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#160688): https://lists.openembedded.org/g/openembedded-=
core/message/160688<https://urldefense.com/v3/__https://lists.openembedded.=
org/g/openembedded-core/message/160688__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb=
186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvQbTscth$>
Mute This Topic: https://lists.openembedded.org/mt/88527238/1686489<https:/=
/urldefense.com/v3/__https://lists.openembedded.org/mt/88527238/1686489__;!=
!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvc=
Ar3fEL$>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/u=
nsub__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSB=
P1gIDKvd7bfWZw$> [alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_MW3PR11MB463344722993C35052B97B86945A9MW3PR11MB4633namp_
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
: 12pt; color: rgb(0, 0, 0);">
<p>I am afraid doing remove operation in ROOTFS_POSTPROCESS_COMMAND could n=
ot satisfy this case</p>
<p><br>
</p>
<p>The background is in order to save spaces in embedded device, user do no=
t install</p>
<p>package dnf which introduces python3, and use rpm to manage package on t=
arget</p>
<p><br>
</p>
<p>In oe-core, the dnf, rpm and pkg database are introduced by package-mana=
gement of IMAGE_FEATURES,</p>
<p>if package-management in IMAGE_FEATURES, we could remove unused pkg data=
 in</p>
<p>ROOTFS_POSTPROCESS_COMMAND as you suggested, but we could not uninstall<=
/p>
<p>dnf and all related depend(such as python3) gracefully;</p>
<p>if package-management not in IMAGE_FEATURES, the pkg data will be remove=
d</p>
<p>before ROOTFS_POSTPROCESS_COMMAND, that's why this commit are trying to =
resolve<br>
</p>
<p><br>
</p>
<p>The root cause maybe dnf is too heavy for disk sensitive device</p>
<p><br>
</p>
<p>//Hongxu</p>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, January 19, 2022 6:15 PM<br>
<b>To:</b> Jia, Hongxu &lt;Hongxu.Jia@windriver.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;; Yang, =
Liezhi &lt;Liezhi.Yang@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] package_manager/rpm: conditional remo=
ve package manager database</font>
<div>&nbsp;</div>
</div>
<div>
<p></p>
<div style=3D"border:solid #9C6500 1.0pt; padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"x_MsoNormal" style=3D"line-height:12.0pt; background:#FFEB9C"><=
b><span style=3D"font-size:10.0pt; color:#9C6500"></span></b><span style=3D=
"font-size:10.0pt; color:red">[Please note: This e-mail is from an EXTERNAL=
 e-mail address]</span></p>
</div>
<div>
<div dir=3D"ltr">
<div>Apologies, but please no. This adds complexity, isn't possible to disa=
ble and is difficult to understand. You can simply remove the unneeded file=
s from ROOTFS_POSTPROCESS_COMMAND in your image class.</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Wed, 19 Jan 2022 at 04:07, hongx=
u &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com<=
/a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
In order to save spaces in target rootfs, the user wants to remove dnf and<=
br>
keep rpm, in this situation, we should remove dnf database only<br>
<br>
If rpm was installed, keep rpm database, after applying this commit:<br>
<br>
Edit conf/local.conf<br>
...<br>
IMAGE_FEATURES:remove =3D &quot;package-management&quot;<br>
IMAGE_INSTALL:append=3D &quot; rpm&quot;<br>
...<br>
<br>
Build image and boot, run rpm -qa on target:<br>
Without this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
0<br>
...<br>
<br>
Apply this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
1865<br>
...<br>
<br>
With this commit, the rpm -qa works as expected.<br>
<br>
It does not make sense to keep dnf and remove rpm, so this commit<br>
does not consider the scenario<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
&nbsp;meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__http://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v=
87Li0GFTZf07eaSBP1gIDKvdp1Putv$">__init__.py</a> | 9 +++++++--<br>
&nbsp;1 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.=
com/v3/__http://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKp=
v_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv$">__init__.py</a> b/meta/lib/oe/packa=
ge_manager/rpm/<a href=3D"https://urldefense.com/v3/__http://__init__.py__;=
!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKv=
dp1Putv$">__init__.py</a><br>
index b392581069..dce5912329 100644<br>
--- a/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__http://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v=
87Li0GFTZf07eaSBP1gIDKvdp1Putv$">__init__.py</a><br>
+++ b/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__http://__init__.py__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v=
87Li0GFTZf07eaSBP1gIDKvdp1Putv$">__init__.py</a><br>
@@ -80,7 +80,9 @@ class RpmPM(PackageManager):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.saved_packaging_data =3D self.d.expa=
nd('${T}/saved_packaging_data/%s' % self.task_name)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not os.path.exists(self.d.expand('${T}=
/saved_packaging_data')):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.utils.mkdirhier(self.d.e=
xpand('${T}/saved_packaging_data'))<br>
-&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_dirs =3D ['etc/rpm', 'etc/=
rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_rpm_dirs =3D ['etc/rpm', '=
etc/rpmrc', 'var/lib/rpm']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_dnf_dirs =3D ['etc/dnf', '=
var/lib/dnf', 'var/cache/dnf']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_dirs =3D self.packaging_da=
ta_rpm_dirs + self.packaging_data_dnf_dirs<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.solution_manifest =3D self.d.expand(=
'${T}/saved/%s_solution' %<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; self.task_name)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not os.path.exists(self.d.expand('${T}=
/saved')):<br>
@@ -237,8 +239,11 @@ class RpmPM(PackageManager):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self._invoke_dnf([&quot;autoremove&quot;]=
)<br>
<br>
&nbsp; &nbsp; &nbsp;def remove_packaging_data(self):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; remove_packaging_data_dirs =3D self.packaging_=
data_dnf_dirs<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if &quot;rpm&quot; not in self.list_installed(=
):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; remove_packaging_data_dirs +=3D =
self.packaging_data_rpm_dirs<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self._invoke_dnf([&quot;clean&quot;, &quo=
t;all&quot;])<br>
-&nbsp; &nbsp; &nbsp; &nbsp; for dir in self.packaging_data_dirs:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; for dir in remove_packaging_data_dirs:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.utils.remove(oe.path.joi=
n(self.target_rootfs, dir), True)<br>
<br>
&nbsp; &nbsp; &nbsp;def backup_packaging_data(self):<br>
-- <br>
2.27.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160688): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/message/160688__;!!AjveYdw8EvQ!=
JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvQbTscth$" rel=
=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/160688</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/88527238/1686489__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8=
VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvcAr3fEL$" rel=3D"noreferrer" target=3D"_b=
lank">
https://lists.openembedded.org/mt/88527238/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-=
p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvd7bfWZw$" rel=3D"noreferrer" target=3D"=
_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_MW3PR11MB463344722993C35052B97B86945A9MW3PR11MB4633namp_--

