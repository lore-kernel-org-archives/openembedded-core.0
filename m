Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F0FCD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 12:21:47 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.92.50.24])
 by mx.groups.io with SMTP id smtpd.web10.48580.1725452497404656693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 05:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=uBoPo9nu;
 spf=pass (domain: outlook.com, ip: 40.92.50.24, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vU3ftXNovvoYJjKGViF3vtOgA1jb/rTpLlyNvGlaua4L7Y3vSBYgVN7PsCccDDS+IMv2UrPFZedd6XkBhZno4K62ww0KuR872H27LzBEHCW2/duACMhZWZhESvi3OQ8/zn9c363eyiMLmuWtKc/lbA9/mkhB6bBxkKaCL5cilaOA0AXPvaIL/QL6iK0Y/1Ez9mlqjBRlMtJw6O1hxiOBY7sZuMPcS0Jt8IdvOvwwhTrnC0EXHOtCvdTiqAdlb9dO/z9BSRn6rTu64RfAEYOnfdlluoF5GWmD0Ts+FlIaFLwVjVdc0X/GbCvCS4kHBXqGmYStN5PR3KlkQjQtgfWdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SeKQ4CAzwRTRq5xR1qbbcEw1/aK9sHKXnAHHNLJo+s=;
 b=Fmf/2rmZItoxKAm86lbdnM6kWuE29bTG0iVU732gDM0te7QF1P3ECKQJlh8Opf/hK+FVDmr0sFDEfauDYMqXsiYWE88f3b+iq9v6V00H6ASKHAkE2SirJxe9AWaXbGC6JDr1q/EJlH435OhjzdTfagWwC/1NVHVi5Ygu+SxzYWioYNYowCv5Cl2TorrvjYlSi/h8geIl6YzyXT94mei5C3Ux8kk1DERAQ81qdrgxYGXJSgtwg++ShXNBYD3jHeiy1ibB9sRDizhHNdDd2+s1hqtC6ylFIPV3hXghiOLlU9hMt3Yoi9ZUen+iEG2Vcd6JMI5S8MwfokRbAbPlPtF4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SeKQ4CAzwRTRq5xR1qbbcEw1/aK9sHKXnAHHNLJo+s=;
 b=uBoPo9nuL8YxSol9sxp1cLLc1OSXLsaEiJb+QRrkRYZNRUj7sm3cVjVAddTvn756BaLIpHXcZU6bD10ye7WU+Fp4fBkNecz8MSRxUMcjojBtMsoSzRcj/yCQddr7JejRfAY+q6r8kChn7B0mT+Oow3qNGPdK1msGEwFbBI27ScmV87kGxNa+m50mSXW6LKQL8NOuI9+LFvBQSlzGju6ERYOhmZp5NmVYP/0hy2ECwE1UxwP/x2/PZvCPGvLgZrCbuAubR19ILv4mZWYu5lEFh2Be1TIYaljSKK40cvDlr6tk5RTIjbdHe9tMv2UMROvKI6hllEyzV9Tbjut8t+8hpg==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by PAXPR07MB7917.eurprd07.prod.outlook.com (2603:10a6:102:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 12:21:34 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:21:34 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] runqemu: lock tap creation process
Date: Wed,  4 Sep 2024 12:21:08 +0000
Message-ID: <GV1PR07MB91203A774F08D3110C579514A89C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [nGa+QjgDXzZnIhSb+YV5DhHwjgjAUkTvF3RHJdXVcfun5cGfxzNsSooEsNqI6IR2]
X-ClientProxiedBy: BE1P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::10) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240904122108.194510-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|PAXPR07MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3847ed-6358-4042-7680-08dcccdc1d6b
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|19110799003|461199028|8060799006|15080799006|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	HxDfpPXXlnkcKFnieIJXKvbkTM6rBAKF0vdzGxuGxhVbyy3DK4xjfwMtgy2b/xhva4WSiEoV6x5rDM8MX9ct3iBwA23qzgr+OoAs3xVihD8kZvnU8v+I7G2r1lgUMWT0iB3L538zGfqq4AJVaWZlBVJp9xBmPcyrBJ83+yGcYTa9noJNeu5YfYl5wDkjNhdBZ7sLezTMox4rdSCm/gelAxraTk9Aop40Wg4718kOFZRbeHiQrvBoeWrVBTqtnwCDfV9qllNYGahIsB8P8dST0p8hFyi0GaQHxvf+D/NmMW36u+0FyslXw66AgR3UHU4MLGKwSffyrm+NuANXMNoxY+2HxtBM1LfZRsuPjxZcWORgQHSy9msO2wS7fK/tvmkelF9aAyMLa7ODxMQlDBx74jYJCydXpeuTB+LxeJBlTS6NEUi1qW32fZtQKDf1iDLpdmG/n71cSWFhb8IxkeIAMR6pJKaiU0aASocmMyWqobAX0VcrLhRNCgmO2L5IJB98b57xvCgDJC4MKVKI2ADUWGLJQROkebdXZDaYLXvHuMj9mw50ng8xQJGb8VOy9YqIO4b1SOAa9A2ALpw1A7AmcJRs8si0FQF0QM7SpXqLKct5oamXuix6GR5gbsnHXtagtLDApwAkbrIaCvr2rS1/3tvuHRO7Ey5aP7HhGNNNNTKdMqNx5ll8zn78lXUObFhMe98HUczX/8GzqsLdjvxIEk2Y8qHek1/DcRlkx/5Eqd0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ap7HYgNF8pBu1WJROqRfbnfVUBfQeC/TN17/5jcLia5V1Qp/ZFZAENCKMak0?=
 =?us-ascii?Q?ujpFTOUlFIRGXZVs+071e0SF6mGGHP/tSZti8k2m2N+/orXtW/z52TnGdU6o?=
 =?us-ascii?Q?oj2lmF9Oy5ukWi2upMT6H9iSyP+qIOCySTVPL25z85CnkNj8s9CuHb0YSlwi?=
 =?us-ascii?Q?g60NMQX16WQWL3EE6xMkKo5bC2dMqPQ5eb/wvd0biBq5G1SYhc2bZy4idgmG?=
 =?us-ascii?Q?blwIcYhPOW9DY7qSl6EX/IMLRHo5Mp4LsizUoqaNkPGNRnPnFRZYN0wpq82R?=
 =?us-ascii?Q?Y8Z2qBBIi7ezJY7oyvoS/zC01ArVwYDT0ZxsTZ2KfrF7nYKZvnM3twKqDM8U?=
 =?us-ascii?Q?eF83rsdLfRq70zETTGqlMjHR6S3ddRt3v9Hq/I2yD/jAhHQFOJ4iNU9hX7wI?=
 =?us-ascii?Q?iVDNpaPpBuI9IFCw2usHrDiz12FIFiRYvZNlr33LDWEdgKUm7z0N2FR42RH5?=
 =?us-ascii?Q?m/on5Tt6doyRPAIijqKs+RIadFMyMSabidQNgRnbv6W6y+wfzkd3kJgzZT7r?=
 =?us-ascii?Q?P8FBEAYuQOZXhhyLy2BjYGLpYh5OMsbMqD9bmS2KXQsGuEOFHM0oqVX+25gN?=
 =?us-ascii?Q?pstH51sOcD5zw0u3NYlzpScVjsxTbWRAg/OtBkIJJgfQPl1qEQZ2dJUpTCWf?=
 =?us-ascii?Q?LP2U5HENmzbgFiAIYzatexwkwOb/LqUozjYc/TgsMco6ld/T/4+30ScyjNy8?=
 =?us-ascii?Q?JINXmqOKwuT/LGUeZEeGnFd2oqCR2OE9No+OmAOcGtrhSAAdOKIxY853ibEg?=
 =?us-ascii?Q?E15jsb4+PfH+CyNt5ydH5SUKSVhZtMjbU/kuvrKatb0A+X4EB9l0VQ1+2mmk?=
 =?us-ascii?Q?aplebeoAT4RLq/xv7FP4cAvVAg397TErnyFCuWXkc3ptWvA7RQT7gveVcxuB?=
 =?us-ascii?Q?Ta6L0Q5cHsfzt4nRsZ+khUKvwYiTMOkNB23LghPKW4n0x4fDDR6fxlXX0whT?=
 =?us-ascii?Q?ubCtfXXmNQT/kgUUKEuLtw1jFtWcW0/9fABH6AuHMosJbGd4B/I8gg4SOpeR?=
 =?us-ascii?Q?oTEom2O2qNPcZfBcZ7ddgLSZ2PaLYvEIyWu0HQcP4jRn53OM2x9gLOVCRirG?=
 =?us-ascii?Q?kuybE0z70LWMtHTnweLUQIOy+Mhdot+l4pOu17TY3v6q49WlzMpEpmOSlPGS?=
 =?us-ascii?Q?sNMwLAKORzcLNcj1R8gQsK9TzqXC2jFnpYHI40ZXjT//XwgfNCBa3Oushrvv?=
 =?us-ascii?Q?VeP/2T1UF0tdNSGH9PPzPAKm1LYAoIrjYRGnqvUwg6xxxnJ/TbQ+jtqas1g9?=
 =?us-ascii?Q?xMJv5UsDeqzcb6d0Y9sTEEsgibo+2DQQxE07a8bOCJ0y4YSiVnuobl+qeg/W?=
 =?us-ascii?Q?0aE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3847ed-6358-4042-7680-08dcccdc1d6b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:21:34.0447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204202

