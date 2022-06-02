Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7225FC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 14:53:23 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.50])
 by mx.groups.io with SMTP id smtpd.web09.6.1654181590911532086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 07:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=2vH/fHfP;
 spf=pass (domain: seco.com, ip: 40.107.2.50,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMLNGztEBTyuj+qV82PhC6cy8B4PdXg/NVEN31ggTr8v2qlaoDTp3gm2bZFSajsy+D/F8umnCDu/tC2YBMLBcHPWtJ0pvsvCDPU/DmYP3qeou/orVLXEzjC2+AcSGbCyKK1/TnAVCnhFRddrVTO8XthIy/FDNoA1sp4a2Mf8XrmXTbEhNSPgOKdJR+THA0fea+dQhCdbfbxbmuQCX/KKEGp9WDMfZSL2syy3Gy76Sq3gHNkm9YbhwnaT3o8N0Y44s0WKM8JMPbzrYiHzPD8ZkzL23e2u8OCLBVQ3BruDvl4l9zWcEFNP3H/UOzeuAUYt0JmxV5n38yQPUL1kbv0nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEvy/GJEdBLjeCiAojiJ3iXOKJFtbhxqtkWc7BOFWaM=;
 b=QoARW4ztbO4dqZTDS1Y/XqhLrVVhdLQLzO5WVqTMAhOhpIOmJLlhWilPA7f7sR6+x8nTNXhDiASThWXmj+wgrnqSJwJJNAqeteWdwb340ksBxxDeDNqWNoTeaiKaqh/LFTE1cEh7UpggJMmQkP82JiV8HC3RPJU1xt9h86xN9w+BhMMjQcR+bSS4/LJKnnKSlq4JBaKeXrTQIHGWtMOQW/oKpks+dz1jwCsPJzhEYWEAgQKOb2kXnC4PshV9qUCOzSeaofYAJRii6ZwUMJpGe4aNhMLy8itO3TTaZ7m7F6GkiBw2lHlE74YkSqYWq851jSOR7t3Lm8iHUoNKKpA3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEvy/GJEdBLjeCiAojiJ3iXOKJFtbhxqtkWc7BOFWaM=;
 b=2vH/fHfPDr4DmcCOU+6CZdv5ZiOJam3cJzhcDqLa1Xy6lMrDubpBckye8hP5umkf1yWuo3yaMZC3lAWwvv5v8214dnp9VqqRcsptqlQQzGpoy6FRMZpaNi8uHwQfPK5lAsPbemnDF3pzkCyDDhV/FwVjrreVs8+URUOvuM6dnBZcagwS2SMNPTW9B7c7rEBSRISizBB40biZ3xF25MtxuNIcDGsDjyVy3XJcbow8oLyluEMLR8OkBZArT8MSncPNqMGWBmzz5FO8TIyVvf2Ku9sMZo7x9Fql4rGKh0nfq/uNy3ikQzi+jIrVhWII8/h/t5LynZZBYPWKSYGYIQ2/Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM6PR03MB3736.eurprd03.prod.outlook.com (2603:10a6:209:2d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 14:53:05 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::757e:b75f:3449:45b1]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::757e:b75f:3449:45b1%6]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 14:53:05 +0000
From: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: find .ko.zst kernel modules
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Christophe Chapuis <chris.chapuis@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <Martin.Jansa@gmail.com>
References: <20220531151052.3667079-1-sean.anderson@seco.com>
 <20220601091310.5c35a235@melee>
