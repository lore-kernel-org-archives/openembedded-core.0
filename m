Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EB3C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 07:39:48 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2393.1788421185961550141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 00:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AHffAcH/;
 spf=pass (domain: est.tech, ip: 40.107.159.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvNUtnaCdYrsdi5LbTxLDvg0WtvvtUxwUypyBLlUSGV0aHqCxsuA9g8weWrp4buXiQAGuCdwVgiRAYN4pgELlqpZpgg82mUVU7e8TClRLdjxQFhyqt4WTISsbytySRnpEAP0Iza1laSIjZkmuvycXsshzTZRhuidoCQcJ9Z7wqS009MCeng9HodV0V9JfRHTnZ+WAVVt7EFICCEuutv+Bmn1RpVI4shFRiUM65z95mmf2UmXQ9TgP6pnS6aovddv2QoXkWkNNVw5mp8AaCuijMHNQpVWhr2iFOrcU61Fllv62SeSGCQrKSu25rX/Uh67FUEY5frcu0r6n1aVLY/6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKUlPJ+QQ28m7OFpv9TfPadXf3GyCeENQuK4vg2R4Jk=;
 b=ckeI/0X/4wjCHcJSdAEx+U6DNPLSg1RT9cpKIVJ8z2WWe7L/CJz0zL+LJRjCIRa9EjgpDw9RGgzoylDjfuXuvLL1PslQ+rjsGg7ecl9PpqFfncuLo/KuPjTjLRkHapalJFqfakjm0paPVPdegH73hmdKQxTw5NBalhWqcqXT0C7/I2DIJWbdhfVEmanmWZfu1cAgsad3FVRfuY6PVYPv/k4KK7UZXALMgM2w4inbgRlafmwq1N2mTVDGyNejWNwu3JAQ6X5T5mVjlx32l3xvzI8VnQBsloFk7FhQFHPZuuose9DyPOIBgg3PSwHE/+N8FOoNw3S2I/MSWAx8kComRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKUlPJ+QQ28m7OFpv9TfPadXf3GyCeENQuK4vg2R4Jk=;
 b=AHffAcH/6pqzpBWSM3JUAAQJ8IgRlnoQxoQNm+Fm2yPBj7n4o0DmDeLpGmF/0u7q4oORVc1kdUYqpvgqp8R7/uhkxKUCYD3aPU/MaUd2H1VinisJ10ajwOlj925j6F2hyqmqnVYff0YuTt8vStJrB5uJ7DrVsgR8r6T7tSI70/rAfJpBePwySfLf9elocldG59ZZRcTMX87SA4I5VQ3NsvVV4Q0vtq32TzKUe+LpL6UnkErlzj4vFTEYwy77pnGbm+NvYy7l+G28F1ektNzIPFYQLDB2V7c6af4VJ2AgJbe2ZGL2AEiFtk21gbq/p3hPXDp1SHLqp/t2qCRJxXUplg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB1272.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:39:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:39:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] curl: upgrade 8.21.0 -> 8.22.0
