Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CC4C7EE39
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 07:42:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.web10.8143.1751010103901817899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 00:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=fbnLl0xO;
 spf=pass (domain: prevas.dk, ip: 40.107.162.27, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/W/a+v+gxoaxkrFZliBZ3YC6jCrGa1rydjDYgM5e/CUebjHxKnRvRta/twB3V5IoqGkTgwPlltVmcegoCDYUU96FMeUEncD123/QvKZmcZ6qbKK+3hd9w9gTfqCyAUxS8/GmW/9qCC7XkJPbZ/zy+DOeZfTegPIpFWZrLX+4EV+37WvCRmX5iiZxWcwDvod40NOJGvnus1a643VvoPp4HQKhEahb+gbgei+dT1/G35NA5Wz1SoH/0KmjlAYQvBU9jAncx7VOdUkvoLS3iz+Ow+IAujTsmCgZpU24Y52bJtn4nZFJlDjl08g1Y2riu7Ygzk9MQvxYci5QB61pb5Wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx99yDz42VejVWf0PgfwQH33rlWgzEorpQGNtPylbNA=;
 b=jfxSHLJVnJJ6GldhdqaIy1jPIcw/+mgxR4v1Dn50HdU1tDIOvaf+U9Lo93BFjkCWbfS1TWodrmLmlHHFfGSlTZ9DWM1pE5pcIUjRW1qsDFurJHWblq/GEic+usuZvM/nuQLsCcHvMUQoD3j3x6ZWyNfpOoz3LmOOlDiWWvsfdNqry/ME1rEH1agkSXsfacd1xmkpHKVhvZV17JkDRL1qnjLbfuMD2wUD5gvYXt+FR5dekl6JQ6TRKY6It6IqsiUSnTuaNDZnW8mAz67acWBD5vsf7repAz6BuWwbtjAl8xJ/CXN1FTpll6lD6A2RfQSKpbxZs3OpNdPMKDWTk7AfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx99yDz42VejVWf0PgfwQH33rlWgzEorpQGNtPylbNA=;
 b=fbnLl0xOmS31TTb6Q3W2MIDPTyl3gKCUuWA0K1K/LszDGIG3Yxzjlmg+TUk+rHrsM4K90AKh0LPJ0HPMNEsu2PWSkPKUbZp5wu2nycAb3YnEm4QSvRDWkBVshRhwBejHsZ5xpAsBHW2f5ksxnZVpjaGlU0OaCADXrVRWDUkPxE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS8PR10MB7160.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:612::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 07:41:43 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%5]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 07:41:43 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Steve Sakoman <steve@sakoman.com>,
	Rasmus Villemoes <ravi@prevas.dk>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 2/3] oeqa/sstatetests: Fix NATIVELSBSTRING handling
