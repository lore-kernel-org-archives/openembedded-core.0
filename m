Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5D7C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 09:16:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web12.9142.1639387009113439422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 01:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=XPYqjXuV;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czUBhNEa9OflSAzUznr35rk+/wq7IinuC3Nh62zyopuoIvw9CqOMMwoA+PKP5YxqD6qQfrnwL48l/L2dSsZ1237rLz+PSaPwfHz6xlcq3vU6552/hGlsRjNc7aMhJNUpq8t0SfEVdMC9YBkalTLlxs6Ja7l8ujc2L58ytr9yhyXbxfKVsiJX/tuIBfVOLFWIEpWUOgfn7RZgxnFmTP5WoZcnfbO4uytkJvi27U0V1GdUDxwD6EE/ZyYco6L4bIfyiILLMBawJsfEdC+znSa1cDP3R4ofDHuigLmvoP2sFW8IMem6NkJqu/9n3wO0+0MbcfvWSP/BUwQlF1gUstKbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lcke6kRiOl/On8xFvvgxmzVhT+DCdxUnVjk+SwFRHOA=;
 b=iEmWl54QsfGeeYiWPqD8jBgvQh8HNMgTdPirhdwUCCGMQK6Q/WEPgaXCIHXUsv3DW2AsKLJgceS5bUz/pGUqn/2XGlr9JXoQFWyoI6aaw5R2/pSmoCRupDDudZSFUKuCpPRSAxM2KGifySOLsj7b6fqN1T66UZhlsxZVPfRVDFYtNrEjwaDlezqy4Xd9u+VLCw+UAbe+E6OTYHPO/THr1I76oOO9Ijg+1EAh4iP0r0QytMu7Q/hePBFobjqyKrcy7k4iX+/nTDVw5OxN9bVRVjVCag8m1HRJ+z3JgXcgBLsAY8hNq7z7McX/WbBR/GhlbiBMiNduF8hXjMEnbg5C+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lcke6kRiOl/On8xFvvgxmzVhT+DCdxUnVjk+SwFRHOA=;
 b=XPYqjXuVXMHmlQQ/BzRjCkfuCXnARNd13TXC7z0mHgUfsGmQiDqNrQ6Vg6aKgb3tBakUZ4hgM7maFBpcqIRw4xSVP4AKpOI7mJ4exprofF8CzlrB67Z2PhXrMFmtCqVELLqzakvL99n0JP0yGZYyu9zSDK9P15QKHFNqsb7G1qM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0401MB2620.eurprd04.prod.outlook.com (2603:10a6:3:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 09:16:45 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66%5]) with mapi id 15.20.4755.021; Mon, 13 Dec 2021
 09:16:45 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 2/4] mesa: PROVIDES virtual/libgles3