Date: Thu,  3 Sep 2026 09:39:39 +0200
Message-ID: <20260903073939.7291-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903073251.6352-1-jaipaul.cheernam@est.tech>
References: <20260903073251.6352-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB1272:EE_
X-MS-Office365-Filtering-Correlation-Id: 347b70c8-eded-4548-f092-08df098e8386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|10067099003|18002099003|13003099007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	8pqpe8N59BiUAQ8unFfNr+mVPMhl33XsTiPTlTKc/L8dOnljr0+NaZBv70xA+hrJRi67dkR84qArRX9UhvjuXRPt2rqnkjShxR1nIB4H273rVwSMYgFp5wzNXS6j6h/eCGSrB+gE2Irsy0m/2QweVSXcpzoTNtE/rVgnZ3DMRuQ860wxa/8Zd8/iZJMHzoXErHSeNFdDBCQ339IG3N2LjrJo2LjJYWl+BEF4+PHbn6i81O8tIn5gI7Ve5ILJTiB0HBtg5Ud3Tc56iLw+zqXIBwUcaAkX+xWPnoUNOUew7mdvJh80NfdkEbXYkvsHpc6FTfhaGR7bjziPK12e7N2L4wMFbX3etvLlYzcYYEW9oWqelkoAfQzGu4GOtYlLfAzwT+SQz6YDdU01X/2g5hBF5mqf7D+rwE15uldHi0VvBEibyI9bU4F5TK1kBG1vlHYVwx6xalNDj5ZlcqSXdgCWqazoOykOPCbuOzDtUNyq0AcA0RenVscL5G2y+IUFJcgVHWYxLk9EtintRe893WmC/bhxflqzq3upvo5gWo9kQ/BEjbnC+NoKz2yQGnYHwEamjKNojKSEcQ/AyPjsZbf2czGamkx2F6m3M6Ld1t3dd20=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(10067099003)(18002099003)(13003099007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9xntTGxaCFQYJ8exgiKv/iOsyzPzm5RUhXxA0rt3w6xWUZeQtWdG5eQeASiK?=
 =?us-ascii?Q?d+7rFYvjyUDds8vfLHCrWK0LlIxpWCsgHjJV0z6aE//skU/j6i7abesnwe68?=
 =?us-ascii?Q?gnXAyStq/nGtgFw6X91cNyLUc3GjNyjuU8M5GNQdPmU1+JlPPgXbDZ/QxnOX?=
 =?us-ascii?Q?YWXm8VrnvIvB4imQhburXsRm9/PpS9AJz8ua4kmWcUaSJMu1vsWka5ikvXjs?=
 =?us-ascii?Q?bqJf2aDGB4VdMJ/rvMuWSCRoDLt+6+s1VfVPzLMstjGu2YUmC7SspYimSoLU?=
 =?us-ascii?Q?QbWGJkXgxCGkMltteeZvQCPzOmDKRudrm4tsPek+nL071VT1S7JgmR2G1DNh?=
 =?us-ascii?Q?T0NkbejOgOssgdBaPQtsAnu4D5ySnmZnEg7KYIA43Bv8xmDk2wEvVsbvZZOF?=
 =?us-ascii?Q?w9ddpDn3ldy87s+25IvxEjtzpMd3f2vFSUaGZ4YLcNy9Zlfwpo8SuMkl8yxX?=
 =?us-ascii?Q?GeRoGtqCxfJ+Ec7Dsy7g+CPRvv808PQN4y9X6fBgC34yYwk9kxRGHjDFcm1p?=
 =?us-ascii?Q?Ms10RmKW4qf6ThuyeYxXVcfAO6GzB296FWwXg+MvRhJWmywYN5VdYovNtduG?=
 =?us-ascii?Q?0BG0wfVFLOYfqavCJo+OSULp2iY3KBxWLQjSaF+FSXqGVLu89vnboPScYzjR?=
 =?us-ascii?Q?kfwe5Oxabkol87/NPWuwdKsUUoWTX3MYceC3/Sh3Q6a1BCFiP54rN/5w0+I6?=
 =?us-ascii?Q?Eu9smX8elo1L7qLj2CM+qL+rclTbEiM4oJ8K3gCetN1X1ON49IUaNqlDv66V?=
 =?us-ascii?Q?xjXOMF7AKJg7o0EiUOVdwCTuXeF40y7OS7ihbuoYeLhFvjSNRbK7jojpU940?=
 =?us-ascii?Q?16LvCO6+x+nXt7IMIJDda8ypn/leCbT7TZYCoPE1+FZCCFxeG058TUYzNpNF?=
 =?us-ascii?Q?Izt6OvPJq+ACx3Ym/98m3TTC8WomxvHFCCJ07GBTArslAL2YW1tOKzox1x4p?=
 =?us-ascii?Q?loV4c33lrjfgkRTjfOMxEbLDxR18QI7SzG/wVPBT4nHFiQRMz18WmKjm9hk3?=
 =?us-ascii?Q?mWpuF8jhPFFp+k17i4yjbHYR/5rwlo75GQ/AzVbNTmxG5a/C9ZGtCD+SD0Rm?=
 =?us-ascii?Q?DbFQSw7D3Do7UigHfun4nB/9O/iYYkNnZS+Ustppztj1bdoPajRRR+y82bnt?=
 =?us-ascii?Q?+xVQHvbrVgCiSnFilzQVrsxI3MbUdFuRFSI5ZMQ0X+NfJRK7DRjhPTdxhKET?=
 =?us-ascii?Q?hd0WdngsNhGCh+4QE0YpAarrpW7QbBee2C5KVtpa+hGSKu9pxYELiWefOA2V?=
 =?us-ascii?Q?aoJxAG//Vu+yFFOSUUrSqaExfzUF9ZbI/3mOIXYylGWweyTnYt0pB0pM8Uqf?=
 =?us-ascii?Q?EZMs+QIxg7p7G7yUYQMBhgSc9oguplHofQAaY/22jsDpdOQU007un2M6iQwT?=
 =?us-ascii?Q?0bSJaLzT85XyXQ52UxzqLQWM9bWwoUsNMVhYbLk70f7QzUOVgPobSnxWDL0h?=
 =?us-ascii?Q?1UedazkFJomty2ZLCTa+5uJRSWJ/aJ5EI9ySfaPJqFdLIlIkuPw+G4S4sYTr?=
 =?us-ascii?Q?+C+0RbjacNcFxQiHX9zEkWWDR/B+Kl2WqBioyam3qvXxVvV9A5JXADy1oiVW?=
 =?us-ascii?Q?GJuEToPeRUS8RdA3C5IjkJQjU8O+mWKul32ZAdmx/Zh8qS+d+BBbK/ao5zAo?=
 =?us-ascii?Q?8BVY4r1I2+RKvhuu/OZ1qOVUBDdY/KxLlJBMR9cf/oGStm29oItYIDKtLLzN?=
 =?us-ascii?Q?GtbFUWoVJGDA7c0okTAQRgmoAdOWR7WdnacP1B1gdSE2VEB+MW8X6+nYT9Tt?=
 =?us-ascii?Q?sQSqELCqxQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 347b70c8-eded-4548-f092-08df098e8386
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:39:40.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ2RtaEjL1cgWVuO2H5sw8bwOUGOjwcZACxcHnpK/Q1q48dpN7pYxNqhNWwrY3UXyHqILAbn5KosSShBujlvg8iU2Bq3sW6UNjRIoxcr72k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1272
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 07:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245013

ChangeInfo: https://curl.se/ch/8.22.0.html

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
Changes since v1:
- Added ChangeLog URL for 8.22.0 (https://curl.se/ch/8.22.0.html)

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

