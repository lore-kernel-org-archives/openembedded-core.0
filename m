Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F40C3A59D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:38:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.1487.1666395471881117197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com header.s=selector1 header.b=F+ZaJqXB;
 spf=pass (domain: seco.com, ip: 40.107.6.78, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgAZwduN1vJOohb26ITuQ/3owncqC9kfYdLMStqtwH6jGnWVhMVbBnEjMSIu+wO2vGN0Fi1QfVfIATUHwo20mFo/MDMHy2FI/S+4gD5mtMTlApV3xrVvtOWdBMau33RtUSHkA4xRS/A7iiUv6CvC+oE5e3tj7CJYAwy44NG7LMGHvZmkNMk8a0bHPj6ndCf0pqY7EKp9Xu25xzib0a8GPayhMrMx8alIg4RAJT3+i84R+acatZLg54K+nAStrbh3uCVQXLe8BAbseJLrxG9cfqCLHhDHjUSCZSaSu0hJOlADaL6hSdNBjv8TGLfPoYGB0A5soBkGrIl2Kxn0mEY4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0y3Yl6U95BEgrI2a79NpVydkpSn8z3+nFG1aDpnJwg=;
 b=KG5N7aZro6jmfmaH3VLkPIPJVHXKYN+EjW/dXLlxC8bGHXpf3xeOadXf0a1Edy/6oAJYDJkY9d7BDtv8kcafmm+qvzQIJb7yxVAz/CCiIOWy80YV+Bfg2xnfDRhpa5alh1aHIdEo75WiiejHFyqGGpXpY4mRQdYXlKwPAqlv4Z6PXLAXKAzexTRbXtuFrRHa0iJGiVKKhOk98qlktCv2S88opBDop1eVCrxdsyqbbkA+EysHd+qgD95H2qd7AgZkDy9G6mxOPi6CZq92+H4LjXesrCBNN4paV9GoUSYe/KuXlSrpCkwACT2MR2r90CMBOvlIGYa65xuwuW/CNKuNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0y3Yl6U95BEgrI2a79NpVydkpSn8z3+nFG1aDpnJwg=;
 b=F+ZaJqXB6sVRYCpYgOOL2dQs83FONFDzaEY0ZaPVbXv8gYRvm3fWRvf9AbyTOsjwNNVe6R/dga72C6AiiqUzUrTNfKbMBFzo8Y4kMXg4pwKaOHmLwM9oNAnohNf1RgeB4pjGX9sdyBwM7a2brF++yIm5x0Obhb775800rPfcSm+QTA5nVES2Y4zuECOB7pO3x/A0zjF/5FpNMskdH3V1SBg0typLTqJUiXy8qpCQp4WPNcXgCMn2E+H05hJhrDigoDasnbr2TREL5FTEnuChcKVHsciT2PZ6VdNaTnhwPdro9aOvclN7KUYXWsUwOXvvb3U2q6FBBLboGVS2BGz+yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 23:37:53 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 23:37:53 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
Date: Fri, 21 Oct 2022 19:37:26 -0400
Message-ID: <20221021233726.1751124-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221021233726.1751124-1-sean.anderson@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:208:23b::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|VI1PR0301MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 1693252a-35c0-4b65-a45c-08dab3bd4615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	znVg7z8aZ/HcKdtFmLEWmGAFHvFl6anNr82Dpy21YXHlOdFmK07mAnqOCtAoT2mz2YrNlzb/Uyek64Hc0ia1Rx07d6Gw2iGdb9ZDK7gFZ6DMOGnWCvALbT+dMwyS9x4tiA1RGN+kn75j5hZoaehe+HgwTjH7HFrqgFPu8Ovm9wm/+9tJlXsHIgTP4IElC6d6FzSBX61jBjnEm4KXuh+ZAiK6/BUIWgsxE+6vKQ6ZBq6owqHniT3gsqsQnw83/qLW4RbMM4d1T1VFCMT5aqNCQL7XFCrJMIXcg587BNBW/QbqKLj63J6HsXfM6I+0QdSpvJ+euuTpz7SHwNY4tIthHnT/uUlQ9901XtxFCkIqcukC67fBo7GDpiAtFsA6/975OhJ+TL/4+dStHf/Nq77FYeoIaHoY9M/RE9NcMFxZwWjm93xJVQ6qo7YIDpRZNeLebhHg8xpa80vLmyFiFaprDVAM0xk0fBksgI/Ved97jC/s5Ggl+uyumnF9izXFWJ9t3twJeGPgrADcRW7NAaftu+A3U2UoLXJ2oisjkvrj8tgsyj9rPKGR1u3VUHJJcJQOVY+eHKReXRfW11MiGC6tFWwV56ojYFUchjJ1qZvu+4pF3XsQ9/FHBo2z9dHvHxPIPBgvVAU21WZunlMi8X+gRNKwd862TCqLQ34njxahUJEDe3fGNIdQ7iWwugDoFMLbfF9O0sya9kdEXJdsFQIMaAIYKucGRCGX3kPoU+tJNGBiK+JjZ3UTI/ZWoFRvQjH+L8Ila/BmVB/BD/ZsvxFImQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39840400004)(136003)(346002)(376002)(396003)(451199015)(478600001)(83380400001)(66899015)(86362001)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(107886003)(6666004)(52116002)(36756003)(6506007)(8936002)(5660300002)(6512007)(41300700001)(26005)(110136005)(38350700002)(38100700002)(1076003)(186003)(2616005)(44832011)(2906002)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ThqpV1YbQz3LzphMZLisWsRMIWaZkT9Rmv3EcXLnI5dgd0sqimCsgGXkuAKG?=
 =?us-ascii?Q?loweuZ/VUOs463uj+r2ov10bMEWGNGH9EL2Al9/A/+vMIdBMlsA7rsZxUxSD?=
 =?us-ascii?Q?/Mm7/evBUEawxM6xcYmlepvPmknnn3BJ/tpsyQvntDDbiTjtxLNOQWrD2uA9?=
 =?us-ascii?Q?Xnu2S2n/UTlZ44D4l2D4nyr/Gb8Fq6KJrEk8EWZ2qUjVdTtzaXb/LwgH9wTE?=
 =?us-ascii?Q?TBAJoNrcInQepPi8bPaCTuOYN583ixW73Muq2Phs/+yGA9E8xE1mtzPv6WNd?=
 =?us-ascii?Q?fgMq7rhf/jMqKgLQfucoopdo0cLVUXC45xtVYEMIae3H9+UOZZKu8AS7xttB?=
 =?us-ascii?Q?WS+onMP7DAMGFk09sbaFkmIwNg+kqsPMF75hdveFPZzrfhHtb4fKOL4kgqvI?=
 =?us-ascii?Q?eUymUQAe6m5w/1629D/hqmritNjjIn3qFammGiQrZPPH7v7aUqIt2ihIu2LN?=
 =?us-ascii?Q?TWWJK0XVbNyo7n7lsO3CnNwo4KtolP4/34lg6s6bbZY5WSm5aIUr1QeSmEO+?=
 =?us-ascii?Q?FksXe18GvOLgD4zpaeB3594+vd6WTij5PKjxfV74nlIgD4X3nc3YuAVWRKg9?=
 =?us-ascii?Q?+4elBy+P0oJZanEMUflEDAAcD255ktExcSHw7ucUi7P+muuRlCq9WIpc2sTa?=
 =?us-ascii?Q?DiTUFL/05XobUZZ970E6SamPnMCd8hI19hLgwirMW1kiDvSvI8Ts0xGUj0NO?=
 =?us-ascii?Q?DcSNa+xWDtP5WHPSgMzYFb2QQjGqPpZ2tmB1uCP0rg4WkRQeU5RxJfIYIP/a?=
 =?us-ascii?Q?iK6he8w+L6Ug2ozzfuNduPRiY9xDSSyTKFxDxv9K7ho1v3TXtJDZDGrsiQkW?=
 =?us-ascii?Q?VjUuL3WepchJzOUelY7fI0zzXG7JX51Vn1CwDDewgIALRchoB4+VLUdaTd0B?=
 =?us-ascii?Q?8M4fj2JgbnffK2QZqOq8+wHYGxb9glJs//fOztqDn3OTiBO9gHApcRfL2X1/?=
 =?us-ascii?Q?a6ctBIWA9myNs8bBGIFhRy2sL3LN9/IVZtZiL6i+0qGmuIL0WFz3Ub6/xnrj?=
 =?us-ascii?Q?MAHuXoXUOzvkMp7bN/c+iVP/hLGPyJrsc1w3UGOQ48Oelcn1dVq8DaGPsuiJ?=
 =?us-ascii?Q?9Cshf66E7/ud34QQHmK+Mv275Epynn+in5gFc+WWzmM1OQ7flYST9Cvg+Cvs?=
 =?us-ascii?Q?ppIdo3ASf06AvN7kLkzgvi5d+8K9Pa1Ow9MRVR28HdjTI5IaQul8mRUmEhPO?=
 =?us-ascii?Q?c4kIP5//ODlkv6XwTMS99QHTr0nhodfD6UVOJRcsE1HHLQVDCuXabVA0NI6r?=
 =?us-ascii?Q?+HjgXxzfSNC1dXQG17PFdSCtdVbLVD6HUieQl2ThxwJRdIHyXmo7+y5/kA1c?=
 =?us-ascii?Q?PB6dKqiy2g/PT+KZC32tJy1C2CNi5Z0vQ/YtLpB8bB06a7ihF5oZf33H/VRG?=
 =?us-ascii?Q?HT+dbEpEBLEUM8WZ7BXtkT66Y1s8lEz9Pk5wysSLhInAevi9wHs7fZwPBxOo?=
 =?us-ascii?Q?22aggHfXR00i/oNe8w6Do8Pxf2602o/sDQ+xmK+/+OiA9aBVLpjX2tJryzxZ?=
 =?us-ascii?Q?eDaZhSrGWmF03wUGpHO7e4Rm6tFQB4WeODMLJdC3bpCmUSWSEQgVfAP4d3Uv?=
 =?us-ascii?Q?KRp3u1OnGWXg0Ae0GVPOlTFXb68nSdBsvBzOkKRv61Q+wmEepymjdFpjX14Z?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1693252a-35c0-4b65-a45c-08dab3bd4615
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:37:53.4391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhXZPoF6ic07qIIQumLZI9Iv6xhyAscjSaDU0A5rwAzwoRY3kRDj0ClM7tJS9jMFZvS5pBI/fmdeoJKBw1t0+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172055

