Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146B3C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 10:20:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web11.7792.1646907617740229007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=MTlPo0Sk;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.73,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGsuemr996JxtE4ix8eGmDwT4NnawgNOqcxxWItQ5r1YsJMKlL3MnYCCvA3p7Njnv2F6/Gj6UcOeYGiUhoh7KOogMWFXy/g+QuXbMRrRMvKJIuel+3JUlyKv48eCHkQj1HdOe8W5ESkTZuotY76ggAF/cgXzUI4G4uaLMn7oZkf8DUaHzdJQN13N4W74OKP0EP4O10ODGjKVtCi+T+01FdVR2NVukZhV2ndrwqRQclvOt5lz3mmEl5y0qj5iQo2LWLP7MUkm6RLrCB948lRMRm/uwvu7nnIakffSp1XoHgqi0qF7ffxvVz+YvTRyKU7yv27NoQu2g4VlV3yfYvVqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgooQe3P0PGkXOW15JrqXusSBSeinLJsX6foNB2Wndw=;
 b=T9z/xhhs2BgtmWczK4Qwf0acS4nw8X9VklV/Ev7yYWSH9PlufSwPxlvIre1zOHueCBT+WGGMx3r27mfbbu5hl131lcIngTpBYyQy1EqAIfdytHMWlXT6XJ/Gf1eTtWZRirBNiqsisU3mRShVT7FFL4EgywzLdOX5066xsNuHN4LE2oj8fata8JNGyVHGyIU5vAvrDoRg5d0QpA/gxt1TXHw8G7ttSjatMonbTn/qBYpUxkDOIakOfoe79sdFsALBhieRgTjnjQyHB3cONWpc8x7f4Ex+CMZmsQT03MULAW+3Tsh1IRDoFhObOS0hVW9B5oD65fQdYS4Ee6VVMeTXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgooQe3P0PGkXOW15JrqXusSBSeinLJsX6foNB2Wndw=;
 b=MTlPo0SkDveBTFnhys+FMTy4CCW6HoVrLYPwjKykJEdRrU/Or44uKU1CUvGtQXlXyPrCXZIhQJTSH/JzOLSPa/N/oO6SFUJ8UXbiQnf57EVt149OYU8bkrCn8ME7JYY+vlqHIDh5aIDOY5u/w7HUEd/Y7g3xmCRAfZecQzmHcwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DU2PR04MB9114.eurprd04.prod.outlook.com (2603:10a6:10:2f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 10:20:14 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 10:20:14 +0000
Message-ID: <edaf299b-6f98-4f4c-8dd6-0b25c0172051@theobroma-systems.com>
Date: Thu, 10 Mar 2022 11:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] local.conf.sample: https and no newline for
 SSTATE_MIRRORS
