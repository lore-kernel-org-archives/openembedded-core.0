Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31626.1793876992219552122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yww9TZUe;
 spf=pass (domain: est.tech, ip: 52.101.83.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBznjJpIYgSWLhJhijK7CUvNxtTMLHMJ88VnsftiKS74h/doaEM0QI7sbVQi8ClbzH5tz2Gcg6VlOwMe+P0b/pEUVew+49wMGlI/XJZzzD9rqOVeE9MoHmGhTqmiIwMOwIfALCPyd2ffSPp3xoT8EZKNz/WT5Cki4bwubH3g7rJtIdQMpaC/g1IUJu3TGHE4Z+h7Fi8KwanYzn79zqrkK+KEsoRqg2efPR9LesuMVqiEsTO+YePZjXPeV+u8mKw01FW1hWrHOiULtoCp0UReLdXskOrixhnLXlY7CofzkZFbrnzAoZRhMj6YkFxHwRMDRpmvgj0YXXY7KMZ9+5uK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is4KAdsjmhW0R5y05FDA+k6z7Y4Sixu1mfNNPLBlEBs=;
 b=BZwAq8dgUhaX3LAHwTlcwTjorYuEEefM43bVc60HDBP4D0jMgmg06SED3xeumme/B61B4aWlhHFUjqnS8qiHTuYaZ7ZCqvlFHTLk+BUqVQDjFlpEgRLWtCR/n4XXAuFRZ2572D/E7/AyydRMCidJldlxNu33bimnAY9JisFvxaJC3grMslmZVyBX0XuO+Bvho7ZDZeCy8R+bHv5qFoQyIZuOrcYL6QwsSMd66T9G9qvAjkuESeqnB7DcY/zhhBZbLtZuhcqz+ZvdFuiHIi8fORt8vjmNs9n/WiuXGkY1MnWGxy1LEk4v5Jk318ZBT9uH8Ys9MjdGdKUV11nLie6Tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is4KAdsjmhW0R5y05FDA+k6z7Y4Sixu1mfNNPLBlEBs=;
 b=yww9TZUe2F392pw4c/Shsx49j28WJ1zmQeV6OihtrtVtIrgLmF4BIBM8t9Bbml3bqASqT5OP813ExR8O8AMZKoN1I7PE9rLr4TPF9wchUK5dw+QlYfTeCS8rHRCYTH/YCJ31tmbeGGUFTFZwJoABzO3ON/mvfZWS2N7NZjr7AVpZ1vHYcD/hXwYWwAIvo8O4Qiy8G4wY3RkdEQltUZB1SvhbtcwCqScAAh3p3ow7VKc06A4CtgZk0WOJOIathAkaEGP00RsnAxQPBZ8EsrGXeiBRWKl82g/7NloHbexuBi1R4eiZk27N7iefxdCxuA6gXLWC8bKuyqBXdP17Olfbng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF0806ED8F1.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::185) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 09/10] systemd: no need to use qemu for hwdb update