The U-Boot signing code is a bit of a mess. The problem is that mkimage
determines the public keys to embed into a device tree based on an image
that it is signing. This results in all sorts of contortions: U-Boot has to
be available to the kernel recipe so that it can have the correct public
keys embedded. Then, the signed U-Boot has to be made available to U-Boot's
do_deploy. This same dance is then repeated for SPL. To complicate matters,
signing for U-Boot and U-Boot SPL is optional, so the whole process must be
seamlessly integrated with a non-signed build.

The complexity and interdependency of this process makes it difficult to
extend. For example, it is not possible to install a signed U-Boot binary
into the root filesystem. This is first because u-boot:do_install must run
before linux:do_assemble_fitimage, which must run before u-boot:do_deploy.
But aside from infrastructure issues, installing a signed U-Boot also can't
happen, because the kernel image might have an embedded initramfs
(containing the signed U-Boot).

However, all of this complexity is accidental. It is not necessary to embed
the public keys into U-Boot and sign the kernel in one fell swoop. Instead,
we can sign the kernel, stage it, and sign the staged kernel again to embed
the public keys into U-Boot [1]. This twice-signed kernel serves only to
provide the correct parameters to mkimage, and does not have to be
installed or deployed. By cutting the dependency of
linux:do_assemble_fitimage on u-boot:do_install, we can drastically
simplify the build process, making it much more extensible.

