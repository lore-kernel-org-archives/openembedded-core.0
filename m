Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3329C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:49:08 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41954.1782902943898793041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=cJ0E58XO;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.137, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=TxOMcAoJt9Zjx0yFpQC74kOPO/68y1Exs/i4d1LNsdE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902941;
 b=bKZgZzVboX8Xx36rF/JTYxDov7zDlr+1RhNIFyuzP6re0iq1rzxcq7CXyLlW5zUFOBxybULo
 ozpcwPSAVuAAspPpiG38tIxpIYo63RPNJEpms068L/TuS1HmmDDmbG0DUjlW30vEFHzJnz6Eh/Y
 q4DrIf2O2onCOK5xNZHi+qIq6ceqHocQGGPwAPLoVXLm6KytTFGJI0C+pZSdl+J3Q71CoLjzbCX
 ckER5AJvpYy5XwDQiP2YXAmhBAUlnYMYsu/l3BsLmNwFDZ/UY2SjTeWfVS7gclq1Mvw9L6QQVo8
 ZX8VAmXEhoLaA2lR/N+ukPlduruFGOJYiZKnPl++SAAEA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902941;
 b=NERAHpXmWZGTO39o2vBKI2pm7nXeXJ+nuU7iTLvLG35j0ln4rjdZGO00fwqd/RDYU8kCzEa2
 hDbeJ5qvhISUdivZzD9BgnWfn8eeCaYB02RfnWx+q8agusruu0CQCrGfhVr8kPHbhxEszMhSUR9
 f+3KgJo7by5NG1i6o0YqaNSTy6hT33pn+hJbIU+B1fKX0NZiC9ViBDgECuLg8/XQ4n1CXxPwWBd
 fiWDxJCTfJ545aRYQkQAzEL90Y7T95I5rCPtu2EPUYSRtFVJ90/AAC3Iw6j2LmSO0T0EbJz8qaV
 pOmblD9FWNsmX440udMEwBv6fJyAiwDT/Op72LwQJDVpg==
Received: from mail-norwayeastazon11023137.outbound.protection.outlook.com ([40.107.159.137]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:49:01 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCMffRdgPsmyyyfjVvOMC67xE12XswEz9yn+KgwSNN3lv3d1++lBHsyS+OYI0oQMREQwZc3o9BBwrlAKiz3xvN5q+f6MiVtjJsj8RIZpptVXPh6acfLqGYZG3vEFWjnZcd6tTUDBALumVkaHl/EFod2sqWZChM+ENX8kEneDaj27AXE/aUOJ6qUs7XvEWX47FzLI/xa6PPsT6akWdow6cqqO1JnLf09K6PF6FTbV4/oc7Cp3KOGDFbBAWqcEZdGbhcwKlE0b2jOn/h98uD+CYWD1uEQLhs1pXTFfo5JUcFkE0mXzVl4mE+vnW4Pypedop3zFDvZ/5NRp83fZnoKSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxOMcAoJt9Zjx0yFpQC74kOPO/68y1Exs/i4d1LNsdE=;
 b=b582+tbVHBQAlmRSMiDZQQo8od9bwavn25P+P6JCmxnULcf7LUQX3k6n0MOUcOO2lsmmbM75OHrs1oYBfVkTAlwFhy35rtmShk89RF4XFZACL3X5rmOKIUfyhsmlvhRFTHeizgleoUWhdfj5sIuLi4k104SWFIRfQURvdjqCJrTSsYymCehhMOeEVR7410sXhQe/Sszl2w/efQMgcSRc+9ZfONBvFW7h+ddazPg2hihLvQVtUHCt1St8pIPrOTihXJRCrSGXb3a3owtm8nAwJBq1TfoB6UXH58HEyIy5iOc7yU1p91a/LFXdyGka40NfM0pkaZxYoy33+3hAEleTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxOMcAoJt9Zjx0yFpQC74kOPO/68y1Exs/i4d1LNsdE=;
 b=cJ0E58XOQRg/uam7mv0YqooiVJO8F1Cet6C6T2uZcEbM7r34xrON457zQILdWZ+svDjmXb4uZQAEJZZBOhzEt5HP+X7CE5eN6VgnGJtKP3SRknhBfubskWkIfAVBEoirs273ymk7N2aw6SObkZcUMbDXIHTFFnM3e4KHPLn+2drKevuOj9npO49tbQvGdZXFLmiOHbD5u55VR3D8f68bA+cOIU1Sueah0kMRxfD1Ks242S0CW1k2RTfd1hi1ogXAet0zW1Q/Vv+aTx/55vF5pjjDSZdCELqf5HQWqwjbfkYx7dV1+pkSKlSiiku9l1QM9rb6/hPPZ3IjvOmLMFuhPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:50 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:50 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH 4/4] dhcpcd: patch CVE-2026-56117
