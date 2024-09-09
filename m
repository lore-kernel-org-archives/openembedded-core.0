Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B94EECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 08:32:52 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.92.50.56])
 by mx.groups.io with SMTP id smtpd.web10.48300.1725870763222988007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 01:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=t/t9TcTY;
 spf=pass (domain: outlook.com, ip: 40.92.50.56, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hrt8Y0V0g1JEFg0XkbmndkZRXYb7NjOlHolyCB5rQm6YPvbMHgrMrYCLm9TsyZfX8ALXP98Exhioi2+4Am28cEGW9FnzEJYvWVbBIBT6XQCUaupI4IGclf3Uvb8IeALsOu3axHspxkDtEb2JAby3+W71gvO+dEhyXZut29GHsR33h+h7wzXld+pPZ64tJMz9Y32na6Ek5eQNxIQFBBoAOOtuYYOGx7EoWAkXZR5rMNtuwiCPXceSFFnORODvs91Ujnm0fl/nN+qV+d/QvsAEx46sz1AvW8grZZGdbepXsFeBajLcL+NhQtPEqL69r62CV2NbfSNJ7ZR4EqZFjjbJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoVaHV/IgxarRNQjld+sycbHCvq5Ob4RvXxsLvqeZXE=;
 b=gUQXYqsjwMQNqIhOrjrI47XjYr62FEfFewB9PWHYAcAlgSpg4l0GQolOH2FCiKF/nqeg+cauH2FYS7WrvF5/xJ9S9W3TXTBL8Fgzr1Q2noaZbelrLGU4SYVFhE3vFTVDhtGn5Hn/wsAZo3NNdUPEtVvcUNa0V4NBm4ym6nq8R11TdCra3EIR17Q/OR/DsWLT6falMnOHmowrG/9CpjijUMLOtIB4G7ot76tfAqX4JvByVWtOxZdsEgRh5Xk6RgEWCYyqc1D/7tDyK9XrnZjKRkrPjM9Ya7eSeBXObwcx5GHn+iVHJ3TV2eCCwrf7lEZp0xmFuQdTC0QGw3waj7MKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoVaHV/IgxarRNQjld+sycbHCvq5Ob4RvXxsLvqeZXE=;
 b=t/t9TcTYBTovBfyg64cntouop7zdZtKqW6fYvQ9RjwoUVh+5JkeZw4EmnEVPL2ovLln9pqkpy5U4IitR4d2Wygw64f34vjiCDVJ1O3PCDEz/Bn9Ey8hQIj+Cp7/4Qb8OuNnGNY5ogG5XwXuSCKA+6rcnD0MfMTpBG0Rj/3YxJ+22IzW74j2nfql91YjTMdrV5eC5LMqY8EMhCx6LV1GJ6yTPh2kNA7m3hl4cuFEsH9WtaiiHLFeFdIpI5BM5rK3i9bJnM5wpF/al5IANB9e3SSUGR9ZMU4c3kTkUMg/cK3QvgsH78joWBqK4WBbl27w5XIEEDGjXrSun9o3dRIiAdw==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by VI1PR07MB9996.eurprd07.prod.outlook.com (2603:10a6:800:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 08:32:39 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%5]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 08:32:39 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/3] runqemu: keep generating tap devices
