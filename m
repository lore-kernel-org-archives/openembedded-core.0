Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25998C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 15:05:06 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47496.1782918299377018725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 08:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=n4o0uWQA;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.87, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=AJ38PEqJhsDZjES1NEtZeW5UU7kIvzQgvHagktZqxGM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782918297;
 b=HbolcQftl9fqculmeATX0FD3/8NnzYq9XjDESiUZjESP88Q1HmqS6r6JuMybUfbJHM5H+o1I
 zjY0swujdUTPEUoOK9pRmzzGKhX4rlDD/S/PkVzn2SJabtzOodKRcOjvlczKBcGBqKhTabdcU7z
 Ao/MjZnZ19/3zeuMRMSj51hrFM40yd+v4QgdliVlAqZZrh6YbnO6xO9hjEIOtgnUSBLEoEapfZE
 vi4u19hbNmZ4+Jp2qV+7sNolmIpynDYJanbW59wjBkpSW09wDFMh1KkqeMbS47zTaMAEwdawJUg
 X62KtDg80EeB19hkAe8xAFduysZk6QjFKzLnxS5cWLDgQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782918297;
 b=gdg9RXyveuHYh2UgTRP2+7r8zJo/qCEVHKYm4ojUIRvc7yM3pz21IZV/3fs9EWKJqTzHrS1d
 xMe4YAPHmYAp9iZOHjQdbKMbzzVVIugkCOAPNmSF+xwx+O0l2iNQLfsJH7ljMX7wZtdqyXCX2vS
 TpdYqN0ox4RrDYmz2kZtPOH2D+iQlaS31MGfKNOASuk1kIjlKPAH2gJU7iEa8Vf2w6R5pq2TJHO
 QE8cWJ01hoKnRQf3NfhznKydc+YFOfK5K2WLGBF7JzuvSlhS+X8uf5XCgpYbc86QAKuAOAwktIJ
 oHkq2M6A1I4YQFiLYa6ExRzgR94VciFHR+LjahACoVpig==
Received: from mail-norwayeastazon11023087.outbound.protection.outlook.com ([40.107.159.87]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 17:04:56 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TC1q/tZNVYGadyrB3gcv8/QJKzAsGGfSd/13/CUtroB34A+Nknb4Nswx4Z4wqGblRP2YHzc5Ask7IdoZrBCJ6e0GAebTZcNqJa45Kuc7OwwJnfsebSe7cywNNHpmuZgJ4VLHFi1I+KPh6HO6UU1aweonPZA3nlDfznzu6eWWv6oHR4sJtI3cyPnuHSennSI2uuCuaxdew3RMKfp5OHj1wPL4REyM2gTtQgAimfmDwu5ROn3n+BfaSn18oXoKCCU4NRUobF6QbmzP+zI+u9Yd0Aq6oNcC1SgGFLkcOuZkP3f5XpUe+G0D7rgUHs5QM7SPQwmnymEVgJCJAJmgQRWM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ38PEqJhsDZjES1NEtZeW5UU7kIvzQgvHagktZqxGM=;
 b=SH/86sz+nUmYoqrIKRi3575Pty0gihiC3hl2XsLeIvprIed8fzwFw6/FBWe6IipP7yi4DEitznkg0hj8q123PFfHRUUoX10L9VbJZjZG3r4o7y1sDY8PjbAT2vbP8DBrlZ4ParsNvRLtozvA1opNMGxl4SX1cVH62Hq3vlAVNeNZWRZBafOZjV/cHtTXF7/UBh2ll7lHTSdfdIBuMi47pMvdyQfP1/4qn5VlwmPHj6CADW4YZuKYDGLV9o/JR8fuhBza1xFkkKhx9hEC0p5thVYyiiDerAExRH8Kp1YODUS/UW+Px16zd/OZjtcIMk8SGunLWGr7ZoqdLw6/i1AQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ38PEqJhsDZjES1NEtZeW5UU7kIvzQgvHagktZqxGM=;
 b=n4o0uWQAhcHCZUSdI8h0WBLn38RRPTgpoDHVoYbZZFPHdI4UvydJwlPj+wTYFKJ3mZeNdrNy+dHc5u6m1G5Hf5pB6R4kxUGv9IcnEz2C53JT7HRj27MSISiXgCiZQjpDYF3+QQu5xpdC4Vx8Tp3KcdLamY+h58hiwJrc1u1SJdjWgUsra07sku+2YCwm/u3Sic+tOSuyuB7Ikb0/T2Gv/Q0ctZ5G48cnnrPY84GInsGBl9SXA215Sgnnp70KFA5S4TAJrewQaH6KIAydxCEN8j445InCdfZl+mDAhO5NwMr5bmSWhLjptaeybGH4yUKuIUhSxv0X7XnYgnukJ4tVfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by GVXP192MB3339.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:2bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 1 Jul
 2026 15:04:45 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 15:04:45 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH v2 3/3] dhcpcd: patch CVE-2026-56117
