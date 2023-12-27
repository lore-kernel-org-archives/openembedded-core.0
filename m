Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161CDC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 12:20:01 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.71])
 by mx.groups.io with SMTP id smtpd.web11.100135.1703679597135893670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 04:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=sGuPulsG;
 spf=pass (domain: navimatix.de, ip: 40.107.15.71, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luCQc4s8HzEzQUM4gsungKHCw/G30a1yl51Qjqhjh0TTS0tZmjIgW7B4huWRmX+BHD9EMJgvOcwoPdUOYXpCE0gwkyOa7UbfWG7GkYH0KF3lYRnbgncwTeIGqtHSGW/+smkPP7UxCkRtZ429slqm/fx71iCiyiXhkpQMR4aNKzXgxjxaM2mTLlUL0lSbwrmZULsvSfgOLDukyPvZd0tOO8iCVBZNL9cySJk7sy2w/hWVoVeQCbzRAifKs+p8Bv808y6x+0H6Ybg36m1KaENe3Kh3P/lYfzgp40jOSycXMayCg4q5bwoLDPFiVX/w2Da5wIkOwGBbqhNCN7yaYkuHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TegPc7QTlra06L5JW0vbfQ1ezcXLAoVoUTWzQD7uYo4=;
 b=SKLAlu3AWLFpzwcL+SWRyaT99W5Qw1qFQux5EjmzrY/RTaXwKP+y0TVmjeHzhQb8AKOFvEDtIA7GblfspaaP8+2PDJi1cXamCn6XoKhdhu4arSF6pQ36Xz+n/pJf/mU1fyg4Eq6qywMUiH4u9OZEJZ5rheq6hbCi8LQ981J+WEuoRazPRcITzE67Dyx+oIvQhXOWhiiTr280lRq+F7rzOVFf/zA77AapjtQ+/rMj7jVtPs3p5lSCOvUl+bQFtD/Qy8NX0mXQXdhrvCPNWdWoqdo7M0z54CDzv+OKEdp9Ann46Aybya3eoUQzX8/py1Cg0sWGBQBErMBW1gycCI9I4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TegPc7QTlra06L5JW0vbfQ1ezcXLAoVoUTWzQD7uYo4=;
 b=sGuPulsGI19ShcZesdRqSpvgVFikOQXaQWlr5vJ+Ry/5IgDOx8Hi9ETo/2ZRzWSdh7/tnh8LjDH/p7uEjEeZnnDTLbJPCkSRF8JQeTL13AUUaECjSBQ2pnRfCaqKU9eOQ7RUT9ByFOd5NQIWEFCUktmyqkHV60d3CqUg0nA3U40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by PR3PR01MB6617.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:63::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 12:19:53 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%4]) with mapi id 15.20.7135.019; Wed, 27 Dec 2023
 12:19:53 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] i2cdev: New recipe with i2c tools
