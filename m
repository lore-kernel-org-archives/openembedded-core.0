Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED2710F92EB
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 18:24:10 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.776.1774981442850143640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 11:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=WNvmLPAB;
 spf=pass (domain: navimatix.de, ip: 52.101.83.74, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUKymHVxWhSFxnfQzZiKKjFqf5uWQkOAN+WoE8L0hU/3epEubCGDhv4vH5s40KY7hlYMliEvxCPgrlCayvKCk0zUQ6RtG3GikTe6dq7CCiBdesfd3CgX4U5E2ALzJSNb8i8QsC/SsiIwD5pRsENzHLzuR/ZwOsLfJJz5ZyWBhQ/HKJ2e0rMgxq9D4lHhYBX6AjLAnW35Jvsl7SbdNdS6idHlWyiW32H++w7WJTxy7ZQNNcEymu9NxtY+e6RJ7TB0DUaae71S57ef4Xud3T3XkUqWnh10+5dalYJ/lExgJ2c19vy1RBGVukZBkUVyWD4NK8tUT4Pppi61mRyQpBY+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BnZVeHLZZdcVIGJ7TOXiPU/Q4zm+hRK1BWuDY6WGiA=;
 b=ZlL2BduUoV0kD1L5iULmxXwgIuA9R7oUGHbkSm1vbzI7MdNyeH84JpF0msYTd+AfB2j8Kd44zwRY8Q7qMtFJuU2xZ0wOpZPYRTZQAjGaiDsVNKKJel1SPLWlN517cFC+E1+NM+AsOdYrCBhpHXeyxHWpnzSRNFNZC9JGPV85Kgw1AhlMMbLuVUmLNLB9xWAWFPB2wHmN7yf3yeqcgd9aKWBD+auEupA9EEUcfCF9RuPNne3/i2SYSf05Ok8CeH/ouhXMPl8MrH4P63nhx6ke07dGAG3JCEVgT+gOyBjtyAqha5oyKMB0HlTLW+sMK83zMvl2uwlSShxOAR1mwUP6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BnZVeHLZZdcVIGJ7TOXiPU/Q4zm+hRK1BWuDY6WGiA=;
 b=WNvmLPABCxmTltm9n3UWE6cbMpUmR+zAlamJm+u6LDD8bbK79/xkndU7FeGwZ7ch8X3ftNXm+kaY1b3ZwaKByrOz6G5t0ZHWFPq4AjV/GVGcI2DUtK+4OOD+f6MBXpgCmqHbyeWC3Q3blFqVwbWZv6ovQQUUhqqNRdnYi6hcs8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PR3PR01MB6969.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:7a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 31 Mar
 2026 18:23:57 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.014; Tue, 31 Mar 2026 18:23:57 +0000
Date: Tue, 31 Mar 2026 20:23:56 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joerg.sommer@navimatix.de
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] busybox: do not build SUID binary without an applet
Message-ID: <25e429ef284239f19a28a07a25ac4979f01b15df.1774981435.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <DHGTOWJ0KD3W.3GQN9EX1KPGN@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DHGTOWJ0KD3W.3GQN9EX1KPGN@bootlin.com>
X-ClientProxiedBy: BE1P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PR3PR01MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: b04fb058-3426-465d-70ec-08de8f52ac5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	aR2XvKOU7JMVztEq0Q7UxOnlR/jH+OaMCFzjqARb9z0EDn2Lk9xv7MXbJ21//k7fUEJ6vD+gtjLjKw9Xqx6Gz3j7/sJcrw3B/M9Wj+tCqsywp+EhMCpMmvowjs2mckvksXKL7auNhYdQ6f9QDPqqzDWj9fC5DgGg9HQ0nv0GBPUnNThvuot/QyMN0CWPHColrO3pqUMyJaBlkWd5jZ/FOvA2RO298uC8xWhC8bwmKL7CBTaBcVE4HzHh10olMzs1IOTUpPDdhx311snvmbHoigY+T8huzOljfIbAcJTan1HNHe1rzTTgDafeFcJcmm7jke862MEzUbX4I3uLZ0R04dEsSPrdIK+AXhll7+ncWbyUIT7XDZN0k9wTK53Jwv2+3dR+ijoH+3EhctI3/bu1CtB2uz2wp+q+x7vEBESmoPLb0wXQ7WEAwoqgA4+cwfPQ6qUiGu7YTi2186oSiFOPDIDPbi0SRSz6wWGf32oY9wMM+SnwblFqtGwYHzZopC/W+AiWhp0kO6wfQgHNAqkOhLPgUWHdoAtKCDqKtOBrkjmoiWWly6/GGb++80KVhd7yvEnZzt7tXzpSXcX5w3JTp2+3CV4LEZB2Z2Y1SAgNArZa/H6EbYUKGNM+OK6ngHNMYm3V53Ct/yst9fJKhfqTShzbzlPJOdkUaVKefMW3vuIcxa577jS3s3dDB7xSfDIHJyf4X5RZ9I85F7XqWMDUp8SZ3DEF+eCYpdzVdjLTHlA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ltvgysQsgOtyjipiL2CUo/CCJLfc/LMQBfQZZxJt9NBAjULj8YCzoGZF09Sv?=
 =?us-ascii?Q?tPlkmj5M8aZ1XNJDDDyW2Hja5+MElzRrNHSeqgRJu2W5CS1WYUM47oMroArH?=
 =?us-ascii?Q?2eZluvMGMwVXyGRK0/KktxkVkT4mbX4dEg01KZkvGYF684A7Vzh/GMHF3Gn5?=
 =?us-ascii?Q?fFegmkklmgSgLPzF4Ih9mDDhldhjIdDkh/lz2mNEUbl8yrfesKeJ/H6/v6y2?=
 =?us-ascii?Q?gBYbECOiH54IVxFqS3rlKWhIWHYeAJvi3UJ+TBQs/iPujNEYSm5NnzVnjoMH?=
 =?us-ascii?Q?pOprZ9ad2oAcLOlWU886E38vS0lAHDlrbCVMBSfKklgiGRM5xJ8ynvgwVWWG?=
 =?us-ascii?Q?y2KUehT47T5HcWKgjiksN8B7+5NOm0B7O3N46F+NeQr/+GW1mIa0HNmAuaK6?=
 =?us-ascii?Q?L8kKgkKpv4QRCCYHUHr4zOfsgXwZ635TdQwUYgJj5xPeIlJOYF3KWVYzPML1?=
 =?us-ascii?Q?0+a2j/hdSgc0lNymCacaXJFNcKqN4ASsg3iGl27GXmU7wNvUaYGG5q43JQx5?=
 =?us-ascii?Q?dM0rhgqLXnAEzxaubWoIvR640cCYtCT35cebB5RyruS1U8UtsCgfv+ccckFf?=
 =?us-ascii?Q?K0DHddlVk8BkhlAmdUJQM2e82fLxs34GE+cVuqM/ZtnV/piFoofYrc5Qk0kr?=
 =?us-ascii?Q?SPLq34p6OtMPZWmChYHafPbfCVEDYjX2YKpVKpYiT9YGa/9eMIRpmkA7pi21?=
 =?us-ascii?Q?d+2oz+VVlrYfxpaLXI2z+tBtCqBrf5bVV5FqgRLXanuVeR8ynNFZ54huBaLs?=
 =?us-ascii?Q?4znWIESYPcTuy4ogtSuVaVkcReegvs+LAhMvD1XTT21bRDM1QCz96d4/eNIO?=
 =?us-ascii?Q?vh3+vqHeupbwiON+bhHe3Mpyuk6yFtQi30Ou3+D9FsVZGsj7WKQd6K6xf5QI?=
 =?us-ascii?Q?B5qpDkb/+5LPhm5GJA8wTt8MHve/NCCxiIlTQumHcYT08oRiX6WqMfZxysHa?=
 =?us-ascii?Q?IeVBEN9G5bAzmjyTmrvmgNj4kp+2u+Be7GbV9PS0E9Whv5LSqVND14/KkahK?=
 =?us-ascii?Q?zM23DZrH/rtYx5uFSAAl9bNdawWcMYlnoBsxhxqW3j8npmtbvCbKrGZ00ejb?=
 =?us-ascii?Q?rG3843x57lnQuW64VLrWjUCBPN+mKhKj9rdC4FIDVDOCkVukPa5PRhU7p5SM?=
 =?us-ascii?Q?k7OvEIL/5PUT/oH1086qKMmWIZ/DrtXsNy384MEq0BIbJ4SqGcvQh45GZe7A?=
 =?us-ascii?Q?z9t2bcSVHbLNTmPZ4azJgD6BMm/tQ+iMmjYWsin5Omz//HBOe/XgZxx0tQ68?=
 =?us-ascii?Q?6OfxkunJpIdeHZ4G4SIw1aO7K1Kg9TmBKtWHgKqS0IBzGRAcfdugF+efc/mI?=
 =?us-ascii?Q?65MntxrXMMvu6qnGhlHFESdTXztOjwtT+UHTlcKPwC24AETgaGWjriQHwdnm?=
 =?us-ascii?Q?DFlLVHiKIxnhBggxNKZWt17ZEDzJYdUPiGlt3YUmdR/DXToUIGCaJFQZZKt2?=
 =?us-ascii?Q?XNvwMvizunIejWS5H92X2ZIqmBSEU4bBtZXXTzr7sz/8GxMLq/EfzH27MZk4?=
 =?us-ascii?Q?i3pqBeLS02JIC9BMhs4r63rencVok6EFlqw3DvXs1aeDPGZMZmZbmqVYuVaL?=
 =?us-ascii?Q?f/YSPo7D//Dh8g8hOmN+cSWBs7u6efcNUYMzoiFJUk9qP50F0NyX1+WO7NhD?=
 =?us-ascii?Q?dqZi6X6tf0rqtorz424pWXoA4ayMOsDKXFAlcAlyrBf1I5f1NS7a82UxPv6v?=
 =?us-ascii?Q?PnxLuKVBDIzxVb90rfSTtqMPgx4v6JjrfK+rsRw1LegpiEcazi9cGr1Puk74?=
 =?us-ascii?Q?K+iQToQutohnDlRg84xJCpBmwyEvncA=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b04fb058-3426-465d-70ec-08de8f52ac5b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 18:23:57.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJpYj+z4LAf40/365ODglVE52vMwF8TMrI0lgsvEmdD54YDTAp9R7XsKeoDA5LslYD8dzecb8ZBCXkw2ZgFLGtKTR5dq87iemHfDMerWOK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6969
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 18:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234306

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

If the merge of all config snippets leads to a SUID binary without any
applets, do not build and install it to reduce the SUID binaries in the
system.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/busybox/busybox.inc | 35 +++++++++++++++------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index 355c019738..e03960a295 100644
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
@@ -388,10 +396,14 @@ python do_package:prepend () {
=20
     dvar =3D d.getVar('D')
     pn =3D d.getVar('PN')
-    def set_alternative_vars(links, target):
-        links =3D d.expand(links)
-        target =3D d.expand(target)
-        f =3D open('%s%s' % (dvar, links), 'r')
+    links_prefix =3D d.expand("${D}${sysconfdir}/busybox.links")
+    target_prefix =3D d.expand("${base_bindir}/busybox")
+    for suffix in ('', '.suid', '.nosuid'):
+        links =3D links_prefix + suffix
+        if not os.path.exists(links):
+            continue
+        target =3D target_prefix + suffix
+        f =3D open(links, 'r')
         for alt_link_name in f:
             alt_link_name =3D alt_link_name.strip()
             alt_name =3D os.path.basename(alt_link_name)
@@ -406,13 +418,6 @@ python do_package:prepend () {
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