The process of doing this conversion is a bit involved, since the U-Boot
and Linux recipes are so intertwined at the moment. The most major change
is that uboot-sign is no longer inherited by kernel-fitimage. Similarly,
all U-Boot-related tasks have been removed from kernel-fitimage. We add a
new step to the install task to stage the kernel in /sysroot-only. The
logic to disable assemble_fitimage has been removed. We always assemble it,
even if the final fitImage will use a bundled initramfs, because U-Boot
will need it.

On the U-Boot side, much of the churn stems from multiple config support.
Previously, we took a fairly ad-hoc approach to UBOOT_CONFIG and
UBOOT_MACHINE, introducing for loops wherever we needed to deal with them.
However, I have chosen to use a much more structured approach. Each task
which needs to use the build directory uses the following pseudocode:

do_mytask() {
	if ${UBOOT_CONFIG}; then
		for config, type in zip(${UBOOT_CONFIG}, ${UBOOT_MACHINE}); do
			cd ${config}
			mytask_helper ${type}
		done
	else
		cd ${B}
		mytask_helper ""
	fi
}

By explicitly placing the work in mytask_helper, we make it easier to
ensure that everything is covered, and we also allow bbappends files to
more easily extend the task (as otherwise they would need to reimplement
the loop themselves).

[1] It doesn't particularly matter what we sign. Any FIT will do, but I
chose the kernel's because we already went to the trouble of setting it up
with the correct hashes and signatures. In the future, we could create a
"dummy" image and sign that instead, but it would probably have to happen
in the kernel recipe anyway (so we have access to the appropriate
variables).

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes-recipe/kernel-fitimage.bbclass |  68 +---
 meta/classes-recipe/uboot-config.bbclass    |   3 +
 meta/classes-recipe/uboot-sign.bbclass      | 421 +++++++++-----------
 meta/lib/oeqa/selftest/cases/fitimage.py    |  29 +-
 meta/recipes-bsp/u-boot/u-boot.inc          |   3 -
 5 files changed, 226 insertions(+), 298 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index e4a130a0f2..befdf2568c 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit kernel-uboot kernel-artifact-names uboot-sign
+inherit kernel-uboot kernel-artifact-names uboot-config
=20
 def get_fit_replacement_type(d):
     kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
@@ -50,15 +50,6 @@ python __anonymous () {
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/d=
tb:do_populate_sysroot')
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', '=
 virtual/dtb:do_populate_sysroot')
             d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot=
/devicetree")
-
-        # Verified boot will sign the fitImage and append the public key t=
o
-        # U-Boot dtb. We ensure the U-Boot dtb is deployed before assembli=
ng
-        # the fitImage:
-        if d.getVar('UBOOT_SIGN_ENABLE') =3D=3D "1" and d.getVar('UBOOT_DT=
B_BINARY'):
-            uboot_pn =3D d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_pop=
ulate_sysroot' % uboot_pn)
-            if d.getVar('INITRAMFS_IMAGE_BUNDLE') =3D=3D "1":
-                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends=
', ' %s:do_populate_sysroot' % uboot_pn)
 }
=20
=20
@@ -678,20 +669,12 @@ fitimage_assemble() {
 		${KERNEL_OUTPUT_DIR}/$2
=20
 	#
-	# Step 8: Sign the image and add public key to U-Boot dtb
+	# Step 8: Sign the image
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" =3D "x1" ] ; then
-		add_key_to_u_boot=3D""
-		if [ -n "${UBOOT_DTB_BINARY}" ]; then
-			# The u-boot.dtb is a symlink to UBOOT_DTB_IMAGE, so we need copy
-			# both of them, and don't dereference the symlink.
-			cp -P ${STAGING_DATADIR}/u-boot*.dtb ${B}
-			add_key_to_u_boot=3D"-K ${B}/${UBOOT_DTB_BINARY}"
-		fi
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') e=
lse ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			$add_key_to_u_boot \
 			-r ${KERNEL_OUTPUT_DIR}/$2 \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
@@ -700,18 +683,30 @@ fitimage_assemble() {
 do_assemble_fitimage() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
-		fitimage_assemble fit-image.its fitImage ""
+		fitimage_assemble fit-image.its fitImage-none ""
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
+			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
+		fi
 	fi
 }
=20
 addtask assemble_fitimage before do_install after do_compile
=20
+SYSROOT_DIRS:append =3D " /sysroot-only"
+do_install:append() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
+		[ "${UBOOT_SIGN_ENABLE}" =3D "1" ]; then
+		install -D ${B}/${KERNEL_OUTPUT_DIR}/fitImage-none ${D}/sysroot-only/fit=
Image
+	fi
+}
+
 do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
 		test -n "${INITRAMFS_IMAGE}" ; then
 		cd ${B}
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" =3D "1" ]; then
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage ""
+			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
+			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
 		else
 			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS=
_IMAGE} 1
 		fi
@@ -802,35 +797,4 @@ kernel_do_deploy:append() {
 			fi
 		fi
 	fi
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -o "${UBOOT_FITIMAGE_ENABLE}" =3D "1"=
 ] && \
