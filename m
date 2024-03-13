Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183A6C54E60
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:41:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.130])
 by mx.groups.io with SMTP id smtpd.web10.6976.1710362516241818520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 13:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=p4YJW7wf;
 spf=pass (domain: navimatix.de, ip: 40.107.21.130, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMCpodSKNcVqXb1M5Zr8if0RSM/vnypxyLvw4ac/wiO8lCxMxALajPuMnY+UJSZzIPc1VwIo5YzbMcDbxAZutsoZXBcbk0PTYirqc9ypA1bfRbjiVT2RL6/+TITyNjg9zALphYslmZ0wq6141GDwcLJ5moNaG0lqSDg2dZWk16AUa2a8oWIz1W0YAuQS1InOCgGCw4WT9lOc6AWE3s+R6edKGyhj3k+jsVcEthFgWngtzU4iN2Jkbsp9xCUzMK74FgS+Dj/dqZ/KYB7UMJv6XnTL/s7abxsTePNCafK1GoVak0al1fOoPtylY09VxUoSMPFQLwoScRWnsnFLNGJPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnBOlBlDkb/VTRVtGjSAWQW6woFvaktXi2IgZCV5n+o=;
 b=FxS1mC+/BrT+36fD2fOF7X5hdHtd0OWIP3cTPCk3Xa63CmH1KOV7ZzczS4PMZKiAduMv8tGe2xlgvoZDhJVxdGJxnZiGKHYHyUkubwdQcwGb/ZNw2901BeZSRD+NvYb4ZMp+zkEiUNZplq2tvMmrMQrT4VIy6eO4J/Z1akivojEyi7bje5cr6uYgaUXGGWPqn1BqQ4zViKB3/185YOx4QnHQyr3AyN4I0/2/MZl49CYEt25i7sW/md1NchWwdOOxOYX6dUCdmO24PVtv8vK4S+lOezglE1ICDRZGbQecOlN3t+Vt7PGfLZ/6P2E5LWj93X+eHDqPJ0FeUC3VNsM5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnBOlBlDkb/VTRVtGjSAWQW6woFvaktXi2IgZCV5n+o=;
 b=p4YJW7wfAf3oIE9r5ZaRJio/xH0uZ9mcAskBxwzdVfpsQZZnpCP9faU9YvPv+9SE5Vq6nLczSjvd4Npy3Xu/2Q4VpLHHwUqH1vtkOXtubObI+b8W3wJKse8CxHxdCYSAwDovjfkhLjkK/QZkaieG33uRovQNykQFxVIvY9S6Rk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20) by VI1PR01MB6366.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:15f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 20:41:50 +0000
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5]) by
 DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5%6]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 20:41:50 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] sngrep: new recipe for ncurses SIP Messages flow viewer
