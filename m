Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FF6CF9C69
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 10:05:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.62])
 by mx.groups.io with SMTP id smtpd.web10.6831.1726913145121235100
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Sep 2024 03:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=U/7u07Tr;
 spf=pass (domain: outlook.com, ip: 40.92.89.62, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUB1Fy/0k4PwWwNx7u3Cll3hdm0cZnWOJkDlb1P/VRFlPxXLdBLshZr/i1k56QjsB2CkBJnko17cAqUKagkIfViZvDtvzh5xmkzs6uVoXtw4gzwPYgUvntmb0tRcozHVdTKAxj4lrtL+PCMTIwOv2RU11NK9/EZhumAe11GNV5xNnZtLyXFLmzyUCNpsqhdZPtgaJtcP2hu+6logbLOxbX9PcAzcW7g0T4gpXEPvXZvUD2Zk3WvPpDYv9XSUFeZunNLTGycEA/2kzNvcHRIGBn2DFtq2Z+hh4YYrZxxM6zsCKi8hTAynjM8PTYYn97v/YSfBmk9hTLq1nm69LW7c7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89bn7diFaR5blaw3V3+KcXDmOtWb8w9IrN3H8im5Hzg=;
 b=NWdWJtHOVfZrMXGp6HNDj5GP14oGW34QvO3skd9KHZTfCzAozvm//OxvtQf3CFn9E2EbxtMRl90YnOv2OA7ShtZi/pPV4LqMof6+Z+KbI8uJZ8S8v3/+pI52qokoQe/nteZh0+wdsXW4w+O6xOsHhcEWu30kMnCYKKrDRiC6eGkTL3/GgpaMAg3+aTvnIPeKOTxUxJrjyFeWzNSqZxiOvY7r7Pha3AvgQOdqkbRtUafjGDIBF2i2BvfT2Z/28Z5sq3tpH8quC5XeFNa/KR7E5lVcasNcfgojlVlw4LN+iBYNw9U/D3N0iuZ6JszasZblZwLHnkv2Co3ivNn6x6nS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89bn7diFaR5blaw3V3+KcXDmOtWb8w9IrN3H8im5Hzg=;
 b=U/7u07Tr4VuSoa7tx0CvEAi49mjTsCU6CDqWIpe6IQ2HnM2T7nV6BHAMwLKeGth/M6J+3fL7AOa0xzWeIpD3tTZ0hTzWXfsUixDhkQ5ObwC4J4rJlPjtkLw6vdinkkSFPK83Z2X9nYuteHJDJK7xMmFSi2Ca0QpJYzY6L+Ha1PoQjOoy7oZ/7kFFmnpwVOM4pL3ZBkLfQXe30FKsNEXoBoelyEN2wsqEVSlK49H0UJkqQbtgPqWNThk45s1QzmZjiBJXbyIFngiEPx2mAB1iwP20d/NeY1q0OxsrENQXxRZQudoa7kQ2LJIdCSomLUwt3jK7hwsGKR2v2l614ZBgOQ==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AM7PR07MB6246.eurprd07.prod.outlook.com (2603:10a6:20b:139::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Sat, 21 Sep
 2024 10:05:36 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%6]) with mapi id 15.20.7982.022; Sat, 21 Sep 2024
 10:05:36 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/3] runqemu: keep generating tap devices