-	   [ -n "${UBOOT_DTB_BINARY}" ] ; then
-		# UBOOT_DTB_IMAGE is a realfile, but we can't use
-		# ${UBOOT_DTB_IMAGE} since it contains ${PV} which is aimed
-		# for u-boot, but we are in kernel env now.
-		install -m 0644 ${B}/u-boot-${MACHINE}*.dtb "$deployDir/"
-	fi
-	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${UBOOT_BINARY}" -a -n "${=
SPL_DTB_BINARY}" ] ; then
-		# If we're also creating and/or signing the uboot fit, now we need to
-		# deploy it, it's its file, as well as u-boot-spl.dtb
-		install -m 0644 ${B}/u-boot-spl-${MACHINE}*.dtb "$deployDir/"
-		bbnote "Copying u-boot-fitImage file..."
-		install -m 0644 ${B}/u-boot-fitImage-* "$deployDir/"
-		bbnote "Copying u-boot-its file..."
-		install -m 0644 ${B}/u-boot-its-* "$deployDir/"
-	fi
-}
-
-# The function below performs the following in case of initramfs bundles:
-# - Removes do_assemble_fitimage. FIT generation is done through
-#   do_assemble_fitimage_initramfs. do_assemble_fitimage is not needed
-#   and should not be part of the tasks to be executed.
-# - Since do_kernel_generate_rsa_keys is inserted by default
-#   between do_compile and do_assemble_fitimage, this is
-#   not suitable in case of initramfs bundles.  do_kernel_generate_rsa_key=
s
-#   should be between do_bundle_initramfs and do_assemble_fitimage_initram=
fs.
-python () {
-    if d.getVar('INITRAMFS_IMAGE_BUNDLE') =3D=3D "1":
-        bb.build.deltask('do_assemble_fitimage', d)
-        bb.build.deltask('kernel_generate_rsa_keys', d)
-        bb.build.addtask('kernel_generate_rsa_keys', 'do_assemble_fitimage=
_initramfs', 'do_bundle_initramfs', d)
 }
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 73dc464444..fb7a4bc498 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -19,6 +19,9 @@ def removesuffix(s, suffix):
         return s[:-len(suffix)]
     return s
=20
+UBOOT_ENTRYPOINT ?=3D "20008000"
+UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
+
 # Some versions of u-boot use .bin and others use .img.  By default use .b=
in
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ??=3D "bin"
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 569907fa68..3dc029c429 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -5,7 +5,7 @@
 #
=20
 # This file is part of U-Boot verified boot support and is intended to be
-# inherited from u-boot recipe and from kernel-fitimage.bbclass.
+# inherited from the u-boot recipe.
 #
 # The signature procedure requires the user to generate an RSA key and
 # certificate in a directory and to define the following variable:
@@ -22,19 +22,6 @@
 #
 # The signature support is limited to the use of CONFIG_OF_SEPARATE in U-B=
oot.
 #
-# The tasks sequence is set as below, using DEPLOY_IMAGE_DIR as common pla=
ce to
-# treat the device tree blob:
-#
-# * u-boot:do_install:append
-#   Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
-#   signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
-#
-# * virtual/kernel:do_assemble_fitimage
-#   Sign the image
-#
-# * u-boot:do_deploy[postfuncs]
-#   Deploy files like UBOOT_DTB_IMAGE, UBOOT_DTB_SYMLINK and others.
-#
 # For more details on signature process, please refer to U-Boot documentat=
ion.
=20
 # We need some variables from u-boot-config
@@ -49,6 +36,7 @@ SPL_SIGN_ENABLE ?=3D "0"
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.dtb"
 UBOOT_DTB_BINARY ?=3D "u-boot.dtb"
+UBOOT_DTB_SIGNED ?=3D "${UBOOT_DTB_BINARY}-signed"
 UBOOT_DTB_SYMLINK ?=3D "u-boot-${MACHINE}.dtb"
 UBOOT_NODTB_IMAGE ?=3D "u-boot-nodtb-${MACHINE}-${PV}-${PR}.bin"
 UBOOT_NODTB_BINARY ?=3D "u-boot-nodtb.bin"
@@ -62,6 +50,7 @@ UBOOT_FITIMAGE_SYMLINK ?=3D "u-boot-fitImage-${MACHINE}"
 SPL_DIR ?=3D "spl"
 SPL_DTB_IMAGE ?=3D "u-boot-spl-${MACHINE}-${PV}-${PR}.dtb"
 SPL_DTB_BINARY ?=3D "u-boot-spl.dtb"
+SPL_DTB_SIGNED ?=3D "${SPL_DTB_BINARY}-signed"
 SPL_DTB_SYMLINK ?=3D "u-boot-spl-${MACHINE}.dtb"
 SPL_NODTB_IMAGE ?=3D "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.bin"
 SPL_NODTB_BINARY ?=3D "u-boot-spl-nodtb.bin"
@@ -92,58 +81,48 @@ UBOOT_FIT_KEY_REQ_ARGS ?=3D "-batch -new"
 # Standard format for public key certificate
 UBOOT_FIT_KEY_SIGN_PKCS ?=3D "-x509"
=20
-# Functions on this bbclass can apply to either U-boot or Kernel,
-# depending on the scenario
-UBOOT_PN =3D "${@d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'}"
-KERNEL_PN =3D "${@d.getVar('PREFERRED_PROVIDER_virtual/kernel')}"
+# This is only necessary for determining the signing configuration
+KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
=20
-# We need u-boot-tools-native if we're creating a U-Boot fitImage
 python() {
-    if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1':
-        depends =3D d.getVar("DEPENDS")
-        depends =3D "%s u-boot-tools-native dtc-native" % depends
-        d.setVar("DEPENDS", depends)
+    # We need u-boot-tools-native if we're creating a U-Boot fitImage
+    sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
+    if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1' or sign:
+        d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
+    if sign:
+        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
 }
=20
-concat_dtb_helper() {
+concat_dtb() {
+	type=3D"$1"
+	binary=3D"$2"
+
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
-		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
-		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
-	fi
-
-	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
-		install ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
+		# Re-sign the kernel in order to add the keys to our dtb
+		${UBOOT_MKIMAGE_SIGN} \
+			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') e=
lse ''} \
+			-F -k "${UBOOT_SIGN_KEYDIR}" \
+			-K "${UBOOT_DTB_BINARY}" \
+			-r ${B}/fitImage-linux \
+			${UBOOT_MKIMAGE_SIGN_ARGS}
+		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
=20
 	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boo=
t DTB
-	# with public key (otherwise it will be deployed by the equivalent
-	# concat_spl_dtb_helper function - cf. kernel-fitimage.bbclass for more d=
etails)
+	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_as=
semble)
 	if [ "${SPL_SIGN_ENABLE}" !=3D "1" ] ; then
