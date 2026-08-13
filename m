Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0285C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:16:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26926.1786648589065447847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aavvUqn1;
 spf=pass (domain: est.tech, ip: 52.101.83.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSit6RopEU0jpv8TMnwbPvKcXWQZwA03JL1nTHAea+dVkW6wnuIaaUPfqC9V6kNruUH2uXAqfDvE8CdSaYDvNZCHL8Yd6f/JVrgIRvK4zErNdGBRTyznnPU6GwzkHKgaNvGC3UqpoPYGltl0cQOg2KjgGiRZscMPvnEcLAq0edGQfhgSliP9Q7SMRs77jToRgq1IbRPIoqhpseM2bvsQJatyCcG6Mrn5aIHfYdZOT/aGQfOOd8p6qxNAROI3sPNIT871SoLsUMcFizD1hDovY3p3jyKvTtEo09c2wEhEaUaSRDAUg6aE3jqkslZQmTWoN0JpQM72rj6nspWlY4JOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igk8YpCUDjkqmRyMDnDajt7XDyfxJxuNGDCjWbpQzHA=;
 b=pBRJnlMKlCw9EChUqXWmd0NYBbzm+qzeyimZAosU1qYIHOouVv6B+SbyOhyfcuc7m5Qy5AGA7Iit1DUndZVx9anfLITRiKJOzhzBOf2J7/eLjpR80fnnVbYESKd+9pW06Mha1UW9w9jpmAZjSNQctvnW388v7a5DVEmAYoa83aMmf4hf3BEWe5xWtccOtc+ukjQXowC8PG3G+NE6TVatcDLL8odwfhTWBkgT9zIwDp8J4/4UOPLfc81xQ5H9BSTtLmg15rVS/iuC8XCN7IKpXGhSMSWawXm9Wrtvdd9Yk3zWbViN19jkQtZATXIk0VZJ+iAxDJkpgM81n3TF+4vSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igk8YpCUDjkqmRyMDnDajt7XDyfxJxuNGDCjWbpQzHA=;
 b=aavvUqn1/+zAS62TJEoyOLuRjQzG6fMnJmrHXLI2oGM0mu0rsebzcgn/hjXCD0uzjI877kyYBsxvBIZHNB5noLp/KXqT6uihv5+4JJxn0O/vxiBjQJquLrGEMDMZv70cf3dpwQeBH3FvvI8MX62ua5hXutJeo1pOdxDNZLcQcE0BZFI03K9ILKO7O97PRdKmjUeceIxLy7W0dFYhqQrUHyjkuMGKiplg7XIdpBBzRGtFCYmPnr+dBgTnKnblDOsk4pJJ0mxKQHegwlY6yZkn1DbuK5ZS6pbRqpv4zRBzyXyVJ3LsfoIS2AyRLq2EUg89941fvDDSybANyUIynN7IXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB3733.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:16:26 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Thu, 13 Aug 2026
 19:16:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/5] classes-recipe: fix trailing whitespace
