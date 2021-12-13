Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558FCC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 09:16:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web12.9142.1639387009113439422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 01:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=PQuCvXUS;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocVp0Jy8JrMdK5mbRqFDlMphTznDSE8YXVniA42yGiEbx/TKdO7gcjW96dTlaoGt7RDxGMFsROR3aI6062pIxGHV80exj0cu4kggU4G66gMWlCgd7ZJKhioz9Ih6gxpqpG72JeN5iti5oY68ZzL0vZRpbtRSF/haRamxB/VJ1ANHTZfkScwrKS34nl8BtlFB5gD6jFIUycn7xaai97hqt2SU4zKdKxb5u1KhGb8mmaCL+Mexpws8++2cT3Uq2imK6aBJFJdk4sZzNd+ATsjOJb9bxGTKL3KaKh28s/hvNEFroLu6HYofQIEApARjZTG5uFp4vaLNNs0EVV1EDReN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS37VDpG5/ZZYZgO4H+Z3pzsot5Rh5tVxgh+0bBzHo0=;
 b=aWB5pqgOoWCUkWjZ5xfO5tAYdEc5YX99SUOQRGrt3zCDKqp1db0II7Epk6HOHw1wbehKBs7/dqlN++ilS9aDsvFQMJkD983vR4td5LpS7i90tqoJY/WDECducpMPxDyvWztfW6wchfBqqb5CKownpvaXhy17bT44Ijs9XaRekA55DgKYRnQxSKP5xHwUYFpTwhcJLu/De/M+5CRktkjvEMPjrC27PVosZz2tMXGel7TwlzyTOQO5u/bbalYzLZP+vmRnheW9YLnS8hs/hea8isU72oUJ2Ydh6U2o+yKXllrlqBmYOIxpZOu7MYnYhLlp0dNzQ1t01H/AOdV4j7hcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS37VDpG5/ZZYZgO4H+Z3pzsot5Rh5tVxgh+0bBzHo0=;
 b=PQuCvXUSd3YTJB3NALZX9dkyGq6oU5RQUZBAislbEo5weFJZA9NhhYDXmSrEk+95wEGh4KHFeUG/05Z1vL04B8duYJBWkKNdlEdUWDmz/cNyJQHv4ut9fDrK8Qmqzu3cMnflAl87WHy4rcMTNJ2z1cIl0ExpgwbLWn6WioviO60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0401MB2620.eurprd04.prod.outlook.com (2603:10a6:3:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 09:16:44 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66%5]) with mapi id 15.20.4755.021; Mon, 13 Dec 2021
 09:16:44 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 1/4] kmscube: fix build on OpenGL ES 3 dependencies not
 providing GLES3/gl3ext.h
