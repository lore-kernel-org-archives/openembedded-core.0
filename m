Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336BEC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:07:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7001.1790024810388684263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Qb/eZRvV;
 spf=pass (domain: est.tech, ip: 52.101.72.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfBbAmIhBzDjk81AWLX2cxN3JbJHpXobrMn8AxIBF3DWdBYhOohW0zbUXQOjhAjuWhFTxvT8Bm5XQ4qHo2MnCBJa8xgl+67OCEETGg1BtBf6bFMyWrFRQ7XrjudrWD9weBAyVhsdTDnBVuaHt+aSiwrbEDz2hmaU6NPFc5uelf0AfmL2bhK/We+OxxhlUqFEUbIGiKWNcP26LDfamvGn848aWhkd6215M2w56mLPtwwOpzd0qgGYM3HZ61IT/AxJvQkw8VEgME/H0/5hQJ8c8nlulg4JzAxraCS0zJTJiMMDrDooNq9ska9Krz1FfwNt7rpR+0y1m4z//gjv0V84Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJy2K4aC9aEgUf52cf4VwprjFN2vfhIbNE/+oLyfNb0=;
 b=PlncDFVkuRETQwdFSFsZlJENQEU1n/RMGX6MhrM+1z+9ib2D+KORS261CxcYHDuJYnR1BtC6pCR/iVtD/6kLZCaOUzGIs8szznzE9VtxhtLMlR75xpczQFKNRQpUdi7i6ONZUuHP3LhctfFrqA+WD0hlsIzkEZI5587cdeYZ+WSqfNnmHHyLjrp1vbGH3kgaVH8I3e1GI4VvVpZJRfAcyo7gL/cybcH5yQucnmIbNRj5bnl/tc9sn4rbU9Eg1gYEWAwRJMpI+/Qq8Mf/vfbjMpCfbH/IlbKXCfm/BdpstY1JIF2xJvCnT8u9xWNT36pUqnvKb6/LRSnRUthVDbRJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJy2K4aC9aEgUf52cf4VwprjFN2vfhIbNE/+oLyfNb0=;
 b=Qb/eZRvVsCT0djn+OUirg9/G8s8IqNnlN6mUXUn3TmvgrTYGt7B5XQ/zs9hVJxSB0aVM+3z1+ycM6RjJZAVAynfeV0aADtGQAzT61qac404RFCGF4wKkr+hI8f12SaKzIVxJFEYVu7pdEUP4kYins4mxz4W+DGRPzy//mVsZ0q3+9wrHZ1irNnupjzdC02GNq8NvWUt1eaQ6rMqmVVKaqhZN9QW2ZF38JrvxrWX2dsPDa7jZ8dhE/2c59m1rwvd/MkJQgeAl/OxaS7/BtP18x1MnspDRd8zK2vKYu+c8ZpSwXS1dn7mSrf0sSazeX0IXqzv/i1UbgpoWv0v8HDfntQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3546.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 21:06:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 21:06:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] systemd: dlopen-deps: only warn for missing required providers
Date: Mon, 21 Sep 2026 23:06:43 +0200
Message-ID: <20260921210644.85026-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921210644.85026-1-jaipaul.cheernam@est.tech>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3546:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d66072-7030-4348-6e08-08df18244029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jlhT0FgTOGgUO9DSHk54zyjmwy2+dUZ5oKIGynyN0ZXkpInKhafFVKbTfuvtopPPtnqt9wk1wHN2kE89lG/vXlxzN9rXkH/NmirbCCl3SJYk4Xh84KCNs4kbOnt1Y6g6LsR7BLnMVkpetib6Kv2wOipaTZnjFxnMtqJ6mCWDD7dtE9OqImQndK5XfS50YSBO0Lo/ULjYaGT7NcBSGsE7Pr74LqKTzMydJ+WcOzwt6Kz0/1s/9oJh4DbmlJ+iZWDHBdFYTBP4/+jUWv3Nmt4k+eLwmJzwMUzTa+CP0nk/SLE3q8el1yd1MuJlvQNqn1rhGK5VtY1wXyBC8rlOSBl/VBsu/oREXV9W5KrJvmoMwgdIQoYGkELiREilENIjLciJSKFtLzFrnXiOuKMOKDHS2h2g7yLSn/6seiI5yKQAcpXi8zVJtE56hBvDs2mQpEkE9U9b21XBkEyJASbtvc6Bu3+2DlDF/HABw5C7I9H8AVD2TtrfuEd/0X9mhXuzCSNQJ22L1fB1YxNtZn+Hp3sdlp7NUbucWlzgQyGpueypCnGDa9cg6OWY0x58t1XBM8baH5R4lmpNMkyxDjm+4dghm3ZSME89e6jDdczKuIeDksFhiqE+OivkCrClX3bpOu6bU8+fLe0PMMfUXXDnnKqzJZUxiVi3UAm7lOryUPT0kw8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iN0FQqOso3vD7dVmiziGXZytqZ6J4UMbJJ9zpGlUM1dQdyl69Joo72XE3uGh?=
 =?us-ascii?Q?5+ZWNdcZXsKNNR93tPXxrgQ/o0FNHwoeGBzu6yC1ToX6vnxzY4slJUuTNZQQ?=
 =?us-ascii?Q?NQqy0c4idmfw1xLovFzKKYAHv10H/GNdADaMe2znTTdQJS/Mq6zz2E/C7PR1?=
 =?us-ascii?Q?2MBcRhclVAwGVh0kCSF+TjZd12dXb9IVHSX6r7ibJ4Lb3ghfiVMW4HqfFuYB?=
 =?us-ascii?Q?9Mh0jNb7vDq9Wq1jyqO+MOJkZHTganLQZYU/UlRRrKXEMsSAgXSPlbHC7CKg?=
 =?us-ascii?Q?2TjMhevJL5Sj7/kOxEwW35qsVpmPPtgoKqlSRIRKD2t9UG3tNhKkyx5cAhGg?=
 =?us-ascii?Q?1IdH/jq3wlMBP+wnD4T0r6+qCFzOXydni314bvryABX94ZNBEuGtKVzAcE2K?=
 =?us-ascii?Q?HYHNUEyBnol+p4nIl5ryhhutFE4zm+Ls0IKG4ywkQRSLi3QmYo3QTkezSles?=
 =?us-ascii?Q?R9HBftPKQ5MuXDvVFxZugVg1NIiTjHP0OQ3gdjBnnC0JSEEBXP3cvoTTnhiH?=
 =?us-ascii?Q?c1/1RfaNnhyS2yWtio6hgwLt8FnyPlG+dZIEBZbpduSyJHiD5TYmW18+s+Cp?=
 =?us-ascii?Q?GAPa8ch9oOKmwU6d1CWvmW87LDmucrSUkbMtOFSipfNn5e0h313FV0qoffel?=
 =?us-ascii?Q?N29DtfGTanaYCnfl+Jgmrv4ilsk/hmPVUD2X18iR4ynoKygAds6kQPuzLD9P?=
 =?us-ascii?Q?LYciyV5A5t1osH67MjI7Wi+cn9CPTYu/YW8wNq+49N/iZo3TCpRqTfuG9w17?=
 =?us-ascii?Q?UBqKJSIP/6eqKWPW0TITZZeK8VffykC/bJWlfyMX0dZycbPA0VZNWZsrRgH1?=
 =?us-ascii?Q?BLs8o7ltef1Jq2WWYRI3xGo+/bUP3aeenhru/p9EttYgU8t6fpljKFd+6pie?=
 =?us-ascii?Q?7aAGMyKpzoep6zDGPDVKtjfMM01Udea3c06vyyabMoYyb4CJlP/MWUjL71kW?=
 =?us-ascii?Q?BtGXLG7enkU25+a6qBkyXsNozyDyFb+1GalQe8VqLMSmFIqMRe0Qyu0tEs14?=
 =?us-ascii?Q?qXlOcoYupkPSfKitpIqD/FLnKgQ/EjCwt9frxBZqCg0cZtmnbSzFjyyr56Sz?=
 =?us-ascii?Q?bAKeuDtLw8IG8CGktcPQukdr6e32lZtHN8O3hnla5Bmesatu0HSqn7lqJn2m?=
 =?us-ascii?Q?Qh5WuNsO/KPCffP+362OQyYapNR5H5l1neSBrtWsleARxszQsThB9KOlCPjr?=
 =?us-ascii?Q?lDjdncFrTYMlDpzs08Bdk1LsGJJ2dcM6Np9Aj1qeDIT3fN+wCP4mpSV3WT5Z?=
 =?us-ascii?Q?bWAXoNC0Tnr6sYDhCPTAfGiyjyFBVQ1bFqos0rlCHyvPq/L1Kq4ny59uFT5t?=
 =?us-ascii?Q?PLQIuoajtQ7Ng1KXssgUBcZM91N7i1sz98DD2Vl1w9B7MKKvLm877Z8U9VcQ?=
 =?us-ascii?Q?lE2Ls2rgCiolYbKwFcKPH7h3XJokf3eOEwQgp7NfmgQo+zl+iK1ljmosncGc?=
 =?us-ascii?Q?ukPNMVnrC8xiuiSrGVkEJ2kdjkJvv6u1kx78qjqt95GwYatods/6a0Yr8r7L?=
 =?us-ascii?Q?UAtncB9IDq7pQPmqwN91CasqGXC6wexHDxMh8H51SKgN16maCvy4Jjt9HG8W?=
 =?us-ascii?Q?rqsnCvwEhmZxqRkp6iOON0xc60KlbBGOsnOQa/tP9KEZAn0wX3aRLpckkLtf?=
 =?us-ascii?Q?yIBSFqgyaQj4I3IRtZGxhbEbFhugroN19lA+4+4AG0+vS0Pt88H8xqv2HsWx?=
 =?us-ascii?Q?rZZylLPDquEE1mTMW81h4522J1hVCOAn9iPloSFKqHoEyAVE1VNfiF6nhv0x?=
 =?us-ascii?Q?+8KzgzPyXQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d66072-7030-4348-6e08-08df18244029
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:06:48.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUKnke5ctd9vmpQrb9bic8d4907lALEB0UqZkjl27kodJkRZwEfvdSnlwrqrF9gDmLoRav/TVLSJqEG0ejA6JJyNfwPosavZhmX73oR9mnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246360

Optional recommended/suggested dlopen deps often have no provider, so musl
builds print warnings like:

  WARNING: cannot find any provider for dlopen dependency: libintl.so.8

Only warn for required deps, note the rest.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes in v2:
 - Reword the commit message and shorten the inline comment.

 meta/recipes-core/systemd/dlopen-deps.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-core/=
systemd/dlopen-deps.inc
index 2d43f2dcb8e..50ea862df06 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -77,7 +77,13 @@ python package_generate_dlopen_deps() {
                                 found =3D True
                                 break
                         if not found:
-                            bb.warn(f"cannot find any provider for dlopen =
dependency: {dep['soname']}")
+                            # Optional (recommended/suggested) dlopen deps=
 may have
+                            # no provider on some configs, so only warn fo=
r required ones.
+                            msg =3D f"cannot find any provider for dlopen =
dependency: {dep['soname']}"
+                            if dep["priority"] =3D=3D "required":
+                                bb.warn(msg)
+                            else:
+                                bb.note(msg)
                 except oe.qa.NotELFFileError as e:
                     bb.note(f"Cannot extract ELF notes: {e}")
                     pass

