Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C2CC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:16:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26926.1786648589065447847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dcEHt0TH;
 spf=pass (domain: est.tech, ip: 52.101.83.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whZC6jKk5aw+5XX0rDMsllA7KHGezqkz/iLVh3FNbrxKE/vDH+Hkv1z7Ty653MfJlSEZyUZwor8nUTUjWdeVcsI6xNXNayZDBDgK9EFNEm4VNasp6vr5UJRDvL0Wg3uFh2qg7xVchtOxxhuyfsmu2wCfV9R6LdTiUKtSYSkAiYIWBzlzZxdBlAh/ePSw16EmOMcdh0cDN+bMx8dzA0MrJwObbZe004CVHq1QF0BPAY2ITW54D7Yeev8aaIAosG6THRf0bWwUhBJ+tUBPDP8OXCOMk5aPo3ppa2zNNVGgGq6l0LpGiS7AbcqTMNgYPpm93pYPTeAG3S3iSCkLnxIj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ2LvawMP/+eB5dodhDdxG9LY98ysdCZ7ok1EwI1j5g=;
 b=KcZm7HU84zddqm/wAWDw2eBnVqiofhAfbt07azln6i2dnGpilbfv8JhC45Ks9G/4pyZV6wV5iJBZd+cUVy/ivQm96tlNB7eEiWI9DF2FbqUWpy0pu0lh+j0nWsA+nsc2ILOTVscDUg1tHZ5Z9G3fLnjDmYf7rjx6/Xc0iUF3ZHEhf8Yuf+gdT76KeRaOqggsGiHf4EfRGGst4XGKUY+qjTRzpocU8SyZpuSUlcy0U5SAKAz/xJa7bhJSWiR9iY9+ntJG3bzZga6q+A6//Lf3EkYVCXlj5eOTBXYwDHwWg7dbuwVx+xGg23GpObHawg/9XfxFFOKEsIx05C2mLun88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ2LvawMP/+eB5dodhDdxG9LY98ysdCZ7ok1EwI1j5g=;
 b=dcEHt0THSrDgojeiSgz4FaGXtxujqiwEgSK1po+VFB6CTlWI+jtP/2rl2HBC+pOQyVNxo69zNexeYhvIE+A3ZqxtisjIb0vuXIS6cEfgO+SSHNNeaxSATb6gCDhjFn1qIKa9ibugwaFvKNk/J2c/O8mUcGeccoqQiyYVO39cFJX1HCKojAQozeiIGMA+M3fd/KEdGrjFTdUA7vMeZUMO/Pf5OLjvD4HanFoXOHBsEa1JdUdBveda6Jk7v/Zwhz73hlgG0yNgafYnMLmKWeYuUFPZFs7l4kYPzoP4vzwr/WkFWXfNp1MvgbtvCjEdVMrRLDhHYDs8hOIcoWevh+7RdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB3733.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:16:28 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Thu, 13 Aug 2026
 19:16:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 3/5] classes: fix trailing whitespace