Date: Mon,  9 Sep 2024 08:32:15 +0000
Message-ID: <GV1PR07MB9120F7AFD75828EBBA300C9AA8992@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [qgrpov8evQrXBdeqjMmRuEKQLiO/x4YwkWHl8MRlQgrIT9ZJcU7zjWJ69g5GsfaS]
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240909083217.33315-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|VI1PR07MB9996:EE_
X-MS-Office365-Filtering-Correlation-Id: cee5d125-1f12-4a97-a230-08dcd0a9f70f
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|15080799006|19110799003|8060799006|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	OZ9SBiFVVqI37CONrXbIgBtSZQBFqHkI4n77wgokkFi14LMrAJPrxuE4qUijyezVCkcK24P7CVLweKS+MY4sHUyXm2AQMVsn5IzcxOhpR/NsKsfiurLdjvwD9SpnQmveriNETLEbXOU/YojMM2yHBehZft1/hXx/ZZyvQzHlpqOO5Mcm8OtubPjQhDj7ES1aXQ0FUOXSNjG9Ag0vSZyoovusH3whk37uTSO663D1JUb5gr7gJFY/gsILEr+4gCxOOWUnVQ44zYxlx8nQSMzRWKmO7vWvHA3SLugNpXa7KxXcuQQsDm1g7xMP5uhly9QIBRZB6jhrbVnPnxp2gNyyt1rkFCylv40tGI2rhlV9mP1WDM1OZxcbw0RbpSBg2z5mUtBsk3UfH4uO8mLZc/R4UHlQcnQxwi4EOsi1DXDSfH0ciC9K+ogk7rpDw+MaFRzE2ihbYTwF7wk4mR1KNJ9P04kKRU7KEmh/tNIN3JCP0xQXaYLtITQ/79yW2V5YcBD7QVe3Ttc7SvotKrjYN38zsRGV1zcPWYOl8MOdp/xkmw3be2KLKnhBOdHjJ0XheF5E/DE7BWN1F543ke/oQPPsir9OETUzH1ow8rDmMeYT2gyox/uwgwcCM9X7f2iXbZmW8C+v8ZfYwokyZOivniGTsY8vZ4BmACfPNF7Za2S1D1dgDZid8mnogheZ7lSchB+Vnwj7myNGnofV/BRtwmAC+wSKpn9cq+qtWBL2d1SpPDs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wi73Ji4H6UyYlb8YSHanko35wzYwih9hEk4v+JQNEDf83SL5ZpaTVKxmfqrR?=
 =?us-ascii?Q?G9JdkeQYXYCT1T58X2BcWM2R4kTFpUl6u+Hyt2f4bRKX7TMbExtPAglFfNcV?=
 =?us-ascii?Q?zZxSyddDwrZjbyQ4i9TgBI3ibfEbfntMwIL7eh8WAgqJ+sU4CjEghYPt9hNV?=
 =?us-ascii?Q?zO77RvvxR9w5D42z1vuwG+RkOoQKOG2HrDhqSgpcPcx2LEI+LoCCkakhY9q0?=
 =?us-ascii?Q?1kS3N/f6lK15sKa3uJGna25qM3fhzJVuw5Qa+nlXNE68y2VPL6Qnp3Dtm0lL?=
 =?us-ascii?Q?503P3PZUakdbKwghbqPfJCVnMftULmt9GQBl31NvbdfylYlwr7Z54pKdsft9?=
 =?us-ascii?Q?oVBlaPP6EfMHWzPA0DXl2Ub+pKnsldgHrSyInRJtZz6zfzsekun4xa8Tc1zl?=
 =?us-ascii?Q?bLFsOfIt6dj5xFs1/LxikF6FGiNztIjEw5W0IjaaJaY48UWwWWXPmgZfhBCV?=
 =?us-ascii?Q?mETYltgUyqcpOwSofNIGlnpJzGZyAU10wy/ACWxhu0p/TBoqOZ3Gfa0FjlNY?=
 =?us-ascii?Q?5fjLiO5oEf/p8DmmWHfbGOJSmrE4a9hFYftUiygvwVvpY8js1QdywUVXinhm?=
 =?us-ascii?Q?MVglMUJwQn/pOLwZgqboKdUk7l2d5JIVIq5Y+26fhGCkugEwoSEEkvGHiQ1K?=
 =?us-ascii?Q?AmCtfEkEPRduAVHmDeIDKNLPjnBq9laUnpQamfdyguqBcMzNa7TZhMkZotlO?=
 =?us-ascii?Q?MGD7hub/A75uEDdtzdqh4p6AUCm6IQliyeM6Y/spcRy5TbZ74siXrzlB2R2Z?=
 =?us-ascii?Q?SP5KEq0+0hP+7Go/QgB7CF7XJA/jwMdH7X10yt3vhbW2PNrdf8uJNhglFMZS?=
 =?us-ascii?Q?siZnXpF18IACKAin5Z+yv0SFYT+pgkk6GnCCUdUL6o0P5vbofOGFNbXBrRNb?=
 =?us-ascii?Q?KzKwiKTjjqwtRENFybWQj3Na4oF2BtaUDmTVYjsKNPluNK/uCkfrc3UfRTkM?=
 =?us-ascii?Q?4zoPizXRZ8KrzDXRqVP+nRzhD6VGFXXq04s+rzhzosetp8fMMKaKhntW3gdy?=
 =?us-ascii?Q?GGlDNmiPGRH0HDnLX7crOWJLprmb7BC8wJ/VpoyIXnTDpE4umevr0KE80+hs?=
 =?us-ascii?Q?5h/YE98p3jTegLmRCGUBMT5n70QFSyidzaz7L5UZ9/VZqSp0V5q4zvqqd0rA?=
 =?us-ascii?Q?cjcCvO3oksPKzF2yq8iDTwtvsYqeAiaGZrotqVRBeHh05kqz+Ej/1d+D2Sdf?=
 =?us-ascii?Q?jMz5gz4ngkoF1DEyrLmivSdEyURN1ElSbIeNswC6hy6+UzIjBevb79RRof3k?=
 =?us-ascii?Q?UIA3APdkO09qr+SyG3IOYf1IWJmgNX6ZsvSBtG1vGj8kpyZDOukGGxYV9Wlt?=
 =?us-ascii?Q?8cY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee5d125-1f12-4a97-a230-08dcd0a9f70f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 08:32:39.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 08:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204314

