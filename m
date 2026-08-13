Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E518EC5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:16:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26926.1786648589065447847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SKJyMhgM;
 spf=pass (domain: est.tech, ip: 52.101.83.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RldoZ5z7IjwqRiJRAaA2Fr7+uDxxRVRAt81ioO5qfuqx1THIrG+o10Da04S6ZtAksdy1YYNPI7FxXklN0K+EN0y8hQJQa5JQ5JO/PNcCY/q/PReuUCnrt3k1LxKnRZP2bbklIvfmXQZgt/XT5lrP0+q8oDST5XhUASEGOODOtjT3Pe0JQCzAIRxuqEyHLCSPE2zwXbt88yWjwFDFno7cOipxWwKlJN5SE7VWGcOoj53W4JhD9i7sII/6zF0WGWw1b42XuirLD/7WiMuFwtmTxT6J/WmxtAhnRfEcWVouVPz3x9g1x8az7yf0aHqwXrQG9563HMSf27S+0F2kgvKzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqpLA/wJK9Xw0cwojsiAPCksREs4UnzfVrzxNInTQlc=;
 b=WxvHn7q8cT+jUm1Z4T0YeyMF0IkIPYt5NOcLtBMRySVXA5o3Hv7QotUh2cFaUSVQh/NlzEq7qPFErkPe0CTefKhamT/Ee2xllnHzJxFjSbsPV1XXLEx/E1eUwwIB8+uc43uYK4IpxIPlTT1lerY2UucIj91+ZTcUGCiCFczXWravY/spVayStEDF2q7FBLBsAKWKNtdyofzThxNt605Qc22oe0+Iis8sf0Q8lqrGozyBOWMlx+h4D2bRTPHbe21oVx5rvE15I2tDOSTD5YovpCIJwvItv4eEqS/8s0AgukMsQQclHPIUBTpFfCPgXiYrlBPtKqWQTAayW2C6GbOj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqpLA/wJK9Xw0cwojsiAPCksREs4UnzfVrzxNInTQlc=;
 b=SKJyMhgMN3YsQhrmuNmXAFuk13G5tW7hLCUNkux7JeoZeQu45G5bl7clWUw8WGvFxfLdUouB+TevQKlBVRvulmAlFaE2Dm/RX9hFoFbgVs3IgJpj/kaWOaydV7EGeWfD/sBfl3G+zv7M6ISJ4Q9GxhCCg8Rz+RlWjMb93steXVkd/Lu4cYoLBqf2n9B3culgL1ZturcbvRlRsdLBzouXNSHYYBEz9fPcnhOEQtiCDp4vH3JGM89LzVlg/sojXMHs9lMkngzHsNs3pQNZyqnGFQRNhKfnBelYfZ2f/lzWlNgquNzZzwS30NrgFkRLVKV2GV+puAe0NUUbIqhJH7OV4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB3733.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:16:30 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Thu, 13 Aug 2026
 19:16:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 4/5] conf: fix trailing whitespace