Date: Thu, 13 Aug 2026 21:16:13 +0200
Message-ID: <20260813191615.34122-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0266.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::29) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV2P189MB3733:EE_
X-MS-Office365-Filtering-Correlation-Id: f28f97e9-0a6c-4133-eafc-08def96f6007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|11063799006|3023799007|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EAcaqBfBSivv61XiU3Bc48TxQUD3sLaMxB5Nf/dgGaN9BITZn94A9OvNtknMNtcMrqvlSPbn+4q1sO+W3gjWhj/HoO6wbN7vgXmTuW8g65oDkO9CYzLVYLRgcdCP/O/PiFvSPGyBvAgAulhWkbUXKppBEa60YUArgUCNe2wvKfMgeLEmN22cqtQadc4AN+2MAMxb8BPBvFRy1LJBg6VTb5lgjhGjMW5T8GFYoPYCITKcsaYB1iZjRWZHe/7C0YR7L4/KOgiea1Zmh8ov2GKAeuv3nB+e9FHZYW5FIaj9V8JLvjcvKBbMpnHLBSSGof4XDCnVUayCyqk8eI4FtFCizcMZezmU+Ul/hnHMDqXhMmvTBbl3m7+pj9tm8BpZy3CkRuWos46QLpQDbarF+J2KaOQIKklK8i5ByhFvtTC15qKcd8ME/Qpwm52cOkfJCThuRffrACAPoEW35uAoiVWe047MpJBMfmW47l5LCLZrbINZx5tOgzrsOSlK0l4RiO3KCd4WGxBWpDqBtGmMuBYec5VNNLbAVNPPp3IHcR55+OlQ7Jb+0NRmbTGDW0QrO6hOAShkhadq6pL9Vo3hf9EGTCg6PEo1SEfIIvwitwIxK7QSPbmVpb7l5RXvlRSp22gnQMU7MarzEWTAArzYXUAiZCW3cNFaDDOzt6DOXVTjqrk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(11063799006)(3023799007)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PmqNHsy7i3Ywn9QuOzJ9m+Qqm/ps6OVDEd3nWoXSytkWP/fMJhHsYInZIvI0?=
 =?us-ascii?Q?Z/VzFZ7i8Bpn+ZkDoKK9cQn02gvgquM7o6FdNafVs8gO6bMQ5N+9jqihdnXE?=
 =?us-ascii?Q?Y+C9B96PYaInb0KbVSV2Kuq8bKDp2+o0pls3iqPyrmYlsCtVtmST31WCTFK9?=
 =?us-ascii?Q?k15giDiAewd8K8I967ZVhg5of3jws4+AP9xQXgQgWow8wLCb853gwg0r7GLD?=
 =?us-ascii?Q?7Uuh3Dg1nE0h31EVWZZY7wPComf1Rlh2B0RO2r2HZaSbvoKmSH0K7Kqzqsmx?=
 =?us-ascii?Q?zVLwT6x0CUXQoi+3kbd3NQ4DCBF9j82PcB230F0xJp52huOYJ7huACfduXU1?=
 =?us-ascii?Q?gFNDKTJm3orF2EaH3KWeMXWsmx0J8RJVoQZ5gNvyGFITAutscePhTggerBmh?=
 =?us-ascii?Q?9NGm+TGjOgimqe0ggoN+Ra3aupS6KPYbvG+B8f7e0xn/KMxEQet1sVYLR8+l?=
 =?us-ascii?Q?JJ+eFtyxewI1DfgoC4EST2r1TucWL0ItPs2iFKq8g2LWYwSTj8K/IUzgpfiI?=
 =?us-ascii?Q?IwObH7Xi2NELazzfWM9ktb3KFgj+kiM913HM8xztXkzuWOp0YkghFTtnSjZa?=
 =?us-ascii?Q?krhW62BDpSgYFDBVrdkRZ/QPSDm8i2R7mcSHgp3wqBgsHXo7Y+6P/eLnBh6Q?=
 =?us-ascii?Q?U/rqFWH7R1Oy2koSwrWARj4ejWxJZ51LY156UMnilLatxPK7tl+HT97wg4/T?=
 =?us-ascii?Q?okk9hQWQcfERavK2YwVN1XvvIo34HvdlPZEc9pHOqFkE40yng0DkssfhS4Tr?=
 =?us-ascii?Q?SW/sPfEl9GT5k+jf5d2Y2S1kllK287E+mMGXUQQWQbQwOqiuXLs58dLfSULO?=
 =?us-ascii?Q?yd/NFrq3AaAMHScHQsfZMDGa//CwlPk/jDdWHX4mgX1t4hgehYNJlLr5OsN/?=
 =?us-ascii?Q?pmU0JPF/DovEqBnrhf2PaYQbBWSqjdAEClqIOd3WVd0EEnDLVyDCXRCSz3ip?=
 =?us-ascii?Q?8K7lGkVpPGerawp0fp44C1jaAAYLTeEbfnvXt7TZAt8M8yIq046aCcWb2SsL?=
 =?us-ascii?Q?W47/RLMmwKkyDtze6271pS2iqGjGiDZgBc/X6MlRSq0nPKnIRIvWYei7A6Wp?=
 =?us-ascii?Q?6nMmEKXpk4hV78K4/ICopUKjgGyLkUu9Qe7d8W4nOb3c2HoSo76YFxmMv21W?=
 =?us-ascii?Q?Um0lHCekuaxWUvQiGNXCsvZWu9BOQ1ZI8SfJ0v2BC/M97WCxMSjbNJLbJOR0?=
 =?us-ascii?Q?N+GHJaB9aadOQAUnyz68wXq88absR4IMhXnZjqIJPe4JfDLThsEws2+H7U7+?=
 =?us-ascii?Q?DkbJJsRr5HjftcCB68I5qoHON01sFyIIrzTQMWuxQdAkx9nbvXh+jW375Wbx?=
 =?us-ascii?Q?CDYi7+axgwXLTw3/9aiagasMcjoc6qhehiHRhuI4A6OCI/HzsK/hNq23hu38?=
 =?us-ascii?Q?z4eFBY/Tvapz9OWPch02XFxT88SFU2hbwcz6lp1JgvrPgWO9QyRsZFyhasGi?=
 =?us-ascii?Q?P6JcPWM6jsHoX2zi1+2mo4gUElAzFvWrntyqIp/RGLsLYH2iLylVnG/YDyjP?=
 =?us-ascii?Q?Lnh+QeSw6q9kxCloa1mmiu4fbcFaGEhDB6LfSn2i7MA7IOCct/ji76MYi34h?=
 =?us-ascii?Q?cTNt3Js7pM7IzZiEwoKaRpCo+Fx2fmfWoFr/fSEso6LDaFKnsuPN9AInXtEO?=
 =?us-ascii?Q?OJdNGGGDFAO8ndol0Ai5ziWjYV3RBEa5r2KYA3srcSg/mquio3LUe+vjVzAJ?=
 =?us-ascii?Q?AT7M8K1ku9MsNgZG5I75nlSzOxVCTtvzygNCUzD8ATPPDLXQv9iTBf68oybx?=
 =?us-ascii?Q?tlVweLfsQRPNPQzxWV7l2D3oPlqBmcDw1BnGN/UR8A3QBDEn1DN1+V48QpG/?=