Date: Wed,  1 Jul 2026 17:04:33 +0200
Message-ID: <20260701150433.3889478-4-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701150433.3889478-1-tgaige.opensource@witekio.com>
References: <239971>
 <20260701150433.3889478-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|GVXP192MB3339:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8e7cd1-2a60-4a76-9536-08ded7821687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|10070799003|18002099003|22082099003|13003099007|56012099006|3023799007|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	69KNF3FSmq8klNhNS++8it8PyceTGSTXpg75M528nqe3R/DwsTHkPgB1/X4YnJmk483oIEglM+GAGjslErUffND7AiBoE0WCu3zosgEpxVN2nCq4QeD+rRnb1zATRXnEtF2u0cr08GQhnXkdugXokMd1KOGmqydCQqVjbcN2NPD+1+8KHUJQxRFk3nujtgkB8lNnUatT15JlsxIpyHXFOrk/RkZ5PUOqdj5WdoZIF+g3IggWeCntwmezYFUrvdo31WnQuSaE5FDiWcB26KOW/qMrh16zjF4SUl/G+Ier6LXLwYAokyHG26RO7oRL9m6geCTJYkAD1DRwg56dir9mj6QWHJwAcoZ36h0D/F3yYZpR3AVhdYT/DVgwVxd7oDk1TyJLI6V232y4nGTz324ZfRVG8rYcY/qqAN8cn5brHITvp/RbeO0pYsR/Td9Hst87x3OYXkkCuW8vT/2JswYHxLxQGR2QC07NTv0gz6//DWRHD/n0+V/XGZfYhQcWAdkpKuZXehWA1Sapi/fQET3pgPjRCqfz4b33RRwbhA7Qi2NhZQ3/3oKHdTebspKWvnAYtZ9a5Ht7aClmdhNcVZD+RiWFET4Oia2HfF9MLlwLPBU/FEdPV/MU6Rh+ljSEisrn3L4JwNCq1/6bljNyseeF6m1QxACQuyrvIF7swFeLO9I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(10070799003)(18002099003)(22082099003)(13003099007)(56012099006)(3023799007)(6133799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RAvpktTcq5MwvLGhcm+M1kj3tGuaTF2vsWwrVjyC8bxevFjNeS2eP1leR03r?=
 =?us-ascii?Q?RGZUF/vm7CoCa3KvPsjKi+jVTdroNmEh3X97T81TUz0/7XlxeIQKSxar3aCm?=
 =?us-ascii?Q?AxD7SFhLbUUKzfk/K9uburea4DvtFC/wLOQEjG7l4JM+3EDHsAz+O84HWS7t?=
 =?us-ascii?Q?rdygtZL8X6QbrH6JYfyM+GIsWe/w8LVR7YkE0dAC2VWxAfRvIFMIPpK4Jnn6?=
 =?us-ascii?Q?dyNaJmy2KrgQiWyXThVAmd0YVJ16bvsoGiZQDgT1xpoyvftW/Coljxu/Jvs9?=
 =?us-ascii?Q?v0hd7Qm4prcGB9I5vb1iQ8kcpeJn/hTfLh0/sxOLU7GW8UAOrhKHKjKiqDNJ?=
 =?us-ascii?Q?FbCzSTbOVBMT7EklNRNhVQI7XStW4qMEoMFP3s41l9ZbbY/lu+oXhzr9Yk8a?=
 =?us-ascii?Q?z6/nM+cCOYOHD8hoZdbD+c41H3X6E4T/5EwA3M+9eUfeAXjNefeHKHHab5Bm?=
 =?us-ascii?Q?DSCeoLtUzA5MJyEylprtwlVKx3yTST8B1w8PNURUjDViz7jl2hsjonKLeBpX?=
 =?us-ascii?Q?JXGCdZAZ9xNW6ydf3yEiEkt2sOqwSWmcOP4EEgBC69hTjwe8VJqEVG1e0ff+?=
 =?us-ascii?Q?fcJLP7321NtVs/KuGf4ORIAZlTAjWSg24HV+CnfY9IfxHBWXzW40oGbDXwgO?=
 =?us-ascii?Q?K/7mA6rlhw+n5SBrizXSnRBm2DwLH4IbT2QJO7erk/crs7dwYhGGuwqCJELs?=
 =?us-ascii?Q?3iaYs43pxyb5mg/53g3MEXaLP5VeeCud9byo3bmNutkB8Pr8mk7E92tiglFY?=
 =?us-ascii?Q?wVYNXO2aa8mpLgDzLZkpdr/tcF03A1bktF41GjUP4bSoUmE7r6drVizRMVGq?=
 =?us-ascii?Q?9T/3mfMaf9+wNBW2GYnobt6LLYxgnRIUybeRYoTKuJvDIVSjrsqLKQ0G11sw?=
 =?us-ascii?Q?CftcyfUESL/NwY1emzRuyRaB9Ekakbg3sXMMtbi+LpvoTxBBglPx053sGcBF?=
 =?us-ascii?Q?g16vqJlfGoSKVKa0phz0ULDKAMcXRrpP5hdISfnbC3qz/7xdoUn3RHXeGpL5?=
 =?us-ascii?Q?Mc+G31mgeh76mWQm70E2vMrKJYSchJj7XcqSgV7gcMuoDNS/CiHVQiSeke1y?=
 =?us-ascii?Q?V/CNLXZF9D/kOTiBSSH1jb8S8Jx4+QQns6ZedduMm1OZKgH0jCztCwKGrY/6?=
 =?us-ascii?Q?fdtYbmsSsfrH0HgA7XL9qYulhQfj5znDkWE5qWXFTNcQWrk0ofMncn+TcYlF?=
 =?us-ascii?Q?kzBhGBH2btOtMfE1jhPkMvq0E5pkDmS8HjcymPxI06kh1mseAdXY5IRC8ldv?=
 =?us-ascii?Q?3zIVIsARC97wXlunazmSlyI/i+gXEORE4vFC/2jCc3r83zoaSzRNAsqBsuW7?=
 =?us-ascii?Q?H6DaFbdU6deT7Mvqg0AkDFdtclZC0/ljzaGU32gFdrW0EH6tPZj8GQflvomb?=
 =?us-ascii?Q?tvae+S46k/PVEHJf3Qk3NWK+DGcv7dK82LmqoGVypwbd/umhnQIL7oPVqhbo?=
 =?us-ascii?Q?nlAhsToouXSz8QMjAOUU7ibVy8a1TqhpjMZ4Qmlr63+tNDWaD35HAKADtKcN?=
 =?us-ascii?Q?AbuC/7EM8QMZ3PbgHRjDGiPfZN25wOmE4S1W0XWNqsPqNKg5nFdehJJ0uTss?=
 =?us-ascii?Q?4xKj6rWd9UlPX9Lju9RdCqPKnlrUAxFAyykEUqAyfWWUzES3V7axcqgIrju7?=
 =?us-ascii?Q?KVGtJT7L4309xFEzmInHR/DaFKjsjXLJ+ptEzIN8DpX70hd//J198OTVnrxN?=
 =?us-ascii?Q?qs54lmaWeYLlE97ohnolJNGUWAWUtNL7KI46hx8MbyPujKSdblqQ2WhgaVCW?=
 =?us-ascii?Q?qiXTBM7a1GKNqmGivh1H862nKTsxGW7YNLAvBtkMQtQzZ1n0ra49AuKPw6I+?=
