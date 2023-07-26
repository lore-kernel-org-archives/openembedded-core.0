Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429EAC41513
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:22:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web10.7252.1690363361353950502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=h9HqXkhL;
 spf=pass (domain: welotec.com, ip: 40.107.104.78, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogfz2adoDLqUyTnATm9fZhPg5M2oym2WMeTNSJiVXkiGMqYDc78ZZDdYybuyveF2FFdJQNhpO0E2gof+iH5lxTP0mDVBreDf0nQt0UE0gUOW+epFOdFiyU7lLIgFLWKSVvhSgxJ5dAeHFvLKNoQK0A7n/uS2Ev3yRkJoxvA9aoqAPxTL7XcApzFis2+Glq+pwb7+mYaxJ2aQlvU1YV6I8UzQQC4sAvmMJ2M0Fksq7ZVZFLv9SF1rNA+o7hkqy8vwscrfm2IIQrZL+ek7mHM3Tpars5zzagpRadaNrpz/k78v8j7VbdwMKxwwzUyxaIj63mKev26HswFkL0K9QvUGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=jtZ+r/+H6A5q9lT5vNGvRm8Hl3pmqt5g48NXOc3LNCIGLhz3O4BNvQW5VkFtsqir8UONhQPT38DkJP0cvOKuoRVYfPwirZWaY6x+GfDmLQAwZIpAyd0Oh6GOgjz8wCIrwaIKKyocRo16YIEJr2DnDGIln6q8VUgI/Ls+apZNL1HqtAQW26Dd/vxaSmy93xtmuNQRd9DPA09fkn6Lm56LYCQSidSmFDXcXM/vbP2nCrmY0l+ZFTVsVgKdepGAx3gqIgd/OCchEwFP8cY3JrJ0V3tIYSy6AWAQwN3MtKZQLxx+uYp1KP3h2L7VjBhpMSoqsth76p2kRsCGP1amPqfvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=h9HqXkhLzBtQCZXxpTrpi0YczMVAAkhHZh30io5JYc45nBaC91pQhdGJnmeC+pwYHcaVn8/3ld64WO30/suP3qvtU9Xe1T/5NopYV7Q923hwW3owiLVD17yaUBBv35XeSX196T9/dsgMZu+QtPKCLMx97oXh06pxEZRMta9XxBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:22:39 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:22:39 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v11][master-next 5/5] opkg: set locale from system environment variables
