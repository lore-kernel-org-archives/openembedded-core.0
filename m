Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A018EC88E70
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:11:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18563.1789387889938555241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0wjZqSvA;
 spf=pass (domain: est.tech, ip: 52.101.84.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEUyDqiO2o9Z5g20d1/3NCUH0C+q/ThDwkfcpYphzP0xOgSShP/6h8aga0Mpyksr3ZtQXVz8ymGcUUJ2nWsZKteifBdWbDoZgJFLQPQ9GHkBLTqA6k9CUAGS5/wF5Gn3AFnSM7wJ0uUkebZEztwYaxE1oYSlwrr3mJjz53AqlovdcFF0YocSmm2hFs3dK8fN+Op6xQ45O/AK5H/8S1ea1J+qlCNl4GlN3TJMpVuvXA94TiFm1dFMXlcf/JynT0ViEAv8dEoUBratqWt1pCsUIpGZdPwzylJAflVc/REgb9NNiEtcfq5s0t9RwXhfam2Bjq9fSHlAT3bhYTpNnIp54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X54cxwDNY5cMg/O6hbJbZY0UydlFNnxQ0ZipvPp2PA0=;
 b=MKr/LlxOO1F/PBVOAhn4+rsPk5rbOB1zWsfqbDBhyLsQ72RpgYVuEhVbw8QTHz6aNWpR06HB1iE4lPz+UFtjBS12B4ohyzp+DuOCzmC+PzTZrO+3wX6SEi7m7EWHdKtsq3TGl5C2BF7PQhgBch6TANGNoezsuMMeodvB6qLARrA2WzyULWbtCMRnHar2i2wlzS8/W0nAznR9+pLdVxi1pcoloolVQ9GlY0XawCE2mbhysbQAAWcnlz4xqzL0v3jhv1LWY5GDMdBn+yzR6CL9UyKKjiZR/sCoBK/oJyLqVUI3N6vxSmiYn7e+l+v/aFVZQqT3YRvGplNcxW/b3yKnDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X54cxwDNY5cMg/O6hbJbZY0UydlFNnxQ0ZipvPp2PA0=;
 b=0wjZqSvAJ7JX23HNzBaHj97wTnBOPC8wMwBE5zyIWWFhauXrNMBFhOlFJky09Aq1R7LWwgsZHWpxyskvwn82+Ej2vM2w6wrTC7VpXDQT/bLaYlsCBZhI2iZ6UP6cY55ulmqbMkjlTV6bTjrQaa4X6p4RkaPvhycg+HhTSnuWODz8FZpdALqtvcTQRGouRxVjGsnlcVCXgH9uvoZH0QPn9Upt8LXfMkD4OUR6hw8B5uwk+Kb5SXr3+aGYkOOrOmlgJOlaA+ax38tUEKuSqWG+KPQPAyaEfnlv+Za1zy7qDZhYPGdGIBv9sw5d9+kdwcFulhAGLTB623oTMk56WqB2wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2444.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:11:23 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:11:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 0/2] dhcpcd: upgrade to 10.3.2 and tidy debug packaging