X-MS-Exchange-AntiSpam-MessageData-1: eIz3xLtNcFmCM1WLODxaPacPP2mcBAv84P4=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f28f97e9-0a6c-4133-eafc-08def96f6007
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:16:28.2203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POJFHudltR3v7N4GlAHQtsIAYxR6YM1jCSpxVw0597sPPNxVXOra86l/iVrJUBSjQW9BGyTNZ6ivhfADAmflNUWmsuaF8Hl+uFLxW+EDN34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243384

Fix trailing whitespace in classes bbclass files to resolve
bitbake parsing warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes/image-buildinfo.bbclass | 2 +-
 meta/classes/useradd.bbclass         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buil=
dinfo.bbclass
index b83ce650ad..01636dac65 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -9,7 +9,7 @@
 # Usage: add INHERIT +=3D "image-buildinfo" to your conf file
 #
=20
-# Desired variables to display=20
+# Desired variables to display
 IMAGE_BUILDINFO_VARS ?=3D "DISTRO DISTRO_VERSION"
=20
 # Desired location of the output file in the image.
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index e9e835e1a2..aafd996fae 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -68,7 +68,7 @@ if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" !=
=3D "x"; then
 		opts=3D`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
 		remaining=3D`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'=
`
 	done
-fi=20
+fi
=20
 if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" !=3D "x"; then
 	echo "Running useradd commands..."
@@ -132,8 +132,8 @@ usermod_sysroot() {
 }
=20
 common_useradd_sysroot() {
-	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_=
setscene) be running=20
-	# at this point so we're explicit about the environment so pseudo can loa=
d if=20
+	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_=
setscene) be running
+	# at this point so we're explicit about the environment so pseudo can loa=
d if
 	# not already present.
 	# PSEUDO_SYSROOT can contain references to the build architecture and COM=
PONENT_DIR
 	# so needs the STAGING_FIXME below
@@ -247,7 +247,7 @@ python __anonymous() {
 # (groupadd|useradd|usermod) parameters for all USERADD_PACKAGES in this r=
ecipe
 def get_all_cmd_params(d, cmd_type):
     import string
-   =20
+
     param_type =3D cmd_type.upper() + "_PARAM:%s"
     params =3D []
=20