in case of running two or more runqemu instances in parallel
with no previously setup tap devices, the following happens:

instance A probes for tap devices, but doesn't find
any, proceeds to generating tap devices with the sudo call,
resulting in tap0.
instance B starts to probes, finds tap0.
Both will lock tap0.

tap0 will be then forwarded to qemu.
Instance A reporting

"Using preconfigured tap device tap0"

but then failing with

qemu-system... could not configure /dev/net/tun (tap0): Device or resource =
busy

To fix that, lock the entire tap creation process with
an exclusive file (blocking) lock, so only a single instance can
perform the non-atomic changes.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 scripts/runqemu | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2817acb19f..e5db06be37 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1163,6 +1163,9 @@ to your build configuration.
=20
         self.make_lock_dir(lockdir)
=20
+        tap_setup_lock =3D open(os.path.join(lockdir, '_tap_creation_lock'=
), 'w')
+        fcntl.flock(tap_setup_lock, fcntl.LOCK_EX)
+
         cmd =3D (ip, 'link')
         logger.debug('Running %s...' % str(cmd))
         ip_link =3D subprocess.check_output(cmd).decode('utf-8')
@@ -1187,6 +1190,8 @@ to your build configuration.
=20
         if not tap:
             if os.path.exists(nosudo_flag):
