Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAADCAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 08:53:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.0])
 by mx.groups.io with SMTP id smtpd.web10.27983.1757926381940563368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 01:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=W1Oy0WWz;
 spf=pass (domain: prevas.dk, ip: 52.101.66.0, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgAjE/iqHFT+HWhu8mxT4zPKhmWyfezh4m/CJKMfk8ESszOfWC1fz8aJSbikkrzPq0qcE6cUoeV7mxxQ4jm5U/Um51ZCY2oB0L0ygxN3CwJDT5sbnCv6f0y2W93GE08bYnYrA7r5+qJVljnqyvxRo7mKjAJZlV865Wc320Kh8RZDUUDkGRW21l1DAhBfBAIiKBZ2awXLP0na0WxdXNTTeoTvy7tUBeYhhqS+KKjrkCrKtRHEX7YvURCt5XzyAVgDhlGEOYFdmeirttJwDZ8UVODE+FOdWmvswWnaBaoby/v+g1tHIAoBU6KiLvyIa7tkYkuNw2ggsbm06aHcDBaGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qbyassdphFF0G7B/YqnAD2sPlxprIQLYZ/mX/EfUlA=;
 b=P9sSN96akk1NzqSgTAcLEosbb+Qay1Rra++tA3pJAOktUdSotB2EJ6iuo3wN2X1wCfNvsXCy04BDydrKq1zo9DbDbuXSKBiuO0AzdzW5C+1pHWaTblbjQGdIkRbat7+4A7ZhnlUEybKFQ2O5OBIoHw0x7nCJhT0lgsFW1cnyCFXtscHmZlwF1IgxKpFYXk/T/mB3PYnL8O40R7g7OZ8yb6lZdjufOkg4Os3Md8WlnRnrFJ46Upwpy6FPXn/tQ/oT1BCibmNAe9ZEALKkW2RpsSRHDlDsV2IbUg6hou32ZiD1/wWrFxwovVzBrKFy1kTz4mclqgO6pjrygt81KD+NRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qbyassdphFF0G7B/YqnAD2sPlxprIQLYZ/mX/EfUlA=;
 b=W1Oy0WWzh0fP6G0gtro/4i6V5YHNFPyTIEGg92eqDmiWBlRIoYF+R4qCeZoH56kr2++3WKE7aKJtRJr1SL6yxHsGYJJW9X8kDQcv3AWutyROtKqoLpHgAB9xWkdY5YRAsPyXaiyiSTfVjt0GZRSSdmjvIdURZXbPJPsxFFl97ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by DB9PR10MB8165.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 08:52:57 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 08:52:57 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH 1/2] run-postinsts: use 'flock --fcntl' instead of separate fcntl-lock binary
