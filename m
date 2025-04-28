Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CD6C369D9
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 09:41:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44232.1745833290050988842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 02:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=621324afd8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4USTp031481
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:41:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf92rpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:41:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMpyM/pWLmfY01dImPx8vvf0mrCYQRTIlBf3bk8pio9PTDKmY32cowDgPcGBkB5E93MEzTc4THYMWudpIPnnaX7PQKVpzoIL/SwtJvO+XLvoh1UeCkDMouT77qCJYar/+voNaxYqNOOXMZeYKbv0y7UhBhE5tdna4JCFpw1XfcRJOvyEuNUbdeWbU1zsnR0GO2xhGCs28byELZuEPk6qg77nyeNDH3sYcNXaEC6XyLlttWpXnCsd+N2sQrZ5YwPAGh19+PDKmrG2Z6A4RKr7iUFBDf+grMCdVXhii/HfrNZBbrlUiyuuOjLr8t80S95zYKUAPS5CgC1fPX456Zo4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oAiaYFpX/SlKlXzlhm4KkA9ZykV+wC4Nl2s/ygK1nU=;
 b=yai4rukDfyvafWN/MFm7i6h0fuistWc5vy/hKk7nktVyMAuGdIrvCZZ5xEa5RpuhzTbNWAZCvWmxjW7fJdxP5LcIB00hAqiVTt4PIOC1E72tgUG6T2ax0LIfWl9WGcxz+RB80tplBbvk/M9h7gLF0rkXWr16zoJ5ukTZ1ojIrgEkDf6qD7m4hOj4Qbv3EDP1s0e0+o6wVTJm1e+Qyk9bLG+DnWW/ikaPo7Lr2k1hUP317g6S9b1e9QQlUBry70cGsqdh9w6sXS+9cltagIT5HM80n9Mde2lJlMuUqFuHf3r6nUumaIw786ZU9EHYQnuHhj+1psdJwAvMCyQU7C8eXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 09:41:25 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 09:41:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-1178
