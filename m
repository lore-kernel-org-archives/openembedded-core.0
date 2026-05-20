Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCACACD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:14:53 +0000 (UTC)
Received: from mx-relay04-hz12-if1.hornetsecurity.com (mx-relay04-hz12-if1.hornetsecurity.com [94.100.139.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8193.1779268489896422639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 02:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=IfjxXsgk;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.204, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate04-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.69.137, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr83cu005.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=25tfqb0NX2J+dv+r2gJcNtEEf4UKEWQHEj58IyFmgWE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779268487;
 b=YO+c4MxyyNuveGqOjSCeEUdJr2k8NS/XOl+clwgfRhsK748ICDNgcQul19qG6zXl5ZbXXlas
 ZFTCRD7L7t9n/3sry2L2jA2/a0TGmE10hswqyaxwAZQpCJjZEzRELcSdcPCUZRNG3P8Oe3WcJ1P
 vGT033Lt4P5a9PKd3b88BI7ASiJNUL5AtXoROHgPSAjIF4qLUBZo9Yk8Q1H2Ie4hotlZKGYCuhb
 hFJjIIzVIPT+d4DHQfI6zrSYfG5lRCBBOSR4lPqxkIVBDPnR06hiEgHibsUj+yhRK9lL+Jkrc1y
 E/DAr9IbffHjKdkQNOZvfVCLjWUg3TxJ2IgSHU5dP45bg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779268487;
 b=ckxLGJBfze5uWlU5Z0ID3AKPHHn+mbFrriK9k1m4m3dU8aQCRNoDz4VEGFwe7ZMD66qF84k8
 56nTnb8J10RJ4Xc00GEbqdZ0AhcDXXbeEpfmRJucA64sUctV4dm+SGVZ7D/HBeftTL9fIGxLLeU
 03OO6pM14o5niEal6vaIuGSm7T/E/Ovfxu79gG/JTfQGqxh08BhOtDoECrikysStJBdOPYcvO2c
 vzQBtvAlE6Zh2nGs4maTDjtcqlUkEc7184j6RQ3DcW32xUGPXlW3NqqIA0i+0boxTqHeaV4jHPF
 sGjH54B/7M3Zr3Z94UtvGvqQiybYxbjKVMnIDJ6Advqtg==
Received: from mail-westeuropeazon11020137.outbound.protection.outlook.com ([52.101.69.137]) by mx-gate04-hz12;
 Wed, 20 May 2026 11:14:47 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teCAxziTil6pm2oIvI45gg/uhdpFniKS/fxfLpxaU6dAcS/Urcabv5woIVjH6LLxqUwulDy38G1ezEJqjTwsTCS6bfUFp8yEIFCIqZdGV9zeZYR/6816JLY9fAyiaZDXIGQIDEJZP8rPw2Imb34IsNrNqIZi592+BYu4EFx+ndt/H6QeRagVCx7XzvVXjFkDzS2n/WD+ljhbARyoub7C0FKf208rXlrUoUnWk0s+Bjn2SW+XMaxZS1or+tvUN4GBDSE2faztoCaJ7j+1Qyj2hIeICkwh5vJuhzFIMGuGyUXkvpmVmjAaSp6kYIjBXGdOmxTcQjQTmqf7kv8ldl8u9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25tfqb0NX2J+dv+r2gJcNtEEf4UKEWQHEj58IyFmgWE=;
 b=uYWr0WId89SUoAaTbl/BVOcs02KtjVmUGIwnf+RL+KmKxZWFScn8SHGi2CRryb9qX+qJO4TwBTN0E71cNNZujWGwCrWwgtjf6VyI6e2nwesk2xtLD6CDm4QUdZ9Kl6az0UWyI8/HvULOjUKDhjhNJuYV+XOo25Eaf0Nxd77gOas5/fAZvITFmUhqECjkpm01Xz6I7P/bbeE7kkVnzFIIfif+KOCGml3Q0OHM7CiPbQ8to599wBODUMUA1CVFGXiWvTN6PIPs8yamx29bIeqW8sB+ZE48ffR0oJMhx6KUGWQCf4xMfYtlu0khsFlPU3pGAQg7pzx/bOdN2+4MHb1vEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25tfqb0NX2J+dv+r2gJcNtEEf4UKEWQHEj58IyFmgWE=;
 b=IfjxXsgkxynRA0uU8dhz1DPm90NhmXSFhyoX8Bu6GFpJGmHmlng7OfZzlA8+n1zqDJiklLyWh0MHM9L7kW3ar3p3Fhy6dKQ17G1Zi/8eegurUqZNOlu6/VfFsCvsSPw6Nwz0cA/RRu54YAXLqSAcM8v7f5wBnSuxCpSPIJcUiFS+7dNyL+qzBa2aSPLw+NBidFThqS9ZXatH9AEcxdhAEp/vGu82VOyyHd809lbxiNvuMZUc+Tas8cm2DmnF+25AofuEt0Y/xOTAeLp374ryEJvbXAv9XsBhzi+zPT6si9HSQL88IStixMg5exS86+c5feLI9s8G7F7su2ziK2RI8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 MRWP192MB3501.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:82::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Wed, 20 May 2026 09:14:38 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 09:14:38 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] libcap: Fix CVE-2026-4878
Date: Wed, 20 May 2026 11:14:30 +0200
Message-ID: <20260520091430.3075624-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::19) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|MRWP192MB3501:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fad822f-dbf0-4308-b463-08deb65037f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|52116014|13003099007|56012099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9dfss11JPOV3FmIGQdNtMP0uUEQDIBCVWME+InCxPzdQUkRTBK4nUFrLxDp4FRk++BX5GmcoPnkInTtJwzReCl5XM7C9wWF6j77fVqhiubAZn7id2uhYn5GitRfP+ielLc14Jag+bt8+IRfEFtNmMoeEIbjDMFrOTYDKCwzlsU6Nwp9lniWC0BuE3Yb1R9uX7ezBHf6Wdxzhve+XqoRmwCXsiZxK9gxOnTp64dlTrBIYH+GZgJyuijhKabOEZyqE2Dvavwj15YJoAarIiyb4ciHEYDXWn0uqF1/h2tepeptfHRSnhkvQHp6zszKht5pOLs/9EwYUMWL1scKt785IJA+S50x6zPWAdiHTbcLmPPuLcG+/0qQ5b9Glru3Uh7bNlbjRnIKKsR63h7PPEADi1AGEiIZWY6Djnay52hGnBRGSiOZHQpvMVcIAHS6Fns5c/NYjVkqp2JC6Yeeg81kgK2KVz/lyMoiWBQZK/VzhxuvG7PCUMAifsd9oXb7IdkR6/pFsIebKrbTfjh6h8ePnAVAAMcG8abi+nDZVY/OMVlT09+XUPFF94q6vPieGd7fGdXft0bvlJWzZPp6x714xkUMQ3gmpgY7y+itWRCHWkS/ZPlgmg/ANan1S5MGieLcXp+REIcN2UdvGMkLfNd8l3bqvocAVP5deyKb+WS1FFCNWny/mkmjrrvUicIYjIJoskJgiWzymYoSslMdOkE6imA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(52116014)(13003099007)(56012099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1XDmCvt+U+q+CJYIQ3WO5EdPgyluaD5pB+gAA1QYhK4g7Jkwo6YdnOuJHpT3?=
 =?us-ascii?Q?GNygHZ3r/4rKfxRLvPtpYaFSkGL9W3RvIz4FpCynWbWq1K03bR3+vxio0c2y?=
 =?us-ascii?Q?9sLyvNntSnGkd/fTIhzYzsg66XABqwGCE42qcROEy02qVGuHiHVQvHy31b2k?=
 =?us-ascii?Q?NpSXQ67pmU7w/tcd9czbc7l0lZ8/D5U+aJgFAwyqKnwAAiR5uk7mB2sNA3rQ?=
 =?us-ascii?Q?duEvXXpsh1GYFI8uEARO2PbWBNYEzWp4jHWEM7lPP+egZbfZ1nuLMQmB+GKB?=
 =?us-ascii?Q?yxmS9nM6TwuDKjdR3G3TY9ko/RmPRwg9ni0X8Uvqd25OoCxep5lFVuSrW66w?=
 =?us-ascii?Q?Cd19o8DrTF1w7BEWw+kWBVLOKq+vU2vHcH+UHw8EKoEx48i/x/kscDuFLa0X?=
 =?us-ascii?Q?yd91X0cK80y5tz/dUllh1DQ/r+d+dLoCAmj11cz+eV7bpO7I83f879JIEQio?=
 =?us-ascii?Q?LgBNNk08r3llNHTXU6UdwSH8SCUtlEq5oyIaaqn4X0PLUmzcSZN9BFuJtcD/?=
 =?us-ascii?Q?J6Kzi/jZpP+wLH5DgFQktXoZNxVDqacAfQPJSGCCZvm+foi9FkEis2brQ+wV?=
 =?us-ascii?Q?LRiIH4Dsu3u2VS8nERA+SASsgOqayYLKhXEuwRJKAxmEQp2jy5/1Xtu3shpc?=
 =?us-ascii?Q?AhGhUxIK3IMaXLq2FSsWyDg2HtvJuaVnkRh+b9W8xW3ME99gSFGsyTR7qqSJ?=
 =?us-ascii?Q?H4LN0k83QWjMDNBTgk0MbUn8g3fj+oQh82ocG6VyC4yM0b7F1bDkPHFYnBj/?=
 =?us-ascii?Q?ONtpDAjaVI8sfh9R7WbEfUCx394rjBgLI4X8uQFi43PVuYFjk8Om0eK5mCGU?=
 =?us-ascii?Q?x30MQLxpib5OJ8KDvmS7P5O+ZXjQO5yJfpCEP1nFe1OLdlgkx7qrq+4B8qYx?=
 =?us-ascii?Q?s3k7ppw/siCv0NbUr415pyVXSiDvirlEmnJn/7jByXIILo/caHGPKGuNSEaF?=
 =?us-ascii?Q?VnWSck7hxhmKAzTu+JsxLokkime6xuXskg9TqU729yaLi1qwSDCfEYYpXN5Q?=
 =?us-ascii?Q?nxEhkWBtPUgCCYhUxRfVbSWaFxEBpc4NjR4XpGH73JBo5lWr06jL4+UZap7G?=
 =?us-ascii?Q?hrgRRSdlF8V8PMr4w4TIsXuYHSPFkfcr3bF1gP7zVw65wE57NV/FGa6O7cKn?=
 =?us-ascii?Q?NdEcYvaKAgIbDZyTVY7VcvVjxF0qj87SsQZHFsGZ614HiJMcwjeziNx9r7q5?=
 =?us-ascii?Q?XYoKO/LLhvlsNDVrlwHk5Z5baSD8parhLWVFIXuQlYGpfBI62xyw8qt6TPlL?=
 =?us-ascii?Q?Z0Mzznz3xEWEtJjh+x+4rScATRfUx50eriZvO0bSK4wKW+kLQiDyWFrru+dW?=
 =?us-ascii?Q?U9dF/kvFc7rtFWGyMW+Ov2vw5sK+vh3/0zUQqmzuGZV0dn79IuowccuYoff7?=
 =?us-ascii?Q?Gjo/XKs1l9QfNs6rNEEYKTqbMk6jlVtqWYRfJzHgFVdW5i0AdIQV/0U5pffC?=
 =?us-ascii?Q?Ks+ARwCAGqY47a2f/DjT8Ft2OFjwFIrCEp/4mEOClUZUPRGwliTVjL9ys+Hw?=
 =?us-ascii?Q?lRA01bEv/Y5OUU3iJ0ZFxz9kWjKaG29PXugGM06gEbmxyPE7VLJRp/O0d3HC?=
 =?us-ascii?Q?J/L5lFfXthe8Pon8DQab4uk4ARUGtVgoKIeaPYqvd1moOeN5aGBvcgd5ZbKn?=
 =?us-ascii?Q?BgrVDimHCEv1R+Mjr33fk9o8elJfP63FomFaVLey6HbRiU7Yw/70vUt7B6Xg?=
 =?us-ascii?Q?7BpQf13H9cP0dfIzF12hbymqpOWRkQZM7ljUUUn4v62QZOG1udXE6+Cg4flD?=
 =?us-ascii?Q?zEWw23j8JDLdPgTXCPh2qJ60VS5pE4pGvABCr+fii6r9Ic6poFes9i7SSvqW?=
X-MS-Exchange-AntiSpam-MessageData-1: 5+STboAg9A/T6A==
X-Exchange-RoutingPolicyChecked: 
	jJB+0ysOmG1GetwezZI/j0uhXw8/lV9o6vj2rP/0enyMaJ72lCiWn4v2cN1o8btf5MK2IpjdZe9hWtg8c1i2LoVmH71eSd+7VABm2xJvCoouCaO0qwZTm+5l19gZDF63IypCfxMebSjofQym5WUiqeyqQl/llqnJv05v7advZ4DqnPxQJwxnZfaSMR/C30GOU70yLg481GeiQ2q3zq3ElTiorlHpMAFSJN6+assazESRg6UZDglzEp6aYzeJcXzckXEeROwJtt9C4HP6bzhfThpGNNN+XajS5OSOvdr0t6LGRvHu2CYanJ+4xVYpoPxtMZ07FeojlBP+GLvgIFy5mQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	B5flj8K6YNBg9pYnNwDsLX9k7BjR9l5hgdHrsf1XUI2CihFfNoDvavIQpwV1xH1AdIVOQ9HHpYE3X3DbssdPdybDtQxyAXIieonXNPXP1N1HC0IcixPP6pOm7byBbSXrld9zIfqsvbn2WOR0FDpjzEzlaLOXXcaAxp6T80jMo2/D+MS8/AgNVixFuZmD7XGmTbf1AaOvJXo8ZlIZYA2kjSkuANck1SgoC1ZasPqq2F0QRPyLMWpXHjTQ+MxsS5ustecn65gWNOuYoXYYl+FgkB6rusXPo27smER1Df863aeMbf07s7Ww06eO947/dSatxVDjd3c0S+Rk25HXBkbKGStz+pQfdFEfoCbnTH2Qj/yitDNuhqEndyxbgpvZadBmhoDay70TBD/euDmbZen6mx/JsJuK0Co6OkB7ZdPAocHgh9J0enzgtIGrzelxu8aMjnJPEvLKmwoqdYZV9a8A0Pmrk8lO2j3HFSWoQGXkxicOe2S3DWALja9dPSgPhKcNyJepj4YD38VsUaxvyq+l/1oi7s9lLO5MDp0mzMb0Qb7zW+3X6WCRvO2wSSOQBNaY9MLaM4nn50VJhfzo6Rr45at3VL54LSl1W9uotG9/wPB+zytlIdaPv7HQtT7zYpHb
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fad822f-dbf0-4308-b463-08deb65037f4
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:14:38.6424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klGHp1Yv7kXEXjvIDHHvPtKwIds7DlMJHMD36nVb3tpwA2L0I2rXBWQ0XL1uy1QAb5fuKLRetq7s92SlPLfhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWP192MB3501
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate04-hz12 with 4gL5TY0PT8z1b1PT
X-cloud-security-connect: mail-westeuropeazon11020137.outbound.protection.outlook.com[52.101.69.137], TLS=1, IP=52.101.69.137
X-cloud-security-Digest: 7491f76de87439d2e4dd1688af31eb01
X-cloud-security: scantime:1.720
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 09:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237436

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].