Date: Thu, 13 Aug 2026 21:16:12 +0200
Message-ID: <20260813191615.34122-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0279.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV2P189MB3733:EE_
X-MS-Office365-Filtering-Correlation-Id: 905fc6c2-76fd-42bb-1354-08def96f5ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|11063799006|5023799004|3023799007|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	kYxNN1QQM+4lmOoVeE+DYajiPyooTQYj7dVP2nSz7cnt/5Cf23y4odNNXyJgpJaFrGerWy9TTSSivqV7lfhrcWTsU9g9EBCh71fIZoYznUcSPiIlOGjc0eLPiqp7Xkxmi5PYxkMHh0re46ee6t0FauW2ogiLz2cMFWf3VtE7MKMupVXfxAI4UEDEyEx/4nAQ1iOf4bYeMUwiyJyq1JbspiNCrxBbsPeEvfucodDpJWgOdv6jeudD+c3l+alMD0uHOg1NJ+v4O+Fo7SnEV0u7A7MWzPfZyUMXEc/dD5RjBul+q0XI1ufzqtNUbIrQZPJdND9EKX0C22lZ+uuwYoy1tt4q7hZmrMLieU2u2gtHSm6L3NXuduSwb2IdpckvHbEDp4763nT6sajnLDw+pGMxsD2hB29+2UBg06vEFFOupb+CcMH7QkhdVLaOtRRJi5qxg+EJTd9AoB9dpVGx3gjDFyHRJMtEh1C2pVzpDNTzOFbHGlYKIihqHQcgbTCTw8dQ4MParaNxZ2CBg+UVwqGpw6ee9loYw1GI2IuXURW563CzuhKXF38DPXt11b5H2Q+F/9UiWmBISb+H/9XRAs4VjXAkquOO6+M0pItq0nQG7EYpzzszTIiUPMqPzFXMM9RNVAECs65+spnWhc88iSiODIKXqDosFEP8HvcRmaMNsB4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(11063799006)(5023799004)(3023799007)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gudyf/w2DSD+PTbpcSoXCbU5Qd3vpXSyCJ9xHL3kTaD5L2Z0a/9K3LPuRbcb?=
 =?us-ascii?Q?nSJ/73mQy3ZI5KHc5wZKfg1o+4i9jpZqWcwAzjzUrNFgsp8cjLPty9CCkVB4?=
 =?us-ascii?Q?VLS5rxv2uYQ/MhMpcsbSbju4hqUzlwPPU6IrDGNfxdMIPnLVFGJ+Oo387IP0?=
 =?us-ascii?Q?j3FjnV6R6csjAFFrmK8zQAyTj3+3DKve8lR4PJbeeIPliVtoWcUh6t57/Qft?=
 =?us-ascii?Q?XvtPiWA/gAOWGHfQyyF97kfx155LoPJz+GOP9BLi3TbzrXjKd8itZVW6muYV?=
 =?us-ascii?Q?JxF+bpizh8hycTq8FN4hrIy5I8CBlOV5os8d2vRKzxxOg6mhOzJt9Qzg80b0?=
 =?us-ascii?Q?k7EyDmT1faXlE77wK0dvGmjQkx7Ir/wc2O2BFVb3jjEuquVG6NKDlh7iUl2w?=
 =?us-ascii?Q?nyBxvyCL9X2G0JSvLZlNu11zaSP2kaioM5B0opNjmr6CaU4Pqv60Ji+G/wro?=
 =?us-ascii?Q?9k5aG5IWGXYLP8vHtEWVoqbV57yunjiGsuldRN6XOFu/UajMzRSCvohKqGPG?=
 =?us-ascii?Q?rc2jX8Yykvc6oxn8X2nOObZ0YT//kyQvvkL3Cq4U4POWvP6C2yhmwX05DT/E?=
 =?us-ascii?Q?JZJeImJqp9pEtqK1rJHVkaQGN6h3wFVWz88GvorLHi1geD7C85DuuSSYh9cC?=
 =?us-ascii?Q?HJ+MYnyh/G/3iE3m8M0V6N85iYGZo/tNxobuZaDp3kDdoMLVZteMmgkLJMqJ?=
 =?us-ascii?Q?gnGE/u1qk4VjgFnwZMnnDxrMhqeure1vI6bCBs7F/Rb0nQQAT6HNw8bKfr7w?=
 =?us-ascii?Q?TXQC0hJhcED7HGPEP/U6LPB5HaHWZ9OAbRODA7Urw9YGeOBtqaEBYAoKWlZ3?=
 =?us-ascii?Q?kXNk5WrDiiScUpOHuDJPtKUMUmZEeKhAaBC337nKytNZBcVZmjPx/r6xlG3G?=
 =?us-ascii?Q?isHeKO7LU3zxH+7ixe/42lJ5MQg36yglt4lRvn+DiuAy7ruDCirk+PI4cM1x?=
 =?us-ascii?Q?49wROaUYRmOQisbsSwUh8TYPWvOT43GQw4FvSIY23kRDH9b/LBHDES5qjcjk?=
 =?us-ascii?Q?5/vn9QJNNPZi+v7p9qQR0FXE+DnOT2D3Et1/qIYY5g7M949SagirQmtYrqEM?=
 =?us-ascii?Q?Dn1PTpixgHfnCI/taWOxMU2qObSG/6JpRVEe+Qh8XNV2UCQQQqKtVJdrjFDS?=
 =?us-ascii?Q?olEHXxLlvS6EkkbFS8QEbYpMcR4h8lSf7y7hMEnp6HGk77TqrAnOz4dlGhCM?=
 =?us-ascii?Q?XgxeyB6CkqJtHh57zyTu4Umeoi+C1qHUQkpUg5oHdDxOIXokfeNXlQfK/Cbp?=
 =?us-ascii?Q?nB5gsen2+8FwAHajl5ouGb/0u1+PxP0Y5XA7aiXzkffe9rLEtaLKKp4zIZfB?=
 =?us-ascii?Q?HquojxwtvBLD/gceCkp3Og9ExWCQo3tpgDNExzy0R7fJPLdvlppqAop+rfDr?=
 =?us-ascii?Q?ReHlN0z6pHWaIQa76R6sDRfznM63R6ylBnVBIR523qcXWaWUDgE5EULDOU1L?=
 =?us-ascii?Q?AwU4qKBWZf8DE+0Z8lEwJGtl17VvmyUYlpnHM56YVqtudp/JJBSEB4ncEtze?=
 =?us-ascii?Q?UD5ceb5YMSjo/Gz2iR5T6fmawNeKi02L8Z44v9tjzThsxydlSChzd/98pjOl?=
 =?us-ascii?Q?lCkqzO+MwvP43UYc51hkqYSJQoO70AZBri3qKMqJdexdNw65MGTpBFlHaCsb?=
 =?us-ascii?Q?xXD9Pmc+AZoRVmpnbi+R+udZKj0It5C40LvSIGJNuXp5toi1fPLiZIf9fPcV?=
 =?us-ascii?Q?hJdJKPnx0cbxxoAvNbWqwUHXI1VZ86jJtQxrb7ck6mheZFXhOK7/ofYuIPGd?=
 =?us-ascii?Q?H+TTw6JqQ2KTB9tTv0EcvNXQwqXWpnvl3Hk6jGDf0i0AI3QkwSEPiIOMb2Qj?=
