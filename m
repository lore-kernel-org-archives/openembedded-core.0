Return-Path: <diego.santacruz@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048D6C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 06:34:19 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.53])
 by mx.groups.io with SMTP id smtpd.web12.8410.1642660457234619765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 22:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=Xlh7T37k;
 spf=pass (domain: spinetix.com, ip: 40.107.23.53,
 mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Www+sfhIRKr7n34wluuEg7fQOrLB2UgIcqaoL+7L5Zfv6nGhPLdacdwcKmggt5quESJZE9VP6PGOgIX86bkEjYQYHIOtQRTMBu0k1HqB6j+EUlAekMwJ7r6niT5kfwOA6aNzg/I8Y47LdXSWTjDRRhVvePUzYJPTOlpnr9YIcncX6cblGNk2A8JCxPaxYys4tAf9p8OjLP+xASSnZy+P/mE6OgQpyk5Wx0w+BCKBSVzY1/d9CBQF6bqayLw6yp00VbOElF5RKN6XbknvDTqzH4MMIXGa1eNsQUg5hsN9h4O6uYKi9+yMv3iBfMTlbJ4uhMT97tAr0Vc0xgwR/fzTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrdRMUbVhHtUPp77DYXSF0iwAB9GLlX0Z2GVvCnIbt4=;
 b=TrOgcw+690kfynXf9XeDYZJse6BX562wHBkcwfUvHlSEACmZpUGXKcuSD6buNWMqXY3GNnRrKUPHUl/cJS7DDNu/WCvWdiFyX4+Y9XOSkD60GXFa+28r+Mg7FDfpEIRW86b7ILAYJbiZzMx8ayicENPlM7AdxJdTu/bazx1kGadNqVUungUH2YIeeCzJe+HHEBlbdUajlta262/OA5a421rJNeS+k9+WUxyjTchhIbC00VJh/NSZvEwGqL3LP1GGFDQ6E9SpY7h0LVOE9ipL2eRo//OMwFWMHjzvS5gbGszwm4h4Vnna7ta0AnShfwn/vauXdaflEOaHikiRYNlh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrdRMUbVhHtUPp77DYXSF0iwAB9GLlX0Z2GVvCnIbt4=;
 b=Xlh7T37k4wreYbzEPluR75Of6p6TM+0rNJHmoBUkMrp3/HUoic5spAwgyqqxEAt1D1aQ+C91VrcqjydEnIDa1yAc80H2AbkQBp3JqeG+sjBxsMwj5WE6s5JJ4Mrw0QpXSQ1p9kWKdTcbdNTSRHOTZ68o94cME+ckbSgGx/EkX2Y=
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::13)
 by GVAP278MB0793.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 06:34:07 +0000
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ed47:d3d:83e9:78cd]) by GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ed47:d3d:83e9:78cd%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 06:34:07 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>
Subject: RE: [OE-core] [PATCH] package_manager/rpm: conditional remove package
 manager database
Thread-Topic: [OE-core] [PATCH] package_manager/rpm: conditional remove
 package manager database
Thread-Index: AQHYDOGn3VZKLiJbpE+kw7zxvn8bwaxqIViAgAEW3gCAADzrwA==
Date: Thu, 20 Jan 2022 06:34:07 +0000
Message-ID: 
 <GV0P278MB02417BC1BD1E1FBBB8CB1239885A9@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
References: <20220119030655.3484026-1-hongxu.jia@windriver.com>
 <CANNYZj_07b452gHNi_PhSZPGxQUWqcAZeCejTDzkMzfj4Bo+xA@mail.gmail.com>
 <MW3PR11MB463344722993C35052B97B86945A9@MW3PR11MB4633.namprd11.prod.outlook.com>
In-Reply-To: 
 <MW3PR11MB463344722993C35052B97B86945A9@MW3PR11MB4633.namprd11.prod.outlook.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f21503d-f5d7-4c3c-f8b1-08d9dbdedc3b