+                fcntl.flock(tap_setup_lock, fcntl.LOCK_UN)
+                tap_setup_lock.close()
                 logger.error("Error: There are no available tap devices to=
 use for networking,")
                 logger.error("and I see %s exists, so I am not going to tr=
y creating" % nosudo_flag)
                 raise RunQemuError("a new one with sudo.")
@@ -1198,6 +1203,8 @@ to your build configuration.
             try:
                 tap =3D subprocess.check_output(cmd).decode('utf-8').strip=
()
             except subprocess.CalledProcessError as e:
+                fcntl.flock(tap_setup_lock, fcntl.LOCK_UN)
+                tap_setup_lock.close()
                 logger.error('Setting up tap device failed:\n%s\nRun runqe=
mu-gen-tapdevs to manually create one.' % str(e))
                 sys.exit(1)
             lockfile =3D os.path.join(lockdir, tap)
@@ -1206,6 +1213,9 @@ to your build configuration.
             self.cleantap =3D True
             logger.debug('Created tap: %s' % tap)
=20
+        fcntl.flock(tap_setup_lock, fcntl.LOCK_UN)
+        tap_setup_lock.close()
+
         if not tap:
             logger.error("Failed to setup tap device. Run runqemu-gen-tapd=
evs to manually create.")
             sys.exit(1)
--=20
2.34.1