Content-Language: en-US
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
References: <20220309102850.607681-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220309102850.607681-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0031.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::44) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a800ba82-60d6-4ab0-021d-08da027f90f5
X-MS-TrafficTypeDiagnostic: DU2PR04MB9114:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR04MB91142950306D5DCD246DBC29C20B9@DU2PR04MB9114.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sDpCLZyke5OGZMEnyKwpe4VVDjoF2IGPxSHdFQbF7ULzPTxUFhFMoPCD/0pdS7KQKPP072IZdXsqwiyZcIvVGl7Rgj0AjfrJBiuaIszIBkpaHc6PLWeAAmR5usY1gCgDPbexSbZns/UYsnc5TC4bpfXqCJDmWn7d9AJ8SKN4sk7BBBbrqt23oWlOtQY/91DK0r2HJx8BTO5myPYxc1xvxZTWSNFDN52upDRVucooUZBbe9m8fqzgPniW0cZmLxpWK6kmR7d1iAEcGc/kPCeDN4NsDMkvv8d58xa7g87puRzOqqj8tptTPpO49EqI0v6ZjL47AZhWYuc1beM/lptxfeMJcvWqHDytGTRVMgDEaIZgINLkZ8T3L+NUKEksT9WxPGIaTm86AOG5xuKohMT7bQANxH/YWvzgLeLNzV0SwOZ7fJNZvSB64nvTX+gBrnWTv1EJyXpHcPS4gdnh+43Z+1pJIfonNB0+/2fFMv5hSDtqYnjWE3ulTd3/Ow2+7gBURBzZsLs8oV+Jboa8FRS/tl1fnEfVGBX26REjc09UX7CkGnuOKp8bF32hWYEuUPnhlyxOG2NguYja2nt9HojDQDFTp+1gzhIIE0ocJIqtveZhcFA4xGQ6x8h7inQu9nXwJ1hSQpYSpHxSjk8ja6xKxKX6j4vt/aAK61mfihJbSb9a8PdGELMAOEVs39286zaCU0uybstuMdBYltQejtMhc8LPJ45745Bj8M2YKMPWgBw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(8676002)(508600001)(66946007)(6666004)(6486002)(6506007)(6512007)(53546011)(316002)(44832011)(66556008)(66476007)(31686004)(8936002)(38100700002)(5660300002)(2906002)(36756003)(4744005)(2616005)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzFzQk5wb2ZON2YyTXJReUUyOVVsVGhNYWR6RWZqRHJFWXBRTjU4UzVhWjNj?=
 =?utf-8?B?RWFCZldmTURhaTBEQ1dmSjhBNDVvbU13cHZoVW81ei95SlJSYzhMVnJsVmFl?=
 =?utf-8?B?TFU4N0Q4ZnhVZjRMYzVuK3VORktSd1NIMG1INGp1WDl1OUNXcHhKMUFvWVVo?=
 =?utf-8?B?eVlMTmdURk9WZjBWTkVKUnVQN1U4TTN1aXh0SkpTQTBwNkwyNjIrQU5zVmpw?=
 =?utf-8?B?UEJqazl1MmZjUy9VMjhQSE9Zc01sUllvTDRldWNMLy84QkpyaGh6M29xUy9T?=
 =?utf-8?B?UzAxYmpWSHFuenFSQWRzR2ZxYXUrbWxIWVdEUHJ1VXlRMmpEbDlYb3VwM01U?=
 =?utf-8?B?MkN2dytHamhTU1krRnpUYzBYOUZoUG0vWTNpR0FCcjFnYm9jN2FDaDMrWVpq?=
 =?utf-8?B?K01ER1VmNk1Td3NFOFNwVFVNWHVQd2NIUHp0cnJiaFIzRk94UnRtRWpqSlR2?=
 =?utf-8?B?ZGJ5Q0lST0d4NDl3Mi83VmYvTkpNK2hWWmZVYXVsdG5LcS95RUJITXRoc0FR?=
 =?utf-8?B?N0t0ZTVmaWw4T3VPVENPcGZkenhsVGR4Mm1iWjVKY3lHWVVUekF5WkV6RklI?=
 =?utf-8?B?bWhLOTZQZVhreDZKU2x1anpVTU05WFJrdmlaRElMRXdEbnlBQlVLMjVRMnpw?=
 =?utf-8?B?NnVpM3FvbnVoT0E3U0Q1S1hSLzROR0F4cGl3bVVFUEJhNjlmZWUxditjS0Q2?=
 =?utf-8?B?ZnRKOWg2b3JWZW1vRnY2SDBPVDNPRFJrVnFTc3JOMHozTmc3V3BuckRDZ3Zr?=
 =?utf-8?B?bFJldUoyL3FUSmVNZ2t3eUtHYkxNNnpsbHVZVjlLbkFUU2pFM2RyaDRrYkw1?=
 =?utf-8?B?TnlQb2lOQXpoOGwyVUVzRXVIbVVHZVVTa2h2aFR5a0NEU0ZlQ3JGbFVsaDVD?=
 =?utf-8?B?QjFxK0xOSEIyZFZYTnJIRC93UGFRM2ROclJhclErVDBSdGpzU2ZHWmcxRkNM?=
 =?utf-8?B?WlBtRklvRXFsS0hQcnRlV0FEc2FaRkNETHprZzUvNVZCVzdMd09lODN1MTZN?=
 =?utf-8?B?VnVTeFg5aFZWL3Y3SklCTk5TZm1RdWNnenJZZWZqRlFMbEpacU5aTlVJdEJn?=
 =?utf-8?B?cFBGSkFDOEFST0ZkRHlMREUwWFZaaUpESjhmeE9GM2pxSUg2TG13NGxvNWVJ?=
 =?utf-8?B?eW5jdWFhNWk0bk85c3crSElTZ2FscnlEQWJWeDBZZmk0WTRrZFNKMVlER1lM?=
 =?utf-8?B?cGFxQ1cyKzFQS2pjWXU5MkdmaTdZQnlDaENpZFg3NWhHRVJlRXJtTEtXMVhu?=
 =?utf-8?B?ZkxOdmkvZWdGWVdIOVVRRHhPZ2orRmxYZ0ZnZUwyZWJteEttaC8zaW03QVdD?=
 =?utf-8?B?cjlXMG9NL1hKOW5MYTJtUjN3YUhxRVR1WTMxWUt2L2JmMWlZNGNwdkFMc0lU?=
 =?utf-8?B?LzJEcDBXNWl1VFVSbXVMRmFoSlp1SitqRWZKT1FKenIrR21HVldrV3ViaVht?=
 =?utf-8?B?K01nRGxrYTB5K0FCUzQwZkk5b3ErWmt2Vkc4SWtxMHZJNTBEQWM4VWpic3pw?=
 =?utf-8?B?RHZVWlJweGxpbFMyRHVNZnBXSStjNTlKR21MbXFEaGZUMUQwakd5RDNrYm9W?=
 =?utf-8?B?amM3Y3hucFBtZ29ySFNiOTlPcGprV3VnQ3ZlM2dxNWw2SlFab3ZReE1PTEox?=
 =?utf-8?B?N0NJMHR4dmEraWJ6emFKdVJoaGFmekxOdW1CMXVzK3lOOEJqS1JNbDB5eXdL?=
 =?utf-8?B?M1Z6TmVmTDUybE1FdzIrMUFCSmpsWTltR2JsT2wxZUtKclBxTWdtSU0wVGRY?=
 =?utf-8?B?alRrMTVRNUE0L1hVakxqS1FSTzJ1WURQU1UwR0RqY28vUWtMcjVuaE9YeExh?=
 =?utf-8?B?OUhIRmY3R25UYWRnWkZwVHNpdFprL3J3MWliWW9HSEJtb0JneXluUHdoOEQ3?=
 =?utf-8?B?VHhnZDlBcVYxemMrZW0wV2xtMUZETElRU2tUSE10emlNdVp4OEN1S3hrazh4?=
 =?utf-8?B?K01uRGgvU2tBZUE2ajROWkNQcFQ4bXhwdXZ5K2U5cjFTeEpxcXAvQ0dmVk9X?=
 =?utf-8?B?UmpPQmhYZWk0MXNJVTlIbW5Kell3NHVGcFVsRkpkRm5pK2p5U2dzOCs5N0Zp?=
 =?utf-8?B?Q3FHdjZnV2paWkQvbDJZNnkwOFNIdHVweFBsaGVVWDlXOGFoL1UzeVB0azRY?=
 =?utf-8?B?eU1mZHBrL3IwSERUYXNqZnhzYXpHd3dPeVJZSFd3SzZ4TGZxUUZDQStoek9G?=
 =?utf-8?B?VE5SK0FBZnpQOWFTck9xaU1VTVVDeWY1QVlzS0srVGFuWW9VVTB6YU83QTZk?=
 =?utf-8?B?S1l0cHhINGxXdmtxME1kM0ViMzcyV3Vkdk9INk9mdDB4ckJLOURXUmZudFEy?=
 =?utf-8?B?RURuUDNnUm1IY0lYeE1rMWMzS2tkMU41U2VzMk9YTEQ0VWFveXR4UT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a800ba82-60d6-4ab0-021d-08da027f90f5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 10:20:14.3986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /T8m6OsEWeRyWYPUNEAXCQYefVkmgiC+UdF4l99AR+q90K+bWxdrbOoI48O4TcfJbIjhz5DPTe9cqrVTGuEm1yqCryZvvyczh6u9oWvMJGbVbWhgpEk7VcF/aaNyM1uh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 10:20:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163010

Hi Michael,

On 3/9/22 11:28, Michael Opdenacker via lists.openembedded.org wrote:
> Both http and https work, but we will get fewer user questions with https
> 
> Remove no longer necessary \n character in the sample definition
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