Date: Mon, 15 Sep 2025 10:51:34 +0200
Message-ID: <20250915085135.3063552-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0095.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::13) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|DB9PR10MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ba68e7-51ea-4ce0-c4f2-08ddf4354438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RqmYslpYYshVePEf38MwxSG7Qipu4wXxiIe5+p8chtJESK12Y9mY+FJ5Felc?=
 =?us-ascii?Q?Y267TuHMsHAqzlm6WpnBaJu3Q3peP4xKF5lZq+MWU2WNb7vLOVeeCtljrk98?=
 =?us-ascii?Q?pT5+Vi90oKq4+1m0LS6VTnVhZ9ZTBs8pzRwixnW5K+kuaqB+TKXsCW72mYlk?=
 =?us-ascii?Q?TD6evNTUK/M12wAAcJI3V9kFNyf4o9KaJCR/Zjx3ziZvDdXxfbvDHxtHYYkf?=
 =?us-ascii?Q?BRIKT88JLgzYQpvGceiCVlJSRiA//Z1fAHo5URG89unDd4B9ugdCODsGKqWD?=
 =?us-ascii?Q?+GTHtErCyCS6ekRxxnJ/0v9+mZG9uQvUnpuViIQ84HhyVQtYI4D+oHclu5k4?=
 =?us-ascii?Q?AnzqufsHISNvtnKsZQGgsVz/ZhIo0LFrZhRjSfZHZ3D1NxmklO+/hGv+D4lZ?=
 =?us-ascii?Q?fNlGrFuvdsGJZoxAEkPvvLBRhHKc6waBKqwzKHQoCDKuv1Gfg0Wt/GIZu9aH?=
 =?us-ascii?Q?/F2llycTSN9fmiswuc61QYSYbaceD5ITcasB04/FkK3R0U15fbeh0ycBMuUR?=
 =?us-ascii?Q?udd304BniRA6FsJVJcds2hhxMuecSHgJJrAQYKeF7HAEPKG6HOpQDGC6GE7c?=
 =?us-ascii?Q?y4xMxT6lKH+GUKAvSiVvZOAmjBxo78HAX4XiAZpruc3+baS7dvo1DWXLbUC7?=
 =?us-ascii?Q?TOwlQgjzfwsli+QyQjevUPc0cPr+sZkI3c0dPjz46npAoFZhr5WybqYqCMfH?=
 =?us-ascii?Q?ImpvAUq0yY0+lBdut7mCyjW8jHDxfkkAvmZB0P1MlWDCSD9vHSj3jnjPox+1?=
 =?us-ascii?Q?26Y9rMVN/wvWiDKnqdQ1qYf3oEWg11w+3CGv/GKYgQmk/1f1ud59UtfJ2faQ?=
 =?us-ascii?Q?NbxjJwAPBq8Zr/eJEZd23hMOphHUJ3NFdMngTjqGmvsSvBGB2qpTF6XPj1tD?=
 =?us-ascii?Q?JxaamkGpy7lFuR+ObaCBMRQQyn74CS/7xKyL85OsFYwMmoDE/hUL2CsAYrf6?=
 =?us-ascii?Q?CMSAnzrbbpaCI8UDinhIlRM7ki/NhsBwSUJxgjuH2ZSQbn0UEcpkFQ/J3Gl7?=
 =?us-ascii?Q?DExlk5EQaGoBwRvwjRVHil/JSkgt8+gyl7hG/c3j9V+uUbY5Sl3cAI3ZkZ88?=
 =?us-ascii?Q?E6GgwNubzPGKk4qNPaI65UECmjkCHMkYe4pwRZEP9DyEBNPL/CV/hPTwNa30?=
 =?us-ascii?Q?Acyf2Ylj566PXW931DE7lLmCzC3tVrD766tXilDccaEqMLmjqEuiKSXu6FM+?=
 =?us-ascii?Q?xh7kqjaQ1TZ0U7fuYLbD9U01aksacb52/VTN5O8DnKNs6YuVpKLYsOtRESxL?=
 =?us-ascii?Q?L5dBqI8rCMuZii10QzRW0NrP/FM4e+zZ8eGGvPN3BLSyPl4QtHmITEVD2Rq1?=
 =?us-ascii?Q?D/QBfwzE+wHBDjEnO2cXE3Tr4PpixrBVIC/x5iHQhgJWWGR8Lka2Mu/EKmEP?=
 =?us-ascii?Q?Fot/oW+rl/voCefvHMm7etA/vpHFe7M2kSl0y/l9B3zdQNPlRuwPdJNVSLC5?=
 =?us-ascii?Q?7r81lAgUV51sx4/wiTQ0zhaPranOpK0i8LIJ4iIwFkWKwUlzX3KVsw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0dxrQa6hPb3K0gE0x64yp1+Z4cNh0xLPE6ZauT6UMxQuwCYNMHdKJdi5iLwT?=
 =?us-ascii?Q?jdYleqXy89K1pTFFjshIcdlQbc1ej+EdKULiF9luz3O/PPedyr7uk04gMUJ0?=
 =?us-ascii?Q?y47UotkKHjZdiUWcjbqbo8bRrQO77M/fshhYcTYb3/YZAUI92k9L08hEDwOl?=
 =?us-ascii?Q?FAqgGcOWoAhsAAb9wBfZNm1bErWw8MKvtU/Ed+i66eArid0pU2BscGw66NQ0?=
 =?us-ascii?Q?uFz9LRF7J8hwM3rg1zicrrp/uy6g4h5tZm27QaaIxzlbf6bPDpooEinxxAFw?=
 =?us-ascii?Q?o/aY+rjTbEvjxgW6ZOv2pmEN1LfsfZnUXw4zxvaDBRRZoqnzEqRIDGy9fdPU?=
 =?us-ascii?Q?DC8Fu0ztZ4CGO2Omd8XOMKJtezRK5p+cDy7ZdYFTYvdLusvtaZxC46n7S7qd?=
 =?us-ascii?Q?Qr/pU+JTwqh9PJurGq6CXXezhvxuZwqXKw07Z3Y626Fmgb5ugMofbXnpJOPS?=
 =?us-ascii?Q?+iNXy03O4RDNSdO4hiWs6Xg/C90j3OSpPvEpS2Bk3FGb1IyNwt7vnxgd5FSG?=
 =?us-ascii?Q?F3YyWzZuC3XvW3BXOZJV8+pLS1+2bKz8bLn/GwjF+pOvWNiEvSSktfTfP5TC?=
 =?us-ascii?Q?dOHJ7KnJg1EAz3WXKnPk6OdB1vVlpv+oI+1WTfbWGMG85cQFQN9uOrAfxgo1?=
 =?us-ascii?Q?fWDP3bFHALxjog90z3XBGRKXiVk6YBg9MhgAgIF0hlCF9TNGghZ1YPMtskHd?=
 =?us-ascii?Q?YKMTrq5kIO6tj+8rSvGhX7zaSgqq8I67fWpCW51M6TLxDL79L5A2PcVucHsH?=
 =?us-ascii?Q?3ut7e6B6KhY0MfgN/D0x5JYGWOwTpRlHOKo3Ex7GfFS570XSO9qteaMk6WVD?=
 =?us-ascii?Q?bxHhbRA/Y3JHB5QETbdyA/CLsc+34jIi9XBxVFhaiCsgy2GveYbFmvQHouut?=
 =?us-ascii?Q?S516jfXx8EfEYRRNi9crJUHoLeC0uF/81123mZcji9Cb4piqQ2D8AD7TKXBX?=
 =?us-ascii?Q?9CAFLLmq97Gz0MFAosw5tw5/w+3hrpizodTvtYmAw+y9v9G/mRv80ExcRRgc?=
 =?us-ascii?Q?eNK+XM8gymhb4Y4GgXnQzSYlwZ69VGQ1VXyEMwWiv5li3TKVeCIqWQnFACxJ?=
 =?us-ascii?Q?Ps98aZnyjgcthGN4alaHHiQPLXTkYqdPagQBVCOgP/qhdVLZ6HObtMxHlY/b?=
 =?us-ascii?Q?EYuk2qc8UYw58bbO8zo4ZQNzEACrySYYZ8OkLND55cslSOAnQFtCwy0HSwg9?=
 =?us-ascii?Q?sYGKzlEaW2XHBIX9ZL9ALMtn675+uddacS1eaIEXkv+6uEyd2kYQkd8VKUsh?=
 =?us-ascii?Q?+nxSVuIWc/KZ+C4OnbaGS9kla6xSz6hgwasDKlJ1jRYXHZNhroFIgnuUBWKo?=
 =?us-ascii?Q?1Dawrl2PXLtuyhk+L713Q/O1FX6wO5olXZ+p5mrTl4sM31SuY1us4Ke65w1j?=
 =?us-ascii?Q?FMtkYQLZEFwATQZbLiDCCfqBbwx2SCFbmXSm43O2uDRELphIoVZS0SWBDuIV?=
 =?us-ascii?Q?EdcaWqXOXfS0w2oUXFyfyt4t3c95RX5vaB3m7j0IVbZjbJNNI4YGrJQqFQA5?=
 =?us-ascii?Q?y7OxCCkZT/45dS20XVuQ03ghflZsL+9/nhYj4O0k4yKA36/J/FCq1hzKrKdl?=
 =?us-ascii?Q?GWRoQ0ZTWpagal59pGJS4PvJ8LnpjAzf7Z6EIZS7Vlo8dzb9p2SftGUENuuq?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ba68e7-51ea-4ce0-c4f2-08ddf4354438
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 08:52:57.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pt6xctzyPKF61oEWgxNm7jPyfN7D3Y2a1dQzPluplr2rGm92/9XrTpQlbFCa4DqAcl2DOm2TvpM5ZFY8+hBEX5U5P8Zq5MvR/R8wn6/O5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 08:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223389

From: Rasmus Villemoes <ravi@prevas.dk>

Since v2.41, util-linux flock has understood the --fcntl option,
making it use fcntl(F_OFD_SETLK[W]) instead of flock().

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinst=
s b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 1f3e692029..a94a769b59 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -81,7 +81,7 @@ remove_rcsd_link=3D1
 if $pm_installed; then
 	case $pm in
 		"ipk")
-			if ! `fcntl-lock --wait 30 /run/opkg.lock true`; then
+			if ! `flock --fcntl --wait 30 /run/opkg.lock true`; then
 				eval echo "Unable to obtain the opkg lock, deadlock?" $append_log
 			fi
 			if ! eval "opkg configure $append_log"; then
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/met=
a/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 5486f89ae7..f581ff3636 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -12,7 +12,7 @@ S =3D "${UNPACKDIR}"
=20
 inherit allarch systemd update-rc.d
=20
-RDEPENDS:${PN} =3D "util-linux-fcntl-lock"
+RDEPENDS:${PN} =3D "util-linux-flock"
=20
 INITSCRIPT_NAME =3D "run-postinsts"
 INITSCRIPT_PARAMS =3D "start 99 S ."
--=20
2.51.0


