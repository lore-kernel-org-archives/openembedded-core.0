Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831BED39403
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 09:25:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11592.1775121397422245642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 02:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HK1VIYM+;
 spf=pass (domain: est.tech, ip: 52.101.72.62, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBTXPjN91NJgnYi7ewYOu+sYsC7ebcbwM34a14FdPQh0qcCruoZUwk8cjrbk4PCOKb2206wMAQG7lrOJLGMWYhztzjp/UovNeD/RIATZMbclYR56R6V8HDbErFqqDfLlVOoIM2MqxIJKaJCmJxly2jHcZlb3sHofZUPH7LQqFQhlCBsBibfAJfWghfr7qiN1pizUPZ5sah/4YlItDIj4XEbibmqp++66qhI0sVFtETe2LUM3Gv4wpNaJHiN9+oufSLjEkrP6fgZXXoiUQ84s+eJRwvyO8H3HTgID1MLtCfVEHV55QVWuzIsueQMbKZsTG0m18eiTBJ9H5pkQPGRCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYpZOpznhVGctPD5/3ysDntgBH4/LU3vYWInJ8BBQjw=;
 b=kpaTBVMLZb6jhauuGYmcsjmtAxGhm9IICQ/2Yh5LWj1Fxn40UQjbAkeBaJcrHSdoBC6VBRF5OfZT6+RBhEXcB0OxASsucDCtEhSl5XUgGxqvCq6b4wPL387UrqRZDTlD2V5CTeOoozXhDXQVJoPg4fDFy0JTtBkoCvkean0FS+UEBvRyb/wl/+4WnnAM9mIIJDRvs0HXqjZEAXiX6+BFmwZJDwtTSzXtKl6HZeutaH+I1FuhPdFOYU/80aCjOLQVxJwPLryE9Ah7qatK1CUlKRM4oM1MIhG2dlOr3Pbb6OiDhHRT08TZaZLCtLolk0WaYIj5B186PRnUMxE+asb8vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYpZOpznhVGctPD5/3ysDntgBH4/LU3vYWInJ8BBQjw=;
 b=HK1VIYM+upg8QFaeIK9ixNjSKY748OKWSmu1Mg5SLnJZoPdmnr9gJdddvC7zpqfGwvMzMy0RLTg+lDfcLSy8MHYBbA7Jg/6qulHNoaH6Wb8+Swt5MyBoJTvypPKywHaIGzRZTbOBn/Sfs1IIu9Rm4aw8O4m2jft0NQwySe6Yl6Ju2pnVtl6gGykV6vozeG23LzmEtdZ6o1QaFUHIAiwt5FdctWhO39Rmh5pYhNgwyhp07TPCHndtMwbrIKqWktQVZUVy/zhPWDI8E/koruH2nGmuyj12s5Ie87sL3FfsQh5M/Cx7L6DZU1zFhSBKXGeK3THncqZWMm2lgVEBpnm8sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PAWP189MB2590.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:34e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.34; Thu, 2 Apr
 2026 09:16:33 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 09:16:33 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH] binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
