Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166BFFA3741
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:38:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.1487.1666395471881117197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com header.s=selector1 header.b=s6PYXL1F;
 spf=pass (domain: seco.com, ip: 40.107.6.78, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRJvGIgR/QjvSA5vGha5doSZ8h4knnK0x7Pyjb8aR8GmXe4zWzrpZ+t3FsLcEq5B2Pddh4TgGcK+xhCRv0VjD+VSiTQjRbcVHJO3XW3gzENflM8SNDGPJU52zfQicmI7wdflU43eGiFBvwpB/mNxsR3ZsXa0sEVh+XD/z+4oTFDedUO7iTxZsxMqai8yGLy7oqFrJtdZ/9NTpLE38ot9xw6bhRApeRWJvHdj+ycgaFj+Ho+PoVRt5EGW87VM9BNH7UPURAFjpfoKloDgalsjwNp6yzeYoWpkKRi6nz8owhqfYzGN7lx4Z9tFa0alDDM0FMfw0SlCxfODQX4Ql84vCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJkfQEcSbg4q2uiBdMjnBm5L1QgagYru4HYKxMmpdnA=;
 b=lTHSyOcg2orYzk2jFGf/WBto1424eRIpZGV87V89WDx0K0n5w+UHec2CR8mvbaJQCL/iBjloKPFovDDwRGuC7AJNc5MHCjqir8ffrRkCnC9qflkLY+wBnitKes9S521Ojhmb12nvoOeW9materWQw4Fkue2dqeueGpLbTZARL1nMQRIzLyI6PUfw31fepso4Jpoxvs7v9T4jUZvC3PgRKTvGSwmfcAJo+9Ya9LhZHAwXGJ2X5gE40uU3kFut2cBB+gKz/Tpntvy16WrjjGjqSJW2QRrK8Xkl5XjOLzMsiT2UUdoZGSZmLT8367CC18M+iOHlOYNu5zIcL76LemPnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJkfQEcSbg4q2uiBdMjnBm5L1QgagYru4HYKxMmpdnA=;
 b=s6PYXL1Fl+wqAQqWo6KBDLJOVVC/JmpUXqZoZTrrATNARmA+HxRnkBYSNpvvL3I+pp78HyHXJVHtUU4wJCyA5mPs2EUxmgPETQw4Z1QqpbmVp/UtxNnVQZWL+fh8EzkCuhtAY9z7vJBpetUqSpxnD+RN3NXJTUUXblOMLSpHrYV+H5mDpNtRghbOvQLQaOsc/Kr8/qM7ubrBKQbW6ISiZwNH/InubuiS2s9GRS+21cCh/4LT1GK7aDlk6FzkZ/IP+4iMuFGwEMvhWic6oE3okJOxppzVqNmCSbvWx22A76mHYxWTGv2/jCea+3SBcJdjGXf1qn/51UAoPaxxDmLaKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 23:37:50 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 23:37:50 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 3/6] kernel-fitimage: Use KERNEL_OUTPUT_DIR where appropriate