Message-ID: <98b3c9ff-790c-8432-59a7-9371312a1901@seco.com>
Date: Thu, 2 Jun 2022 10:52:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220601091310.5c35a235@melee>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::15) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96bc4863-27ea-4185-44b6-08da44a7997f
X-MS-TrafficTypeDiagnostic: AM6PR03MB3736:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR03MB37361C407D0FE7ECB68381D596DE9@AM6PR03MB3736.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O1+4DmJnO0E1umSeBbp0gqgNowAOxgeMmYeZJ/eyK383+XOmzRSlmH/50RZje6KUYGWk3q5xDaqyD0XntdMU8msYIyTWJKko11XZZ3oo4TiWztDXCIVl3YgWThY8cnmRMFCZVNjedv26dyHlwuj5NxIWK6vjCHjBH/owc4Ed7+cWp/OTuwDPjJsLl7wKecOiaXMkJgr03g9fPL8UaNZxWywmcM2iwf6eT1vASCIkWp0YKjii0pcKn1b+JCtaQhJwyM7NKMH/3JgNf2XXJojsTwOVWvSTwTvolCzXcOkl17KYThYMiUamht9TX8sFsWPNFjy5XwPDwOr7lTG1fKfciOlqh6ewSbKm9a1YkZ52NV9rCXoN4K/QpPLYh5inRePlHmbdh5fC+CCDlGOXvoArETbwFMdzNCBhQDD0mpcx7b8CF5gG+7OAEzeG+o90k4pUyqwKwCzPuPEaG8PeA7yqvMj/DBmrP6Y7S1iM1EHjlSd4mAv3hIszhEV8mZzimHNxlFx9jVFlaBCAXbe28x4bMqBxHy923UnE5RIJv+z7Ik+Usc8Z0WLpBajFdo0wetri+jCci/mb4U7mAF8Yxy5NsWAFdGsDAuuYncaWDF1Q2k0I1k/ajZp/hGdK7mgizmjGGmAZamV4iyPBoSaQ63My41Q0UXi1wki+os19JDTAEeEjISnec6Eque/S6xgBTI51RYRpsmb2tulZZlagUkMmvB2Mq6uDVEJK/YM6bLYdIk/36IyUULIXlrhJc4g9t+/bujrx43Tnc3C5LnMPwnwHxFDjOYzHCtIXg2AkxNqT+EA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(54906003)(6916009)(38350700002)(38100700002)(8936002)(31686004)(8676002)(4326008)(66476007)(66556008)(2906002)(44832011)(5660300002)(6512007)(26005)(52116002)(31696002)(53546011)(86362001)(6506007)(6666004)(83380400001)(2616005)(66946007)(186003)(966005)(6486002)(45080400002)(508600001)(36756003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1FpbC9BU2dGTTNybHpvRVNBUkVub3l6aWlWVzBoSzQ0dkVmMlhxb3BNZ2Fx?=
 =?utf-8?B?b05VUlUrOFduNTVjNkxqS0VSK3YrMWVQelFrb3pWRGx4U1BtaUtQV1BVM2dG?=
 =?utf-8?B?YTJzSzNoaVFXTDY4WUpDN2JtdFFPRm50YVlUYUtaQVplMGpaRjd1THNvQ3dL?=
 =?utf-8?B?THVXQWlhbjQ5d2IyNnJneEY1d05uNnMrY2FWWFRMQkZ3KzZiZnd0SFZMZS9p?=
 =?utf-8?B?TnZQVVN2T0ZwSkJ0UmMwcWR6bzhSWmZHUzF6cG9INVBKcW52T0RYdkhUQjF0?=
 =?utf-8?B?V3ZXeTlWVjhmSzNGYkt6Vm9BbHJQelhBV0RNT3dxTlVnaFZvUW1JdldqaGhQ?=
 =?utf-8?B?QmxnazVwYnRjMDlSd1llTHRPbm5TWDMwTXdkdUdERXVWdnVrK1gvMTNhRlVl?=
 =?utf-8?B?U1FHWURTai9lNHpKMlV2T1A4SzE0Smlsc3A3Z3dnbjFQaGJNYitzR3lNNFMy?=
 =?utf-8?B?ckZBMDBBdXNZME1Xdy9iNHZFUDJHNk1jUmF6OUg0UXVYaEZCWEU2am1XcEtv?=
 =?utf-8?B?NVEzUG8zaVlyeE9WY2pDaHVYL1pDaFNaUk5vRXMzUTFvclgvTGhHRXA3MzZW?=
 =?utf-8?B?a3VIL1FPdlBBZzZqak1vZjhKblJNejlkK1ZKQ3hueFh3QW1kSWQ5Rko3WGR4?=
 =?utf-8?B?SUZNK0hzUzZldWFzaktIYWpGRXFUOHIxMFFJOWUzYXZKQTBGQnh5RnptclVF?=
 =?utf-8?B?YTlXWTlndXE3ckFWT2lEbFhNeUxQbFMwT0tRY0hncmlOcmhUVk9XZDRaaWR4?=
 =?utf-8?B?R1d2a3JKOEEzZkxPWmpETXZyQTZZd3oyT01QVkF2SVhLeW8vNzJOUDVUOVEr?=
 =?utf-8?B?V3JGb3hrcTBaYXRoK0o1K1ltV1FoOUJHQzN1Z2hwcnBsUy9id1pEbzRLTFE0?=
 =?utf-8?B?WUEwTDlRZ3pYbU44NlBmcFRWWEpKYVdIc0s5dDJqcjU3SlhpUWFkZ1dBQkFi?=
 =?utf-8?B?Y2NXT2ZpdU52N3UxRGNiRTg0TnM0eklRVHFsRVNnRmIwYktXTWhJREwvVXVM?=
 =?utf-8?B?UExPY1haV3lkdi9tc2pMNGJ3amM5eExMcFR6dTFXWldFSWhkWkl3ZUgyWUYy?=
 =?utf-8?B?Y3pHaWw2cE9WTVZWbStEZjN6R1Byc1oxUkc5eDk4OW1rSTZRVXM5Y0svL2xx?=
 =?utf-8?B?T1F4SGw0ZE9PNVY4eGlFanNxVXIzR2lhN1BRZ1BGTWdDRUF3ZEkxeHZFZjRV?=
 =?utf-8?B?WkdDS1N1TCtkeEdkbHN2QzErY09FTHVCSG9WcWRNR3VITWVJd0lJN1VOWVRr?=
 =?utf-8?B?NHlnK2ljdXZHWkltVVIzcnVzTi95aXZBcmRzNzJScmdDWlp6d2Zjam1pY0tp?=
 =?utf-8?B?V2dvNlZpL0dTbGNBc3RDVVdOWHYraHI4YmMrR015NSsrMEl4TktEaXZkU1dM?=
 =?utf-8?B?MjY1SFYvNk1IRnZSb3dvL01GZjdrQ3N1MWVuSkRNVHZyMVB5ZUQ1VkNreDh3?=
 =?utf-8?B?Z0ZuMjg3QWE1OEdQZG5zdFRQczNSWVhvditLcE45QUh2QTJPMnhyNjdyMjVT?=
 =?utf-8?B?ZkR2OWNQWkdOd0t4M0c1OFdjYmgweXNrdGVsQklKRU5FbVIyWVpudnAxeGZC?=
 =?utf-8?B?MU1uZ2RXQy9oNFoxZDJCVlhvSWsveEF4Z0NjN1NzTlNDdjRKV2luOU9mMFVO?=
 =?utf-8?B?YXhQazZmMWkrd0ZyVjZPVUNXQjduK1Z1SXE5TGlldXN0RmlrZ1BSc0V0b2I5?=
 =?utf-8?B?UGtoSmhMK3hrRmVKQzBibHNNUzlJQjRtRncrNzcxM2tTUkdWR1k3ck9laVRE?=
 =?utf-8?B?SEpSelo2aTZaWXVTZ3h2Y0pzV2R0Z3lWWGU5SFRZWjJFNnB3YTh0a2Nkb3Zk?=
 =?utf-8?B?ZVB4MnVFRE1jM1RHNkRNWGRyUjN5ZlVxcFdrL2VvQy9vd2hMZWE4enprRDIx?=
 =?utf-8?B?VVFxczMzLzNTQUpWckl4YjJDWWFhY01jRjFIWWFZaEVBdWFVTTZkSDNhSjVS?=
 =?utf-8?B?MnRUN0tNUUExcDhOSFdvNFB0enoyL0U4bm1PT2xuc2NEMjNMS0tpOVJ3THND?=
 =?utf-8?B?dmtxWkpYcVpPUThGTTVYQld4R1lxdHVCU0l5T1pIb0dHV1dET0lqOUpVQWw3?=
 =?utf-8?B?YytVTFFWVUdENTRydkYwa2diTlNFdHhMYnpvbEZvbmRKUEM1ZDVJRnFlOWRp?=
 =?utf-8?B?NUJ6VG1GSjlaZ1QyNzUrREg1V0RnNGl2L3krYXNyM0s2VVhQcFN1RWJMTTJ2?=
 =?utf-8?B?QlI1WEY0R0V1ckpxTDYzNENDNGk1amJBS002c3Z0UGtram02KzVIKzdpaW93?=
 =?utf-8?B?a2JiZkw4MFFMMUxkTkpXeGc4dTBNb0QvTUl2MkRaVW9xWjJHVi91V0dBTDJY?=
 =?utf-8?B?TWk4ekM5cnk2R2E0emdXZmZxNHVXRURmVHVzTHF1Nm9tb0N6amh4UWp1c2xu?=
 =?utf-8?Q?ah+mh85DZ9SvZJaQ=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96bc4863-27ea-4185-44b6-08da44a7997f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 14:53:05.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WhASA8B3+Hc6VJDagsyrnO0ysIxYtqmk3Qt0/Tca8XZOgRjp7Ha7llsxMFjwAvwbo81l+000oHyghmIIw8wSjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3736
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 14:53:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166473

Hi Luca,

On 6/1/22 3:13 AM, Luca Ceresoli wrote:
> [You don't often get email from luca.ceresoli@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification.]
> 
> Hi Sean,
> 
> Il giorno Tue, 31 May 2022 11:10:52 -0400
> "Sean Anderson via lists.openembedded.org"
> <sean.anderson=seco.com@lists.openembedded.org> ha scritto:
> 
> As you can see from the above line, your e-mails appear as coming from
> an inappropriate address. This is not your fault, it's a mangling done
> by mail servers, but it makes applying patches more complex.
> 
> It should be easy to fix, at least enough to allow patches to apply
> properly, by setting the sendemail.from parameter in your git config.
> This should force outgoing patches to start with a 'From:' line in the
> body, and that one is used by git am to take the correct commit author
> e-mail.
> 
> Can you please try that before sending another patch?
> 
> Thank you!

I believe the From header is being modified by the openembedded mailing
list. On my local email client I see the correct From. Further, git
send-email reports the correct From as well:

> Server: smtp.office365.com
> MAIL FROM:<sean.anderson@seco.com>
> RCPT TO:<openembedded-core@lists.openembedded.org>
> RCPT TO:<chris.chapuis@gmail.com>
> RCPT TO:<richard.purdie@linuxfoundation.org>
> RCPT TO:<Martin.Jansa@gmail.com>
> RCPT TO:<sean.anderson@seco.com>
> From: Sean Anderson <sean.anderson@seco.com>
> To: openembedded-core@lists.openembedded.org
> Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
> 	Richard Purdie <richard.purdie@linuxfoundation.org>,
> 	Martin Jansa <Martin.Jansa@gmail.com>,
> 	Sean Anderson <sean.anderson@seco.com>
> Subject: [PATCH] rootfs.py: find .ko.zst kernel modules
> Date: Tue, 31 May 2022 11:10:52 -0400
> Message-Id: <20220531151052.3667079-1-sean.anderson@seco.com>
> X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> 
> Result: 250

I suggest contacting the mailing list admin if you aren't happy with
this behavior.

--Sean