in case there is no tap device the script tries to
generate a new one.
The new device is then unguarded for a moment, so
the newly generated device could be acquired
by a different instance or user, before it is locked to
the instance with acquire_taplock.
To fix that keep generating new tap devices in case
the lock can't be acquired up to 5 times.
If no tap device can be locked it fails in the existing
error handling

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 scripts/runqemu | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2817acb19f..cdbb625505 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1195,16 +1195,20 @@ to your build configuration.
             uid =3D os.getuid()
             logger.info("Setting up tap interface under sudo")
             cmd =3D ('sudo', self.qemuifup, str(gid))
-            try:
-                tap =3D subprocess.check_output(cmd).decode('utf-8').strip=
()
-            except subprocess.CalledProcessError as e:
-                logger.error('Setting up tap device failed:\n%s\nRun runqe=
mu-gen-tapdevs to manually create one.' % str(e))
-                sys.exit(1)
-            lockfile =3D os.path.join(lockdir, tap)
-            self.taplock =3D lockfile + '.lock'
-            self.acquire_taplock()
-            self.cleantap =3D True
-            logger.debug('Created tap: %s' % tap)
+            for _ in range(5):
+                try:
+                    tap =3D subprocess.check_output(cmd).decode('utf-8').s=
trip()
+                except subprocess.CalledProcessError as e:
+                    logger.error('Setting up tap device failed:\n%s\nRun r=
unqemu-gen-tapdevs to manually create one.' % str(e))
+                    sys.exit(1)
+                lockfile =3D os.path.join(lockdir, tap)
+                self.taplock =3D lockfile + '.lock'
+                if self.acquire_taplock():
+                    self.cleantap =3D True
+                    logger.debug('Created tap: %s' % tap)
+                    break
+                else:
+                    tap =3D None
=20
         if not tap:
             logger.error("Failed to setup tap device. Run runqemu-gen-tapd=
evs to manually create.")
--=20
2.34.1


