Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84D5C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 10:59:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web11.7202.1716375546296141275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 03:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=Ednc7oFb;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.53, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVb8BVvtrZbfn9nzPoM0w20jqyoJW8frM3drrPnH3EUoNm+uOmyZxAcrFAkAaKlIgIz0dacZDY9coCfg06NMUmjj4QbQkytZv0NFeGBFyu1KCO2yyztW7Vi3sFzy+wXknqoNFYwubMhPopYHaSLx4wxHnuvitTIxMgoC1M09myEN5z8/SFJ/aGvvMsM4mbL9qx6XmlZyNJkfmc7roECW3G2I1mhQ9wuBNLhyLua7l3beop9Zucx2t2PGMFjyU6hGGb0RowyY9p0jjvJ/bVo2Ql4dnhOqznMIMc8oX6zO2K4r3tjgENNIcpHSWjsbEdyQVtRKcjjJTluF4js5gyG/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIHwjC6dn/BEz0Q/PPaiEJdO1rPj4HRSKKYtqYasgqA=;
 b=langMdH3VDoCo9g20Hi62pBW12QRmvtfdVbm7LqdFVwqYQ6L4X+2GnK1SIQ1gTHkXKPb+hUkZMEIgrd9vJ5G/PGK+maKcJ7KPNXGHoyXdTI/Ii0czl1w3eE585A4IDoKe7jVGnopX2p+mNqNGlJIAKrWGhk6pNQJ2owT/lJqQLcZa/nOSzasxh+aLjFjpboyTu3D7ik9023Row6ScnCRnSHIu7Hn/tIwesXFBjhxirDwT4BoyyOsZQ8JTum4h3av+nY+cSN/b2dUKBKWu31/VZxLPPAqFMvoJE9E7LKD20RsiO/DErFP15+Bb4AeMLpftgcKmV5DPuXpD3WyVKcxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIHwjC6dn/BEz0Q/PPaiEJdO1rPj4HRSKKYtqYasgqA=;
 b=Ednc7oFbNn+hqSiPjqiLHAQt7Vz5w3YFMg8YI/hZBu9706JyDgXRqrWCtPalF+3Fhv4Wph7jR5wxd4q10OBEFvcyg9+aj1Y/1VvZ5ss2ToohexGZsWDGAKP89Bks8y/Ir1bO97ktpMveK4cOaUlbrHKXCSomf8RDX19LCOA3F00=
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com (2603:10a6:102:153::11)
 by DUZPR06MB8746.eurprd06.prod.outlook.com (2603:10a6:10:4dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 10:59:02 +0000
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::9a7e:68eb:fb81:d90d]) by PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::9a7e:68eb:fb81:d90d%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 10:59:02 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHapxgicmcVZa8gmEij+HAHzL5NMbGbwx2AgADHudSABPSWAIABPPLk
Date: Wed, 22 May 2024 10:59:01 +0000
Message-ID: 
 <PAXPR06MB7534268E711F50A21073DD87BCEB2@PAXPR06MB7534.eurprd06.prod.outlook.com>
References: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
 <20240517183303e2ef2f5d@mail.local>
 <PAXPR06MB753497DD9AA695D02CCC14ACBCEF2@PAXPR06MB7534.eurprd06.prod.outlook.com>
 <CANNYZj_AFFjy6LBhEooLoud1bZuMY5LKD-MajZ+Jo0yQmtGyTw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_AFFjy6LBhEooLoud1bZuMY5LKD-MajZ+Jo0yQmtGyTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB7534:EE_|DUZPR06MB8746:EE_
