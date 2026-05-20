Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A00CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:15:11 +0000 (UTC)
Received: from mx-relay15-hz1-if1.hornetsecurity.com (mx-relay15-hz1-if1.hornetsecurity.com [94.100.128.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7230.1779264904815130635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=to1C/BJD;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.25, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate15-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.66.116, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k+e6qa79XuNVCnid60+KQMmMVbcHJLvo9MELHqP2ioY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779264901;
 b=pl15lHvdzIg0U2OjbV1Cw4EIP+R9bGcGpGIosYx+/e3HY0mmuplGxh+n9YmtRv198HyBjmYL
 Ve8qCtwq2j9r/A0xTTH8HWIiNWv68g0YDkp4mTzRLtmGalf76CI6tsn10iVQybCGg/5cNJxkTFv
 /wDQTTIeDAggSE4msmFXXAHWYLlALm2kHXZxMkHykZAhQg2n7dPkRMlcAhF3ePdXzpr9+I/8aK+
 Xc1883JoLMCswd/AFv4ucQCjoUvSyb3WQ3YFZtcQhaLo7k0HKCE8yHylL4kjUaXvG9Y8vCdMgYI
 U5GDvp3xtX4LbsBoU/+YYSBazsa2fY2vZi2hEDJDl7KMA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779264901;
 b=DygRuQcAJKjQYW8jFPxVnKo8KcLjjALW3w2Gzslm7PyAT0zPpqwtMpqAitAnWe9oafMwIbHV
 Dc4iWBDdpdDwOqFI+ggmZoPL18TLDPJJyACtcZEhYpl28F3/C8I/2cgyY4ZcUJji/Z2Nuz5G3Xj
 4+hssNgdudf7x8zJkFjdLTS+D9RQ9ZO31hAzBnusKa1ImaBF9Bv1gI+MzN6itUTO9/mcSlMBXVm
 oi9ssGJYtiyGxG8M3bRKPd+SH23qG1OqjH/si4qRjz4DW5gi7MGNI59hF3QY3Urz1Ocau16sS/R
 iHjxiuKXVf6R7Qj2JblHzmLp9iCRogA+N2PA0QdJMkeCQ==
Received: from mail-northeuropeazon11022116.outbound.protection.outlook.com ([52.101.66.116]) by mx-gate15-hz1;
 Wed, 20 May 2026 10:15:01 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbZEfAYtgAlxCH4RGG78DK0PEVErgDjG17hBPK3F2V4do7VyflCdQ/cVvE3ZmfP0/uT5ntBUpdaMl/ZcIwioc3DoEKNa/7yVQl/IEIJrY+rTMcwnAY/wp5kHcGhEbb/idbcVt09UiLUzadjruzguni0bowbYdsuGTdPaIPnpaeJG1cveGEUa4adI3AGe2RPYiE5Hwgx/jVwrJqGNFzJQLH96101VULg2uH1+pbBRn+zbSD9aleSp7UNBLUe/f20aIKTt9d5JsiyX6HCWmRxCgfd3Rwau3zXcWi2jHd8PV7bqMz11MW5TlHd1NaHT9WzYjCUsjtwt9wUf5mTUrTNPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+e6qa79XuNVCnid60+KQMmMVbcHJLvo9MELHqP2ioY=;
 b=E3VFxbUY/ERERiRnY6Pqz25uYjMS5sUcLcCzkbS9oIx0KrECmBmo398rkJLqvkGqtEEFBIFcc8+rQuwZwsDArajqXVn7L/mUeGzObPNrn3FIs18pZLp1/ts7SGApETdPqXIsdUuLMa9E8poYeHFGh4gUryjaJlNy/8Sf94efwEjsj3NTrfw72jpnaVe1Zydl285+rBLMgdz02gkJRDQLUNA+8W14eO8N/VsnLFpmNU9G1JQsnm8XwgDMpMIWsgqUZQlpAN/AMfaiVArPJzikpsYAV/g3yrmpvksoQw29jvQeIxzqHFnyK3CMPJaSROLnB+wRLJXOfsTL3tCIVI2+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+e6qa79XuNVCnid60+KQMmMVbcHJLvo9MELHqP2ioY=;
 b=to1C/BJDxeIkJOS830pJXxbCq192aK3fn6EyjHIvsue89eHjQrTxvZlw3lPGfqKFpcZtDDw3euxMRA4vZYnIPfpucMzc64tFa5oOWnzoMoA68ZEd4kvS5C1pieASKuBMDFCt6iLDwZH/9rScUYV7b5HeOZwGjmAol9zs02sEKxoKS9SyEGtS30Y/bD8oNYHfkLo3UNURiKL4IGAQct/OACAA+bg7RB82lK1MtewMSrFbjCXr+2sRQNbCKcVcXaWd/QhnoC4h/xqXwKUYyxWOqdZqlHCu+qQbFqJGVb7eDdGK7Lhb/IepQ8oJ24C+F4Sw0T88gZebVFb0RPYUPREvvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB3P192MB2129.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:439::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Wed, 20 May 2026 08:14:47 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:14:47 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 7/7] gnutls: Fix CVE-2026-5260
Date: Wed, 20 May 2026 10:14:03 +0200
Message-ID: <20260520081403.3052797-7-hsimeliere.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5b0ead1c-6779-440f-bfc3-08deb647db58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|52116014|29003799003|13003099007|56012099003|22082099003|12006099003|25016099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fTkKaveeMFFJcftjcwEL2zq/mexvn7E9qY4JmyznHsNDC9Ut14fVjif7eYeiKD8RQSc+f8PfDU4dwbUrzgol4Hg/xfeCOJOt2daU84cyBnOj5DigI6CSJbp/6Le4w+NiGWKrZyZ6vMVi7TmvZzFbkHZzOhjz0p07tUWV2RLxUEl62mb8JFOnUs5Llz47js0Yj6u5SCZhalv7kovCpeOFurVU9ucxXVJfcS7/N/BTh5/UEBGtbfhn+PLS2yhR7nfJCrQ2tYMk3tlndYnrIWM05k8lDPvJqO/ehHq+gM3cwVc5rusdh6oH/rUOIwCCqizDft405XoLtqsv4UO60laxJYmWGkQd8eUUur7CasFjkqWJ8lUTjXH4Nv3XSN4qzs4G5XrwQOS0OzMFcL2KBJtdR2FOIIpAwQlYCvwTUYPXOP9eV67+KgqRfa3JCvHmE44CmjfpfLj+COR0Ni8RD/LBazCYhE5z7g3eC9n38dhyCRv761yg5DA7xB/Ij2IWmNvtQGvPaZwdvYWQSWo/jKzMHnWPKALyOR6V0fYXi6u79i4VDsY6QZKxYunLHJkXBfuSGjYxiMNGnKx1v78Ow/pYGS4HQGv4M7zddIVp0KtxnY4vayZQiewHTBY+nVIBj2tmb/3ebeCy8O4usL2TJHieazB6qYHO/YZQRc94HzBNFy8doVRxsr6inH7kwo7kdJJ0GYVuSiNhxnKrM10djflLMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(52116014)(29003799003)(13003099007)(56012099003)(22082099003)(12006099003)(25016099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6gymmpKSVqoDrY7aSunBKGAeST//LPU7mIGbUpBSsczr9iGl5sjkvU2mcOHc?=
 =?us-ascii?Q?pe/ThMYvDgec75HuQzDR3PHtq/eR2/ySwFau41WYP+x7NfmuZNwi9ZxnRK2Z?=
 =?us-ascii?Q?vJlaXnO3NY1tlbnuGIQIdyZdbzmAku91ErdzptRN7rDHy4RN7yxs71+eHzBy?=
 =?us-ascii?Q?bqSI4xzjZRvTmcwYsKBK/6TcljRui65KN2vZ/csVSSfLsuj4N6vLOhrNSOo2?=
 =?us-ascii?Q?eoM/FdOLSJ1tX12AaJ3K8HNAz+HEF2frPv1uNSWK3OtI2LDAwY16FwBrPwdQ?=
 =?us-ascii?Q?IsE+vUdDLFbWXQ6VqUr+dHSq+a9nN4nQj1wDdDBPblXTKNp6+jhWdH5Mhp/x?=
 =?us-ascii?Q?Eq2Hl1Ff/8RQxVQ4IhigWU4h5+NoCEyS0Q+SrRGRH3J0TK2M9VutMaB1iLhG?=
 =?us-ascii?Q?oJny0mMmpt9hMqSOJbogerZ3QMiJKfAxNLuutmlOtZ1TQazPB4hK05H3aady?=
 =?us-ascii?Q?x/95d9aZDCR0BDATzS0R7k/yrJzpiXTKO6gFmLHj/Vh8UO8SrB8lMwlgb2oe?=
 =?us-ascii?Q?rfueSja1y4NUNQ4l1rAq49a3uzb14/XZTFGlHykpFFmDKwgL2V8yki244T0q?=
 =?us-ascii?Q?LPStsxPRI4PiTgltly8YljNg2weyNFNMEFw7dQlDmyAATRJybGHwt/bab7Ly?=
 =?us-ascii?Q?uHRuUcb9etFdnGbrewXhqo8UQuk9dTVtr8/OWQwMFJ8QmWwk7hbmCO14t/gl?=
 =?us-ascii?Q?+zU/dyOz0IhKpmg6pzRnQBuMa3ls4fMyS5l8optaK9QYSv0QPrjoZIMGA5Wy?=
 =?us-ascii?Q?KTIS9LYxiMukm+HKZAoPZ48x+E1GvHI7p0zQ5Kgljr0BLWT7Z9+0WLabr4kX?=
 =?us-ascii?Q?MeGMk0TbotNADuIoXSxdcylvzE+Rj8efYGNoE+hFx0SbAaFS6dbncu467vtF?=
 =?us-ascii?Q?KhHwB3IXcWTrCTCQoSk5I1vQNEd27PG13vAB8wDK3qCxLMRdPvBIntKXY6A7?=
 =?us-ascii?Q?f5hLS62kxcOrH3EIMB9FJfdO6g5l5ciuv4LyQgwahFHNnyaau4oFOSGGaxK7?=
 =?us-ascii?Q?kYRjH+YFJs3pMmK5II3D/sKcyY3zKYvdJYPrbhtJCWzVwh7rk8XuNsoKa2Ad?=
 =?us-ascii?Q?R5ybS/YbY+aoYzG9Qn3v/+i8UQRYAz5slVc9CIAwu6uUffy2rjlVlgSL1x8T?=
 =?us-ascii?Q?KYOyobyxoXjJ2Q1z+EHEep00eUS6u3mMcpHoLBKZtxCtYU9ty9kidB85VPb0?=
 =?us-ascii?Q?LiqerLrAE6Yx4+8tgaHmZdbaAM4qgQbwcP3piACcPneLHiiLQhPwoEVbO5ES?=
 =?us-ascii?Q?w1y6Vgc/TkmzCVOe/OvgV3Jzd3Fsusrg54/lMH9Dp3ar7os8j3nijCStI8Ar?=
 =?us-ascii?Q?pFB8kvX8YL8S9X6n5zOLKEr4/1criy64PO5nuRyoa62B9ruS9R2CFqnccfT/?=
 =?us-ascii?Q?MzGFvQvlwhdH+rzBOr+U/lLd8bGr4PrAX1+3WI84vLH/adUuqmTZUTnqfFto?=
 =?us-ascii?Q?Tfcap62Frvsj3+B0vQkSMkQeRJAhDhNFPWwpML3IafSI4EGcx8oYRK67Ev3D?=
 =?us-ascii?Q?5XyknYmwxc1V5XbhRxzWQmCRw9RThmOgaYgUGgn5eS/04Vc6E36JzXhRGHim?=
 =?us-ascii?Q?BUy5feqcnfIDpZTpzLMGN4YaDzLOKU2aAM07lxemaGCkzmQqH7xWPojNum9A?=
 =?us-ascii?Q?5nB316jABRysNQp0AEoIk0Eplk31ErEkROa4sNKgH0rG7fTFsvaw5agZC5Iu?=
 =?us-ascii?Q?6qFF9btFl656LVAMy0D5b+D+A/70XByY2FRAFEOa4Za6aU6RCTsn6XYf+vWL?=
 =?us-ascii?Q?Y3KK5hRmXim0XMgiFKC1MqJgtefGyiI7CGCBUggt5azSnRDgRnWwqcTnQtah?=
X-MS-Exchange-AntiSpam-MessageData-1: uasmPHt6d9SBOw==
X-Exchange-RoutingPolicyChecked: 
	jNofC72/ntfWC4OQB6EWA8uyb8IfNQ6W2MmvFNt4k/IcnZ9Zmjg/+CcKY7HEHalO2d1yFuHJOnv/6gxqdNF8q6JP/GJjw9FkrWxYBxHshkG5m0PApA7BBpK+WB3IRL+5PM0WBbgYc6oQdCyHKLMWd0aMlX06u3QpbmNgqkfJuC/mJoqkbkFLeKywcTXROGTRUp2u9GLdDg5Z1hYYBnz0r4WSrugzDePRqJJk7/rBwvL5UhsCVJkzMmVzd+XlwwL4tfB37VhcLnLViOxUAFEtPqB/YZyUf+R/JcyAOpkpEcT0sBETWqO8uWfXcVZo0A0XndnenTbt5U0wP5RD06XNEA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jkmUhSLX8v5BAbHq3hFBf/8U6iQtYLpNnxPMjXMygn5EYVvVlZrhJ7ePlMRNGPEQ+zww2T4j4sHxFBFy1qFQPRjZSBtXazD8rLDjMEOrEYEUkSY2mrlw3OQtF9n/Y0xzmfASAulPrK1YMZZLXWnS6d2S33DbhL3wp3ExLLOb1M8JsIubmTapFq8bywSc9vcY8Ur091oOAswAtu23y1g5HdYjkNye5dodfDo3Nd0sIG7HWAFGLOPQzeLnxjvYT+YCuziK+dhGwH1TkWuH4fO+NKVogbVipWxM4iTbEcliyYhyrVSJfaeQqou8KgCpwoklvZUw98pRM6/ZH2kJCVOh0ZOfVh/3hibTZoBzA4wd5KyIrsCqrxOnyspnvAmtfS+O0dUYsWcxrN8S56I7hQuEKK8YQZKTwxlLeGvTdfJdwKtrQidSeMNRXm49lqfePpVm8GzTZDug3E22xza8iCQEHCmfS3sDIHlbIHqEpKKg+/BSijsLtby2MKq/MKDm77ntACI+DZA5pe8MGPIdYrMUvLUoLxZKC3BdL2A9/zwEF4Bbc+lKUJ9B5r1yWp2yfZBEjTj2nwSY/3zV92mRYgYTXp9Y5z7HY/J0+dn2mR0OBDpNwzrRbMiMqRd8aibEqKYi
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0ead1c-6779-440f-bfc3-08deb647db58
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:14:47.2766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdCk+/bu9E1qaNIGQQ1XXMkU2pT8ozmnKLpCipxtFOLTFKzCgivLXXUo4s3rAmPxPD37iglSle23lsa10nn3hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P192MB2129
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate15-hz1 with 4gL48X53fvz3B3dS
X-cloud-security-connect: mail-northeuropeazon11022116.outbound.protection.outlook.com[52.101.66.116], TLS=1, IP=52.101.66.116
X-cloud-security-Digest: c509c68203ca4bc336a649e11573d0c2
X-cloud-security: scantime:2.783
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237396

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patches from [1] and [2] as mentioned in Debian report in [3].

[1] https://gitlab.com/gnutls/gnutls/-/commit/77228f2d1ac207d2f894e5a168fbb47e5378e42f
[2] https://gitlab.com/gnutls/gnutls/-/commit/cf6bdc5e4df49e5583d3fb4d2296779785f10683
[3] https://security-tracker.debian.org/tracker/CVE-2026-5260

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../gnutls/gnutls/CVE-2026-5260-1.patch       | 78 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-5260-2.patch       | 40 ++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
 3 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260-1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260-2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260-1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260-1.patch
new file mode 100644
index 0000000000..060440e8b7
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260-1.patch
@@ -0,0 +1,78 @@
+From a39a21031f9e56d31747b060f83fb49d1a77f0c5 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 30 Mar 2026 17:31:07 +0200
+Subject: [PATCH 1/2] lib/auth/rsa: check that ciphertext matches the modulus
+ size
+
+A client sending extremely short premaster secret as part of an
+RSA key exchange could've theoretically triggered a short heap overread
+to nowhere when the RSA key was backed with a PKCS#11 token.
+With this fix, the internal decryption function will not be called
+with an mismatching plaintext length specified, avoiding the overread.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1814
+Fixes: CVE-2026-5260
+Fixes: GNUTLS-SA-2026-04-29-10
+CVSS: 5.9 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-5260
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/77228f2d1ac207d2f894e5a168fbb47e5378e42f]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit 77228f2d1ac207d2f894e5a168fbb47e5378e42f)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/auth/rsa.c     | 5 +++++
+ lib/auth/rsa_psk.c | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/lib/auth/rsa.c b/lib/auth/rsa.c
+index b5ecc092f..24c1649be 100644
+--- a/lib/auth/rsa.c
++++ b/lib/auth/rsa.c
+@@ -158,6 +158,7 @@ static int proc_rsa_client_kx(gnutls_session_t session, uint8_t *data,
+ 	int ret, dsize;
+ 	ssize_t data_size = _data_size;
+ 	volatile uint8_t ver_maj, ver_min;
++	unsigned int key_bits;
+ 
+ #ifdef ENABLE_SSL3
+ 	if (get_num_version(session) == GNUTLS_SSL3) {
+@@ -180,6 +181,10 @@ static int proc_rsa_client_kx(gnutls_session_t session, uint8_t *data,
+ 		}
+ 		ciphertext.size = dsize;
+ 	}
++	gnutls_privkey_get_pk_algorithm(session->internals.selected_key,
++					&key_bits);
++	if (ciphertext.size != (key_bits + 7) / 8)
++		return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);
+ 
+ 	ver_maj = _gnutls_get_adv_version_major(session);
+ 	ver_min = _gnutls_get_adv_version_minor(session);
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c
+index a14de467a..a1da1b320 100644
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -257,6 +257,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 	ssize_t data_size = _data_size;
+ 	gnutls_psk_server_credentials_t cred;
+ 	volatile uint8_t ver_maj, ver_min;
++	unsigned int rsa_key_bits;
+ 
+ 	cred = (gnutls_psk_server_credentials_t)_gnutls_get_cred(
+ 		session, GNUTLS_CRD_PSK);
+@@ -313,6 +314,10 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 		return GNUTLS_E_UNEXPECTED_PACKET_LENGTH;
+ 	}
+ 	ciphertext.size = dsize;
++	gnutls_privkey_get_pk_algorithm(session->internals.selected_key,
++					&rsa_key_bits);
++	if (ciphertext.size != (rsa_key_bits + 7) / 8)
++		return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);
+ 
+ 	ver_maj = _gnutls_get_adv_version_major(session);
+ 	ver_min = _gnutls_get_adv_version_minor(session);
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260-2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260-2.patch
new file mode 100644
index 0000000000..32181e45da
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260-2.patch
@@ -0,0 +1,40 @@
+From 9b58b5237713d2189192aa8591b337787ee2edff Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 30 Mar 2026 17:46:40 +0200
+Subject: [PATCH 2/2] lib/pkcs11_privkey: guard against overreading on short
+ ciphertexts
+
+This is an alternative fix for the callee side.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1814
+Fixes: CVE-2026-5260
+Fixes: GNUTLS-SA-2026-04-29-10
+CVSS: 5.9 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-5260
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cf6bdc5e4df49e5583d3fb4d2296779785f10683]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit cf6bdc5e4df49e5583d3fb4d2296779785f10683)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/pkcs11_privkey.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/pkcs11_privkey.c b/lib/pkcs11_privkey.c
+index 5093a6d56..369b034a6 100644
+--- a/lib/pkcs11_privkey.c
++++ b/lib/pkcs11_privkey.c
+@@ -826,7 +826,7 @@ int _gnutls_pkcs11_privkey_decrypt_data2(gnutls_pkcs11_privkey_t key,
+ 	if (ret != 0)
+ 		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+ 
+-	buffer = gnutls_malloc(siglen);
++	buffer = gnutls_malloc(MAX((size_t)siglen, plaintext_size));
+ 	if (!buffer) {
+ 		gnutls_assert();
+ 		return GNUTLS_E_MEMORY_ERROR;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 0b3abb827c..a4a6a5fe21 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -51,6 +51,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42015.patch \
            file://CVE-2026-42014.patch \
            file://CVE-2026-42010.patch \
+           file://CVE-2026-5260-1.patch \
+           file://CVE-2026-5260-2.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