Date: Mon, 28 Apr 2025 02:41:11 -0700
Message-ID: <20250428094111.3979026-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a015b0-205b-4e0d-453c-08dd8638d753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SEBo3YG2adhDat7wWwnydVdQKS39144PVE8gl6kRnWtvqwTtv/S+jIJlKc96?=
 =?us-ascii?Q?mV1YLXq/ph4tpteYgOYM6AQdbAbBmPjuK5+mKnBKD9sMW+9oQsnRNGDibYDt?=
 =?us-ascii?Q?3XTeZL96npCxHrb7aouPs8JPqEj8diCE+Eg4hQgk0iicbKuaGExjithqViPa?=
 =?us-ascii?Q?rc2CHixhNyFl0xD5kvHyJSSVIJdbxWS3skHgc/hAyv22x/3OfBaj8ASv0mEl?=
 =?us-ascii?Q?Eh2A3jhjgslCrUhsQc56xus698bl/oTw/nJl9yxa0Z63tAMpofYiZ8m8Y3lv?=
 =?us-ascii?Q?nxS589lzuYYEg9mOc1sxoXe4omnldzYQ5Pq8ir0bK1EW3t7fG+6EUpngCuLH?=
 =?us-ascii?Q?vmPxQzGrORb/r2ZDFxzRXvRpWQ9ikuTcQtmGwy0dK1LKL0MmrrjXVDD2ywvN?=
 =?us-ascii?Q?Si6D0fs4l9LH0IRL7YhO2MgrRt4l4rS1laDv1/Jx8b+1OTjvpwnK4mDRU900?=
 =?us-ascii?Q?nn5tg0ZbnwHOydOm+Z2srvm8EfPlB1QZTKBb4zirB0RHTA665yR2xoWNvyuf?=
 =?us-ascii?Q?m9Air2kNQXVyb9qk4kgD+QlKT3gOKr3crq8ikaNhx0PtEFmnyRaXj47ScshF?=
 =?us-ascii?Q?GK5dDtB9qfNGF4p2ywteOvCoDDLwRIViD6Hrp/D1Qby6eyhkgwBQcfs/5JOe?=
 =?us-ascii?Q?xITnKK3o+IErKEzFQn1VVfj9ipPyxTbPZRBiUiRP40/S5Xmky+tOnvS3ryDM?=
 =?us-ascii?Q?wCYCbk78t9plWM5N90UkF6KL9dV626IUeapSx6wA23m+HQCp4kSNOHGMO/+J?=
 =?us-ascii?Q?fApUwvIzxXpU4AUyWU/MGO8WHGfJQDjSHL94N6XqYbbu+6HUqcKBpA9hNOHr?=
 =?us-ascii?Q?HmOveglYwgN5Jxn9K6OFpbgd1mCTwV6yw1NuawhDdbICj2U6pbAGwLeV1Pw6?=
 =?us-ascii?Q?Xq6DEqHC5ckK0FdvXghWTTdhBj1bRgVcSWAIsG/kTxJ2tOG/ZMprKR8nhIC8?=
 =?us-ascii?Q?4jXBwJbDK7pJ5nOdz+/xYOD+/llETvQS9XqBqWRWqNGmqNyAhRRlElgpjHjs?=
 =?us-ascii?Q?EB2t+PnvI0a+MyevQdK0LvjQF8By+R6xC1rbkCdaq6sdt56XxTxflM8G0o8r?=
 =?us-ascii?Q?sYYvYtSkeopidCRTHls/ItVkaPXi4Jn7CZc4vwtWpo/DxZ/hTuPQ/qoNbPL1?=
 =?us-ascii?Q?Y+DNV0fZp5UdtDJLgxaT9jijipeB/5ny0g3PM0VeVDQx2RTge58gp2xJxEPZ?=
 =?us-ascii?Q?E5jhGT1oe258YtaJ8HJ7AIU1SjgVZFC9l/xLCRydDZZot7aV3+CZUm0W3r9J?=
 =?us-ascii?Q?cOAzrtNEWz1ZyZ7R0u7H37EZbMnRD6Lkx5z8rkmwi1RJH8Ir7wj1gs37VaGY?=
 =?us-ascii?Q?6nmZlKIvIckvVedUXr63+BgdKTDV7KP3UFZRIcAx+ASPyMN6ES0YRXdmtZ4f?=
 =?us-ascii?Q?gYfEPyVLTlmhkLl3gT4CUE7yj3+VDBdzBEEv/tXJtsLL/IhdjoLj5GkwmiV6?=
 =?us-ascii?Q?++p9k96nDVI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SKt4SEngfA+O7HNfVJCnYH5eBY2WTkeVzbve9xSl/udWKoVibdbioR4Nc9Xn?=
 =?us-ascii?Q?1OMxeariHOnFVMuoUzwojWLDUwsczHXd4P2tb5BVtl0PRhSpdoF/5ibiLdPC?=
 =?us-ascii?Q?9l+dPxrWTe6YMSKo0ndoe62jYJcH9oBaIIx5HJyfwcSce5RTRmTFxJDlrMbq?=
 =?us-ascii?Q?xE2/pOkFZZ1wnU21tcr76QyL0Pw44gznbXSUuhreLWZGHMDCQGdIm5TcxBqK?=
 =?us-ascii?Q?bpRwc8/Vik13B/I2nUrFRKV6XP96JVP1IbAToWS9uCYUmTPOl9VfVNeFw4o6?=
 =?us-ascii?Q?iWIpJukgNryK2B+TByMm1yPSimkDt/dRSchBjDGZs+6VQ4p2aah5gOt2USy7?=
 =?us-ascii?Q?kKyzCq/ZLZpZvBWfI9VwrJcn9V7Uv526TNgvxPsob8mAD++t+/golw7djTIx?=
 =?us-ascii?Q?hosvODXiT0lWTNBas7cuL3FWSMJfvk7d03PzCOli5hiYF41CsFHl6gRjzOCS?=
 =?us-ascii?Q?eeTz3+Jx/APGuSOofeor+Z/a6B2edPF/BC3MfDRMEG5ZrctTNbmXRc2ecP+T?=
 =?us-ascii?Q?2TzsiFMcHB2kUblNh7gD/ZYqHtdT8UX0LfdNWKM32EplMb+c/R6DHM5STfoa?=
 =?us-ascii?Q?yXdrWinQgOfp8h8IuW9x1OHuFhW4bSVJf65r34PJART84uq/RmSF+Sj1Hvvn?=
 =?us-ascii?Q?tyYnOj0nc2AajO4uTNMWTktkjnd0SFMeOu9/ahu25DcTx8GyR6KiTio5Lz+Q?=
 =?us-ascii?Q?jE0W466Q2ro9rt2nn71bl/a81kRgmv8bqqKMI5HS7vjRSd2Sojs+k5bc8cz0?=
 =?us-ascii?Q?jFG4CUVEK5QANatrAvAjzvo4pA2MA1WGijRF6Uq+NeZYuIZcZcGB/5kmOy+W?=
 =?us-ascii?Q?hd+UVKJ9kgJPJ/PYFLI5aNhjjWQH6hmjJd4T8QC4gXNwauQLj+1j40VdzaTD?=
 =?us-ascii?Q?0hImqoy7HI/2ZXDIsqevOOTQWLUB55woSavTJF6IOk07PUX0kSyyyn9r0PlS?=
 =?us-ascii?Q?jlBE2sk8RRadrq6ikNna1N5bhmNAo902Fld9WyY6JosW+CgQOqJXCMoNow+J?=
 =?us-ascii?Q?EOcrv2lb+4LAlMdLkC82YtW4RWy+cEFpEa021iTpPE8axMbASeXV6GXYITmA?=
 =?us-ascii?Q?01w35iBYl3I0+ZdvXWgcDyt+Hpw5QwF3nWvF631lMbUMhjJUnWus/rYnIyjZ?=
 =?us-ascii?Q?pYi0qvnvCT5dCeIXGp4Fms0b7yI2siALFJw6SxnzQHrUambDAliKV88C6SPF?=
 =?us-ascii?Q?gEyOUz27c1DZVhBbacSxrJaa56WUwuqWDZgRYxD3ZxjSkKTxfvAKMIIo01Mn?=
 =?us-ascii?Q?rkddU5JdlIdej38KbEXHnjV8j5lmsxVPQG80jLHZ5Ktd3ktE8wgIBYA8s+YO?=
 =?us-ascii?Q?G3vW5gPPq5yleC3cUbYOGqGhXZOABg9iwQKZ2jglfrRygcCNiqQn3kr3swZA?=
 =?us-ascii?Q?qyrfjNR5ovUtWbh1UTRd1mh37Azc+xes52c7Lv4402IfUCkJ9SEbRj58fWA0?=
 =?us-ascii?Q?4SzHzbEM+5cIAICVBCZzts6fa+UDArqSMpCNVfoAh5jwEDJ4lHv9YR4tfNnk?=
 =?us-ascii?Q?Ao5UeCROkneu92Q1fQ8XhZmGN2nMHMZVtD3/sgBgdAL9kag+lE8Ldu4h1G4C?=
 =?us-ascii?Q?4/VnO1qsUodsogArpWZvBZd5Wu+zUU1r8x6RJWojfFHfTNTJ7qdyk1CG1y6+?=
 =?us-ascii?Q?DamM7gVqKOSZQEQF+XfcT4o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a015b0-205b-4e0d-453c-08dd8638d753
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 09:41:24.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw7Gyx9Rpq+yC/DBUV9qxJSBGOmLkwJaoSuQTJcHkURp1iZGDtegJDcaoOw/AveDtRHZorOLE1lx74v+Cko92CGrnj3XQVUsH+6go/F6UOISoxfO4CydcG0vgL0/6pr9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
X-Proofpoint-GUID: firyHoCLRSjiY-tQuScMNy-e3JoZEAEz
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680f4d49 cx=c_pps a=kqCqMoaEgQjRYYKBKtAp1Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=ufTmR0Mrb7KPyJp3wggA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4MCBTYWx0ZWRfXzGtgnaxshyUi u3S+graYOMj/kYRuZJY3EewJUbUgp7g04eH9QQI3gdQeo94c6hmmf/eVWsJ7ejQVPQZ6rGEYnU9 hRGZPggYkX+T4ELgRlw3UclDnsK4hfz8GDwShmSn+FyARfiRKhX8GSv7ojGgJFZvS0uPiS+Lq89
 Iz5iqwKveNmBWsi0GdvBozoTsSPBR1OnPFVoamBIfsDwk9C6brlUESFRZ03uvU+o6r7u3jfOlZy oT2HJfP4AtB/XHrhmH6LQuDLWh3NefijSyk477khihQCT42g5COviL4CZZAyMSVQNyXmpGquTyx lPsNAHxXXRVQLy3ANkhNOgpVXE6eP8381+AnICDpgsCymmr5c03t0KBtgPKGUJaQhvACq2546eu
 T2glB3WrcR+aKqeI4PmF0om2bCrBlpKUrEvjXvxpp2zHwTnDWzwK9vOFsq9N6IDEupTV6cc4
