Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17569C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:26:26 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.55])
 by mx.groups.io with SMTP id smtpd.web08.25427.1646652383589054289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=qeeMnaxn;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.55,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISQj0/P8ohaCmwpawk4UmI9ekg/R667eJTd4/6swnIVvPmTqclxCtunT2C2hScuhojrZCZ8zvmSKy8cTIUjGnphqBuEoJTHXTKBjboBvr2WuT/jag4oiCMUC7XYMN4+BZn/vS4dFoVYxfv0lQncZGaNcm77b6PaYhJrgXdg6ko/E1tge4MwGDfsXDYTxEs8ksxozyE/ReHI+KqLNbw9Sj5rP5ZLyh460Xz9cHqEwpTFlNGUYjiOxEgXhCOYWMX/LAyH0P6YENDLV0BH109uv5jBEm08fw8Uhjnp9YoMs7QSFaqZ2njlK6idbAa/fHW2w+IP3Q3uwwuvCP6nXE2Nt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBI8vRIX8sura07zaZSYMC1bnbWFPruyNaAF7k+IYGw=;
 b=m4BaMxMPwIp0YNQXTrTF4M5n4E7Maqj5ucms973aU9HtjjQyu2ZFjlujsf9ygHakZBWtISecz+4rcdJhCAdzkyrWPJ9Xvrl0K6TSnLKUuaepsLQfjLNyl8ITKzo2C33p477deJvAqzkcuQ2zwcBddgWsxwMlu7nAqfD2O1DdFy7Lr9xUgicSigtRvayJNes0/f3aDVbf9mVEpoZF03T6UYSckYkO7JTrjosla1D4SCX46Nuq4ktSXpGL4kj6ZyUaUIgRmhxyjP+JCIpU/5Hsg4nbbLeImtymJcfeNBYWBxVDBl0DvCe+sUzitabWCTsr0eN76njxgmFg2MtZdSWdVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBI8vRIX8sura07zaZSYMC1bnbWFPruyNaAF7k+IYGw=;
 b=qeeMnaxnn6Idna0GtrPo4jj82/W9G0Afz4YQ8IXZKZxdF7B3ys/YvPJW4VfNabyZquGxDu1zPoVmwyvOU/hgohJjpNcEq8cEAXO1ts7SKS308nojIrIMwxQD/PFonD7bLmPlcM+Wf8fCnAS/8DDx3ZJChQb5mDSMuRATYoTqfh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB6215.eurprd04.prod.outlook.com (2603:10a6:20b:b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 11:26:19 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 11:26:19 +0000
Message-ID: <62fd97c4-b5e5-42d5-cc13-ae0883184210@theobroma-systems.com>
Date: Mon, 7 Mar 2022 12:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [honister][PATCH 2/2] util-linux: upgrade 2.37.3 ->
 2.37.4
Content-Language: en-US
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220307112127.21538-1-quentin.schulz@theobroma-systems.com>
 <20220307112127.21538-2-quentin.schulz@theobroma-systems.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220307112127.21538-2-quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d087ec8f-7b2b-49b3-27c1-08da002d4cfa
X-MS-TrafficTypeDiagnostic: AM6PR04MB6215:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB6215148AD51DDC7BF0E95167C2089@AM6PR04MB6215.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hoWvHsHH+BYJsdTS2rInSuzpBSnIfWe/NufiJwjVbnHJHZ9F8TmSiIbFes4Seoaa2/RZUydZPIHcfF4WEHu43TC6rmxxwTMhMOZE4p+yy2aDq6CKUyplNYCV1zhiRoJ3Zd2pnFPx6od2uNfqRi7PlrJy92TdcLkfL+zxuYXVIDn7VqjntLTZpbga1aVSZedLp5Pzu177wr8t6iuxktE7nt96uu0rrRZ1NOGsfjPQM0/qIoaPsdR5Jzcu3YgRzJjQs5W62Up9Lj4HkLaH8Ij71aUXfKYFunZqGa1wTeuq1h/JWL/Zz+zNDS+6p76RthqEnv8pozUHvCfOrDvW7KEMzN4SJIt50o3aPHLWjKyt3IocowFwnGF2PtOO0zoRIYfqwG/PFDhbeX2eqELFwXmNYV3udV4JV6c35NWpqYcikqPIyHe9n3TCIWQZZPIHL6zln1rw25SkuquZIxZ3RwKPt38NNLxwrCiEumMohUHInRSXcwoB7AjcqyR8dQ97HMc9FFE7WR3dS5DRtyCif6gOh2668NyvUbSNYoNA9sSFFSVUC2eZA17GVkofGwtjkij+di1kb0pE+kmYHZ9XSOHcx9iwSwuyrg/MhvbRHP+TN80UrBnDeQyAIQwfNgdVyCk8fayj5ZduNuwoAZOwmwk4F3Fhh2RyZFrnc7X6PIYusZ0ajnoJdzDoBUDts7ol7J3gv3m49Xe1RZDaNCvFKEYK3FdzCsLqwfi5ibBNaSV99Mdxb1LdjX8pPcXQDTa092IbgMEcK7UdtiPSOnf6ZZrT4PYhxae2ld/GC9vzHrk63kQxp3lo4TtsYK+wL2I/Xfpg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(5660300002)(508600001)(4744005)(31686004)(6486002)(966005)(2616005)(186003)(26005)(109986005)(4326008)(66556008)(66476007)(8676002)(66946007)(31696002)(53546011)(86362001)(83380400001)(8936002)(44832011)(6506007)(54906003)(316002)(2906002)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDg4bFBxNjZ0QlFXaUY1QjlmeHRrVmdOOHA2MkxwcXZzOUVhaEZkM1VxNDlq?=
 =?utf-8?B?aFNqU1p2RUxZRFJGUEZKZnBSTCtwc013cnoydElLZ08zRHJuUmRSYXd5RDh5?=
 =?utf-8?B?OWdkeUh6RHdnUHNvMVRLQitnaVZDcWdTaU4vR09FNG5iTHRPWmdrS3c3WFJn?=
 =?utf-8?B?djZ1OU01MjlPOCs5MWI5OUdkWit0Wk9VWjRDdjlqVGJEWDFWa3VYZjVSNC9P?=
 =?utf-8?B?UnpsamVYbXg4dmlUQkRHV3N1cG5IT01HcGVxZEU4dzhFZE5QLzdDTEZ3cHg0?=
 =?utf-8?B?L241YVJVL1ZxMloybzMxL0ZURjhHeUlYREhNVFBOWVhkcDl1ZGdXbEJ1R2kv?=
 =?utf-8?B?TlhoRTVsMU5jZkRCcWZ0ckxNMTZlWjF0QmZUN2VIZjR3OCtLQ1puSUw2RnA0?=
 =?utf-8?B?ZjZ2VWtVTHY3dEYrdTBPY2IvUzFSb2R2U1A3UUJtclNNcEhlZzFyd0g4NjYv?=
 =?utf-8?B?cjN4SlZVZnozTk92OGJtR0hKblh5RFd2NHBwbnZyWVpWNm1YQTVVckQxeXQ5?=
 =?utf-8?B?RGlXWnlRQVlyRGJrdGtDc1l2NEJTdnhSOHR2aXVvSWRQWnZHVnQyakVyVkNl?=
 =?utf-8?B?eWxSc2g1WVczMjNVTldxRXhLNmpxcHI2MjE4eHhBQzQxTG54SVRwZHV6MERz?=
 =?utf-8?B?V0czcGpSRTd1Z0JyUG9IKzlPZGFCRWh6ZWYvcXlNdytQbkx4QWhHaTRqdmV1?=
 =?utf-8?B?eXhBQ1h5ZnhLcU5BK09NTnd0OWk0aXBpSGROcjhjZEVnZm9GM2pUTkdIakky?=
 =?utf-8?B?OEIxRlVpV2toU2MzcUhkdzNtdldkckhYZzdnbDczYklGUXEzUTY1c2RjbnRE?=
 =?utf-8?B?RmMxVUJkRkt1bU1PdzMvSmt6azFOQ1NtanlzSXVYamVHUTZSUllSZXZyMzM0?=
 =?utf-8?B?QWRVTkFmY29TaUxDcnVkLzdMOHMrbE4vSnd6WXNXWmRjckJ1V2dqZS8wQmZ6?=
 =?utf-8?B?NGZ5UGhLQkZjRjN3bVl3T1lLSW5PNkEyM1E3Sk5tN1F4RFozcUFiL0VVWnB1?=
 =?utf-8?B?aEVIT094aGhJbC9YSzN0bC9TZnBaZ0tycTlSNmxxd1k1S0ZPaHl0eWVrL0Ft?=
 =?utf-8?B?NUN5VWdQdU9lZ3locDQxVytJOFFLSURmQ1IweFViek8wbk54Qks1Z3FadVhC?=
 =?utf-8?B?c1dFODdHc1RKclZtdnVvK2NjNmtCb0lJWkc3QlVaV0x5Y29jZXNreTdrMjZP?=
 =?utf-8?B?UUJjeHZKdHh4NFJTNHUrOE5ZRys1SmZMREduTCtxOXhJV3Nkd1JmaUdtQXlv?=
 =?utf-8?B?Q3dlZjAwdTA3Um5UWGlEZHQ1YWJWdEhnVW4yTEN0MVBGY0ZuM3dpQXl2K250?=
 =?utf-8?B?MmFLRCtEMWVETHJZQlN2S2hhWjNoYUw2d2cvWGZCZDgwMUJrN3NYeWEyYzVB?=
 =?utf-8?B?SXRWbC9LZDRnalVia2o4a2RBTkJRc0d3Zks5eURjWlhuWXRnUzhhQkluWWNH?=
 =?utf-8?B?YXBhYXMrWVByZVZEWkRDeVZ1dElaSXFlLzREK1M4MWV3VE53YlE4MEhhbTJk?=
 =?utf-8?B?SjhXZzZYQkpLZU5sQmxkYnkvamc1SkZnWHFVYzVFU2JQN0Y3YmNJdTdEeUY5?=
 =?utf-8?B?SXpqTnd2QzMvekRPL3ZhRm41eHJZMzFOMUlSKzZ3MkFVLzJ6c2s4UG4zMXFi?=
 =?utf-8?B?N0FWdTdQelZUUUJobUl2SzZSYzd5WkMwK1B5MzdEY3RnMWlYWm9vdCs3MGxP?=
 =?utf-8?B?eXNmNkFoOEFEcW9mdDJyV2JScFBGcit6MmNrdVozb1JmZzNqUUo5Y3RlVS9s?=
 =?utf-8?B?bS9XeDI1NHZqaUFIV016VGxLUWtBa3BuajR1eWJwdXRFZmNGSnIvRzQ2R0tl?=
 =?utf-8?B?YUQxMlRFYkFMM2Voc1lYdUw2bHVLeWU2cDlPRmVUN0dSNnlYMmtoWXNJaHQr?=
 =?utf-8?B?VlE3NmhwYkwva1drZ2xKV3RwYnREY3hRUlltb2Ryeko5SGJScGxOODlzbzZn?=
 =?utf-8?B?NWxlWjFuMzZkZ2E3K2ppdFhBV2k4VUdoV3RpRTV6bGt6czdGZWpEU1BIU1Az?=
 =?utf-8?B?eGJLNGJlVEs5Z05SNkV1NHZWWDJUWmJ0TnVxOXFGbnU4ei95bVA0b1Z0c05j?=
 =?utf-8?B?MERCd0VleWRWM3o5NU5nUDFXUjNBWWxGRHhDRStVeHlPUTJRdEtkdDJ0L3BV?=
 =?utf-8?B?bXc1bG9KUWhEN2tENkVscEwxS25ZOU1qZHJ0dnljbzVaOC8wU2huOFRMb2FL?=
 =?utf-8?B?bTRwOEZ0bzBvbEdQRW1IUjNHYVFsSDZXSzBLc2lmSlZpc0VZNmFZbkQzaE1i?=
 =?utf-8?B?bGJBY2szTEdTNmU4cmhnd2w2eFZHcXJxN0JpM0JCTXhMQjRmWllvZVBwczlp?=
 =?utf-8?B?MTZ2MzBMb1pBNTJmQy9ydnpXV202OG9nd3h2cnhmM0x4MzVyR3JOQT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d087ec8f-7b2b-49b3-27c1-08da002d4cfa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 11:26:19.3211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XAHd0tZS8RIhEoLRGP+/v4KUikIwsHR0CyubEesL1SAxxKaxoUyp0zgcU28Z7YUQSlIjXm5bloX+BdVKDZea23IversljLJVk5wxlczoWOi79F2x9y092i+wDsS4ubod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 11:26:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162809

Hi all,

On 3/7/22 12:21, Quentin Schulz wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 6a3289c4786c4d278e2bf0ec1a5e04363772d8bc)
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---

https://www.spinics.net/lists/util-linux-ng/msg17037.html 2.37.3 fixes 
two CVEs (not listed on nvdist database for some reason).

https://www.spinics.net/lists/util-linux-ng/msg17087.html 2.37.4 fixes 
one CVE (not listed on bvdist for some reason).

I think it might be useful for release maintainer(s) if we mention in 
the commit log or commit title if it's a security bump or not when 
sending patches for version bumps to master? What do you think? (FYI, 
Buildroot seems to do it regularly and it helps me with keeping my 
vendor tree somewhat up-to-date security wise).

Cheers,
Quentin