-		deployed_uboot_dtb_binary=3D'${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}'
 		if [ "x${UBOOT_SUFFIX}" =3D "ximg" -o "x${UBOOT_SUFFIX}" =3D "xrom" ] &&=
 \
-			[ -e "$deployed_uboot_dtb_binary" ]; then
-			oe_runmake EXT_DTB=3D$deployed_uboot_dtb_binary
-			install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb=
_binary" ]; then
-			cd ${DEPLOYDIR}
-			cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG=
_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
-
-			if [ -n "${UBOOT_CONFIG}" ]
-			then
-				i=3D0
-				j=3D0
-				for config in ${UBOOT_MACHINE}; do
-					i=3D$(expr $i + 1);
-					for type in ${UBOOT_CONFIG}; do
-						j=3D$(expr $j + 1);
-						if [ $j -eq $i ]
-						then
-							cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_SUFFIX=
}
-						fi
-					done
-				done
+			[ -e "${UBOOT_DTB_BINARY}" ]; then
+			oe_runmake EXT_DTB=3D"${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
+			if [ -n "${binary}" ]; then
+				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
+			fi
+		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
+			if [ -n "${binary}" ]; then
+				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
+					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
+			else
+				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} > ${UBOOT_BINARY}
 			fi
 		else
 			bbwarn "Failure while adding public key to u-boot binary. Verified boot=
 won't be available."
@@ -151,120 +130,67 @@ concat_dtb_helper() {
 	fi
 }
