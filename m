Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8051AC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 17:32:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16988.1785346333898625176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 10:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iwZc1+6s;
 spf=pass (domain: est.tech, ip: 52.101.72.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNMXvP2gEcavRPeXAJahqRd3p4ECR2pcrWvHSHX3oCOGux99BvilhbLAQqzQkaPWVmDCH8JC/Om347bOvokI/spqk4dbkxt2xCSNFZ0ya5nXQkG4fs8k7jBnq3uRoY/uBYKMGEzSCuEl6060TqqKXiQR0oubdB2kEL2/3uASXZU37DoxopLZ+fyYh5UbNQrJO3pI4uTJk2jOWVqI9jEbGHNAC0s6vICKaXAP45UUnbWU9+VqBrvwIK3Lu0j5wk2O53g/2TCMQ3zooscUwPUU87csWqoI9Apf67qtdLiXsD+AliHfxJCI1+J4eDUPgeFDzZAGQd4488joxE5A/Eqxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpYPLif5o1vCXIyNNZTjMzl+4Bgr6dlye7+x99cXu/Q=;
 b=Bya6CK/ZDWr+rlxhWK9uo7jQ99PyIxF1S3Fi3WsGEJE9xJorJ7DUJatjBuMZ6oNZxFwWLsgYwNTRM7+iNXaypxNTt9uyh+bbTqo0ziy0Y5dlgUvFuq0odcWgZ81LMy28corYhToylaBUwcaWjt1IuzFDPT6GUpJji+9T4RpMPcMuufWN/OoXN8eJOSbm8ulH6XZjFrB9eaVFzjZ7hIqZcMxo3y3+9xZ1eUqkb298lSXw+u/aXFm6UlgpJDiH34a7kc/xsiiDSOCYR5wAnmw0/6jvFMuUC0+/NZXqPnrXIIZ+N/ygSVJEw9wbNawffZxJa5LOemM6/nBU27roRMNL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpYPLif5o1vCXIyNNZTjMzl+4Bgr6dlye7+x99cXu/Q=;
 b=iwZc1+6sd7pAc+rf10aeKNS4XyDnotPZHCMFb0XSXHjNT4Ctr7iXEsXyLnXPfoil/dI7Gr5X/NdRGTIiF0RKCjyBpCT3twOhAC58KwjXpDKH91zE+GSk2dmPHbGmNnq4t8urX5PboPhGrg0iyPmW4YVMRIlEMzNKgKFVc4yHTIXNiocittTRu1PE/lHlE+luo870wRwmLkk+NTFRpx8CikHKV34BJDD36lFxv19jTkhfcoYvRrz9uwrJvdgGLSyoQydXzBDi8BoD4LjbR/e/xxLZtlPa3GNNx4a7rtSfCaa/jrIx+V4my6yp4KWfgKV0juN5S3xKVlaNnIUzEHTSdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAWP189MB2609.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:335::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:32:11 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 17:32:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] libarchive: upgrade 3.8.8 -> 3.8.9