x-ms-office365-filtering-correlation-id: 169929c5-755f-487b-780b-08dc7a4e308e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?oP0kV/OebSWeB0DB/dSM1rYe0I/KXAaWaYzI8XqLxUFx2J/1EvDsv1Fz?=
 =?Windows-1252?Q?81RzuEEs3fBLVHg8x0oKLF2qAYKEbBrWcD+KoCvjKipzXSPASR8iEBIW?=
 =?Windows-1252?Q?/sP0vp3YH4Yi0mYdH3n1bGq8a9JajdZJBVk1cpOot6mvZj9HXr1/6/Wq?=
 =?Windows-1252?Q?8m2Vfb7Hnzlo6RfHSoNyh6HCsV7gTHmlKdHgA5hV7hP4ZODgVLinc9Q+?=
 =?Windows-1252?Q?tIxTozYNGbFdIoDJ6ItbELxbbH0EqGBw0mVGlbiLEkGBRJugu1Ue6RiH?=
 =?Windows-1252?Q?WGZQ79B7wR7FOfs8X5fOB9ig89bKPT3eg0+ii+3zDL6UALpYsd/BDA4Q?=
 =?Windows-1252?Q?UNPK4e8uXracOA/W/B0bmAwFEJDT6hvdevhWDz7PX8nhw8zuBKDl80Mf?=
 =?Windows-1252?Q?y3rdUY6R04KaOQ23G81LL4ajyuqa3wRMU+IjkqPErFcwUjvIeH+Zqvmj?=
 =?Windows-1252?Q?16rryWbDwjZ0MsADvdIOwsBcOmZeT/OlpKtzbJl53m7gFZoMdQhABZ3+?=
 =?Windows-1252?Q?ZEeEAmTQ/ZB6KwcSocl8kFXjcNprBVFS00ebvz97FyQPgFBYr1Bw1Lw5?=
 =?Windows-1252?Q?5ZbJegI4/bJY4/Tg5hyOPXsmjRlwXlFMgwba0RY9FnzhVWQmeNO1F0HN?=
 =?Windows-1252?Q?/odGniAFOwoyNMOtpuM/XBbr6y+VIdPLS35R4gNvu+cZHDjcoJLtp4WG?=
 =?Windows-1252?Q?rfKObVVhPb7OdpuujbBrP0d7kDj1CI0K4IrNUYv5GqLdYlsKrTRV42eG?=
 =?Windows-1252?Q?akA+vVNFQCfDGM9fPLbh4TSRgBx7KIzCN4ZeQBwXfxMoeZOhxEFXVbD+?=
 =?Windows-1252?Q?AE4EOQd9+AUdrw00RTfFxgvUgAKYwKttsQEbkC5UY5UBsFndKxg5eOqy?=
 =?Windows-1252?Q?5M3QC8nidAiZDjzKi2zjTa3j2xkHzLqGZCABSJM8UdJkZMn2nFdnue7P?=
 =?Windows-1252?Q?8ZOVcRsK+HdLwr/RWPn30Z1/LZxQS8+fDDqkkBkct3CQjcZ4SRvSOg9J?=
 =?Windows-1252?Q?+uOZ3Befm0ZpObFZCLTZtoTryx4KwwqLP4qqcut43JzsMBHOAjI/+gJq?=
 =?Windows-1252?Q?fovh3zXj0H2I5KWT5YTXRXPzW4R1TflfpnE5I/ovDIW3xVHaE0/LED+u?=
 =?Windows-1252?Q?lIeoaD8jtFqzH7RY6Zw53285s48MT0QZzgnyaGCyP2aRI//4FCH8XTTk?=
 =?Windows-1252?Q?FeSkaZyzaCRFHK+LI59S0iKuQitXQrO5cwcuWOHzf/ys8Yq4ZoAhybVJ?=
 =?Windows-1252?Q?ZtP0GvbiHNooO8xI49UiUgBdNZXZV/8k4BUva7jpyHn+F/bgJ4Nnompv?=
 =?Windows-1252?Q?vaZ2+5RueH138De3fCqQRN0gbCLhHcl0z1Pbi01vIscEXTUCuNAtFztx?=
 =?Windows-1252?Q?etJCWRmd5XbJZA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB7534.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?EZDBng72QPv6Zs+JZV1i+zf1WOcqbU+I/r/VtULlbFxnMETPwnI1XSHk?=
 =?Windows-1252?Q?OJxBVEn0+oB0pakYpPKd9n8CdM7g4JysjiSVY3xuLKL3t4KQsHoC15SS?=
 =?Windows-1252?Q?gXnz6EXw5Hh5cYpPcDsN8pll+qM1OxLzlREhhVclq8qNn7kA8qDRHee/?=
 =?Windows-1252?Q?1RMIVGCX/M3Qz2dbOMzaccLxFAzpTXzfgSu6vENjePPBKFpu+vE4HGtZ?=
 =?Windows-1252?Q?mzIKlWGU7R4amb0ebHaRb8bqOKgMoG+9dO+ZDvuXrdwoLb5gmhun0T4/?=
 =?Windows-1252?Q?W9BUUGVRr4oZtX9o/tZ/UypEGCGZBLXqHFz4XhgMGb+VV+o4DFqVoZDD?=
 =?Windows-1252?Q?PObsOdOnTUmp2URV5ggUSb3lAZeD/NdTDx/NO4tRWVJ8UEWd1ODdmyTL?=
 =?Windows-1252?Q?BOfNIH8n/ZKGu3xFKi6A4V6Kh0CWN49007S1lJTqQwaZPoLiUKMwsrSH?=
 =?Windows-1252?Q?qitZNakDx6yEcGfv7zBF5gTgLTVNQJBh0Qa83utEqcrzj2pyr9Efq+L2?=
 =?Windows-1252?Q?HF43uSVO/eKK2o2lspBuXbGleQIV+7xprTSS8/jmAuhi/wRR1XZ5op3G?=
 =?Windows-1252?Q?j3FHYxxFweqwMxzUwgF269YaX/oPzoTHmi0EGCgBX00VR8BplxjHBDZt?=
 =?Windows-1252?Q?RkhfzO1gxrj9Yt4kau2qaGtwfZ2hStQhaQ1pkqMtgC5DRQHTG60A+U27?=
 =?Windows-1252?Q?YNoaMIbMF+4EIj4bR5vif0KEk2CW34CC8FeioQWUReKYmjt3lwnTviSy?=
 =?Windows-1252?Q?sqzXqoJL66UxvTO5l2dfMSmWkOQUTB/q/OIl6Xnimo5aepJkHuaKqJ+P?=
 =?Windows-1252?Q?NK+IxpcsDjxv4mBYAh/lseLDA9zWUK9G3+xFU828N0XP60GJ3bWyxi00?=
 =?Windows-1252?Q?CKoAVRotovQKnZy1oDehS1XCJjMR+uWQjlZto7Ej7ejH2T5slA6QF+Jt?=
 =?Windows-1252?Q?rwyOOBprv2ZZBY5Dj2o/UaCFH7qiHcGyk6ZIMbqroj4Vv/yDiytR+WOW?=
 =?Windows-1252?Q?dJ9AP7/hdZBMY2COQjsS4gyIT37NvKHxSSp1Msk6tKrwkom57ds4qrHW?=
 =?Windows-1252?Q?ZeU9KaVBifgJ/Lb8hHl15NnTSF1A7z3JiA7phuakhiNn2AFwksbAY32E?=
 =?Windows-1252?Q?V2FV/rfNpdDxWwvalxOxzexrwdPdSMu/RiwiLY9vIRAO44NJNI7V1kEq?=
 =?Windows-1252?Q?gqVidnnUbR/msHiMDLRbsgbpsw3S2Sw2h3SfZdR0tT5jpwh7gbm3JfP5?=
 =?Windows-1252?Q?MNctOOI4kyA2s8hQa8ZrnFZMzc0iM8xfoQ7dHP+GGHpIbgzU2gzKYEPQ?=
 =?Windows-1252?Q?HXmi4QUqQcRoJmTxbZVSPV5rt3mWJqe0gUbDUW1VGa7qJh/JVLuCJPCy?=
 =?Windows-1252?Q?8bpNSBcd9EBdk0iFPIijDlVHoEXNn9Wrb/mMUQJt7BfO8GOs0eqqW8i3?=
 =?Windows-1252?Q?WqhhVHRfRb/XrPJRBwN5iIXoJlrwI9tTVoRp0OUy+lIxeD60+BuInli3?=
 =?Windows-1252?Q?9u+3hZr+ejdaYGcKa/YP+JHvzcIsMPdyPXrHd4+UoDxWix26CXkXBWDA?=
 =?Windows-1252?Q?oQ8XaqMUOkeWCCFxf+iOMT6J4SccTlhOypMP+6WPCN0K/1khc9PlsgEJ?=
 =?Windows-1252?Q?LvCI7zHV7LJRePm+Tkg/zRsRO/EGKZC5nAPC7G/n6RRigfu12yQdZidp?=
 =?Windows-1252?Q?mmswjBZpM+xGcfbcTCMYaEG5godxJOZ6Exlyt3pHd/zumT6TVovU2gAB?=
 =?Windows-1252?Q?0FisZ1osixPfIJule4ujUuRJfsnpDS0MxsHSKLSjZiSfp0U5bkgORL6b?=
 =?Windows-1252?Q?vbkP7ZrK5RlzJ1sUUJFSsNkn6dU=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB7534.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169929c5-755f-487b-780b-08dc7a4e308e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 10:59:01.9867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngCsj9mc6Y2nFamJhqbRjR1bALUcjKqACxEDUEEYUyRy1Dl5bTlNklD6aDiUF4bi4VQGaj5uZSr2OdNtv14ow46E4fMRMEOEB7ZrhYpZ9fOAR1sT4vjVYriU8ap+udS8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 10:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199746