=20
-concat_spl_dtb_helper() {
+deploy_dtb() {
+	type=3D"$1"
=20
-	# We only deploy symlinks to the u-boot-spl.dtb,as the KERNEL_PN will
-	# be responsible for deploying the real file
-	if [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
-		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
-		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
-	fi
-
-	# Concatenate the SPL nodtb binary and u-boot.dtb
-	deployed_spl_dtb_binary=3D'${DEPLOY_DIR_IMAGE}/${SPL_DTB_IMAGE}'
-	if [ -e "${DEPLOYDIR}/${SPL_NODTB_IMAGE}" -a -e "$deployed_spl_dtb_binary=
" ] ; then
-		cd ${DEPLOYDIR}
-		cat ${SPL_NODTB_IMAGE} $deployed_spl_dtb_binary | tee ${B}/${CONFIG_B_PA=
TH}/${SPL_BINARY} > ${SPL_IMAGE}
+	if [ -n "${type}" ]; then
+		uboot_dtb_binary=3D"u-boot-${type}-${PV}-${PR}.dtb"
+		uboot_nodtb_binary=3D"u-boot-nodtb-${type}-${PV}-${PR}.bin"
 	else
-		bbwarn "Failure while adding public key to spl binary. Verified U-Boot b=
oot won't be available."
+		uboot_dtb_binary=3D"${UBOOT_DTB_IMAGE}"
+		uboot_nodtb_binary=3D"${UBOOT_NODTB_IMAGE}"
 	fi
-}
=20
+	if [ -e "${UBOOT_DTB_SIGNED}" ]; then
+		install -Dm644 ${UBOOT_DTB_SIGNED} ${DEPLOYDIR}/${uboot_dtb_binary}
+		if [ -n "${type}" ]; then
+			ln -sf ${uboot_dtb_binary} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+		fi
+	fi
=20
-concat_dtb() {
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${PN}" =3D "${UBOOT_PN}" -a -n "$=
{UBOOT_DTB_BINARY}" ]; then
-		mkdir -p ${DEPLOYDIR}
-		if [ -n "${UBOOT_CONFIG}" ]; then
-			for config in ${UBOOT_MACHINE}; do
-				CONFIG_B_PATH=3D"$config"
-				cd ${B}/$config
-				concat_dtb_helper
-			done
-		else
-			CONFIG_B_PATH=3D""
-			cd ${B}
-			concat_dtb_helper
+	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
+		install -Dm644 ${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${uboot_nodtb_binary}
+		if [ -n "${type}" ]; then
+			ln -sf ${uboot_nodtb_binary} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
 		fi
 	fi
 }
=20
 concat_spl_dtb() {
-	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a "${PN}" =3D "${UBOOT_PN}" -a -n "${S=
PL_DTB_BINARY}" ]; then
-		mkdir -p ${DEPLOYDIR}
-		if [ -n "${UBOOT_CONFIG}" ]; then
-			for config in ${UBOOT_MACHINE}; do
-				CONFIG_B_PATH=3D"$config"
-				cd ${B}/$config
-				concat_spl_dtb_helper
-			done
-		else
-			CONFIG_B_PATH=3D""
-			cd ${B}
-			concat_spl_dtb_helper
-		fi
+	if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" -a -e "${SPL_DIR}/${SPL_DTB_BINA=
RY}" ] ; then
+		cat ${SPL_DIR}/${SPL_NODTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL=
_BINARY}"
+	else
+		bbwarn "Failure while adding public key to spl binary. Verified U-Boot b=
oot won't be available."
 	fi
 }
=20
+deploy_spl_dtb() {
+	type=3D"$1"
=20
-# Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
-# signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
-install_helper() {
-	if [ -f "${UBOOT_DTB_BINARY}" ]; then
-		# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
-		# need both of them.
-		install -Dm 0644 ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
-		ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
+	if [ -n "${type}" ]; then
+		spl_dtb_binary=3D"u-boot-spl-${type}-${PV}-${PR}.dtb"
+		spl_nodtb_binary=3D"u-boot-spl-nodtb-${type}-${PV}-${PR}.bin"
 	else
-		bbwarn "${UBOOT_DTB_BINARY} not found"
+		spl_dtb_binary=3D"${SPL_DTB_IMAGE}"
+		spl_nodtb_binary=3D"${SPL_NODTB_IMAGE}"
 	fi
-}
=20
-# Install SPL dtb and u-boot nodtb to datadir,
-install_spl_helper() {
-	if [ -f "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
-		install -Dm 0644 ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_I=
MAGE}
-		ln -sf ${SPL_DTB_IMAGE} ${D}${datadir}/${SPL_DTB_BINARY}
-	else
-		bbwarn "${SPL_DTB_BINARY} not found"
-	fi
-	if [ -f "${UBOOT_NODTB_BINARY}" ] ; then
-		install -Dm 0644 ${UBOOT_NODTB_BINARY} ${D}${datadir}/${UBOOT_NODTB_IMAG=
E}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${D}${datadir}/${UBOOT_NODTB_BINARY}
-	else
-		bbwarn "${UBOOT_NODTB_BINARY} not found"
+	if [ -e "${SPL_DIR}/${SPL_DTB_SIGNED}" ] ; then
+		install -Dm644 ${SPL_DIR}/${SPL_DTB_SIGNED} ${DEPLOYDIR}/${spl_dtb_binar=
y}
+		if [ -n "${type}" ]; then
+			ln -sf ${spl_dtb_binary} ${DEPLOYDIR}/${SPL_DTB_IMAGE}
+		fi
 	fi
=20
-	# We need to install a 'stub' u-boot-fitimage + its to datadir,
-	# so that the KERNEL_PN can use the correct filename when
-	# assembling and deploying them
-	touch ${D}/${datadir}/${UBOOT_FITIMAGE_IMAGE}
-	touch ${D}/${datadir}/${UBOOT_ITS_IMAGE}
-}
-
-do_install:append() {
-	if [ "${PN}" =3D "${UBOOT_PN}" ]; then
-		if [ -n "${UBOOT_CONFIG}" ]; then
-			for config in ${UBOOT_MACHINE}; do
-				cd ${B}/$config
-				if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -o "${UBOOT_FITIMAGE_ENABLE}" =3D =
"1" ] && \
-					[ -n "${UBOOT_DTB_BINARY}" ]; then
-					install_helper
-				fi
-				if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; t=
hen
-					install_spl_helper
-				fi
-			done
-		else
-			cd ${B}
-			if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -o "${UBOOT_FITIMAGE_ENABLE}" =3D "=
1" ] && \
-				[ -n "${UBOOT_DTB_BINARY}" ]; then
-				install_helper
-			fi
-			if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; th=
en
-				install_spl_helper
-			fi
+	if [ -f "${SPL_DIR}/${SPL_NODTB_BINARY}" ] ; then
+		install -Dm644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOYDIR}/${spl_nodtb_b=
inary}
+		if [ -n "${type}" ]; then
+			ln -sf ${spl_nodtb_binary} ${DEPLOYDIR}/${SPL_NODTB_IMAGE}
 		fi
 	fi
+
+	# For backwards compatibility...
+	install -Dm644 ${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
 }
=20
 do_uboot_generate_rsa_keys() {
@@ -300,13 +226,10 @@ addtask uboot_generate_rsa_keys before do_uboot_assem=
ble_fitimage after do_compi
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
-	uboot_its=3D"$(basename ${STAGING_DATADIR}/u-boot-its-*)"
-	uboot_bin=3D"$(basename ${STAGING_DATADIR}/u-boot-fitImage-*)"
-
-	rm -f $uboot_its $uboot_bin
+	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
=20
 	# First we create the ITS script
-	cat << EOF >> $uboot_its
+	cat << EOF >> ${UBOOT_ITS}
 /dts-v1/;
=20
 / {
@@ -326,7 +249,7 @@ uboot_fitimage_assemble() {
 EOF
=20
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
-		cat << EOF >> $uboot_its
+		cat << EOF >> ${UBOOT_ITS}
             signature {
                 algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
                 key-name-hint =3D "${SPL_SIGN_KEYNAME}";
@@ -334,7 +257,7 @@ EOF
 EOF
 	fi
=20
-	cat << EOF >> $uboot_its
+	cat << EOF >> ${UBOOT_ITS}
         };
         fdt {
             description =3D "U-Boot FDT";
@@ -345,7 +268,7 @@ EOF
 EOF
=20
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
-		cat << EOF >> $uboot_its
+		cat << EOF >> ${UBOOT_ITS}
             signature {
                 algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
                 key-name-hint =3D "${SPL_SIGN_KEYNAME}";
@@ -353,7 +276,7 @@ EOF
 EOF
 	fi
=20
-	cat << EOF >> $uboot_its
+	cat << EOF >> ${UBOOT_ITS}
         };
     };
=20
@@ -373,8 +296,8 @@ EOF
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else '=
'} \
-		-f $uboot_its \
-		$uboot_bin
+		-f ${UBOOT_ITS} \
+		${UBOOT_FITIMAGE_BINARY}
=20
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
 		#
@@ -383,74 +306,136 @@ EOF
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else =
''} \
 			-F -k "${SPL_SIGN_KEYDIR}" \
-			-K "${SPL_DTB_BINARY}" \
-			-r $uboot_bin \
+			-K "${SPL_DIR}/${SPL_DTB_BINARY}" \
+			-r ${UBOOT_FITIMAGE_BINARY} \
 			${SPL_MKIMAGE_SIGN_ARGS}
 	fi
=20
+	cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
 }
=20
-do_uboot_assemble_fitimage() {
-	# This function runs in KERNEL_PN context. The reason for that is that we=
 need to
-	# support the scenario where UBOOT_SIGN_ENABLE is placing the Kernel fitI=
mage's
-	# pubkey in the u-boot.dtb file, so that we can use it when building the =
U-Boot
-	# fitImage itself.
-	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" ] && \
-	   [ -n "${SPL_DTB_BINARY}" -a "${PN}" =3D "${KERNEL_PN}" ] ; then
-		if [ "${UBOOT_SIGN_ENABLE}" !=3D "1" ]; then
-			# If we're not signing the Kernel fitImage, that means
-			# we need to copy the u-boot.dtb from staging ourselves
-			cp -P ${STAGING_DATADIR}/u-boot*.dtb ${B}
-		fi
-		# As we are in the kernel context, we need to copy u-boot-spl.dtb from s=
taging first.
-		# Unfortunately, need to glob on top of ${SPL_DTB_BINARY} since _IMAGE a=
nd _SYMLINK
-		# will contain U-boot's PV
-		# Similarly, we need to get the filename for the 'stub' u-boot-fitimage =
+ its in
-		# staging so that we can use it for creating the image with the correct =
filename
-		# in the KERNEL_PN context.
-		# As for the u-boot.dtb (with fitimage's pubkey), it should come from th=
e dependent
-		# do_assemble_fitimage task
-		cp -P ${STAGING_DATADIR}/u-boot-spl*.dtb ${B}
-		cp -P ${STAGING_DATADIR}/u-boot-nodtb*.bin ${B}
-		rm -rf ${B}/u-boot-fitImage-* ${B}/u-boot-its-*
-		cd ${B}
+uboot_assemble_fitimage_helper() {
+	type=3D"$1"
+	binary=3D"$2"
+
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
+		concat_dtb $type $binary
+	fi
+
+	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; then
 		uboot_fitimage_assemble
 	fi
+
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+		concat_spl_dtb
+	fi
+}
+
+do_uboot_assemble_fitimage() {
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
+		cp "${STAGING_DIR_HOST}/sysroot-only/fitImage" "${B}/fitImage-linux"
+	fi
+
+	if [ -n "${UBOOT_CONFIG}" ]; then
+		unset i j k
+		for config in ${UBOOT_MACHINE}; do
+			i=3D$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=3D$(expr $j + 1);
+				if [ $j -eq $i ]; then
+					break;
+				fi
+			done
+
+			for binary in ${UBOOT_BINARIES}; do
+				k=3D$(expr $j + 1);
+				if [ $k -eq $i ]; then
+					break;
+				fi
+			done
+
+			cd ${B}/${config}
+			uboot_assemble_fitimage_helper ${type} ${binary}
+		done
+	else
+		cd ${B}
+		uboot_assemble_fitimage_helper "" ${UBOOT_BINARY}
+	fi
+}
+
+addtask uboot_assemble_fitimage before do_install do_deploy after do_compi=
le
+
+deploy_helper() {
+	type=3D"$1"
+
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_SIGNED}" ] ; then
+		deploy_dtb $type
+	fi
+
+	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; then
+		if [ -n "${type}" ]; then
+			uboot_its_image=3D"u-boot-its-${type}-${PV}-${PR}"
+			uboot_fitimage_image=3D"u-boot-fitImage-${type}-${PV}-${PR}"
+		else
+			uboot_its_image=3D"${UBOOT_ITS_IMAGE}"
+			uboot_fitimage_image=3D"${UBOOT_FITIMAGE_IMAGE}"
+		fi
+
+		install -Dm644 ${UBOOT_FITIMAGE_BINARY} ${DEPLOYDIR}/$uboot_fitimage_ima=
ge
+		install -Dm644 ${UBOOT_ITS} ${DEPLOYDIR}/$uboot_its_image
+
+		if [ -n "${type}" ]; then
+			ln -sf $uboot_its_image ${DEPLOYDIR}/${UBOOT_ITS_IMAGE}
+			ln -sf $uboot_fitimage_image ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE}
+		fi
+	fi
+
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_SIGNED}" ] ; then
+		deploy_spl_dtb $type
+	fi
 }
=20
-addtask uboot_assemble_fitimage before do_deploy after do_compile
+do_deploy:prepend() {
+	if [ -n "${UBOOT_CONFIG}" ]; then
+		unset i j k
+		for config in ${UBOOT_MACHINE}; do
+			i=3D$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=3D$(expr $j + 1);
+				if [ $j -eq $i ]; then
+					cd ${B}/${config}
+					deploy_helper ${type}
+				fi
+			done
+		done
+	else
+		cd ${B}
+		deploy_helper ""
+	fi
=20
-do_deploy:prepend:pn-${UBOOT_PN}() {
 	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
-		concat_dtb
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
 	fi
=20
 	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" ] ; then
-	# Deploy the u-boot-nodtb binary and symlinks...
-		if [ -f "${SPL_DIR}/${SPL_NODTB_BINARY}" ] ; then
-			echo "Copying u-boot-nodtb binary..."
-			install -m 0644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOYDIR}/${SPL_NODTB=
_IMAGE}
-			ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
-			ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
-		fi
-
-
-		# We only deploy the symlinks to the uboot-fitImage and uboot-its
-		# images, as the KERNEL_PN will take care of deploying the real file
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_BINARY}
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
 		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS}
 		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS_SYMLINK}
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_BINARY}
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
 	fi
