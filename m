Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web11.5921.1630492246425677500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 03:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=L37c873U;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.50, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9GM11fYXuUig2AkOyQQU7rT/gUp0ojsBjE4Wa+QLpGmjoBIs/Ej+vfcykV6cJZb9F72aG8oy58QOXfYZLeGQyNS+92x2gf7XNZvfko5qlbbffPpI7rPNXCzAjtDiWpxXs9pM7jyFX0UM15/P9GF/zkcWAlZtaIzWlS1eWotzQeqICxq7dKplA9SegeAwu08QABp1ONaCHM7o6bszcZ6XPtyGUDFsEPl66XLU5+nQRz/3nRoSrOB75y1oLxnM1KB7TD4sh5Mqst7rbfw0IZZx1iZtOPIO7rZMOe2SspOOVorSC0TyJkOAFQP77869dyWYNm6at8xN/1U+JXjdvImeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=y/OKNzC3xuYUvODHo6D30qg7wOGH+yMfN4dXUPT951M=;
 b=g/Wjb/+DOHqhI+jUuFwPZXzI7zQcBiY/f/VBNQhWoFUKM8xGtS4sQMZEBDm+czd1q2qopuOhJo4wPxmjy/c74ea6/dVeHN/5nQXucftIquGaJtr8OB7Iq8sqtuv2MFKBi8cVqNdBV6p3V0P9dx9o7odz8cJSUk88rw+58QggJRVNCbTaWWT9UrVAj8tvx++YszVJSy3ZLbZUjnKLPKqN7nuRsGJL2MPCW3LnYVdB+etawp1LTnx0Fwsqp/gLP3Avqg9mQhGg9Pg0DZ2PiVPWwEl2xRBQUcPqM0pmeOV7O2jhmq1+gQVqaksLKgRH+C8CGd4DMmet8ojerkMZMPi5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/OKNzC3xuYUvODHo6D30qg7wOGH+yMfN4dXUPT951M=;
 b=L37c873UrST438ibpzggP/Fr+yvSqVzS9Qt3fC9jkqFNkl+4uc2TTZfZNe4O7SPN9Nlnetvtn9k/eLOyZYHH5XSUFFyYWoFFdtV2i3CcqWjPOEF0UG/BerREjJGk4yBgkd++hXfCB11cUgP5KNYt90scyo+bHbOgpUGMTiQLCg8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com (2603:10a6:102:138::12)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 10:30:42 +0000
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33]) by PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33%9]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 10:30:42 +0000
From: "Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 4/4] u-boot: Make SPL suffix configurable
Date: Wed,  1 Sep 2021 12:29:54 +0200
Message-ID: <20210901102954.4629-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901102954.4629-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20210901102954.4629-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-ClientProxiedBy: PR3P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::24) To PAXPR08MB6735.eurprd08.prod.outlook.com
 (2603:10a6:102:138::12)