Date: Wed,  1 Jul 2026 12:48:37 +0200
Message-ID: <20260701104837.3577369-4-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104837.3577369-1-tgaige.opensource@witekio.com>
References: <20260701104837.3577369-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f50b8a1-aabb-4958-964b-08ded75e55d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	bGem4rBRywgTPQe49BT374QZqj+L9VlymXzuW60k7b75z2zojnHp3JqwonUBbDsRTFs2OJ5/lFTzRvccxZ5xeq57Yj846s+X7g7H3Q+kgNfgdhADyJLMYzptS3HB3ko7Pb+GrWC+j+efQKbWMlune4ZWMj9/d8pXWRjRB8DyxiRItqG1dTOMTxMLB4UMQxW7+VrSnxfZw8ZOStJoKy6Vt4jpHqOmB2IkwJK1V5COn6z3PkFgzKFKZEHMdsei4KIoKLgJn6B1okzus1fPsjM6Bw8YnfaXyXRfvgjLNzFTBODBU1o3/iX24/hzx/1VK9FBtHwYRE8O/eS8Ke+aZulBTuujJMCznTpS8+sj4PuntJZzSB31+Zv3hsp3Aw/73SJ0cvl6tVVaKP8jnzgHHBN7rx3f7vpcERKsEbgGP1mNSdrFZhDCbBqndpYXgOop4P09aCh123ZJGAy6B8s6SKbE0ZrsXj+nrm9g8TGOf6QMxRhmCIxUQBJGpoiz4m3Ux8RIgC/kxLhET3MGehH1n4TClAaeQ2FgO+63lyFkTr8I5A2HiCgFyEL/MWIZ6JncIRdY5/DRMANmCthSj4er4WN1R2ZkeyASnp4klHGoYPmKdbqSCHVQbpfMOCR+tQavivhjdJMDoJuTzcK7FHK4myKRcShyPLF/FLJJgP3M9DzP370=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QuQakwv1aQbOhtE3rNn/tLIrTWxPA9VRai6X6B675lAR6fiCJ5WkmXjm8N3r?=
 =?us-ascii?Q?3NZcA2cKscB405+D3JGr0nwJID9kgRPTTDHkbqXqpNdI2Tg43O04qvbZFX9K?=
 =?us-ascii?Q?f45k/g2XRNJ5xNg8TC3je4Z6BxW3cBNXwyr4bHCJpAFDBZS1IGTJa4fMdjPT?=
 =?us-ascii?Q?K3FvKGeb8ieAeRG2oi6ojY+5MNijlYgBNItnq8rzwcJyBqw7FQIqBTadcT6L?=
 =?us-ascii?Q?ZUYb+rcdPfY139L8oYxgL+ZPRktO+RsdZLr4bMCTlHSo1KZBaoBh6uoT1+eL?=
 =?us-ascii?Q?COYgMXuHMTtVw1DeKAtZSuv9FXdEMgkyxq/frKUYhkjCADZIfrWDDUs0TxEZ?=
 =?us-ascii?Q?YANT7s1ID6WO3VZE7AQYzsHY/xjSJdYMcUUQ35gtuEyh5mm/+081BdvoaCYW?=
 =?us-ascii?Q?JUObpRIS5t8ykw1Zx0lPL3KS0IwguEUO62Zl/WMA0LyY1TGPd3oLi8oQ6lhT?=
 =?us-ascii?Q?HCYM/ACN0o3daKkBTB/8EDrDtBL6O/Jv4fevS7IREmfzCKsLbi2OwQqHo+vv?=
 =?us-ascii?Q?fODPkz4N+34oI0u8xrf3qiV8qJrO2kHE58hPNfeZqe2uMB3ntko1WKAvK4wr?=
 =?us-ascii?Q?jquAGBJL1O74+VugPAoWWzQi8XS7NuXA+4rC8kV9T3SbVruMPj/rYUENBWRE?=
 =?us-ascii?Q?g0yI1mWmPs9BriTJ1wXIedNUii+3/OG1raeVXj9nJ5BIhzlemLuCjr+DFQU9?=
 =?us-ascii?Q?DkwfEtwhisTnO6T8mXAbLnMifdk2zNh1fY0MaXMoXid9zubSWsbhw0jtLZeY?=
 =?us-ascii?Q?ku5dM7YfZXG3WvgsDfOWOzuyiE7RWt350TIkTz/446A7MRfMGAoeiTVXH1Xi?=
 =?us-ascii?Q?nVaM1NosnYrVHRWcd0tnyFmIIfynfUbpd806kWJWch352xSZhOt1Ie0K1vbi?=
 =?us-ascii?Q?USRt6KB7c7mpayXKoCWHGnYjTNMwqFScWgZXg0WG4GWXsQUFRHihDq57LRXE?=
 =?us-ascii?Q?aT979QnwgfgasETM4BlnEyIR35ul+bxc1e4y0ubYDPeAlQKimAr03G4p9dPR?=
 =?us-ascii?Q?iBh6I20z3F8S3heHxUECWdt9hVLvZkyOlmiq2GtCy9HByxmkGkA9kwHTuFo0?=
 =?us-ascii?Q?6/OE1Ot/HBbbAdOOmCzxcLwEYyrnz6lpHkZaTGmml+35QN/+XNDjUwyLFZyg?=
 =?us-ascii?Q?qBOg8AzXwI9OiOfOratU4x+jf7YreLaDb78ZnsZcqCXr3v10yn4FZ4LnxUBM?=
 =?us-ascii?Q?3QhMO/S9qvJskmP9I5aNgWX5SlrMigIcfAQaOIADVKQW9XdswvnY894cen+K?=
 =?us-ascii?Q?49xVdtA3b0kucmt7tyowHjc1ZuJwhG9xjSW7TME1w8KIGcudgKqZw2G4lykm?=
 =?us-ascii?Q?Pa9DZAldAWs2c6vWuaQVm/LZzVLCNHxR+uVE44kBOVBUiceskQve+csWGedV?=
 =?us-ascii?Q?s0DT1UOVNthLrj3eT1cNsAP8OhdUpZ3y2i9BUx5xe9z4RKY9I7IRsdDUxu16?=
 =?us-ascii?Q?Gqr9KhL+lQ3puHFGViSqQaejb8iv7S5EH9m+2iULRbd0xbt/XSC3cfvWt7/b?=
 =?us-ascii?Q?norWqN1FLOPlweSXEnIESPV22SXQ06bd4RmsUzY5AczzzLebPUjjmkq2rUx1?=
 =?us-ascii?Q?Tmq2u5ylVGe41RLxbeBAMPoaDQyQL54Qculo3UQW10Yd5XA/+fKkMVLDce8D?=
 =?us-ascii?Q?vX6sd7TOv+8zdtWWWaKHPZq2f9TYCbWUV4zUaQJXRhlQsOq7HIhwttT1uxvK?=
 =?us-ascii?Q?dAdHw1oIQcdcggQfYgGv3cUfWBOZ70eh/1spvT4dpCYWt4H4XJcXxyInNO+l?=
 =?us-ascii?Q?DjrUKkP/7AebQNdFDUygMMF2gQ4F5ZpWjq1RLGTY08aXwNt9CHlhfdAwikOC?=