Date: Wed, 26 Jul 2023 11:22:28 +0200
Message-ID: <20230726092228.1005306-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726092228.1005306-1-p.lobacz@welotec.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 84051ec1-7913-4973-929e-08db8db9db71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IUzAqbSd9P95xB/7avSmYnrrNumEIIRPmiKgWd1hpsQGMmeLnREVtUXm9Mu+EgjlBw46zKX7uXVuV+wA7x4MoVSO5C0JuenyFQMPc36uA4uNRB0wIUDLdL5VRWCgS6eeC6BpOxroHCefhwxPjenUmXJk9eN9mvwcyoVOcUC/qqC//8K++BEFRvcPqhrzXgGTFPtQwcJuL9E4psdNlYqnbrTb/th3/s/nHkMD3chlZBRU+J4uA68AG054y+JYqJQkzm8NyZ0cirFa8CDz4d0TP80Notl957MHMLdsQhmjmTWHWpWfu1uonaTiC+CA2H5JTURCSOdeiqG3qhE4jWoRSCD3Tmxg0AP1yWYmV1aSxw+05IZNZP0NGytZEeDl25j0aeTkRKIHL3PtseI7AFCxEeWsjAieygq4q56nTQWLSxRRhuiNiVp3xNPmoH+X55+cA/GqT/ET7FUz1Dxph4Bo0yB4CmjClvIEYIkHZN/M6o0dEYT1E4Mmpw8hGpV7+Atj6zCYrEilRvFWIfAe/uj8bwdasSU+4eFcG4dNiMjIKVPtnN+aKFKSdCeOunZQJ2Ez0cMn9CSwu4Okz9GkMQnsm/oNa/K39tlzuVfBBaStmH8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(136003)(346002)(376002)(366004)(451199021)(316002)(41300700001)(66476007)(66946007)(66556008)(6916009)(5660300002)(8936002)(4326008)(8676002)(2906002)(478600001)(36756003)(6486002)(966005)(52116002)(6512007)(6666004)(86362001)(107886003)(6506007)(1076003)(26005)(186003)(66574015)(38350700002)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eBiac/LX5VBR/yhl8Xe1P6c88Wmj+ehNpu5x6L9im2rtj8SobbXYl6NA2+sq?=
 =?us-ascii?Q?n6buoJMoxU36uB4hJuNcBb//xcrYaAwnhOKq/x63JbU8V4/qV+sWG/etGNCv?=
 =?us-ascii?Q?Ge4mNWb6AbZh9O2ET9zDQ3zfGEuQDjNm0lzu9EUwb3jHH15rjvFj74vtlPy9?=
 =?us-ascii?Q?N67Nz8lDBy6RaJTyKYJhPRh2a2fWUAploJ2mROvGi0QgvwpiRX4geYy6nELb?=
 =?us-ascii?Q?9eEfdSHH7xsrgQRa863/G2PZmSsFxfJdzZJuwVKJi1q/NXSpdYFBA5C7UyJE?=
 =?us-ascii?Q?kOUewIU/bXjcAH3mv1tH+9dBZNAoeutnETDGbpKkkoayjKxRQqTC7wNTIm2w?=
 =?us-ascii?Q?NEdwY+g6vSbV60+WAGYGA2ubvK3z4odKx1fFE8FDai2FuWDs+kgEQNhBUzMM?=
 =?us-ascii?Q?gi5vLd4FR1oITxR193HkM2ku2xZInvx8SR961oQJ2SqvUfZzGbu/zBDAjDqM?=
 =?us-ascii?Q?xBO0Dt5prmRc5FAKJu3kiv1luGDJsc35w6P466KW84s1c9usS0EAg0/utytk?=
 =?us-ascii?Q?1rLsEtnY5YRkqQ3uljujGsrQv6797OL0W8HHeNfFBnHpddB4qNuT139KfHKK?=
 =?us-ascii?Q?SJBqYPOxmcK3MaLp5b5UK9YIyE6N4c4RRJix9o5J+ycSm87fvIIYH362IxeW?=
 =?us-ascii?Q?OVpPkUdk6Yxhjc8AgKpf88KYPJ4LV3TNRks2AcsF9rOfbaDqAxqfQNbomVpK?=
 =?us-ascii?Q?/U4v6pEQFKU5IqnpxEM36UvS04LPwqqfX1hE3LeT22OWcIpD5NBnf6FAk9jE?=
 =?us-ascii?Q?uwE/qPIdD+WXw0VJPCmQq0+zGTKkh3ZMPuFy0dEDUmxfeKu8dHwqeZW4Vn0w?=
 =?us-ascii?Q?stxf05X1qFn+yvfWzThX46rs84koNjNv1srGX+eG5VtfI1F5AM+F88kc579I?=
 =?us-ascii?Q?tReOC8mfgLYNATRTcrZcW6KkFHkO4je9P/Kk1O+DYHo4OGJ/c4qGr+SbHBff?=
 =?us-ascii?Q?HB2FUw6XtzmBpNXBeFpv0MxrlXo3lwTJJXEdnWxBv+yPyi5eA9BsmCThV6EQ?=
 =?us-ascii?Q?T5yugdmiEYJuqfxp1GvMXFclPVmkeyiwhb99Pu/tmvyPbOqdEq+qB04jU2fb?=
 =?us-ascii?Q?Eq0jyjymCKjt8JPaKa2MIKc1AxYSV8rSQ6GDNLVart/iCME3te88wlhA/zyu?=
 =?us-ascii?Q?i/ID/97DnzBrm3MYwLAenCSpzASbciUQ/EUHrJDK6NT9fa4OG5kmJqMCRGCy?=
 =?us-ascii?Q?s1eiwV29yLZ/wf68ieAb6P0nxajy4PzCJVbu031rC6kNKhRf0LYS9FCPItqH?=
 =?us-ascii?Q?pVehZIe31AHBSrzXRaYvo6Vdc6OsfV20sL3UlVP+ec95/B4qR6GP1jeO+4j3?=
 =?us-ascii?Q?yUM90o77y2FJ0ecSzyj26yL/WwOgZXUyLiiHVWg8jAMZv2+dctQZbnHgqRZ9?=
 =?us-ascii?Q?eoQahQLe0akXtL+VLs33ZZO/1WRpMEhazCTLhqyEcBk9de3H9w5LLVX8XPme?=
 =?us-ascii?Q?VljleWOJM/I7JsYNVbeluB410pifFzwiLeZvKnZ128F7fVRseWz90BJeEdRC?=
 =?us-ascii?Q?UxW6XEg21szwdoCfs4TjkTgmkgXrUi3j7ZeMfsPmy28Ybwp4yLpIfHFFtMD8?=
 =?us-ascii?Q?iCD+illHvK8RxJDf1X5E0KWv9UA8J503fEdqiCGP?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84051ec1-7913-4973-929e-08db8db9db71
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:22:39.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ltkp6WbyON2JFexzFlpk9PJrcYKQ4Tcji2GOLZ2aiWLB98BpBsfTtSovr0gBriI3sitrRiSc0Ii+3bQrb6hQjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184874

