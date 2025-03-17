Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A3AC35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:00:30 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.115])
 by mx.groups.io with SMTP id smtpd.web11.53256.1742220021152982247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Ts1g2h1a;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.115, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bObB1Emoqq5j9/hmOTIGVKsUD7b5cDINnqxMl6AJ6eE/E4eQBt3BDWUV2qM2bVcQBQ6/VweZ6yA7klvepmsV8E2Accuz84hqjJbgmP9YqortLdZbBVRbZYqwImD7DHff0J+5/avrsEegPQ1tYGd4ko8Ci74KceYg197bEhog1O8VjojIhHFSbJ6tJMPa7dp0TF1NZ78YEdhLo4V7CCta3ZoAAZcxG7LFV72daa0pjps7BlijbBM3vm4hf+zUdepvvbfPwESyzp8Q28XVfOepnCH0wy7JoeCBMX9E5oQ6dIALnK7tAySLzxGYrq46dsZCh/ElU4vGG4iRZMCNpD6J6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAJ5I92iSiKruNyytPwugYOdoCT5o3iLfNBputzfBjI=;
 b=Pr4YrWSbSG+NfZnDAeanq2EG5z84RdZjdm0wS08tcE7O6HwMxZa13SuNGWeG5haYRQD/6QgIPsFO+LJ6OGMjExpWRx+nUkJ87rIVwyR06vL7U0mzftK9QXed+7lr8LTXxGZtC3xkp+JoL8vI8+tz5enIR7GiYzD0T+/GsnlgoKNM6gut7pGbGo2q8IUJW6HOq6pfhuocX7t8y4qCw+5qF2jlsIg7YsZlnVSm82RWVrqgJkscqZlhUWyi336zZaGWPZnBxcbByPrzCIT54Cnpz7LN39tGczRDGqmec6R2WA8QUSFSbgR3nvaqaXHgGdS7mQtD7Dx2nBZFTYGx/WFZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAJ5I92iSiKruNyytPwugYOdoCT5o3iLfNBputzfBjI=;
 b=Ts1g2h1aQnii6dw/0eI4fplAH4uMilqLyc+sMHS3Tp3AJtTi88s1+53DbI0+O5esoKwyXRyD+2sfkYns2lrrAduZLSKW2l7RfPtp3bjSq8mU1L980Kpun/A4a81+VN/hbFWn7q76b0TVDykYZTLchm2nXl9xQqOZv2abx7OoxYHYP0BGGjiJp9qOuX2QKs+rf8hFqSckccDsKywG8YaZp+xxqD3qMZbncq/eQ20Mey4HbYykjTukYGzXpYVcdKAAKJFes2aamhqKhIM5/sd0RMRU90+gz+1GLUBLFfQGpAUaVGsVkLe/IjSFzTXgbN7mcIu8iuWTCxg0NL6X/B5Szg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA2PR06MB9162.eurprd06.prod.outlook.com (2603:10a6:102:408::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:00:18 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 14:00:17 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 3/4] python3-imagesize: Avoid non-ASCII in SUMMARY