X-MS-Exchange-AntiSpam-MessageData-1: GyyMbQjxqSqL4Q==
X-Exchange-RoutingPolicyChecked: 
	DCHeaV2kvySYeVCZ5eSQy4z1HQPov+bUQxT10HWi84YF/FAg+haN2IMC9Rfo72K2bHW7GylyIaFBPzAcVnCZm+gxIWw9K4AAY1LvWXwp7RFZG9l8KcXDy04aoItrBwtDMIB5efK3/MGMsTvkDKrgnzdegffCHFx0OBedLdpA7bb5cn766qPdvn1JjnnKmN9W58wSpJ54d4TMepZbE7qJkRXb3dtIt1Azb9Se7pBo20rE6XLTtfG2furiz7bzOTWZPqY8NtnNebnCanTDkbx/uxq4ZC89wZ60523j+3/jD3zEdIlliyvabwAkou22DEnnUeftCU61muO0IPhRgMaePg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fb5djCXa5NX5RN9Ck2PJKMX66t8FY+9VmbMKPwJVOh97n19kh4SkMlk5IHJjWVt14UzSCqmwDod7mLfP2oyCaqMyjMKDrMOCGfy6fXXJ4JQSoDL+XkYlACcA64r3YjuAxTK2Om9SSPTxpnkpZhOo3NDfPiT0PzFh5hqA87HFw9Q2NKu1tgF2RTdkXuP3cyozCbxpADiUnM9Rt+J+iM4T2///X/k1kwm/ope2GfLLyJcLeeSJqYYVO1Eq6QXS9gIvqXxp/G1MzsyBntfTtLjAjlhrfu13kOmkiDH5YDqFwTzl4M5Lxx+2JG6ZLo8eYWolsxzeRG2eTQa8GtzLclamV7WV3F8zsS64nINaXc/2UvjbN81Wh69xAYdSLepjgLyUhuNwJhXdLu8/fw97X7pkajqnj4wkaRPjU16NRc2VvPATp23/ld01Z6OfXhpnZOw6fG7y6Buwz69SDprIawnhEfCKbCiP8Z7ekefqOCk7xSnkgm2wZhfyHGFka7BAlRfpp+v5CRqxXEOPhaQMpoVxIkifCmEUgAQ7hpHaZ9uI61uOaN0vcBumK7vt5sRSH0aPBxkp0km7pzrTBgDqEDY1olE39aZij6Pi1kRCvnXUuklkpw0v5mYxiZ5eBvVpC/dy
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f50b8a1-aabb-4958-964b-08ded75e55d6
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:50.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/yBhKJ3ajE6GIlEsQDE2/uqGVWusiNlA3IXKuZOA4CdAyzx7+U+83a8NI9AVs9O6BE/boTb+JP4tLnozDLUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gqxZy3PG4z1PGlC
X-cloud-security-connect: mail-norwayeastazon11023137.outbound.protection.outlook.com[40.107.159.137], TLS=1, IP=40.107.159.137
X-cloud-security-Digest: 6928200c15c7bc311606e76a98740877
X-cloud-security: scantime:1.039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239974

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34

