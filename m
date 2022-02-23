Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D90C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 16:17:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web08.9681.1645633063244554705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 08:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=RZ5ESu6N;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.73,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1MpHJXprtXk0Ixdf7t3j5/YAcckCx/2yT0/lCAgAFeNTC5Cp1vbgtXUv9nwFFCXWJJ+9USYVW1LvAAgdP9hkaUWGMOnsKQsY/clcce2hmpCCbl1p7QK5NA9cBpFTKZ//qBkoYTfek1oz9JerhqE5YncP8OxOpSxrxyawS7pjWJ2Ol2tB88fnoMbKfdYqEpc3DJCc6bbfxVGbUfNMZexxr/qhP7ldqiBD0mpU9HE/LoR2grxtua1CaMWPA8i3s1PIOeQvNhpp7YT91bVMHaCi6r2/t/pIEhUmIQIjvdTe5Le/FXo1DBt6OkNT1XTsyuwEvzAv9+nwoxOuMD/TDsRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEnIyrq+abqrrfQGUL5c4laYAukoipIK7Kna5XSiyT0=;
 b=Yyeza73yNFQfaLWzP8pfvdzvYMrKkI0bEi5LoMoZ5cB3drPzYgTp2nrg7ebstnZNcE2RLp9CoswfP1sKq3N5z04Z+ek1b9qCg5aovn1ieIg2OZ1e0oi7bcGq81sbVt1eZylbY8+TKC4rQTw5cBBkjYaGVj4nYNq/Wn4dx8TBqGWaYGXHHML5eswQ3tYZrW3FhyDyTw0MZ1XLnZAR0BhLOjsFtaGODDOERIZ3/rE2tFRLGHW5ldZe4iZhoqLwmOoSOUm+RyPo8OZM74wrRkACC09GamUMqMPBFA5uGKdfFhMTeQvVM3WFX4gPEXvtBnrIH/BzGPF1MidqZVCXyAplvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEnIyrq+abqrrfQGUL5c4laYAukoipIK7Kna5XSiyT0=;
 b=RZ5ESu6NCNOgylNzpmD51joYcbP0zdh34osSL4D8VMDFfar7Kr/gJ2n4PnVToCvm9ge1UPpuqTmY9ste03sQhB+FQ1ECiB64e7qLo4ghBBX1FAkB3mpEaTG3ZICUWXQYh4skd93jlyhEzflL/HQ4MoMy5r+5039BR33hK1McNrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB2687.eurprd08.prod.outlook.com (2603:10a6:802:25::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 16:17:40 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 16:17:40 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	mingli.yu@windriver.com
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2] systemd: move systemd shared library into its own package
Date: Wed, 23 Feb 2022 17:17:21 +0100
Message-ID: 
 <20220223161722.14256-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac3cc6b8-1879-4bcd-05c7-08d9f6e80373