Date: Fri, 21 Oct 2022 19:37:23 -0400
Message-ID: <20221021233726.1751124-4-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: b2a1c879-24a0-4820-b10d-08dab3bd4412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NSvIA1J43lF8By+NEGqJxLNzEERBPTW+0YFoHwIFyA7fzhgtFVVZUgPgCxHn7dDaBGz4RJ1WAAwS0xfk6Q/rYZXtTjSoOLsBuaeO+bpswnrL8kxMOVruWn5bK2zMagxLHpeBOv6ydA/HfrIFubxp0Dw9lQoB+V+qB6S8Sha9bo2MQ7Hy1iTzcSlUyqWW4axSIdCzY8S8Kqcyto4/LSzBwvdvrjHiq3WIw3tn94oSiaWmUMzKXPjQDVUGmQHkiwe6l4xlm5x2xoFd5N1bj7A7YRRMHTD86dSLxABjAQTL9QDeWInqP4ApZnrOomMwLJ07qsmNp6h2fqy+tEaZAzL3tH+wG9gKEXYlGWXhfLVBIUs50EKm5MnXGpSP9dv5rKILW7OXmkn1eMsi9sgyCBHEkLI50urlWGv6GQiaHEqWMkZwIdjUImvK+sMjY6SDvis6N3ElUWBaiw+o9wu/chLMHYaXGdePcDzUh78K12goA6PgpHYaNY2sN1C1TjDwCSF3Nxjhvti5CQZGhl2GGZrpS4VznTNPN19KU5zGa6qawR7dV2Yxaz09HFIzGbfcL7aTPJCCSw9fvuMo9l8qSjcwOhQG+doXrxHJcW8oJUV2Z6E+uZb/hf4mX5NgNnqvTO6WERXHiLNWLQ9Qi709eAGVoJoDIWuR6EG1pSVHsbBwBMVFwz6VeFbQxwyG9xtpg66u9wYEHD+nCuFedeNpch/Dg48sUyf21olA/9SXej3r8CdZVmxX7q3oG6FfyM4+ty0uSL+rJDIEfXDw2nu2g48Zhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39840400004)(136003)(346002)(376002)(396003)(451199015)(478600001)(83380400001)(86362001)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(107886003)(6666004)(52116002)(36756003)(6506007)(8936002)(5660300002)(6512007)(41300700001)(26005)(110136005)(38350700002)(38100700002)(1076003)(186003)(2616005)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IQvhMfeKfS0engI/CoixmIyapuzC5jWh/52sWtCFrF/5a9wVpMdLSSB7+kcH?=
 =?us-ascii?Q?x2NRjUwgIiTzQmAW6imCgXXR0gTL37x0QTRzs1z6Lc4lFaG16Tyif9FxuSuo?=
 =?us-ascii?Q?0QGZt+7lMk2LthhfLluWEIEq7eR7+H2++c7UWjQen3aKunTW01k4z3/yuZBc?=
 =?us-ascii?Q?Gb/Ne+UqbfedIOayI8NGSdy0HetmUTHxGu5g1aPUIQqJNWWp61ln5W9rF1ps?=
 =?us-ascii?Q?19V5OV7KhxeZA39Eak6xtskdrridvOjZWDDD/mH7wIlsKMyCdhanqFsfD30O?=
 =?us-ascii?Q?0J3TCL2xM48eugkSLDqwSILgjiWnr+GtJfa9YW4ZtX5FMaftAR/H+4cba7Zs?=
 =?us-ascii?Q?ZDQv/pXv07XJm5KgPjp9HsqZYW8Oiy/n22DVfFqXuqrfZ5vU3R1OSY6zbQIJ?=
 =?us-ascii?Q?5VyVZCfDy+IDXlpC5YI8b0ZLRZXT57wJB1yHuvHZg/geo2DzqE6V+Ka0pzaG?=
 =?us-ascii?Q?bkdC5KByiouJ3PdI98msK7oiK+Uqbg1tsQsV3DTJyn7yExHQ7dCCqISQJkpm?=
 =?us-ascii?Q?CBMgZKkBPxJlUkfoeTEEhRTPU2J0+62ZGalpKXcPJN4WUJOQKSXCrib3WYPB?=
 =?us-ascii?Q?2TxkoDEFDFI8ijAo/h0yebhP10xcw1D0PAyceTe3pj52KX2tG1FzJgtg7xcN?=
 =?us-ascii?Q?mHOkiBFqEffKbNuhw5F2Zpf2uF2QBUKMKJVSE7RyOJ+0gdgoQ67V8O+b0tOV?=
 =?us-ascii?Q?6DoIOepySbvmmkB6UCkTD1YzaSGTOrHGVmxKaFk4xX3eT0IHiAiaKCGfHkGd?=
 =?us-ascii?Q?Jm8qnRwkRnKqcM3x+5twe+Q9pVuzxXwyTQrJtPA9JNaQkhOK3DQxAhCZvKYI?=
 =?us-ascii?Q?VF6evfBme75cu4ZRQbKucFEG4xE+FmvlIcVYPWSUTPCGn7Yebn+vmSbTC9pe?=
 =?us-ascii?Q?rsbKA4OF53OQC8AbH2QdT/ZI/vr9NlVtsdUar5nkuqFrjBUSUUBEMyxj4IKi?=
 =?us-ascii?Q?UL8+LW7tMkGCmz/UqQ+xaeVkc5iWI+O6qcBni2cBGEm4bLFJupXcP28E7kkM?=
 =?us-ascii?Q?HRcBOEzZ7wPtQvUq6/6wpkyN2BRAv8S4b0Dx5cmUTI0DtvgzCWmpCUebIFPA?=
 =?us-ascii?Q?Ak+8BM5Jz/zzQ4kHuXP69bj8JOLwDWsquBdekEtd1wAhwIYXrOHngSZRipH9?=
 =?us-ascii?Q?RaZBWbCHuJwof4aV//ukTh8diqFCfshBsCF4UnYu5+8f1oNmtqZQabTLdTvT?=
 =?us-ascii?Q?mrIe2Qb0gqJXWvjQO1aS+sDnCZm4fyB+qQrvfJKLTyPIp9n+tUQZIxkpUVmN?=
 =?us-ascii?Q?Z9R7qwPb41mpXZs1RgFri9d/DvbDPis+XDP2504HKq4Ja2SCxaqyr8muUFZl?=
 =?us-ascii?Q?NXdHqPSc6ue+eJHIbi36lqbVIDS8yJxroIU2GLqmHQrvd7vKgs39YwhiFAIU?=
 =?us-ascii?Q?ITT+37tq5EMH7UEH98C+MxsvWqo7bJ3oljqJ1FZzyWYzxLOuXy6cbWM4nNnO?=
 =?us-ascii?Q?kXUEwdtcRXbvVCfSeFy149Ln0bm7Q/ux3jiy9NTz+wz39kgTkEwNoHlkMMTz?=
 =?us-ascii?Q?8KstS+p2+y7UgSHHXsxdlbNe8e7rZqjWrmDgz15/RCY08td/0i2kAeNV6UEV?=
 =?us-ascii?Q?tRvHEPL+neE3DWjW19QRimsuKYgpkfqB32WFmz4QFGTL6OxWu0ixMyrzMl+Z?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a1c879-24a0-4820-b10d-08dab3bd4412
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:37:49.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyRzk5mcKYg//rcjuCqvl8lqL4eDZEhefYrYc4sTgwUjLAMW8azvK7i4jH40LZVdk+Ye3kl+508NRt+ErJZ3+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172052