Date: Thu,  2 Apr 2026 11:16:20 +0200
Message-ID: <20260402091620.341851-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P302CA0035.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::11) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|PAWP189MB2590:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c0e1af-7498-4fe8-0237-08de90988856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PqFFEfcJWvqijrg2a2yRzU6ZNoi0pt6baT3+itYkRgn7IJvFK0Ni6v8iyDpX4abzDd82ck/YvBXlVg8cm4jU2ec0g6wFS989QzuH8XK+mfoAF6a89R+m/Ji682dLZCHTrvBNUVdBkocgUEy2qvmLIVitQpBhaWeG/zg/A6I08xYEqZ8sYG/dBLekhr34OQVK+Vjpn34U+Ytfmsv7opMh6+kE1elfKoBEYJjMjcBXawVmCKS/vvJbP/I8bIVmkvsYSi7X2ZSSgsjK4KKvB4rJsQGTtKxRV3HRPCHLH6p10CFKJLTNbQ94iWBidrQLQwMOuPNRn+SFP/OMKdgWMGF/+lRrglfa86KxolZya0sgT26M/Z3Bxx+Ve/B/vndxHc7DAmXcsjZQ6Qvuk+L8de9w4/+gEyhD8cUcYKAl30vwVvLyd8VOlemki/6FgKzqJARoPF0j1tfPpiSgqnSDHiDNLKezDTsch55nKU7fXse0sHzHmz1/SKOC3ATVMib3Wfo9PqkTg9R6/i+0VLeM8ZiVUx/znL5WadOJm7s83nS621/YOkg0xm0NVuRIj8kcLvfdCBjHw4MHv2TAP/lsoCZ704wh+MSfxNhkyePhm6BLCXnp4HWdLvYvfvaTCUZpWfUVLtUVaRCas91kMBBy8MCEy/wGVsqPxralrA2aVP/e5P1L5nQ9FaRxRF8I6tpUHY9pEAdKUHFKmE8bfMROFzFOFb86xqGOCUrubUJsThELr+M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B4+rcHVuf7NONfXBxRAWs2FgKEy6YMI0CF64X/whhHG/qGmKplFGFsMRRR2p?=
 =?us-ascii?Q?JpiyefazkU0QL9J5x3XJEB9+gws1A/O4ho7iWB0u11Fk+UzxFFWwYHZ+x8J2?=
 =?us-ascii?Q?x3yDFfnAQwOa1+itoicuuU0IA3C40v1lvTNkWCh/lYo685hwMSZ+JyvbXlKJ?=
 =?us-ascii?Q?M3TE6nDzVat1bofNkCz1ezmEKHenvlghG+jUQHcb6uqv/2fqUV6L4ycRSzYJ?=
 =?us-ascii?Q?+4mhrvKjroiOpUXMiWYggJ1qJFalTUxEoq/SZzrHQ+mKtdUM5t6YS8d2FqFZ?=
 =?us-ascii?Q?Xp382KIY6VUrGbM4CkdxbUpWyuiowFxDULiZthQRn997pJ/xBOxuHoOm7VJE?=
 =?us-ascii?Q?kf63FLhakw2mxbTo06Jqmn117KCnppuoxLJ5vByfGgkINCIYZ4lhMphutVlc?=
 =?us-ascii?Q?3ZS7bVipQpzB2oUsPGBgwIStJhimjDj82JA4l9gCng+j9v3qzTrV7IpHG3jI?=
 =?us-ascii?Q?8cIYoGJ8+50SKZ7zCdTKngQKPG0o2kyB/Bzs+Nhoi/e08nkudnvHod63VzSS?=
 =?us-ascii?Q?j7B5PbIXAlRAPtStU8edJBytfWNBOR0YQDHMuWOiv/SDOsY0Z64WkPhWP8PN?=
 =?us-ascii?Q?GnHR+932J0fc8ZZYGRg0ThAM0999iQUc0v5FpqiEqBXXjkf9R67YcVbeBXBb?=
 =?us-ascii?Q?91EO64yctbpe5WPOp544laUKDVrAseGTSZJOERQvf/hCzEuKqGlxGUOqvgyj?=
 =?us-ascii?Q?SRh8ZXNV9Rp82FBv8dZV2ftIdpg+kX0b8yOrAYhca05RsKJtIZgnHfPN0RlX?=
 =?us-ascii?Q?BUadlc4KfbuNpqUmTftPUz0C784Av2g6KCmwsHrr+eMT7S5wax+wgCnMm7m0?=
 =?us-ascii?Q?bYSo2KEZopqXvRbH8EoNkIk4+MIiTQMahtW0ydDsUSUVZT6DBFEnBSL9uuBw?=
 =?us-ascii?Q?FQqTGLmHqtMdBddtXPlheOvyAP7TO8F1VwZn7YZsnL/iIUMp9YTYMbRWZPsd?=
 =?us-ascii?Q?kY4fld7vZm0Wq+7nX0n3N5xGjYARdo7Hx3piP4dIpnyAyn3va56YwECsKtHk?=
 =?us-ascii?Q?zpX8nF4hruDU2qn9Qb+49+vaLyGTRg+W4iwXlgv9l4+2BJHNGlavBOZeuPLm?=
 =?us-ascii?Q?rn5Sv28K/AqWRh98o4+F/ipZoieGZRtW30JKdneqQzcRMg32Wyyrkw/T37ko?=
 =?us-ascii?Q?mixN+YMh8mnbL6w9DYxUH/997pXvloIQ0/48tg+SQYomf4R08sjTEzv7qQSC?=
 =?us-ascii?Q?570B0jAX0xF0uvYQmtaEZo2IF9nzA5fdVYahhMya33HmA5l/dDu70/41jNCn?=
 =?us-ascii?Q?oYpVVN//iM5Ip3H42PCMocRnqJNNsp3M0EROFlkGsV4SwDNkTxahL15cszUl?=
 =?us-ascii?Q?h6LJkbcLOsSOuTyAVKqAiMb4id4K4BLzuaU4J2uV21YJk8+ouVEhImNBjMxN?=
 =?us-ascii?Q?hDZqGZ0kHzLdQVx5ET01dZbQTn/9IHWxOPhOuW5NrNcFf5YQNWBwuuJYsy93?=
 =?us-ascii?Q?xIqY6enWbBhD9LOsFVjspsTYPzBDpsVdDblnwIcCSAk1Gow1oa+cUyMFBwJy?=
 =?us-ascii?Q?okJ/aGHbup+H/1MA4zzfX389zl4opF7ysXQcQCmoaQp8suxcjKA0ELjDOObO?=
 =?us-ascii?Q?/S+EUGFa+4iM5KXZRfy6mr4e0NMiNnYJUMRHLiUkV6YfGBgWZteWZb8ZMyZ9?=
 =?us-ascii?Q?hjoGR+zFidI1y26kwDRpfzwzVma37pAZQKo81SaO78xjHbxcDTQj5ZlZKvLA?=
 =?us-ascii?Q?WKjXLcpDXmB5rMUEMnboDcOiOGeH9cPx0f4hrY1/KLpB05o2/3KCcyswcuH3?=
 =?us-ascii?Q?5hK1tUxTO/XDiB/AkWmfHBlY6zHJ4NY=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c0e1af-7498-4fe8-0237-08de90988856
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:16:33.1666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NkjSG37QMgGH+OWQDsxeKzn595cwiEhni/9CY1XNtB8f1B56Qex3fTiGh7GL6pxCf/Cx1oNW+v0pl4q0nS+Epd949XzGNmz/mL3PnSZSjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2590
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 09:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234509

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Both CVEs are disputed by third parties. The observed behavior
(double free / invalid pointer free in readelf) only occurred in
pre-release code and did not affect any tagged version [1][2].

CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-rel=
ease code, does not affect any tagged version"
CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-rel=
ease code, does not affect any tagged version"

[1] https://www.cve.org/CVERecord?id=3DCVE-2025-69650
[2] https://www.cve.org/CVERecord?id=3DCVE-2025-69651

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipe=
s-devtools/binutils/binutils-2.46.inc
index ff10050dd9..cd2867c421 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -18,6 +18,9 @@ SRCBRANCH ?=3D "binutils-2_46-branch"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
=20
+CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-re=
lease code, does not affect any tagged version"
+CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-re=
lease code, does not affect any tagged version"
+
 SRCREV ?=3D "49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db"
 BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=3D=
${SRCBRANCH};protocol=3Dhttps"
 SRC_URI =3D "\
--=20
2.34.1


