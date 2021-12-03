Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD62C433FE
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 11:47:08 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.70])
 by mx.groups.io with SMTP id smtpd.web12.10761.1638532026454447936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 03:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=ZPw7zHT9;
 spf=pass (domain: vaisala.com, ip: 40.107.13.70,
 mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3GnCZ0ZHG/gm9sYj+mAMeZ+Sx/97h8J4bNKAdTLmDV+88aW6Pm0Z6EGkH3omqp1NELYs1uWaLRVgb2bBhoIZ8OYb/cS1Nhi3A2rxB5Ejv6yDqVFV+x0Dv+bbAqeLlH1jPRdoMnihAczHtzzSnHwrWsvkC9N0xQiTzyp8vJqngG4BZvHj4k2eqx4knWiZrio4uyxjHJpnzXBDlvN3hAN+kqtlDHTS1KRS1ofbboDqqlp9KsRw3KZ4ebJ2nt4y+TSLvEGNqtTx+6l5s+UryXDxgx3ALn01J/3d74PmdcQf3PfsZToDtQv6hBjNwggZ3b61FMhXM+pTpmlVRRi7GhETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsuGf0gc5wcL8QAJEjsMbqJmm2r3k4N/e+q1EFmnq/o=;
 b=WryxKBBk58042hSrOnIE8LI/JctBgg2trAHuSGOakvyBpL6Gkm3bp9jDblbpimUs+OwFN9HSRUzK2+vtzWHErKV5hyBo00zFIC33bMvrPzBdPnJklwkQ1mtoLL8Mj8XVuY54lG3wTZduWs1wV9qLp6pefxDf0G56mYZQITKgExJ6DFiPvvhRYN/GyCAfpot9pZoMq7fyhXDf+d37Ek6mjzDzWuziISqnQrxByTW7UrSTvoIMlf8h/G/L028Mzao+R4tgt3ddnxWXjrNkc4GACVFBWUiQNCPNJymE6wP03EHgGo29YzOGSIWDQPQW4+GQuUWQyye99BCoYZpWjXt9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsuGf0gc5wcL8QAJEjsMbqJmm2r3k4N/e+q1EFmnq/o=;
 b=ZPw7zHT9ePlBICimHp/PcFBqwIJsZWWVSNurqsb6V+HqEExQ8P18GAD5lwoghqFdsOrP3P7Ec0KZVTPxZhxszm5XIGJj3ffh4rvXIiZo0Meko0V0N9JpkckcmhmC6RAXmJF+vYpsM2xRa5wfPbLKg3PhBYIiRuXGHilcPtD6mnO8K65AAn0TIPVqGkVgKwJjub0CF5wuiphRF+T3DxtruJ9grdfOG979DLvY64PPJ6VdfpjsEVJ3X5byJxU6fwE5lpFr4fvVphQCWbYhOWY/UeptljpmkIO7awwqqVvBS2WAZmUH7X0yt4Y46V7EcS7R5hqU0iYgMi4ohej12pyI2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com (2603:10a6:7:23::31)
 by HE1PR06MB4092.eurprd06.prod.outlook.com (2603:10a6:7:9d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 11:47:03 +0000
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852]) by HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852%3]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 11:47:03 +0000
Message-ID: <8033bf1f7ebb9b35c62a3cd74fcb910d6ff2d8d2.camel@vaisala.com>
Subject: Re: [OE-core] [dunfell][PATCH] cmake: FindGTest: Add target for
 gmock library
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 03 Dec 2021 13:48:00 +0200
In-Reply-To: <16BC55C5B56D2FD4.26361@lists.openembedded.org>
References: <16BC55C5B56D2FD4.26361@lists.openembedded.org>
Organization: Vaisala
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OL1P279CA0065.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:15::16) To HE1PR0602MB3340.eurprd06.prod.outlook.com
 (2603:10a6:7:23::31)
MIME-Version: 1.0
Received: from hel-blackbird.corp.vaisala.com (193.143.230.131) by
 OL1P279CA0065.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:15::16) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 11:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ad8dff6-6031-490b-f12f-08d9b6529fb0
