Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B896A1061B23
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 21:26:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.126])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6520.1774905993932585099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 14:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=KGlNZSUh;
 spf=pass (domain: navimatix.de, ip: 52.101.65.126, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqYSQF9Tc586NBZ+zmq2pw80pqbdviFvZJJH4EFoywT4ioo5acgNkFtjltm1quN3naG6LJPHuIgIfIdRy3mulvFIxJBJxKIORHcNl/oXKiARmrQPQxn/ow8V4Vlsy4UhynEXPD8t4dARIDzN+SomdqGiO6sAVPp+vLdyzno3NErQZswYSvDRXO4+zLpLwNbGbk7qV5FWwujUSSUXFcrEQiZpJC1tali7/FyZkxoqygzDNRy9Es9CMWo9WY+BxuQAzHjqqzZh4VYulu0hmC/h7BZwPyF2nInn/FWnZxwiJPMFRMWjuHO2mI3olMjZkuVi+kjIcWUULaWpyDggn7o8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkmgH+zi4AVfH+Gny+glTT+Ox+J5YXYlRj6nTakUmhw=;
 b=RD8W9Y0wCh7UKEpM2ICwFSaeWAlb7Olakl6rnCZoPsG8K3sLimf8IY8oPR1cMx4OiS+I8EBSQm44GU+fVvcIDu3xM+6MJj6tFGr8GMtuqBUyxTQDYkSfkrGNqx8W+ic+4USU/0Hk3fpLch91p0d1IbxFAsW0LCxuxM67m46DVBcC44fcfW5vMc4holEK7R7onfEitRXgdDAwqiEmu4W70rFh76YWWb/zBpxH5Et7Lz25G/bKRAczsbJOKfmL4E9Sr7JdAgf6AVObXoKp5FIKJbQFpegR4zooZyYCZJo0H6FN7pxWCZaAb0JxmFHKl/O9IQO8d0brYZjc4iWI6jUeow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkmgH+zi4AVfH+Gny+glTT+Ox+J5YXYlRj6nTakUmhw=;
 b=KGlNZSUhbSPozmBFC+YRrGKSD9Th7qUM1XS3BETpgLiO/HFbxpwLXLXlBuNe1bO5iNlXqCnnkmpMksdh3P23yyC/du1QVtICzMYp04268I0HPCT+tLP71UKD2hgkhINEHH/z10dOasmIVOQiC2uYhnh6IUOpOzNDp1UEYcz6A50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM8PR01MB7698.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:245::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 21:26:30 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9745.027; Mon, 30 Mar 2026 21:26:29 +0000
Date: Mon, 30 Mar 2026 23:26:28 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] busybox: do not build SUID binary without an applet
Message-ID: <820f2da115d925512984c0e8b3a133a51d8367d6.1774905987.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0391.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM8PR01MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 29403cfb-962b-49b2-2af4-08de8ea301c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+dgoO2zi4kXgpxdzDntULY56qbG1E+mV4cWsjtkVI3BF0cMvtjbJm9laNa5pHX1Nm+9RjaN5FP1t7v1NYdzov57icPanZgt48rZ57Bl16ChVI2BAZoZo5snth8+7Ab1F0b6GMEExILMvVPDHl14QsXw+UkuUzajOLylYzbv5C9M7NHi+I9x5vxg3sZcghoBMgx4SlKIlG0ogfdfMyFTgKB/OgLqXGTe4tACXgknnFZyCGWLIRXpjUaQAQjJIUi7ncFmvR86m6WcmtLPC27eD+I6t1GEEkUt0Ao82Md//AWhivBQtYwgk0k/G206zDouTQ2T1nGYSQmmniDval9u/79jLJM2URpBQTW7U0o0nayCPC7o2D5dm8LX6FHAQfCrPWMAnTTou4LPQjnzeUW+1DHAoi5hG5EyR873bgKyFob3YenAG1by9LPE5ZY8nV57H+pRoRsVD95bZY27Ur9EEzWjnsvjQUW9VXTz+ZlRHyUgCX9038n34iLYq0jcGJGNrQVDOImlb0pkD3mKbqyBprklJ84FDluliltK3N4++XT9FdlDTpCeZSQdDG1Xfu3SwLv4LPCnPh3je/7kss20qOTVsA6Wza8tGUJD2ar9oHsF9lzP7yon1Aqa22b9Bt79YtxQfgohXcXooR+k6UijqnrVoFN3+CRYi90wMIjYjRi2EetnAnKg9ZiDOkIt76cOb7/dhbirgx7Baa146RCTUHr+RYgolRW+nzIq0EKtnxMY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k8i5BYM8zYJoigRnc5pzip+7PTl5VWcHNx0WXP8dhH/nhwqYQZryh1RLkE9+?=
 =?us-ascii?Q?VqpLeu2/O0wllKdS3bUk138nJHRUgpMNVvsEaVwrgnfFBduchMMFRdxH94LE?=
 =?us-ascii?Q?U3X8jZRV/hJI7JrVkcwlG2SkfPWHx28adZ3QuFs4H7TYyfFIONpwHvDO7i6E?=
 =?us-ascii?Q?ICpn2NDeMtgNZRo/IHoshP81sG36TPYjCBmkrNqxa4cW7NnNwSUr6UIwGCFr?=
 =?us-ascii?Q?zSXq6j3ZwkKEXsw6dVAcMm7oSFCFYW5ferjAyBlQ3eYLYbu/+NMZ33/JMutd?=
 =?us-ascii?Q?KESbS8HfQ2RSqm7DhN8qAgS+iJuBBSWpjvDpY1fNfWpvF/gbTNpAzjVW8za3?=
 =?us-ascii?Q?z36rwztf38D4oLSWZ9Xowdl99bVxZu+EIHw7TwlmeK4IQJTvkI2N1guWfTgn?=
 =?us-ascii?Q?pntXTYQZ2yXzpiDdGAEsHWjr4dcJ2CPQNHuTGFmV8+Gxzrvps4bh3Yh0pm41?=
 =?us-ascii?Q?52p7aFCqGhIUcd04pjO15Rfyy7nIObPkAgL2XrJqmsOn8H3qpayVe1kdXBNw?=
 =?us-ascii?Q?7zxb9UwCPgE0yV+RHziwDguQfgp1EkrLSMnGcsyEaLQoiQvpKsABiH3fJzZ1?=
 =?us-ascii?Q?dz7NwbTe8L3QNT51rgBYTiJPfk1YU1ATkGl7CppfMKjcIiKui4y3yYo769xL?=
 =?us-ascii?Q?qCbBG/lXxJMuhE43hGDjRPOrQNqNM4CneIonQj/BDiT+OKukEzG8MzsvCDQF?=
 =?us-ascii?Q?46uqQrud9p7QdkYbvBQ/rOTe5eckmxJC4IJVdA/QCMwErjOMxQbKipwQchgR?=
 =?us-ascii?Q?koMdmqb7Oz1f5+EkDWqgk5dNbxxu7SAuSotRbvgM8Tv47prq+iSagLHDAvQB?=
 =?us-ascii?Q?BZYjAeqSBs45SGueoBqOQsgDfMGn6E11PG2WhFQa0FVrT5/n6Mz4AqNE5whD?=
 =?us-ascii?Q?z8e+McrrLdGrFth4FiU27BLci4sK4zbYEZsIk2+tl5tzPdW4rGJS3CmEe8pL?=
 =?us-ascii?Q?Wa0v2tdXlnBf+fIemeE1C/WGsYtFyteXKSTd3nP2M0w0/hFDGS1yg/xw57JE?=
 =?us-ascii?Q?0Lw3Sv+CT5zrtCJEDp2XfSiMq+jBSDszYhvfXl6G4SFfKC/XZp5KoDqR5R/t?=
 =?us-ascii?Q?3QVFx/LkfaVrL4POB08MV+WI+53qGaU0OyzWJ0Bdax0Ro2QSajv5oMXgFnqA?=
 =?us-ascii?Q?QXTdpzzDqN2LO1nPJwTJ4ucfPuVVOmCSsxjyPis3X9Tanb8PcoWsl17nl2LD?=
 =?us-ascii?Q?UU+T33xQ2jFbwltAo4+1T7KguwfOkKJiHC/6Sa+BAZElQnbMrYB7jt5smCg+?=
 =?us-ascii?Q?5JeuPLrUmq5TtSi9xNyr0e+I6pfXxZWsHrAZLbpbzZGLM6odSb487WiJvWOm?=
 =?us-ascii?Q?+FWcftkQSf7Oj92WWoX3SqG1VlHPnLIViSBJcwR9u1sX9ge66/X/D9pIGkaF?=
 =?us-ascii?Q?y1wpWy5gkROjnZpAz+pkjUKNRwtvMGJlCCG6jxKjpGh9xs1yVo1KJ4WEsU2N?=
 =?us-ascii?Q?mUaHuYMMm0QZV+e7tjHBpXTrDwkWjvg9TvL9ixmEBYpGgOonKz2oWz2Y7Y6b?=
 =?us-ascii?Q?l65VEuWJB1s1YIiLgoLpQi46UU3VVDH3P5zCNMX9kmilNvU0UV9RE5Fmkmhq?=
 =?us-ascii?Q?Hvw7+lwWjte2KwhHMg62d1RirEwCxgn2DP9lsx70EsqLOYExR844+mPGnGE8?=
 =?us-ascii?Q?PSV9yFoTGxQvFePf0gcHTgbBc6Ch77pnxG1SxSOJ9Mjy4Xz5G3EFa76H6Tqv?=
 =?us-ascii?Q?9Q0rrFzbhfWkuo+kaXJFXfJxWbXh1g/qgZD/RHxN6Y1eNjV+igtfZoIvv+LO?=
 =?us-ascii?Q?nq+VjxSWdk7JnG1rtQnfHAAb+slcg78=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 29403cfb-962b-49b2-2af4-08de8ea301c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 21:26:29.5604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QMWLOikFgPw/mn7xlk7X9W3na1I8Bw7wbafaVaniahXi11cAT6ratppEaON0zQ/+JlTUpfLatQaEsveuir31mcOmNwPiHbIMcxFtA6o4dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 21:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234258

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

