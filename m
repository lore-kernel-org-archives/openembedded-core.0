Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4046CC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:44:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32177.1788777845188201737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IYL+xyMD;
 spf=pass (domain: est.tech, ip: 52.101.69.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAtA9+qNMwBUwRq7qPg0Zt6Ti9LGrSooTdz63IGV60ZEiCVevqypGNpE6Szu4svrwgjipjWwO1vqWiSAqALmUEY0IPcY1dK83J6D3YWyAhTof1/WDQHnAlb54tQukIUqlR4y5Ju9Q67mdj2ta09JFFgpG7QTJq4JCt6IpDW+vMUu1GLoMYutbwhYneI4hfg689ksg1r3xAbe1CZI+9B5wG7aj2rVyQUEP0otIpjmB+V5FqPKkCbkEIVhbFGVS4VzfXQUHhb9cYJmLI7HqUX4n1fPZtP2lBWsSIdxEJL+oEup4TOuTPrP5NjtH06XFUKwhr3645+cUA1QFcHMbcqXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd/NheTfuu8+x8GqbpAdRo/YASEPEn0Xzj2pyLmmz2o=;
 b=EHxRuhP3NHIQu64Vhd8PvhkLjG9cwHE+5hqHVTIt4oOKKIKtnRrHzUu5VItyiuqFyIHCSO7fggiCpHonAytU9BuzKP1MYKjykfKU9vTN2Dp+nAAOQJiWcfJxTleVCGroBRqNMPIGQ6qexr0hZzJ9U7J+R2qs533R8eHHQnoCI4H+t5C4P/hDdNBJ20uFqyaTMKIP+qHogxKOOGpXPfH89ylpFCqVncJtt3jqSAxWYfYHFY7mKteacPK4musn2if/NdNyFxFXyhCuwMN4/aH5332b9lZEpjpOUKL0AjdDXcJgh586DO8ALTkONkMAmM+sfCLFsjdYVlh9w2gLwUmgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd/NheTfuu8+x8GqbpAdRo/YASEPEn0Xzj2pyLmmz2o=;
 b=IYL+xyMD0u6IOQ2SrxcG/4oIh+OhqVSQDydWWscYXUYkyu/t3SEWiFmy7fkjHsZWoQHCWzh3zatusWYkNVS8SFFuBDS/DXFFhnJgjB3aK/QinzhDCwqTXeOi9oGRizeXrf4kWCjQ+v/8rqOSwICh9mUPVcSR1DrivpDk6jG/Mow1/T3k6ThJ++iK3GmQGD73iAdHqDnSZsX53V8p3nIlnJJgu/iKcZdVW0V05tkhGzWRPEwfDGt0F7bLDo3LM//dFurWHCfQAKefasedxPeXA4T3EJj2z88MDg3QGtGqLjphPeWSZ+znlU+wT15npbgjKd7b96tog9zdJEUt0gnp8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3127.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:19d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:44:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:44:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpcap: Upgrade 1.10.6 -> 1.10.7
Date: Mon,  7 Sep 2026 12:43:58 +0200
Message-ID: <20260907104358.18985-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3127:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c799d3a-5b4d-4373-68b8-08df0ccced45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	bG6vxjWkiCeM0gSXz9Fmf7qayumV/ArE7+qtTSIqXsFklhxlTsw2kf2lOF61RpnVqqjqDvFY9HcIzHctL4InKZsGGWuvFkvWi4e3sg9NApyiwmgg9dq0OT+9J5uIQFkW06i00NsAf+eoYGr87DzwYVX64uNk8HboNrfSv0NF8a5nEjZwPYRUxl+sLrBBrtiw/G1eHpPyRWmZRi1bfbV8FXC+/zRZTd7Hqb+1ef4dblebrqMFVGhjie2sQdyKcJ3QjmBNI3ERqk9AsZrjGyBFm+sHcPoLxF8d/c6KudViEHwonLT8+rvvqoVLYETuml3sIV8fMX499S36+0wcZ2yznIidElX9cu4NPuMIIDF7zKMzecsJePgcYnm8c6SdDB+7vNlpCp+g2nZBaZ8CL58QVJzAswYwhA+KOVfOKB7Ml0440AVFn7Y7KVGYryJumqyCPToRNTLLCuPxBvDiIUpot3IWRwFWb+Unv7l5ltNfV7uTWm13AYcXdkDsAO2EfOx26auIcx+dDg9xwyMIzu8fF/767BMZQg1ID5/JOn5BaEXSXrypC7btrBJNV/WUskIw/3v1FnY+uPld0VZD9uYJWE63WRqzLVPlK8LMEuvCwyC2LZOHpwGMvtLayoSOJ1qx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/XcnICkzqgSTjiy9qYrUfFcn3QpcCmMYok+Qe5NdaJOWPpzHYPKkjCZsVBGE?=
 =?us-ascii?Q?ygBtgtvbJV59by7OyBoLX0M7cTbNQ0/rr61u3WRDAshE8LaV7HQEKkU3bhrG?=
 =?us-ascii?Q?neLNXIqrcbzhKp6tMd4A83Z+42foPgfISlkGo2MCu1COMMdHAtmM/Gzri6MU?=
 =?us-ascii?Q?XqnJELPmW4/WFhG3Fm4rLnYa14SbIIRGu1KMI1ALxq3IuEbO3Ek8vddPwbjc?=
 =?us-ascii?Q?hX/cnud6bTUwbsFcjFCuON/3hP276nCQTLdok6AUkAuYKa5QyseBRSDr6YBp?=
 =?us-ascii?Q?o9qAPQ3jh1NJnCM5/wT1XVzYDAEYp7GRw07FJOnoxdDR/sGrSX1PQhkNunTn?=
 =?us-ascii?Q?pE8D6PemRBF1UFczviSg0if2zx+6gUqLYYpSihskLjmQIhHNAiIJQ3LscRq4?=
 =?us-ascii?Q?3cRbKYQmVS9seq9iteWMh3LVybz08jqRIx3QNP3BpC1UFOZSEC+2FEB4CQNK?=
 =?us-ascii?Q?D8WP/UZUrWupzPTNZYCMqlVnNO1ODPk6Ewb3d4h4alxwShaVnDUZ2OsRm2cM?=
 =?us-ascii?Q?pTsnE3mzT6zTSuQ7tahDgjk4Ud6cwjkmbADv1vd+DZuFVVzEmwjTU3D9pc5N?=
 =?us-ascii?Q?/uotCsqeOJLL9HM67of5yfOtd/BJG1/NRrteENHFilo5cTVfDIn5TjNXDUY4?=
 =?us-ascii?Q?6rPvsLQ0RrJCsDO2IvYin2wgwjg5FbpGRvdJdJxSCT5fuPuyqtpoYzAUQask?=
 =?us-ascii?Q?TFr4A4kuSMfO0COEZuk260sT4gVGP1SQG008+SxTrt0VwegPpXk1ZovJ7q+L?=
 =?us-ascii?Q?ZtPD49+FaXXNkN2okp+U9QGuhMceaXPnlHl2FTOwQz3Wwf407ZFgIykb/5EF?=
 =?us-ascii?Q?btZzS6X8Nkvq0zZCp9ZI7If/H9LouceXcSU3YzsPBpRNHsoP/QyIvzikSXdJ?=
 =?us-ascii?Q?HQvp8xRgo2No9BV3vNI98YUXIw804bAYztpbmQy0GvAXqspyCcBWuA3GdBUV?=
 =?us-ascii?Q?c0BWEfmglZsZ6ajF2vjD0fZ782hc25M4MKQ9HI3tXES9LL5Vlkd1RvkRYhgQ?=
 =?us-ascii?Q?NG3kJr+WL0YtKtFMBS0neHrIYTzLU0nKhJ+sBRlCiYekLoLjFrM+8eK9xU/n?=
 =?us-ascii?Q?BdXvhWGCp8RLffcu5TNaAlQre5TiCSUQXyS/aUUXjoeJoq0XnEnVWHghLo7E?=
 =?us-ascii?Q?l3ni0ENsPr0xZLi57XR2uJQdtzC7Nzni0CrSGhYobZMgaZfc44jB9nH9kd2j?=
 =?us-ascii?Q?drK3SGpOmpo+7uIuXd0rGrB7ibXZ41qXOZEBZlJkd6VM8PCf7ROE8yyN0XsH?=
 =?us-ascii?Q?ECwEGM6HZtmyFWjC4HbVApaNn1Prg1XfW4uammJkwxrjM0ODfUQnwxEHZVzH?=
 =?us-ascii?Q?tgRDdatPnyNFZfRuA49KTjNlSkYSa8fMi7wk4U9L7ByISe5/A0uZbIaqPDcN?=
 =?us-ascii?Q?SRpAw7x4ujYTzRVZe02SfMEhaaQDMsyDG3lVT29ikjJ2jtAGT/iagMFSDMlU?=
 =?us-ascii?Q?bfAaFd+C8JT1161eYoFQDH2TQzyC6w7lNWRgb4TpvKIkp3CzTINhcY/IfDbK?=
 =?us-ascii?Q?jSdjqvSDuAYSS10XkwBVbvINuEfn5iDvPmRkTFQ9w0CXGvzy3cMlj2nXKrL0?=
 =?us-ascii?Q?AUzHmyfGA9oxGG8w+65EBYRFcw+x0wtzc7yZui6Nzq5nrmgj48Gc23anMA8q?=
 =?us-ascii?Q?6dIkqo1kv5YKv3YwZi2urerc2JYE/3Y3Z42bJup3yNx5p7S8Jcml2DKt9wJp?=
 =?us-ascii?Q?FQ3vSBo7WRP283983AdWkCzTWfBd4mH62xeVx9CPZhqfJJ28S079xtR/LJOU?=
 =?us-ascii?Q?8mCQQalj9Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c799d3a-5b4d-4373-68b8-08df0ccced45
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:44:00.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wB1w9xdMs6NkHua/YErnj19ubEZsJanPg3x9x8ojpoIU9RwezbdTGgcep/7skH0u0AOoPPtGHm5HcD563fm7FxoFW99u8AkXoUZaiUYOj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 10:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245246

- Changes: https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.7=
/CHANGES

- CVE fixes:
    CVE-2026-0799: Access M[] safely in the BPF interpreter.
    CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
    CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
    CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
    CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
    CVE-2026-18313: Fix a memory leak in rpcapd.
    CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.

- Refresh 0001-Fix-error-messages-about-32-bit-integer-overflow.patch conte=
xt

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...error-messages-about-32-bit-integer-overflow.patch | 11 ++++-------
 .../libpcap/{libpcap_1.10.6.bb =3D> libpcap_1.10.7.bb}  |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.6.bb =3D> libpcap_1=
.10.7.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messa=
ges-about-32-bit-integer-overflow.patch b/meta/recipes-connectivity/libpcap=
/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
index 4f2af53762..f5b16870bb 100644
--- a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-abo=
ut-32-bit-integer-overflow.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-abo=
ut-32-bit-integer-overflow.patch
@@ -1,4 +1,4 @@
-From 217c3a07c7db694324b5c61eaaa07774735e2d7d Mon Sep 17 00:00:00 2001
+From 2a5eebec1e42d7a2562feb5e3d94d42f725d23a4 Mon Sep 17 00:00:00 2001
 From: Denis Ovsienko <denis@ovsienko.info>
 Date: Thu, 9 Oct 2025 20:51:45 +0100
 Subject: [PATCH] Fix error messages about 32-bit integer overflow.
@@ -40,7 +40,7 @@ Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.ka=
mini@est.tech>
  2 files changed, 32 insertions(+), 10 deletions(-)
=20
 diff --git a/pcap-filter.manmisc.in b/pcap-filter.manmisc.in
-index bfb692ff..929d668d 100644
+index 2444ff7..3c8a190 100644
 --- a/pcap-filter.manmisc.in
 +++ b/pcap-filter.manmisc.in
 @@ -18,7 +18,7 @@
@@ -52,7 +52,7 @@ index bfb692ff..929d668d 100644
  .SH NAME
  pcap-filter \- packet filter syntax
  .br
-@@ -886,6 +886,13 @@ integer constants (expressed in standard C syntax), t=
he normal binary operators
+@@ -885,6 +885,13 @@ integer constants (expressed in standard C syntax), t=
he normal binary operators
  a length operator, and special packet data
  accessors.  Note that all comparisons are unsigned, so that, for example,
  0x80000000 and 0xffffffff are > 0.
@@ -67,7 +67,7 @@ index bfb692ff..929d668d 100644
  The
  .B %
 diff --git a/scanner.l b/scanner.l
-index 57779497..49aaeab2 100644
+index 405d331..bd708c9 100644
 --- a/scanner.l
 +++ b/scanner.l
 @@ -48,8 +48,8 @@ typedef enum {
@@ -153,6 +153,3 @@ index 57779497..49aaeab2 100644
  				return STOULEN_ERROR;
  			}
  			n =3D (n * 10) + digit;
---=20
-2.34.1
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.7.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb
index d381a4eb2f..fcbac2dc26 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb
@@ -13,7 +13,7 @@ DEPENDS =3D "flex-native bison-native"
 SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
           "
-SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
+SRC_URI[sha256sum] =3D "68fa62cffb974f4275641ce14c2e2d75739251f30e00e6a090=
0903b247d76a03"
=20
 inherit autotools binconfig-disabled pkgconfig
=20