X-MS-TrafficTypeDiagnostic: HE1PR06MB4092:
X-Microsoft-Antispam-PRVS: 
	<HE1PR06MB4092A1DE6E78DD0BDA90EA7EF56A9@HE1PR06MB4092.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Imn/Iq9kuND236wkC0Shp29/sFWWlBf52yC3UWnJQaVrHT+Ctr/N9QbmsrjVYDxm+et4QdFGTIWgh9sxweAWqzocxlzcYIcUkvErnfWf1hI+TYYTgRPwE9uUlM0iiZKVW6aJoxzCewu5tFLkLcuuYdqlM1PPdBFq6Hg6ASuKoOBRmrGjapaMbFYaSth5EbRbGvT9DFYgR3RJqe2wpXjhaQel/nWWlH5ZdVNpW4G5S9d/GOOiuM+S1xmDpwDUfL0NnZXbuAxJTIxyEY6JUxf1r/hHZhSmE23t06PdV/OrBRdZmNQITzfALTKfQbCloBnR+wwf3x5rF9R95XxdQwA0S5GhixWWO0hKusSZqNbi+2H/qoToyMoPwcq63JznR+P4J7eo3CexrP6KCwzOMyh+Gjd9Y0uK/AIJSFsHLKal/OTykfBIabU9eLsqsR41o9igyUnnH4Ob8pcP2NhxttGn7mEz56qVh/bfOPgM3J66eZlGxy27u+EiTva6wjEE7lLuDNFZu9AWe6HiJ55C+p1ec4cc6SbmD7oWVhIw9ZsWZphz5N9F6apD3oO3TVQOeL45ijMyojmkndf7irOntQcMoz4KaJRz3gzGEOpQD+jTAWaGTdNS4MCR9WrPrailWzFAKnxQVzuQZWO0LCX8vYBWzUzVtAllYToTuDkafzBxekFxDRaDKPXDOVDN2BqdQkA3IB15GGWVpSGgmlrgE3QAfY+YzBy7KksV4AA7RK/xmA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3340.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(6916009)(8936002)(52116002)(508600001)(66476007)(186003)(83380400001)(38350700002)(956004)(316002)(4001150100001)(38100700002)(4744005)(44832011)(2616005)(7696005)(86362001)(66946007)(36756003)(6486002)(5660300002)(2906002)(8676002)(26005)(36916002)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?anBtWHhZNWRYOXZhdUZ1clJUNGszeC9nVjhhL3A1c0tvTThoOElRREsxVEp6?=
 =?utf-8?B?TmhDWWNrWGdpZENELzlwZkdMNDZtOHhzZDFVRk92RG1tR2pKODVpOVdxZEtW?=
 =?utf-8?B?UmlmZWV4RTRtaGNUR2daUk1ObDN1aWQwZ2hYaGl6Ny9Hc2hTQTJCbmNxaHFS?=
 =?utf-8?B?VXAzMFJKOFRTaUNFbkYvdmh1V21YMEtuWVdsY05yQTJtUDNzMkJXQktQVWRJ?=
 =?utf-8?B?Z1dQUDBscUtHNzRwOXpiSFR4SmljeGtQNlc2dWxsR1p2RWZhUkFBQmZaUXVS?=
 =?utf-8?B?R0NBZUsvQ3EycjhyUTliQkxaQmlESC9UbUtHZDdvU1RpOHJkTWRJd0V0UUhB?=
 =?utf-8?B?Z2pLSVFyOFhCZ1RNb1Fxa3laSVBTUDFxUi9vcHBGRUhtQjZmZkMxQTQ1R1VK?=
 =?utf-8?B?L3p1S1dTM0JQMXpoZjYzUEd3Y1pob3pNWFFhdDdvSGV6NkVCKzBnQy9yVVZ1?=
 =?utf-8?B?ZzkrZVlaRUhDRStyTFJuNGtTM0hRRTI3QTlpa0d4djVqdldtcWJJZlpWQjE2?=
 =?utf-8?B?THNTMk1wcXc1N0pTaHI4OGRCbGV0anJCUWZMek1qaWRMelU2T04rbGNPWFFq?=
 =?utf-8?B?MzcxdTZpYlhiYS9rMjRLaTFvalF6QUJ1YjFlL1Q0VFJoMi91TVFiNTE4NmJx?=
 =?utf-8?B?YWk0dVBKTE1IeE84S3V1ZmtTQ2Q5S0FZdk9pc1ZOeTVwZ2hyamREcWpUTkND?=
 =?utf-8?B?a3IyU0lZdUdaZFkyRjBpN0dtRUpPWVpmTTRscEV4SjFxNUhDTnNZLzFVdEZD?=
 =?utf-8?B?UWZCWkNIdi93dmFWc0EvMzBtTThpT0hmcm9SYy9FNjg0a2JhZ3FtbWdvL29G?=
 =?utf-8?B?OTh6dFI3R2ljN0ZiSS9mWXYrY0xhQXArdDBBaFhKaERUQlRJUEVsVFMxaVVP?=
 =?utf-8?B?NU5oQit6R3ZHN1ZoL0s2NFZoMENaN3V3YWJsdEdPdW1PQVZmV3V3eVVHZENT?=
 =?utf-8?B?TXNxRmJhNUU5K3FWSUlWTnYrSWhDcEFRWVluMk13ZGtVZUNvSnU3S3l2TWJs?=
 =?utf-8?B?aERoSWthRTBVQ0l4bzBlSHNkTXN3dGFiWk9HdnhWb29EbHVkdklvcGIwbThM?=
 =?utf-8?B?KzFmdmhXZ0UzLzRrdjRhK1d2R3dLK09rZU1IVnpZRkpUdHF4eFBzQlgyQzQz?=
 =?utf-8?B?aVBrbXpNRktpVTdadTRVREtXV1RyQS9NN2dabUdvb1BXdlRFT3ZPTGRkVXgr?=
 =?utf-8?B?dVhXU21xYXZjSEVoWHhqdnNYZ3JSeTN0cTJxS2Y5UVVaMWFuWisrMU5qbUhs?=
 =?utf-8?B?VThvaU9zMXlYem5FNXhYWlJCejN2OElqY09jRlEwTlRtZDdVOVNycVRSZXFm?=
 =?utf-8?B?L00xNVRyTGltVkRNeDU0TnFqWmNHbXJhemJDSFVXeGVYTlBvYzNHb24vRjVB?=
 =?utf-8?B?dVBLcjBVNzVRL2VaNDVkRGhsYmZkMmtJUWliWHZScGhlYThpSjF4bzVkUTlV?=
 =?utf-8?B?TGJGeHRnVWF1Q0tkUFpPTXJLRVdmN28za3J3SzhRSjVES2EyMW16cXRocUJw?=
 =?utf-8?B?d1l6Zm92akhBYzEvRms5Z3grS1d1ZDhYT0I1ZEZRc0sxdzkwY1p1MCthN240?=
 =?utf-8?B?TUkzbXBFQ1FGdEFRaDVCSTJ3blRPc0RyZEN5WmsvK2s4VCtxczlIMzdDTHJZ?=
 =?utf-8?B?TjFYUVZZbmxwR3pwRFNSMkE3cy9NOWdkdVNRb0pCZnI5b1pJSUFldjduNi9P?=
 =?utf-8?B?OFpUQlJ5bW1MQjRSYkgzWHh1MzU0NWRydWNjWWRBUHlxZnI5eDVKMkZMVzhx?=
 =?utf-8?B?eXkvaUd0NUROb2ZMeGJEYzBZayt5dG1jek9hTDhhNEZwME9Jc3ZweFdzajFR?=
 =?utf-8?B?TDFRMjk0ZEpPVlRMU0ZBRlZNeERVaWVVZXM2V0RyM0FuS1BQT2oxbmhyU1hW?=
 =?utf-8?B?WGRmT1hvR0Z2K1BoMXBGeDdXY3dnT3VtZ2pzQ1lYWjBIaU9Rd0VVYWJMVXhC?=
 =?utf-8?B?cmx0ZGZ5QUdMYTliM29wZzRGbUczSjQ0NnNLYVhXRjFtNGtOdVVwempWMmJB?=
 =?utf-8?B?M3hMUERCTkdJOG53RWN1ZTJSWlQwa1BnbU5SSEdyc1ErYW9vQnNRbStVdFhQ?=
 =?utf-8?B?MWIvRjB4M2xmN2RWZTl2SHRYUk03WHBxOWk2TEx5ZjZaSkxxeVJ6NFUyaUx4?=
 =?utf-8?B?d0xIa25WNmI1NmdaZnZsOXY2emZNV0paWS82NC9lRENrK1B6b0l5QXoxN2JP?=
 =?utf-8?B?cklvdVdlU0dJNnVTdDE2OVAwakZZK29qZUtYc1JXMHNZaU1VYWFnalMydHly?=
 =?utf-8?Q?PtSLCETOmIR5QWwRbAeYkncMPLYbviJA39NHWwJhWk=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ad8dff6-6031-490b-f12f-08d9b6529fb0
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0602MB3340.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:47:03.5670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oPdXnDayNLSBM4wXQcdH4VkZ7MQ29Lvu9nBcTSWwZR65KQd3i9W9Dy9mFf8cVYYLboJ/19ztxDgg2z4sN8GbFghQwP8NeMnPE2zEoRRZh4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR06MB4092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 11:47:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159115

On Tue, 2021-11-30 at 15:23 +0200, Eero Aaltonen via
lists.openembedded.org wrote:
> 
> Update `Modules/FindGTest.cmake` to provide the same targets as the
> CMake Config-file Package and backwards compatible targets and result
> variables.

Bump.

The googletest recipe at meta-oe dunfell branch is for version 1.10.
The fact that CMake Find Module masked the targets of the GTest package
resulted in a number of very confusing build failures.

This patch is mostly about backporting the fixed forwarding behaviour
from the Find Module to the Config-file Package that was released in
CMake v3.20.0.

-- 
Eero Aaltonen


