Return-Path: <SANJAY.CHITRODA@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00986CE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:11:25 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.100])
 by mx.groups.io with SMTP id smtpd.web10.33241.1695201074776294642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@einfochips.com header.s=selector1 header.b=oMw0gzSA;
 spf=pass (domain: einfochips.com, ip: 40.107.236.100, mailfrom: sanjay.chitroda@einfochips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWk2EO84NA6fqZW910pBqa8ZgjBqYUK6GgiwkbgWA4ETabguVo1qLQPyllXkJTWVpgG4ukz8Namq497b3h2wnRlkYLRNIYILojLDgSsgMfoTpIo1W1YvceWomuZ4c1IeKic1fiFOxNzZ+XS3oz9Och/OaIkvzCi0003lFrrrrbzZlKgl8CeGBCEL+yoBWxeS4UL6uVB8w/zmf/wmb7WR3P5tZASibzuFxSSMGdcbG50T5npQZTjATtzRyidzLOx3GgOCw2+7kxGL9aGxfw8dp1eBM8whja9uBaRUiexYZO4mUGVrZAcoAlnuncn9dNhucbEIjGg+4ItvrQSuOQdB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76vKWUKp+/HuKIIhGA7zV8ydbVYiVo518NCA0mTHFx4=;
 b=eabvzDwBPar51Kt3bitAuBFLt4mMgrYxNbb7dgiX72bmHh094OrPPuRWDOdWnOezsKVLUzm5zSCfFXC5pplyD/O3J7RltYbZP25pyeD37GlZ6GtV8nvBMJnt4Zwe4nn+O2wgSW33Js4obmL9m9Cw8U2dWyEqTXSWSHdHM6b2rBRoQCppks/S/yGYZtRCsUonDye39TI+x6G+JSCX+hbZVkFxMeRpfrtl+35X6JxyRjZ2GaMZzTcxhsLoqTGxL5dpJU/fWpGH5oD5b+uBIyi9h104MMDVz/hZQN3oy4za0vGjXkF/hq+0T/HwnXJ4zJgmsfaajvLDTHUplvudb/1PLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76vKWUKp+/HuKIIhGA7zV8ydbVYiVo518NCA0mTHFx4=;
 b=oMw0gzSArH4XuFiPNyTEQita9gTzK44HCPXx4hoGG632QLlb152YooyMDhmi0MZwdK8U2UVNjogRbszGf7K4NYeshRTTqIqq5+pbPFWyssLcuR5YtMBFBDHahvnIc6Hm/v2vZ1keZLvIvMI0mRmksDfkmhEVdnoAiuEUk968fUw=
Received: from SA3PR04MB8628.namprd04.prod.outlook.com (2603:10b6:806:2f8::16)
 by CH2PR04MB6631.namprd04.prod.outlook.com (2603:10b6:610:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.9; Wed, 20 Sep
 2023 09:10:58 +0000
Received: from SA3PR04MB8628.namprd04.prod.outlook.com
 ([fe80::5508:b63f:6d7a:c0e6]) by SA3PR04MB8628.namprd04.prod.outlook.com
 ([fe80::5508:b63f:6d7a:c0e6%7]) with mapi id 15.20.6813.017; Wed, 20 Sep 2023
 09:10:58 +0000
From: SANJAYKUMAR CHITRODA <SANJAY.CHITRODA@einfochips.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "martin.jansa@gmail.com"
	<martin.jansa@gmail.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: Deepak Rathore <deepak.rathore@einfochips.com>, Krunalkumar Darji
	<KRUNAL.DARJI@einfochips.com>
Subject: Re: [External] [OE-core] [PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
Thread-Topic: [External] [OE-core] [PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
Thread-Index: AQHZ6BU2B3veqX2FCU6SYRTcI54EJrAjcp8u
Date: Wed, 20 Sep 2023 09:10:58 +0000
Message-ID: 
 <SA3PR04MB8628B1D86F2BAE7CE1661B0891F9A@SA3PR04MB8628.namprd04.prod.outlook.com>
References: <20230915204247.3549304-1-martin.jansa@gmail.com>
In-Reply-To: <20230915204247.3549304-1-martin.jansa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-Mentions: martin.jansa@gmail.com,openembedded-core@lists.openembedded.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2023-09-20T09:10:55.962Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8628:EE_|CH2PR04MB6631:EE_
x-ms-office365-filtering-correlation-id: 409adb82-5e3c-4ff6-7e6b-08dbb9b980aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 M4saqrZjp5w1UyM3g7q7pNb07GI1cZoxypQ6KUpwrL6JvwYZvxL7a6OMLSnv99eu0GES721CwaJDT7RS2B62eMbhZbs3bMjrCJl+t+qPElsXha+f6DnDZfexay1RCnOwu+LMlOHXumpYpn947Lbr1JI4gcg1dRNvoQN1uezoxnxX0SqgepgYQi83QXt/xWMEuUKBla1/FZ0F5A3mpXYhWB/P92wAFImCjK9njJc6xB5EO+rOTZaqTbXASWIrMMKAvArbYxhaL667S4Ho7FCVCK6Iw20pcHiW4yBnJelaNpPnmK/NeXIjibH7ItLxeTWmIAev5+Fq6IObkUFmqzJiEXX3Lgztq/aKdoVLo9cP5iqSdm1Xf1IycPDA34+GwLMr6L3fDnhvOQCFpe5hBjv8iL7fk4QoVyHPKIFV24IMbISO9Mv6EvL4sK2575qFRSgwg/wYZiyUWxYklmFIyVhWiyy36y5qbWMMR8AP2FUglwB2R+KjEy0T5S7NAb2TIGcJC0Nje2fRaWhrGCyjHL03+xZ1pQQwAZhqwyFT4YL4Vr1ELrfBfItHbQBxURq4J72UJIKyJ4HckcOmfJlZW19bVs/ds1OEJayQ0j1bwQNIMrc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8628.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199024)(1800799009)(186009)(7696005)(55236004)(6506007)(9686003)(966005)(71200400001)(478600001)(45080400002)(83380400001)(26005)(107886003)(30864003)(2906002)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(76116006)(316002)(91956017)(110136005)(4326008)(8676002)(52536014)(5660300002)(8936002)(41300700001)(33656002)(82950400001)(82960400001)(55016003)(86362001)(38100700002)(38070700005)(122000001)(166002)(84970400001)(19627405001)(66899024);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dc8+OGyKCqnzOahx3EZUjrDtF4YQWhwdX/i2Njjt9GU7WqBajimp8YimV8JO?=
 =?us-ascii?Q?YJIOOLC9LBDT0ILYK+Colt3xkS4XbsO+MQegoBMR5QQGrOwL0G4voCD2Frgc?=
 =?us-ascii?Q?9LgM/dNn2MlBU8uo7CYGL5IH8GMVLLSeioZ3QD5WRVTW1f+jncYnBVil3q4Y?=
 =?us-ascii?Q?cm1kCrsaB4xnGbU5v1P14XwGTkqcu294KCYbSSPFMloOfCdhV7UJBehMArhu?=
 =?us-ascii?Q?0II7xSoeAHMFzpJI5BILjeyAItA3Pxk/n1a64LWwuVScaby200SLYX3IY9rf?=
 =?us-ascii?Q?d5s0J6ctQxsMFu7k7s/i9GARSchTWpIKziepAeMml9gKYZWU8yOWVyY34j5+?=
 =?us-ascii?Q?r4qlsyGxRAEvhjKs5gRPtzRLF3u29btMw5UCvyiNfb81u1X7p/gL9avcum4E?=
 =?us-ascii?Q?6FSbLHYoUyGj89WlfOKkF9PrCPkOZF8LqwRspgyQ8AaOOzk/btK6zLdNaMV3?=
 =?us-ascii?Q?Z0cMt01VLo9E/0dri8VbCa4fe3+OixxvltAO7eMc1X2ig0qAUaCQmDr4iNSN?=
 =?us-ascii?Q?0cy0gBMIH5H1JhvIjwTgdttlutaeRN1mA+h9Hlsmu0LjPadP7bu/f6YZ/7sR?=
 =?us-ascii?Q?qrkbiik2ozb1xDxMizFIa8gRjAjSv+pQLImVxWkl8aZEZGVtec3n0azgdHPl?=
 =?us-ascii?Q?PW8pENsuxj2FSQOzEVC0vJ8s6pOeziS9IKirZuvwQPkj3pa61HMj1Hc9fJjV?=
 =?us-ascii?Q?KjIJGDOFnN16ZqLNz4mLmTg6q9YfFSInZ6SYbwAtIQRa0IsyCMUJW2FlGnOZ?=
 =?us-ascii?Q?babzyy5ZBX16hkiFO39DFacF4rN6uG5LmF1wx5M5IWkeBDU7wEh6H8uNqAFN?=
 =?us-ascii?Q?OgX7ffvbJ6MbY0rJso1aM/hwmmahURyVuvHnFdJxhbulwjT8efd110vkDmTR?=
 =?us-ascii?Q?OmIZ7a5/ttBPKh+9Yjuev0vUFkJOxd1m+QHSPjhpLoTaV9jbZFIYNmNgPNTR?=
 =?us-ascii?Q?xfvKGSBAHL5KpeHuyeaTRNVxPeijCt58n6icrkop8/O/PHZlIg8yOJKEwBDU?=
 =?us-ascii?Q?TuqTsfSGiD+A6c86zSCA8P4zkQqKuYmE6d9/awj4iVSzhJw+OFpdIsWdT3St?=
 =?us-ascii?Q?xt03wper1GD/n6NYdumf2OMXoe0FNmrB06XdyikRNmeo/jsiI/VZijPJL1bK?=
 =?us-ascii?Q?gWyDbhrAyRO91l6wl/pIoPwCZmYJnuczUcq50TZf/QcpOAYebprVYFfPX3oO?=
 =?us-ascii?Q?SiM447kMvcHaHgozfxAcVigQkGpSKUIhhEO0CRSgSn8VGLl8gUo10qzYcIBa?=
 =?us-ascii?Q?pyVIjEsz7I8Gcu5rXI4nBBHQ5vNrDN9GFtxqwyoZMXkOWRE9tVH6JiK5rU8V?=
 =?us-ascii?Q?05XmRgobLWjNKo9uCakXwqjMdbviFSl8jV/3AWF893DIK3279vLHM3Ic8Stf?=
 =?us-ascii?Q?kxzFCPrvJatBxE6pxcQRNHGAF+ZnytUrwA22eqGSZxQd1vKAsxClj5y5ZZ2f?=
 =?us-ascii?Q?+gsMYGFpzFG1QtxFH5JOFBCZw5ZWkooeqTEp43VannRy8Rx0f419vkQWAUtI?=
 =?us-ascii?Q?AyljXNOgh7hBTF9Eq46TuJsLBBJHm606pUeajGpRK2Kuv/n2pwUBaajRzlw7?=
 =?us-ascii?Q?wRtctNy6pbj/7calfXcjQ5y/f0z9iLfgzT4JuyX6qBrj2mhGeJtLAoXLJ7sU?=
 =?us-ascii?Q?XQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA3PR04MB8628B1D86F2BAE7CE1661B0891F9ASA3PR04MB8628namp_"
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8628.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409adb82-5e3c-4ff6-7e6b-08dbb9b980aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 09:10:58.1657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19SenWc17S/zoU7AoUBHBfbHpoepZkJIJ7LMfm55vDDkRUHzVfyqBmBWFvVqj3xKZ0oHTDpelXxvP+vk7ZteS1LOJPwWufU152KgCYgGA6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6631
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187904

--_000_SA3PR04MB8628B1D86F2BAE7CE1661B0891F9ASA3PR04MB8628namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard and Martin,

In my knowledge CVE-2023-4039 is fixed and merged in master branch for gcc =
package.
But still if we generate report, this CVE gets reported as "unpatched".

From my analysis it looks like that due to following suspected reason CVE i=
s not parsed properly

  *   gcc package is not extracted in tmp/work/ directory
  *   There is no do_patch task in recipe of gcc

Please review the case and provide your insights, If anyone has any suggest=
ion/comment on this please share.

Thanks,
Sanjay Chitroda
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Martin Jansa via lists.openembedded.org <martin=
.jansa=3Dgmail.com@lists.openembedded.org>
Sent: 16 September 2023 02:12
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [External] [OE-core] [PATCH] gcc: backport a fix for ICE caused by=
 CVE-2023-4039.patch


CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.


* see:
  https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.g=
nu.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D111418&data=3D05%7C01%7CSANJAY.CHIT=
RODA%40einfochips.com%7C616af282b3e44ebbbbf008dbb62c578e%7C0beb0c359cbb4feb=
99e5589e415c7944%7C1%7C0%7C638304073791206852%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&sdata=3DKvptq0Ny6rYD0mPMROruN60EITxp1TLIzozJyAsP76w%3D&reserved=3D0<http=
s://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111418>
  https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.g=
nu.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D111411&data=3D05%7C01%7CSANJAY.CHIT=
RODA%40einfochips.com%7C616af282b3e44ebbbbf008dbb62c578e%7C0beb0c359cbb4feb=
99e5589e415c7944%7C1%7C0%7C638304073791206852%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&sdata=3DgL1a4%2BXpuVnne4yARpkbSOrGpdlsC2RkEowbd6YqX4Q%3D&reserved=3D0<ht=
tps://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111411>

* add git headers to 0025-gcc-testsuite-mips.patch so that it does
  easily apply with other patches with git am

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc        |   3 +-
 ...25-gcc-testsuite-tweaks-for-mips-OE.patch} | 148 +++++++++---------
 ...ch64-Fix-loose-ldpstp-check-PR111411.patch | 117 ++++++++++++++
 3 files changed, 197 insertions(+), 71 deletions(-)
 rename meta/recipes-devtools/gcc/gcc/{0025-gcc-testsuite-mips.patch =3D> 0=
025-gcc-testsuite-tweaks-for-mips-OE.patch} (76%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ld=
pstp-check-PR111411.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools=
/gcc/gcc-13.2.inc
index 0922251e18..d96f3171e4 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -64,8 +64,9 @@ SRC_URI =3D "${BASEURI} \
            file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
-           file://0025-gcc-testsuite-mips.patch \
+           file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://CVE-2023-4039.patch \
+           file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
 "
 SRC_URI[sha256sum] =3D "e275e76442a6067341a27f04c5c6b83d8613144004c0413528=
863dc6b5c743da"

diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch b/=
meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
similarity index 76%
rename from meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch
rename to meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-=
OE.patch
index 49eaece923..c405d8d484 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.p=
atch
@@ -1,4 +1,7 @@
-gcc testsuite tweaks for mips/OE
+From f12acc6a383546d48da3bdfb2f25ca2adb7976d7 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 13 Aug 2023 10:24:05 +0100
+Subject: [PATCH] gcc testsuite tweaks for mips/OE

 Disable loongson-mmi runtine, qemu doesn't appear to fully support them ev=
en if some
 of the instruction decoding is there.
@@ -27,12 +30,70 @@ Upstream-Status: Pending
 discussion. Need to investigate why qemu-user passes the 'bad' instruction=
s']

 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ gcc/testsuite/gcc.target/mips/mips.exp | 16 +++++++++
+ gcc/testsuite/lib/gcc-dg.exp           | 11 +++++++
+ gcc/testsuite/lib/target-supports.exp  | 45 ++++++++------------------
+ 3 files changed, 41 insertions(+), 31 deletions(-)

-Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-13.2.0.orig/gcc/testsuite/lib/target-supports.exp
-+++ gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
-@@ -2155,14 +2155,7 @@ proc check_mips_loongson_mmi_hw_availabl
+diff --git a/gcc/testsuite/gcc.target/mips/mips.exp b/gcc/testsuite/gcc.ta=
rget/mips/mips.exp
+index 15d574202d3..2cef9709774 100644
+--- a/gcc/testsuite/gcc.target/mips/mips.exp
++++ b/gcc/testsuite/gcc.target/mips/mips.exp
+@@ -709,7 +709,23 @@ proc mips_first_unsupported_option { upstatus } {
+     global mips_option_tests
+     upvar $upstatus status
+
++    if { [mips_have_test_option_p status "-mmsa"] } {
++        verbose -log "Found -mmsa"
++      if { ![check_mips_msa_hw_available] } {
++          verbose -log "No MSA avail"
++          return "-mmsa"
++      }
++    }
++    if { [mips_have_test_option_p status "-mloongson-mmi"] } {
++        verbose -log "Found -mloonson-mmi"
++        if { ![check_mips_loongson_mmi_hw_available] } {
++          verbose -log "No MMI avail"
++          return "-mloonson-mmi"
++      }
++    }
++
+     foreach { option code } [array get mips_option_tests] {
++
+       if { [mips_have_test_option_p status $option] } {
+           regsub -all "\n" $code "\\n\\\n" asm
+           # Use check_runtime from target-supports.exp, which caches
+diff --git a/gcc/testsuite/lib/gcc-dg.exp b/gcc/testsuite/lib/gcc-dg.exp
+index 9d79b9402e9..e0e5cbb1af8 100644
+--- a/gcc/testsuite/lib/gcc-dg.exp
++++ b/gcc/testsuite/lib/gcc-dg.exp
+@@ -240,9 +240,20 @@ proc schedule-cleanups { opts } {
+
+ proc gcc-dg-test-1 { target_compile prog do_what extra_tool_flags } {
+     # Set up the compiler flags, based on what we're going to do.
++    global do-what-limit
+
+     set options [list]
+
++    if [info exists do-what-limit] then {
++        # Demote run tests to $do-what-limit if set
++      switch $do_what {
++          run {
++              set do_what $do-what-limit
++              set dg-do-what $do-what-limit
++          }
++        }
++    }
++
+     switch $do_what {
+       "preprocess" {
+           set compile_type "preprocess"
+diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/tar=
get-supports.exp
+index 40f71e9ed8b..10e267fa16d 100644
+--- a/gcc/testsuite/lib/target-supports.exp
++++ b/gcc/testsuite/lib/target-supports.exp
+@@ -2155,14 +2155,7 @@ proc check_mips_loongson_mmi_hw_available { } {
        if { !([istarget mips*-*-*]) } {
            expr 0
        } else {
@@ -79,7 +140,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
      }
    }]
  }
-@@ -9187,6 +9158,7 @@ proc is-effective-target-keyword { arg }
+@@ -9187,6 +9158,7 @@ proc is-effective-target-keyword { arg } {

  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
@@ -87,7 +148,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
      global EFFECTIVE_TARGETS
      global et_index

-@@ -9194,6 +9166,7 @@ proc et-dg-runtest { runtest testcases f
+@@ -9194,6 +9166,7 @@ proc et-dg-runtest { runtest testcases flags default=
-extra-flags } {
        foreach target $EFFECTIVE_TARGETS {
            set target_flags $flags
            set dg-do-what-default compile
@@ -95,7 +156,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
            set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
            if { [info procs add_options_for_${target}] !=3D [list] } {
                set target_flags [add_options_for_${target} "$flags"]
-@@ -9201,8 +9174,10 @@ proc et-dg-runtest { runtest testcases f
+@@ -9201,8 +9174,10 @@ proc et-dg-runtest { runtest testcases flags defaul=
t-extra-flags } {
            if { [info procs check_effective_target_${target}_runtime]
                 !=3D [list] && [check_effective_target_${target}_runtime] =
} {
                set dg-do-what-default run
@@ -106,7 +167,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
        }
      } else {
        set et_index 0
-@@ -10789,6 +10764,7 @@ proc check_effective_target_sigsetjmp {}
+@@ -10789,6 +10764,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -114,7 +175,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
      global EFFECTIVE_TARGETS

      if  [istarget powerpc-*paired*]  {
-@@ -10797,6 +10773,7 @@ proc check_vect_support_and_set_flags {
+@@ -10797,6 +10773,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -122,7 +183,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget powerpc*-*-*] {
          # Skip targets not supporting -maltivec.
-@@ -10821,6 +10798,7 @@ proc check_vect_support_and_set_flags {
+@@ -10821,6 +10798,7 @@ proc check_vect_support_and_set_flags { } {
                  lappend DEFAULT_VECTCFLAGS "-mcpu=3D970"
              }
              set dg-do-what-default compile
@@ -130,7 +191,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif { [istarget i?86-*-*] || [istarget x86_64-*-*] } {
          lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -10828,6 +10806,7 @@ proc check_vect_support_and_set_flags {
+@@ -10828,6 +10806,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -138,7 +199,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif { [istarget mips*-*-*]
               && [check_effective_target_nomips16] } {
-@@ -10847,6 +10826,7 @@ proc check_vect_support_and_set_flags {
+@@ -10847,6 +10826,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -146,7 +207,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget alpha*-*-*] {
          # Alpha's vectorization capabilities are extremely limited.
-@@ -10860,6 +10840,7 @@ proc check_vect_support_and_set_flags {
+@@ -10860,6 +10840,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -154,7 +215,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget ia64-*-*] {
          set dg-do-what-default run
-@@ -10873,6 +10854,7 @@ proc check_vect_support_and_set_flags {
+@@ -10873,6 +10854,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -162,7 +223,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget aarch64*-*-*] {
          set dg-do-what-default run
-@@ -10897,6 +10879,7 @@ proc check_vect_support_and_set_flags {
+@@ -10897,6 +10879,7 @@ proc check_vect_support_and_set_flags { } {
          } else {
            lappend DEFAULT_VECTCFLAGS "-march=3Dz14" "-mzarch"
              set dg-do-what-default compile
@@ -170,56 +231,3 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.ex=
p
          }
      } elseif [istarget amdgcn-*-*] {
          set dg-do-what-default run
-Index: gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-13.2.0.orig/gcc/testsuite/gcc.target/mips/mips.exp
-+++ gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp
-@@ -709,7 +709,23 @@ proc mips_first_unsupported_option { ups
-     global mips_option_tests
-     upvar $upstatus status
-
-+    if { [mips_have_test_option_p status "-mmsa"] } {
-+        verbose -log "Found -mmsa"
-+      if { ![check_mips_msa_hw_available] } {
-+          verbose -log "No MSA avail"
-+          return "-mmsa"
-+      }
-+    }
-+    if { [mips_have_test_option_p status "-mloongson-mmi"] } {
-+        verbose -log "Found -mloonson-mmi"
-+        if { ![check_mips_loongson_mmi_hw_available] } {
-+          verbose -log "No MMI avail"
-+          return "-mloonson-mmi"
-+      }
-+    }
-+
-     foreach { option code } [array get mips_option_tests] {
-+
-       if { [mips_have_test_option_p status $option] } {
-           regsub -all "\n" $code "\\n\\\n" asm
-           # Use check_runtime from target-supports.exp, which caches
-Index: gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-13.2.0.orig/gcc/testsuite/lib/gcc-dg.exp
-+++ gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp
-@@ -240,9 +240,20 @@ proc schedule-cleanups { opts } {
-
- proc gcc-dg-test-1 { target_compile prog do_what extra_tool_flags } {
-     # Set up the compiler flags, based on what we're going to do.
-+    global do-what-limit
-
-     set options [list]
-
-+    if [info exists do-what-limit] then {
-+        # Demote run tests to $do-what-limit if set
-+      switch $do_what {
-+          run {
-+              set do_what $do-what-limit
-+              set dg-do-what $do-what-limit
-+          }
-+        }
-+    }
-+
-     switch $do_what {
-       "preprocess" {
-           set compile_type "preprocess"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-ch=
eck-PR111411.patch b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-l=
dpstp-check-PR111411.patch
new file mode 100644
index 0000000000..a408a98698
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR1=
11411.patch
@@ -0,0 +1,117 @@
+From adb60dc78e0da4877747f32347cee339364775be Mon Sep 17 00:00:00 2001
+From: Richard Sandiford <richard.sandiford@arm.com>
+Date: Fri, 15 Sep 2023 09:19:14 +0100
+Subject: [PATCH] aarch64: Fix loose ldpstp check [PR111411]
+
+aarch64_operands_ok_for_ldpstp contained the code:
+
+  /* One of the memory accesses must be a mempair operand.
+     If it is not the first one, they need to be swapped by the
+     peephole.  */
+  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
+       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
+    return false;
+
+But the requirement isn't just that one of the accesses must be a
+valid mempair operand.  It's that the lower access must be, since
+that's the access that will be used for the instruction operand.
+
+gcc/
+       PR target/111411
+       * config/aarch64/aarch64.cc (aarch64_operands_ok_for_ldpstp): Requi=
re
+       the lower memory access to a mem-pair operand.
+
+gcc/testsuite/
+       PR target/111411
+       * gcc.dg/rtl/aarch64/pr111411.c: New test.
+
+Upstream-Status: Backport [https://nam04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2Fgitweb.cgi%3Fp%3Dgcc.git%3Bh%3D2d3=
8f45bcca62ca0c7afef4b579f82c5c2a01610&data=3D05%7C01%7CSANJAY.CHITRODA%40ei=
nfochips.com%7C616af282b3e44ebbbbf008dbb62c578e%7C0beb0c359cbb4feb99e5589e4=
15c7944%7C1%7C0%7C638304073791206852%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DBnpgFw3VUHfZGD4adb3yhC%2FjfcuEYBbPQhNXkys7V2M%3D&reserved=3D0<https://gc=
c.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D2d38f45bcca62ca0c7afef4b579f82c5c2=
a01610>]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ gcc/config/aarch64/aarch64.cc               |  8 ++-
+ gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c | 57 +++++++++++++++++++++
+ 2 files changed, 60 insertions(+), 5 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc
+index 6118a3354ac..9b1f791ca8b 100644
+--- a/gcc/config/aarch64/aarch64.cc
++++ b/gcc/config/aarch64/aarch64.cc
+@@ -26154,11 +26154,9 @@ aarch64_operands_ok_for_ldpstp (rtx *operands, bo=
ol load,
+   gcc_assert (known_eq (GET_MODE_SIZE (GET_MODE (mem_1)),
+                       GET_MODE_SIZE (GET_MODE (mem_2))));
+
+-  /* One of the memory accesses must be a mempair operand.
+-     If it is not the first one, they need to be swapped by the
+-     peephole.  */
+-  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
+-       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
++  /* The lower memory access must be a mem-pair operand.  */
++  rtx lower_mem =3D reversed ? mem_2 : mem_1;
++  if (!aarch64_mem_pair_operand (lower_mem, GET_MODE (lower_mem)))
+     return false;
+
+   if (REG_P (reg_1) && FP_REGNUM_P (REGNO (reg_1)))
+diff --git a/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c b/gcc/testsuite/g=
cc.dg/rtl/aarch64/pr111411.c
+new file mode 100644
+index 00000000000..ad07e9c6c89
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+@@ -0,0 +1,57 @@
++/* { dg-do compile { target aarch64*-*-* } } */
++/* { dg-require-effective-target lp64 } */
++/* { dg-options "-O -fdisable-rtl-postreload -fpeephole2 -fno-schedule-fu=
sion" } */
++
++extern int data[];
++
++void __RTL (startwith ("ira")) foo (void *ptr)
++{
++  (function "foo"
++    (param "ptr"
++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
++    ) ;; param "ptr"
++    (insn-chain
++      (block 2
++      (edge-from entry (flags "FALLTHRU"))
++      (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
++      (insn 4 (set (reg:DI <0>) (reg:DI x0)))
++      (insn 5 (set (reg:DI <1>)
++                   (plus:DI (reg:DI <0>) (const_int 768))))
++      (insn 6 (set (mem:SI (plus:DI (reg:DI <0>)
++                                    (const_int 508)) [1 &data+508 S4 A4])
++                   (const_int 0)))
++      (insn 7 (set (mem:SI (plus:DI (reg:DI <1>)
++                                    (const_int -256)) [1 &data+512 S4 A4]=
)
++                   (const_int 0)))
++      (edge-to exit (flags "FALLTHRU"))
++      ) ;; block 2
++    ) ;; insn-chain
++  ) ;; function
++}
++
++void __RTL (startwith ("ira")) bar (void *ptr)
++{
++  (function "bar"
++    (param "ptr"
++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
++    ) ;; param "ptr"
++    (insn-chain
++      (block 2
++      (edge-from entry (flags "FALLTHRU"))
++      (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
++      (insn 4 (set (reg:DI <0>) (reg:DI x0)))
++      (insn 5 (set (reg:DI <1>)
++                   (plus:DI (reg:DI <0>) (const_int 768))))
++      (insn 6 (set (mem:SI (plus:DI (reg:DI <1>)
++                                    (const_int -256)) [1 &data+512 S4 A4]=
)
++                   (const_int 0)))
++      (insn 7 (set (mem:SI (plus:DI (reg:DI <0>)
++                                    (const_int 508)) [1 &data+508 S4 A4])
++                   (const_int 0)))
++      (edge-to exit (flags "FALLTHRU"))
++      ) ;; block 2
++    ) ;; insn-chain
++  ) ;; function
++}
--
2.42.0


--_000_SA3PR04MB8628B1D86F2BAE7CE1661B0891F9ASA3PR04MB8628namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Richard and Martin,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
In my knowledge CVE-2023-4039 is fixed and merged in master branch for gcc =
package.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
But still if we generate report, this CVE gets reported as &quot;unpatched&=
quot;.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
From my analysis it looks like that due to following suspected reason CVE i=
s not parsed properly</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<ul data-editing-info=3D"{&quot;orderedStyleType&quot;:1,&quot;unorderedSty=
leType&quot;:2}">
<li style=3D"list-style-type: &quot;- &quot;;"><span>gcc package is not ext=
racted in tmp/work/ directory</span></li><li style=3D"list-style-type: &quo=
t;- &quot;;"><span>There is no do_patch task in recipe of gcc<br>
</span></li></ul>
<div><span>Please review the case and provide your insights, If anyone has =
any suggestion/comment on this please share.</span></div>
<div><span><br>
</span></div>
<div><span>Thanks,</span></div>
<div><span>Sanjay Chitroda</span></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Martin Jansa via lists.openembedded.org &lt;martin.jansa=3Dgmail.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> 16 September 2023 02:12<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Martin Jansa &lt;martin.jansa@gmail.com&gt;<br>
<b>Subject:</b> [External] [OE-core] [PATCH] gcc: backport a fix for ICE ca=
used by CVE-2023-4039.patch</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
CAUTION: This email originated from outside of the organization. This messa=
ge might not be safe, use caution in opening it. If in doubt, do not open t=
he attachment nor links in the message.<br>
<br>
<br>
* see:<br>
&nbsp; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111418">ht=
tps://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.o=
rg%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D111418&amp;data=3D05%7C01%7CSANJAY.CHIT=
RODA%40einfochips.com%7C616af282b3e44ebbbbf008dbb62c578e%7C0beb0c359cbb4feb=
99e5589e415c7944%7C1%7C0%7C638304073791206852%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DKvptq0Ny6rYD0mPMROruN60EITxp1TLIzozJyAsP76w%3D&amp;reserved=
=3D0</a><br>
&nbsp; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111411">ht=
tps://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.o=
rg%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D111411&amp;data=3D05%7C01%7CSANJAY.CHIT=
RODA%40einfochips.com%7C616af282b3e44ebbbbf008dbb62c578e%7C0beb0c359cbb4feb=
99e5589e415c7944%7C1%7C0%7C638304073791206852%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DgL1a4%2BXpuVnne4yARpkbSOrGpdlsC2RkEowbd6YqX4Q%3D&amp;reserve=
d=3D0</a><br>
<br>
* add git headers to 0025-gcc-testsuite-mips.patch so that it does<br>
&nbsp; easily apply with other patches with git am<br>
<br>
Signed-off-by: Martin Jansa &lt;martin.jansa@gmail.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/gcc/gcc-13.2.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
&nbsp;...25-gcc-testsuite-tweaks-for-mips-OE.patch} | 148 +++++++++--------=
-<br>
&nbsp;...ch64-Fix-loose-ldpstp-check-PR111411.patch | 117 ++++++++++++++<br=
>
&nbsp;3 files changed, 197 insertions(+), 71 deletions(-)<br>
&nbsp;rename meta/recipes-devtools/gcc/gcc/{0025-gcc-testsuite-mips.patch =
=3D&gt; 0025-gcc-testsuite-tweaks-for-mips-OE.patch} (76%)<br>
&nbsp;create mode 100644 meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loo=
se-ldpstp-check-PR111411.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools=
/gcc/gcc-13.2.inc<br>
index 0922251e18..d96f3171e4 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc<br>
@@ -64,8 +64,9 @@ SRC_URI =3D &quot;${BASEURI} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch">
file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0023-Fix-install-path-of-linux64.h.patch">file://0023-Fix-instal=
l-path-of-linux64.h.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch">
file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0025-gcc-testsuite-mips.patch">file://0025-gcc-testsuite-mips.patch</a=
> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0025-gcc-testsuite-tweaks-for-mips-OE.patch">file://0025-gcc-testsuite=
-tweaks-for-mips-OE.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-4039.patch">file://CVE-2023-4039.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch">file://0026-aarch6=
4-Fix-loose-ldpstp-check-PR111411.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;e275e76442a6067341a27f04c5c6b83d86131440=
04c0413528863dc6b5c743da&quot;<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch b/=
meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch<b=
r>
similarity index 76%<br>
rename from meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch<br>
rename to meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-=
OE.patch<br>
index 49eaece923..c405d8d484 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.p=
atch<br>
@@ -1,4 +1,7 @@<br>
-gcc testsuite tweaks for mips/OE<br>
+From f12acc6a383546d48da3bdfb2f25ca2adb7976d7 Mon Sep 17 00:00:00 2001<br>
+From: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
+Date: Sun, 13 Aug 2023 10:24:05 +0100<br>
+Subject: [PATCH] gcc testsuite tweaks for mips/OE<br>
<br>
&nbsp;Disable loongson-mmi runtine, qemu doesn't appear to fully support th=
em even if some<br>
&nbsp;of the instruction decoding is there.<br>
@@ -27,12 +30,70 @@ Upstream-Status: Pending<br>
&nbsp;discussion. Need to investigate why qemu-user passes the 'bad' instru=
ctions']<br>
<br>
&nbsp;Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&=
gt;<br>
+---<br>
+ gcc/testsuite/gcc.target/mips/mips.exp | 16 +++++++++<br>
+ gcc/testsuite/lib/gcc-dg.exp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 11 +++++++<br>
+ gcc/testsuite/lib/target-supports.exp&nbsp; | 45 ++++++++----------------=
--<br>
+ 3 files changed, 41 insertions(+), 31 deletions(-)<br>
<br>
-Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-13.2.0.orig/gcc/testsuite/lib/target-supports.exp<br>
-+++ gcc-13.2.0/gcc/testsuite/lib/target-supports.exp<br>
-@@ -2155,14 +2155,7 @@ proc check_mips_loongson_mmi_hw_availabl<br>
+diff --git a/gcc/testsuite/gcc.target/mips/mips.exp b/gcc/testsuite/gcc.ta=
rget/mips/mips.exp<br>
+index 15d574202d3..2cef9709774 100644<br>
+--- a/gcc/testsuite/gcc.target/mips/mips.exp<br>
++++ b/gcc/testsuite/gcc.target/mips/mips.exp<br>
+@@ -709,7 +709,23 @@ proc mips_first_unsupported_option { upstatus } {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; global mips_option_tests<br>
+&nbsp;&nbsp;&nbsp;&nbsp; upvar $upstatus status<br>
+<br>
++&nbsp;&nbsp;&nbsp; if { [mips_have_test_option_p status &quot;-mmsa&quot;=
] } {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot;Found -mmsa=
&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { ![check_mips_msa_hw_available] } {<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot=
;No MSA avail&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;-mmsa=
&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; if { [mips_have_test_option_p status &quot;-mloongson-=
mmi&quot;] } {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot;Found -mloo=
nson-mmi&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { ![check_mips_loongson_mmi=
_hw_available] } {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot=
;No MMI avail&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;-mloo=
nson-mmi&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; foreach { option code } [array get mips_option_te=
sts] {<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { [mips_have_test_option_p status =
$option] } {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regsub -all &=
quot;\n&quot; $code &quot;\\n\\\n&quot; asm<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Use check_r=
untime from target-supports.exp, which caches<br>
+diff --git a/gcc/testsuite/lib/gcc-dg.exp b/gcc/testsuite/lib/gcc-dg.exp<b=
r>
+index 9d79b9402e9..e0e5cbb1af8 100644<br>
+--- a/gcc/testsuite/lib/gcc-dg.exp<br>
++++ b/gcc/testsuite/lib/gcc-dg.exp<br>
+@@ -240,9 +240,20 @@ proc schedule-cleanups { opts } {<br>
+<br>
+ proc gcc-dg-test-1 { target_compile prog do_what extra_tool_flags } {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; # Set up the compiler flags, based on what we're =
going to do.<br>
++&nbsp;&nbsp;&nbsp; global do-what-limit<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; set options [list]<br>
+<br>
++&nbsp;&nbsp;&nbsp; if [info exists do-what-limit] then {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Demote run tests to $do-what=
-limit if set<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch $do_what {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; set do_what $do-what-limit<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; set dg-do-what $do-what-limit<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; switch $do_what {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;preprocess&quot; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set compile_t=
ype &quot;preprocess&quot;<br>
+diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/tar=
get-supports.exp<br>
+index 40f71e9ed8b..10e267fa16d 100644<br>
+--- a/gcc/testsuite/lib/target-supports.exp<br>
++++ b/gcc/testsuite/lib/target-supports.exp<br>
+@@ -2155,14 +2155,7 @@ proc check_mips_loongson_mmi_hw_available { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { !([istarget mips*-*-*]) } {=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expr 0<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
@@ -79,7 +140,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp; }]<br>
&nbsp; }<br>
-@@ -9187,6 +9158,7 @@ proc is-effective-target-keyword { arg }<br>
+@@ -9187,6 +9158,7 @@ proc is-effective-target-keyword { arg } {<br>
<br>
&nbsp; proc et-dg-runtest { runtest testcases flags default-extra-flags } {=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; global dg-do-what-default<br>
@@ -87,7 +148,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; global EFFECTIVE_TARGETS<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; global et_index<br>
<br>
-@@ -9194,6 +9166,7 @@ proc et-dg-runtest { runtest testcases f<br>
+@@ -9194,6 +9166,7 @@ proc et-dg-runtest { runtest testcases flags default=
-extra-flags } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foreach target $EFFECTIVE_TARGET=
S {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set targ=
et_flags $flags<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set dg-d=
o-what-default compile<br>
@@ -95,7 +156,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set et_i=
ndex [lsearch -exact $EFFECTIVE_TARGETS $target]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { [in=
fo procs add_options_for_${target}] !=3D [list] } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; set target_flags [add_options_for_${target} &quot;$flags&qu=
ot;]<br>
-@@ -9201,8 +9174,10 @@ proc et-dg-runtest { runtest testcases f<br>
+@@ -9201,8 +9174,10 @@ proc et-dg-runtest { runtest testcases flags defaul=
t-extra-flags } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { [in=
fo procs check_effective_target_${target}_runtime]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; !=3D [list] &amp;&amp; [check_effective_target_${targ=
et}_runtime] } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; set dg-do-what-default run<br>
@@ -106,7 +167,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set et_index 0<br>
-@@ -10789,6 +10764,7 @@ proc check_effective_target_sigsetjmp {}<br>
+@@ -10789,6 +10764,7 @@ proc check_effective_target_sigsetjmp {} {<br>
&nbsp; proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; global DEFAULT_VECTCFLAGS<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; global dg-do-what-default<br>
@@ -114,7 +175,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; global EFFECTIVE_TARGETS<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if&nbsp; [istarget powerpc-*paired*]&nbsp; {=
<br>
-@@ -10797,6 +10773,7 @@ proc check_vect_support_and_set_flags {<br>
+@@ -10797,6 +10773,7 @@ proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default run<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default compile<br>
@@ -122,7 +183,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } elseif [istarget powerpc*-*-*] {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Skip targets not s=
upporting -maltivec.<br>
-@@ -10821,6 +10798,7 @@ proc check_vect_support_and_set_flags {<br>
+@@ -10821,6 +10798,7 @@ proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; lappend DEFAULT_VECTCFLAGS &quot;-mcpu=3D970&qu=
ot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default compile<br>
@@ -130,7 +191,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } elseif { [istarget i?86-*-*] || [istarget =
x86_64-*-*] } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lappend DEFAULT_VECT=
CFLAGS &quot;-msse2&quot;<br>
-@@ -10828,6 +10806,7 @@ proc check_vect_support_and_set_flags {<br>
+@@ -10828,6 +10806,7 @@ proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default run<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default compile<br>
@@ -138,7 +199,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } elseif { [istarget mips*-*-*]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &amp;&amp; [check_effective_target_nomips16] } {<br>
-@@ -10847,6 +10826,7 @@ proc check_vect_support_and_set_flags {<br>
+@@ -10847,6 +10826,7 @@ proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default run<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default compile<br>
@@ -146,7 +207,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } elseif [istarget alpha*-*-*] {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Alpha's vectorizat=
ion capabilities are extremely limited.<br>
-@@ -10860,6 +10840,7 @@ proc check_vect_support_and_set_flags {<br>
+@@ -10860,6 +10840,7 @@ proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default run<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default compile<br>
@@ -154,7 +215,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } elseif [istarget ia64-*-*] {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set dg-do-what-defau=
lt run<br>
-@@ -10873,6 +10854,7 @@ proc check_vect_support_and_set_flags {<br>
+@@ -10873,6 +10854,7 @@ proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default run<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default compile<br>
@@ -162,7 +223,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } elseif [istarget aarch64*-*-*] {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set dg-do-what-defau=
lt run<br>
-@@ -10897,6 +10879,7 @@ proc check_vect_support_and_set_flags {<br>
+@@ -10897,6 +10879,7 @@ proc check_vect_support_and_set_flags { } {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lappend =
DEFAULT_VECTCFLAGS &quot;-march=3Dz14&quot; &quot;-mzarch&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set dg-do-what-default compile<br>
@@ -170,56 +231,3 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.ex=
p<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } elseif [istarget amdgcn-*-*] {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set dg-do-what-defau=
lt run<br>
-Index: gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-13.2.0.orig/gcc/testsuite/gcc.target/mips/mips.exp<br>
-+++ gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp<br>
-@@ -709,7 +709,23 @@ proc mips_first_unsupported_option { ups<br>
-&nbsp;&nbsp;&nbsp;&nbsp; global mips_option_tests<br>
-&nbsp;&nbsp;&nbsp;&nbsp; upvar $upstatus status<br>
-<br>
-+&nbsp;&nbsp;&nbsp; if { [mips_have_test_option_p status &quot;-mmsa&quot;=
] } {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot;Found -mmsa=
&quot;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { ![check_mips_msa_hw_available] } {<br=
>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot=
;No MSA avail&quot;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;-mmsa=
&quot;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp; if { [mips_have_test_option_p status &quot;-mloongson-=
mmi&quot;] } {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot;Found -mloo=
nson-mmi&quot;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { ![check_mips_loongson_mmi=
_hw_available] } {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose -log &quot=
;No MMI avail&quot;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;-mloo=
nson-mmi&quot;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+<br>
-&nbsp;&nbsp;&nbsp;&nbsp; foreach { option code } [array get mips_option_te=
sts] {<br>
-+<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { [mips_have_test_option_p status =
$option] } {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regsub -all &=
quot;\n&quot; $code &quot;\\n\\\n&quot; asm<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Use check_r=
untime from target-supports.exp, which caches<br>
-Index: gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-13.2.0.orig/gcc/testsuite/lib/gcc-dg.exp<br>
-+++ gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp<br>
-@@ -240,9 +240,20 @@ proc schedule-cleanups { opts } {<br>
-<br>
- proc gcc-dg-test-1 { target_compile prog do_what extra_tool_flags } {<br>
-&nbsp;&nbsp;&nbsp;&nbsp; # Set up the compiler flags, based on what we're =
going to do.<br>
-+&nbsp;&nbsp;&nbsp; global do-what-limit<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set options [list]<br>
-<br>
-+&nbsp;&nbsp;&nbsp; if [info exists do-what-limit] then {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Demote run tests to $do-what=
-limit if set<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch $do_what {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; set do_what $do-what-limit<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; set dg-do-what $do-what-limit<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+<br>
-&nbsp;&nbsp;&nbsp;&nbsp; switch $do_what {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;preprocess&quot; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set compile_t=
ype &quot;preprocess&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-ch=
eck-PR111411.patch b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-l=
dpstp-check-PR111411.patch<br>
new file mode 100644<br>
index 0000000000..a408a98698<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR1=
11411.patch<br>
@@ -0,0 +1,117 @@<br>
+From adb60dc78e0da4877747f32347cee339364775be Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;richard.sandiford@arm.com&gt;<br>
+Date: Fri, 15 Sep 2023 09:19:14 +0100<br>
+Subject: [PATCH] aarch64: Fix loose ldpstp check [PR111411]<br>
+<br>
+aarch64_operands_ok_for_ldpstp contained the code:<br>
+<br>
+&nbsp; /* One of the memory accesses must be a mempair operand.<br>
+&nbsp;&nbsp;&nbsp;&nbsp; If it is not the first one, they need to be swapp=
ed by the<br>
+&nbsp;&nbsp;&nbsp;&nbsp; peephole.&nbsp; */<br>
+&nbsp; if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !aarch64_mem_pair_operand =
(mem_2, GET_MODE (mem_2)))<br>
+&nbsp;&nbsp;&nbsp; return false;<br>
+<br>
+But the requirement isn't just that one of the accesses must be a<br>
+valid mempair operand.&nbsp; It's that the lower access must be, since<br>
+that's the access that will be used for the instruction operand.<br>
+<br>
+gcc/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PR target/111411<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.cc (aarch64_=
operands_ok_for_ldpstp): Require<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the lower memory access to a mem-pair=
 operand.<br>
+<br>
+gcc/testsuite/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PR target/111411<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gcc.dg/rtl/aarch64/pr111411.c: New =
test.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/gitweb.cgi?p=
=3Dgcc.git;h=3D2d38f45bcca62ca0c7afef4b579f82c5c2a01610">https://nam04.safe=
links.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2Fgitwe=
b.cgi%3Fp%3Dgcc.git%3Bh%3D2d38f45bcca62ca0c7afef4b579f82c5c2a01610&amp;data=
=3D05%7C01%7CSANJAY.CHITRODA%40einfochips.com%7C616af282b3e44ebbbbf008dbb62=
c578e%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C638304073791206852%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DBnpgFw3VUHfZGD4adb3yhC%2FjfcuEYBbPQh=
NXkys7V2M%3D&amp;reserved=3D0</a>]<br>
+Signed-off-by: Martin Jansa &lt;martin.jansa@gmail.com&gt;<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++-<br>
+ gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c | 57 +++++++++++++++++++++<br=
>
+ 2 files changed, 60 insertions(+), 5 deletions(-)<br>
+ create mode 100644 gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 6118a3354ac..9b1f791ca8b 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -26154,11 +26154,9 @@ aarch64_operands_ok_for_ldpstp (rtx *operands, bo=
ol load,<br>
+&nbsp;&nbsp; gcc_assert (known_eq (GET_MODE_SIZE (GET_MODE (mem_1)),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GET_MODE_SIZE (G=
ET_MODE (mem_2))));<br>
+<br>
+-&nbsp; /* One of the memory accesses must be a mempair operand.<br>
+-&nbsp;&nbsp;&nbsp;&nbsp; If it is not the first one, they need to be swap=
ped by the<br>
+-&nbsp;&nbsp;&nbsp;&nbsp; peephole.&nbsp; */<br>
+-&nbsp; if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !aarch64_mem_pair_operand=
 (mem_2, GET_MODE (mem_2)))<br>
++&nbsp; /* The lower memory access must be a mem-pair operand.&nbsp; */<br=
>
++&nbsp; rtx lower_mem =3D reversed ? mem_2 : mem_1;<br>
++&nbsp; if (!aarch64_mem_pair_operand (lower_mem, GET_MODE (lower_mem)))<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
+<br>
+&nbsp;&nbsp; if (REG_P (reg_1) &amp;&amp; FP_REGNUM_P (REGNO (reg_1)))<br>
+diff --git a/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c b/gcc/testsuite/g=
cc.dg/rtl/aarch64/pr111411.c<br>
+new file mode 100644<br>
+index 00000000000..ad07e9c6c89<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c<br>
+@@ -0,0 +1,57 @@<br>
++/* { dg-do compile { target aarch64*-*-* } } */<br>
++/* { dg-require-effective-target lp64 } */<br>
++/* { dg-options &quot;-O -fdisable-rtl-postreload -fpeephole2 -fno-schedu=
le-fusion&quot; } */<br>
++<br>
++extern int data[];<br>
++<br>
++void __RTL (startwith (&quot;ira&quot;)) foo (void *ptr)<br>
++{<br>
++&nbsp; (function &quot;foo&quot;<br>
++&nbsp;&nbsp;&nbsp; (param &quot;ptr&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DECL_RTL (reg/v:DI &lt;0&gt; [ ptr ]))<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))<=
br>
++&nbsp;&nbsp;&nbsp; ) ;; param &quot;ptr&quot;<br>
++&nbsp;&nbsp;&nbsp; (insn-chain<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (block 2<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (edge-from entry (flags &quot;FALLTHRU&quo=
t;))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 4 (set (reg:DI &lt;0&gt;) (reg:DI x0=
)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 5 (set (reg:DI &lt;1&gt;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (plus:DI (reg:DI &lt;0&gt;) (const_int =
768))))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 6 (set (mem:SI (plus:DI (reg:DI &lt;=
0&gt;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int 5=
08)) [1 &amp;data+508 S4 A4])<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int 0)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 7 (set (mem:SI (plus:DI (reg:DI &lt;=
1&gt;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int -=
256)) [1 &amp;data+512 S4 A4])<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int 0)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (edge-to exit (flags &quot;FALLTHRU&quot;)=
)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ) ;; block 2<br>
++&nbsp;&nbsp;&nbsp; ) ;; insn-chain<br>
++&nbsp; ) ;; function<br>
++}<br>
++<br>
++void __RTL (startwith (&quot;ira&quot;)) bar (void *ptr)<br>
++{<br>
++&nbsp; (function &quot;bar&quot;<br>
++&nbsp;&nbsp;&nbsp; (param &quot;ptr&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DECL_RTL (reg/v:DI &lt;0&gt; [ ptr ]))<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))<=
br>
++&nbsp;&nbsp;&nbsp; ) ;; param &quot;ptr&quot;<br>
++&nbsp;&nbsp;&nbsp; (insn-chain<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (block 2<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (edge-from entry (flags &quot;FALLTHRU&quo=
t;))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 4 (set (reg:DI &lt;0&gt;) (reg:DI x0=
)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 5 (set (reg:DI &lt;1&gt;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (plus:DI (reg:DI &lt;0&gt;) (const_int =
768))))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 6 (set (mem:SI (plus:DI (reg:DI &lt;=
1&gt;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int -=
256)) [1 &amp;data+512 S4 A4])<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int 0)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (insn 7 (set (mem:SI (plus:DI (reg:DI &lt;=
0&gt;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int 5=
08)) [1 &amp;data+508 S4 A4])<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int 0)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (edge-to exit (flags &quot;FALLTHRU&quot;)=
)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ) ;; block 2<br>
++&nbsp;&nbsp;&nbsp; ) ;; insn-chain<br>
++&nbsp; ) ;; function<br>
++}<br>
--<br>
2.42.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA3PR04MB8628B1D86F2BAE7CE1661B0891F9ASA3PR04MB8628namp_--