X-MS-Exchange-AntiSpam-MessageData-1: +kBzMIRe3bXreDCs3gWArd6Wm8rtXo8571g=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 905fc6c2-76fd-42bb-1354-08def96f5ec8
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:16:26.2240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hP510Y27yvsaHiETp4KEITiT0smB3WdAiKALBoV3ECjLnRESix6rgx9CwkTkPmw6mOj7TAs9mkHGgfc/uStC5u+pE2NcB8o1DXVS9xBU7Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243383

Fix trailing whitespace in classes-recipe bbclass files to resolve
bitbake parsing warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-recipe/core-image.bbclass            |  2 +-
 meta/classes-recipe/gobject-introspection.bbclass |  4 ++--
 meta/classes-recipe/kernel-yocto.bbclass          | 10 +++++-----
 meta/classes-recipe/lib_package.bbclass           |  2 +-
 meta/classes-recipe/libc-package.bbclass          |  6 +++---
 meta/classes-recipe/mime-xdg.bbclass              |  2 +-
 meta/classes-recipe/multilib_header.bbclass       |  4 ++--
 meta/classes-recipe/populate_sdk_ext.bbclass      |  2 +-
 meta/classes-recipe/ptest-cargo.bbclass           |  4 ++--
 meta/classes-recipe/ptest-python-pytest.bbclass   |  4 ++--
 meta/classes-recipe/uboot-config.bbclass          |  2 +-
 11 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/c=
ore-image.bbclass
index 994185ed4c..167fa97fd9 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -5,7 +5,7 @@
 # SPDX-License-Identifier: MIT
