Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3902BCD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:15:01 +0000 (UTC)
Received: from mx-relay15-hz1-if1.hornetsecurity.com (mx-relay15-hz1-if1.hornetsecurity.com [94.100.128.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7302.1779264894683473597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=WNOKKXcs;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.25, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate15-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.66.116, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=NSiqafNngkjlcnyMBjEGjsFuIuvzibjSZxdkY3vvBzc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779264892;
 b=LO4t8AHM80u+4bUV7Cs9FMoN2XID2X4g1sYY119ydw7/keq0PxjeJJBRHuAFl4HznEzFg+5U
 9X6bppgL1hDbcw76ZBQSsWUgFaZeCrdQxtKCwq0hSXIHp1xaTRefmaxmKVvbogPFBVd+wMo+JKu
 41nujBgeBa0k6omc+yTtuFj4KX6ThQEd6ZbV/vIuPBkUHBtyLjweEyW8rlEUv1GzX+00tW11N93
 4V8vSo6Evv8PJyt5aGZzjgjeT/gZq4PANiqBPLETicIW7DTC3iiYZSCvZVrLuYBXbAYKfBCMdcf
 bYWpRiUTO3t1X297U9Bw0+Mq6mVFZCgScO2ySioz4Q/UQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779264892;
 b=MiAIpTIEVxnqUJceOOwgilmVbPR+Q4aIMEVewlF9N66ljCoUvk+fBupNPs9LIH+Byp16l+1K
 VqLk9KxLgk3E+rqee5aU/3JEO9PPG6mAy1K/xXEY9mICmNRC0jbsXk7KSztvKEGA+UFGTosGhN8
 aow/TC6CNqzXalTDjAK8pA8j8ex+a7wupip6OSTBa1UYtpo+J/eEMA+9Nj/fn0KsLXo6ZxafpTd
 w/MMkDXYFzSZXuRd2vRBPbUw6rbRvK7oOWKgoddretbRpA6j6AB3a1CZsv7LPywZUZMzJVigUbu
 ByKGrFDHOPiTOyljclZjXSmzALaqln3OAgsa7LzkowKlw==
Received: from mail-northeuropeazon11022116.outbound.protection.outlook.com ([52.101.66.116]) by mx-gate15-hz1;
 Wed, 20 May 2026 10:14:51 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6XItFZKIETthCbaHhjVinLFkeu3gpcRntjufep7UsmJ9xvCzisS1jte6XKSukroMEVmr40goFJLRJ5EJXt2c+aP+dr/ES3aXeOEsWoGrBIsdtJ48guaguBajL48ws+nPyF2CNJOk+AhxvkaNMPsqv8T2qte5nxSvLM9Q9BdijU3SFVjWfhmTJIuxrHkxmqXRk+138enx7I2flbUfFKcQKSvFUmc3YivSyBxViHZMmQIGxGpKaGPxIy1Ijys5HtytPrplwYvbTjq0/rf3puwCRbdrn512R9smNtVpAPtrquLoorPXIaQM6mrm54dugpeszuBBREjHP0FDuJ/fXfwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSiqafNngkjlcnyMBjEGjsFuIuvzibjSZxdkY3vvBzc=;
 b=fSA+Oz5wKBoISjc8bE8gv40dcdIW30viUpMtNHRKHz2L6sOuNMPWXdC8vpqai2GgyBV2GBHtEL1gE0kyCTn6PmOIeiHeCp5IfKP+AOdheHJGFzATKbDVXC2UCaLDiMu5RpskKty2e3WdSExBqZyRbX5TceZEDHyDoJG1XCfDTArH4+t4QpjKrVqfBv3VZWIuLSQwJIwmDQVfvsYXyV68/lIhFrvZNGhTM6cYhjiMYCgejyGVCG4I7PxxFX+vnXSKNLuGcfuSWc2g0TTUBkHBdCtT4AVy225x4OppycQGQXnGcUNl7+ECR9aP9Cv7FSWWGeM5korpdk7okbnqHCV9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSiqafNngkjlcnyMBjEGjsFuIuvzibjSZxdkY3vvBzc=;
 b=WNOKKXcsFcitp6NpaRKjPFCFMfwxIeOBiyGrf4C/IRwq7PAgcun6iUlVqTyv+EPkJyaqvz6NetcvEeIJRoCf6sXtFpjzfUVbZlLkRDttQQEY/oKowf6itOge4JpFoeBHanQBCXhOxJGfHyXLywT3Qf/VYZPXtb286inMva56AyCkgTbA38PVnQwMgJuA0qYCyh16XF1ipltQi4FbY4EKRsKXvbbMxLGD65BPgORtt1FcAir4xkeN+rONqm6dQvElJIbeRTn1/rf33UEeni5f6K/JUlrp9g+1MIIXpOdySIcj9Wg6dXOKG7RBXj5yGjEg9dJys/UlQJjgLkJIGb+CjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB3P192MB2129.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:439::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Wed, 20 May 2026 08:14:35 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:14:35 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 2/7] gnutls: Fix CVE-2026-33845
Date: Wed, 20 May 2026 10:13:58 +0200
Message-ID: <20260520081403.3052797-2-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0410.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB3P192MB2129:EE_
X-MS-Office365-Filtering-Correlation-Id: 190812e8-c702-48a4-c684-08deb647d492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|52116014|13003099007|56012099003|22082099003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	l61MQyY96HK43wRlU2HeqKryZviN6Uy1rGRLs52V6TmOGDUH48oxmUScSNmLgpmHgeXODDtLu8elRPjc5povaY3DF7+ydiC+bawgyHKNsqlu3YBtXour/NbAOmrQ8Yd/LBL49aqNQ0UVI5ha0jY0tEjbv2FwwkcQL9kiPKwc+nI62qC1KquUY+t9UEzebnYLb4ntv/OK+g5EsZADHNH6Em4+8t7Pz2Fj8B3RFfV1KIKi1ReHw38sgXAGWyJjiKTxhxIM24VoDS0SqLqjhdzRCggGU/MgpjsRPcJsMnJkC8LvNawyWlLMILOni9sGRJzY9lk0v/jPknhP1b1z8x+jBvhk+V6D/ZmLoyGQq7fFhkd2xk6m9u00pQiN+656cKQ/SDqV7fOx+yGqkjLH6RLEbp5lVPf/W2BMjl3aieDsHtpCtTqR/YgdYm2A1nAru1bfDPVZSW+TYU2AOWzvMhZ7CuIMCMQ2Rz2feF4zS76n/xng9SmH8qxDKAs7I+jgYcVBXOwkR2Yc5GNu9u1bxi4fSFgJ9c6Hzdvfoii0WH0ItxSOw7msJ+y6lBnhfZY1HJyPrX/snQcidw8rCxNY3ur6O+bzaac6btiCciHEbNHi0UAF9+DSpzsZpGCuw4pmNQX4bOZLOeE2jgFS/8b832Q4L4KVdCbrUyO43Ts0cfHwA1ewtSCToFFMQYIp3Xowly6J2cknILB7DJ0kYlA1vCXmWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(52116014)(13003099007)(56012099003)(22082099003)(12006099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xHfM69ykTq70mxnPEYQ577XaPpM8FWPAShPghZaDT7E2EnsiBD8BnYILa8gc?=
 =?us-ascii?Q?l1plHZTTeO5u8b5v1sdgdB6pBhzHJFdKeS8+sYkPdBVGgpu0JkxwNFePlBu8?=
 =?us-ascii?Q?pTxoQIMOHnxGd6FmY9OnbvUWqSbZRPH3gUsXw4/MWcapSRouXUnE+xzWlMJZ?=
 =?us-ascii?Q?tLK9mLXP0CZp4RF2LDAJ4thFB4j2ZxK1zFE7oQqcwdKFDTfU/Y/7/KfnSl8A?=
 =?us-ascii?Q?Mn/35pxclPa/BfRwzDO34h3m81j5NSo9AO5ETDQMVNvHJ1AFxLqmpF8hnGNc?=
 =?us-ascii?Q?ITYGAfH1oljgojxXTadvBxX7XwvNtg64f2ENBa5Eyd3c75I6x6vG5u+kdeZH?=
 =?us-ascii?Q?nROlBX5ZVpVO/xXB6fBgsdDQiwxoMzZ4FAX6Gk6ogXjX+3zNzkcnUoWdsDuY?=
 =?us-ascii?Q?0OKmmcztuHMCop05gRHDGlafagbKLKccujXl3RRGeSmKBAyRNEeomJ3EHS94?=
 =?us-ascii?Q?GzdpSwQ5cSyYvSgWrhmfABlApmf9NXO9+QbqKKDhN45NNdWFhjj9VsxIhcei?=
 =?us-ascii?Q?UlaP1/WcNzFoUeKBl0CnzQeOEP+z23S+A2Da0uhigAfsxzi/pY+Z2bfbLuHi?=
 =?us-ascii?Q?5PaQKkGfFO4ysu/zlMcRPT8lQaquTMuCituIDlAZurnavTLGWjpNSxMsV/9P?=
 =?us-ascii?Q?Vx3uPP3rPxh5Vwq8nOs5pKYause7my3dbj2KvUWfM/ynCR3GL0O31efTb/yP?=
 =?us-ascii?Q?g57qc0AcNRz4z3Mym1Kk6NCYI9EPjMOHuMSsrZl+cJFci2gqxhP/bEK5yKpi?=
 =?us-ascii?Q?ezYWYqMzNI/X3LesTra40GHw7/Yj19hgiDPjL/Emh35qIhJsI275RgCtqkFk?=
 =?us-ascii?Q?Jc1RnXe/N96fHq0uRDQzq6wi0twjcfY905A+XZjSjrU6zAOxbNSaGzbYvjOl?=
 =?us-ascii?Q?ON4FGD8GqkX5qeXCxjzduQSEOn10SjA9NTgE/0qkYW+3fsU84cKCfRYTVVgm?=
 =?us-ascii?Q?VaWGbNViMP3x+GJt4gpwLGeHfayWuL0eHhZdTbcMH30g0whbwzJPsIw45p9q?=
 =?us-ascii?Q?fFj5NMLlUm/ukuL/a/D4JjD0l1wOuvRHeSFJdMEvlI/fFrRrHV+qJtttGk5C?=
 =?us-ascii?Q?6A2fj6dB05UzFLWr0/y6c054SvIK4H7QemPmkRaLZnJKAJVSqj5KFy2Cadab?=
 =?us-ascii?Q?uf+U0jZ8RgNaetVOqi+FPNC+f6FAHjvps3Gdgoi/tD8IWcEXVSHHxmM9CMcU?=
 =?us-ascii?Q?mgLsZi0gkRq9XwT5ligg0Z/qKGEzTq6UfBl5HAWxpU3N79lJzFoBJgD4KR6v?=
 =?us-ascii?Q?OyxQ/oOOV2ZNn2j19hGPAyfZWf8J+zE7+wyAyUCUWL3Zxlacp1bKZi2WyDH+?=
 =?us-ascii?Q?ZaxOKUSYYQ/4Vp6Z2KPRr9Lyeyd2AppEchegpOQTfWD5d8awK2WGFMVBSZ44?=
 =?us-ascii?Q?s0GgpkskY+jKsTNBGe6sKlAp/+k5N/alBgoaTfLyvnmsjeodaV+fUlA0HX41?=
 =?us-ascii?Q?psp03xSJgxy0hpZUEmt3MzQvDFgD3st39kMsQ9oIB0gF9Q3OM3jIrlYD+Ysv?=
 =?us-ascii?Q?QRFDE3oTxD3r5bDlg+mFxvqocweBE/D9H5DTfASRq5vO8NyTUPLir9GptDOM?=
 =?us-ascii?Q?7X9Az0dD5mQOLhdX6CUg8447TX79NXyF5obVIReUTI8SOxq1dKa4sApcFy/k?=
 =?us-ascii?Q?IeIVGIXWFGZxn3wLVDCB5uEH+7f48/KGcvnYHwP3FyMAXFDRO/WAwWEciYbn?=
 =?us-ascii?Q?3+kQ/1AuXQ0zoH5oEVwlgXVhsMwNFZiinZkMhecTTyKuSPFZ1zD0u2Q/n37T?=
 =?us-ascii?Q?UNT/7Kkis5+jW3xwKhrkItVeRofod2kTmdb2u/InPzIlM9R7pxPCooycoVmL?=
X-MS-Exchange-AntiSpam-MessageData-1: 3g6jVX9Y5f0SMw==
X-Exchange-RoutingPolicyChecked: 
	ZaEXyxZJUakEaSQuocHDKOCSIp7+4VnLirrblmVLgsRVsmdl/k+uCDFpiey7Wo1RM8AF3So44Clp/9fR5YkjfodBY2b8le2XYchKr8/ky9n92PblcM9sF2G09oVbZLT5hO3f6aHccXN/BzsW4ZeT9BDE6EnEw7TfqK23TO8oBycCZgvqvKzniMCqILAteSImtXfrF1cBCgBvzIrk90qhNrx0b5jBT1bion7YCFIjKnbVotxbBF32c8UehheqiS1GJuMgIZBzXdZbLAnAryHyIi4Mn0wPE1QZv8unkFoMEWaXzy3mlJfdnDFjeeSXtbMxP4TYyxISuehsY7th8KwlWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	d8JDsKsq4HyVNOfxuf4wYxcO/OTu8kTq6akbBgZQNpWsJUccTeVXPFW/RTBXqKmZ5jHhtohvN8wPpkCHCt8yYey169m+K7L0rfubZIPFOYrDTrnaNbGz1zVYnj7lAi7PorSe53y7fqOxQ5j7ydvq7EEq7URXTswprabLVmtLMqItSjUzz3JnunshLU+IfdevfrAmqugjpriMENQezOViYcFsLjOg2Aw9PNy4q2bAcVi88u/dg8urRjNaR9mBW0hJLxCSqn+4qc2d8amzQ+gTSuJBxWTV1AHnpLITuEUjiSEBNSAO7hyOyJO3dcQWcD9J3/oGDRR1ii5748shGlACbjaWaBuLgXlxwoyxGwLnZhrLkTbbJ15lzp/umr24l/+qBlrj3hmbtsyiT7OSKCd1TBff+TCZdRFY5CcyCHui+a8JnFhLCbBI++VfJPGc/HMR7ENTLiAqIDsSleHxQ0mGOsgyJ3K9ECYrt2/RKzSvf4nJigcr6SPYAg00G2/c966xUZQBSe5XZ562pkQkXZxaAF83ZfzJZdhFrDAhrLd5PnwQpSslMWHbGHcay3xAbK755SIue/L73GQ3a6JLA6/JXWENlEGH68tKejnfI038n/HEMC+5MkJ/ZjXIEQfc1Ecd
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190812e8-c702-48a4-c684-08deb647d492
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:14:35.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tPECrlYez/0diPgB8KEqgIzX6OX1rSIX/rFnnVUgnXymZXM6c6I5YrdI2+E88FziIcKyRPW+VRBpVCiV58UNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P192MB2129
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate15-hz1 with 4gL48L4fT6z3B3Q9
X-cloud-security-connect: mail-northeuropeazon11022116.outbound.protection.outlook.com[52.101.66.116], TLS=1, IP=52.101.66.116
X-cloud-security-Digest: 473151c1f05d137a546798fcc40fac86
X-cloud-security: scantime:2.707
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237394

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].
Pick pre-patch [3] to minimize conflicts.

[1] https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e87d0415413
[2] https://security-tracker.debian.org/tracker/CVE-2026-33845
[3] https://gitlab.com/gnutls/gnutls/-/commit/bd70e112d4d1f063223f0f0886aaaf33699390d0

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../gnutls/gnutls/CVE-2026-33845-pre.patch    |  97 ++++++++++
 .../gnutls/gnutls/CVE-2026-33845.patch        | 172 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   2 +
 3 files changed, 271 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845-pre.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845-pre.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845-pre.patch
new file mode 100644
index 0000000000..0eaccd5ba9
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845-pre.patch
@@ -0,0 +1,97 @@
+From f2f852f604d73f890f977bab9792fbc4c20adbcd Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 22 Apr 2026 14:19:57 +0200
+Subject: [PATCH 1/2] buffers: rename a variable in parse_handshake_header
+
+CVE: CVE-2026-33845
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/bd70e112d4d1f063223f0f0886aaaf33699390d0]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit bd70e112d4d1f063223f0f0886aaaf33699390d0)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/buffers.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 5d4d16276..705c77f91 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -857,7 +857,7 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ {
+ 	uint8_t *dataptr = NULL; /* for realloc */
+ 	size_t handshake_header_size = HANDSHAKE_HEADER_SIZE(session),
+-	       data_size, frag_size;
++	       data_size, frag_length;
+ 
+ 	/* Note: SSL2_HEADERS == 1 */
+ 	if (_mbuffer_get_udata_size(bufel) < handshake_header_size)
+@@ -872,7 +872,7 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 		handshake_header_size =
+ 			SSL2_HEADERS; /* we've already read one byte */
+ 
+-		frag_size =
++		frag_length =
+ 			_mbuffer_get_udata_size(bufel) -
+ 			handshake_header_size; /* we've read the first byte */
+ 
+@@ -883,7 +883,7 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 
+ 		hsk->sequence = 0;
+ 		hsk->start_offset = 0;
+-		hsk->length = frag_size;
++		hsk->length = frag_length;
+ 	} else
+ #endif
+ 	{ /* TLS or DTLS handshake headers */
+@@ -898,13 +898,13 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 		if (IS_DTLS(session)) {
+ 			hsk->sequence = _gnutls_read_uint16(&dataptr[4]);
+ 			hsk->start_offset = _gnutls_read_uint24(&dataptr[6]);
+-			frag_size = _gnutls_read_uint24(&dataptr[9]);
++			frag_length = _gnutls_read_uint24(&dataptr[9]);
+ 		} else {
+ 			hsk->sequence = 0;
+ 			hsk->start_offset = 0;
+-			frag_size = MIN((_mbuffer_get_udata_size(bufel) -
+-					 handshake_header_size),
+-					hsk->length);
++			frag_length = MIN((_mbuffer_get_udata_size(bufel) -
++					   handshake_header_size),
++					  hsk->length);
+ 		}
+ 
+ 		/* TLS1.3: distinguish server hello versus hello retry request.
+@@ -923,8 +923,8 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 	}
+ 	data_size = _mbuffer_get_udata_size(bufel) - handshake_header_size;
+ 
+-	if (frag_size > 0)
+-		hsk->end_offset = hsk->start_offset + frag_size - 1;
++	if (frag_length > 0)
++		hsk->end_offset = hsk->start_offset + frag_length - 1;
+ 	else
+ 		hsk->end_offset = 0;
+ 
+@@ -932,15 +932,15 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 		"HSK[%p]: %s (%u) was received. Length %d[%d], frag offset %d, frag length: %d, sequence: %d\n",
+ 		session, _gnutls_handshake2str(hsk->htype),
+ 		(unsigned)hsk->htype, (int)hsk->length, (int)data_size,
+-		hsk->start_offset, (int)frag_size, (int)hsk->sequence);
++		hsk->start_offset, (int)frag_length, (int)hsk->sequence);
+ 
+ 	hsk->header_size = handshake_header_size;
+ 	memcpy(hsk->header, _mbuffer_get_udata_ptr(bufel),
+ 	       handshake_header_size);
+ 
+ 	if (hsk->length > 0 &&
+-	    (frag_size > data_size ||
+-	     (frag_size > 0 && hsk->end_offset >= hsk->length))) {
++	    (frag_length > data_size ||
++	     (frag_length > 0 && hsk->end_offset >= hsk->length))) {
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+ 	} else if (hsk->length == 0 && hsk->end_offset != 0 &&
+ 		   hsk->start_offset != 0)
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
new file mode 100644
index 0000000000..d9af55d263
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
@@ -0,0 +1,172 @@
+From a6fc5c6fbfe10acd087cd233e73c5cfefbd2762a Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 23 Mar 2026 15:09:43 +0100
+Subject: [PATCH 2/2] buffers: switch from end_offset over to frag_length
+
+Instead of maintaining an inclusive [start_offset, end_offset] range
+when reassembling DTLS handshake,
+track start_offset and a relative frag_length instead.
+
+You'd think it'd be a no-op, but it fixes:
+
+* 0-length fragments triggering completion if message was 1 byte long
+* a remotely triggerable underflow and an ensuing heap overrun
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1811
+Fixes: CVE-2026-33845
+Fixes: GNUTLS-SA-2026-04-29-3
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-33845
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e87d0415413]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit e5b72c53c7d789d19d1d1cd10b275e87d0415413)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/buffers.c    | 51 +++++++++++++++++++++++++-----------------------
+ lib/gnutls_int.h |  4 ++--
+ 2 files changed, 29 insertions(+), 26 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 705c77f91..9075a2009 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -923,10 +923,7 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 	}
+ 	data_size = _mbuffer_get_udata_size(bufel) - handshake_header_size;
+ 
+-	if (frag_length > 0)
+-		hsk->end_offset = hsk->start_offset + frag_length - 1;
+-	else
+-		hsk->end_offset = 0;
++	hsk->frag_length = frag_length;
+ 
+ 	_gnutls_handshake_log(
+ 		"HSK[%p]: %s (%u) was received. Length %d[%d], frag offset %d, frag length: %d, sequence: %d\n",
+@@ -940,9 +937,11 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 
+ 	if (hsk->length > 0 &&
+ 	    (frag_length > data_size ||
+-	     (frag_length > 0 && hsk->end_offset >= hsk->length))) {
++	     (frag_length > 0 &&
++	      hsk->start_offset + frag_length > hsk->length))) {
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+-	} else if (hsk->length == 0 && hsk->end_offset != 0 &&
++	} else if (hsk->length == 0 &&
++		   hsk->start_offset + frag_length != hsk->start_offset &&
+ 		   hsk->start_offset != 0)
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+ 
+@@ -993,11 +992,10 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 			hsk->data.length = hsk->length;
+ 		}
+ 
+-		if (hsk->length > 0 && hsk->end_offset > 0 &&
+-		    hsk->end_offset - hsk->start_offset + 1 != hsk->length) {
++		if (hsk->length > 0 && hsk->frag_length > 0 &&
++		    hsk->frag_length != hsk->length) {
+ 			memmove(&hsk->data.data[hsk->start_offset],
+-				hsk->data.data,
+-				hsk->end_offset - hsk->start_offset + 1);
++				hsk->data.data, hsk->frag_length);
+ 		}
+ 
+ 		session->internals.handshake_recv_buffer_size++;
+@@ -1031,20 +1029,27 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		}
+ 
+ 		if (hsk->start_offset < recv_buf[pos].start_offset &&
+-		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
++		    hsk->start_offset + hsk->frag_length >=
++			    recv_buf[pos].start_offset) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 			recv_buf[pos].start_offset = hsk->start_offset;
+-			recv_buf[pos].end_offset =
+-				MIN(hsk->end_offset, recv_buf[pos].end_offset);
+-		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
+-			   hsk->start_offset <= recv_buf[pos].end_offset + 1) {
++			recv_buf[pos].frag_length = MIN(
++				hsk->frag_length, recv_buf[pos].frag_length);
++		} else if (hsk->start_offset + hsk->frag_length >
++				   recv_buf[pos].start_offset +
++					   recv_buf[pos].frag_length &&
++			   hsk->start_offset <=
++				   recv_buf[pos].start_offset +
++					   recv_buf[pos].frag_length) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 
+-			recv_buf[pos].end_offset = hsk->end_offset;
+ 			recv_buf[pos].start_offset = MIN(
+ 				hsk->start_offset, recv_buf[pos].start_offset);
++			recv_buf[pos].frag_length = hsk->start_offset +
++						    hsk->frag_length -
++						    recv_buf[pos].start_offset;
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+@@ -1104,8 +1109,8 @@ static int get_last_packet(gnutls_session_t session,
+ 		}
+ 
+ 		else if ((recv_buf[LAST_ELEMENT].start_offset == 0 &&
+-			  recv_buf[LAST_ELEMENT].end_offset ==
+-				  recv_buf[LAST_ELEMENT].length - 1) ||
++			  recv_buf[LAST_ELEMENT].frag_length ==
++				  recv_buf[LAST_ELEMENT].length) ||
+ 			 recv_buf[LAST_ELEMENT].length == 0) {
+ 			session->internals.dtls.hsk_read_seq++;
+ 			_gnutls_handshake_buffer_move(hsk,
+@@ -1116,8 +1121,9 @@ static int get_last_packet(gnutls_session_t session,
+ 			/* if we don't have a complete handshake message, but we
+ 			 * have queued data waiting, try again to reconstruct the
+ 			 * handshake packet, using the queued */
+-			if (recv_buf[LAST_ELEMENT].end_offset !=
+-				    recv_buf[LAST_ELEMENT].length - 1 &&
++			if ((recv_buf[LAST_ELEMENT].start_offset +
++			     recv_buf[LAST_ELEMENT].frag_length) !=
++				    recv_buf[LAST_ELEMENT].length &&
+ 			    record_check_unprocessed(session) > 0)
+ 				return gnutls_assert_val(
+ 					GNUTLS_E_INT_CHECK_AGAIN);
+@@ -1304,9 +1310,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_session_t session)
+ 					&session->internals.record_buffer,
+ 					bufel, ret);
+ 
+-				data_size = MIN(tmp.length,
+-						tmp.end_offset -
+-							tmp.start_offset + 1);
++				data_size = MIN(tmp.length, tmp.frag_length);
+ 
+ 				ret = _gnutls_buffer_append_data(
+ 					&tmp.data,
+@@ -1322,7 +1326,6 @@ int _gnutls_parse_record_buffered_msgs(gnutls_session_t session)
+ 				ret = merge_handshake_packet(session, &tmp);
+ 				if (ret < 0)
+ 					return gnutls_assert_val(ret);
+-
+ 			} while (_mbuffer_get_udata_size(bufel) > 0);
+ 
+ 			prev = bufel;
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index 8cf9a8715..689dcdc41 100644
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -479,10 +479,10 @@ typedef struct {
+ 	uint16_t sequence;
+ 
+ 	/* indicate whether that message is complete.
+-	 * complete means start_offset == 0 and end_offset == length
++	 * complete means start_offset == 0 and frag_length == length
+ 	 */
+ 	uint32_t start_offset;
+-	uint32_t end_offset;
++	uint32_t frag_length; /* used exclusively in DTLS reassembly */
+ 
+ 	uint8_t header[MAX_HANDSHAKE_HEADER_SIZE];
+ 	int header_size;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index e40a654a8e..702a83fc85 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -45,6 +45,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-9.patch \
            file://CVE-2026-33846-pre.patch \
            file://CVE-2026-33846.patch \
+           file://CVE-2026-33845-pre.patch \
+           file://CVE-2026-33845.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