If the merge of all config snippets leads to a SUID binary without any
applets, do not build and install it to reduce the SUID binaries in the
system.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/busybox/busybox.inc | 31 +++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index 355c019738..be11264459 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -172,6 +172,10 @@ do_compile() {
 		oe_runmake busybox.cfg.suid
 		oe_runmake busybox.cfg.nosuid
=20
+		if [ -s busybox.cfg.suid ]; then
+			with_suid=3Dy
+		fi
+
 		# workaround for suid bug 10346
 		if ! grep -q "CONFIG_SH_IS_NONE" busybox.cfg.nosuid; then
 			echo "CONFIG_SH_IS_NONE" >> busybox.cfg.suid
@@ -182,7 +186,7 @@ do_compile() {
 		done
 		merge_config.sh -m .config.orig .config.disable.apps
 		cp .config .config.nonapps
-		for s in suid nosuid; do
+		for s in ${with_suid:+suid} nosuid; do
 			cat busybox.cfg.$s | while read item; do
 				grep -w "$item" .config.orig
 			done > .config.app.$s
@@ -206,7 +210,7 @@ do_compile() {
 		fi
=20
 		# cleanup
-		rm .config.app.suid .config.app.nosuid .config.disable.apps .config.nona=
pps
+		rm ${with_suid:+.config.app.suid} .config.app.nosuid .config.disable.app=
s .config.nonapps
 	else
 		oe_runmake busybox_unstripped
 		cp busybox_unstripped busybox
@@ -245,9 +249,13 @@ do_install () {
 		# can run. Let update-alternatives handle the rest.
 		install -d ${D}${base_bindir}
 		if [ "${BUSYBOX_SPLIT_SUID}" =3D "1" ]; then
-			install -m 4755 ${B}/busybox.suid ${D}${base_bindir}
+			if [ -e ${B}/busybox.suid ]; then
+				install -m 4755 ${B}/busybox.suid ${D}${base_bindir}
+			fi
 			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
-			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
+			if [ -e ${S}/busybox.links.suid ]; then
+				install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
+			fi
 			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
 			if grep -q "CONFIG_SH_IS_ASH=3Dy" ${B}/.config; then
 				ln -sf busybox.nosuid ${D}${base_bindir}/sh
@@ -388,9 +396,11 @@ python do_package:prepend () {
=20
     dvar =3D d.getVar('D')
     pn =3D d.getVar('PN')
-    def set_alternative_vars(links, target):
-        links =3D d.expand(links)
-        target =3D d.expand(target)
+    for suffix in ('', '.suid', '.nosuid'):
+        links =3D d.expand("${sysconfdir}/busybox.links" + suffix)
+        if not os.path.exists(links):
+            continue
+        target =3D d.expand("${base_bindir}/busybox" + suffix)
         f =3D open('%s%s' % (dvar, links), 'r')
         for alt_link_name in f:
             alt_link_name =3D alt_link_name.strip()
@@ -406,13 +416,6 @@ python do_package:prepend () {
             if os.path.exists('%s%s' % (dvar, target)):
                 d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
         f.close()
-        return
-
-    if os.path.exists('%s/etc/busybox.links' % (dvar)):
-        set_alternative_vars("${sysconfdir}/busybox.links", "${base_bindir=
}/busybox")
-    else:
-        set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base=
_bindir}/busybox.nosuid")
-        set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_b=
indir}/busybox.suid")
 }
=20
 # This part of code is dedicated to the on target upgrade problem.  It's k=
nown
--=20
2.53.0