Return-Path: stefan.herbrechtsmeier-oss@weidmueller.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DE10512.weidmueller.com (89.247.126.241) by PR3P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 10:30:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68cb68c2-4da7-4e67-fd8e-08d96d338cbb
X-MS-TrafficTypeDiagnostic: PA4PR08MB6207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6207224DAF406B3170DCFD52D7CD9@PA4PR08MB6207.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n7IxlNiEVsDyocYkX5gmsMHyaszrUr40NS4hZEO612W2/7po/8Y1hdAOXIEjYCk+dewQ88rCydd6xvieP0/g5kY5nU/OeFAksuTHgwWadOvauqfg43+PKtU67rns1IeKeRV7DkeW8BoT2b0cCFRIcveVRWVHUJSltXRQuDxt1mhVuVL5EXpPuvDPnWszhyyByrRtNvvagJZ//dI+VVSvh/rG6g+EYRIUlNkEFc74jbQlaqU9/NbaD0QVRZvKw2O/7uqGslt4ThMAQyAtep8QVe2q7ASXXBB/xKPvJLJ1IrVALZUIUWMlh65OE0KTnxnUid2Y18zZQLQhEy0p6Ee9fRePxUGyKeMfdHpD5m+1mIOmnZM4s1L8M23C5bGPhOtIeuPNgGAdrF1wxlH+66lHncu48EUS6ilDR6QNvIAwY0uAtDanfvb5CNV0RYYFoATt1L6SckCvyCeUVgDRH0003upM0JOb6I90pcmcOTpKzmtXLVDneP3I2zX++/b4gdQCv6RakuE/11kFFuX0FxzNMWLB+FoiChly0aXWQA7Z/eNOYr7OuUIHq6jgAq4WJdFm6ceCBrEJXxUliJsiMRaZpKjXYQqKT9L1kaCX/IcsIPk89PPGIBPwp3mUO3tip+LJgMe4p/2BtW386YZS5A41OiRRwIwVavb2/tOk6KOnGSz4UvXAEW7PBEst1C0zjvVF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(2906002)(478600001)(83380400001)(4326008)(86362001)(107886003)(36756003)(38350700002)(38100700002)(52116002)(186003)(7696005)(26005)(316002)(1076003)(2616005)(956004)(6666004)(8676002)(66946007)(8936002)(6486002)(5660300002)(6916009)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RVI9AjvjuW3GHd2i58mJN88HhwMQRcFKV4Hs6gZsp+hJNki8mQTt6EtEgQII?=
 =?us-ascii?Q?VZJ5lFiU2nRL9BVSd4Y4ZUbovQsiqwvlgnOdafjxJoRarIkIzwSeL0A+y2sI?=
 =?us-ascii?Q?zv2EniG+kBjPQB9HlvfFKAbxB7J6FDpXp0aznsZ0JXQ9tpZE0TH3kTjAWAVT?=
 =?us-ascii?Q?XIW81IIvhnCCNhg/edSQuRoFhRkm6A5LbMWatiPkP1XPPbmyJuutE5RUbTUZ?=
 =?us-ascii?Q?gDgSbs6tdDhawdVEBljSC8X9QiJQ/UFxDgZgcNWGnof+WX6BpLiVtEsVKv5f?=
 =?us-ascii?Q?NCNjit3h5UL2i0fyhpD10C7i2aF/K3zyeQoTC5TNMABTccsJcAyAA6BLA4WN?=
 =?us-ascii?Q?U0xTNtlI9CjE1REcfF8uISOqq5ebMf58egmcTI0Fe1RFETDQcbo5y1Ojd9wr?=
 =?us-ascii?Q?WBFCsANHZcMPmNfRDtPI2DjTJMK7aI/RfOWWCYCD4w1bzyVjvapoL8pBahtI?=
 =?us-ascii?Q?Gfuh5HTOWWOQMKcB7APFoDeQ4eCie9TckCb8prQYD39vTT8gyr+XKQUomJGQ?=
 =?us-ascii?Q?aXDrxMc6CNXqqaRIQ9a6Yn2qUKyq66U0r74qRKGefzOwhzKC46m8/ljI8pXF?=
 =?us-ascii?Q?mL5ea/06O22H5MUCtqu+F9Hhs91HSrs1Hviuuxi+8hJMtmh/bJ+q6phE71Y9?=
 =?us-ascii?Q?tQiwPwFOTL+BsVIP3yZtan7oKtmPq04O/xds5CzsAiWkbNPbJoB23Eq14f4V?=
 =?us-ascii?Q?wNrU6YorwmK8S0FtkhS4phk7J+x2PXkLR6R5CQi8sLknerReVzpNXubFLWdV?=
 =?us-ascii?Q?5C3LfuVSq1BGf9JHZDNO7kxnaWVUqKYVMj8AKTSwePuelCyWsu/M9fExAVQ4?=
 =?us-ascii?Q?wDugd8SgEbxtqTbNYk5nyxUCU5B7o9jiFxZHA5SxnRbAC+SgMeK61CE0sPEf?=
 =?us-ascii?Q?7xK219B84Ppf4x/RBxIG+vk86rwln/2NTBRSgw63FoKRmUgukKZPnk/ZMbPz?=
 =?us-ascii?Q?mS0GKAWz/bDuTbwmHUY37B4sKuv2uzLDtpFkh2gMGdPT7FzQgGwavYW1ttmU?=
 =?us-ascii?Q?FzVbzd5gnIZRcJzfaPPQFaTdZSzu3JAYSYuXAHOELZyKYtVc7EgoasW5NT+6?=
 =?us-ascii?Q?4aDULtkVYo1jAwTytxLfoVz7Fv2s+2r4cUubLYt0vSyNfokmrqf+4D1rMrvk?=
 =?us-ascii?Q?GPhl2ge2Lg8l+VFYHY8oCJTC/yawG2j7nV6Gd/ITgEITMbjr186Gnyi54b8B?=
 =?us-ascii?Q?n1Fb1E3pSOCGF2fDpWoj1m0Dp2ueIxo7p1pWdTkXt0KoDtqeMw1tdXc70r2g?=
 =?us-ascii?Q?+E52KHujo5fqluCUwKJdEe4hskzIzvIdX41LDnQK6LMCC/McOn57NTr5vnZ1?=
 =?us-ascii?Q?VFzpUKwEazJTLB07baxl4fif?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cb68c2-4da7-4e67-fd8e-08d96d338cbb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:30:42.2531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjdRPiNC0kjsuIDXMIAz0VX8bUw7ufx/cyikV8LdLrnLEuIaQAzSk/0LNON/lzDEYrE75bY7bUEVQTpqfd2rqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Make the SPL suffix configurable via SPL_SUFFIX variable to support SPL