Date: Mon, 14 Sep 2026 14:11:19 +0200
Message-ID: <20260914121121.81692-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::30) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2444:EE_
X-MS-Office365-Filtering-Correlation-Id: 5560b787-041b-423e-f4fa-08df12594b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GF6ta+mGYMyq2u3qBTmOA+bjQjwmRrwCw8scsSy2Rrm0KYK9PKG3bvk0qi8N7a+EYR+WH7zY2fbtkRVWE4BkRQir7l7GOtvsKnkSXbVTET4pI74qfyUuidPbo+FCO8oHe1JOn20hCrQ/cvkZEJLtwx5HUeo4LRCbcjRQU+rh9nFMKNVOb2APcFB3fzWK+2ABQw/sMJSWLN2s3e7SfhecopTkKchpTbhDDdKVDLiJ0WJKuyRwRsA/hYArNvWig3zY03N3AKaPUtxCYkqOWi4B6+2peWE2xeGEfI3etEZ2NjhaVQulqhIjAH6Ds4tEB3J50ebtFJQTjdgV5GGNIzMp1RdDlglbfe3AOJ83U38V9t4Da70+Z8LSewoX7x+6uG7bxHtrswwx6sFZdvrrNPLTt4Xan/YGMkyWnosPS+bZHXQPWcbKufNU8Ktuhelf08lLoRK6gAz5YIUMkRGrktWGdGtDyx9JCqaik2Cy/cr1Y8rlOUwhZnAgkA1ITJA2T2prdAFCK09+PXuMxy65vQVKsxRYptVyQVK2ZEz0XacsP3eLKUhKLvdfU+t4csDrmvesxfrIAPONjdrShCksqd6jTCqCeihJdDyOc25jZd2geyWXtKVr+keaTdSk3soxD1gZm93TL3RtU3xTBlS9cLdr+Y1ODypI5SmLYTa9YgyOf+s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HaJyiM5tyaX0jqZS53dwRNbeMmnytNFiO2a4ujC5OctfY2NGxVKkpGpmMp8y?=
 =?us-ascii?Q?GA0tdY4zsY4LpBEhM5UoeYjdLxFQdfLW8C6NFStpLESzlyMZlXR88N8JSlK/?=
 =?us-ascii?Q?h8YWwngwGm84zNtqwqJsbSiuCcMW7MFFS55r2bFOyENPxOC1k65QEUuUfztT?=
 =?us-ascii?Q?bUoSPWOZ639Vx6XdO8kz8b8y/KvnsRM35RsqiaIackGZFLKqCNn1N7GNINlg?=
 =?us-ascii?Q?bvZFg7meBwZ63NTcOtX3bbKEM43LNYxYnXiHXbLQRbHyeXQwmezcpQyO5sSg?=
 =?us-ascii?Q?ksCOmFhmRkkAcp9ORJClZMlSe2PBpvW+87ztV1+oZSwrI4ZPPusi8hlFVExF?=
 =?us-ascii?Q?DBEzLwJDTWlSv+sN5mdSfT0HpZbbOZxhgGNg/4TmbpnbiyuPagTWzcQllP69?=
 =?us-ascii?Q?JJSK1T5O9dZmjCGMGNcgVNkf9DvJlICIfYoPrvdi+W43bQnTEx098WFld+ij?=
 =?us-ascii?Q?vxt/uLEUxPFuqeouUWU3q+VTAR4+Z2WmYer3h2Jl3Cq2DDr48ivqsQclFw92?=
 =?us-ascii?Q?y/MXvaZfAVbDuD5rxyV3W8T4vzpNvjt2OX2j3NR9iQcD1nkX5LNlItz8P6zb?=
 =?us-ascii?Q?a/nTssMtq0tiJ05soqs2QkEBipIdT/dgtDdpsbrvd87TYM45F8sxBz15qxLT?=
 =?us-ascii?Q?35WXCFSUTjrLuR8R1ybDAy9butZFOZvuQjY7bRHtSVXUF9k3zGKFWo9dJF4l?=
 =?us-ascii?Q?KYZdg8jGvS/hFx6kBv/PxhWCu6as9uZi9b09y69/WRroqinRF1VpjLGg4EAh?=
 =?us-ascii?Q?pM3kt1JU9bUy9D4yLNAcWajOPrSZ2FDDedqwxgclcZq3QFRcQ/e11KK+BDSl?=
 =?us-ascii?Q?/uvZPOHJeYqkr3/qQKGXFibnFSX1winhfMJsxb7cSIM3yUuyqb8OJq2B78F0?=
 =?us-ascii?Q?PVGFQmylSuSm8YUqiMhvYdkxyACs2nwUM/vyfLtmUPN4KWOHBVCMV/Bzv20l?=
 =?us-ascii?Q?6gNbYTIXIONJhn1mp6DCnHSj0vEa2mnjhLWepZg4+DFn7kGjBtHzztIgCaMP?=
 =?us-ascii?Q?BQV53aElprkvC+gZmAKaKa0X9UG5aIxVwXKFgkCHYt34h4tLZonjzGNKOs2w?=
 =?us-ascii?Q?/KYAWiRekIktkl5cG3rlXnOha6VVnKcNeH7CpHcjWw7CWoErDTjXQkhcsRlr?=
 =?us-ascii?Q?U2dFlUsiMji+3eqAjogOyrKAP4lB20wUgu5pMS6ivQHtnFER9eGWtBwmmaML?=
 =?us-ascii?Q?fhP39AzZZzMd9QYppCp4vvsz0kRDz2lw/oUURSCcs98H5+yUscVAEcTd9lOJ?=
 =?us-ascii?Q?pHCZ7bVRQ5CF0R93rUXA9vGAOX+k+cYaYzhfDH6S4AA3MiP+CSeMn9/Zavv1?=
 =?us-ascii?Q?FQc89TWPj7CB/WFPOM24aFo2QbY6A8gQDDp2oSv+BVVgjpJsbpEf+NI7HAQT?=
 =?us-ascii?Q?ruQg3aVndMQhs9H9dcwC9LOQdXN99uucqlYRO2sLFt8h2+rcFKrGAHg3RM1J?=
 =?us-ascii?Q?FMdwUERUfi1/r5yIYSa0Ra1+5QEOxR9BmAAgyFzZQdPJ0FDQRZo7bDj5Tdzf?=
 =?us-ascii?Q?jN/zptSVm29GKCMpXIUoSg6SUMGdylbF8TZ/pVw/mV3V+DfgZOivLWGJd8s9?=
 =?us-ascii?Q?rAxNew3oQUYaWhXK2eYzEXmSgh2l9yQsH4FBAwEWqtvJds72hJuFDJbEP6Xu?=
 =?us-ascii?Q?6wQgWI2ufG6pCn8+akfUmdUWb5EsVc3xlGY5hDztCBmgrAKN48FAoWzRM4Cr?=
 =?us-ascii?Q?ZSuaLXTBlepvYZOIETMfTVUASezMvq2M4VZQ03HCY7JW8ubdENDUyh9bewPu?=
 =?us-ascii?Q?ulqSooNO4Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5560b787-041b-423e-f4fa-08df12594b30
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:11:23.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QYdKeCKdx++VjoBNWFZUlaijB5pMDCf/Q/ScJ5DyOg8kbAfyEYXHpBI0t6vqMvDKzvJPtJIq3iowPXQZjWFcSBBhQD0pKrgUTvhMEUd0DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245774

These changes are backported from master.

This small series updates the dhcpcd recipe:

 - dhcpcd: remove obsolete explicit debug packaging, since the .debug
   directories are packaged automatically by default and the explicit
   packaging is redundant.
 - dhcpcd: upgrade 10.3.1 -> 10.3.2, refreshing the associated patches.

Both commits are cherry-picked from master onto the wrynose branch.

Richard Purdie (1):
  dhcpcd: upgrade 10.3.1 -> 10.3.2

Ross Burton (1):
  dhcpcd: remove obsolete explicit debug packaging

 .../dhcpcd/{dhcpcd_10.3.1.bb =3D> dhcpcd_10.3.2.bb}             | 4 +---
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 4 ++--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.1.bb =3D> dhcpcd_10.3=
.2.bb} (95%)