Date: Thu, 13 Aug 2026 21:16:14 +0200
Message-ID: <20260813191615.34122-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV2P189MB3733:EE_
X-MS-Office365-Filtering-Correlation-Id: 500f2083-6c3a-473a-5bf4-08def96f616f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|11063799006|3023799007|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4ib0tyuuTID2NTRLGmqfWOvqSwZ6WX3eGXCLkfcMRO5ql5uU4cVAeIvEEdHo9q/0o7Be4GWm6mIsJSYySJ9XIQoVPRQKkhi0LvyBaEQMpcm9gSDadFT6rdzyIkiPt0Qx9ozcJIwyBm1SR/m2nhF+TDFR54shCttWx6x/zbw3X3zcPhLYhcUIFFTJ2QUhTuL39G3hrPbDP8JTVLfbBDG+8+6+zaGzSeTN+6jOFhnDp3q3drVFE7lPbVnxCsjUnyqLUkNb1WA9VxRHsPJ81f1oyF/d++LocOMjKBpsb0/2zIwqFs/W3MoMrh1DLcYl/l1LRB2paawlOxKBJljO/4O5+oVzfCBE06/V85LMMmc9RUZiezszz/soITnjSFa7Jkj0DBydiPWWnlDp+P3Pb7+Ypd2Jmxc7JDASe9+TMNqd8qmU5cmCjsRSW1WWNNneThP2uET7Cxs7jjnQ35qPnxWx7kNLYIMrSG9/u+FJQLy9Vl1fmU9H8fxuZg+QqRq0vZOE0bZ5NmEnvdc1HgxBYZM7o7OKz4L9VuL+izynf5CwSOPU6R+xukmhNOHKTFR/wrZfxWEOmW7IJj7vkvxPMa3PaZNcSSQpFdVdm8T7I+P+HTNsLMDa92UcFjBxZU2Xoj7Z5nKFREiHlerMzSrliNum4PslPvOWqsvCz+BN2BwYakw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(11063799006)(3023799007)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?juQbAVLIjG8fIJNK4Yj/Es6+hLy9VcAssR3RWWKK35+XdclJVi+SiubCRhEN?=
 =?us-ascii?Q?spyumH3/EIHQLoRG0LCzoQZJ2eg9RgHDP+umyoxnsy/P8UAbzZP5sV0TfVZI?=
 =?us-ascii?Q?AVogWN15Edaof9pw3BWjg5NMu5/wvdNVuTEwrTmJyi3hNxktIc82lt6wN21c?=
 =?us-ascii?Q?s0iguVTkn25rL8MXZD3hQF/9U24HN5EfEpblRufXF8KXq4bTeHq3ErfnNFFj?=
 =?us-ascii?Q?BHrYQRA47F3JETWjo82MLsjY2ceLUxVkvR5fs/0bWwTisaWlfTwfFPkXua3V?=
 =?us-ascii?Q?ZEs6yUwcNS7fafwa9H1n53hSwvWkils8/d2WCtFs3kZCIgmFkFktz/zsF5GG?=
 =?us-ascii?Q?VSC3grTmD9oWTdI7uWWpNwMAakzEMlhzHWNu+WfluuumJN0B6XQaDI1Yd7P6?=
 =?us-ascii?Q?CsfXOVIccj/t18HR3LAuPPRw2oggJwxbhGXdLGbHV6fuykmGLew+Afh6t1fs?=
 =?us-ascii?Q?NmhBbvK3ghblW7fyFaQkUf9ODKDZgTzOz6fdl8pOmqc/quM75XlcvMHBJTXl?=
 =?us-ascii?Q?3cD/d/dLB8ibss3+EZa3Ts7V3yZSeIcHy7yXzzn37tqXvlhySYnUOzENJwqF?=
 =?us-ascii?Q?yTIpU0/QRJsJ/gWkbm5rNTk7ZIDpQyJOiHosStDUaBXPvfRSl2RfdUkSQLkt?=
 =?us-ascii?Q?2seCQoqXYCi6XYpQec4ut70O3piwfqQlq7qbcfN/cy3qVb0Ixp8oh3pHpAZB?=
 =?us-ascii?Q?CV6RG35nnbBXVkVPZxeGCY1Wm9zi6rHV9za0nfSbyNq2q2oC5ZK8dK3cq8JD?=
 =?us-ascii?Q?ROFsgYKyS5J7BJyHfMYyrGcGHLFP1tNsA4mcflHKB1FQYUtzNZskW+jthMgM?=
 =?us-ascii?Q?Ghh77wNzvFBD7cevU5qRE3XyimgyUrWAJd7MQy1dE+1QyKKkwLLZ3EFi3/4S?=
 =?us-ascii?Q?YMhtHPnGNTPbO70OZQG5GJ57MrbbpX7zozhW+gR4h5LggLDXCyESnfgoG5e5?=
 =?us-ascii?Q?omRf8SBL3x/Z+AUtGN2ta9GwqBUHe1f2d5SSFfXuflnGfynUyVI+vAy0ckVb?=
 =?us-ascii?Q?wkVnXxKEUn9YPWt5lxx0sWoPwf2RZcHHFxm29aGJD1UCB66YAuFk28OvOj6n?=
 =?us-ascii?Q?DbX9xyHHLTAFFZFa6ARoE4B0ImQjXBNpaZwQMLK8B6UfFLnsU+642nIunSEq?=
 =?us-ascii?Q?OaWUrrEKVBd34xNM0AelGLwzWtKk7EiBF9OYT7ISiXlZ8vC1fm7FcDcMM/+7?=
 =?us-ascii?Q?wZcDbk6DXmYhs/+4byo/Vvhk5Mbdsm24jlJAMaYJdryz4BTupnOpy+AUoYu5?=
 =?us-ascii?Q?RJlSkl6HHgmM1bhzWYnbRWmTWNCZmOYnQbOG9MrK6nu7Tza9r/0xQ+w4bjv1?=
 =?us-ascii?Q?ZV9ijuznOKZ5EvWZP5DEU7Ux/y/MxNjC4DzCT75if6UsfHmh6i1NjauivPOm?=
 =?us-ascii?Q?E8ZrU8v6D63aQOrzkfS4BqTvSSGrEGpJ3T/6c/VdoRHmf0uEp6CZIYcoWOmX?=
 =?us-ascii?Q?f0ufvNesCKZUWE6C9ehiLa6p8gQpxrDGsaF4Z/JL0x0eLnGkG41eU2afYNcH?=
 =?us-ascii?Q?GKfTJ9MLq0fKvlzpxbTPDfUz9QSdBS9NxQTpS/R0laH3LgiBeOnCTJFXjkdH?=
 =?us-ascii?Q?aSUA6stePNNIqxio5nMQhxbvEh3zDuDLQtqVUxy9/v+YYQNI7/gWZ3T9rTGm?=
 =?us-ascii?Q?HyI72VFq5tjIMaU+PBu+FOlOdLRWiTsFsDt2T47yMeQz/SuQWogjOcjM04R7?=
 =?us-ascii?Q?ssdRku++Y7Un0D2x1QfIjsfcfh6KFFS8BbZ706PJONWRP4pIujCNjF1HQccT?=
 =?us-ascii?Q?4dzDa4Ob56CoSYXAS+XcDyJMF+JjJ3oYdPr3mmZ7uT/rb9R/XaDFOU8NHSb6?=