Date: Mon, 13 Dec 2021 10:16:25 +0100
Message-ID: <20211213091628.2037474-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
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
X-MS-Office365-Filtering-Correlation-Id: 7223e3fc-8f7b-4dd0-9912-08d9be194830
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2620:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB2620EE97EE1DE1CC6470A425C2749@HE1PR0401MB2620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1NiTDNjmBYF7ZKKeGzqnz2tR45jnI0GGV8iBPTjP84+nG5vP9SjVDo2nFCnSBzV13p0ORLN5W5TWL4vCqhqYSgtsVEOQJ799lH9T8CzIpsBDt585LKam6Oo3PnUOVQ1JG0gtgTyBuHM0vLhafwQIyCP9CAygGlmjbN8Hq+k5UZ1MUNsW2p9l9rY1WxURWPPo6qU2YxnizOPfzAwzs5fo68pj7qGMLB6/onvZRt19gY/6KH9gpbpmj91VoWXWTe/kUIpBsgox6XrLgGJXeFNgjfidEDekIi/MLKHuFFrSrWUA/CcUnxuzNRdQuf8BZl8xnvp/G0vP9vkgM6TSF/CNpoqQGXqKyP524JverfSxHF5k3xit2nFCJadmJJdkhVbtrwZIudbNz/Ra1KAaSr3I0ot6VJKUJ7Vg/2JOiyjRWfa5kXw8shgHnW4YD5rJepC0qYrN7Xir9Vlml9fu5ZSkF2588EoHFhsDRHTRuLSN6RglUF/CqEwZbS/Fxd4zUBlQozzUnFf35/gJCB/OOOekuy1OjV8YoyYaKY+Pw/mFJKNw4z0brJQgKHGaG9l4ZyMOXSugwGVZMoFKwczOpdCAFIPsnkXqr0f0QHNJGNegcv8smR8YNTEhyqoyz9WXd+YG/5FYpcFfvf9JoamlpfmLOi7/ANeMPtjAvzJSUlxGwn45Eo6H57SFEqTlsz+yBgJATc8g6+sL4Oig9ZL4O05UJruVnr+jGuwHIcQWcF49WsVX00grz585jx/PmgzOfYC3sWSvPhG6aKhH2AU1qQoFbTdbOp6CKlsmT3QfN98Umyc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(8676002)(8936002)(36756003)(956004)(6916009)(2616005)(26005)(4326008)(6486002)(38100700002)(86362001)(52116002)(186003)(316002)(44832011)(54906003)(66476007)(66556008)(6666004)(66946007)(1076003)(508600001)(966005)(16799955002)(5660300002)(83380400001)(2906002)(38350700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cp9L37W9Ze1Tx3YGn+tmKW+86bVY5e8hia06o8a/w1mA9U1uTfl/J8X8jjFq?=
 =?us-ascii?Q?h7/vy0SEQhqgn+6H/9zP9IS0/NGFOdRrwxn41ivYuQMJNktRXBifPDXE1fd7?=
 =?us-ascii?Q?hkMXkbtwQvqo/7fXvu+Ue/71JzNvKkyhQ6390hKr03R+kKk2b8qZbavOuReM?=
 =?us-ascii?Q?WKQNMfOkueyntJUfp44whSYkKX+RdhtEzeRFIxixqEs4sQndG0NnVyQ9FkHZ?=
 =?us-ascii?Q?l3TPysEohjciRNMuCIczWgyMR+NysUov4mG+vLE1J3OERmC6EWBWmYtxNynj?=
 =?us-ascii?Q?0yrq2LEZlm4mUGyOeSppb1oCUWRs9oZmAabA4G2sZjquynCpLB6mdpIT8UcK?=
 =?us-ascii?Q?Xfqj5YEfSee6jBR7HJfPOINkhpuzOltQ6BTqW0esdJneST8AxJVLeqQxVaGr?=
 =?us-ascii?Q?o+l+SOPATB21UU75vRLhaOHStZBenv27fH42/BJnuMHl6TKxnRjq4/ili19O?=
 =?us-ascii?Q?WoxgnTVOx4EP2HFDH1+1c16qL+MgA4W8lLk9FxGeFkD9qC1IzG2J21UKDSO6?=
 =?us-ascii?Q?OuSRdnmuFnRD334VAIJScZwD7/oNWBhQGmigvLdGsYo+/V9Mpnis0y/WwNRk?=
 =?us-ascii?Q?9llL35PuX0lGSEh2mHlIdqFbplrS2RnAn36tgsE33Clujs0tLoyF1/Q5rFDt?=
 =?us-ascii?Q?Bjgszbc0ojUYnRz2zn2Zy9Kn2R+E7eoIq3uZzSwumCsQmVYR9kUD3GbMK4lg?=
 =?us-ascii?Q?E3VXnKAHLgYRU9bGMhNMh8Cm0MWVBx/4qpmbPdbH9WoCMuasOU8nFeFw5m1H?=
 =?us-ascii?Q?xTVezp0yeGp0xGWTBrGFgNPHfZbTOwdmx3FxJzhqKPeoAb5sJD96osg9fG0G?=
 =?us-ascii?Q?keBEmctV303HZqjz5V0cLZvsfvm0AVKU7EOIkTyJsutQb9S6fdefyZ26HAZk?=
 =?us-ascii?Q?gpV08dz6KFQSxPGLtmeEhglnQfzUeBso1jGMLq9hh6MFBa8lurl2tksqbuPC?=
 =?us-ascii?Q?yA+xb6RdIim47qitx8Lyyu7mXl7h+i60sfv2f7FS7372BsfnfcZzEjXXGLiN?=
 =?us-ascii?Q?s9Hjw7LDFjpfBqSFyfXmSXOsIOX+CA3j5o4TxdoKk0i0hPQhTnPQZBKzQft3?=
 =?us-ascii?Q?mAe+ZfqcGXD+sYFMktNxiN6We3rWKtfogIpapKcpuZUUdCmJmU+bY6CycVEr?=
 =?us-ascii?Q?1MDoxQKaltZ3GS5pwtdzI5aBLeyTWTzGmZb+mGHckkXzYbvf9jhPX+8U4mRU?=
 =?us-ascii?Q?ncqXHJXRMrqXApXb6R5Rj4y7u+DvF/2qyCQbzqJ4OIheQYnuryJwL3Cz0w6s?=
 =?us-ascii?Q?4BwJy7SKYgyswA74jWrizfgU/dpG60fyH0s7E0z0qtISRoZFEiyjqCB5Bpg6?=
 =?us-ascii?Q?NScML9JNHrhuEDbcela914zAPlOYx6Ap4HHJBQeT4E3jDTopxW4Kd8GNX7tM?=
 =?us-ascii?Q?JSt4e2/x0oGHdK1gbALg7qtiRzzxyS7qGmcDvnbaZcn0YPiZOQZiUtbn2ejs?=
 =?us-ascii?Q?QPAF/yNPfh5tyRcFZVo0envwUy8MWOAXI69Afgm12h1JyJz2l4B1WA92yykP?=
 =?us-ascii?Q?WVmKMidjbohYrJS9PchFoggwuCsj9Q4Aol/t1AVnkOsYT0N+S0g6utPyTEjd?=
 =?us-ascii?Q?I2kdXQZSJv59ncZP2k3pbKYaypJfPXGgTrhkAkjbZkd3gSVjVsfJH/5CWMvC?=
 =?us-ascii?Q?FeEcmnHJYDY7o86Dv7V3I5608jtrdhrzMiODHhLTNF4nXuv7HMeZZrk2cXZJ?=
 =?us-ascii?Q?K16tjTiKjLQrzTxlJva3LNT5GgH5J3tmiXMAdLG//gb5zyniNdH/rwoTcYXm?=
 =?us-ascii?Q?iHxtbcXCwg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7223e3fc-8f7b-4dd0-9912-08d9be194830
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:16:44.5490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9my8sQVMCVM05s91gYapAGR9boYyWvkuqN3SuAjCw/BjaLMLC4+U2mL3j89J/osSQCJkIcy2I+rPknwcT93viai092meTkWx9+y69Z3LdEA6WfErjyStcQIhq9jvKlvp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 09:16:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159613

According to Khronos documentation[1], gl2ext.h can be used for OpenGL
ES 3. Some vendor implementation of OpenGL ES 3, such as
Rockchip's libmali[2], do not have a gl3ext.h but only a gl2ext.h while
being OpenGL ES 3 compliant.

This fixes the header files to be included from gl3ext.h to gl2ext.h to
be compatible with (hopefully) all OpenGL ES 3 implementations.

[1] https://www.khronos.org/registry/OpenGL/index_es.php#headers
[2] https://github.com/rockchip-linux/libmali

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

v2: move patch into correct directory

 ...ator-Use-correct-GL-extension-header.patch | 33 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-texturator-U=
se-correct-GL-extension-header.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-corr=
ect-GL-extension-header.patch b/meta/recipes-graphics/kmscube/kmscube/0001-=
texturator-Use-correct-GL-extension-header.patch
new file mode 100644
index 0000000000..5965782de7
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-correct-GL-=
extension-header.patch
@@ -0,0 +1,33 @@
+From 2b74e0e32235f6ab2e3e42d53dea985a7ba6227f Mon Sep 17 00:00:00 2001
+From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
+Date: Wed, 16 Dec 2020 11:08:25 +0900
+Subject: [PATCH] texturator: Use correct GL extension header
+
+gl2ext.h is the extenstion header for OpenGL ES 2.0 and all later
+versions according to the Khronos documentation [1].  gl3ext.h is either
+an empty stub, or may not even exist on some platforms.
+
+[1]: https://www.khronos.org/registry/OpenGL/index_es.php#headers
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/=
merge_requests/26]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ texturator.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/texturator.c b/texturator.c
+index d9335d7..6d97856 100644
+--- a/texturator.c
++++ b/texturator.c
+@@ -30,7 +30,7 @@
+ #include <math.h>
+=20
+ #include <GLES3/gl3.h>
+-#include <GLES3/gl3ext.h>
++#include <GLES2/gl2ext.h>
+=20
+ #ifdef HAVE_LIBPNG
+ #include <png.h>
+--=20
+2.33.1
+
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-gr=
aphics/kmscube/kmscube_git.bb
index f4e6cd41e7..efaa962704 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endl=
ine=3D23;md5=3D8b309d4ee67b7315
=20
 SRCREV =3D "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
 SRC_URI =3D "git://gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster;pro=
tocol=3Dhttps"
+SRC_URI +=3D "file://0001-texturator-Use-correct-GL-extension-header.patch=
"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 S =3D "${WORKDIR}/git"
--=20
2.33.1


