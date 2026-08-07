Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627FCC5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 11:39:04 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40624.1786102739900052622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 04:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ep8Dj8xh;
 spf=pass (domain: est.tech, ip: 52.101.83.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1KfjK2AM7UhNYV8NjFs0cfqizbXOOTHvbLJjnsR7GSAApuwWggBnWhJfIazVNIOeUgL/4qElsuvvkVs5hAfjNUHW3zlpB2mBEp7g5vAOvq5Ly+ATNTvHVkwV2LFcRdTXMfiMhVdcR4S5Ks2O3C7SpDQTkLWJsRDBItYTtvdjkF7BeqRi1ulKr11SXVFpu8keUOT2yXHX3tbGkSfvVsCWKl46NJzO0Hwv/P4Bw9shspJmmIUIpocOL+dhGXpJUg9dUknf49+NFcWDFgjygthpwqKgfuT3AadIHfoXcBuVMYnWNZUe2xLK6Vn+yBokTwBECbLrUtPDV+lCYFXmO423g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2Y6gCrtp2+r2ZlONEdXHChFtEkZE15/XT5uCZdjyQE=;
 b=K8nGnKlkpEdFTOOkKx1EhLanFzzL8nN5jnhwBVpmNybyWewIxf3HWjr+sEgKf1vm74IYE0tDcKeoomHn+pl7BL9kj/FZ/RHjF2cFjYc/ZzvafvbCA3yL7aN+fK81LsvaVPJHJ9rOLMKctMBT3zGIIYmlFiMfrW9pO5HEmTuTbCnhJue4qbzQ7vdQvknaRrYqc3whIbXiLSBjAQSh01gyziKdjH3Bol9kxQqF/WX6GerYkk1rLY3HrBPsQ/B8biGTsOgdcWNfOkqVlMa4YEp6ttBksGLKz+3QD73WviSZwW5IfbBXCTDgdodJx2ZPiXdma00JocrLkitXP0QcjH6X+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2Y6gCrtp2+r2ZlONEdXHChFtEkZE15/XT5uCZdjyQE=;
 b=Ep8Dj8xhMBxJT5WjdoEFGoVuhJnsMvKh6NpOjZmnf2guh/LmU34L7fzrMm4rz5kXsJhIkir/QJRXw0OKHO7QZOQppUwhmSkcFv05dUwdfhE69y+BkBtKY5hmt+8Is4kTLj35s1eUEc62Tb0p6MNmCPQjJziW0LPk7wIupLDm9GXm0wfxvSP+DIRd3L/GrUD8iE9Z/YbXHwSXCAUW5SxC8JBRcRvt3QTyFpuAksRs3Bh3Qt1gKR4yMsBTz8za8SbDIqp8sATbqIIlo1WNSGvGiCb0Y9WB6veJasBcXSjeeosG/V+Vv1E1KneXHPdNeJuKDLfOe3S5L3P051PUNFITyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3651.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:500::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.8; Fri, 7 Aug 2026
 11:38:54 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 11:38:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] p11-kit: upgrade 0.26.4 -> 0.26.5
