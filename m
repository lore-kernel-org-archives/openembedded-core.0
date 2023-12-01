Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84E4C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 14:19:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.47])
 by mx.groups.io with SMTP id smtpd.web10.304.1701440379165976005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 06:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=ML8KuXpX;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.47, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgRWgQlr7tPAeToOOYIglheYthxAlN9TyUJAQk9rlMioFmKfsM24QypiBN8yYRz9+5z41AhCPLRf9O6XmMvXz4GJqnqnUyuXc/q9Vu8q2Wchlo6gRtoO3znG5gXWTffOBkCkToP1x7gOrC7asPpmydDJvTbslkAPoT0VGZ7E4Z1qVNhoCGYDi3gz42LgrX8FWZUNyc7G0Iud1SdgQESu/wffh8D6bV2TWbP8UojOenThHnrQ5+sISQU2FcLECem6x5wGIArEPycq8SS7qlw/9vhXCjeekoKRGORe8y9IyKy7skNtL2j/XZiOYw7ggxG6RefgoasXZs+X4urYOzmmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra19jQ2Wz4IIvHInYMWq2YwwTqqWXJ1ENO/IpHDOc+Q=;
 b=D/YWktpyMC2UJKw/L9DtaGaZx5F+5zD99h0kFZxJaPuPMlmeEun8g23nfc+cqL5dh+tG75xaQ0KFYPIXuWZ7fuyy5vrhEk0dmIatUDoN3ryoy/ABEq3VTlr8KQu5cM+UdSDqzBxZrRLNV09LTXGdAbAvqqmI8xHjX9FHC9c8dkI3slUeXRq98Lm2gLSUDHt1P3eQ/23bl+fTJD0ijAYckkcHGt6+VMV932ttjT00yLq51IEcttwv4sBufKefYxgd+vytoIfkH0LLH69sNj/Uc53kxbQRke6Ij8wdI+2fW2rBrIAv0FQUAdWs7ca/ayEVH4t4Y9G+JZv9zEouUWuL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra19jQ2Wz4IIvHInYMWq2YwwTqqWXJ1ENO/IpHDOc+Q=;
 b=ML8KuXpXFppiwubj1TDzkhLssIxJ8D7gvPvaWShfWYdxSxVCeUxqh/+r8Zmxqm99rOOJOo3l0xN8w4LAtobhtScK84SIbMvpOaHCaCZzheMkLA4jOG+tNs8tci4DbDywoF503gqaPRCSnx+IbV0qpn2DCvoK6QMk6xL4cYomy4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com (2603:10a6:208:165::13)
 by PAXPR08MB6397.eurprd08.prod.outlook.com (2603:10a6:102:12f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 14:03:48 +0000
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5]) by AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5%3]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 14:03:48 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Kareem Zarka <zarkakareem@gmail.com>,
	Kareem Zarka <kareem.zarka@huawei.com>,
	Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][PATCH v1 1/2] wic: bootimg-efi: Make kernel image installation configurable