Date: Sat, 21 Sep 2024 10:04:42 +0000
Message-ID: <GV1PR07MB9120BFC16B64D016F50C1CF1A86D2@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240921100444.377583-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AM7PR07MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e9c9d6-d301-4014-2a24-08dcda24f018
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|5062599005|5072599009|8060799006|7092599003|19110799003|15080799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	JM3W7R24wEzcNLEzvOjaCw8ICUmSBYSLFetdQZu7NwrK7UzAmS5dfgCjnb75ep46qX4Ld49n9Cz1NxGyj6jTcxnxTxJHQe2pxk6OAgJ5BIExzOonWjDxDWwfj/CoHzwGfvo13aWr7HN1QgoiDh4P5/MUXzlHMiwEVnoj5mhQl0gNJ5A8Ozo6mKneo2sMOfU/dMTP5YRRsOy+/17Mmd/af1+8YQK+vyHE9O4nExXG2biBD5S7LdH9xm1Uy+mMtAhzadfQkHZVogTYwKs5X4jgA/HZGOkHruLU1f2otOkR6cA57geXF7ZSy4/EeFHNnpRnU10PwMHeM0dumzLgnvppJ0ZW+3Gwg7WSYWa/5ADPDaRPlS+yJsyhqbCfbmZfJu91szuPVcbkbuJAO7rmxnT50imh/b0gzaesbmrzdKHsULl3n3iVnteC1w5pKfT5yXsoLukemoyjj1yr/8O6m5+64RvobhJyRLOQoApg1TP4owfHV+GDmlDRs5fWBdXYnt7yYVqveuw66Kf7Rf9GqgHr3wzh8IuflcdbHJuJz0fKCFq0emc/wtuM5x/Q5fcT7PF1Jn0E0y3Xi+WBa74mvlvZMTf3tLzB9UJkPskd2xeS5IQiWZmtwEAzDRk2cHJdVlf+0DJ4gBDTKJQVPTHXuNCsxwPIDK81Gxat2dWJLvbTLQ3kqAI5RrBkS1mnqNjgxvv1EEyKo4uinv9pOXDLfRKJTbTYT4eeVFkJBvYigN4tSPXm2ZdjF7rGwVg7T58ZkQ1Yk2Y1WmWGdRP+NGrns8Lqvrtl6xyZpeiwHSVaksjh1vU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HN6ZI5IgF+iSsAEg+0gSNvNy0J0A6H/rFfOFN4ivAPg+BGyNVpiBPpp0AwqR?=
 =?us-ascii?Q?bXDDvFhdayS13EnY2RvtdMzJxuQyLOXzUVoYhYBfQaHTsMZ8gReLTRoMUx8K?=
 =?us-ascii?Q?+m2MWIq7fw79ZM1ZC83vYP+JR4vsYDzE9VnFpwj2oIm4rAAoCdt1nNv0EuMg?=
 =?us-ascii?Q?0AaQI82s5ildDr5MLUbuxFrZ3GDSowDTfgu7lqxBKd/EvG9oiQfXB9RexZGY?=
 =?us-ascii?Q?b94OI9AbV5jUOFsD2jTmYJHQz9tM9O/+qhWuaJnPCqkgkGBPb+L+P2uYZubp?=
 =?us-ascii?Q?kD11V+N0UDB/Zfg7AEC/P4tfuzuOEJV8r24nbLp6UlW9EHxcJvKDzzMcC34C?=
 =?us-ascii?Q?/xf8SdsMwcf4ry3xk9WN2bXeunymVriCgCb6UF8jcpNr1jubcU0Ai6SmTKWJ?=
 =?us-ascii?Q?r/+06q/lHXP9iCQAzdNPPrCt0f6YsXc4NZuQed2Ltwq4Ea27NvVFwCw/tCol?=
 =?us-ascii?Q?OAHBVVL2Bx1WRe2UeYaWkf4nsDbdpDf0MfJ6opp+cFu85n+FgXUT3oSlqRHc?=
 =?us-ascii?Q?NX6ARfk10Kr3wavjpGkvuTYMtG6r31iEynHH4W3/+OioOmGaWUQAXlxsL5SX?=
 =?us-ascii?Q?UYr9BW2twUceLyrj9WfcZioSZZUzC8iKVyzryyAwOvIwYc42zxohhwpkEFm7?=
 =?us-ascii?Q?itCtEq2Alv7HAWFT8iluQsVo5UJ5aM3s50iTwdzmICkSGi3tMdm+2WoCmK98?=
 =?us-ascii?Q?UQdGG3lQLg0IiOwFW+PIL7ggPQHYwauApILwfV/aMbvtTuxEjYOF0YzWvJRU?=
 =?us-ascii?Q?PPELdTHrQLb5W1G4E1TIf/K6wE/2unke3xreEltJR5NzozpVXtvwlw6aMjqM?=
 =?us-ascii?Q?Us6j4gKCvPjVSGLoE8W3Ft8DBJ55HrfRQvDbEyj1ewjQ7TR/MVWDM+EF9BLn?=
 =?us-ascii?Q?W8betcJS3E5GBeq10y5XhmyfzQtILt6A/KxqlsCI112veMkk3TJ0DdC7tG74?=
 =?us-ascii?Q?QfnSQdbMb1lKwwbT3Z1nK63AabrseOKM/G/SCiMbD10QGN1jUgAGROvDD14W?=
 =?us-ascii?Q?ngMfGbJB7sXyV2/q5+2Z5M4/oM108sg6s/JozjP8wyLWtigwO6quEw4cNo+p?=
 =?us-ascii?Q?2eO8PtiIFkHiMBOKYQliRPqxrNKw2kqXLwRDJKpYkh+LrxoVYPZytxGozA97?=
 =?us-ascii?Q?zO5kp2mngj0laXYvT49uSrJzRgqOZpirtiGPEFJD4QHqJEl2CA+cKjy8npuM?=
 =?us-ascii?Q?/gSG5rBxpEBEutF7fw0Ne5vKLtRPoTvuEFx+FCkOg25Bl5gaB351r7atSW3K?=
 =?us-ascii?Q?iogX6rtwMfzuGT5jSbYlLgZ8kvy9AGzux0rnAmSvEX78Uro7ePMwv/aGgOgj?=
 =?us-ascii?Q?MXM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e9c9d6-d301-4014-2a24-08dcda24f018
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2024 10:05:36.3301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 10:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204765

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

(From OE-Core rev: 23876576d054ebbab9b02c0012782aa56feda123)

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ba7c1b2461..8a417a7c24 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1150,16 +1150,20 @@ to your build configuration.
             uid =3D os.getuid()
             logger.info("Setting up tap interface under sudo")
             cmd =3D ('sudo', self.qemuifup, str(uid), str(gid), self.bindi=
r_native)
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