Date: Wed, 29 Jul 2026 19:31:56 +0200
Message-ID: <20260729173157.71731-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260729173157.71731-1-jaipaul.cheernam@est.tech>
References: <20260729173157.71731-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0005F6EB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::246) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAWP189MB2609:EE_
X-MS-Office365-Filtering-Correlation-Id: 542d84e3-0b28-4195-8384-08deed975246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|6133799003|10067099003|11063799006|56012099006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tuhj2xII6MzTJJ3ad23pPhX8qfd+3b2gcfjbEHdFa8BdEF75PGuEEcbDW2S2IenUdF/RIimTj+uqtQVWjQTa0sLcRehX4UlcH7YAJPa+cJK4mmzIzm5Vqmp3/8yoCnbuhIQFi21DFzUZVRf5PTJoqt/5qStL0ivW++m9r5vs6weP9y33dcknbajkNUd9F2jvr8QRJDkH+ja6qM5BvllTeWY1ZfC0czqWNudBP4Wcj3g5v1jzyfn0c8T2pe0xdZX/kzqUC4kmtKdGt6gaMYgjas6AnM6nx6iRsEvPFTW1DpqDMNsWzLNq0JLr9A2YI1EgXtPFSvfzAvHySlUc5mtAydGgtdMIlRp7XjpGEhysW6dk8KxgBZL/AOzg7xgp/uMsfS0i4Q0MTv9OvjkGZiqhWo0pWvJw2CYB0bgJa7CsBp6HfrfsnLknLxwSWOaWfximvlI3Tl95as5VJukWVE2ES+/5XldoFlNc3VTpjBuFQRFGxp+VfcbyAHFOIKYcmLWVoqx5h4VDPBrsG88XNJ1wZr6t3ulWhoivfY4R2Jtv6cpNgikLS8ZntXRENwkqxAFmXXold7o1VW7LMx6RW4Ty8fwfgF88rklPjc6OrPkdKx8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NyaswdF58Eq1BF1q/v6QSn6eLlenBKBDoHzzZrRuAyf3ZK9KS7A7qH9BxM2r?=
 =?us-ascii?Q?4pBnYpEA0+SAOAxaH0MNXlVx6UHAhoPbvcZuhW0yvZUJWiQQXqwEgpkOGNXF?=
 =?us-ascii?Q?pOg8TFnvRscWdmj6COKwD2Tv26KjMGwmpAp3SZ2gy+rQw8YwpT07SuRKUSUk?=
 =?us-ascii?Q?nfhOBUPGilapjLu/bFwHVEElW2D7wSt1raK7/VAdgwEv89NpyJy1aLSS3498?=
 =?us-ascii?Q?ZPOXXVjRj7rRQGlVp+NKntR2PUbptpR7kf1W9/6UW0VJSW9wwVgg30DgPeHO?=
 =?us-ascii?Q?PKI6RTCEu4eylkHADs3ZCHMRteEsmZYz5vULHjKNpFo80v3AG5ye1moQnGMi?=
 =?us-ascii?Q?kdloVnXFTQBsFNir73xXhxDHbB3I/roR2Bq2b/CPWMHon/CJRT9A6s8iHRNf?=
 =?us-ascii?Q?dVV3/f/K0DYpFyjAEZoGcEWpSoYWzo7iIJOFZV3hmwp2L95J5JNhFXRZoW3Y?=
 =?us-ascii?Q?DWRDYFlA4crrvyBI+lt5Zjl7pMyUiEzU6v4HeY88VQbDKcBQnIeJNh+AG3Ak?=
 =?us-ascii?Q?/33JR9sp6dn8wjRfVCNqr0FLan50AgtQOXSf7KquY9PAwwuupBv6JANo3lRm?=
 =?us-ascii?Q?w5GLOiFmChCn/QSn9A9uyxIufS/I7ftQLJoOtCMSigyT8/uBK6HnCCwMhtJY?=
 =?us-ascii?Q?6k7NVEzWvPcPfl0LUXDHZbwJiPwtcRGjbcZ1K8t7rPp3UNTSgd0rtR0+uxV8?=
 =?us-ascii?Q?xMME4L94ryAbKQsyLFmmygGIRIyDNh9P8ABlKzZjfPvtxMv27B+zfj8P4Pmg?=
 =?us-ascii?Q?mk5zLPegmJnwyHrNZdWQbvcpx/NP9PjJFNKLV6swALJBAJPI3bwtjFpYQEpv?=
 =?us-ascii?Q?pXTOeKkUlo3z+QeByS2K9RHcPfIEMLgSMZDqBt7mn9gxJKgwFLQsz34kwkW3?=
 =?us-ascii?Q?F6BqBzEcJ0It2NIWNe0wo1rYIZ2C3CMCj1TkbuL4odWevaAnLSliz9Pmc1rf?=
 =?us-ascii?Q?nwRSMImxH/RxAo9wa/8cLnprkQb03+EMMMLkMxEL4BuEyFjwCNhu/Ce7Y8IT?=
 =?us-ascii?Q?aISzoXDYdsCf+yIKxBjAKqaylVmeQls4CCB534yNxnSsgSk1IY2uUltDvaJQ?=
 =?us-ascii?Q?x761QdDAozhqlJM7B1Y9o/62rkwLn53wPBghknQ4s2mSAqmRiM2sAxnW9Uka?=
 =?us-ascii?Q?bLvQZFNu5tKYzZNnwTT3lWc1wEQ6KPPK2wEv6CjYCA2R2wkYNhNAI7PSJuuf?=
 =?us-ascii?Q?91SKMdNhUAj25wrXi8KT94rfOlWLDabBo55rzbjhWiZwwW/w5OheIAF/FSl1?=
 =?us-ascii?Q?Unjj89cXaCvfMnCKX9wPo38pQ3/87p3OWJryw+2Dka/b8GUB214Mpekir8yF?=
 =?us-ascii?Q?94iD3S1ys47hwk3kn3bayBjtSN0LqEXYG9nO2EYhGfk+PPKEEdqcENP6MsBH?=
 =?us-ascii?Q?hel2qis41Dj+OpaDeb2UhbCeANnleAEmqA5M97QbjgQAiA8tFFOgfHr3KaD4?=
 =?us-ascii?Q?KUO3BmLeFTya0dJ3My+MzL/p41iFHhNhXG80BrmwuEUjF8/fQJSPwLZug3Dt?=
 =?us-ascii?Q?0Sq/qwTv7w58tHNdGWrs3uuXyf9PDEKKCm5R627XPfQRLaS0YlImjann7baT?=
 =?us-ascii?Q?9g1aJi+ZiUygCwMTzcEATIy++xJG45ef0NKguCX6nNSr+D6ZdQ86AWT7YByS?=
 =?us-ascii?Q?nxp8tHzD+vBovdc0y35vmq/ahW5ly7NRICcZ5q0bUt0luKcG8x4gAwZY2iXK?=
 =?us-ascii?Q?eXt1GanSsC+Xw4wQABbuxMZGajbqm6MLgT8V+xqvhpxZRMOAbFk0WLA1XhvL?=
 =?us-ascii?Q?SrPNTSQ5mGrsUqkC7zBDMie3FFq7UUAhMJPdBQRYpLuapf1ObKeIhRG/Bmgt?=