Date: Fri,  1 Dec 2023 15:03:31 +0100
Message-ID: <20231201140332.2145367-2-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201140332.2145367-1-christian.taedcke-oss@weidmueller.com>
References: <20231201140332.2145367-1-christian.taedcke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0425.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::12) To AM0PR08MB4946.eurprd08.prod.outlook.com
 (2603:10a6:208:165::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB4946:EE_|PAXPR08MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8cb54d-304d-443b-a099-08dbf27656c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5MXslMJiTiGoolEa6RKA/q5NUtc4hsbzp/nunxHhRE22Gx07rOX1ojuGWftggDcYESJFVB5m0zPW/L2VFOyE2z9igXGrSvL3SYavYeOKDu1Qh8ZTcbkQ2cAWvbPKkS9KkAek2mSQ1AE2xVpqlzsNU6oqcvFBUBs6/neTViqDV1xTRnPMvAqQJjq0w9TNTKjItpbh6Z298/8RjikK7hFbIiU2V2fRa+oNbZ3LvKFSt0+yucdcYpxORgyIkhoaDSgkYRTcOq4UZSsrfBNNDTh6JuNRHnhQDNP00Rw5v0yYfcH4dBKvAF6rNocdQ7puhrGQmzpeRPMc8QHvlArA7dSbaKgQOzmSoYZNDAHM8XOe2g5NKL1zRBeidCt26hdqx5jEcdt9R+LeN+k9GDVzY/5rL1edE6rVlva7QVy9rqEFeATaNLtMNKNxyyopFMOILdmhChMN7UORQzvHO72LNLz9AfP0yABUyHnBhIKS+bXnQysZbcNKZlBFt02XwsBDSia5VLP9tNahYxLPRc6SEOAn8wsP7VFUnrTxM/TyuO/t0YFduEMMEqF0vtdH6pXmVlsTlcOj1//QYZWiImOCNhxzFJtSJv2mRKxx7GIoajb4rwrWSDHpNh41irl/yfSkxWwm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4946.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(9686003)(1076003)(107886003)(26005)(2616005)(478600001)(6666004)(6506007)(6486002)(52116002)(55236004)(83380400001)(2906002)(66946007)(5660300002)(54906003)(41300700001)(66476007)(316002)(8936002)(4326008)(6916009)(66556008)(8676002)(38100700002)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9L4lzqDX+NYkubDGj0YCujTEWrKsnoHT1C56uOoAt1wukX1qeSdygLVSZ4wo?=
 =?us-ascii?Q?7RogVSQEsimnlm+pN+g6adsPMhieyj48Nm12ubdSKmGGjoBESN5UeVxGQM4Q?=
 =?us-ascii?Q?0m1wV1b8eiWlxsIY7Y3fJRIcWbCcTvPyo7faqbaS9WXkREcqxBUp/PXAT8bj?=
 =?us-ascii?Q?MSGjKWqVRkpRIKO0XfaYbbk6KuCDX42OPwK5AKkEB64Ja9Xy7/elaNi1AzPM?=
 =?us-ascii?Q?pAotIfdWz10U0sPCaWPYWJoyDKx3Lvq3k8OzydT0dj1mnZ1+n/34NPhbG2yI?=
 =?us-ascii?Q?5CNQFRM75kKaeakIwfsm0VNLljf7f+WOTxDFpxgyLTelOLmkiLS6xh6V2f/L?=
 =?us-ascii?Q?bjpSSpKSH9aeIVqEQ/u/CVoV9/ok18QenSvq3OPsFl/aszondVv3c79xb2FZ?=
 =?us-ascii?Q?WhG/ZTVq9fE07cxtslMMr4hcB1JmUe7qpbL06pYfK6LerEyAH3yyHJvTiJx8?=
 =?us-ascii?Q?WEx2FZUKjLbjMhdTz8DOTLqIniBeFiogZ/KP5d0a9Ff7OkFDlMN+s0Nf4Zw/?=
 =?us-ascii?Q?lf4WTn4oR2OXmuVdla6jtZ/3cd3zuuj+PcL42lJotdPSB697UwHKTF6lI0+0?=
 =?us-ascii?Q?KpexP9A9H80dgvpdml8vaOskE5pcjJTTKkSaDZfbCSHQxcomsXZagAdONT4R?=
 =?us-ascii?Q?8QUWF+UsIa5lcMsKK9S9NY6t7VbnMhW/m5GObptgNZ25R9oOO4KeKfchc06S?=
 =?us-ascii?Q?aDhf4tLJmt8N9c0QhtHWsts08Dfh0QpFzvPQgSWwBNhEtKMqMSByELOrtxM1?=
 =?us-ascii?Q?yPuAOCsIwLmkMTMg2xwYEz57Xjeo7kduxh2bslgqQey+FltD0LklqjQWxAPI?=
 =?us-ascii?Q?BPytXVPTmbSaigajeqzUmGalBTIKhiol2xUZNNhvWA2D4lnzmTW+YVPLVrFa?=
 =?us-ascii?Q?yp0XNNdB+JgJAcEy3+v9DRSEz9R9taeVnbfrgbtDf1bYcO+2+eQbKglxhV7z?=
 =?us-ascii?Q?SgmBX8m/U8zwSO3e2S02etELXolum1kkimLqYytiUkIKoUM0PNZIqHhH529+?=
 =?us-ascii?Q?tMMAvqnLjDxqntGk447pZEedYJxCbfeuFhnL2NMSa5HGxBjW6P8uvreASBPT?=
 =?us-ascii?Q?uILzllpj2ZNH+g880V89kwJgUbwQiyP0jxllkY9KhEegDeAE/rIiAWNM7zYb?=
 =?us-ascii?Q?Mpv0J8/6oWZzRID10D9lHHGac0gx96QgMt86F7vlf+NYqjej/vMde16Rz7vG?=
 =?us-ascii?Q?2AEaubpjMIJwpAot8OVzl0memTgthfr23rcKnXmZPl/71B2GXOIyHQW1fHKP?=
 =?us-ascii?Q?Rp9+fIv0TNMC6s1xlV0HF5InTh2DL5AlsRLYxlmZ2UB1RyMUT/20Ui6BtuWh?=
 =?us-ascii?Q?lb78JVKcjmhHUuZ8IstSq6ImK/DsB2g7MeJpDztEq6EzLG/nTcDTmqJgOivF?=
 =?us-ascii?Q?Su/hVJMhOVvFlw6Cu2gGlx8llrFXO5mwrkVgPAQImC3YfFky7+t9P1IjAIT0?=
 =?us-ascii?Q?N7JkL2B71kA+ZcvVZzg3MsThqYm+8tDIeQM4L9DPkbRXb6zF3EBJ3JXgQbfM?=
 =?us-ascii?Q?AS5yPULX70PnWb+CWhBPjSh5ZbNRWVtZlhlnRsA2renGSJETfLr0gq5xDQFt?=
 =?us-ascii?Q?/NgflKw853EUaQ8ERjSk9++fNri/hBew5wIHRAvnkBuq3qzspl+6LOj5vW3f?=
 =?us-ascii?Q?impZFaBPfwA10KQdssWAqENLD3OqJX4W5tW/bzPcVn1x?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8cb54d-304d-443b-a099-08dbf27656c3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB4946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 14:03:47.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuGLrPqVQmOue6SrzrHUwUdXXMhiXYAAla9Xc8gUV0JeOBc90Tym+VFW1SSnxGGyZXEeW/Rac0ySByiz0+UqRfHZGLF77m/+UPu5mDySlZmJdRrXRxPFg2omlNz3sTVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 14:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191669

From: Kareem Zarka <zarkakareem@gmail.com>

The issue with installing the kernel image to both rootfs
and boot partition is that some systems rely on the kernel image in
rootfs and not in the boot partition.
This leads to duplication of the kernel image, which can cause
unnecessary storage usage.
This patch provides a solution to the problem by adding a new
parameter "install-kernel-into-boot-dir" to the wic kickstart file.
If this parameter is set to 'true', the plugin will install the
kernel image to the boot partition. If the parameter is set to
'false', the plugin will skip installing the kernel image, avoiding
duplication.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---

 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wi=
c/plugins/source/bootimg-efi.py
index 4f30926f1a..13a9cddf4e 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -400,9 +400,10 @@ class BootimgEFIPlugin(SourcePlugin):
=20
                 exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
-            install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
-                (staging_kernel_dir, kernel, hdddir, kernel)
-            exec_cmd(install_cmd)
+            if source_params.get('install-kernel-into-boot-dir') !=3D 'fal=
se':
+                install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
+                    (staging_kernel_dir, kernel, hdddir, kernel)
+                exec_cmd(install_cmd)
=20
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
--=20
2.34.1