Date: Mon, 13 Dec 2021 10:16:26 +0100
Message-ID: <20211213091628.2037474-2-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213091628.2037474-1-quentin.schulz@theobroma-systems.com>
References: <20211213091628.2037474-1-quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::35) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AS9PR06CA0108.eurprd06.prod.outlook.com (2603:10a6:20b:465::35) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 09:16:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4d8c6d3-a020-482b-e2f2-08d9be19487c
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2620:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB26200AAA9AF71170B8DBE370C2749@HE1PR0401MB2620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VP6ZW98rtr+c9eS121uhz1r+V1QFW6RL4rrugmeibJKxaeqcbGyL6JCMKjh5grY89+oUM5x9R6z+BRkTJ+2dFWRAjQDSpQINHa/kj9PHoGpp3fYk4oxZc41KFNRw8892c5alTaXs4JXQ1mF/Vth3a3Y/qy2GbYNGJHgOsLcYKXo7Xjg6CUlAIkRkgnY9VIJxNMhhdPPEBr/p7Hnqn03b2fDhLmEEju8tAqF/3WEtpBIw1ikveO+QKtvrs5uBpmoFYd0hq8jr8tcEB5puExJr0uOqbiN1HHwP/1YllinE5TXx3AwqyMz6Byt133sDMcwC8Zsibg7SkCMpFDJ2o8uSDAzInL9OSxePzTjQBKlz3n4PnvCevdCvCMuBHTxCUNLFZDAxGg5yQjSm6uo0BJqhGyicg7XZuS6MRrtUZf/QCTGTOuNmExizsU1ZL0en6U4BzG7xZMvv83gEpvwB2HcYfs3QaFkxdw2UT1srzyGBuYCvp8ey6A3oiPteFysOwbYFmCQeWwf/I+F/rRRSH2JZKr8prI0cxyKAajzi5I5GtMBMd6fMRYLxNhY0PwyRUfSRSEPh0EmHR3Cv7Ly6yGQ8aLIxM5EQMIvf9tcHcJmPYCWRifiATT03Qid4YjTKHvx2hxaleBBy0UxMf02bL6rb4veEeKPXVMZrbkIDgar3K2Wi1EDHNYLOvJlyIlnz3w6/7414RQftWT0m8DaZg1b83A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(8676002)(8936002)(36756003)(956004)(6916009)(2616005)(26005)(4326008)(6486002)(38100700002)(86362001)(52116002)(186003)(316002)(44832011)(54906003)(66476007)(66556008)(6666004)(66946007)(1076003)(508600001)(5660300002)(83380400001)(2906002)(38350700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OfKCpClcrm3r9HHybYZAZvpQBsvLRf30bJ9CeNyRxCCcCBWuIZd582JoXGEK?=
 =?us-ascii?Q?oL1ZQ+XvxY8YhQIw7E5TuEA35MsyJh2HwfOJjDteNXmYBadVQ1QjkUMpwUJd?=
 =?us-ascii?Q?g+Ei/0EYBJmPvISRAlDwtrSQAU3RbMdBbrWd+685dm428qPfN8VJS6cxSTFz?=
 =?us-ascii?Q?pJwjXlajXx7nMPBsSP2u30QquXXfhkHtkgZ+gqig+HJmzfh+6d5SlAKI4xIh?=
 =?us-ascii?Q?BPZ0Ukf/bsjtcP6bLa8eor/2hrSkzr27M4MbXel1/pSUmbSNOHGEN+f2DT64?=
 =?us-ascii?Q?V+O15Ijjy58lv70AneA+h+YZI0Fn7Et870ZzxMt5Wd3EXYh0Hg11Wq0sUVa2?=
 =?us-ascii?Q?6m+oel1WHUQbwzhP3PLFpP7/dE/7Rm/wYT24VF8OHzZ6qjdOn6xlj2yFq50t?=
 =?us-ascii?Q?wYAIvRn+OXrzQbgjR8fchU0Jnvfq6GAig/40y/+/4BcUiHpq654GRo5hUQpp?=
 =?us-ascii?Q?dxjJQfV/GEfTqcfxfeOG6rqqEaxuE0Iyh3Uu/BWMSJdv9gy6TtoUiARheIwE?=
 =?us-ascii?Q?90SNwaf2/+M0vjpw9ro15KzsHGq7QOhvnEQhYyHruBVKp1GHX1GHihT8uAY2?=
 =?us-ascii?Q?oN6QOj3hNGaexjj9C6AZsBHo0UQXQIzNgCZWBdpNPa9nx5nV5V5b5/E2RiD2?=
 =?us-ascii?Q?GgogsR9FfwL0HoZ1gm1sVkSpAIXBJeofF40UGHkVc/tpulPngMntZ6edkQyt?=
 =?us-ascii?Q?71qFoCFbSDVRaEaGDf+pKLLPc61eomY9zFYbg/I/fkwsTxtzuzWEUqM+O9I0?=
 =?us-ascii?Q?GniTmLsrlQ5Q30BwHBy1urAvhhh3w98Fe/pL0OoQCMu0cK7NSlV3nsJACsQA?=
 =?us-ascii?Q?geOivuUwuiM2GqRuJt/sdhCXHPeNZeJPSgGSZEM5hhqS1Fq0B5JaUY8miB3k?=
 =?us-ascii?Q?VD5geboZWQrkO5MYu16ao/gE3vTH0bcCZdiYrkSZZ6WaVniJ439JRcbmtYqd?=
 =?us-ascii?Q?0kgU7z/2/Esuauo0ynJr3yaLffa0b/6eSP/uE8UvCXwGRbKd6hEBpEbFvmQa?=
 =?us-ascii?Q?8gl4/PstXxQTvjglDuRcZ5v30XfYdxmAmDXp87Wtj++uQpsNQcbfN5PWl5og?=
 =?us-ascii?Q?EzC+Lm5fiOAB2McLV3opffvzK9ptTUJq0CQ6nIRrnvfQ5eFKde3f0klcolzQ?=
 =?us-ascii?Q?YE0rDGLtAVRdjzB9afwD0ZoGSsT/YvZH0L+1s8deWg63Wha5RnzUODuS7DdO?=
 =?us-ascii?Q?o6EZ6czkDnwPWGyzn7Jl8EycHtrb+BVwP7bjAeyEPJjZPVix4CicMK61V5g5?=
 =?us-ascii?Q?uAaknVfwwXhlGbhQEHfYsLKTz77t27XNeY7bT/Fc1TCyRBeht9qxWAhdyxx9?=
 =?us-ascii?Q?bTBgnp5td89ZgJH69joDO6+cpO72z364BYlvlgrLka8IJZ57wo0Zfb9Df7DW?=
 =?us-ascii?Q?K++Whomsda2yP/1j5pkd2Q3Y8fHKc40QhxkND5S41nZHDbcyEy4PtUusU6MO?=
 =?us-ascii?Q?9hLHdmlbgr5gZ7rW2LuUDOIfGZod8iHnY/ulraCLb3BFtPc3pT094m1SsNZs?=
 =?us-ascii?Q?h07nI67P4Dx9n/wkEneXIxNupEMNFyysWTrCM3lN6TdQWnCgq9ip7d+1Nek4?=
 =?us-ascii?Q?ClE/EY4FyMe07PEos0RwVV2Z51dEPmHcXcNlR4QsMS+IFg+V3NSYaT336EGq?=
 =?us-ascii?Q?AcEGrgbxyesa3a6ncHIwQR/RevAHyY4eePSD8KBdRr+2OEy6bkL7lRr0LngT?=
 =?us-ascii?Q?9U5aOvACXrfuIt9i3JEEZdQ9xzpD5qTT6yAIYdmqThAapIBZ0Y+RA8Pi4Q5H?=
 =?us-ascii?Q?+KExdyL6pw=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a4d8c6d3-a020-482b-e2f2-08d9be19487c
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:16:45.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W2mGM4PstZriLwvUdDSeZr/mIEypEXfU6u3+JYRYt7W5Qo5M7m3KB+tOG2yYPve0tAN+axVXzwUh4Q00UiEcCqL2JWriAKp1RV0eFDVrSuh9HyY6w7vrwsQgDtYwMsi4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 09:16:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159614

It's assumed that not all OpenGL ES implementation are compliant with
the 3.x specification. Therefore an additional virtual providers is
created to explicit compatibility with OpenGL ES 3 specification.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 meta/conf/machine/include/qemu.inc             | 1 +
 meta/conf/machine/qemux86-64.conf              | 1 +
 meta/conf/machine/qemux86.conf                 | 1 +
 meta/recipes-graphics/mesa/mesa.inc            | 2 +-
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index ea88bd4876..6defdca12d 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_virtual/libgl-native ?=3D "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?=3D "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-utils-nat=
ive"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include=
/qemu.inc
index 642c322abc..0d71bcbbad 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -3,6 +3,7 @@ PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
=20
 XSERVER ?=3D "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver=
-swrast xserver-xorg-extension-glx', '', d)} \
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-=
64.conf
index 978334d5bb..901353499c 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -6,6 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
=20
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?=3D "core2-64"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.con=
f
index ad7f6e0ee4..1e072e1ae2 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -6,6 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
=20
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?=3D "core2-32"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index c894c2dab5..6d6fc607f9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -39,7 +39,7 @@ DEPENDS =3D "expat makedepend-native flex-native bison-na=
tive libxml2-native zlib
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d=
)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtua=
l/libgles2', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtua=
l/libgles2 virtual/libgles3', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)}=
 \
     virtual/mesa \
--=20
2.33.1


