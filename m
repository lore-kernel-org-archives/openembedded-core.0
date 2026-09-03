Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6FEC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 07:33:08 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2454.1788420779177213444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 00:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bq9sC5ay;
 spf=pass (domain: est.tech, ip: 52.101.72.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez8QjbEXbbHitqp+qNCZPOdHdKFJ73DdMYM5XW6gkKg2luJFcYe7DPcB2fx8kF2ylV/Nh7m38+OZlgyhwviVvocit538AXPA02yIfvBhHuBku5oTR+LD9Qg1GsAjSs9c171XRDUGIZOFC02z4WhZkL3dKq8Io8Rj6gPFeMABmgayGzEy/Xd5G6ZuKFIp6W+SXfufMOIRbFAE92mXl+k9yp78dN0us2bHei4JoDahLMVD/qoB7LB2cJ2inbE+QERgVmIdFKtlkIXkmto6tn9+xo3bqIVfo7+1dbva5v5eFeX5mA7cm5ccD7jJuibxFrWlfTYlj8rAyBDya3w2RFYtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHw8q+Mk4xd9NxmvT1PLmVmf2JOVk0imJ5vNWh9WXp0=;
 b=XbK6NaIW0oqGVwuR7awlZAhFQBXZMtztVsL3f9VGeny3IQvuAUop2hHWDmyFHw2EOacSvDp9D27RESh/1lt/ce4E0+qVQI3agzhUn0H0djlvNyT3tYBC+6BwDdehF3k9wPUwJKtiAf6rae0zvhhUQS0ZWVh1jaNFk7FlBULmtDqZ70I2c65uAaeAqtcCMrYMi2j0h4bOUOJMd8ahNAsb+nL76YKC0lTVFuBvLfB60EkhaDxC+xc6LTwacLWehHFEps6t7ZeR9EtHDpnyBbFDzNpCax/QFzB6jTP0/UR6TFP4yiEOkWmYTYUAIZhcPrXjuBfFRxGGhnepvfFm/OSjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHw8q+Mk4xd9NxmvT1PLmVmf2JOVk0imJ5vNWh9WXp0=;
 b=bq9sC5ayM9WrItToFeaJ4XwkE6fymfISzkbqyXOq6MI6cGNxuSTozlLGQmU3ykd6/6OCpPSMh0u0+GJpLdfUEtW5jpUlh38T0RBO1/+pi7fdvFHalBnB9g4NwBPQbK1pm1AW4fuq5r9uVxjEWt+DXD87cx5EPLiP4SEf5KDvU1eUsR9xOXUFRPiuNbbegKKdQJh9aDflXqjpEtgWhXe18S0LDbUxbdso5XoXYNHwDLt3eP0SnyNn60XUuB0dfxjdduTonuYRPneLho9WT7TTfEBOHFUPKELxG9ikCti6sL3tdLfHnt7vCBuA+V344ws1/+0bqJjK5zc+T96KCTC0Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS2P189MB2422.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:579::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:32:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:32:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: upgrade 8.21.0 -> 8.22.0
Date: Thu,  3 Sep 2026 09:32:51 +0200
Message-ID: <20260903073251.6352-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS2P189MB2422:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c9496d-b7af-4ae2-153c-08df098d9061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5xb4u7hcAI58x8lVKwP1wmyqa5vi2SrUEVaxeRYVc33VY9rl+g9ZjVbmchI3T20r9UcrbH/rtmoJNAMjtmfvZ/DEvhHjQ29eyt1j+bFdjYite0yBCzKQKVdVC1d4v7GwVF+LL3JxCBv403ZNbCPRvXe7QtqXgtIHSLTa2Z2mKUyqklFhzSOrTHD8+PoGQjclcBpl7xFKax68k6Sw+qSC6n7R5b8yUY7Cw1hR0Haamh5IZtGcZFQ0J5ueXfY5cO/V0bPkwsGLh+4ncJduAYqc00/Abf4hwjSLFguQT9kkc1sK+D+OPnLma6VVUV9a+GuetLpq2mdc4UWbf/QmNKqNVu7RuNU+wuVEiwjvIJ10abcTUDKLvqh0vcE88eVhaHGmad6dzsIfyUvhxW7yQxKI0yU7DCh2HJtBelxeDSlKt7so2a43Z0QpiqZUrm76u9gY0LDoLIEwzrizEMFsRqcRvCdbewmcGoXUoCNl8nUwMJvkzHCoWwHAsgFgdefQvT1eRCAMFstOQDTL9sdw8ClATHee0ymhKXFKpy6Nl3aZKrslEcx19UL1V5ekHj4lC+lHZGaJFKTBrYsnvfle97HWGIcb2Ukpdg+gJEJdDOwtJio=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DJqLMFSeEx4QgjJlppkySVVGRvX0R9eil6CS0hmDTtnQfAmS9okSvFRhjR7p?=
 =?us-ascii?Q?HvOCv7TzeDcALSaIJmFuLodIEdkhtrubu2os6WVyehxa6ZN4Ornloin8dTTa?=
 =?us-ascii?Q?4dKcGE8Zltx/cIYOCI08QnapKdP1LWgrqzDkY5tN+fcHBkNQ3xdeL3ovDM4t?=
 =?us-ascii?Q?q7a4nXp6MxSy4tZs4WEVTVMlgZWwLWA0QylCh5dfoM3gkeN/l2WIQ0zq7b2/?=
 =?us-ascii?Q?330kcfbUXccihzCCIfy7+ha93rqLlSTtocflwl4IL6kYu8Lm4w4nExoTgyjl?=
 =?us-ascii?Q?n/NJPryt+a/ETpLm75GDbTJnvmT34t58rtZ2F7E93cXTUs9dRxkykel836EF?=
 =?us-ascii?Q?OHrEt3sYtSFvYQ8G6w9trrv2NKX7BueZasfU79u0JgTpLd4eQ4VGy3+Mz0l7?=
 =?us-ascii?Q?z8KA/t88OAvUZO8CTbFt3W1Gc5bBFwiZplQdFSpCmrUUdytrPlPpr5+n0nRt?=
 =?us-ascii?Q?JnaSSaxwxOjQZhmFoppcLVoD9ffzpnen+7IJXBGC4jiYQkwjRVz0h9ijPWab?=
 =?us-ascii?Q?W33Z2FGavfFNJZky8sp3lfEFrGIXhe/+vXqmw85Ce6EpqfMzE2PD/awqDDq3?=
 =?us-ascii?Q?KAUCM2LOwQYsmBLH+FMwPQJ5SO2sHurAvaPT1sYEbZw14w/HHZF/3TMdppJp?=
 =?us-ascii?Q?mRJKs/cNb9onj13zJmQtw1SEOxVnuoVv277TefF5bbzZI/w4mWHhj35NchUO?=
 =?us-ascii?Q?WPw625btHEc5dhHPB44YY69xSNvX8N7iDZiB0Ajzq43q764ge2IcfGrpIS39?=
 =?us-ascii?Q?+FBwZgpkIfCEFDkluiVwVwzCj2b0GBkTztq7vZBEbzJZMuBwQzN50HowP0t7?=
 =?us-ascii?Q?K0aBiIx7tXrPMGRa2EniLxisMrywLff//GxdPlnNNmALJM8e5ns0y0CYmviQ?=
 =?us-ascii?Q?npa1JrMB5JcWHGGL6EOYTCFIhFRaZrM7xrmpvJG7NXUpKrd93keYU4fTQ7k7?=
 =?us-ascii?Q?PNUW06OzluC8t1VPR+kjHcSn6hxckIM6zcFa/oAG+KGCN1kP04F65ewVoZPJ?=
 =?us-ascii?Q?Bd7+zo28TglJ3eXmjIV8b3JdZRFl4vY0cYJCyRQDYOfzszBB/Rv31/TI6Ctw?=
 =?us-ascii?Q?hhRvXfM6SJBjr9LMgRg0waXChBgKnBSCxSl6mot2efAZa+aXbtFYN523dCir?=
 =?us-ascii?Q?dGMbaB4TLGsNubVo9/NlBiQYxizcTpbdYtZubBYKHHvMPCGziwy74LzdkGgn?=
 =?us-ascii?Q?zi+CY/PXITavFrHCMRoM6rPUYbIwtH/RFGSFcMuC4M0uLhwHl7XBoprfI6aG?=
 =?us-ascii?Q?8gpOt2jfelm1v1QvGclKWTAekBcm1fZF7KEFaIxHrJGsg7LKP+m8QBQBdw6z?=
 =?us-ascii?Q?ktAMlkL2NzqijcjqGdu9MWY4BTxLrRMK14KjuesqGrEWKEME9V68S31wpA1Y?=
 =?us-ascii?Q?lNNtgXHgYHEFBsoaDqlrtS+amWq4eG1NCbd0LVkb5seNk4Ru5ozb8n1h6AOc?=
 =?us-ascii?Q?4wDjhZnj7Ii4HJXd9t08x8kT7zjiu7FncqlwLzcOV54+a6/5qYedXtAC1FEz?=
 =?us-ascii?Q?IN9EAfJ/IvrDTuQcCpxFXOY0wqPebKdxGR+v3omQEaGuVxrCIj9mWAIcYPKu?=
 =?us-ascii?Q?/TASaKQUpNQdZiMH3r87T3LX79ALO1TT39Te8LON0QbcfU7Xj34xyb1MgRv4?=
 =?us-ascii?Q?/sfp84E2J9kA2MISFssa7zT2yqPN5Sv+uycKC21wwiV9fot/1MO1fXSuFhIM?=
 =?us-ascii?Q?yn5HzxuPyvHmAyipYMrroDFFjv0Y17wYfLDmQB0CJSzHcY0T8V89bgTpp45Z?=
 =?us-ascii?Q?u8aqx3P9SSXQ9SmXiH/k7mfRCFUX5w8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c9496d-b7af-4ae2-153c-08df098d9061
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:32:52.8849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScXR0reW6qg6rG+w5xWeJcGjf0AQFWCtISFxjzegVZeLAZPrzi/EQAqvD53LnxPWJ/gP3OQHtJ8+s7beHI/6MBJjC3NNrvZB0Toj3GjpUeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2422
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 07:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245012

CVE fixed in 8.22.0: Info gathered from [1] based First and Last

  CVE-2026-13608
  CVE-2026-18924
  CVE-2026-19931
  CVE-2026-80229
  CVE-2026-80230
  CVE-2026-80231
  CVE-2026-80255
  CVE-2026-82208
  CVE-2026-82209

[1] https://curl.se/docs/vuln-8.21.0.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch      | 8 ++++----
 .../curl/{curl_8.21.0.bb =3D> curl_8.22.0.bb}               | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/curl/{curl_8.21.0.bb =3D> curl_8.22.0.bb} (98%=
)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/re=
cipes-support/curl/curl/no-test-timeout.patch
index f432279728..93c2627bdd 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 30fb6d1ce4cc721feef5665934f2b7f83fb50efb Mon Sep 17 00:00:00 2001
+From 4bc84380d2d0d85ed5a57cf9f78286531a19de48 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minu=
tes
@@ -12,15 +12,15 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/tests/servers.pm b/tests/servers.pm
-index 5d5d98b..442cfaf 100644
+index 99db988..81a7572 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -124,7 +124,7 @@
+@@ -123,7 +123,7 @@ my $sshdverstr;    # for socks server, ssh daemon vers=
ion string
  my $sshderror;     # for socks server, ssh daemon version error
  my %doesntrun;     # servers that do not work, identified by pidfile
  my %PORT =3D (nolisten =3D> 47); # port we use for a local non-listening =
service
 -my $server_response_maxtime =3D 13;
 +my $server_response_maxtime =3D 600;
- my $httptlssrv =3D find_httptlssrv();
  my %run;           # running server
  my %runcert;       # cert file currently in use by an SSL running server
+ my $CLIENTIP =3D "127.0.0.1";  # address which curl uses for incoming con=
nections
diff --git a/meta/recipes-support/curl/curl_8.21.0.bb b/meta/recipes-suppor=
t/curl/curl_8.22.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.21.0.bb
rename to meta/recipes-support/curl/curl_8.22.0.bb
index e8c024d18a..ad3e6b728f 100644
--- a/meta/recipes-support/curl/curl_8.21.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk =3D " \
     file://environment.d-curl.sh \
 "
=20
-SRC_URI[sha256sum] =3D "aa1b66a70eace83dc624508745646c08ae561de512ab403adf=
fb93ac87fc72e6"
+SRC_URI[sha256sum] =3D "f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224=
dfd915a2a5f4f7"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:lib=
curl daniel_stenberg:curl"