binaries with suffix. The suffix is optional and empty per default. The
delimiter in front of the suffix is added automatically if the suffix
is not empty. A new variable SPL_BINARYFILE contains the binary file
name inclusive optional delimiter and suffix and the old variable
SPL_BINARYNAME contains only the name of the binary without directory,
delimiter and specified suffix. This behavior is backward compatible
with empty SPL_SUFFIX variable.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/classes/uboot-config.bbclass  | 14 +++++++++++---
 meta/recipes-bsp/u-boot/u-boot.inc | 20 ++++++++++----------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.=
bbclass
index 54efbd027a..07a303d0a0 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -11,6 +11,11 @@
 #
 # Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
=20
+def removesuffix(s, suffix):
+    if suffix and s.endswith(suffix):
+        return s[:-len(suffix)]
+    return s
+
 # Some versions of u-boot use .bin and others use .img.  By default use .b=
in
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ??=3D "bin"
@@ -33,10 +38,13 @@ UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_S=
UFFIX}"
 # should be packaged along with the u-boot binary as well as placed in the
 # deploy directory.  For those versions they can set the following variabl=
es
 # to allow packaging the SPL.
+SPL_SUFFIX ?=3D ""
 SPL_BINARY ?=3D ""
-SPL_BINARYNAME ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
-SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}"
-SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}"
+SPL_DELIMITER  ?=3D "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
+SPL_BINARYFILE ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
+SPL_BINARYNAME ?=3D "${@removesuffix(d.getVar("SPL_BINARYFILE"), "." + d.g=
etVar("SPL_SUFFIX"))}"
+SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${=
SPL_SUFFIX}"
+SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX=
}"
=20
 # Additional environment variables or a script can be installed alongside
 # u-boot to be used automatically on boot.  This file, typically 'uEnv.txt=
'
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index f63f853583..f27fdd5998 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -184,9 +184,9 @@ do_install () {
                     j=3D$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                         install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/=
boot/${SPL_BINARYNAME}-${type}-${PV}-${PR}
-                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${D}=
/boot/${SPL_BINARYNAME}-${type}
-                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${D}=
/boot/${SPL_BINARYNAME}
+                         install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/=
boot/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
+                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL=
_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}-${type}
+                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL=
_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}
                     fi
                 done
                 unset j
@@ -194,7 +194,7 @@ do_install () {
             unset i
         else
             install -m 644 ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
+            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYFILE}
         fi
     fi
=20
@@ -315,12 +315,12 @@ do_deploy () {
                     j=3D$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPL=
OYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}
-                        rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/=
${SPL_SYMLINK}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_BINARYNAME}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_BINARYNAME}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_SYMLINK}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_SYMLINK}
+                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPL=
OYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
+                        rm -f ${DEPLOYDIR}/${SPL_BINARYFILE} ${DEPLOYDIR}/=
${SPL_SYMLINK}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_=
DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_=
DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_=
DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_=
DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}
                     fi
                 done
                 unset j
--=20
2.20.1