X-MS-TrafficTypeDiagnostic: VI1PR08MB2687:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2687C7213F01048370DA16CCD73C9@VI1PR08MB2687.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2mMf5WHxxb1cQ063h0jaUyh9QKG1zBREwJvCAZyEN+EaaK24vWaG5Hdj5IAdtfl329K+67J5QqYcNkXYtB5pftw2ub4CZPtCubqj38G5xRA7Y09DxCDhkaIWRWBDyEPaXw0KaiXmLHp81WXC4j0MeDbYWQGfZgFWFYydk/yqPOR8uNQaG2vEoRGF06IFX4T30tH/gZLAzP6eNITNLIywYkWDUMr1WpPQ3Ocym1sMOdAw5ft2OycXS0qLhKCIwrNs+b7mO7g9j7tYtGpc+JW15i+mD69+ME+ukkuZ8JOeKr1TQ9MCBrhsmW4wxxCfomUAih95eWud3M5Dji2WrR0gU6mb9seb/so+e2t3wo838zm6pD+E1vXrRJeJkS9d9Msv0rYkZ9acOU8a3LDJczGzmq87fLj+LM2us2BpeG5aY+DcdheNZLHLyY1D0ti98h76y5Au87QQZQtehy+t4XxYGDy/c3MZUSbgY6AQjBLyhej7aGSoHVHuTbKhL74T5SQwENjJzUTCfZXGglhJN+Ayt0xJTMxwL9Xzh2o9X2w7z3Xsq2cLNh9hmpq9B4t/VpOf4y/kfnOALFOgFE55l1C47/kHfVRrmpescfksrU8lEI25G6GhzJeLI2C13/JN9MoB/9mQ/pGV1Lm2FeEt9TFhcfHMTHYM5z+JDS29auMy7AMCFPDCIUlSk9KcMDHiO7fEMh+Sqtu0iCvspWA2okD8vA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(38350700002)(2616005)(1076003)(66946007)(86362001)(38100700002)(26005)(186003)(8676002)(4326008)(8936002)(66556008)(66476007)(107886003)(2906002)(83380400001)(52116002)(6506007)(316002)(508600001)(36756003)(6486002)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6tkuXK0Fw63+bcSexnU9gp7PVFVUMJxBf9mQaAWHuw/qbvhagplf4sCtwLCi?=
 =?us-ascii?Q?aHhtWy6DsV8qQ5T08bqQkoBiXl8HnbDfT7Ebfy7uVdiJyf7wPRd+//AEKfFQ?=
 =?us-ascii?Q?NOn9wnpDRTcVOEWDvXzmZ179TaC4cLiYtdMALsO3O2w7jiScTAUA4fc6XAQU?=
 =?us-ascii?Q?YO7xak6sPi3Dr7BKn9sRH1NVEaHSgcNE/FF/hVzrvdDhpqin2Z1kzCynESge?=
 =?us-ascii?Q?pk0igmQWxGyyk+vKpKeBV2iOaDaWDGxRcV8T3IJpt4oLgVSwtTrc9nykOO87?=
 =?us-ascii?Q?S5Xl4dccPwhrQasNw9WU4RN7x/aAi/pmZb579hT/q4QJlLr7/GCCynixjl+x?=
 =?us-ascii?Q?D2ynoTVHnN9nD11DWl/9nX2AQTHi8M6AEoj3l6+xjdFZ265+RovFgoLY2vqC?=
 =?us-ascii?Q?Gu7lJ7ARzYcClXoVKvN5pPCaSPrUj+CYz1SA1erHxniJelVS69z2ISOPiolp?=
 =?us-ascii?Q?+oJge9b315jg7QckFIoOZQXjthyoSiIlHdRa7ZDjS0V1MxtJqpgdJTprEMDF?=
 =?us-ascii?Q?gZZW4Cm3GO5J0GamYFCTyJ6TX5Rmnob5n1dLktw92Mt89clB4OWTrFy/xIHP?=
 =?us-ascii?Q?VNM9Lqcka0H9k9bAW15C+BFu3VAMiyzMc2oJGYS73waYzg0jVlopZOg2T3vK?=
 =?us-ascii?Q?PwUUHneNG6x7HgdMCQdLmNeGqt1X/+h/UdhzlogVH3WwOT96MPXCv8RO7GH0?=
 =?us-ascii?Q?s6pKDc5h8axjQdD/Lt/hNMfwhEr8qKNyrbZPn55sXdTU2KzjaRL7nOI7R1Aw?=
 =?us-ascii?Q?DaRsKXKroFxh8Of2CjW44mR1aLdIeYd9wWF623nkEUZUiji2TaSbDHufIm4u?=
 =?us-ascii?Q?emUgk/FKVjCqNx8s/IemrLWcITpiAKute22H9Ikz9tlt2jrXdpIHOdrKkzJd?=
 =?us-ascii?Q?Uczsaw9EZwHuSlvQ6rWuWJLcu1m1eXW0GQdQqkXO5UbrYlwgp3CePfY8sG/7?=
 =?us-ascii?Q?Y5f2Vy65AxPqGmX2kP/7U5YIsb5rUYvnAyR5D6ponH38YzWexMfAXhTVl70l?=
 =?us-ascii?Q?0RYkK7HzY5aulyWmzoy7JdAPndNo005EVq02VbxBjP8wErHfJzOvnF3I8hii?=
 =?us-ascii?Q?9KQdwjdpTCHEs31IGqo15jTyX9J4wxqYPpZP8/QD6yrhBXEdBUK7+b28+91D?=
 =?us-ascii?Q?jbJSK1oEhA/RxUCMEH7ZbdwdzV3xyu5lVNGg5hD0cRt2VoVL2or9Ni5vFj31?=
 =?us-ascii?Q?Ij25aohGb3ZQWHt/nvh5JGlyHdPPnP3gEc2rfj4DDUISc1IkVji0Hbt1Eu/g?=
 =?us-ascii?Q?vMmNBTCUt+YovEGLPXaTstHLV6iUB+Z7LyabNxikvENQddTK7Y+fneA1s572?=
 =?us-ascii?Q?CVbZv2YhLV55PR7f3wKj94KVhoPoKVmaNQtt1IV3/MK6WnE8bqs8qKlERLgq?=
 =?us-ascii?Q?iXjDL16ndHoVoiuE4OJFp70d9Fec/1s9Qo83jxoN7lkZkKywC+Y3leP/ZrOF?=
 =?us-ascii?Q?tcGMWYoQyPqq8+1hHcyqoT1NuzO7/lEeDSZMF1PDceFdJydseFKMovmb2+Pf?=
 =?us-ascii?Q?532k27BsU8R8AT9TQKZqzrW3aivgT7V6VZUnzbeHCZo9/8jZ+5gxiuxa2U4B?=
 =?us-ascii?Q?i7wfXZhZVUynTJuz59oLcpB01mQX/+1iBsyFTPuqgMOPQ/HdXo/5kzrN+ROl?=
 =?us-ascii?Q?MRJ1J7FKGIBiV6C3nRafI2g=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac3cc6b8-1879-4bcd-05c7-08d9f6e80373
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:17:40.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ELKOcAZQLiA3z3mVfy4PnWztjHL5wn5cRL6UNe8gxiWYCPGC9NSPnMGHTmHn6gYx2+o/VN3+xp94viB6TpHntg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2687
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 16:17:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162270

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Move the systemd shared library (libsystemd-shared.so) into its own
package to prevent a runtime dependency from udev package to systemd
package and thereby to a second init manager.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v2:
- Fix SUMMARY override

 meta/recipes-core/systemd/systemd_250.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-core=
