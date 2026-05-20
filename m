Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4650ACD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:14:51 +0000 (UTC)
Received: from mx-relay15-hz1-if1.hornetsecurity.com (mx-relay15-hz1-if1.hornetsecurity.com [94.100.128.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7299.1779264884996324647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=EKreHigr;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.25, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate15-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.66.116, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=SyU8vgZ6vikNZTlLwMudSX/KH3CHBswjV+UaLEvrZ9c=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779264882;
 b=a1hpcLp87PZQcIrt116xV42wUc4hu1r+ei5dWXHEieBRg6vW4ShO7ugk8rFE5ZRdvb1gHmEh
 9B0G/P530XYVMjLygJAiVHBLv2/e/uOcORyj6gbCjuZW6xZxDMbuGM02L/NpAZSS8lgtj6XpSyQ
 6wep5YrmLmu/OPtAaUqmbhm3Pjn2hUIObpEV6G2uW/ArxtXAcn8nHlYKHDNZ+M8e0WRM8teyNbl
 nrrKJOelA4Yg+F4AdbVtFESN/Pw/S6FoFWIKrgpWpmN+Ewp/3rODWd9surg4wS8S4f/+2hEKDQJ
 JfHVWpE2+vae7AlExJO/w/h5N2mP+6uOzBOfyX1ljzssA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779264882;
 b=ryvRtHAaXkn9zpbvKrPJF2J+4xvx6H8zSBNTOy0R2yf4P9y+bwH5dO1ALmendA65wurkg2uH
 DjIKFV6mV0UNUa77d5dthLjCLz2ezIu3LIyak0DdlicZY/Z6bx0iTxw6CmelI12paMLe80S+87f
 5v3cPwB8T/94QnGmrZOmlCQDlQB1bJTVSH9gn+rIm/T3igXJN0kQOfa4LpV1m0N4JjePCjKY4O5
 5JXXL5pIjB4H78RtMnZ+gADxvlFJsSBIQN64hHKevlY6N1swBkzpWRf4kq/2BD8EaHP76kS+RT0
 4bFEf8vrDr3c/6mSwMq0RX8UhBaS8yp3UyKQORJ5+U0EA==
Received: from mail-northeuropeazon11022116.outbound.protection.outlook.com ([52.101.66.116]) by mx-gate15-hz1;
 Wed, 20 May 2026 10:14:42 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X52BQDcjSEWs0JQ/4vCTjRaubwMOPUNs0VI1PQQBm3k3r4/NbY4j3T0JCIqEEZE9i2ZNkruDZN3fZ+6xjOKUWoHo75fGMFHTqmMXdszJnzVyUNhfYf9nE/bpVc0QN8+DfuyEYOl6NTUJFqAZOBWtv1eb0FSXqVZlam+iI4COKmcQoSBrPPFZfUGh3z/xV5WL75s19u2WPwlmkUgjivr6V/PD7LbcXHDjBHjQXMBKWtEABrJMGifsszlHxsVjQA+N86E0luEGhBjbZfWYAmkAtzwgACvAY4P+U5awi3S4hImwtjipVpNeu6bhFDyjAxg8bRKKK2NO+i4FzqAfRyGZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyU8vgZ6vikNZTlLwMudSX/KH3CHBswjV+UaLEvrZ9c=;
 b=EWPseZGzR7QOu8pDtDg1UU+JILp5LGgfYOBXZ+TWRr3ylu9U8ctXM0HPnrT4b0Lpx7RTofe5cbIXRrVrE8tlFAtSujrFyP2PqD4wFH2pRBbakF7Y4tf0VVyj+sthx0Q65Z0RqhZ8JY64skC0Y/FZ3qe0JHX7WGkEKTjYXzPv4OBi6ze76Rh11loCg0CmqQXbq33mqfCUOFZ639GUTtcOE+SDxRFWnSOBk+VvKfvr6Vd6S5wSCsVkdpnkosqVc0JaxonUVXSd1mvMcHzs9/TyRuzHV+X/tUlBvo9byv1Ym5Dg4fnOPntx/qUP21u3k1D77Q9M++irvOdLw0vzws3OZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyU8vgZ6vikNZTlLwMudSX/KH3CHBswjV+UaLEvrZ9c=;
 b=EKreHigrWikErQaIssT4vuz5ZvYEqgGQRmW44b2Ml/qPmWfn7u1efQZGyDk0yKoMc/YJz5gTHWYLYLC365NkxjzdF8FZHCqV01XV6X1vD4EAx8b1oFaTn2yE4LgCoYc6Ahs+GJIGQ6tcyzmWYKTSmEhhWrTiQHb/9S28+cOUmoZihVG7YpKz4doadOhs07XalWmCfV2DQHXiKGKnm9aDluYjiPi7+7fkHX2VcZsbh2gzaZ7TJqyEmoCTIj8mnVw0x5kJoObcixq1kykjlDg/Q1wizrFO9EtaV2eLBcox0Lf52Buhs7H5Mtk9EvyeiSEZZXtsnsOdT343N+YFZPWHRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB3P192MB2129.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:439::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Wed, 20 May 2026 08:14:30 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:14:30 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 1/7] gnutls: Fix CVE-2026-33846
Date: Wed, 20 May 2026 10:13:57 +0200
Message-ID: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0410.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB3P192MB2129:EE_
X-MS-Office365-Filtering-Correlation-Id: ed039cb9-a838-485d-31ef-08deb647d127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|52116014|13003099007|56012099003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	IHS5oAolE7nOTq1hzOsowNwbbKPoJhvDsiWJHgxK0DFy+Ln0uK3467sHUDKE2E//N7kjVUSchzliAWq6trzHrEmLgyt+vYLe8De0PJmrTQW/nJl1DrCsjbChxwbdFH5fP1RHwPtS9UYKurD+iacH7To0d5ZplWMx/xFJjfNSbXAUt6HtGeUmi82T1ygRskVhkgJCHZ0gEqZgm8G/SOoGIiRwb9haPUZhDWglxjzgJviN6OmqJH48xX622B/4q04Sox8YZ/uM+aTT0oOQPwDH4s6C18vyB4DzORIO2a6m+ugRPReFXHlUGI08aBjrAF7UC8n54iPhF6tzpdqVchIejnilWN7QQQyTvmeGykVpKF246wEWsY5y1KoeDByLzrAF8dCWsdeOZCG3W/vsHyU+THhZ7bt2ZMI2Nwa3ArXqfrY1hEIBiePGugR8CcvEHnx+0jDF8eyJKZ5LrN9/TtSZgj7DUJB6+gDMsGMc4a6uqlelH9mgOAKNzp8L66jWGCQY0bLbXWj9nfOzS/LxuIK23gvH5jMStXcjCsZY+CuUulQ5NYr20wRAhKVzZ7bIWOd9avLEQ19nCP1M4mUW95Z2CARKsfpH+Ow/+tHpWDcQuPsXQudYLniksYilgew0ursi87b/J8J37SGetkp7BGe4DoBPfvhen5hs0s1W4FdjfrylFW4ZaC/D0E334akW0zDjNEVex0SI2kZa0RCD//S21g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(52116014)(13003099007)(56012099003)(12006099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9uq3ENnEBtJJf8VE16AII15P7+tQL8OuHqhcSb4uT8iBPXY/3unDn3jtWDYk?=
 =?us-ascii?Q?PvDKgw+EYSzJshh4vwtvuYkxWYJ+Cv+W82pojdKzF7ZA5dgLOshAAMHiygfw?=
 =?us-ascii?Q?jj5bB9mon/+WQcI/Rm27gK/lgh4e2LwiJ6ZbgMr3qnKbU2Ky+8oYrmMF3UgL?=
 =?us-ascii?Q?+GFMrPgB9C+yby1yJSe0+OmIzkdx6ORdPguxITEn0mnF36nFwVH69EvO8Jbb?=
 =?us-ascii?Q?FZy0TVmUT0CQEB378E8ZHykztvfaWEidOpgONCQIvVpBz1SsaULGSQvIYkJs?=
 =?us-ascii?Q?/4KeINbNX0JKLKOMGO2a1lWMO7h2pPoAaZ27TmMcw+OB2PSOx1DiuQXXGC3w?=
 =?us-ascii?Q?JQsAekDfOVMIIxT8kRuwUSAFKubQDUqY8jTECgEtnHgaAF/oX+yO9M5xuPly?=
 =?us-ascii?Q?aVhUrE0tiNWTchgWwZ05IOT5o3JJ0x/707Zdwv8nKdOmTYjl7dQsCk5oqQxL?=
 =?us-ascii?Q?fio3yGZO0pIh9b4cTkUUv/qkdXXNTV6Fs8xj54NoQopOt1+YBs3ZC4a2Eezr?=
 =?us-ascii?Q?l8gwwnmvDccsVnI3ippDzjXLqyngQlLCmTjTPU8LKbcsxGjnNt3Yeah1KWgy?=
 =?us-ascii?Q?Rk8fh3o74jK2ODHl2fA3xayEatYQDwrFVwAFRQj4/gENSTIG/DCCaC0192O1?=
 =?us-ascii?Q?Pi1r7U/P4p+kbRB8D3TAB9TxQeWaFXqQv70tHp90KePDXYAlMVgwqzLrFkVC?=
 =?us-ascii?Q?Og9wtQukhnnPhxfdLCFkkhAjtQlzu6BvEf8PVwN21zj0xvnyaGRS6aHdH6Xl?=
 =?us-ascii?Q?I9sB7MtHTQGkKj+DmRq+K7USB7LiHAvsy7CVaxylk1VIvSRyIbtTkfCMRZi9?=
 =?us-ascii?Q?na3j2utufXaXfw37/z/lGMQy/MIW0+4+R96wFPyEasz8BNzE2l67rCQgFTiN?=
 =?us-ascii?Q?WnFIaj6lXdhdiKABODx3qSf1HnbanQhiktyYf5RKLWuKo/QbmFKkP/aPB8rD?=
 =?us-ascii?Q?RkQAW3RB6vW9WlST1H5LYRW/QOr+URm9sTtMTFnFzCZ07J6UeA7eH5Jmj+4n?=
 =?us-ascii?Q?hnY0SKskwhBSGSO6o9gwNcSmSWJrXliQLXveAzOmjfhKoWRlADeR3gJSUFBO?=
 =?us-ascii?Q?67o699SAClf0dfogBkNKz12ATC/Ci2rJmSE+tN+itQinlE0k8lPloy+yc63k?=
 =?us-ascii?Q?QL7aopGYpC+WROch8YVZwuZACYR7q/1Y7l96Sg7q79/Do1sRCccryO0/avRy?=
 =?us-ascii?Q?nnc48XnCLxmCP87wBMT2eCZ1wwG/yW3lnCNH6mPgJXFqatosD5zQUTLQrW0D?=
 =?us-ascii?Q?nTFOPAZEzY7b/36EkNbGjMAJEzld0bP0IewjHdmcQfK7fwLrGjfC+t/l3ffB?=
 =?us-ascii?Q?XyLU3/ekH/EsPE0jk9auXkaI2r0FingnISOfZX0X1HwMoOXDHerpja1fJKgS?=
 =?us-ascii?Q?UEwrG5rqo5O2s8s8QJLGj/SRRhZ7GMzBFaJcCLY8MKDDVtobKG3i+j8eftht?=
 =?us-ascii?Q?Fh/ViKg+b85k4mzSGMHy6aemDyvbYxsFhy2WL3Mdax7KpqHTU7iu2+or0taQ?=
 =?us-ascii?Q?hx2t65ngREUArFHPbp5HT5aaYdghgN1FqWVe+scNL2sGore1A6owuygKkKW7?=
 =?us-ascii?Q?l4qVaycoEVzWWF3R8F67hqh7EiGZG1qYUi1r6TFSWf5iey2oCWGWHHjyDlAq?=
 =?us-ascii?Q?A0el/h0A2846poiulLkJ0Zdg42LErhnrydDN5L3F5pDs93Xdw03DKuJD6UAW?=
 =?us-ascii?Q?9E01nFAkYc9xMSWs9jbZDjGJilmOEssIPw0JCcbBrad87IXqg/Woq/8VecTN?=
 =?us-ascii?Q?zzZGw/Gu6szlpJ0+qn1Zr4Hcy71ln8rsIpnwTPexW4AmzMNUlgNDr23CH9fW?=
X-MS-Exchange-AntiSpam-MessageData-1: Fvnj8cw5wyb/XA==
X-Exchange-RoutingPolicyChecked: 
	bI+RT1M7wHQUVZn9Lw3+IEioZR9EfDfYnSKL8gm1WpC9+JASAN4gp0aKFHF6YIpjXdmfKAfNamZAYDZwfmu/ftJjJYrKd4COfXWRpYSAj2rtQ8qIs9ehFm76YrR5JAEJ/ZhZ0NiN7hW4m7kV1yjWi1BVAmwohu7V1aw2b7CbrEN7FwQWEe3qBJ3pO/O3HoM2leXcP8L+BQgCIG4OcwrcEP0cdGRv3/CQM2m7AmlZIEpTNX0D0B4Z243FZAwXyyocec7ImAiRzgBC9vLLqIW6yYZ8VPefQT05PYReeO4WVKTYoSyrNPK0hziDu1gTT4z0xky/FdNjklWYCIK/JTuJDA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Ne+dqINYnqN7F4wrMBztUP1kcIctBk0YNNNYu8b6Bs0Nkw+seusOf2bRUQWosYaOWgidER7R4vt3XFkB4NxN3ohP6FDH2df95LV/rjO0wURhBuSjiZ5KcwvXynQQ22eiX3Bd5e6oDpPdeYAhIbas6mjPT6wG8IF0pSPf0ei9KsIh6hKjQePzr1YvlihysysxlAYA8bFuLXGNnk6tQ4Nu3L1rf82arvTnOi9ZQ2bBZKZhLNsfUwfwu7jRlaFDKBtVb75rCIP7z7ie+qdcaO2Bfc9tbiF0YHn6p/ZeFcudYECsB6n/vC2g4eR3mOTlVal4GJfoiTlbMvigIwqezEpHKOdzBtnAkKKBfBlMYLQOmsdIWYW3ruyYl0ELRRI2iMVk06BRoJcTKeDqCssiAixUCIdfbHcc3tos2m8SWHx48R/hcL7DjmW+45dbm5+g9m9n8PmcuyJ+Q7B4oP3l1EGE59LFP8ys2feAzyeZA1UFrgzG3XFPJhRCnGAuB+kEddkrDxjzvSc2CE8RcTZCOYaq9G92V1OAtYu+hK3Ba0thJ4B/4mlvbJSxSghNraFaFk0hZ7IgqWYHa2MMLw/l2I4A+z+18exBlg+3hKnc34EYqBSZBx5ytIaEkuDbdkyPENYW
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed039cb9-a838-485d-31ef-08deb647d127
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:14:30.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxim90RfcbB2EUmQyXyaiywvQyOIkiez4FT+QxXFf80B1n6HDKfMVw13uF8Os8KexKlUyITFSTjwqbr86tpmGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P192MB2129
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate15-hz1 with 4gL4890P24z3B3BK
X-cloud-security-connect: mail-northeuropeazon11022116.outbound.protection.outlook.com[52.101.66.116], TLS=1, IP=52.101.66.116
X-cloud-security-Digest: ae0310881f33e93694ea29e9bfb5740c
X-cloud-security: scantime:2.475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237392

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].
Pick pre-patch [3] to minimize conflicts.