We have a specific variable for the path to the boot directory. Use it
instead of open-coding this path.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes-recipe/kernel-fitimage.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 107914e28c..8ddebf8dd8 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -496,7 +496,7 @@ fitimage_assemble() {
 	ramdiskcount=3D$3
 	setupcount=3D""
 	bootscr_id=3D""
-	rm -f $1 arch/${ARCH}/boot/$2
+	rm -f $1 ${KERNEL_OUTPUT_DIR}/$2
=20
 	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" =3D "${UBO=
OT_SIGN_IMG_KEYNAME}" ]; then
 		bbfatal "Keys used to sign images and configuration nodes must be differ=
ent."
@@ -529,9 +529,9 @@ fitimage_assemble() {
 				continue
 			fi
=20
-			DTB_PATH=3D"arch/${ARCH}/boot/dts/$DTB"
+			DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/dts/$DTB"
 			if [ ! -e "$DTB_PATH" ]; then
-				DTB_PATH=3D"arch/${ARCH}/boot/$DTB"
+				DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/$DTB"
 			fi
=20
 			DTB=3D$(echo "$DTB" | tr '/' '_')
@@ -574,9 +574,9 @@ fitimage_assemble() {
 	#
 	# Step 4: Prepare a setup section. (For x86)
 	#
-	if [ -e arch/${ARCH}/boot/setup.bin ]; then
+	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
 		setupcount=3D1
-		fitimage_emit_section_setup $1 $setupcount arch/${ARCH}/boot/setup.bin
+		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.bi=
n
 	fi
=20
 	#
@@ -650,7 +650,7 @@ fitimage_assemble() {
 	${UBOOT_MKIMAGE} \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') el=
se ''} \
 		-f $1 \
-		arch/${ARCH}/boot/$2
+		${KERNEL_OUTPUT_DIR}/$2
=20
 	#
 	# Step 8: Sign the image and add public key to U-Boot dtb
@@ -667,7 +667,7 @@ fitimage_assemble() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') e=
lse ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
-			-r arch/${ARCH}/boot/$2 \
+			-r ${KERNEL_OUTPUT_DIR}/$2 \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
@@ -770,7 +770,7 @@ kernel_do_deploy:append() {
=20
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
 				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$d=
eployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BI=
N_EXT}"
+				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} =
"$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT=
_BIN_EXT}"
 				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_F=
IT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_=
NAME}"
 				fi
--=20
2.35.1.1320.gc452695387.dirty