Date: Wed, 27 Dec 2023 13:19:36 +0100
Message-ID: <80fad6f6fdc85ee3b2ad7ab81f1f4c574c42b53c.1703679576.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::6) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|PR3PR01MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 703bf01a-5395-4e4e-484d-08dc06d62179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aXgdjJVY1sV+46zfXn5ZPBrF1V3gYmEeUFiSvtSvK9A7+iWbdKhyKrxSnAEWLY2ppOXzaAFsY4OHjEymHC2KSRfpEZ8AILNhgyftq+IheNqjOohw2vHmDvkxmUlllZigbD9wBp+VETZZ4CR4PsHdLeOPEq7ClLeJCdAwUj2ziwZMeDtgM0kyumHf3lybLUKtmYRYdjB8Rcvr2Mo0NQtSbjkEifPRI+CthMdjH5E0kTHoCV8x8aS5vKNr3+rXbjgkSfTORcqSw8pF5aGqREi6Hr40O1tYXk1XKomSdB71+LFNa2bdynB8zeQFJVuNR6jaZ+VXSX3yJhNZ48ZPdXb5dxbWm1bQZdYRa5T8zT5YT2Jqcwy/tSidvU5+rAAAgdCEAQoTXdYIWzB43cRaD0dq8TVgKwf0vdydUCrrZ4BvuV/7tHUlmC8pyvZ3sEdiPoq6IxZbN0VkXvi0fJ7wkPcyWJG8jYUmWAXWQ/2MCni1X/8IDNvdAp8GUnVltmwuau8ePsHzfjd7GP10XuGeo30NrJextrMGkAfqH8JWhANtagMzJ2BrwrBtyQD+fhWoA4cwujo84sruudFIzg+La6MbMLwFwrIUM0W3m3f/6xH/XN0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(376002)(366004)(136003)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(36756003)(38350700005)(5660300002)(2906002)(6666004)(26005)(2616005)(6512007)(9686003)(107886003)(52116002)(6506007)(83380400001)(6486002)(966005)(66574015)(478600001)(86362001)(8936002)(38100700002)(8676002)(4326008)(316002)(6916009)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K6pEjz4ccT3i4w50JUTZItBgV5YylaHS2rFNN6A9eAwhqOOn9+H/0wjBNa7/?=
 =?us-ascii?Q?huDZ/OE4OB2c66Q3YWl75I7wWahLhY2+tuni8OTood42d/2tK+1/SJ5hUALY?=
 =?us-ascii?Q?eWoXi3RvjVElTqU4oAGxTIiH2Cjyzp7Qs/emHSTjc5sCuwf9MNra7okL+dzc?=
 =?us-ascii?Q?5j9LUntRCAs9vjIET+n6hZmr0pBEKj23gGU5ru/KZOdFpu7HPA84sCC26gC0?=
 =?us-ascii?Q?ZOGBdLM+U/kZuvkUZJa214DA7uKcIMWI5Dv2ZInZJEpocxz/CT2zqimOObZk?=
 =?us-ascii?Q?HP473LVM8voyg3ie1cMLQKu0ZEy4SqsNMUZWBnaeP46oKm69N+DPDc8JgyKb?=
 =?us-ascii?Q?HacErfYbIf/jS3vW++3a8Yq5MfmZuXSy2NCPe+TsqXeBy1FVZJyOvLoLyHbb?=
 =?us-ascii?Q?yN+36HChtMQ2X9SRb1XxDBE2LdrP1/kHBu4yLvA5kIBtx6quy4OoUkpgz80c?=
 =?us-ascii?Q?fOldU7VU78MoM3a0v59rMe+dQP0zhRHrx0b62rqBUPutYY9YR9JRGf8E5eXS?=
 =?us-ascii?Q?dLhGKIWkfegRxcS3DRlGOg13VxLRi2YvPf7U5GRieej6+PoNI9YivIy1bjw+?=
 =?us-ascii?Q?wLCm7blTSqrshPQGs7P0j66I+8GHexhHsdXlG6vdy85j4qsWLhax3VXJWtTp?=
 =?us-ascii?Q?UtuKN5k9cOXoYRAs+xas/7pecoBtNZd25xrc3K9quX5uh5wauhH4H1/auJD2?=
 =?us-ascii?Q?OEEu91kEmy2rzabOaHYQGzSXmRq592P67iyOD13cT0LruanGWASGj61ub/GR?=
 =?us-ascii?Q?M7MkD2hDiXID+c2Eb/I7bn2QiZ6YMW3yaCbXjQujFe6yp6VmQizGyit7ij5Q?=
 =?us-ascii?Q?9/WqgnThOeoguAh/bXkHb0Kjsrn+hqUWDb1G4SEU/7/zXNwx/XDApALd5xy8?=
 =?us-ascii?Q?zsYm7eAo2TVBYcEnch5UXP1fajnawQBWILEE3ixsBkMhKhRD0r9sk0obxwyd?=
 =?us-ascii?Q?NKxJ4vv8xJ18Z8nmrQ8aZuCwuGs8iv76gL7K+9xgXklF7jZmk5EibasG/u1P?=
 =?us-ascii?Q?29OOzfzeWIayMiAcvseQQLyw+B5Bl34iR+C5KLP5t3dVuK2shAdbQ0ctH/sm?=
 =?us-ascii?Q?L29D8WQjakL/y/EbWzHQZXeevAdIEerjjCSIHvTfeLgrVELac5INWANBL2Sm?=
 =?us-ascii?Q?BKfSQqUexzpsXEWD4dh9Or8TAzZfWggR0aZ3QYwbdEkCxRIOH1BGJfEmurwA?=
 =?us-ascii?Q?lPgt3TZp2OBYc2lAruE1v2HR72Ba/Ak2PcVHVHm8dGNa4qgaM0ctX1rzDB8W?=
 =?us-ascii?Q?GAaKUYge2beeLlCdwIi3T5KvmchLmY/IyGxPGRwjfTw5SPPhHZV7Sh+dCFNh?=
 =?us-ascii?Q?i3SYzmmgTRCiqlZgY88UC4jWEMA7CLw5UnLoxCAzSxKeYkaT7Kxsr72EveqI?=
 =?us-ascii?Q?pVattRLb2icA+bqTHNkYAs4rAlgo5PEgVdFxfvfI2hV+0pI5UvxZ1Ervy8aj?=
 =?us-ascii?Q?Umwu6awkRQ3X6vuki+I9aTRKUKnVjuZww+kFJprgzP6IMYzaHqGHVsavyNL4?=
 =?us-ascii?Q?L981DrSmFNtkndlcjm/445SZMsEydLq9CvSdr/fbFWfUO0QUFBmZm12yz2h0?=
 =?us-ascii?Q?AWTnE+KkyMxBRFAxdjf8sEEYdqD5Jc7GlY9BIMU2UHOe0LTSUfZ8Lt2itezv?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 703bf01a-5395-4e4e-484d-08dc06d62179
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 12:19:53.5739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRjpbq6LaViFvJN5GEAb/Q2vAIFYTTmhnUyLH573QTWD/lkW9W5K+yOQsFD8mE/KizpmhuiVDEGIQIKl1jc4A+3pWTRZhJ5MRmBQdP/F8Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192939

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The main part is the tool lsi2c to scan the i2c bus, like lspci and lsusb
do.