Date: Thu,  5 Nov 2026 12:09:29 +0100
Message-ID: <20261105110930.52643-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF0806ED8F1:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ae62d6-2a64-472d-09a2-08df3b2d4e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|261022105027099003|261102123227099003|261021123027099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: FokzQ/inVKvi+NcO8lpQ9DoTqf2fCsZY72tcDnuNZWZDL3moj2H8Tg9LnzIeXtCnocYnkDokyA/oO70XfKIzTgWvxiOwK9AEyerSs+XbBj91WanQWXG1+IAXPF0+fcYBFup74Nfa4hDCGdCYUIoEqMLHZ7Whd01+I6E8AAWrl/ZftLvAiQ4Y7HZkMWeEebY6tZ22rkQbsBnNIbSdqhe5N/H+GwfjxiOQevTHgi+Vj2R4lW3UpBLEaKGZxzP/iKrSEHUlDSGyYyxn/ImtF3En1iBHP7WvM7lWQZb2HDTyUeKMQSz5CoWg63K71dTMKA+A+VQHfPTKuNFDZsy0rM1YIVPKVv4xXLqHATQSLX3+G6Dcp9WNOBk9/IeMuk8bSIO5FE9Zx5u2LtGutWcJP39cyj5i7yEVeu2u8Rx/7JMw4xYKLpuUFaY77ScnlHrAIPqGApTdPYwN2xssoq1PfSumN4Lc8POpJXwmKY13fSAMj8HZyGI3f9pmYjYq8jcGUlhHIz5tOyZaW/56mrDzs71PRL3P4ymoC9McZWkQD1uQd3viHN7Nh9ubheaSLYgrmGE8JN+eeGaAGESTA+W5I6ZeXMA7XjfNFQ3BZdEVCwCpb6NxhN9jqRFGryZFiwHZRVNNhB55eXzs4rlkhWCXoHcdxx2g0JKP+dVAIjEvBnFRWGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261102123227099003)(261021123027099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LyyCbLIDlrzbyCn5NpQ1ESqSmfyHNcznb8wkJfOpfMZm9aql9uFeSx6gbxTd?=
 =?us-ascii?Q?T0EnHh1MDX1VXsD3jgY1t1+Fpm7neQXSEcU5+rhmNlYwPCJL3b0JBbiBoXSo?=
 =?us-ascii?Q?TPiti6qG1yQU2vDcCcwR4DOgF7y++WmMlWyuBy5PD73c3objmGJzLp2YKmY3?=
 =?us-ascii?Q?38LHog/3qgaCzp7X6EZULKY/Q7aBu9wdaca0mAolt4HjtQ6nW25O6iZBprvy?=
 =?us-ascii?Q?I7A0PDf68I0m1VGnDDKmj8jviqr01ZAw3Dqb8o/eIkQkwdHRVrsQw3G8Pfeq?=
 =?us-ascii?Q?O2bDVDbjrCtwAd2eu2wUZv29+1wz+a+FnkSls5nbGr/s4/cutK6lnIHVu+Vq?=
 =?us-ascii?Q?KHWLY9YIuzlfCUbVSwPBqaBnnZ/MTj9naRalvz07BSMoaAEBn3j5sqWW28M1?=
 =?us-ascii?Q?zZm+1HzwAy1hAo2SRdQ8NNYjpwOAEIDJXeq2C/1Vq48hbG4R0flICVQLOjGk?=
 =?us-ascii?Q?OJzTRqhIMMCGavAa4ymiPG8zmx14Q4mOQ2YNzANsBJQ/ao4UNL8P4dJjhA9N?=
 =?us-ascii?Q?eNWjUR1/uf7GIw074t+8Fe+TTSoyXvFVRATkGlP7K/Q2yI4KAaJ4sCxuPfJy?=
 =?us-ascii?Q?LNt4LZypxG9qaCYfzSGGd2QgZDz+TIA/xu+to7kdnj/K3cjR26DoRakT9CFp?=
 =?us-ascii?Q?h8ySxbppBjt1hhUvB0Hc7m0z/GhIj25lFnaCUZGwoAtoOLK2Nkt94EfJhLaq?=
 =?us-ascii?Q?7NfqST8omyiMAXk6yF/qFDrHSgL5/a3SFHTTpIkBVc0kG4YrsElOs4bus/b+?=
 =?us-ascii?Q?ySFRcsUZqZ6H4gZ//1dFypXEQcZeX0qmVEE58ky84dbcNSCtv1l8+lz5id5Y?=
 =?us-ascii?Q?Gox6rnwH/zlf2TAhuuTe0LxZEQfDn7Cwv1CcClYLbzvU4M1TlWdSyYwjPkzT?=
 =?us-ascii?Q?uJYEdauK49cGfVwm/o8701vHsMU44RUdI4IuM5JjUOUBlAuguOimc1WmmmV6?=
 =?us-ascii?Q?MuU5KgKPPOvR8zV5+fDXPvtlOG2lswkVhlg2oXCXylsSPPPzm+ICoUVjBKpb?=
 =?us-ascii?Q?PXl9rsQ680axz5OLJwmLyL3Zwl3NjUDpEfITUUP9x8RBb8ddJDuBEeydygQ7?=
 =?us-ascii?Q?j78SygoewHNi2cq//ruYIaS4hZ+CowB20t4kvjPKgYTrVeQDAaXyPBAkITO+?=
 =?us-ascii?Q?7FbBVSzt/c7gB/2Xup1sHg1HiaDQykGL1DsmbeAItrfeAds1TqD1D9vJv6FE?=
 =?us-ascii?Q?AIm5Ao/MC+iFEFfiFm6nVxiMB5PFsksGpOoJ2219T68KsmclbTVm6z9dagdi?=
 =?us-ascii?Q?tz0NVHRuG9FQU7pvEN03PE0p55EnsYR3RGnaKZVLPJwU2oFmVhqOP0r44y6F?=
 =?us-ascii?Q?GIy96sw4rijNqaYX5E2wuE2wLTyuyirG/lLm494htSbQZQDfzRvZL6ZSvQJo?=
 =?us-ascii?Q?WBknKTyXwQvcJOLXPcC0BSnBXqnLWS/NAqtyLKsAxMxrsU+Pq7XD1IT7AEBO?=
 =?us-ascii?Q?B1aoeffTHE5DdpJqj7nKWPW9Vf8WL8tlONTfq1Idalmjcj5BABGtdBJhoXLp?=
 =?us-ascii?Q?2a0vC0wT7VEfxI6TazlDFgvCzdlIjTr6iLlA/BfJ63QcCuHiQu9qbupwF8bY?=
 =?us-ascii?Q?7oNiwFiXIgQl00DZeALw/pnFWH/C8Wj3SaaBIGilRXkGecWTHj56cDDkYQHa?=
 =?us-ascii?Q?Xzh09KOkENN9J0HOm3LiwnPKmeliKL6ANlauD7DZ/h4VkSGFaGNlXBi6XS+d?=
 =?us-ascii?Q?9UW8DR1/s+0hI+PDXV9Gse64X8T7ERkuE86/K21pvU3gYgLOdTgoQtnZuduQ?=
 =?us-ascii?Q?cHIyBkidGg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ae62d6-2a64-472d-09a2-08df3b2d4e38
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:48.3141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4T1msyb5bTfF0Bg9430WNfb2JgdcE1Wpc2X4D90fjV0Ea0x9Dpfqr5qnmvXDX5kJqs2c/eypjKDvsc6olMa4yRt9lBcjb1EFZEzUv5R/xwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF0806ED8F1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249536
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Now that systemd-tools-native gives us a native systemd-hwdb, and the
database format is known to be hardware-agnostic, we can simply run
systemd-hwdb directly instead of running it inside qemu-user if we're
using systemd instead of eudev.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7807da168dc097081623b1609fb818e32ac54ae8)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/systemd/systemd_259.5.bb   |  6 ++----
 scripts/postinst-intercepts/update_udev_hwdb | 18 +++++++++---------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index 69f4ee4fee..32fc04352f 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -915,12 +915,10 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
