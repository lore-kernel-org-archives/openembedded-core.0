Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16008.1794916312290085460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CCngK8Lc;
 spf=pass (domain: est.tech, ip: 52.101.72.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kduYayzbXuQNrO5ORfMmwqRM0oJooHfzKwyB0k6HNg5RfMyPbxalWslTqzQR6jGIxizpQz65GRu5VjLa4hHFNR+0jtqqi2Lz1TSKTSJ+ll3E4GfUqWswbnFlf3OhAyF6UmikZuuepdgBT8IEe2AlxZQfVGVGOSucUceL3jdtbve2VApwLw2nuhjiRLSXrumD+xJNkPd1+kgwKn3m6IwwlLohCW+7CyF+SekwvKeb4PEnhYZOWVcEMPGNptztkFw+rQV9erN1y5tocGFIdQngrJiPA45btSX1ZgeHYjcr/xs0N5lhyWXHA0HgdP4L3W1ZDBanDEsyZw7DK+SNJjexrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+pv9IPzi8YSunj0N6xQxRvGFLYOsye65+XhJAOfhqY=;
 b=NP5ZEUvfpHthUyY5nFrrFEqMtpe5Qnfqe4xt2PFKCoAIuO66njAvj3wCkU7JbQY3IC/HWoofSmSorI2nEYKhhsQOrDT+x4ajJmLhs4xL6ndoozZqw0670m5YKJS7I1rJO8PV9BiDvifyqImRAXeOSXwykrxQgorbS7/opTfMrzbEUkfFdOhu7/qMGXR9l1el6qkYBORGTR/SRuEgIhArzIHs8iUfBPh4JAOPt/5qVVr5GDBZlaJeTWTbpmaEinx/RfKpoJhEK94myWQrPwmcwhlElTCZhedfOvABrLGL5ss+fOo2qsLbwbLzg9HGyHn5a4sTsv4S0pK80p7rtPzjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+pv9IPzi8YSunj0N6xQxRvGFLYOsye65+XhJAOfhqY=;
 b=CCngK8LcQAK7cZktWvW6F0y0qbN0e+keAW1Pypj5neyq1iSzezY/xouwCM1GZErby5njvYgCk28ZP8lF6oPRSQAZnTxf1EPIWu5TfvGgQhky5Umf5UFRM2SuowfUzj2eG8eUtLrpUcKISC/o8EOC3QxP5cn71ub3ZMPlk6poEBI8ufQiLVWlDxTzQvkfCDgKPRIbJayExnLVl4oUGx7cIFxqPkAzDj28tabaHr/EVSmZ9GqlF9Qtp2hNTRplEwhK8z4t6jzdgB498CtEGkt2sM/6QS4OxxUt2lNlDtqCjIEyHc7IzrToNzAMaEmbdWJFUx2F97RCqD+ccewyKKL6Fw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 7/8] systemd: no need to use qemu for hwdb update