[2] https://security-tracker.debian.org/tracker/CVE-2026-56117

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |   1 +
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 4a031cefea..afe504c251 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://CVE-2026-56114.patch \
            file://CVE-2026-56116-pre.patch \
            file://CVE-2026-56116.patch \
+           file://CVE-2026-56117.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
new file mode 100644
index 0000000000..4316d2a11f
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
@@ -0,0 +1,167 @@
+From 753b93ca9e72ce48e7f231301d13939158d3394c Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Mon, 22 Jun 2026 23:41:53 +0100
+Subject: [PATCH] control: Avoid hangup in the recvdata path
+
+Instead return an error and bubble it up where it can be
+hangup / freed more cleanly.
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 78ea09ed1633a583dbcde6e7bab9df4639ec8a34)
+
+CVE: CVE-2026-56117
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/control.c         | 47 ++++++++++++++++++++++++-------------------
+ src/control.h         |  2 +-
+ src/privsep-control.c |  7 ++++++-
+ 3 files changed, 33 insertions(+), 23 deletions(-)
+
+diff --git a/src/control.c b/src/control.c
+index 17fd13aa..20480f69 100644
+--- a/src/control.c
++++ b/src/control.c
+@@ -115,10 +115,8 @@ control_handle_read(struct fd_list *fd)
+ 	bytes = read(fd->fd, buffer, sizeof(buffer) - 1);
+ 	if (bytes == -1)
+ 		logerr(__func__);
+-	if (bytes == -1 || bytes == 0) {
+-		control_hangup(fd);
+-		return -1;
+-	}
++	if (bytes == -1 || bytes == 0)
++		return (int)bytes;
+ 
+ #ifdef PRIVSEP
+ 	if (IN_PRIVSEP(fd->ctx)) {
+@@ -134,15 +132,13 @@ control_handle_read(struct fd_list *fd)
+ 		if (err == 1 &&
+ 		    ps_ctl_sendargs(fd, buffer, (size_t)bytes) == -1) {
+ 			logerr(__func__);
+-			control_free(fd);
+ 			return -1;
+ 		}
+-		return 0;
++		return 1;
+ 	}
+ #endif
+ 
+-	control_recvdata(fd, buffer, (size_t)bytes);
+-	return 0;
++	return control_recvdata(fd, buffer, (size_t)bytes);
+ }
+ 
+ static int
+@@ -205,23 +201,31 @@ static void
+ control_handle_data(void *arg, unsigned short events)
+ {
+ 	struct fd_list *fd = arg;
++	int err;
+ 
+ 	if (!(events & (ELE_READ | ELE_WRITE | ELE_HANGUP)))
+ 		logerrx("%s: unexpected event 0x%04x", __func__, events);
+ 
+ 	if (events & ELE_WRITE && !(events & ELE_HANGUP)) {
+-		if (control_handle_write(fd) == -1)
+-			return;
++		err = control_handle_write(fd);
++		if (err == -1)
++			goto hangup;
+ 	}
+ 	if (events & ELE_READ) {
+-		if (control_handle_read(fd) == -1)
+-			return;
++		err = control_handle_read(fd);
++		if (err == -1 || err == 0)
++			goto hangup;
+ 	}
+ 	if (events & ELE_HANGUP)
+-		control_hangup(fd);
++		goto hangup;
++
++	return;
++
++hangup:
++	control_hangup(fd);
+ }
+ 
+-void
++int
+ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ {
+ 	char *p = data, *e;
+@@ -243,12 +247,13 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 			if (e == NULL) {
+ 				errno = EINVAL;
+ 				logerrx("%s: no terminator", __func__);
+-				return;
++				return -1;
+ 			}
+-			if ((size_t)argc >= sizeof(argvp) / sizeof(argvp[0])) {
++			if ((size_t)argc + 1 >=
++			    sizeof(argvp) / sizeof(argvp[0])) {
+ 				errno = ENOBUFS;
+ 				logerrx("%s: no arg buffer", __func__);
+-				return;
++				return -1;
+ 			}
+ 			*ap++ = p;
+ 			argc++;
+@@ -268,12 +273,12 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 		*ap = NULL;
+ 		if (dhcpcd_handleargs(fd->ctx, fd, argc, argvp) == -1) {
+ 			logerr(__func__);
+-			if (errno != EINTR && errno != EAGAIN) {
+-				control_free(fd);
+-				return;
+-			}
++			if (errno != EINTR && errno != EAGAIN)
++				return -1;
+ 		}
+ 	}
++
++	return 1;
+ }
+ 
+ struct fd_list *
+diff --git a/src/control.h b/src/control.h
+index f5e2bc7e..c5511dd7 100644
+--- a/src/control.h
++++ b/src/control.h
+@@ -75,5 +75,5 @@ struct fd_list *control_new(struct dhcpcd_ctx *, int, unsigned int);
+ void control_free(struct fd_list *);
+ void control_delete(struct fd_list *);
+ int control_queue(struct fd_list *, void *, size_t);
+-void control_recvdata(struct fd_list *fd, char *, size_t);
++int control_recvdata(struct fd_list *fd, char *, size_t);
+ #endif
+diff --git a/src/privsep-control.c b/src/privsep-control.c
+index 40bfb164..954126c0 100644
+--- a/src/privsep-control.c
++++ b/src/privsep-control.c
+@@ -108,6 +108,7 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 	struct iovec *iov = msg->msg_iov;
+ 	struct fd_list *fd;
+ 	unsigned int fd_flags = FD_SENDLEN;
++	int err;
+ 
+ 	switch (psm->ps_flags) {
+ 	case PS_CTL_PRIV:
+@@ -131,7 +132,11 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 		if (fd == NULL)
+ 			return -1;
+ 		ctx->ps_control_client = fd;
+-		control_recvdata(fd, iov->iov_base, iov->iov_len);
++		err = control_recvdata(fd, iov->iov_base, iov->iov_len);
++		if (err == -1 || err == 0) {
++			control_free(fd);
++			ctx->ps_control_client = NULL;
++		}
+ 		break;
+ 	case PS_CTL_EOF:
+ 		ctx->ps_control_client = NULL;
+-- 
+2.43.0
+
-- 
2.43.0