This recipe also ships a static library *libi2cdev.a*. Because this library
contains the file *smbus.c* which is *GPL=C2=A0v2+,* and a static library c=
an't
be linked dynamically to satisfy the LGPL, the whole recipe is marked
as *GPL-2.0-or-later.*

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../i2cdev/i2cdev/fix-lsi2c-makefile.patch    | 28 +++++++++++++++++++
 meta/recipes-bsp/i2cdev/i2cdev_git.bb         | 26 +++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
 create mode 100644 meta/recipes-bsp/i2cdev/i2cdev_git.bb

diff --git a/meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch b/meta=
/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
new file mode 100644
index 0000000000..4df7527205
--- /dev/null
+++ b/meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
@@ -0,0 +1,28 @@
+From 57c09727220e00ab961325a2c85f5611bd1770d6 Mon Sep 17 00:00:00 2001
+Message-Id: <57c09727220e00ab961325a2c85f5611bd1770d6.1701984646.git.joerg=
.sommer@navimatix.de>
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
+Date: Thu, 7 Dec 2023 22:29:40 +0100
+Subject: [PATCH] lsi2c/Makefile: Use builddir to refer to libi2cdev.a
+
+Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
+Upstream-Status: Submitted https://github.com/costad2/i2cdev/pull/2/commit=
s/43f15e97d869797dbfeaacafa13216aaaf353426
+---
+ lsi2c/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lsi2c/Makefile.am b/lsi2c/Makefile.am
+index 6defc1f..0d81d01 100644
+--- a/lsi2c/Makefile.am
++++ b/lsi2c/Makefile.am
+@@ -14,7 +14,7 @@ bin_PROGRAMS=3Dlsi2c
+ lsi2c_SOURCES =3D lsi2c.c
+=20
+ # Linker options for lsi2c
+-lsi2c_LDADD =3D $(top_srcdir)/libi2cdev/libi2cdev.a
++lsi2c_LDADD =3D $(top_builddir)/libi2cdev/libi2cdev.a
+=20
+ # Compiler options for lsi2c
+ lsi2c_CFLAGS =3D -I$(top_srcdir)/include -std=3Dc99 -fPIC
+--=20
+2.34.1
+
diff --git a/meta/recipes-bsp/i2cdev/i2cdev_git.bb b/meta/recipes-bsp/i2cde=
v/i2cdev_git.bb
new file mode 100644
index 0000000000..b1f8a7f805
--- /dev/null
+++ b/meta/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "i2c dev tools for Linux"
+DESCRIPTION =3D "\
+    This package contains an I2C dev library and the i2c bus scanning \
+    utility lsi2c. \
+"
+AUTHOR =3D "Danielle Costantino"
+HOMEPAGE =3D "https://github.com/costad2/i2cdev"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "\
+    file://COPYING;md5=3D768997ba510a952bef1775c50bc22b00 \
+    file://include/libi2cdev.h;beginline=3D12;endline=3D25;md5=3D72486a5e1=
92d6ac5c7e55a4a95e380a6 \
+    file://libi2cdev/smbus.c;beginline=3D9;endline=3D22;md5=3Dd9a0de5a611b=
960fa75912ded6c60096 \
+    file://lsi2c/lsi2c.c;beginline=3D11;endline=3D24;md5=3D72486a5e192d6ac=
5c7e55a4a95e380a6 \
+"
+
+PR =3D "git${SRCPV}"
+
+SRC_URI =3D "\
+    git://github.com/costad2/i2cdev.git;protocol=3Dhttps;branch=3Dmaster \
+    file://fix-lsi2c-makefile.patch \
+"
+SRCREV =3D "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools
--=20
2.34.1