Date: Wed, 13 Mar 2024 21:41:34 +0100
Message-ID: <d70935f0c1bc2315f649af3011f5b2a1cfdbecc1.1710362494.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::15) To DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3658:EE_|VI1PR01MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: b315a169-a873-4d68-118d-08dc439e0213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cMw/YZcugJh07Z2N7gCEsaGUKn4d4eDuxHVh5ArCKXGl03tQnRmm482ceowedWqI/njA4rdkQAJytqG/bXjkjqkYwM2L7unIz5NQYpQK9h8AWX8JR6HyMtLL/Dmk0rzArpwBK0fFJFPyBsol74XRSsgiUnfcQu1vGVNfcFuwB7mk/cdXqL5pUSdEPpEdnBBBOTHKcqY+IbChVcPs9uoOZkF+v5J4v4IOPpL3BhZOHjs5N7q1oLGzGSbRMVuWLAr/ut1pddzjsEL1+j9mpSe2PkrPrGfgw39sC7k3m7T9qNLewTui9lhTTRebDL4ESjz9TFV8TVj1FmM8Gxyzbm+yUtDxE2vGAhLWUhTscYJhqfiH664AqYUhEmGMvl17Of2VaT8dusc5rN/joJNJ+NVYllH6jin9aTjN6HvPO3V1ZSor2IF6CNoYHRpoHIwzL9QTxui+z1UAbiPAW+Km1+UwBoIXkwyIpOY+yKoxMR9TcSKiIdXvjRymnVkB2ImViHHKs6xqXeaPsYUp8Pb2TIvVDOJj0mV16LnIpCOuojh4rEdi3JeTu+YTQhGvEFO4v3vfBOYdNyO6pz8jl4Qr9v4HePEf8VcQBzP6J7gUciYy2tNzkEu/YG/gB8gklXLv4Xv0lILGJOXHeqyoe33obStGBas/tTgqAMV/xj9GtDK2I4Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0102MB3658.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lTN0SW3UT8uSnaDwM5L29a4DWT+GChBkGxNfokn51lyvxcnqrpmyDZ5NumVg?=
 =?us-ascii?Q?hD62MlOjjqca9bXNvd5V1nSMKnUE547gmaoLNGPCfgbVD4rHZTs6siUygTle?=
 =?us-ascii?Q?QpBlGWk6+jAzeuO4THAA2yr314sdFfD9id4lfqv8ClZP2er7yN0vD4QlPjBL?=
 =?us-ascii?Q?XVl6bE+ND91Nl4mt0HPBB0RgSt8YPc69atYDMTiRfVMGXBJ0loXUAOV0CJLX?=
 =?us-ascii?Q?5Oo9CDfS7AbhKMl9g6WYl096zheNK0EU51a8dd/o6y4jRUI9gr5yb734tEk8?=
 =?us-ascii?Q?zgxem1/5a1YxmVEW8/h6fQGrSv3Vokuop0Zq4ll5fIwzsKljTH51d+AzAZ1b?=
 =?us-ascii?Q?wqgdqpENLw4bX5Jh7rPmFlVBVp7L7CYpEcGz7d27NmTBRbTjBzzvT35DkoKU?=
 =?us-ascii?Q?TBkHjLS8+7iFrNESL69khshk5RH+HM/aqpeqGNOzYB/rS5BikcBPXVrh0QWQ?=
 =?us-ascii?Q?BOXxPvGX9txmNtfZFN9gdnNFUKVHF0tMwbXpqIp4GwTHfMoNBv6Q76XvW2Ym?=
 =?us-ascii?Q?6Lt2bd1tlebYydNuJS4i9RUxL99qCUm+VApQeqkN+9S+ENZ1x42JkHD5FZui?=
 =?us-ascii?Q?3QRLZgMA0NGTj+im+zJeOyWSorMAv/AYeIafuAf7BUbjWq5mIsALkAw1wt3m?=
 =?us-ascii?Q?VFL/toUDucRlLymYRZzcMf78shFaknH4rHUiAqUlT2q5tzGdoFGABFxfeVdv?=
 =?us-ascii?Q?bb4FdFbqwtLdYREVX8qKL9s+TMJi2eiRtvqiSzAXb+IeqhxQyqV7LP6ME9T6?=
 =?us-ascii?Q?W7kW73aaR9ma4iUYyjpGKCyqPAegmNB8NB2E/c7/dMoSehZC7Op1EZ0S2dak?=
 =?us-ascii?Q?7yeZC2+qc5H3F38Z+KpSfXK/cRbIsNmltTXBJ46NyeDOH7lRG+zeHRjwH3jY?=
 =?us-ascii?Q?ySir7VLxh/YIZzum1KNbhmRbSRfva0CNb43zH7Nu+fhzKMhcxIMP6+BVjBhU?=
 =?us-ascii?Q?DoQCWBFikVdACGHI+DO2mhTB4qJhSuvpk519o84zZBkTAjSlT5omCnKWiFf4?=
 =?us-ascii?Q?wK5EWTa6/264ESVF27MxESiLaPQJ56bkOVYlcGDZxR8nQ9QdJj8OIWQekALU?=
 =?us-ascii?Q?Sp8W15UU3+ggdYirv7fegj/E6N9GMzFx4homqUrF9LIM4dvlNkmk2BVhH48N?=
 =?us-ascii?Q?z8xdyQ08cW0XfcTxvNyjJENpcKz+BJAOoSazgH1UTMyltI1CMU8+BhXkY8ZB?=
 =?us-ascii?Q?z4dk4ol/kpPcfQkwFrhDPSb7wI+uOK964/QFtfq+qitBCSE3RIeWwPeR0sLm?=
 =?us-ascii?Q?2vwxRdo+2H0i9h5ev6sMg3ifA1P3nF7qEvflQW4QCTTP248vo/JKOBlUGIEK?=
 =?us-ascii?Q?zNOLGhUGwsjq3qVje1lLOQfqmFJeoboxdjMaCtIMiA+mC2A1CfRxFSQaVh+o?=
 =?us-ascii?Q?tgmQLhHcUlunVpzvF7PiLKr4ksBFrJlIJ3oVOu/cTKjR7pCZSJJ+Dk4QcVFt?=
 =?us-ascii?Q?a3q3eW8VzK+mgKB/aNMlpTd7AOjUVq0sNTO6C6/t7lt2hwlY+JICLD4BrhoP?=
 =?us-ascii?Q?iK/1d4DcJEVXcjDjvbSp68QPF5VNaKsJ2CmbJP5ZBybk8AkqxeuoC8SKUh3f?=
 =?us-ascii?Q?vljeKAlA4UeMGSyrP7AfSBAtHa66vbeoeHSDeEsERQiSCEUIsQBBTHOFM6y9?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b315a169-a873-4d68-118d-08dc439e0213
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 20:41:50.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpve6JwT7sX++lRuqKaeM/+Qq18+bCCJWlYtyA8Lu7wXwJvExQmBxHR+l5JRCosnB9/W193YWAysNIsioGR2mo2z4/3qGcqyqn13Kr9Wt5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 20:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197083

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-support/sngrep/sngrep_1.8.0.bb    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb b/meta-=
networking/recipes-support/sngrep/sngrep_1.8.0.bb
new file mode 100644
index 000000000..2824dde88
--- /dev/null
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb
@@ -0,0 +1,37 @@
+SUMMARY =3D "Ncurses SIP Messages flow viewer"
+DESCRIPTION =3D "Tool for displaying SIP calls message flows from terminal=
"
+HOMEPAGE =3D "https://github.com/irontec/sngrep"
+BUGTRACKER =3D "https://github.com/irontec/sngrep/issues"
+SECTION =3D "console/network"
+LICENSE =3D "GPL-3.0-or-later & OpenSSL"
+LIC_FILES_CHKSUM =3D "\
+    file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.OpenSSL;md5=3De39170c41c6f83de36426dbf49a03632 \
+    file://README;beginline=3D100;endline=3D124;md5=3D758a88cf2b27572df059=
96a3810066b3 \
+"
+
+DEPENDS =3D "\
+    libpcap \
+    ncurses \
+"
+
+SRC_URI =3D "git://github.com/irontec/sngrep.git;protocol=3Dhttps;branch=
=3Dmaster"
+SRCREV =3D "f7b36df3b79617892958b67cb4ad9313c6ce72d2"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ?=3D "\
+    openssl \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    unicode \
+"
+
+PACKAGECONFIG[openssl] =3D "-DWITH_OPENSSL=3DON,-DWITH_OPENSSL=3DOFF,opens=
sl"
+PACKAGECONFIG[gnutls] =3D "-DWITH_GNUTLS=3DON,-DWITH_GNUTLS=3DOFF,gnutls l=
ibgcrypt"
+PACKAGECONFIG[pcre] =3D "-DWITH_PCRE=3DOFF,-DWITH_PCRE=3DOFF,libpcre"
+PACKAGECONFIG[zlib] =3D "-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib"
+PACKAGECONFIG[unicode] =3D "-DWITH_UNICODE=3DON,-DWITH_UNICODE=3DOFF"
+PACKAGECONFIG[ipv6] =3D "-DUSE_IPV6=3DON,-DUSE_IPV6=3DOFF"
+PACKAGECONFIG[eep] =3D "-DUSE_EEP=3DON,-DUSE_EEP=3DOFF"
--=20
2.34.1