=20
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ] ; then
-		concat_spl_dtb
+		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
+		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
+		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
+		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
 	fi
-
-
 }
=20
-do_deploy:append:pn-${UBOOT_PN}() {
+do_deploy:append() {
 	# If we're creating a u-boot fitImage, point u-boot.bin
 	# symlink since it might get used by image recipes
 	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" ] ; then
@@ -458,27 +443,3 @@ do_deploy:append:pn-${UBOOT_PN}() {
 		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	fi
 }
-
-python () {
-    if (   (d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
-            or d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1')
-        and d.getVar('PN') =3D=3D d.getVar('UBOOT_PN')
-        and d.getVar('UBOOT_DTB_BINARY')):
-
-        # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
-        # and/or the U-Boot fitImage
-        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % d.getVar=
('KERNEL_PN'))
-
-    if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1' and d.getVar('PN') =3D=
=3D d.getVar('KERNEL_PN'):
-        # As the U-Boot fitImage is created by the KERNEL_PN, we need
-        # to make sure that the u-boot-spl.dtb and u-boot-spl-nodtb.bin
-        # files are in the staging dir for it's use
-        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:do_p=
opulate_sysroot' % d.getVar('UBOOT_PN'))
-
-        # If the Kernel fitImage is being signed, we need to
-        # create the U-Boot fitImage after it
-        if d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1':
-            d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:=
do_assemble_fitimage' % d.getVar('KERNEL_PN'))
-            d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:=
do_assemble_fitimage_initramfs' % d.getVar('KERNEL_PN'))
-
-}
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selft=
est/cases/fitimage.py
index 14267dbaaa..1570d54dfb 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -277,8 +277,8 @@ FIT_SIGN_INDIVIDUAL =3D "1"
 """
         self.write_config(config)
=20
-        # The U-Boot fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
+        # The U-Boot fitImage is created as part of the U-Boot recipe
+        bitbake("virtual/bootloader")
=20
         deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
         machine =3D get_bb_var('MACHINE')
@@ -350,7 +350,8 @@ UBOOT_LOADADDRESS =3D "0x80080000"
 UBOOT_ENTRYPOINT =3D "0x80080000"
 UBOOT_FIT_DESC =3D "A model description"
 KERNEL_IMAGETYPES +=3D " fitImage "
-KERNEL_CLASSES =3D " kernel-fitimage test-mkimage-wrapper "
+KERNEL_CLASSES =3D " kernel-fitimage "
+INHERIT +=3D "test-mkimage-wrapper"
 UBOOT_SIGN_ENABLE =3D "1"
 FIT_GENERATE_KEYS =3D "1"
 UBOOT_SIGN_KEYDIR =3D "${TOPDIR}/signing-keys"
@@ -361,8 +362,8 @@ UBOOT_MKIMAGE_SIGN_ARGS =3D "-c 'a smart U-Boot comment=
'"
 """
         self.write_config(config)
=20
-        # The U-Boot fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
+        # The U-Boot fitImage is created as part of the U-Boot recipe
+        bitbake("virtual/bootloader")
=20
         deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
         machine =3D get_bb_var('MACHINE')
@@ -432,7 +433,8 @@ UBOOT_MACHINE =3D "am57xx_evm_defconfig"
 SPL_BINARY =3D "MLO"
 # The kernel-fitimage class is a dependency even if we're only
 # creating/signing the U-Boot fitImage
-KERNEL_CLASSES =3D " kernel-fitimage test-mkimage-wrapper "
+KERNEL_CLASSES =3D " kernel-fitimage"
+INHERIT +=3D "test-mkimage-wrapper"
 # Enable creation and signing of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE =3D "1"
 SPL_SIGN_ENABLE =3D "1"
@@ -451,8 +453,8 @@ UBOOT_FIT_HASH_ALG =3D "sha256"
 """
         self.write_config(config)
=20
-        # The U-Boot fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
+        # The U-Boot fitImage is created as part of the U-Boot recipe
+        bitbake("virtual/bootloader")
=20
         image_type =3D "core-image-minimal"
         deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
@@ -540,7 +542,7 @@ UBOOT_FIT_HASH_ALG =3D "sha256"
             self.assertEqual(len(value), 512, 'Signature value for section=
 %s not expected length' % signed_section)
=20
         # Check for SPL_MKIMAGE_SIGN_ARGS
-        result =3D runCmd('bitbake -e virtual/kernel | grep ^T=3D')
+        result =3D runCmd('bitbake -e virtual/bootloader | grep ^T=3D')
         tempdir =3D result.output.split('=3D', 1)[1].strip().strip('')
         result =3D runCmd('grep "a smart U-Boot comment" %s/run.do_uboot_a=
ssemble_fitimage' % tempdir, ignore_status=3DTrue)
         self.assertEqual(result.status, 0, 'SPL_MKIMAGE_SIGN_ARGS value di=
d not get used')
@@ -595,7 +597,8 @@ UBOOT_EXTLINUX =3D "0"
 UBOOT_FIT_GENERATE_KEYS =3D "1"
 UBOOT_FIT_HASH_ALG =3D "sha256"
 KERNEL_IMAGETYPES +=3D " fitImage "
-KERNEL_CLASSES =3D " kernel-fitimage test-mkimage-wrapper "
+KERNEL_CLASSES =3D " kernel-fitimage "
+INHERIT +=3D "test-mkimage-wrapper"
 UBOOT_SIGN_ENABLE =3D "1"
 FIT_GENERATE_KEYS =3D "1"
 UBOOT_SIGN_KEYDIR =3D "${TOPDIR}/signing-keys"
@@ -605,8 +608,8 @@ FIT_SIGN_INDIVIDUAL =3D "1"
 """
         self.write_config(config)
=20
-        # The U-Boot fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
+        # The U-Boot fitImage is created as part of the U-Boot recipe
+        bitbake("virtual/bootloader")
=20
         image_type =3D "core-image-minimal"
         deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
@@ -694,7 +697,7 @@ FIT_SIGN_INDIVIDUAL =3D "1"
             self.assertEqual(len(value), 512, 'Signature value for section=
 %s not expected length' % signed_section)
=20
         # Check for SPL_MKIMAGE_SIGN_ARGS
-        result =3D runCmd('bitbake -e virtual/kernel | grep ^T=3D')
+        result =3D runCmd('bitbake -e virtual/bootloader | grep ^T=3D')
         tempdir =3D result.output.split('=3D', 1)[1].strip().strip('')
         result =3D runCmd('grep "a smart cascaded U-Boot comment" %s/run.d=
o_uboot_assemble_fitimage' % tempdir, ignore_status=3DTrue)
         self.assertEqual(result.status, 0, 'SPL_MKIMAGE_SIGN_ARGS value di=
d not get used')
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index f022aed732..5afc161fa2 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -305,17 +305,14 @@ do_deploy () {
             unset i
         else
             install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-            rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLIN=
K}
             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
         fi
     fi
=20
-
     if [ -n "${UBOOT_ENV}" ]
     then
         install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT=
_ENV_IMAGE}
-        rm -f ${DEPLOYDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_SY=
MLINK}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
     fi
--=20
2.35.1.1320.gc452695387.dirty