=20
 # IMAGE_FEATURES control the content of the core reference images
-#=20
+#
 # By default we install packagegroup-core-boot and packagegroup-base-exten=
ded packages;
 # this gives us a working (console only) rootfs.
 #
diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/class=
es-recipe/gobject-introspection.bbclass
index d0052cd623..3f6ccaa02e 100644
--- a/meta/classes-recipe/gobject-introspection.bbclass
+++ b/meta/classes-recipe/gobject-introspection.bbclass
@@ -57,8 +57,8 @@ do_compile:prepend() {
=20
 # .typelib files are needed at runtime and so they go to the main package =
(so
 # they'll be together with libraries they support).
-FILES:${PN}:append =3D " ${libdir}/girepository-*/*.typelib"=20
-   =20
+FILES:${PN}:append =3D " ${libdir}/girepository-*/*.typelib"
+
 # .gir files go to dev package, as they're needed for developing (but not =
for
 # running) things that depends on introspection.
 FILES:${PN}-dev:append =3D " ${datadir}/gir-*/*.gir ${libdir}/gir-*/*.gir"
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass
index 5464aa1115..628823ff54 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -98,7 +98,7 @@ def get_machine_branch(d, default):
             btype =3D urldata.parm.get("type")
             if btype !=3D "kmeta":
                 return branches[0]
-	   =20
+
     return default
=20
 # returns a list of all directories that are on FILESEXTRAPATHS (and
@@ -425,11 +425,11 @@ do_kernel_checkout() {
 		# checkout and clobber any unimportant files
 		git checkout -f ${machine_branch}
 	else
-		# case: we have no git repository at all.=20
-		# To support low bandwidth options for building the kernel, we'll just=20
+		# case: we have no git repository at all.
+		# To support low bandwidth options for building the kernel, we'll just
 		# convert the tree to a git repo and let the rest of the process work un=
changed
-	=09
-		# if ${S} hasn't been set to the proper subdirectory a default of "linux=
" is=20
+
+		# if ${S} hasn't been set to the proper subdirectory a default of "linux=
" is
 		# used, but we can't initialize that empty directory. So check it and th=
row a
 		# clear error
=20
diff --git a/meta/classes-recipe/lib_package.bbclass b/meta/classes-recipe/=
lib_package.bbclass
index 2a944268c8..ef0b3c3e15 100644
--- a/meta/classes-recipe/lib_package.bbclass
+++ b/meta/classes-recipe/lib_package.bbclass
@@ -8,5 +8,5 @@
 #
 # We need to allow the other packages to be greedy with what they
 # want out of /usr/bin and /usr/sbin before ${PN}-bin gets greedy.
-#=20
+#
 PACKAGE_BEFORE_PN +=3D "${PN}-bin"
diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe=
/libc-package.bbclass
index 73b7f5a708..560e935069 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -68,7 +68,7 @@ do_prep_locale_tree() {
 	mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datad=
ir} $treedir/${localedir}
 	tar -cf - -C ${LOCALETREESRC}${datadir} -p i18n | tar -xf - -C $treedir/$=
{datadir}
 	# unzip to avoid parsing errors
-	for i in $treedir/${datadir}/i18n/charmaps/*gz; do=20
+	for i in $treedir/${datadir}/i18n/charmaps/*gz; do
 		gunzip $i
 	done
 	# The extract pattern "./l*.so*" is carefully selected so that it will
@@ -283,8 +283,8 @@ python package_do_split_gconvs () {
=20
             cmd =3D "PATH=3D\"%s\" I18NPATH=3D\"%s\" GCONV_PATH=3D\"%s\" c=
ross-localedef %s" % \
                 (path, i18npath, gconvpath, localedef_opts)
-        else: # earlier slower qemu way=20
-            qemu =3D qemu_target_binary(d)=20
+        else: # earlier slower qemu way
+            qemu =3D qemu_target_binary(d)
             localedef_opts =3D "--force --no-hard-links --no-archive --pre=
fix=3D%s \
                 --inputfile=3D%s/i18n/locales/%s --charmap=3D%s %s" \
                 % (treedir, datadir, locale, encoding, name)
diff --git a/meta/classes-recipe/mime-xdg.bbclass b/meta/classes-recipe/mim=
e-xdg.bbclass
index cbdcb4c7e9..7786c2d544 100644
--- a/meta/classes-recipe/mime-xdg.bbclass
+++ b/meta/classes-recipe/mime-xdg.bbclass
@@ -3,7 +3,7 @@
 #
 # SPDX-License-Identifier: MIT
 #
-# This class creates mime <-> application associations based on entry=20
+# This class creates mime <-> application associations based on entry
 # 'MimeType' in *.desktop files
 #
=20
diff --git a/meta/classes-recipe/multilib_header.bbclass b/meta/classes-rec=
ipe/multilib_header.bbclass
index 33f7e027f0..dd65fc02fa 100644
--- a/meta/classes-recipe/multilib_header.bbclass
+++ b/meta/classes-recipe/multilib_header.bbclass
@@ -24,9 +24,9 @@ oe_multilib_header() {
         case ${TARGET_ARCH} in
         mips*)  case "${MIPSPKGSFX_ABI}" in
                 "-n32")
-                       ident=3Dn32  =20
+                       ident=3Dn32
                        ;;
-                *)    =20
+                *)
                        ident=3D${SITEINFO_BITS}
                        ;;
                 esac
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-re=
cipe/populate_sdk_ext.bbclass
index b75c8926a7..a1188da969 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -121,7 +121,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
=20
-SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext =3D " write_target_sd=
k_ext_manifest write_host_sdk_ext_manifest"   =20
+SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext =3D " write_target_sd=
k_ext_manifest write_host_sdk_ext_manifest"
=20
 SDK_TITLE:task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME') or d.getVa=
r('DISTRO')} Extensible SDK"
=20
diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/=
ptest-cargo.bbclass
index 2e008b306a..62444e9cc6 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -107,7 +107,7 @@ python do_install_ptest_cargo() {
             f.write("#!/bin/sh\n")
         else:
             f.write(f"\necho \"\"\n")
-            f.write(f"echo \"## starting to run rust tests ##\"\n")       =
       =20
+            f.write(f"echo \"## starting to run rust tests ##\"\n")
         f.write("if [ -z \"$rc\" ]; then rc=3D0; fi\n")
         for test_path in test_paths:
             script =3D textwrap.dedent(f"""\
@@ -120,7 +120,7 @@ python do_install_ptest_cargo() {
                 fi
             """)
             f.write(script)
-       =20
+
         f.write("exit $rc\n")
=20
     if not script_exists:
diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes=
-recipe/ptest-python-pytest.bbclass
index a4615e12bf..57dbcda7ab 100644
--- a/meta/classes-recipe/ptest-python-pytest.bbclass
+++ b/meta/classes-recipe/ptest-python-pytest.bbclass
@@ -12,10 +12,10 @@ PTEST_PYTEST_DIR ?=3D "tests"
=20
 do_install_ptest() {
 	# Check if the recipe provides its own version of run-ptest
-	# If nothing exists in the SRC_URI, dynamically create a=20
+	# If nothing exists in the SRC_URI, dynamically create a
 	# run-test script of "last resort" that has the default
 	# pytest behavior.
-	#=20
+	#
 	# Users can override this behavior by simply including a
 	# custom script (run-ptest) in the source file list
 	if [ ! -f "${UNPACKDIR}/run-ptest" ]; then
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 9e24db1f48..412b2c7c57 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -181,7 +181,7 @@ python () {
             binary =3D ubootbinary
             imagefstype =3D ""
             for f, v in ubootconfigflags.items():
-                if config =3D=3D f:=20
+                if config =3D=3D f:
                     found =3D True
                     items =3D v.split(',')
                     if items[0] and len(items) > 1:

