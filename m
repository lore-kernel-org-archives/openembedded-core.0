Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2BDC5DF6A
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:18:46 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6891.1786684720015305589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ft9sA3Wo;
 spf=pass (domain: est.tech, ip: 52.101.83.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVJLWK6pMDVINLCLJKVyRYw3tk62lr/VDP0OdxRhjQ41uKycPJTpk1R4OjtcmC03XmD9MPTJBkJv5VmHnRT3JP74OGaKQztwJr01dzQL+ufHdXFaQwaSVfAwZjLC8yrzCbwcuyyuywFUh4YW70M38aLND7/HQ+nGZb1Luf4qO7nC2fzJuJbmhbMJvON9oROe2RLK6bIfZecNlsQoZoMGdZH0QLVf8cnSsMP1pqpypvqUXq07hoj8jcYOw9ZxOQwNAnoZeiYLFVE0t0LWGEfTpqqBy02nEmcfjxCjndRlVhgLoQEQTUtMakXNvSMgzeUE5g6dwCrM8ha9Jt9qP68MYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=TTNjqBzhKcfYYeRLIgfhlQgQxOmfbo0qpg8IayUusmpJDdhLdwDsOg/YRvGKzNycdBEbXiSbw/3Q7EUpSAlWUFUhu+P5V0H6CEFKuT149z2rTPpwyYL5j9hjDFEypJJardgmKlqoRtkTjhlXCUxTJ8lUhkYnCG2wkPX1G8fCiL8XqU0z9GvUMIFnTW6+0XdAqWjN6+WLBjGgmwLNTWzPcKQb9x/Ps4R9UwvMmRjmFQFNXvctUisGN4TluhfnFwThgYR4qjYdJ4c9pyVadzihYntV1lQ/yM4ENiNLChWl661HH7HeGoZb+nc9GEbw1VVWr+LtMB79GugKtamBgbwO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Onvm+2HAwGnVCooubyR2xkNHb2NYahWb0ZNHGt/iZuo=;
 b=Ft9sA3WoOogSEMg62lhauOG9v/28puCY8hPxZoTjB8J+JA/OTpfXRuV6QE7EJIzgW49xFcR1MBObC8OuWaYiTC/mBN+2rrwQYZjeMZJwqi1qh8KQMqZXxMhnd0xaMKsbXUICkej6VuErwvjkX/SEyhCOGltI7qqq9EqQ4V6q66iW8wUABLnSsXN4d267cXbD4X3O9z2mWvRE1y4X1KIoJnmNrEOGVzUgnWEoDWFZTprKBvLssxha3KjGpNeHM97ynrOTqZJt2a0X82fdj96vfHO1NTY95usSZtXgVU4NrN6GdB0lXqaCqqarugaE0J+HsYtGGpQ3Qwxp1NkJFF7u0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3385.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 05:18:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 05:18:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 3/7] socat: fix build with OpenSSL 4.0
Date: Fri, 14 Aug 2026 07:18:25 +0200
Message-ID: <20260814051829.35088-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3385:EE_
X-MS-Office365-Filtering-Correlation-Id: 75bb7fc0-b951-4798-0ca7-08def9c38067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|22082099003|12006099003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Zf/3W8+lV5wt2N5D04fs+iaEkmQVyy9B9pShM5e9lTTubSSXxRVjdzejFb8dgU4OrHr91Bjec1PsSnFDNp41425ZOnkyogiyREAf1eq3dSLKxGA6sGoACF906yVGR2lD+DlgtBieOKeESO8Xqh2KmH77GLZtzHGvfMkV0e5sZxdF1TAe0ix8sctGMtNte6+1Z+Z91bBemOCk8egYtIeHfESYnMmi7JZdzAoZpMqsJvOXQKk+hIKFtgavvR43vYOen1UaFmBh4dQclZZqcK3bgKAb65aOesCgv+lO8f1Lgndr8HqU4tWU1k0m1j7LAvcK6MUAbrvQHpurJV8rUr9BVittg5DJLgyt6rq+o3YeC23W2jx8eKUvpKMvRQxmPLneGY7hIp18Zs5AQpVTM6BJTwX82ogxJ2JNSHRiWiiiG9POqfs351CbM/DUe0s+FK+GHpTHgf5hnxFQK7BwGzmsp6QsbJqj/SiVXsDi6Qm4JqQR2b8dR6J+O+n7JXkDrTMz6+3ON6rWkJ9APLqW6yKZ8cPgNaCtjwsPBWXPvrdeQAqigdlhpiKbDguoDfv3BH+5Z28wNq5uln+s5fWau43Ou0Xb90hJfVzCgD1uzqzO1FbZJ4OMIJMoWfysd8SlgV6KYySjubV2GzXPOlX2F7c3SMvuA4grflaFexfHmYWmQPo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(22082099003)(12006099003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7eysKG98SagGam6gUGKrCPnN6BSDa95CrSQK8VtwgnEjw6yfsgjIgM59qnKf?=
 =?us-ascii?Q?etPPJfvTlu9gHeeKNl+Gx6P60itz2mgd1SjXrRKh2HI1su+DkGkB/F5gsmHn?=
 =?us-ascii?Q?ufpsvm6ymzQOM0Z5kzncfaK8h+COjGYoWRBQ/Xd95c79tLDXFOiuQ3NCAyYs?=
 =?us-ascii?Q?dQ3cVGafkDb6VWeAfAPooe8W70Bi2mofbpGldPcXbarmzU6zKUiVe8TYYD76?=
 =?us-ascii?Q?IPuEViRYE4ftJB4QEPSYu6vtIB5rPSfS1OmYkg6yPObkQiu3Vvryqbgyo3to?=
 =?us-ascii?Q?adc7P700FlV3JoZ0SFS9jzpWwnlvNkPKXv3/FyLfI6SyovJzIb2IXNDpWYsi?=
 =?us-ascii?Q?giboEqsuxUTHDhNe4eg+JRl7oEBbMlcQjqkrbFCsrRJB5LmMLcAJt2Ic9lFq?=
 =?us-ascii?Q?gBtfe83TB59BTa0kXRIkDAj1JJ108+gVTGOgbsfSrsvi/3d3WxhcmloYQ2fY?=
 =?us-ascii?Q?B3nRpg1DpTVEVbgQZr0oE+N2m7CzCV84kE/HTOB2spLgaYL7XhTioDH9CSxI?=
 =?us-ascii?Q?dS5INl+oYDPTkQ89oLEgU4fTy1E+BS1KWJbgqPllcyzSYML4EDaBBn3YfqD3?=
 =?us-ascii?Q?+tNjD2WAjl/WUqNS4vgIEPdc1gqpUlz1dJheXNwQBayIcjbgIz9eWYQQIDdS?=
 =?us-ascii?Q?S+JUQ5niGwh7gXDS3IYEEkIf2TJOSwu3PFniFs/Uoxu/ha0BCaPqx4DPupol?=
 =?us-ascii?Q?PMdPHoeuEbMiS0SJQjHuOuzzI0jl75jGwBJTU3vkGgQk0cG0CcSnQXwoCK4n?=
 =?us-ascii?Q?e5Z1jOhSzaKYj3MlPorrGWYR0Y1ruPGMdPZAAq7UQbmnzqM7GxMxXAKFus23?=
 =?us-ascii?Q?d40X/nYh0yrDmmcKGURf1qas4Zjbmbocf2EPDghQjyOMKKWYxJZf1GjfKLKR?=
 =?us-ascii?Q?6jb2k2SN2rk7BDpNkoO8O7y/pMVMfL0jKdhQv88xmBtHnTdcvbL8BezS1A0D?=
 =?us-ascii?Q?lcAS2j4MoXOvwVVS8v0lIzoCZX/A6YsNTnAZGAYIui1JzKSqQinqOeLcUoVG?=
 =?us-ascii?Q?FWqLhv8L6wMzU5z0sqSxiv+c++2U1VdYtDWCUQRCTzvRNbSuh+RGEnYZDa41?=
 =?us-ascii?Q?0n1DOmRxM7FNZWdIfk1KGo0XKuKE5ISNSAY8dfMUbbh/4Cs/wXfCSc5PQIZQ?=
 =?us-ascii?Q?UjhBV/HQLvmmnEwIl15LRu0gPxt0gIvUjbZ9JRlONyYWi9PsT5naWVqkNnXe?=
 =?us-ascii?Q?r8N6McfiW1kqMjnmBezrdwd7yHGvc5NkGk12npAg00RhuvTbs6hGn4x/rMhc?=
 =?us-ascii?Q?BGGTr8gyf61SabOxAN5nJOBxhAdjerQ6wa46MBvHMJuDH7EyPJDgKqBHceCu?=
 =?us-ascii?Q?FXa2ORKvXnKVnYjUstJujkyKXbddtrgIyy04YPaxMGHLYMuoVFjhvW4z3Sod?=
 =?us-ascii?Q?/ncp5qCm5nFGI+YObCFW6jmmC3G7dAWGrtuZvraqFec0GiLKy/1HpnpJ1Dnb?=
 =?us-ascii?Q?OXdJtMF92AIJmTEaBLCRsIk2uhiHB5/x29m2+iVNV8KONVFTwlkHkBs+AC6N?=
 =?us-ascii?Q?0TyyuL3FxZVShgB2u1H142UsAIyHSPvxwln/wKqW2/qTxuyjGCksSoKDR/j+?=
 =?us-ascii?Q?9JofKQJqyAQoWXpJPiyEffT80J/8Ss//z+07hB7YC/4OqD+fM8PcHAqLPqWM?=
 =?us-ascii?Q?aPjUe/5MEBd7iyg9PWQRQGF7QU7TzBormJkOf9KNo9qaOHW8TxUDFgBwtiZT?=
 =?us-ascii?Q?T9VB8ywMKS0sPZJIaPwpPisyUmQWBwC/8W0BxSe2LrAIcKIMbQs891fjANoG?=
 =?us-ascii?Q?uxNLR2Y/vuFapGCZmCIiD+grd4c27xvo87oZ1VB90DwRguYxYyFGiua/89XG?=
X-MS-Exchange-AntiSpam-MessageData-1: idi7atQfNFb6A5p4OUzqB29v4zOGV+aDAqw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bb7fc0-b951-4798-0ca7-08def9c38067
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:18:40.2305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgUJcDebxmI6Um1NBUE55yL4CrryG0bCssmh4JFfbSTdU/DmbutY+trNzZP5sCfM7jLmkUr+TVujSVTsVcHprzVfyWFUqppj+pd7zFw3K/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243399

OpenSSL 4.0 made ASN1_STRING opaque. socat directly accesses
pName->d.iPAddress->data and pName->d.iPAddress->length which
is no longer allowed.

Use ASN1_STRING_get0_data() and ASN1_STRING_length() accessor
functions instead. These have been available since OpenSSL 1.1.0
so this is backward compatible.

Upstream-Status: Submitted [socat@dest-unreach.org]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 31 +++++++++++++++++++
 .../socat/socat_1.8.1.3.bb                    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fix-build-wi=
th-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/meta/recipes-connectivity/socat/files/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch b/meta/recipes-connectivity/socat/f=
iles/0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..5e021d66c5
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/0001-Fix-build-with-OpenSSL-4.0=
-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,31 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream-Status: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data =3D pName->d.iPAddress->data;
+-			size_t len =3D pName->d.iPAddress->length;
++			const unsigned char *data =3D ASN1_STRING_get0_data(pName->d.iPAddress=
);
++			size_t len =3D ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+=20
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.3.bb b/meta/recipe=
s-connectivity/socat/socat_1.8.1.3.bb
index e485c7d28d..025b478392 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
=20
 SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz=
2 \
            file://0001-fix-compile-procan.c-failed.patch \
+           file://0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessor=
s.patch \
 "
=20
 SRC_URI[sha256sum] =3D "25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a=
6639b1fb602418"