X-MS-Exchange-AntiSpam-MessageData-1: VV05S+0r69M0SQ==
X-Exchange-RoutingPolicyChecked: 
	Gd94ATbOejZl8yEfJ/EEE5bD3rbVJjeR77AI8uC2ahXvwQRgCXSNIvSr780IR7NFCcEFCswgQvU2j3wdcQd9nssNw/qDzK7kO+9b3HAFyvfRxE62Ly6TK6AALGLKDNxqV8mvOpL5Z2r3YC3RmgkaWiCnaVehuLkyNaPJYUem2hkv810ITZmlJUz6IB3BMEIbmUdCBbsXEPvhHZWHCtA54fQ71qjYvP9S00S6mDTzR/hGCniqxHTQ4CgeP6AHLY9ypT+GHgjcrKCuxYy2U0SUq3FnF7R5Yea7B7+RCuyLMFz3T0xc6tHrBP1qBJOD9gkxmZj952FwaivK2xo51I2SAQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	649q8RGPIgl1pPchOz6Ecf66lzKEO2GANd1pBUlWuD7plsv6XwkltUtT2qNZSsyPBrQXjvk0JkT+H0anmVOO7/J31/E7Yqp7sR9e6vPfx0HaSWI4jbwLS3quHf3jVaqNnSlcwuzG2PaIFJ7K+6kU3JFeYdxnhP5hRgMWcnu91zD8+lhcPQZHgko6ULCoHkOjKHRFQiVLHMG7H+QU7oDFDsiRwN1oRb27Hu3k/3ZoKmX7EGBovi2w6a6xu1uSkk4qm1ZX43g68dYOYJUMa7oNBGLlqEEJmb/aw+c1ake7H0AOSq1xkhTmZxjjr0B/x/gTergqkRBPe/fv25GEUFryPwDGbhuGjps8+wPigfC79cK4E1P+lGSfAnLn8uXbQtgAlLy96OogSQNu+Pfp1bK14/XsWGbAFYuUF4Wn0tl6cB6ZoLMwOb+wJvbEHqpg/AwvjWpryTcht6eiERDlk4vRBQly2p9XAAxVkFkgH2HZOyp+AWcwd953RLm0e6aUaEala2pto2L7kKO1rJ2EGz7BrdX4GRpJUXfddI/1IxrIU/k+FL5fYv4EIN+ytmFANEzrO6ZxIYepmOWMuTErMh7xhn/tcAm+3UA6lGxNUeXyaYJ6bX+D2LttJxDKG3e8wd7u
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8e7cd1-2a60-4a76-9536-08ded7821687
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:04:45.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BZgZ+NMs2WGvJYkcpoMYzHUpSdCKHlc6xmv7EFUzimEj/i7tRAi+IGEaira+AQrSpCsPx1HOv97g6u5nOH6UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB3339
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gr3GF6r9sz1PKm1
X-cloud-security-connect: mail-norwayeastazon11023087.outbound.protection.outlook.com[40.107.159.87], TLS=1, IP=40.107.159.87
X-cloud-security-Digest: 61751287f1552ac352441a411334aacc
X-cloud-security: scantime:1.121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 15:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239987

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
index bc87b91503..e6854e1c7f 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
+           file://CVE-2026-56117.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
new file mode 100644
index 0000000000..4f79453aed
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
@@ -0,0 +1,167 @@
+From 52e0746deeace02b0ea039441d6cdc58f026018d Mon Sep 17 00:00:00 2001
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