=20
-PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
-
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=3D${M=
LPREFIX} binprefix=3D${MLPREFIX} \
-			rootlibexecdir=3D"${nonarch_libdir}" PREFERRED_PROVIDER_udev=3D"${PREFE=
RRED_PROVIDER_udev}" base_bindir=3D"${base_bindir}"
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=3D${M=
LPREFIX} \
+			PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
 	else
 		systemd-hwdb update
 	fi
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postins=
t-intercepts/update_udev_hwdb
index 8b3f5de791..5b84adfe87 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -7,19 +7,19 @@ set -e
=20
 case "${PREFERRED_PROVIDER_udev}" in
 	systemd)
-		UDEV_EXTRA_ARGS=3D"--usr"
-		UDEVLIBDIR=3D"${rootlibexecdir}"
-		UDEVADM=3D"${base_bindir}/udevadm"
+		echo Updating HWDB with native systemd-hwdb...
+		systemd-hwdb update --root $D --usr
 		;;
=20
 	*)
-		UDEV_EXTRA_ARGS=3D""
+		echo Updating HWDB with udevadm...
+
 		UDEVLIBDIR=3D"${sysconfdir}"
 		UDEVADM=3D"${bindir}/udevadm"
+
+		rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
+		PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --upda=
te --root $D ||
+			PSEUDO_UNLOAD=3D1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $=
D
+		chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
 		;;
 esac
-
-rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
-PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --update=
 --root $D ${UDEV_EXTRA_ARGS} ||
-	PSEUDO_UNLOAD=3D1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $D =
${UDEV_EXTRA_ARGS}
-chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