Date: Fri, 27 Jun 2025 09:41:32 +0200
Message-ID: <20250627074133.2173819-2-ravi@prevas.dk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627074133.2173819-1-ravi@prevas.dk>
References: <20250627074133.2173819-1-ravi@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0118.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::8)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS8PR10MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 220fe596-7a7f-4153-a826-08ddb54e0f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?25HzyJvKugevks9Pe++ZBjOI5BGt7NHgWUfB3zresCJAsVpyGIn/u2ySvPaq?=
 =?us-ascii?Q?ZZrIsFmKmFM0ZnvSWIXj59a/dUOhCsIv/1EWPw5HOp+KVRfaEkrdyfODsS+t?=
 =?us-ascii?Q?CzhtVu6OYRQQB/jeXKN3Q1Tej7jOhSpHR+isJoF3nuk0Hjn5MiPUPsUmPTtW?=
 =?us-ascii?Q?Z83FmWaN4QCMXAwzoB11E8E1L7m2wD/pEBvebw+kos6cvIS7x11VwqfoKBrU?=
 =?us-ascii?Q?n1VmEKWJ207iUN643wXcUTdKe7NGX/dzds9IrfNgMgzFjZ576ok/0L/W6WQ6?=
 =?us-ascii?Q?VUmRMRfbNuSUwsmlICfKv2suC15zciN0mVE0Jx8KY2KQ174GXW8HLfTZhqEU?=
 =?us-ascii?Q?/BO/x88nUJkbmI8rqmc63/dGpJOYOCI24I38b1KB50BrlEI6v21FcXT+az/r?=
 =?us-ascii?Q?vDFCInnigl7WUX5uzkQdUifz3p5Kl3E2RiCznetSZFIwDSjlHgONCRC++orL?=
 =?us-ascii?Q?TboqQJJF1bzlJ7rue8qgcJi51zaHcwwLSJIxwPQJWEEmSLjA8lnekbkBiHCZ?=
 =?us-ascii?Q?MuXs9W82b1vYdKXkxwy5gdBuFmLLF5IPMx7Txr9oDWW4Dk6tWNDIMnM4rV9z?=
 =?us-ascii?Q?nOCBbD/Av+I7QW6zuZctbr9vtDocGNrGTvCiSaew4LPz8/Wa/sB9rJ3WDV55?=
 =?us-ascii?Q?PLDPEp9kl7TiklPi69r3Nhv0chSH/FyPVdOzdLQCW3LAIvM1xiLkKNt7TTin?=
 =?us-ascii?Q?VcxBiJkGctuo1KtlhRQEu1rGKhAn140g21+bpuAdMxhHuLGdbn9V1TuTtkRU?=
 =?us-ascii?Q?M1ChJSY4njvDmcXbJ0vi3CWWQaM6JOwH/ivwwZ55EZ738KuEBH+IqSJKg1Za?=
 =?us-ascii?Q?9sF3WuqqxcfT03mzaJrmnhzqWkesuN4uL7myKOg9Xxpwr8yeyaGwwtuCdBBV?=
 =?us-ascii?Q?UbgCzO5n7CGCLwnwfmjwkyCmiSdnMga4xSM5IDGL2uoe1ahBMt0SwSwotj2n?=
 =?us-ascii?Q?WqTh+KO0i0mT5Z381Erngp2VymgARhajyFRUcsZf4aQIITjfnLbyFL0tWqmJ?=
 =?us-ascii?Q?p9FMpexDR4N7iq/2t20hOBPCYLVPqMy6hr3hEkIwy6CdHZlqpV291gqkQHQD?=
 =?us-ascii?Q?0nlJF2gL17X8PYXHJ66jXhZypYHrmT8V296pGPnGckiNDas2HL2Ipo03cgiC?=
 =?us-ascii?Q?W1IVaj1BTn7/+W9fdudfjYv0GyOceK7no+1UOy1wofJZLcdszuHw9tEHjXIs?=
 =?us-ascii?Q?hWfI6mpDItHLYGMK3bC94q2rLC6Sg9POsWgmmF/D2BuBupn6714k2dpkxUQf?=
 =?us-ascii?Q?rawPvb1vOfs6gy0i3URFcQJOSkd9lYtbS53yfDI+8FmR7e8Jke1v1ea+uIF8?=
 =?us-ascii?Q?byvmcHuCiHTkAOt0BlwBpoe58dg1gTbvyWF7VqO4eq48rfcdBDd8P3TsoAe+?=
 =?us-ascii?Q?+BH8XrsaDQJpAWTimBIV2ad55XKWYs/wOzaww9vPr9uGQfKpDHed2lOOnB36?=
 =?us-ascii?Q?lIhjNOT2VPAT/6IW9DHbQz6gLHiWFpn+pAfdyG0KWMUWTVj5g6k+aA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tSIdjqcRuEyVfvAKqRAjGBPZIsgL0yBgSgWpwbXAUB7FsF0KLT66yZHiLbTb?=
 =?us-ascii?Q?Re1xYRW8KDKcjkJ7OWPuuPnw3sSripvFAd9mPXizwagQECZkV1ur6qhVjAP5?=
 =?us-ascii?Q?e53QPceyjqPsU7I6O6c9fblUGWe8u/jfXVr4ae0vlghHXiiTig/H25JHZPlZ?=
 =?us-ascii?Q?MB63Da7fPB9FHP+AF6kGtpx4xyURv03/1HYy2yfd01Wiqjn0IX9sJBb/7BWe?=
 =?us-ascii?Q?Nkl3D9caCHOKj1zuaztxXgC6GH1QCG1cLCSwsJ02CEY0KEJH5nfLgm9WAltR?=
 =?us-ascii?Q?EYMXsKGmWwN9/WHwaZe/fq7GkpBLEOrqd7Zogy5Bszgj9vFjkp02UcpvgqXn?=
 =?us-ascii?Q?0XsO7gUw2AlzJFyHwK1YbZE+qbNUh8erMpKGAxp0Nr6EQPuMqa88iBW0Jeg1?=
 =?us-ascii?Q?e91/CSrFsQ2KVPZPLghThm/bD0HA5bqr3/B7SrgXudZM4HFAvqLZAPu8sWDM?=
 =?us-ascii?Q?xNDet+GcH9YSz5pxKe+QB33LkW01jo7vkbUlNqu/3fKRxOCbLzYWHQt4fw0n?=
 =?us-ascii?Q?rRgMI6oLyV0jliRG4WWjuicuGC3RQ6gIhgNRtxHjARfp6qcjmIaTd9WMUpHN?=
 =?us-ascii?Q?yqdjeUvxvKrxv952KfGcKUrooXlWsA3kZJKeyuey2OZdLzF9jCn6saLsMah7?=
 =?us-ascii?Q?IXF+/+TZDhelIyPPGAoKGDkoPmGfj65Xm0IQOgf6LoxFyspTXI8V2H+I3tkc?=
 =?us-ascii?Q?WyeU6msI+sFjp2IWAV6f36ASfHcJpFQ6WcRHZjv/854oUdtcyMo0FM7lYCWk?=
 =?us-ascii?Q?3lrAH0PIa08giIuRLJZ/UUYcZ+d3RAd/ecKnAkVOOnRywTUOGzWsP+ts9xmp?=
 =?us-ascii?Q?euJSOguF1+T91tYuTrAfhlTh+j5MbyvrCEi+3VWN3bUXfwVaVbvQA9AVXz0A?=
 =?us-ascii?Q?TjW7Lq7hBAibapszVEze08xxBloyCzW8Iler2jtwQMDsLZkXgKGNb3mVizB7?=
 =?us-ascii?Q?yqcsp6bZZyhRd3ExAy0QBmiMs+sOwUcKpB9opiuxl03DpecyyaxXcqy8Fp/k?=
 =?us-ascii?Q?4QccAEyQM39ljOlMMBuvBpotTRzQwoIqio5hZrigjFsXxv2WroMuuOw1mqVs?=
 =?us-ascii?Q?GR6cykmX+o3X1r6s8sHSUq4gXj+m0cbPVj9/hI04IiQhOKJzvKtRl0URkl86?=
 =?us-ascii?Q?IlyLI+ONpOmyFCwPQnO7QjXsFGi86nevMvnz6TXI9BpJbS1lv+Vf0jTHU57N?=
 =?us-ascii?Q?f7yal+PN8ZinF3TESqZd3tPCVLkDaK2Vco8x0laioBu6XL/HWVovL20SxPFu?=
 =?us-ascii?Q?n7bzprFoRhjlBrTDKrq9dUYC/z2m0lPJewMuHJH+pt3mAZc0x9cyxqKTheVd?=
 =?us-ascii?Q?v3uKmeC+LPrVAa1imVojjDLHc48ZyJrlq4LBlAX16/fjNu2m+oQifv3hHgWS?=
 =?us-ascii?Q?tf58yM+DRDQzWRkvf2BzcBi9cFz3Ktdj42WejtYP24eXFz1J4Jk4n/KiGh8p?=
 =?us-ascii?Q?IwRBOSTt87ORReT+PgsXxCPRmPQnxwrQiPNYsdIlu/RCKU97X50GMlgJG1G8?=
 =?us-ascii?Q?T9XyLas9RtdTaz//8mVZy2F9j7EOqM+ZAH8SFYAUzrKcC8evK9fHAmMlvE8w?=
 =?us-ascii?Q?gG4g5+/JMhrWFCodktweNY6qm0+ormAx/Imhf/zSy7tc/SVdDC7Dq/zXwCHo?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 220fe596-7a7f-4153-a826-08ddb54e0f84
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:41:43.1156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZwwJmLVBW7cG30+3mMQTegD/swO8FBplFHbyOrandBbT8AMjmKxrIIDeLMfFyO31EaWHJDg2TCg7eG2TkBrwPa+UuaSAyHDvneoUfZ7mHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 07:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219388

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The NATIVELSBSTRING variable changes value once a BuildStarted event occurs=
 in a build