x-ms-traffictypediagnostic: GVAP278MB0793:EE_
x-microsoft-antispam-prvs: 
 <GVAP278MB07939E32510DD525261263A9885A9@GVAP278MB0793.CHEP278.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u402dfGJ3y8BOQ4Ph7+DijN1caWTX579Drs2s/khiBCrg9uvlklbcu4xGvkLRM+z/kKic7lEDMQS96SmU81vwSfanu1w/9uwpRm2HXfkenge/KtGD/WZYYK/uHeieuUu3IwLW2UYkNxLlYDpCtf7tJE1wyyEs81GUjI7ld0Enph/OC2d7jmKxLzD8wxQ8x1sHutdSAkoKJ3dY2ImkPrr+kANFNB+WH8w8RRR0dXbFhNkFctWYyYhhi3zqZKdulGOeOHnsWzcnf9ZBwyDBJMITMVncbgUJeYvxHH3Nd5Qf4C6F3uSGvv9Ip0zHjQq1xWl5/3H3troz47nQ5D/AZr+FIrdlAL9/yHE1GJ1ltVjEIwNWOVlpxQATDqH3uP9dH+54EWX7ZzAFLbXvWnkFILtd0UXNA1+M2mRX8eFEa8jsBwLSDa56vNUWr6BuQ/SJsw2gdKNMa6k8gmZmp1+NgoWgOsh2HhevdGa3i2dvCkQc8Cd5QrWcrO+a6EVkVdci364DHMCNvEu0sR4rl4Fr8agMJs40j//duZK3AYv9H9AYDMf3VdbNHxsAfIVy/Nhl9EA4x23GOAzc4R/OXAJ1LdS62J0KUPxh9w/a1g0qn5ixoDROHFkp/EQsLqHGmhxRhHYqoZWc/wA4ehXrJnsGb8FEElOEx89TpLiM2bUivCylEG7Qf3w5ol2uCX6l92S+DW43/BVI2jtJhzmvSmzrgA5/J1uE49KNS7pfeMhGG37EyESaBqdLgmOSNgJN3HI7AfIqMF2soi4PU39wYYC4NRrhFpQw7vO+VO1gCTHPBIvMW3hUZJ/wqXFW2pkWv5ySb7Qxt9RfZQB7wKY4S6jf7sgHA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39830400003)(346002)(136003)(376002)(38100700002)(26005)(4326008)(110136005)(9686003)(122000001)(55016003)(2906002)(316002)(33656002)(8936002)(9326002)(7696005)(38070700005)(8676002)(83380400001)(86362001)(66946007)(508600001)(6506007)(5660300002)(76116006)(186003)(66476007)(166002)(53546011)(54906003)(66556008)(66446008)(52536014)(64756008)(71200400001)(130980200001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KXPdAlXy3QhIYtCCZcNaoGPPY8szm9dlYV+ww6ju9GMXxmi3LgSSSB5EzoIO?=
 =?us-ascii?Q?+vvikiLahCiI6IOtyghqOwE7tP/I8/mj+Gr4gvHNEHHz2BteOWsl1ATWdqS9?=
 =?us-ascii?Q?anwlfaiy7KCS0x6UEgC9TxuwjjlZ+i+90f2d3o6M2svUNLUdNe1r/vQ/jmKY?=
 =?us-ascii?Q?myFku56RH0OlNM9eBjk6zsgIZFplRgS+Xk0noailiFuXi/UVKB+4vyA3s91t?=
 =?us-ascii?Q?MSJ+aWhrmMbFDwyw87b/xzpce1jORPddFfO9Xi9BlbFC1yyocSUMxLMJWi/e?=
 =?us-ascii?Q?Vdiyy1F/6rhemNYWm/MewjTPH9Hmoj2MIe3K/6PbREdgLs6gnfB3fj3/uk2G?=
 =?us-ascii?Q?yz1FTtXQ4J8qZFGbmtLDkPDiXb9df2UduzVZwWMr5bV4HQ2jGClLAIUyg/kk?=
 =?us-ascii?Q?Hb2u9E8IefHGGC3dWeZfi7yhembO72FlXZ/cjBbAUmfi/Uu7NuEnZmKzQ/rr?=
 =?us-ascii?Q?q8QWU79Ae2bTCpzIpyWozhl4bik8gks72yfbtnY0UlV7LQEQq5On0J/3hBi/?=
 =?us-ascii?Q?kOkXBJuyprWQaL9gVIZOyzq9sjby26EyVjNgrZpc08x4b83HGYQlKm2ySPcI?=
 =?us-ascii?Q?Jt5RsoRsxiZw5uz/jaDMxYzMXAQ8zlxBGFHp4bJ3H8vXHDcR6aQnSGJdFQ3b?=
 =?us-ascii?Q?7YThKHeKt34dlKCVoYiWrOHizQt6X8Nrh69UqZWovy33RZ5o8FYu2ntZ9S8W?=
 =?us-ascii?Q?Q05vvi9p4eROWdbbHv/vsFoYaRrCb7xQ9c1u/X1Fg09cAZ9MNqhht6QTPq1z?=
 =?us-ascii?Q?iPLBAxMUvZYWhWvZmYZ/LACw2olZFT56mX0lKmkSwPoYeiNml3yKApWTDHtd?=
 =?us-ascii?Q?HeqyUiJXSGitVn9McqLizErgEK7aHMtzNsEVflin6vTol7WT3Fr+Qvpgtfmn?=
 =?us-ascii?Q?PkNaZvSXnna+j8BjuC9TnBB9sX8n8f6VEHCa6eSGNCy13iI/QdeIb3aTC6ge?=
 =?us-ascii?Q?SMoR8TSs2TH3RPhcQ6sfrHYlDmrYaxozO3YS+1l7k01VFYYPCGr9cqSdWOo+?=
 =?us-ascii?Q?dxDGECENOf362Eq7Tm83NxUT8bmyCCNTtMMCmUhAMYZ7wS/bye6pdIBFxnhA?=
 =?us-ascii?Q?2cBJ8m84XGZm6TS35CXXO6w7jjXRHKPZDus0H5H7CWNq7ZLr13NwHrE0KC4M?=
 =?us-ascii?Q?fHZO4dyJsNFU4J6HwR2KcT4f9BnllaS8KKlSBTvcP2UiznkKWyVW3xixXlxE?=
 =?us-ascii?Q?o3ge3GzvwNbSr35RVBEmJsMmrWNlsoHtARp1EDiDbmvNgybQjZRUfoL+rnnr?=
 =?us-ascii?Q?RgqR5glwVOPhzY7qjd1377x0UUlZ5ADuERNbPaAAIGmnlInQefrX6bAxRKLN?=
 =?us-ascii?Q?l9hUZgBywO0NuS+s0z1JedjRQQT1aCvU2cyQAcSw6z4ngNZeLNtFfDwPJhZl?=
 =?us-ascii?Q?15GeIriAChUSpZ39N3Kz+WrZaZfl6TJHzyiFlB5Op8PL6O0DmMMQWZjLiaNU?=
 =?us-ascii?Q?8mMuHItvtEbw36mNhmG0daPrmPaQsNqGYLs1ib0rBpKF49ESp1SGpyuDfkS8?=
 =?us-ascii?Q?fTl9SDtybmPjf5I+zyonW5qb2m+UP55uScUXYy1Yd7ewr8tDs5STr3GOswiD?=
 =?us-ascii?Q?IzBiG606+/crbi6U3++tZK2Vjo7fzipHdR1uq6OoctM+j6bPIiBzzKvel1Xk?=
 =?us-ascii?Q?6qJhYTQhivJd9SDRZgvZh4OOR4om41tVU1Zne8RCSxq+mRA9q9aOfCB+ce5a?=
 =?us-ascii?Q?MJoXBw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_GV0P278MB02417BC1BD1E1FBBB8CB1239885A9GV0P278MB0241CHEP_"
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f21503d-f5d7-4c3c-f8b1-08d9dbdedc3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 06:34:07.2370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Wgmr6y+ODdwg9PhTX2rd6On/bFrRTYr9Fs/2WyrJLHsGFXzGiBUGKBclD5K6zBM46dR9K6JHLCwPpD0hbeEBhALFvMQy0RIEgxywBTR2Rgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0793
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 06:34:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160750

