Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D403BC44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:23:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43240.1784708586819750257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=BA25zhXp;
 spf=pass (domain: est.tech, ip: 40.107.162.28, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWwh9E3fp1h950AjSaWCFGRZ3akwn1tYIbpfFaCy+cBco+DzItwWOvkUvjOTkTGw9Pb34JIjdibTdRj/U9n9cCUe839Bx5TzbgwvzFHvOS6xB7aaZLRIftC0fQiMunhE2svwVqrgloZc7R/aJS6qyxyW3G8rotyqcz4YiNgr4gnmzgYyG5NOFNRWbpvb/sLfI7cTidjHfq0AiGaY7huO+wy+0hjSEh8LcYaGrnWvUu50H1bUxmfrp6il6h2wi9VkkMrszlvMf1lUZIJP8/Maht/i0R8YunK0eN/vhnkmsxZKwtu2zQmmapzSCU/j2U3/T9Nyhr5tqr9ZX+VRM9E5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66uIRdTv0BwCcs6lKjILZAN8QjHjAZb7MxfjsTtEtpg=;
 b=wPGr3ELLkf8oDftzGxbG4XqRw8MDk10heS+hUXVfuiB8FpEFPjf20Hvt+j2NF09IY8uZRntZ60iMA6TwxHHAJmaQJZrTLOfNobauWSfJn6kLPTjOA9vUPAAe2cmVEP3M1FpFb30waPTAL9Hg3d+7SdEtWUGyUrNDHXFDWpjmfTOnnT9vlzmi0L0AfcMq/JLs5voVZjyB+m2ANFQSODSqcZCuFAgebhpeAL5XQP28cVPc/GzyoLgCk9CvQnZB0UJehqpNwwNP6m0Mj6oAytLehJsXDbvV7qzsjV6FLIR61gLKH5nreiDc6VA0IKDGz5MJ/XXryvinrTCe32WxD9cDJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66uIRdTv0BwCcs6lKjILZAN8QjHjAZb7MxfjsTtEtpg=;
 b=BA25zhXp0wph4RM9XOLPqrLmEA56tbQATucmMdJoPzy/oDVagICLj0L5IR6nqicVHOq62iBsdM4QiBCByNYC97PAmA35nahp4pOszyb0/rxQ165Xb7w3WMGyuv94GcLe56HglugE5RB4rP8AhmNDsLw6TRxkJVw+ooPCCfOHOMSI5OVz7zODnIKbWLvgrLbGJttpCe0HflqHwBl8MslOWYdTgl8ep5RHbgkEgYQG0yjyHrAxex+pvGpAFmZzFihxWvm7JK5rUqWaJb8AmSwPTjifOCSPnMImijA5hcubbPOxSt+3pTGoC+f73S1G5soznvHOr41oe01mNZzpMvjisw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2420.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:23:01 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:23:01 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 0/5] wget: fix five CVEs in wget 1.21.4