directory. This meant running some of the tests directly in a fresh build d=
irectory
would fail but they'd pass when run as a group of tests. This is clearly su=
boptimal.

Move the NATIVELSBSTRING handling to a location where the value is consiste=
nt
and a comment about the interesting behaviour of the variable so it hopeful=
ly doesn't
catch out others in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1c46fdb44fed18909d9ff4b43b4e445c5a22d33)
Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/se=
lftest/cases/sstatetests.py
index 487995acc3..7231115a6b 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -27,17 +27,15 @@ class SStateBase(OESelftestTestCase):
     def setUpLocal(self):
         super(SStateBase, self).setUpLocal()
         self.temp_sstate_location =3D None
-        needed_vars =3D ['SSTATE_DIR', 'NATIVELSBSTRING', 'TCLIBC', 'TUNE_=
ARCH',
+        needed_vars =3D ['SSTATE_DIR', 'TCLIBC', 'TUNE_ARCH',
                        'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
         bb_vars =3D get_bb_vars(needed_vars)
         self.sstate_path =3D bb_vars['SSTATE_DIR']
-        self.hostdistro =3D bb_vars['NATIVELSBSTRING']
         self.tclibc =3D bb_vars['TCLIBC']
         self.tune_arch =3D bb_vars['TUNE_ARCH']
         self.topdir =3D bb_vars['TOPDIR']
         self.target_vendor =3D bb_vars['TARGET_VENDOR']
         self.target_os =3D bb_vars['TARGET_OS']
-        self.distro_specific_sstate =3D os.path.join(self.sstate_path, sel=
f.hostdistro)
=20
     def track_for_cleanup(self, path):
         if not keep_temp_files:
@@ -52,10 +50,7 @@ class SStateBase(OESelftestTestCase):
             config_temp_sstate =3D "SSTATE_DIR =3D \"%s\"" % temp_sstate_p=
ath
             self.append_config(config_temp_sstate)
             self.track_for_cleanup(temp_sstate_path)
-        bb_vars =3D get_bb_vars(['SSTATE_DIR', 'NATIVELSBSTRING'])
-        self.sstate_path =3D bb_vars['SSTATE_DIR']
-        self.hostdistro =3D bb_vars['NATIVELSBSTRING']
-        self.distro_specific_sstate =3D os.path.join(self.sstate_path, sel=
f.hostdistro)
+        self.sstate_path =3D get_bb_var('SSTATE_DIR')
=20
         if add_local_mirrors:
             config_set_sstate_if_not_set =3D 'SSTATE_MIRRORS ?=3D ""'
@@ -65,8 +60,16 @@ class SStateBase(OESelftestTestCase):
                 config_sstate_mirror =3D "SSTATE_MIRRORS +=3D \"file://.* =
file:///%s/PATH\"" % local_mirror
                 self.append_config(config_sstate_mirror)
=20
+    def set_hostdistro(self):
+        # This needs to be read after a BuildStarted event in case it gets=
 changed by event
+        # handling in uninative.bbclass
+        self.hostdistro =3D get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate =3D os.path.join(self.sstate_path, sel=
f.hostdistro)
+
     # Returns a list containing sstate files
     def search_sstate(self, filename_regex, distro_specific=3DTrue, distro=
_nonspecific=3DTrue):
+        self.set_hostdistro()
+
         result =3D []
         for root, dirs, files in os.walk(self.sstate_path):
             if distro_specific and re.search(r"%s/%s/[a-z0-9]{2}/[a-z0-9]{=
2}$" % (self.sstate_path, self.hostdistro), root):
@@ -153,6 +156,8 @@ class SStateBase(OESelftestTestCase):
=20
         bitbake(['-ccleansstate'] + targets)
=20
+        self.set_hostdistro()
+
         bitbake(targets)
         results =3D self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.z=
st$' for s in targets])), distro_specific=3DFalse, distro_nonspecific=3DTru=
e)
         filtered_results =3D []
--=20
2.49.0