X-MS-Exchange-AntiSpam-MessageData-1: xxi7ChLLaCpmRomW0i3KuBqohJCkeUwstgk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 542d84e3-0b28-4195-8384-08deed975246
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 17:32:11.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TohK8bFdBTxcd8LCR520OtuhwTZMe0x4ibSVojJpmD4IkDUFgRy/xhBboGpOYKzgYZwfi1VCsdV6A5GtAuisM8po3GXBBSqA+HbbDaFF7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 17:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242282

CVE's Fixed:
CVE-2026-14164
CVE-2026-15028
CVE-2026-16517

Release Note: https://github.com/libarchive/libarchive/releases#release-v3.=
8.9
ChangeLog: https://github.com/libarchive/libarchive/compare/v3.8.8...v3.8.9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libarchive/{libarchive_3.8.8.bb =3D> libarchive_3.8.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.8.bb =3D> libarchi=
ve_3.8.9.bb} (97%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.8.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.9.bb
similarity index 97%
rename from meta/recipes-extended/libarchive/libarchive_3.8.8.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 2c8bf922a6..da792374cf 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.8.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -34,7 +34,7 @@ SRC_URI =3D "https://libarchive.org/downloads/libarchive-=
${PV}.tar.gz \
           "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20
-SRC_URI[sha256sum] =3D "038918ea315cdd446cc63acfe880d6011832bbe1711c887de5=
de5441b306c190"
+SRC_URI[sha256sum] =3D "f5a6539059cf5e597dbeda37bfa4874b1e8dea063c8d93bf85=
a2b44af90a5bd4"
=20
 inherit autotools update-alternatives pkgconfig ptest
=20