Hoi,


>  If you scroll further up, there's:

ah... stupid me relied on the search function in the webui (which caches on=
ly part of the output...) instead of looking at/searching through the raw l=
og; sorry!

> Also note that this happened only on the arm host, and not on x86
hosts. Which does make it tricky to reproduce, but at least gives a
lead:

curiously if i use an "actual arm host" =3D a debian arm64 schroot (see bel=
ow),
building and running the tests in there also succeeds
-> so my current lead is that there is sth "wrong" with the qemu disk-image=
 :-S

i'll have to pick apart how the yocto-autobuilder builds itself qemu-arm, a=
 disk image and then runs the tests inside of that... convoluted :-D

since this most likely ends up in a special case/exception inside the test;=
 would excluding that machine+test be an option?


gru=DF
Johannes


debian-arm schroot:
#> apt install qemu-user-static
#> mkdir -p debian-arm64/usr/bin/; cp /usr/bin/qemu-arm-static debian-arm64=
/usr/bin/
#> debootstrap --arch=3Darm64 bookworm debian-arm64 http://deb.debian.org/d=
ebian/
#chroot> apt install -y gawk wget git diffstat unzip texinfo gcc build-esse=
ntial chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debia=
nutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-=
tool file locales libacl1
#chroot /tmp/openembedded-core/build> SDKMACHINE=3Daarch64 MACHINE=3Dqemuar=
m64 PACKAGE_CLASSES=3Dpackage_rpm oe-selftest --verbose -r imagefeatures.Im=
ageFeatures.test_image_gen_pkgdbfs_ipk
<SNIP>
2024-05-22 05:15:52,357 - oe-selftest - DEBUG - running cmd: /tmp/openembed=
ded-core/build-st/tmp-glibc/sysroots/aarch64/usr/bin/opkg --volatile-cache =
--offline-root=3D/tmp/openembedded-core/build-st/tmp-glibc/deploy/images/qe=
muarm64 --add-arch qemuarm64:11 --add-arch qemuarm64:12 list-installed
<SNIP>
2024-05-22 05:16:06,765 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)




