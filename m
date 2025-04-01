Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D0C3601F
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:32:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.100])
 by mx.groups.io with SMTP id smtpd.web11.16529.1743507114154826500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=g+GRp/Xt;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6AH2E+LE25sp1VsK4PmH8OtVtpvUpABg3FuXgLtm38ew/YbpaUquVMSSKHIGFhfS0HRzq3/JLwdZyhKwZCN8hOSCaMKinV9fneoW4c2Ur462bq7+ZAjznhD+AHmE9/G9bpGF0KM5ISLd3Tl50/uMwMBDi4vApJiLuyWql1ldDALzs+jlrUUjo37eQJSQ0PaQQWXSek8UesNfLvTqc4SduoM31zLbIVfoaOVrvLGrAvRBf7oaNbZapuUYIznF/sLlpfNzOLpFBHwMnljAMZ9rvTGhllnIYoxKIwLHKpU62NvQIsxucV18Wp0iYHCmIC76dxZwT7/9Du8XzXX65rCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcZGfn7A+0JIuQbpEGV6Th1iMso9y6eiFQCS1mYXZD4=;
 b=qftEMiuyQYocMadYn57pEseKWGsKGqJUyXhqfO6U3aetYZaE8fj2j6lz/exrfFwpbi6ikWBfl3zsd/7OFQguDmumZ/SvowobqTLq9VmZMh/D6O/Kp/CXhN3Zc+rbftt+dniXgfL9872wtbWSfkEPMFtBy1Floa5OgUNsTvnltOkwe1ySr3A9ttbpg8j9kuHYCwdRQXNrKugh1CdCmBBZRQdFT4mAMalAWBZ/MS6z9fQK/bbK/S9NuGPujcL7fOHgyUg6Z+99NTNOsuIH24hB8BYSFJBFYzZfg9dOXglQ4FxRTZCHMqrKDGrGNAkdouFehwcqqUJy0j7goqUDC6dc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcZGfn7A+0JIuQbpEGV6Th1iMso9y6eiFQCS1mYXZD4=;
 b=g+GRp/XtBmoToZ3K0hLaji7sRWEp5/M8veKvPlkrAWGlVx3vFc7xpfo//E79mWG0Qm1sq5/dyn3UmLgkmYZs9z5e7ZrRQeKsd0oJLQ3nmVlDnInvz7TwIDvbrVkzIIwPYLYE+JoXheIFeJy6Q9RK6HecVwzRV51ja7fy4Oa2XQn+MCiJ2feKVBshKiTn8CL8PNgp2dKO5ZU5Hk+m//mvK7HPG7wAOuYdL2F/JEa0PKed6py1bzhLp7tfSd2xMnZJEE8EIjPSKiGhCT1zZedAWi9jbIjyu4n8tz0CO2aOOZs8cONnjsjLlbVGumxB7KUWOk3Y83EwwEUroVjp8EbwdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7147.eurprd06.prod.outlook.com (2603:10a6:102:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Tue, 1 Apr
 2025 11:31:48 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 11:31:48 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 3/6] dbus-glib: Support using alternative runtime D-Bus
