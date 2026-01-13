Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB96D29DF5
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:34:00 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55520.1768296837552237180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 01:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bOr30jS0;
 spf=pass (domain: cherry.de, ip: 52.101.65.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfQ19EVOuo1m2AsY4bz+JEj4O/GNsApD0DsxEpq2NFlIvfBKpmcl4HqSI5VDonU+o3wqa7kKDj/Tpqtf8tPzvuKM7qKozAQleIuEjdhpHKhOlgvabnpFUJeg9HZ03qywEV2D6ibCv41xR7r8i00KJ05g1fq89YxPKTUPbHtVmZcb+7DaBonFBD6lgVotX1ZdfosnTDZdZWiVn2VS6EWdgWcvuKHblNKkB0pYvAwJRAKtzL15ZlaVycMMslxUKsQM83Y23HIzawjvX/Fk8IDyJQdJq+u3i74K01MoLP1yvtmyqk9AGsHxkApQyOyv85/+fhnvxIIQGlEpfUlnLT0B5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa/GOT8PQoKNWfuMMFMN8tqT9fqc4lD0FlB+ne/4af4=;
 b=U+LiIBdaxf/PzAWsxroxo0DOu9+HYjPgBfw7JFOgb2dBT6nBAVeEEypmmBqhFnLnxUhFZhKB9BiNM8YTs4SopTSqCtu54DCPp5AexTp3YOgzyX4D54tM5KpwR0WEaPdspJ7CO5pV3dX/eZeQjvxMlEyQ5s2rovFNAFLGEMsdprjOWKYTthb9xjw2OqcYms/fUD3E62bGuJl62Sxv3X0WCU3XP9v1us4XvmAG2fP/2Qf7U88O8sg/+Nh5am1HcfOSvTk/yuVr/BxxF6hIZ7aLql/An4p/ZW1O6jS0UUPO9W4T+mbMMf33PgIq1nVlEHqXFAa+Yyeo5u+99Qv3sNZn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa/GOT8PQoKNWfuMMFMN8tqT9fqc4lD0FlB+ne/4af4=;
 b=bOr30jS0N1khRdZD2G8YyEtP/kO3z5LSp+r/omjL3eqFj8p4NdiNUl/eZNF+hvIxtrnfc064sNFHjmbgHugInS87hJvsdz3WFo+q7ABFuPrMgfyJgfQLUAwS/NR18wc1E8QcSJmRgV1gsVOH8ALPRFwG1dzARR3GUSm3/nNSZlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10763.eurprd04.prod.outlook.com (2603:10a6:800:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:33:51 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:33:50 +0000
Message-ID: <cad6d36c-6b13-41c5-86c9-e63c65d09304@cherry.de>
Date: Tue, 13 Jan 2026 10:33:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [review][OE-core][scarthgap][PATCH] libtasn1:
 Stack-based_buffer_overflow_fix
To: Amaury Couderc <amaury.couderc@est.tech>
References: <20260112160031.71913-1-amaury.couderc@est.tech>
 <22438428-9339-4abe-a7ce-59524ca33cac@cherry.de>
 <AMBP189MB3196A11C869915431C0CE336F88EA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <AMBP189MB3196A11C869915431C0CE336F88EA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a332e5-2c49-4989-19f1-08de5286dc2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0kzaXhDY1ZUYTNrYjN3M2lJOUlNQktjcDdZMzg2UWd4NmZNUWZwcnJvUElE?=
 =?utf-8?B?UWRQVUs5WEhYNE9QQnFNL3NLY2lLakNSbkFHcUhyTWFnalY4TGw5aStwdU8x?=
 =?utf-8?B?QXV1T1d3MVEvTkRaRkdZOHR2dnJoSlVEeEZaMCs0VGdudml0VHM4d3ZVNEM2?=
 =?utf-8?B?OC80eXBEbllNYjZMaGFDTWcrbitFMi9CM2JUNGNUWHpKQ1UyRzBBYjlKdVJu?=
 =?utf-8?B?QzNoR1pZYWtUcFBhSUoyYkVhNUdseFlXQ3REbGRrSVRXVnloT1kvUm5ka2h1?=
 =?utf-8?B?L3Z5SWhxUEdQdkp0M28wRzg1VkRSY0JlNFB1WTZkTG9paWdFdnFWelJKUVN3?=
 =?utf-8?B?M3BBUFI3Y3BybXNObWg2VVpXaGpZaTRhTlRnUDJQbVhMRmJEZkdVZjlFblBk?=
 =?utf-8?B?VW9tRWNYQ1BLL2lIOVdqOG5sbXYzNytCRDFVdEsxTjgxRXRQdGlmNWdYc2VJ?=
 =?utf-8?B?akl4cDFxZHlVOXk0SXNaOG4zaWVNNUNjVFQ0TzY2amZWQnozb1hwWTYyZDA2?=
 =?utf-8?B?cDFwQnhUcXVsbzFPRndnWDgvcFJ0RzgyTEFBY1RzR2xHYXJRTDRhcHlRVkNH?=
 =?utf-8?B?dklLdFRiRlFza3JsUHFHSEJYMzlkcHpMYWxId3hIaGZJWE9IbkE4REorK3FE?=
 =?utf-8?B?RVpKZnpYSWxnSXFuQ0FyaXhORE5ydC9lSmpzTkE3UElMNWlYNk5Sb0U1QTdk?=
 =?utf-8?B?Y0JLTnUvRTB3Yzl1aEcwRXRaanFTZ1dMNTEzc1c1VUNvN3dSSjUwTDdmVkw3?=
 =?utf-8?B?SEU1dENNUUNJMXNYaWxtamxab1dHRWUzakU5c051ZEhPbzh1STV0Sm1aMjdt?=
 =?utf-8?B?VVQ1UWQvZDRqRkNDalh5ZnhRNGJxVlhoOUVaeWhtQjFHL1lhYlJiSnhKbWJs?=
 =?utf-8?B?ejRvaFNkZFZ3QUtMc2NKajN1RGdGTkU4RWlkM3lxUnZhQXhmdGtlM1Y3YSth?=
 =?utf-8?B?OVg1TGg0YzdLc1grV0kzUFEyMmkxSUllMndJZm4vWGFQZ01mNVRESHBSdWpV?=
 =?utf-8?B?dUowS3hiTHNNMldxelVSejlHbDdEeHBKd24wUkkrY0MveGs3K2xhajlzYkFF?=
 =?utf-8?B?VGhHcGJZWlgxRjBxa0RuelJXTDV3RUdqR0labjAwa2hydjRJRHpja3dtYzJ6?=
 =?utf-8?B?VTlUdmZVeEJ3aDkzVFJ2bXpvY0VmRjZHeGQ2RE5xUUxBdHhsTHhKampGVDZi?=
 =?utf-8?B?c0RDbEZremJ6OXZDNVFQeDhCemlnOVdWa2VsK3JsQmhRUTZBNHdpT2NENk1z?=
 =?utf-8?B?VHJtM0REckpQUDRveE0wWi9Ua0RWVEpjbW55eWhqdlQ1OG5aL0tvSllKUmNw?=
 =?utf-8?B?VkpsMFp3NEF3cUJGUENqQUZBWjlQa1BQTFJMVkdRVi9BK29wNFdlUXlaRERi?=
 =?utf-8?B?MkV4aEswem44eUgwSWdmWExxMHdwRHZtZkFuYUJPQjJzak9Nd3IvT0hjZGZK?=
 =?utf-8?B?cXVGU2hBQjEwcURQS3MxQzJsalN3SmR2VGIrSGR1NGVoclA0dUQ0elFTMnFC?=
 =?utf-8?B?S0ZFYzNSU0FOVEhiRkNVWUx1c1ZqMHltdFZOOWtOSFBpM2psMExMKzRKb3gr?=
 =?utf-8?B?SVpteDZXZXV4d3lhVW96YkJlTEFMb3dBdHl2M3RiKzdubkJiSXBkejVFOGJv?=
 =?utf-8?B?M3JIcmIxWW81RVh4dXN0K3lWRUlpWlNRZU5SNzBDeG9iWTVQMGMrdkwwN0Va?=
 =?utf-8?B?UHc2dERtN0NUUGNLVnJKNHlnRXdvY0M3VkZQdVpUc0ZNTXVDc1ZyVkY1YnlO?=
 =?utf-8?B?TEN2bE91QlM5TFNqTFBBaFRibDEzQzcwK1JqYjlzSm1ENG5IYmFtUlhPdS9H?=
 =?utf-8?B?S1RnKzJpbUxtbzRiQldXVXVnSmRRanNWS20vREUySUh1dk9CM1hCY2ZXVHhs?=
 =?utf-8?B?NFc2US9MVndTUFFYcGMycks5b09Lcm5kT3pYeVpDRjU0TUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2hsUm1KM3FMOGQwQ1lRT3o4Zm1nbEpiejlrK0ZzSEJiQjBXd2JQQkl2azdv?=
 =?utf-8?B?L3ErbmJoWXFtUVlMMUpKWmlTZitCSVpQaEhBbTlqcWJLZ0J5YTZzMlcwbStk?=
 =?utf-8?B?cVM3ZFlJc2pXRi9oc1RiYVYrTkZITFA1cUxpQjFqRTZuZU5QWWdjTytBdXo3?=
 =?utf-8?B?T1dJdko4anFLc1kvQ3BTdjRISlZQTGNLdXJMeHlQVi9JczRkcFlob1JVcElG?=
 =?utf-8?B?VnBYTTVQWlVNWC8wUGhIMVMvam9oVjl1cXhBSnkyKzk3MVkxTmNtVVh6UHBu?=
 =?utf-8?B?S0puMEdKVG40Y1BQRjdLQ3hZN1UzZzc1ZEdSK2xFT1dBNCtSejhOVnlYaGtu?=
 =?utf-8?B?SzR3eS9kcm53M1duQmc4MHB3WDZGcXZSQlkxbGJNZ0Y0aFJFdEE4QlJsakNt?=
 =?utf-8?B?dlU0NTJiSjNiYVNnNUZaSHFwZm9XcC9WUW1xdWxDVGlFU0Urb3pmRFE1TWUr?=
 =?utf-8?B?Z1V0eGhuc1VkT1I2YWp5V2pCazNMTWRJL0V0M0Vrb3M4OFZzZDFRYjJtTVpK?=
 =?utf-8?B?c2lLWkhyK1YxcklJYmZHUFUyTEdYTjVTRHNzWTRiSFV1Sk9kdlprb2FHU3JC?=
 =?utf-8?B?Y01pY1BFaXJYSW0vV2VQSWlGY2V5ZmNHOGs1NEp5ZGlMUTBkK3ZnTFFKc1k5?=
 =?utf-8?B?OGxiM3RCWU4yRElDYVMydDBFNnU5WXJ4WU9sQlVYazNqYndRa2NVSWhGKzRV?=
 =?utf-8?B?U2dPWG9zakcxUkdjYzlmRDJRdUxrbGZ3S3d5WCtGVjBKcVNGNnFOMDJabVRC?=
 =?utf-8?B?TnRvcGJWUDVqbUpjNHAva3RHcTEyUzlWYlAwaEdoTWZSeFdVNFFldGZVUWpH?=
 =?utf-8?B?SkZxVHVEemhVSzhsWW96TjJGVWs1eUhKQm1EMmlSWmFhelByNlJ2UEliSE1p?=
 =?utf-8?B?bjlmUmgyMm4xalo0NVg3dHZaVG1jNmZXSFpxbEU4RjU3a0h3b3VESzFON1Zm?=
 =?utf-8?B?N0JoV3BhWFZDZEVEOXBSMnJaT0hRK21EVS9neWJROTVZWnVtTVRMd1lHVUwz?=
 =?utf-8?B?ZVpBeXJ5bnh2VENLYnlMZElPbUl5TzNyWlovdUZvaTJCQm9uNXh0OExtVjNI?=
 =?utf-8?B?NWNML0hhdE9hdytiZFNLR3ZVZGpjVXlHOHNXVDYzMUlsMUhxTHlScmNQcDhK?=
 =?utf-8?B?Q08rQVYvQTBjU0pCdEtRUWV5Yk5HNEtTNVh1dHc5aVZ6SGZKdDUwZXB5UEo4?=
 =?utf-8?B?VHd0NzVuVWJ3eVlGMHZjaXYyRmdiZTBLY2x0Y2Z6VERvazZxL0xvN3gxbnI5?=
 =?utf-8?B?S3o4UEI4TmRpRXBBZWNnQWx1RVB3K01RYjNLSGFNemZBSmFRQkFWYUIzckk5?=
 =?utf-8?B?UFBobC9tQUhRbk14UjZBd0Joam5iVVZzdkxOdWZHUDV6UzRDZFdVaG83NVZj?=
 =?utf-8?B?bjljMEdQQktycE11aHgyK2U1ZWpxY2Frb3RWRUZqZ3kxVXJUb0plWldCQ1BN?=
 =?utf-8?B?TzFCM3QwZWdkelVkUzBCSlJWanJ0aUFFMmlqL3A1YmVZUktWTlVHZzRRWVNi?=
 =?utf-8?B?enpFSlArdExWR2JPeTEzODZ1Yi85WmdxbHJEbkd4SGZIbzRpK2ZKOVBCVUxq?=
 =?utf-8?B?dlVEbFEvYW1kNEZGbWNyRWd4UDFNZ2dmeFFGdVJOd3ZwT2xCSXpzd254TnZh?=
 =?utf-8?B?WENGdzY2QklJQmo2clo5a2JQN251T2Y4TUpvc0k1Qi9Xek14R3VQaUxyQmFH?=
 =?utf-8?B?U1BWZXE5Q3N4T0tudnBBeTFvdjI0alJvRkNjdkRDUHhDTEpSVzEydkVQWHZK?=
 =?utf-8?B?RXlraCs5STdXbmVYVHZCNGxiamhCaFB1QUppUm14dEhGQkQ3cEZnSHoxb0U0?=
 =?utf-8?B?RlUycHR1NVRlKzNTN1E3YVY4TVJDM3JvckRqaVh5enNQQlBNMTBDQ2ZxVHNJ?=
 =?utf-8?B?TGhYZFAvb1VmcTlIN1VqZXlPWE4xZnJVNG1YVmxweXI5aWtkcVRzbnNzSmg3?=
 =?utf-8?B?MlBFZ3RKUDJNSVY1RFhLOTc0YWRac3ErSkVvN0dXbVNpYTN1b1FJang2Um9n?=
 =?utf-8?B?U3RkSzAxUVkzYXhBSkVhWnYyaGtMNEJWZ2Q4cUE3M1VQZXJBWnFDQjdtY200?=
 =?utf-8?B?d3lzQ01rdm1ZTzg3SjNHOVNHdlZXSzBteHB3cUpRYnN1bVRXOVEzVWhyVkFT?=
 =?utf-8?B?YmF4R0xacnRxNUI3UThmY09jMHFrT29OaUt1R1lhYVFHNTBRWVFwaGhlWXp5?=
 =?utf-8?B?elpsWS8vNXAva2cvZUpzeklVVW1Ram52U1dqQWNobHVudTlJMW1QL2s1Z1g5?=
 =?utf-8?B?dDg1QXlkNGpBZ1lKdGRKNnRwdElaY1ptMWUwbFU4N0VaWWZDdWMraU13UkhV?=
 =?utf-8?B?SmlxaDZIOHpHUEgrR1phOEM5eGhsY2FzOHA3UXllTklyUFBHL3RWdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a332e5-2c49-4989-19f1-08de5286dc2b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:33:50.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaCCE/Ga2brHkAGctCROs+5LmMIw9GIrQVnyCoTExQ8p1hiaYLffIglNaIcmV6U/OkHo2IOVqST+cZJaEctX2GnSLLKfcafNRmleTi/hHv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10763
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229236

Hi Amaury,

Please use "Reply All" when answering to mails on the mailing list so 
that the conversation stays public and is archived, adding the ML back 
in Cc myself.

On 1/13/26 10:10 AM, Amaury Couderc wrote:
> Hi Quentin,
> 
> I tested the patch on scarthgap, but I think it should be applicable on all the releases.
> 

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches

This is then clearly matching the description in point 2.2. It must be 
tested and sent against master first and then it can be backported to 
older-but-still-supported releases afterwards.

Thanks,
Quentin