X-MS-Exchange-AntiSpam-MessageData-1: mqls+0fHx6er+r6h78cGoZP4dSRHwlCVR9U=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 500f2083-6c3a-473a-5bf4-08def96f616f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:16:30.6633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5zqcHUOje//90ZbavAV3ZKyY58FOKBFALOiZ/2T7S+CAwwV7IIB1Sv3z8nDcNO0iNRB7VOi4cFcDVJHp85Jwat0OwK6iDX8abmWCOM/H4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243385

Fix trailing whitespace in conf files and local.conf.sample template
to resolve bitbake parsing warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/abi_version.conf                    | 4 ++--
 meta/conf/templates/default/local.conf.sample | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index ac97752c97..3488363a6a 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -1,7 +1,7 @@
 #
-# OELAYOUT_ABI allows us to notify users when the format of TMPDIR changes=
 in=20
+# OELAYOUT_ABI allows us to notify users when the format of TMPDIR changes=
 in
 # an incompatible way. Such changes should usually be detailed in the comm=
it
-# that breaks the format and have been previously discussed on the mailing=
 list=20
+# that breaks the format and have been previously discussed on the mailing=
 list
 # with general agreement from the core team.
 #
 OELAYOUT_ABI =3D "15"
diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/temp=
lates/default/local.conf.sample
index 2b837806b1..935699929c 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -220,7 +220,7 @@ BB_DISKMON_DIRS ??=3D "\
 #
 # By default native qemu will build with a builtin VNC server and a SDL UI=
 frontend
 # where graphical output can be seen.
-# By default libsdl2-native will be built, if you want to use your host's =
libSDL instead of=20
+# By default libsdl2-native will be built, if you want to use your host's =
libSDL instead of
 # the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PRO=
VIDED line below.
 #ASSUME_PROVIDED +=3D "libsdl2-native"
=20