/systemd/systemd_250.3.bb
index 9121333f56..04785827a2 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -371,6 +371,7 @@ PACKAGE_BEFORE_PN =3D "\
     ${PN}-journal-remote \
     ${PN}-extra-utils \
     ${PN}-udev-rules \
+    libsystemd-shared \
     udev \
     udev-hwdb \
 "
@@ -387,6 +388,8 @@ DESCRIPTION:${PN}-journal-upload =3D "systemd-journal-u=
pload uploads journal entri
 SUMMARY:${PN}-journal-remote =3D "Receive journal messages over the networ=
k"
 DESCRIPTION:${PN}-journal-remote =3D "systemd-journal-remote is a command =
to receive serialized journal events and store them to journal files."
=20
+SUMMARY:libsystemd-shared =3D "Systemd shared library"
+
 SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${P=
N}-binfmt', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '$=
{PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '$=
{PN}-journal-remote', '', d)} \
@@ -654,6 +657,8 @@ INSANE_SKIP:${PN} +=3D "dev-so libdir"
 INSANE_SKIP:${PN}-dbg +=3D "libdir"
 INSANE_SKIP:${PN}-doc +=3D " libdir"
=20
+FILES:libsystemd-shared =3D "${rootlibexecdir}/systemd/libsystemd-shared*.=
so"
+
 RPROVIDES:udev =3D "hotplug"
=20
 RDEPENDS:udev-hwdb +=3D "udev"
--=20
2.30.2