Date: Mon, 17 Mar 2025 14:00:03 +0000
Message-ID: <20250317140004.1808848-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317140004.1808848-1-niko.mauno@vaisala.com>
References: <20250317140004.1808848-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF00007A86.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::618) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA2PR06MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: 29957087-6cca-41f5-3fb5-08dd655c0c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?euUKX+0JyY271kF06EV7PW+uiEofhoBzEy0n+tgt5SAxp150+sorGzt7KbO1?=
 =?us-ascii?Q?nSr8Q5yXB9kWJZ4pjqxH1IW1iBsUa3MY5Obfn3iQxQcSj99EjazBhqocl5JB?=
 =?us-ascii?Q?gfnIjYQSGcgsm6TRZLtmby7KZawWETVhjuFFHH8sJC4oe+dj4Citc5lqr2Wb?=
 =?us-ascii?Q?fKPMRwcifakHg0L5yOUFjF9t8msOujH/a2+kjRiG27d1ima7jpoUH+9AZ5gy?=
 =?us-ascii?Q?/oU/eowGOvJVXFUdNnc3vbh6aq8Pd+kQ+JALeYTZFfJ1+i66Xi8TfUJCzJjK?=
 =?us-ascii?Q?68zqDI1XdIxsNhnMON4WTzdkWiUWaeOAHk2mmm8gAMkBQcc+IR5qZ818u8y8?=
 =?us-ascii?Q?nqu7RoYrpU3zN/Lb1sekbrKbFyHmBqyRTIsNhLHvUeEc3TCrvPeHpCzvqWIA?=
 =?us-ascii?Q?+BkrcjHJTq4njYyXDWUdoES8WcX8yUldXUrv/4LYe/eGljbtsQBjSjImr6gv?=
 =?us-ascii?Q?Ivm23VCqvGRn7BG7ejRLAyY7sK+QiUMRPxbWnRctQ7w6jehI46O2hlUQOjx3?=
 =?us-ascii?Q?iNCrCh2LunEzLmZlwy/BW8Qo6lgd0asD5j9SnARHUNOirOZyy+hq1Z/WDDcu?=
 =?us-ascii?Q?ciSdBl2G0Rg9srwWYW6UGb+dSwg7oeOTiiKINuQzjjuMpFJV2wywvzXw21Om?=
 =?us-ascii?Q?5Srlks+JGADqEXGa09YNEQC5h2kpjaXiMVYIZxjFdKFlNah9UB6R/z+7Wnaq?=
 =?us-ascii?Q?ydMuVZzk4ZlUz1WbG3J5jYkZkMiUyNzTQWJcQ6QOWBWEmG5Gp6sZu4wEAUob?=
 =?us-ascii?Q?+j1VWOBrxJ1yRVYAta5RIAsJ0gyXT8lOZxSdlSusHKB7GxdP1/pWWLJJZp+t?=
 =?us-ascii?Q?NZbJP5jqMKKKdUlxSBkP06gO0DkvtCB9CiZquSxIp5v27uJ34LY3fuxlvFes?=
 =?us-ascii?Q?DwDVtZ0niZuR3uMIoxm2Cgj54q8gP8nsivCeqsnJdq/N3rSl0P4xZB8g9QZN?=
 =?us-ascii?Q?xGStbmlhzMiFw2wFexObpHhSaHDCcLVn6XKHJp76unfUMcqJkcYtYyBm4d5T?=
 =?us-ascii?Q?m/8QAHrpWj0VuhTQpc+cob6f1OpCE7emwYwdzk/go3Tf31cXljTzm1Lsoyzl?=
 =?us-ascii?Q?aV+HW4lwRYc5oQCpJ+NtQBHGhFfohyWnOCC5W/QjNZJn/7+WBhupWp7HYzNm?=
 =?us-ascii?Q?ZPuPJT6CbjYwfsLV4OyR49Q3HMMRYGSZOebRYwLEDNM6lphHBArUAlpclG2h?=
 =?us-ascii?Q?mI3ocbL8qVUY4fHdNa0CzL0vaufvtwWPc40HV1vISSznMvAxK4ObVosvs+Zw?=
 =?us-ascii?Q?feoNLN6Ya26DnY3TG5QScjdX+/serajby5Jm7bfbhfAnX9nHwwr7aafZkktc?=
 =?us-ascii?Q?OR6wI1Xt6FQynlMhANo1tYdyVYh9He8oXu+3izVPQLol06BD39q3T9RxWd31?=
 =?us-ascii?Q?4OZ0J7PmOEdRDN+r+ZcaNXrvCkTgi9ETgT6+GL3FoFT3Dslq4QjxIw35XUqK?=
 =?us-ascii?Q?186f06+vAhzfAUlF5TETlcHi50jTwg0S?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gFOj1R+ghDXjoXK9XQICQSGNwsWuZSZTXd0ojPrf+IjHk943OVARHFOUwBz4?=
 =?us-ascii?Q?fbjP+xTvZzlusGbC2+X4JWifeEPUnRwskaHXta7+hdfwosMylf8hqPq3hdTn?=
 =?us-ascii?Q?7ParpsgRCT4dzS8xy4IlVinInJN4/mqjqL2qOoSCPI9X74RMzAtW73a4EMwI?=
 =?us-ascii?Q?aH7UJHGgo/nknELCQybyw+AgiD3D4EGZ8pABEYwBC7propcLvNCVfodjF32A?=
 =?us-ascii?Q?zkD8Vw3vxl5N1RFGzWCSNN9dr6QwChNskK0rGmxCPOfTlpD+8VacI3qAisQ+?=
 =?us-ascii?Q?r349eIL6l/BgouLst6hWwKbYaioLzI/j/cD/jY2XGx2ghOfnPV/FPu4Q483u?=
 =?us-ascii?Q?GKDf+2oPQQuNE5Qj6Mz2yU+JXV0/AzL+7jLp2AUf5CkVjYVZL9uy6PQoOzjA?=
 =?us-ascii?Q?hGaONTBTZoSKZ73/mD1GfPf26KqYhEeoshvl0FO/PvA7R5xaqqwIcPuqQcBc?=
 =?us-ascii?Q?bskCRaQqW6vdZUqIWTyJey1g1vDvtGEkGUNXilO/frkCnsaU7MKnnD2cAAHz?=
 =?us-ascii?Q?EMyPglq9rhMnMCg0Gph6tlN4CDRuDtHJHsGUNDJzqUtTqQcERkcF9qiK+9sw?=
 =?us-ascii?Q?FG4AJXX2zSbsjrB53untFQR7G03kBZMbZblYQKAyoQX987J84+Xs2aUztNH0?=
 =?us-ascii?Q?xaSfIxY+Qjtj8TdbFbBT9sW0dLf0yMlkcRT/q02PK7UyFiqog+VTobh+5lXw?=
 =?us-ascii?Q?SdyUCL5nERkOZmCLvO75q/4VpWOUHi2f7w3tnC+L1jTW4rlGpVF+5M6G/ONL?=
 =?us-ascii?Q?gAgVyzkp1MRSh27FzyUmi3fLAuNXf9eXfKLRBQJ3kJnfAXy/eBYo9qOjE3GS?=
 =?us-ascii?Q?QNiG8rrNluxFpE4+DNKn6lMaZexy8YGB/anBCal9CylXuTXrPybTSwiov98/?=
 =?us-ascii?Q?2x+zB/Nq832tpiwA5KtTVhFS7DS8KLbPfe/p1LgIvZ4c+7bs7hvfLTeJTfpX?=
 =?us-ascii?Q?iKdsckJm2SwQrp7BjVObh9FIKtKSIVEBoYr5Uc40cUL4phHbcAIpSAZDDPma?=
 =?us-ascii?Q?S1xIK3A1WAwBfAA/xSQFBbZSRQZQD13DHnS6PD31xmjk5ObjnuuMDECouKn4?=
 =?us-ascii?Q?zU3dGg/hyQE1KKYQJ+ap2X0CUvBR7wFRma40/8gi0IYqBC3J8HWAO4j1IzbJ?=
 =?us-ascii?Q?y0pDkqQB2FRSHoIZHi5z6zfW1VNyxVFu+9iM8lF3NZB0iuAchVVbQhwE6yIW?=
 =?us-ascii?Q?BDBGE0HkKgaDj7aJkuASw0bqzZ/vc/lrOEKY7qEBQnUI+VFX7rCkmaM9Bttw?=
 =?us-ascii?Q?NZd8DhqGN8P6H2Z0dh1s831SmIylWMw+zOHbURrDA73u+zCJaspu0ERfwGW/?=
 =?us-ascii?Q?8W4EE6d9TpwztzGThVYgjU9j0VC0HmKtJ05QWzQ8FP4vs4q9iugqgwxqv6Ec?=
 =?us-ascii?Q?QQnw6rBE17UZ5t+buzp3e7Eh4H7nv7kllfQtoJdVFsxj71xMBUHaZe2qMsvN?=
 =?us-ascii?Q?gp5vDYpvNPnKyQalGi4p5zibmZfnDhL5jRxcp9HLjSZ0PJ42mD6Qi+UjYbY5?=
 =?us-ascii?Q?3Hs2+hwzGxOiPsgKaJWixKT9cLayQzSdt/Ae9vzyUTjSsJqkYHfs9YPCb/pF?=
 =?us-ascii?Q?OnWDUwBiZTQKPoHFsse1NEqMHsaNryeyoznYwY0QzJ5AcTDdQP3imU1unVlZ?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29957087-6cca-41f5-3fb5-08dd655c0c73
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:00:17.8300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th/IPy77CEa9cd8USMUiHSQWoGJq2idBSF68NZa1LGNGfLPvkb1sSSu4UeXsknSQS3Cn9J+Qppmy4HQLabY0lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 14:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213101

Replace the UTF8 character for right single quotation mark with
ASCII single quotation mark in SUMMARY variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/python/python3-imagesize_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb b/meta=
/recipes-devtools/python/python3-imagesize_1.4.1.bb
index 4edac0a533..7d37e2be24 100644
--- a/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "Parses image files=E2=80=99 header and return image size."
+SUMMARY =3D "Parses image files' header and return image size."
 HOMEPAGE =3D "https://github.com/shibukawa/imagesize_py"
 SECTION =3D "devel/python"
 LICENSE =3D "MIT"
--=20
2.39.5