Date: Tue,  1 Apr 2025 11:31:26 +0000
Message-ID: <20250401113129.3531757-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401113129.3531757-1-niko.mauno@vaisala.com>
References: <20250401113129.3531757-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003852.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:1a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b014882-ea0c-4400-6f5f-08dd7110ca19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XIWSKjUUfIo8yFsle5dinxR/AsEFeJpz/7UYmtHagDV3CR9mcc5Yh/mK60Tw?=
 =?us-ascii?Q?XSbWMGtzkwgUTXffqKu4wtD2Prz/oeGAdpX3GLqoiwIJcQLruxuYxeYeQ6Z9?=
 =?us-ascii?Q?BLm/SWO23pwiiuYZt1HBZEKA6lIGoLhsYofuI+zPBL/TFp81Z/1aQwlxqNy4?=
 =?us-ascii?Q?2YB2Wq5b41jmXTFJG0LCxCWVf71zUAHGRuX+fHN2bJcIvp5BLwRIA+vu2loN?=
 =?us-ascii?Q?WRVoQWXeeSD/n3EfxAe99W3kBDO8ui/e2KSby1ITM+XC8yxi6UKR3bk47/Wi?=
 =?us-ascii?Q?3NXwJud7Qvb6uuEdXBnNGuc+n2EviKmC1XG/8Mo/Wt4mwFSWXryNKmkB0caw?=
 =?us-ascii?Q?/hdMDZCL3sBwGLMOw3HYzBcRApCWFsCIfB4+YCf3NukAiwuDHa7JJU4C76JW?=
 =?us-ascii?Q?cn2WSVPG8cMcAZSAgpR6AH3s7WHihF42bS/F9QxYmAiFaL1MT9U82Bi78yLA?=
 =?us-ascii?Q?LUc+KHgVOOid9TjtQXiQbijd7v1fS0VhG+hGnUhoA8VB3CxT6Mo48cLsOmEV?=
 =?us-ascii?Q?4F67KkMejJG2fc3Vr6TfxYtU3VV/JQSxNdTOns3RS/3Djjo4PAZcYtUVd81p?=
 =?us-ascii?Q?f1o48cQA08GZszDJHtxTvS8ZTVx98ku4MtJqbk/xevQKwi+YSd+CapeOah9x?=
 =?us-ascii?Q?oAJyLykv9bVMoeLflv/JU9ebXUsXjNkTFwJ8LzaZ/vHRD7Zf0eaeBCap4z5r?=
 =?us-ascii?Q?gm+GHZ/eB2KnZFbVBgizjzmHrTbjbkwcqGnCuf07FNTbB/2NDr4w582m4yRE?=
 =?us-ascii?Q?uMu0LUBSe10gaEIxjQ8Tz5mPSaff3MU6U/dA+c9NXNUZv7ngCPD8+UguJR9A?=
 =?us-ascii?Q?QbI+ujKsh7UE9WVS4WxjP/srlDX2IsC+8uf6qh0whdBxHkx1+DTTJizC8p4S?=
 =?us-ascii?Q?+QiS120pTYeOhbpKVmw1HFzjkfjCPsHsvOfAglmmBzdfl4S06w2eW1r4I63z?=
 =?us-ascii?Q?nrXL3ZnxZQMKnFJ1kGmPpLm20XrruhfA8s/htLq4aHpkxVvJNx0OYGeB8vCT?=
 =?us-ascii?Q?Kkt99twsnNET0AI4Kxe3L+PR8fOR+bRkjE5BzmBgAJuM+hkAbnv6kOEio8Nf?=
 =?us-ascii?Q?Lpzfew7VcJF0npha7RvpfGAlHY9Tm/kl1RF5ayqtjK8rNP0ArzMzUrqILIZk?=
 =?us-ascii?Q?r8e1fwwFfQSfrtjDy1E3y2d+ZGYt9uN1zUHDHaDJw6s42uv/OGiH1qZLgQ1j?=
 =?us-ascii?Q?5vXr/Imk8gHsecyTy4KKf9x7CS7MivQ4mjBmse+cKmsWED1pfyNKci+N/ExX?=
 =?us-ascii?Q?BPPTWtgWBZAWA6wkR6k8OkvzXQOvX5kxLhL+8Tn11MttjsB7+bVknUyosIL1?=
 =?us-ascii?Q?MxNTokKhSbztJavRgY/cIdBu4AIRLsD7PR9Mc2tObHZd8SN3JQjAko1z8Rq9?=
 =?us-ascii?Q?Mvo7gQbpNTRzaSsEUCvQP1nGyZr6BwDIgKPysR66uLdDGX8jKmSWC/huf4Oq?=
 =?us-ascii?Q?/UfbGEsnyGyiC7sTPWbkDv7zmcbgrNP4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ycLhRbIfjetOAf6k3DM/mxFvcaKhofJ07yvHCNaTkaYGtXNPi2DdQuKDBvtY?=
 =?us-ascii?Q?VEXHZxwNyiE/cGvVTlQ3HGKD3hWFZxiXXGSonxaHyMrBtNbpxljb4BMQYfe1?=
 =?us-ascii?Q?KLup5UC2fdlvHNKFRtnT2OyDNqJuKb55lDmB/QwMD81ShgAvMSxt3KEumE+8?=
 =?us-ascii?Q?oZT9ohY+L2gaKzvAnu0IHi8oiQe3ynD5Hjg8zoKDl4vuuQpp6cHH2m62wv3h?=
 =?us-ascii?Q?q1gLWdK4ZWRdOEE9IGObQ/yFCWHDR/OjAvJ+06jmvpSDd63bHcKBM7Hs+6VX?=
 =?us-ascii?Q?q1MTWNqizb7DqbfHuHJZqGFWCTVR9kglTkVFGDe1X8dq839ZLtcX9+iADbDF?=
 =?us-ascii?Q?K09HIYIAJ9sxkvj8QjH2GJ0eXRhwXOJNvl7RjnWPYMJijMKv/CCwO7bd/W9r?=
 =?us-ascii?Q?lEuMKxtb3M1t5+pTeC1AIsvdAqOjm4w/VhOHDzYc+kywQOJLC0VjtDHqiKqL?=
 =?us-ascii?Q?uFzijbKEoo/eZOnpqIk7OWvMnXtnUVaB8XXArYe+LDtcPxVCKvRC3+g953U8?=
 =?us-ascii?Q?a3FOA7k31T2EWdup44SQIgzlSQs4IRMIOd8nr7dgf7lSqIoIAIG/D5U1Hd1t?=
 =?us-ascii?Q?t+tlUb1/nrKEejOgM86RBtGM8PCBQIrswnXqdjCmQWGiqkhGpYYLoN/Xeoow?=
 =?us-ascii?Q?JpTNQ1UCaWQoKLYqlu07JqQpocEZH8JLj6dI8X8Py9ImcZl0qTqNSOpLXNuq?=
 =?us-ascii?Q?RxdlKUYKeyvLOoOPnLCXWadF1ehizeUPcR+nTCBnEXpAtC6TFHYwAOJoKZAh?=
 =?us-ascii?Q?opX/F6GjVuazGbeKMcv0PPJc3HUM+55LNSJ1qKiPajAuiQlc9aLaE37A6JbJ?=
 =?us-ascii?Q?s+o2aCmyrincPHsaZ2JVoCJSC9jQyYx2vZxy4qynAhDUGusAI7HSyKs3IRA0?=
 =?us-ascii?Q?qFYfioZzH8KWsB8Z+u+TqMq55gbv5F8XA7j/2zTuqVarD3gPNmUp0CSWuWF9?=
 =?us-ascii?Q?F4OmuLKjM4gV2pgJAUmixXE1dDN9GlIx6wgim4NCUlT15UmxUjPpOmYdOJED?=
 =?us-ascii?Q?IiAMqFKCgL5HnXCp8LP62qzKPC36c47JeJxdy8LK9V80Kq9NypnxRiFv0UEb?=
 =?us-ascii?Q?mLKR5ui+K2ma9am4cCUlXTMHbaIDGcbEhOCsdRgfFahWvgaiLVUhUvphivMC?=
 =?us-ascii?Q?EnIOJsoRBxSdICP0nHZ8VIbr5ToQKlHEpIy0RJFxHmLXWsCv84K1m/0aco08?=
 =?us-ascii?Q?PA05sho6KL7I7WhFRiREJnXfjZdDeCtzsXczdvYW+vllD+Jzu3gyS80vU9XX?=
 =?us-ascii?Q?CiGLV55Cuq+XYwhT0pPtd3tEn3eF8uJa8wYPsHjzr+8dBbSzPtulmXqGZSig?=
 =?us-ascii?Q?b9kvqmN6VXxfCNLi5VyM4oy1LsT06epfRI78TY4f5Kl5QA68YtSN73cqSfkJ?=
 =?us-ascii?Q?4zIYuHOk1Rn3DIjrg6HED+NgG5ZW/Uuu7xY6T4tzFvls7YxAQM02+vkAODdr?=
 =?us-ascii?Q?OTjSjVIkw6ZFsZ4IkzH0vDMoBp1Jo31H4zKW38ye6bEU6gzk0puQ3iHlC6iA?=
 =?us-ascii?Q?RRBN6ou4Jvda/R4/Gbq5HpQ9jIx0EW64b1+BfaSJOMQQGwPh0j0Vqs2Pb//P?=
 =?us-ascii?Q?Ktjdpj+QqAUce7RbYKq3ELeEHqkFVyv+Fpp8TzK1HpPLRwi6rtt38FQiqU1Z?=
 =?us-ascii?Q?CA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b014882-ea0c-4400-6f5f-08dd7110ca19
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:31:48.2388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7NrKDGky4ZyobPgN0auzpgRPT9amueSMwTPRabr3Xz9aklF1YAt0a4xpzdtJ8/n14LNnoNFwrPuc0xqlbrbRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214018

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, decouple the target specific
dbus-glib runtime recommendation to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/dbus/dbus-glib_0.114.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-core/=
dbus/dbus-glib_0.114.bb
index ff7c2d6613..7908a02747 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -38,7 +38,9 @@ LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
=20
-RDEPENDS:${PN}-tests +=3D "dbus"
+RDEPENDS:${PN}-tests:class-target +=3D "${VIRTUAL-RUNTIME_dbus}"
+RDEPENDS:${PN}-tests:class-native +=3D "dbus"
+RDEPENDS:${PN}-tests:class-nativesdk +=3D "dbus"
 FILES:${PN}-tests =3D "${datadir}/${BPN}/tests"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.39.5


