Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9782C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:49:10 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.80])
 by mx.groups.io with SMTP id smtpd.web10.9540.1715258940424219204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PU53lMn+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PU53lMn+;
 spf=pass (domain: arm.com, ip: 40.107.241.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bjT8WOU/oQLCYE8m4y46QSAzdpLLS6WxmhseXlYvMPH3EyvuaWg10eho00Hy8t+3CumVingkNouJ/KA1vFKvOLJQ+sBzLeLEdCA3GItXLJQK6/XTz2HvaCwJDhETbTH6PmLEiOFTYAucxElUPjkQeHk+CH/pFeCDcFqkFCM8qoIaSCPRypwZh87QcvlZtNqlwzTJAh6y6gZ11L+1+TWGHt7fHxz6fdjo/LajF17Ip5YZhf5csJC7YJjpjODEySbkQ6lcNGHjftEiU3nwfN2xCwWttVM4AwbkrGxqH8Fy9SctpDh7/y6uqrEujzsMZBsFA6AmgdlJV4Jq5R/pjfaVuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vICxNpVeVqr7RfpQbLf2wFzkvni+mdUAotNYPHhDyJI=;
 b=hjetq0RKU1vpuSx4lSSVQ65JqYHgsFrVYWVAValfYkqt6vna8CHIEQSwctPhnx4ryj9f1xU2xK6Lv2QmX/KaEy00bdZYL8w7F9ysd9xlvCkI0t3InLyPWLYyvl6xs234INZXc8lBH3QAzPo24shA1oXaAYnkPZ3mzpwlz3mJaJmmmlQS8zwnYN6Ncx3HkksTqXJ9O0oLjnI9tXkyCv4KG8IGxBt2JQMpBqULk7BbScMHfXNd7YH9G8VqhlQW0W8QzcPUGmg/lwEBz7rqDvZ05YkdanvSd8S4DJ/0n+pexeVpv4/bK6puV71CYFfD8K02HL8wmHNnCJr+ped1XHc0LA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vICxNpVeVqr7RfpQbLf2wFzkvni+mdUAotNYPHhDyJI=;
 b=PU53lMn+tY4xZGq607hhD8OJ6b1ntMjj5AffX2ucczy6LaFRKci/lVUt+4I3IRNUlFwivBF2I3wZjdc4Its/BzlasY48zfVXnHbSNY9jB9FktB0LQuCGdbRVm5Poj2a4/ubO49c4YjnrlQM8tu7e6N0H6RkC4aLCfN7D4olNWIc=
Received: from AS9P194CA0004.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::32)
 by GV1PR08MB7682.eurprd08.prod.outlook.com (2603:10a6:150:61::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 12:48:55 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::2c) by AS9P194CA0004.outlook.office365.com
 (2603:10a6:20b:46d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Thu, 9 May 2024 12:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Thu, 9 May 2024 12:48:55 +0000
Received: ("Tessian outbound e46bb127ed3d:v315"); Thu, 09 May 2024 12:48:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a25de6879c368731
X-CR-MTA-TID: 64aa7808
Received: from c5bdf2899682.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 76673349-F8FE-4B7B-8E20-5E6DC6A258DA.1;
	Thu, 09 May 2024 12:48:47 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5bdf2899682.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 May 2024 12:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGllnjvnMSmWfCC4VGei+7I+tO9QONOt+bFWXW/2dERKrjx4E9s5h6XHuGETczgrkxkrD4PIP7ABgz09ez0H5Fn/Nq6Y8Oq74bqzbSrW+yxiZcZWTj73S7OLyz5TOExaFWCvkiX7rvqy8Knj4ytUj1ekXVUGqrxPlXRSVe6Of0l+twfo8KwJu3vy6kbYBMfbQ3R6j9vV6gro8Q4RkiFcrgUguEIuS8FX6dcVhGx74eukWezu2lHC53J/xU45AkNRCc5YQpVKwAWLJ5j7/V0c8m9txKKc9ckfEolsrJxJl+GH995dAMGo9uN0EjL91rXt8bqxfZyST0R9925e0uPNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vICxNpVeVqr7RfpQbLf2wFzkvni+mdUAotNYPHhDyJI=;
 b=aPvxnaoJ4NamVYklYNUZ8Onumkfr/Bh51bhnPF5K75H35vRcqHU8B3g0G0xjISVQFxPTlE5UwStT4HqF93fSNH0xkYLrcpbY7SZJ21v7H9xN2/99fjaMnSo6LmtRenEiaMOlCDbwE5BHYLzOAtOWTjBwz3XnJWWlcT1m0vQitEgvAIcJyE4SHn1ktgnlr66gwRvPj0xLNEldcBX2PQcS8FYzUIUlf/JOoR1hF+oVrXtXyxT46sTdd69wYcEVvQSQ+huJ3dNxgztPR9F9hyVKwFa38VkcCXpP5tjKF4jkzh4OygYCJIe7CX7enYkCJ7nY+LkA1l92MWIssuO2BWqdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vICxNpVeVqr7RfpQbLf2wFzkvni+mdUAotNYPHhDyJI=;
 b=PU53lMn+tY4xZGq607hhD8OJ6b1ntMjj5AffX2ucczy6LaFRKci/lVUt+4I3IRNUlFwivBF2I3wZjdc4Its/BzlasY48zfVXnHbSNY9jB9FktB0LQuCGdbRVm5Poj2a4/ubO49c4YjnrlQM8tu7e6N0H6RkC4aLCfN7D4olNWIc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10859.eurprd08.prod.outlook.com (2603:10a6:102:3d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 12:48:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.041; Thu, 9 May 2024
 12:48:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] enchant2: Disable incompatible-pointer-types
 warning as error
Thread-Topic: [OE-core] [PATCH] enchant2: Disable incompatible-pointer-types
 warning as error
Thread-Index: AQHaocdnlCaKKQTrDEaz+oqjP6A9V7GO2tqA
Date: Thu, 9 May 2024 12:48:45 +0000
Message-ID: <5A48D922-A19F-4175-85DA-DCC925107788@arm.com>
References: <20240509041406.2977304-1-raj.khem@gmail.com>
In-Reply-To: <20240509041406.2977304-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10859:EE_|AMS0EPF000001B3:EE_|GV1PR08MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: b20037b0-3b3c-408d-4540-08dc702662f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UmhEeUNoNEcrWUVKWk1EWXV0VDJFR0FPM3ZnN3Fwb2lKY1VkYW5GUXV5L0Fr?=
 =?utf-8?B?bDZCUHQ4MS9aQnpranhsdjdtSzRzNyt0S0JCYkVyeG1KNVl6NEtvVTBCV1o0?=
 =?utf-8?B?Q1l0RlFSd1ZUbnR4a0VrZGpVeWdmcUI0czFLbzAzYlBNWmU0eTh5eU5OY1Va?=
 =?utf-8?B?Q3M3ZnArTEhPM0gzM0g5OW9ZNk9YSUIwYkRhdXo0NlBBa2lmSjE0OG1QOEZL?=
 =?utf-8?B?RjdLcnNsTHJSTnNobEtMdG9FWGNqblNjbTFOaWVKcGY3enA2dHhUYys3Q3Bk?=
 =?utf-8?B?VFRrRFh4ZVJkZVB6cUlINlV3R3NGdFpnem5YQXdZTDFYK1laSnRPNzdpMVho?=
 =?utf-8?B?dWVRMmNVemYyaHZkTWdLMGZHQ3dxNkp4ODNRYll1UXNrU2U5RStTNkFEZlFJ?=
 =?utf-8?B?VldMeE50YmlKVWIrL01NTHA4ZkpXMDFtTXJLS1RxOEtCUGYwVC9NVkhJUzgz?=
 =?utf-8?B?NzAvSW5BS0ZqTDBCUXZPVERXYzZEeE16dE5CdzhIcU1JbWZGWEd3Wk1JTThh?=
 =?utf-8?B?UFNFa0ZadmdzODNoVWIzWjBPM3dabTFtRFJFenZwUUppeHFXRk9kZ0ZXUEFK?=
 =?utf-8?B?ZFczbnl2VS9vY3RkazdrWnZIci9SWmoxckkweGo3aG5rbUdaQzE5bTF2ZnV4?=
 =?utf-8?B?U1VtQkp3ZkFORER3UDFKNzRSZHZyck56dGhPS05rV0prRDNuRVNvME00OXRI?=
 =?utf-8?B?T2lNQktodGh0SExPNzZWcUxrQndxTU5pVUt1WjVnRkxQTXk1OUJ3SUpBVTMy?=
 =?utf-8?B?citkM3l0K2xOaUdoc1VwbTZWY3BhYVE5VTNNOWF6VStMY20wdVg1VTRHZWdO?=
 =?utf-8?B?RHJPYklOYkZWZ2NIbEYrY0hmQmN4bDVLd0lXcHJYYitwck1vYTNESlV1NnRO?=
 =?utf-8?B?aUhqQitBNFphbHpyVy93K3VkT3I1VkJtWEdCb1dPcnRsT043VW9GSEdvTlp5?=
 =?utf-8?B?bFhqQk1hL3dqL1R3RWlRUUI3Q3c3SnZSQ0Yrand2dnh2bHBlMkZlUHBUU2ZM?=
 =?utf-8?B?UG1aN0g5Y0srQ1VjTlp1QW96SzZrQ3BCWEluOTFIMjUvM3RwdDFCZktXRllk?=
 =?utf-8?B?clhZUmgxSTl6dTl2TVF6bkJWVzNTdDBwOVorYUZFUk9WWURuZ093WTIwOHdJ?=
 =?utf-8?B?Q2lIaENSQ2NXUjFRWDFZaVRxSUtTOTB2aENONk83MUdOTXBsblNFSHBxVW8v?=
 =?utf-8?B?bGNuYzQ4Zmw4TjNCWUdxL25oUmVoSTZQcFFtZkE0b0I5YW03QlpML05DYWRl?=
 =?utf-8?B?QWlCbzg4RjVqOWRoY1VCR3kvK05GR05ZblhaTG1vaUEwZVp3WSs2WU1HNVo1?=
 =?utf-8?B?RUN3UEVEanVhUC9ybGF6QmZLdkRvK3RpdTF2Rng1azU4MXlHdjZ2ekpKZlFW?=
 =?utf-8?B?aGRaNCtBUFFISUh6bW5xVVgvOG9XU3Nyd3FJbVQ5Rm4rRW9CL3REaEZya3VW?=
 =?utf-8?B?LzgwNUI5VDBRQnhaTlRubUZmaFU3VWtReFI4Z1FIa3VKVmRUM0JHSUlpUUp5?=
 =?utf-8?B?WStYeGdHOWZGQVQ2ckZJVC9qUFlaT2dkZXFlTDNka3pSSW1YdDB5blFTZnNp?=
 =?utf-8?B?dmlDWmM4NWZ4TktYTmZHZTNJeGF1V0lIdTFRWHRxWVJvZ2hQWGFQdGdsUnZN?=
 =?utf-8?B?V0FHZDV3R1NZMU9WcEtscjdtVnVBeHBWOW5BT2o1QklyZzVJSVVUTnYvM0Jr?=
 =?utf-8?B?S2Qwem96MGxQNFkwUGhiMkU1dWlra29HN3BKYmJXV0dTU3pBeFdQYmJnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <44F00129B688374B857682A1596575C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10859
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	60de6438-083b-430c-1fb2-08dc70265d41
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmVIZy9VVEF6VUVPdWR4S0YvazBBNVdzMmczbm9zaUFHaFVWVkRwRGhOVXJM?=
 =?utf-8?B?RURoOGcxdmhlN0t0QmxpcmNBY2NLT1BFTEZyV2ltYTZSTGZwVm9WUFhTRW1I?=
 =?utf-8?B?VzFjNzRqczFxM0tsOWEzamVvWFdpSk1hYjR1blh5VTNOWWc5RklTTGFnc05x?=
 =?utf-8?B?NXkzazhPdHBRYkQyWW4vV3FEWi8rbG1DUXlaZkVkV1RpQlU3VXhXWmwyMGQ3?=
 =?utf-8?B?Y29VVi95NDJmQ0UyV2hnVlhnRW5WdldnSGxTN0FoNFBwT0tTZjU0clkyRGFy?=
 =?utf-8?B?NWNJR2t6VmJDdmFzSEpLRWt6TlU0NXo2ekJZclpsLzMwdVdXa2JsdlpKTUxZ?=
 =?utf-8?B?c29ScDNIbVdVdjNnOXkzU3ozN0ZaS09iTWQycU5PL1NMK0FQMTdyYjdTVGRt?=
 =?utf-8?B?eVpYOXhwS2NKeVJ6L0dFREJ4ZGhZWkxVMFZVdXJGenFVVjJqa1J0R3R2Zm9B?=
 =?utf-8?B?MnR6NUt2ZlVBc1lvMGtqOWZNa3QraHZSaXpKMkMyVGxacVFhUFRmQjJoNWJj?=
 =?utf-8?B?NVlVbERNM2FHenFJUzY5bGxJcms5Qjh5TlBuY21wMnhKUU5laXhST1lTSkJT?=
 =?utf-8?B?aWIycFAraDFnbkZHZnJocFJtT3BSN0o5NUJjS2tzUXVBMnYySEpGMU9GSjNI?=
 =?utf-8?B?bExDWXE4elRpUHpMc3dKSDY5QmVETFNScG9lYW5iQ050TG5obllNK1Uxd0FT?=
 =?utf-8?B?cmx3NnkvU2E0NndGbTJYZ2g5bTVGUGlzampURTdQcld3b0F2RmdpYmhiNGlU?=
 =?utf-8?B?ZGdLWTRkbGtVUVREMGs3ZEl5NmtOb2JQamF1ZXZNcmwyZ1RySmFxY3pvbkNi?=
 =?utf-8?B?M20vclZ3anVSUkVJODVFWDYyTnVIYkxqU25Ea2k5akIyVjNYK3dxQkNza2Jp?=
 =?utf-8?B?ak14UDNuTStaUFcxZytmVit1UzREQTljamxVejZnbDFZbHFvalpNWElvWnpi?=
 =?utf-8?B?dXh0WGZKQUhIamRTVkVPTlRaSHJNUG96cS9IeWtHVTM2dFA2Tmh3dGdwbTNH?=
 =?utf-8?B?SzluU2FrRHd0MFhZSkhzR3FheWtaZWg5WXZyWW1obFVPUW9NUzZKMmYxRUxC?=
 =?utf-8?B?d0FlUlgwMmVHMDV0K241alhKd0JQcDFRSDFXQUhmOHBZTHVqbURmZ29GRHBF?=
 =?utf-8?B?MXVXSlJyVVlQNUp0dlQ3T1Flc0FxUlhuTFRaSW1DemRVTTdkRHR2dC9rNFFm?=
 =?utf-8?B?ZDZWc2JPRUhyYStYWnZNNDdkZzc4dTJwV2ZRUmcxbCtqQk85T250Y09uOWpk?=
 =?utf-8?B?TnlBenkvVVlEUWpzSk45dUFGbThnR0prTlM1YU5GK1hWZkdwOTgxSXFab09J?=
 =?utf-8?B?aEMveTFEMkVnNVVMSlB6emxqY1h2dnM3U1VOODU1SUs3eEl3R1RudlVFdHVj?=
 =?utf-8?B?TVVhL1lFbUxBTGRvNHN2cllFWEJCQjJvUUxrYlhYRGpSMDdDQWtyTjlGM3dT?=
 =?utf-8?B?YklIYW9heW5xb1Ixc0lrcWVlcDR1SW5QaU9BYXE5N2dLTDZhRHU0eWZnWStF?=
 =?utf-8?B?WHdjcFd2S0NhWGZsR2hKZ1BZL1l5cjNPMVNSSitXQkx6cDZyTlluN29sc3JK?=
 =?utf-8?B?Q3V0UGhxZG4zUHZjTmJ2Zno5T0w4eGR0TnVDUU14dE9idnIrTzNpWEJDK2xX?=
 =?utf-8?B?TDBwSTZyV05WNmsrZkdhTUZTUVZHUmUzcmxVdVI4Wk1xR3lSTm1hKzJiL3I0?=
 =?utf-8?B?WlhDSHN4WU1rc21FUm9Db2JXazllSyszKzZ5SEMxYXIwR1VmbWU2RWtodWhr?=
 =?utf-8?Q?976Kn5pfmY11LAZdd8UNXyUIJZFhcNXI/oQcsV1?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 12:48:55.0411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b20037b0-3b3c-408d-4540-08dc702662f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199173

T24gOSBNYXkgMjAyNCwgYXQgMDU6MTQsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
ICsjYXBpLnZhbGE6NDM6MTg6IGVycm9yOiBhc3NpZ25tZW50IHRvICdnY2hhciAqKicge2FrYSAn
Y2hhciAqKid9IGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSAnY29uc3QgZ2NoYXIgKiBj
b25zdConIHtha2EgJ2NvbnN0IGNoYXIgKiBjb25zdConfSBbLVdpbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlc10gDQo+ICsNCj4gK0NGTEFHUyArPSAiLVduby1lcnJvcj1pbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlc+KAnQ0KDQpJIHBva2VkIHVwc3RyZWFtIGFib3V0IHRoaXM6IHRoaXMgaXMgYmFz
aWNhbGx5IGEgdmFsYSBidWcgYW5kIGlmIHdlIHVwZ3JhZGUgdmFsYSBvciBlbmNoYW50IHRoZW4g
aXQgd2lsbCBiZSByZXNvbHZlZDoNCg0KaHR0cHM6Ly9naXRodWIuY29tL0FiaVdvcmQvZW5jaGFu
dC9pc3N1ZXMvMzc5I2lzc3VlY29tbWVudC0yMTAyNTkwODIyDQoNClJvc3M=