________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, May 21, 2024 12:08
To: SCHNEIDER Johannes
Cc: Alexandre Belloni; openembedded-core@lists.openembedded.org; richard.pu=
rdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext image

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


If you scroll further up, there's:

2024-05-16 22:05:57,101 - oe-selftest - INFO - FAIL:
imagefeatures.ImageFeatures.test_image_gen_pkgdbfs_ipk
(subunit.RemotedTestCase)
2024-05-16 22:05:57,102 - oe-selftest - INFO -
----------------------------------------------------------------------
2024-05-16 22:05:57,102 - oe-selftest - INFO -
testtools.testresult.real._StringException: Traceback (most recent
call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/selftest/cases/imagefeatures.py",
line 344, in test_image_gen_pkgdbfs_ipk
    result =3D runCmd(cmd)
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/utils/commands.py",
line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status
%d:\n%s" % (command, result.status, exc_output))
AssertionError: Command
'/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-4137794/tm=
p/sysroots/aarch64/usr/bin/opkg
--volatile-cache
--offline-root=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/bui=
ld-st-4137794/tmp/deploy/images/qemuarm64
--add-arch qemuarm64:11 --add-arch qemuarm64:12 list-installed'
returned non-zero exit status 255:


Also note that this happened only on the arm host, and not on x86
hosts. Which does make it tricky to reproduce, but at least gives a
lead:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6921

Alex

On Sat, 18 May 2024 at 08:30, SCHNEIDER Johannes
<johannes.schneider@leica-geosystems.com> wrote:
>
> Hoi Alexandre,
>
>
> is there a way to get more output out of the autobuilder?
> the logs only tell "that" the test failed, not "why" =3D which assertion =
was missed
>
> if i run the test locally with the differing variables set like this:
> #> SDKMACHINE=3Daarch64 MACHINE=3Dqemuarm64 oe-selftest --verbose -r imag=
efeatures.ImageFeatures.test_image_gen_pkgdbfs_ipk
>
> it succeeds :-S
> ... ideas/thoughts?
>
>
> gru=DF
> Johannes
>
> ________________________________________
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Friday, May 17, 2024 20:33
> To: SCHNEIDER Johannes
> Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundat=
ion.org; alex.kanavin@gmail.com
> Subject: Re: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext ima=
ge
>
> This email is not from Hexagon=92s Office 365 instance. Please be careful=
 while clicking links, opening attachments, or replying to this email.
>
>
> Hello,
>
> deb and rpm seem successful but ipk still fails:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3335/s=
teps/14/logs/stdio
>
> On 16/05/2024 00:34:57+0200, Johannes Schneider via lists.openembedded.or=
g wrote:
> > systemd-sysext allows to overlay another image (or multiple) ontop of
> > a "base-image" =3D the current rootfs, via the use of overlayfs; to add
> > tools and features meant for development purposes.
> >
> > To quote the documentation on systemd-sysext:
> > " ...addition in order to make debugging/development easier). System
> > extension images should not be misunderstood as a generic software
> > packaging framework, ..."
> >
> > To build a lean image, that only holds packages that are not already
> > part of the base-image, a snapshot of the package-database is taken
> > after the installation of the base-rootfs is done, and picked up again
> > when collecting the rootfs of such a extension image.
> >
> > with all this in place an example usage could look like this:
> > some-core-image.bb
> >   inherit core-image
> >   IMAGE_GEN_PKGDBFS =3D "1"
> >
> > extending-image.bb
> >   inherit image-sysext
> >   IMAGE_FSTYPES =3D "squashfs"
> >   IMAGE_BASE_PKGDB =3D "some-core-image"
> >   # the above pointing at a package-db similar to:
> >   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-2024021017230=
5-pkgdb.rootfs.tar.gz
> >
> > then on the device, running some-core-image, with the extension image p=
laced at FN:
> > $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> > $> systemd-sysext list
> > $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
> >
> > As long as the VERSION_ID of the extension image matches the os-release
> > in the base image, the above commands return sucessfully;
> > for details on the compativility check see the docs for systemd-sysext.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > changes with v2:
> >         rebase from 'kirkstone' onto 'master'
> >
> > changes with v3:
> >       incorporate review suggestions for simplification
> >       add task dependency handling
> >       add oe-selftest for the pkgdb handling
> >       add variable documentation and
> >       some more comments, and examples in the commit-msg
> >
> > changes with v4:
> >       rebase onto 'master' =3D> no functional changes
> >       fixed patchtest findings
> >
> > changes with v5:
> >         rebase onto 'master'
> >       add '.sysext' to the deployed symlink name
> >         sidenote on the tests and autobuilder failure: run locally they=
 succeed, e.g.:
> >           #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_=
image_gen_pkgdbfs
> >
> > changes with v6:
> >       tests: restructure to call 'bitbake' only once in the testcase it=
self
> >         (in hopes of solving the autobuilder problem; local test runs s=
ucceed)
> >
> > changes with v7:
> >         tests: undo the restructuring of done in v6, in favour of expli=
citly forcing steps:
> >         '-c rootfs -f'.  since concurrency of the autobuilder, and reus=
ing artifacts/sstate-caching is probably the issue?
> >
> > changes with v8:
> >         tests: fixed missing feature=3DPACKAGE_CLASSES during 'test_ima=
ge_gen_pkgdbfs'
> >          which is now split into three, one for each of the three avail=
able packagemanager: ipk, deb, rpm
> >
> > changes with v9:
> >       tests: fix singular failure in 'oe-selftest-armhost'
> >          which was due to the built image not containing a 'kernel-imag=
e...', which the gen-pkgdb sanity
> >          check expected, but 'packagegroup-core-boot' instead
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199430): https://lists.openembedded.org/g/openembed=
ded-core/message/199430
> > Mute This Topic: https://lists.openembedded.org/mt/106124365/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