Date: Fri,  7 Aug 2026 13:38:49 +0200
Message-ID: <20260807113849.36104-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3651:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1b71fd-a303-4446-2848-08def47875ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	7IDL/9J2keTHvsNp4jedQbTLKqt5ZTcKko3w9VMu31e9NufRUi9tOJcuWXhQL34xuguFgikpWPxdbj6WrV8pkOJU88822Gk5sGTJ8sHgGeMCjVkOUGrvTU4KuVkj0ipgidvtIVDdvLNnKpCTy2WxOQwOGoadcMyHn8eSyOjekZ4+EBIVMt/TfUVgPkDKdteHCeXZS/AIDqn465NbEydyxVjoYdQytykfU/+KL5b065e1GPOD5wT8I3BzcdimZRs0nzedvW1vi7m5K2USaXSJcinMFx61CoN5StoniiVYx7Kb81M2WjoK19JHH6uL4Dr4JOutudNLAXjS9Zz099DoRMHjVqd5qTPS0UFYiyhOFh7ThENQ7pBnIdX/tlrMzCVW2k1G1xWHPwV7BEERwHz+kBFAIugKQX5QgwTugPM6du/7jfEC5TTEL5L+9KM16nm58ki7gNPwRcMZe3nqwZBwfLsXEnruE8H8LM9yUh4ZmYjwz1yQ4LjQqevOChIwcESW8k2QuBox2GSqXv2HsRPEh2sBKAQBWGI+k9rE1jkaYs4yBEyoCMrvNTZr9YfdsnSrSLFZhcNIDy1NsxzgkSXW2u+UuIM1tYpUfP8veH8HwYdUiKdCxLlVdtqIRiNGVYCmLiPmzaekQKjzk+1p/CfJ8YIwQ2eA+m3D2fnHViwKLrQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TTZ2vn59lHBw+Gfkq0jaJUlE69UvFS5OH8V+A78TdmElgtmVIKGv5FvmIaX0?=
 =?us-ascii?Q?C8sFKA7swkP/HOnEEU4lbw4KedPvGTtNo0rYoIf6L3n/2oFIqukyDGXO62zR?=
 =?us-ascii?Q?GY5AdzKwMxUzV1s6LmGktcBn5znHxHJbjBgp1PdsXOQ88ATSWqRNBjg2MHI5?=
 =?us-ascii?Q?BIVcwP4I1tVoPP9JWmgG3VZOUTEbuls1cyumdthPlv6QpX6Ovan0CXBuXM/2?=
 =?us-ascii?Q?odMXQPvy9VjWJ8NXsHNBqwYpZPMXHtDHgtSIny1BHZTgUiDncxOdNftOwYWA?=
 =?us-ascii?Q?i9wBAYb6S0JGBmUR3jt9y0RxmC54ikfuiRfxWC8r6LprJuVSQa08eZl9XVMB?=
 =?us-ascii?Q?8fR7ZMq74bQBv1ggPPhCm9C8Dfk6I9Tf3szmEUx8uCAiAaE6HlDIm72xdKVk?=
 =?us-ascii?Q?afzER7is2M1gLZVoGc5EN/8y2ustuhwQ+/wYKBARznWhAJ55j5cu69P0ojvZ?=
 =?us-ascii?Q?1uablLcq16UEef5plcxwVatUQolCH6RrZyQARY+tDAuZKRPi4nIHV7no1omO?=
 =?us-ascii?Q?4GHjho///fOfafZo10QBtPgp3Ehy1fM/f9Kkj2YcovxM5Wq9FuTkkCHetTh1?=
 =?us-ascii?Q?f5inKoEoTCs671cCin+3lcU85K95iBu5ZR6z1KgwG/8+zB1Px60BYSwRMTEN?=
 =?us-ascii?Q?BNcUwZoDw1/lFhw1QsXa/KcyGSCU+rwKI+F082TxxZixnwSqHTEPD4K+eqmr?=
 =?us-ascii?Q?1ezmtFLpobwuaEPa5vCYDYnyhHLYfFXq9kWTbgo06HvC1ey4VcO3U00SShHb?=
 =?us-ascii?Q?LRplFiZNnY8xOvEWJESxsm9CucNMeyJQwBagt6vuUPThkYKsqg+Vo2Ofj0OS?=
 =?us-ascii?Q?gxMJ1Nl/0/whc2s8arnk88kN0BjFiooiK9i5BnxXCvH5flmPITYPlOMLWD4g?=
 =?us-ascii?Q?/zdb6cdGfgPB/ETtjhwSQMWQR7FfFG+R28fKCXN6kQsbGSnYthx8PIt1P179?=
 =?us-ascii?Q?rK9PqgME+39uqdilpLB/nzHjPtY+dT5NrsoAcu0eQe5ecBVCDuiZVZEuPpQe?=
 =?us-ascii?Q?4TDdxYxGnwV+vgzo6N83o+AH4RpaNq5TL8gbsTa316Cb7c2DGvgExo8wxqsr?=
 =?us-ascii?Q?tZyUQp7lgE7LgpeeANx2v0l+6Je5W/PAc1jU92+d2zwtZNMFiKXxMQQohtER?=
 =?us-ascii?Q?L6x2vpPuIIwl1CynAinnUKW+NmNvCkt5oeeJPyl1a3Edsp+GE4Qo0JrS3fQI?=
 =?us-ascii?Q?XTJXxSB0j7vWkTEOug9xiOVJsCP1JAfjYdFD3vAnm1uKy/Kj2vqhH+6BqmBo?=
 =?us-ascii?Q?kHmqimdQfKhqbA6/+pOqfJItnZO4SCwZp3B85FtsXNk2DJmLAAySgoILMS52?=
 =?us-ascii?Q?9wYu1hVEi89XOWmOEKGGp0fqXrvHyRwHLET16VBhWXVcBEcQ+K6qbnVN++++?=
 =?us-ascii?Q?cjX/RB/OTspbenyEVTrUqQhfNbwY5Er4GjwOEvasIla3yWNAWNp+Byrk19Lx?=
 =?us-ascii?Q?95qT3M5gaWX3W4n2GANy6r+KQYs5Vd/Rf1dP8v35l9j2n2e7Pga1b9qouFZ1?=
 =?us-ascii?Q?avskU1y2hEjqzz522Fvm0woadRple2G0MJCdPMUlu6myx0y7w2n7z9MjNKn5?=
 =?us-ascii?Q?EDnLOwZytyNhyaAXKr6uXJ+7Iu+CuTBudL9tXmTAZhq77326MhjJqFdEiOA1?=
 =?us-ascii?Q?ax16vd94gxVMZWeCAHop1tKtPtOcmLX/21f+h7KXaeckwTN1whdYi9FD8hBo?=
 =?us-ascii?Q?MPdPoEH0WXtE+uPcxCnzNybU5xhvMkE9kDiaDDEoN4zwShbzn88P+VYOG87D?=
 =?us-ascii?Q?mdttTpQKOAzmAoYBpCEXEQUZyhk0Svk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1b71fd-a303-4446-2848-08def47875ba
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 11:38:54.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biY2mgCVAu3GWAzfsS5Cvnh21/K5ak8Ejsj5uNreoKwTkl1IZdWt8IlaEahQFhyCc6SfowZt4Ok5UH1avuCpufy4y6Bf6m1gScFP4X1Do4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 11:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243008

ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5

Source: NEWS

0.26.5 (stable)
* rpc: guard against overflow when decoding nested attributes (CVE-2026-189=
38) [PR#777]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26.5=
.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-=
support/p11-kit/p11-kit_0.26.5.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
index 4828d6f942..722f2d876e 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "libffi"
 DEPENDS:append =3D "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') =3D=3D 'T=
rue' else ''}"
=20
 SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=
=3Dhttps;tag=3D${PV}"
-SRCREV =3D "a14788849d1ef44422d679534a13821eab5bb5f4"
+SRCREV =3D "120050e353e8f43d7c40bbcc047f667f903f4de5"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} =
trust"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,syste=
md"