Date: Tue, 17 Nov 2026 12:51:25 +0100
Message-ID: <20261117115126.14374-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0020.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9f8da3-f567-4af4-29ff-08df44a1240b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261021123027099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: LDiKUUwAM8uerSgpvL8eLxwH7BF7/teNaQNWr7ySM5pCKxac6afFjNKssXHNN8KTDotOLpmh+Zol0fEixVazyTYm6j2zgfa6DFv9/lekfglgnwJ74/1DbxugjA2kjHFjUyOTBK6TPdia6cYwbyB5xJHp1Be4nS73C3tN6wyPOcuc9qehOd9p7H34B/cbIuRayxj5UGYaL/kmFBR3zqVUvIpGK/P6t3ILlNT0t+CZNVL5UCCqMowgWmBHSV5q0heCVUYhPoKLYH/FtcqcJ/ONglLd9FQdath2Z8fjLMIvjMlXqSfmixAQrlgyPkbM/t3ArFoOCiyp/PKMcF0qfzNCNMp+oGHBnro9ZjpOeguWi8boNyv4mEIKbZKOSzR1aJycBZ5wq5gAfRu5hY3w4RnsCRkevR9r0Y1dvWXXtSxB7vf0slh/NtzPied+TWWQ2Vr76CJmCbFFq82pvQheN9mhbB6pLKMfJzOCOrG/ydYKK06XaiuVpdDQIp+cfjG5vIkF9wync2XrB18HbKDSm9sqc5ysRj0WSJ3wZAukN/a1EF88vHOR0ufw7DcWOtIUIsQazOAXMShBjeJZOCk8nHDUt8cum3C1beVLZrPE34xvMC2a3tlXwCiNOE7K7m292Se5CFNjiMRPxFIS2TwLmK1Zr0ikIDiUiaz6R1kfUT3q3hA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RyfNXD63IzY/7a+vhEXqn3VSmsZOi+EuxmBPQ1IjiGHIT8s4Y0cljxFEU7Uk?=
 =?us-ascii?Q?bmcHkj5YI11Fe+Xy8TfLK/pxH32xxVzF23dJGXtOVCw+ayBVn1ZdjYvp/GhJ?=
 =?us-ascii?Q?jyBR2XuENvcIl40UFrg/mG6pBif6lXaw5GPTeU6Ibi7cvdgUms7qPLxEmlmt?=
 =?us-ascii?Q?uY/RCUoV2wyjlGyvfAJ4xxVRM1oW7vDBx/P6D+nsvKk6R9CvhzRQF6yOJJu7?=
 =?us-ascii?Q?tVXQehAeQo2ojcSK8p05W4c7Jh4uZiZN+w1zxAc3kS2Y/E5IkqrB1Vj2lFm0?=
 =?us-ascii?Q?7dxJeW/lswkE13yYeyEof89Ldu1TlDWHGs1ehAv+QxlygQ5TPKkIDt7zUbdp?=
 =?us-ascii?Q?BQz4JIwQf1dM8QAMMk7f6HKz/FnztzTDuJG/BtdyiGI9bYbBFsA+GGWlRhLD?=
 =?us-ascii?Q?ukJe37Ukvepd6fuOQ2v86RW0gCIBuVK1QeR8R5UHIUXpxlbShhe22UnnhT0x?=
 =?us-ascii?Q?ZrodsrOCCeRQFaekx3awT1nYbEpAev8IFW+GA7Xbz3CBYgiMyLZVp+m5m/2F?=
 =?us-ascii?Q?/Cp76BybLW3MNQxfnPmCcPtNqok/JRcq2rqdv6TROZucMYuvA+yupkP7WY/j?=
 =?us-ascii?Q?gyXezYTEoaSNuWkNpyVFslzMsmOTboieUMqfX0KI60WIlj3LuA1Vd2IZMX8/?=
 =?us-ascii?Q?xQGFte7bixZA4s7cAifAYaqMx8D7lFBSThK7iC5XgBhpxWhW9IKZ7itlqktB?=
 =?us-ascii?Q?DqurEfy0K6bGCyWuIPo3L01E3s5wA8zeCNDXl3xucoaOwXGX/PEWp4xxhgTu?=
 =?us-ascii?Q?bWA0+I9zjGhRpX2O5Q6M9ICzq+LTWQpCwJvsFtUo9I1tpTWv93s5fsYTNOl3?=
 =?us-ascii?Q?XeSPn5wZVMOaGJEVkr3gSy/bu4Is/gLLhNPKTaMcTGiuPX95Eo/HJClwgkek?=
 =?us-ascii?Q?Op0HvsJn8LoGzmFu/yYmRVyKWScl/jwkcmd1UhnEtNrR6bBLp9eoup7ZKnPy?=
 =?us-ascii?Q?xvbfcaSZnmrWnBN1zKdQ6Vdt+H1Gtm35SQbODn1anvke7CdGz/S6PvUT/DAB?=
 =?us-ascii?Q?YetM+IsJIu12GPpaR98abOsQ5C+AkKw9VAqAPdhQdSAixq7k50ETAD1qGp1L?=
 =?us-ascii?Q?YANpM8ZjWLG9nSY737jX8NQcOHzWJliYYKNEYjOfpa/Jd7fyvp9d2UelQLWv?=
 =?us-ascii?Q?25I7jmzM/x6FVF8+mLvzjuniAd9K7pmQn7ekOy7EbdLk7mPRw5RxOxquOZ5/?=
 =?us-ascii?Q?3iKJfy8yeBpXwbS7kEO2a9YM5DNQNB/UMzvv+rqwyaUnu2Lglu4lPyrRvG+C?=
 =?us-ascii?Q?urICoU3c6gNECwqy6I8iUF5JDpxBJlKBd3pTo5b9sYG+gPEl0k68rZUx5bQG?=
 =?us-ascii?Q?ELZJNX9ldr2RxXHKpLUSxhgq1V5UZ3mqwqGcyCeERTyazSXQGAEzoyNwwELk?=
 =?us-ascii?Q?MA+RY6sIHOgXcG5KTaOWew9i3FoILR2TdLBxKGwJtz69nzzsjqjG1p5qVSoU?=
 =?us-ascii?Q?XvnHzur5YbQ2Sa5XiQgfrJU8xLmHH8h4f9fQYOZIwsag5PCE/2Cwqxq2k1Fb?=
 =?us-ascii?Q?2NUrJhB8uF+e6V661tJtQXcLfHZ5TPpmuS5mKbD/5OykIh42qjrCBlHnV3/i?=
 =?us-ascii?Q?Fx0KfXZinu4h5hnghM4ATfs08beBdcPgNZ6Prs7id2KSWQWCElnpyQP6jx0O?=
 =?us-ascii?Q?v/Dj0pFA0gVLeoLpZZ7u1fIFkd3u1H5ZLoq5b1SHzQveX/RJi4CnLe5MrC+s?=
 =?us-ascii?Q?7d/SNARY4OBrVEChr8062oL/T5/cvOp7xJhTEIGIN/BVj5KOATBZbx3LC37r?=
 =?us-ascii?Q?OU94U3cWOw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9f8da3-f567-4af4-29ff-08df44a1240b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:39.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4f0KQtemUZyK4ZWaMSv346z24WcF30Ipwr7RbstsendzInBlQgkX1O2ZVRMaxm/ROgO4kQxeQ7Yt8vwjjxrMEw/5AD3fZx4l5tkk9472BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250431
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
index 848e12e8b0..8080377cf5 100644
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