Date: Wed, 22 Jul 2026 10:22:44 +0200
Message-ID: <20260722082256.15372-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::33) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2420:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fba3209-1723-42e6-bd3b-08dee7ca7219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	B5r1+rnRTSoFnzH2rWh6+7tdZGG3oPISYzTokSxDTEhI0x5/2Aaf+9IL+PYC7o3OdKRJcP9zOEb3HwRThE+HSPlhoRESF7msIHV+FIOjpDvlb4oc9Rt+WEFs+UVWIl/utqJNJ8IR64VGO+TnHSHcPeCkgrZwVET0D8VFcx7ahdGeYpcYALafkNOnMH0o1Sln0LhdCjqwv2cKv/8kQnBnzJKPu5iHWv2YZvNLN6Ix0h6F9KoAOdmdfFFvkFw2cDT55LB02o6THXteWnFbou1K1YI+b+f8c7V76eNspApNUi5hwWduLH7uA/mZ4zEncJXz3RzGZWpqvqFjZKkqLWMDv4eseQFUDK3OkCfZkkzBe9MceOXzgNvojpnCGuhHYez4FeOz8EphULEIr+zHC7QQE6MdTSRo6pH5+MP5fw80EMIw/d4THvfsAlY+qf7vSwoYckFaymlt6M38ffNVWuMp1ARLBbmQmXjieWdCIn/owobfE2wQccEgl0xTNreMLAAnhvznRe3N7ZYXpXqY4Ao17wgE1kiCVbtOEN2P+Hs6rKx+VJSPStwoingjmpfUz73Llxd8sYW7KX6VAb4PdQqIledJOLNuA+zG2cVuOz6+AxTmyCEwlRjAzAF0l7+OFIQD96lBGzd6U/VvrFL720yLGJV4xeUO2H7M+Bhtz88LMr4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4zRR/FfTLd/VMThnmtrUU1tb7+C3mexM3H0Yz+hI9QWzg4r6Ld+Pqw3zGV9O?=
 =?us-ascii?Q?QZhSYgnqh22dMGH/My726fDzvWpw1kkwxjKghVeTt9bt3TSxoXk17jCLaaz8?=
 =?us-ascii?Q?v06ILATSSqHSGE6KC5u0UgJL9fGxp6CdVnSavtcXHgJHIKrB/bqozl4NoI/M?=
 =?us-ascii?Q?g4ZD4yrV39pA1d1g0lNpf4BXgqudxgG7iu6mHGzBLkjUOP4188lU+vQ9HQWS?=
 =?us-ascii?Q?vnl+LtXlqhIV0bEpw5bJyvOHMviRDkMBynvlB3IH1cOvbIpV6+JyBvKmYvog?=
 =?us-ascii?Q?389EjlCGEWa/8M+0JmBteCXvAF9LvlBnztq7KgQnW9i+DEQRfpMOQpckSHBr?=
 =?us-ascii?Q?fNI+qlngU1gLdXWFrYjxvtyKd+2pNAbkWBmdRwvYUu8rEPVz2Pw+XNQcmy8F?=
 =?us-ascii?Q?06bOLFz5mD5MMkHG1R91RqOIbAMwRK09BScxgMT8ZbR11l9PRLpJ9ovodlwL?=
 =?us-ascii?Q?JxyCfGsUZj1PJgvrft+P1xMqUNfAMGojdnEKPPvR//QH+eWcHPxZmC3ZozkS?=
 =?us-ascii?Q?29+h4I8+4OMDwzxsE6tpbyBMSBPlUmUSLay7uYY3oPff+p6BILFalQB6OD+A?=
 =?us-ascii?Q?JzmYBE0klO9f2nU90yxUvwj1AVc/nY4CF0NqKqmFzPYY9N89l/Ie9UIMGvs0?=
 =?us-ascii?Q?tSOCcSazWuuYbPtU6roERjBg1ZdZIoN7bDpzwF9tfOs5ivm9n0PHAlI8DWJl?=
 =?us-ascii?Q?b3Sp/cNyUINTIo23scuIFBjl98LHMRuOevX47FqiwKNbxY3Z8KDrbB07puXI?=
 =?us-ascii?Q?O1C/JgrPPE3OIJJh7+onNkkBghKTu3hm8ZC4R+ZAiC9Kzp/sDU20TAJpdg1k?=
 =?us-ascii?Q?aD/gFjvYwTr/YLlOFsjQYxizYdwO5zhxLFSpunE/QJT04tNWSeOdn/5o6Efr?=
 =?us-ascii?Q?s6fS1jpdYvcAttKCa+iIWahZx4/A2KA0dKrAPk43vcGpjnh+f2DnM2HqopFb?=
 =?us-ascii?Q?Gr40GgtdEpor+kUEH2ceQfHuAi378n6VSOd5AijmZ5mBrWobLaWPJbG6HiQN?=
 =?us-ascii?Q?XIdTgmrtgIqkwEFFj1N2h6mzzKEpYIdZCppofXHA/8GaXQzg+CMvwwdGTn0c?=
 =?us-ascii?Q?ezj04aSh4WMdMpCEmtOLuw72KrlF2gG+bDQrXWB4gwjNYUP6m9e2bq0/sO91?=
 =?us-ascii?Q?ROzUEp0t1GVu5Ho7Uc8g/bChh673LNheanDa97AEgIHNNEkO4u2kUN5USt49?=
 =?us-ascii?Q?lUVcinaPG4UK4YvARcDv3H98KbR8pxYDb5FHl3+n0YZByFDSeXt/2eZ6RhXF?=
 =?us-ascii?Q?WlAtLkFuWQVvk2Ai51clAdLFcaE9vFDsniewYU60u5XPsV5d6PVrs1m8a2FZ?=
 =?us-ascii?Q?T+9L+KL09eMloBTBqvtCl3b+JRAvNI6Gu22JqIXGLL/JseBzXY8cfRHTkKfr?=
 =?us-ascii?Q?TeXZVaQECQgTzXaBJJ2y9e6Wu6jdKy2gHdtRLC/CM5xKjACyazHZXTk+GdI3?=
 =?us-ascii?Q?CFkl+xrXhjAX5SGzNg3KUp7Z0Jw5JUGHUjPD7vGSExlBHyfiHuZEZrtLZVjr?=
 =?us-ascii?Q?1uP+AqPGxbZKIJubFjzV40dvfiRArP2DS2J2ieo99V4nnt3kCivuyWvZ5P1T?=
 =?us-ascii?Q?S2HVHrMmgOQKQC247B3RdlqbDWeRpfaX/h8cOv/UZvy/mvc05PZ8/RdsF8iy?=
 =?us-ascii?Q?t1h5dl+9A1saXdJe7rf+JRfhU8YmP5TE3TAW0HW70U+oAPub4zJaDWL/yAoi?=
 =?us-ascii?Q?g0DZZSX9rctqYjCQSliyti8TaqNSknuXtoFqXdA8wI4e87FzJlmE2kzGDfhN?=
 =?us-ascii?Q?O4/fIJwtvg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fba3209-1723-42e6-bd3b-08dee7ca7219
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:23:01.7216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnKvXL/6tKawTrcR6QCArAL+UGhJ6sToE7Fh3BNVwNwLSc1GnFbiO8EHGn1KNb4iPvOGuJO1PFCzUQdS7GMceg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2420
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241620

This series backports five security fixes for wget 1.21.4:

  - CVE-2026-58469: buffer underflow in metalink string trimming
                    (clean_metalink_string)
  - CVE-2026-58470: integer overflow in HTTP Content-Range header parsing
                    (parse_content_range)
  - CVE-2026-58471: buffer overflow in filename encoding conversion
                    (convert_fname)
  - CVE-2026-58472: integer and buffer overflow in HTML entity quoting
                    (html_quote_string)
  - CVE-2026-15146: SSRF via FTP PASV/LPSV response address spoofing
                    (ftp_pasv, ftp_lpsv)