X-Proofpoint-ORIG-GUID: firyHoCLRSjiY-tQuScMNy-e3JoZEAEz
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=954 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215588

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Prevent an abort in the bfd linker when attempting to
generate dynamic relocs for a corrupt input file.

PR 32638

Backport a patch from upstream to fix CVE-2025-1178
Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0039-CVE-2025-1178.patch         | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 26d0b570f3..82dd5c9eb6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -73,5 +73,6 @@ SRC_URI = "\
      file://0036-CVE-2023-39130.patch \
      file://0037-CVE-2024-53589.patch \
      file://0038-CVE-2025-0840.patch \
+     file://0039-CVE-2025-1178.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch b/meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch
new file mode 100644
index 0000000000..9d2054abab
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch
@@ -0,0 +1,33 @@
+From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 13:26:51 +0000
+Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
+ generate dynamic relocs for a corrupt input file.
+
+PR 32638
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
+CVE: CVE-2025-1178
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 970379de..cbd16abc 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -4575,6 +4575,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 
+       if (generate_dynamic_reloc)
+ 	{
++	  /* If the relgot section has not been created, then
++	     generate an error instead of a reloc.  cf PR 32638.  */
++	  if (relgot == NULL || relgot->size == 0)
++	    {
++	      info->callbacks->einfo (_("%F%pB: Unable to generate dynamic relocs because a suitable section does not exist\n"),
++					output_bfd);
++	      return false;
++	    }
++	  
+ 	  if (relative_reloc_name != NULL
+ 	      && htab->params->report_relative_reloc)
+ 	    _bfd_x86_elf_link_report_relative_reloc
-- 
2.43.0