[1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596
[2] https://security-tracker.debian.org/tracker/CVE-2026-4878

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../libcap/files/CVE-2026-4878.patch          | 164 ++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2026-4878.patch b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
new file mode 100644
index 0000000000..dcc63d93a5
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
@@ -0,0 +1,164 @@
+From f17734c6b0f4fd102fe4f7e863cb1165f8ec66e2 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Thu, 12 Mar 2026 07:38:05 -0700
+Subject: [PATCH] Address a potential TOCTOU race condition in cap_set_file().
+
+This issue was researched and reported by Ali Raza (@locus-x64). It
+has been assigned CVE-2026-4878.
+
+The finding is that while cap_set_file() checks if a file is a regular
+file before applying or removing a capability attribute, a small
+window existed after that check when the filepath could be overwritten
+either with new content or a symlink to some other file. To do this
+would imply that the caller of cap_set_file() was directing it to a
+directory over which a local attacker has write access, and performed
+the operation frequently enough that an attacker had a non-negligible
+chance of exploiting the race condition. The code now locks onto the
+intended file, eliminating the race condition.
+
+CVE: CVE-2026-4878
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596]
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+(cherry picked from commit 286ace1259992bd0c5d9016715833f2e148ac596)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ libcap/cap_file.c  | 69 +++++++++++++++++++++++++++++++++++++++-------
+ progs/quicktest.sh | 14 +++++++++-
+ 2 files changed, 72 insertions(+), 11 deletions(-)
+
+diff --git a/libcap/cap_file.c b/libcap/cap_file.c
+index 0bc07f7..f02bf9f 100644
+--- a/libcap/cap_file.c
++++ b/libcap/cap_file.c
+@@ -8,8 +8,13 @@
+ #define _DEFAULT_SOURCE
+ #endif
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++
+ #include <sys/types.h>
+ #include <byteswap.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+@@ -322,26 +327,70 @@ int cap_set_file(const char *filename, cap_t cap_d)
+     struct vfs_ns_cap_data rawvfscap;
+     int sizeofcaps;
+     struct stat buf;
++    char fdpath[64];
++    int fd, ret;
++
++    _cap_debug("setting filename capabilities");
++    fd = open(filename, O_RDONLY|O_NOFOLLOW);
++    if (fd >= 0) {
++	ret = cap_set_fd(fd, cap_d);
++	close(fd);
++	return ret;
++    }
+ 
+-    if (lstat(filename, &buf) != 0) {
+-	_cap_debug("unable to stat file [%s]", filename);
++    /*
++     * Attempting to set a file capability on a file the process can't
++     * read the content of. This is considered a non-standard use case
++     * and the following (slower) code is complicated because it is
++     * trying to avoid a TOCTOU race condition.
++     */
++
++    fd = open(filename, O_PATH|O_NOFOLLOW);
++    if (fd < 0) {
++	_cap_debug("cannot find file at path [%s]", filename);
++	return -1;
++    }
++    if (fstat(fd, &buf) != 0) {
++	_cap_debug("unable to stat file [%s] descriptor %d",
++		   filename, fd);
++	close(fd);
+ 	return -1;
+     }
+     if (S_ISLNK(buf.st_mode) || !S_ISREG(buf.st_mode)) {
+-	_cap_debug("file [%s] is not a regular file", filename);
++	_cap_debug("file [%s] descriptor %d for non-regular file",
++		   filename, fd);
++	close(fd);
+ 	errno = EINVAL;
+ 	return -1;
+     }
+ 
+-    if (cap_d == NULL) {
+-	_cap_debug("removing filename capabilities");
+-	return removexattr(filename, XATTR_NAME_CAPS);
++    /*
++     * While the fd remains open, this named file is locked to the
++     * origin regular file. The size of the fdpath variable is
++     * sufficient to support a 160+ bit number.
++     */
++    if (snprintf(fdpath, sizeof(fdpath), "/proc/self/fd/%d", fd)
++	>= sizeof(fdpath)) {
++	_cap_debug("file descriptor too large %d", fd);
++	errno = EINVAL;
++	ret = -1;
++
++    } else if (cap_d == NULL) {
++	_cap_debug("dropping file caps on [%s] via [%s]",
++		   filename, fdpath);
++	ret = removexattr(fdpath, XATTR_NAME_CAPS);
++
+     } else if (_fcaps_save(&rawvfscap, cap_d, &sizeofcaps) != 0) {
+-	return -1;
+-    }
++	_cap_debug("problem converting cap_d to vfscap format");
++	ret = -1;
+ 
+-    _cap_debug("setting filename capabilities");
+-    return setxattr(filename, XATTR_NAME_CAPS, &rawvfscap, sizeofcaps, 0);
++    } else {
++	_cap_debug("setting filename capabilities");
++	ret = setxattr(fdpath, XATTR_NAME_CAPS, &rawvfscap,
++		       sizeofcaps, 0);
++    }
++    close(fd);
++    return ret;
+ }
+ 
+ /*
+diff --git a/progs/quicktest.sh b/progs/quicktest.sh
+index 59e16b0..bb49d53 100755
+--- a/progs/quicktest.sh
++++ b/progs/quicktest.sh
+@@ -148,7 +148,19 @@ pass_capsh --caps="cap_setpcap=p" --inh=cap_chown --current
+ pass_capsh --strict --caps="cap_chown=p" --inh=cap_chown --current
+ 
+ # change the way the capability is obtained (make it inheritable)
++chmod 0000 ./privileged
+ ./setcap cap_setuid,cap_setgid=ei ./privileged
++if [ $? -ne 0 ]; then
++    echo "FAILED to set file capability"
++    exit 1
++fi
++chmod 0755 ./privileged
++ln -s privileged unprivileged
++./setcap -r ./unprivileged
++if [ $? -eq 0 ]; then
++    echo "FAILED by removing a capability from a symlinked file"
++    exit 1
++fi
+ 
+ # Note, the bounding set (edited with --drop) only limits p
+ # capabilities, not i's.
+@@ -246,7 +258,7 @@ EOF
+     pass_capsh --iab='!%cap_chown,^cap_setpcap,cap_setuid'
+     fail_capsh --mode=PURE1E --iab='!%cap_chown,^cap_setuid'
+ fi
+-/bin/rm -f ./privileged
++/bin/rm -f ./privileged ./unprivileged
+ 
+ echo "testing namespaced file caps"
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/libcap/libcap_2.69.bb b/meta/recipes-support/libcap/libcap_2.69.bb
index 03975b44a0..43185f027e 100644
--- a/meta/recipes-support/libcap/libcap_2.69.bb
+++ b/meta/recipes-support/libcap/libcap_2.69.bb
@@ -16,6 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://CVE-2025-1390.patch \
+           file://CVE-2026-4878.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
-- 
2.43.0