A C program inherits its locale environment variables when it starts up.
This happens automatically. However, these variables do not automatically
control the locale used by the library functions, because ISO C says that
all programs start by default in the standard =E2=80=98C=E2=80=99 locale.

Fixes warnings:
Warning when reading ar archive header: Pathname can't be converted from UT=
F-8 to current locale. (errno=3D84)

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...le-from-system-environment-variables.patch | 48 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.2.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-fr=
om-system-environment-variables.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-syst=
em-environment-variables.patch b/meta/recipes-devtools/opkg/opkg/0003-opkg-=
set-locale-from-system-environment-variables.patch
new file mode 100644
index 0000000000..71240ec8fd
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-system-envi=
ronment-variables.patch
@@ -0,0 +1,48 @@
+From 712895b1914bf63ee4d669863bfd106814329076 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 19 Jul 2023 21:26:09 +0200
+Subject: [PATCH] opkg: set locale from system environment variables
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A C program inherits its locale environment variables when it starts up.
+This happens automatically. However, these variables do not automatically
+control the locale used by the library functions, because ISO C says that
+all programs start by default in the standard =E2=80=98C=E2=80=99 locale.
+
+Fixes warnings:
+Warning when reading ar archive header: Pathname can't be converted from U=
TF-8 to current locale. (errno=3D84)
+
+Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/16kgZ=
fJ26mQ]
+
+[1] https://www.gnu.org/software/libc/manual/html_node/Setting-the-Locale.=
html
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ src/opkg.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opkg.c b/src/opkg.c
+index 544c58a..0c729ff 100644
+--- a/src/opkg.c
++++ b/src/opkg.c
+@@ -27,6 +27,7 @@
+ #include <stdio.h>
+ #include <getopt.h>
+ #include <stdlib.h>
++#include <locale.h>
+=20
+ #include "opkg_conf.h"
+ #include "opkg_cmd.h"
+@@ -408,6 +409,7 @@ int main(int argc, char *argv[])
+     if (opkg_conf_init())
+         goto err0;
+=20
++    setlocale(LC_ALL, "");
+     opkg_config->verbosity =3D NOTICE;
+=20
+     opts =3D args_parse(argc, argv);
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.2.bb
index d7dc6ab715..3b5d51d74a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
            file://0002-Add-options-to-enable-support-for-acl-and-xattr.pat=
ch \
+           file://0003-opkg-set-locale-from-system-environment-variables.p=
atch \
            file://run-ptest \
            "
=20
--=20
2.34.1


