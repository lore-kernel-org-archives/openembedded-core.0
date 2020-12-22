Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.83])
 by mx.groups.io with SMTP id smtpd.web08.9888.1608633770209434895
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 02:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Nw0/CbzF;
 spf=pass (domain: windriver.com, ip: 40.107.236.83, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUmi8RzsjczLDflVO+oTnTRLpFEvYPFbmu2z08RgmPfLxkBIFl75jcZjHAFJBybFKEK3sYaLKSPQOtsIT05SFv3UK0XspQgbxTtTxjSG1DxTzT4nbjj4nhRHOOfli1C8VI5lPY1OEFX8vXplofpo5fByS/AwXWcJSOoCYDt/9Ixf+48rBHbwkrE8Zb1dt49gEW91NLP88991qfG/abv9UpjWRnz19LywMp6gDzAnE9GJFRAYS08p0XSkBH1Y0QlZdtqXenNJO+jSJQ+n4srHO5+g4UorpI4AdqwzYCEukyoOa7W+83OHOBMRM3PI3DUw3jmmxgFXfNjHu+WUt54IKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMoFUXi1D+kMkjLpNktPQnIHmnnkRwhHttC+9r1IkU0=;
 b=KqIqKd3EJsWXnBCpRv8CRYJwY+le5troOzDKleMsJyOh7C5gW+Cn4DCsOsbOlqbY7hZ04HayGfcmrh0jSKeDJY4d9Lj5ips1fDLgMMjqonmdsweeWaVMS4z5JCrPWXNGk99FbELNVfcCyC4x9fnubKeOm2IUfANqV+Gh0wkS7KZVY4j2XbA82hoSm+Zamzf+GO8ZB9l7Xva7Raoeou5+ATe/YYekn1/Te+jhzjWW4IB/HMd2A/9SLHzsXv2SCHbLN+/IcFe0cBoZHbdcvCFzPByghSTrgSEQqHvuB8hr3KHHd2EL/g1ysSO9UK6UowN81O3byOpI92HBm2MHVK7dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMoFUXi1D+kMkjLpNktPQnIHmnnkRwhHttC+9r1IkU0=;
 b=Nw0/CbzFiWhtqZ6RGKaWHH80UuHRUwZY9bj4tmi0hs7nA67h5PGZ1WFp9B8ZSHwEunITNjhllesjmECkQHGwc5Zh34KDtotqofD95CDDKR/CcMbFvb7SUwsV2eXOJ0e0ddlThcVs3qX7EuM1BxxHQsBb4K4bLJdK5DSo8xt8H5k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by MN2PR11MB4397.namprd11.prod.outlook.com (2603:10b6:208:190::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Tue, 22 Dec
 2020 10:42:48 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 10:42:48 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devicetree: Introduce KERNEL_DEVICETREE_FLAGS to pass dtc flags
Date: Tue, 22 Dec 2020 12:41:24 +0200
Message-Id: <20201222104124.39262-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR08CA0108.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::34) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR08CA0108.eurprd08.prod.outlook.com (2603:10a6:800:d3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30 via Frontend Transport; Tue, 22 Dec 2020 10:42:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b75e9a97-1592-4c13-2312-08d8a6665304
X-MS-TrafficTypeDiagnostic: MN2PR11MB4397:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4397624C859656367ACE3CFFFEDF0@MN2PR11MB4397.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lz26jE2KacMgX7wY/Sk4e6vx2rCdcsygozeW0TLhGIiwdLfN/pvZPUzIIqNFgtUtkK97gJJAe7AVC3eUnaNY+4Ef16tkdfjmZYWFzF2hnSO2DPQHa7bwNJvExNl+5qgHKY0eeQSZ0964QDKMGuQBzVsfWSuveBi0EX3bdqO1b0X8xolvpRM0ABqLUxDrxe4qNDmM0v7Df2zrZobEGbHpq4aQqIGY8fkzHz3n+0zdAdMz/roSJ6XE3QR2rKmPxJS16u2h5po5Q8zJKJtCk3dUgHCPhZSfmkDT1Br+U25b3NfoMyMTDE8mXAsT+noIxK2nCbcP6Y2AMWaMUD/VpOUgLhnIV68mOUNP/zlWkA6IGuuWRiPhtxQ4RpJ7Yye7u6Y1//BVirjDFQV6h/vkzQUNgQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39850400004)(346002)(16526019)(186003)(5660300002)(26005)(6666004)(6486002)(1076003)(478600001)(52116002)(66946007)(83380400001)(2616005)(36756003)(86362001)(8676002)(44832011)(8936002)(956004)(6506007)(2906002)(66556008)(6916009)(66476007)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Nqz4OK3zRNmtrCSUVTx001BZZHK69L3MTC7B0JAAp9TDgBBpzusowH9WyVPs?=
 =?us-ascii?Q?Q70zzL5O7HWtDvia0xPFTx67wTFWdoRbJi+bGhh5L2BX0/WH16FTi4Tu0w7m?=
 =?us-ascii?Q?HGTtUsTCQnlHvpkQmxHYDLUQ0r57HrTtrjQLVGXSQKawBjOG41dTjqUALskx?=
 =?us-ascii?Q?uuTFkp6ariGlD9B/Adml7qYFq3TD6uL1rNxxWf7RMqaYOZWd+JH3fKOtgcGJ?=
 =?us-ascii?Q?VTIUd9DB0rpcudMJjaY6nqMtTi37+KQYWtHCtC7ZXKE05UER33FqA1E+HepW?=
 =?us-ascii?Q?Il1WgBQPQcXuN5QiLwfLpEPDNROWswHrWpc8e1KKsN/sIlkmY7LGZuzkAldM?=
 =?us-ascii?Q?QysNCSC4GXG1F3J3733do51SS2FvD+lxMXJhdsC7cTHLKLnJKl2976WuSoIn?=
 =?us-ascii?Q?SV/uxwLJg7/HnmpJ8nBMHjTzP+r7N0GDo6oiTsCtwXLUu2n5nQzAa+Dk1d48?=
 =?us-ascii?Q?PZN7OspCUasxX2Ru8lYslF7vQ0CHZf+m7EnAHvOldK4zMI9LTaXgMdhXlc8+?=
 =?us-ascii?Q?hlvTKZ3CYaE9OBjwen8+151+SCPiPJDSmkO7PMG0XNo65RyDSmiejZ7eQhlJ?=
 =?us-ascii?Q?U2J98Mz2p4wqsj64AmkvRO31S0BItTAr9e2hrojX17buEPZjGZbVdk5Y/GkS?=
 =?us-ascii?Q?7C/nisQqK/WK1z5VLR3Msg5LDu8ph/mvJQ+4OrM6scJ3AMCsPPoae7IdaQ2T?=
 =?us-ascii?Q?QeYOXy1vqGt16Z5K4jUginlHmpAQEeNeR0PMnQ6Tx3SlkrFk1b/ath63Mvxv?=
 =?us-ascii?Q?ZSdHf8q+Zg7WcAr2nignt5dy4/+xF6F9WE1nZUrKOeOPKR5+ifiCCx7mAKSt?=
 =?us-ascii?Q?61tFSVcJTiY6Suw3AYdxiVwrEb50Kkq9/kkMZ+muHq37mMrkE50BFcNzjiSE?=
 =?us-ascii?Q?0p2vm8BoPTZOT5YRmn8or2SUMANBVeFhSVhGx1689tDX5EX+S08xc3RY24Qe?=
 =?us-ascii?Q?6Uc8ehFoKpzf/YdUIxIzKX2SFPKVdAzHCn/sSkKb8XhpPvyUJegxOSclSMfL?=
 =?us-ascii?Q?G7IP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 10:42:48.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b75e9a97-1592-4c13-2312-08d8a6665304
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjbvEzMhL8QS9q9ZjMrxZU60g+f+9ghHjmfjhOC4RMF/UXYj+Yxzi3xHIQ/kWu1qYqVSQlMVYpAiJrNlgm3W6+zA4b/LHeWBu9AZH9w/IjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4397
Content-Type: text/plain

Currently DTC_FLAGS kernel makefile parameter can be specified directly on the
command line by adding it to KERNEL_EXTRA_ARGS. However, this prevents
scripts/Makefile.lib logic from appending flags that silence dtc warnings (all
assignments done from within a makefile, to a variable specified on the command
line, are ignored).

Because of this, the do_compile log is cluttered with dtc warnings that should
only be printed when compiling with W="123":
...
/soc: node has a reg or ranges property, but no unit name
/soc/gpu: missing or empty reg/ranges property
/soc/firmware/gpio: missing or empty reg/ranges property
...

To fix this, introduce the dedicated KERNEL_DEVICETREE_FLAGS variable to hold
dtc flags and export DTC_FLAGS in the environment before generating the dtbs
(make allows "+=" operations on variables that come from the environment, so
the warnings are silenced properly).

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/classes/kernel-devicetree.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 81dda8003f..2066096a9a 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -9,6 +9,9 @@ FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
 # Generate kernel+devicetree bundle
 KERNEL_DEVICETREE_BUNDLE ?= "0"
 
+# dtc flags passed via DTC_FLAGS env variable
+KERNEL_DEVICETREE_FLAGS ?= ""
+
 normalize_dtb () {
 	dtb="$1"
 	if echo $dtb | grep -q '/dts/'; then
@@ -50,6 +53,10 @@ do_configure_append() {
 }
 
 do_compile_append() {
+	if [ ! -z "${KERNEL_DEVICETREE_FLAGS}" ]; then
+		export DTC_FLAGS="${KERNEL_DEVICETREE_FLAGS}"
+	fi
+
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-- 
2.17.1