--_000_GV0P278MB02417BC1BD1E1FBBB8CB1239885A9GV0P278MB0241CHEP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We do exactly that in our images, keep rpm but avoid dnf. We do it by addin=
g this to the image recipes (via in inc file).

ROOTFS_PKGMANAGE_remove =3D "dnf"
ROOTFS_POSTUNINSTALL_COMMAND +=3D "spx_wipe_dnf_data ; "

spx_wipe_dnf_data() {
    bbnote "Removing all dnf runtime data"
    for d in /var/lib/dnf /var/cache/dnf; do
        [ -d ${IMAGE_ROOTFS}$d ] || continue
        dirsize=3D`du -ks ${IMAGE_ROOTFS}/$d  | awk '{ print $1 }'`
        bbnote "Removing $d with $dirsize KiB"
        rm -rf ${IMAGE_ROOTFS}$d/*
    done
}


I hope this helps

--
Diego Santa Cruz, PhD
Technology Architect
spinetix.com

From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of hongxu via lists.openembedded.org
Sent: 20 January 2022 03:54
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>; Yang, Liezhi <Liezh=
i.Yang@windriver.com>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove pack=
age manager database


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
From: Alexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.c=
om>>
Sent: Wednesday, January 19, 2022 6:15 PM
To: Jia, Hongxu <Hongxu.Jia@windriver.com<mailto:Hongxu.Jia@windriver.com>>
Cc: OE-core <openembedded-core@lists.openembedded.org<mailto:openembedded-c=
ore@lists.openembedded.org>>; Yang, Liezhi <Liezhi.Yang@windriver.com<mailt=
o:Liezhi.Yang@windriver.com>>
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
 meta/lib/oe/package_manager/rpm/__init__.py<https://eur02.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%2F%2F=
__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GF=
TZf07eaSBP1gIDKvdp1Putv%24&data=3D04%7C01%7Cdiego.santacruz%40spinetix.com%=
7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b93%7C0%7=
C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Di0%2B51iSlYuayK9kClX=
pEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&reserved=3D0> | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py<https://eur02.safe=
links.protection.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__h=
ttp%3A%2F%2F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_=
Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv%24&data=3D04%7C01%7Cdiego.santacruz%40s=
pinetix.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9=
633b93%7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Di0%2B51i=
SlYuayK9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&reserved=3D0> b/meta/lib/oe/pa=
ckage_manager/rpm/__init__.py<https://eur02.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%2F%2F__init__.py__%3=
B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDK=
vdp1Putv%24&data=3D04%7C01%7Cdiego.santacruz%40spinetix.com%7Ccfe2bf45c56e4=
efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b93%7C0%7C0%7C6377824405=
78878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Di0%2B51iSlYuayK9kClXpEUxk%2FhpzlSMH=
HkNLpa7%2BDSWc%3D&reserved=3D0>
index b392581069..dce5912329 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py<https://eur02.safelinks.p=
rotection.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%=
2F%2F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87=
Li0GFTZf07eaSBP1gIDKvdp1Putv%24&data=3D04%7C01%7Cdiego.santacruz%40spinetix=
.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b93%=
7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Di0%2B51iSlYuayK=
9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&reserved=3D0>
+++ b/meta/lib/oe/package_manager/rpm/__init__.py<https://eur02.safelinks.p=
rotection.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%=
2F%2F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87=
Li0GFTZf07eaSBP1gIDKvdp1Putv%24&data=3D04%7C01%7Cdiego.santacruz%40spinetix=
.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b93%=
7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Di0%2B51iSlYuayK=
9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&reserved=3D0>
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




--_000_GV0P278MB02417BC1BD1E1FBBB8CB1239885A9GV0P278MB0241CHEP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We do exactly that in our images, keep rpm but avoid=
 dnf. We do it by adding this to the image recipes (via in inc file).<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">ROOTFS_PKG=
MANAGE_remove</span><span style=3D"font-size:10.5pt;font-family:Consolas;co=
lor:#D4D4D4"> =3D
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178">=
&quot;dnf&quot;</span><span style=3D"font-size:10.5pt;font-family:Consolas;=
color:#D4D4D4"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">ROOTFS_POS=
TUNINSTALL_COMMAND</span><span style=3D"font-size:10.5pt;font-family:Consol=
as;color:#D4D4D4"> +=3D
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178">=
&quot;spx_wipe_dnf_data ; &quot;</span><span style=3D"font-size:10.5pt;font=
-family:Consolas;color:#D4D4D4"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4"><o:p>&nbsp=
;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#DCDCAA">spx_wipe_d=
nf_data</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D=
4D4D4">() {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">&nbsp; &nb=
sp; bbnote
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178">=
&quot;Removing all dnf runtime data&quot;</span><span style=3D"font-size:10=
.5pt;font-family:Consolas;color:#D4D4D4"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">&nbsp; &nb=
sp;
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#C586C0">=
for</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D=
4">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">=
d</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4"=
>
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#C586C0">=
in</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4=
"> /var/lib/dnf /var/cache/dnf;
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#C586C0">=
do</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">&nbsp; &nb=
sp; &nbsp; &nbsp; [ -d
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">=
${IMAGE_ROOTFS}$d</span><span style=3D"font-size:10.5pt;font-family:Consola=
s;color:#D4D4D4"> ] ||
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#C586C0">=
continue</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#=
D4D4D4"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">&nbsp; &nb=
sp; &nbsp; &nbsp; dirsize=3D</span><span style=3D"font-size:10.5pt;font-fam=
ily:Consolas;color:#CE9178">`du -ks
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">=
${IMAGE_ROOTFS}</span><span style=3D"font-size:10.5pt;font-family:Consolas;=
color:#CE9178">/</span><span style=3D"font-size:10.5pt;font-family:Consolas=
;color:#9CDCFE">$d</span><span style=3D"font-size:10.5pt;font-family:Consol=
as;color:#CE9178">
 &nbsp;</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D=
4D4D4">|</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#=
CE9178"> awk '{ print $1 }'`</span><span style=3D"font-size:10.5pt;font-fam=
ily:Consolas;color:#D4D4D4"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">&nbsp; &nb=
sp; &nbsp; &nbsp; bbnote
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178">=
&quot;Removing
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">=
$d</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178=
"> with
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">=
$dirsize</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#=
CE9178"> KiB&quot;</span><span style=3D"font-size:10.5pt;font-family:Consol=
as;color:#D4D4D4"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">&nbsp; &nb=
sp; &nbsp; &nbsp; rm -rf
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#9CDCFE">=
${IMAGE_ROOTFS}$d</span><span style=3D"font-size:10.5pt;font-family:Consola=
s;color:#D4D4D4">/*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">&nbsp; &nb=
sp;
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#C586C0">=
done</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4=
D4"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4">}<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4"><o:p>&nbsp=
;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I hope this helps<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-=
serif">--
<br>
<b>Diego Santa Cruz, PhD<br>
</b><span style=3D"color:gray">Technology Architect<br>
spinetix.com</span></span><span style=3D"font-size:12.0pt;font-family:&quot=
;Times New Roman&quot;,serif;color:gray"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core@lists.openembedded.or=
g &lt;openembedded-core@lists.openembedded.org&gt;
<b>On Behalf Of </b>hongxu via lists.openembedded.org<br>
<b>Sent:</b> 20 January 2022 03:54<br>
<b>To:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;; Yang, =
Liezhi &lt;Liezhi.Yang@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] package_manager/rpm: conditional remo=
ve package manager database<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p><span style=3D"font-size:12.0pt;color:black">I am afraid doing remove op=
eration in ROOTFS_POSTPROCESS_COMMAND could not satisfy this case<o:p></o:p=
></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">The background is in order =
to save spaces in embedded device, user do not install<o:p></o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">package dnf which introduce=
s python3, and use rpm to manage package on target<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">In oe-core, the dnf, rpm an=
d pkg database are introduced by package-management of IMAGE_FEATURES,<o:p>=
</o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black">if package-management in IM=
AGE_FEATURES, we could remove unused pkg data in<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black">ROOTFS_POSTPROCESS_COMMAND =
as you suggested, but we could not uninstall<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black">dnf and all related depend(=
such as python3) gracefully;<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black">if package-management not i=
n IMAGE_FEATURES, the pkg data will be removed<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black">before ROOTFS_POSTPROCESS_C=
OMMAND, that's why this commit are trying to resolve<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">The root cause maybe dnf is=
 too heavy for disk sensitive device<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">//Hongxu<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, January 19, 2022 6:15 PM<br>
<b>To:</b> Jia, Hongxu &lt;<a href=3D"mailto:Hongxu.Jia@windriver.com">Hong=
xu.Jia@windriver.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org">openembedded-core@lists.openembedded.org</a>&gt;; Yang, Liezhi &lt;=
<a href=3D"mailto:Liezhi.Yang@windriver.com">Liezhi.Yang@windriver.com</a>&=
gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] package_manager/rpm: conditional remo=
ve package manager database</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"xmsonormal" style=3D"line-height:12.0pt;background:#FFEB9C"><sp=
an style=3D"font-size:10.0pt;color:red">[Please note: This e-mail is from a=
n EXTERNAL e-mail address]</span><o:p></o:p></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Apologies, but please no. This adds complexity, isn'=
t possible to disable and is difficult to understand. You can simply remove=
 the unneeded files from ROOTFS_POSTPROCESS_COMMAND in your image class.<o:=
p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, 19 Jan 2022 at 04:07, hongxu &lt;<a href=3D"=
mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wrote:<o:=
p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">In order to save spac=
es in target rootfs, the user wants to remove dnf and<br>
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
&nbsp;meta/lib/oe/package_manager/rpm/<a href=3D"https://eur02.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%2=
F%2F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87L=
i0GFTZf07eaSBP1gIDKvdp1Putv%24&amp;data=3D04%7C01%7Cdiego.santacruz%40spine=
tix.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b=
93%7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Di0%2B51i=
SlYuayK9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&amp;reserved=3D0">__init__.py<=
/a>
 | 9 +++++++--<br>
&nbsp;1 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager/rpm/<a href=3D"https://eur02.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__ht=
tp%3A%2F%2F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Y=
rm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv%24&amp;data=3D04%7C01%7Cdiego.santacruz%=
40spinetix.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb=
1e9633b93%7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Di=
0%2B51iSlYuayK9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&amp;reserved=3D0">__ini=
t__.py</a>
 b/meta/lib/oe/package_manager/rpm/<a href=3D"https://eur02.safelinks.prote=
ction.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%2F%2=
F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0G=
FTZf07eaSBP1gIDKvdp1Putv%24&amp;data=3D04%7C01%7Cdiego.santacruz%40spinetix=
.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b93%=
7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Di0%2B51iSlY=
uayK9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&amp;reserved=3D0">__init__.py</a>=
<br>
index b392581069..dce5912329 100644<br>
--- a/meta/lib/oe/package_manager/rpm/<a href=3D"https://eur02.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%2=
F%2F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87L=
i0GFTZf07eaSBP1gIDKvdp1Putv%24&amp;data=3D04%7C01%7Cdiego.santacruz%40spine=
tix.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b=
93%7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Di0%2B51i=
SlYuayK9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&amp;reserved=3D0">__init__.py<=
/a><br>
+++ b/meta/lib/oe/package_manager/rpm/<a href=3D"https://eur02.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Furldefense.com%2Fv3%2F__http%3A%2=
F%2F__init__.py__%3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87L=
i0GFTZf07eaSBP1gIDKvdp1Putv%24&amp;data=3D04%7C01%7Cdiego.santacruz%40spine=
tix.com%7Ccfe2bf45c56e4efe23b608d9dbc02521%7C5f4034faed2d4840a93facb1e9633b=
93%7C0%7C0%7C637782440578878242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Di0%2B51i=
SlYuayK9kClXpEUxk%2FhpzlSMHHkNLpa7%2BDSWc%3D&amp;reserved=3D0">__init__.py<=
/a><br>
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
<br>
<o:p></o:p></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_GV0P278MB02417BC1BD1E1FBBB8CB1239885A9GV0P278MB0241CHEP_--

