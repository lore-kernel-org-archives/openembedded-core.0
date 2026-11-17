Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16118.1794916298633238925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KhfWX0bn;
 spf=pass (domain: est.tech, ip: 52.101.70.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ea1EBV0yzQJyLM0JH5ULAhVbO6FfFUIEtIGNFVYYoxU5Hr4/H8+HZOQZ08TTiY/fmsN7P0L4cIqYOKpJ09ZFWoOzzGH1+ddy9shUr7b/GFu6RY+x4V86Zho+MkOSFJLAOYNLo/8yxsJ3zC3xHdlzGStNJQ7c6qvSncekPqN9CEkDULfx+5TX+asgwOYAKxRP5a4Ez+cNghDTKD6QRDtdo39wwkryNf2IxufY4XzANfoL3VM+5ZkoY745tYFL510VTLb+/Ui/6MAWiuB+3inhxc0XkPaBX4kizWCcNXyGah4ah9eZ2z1ICCoR0rifnMJ7/As93cpwhVel2nXkSw6brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHL/21uKE2wu+iWkqHcek107T4ajuGhTuo2LMWd284o=;
 b=Q2XXbl4zrmyfI3dlnYSbEZOQEMdORkxwf1d8sgvPiWhq3Wq/V5470PXTsHSeLpO7tSMe3X3iBECjwOcTqkDBtn7NE+rybE9D3Y78aZYfpP+7b2wf4LVf9Vlm26MvrTzBDPREmtgN5Y/w7v8BzswqpYmdIQabLzU/F48xI7m76SqBPs3Kuv//95zgSNLXu4NXRY+cNhhM7jyaQr/NyCViw1N6+pMjIubPE4SLbF2C6Qne/rIMlJHz2G5GqS9fA6Vmot4We//DOaA99+4wdNFxYNIaw5p60lRuyJRFC4LaMQeKhSit5d1hzqn/CecCyBD4dmTfhTXSbLSW0u4nVOmBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHL/21uKE2wu+iWkqHcek107T4ajuGhTuo2LMWd284o=;
 b=KhfWX0bngAN8dFY5TpGxrWgHBBvRUyATVNQJQKq/SXypRGnHadb2pv37x40jhRsJCHIlxeh650GZEZvubjAnV4J2HR8brpc0KDVZ5MoYG1fUJXWcffukq0lYy53yiXJR6pj76sGl2N4TEGRQ1Slv+UkBtUBEYcdUKL+3L5BR7PMq8TbiQJANOZKsvLKV+Efsrcn/NjQgvtR0k0LKwQhELZer4L8TYOtdkfgwU0O9HWhYqiRlf8H7AYTURCCisP7sy0TAPyiR3b08dd2XyX0iOj27XWPJvq3OfBYOWDSPbyt4h5gc7Dn//9lKZPaG3dPTppdyNBkJ6Y0VClMQkBuVOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 4/8] systemd: move systemd-systemctl-native PACKAGE_WRITE_DEPS to systemd.bb
Date: Tue, 17 Nov 2026 12:51:22 +0100
Message-ID: <20261117115126.14374-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0021.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fef55bd-a7c4-49b1-d81f-08df44a12131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|11063799006|56012099006|261028144727099003|261102123227099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: s/+4GQFIzZdAQw9YDccOcjEJiO7LeusvAt5mVsupodwWKmdUKDrFM2xKxzSxDwxyAm/mIJWORI5L0EJxFCVywNtyViOlp2vTsA1F2FhHDbEy6ZqZzVU8Sye6ZMnqUqNcvPKr63Wi/6hl5GUqYAbXF4LnMt1SVKLmagyc9t0e8Xu4L4KgVe9Qo0yFvFzQ2YtEx6laiVfiIwZM8OU5In2/yjy1uQwOiehTSQ970apArYs1jjRVQFEsi6TTtS9vkyEZI/XcvPsCCdQSEJpfS+4BzclrW6SK+k+zFcnijQL1YqmfVQvmh+cLMI4Q2u1M9WZNjPoV9SQhOYQ9gd/ezgshy0NlL4ljIimDShNw2kY5rKxRAmhMRTQrsOyWw1AR60+s39oGd6NDa+o5x+ncsXinnhZ3D6x2ZKmeQ+QYUCPBk67hbYBNOaL4zPbnDb46lXuveABNOcJ0JoPYm7SWvGoitBcQ8SimAbQe14pGqDmH65QgjJP4xDscJV2i8p0dCQymez3MbEABq/l/0duMh+Ulmc2WqNaSMu80HIPCAkd+Rpr4iaWjPFJzB/XZks6u0R18nuBAM3+Fg0JYREdP+/lOyWQRm/KxU+CSMKHDvqYo7Spp9jDefrBJTTrymDsFqhLz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+w861ZYNJaRx/MRbpDALrOI/VlkoYBeGyZWbbtKeSdydQ44a2VEO/1DSX5r?=
 =?us-ascii?Q?1HMCNtg22m+l5GsbVSLfaUuWXQzb6etyuTDh48XW4ov+u2T/PMQELLuXTjrQ?=
 =?us-ascii?Q?osMECy6CVng+E/ioLK16EFdiqwpjZz+vqmjKO6S14bLPIwvkg1cyrMWJJMcd?=
 =?us-ascii?Q?Di92VTv4ZDRtDMl+1dSd89IB/UhHU3XRgkUxHoB+KeVGQV392PrUe8ovetnM?=
 =?us-ascii?Q?HYjNzGKNPgmhVfI6SKPhlvuVACRkahUuaY3JbSYAt7H/DHUyfwnOeadlucXw?=
 =?us-ascii?Q?jglj9A/wI+eiZWC3i94yjS8QJOc0oCTF7JjcaShr65biGrI1E2FQJK6SURwL?=
 =?us-ascii?Q?+LMthcCDDEx0/iqDCQ06agz/Dodu8X87oiHKn/GcHsYcLmJG9Fzt5uEzT73H?=
 =?us-ascii?Q?eZphki6p5twDs1hrJn+zISlURIFBORVd7khW+yrCJNIq2OtTv2JxanW1nWtZ?=
 =?us-ascii?Q?d8ltYElCL3/iqiwQuEeIT4zjzfSIv1Jopa7w/xEbTG0P32S8Jh5pWPRMx5ZC?=
 =?us-ascii?Q?6oiEciLfRhH+eqCcUqoRiXlj06MyezknYhW6AwVki5z8fJMPFzuBwF+7NMvv?=
 =?us-ascii?Q?LRJq3kMun33mRfhBdK8rCkLB2Gnc5Fi2FAF/95K+4REaLMRNSyeUHGCYpHzq?=
 =?us-ascii?Q?AnoaFo3yXWB90+uIS6a7EOUEOI9FL3Ob9rtiR/Sz1FnV9mp6ZX7FoZ3mRAiN?=
 =?us-ascii?Q?Soncc6iGu6emS/zq2pHPsiV4BFXPhl6Qw8ekRsGSEmOawmM8hrHMmGI62LPF?=
 =?us-ascii?Q?rPV6GqZpipOC/pF0lwUDE7AoHuqc/EcFIcUQ8elAIXXzdMK+r7hYFTFIa6zO?=
 =?us-ascii?Q?EcuHPRPbC1Mw+GUWBcsgiFIAkdggFaUyE1aY6EA3tR9JJ+uxqhN7WxC0cVyp?=
 =?us-ascii?Q?30AUS9kEdNwqoY4WZbYVcuPwhnviqVAa+6Ki//ZnUV4vJOQ2ghvsnK29hXiD?=
 =?us-ascii?Q?Zimp4A3Pej5fwZXc1AqRVyVnV7JgRN04UBDPmNgChZK13dtv5sC9jfUNdDOs?=
 =?us-ascii?Q?u3UPLHG3+BOyKBLT1wgpPrZlkgFThQH3rAToHC+csDErPgKTAGDCtOC8RoOr?=
 =?us-ascii?Q?ksUDjKfUD/a5epNkJKLG27KMbW/hljXSarceZ7MFbPz/jL/olngaNtttqZFP?=
 =?us-ascii?Q?2AhHA5GadwhMzy4gRH5kMI0r2SnQHKG+Hz1+IH2hk64hS7TmRYLJ4Mjxdbo4?=
 =?us-ascii?Q?af9AFygkKHT1lssI+szJWer3aEdo2fFWiqDSo6hvv1IIjK0Zxu7xbGcLQMH9?=
 =?us-ascii?Q?GySQ7ftBkE6dZmoZG4hA7nj9yTySnbhGTiw401DWN72kjE5AGCaZmBxSTcpi?=
 =?us-ascii?Q?hXOpTSCNIXHKHcfcZYGkBnPGAsZsOF1zNQTjVBhqtc5KTQXwd2qU6ix3cbnl?=
 =?us-ascii?Q?dU/jXORQ48T8YevJapoAQ83J3zMHcmFEDzbecuy/hJApIv3ocEweAImujloI?=
 =?us-ascii?Q?XdouDXPBp4VB3r7nO5Ya8QWEjiP4OpfmvfJY27TfF40TP3ZnMAMqLO8Rpn3a?=
 =?us-ascii?Q?h9mMpPD9tmDzzpy1vcWpLLsEaullgVpvCiAA8SeWIUbH1SW4oetu7MegoT0M?=
 =?us-ascii?Q?nyT2h+c4kybWUkDS6oJ/QHFjdAdcN4h1J1ycGQEQGfpKZzNWp0R7SYm1ctLO?=
 =?us-ascii?Q?uZhOW8GhPTI8BD8sn9HljxBtOITzcAbwb/Xi3zkLzyyXMun81FsJlcEnia89?=
 =?us-ascii?Q?t7P1+UcbIJBXRml79v4BpojEZWNzDE1YellIlbCDt/ZiYVnYFcSXWrQIAbeP?=
 =?us-ascii?Q?LFn1zOKZnw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fef55bd-a7c4-49b1-d81f-08df44a12131
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:34.8656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJkkN04g+UHIu27ihBOLeS5TnUmHWrfZupwblQrW+4BZE7hs9LS8qqed/hSN/4eX1qewUwZ48HmORU3ESTaPUBf815kBSUlVs5yHVAq0KAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250428
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

PACKAGE_WRITE_DEPS[1] is used to define package dependencies that are
needed at rootfs time, for example when a postinst can use a native
tool.

We allow distros to build recipes that support both systemd and sysv at
the same time, and the post-install script generated by systemd.bbclass
will use systemctl (via systemd-systemctl-native) at rootfs time to
install the units and thus generate the required symlinks.

Presently the dependency on systemctl-native is added to recipes via
systemd.bbclass but this results in all recipes that inherit that class
having the dependencies. This is actually suboptimal: at rootfs time
the key requirement is to install the units if and only if systemd is
being used.

We can move the PACKAGE_WRITE_DEPS dependency on systemd-systemctl-native
from each recipe (via the class) to systemd itself so units are installed
if systemd is present, and not otherwise.

This means recipes don't depend on systemd-systemctl-native (which has
non-trivial build dependencies itself), and the units are not installed
in non-systemd deployments.

[1] https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_WR=
ITE_DEPS

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a96f87266d63fb5ae2aca6628c35572f83c68983)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-recipe/systemd.bbclass        | 1 -
 meta/recipes-core/systemd/systemd_259.5.bb | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 26eaaf1922..5d8e6086b2 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -22,7 +22,6 @@ python __anonymous() {
     # redundant init files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         d.appendVar("DEPENDS", " systemd-systemctl-native")
-        d.appendVar("PACKAGE_WRITE_DEPS", " systemd-systemctl-native")
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
=20
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index e924884bf9..848e12e8b0 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -22,6 +22,10 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
 # this and hence we can no longer support it
 CONFLICT_DISTRO_FEATURES +=3D "sysvinit"
=20
+# Ensure that the native tools are available when we're building a rootfs =
with systemd in,
+# so that systemctl can be used in postinst scripts
+PACKAGE_WRITE_DEPS +=3D "systemd-systemctl-native"
+
 SRC_URI +=3D " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