[1] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78
[2] https://security-tracker.debian.org/tracker/CVE-2026-33846
[3] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../gnutls/gnutls/CVE-2026-33846-pre.patch    | 97 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-33846.patch        | 67 +++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
new file mode 100644
index 0000000000..71266cb338
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
@@ -0,0 +1,97 @@
+From e51ef765b942968949e29797a73727c371397eea Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 17 Apr 2026 17:49:31 +0200
+Subject: [PATCH 1/2] buffers: shorten merge_handshake_packet using recv_buf
+
+I had vague concerns about thread-safety of this,
+but then this pattern already exists within the file.
+
+CVE: CVE-2026-33846
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/buffers.c | 52 +++++++++++++++++----------------------------------
+ 1 file changed, 17 insertions(+), 35 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..d54c77022 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 	int exists = 0, i, pos = 0;
+ 	int ret;
+ 
++	handshake_buffer_st *recv_buf =
++		session->internals.handshake_recv_buffer;
++
+ 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
+-		if (session->internals.handshake_recv_buffer[i].htype ==
+-		    hsk->htype) {
++		if (recv_buf[i].htype == hsk->htype) {
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		_gnutls_write_uint24(0, &hsk->header[6]);
+ 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
+ 
+-		_gnutls_handshake_buffer_move(
+-			&session->internals.handshake_recv_buffer[pos], hsk);
++		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
+ 
+ 	} else {
+-		if (hsk->start_offset <
+-			    session->internals.handshake_recv_buffer[pos]
+-				    .start_offset &&
+-		    hsk->end_offset + 1 >=
+-			    session->internals.handshake_recv_buffer[pos]
+-				    .start_offset) {
+-			memcpy(&session->internals.handshake_recv_buffer[pos]
+-					.data.data[hsk->start_offset],
++		if (hsk->start_offset < recv_buf[pos].start_offset &&
++		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+-			session->internals.handshake_recv_buffer[pos]
+-				.start_offset = hsk->start_offset;
+-			session->internals.handshake_recv_buffer[pos]
+-				.end_offset = MIN(
+-				hsk->end_offset,
+-				session->internals.handshake_recv_buffer[pos]
+-					.end_offset);
+-		} else if (hsk->end_offset >
+-				   session->internals.handshake_recv_buffer[pos]
+-					   .end_offset &&
+-			   hsk->start_offset <=
+-				   session->internals.handshake_recv_buffer[pos]
+-						   .end_offset +
+-					   1) {
+-			memcpy(&session->internals.handshake_recv_buffer[pos]
+-					.data.data[hsk->start_offset],
++			recv_buf[pos].start_offset = hsk->start_offset;
++			recv_buf[pos].end_offset =
++				MIN(hsk->end_offset, recv_buf[pos].end_offset);
++		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
++			   hsk->start_offset <= recv_buf[pos].end_offset + 1) {
++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 
+-			session->internals.handshake_recv_buffer[pos]
+-				.end_offset = hsk->end_offset;
+-			session->internals.handshake_recv_buffer[pos]
+-				.start_offset = MIN(
+-				hsk->start_offset,
+-				session->internals.handshake_recv_buffer[pos]
+-					.start_offset);
++			recv_buf[pos].end_offset = hsk->end_offset;
++			recv_buf[pos].start_offset = MIN(
++				hsk->start_offset, recv_buf[pos].start_offset);
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
new file mode 100644
index 0000000000..e7d5cc6c2b
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
@@ -0,0 +1,67 @@
+From 68e0c900c1111206fa4a135cdb43827f3b908284 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 17 Apr 2026 18:21:36 +0200
+Subject: [PATCH 2/2] buffers: add more checks to DTLS reassembly
+
+Previously, gnutls didn't check that DTLS fragments claimed
+a consistent message_length value.
+Additionally, a crucial array size check was missing,
+enabling an attacker to cause a heap overwrite.
+The updated version rejects fragments with mismatching length
+and adds a missing boundary check.
+
+Reported-by: Haruto Kimura (Stella)
+Reported-by: Oscar Reparaz
+Reported-by: Zou Dikai
+Fixes: #1816
+Fixes: #1838
+Fixes: #1839
+Fixes: CVE-2026-33846
+Fixes: GNUTLS-SA-2026-04-29-1
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-33846
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit 65ab33fa54e34fba69d793735b7df3d383d1ff78)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/buffers.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index d54c77022..5d4d16276 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
+ 
+ 	} else {
++		if (hsk->length != recv_buf[pos].length) {
++			/* inconsistent across fragments */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		/* start_offset + data.length <= hsk->length <= max_length */
++		if (hsk->length < hsk->start_offset + hsk->data.length) {
++			/* impossible claims, overflow requested */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		if (hsk->length > recv_buf[pos].data.max_length) {
++			/* we don't have this much allocated, overflow guard */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++
+ 		if (hsk->start_offset < recv_buf[pos].start_offset &&
+ 		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index ccb6a2b4b2..e40a654a8e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -43,6 +43,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-7.patch \
            file://CVE-2025-14831-8.patch \
            file://CVE-2025-14831-9.patch \
+           file://CVE-2026-33846-pre.patch \
+           file://CVE-2026-33846.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


