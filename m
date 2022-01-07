Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81A4C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 09:59:03 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.12])
 by mx.groups.io with SMTP id smtpd.web11.4603.1641549541312537947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 01:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=LL34gSHk;
 spf=pass (domain: outlook.com, ip: 40.92.75.12,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb/9lKHs0HC2HaxOTVv0RnJJPbpR90bJQ69imjf2pOjEXbuB5eAkONU6pPptrhFah1oB7Yh9n4nAa0UkZV8WePNKuiX4cy9TJrl1DklhMF37PFvb+HS5FtSBkjc7e9Itaszrz4xu4fstr6g58wga2VXhBXf/UoZvw09SYNlh6ckOP6cHkwvxPDsOUPiEramOAdDE4wlQM43flROf6JgLAymRx53gl8O4A7lYge4iCe2ugf0jhzMV5Y3ooDCqoHxKJmZVvVmVRBhkXB6vVNZGOu3HDTx0VN9zfXPTi65QqXAdqhNabcYvmTwqXtC6PmAf2z8iAryv1NSW7oq86MMjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF8Vr7lWYaqx4C+PPNEoFzKYWoWqE0ZmEV63lgVBhg0=;
 b=aaz24XNW3ohB+XkexGtqZCoZm86l5FfE/D5bhTbokhuFtE6gleC4t/6gPTzXZQ2acKj8IW7MNQ1MCTHNyZ7Vfkg1Uz62ATDV1Q9w904ReeIwc+anPGYVEkjLQggDj4xQ08GAfd4CHkcQFlI+plGs0dk1Dwrs3AQ+xV7atDHr/gEaAb54EikjSQR2f4pr+iPfSBzhIFtXLGzV8bKlu4JdERUmxvE8xBQ+m1NhEWh5u30Q64h9ZCk+GzS0xlne1o+y9vyBqy3UypHH7Bvj+JuZGNEDsP97X0bY8dmNC5yp4BqKvETkWsZcBHRrwakkhnIcFUDb6FLCBJaCW5zO/W/+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rF8Vr7lWYaqx4C+PPNEoFzKYWoWqE0ZmEV63lgVBhg0=;
 b=LL34gSHk0cmOrF/Y+dFMs+qG0ds1EBeOtGgEZLf3B7yy71UR0/ltRq09by0T3J7q/evHUVFUPahJTgoROr7ldE6nZhyMcdjxnWqwQD9PXIG6PgjA4gXqofBYfX4zKoOekl6i0gIvVPzmd+dmUpMMaGWwUW0rVSDTGqs4yriA+Ed4b4AcimxtoNNqGqwddVTSM8EGl1pl5FYuTQXjWL9OVYs8Nri8c36tMVqeZ0rgRCPpFcVNn6fJsEHJIDkDHH0nMVLoiDtAz1gwxSJhrcXM6zj6d2ehY3dug4BtJL3WY7RekComj4V/2vIJi3JJDqEm0PNPS+KnmiX8w8X9qCXoCg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3282.eurprd09.prod.outlook.com (2603:10a6:208:16c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 09:58:59 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401%3]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 09:58:59 +0000
Subject: Re: [OE-core] [PATCH][RFC] cve-check: add lockfile to task
To: openembedded-core@lists.openembedded.org
References: <16C7F41596656732.11018@lists.openembedded.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 7 Jan 2022 10:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16C7F41596656732.11018@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [HBQB1ESdMXd1B/FwwgTmwVxi1gQU1KKA7oIBjR2th2RMbtKYiJTIYv2Z95RgBuXr]
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <683bdb06-f962-e690-ef4f-9414e5cfd20f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f3b4fb9-7063-44cb-62e8-08d9d1c4531d
X-MS-TrafficTypeDiagnostic: AM0PR09MB3282:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5o7HY5cMQzbaixjoQguOdbC2ExOMQ92vNNedj7nByYjYFHY1zBOyl1aW9k9G1kAUQBdOfFsTT8gKqySA+JT4FJXyORVVH6802v4Pjnjixvs2yav7SIvus7/opF7jL57EPEIXrZc0rEzAU+l/c+9J9f7sjT3vrzlRsb4OJIjq/Xx0znG1CxuG9+XZNh1C5HgrAw4wcdAaoJHWvvcK5/r2s6qDiBaMGjEamZ+lPNfqMcK837tJpMfjzD9B6P669VCExZ6JMiro6zb04qmyGob2ZkmCerchCxiM5NnR9FWTTv6dZj2k5B6dym/z4hxX3Yt/NLt+Hm4ekry3F3nsWrj1dg3bniDf7pi8VvUKP5WfmzePNue+xY4ATDD1js8FSjRJ9/eAoS76JgyjPXxSy5uRGtIgO/Y7Ca3vNYS23pFq3SM88mQVSCc01qptdHESRLGe40KZVqOjxgCTuzQYUbfi/44QNHjju7mhZuWVwTai8yPTa9hX9k5CRmyJQhRrGU1gPusK28CIqaVIyIBMjiVIuFuEcY0yM2NYcL6vfj2vNY2OKkMphJ7RPUWboMLSsKUxodHKQEsvYnJJ2YcRuug/Luhx90ua7ODsEWNXKJa5tiYAmYJBav2bOcMuyQZ2wyCDZm2pr1KviKI8+mE8PlZW8DZk19/WpJ/Xeccalc71t8w=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VndVNjFQTVBFNDRoSmwwMXhVTnRzZlBxczdMSzZiTS90NUlpN1RVSzluVTJJ?=
 =?utf-8?B?TGlRSlQxM1N4VWRJM2F1RmJhN0tvOXZrOURhNWtkN2NTU24yVzk5UVNnYlFy?=
 =?utf-8?B?WTAwdW9TQVlmYjA5dE1WRElFUWRWb0FWVWVuNEpRQXlBMGJTVmh2eWU4Q2sw?=
 =?utf-8?B?eE1YSGF1NDRmRERDcmZFZDk5S0xPV1dUNHNZWVd1SDJBOS9uM0dUNHg1cUJr?=
 =?utf-8?B?RlVWVGJXeXhuUEZEWUtFTGxnYm9XeFd4RGJTdlk3Wk9zUmF6NDVFaW1pc3ZU?=
 =?utf-8?B?UlB4NkJKOHgxalFFUHFuR1RublVyYnpTQmhBdkhBU0U1cFJ2VWlXVFJKMTVh?=
 =?utf-8?B?VU9JRXFzdU5pMENJRFRwNWNwM2pLNHgyYzhjSytXMXgwcnl4VFduWkNOYXlq?=
 =?utf-8?B?TWhlK2R0RURlMmpUblp4VjVoem9aL1Y1c2NibGk1cm95S2FTR1pzMUh5UFRI?=
 =?utf-8?B?eWg0OVlERVV1OVJiOG9oSlJNaXZUS3QxME9ORmtOaXdReUFZNzE0WXg0Vmtk?=
 =?utf-8?B?T0tPdzNQOTB4aFpTVFJWTkd2cEIwcHFNbWFPUmhXdGgrZlFMVXNrVmVIZlZM?=
 =?utf-8?B?cVE3eld3Y09jdnBYb3ROSmIwWE5kRVhRb1hRdmV5M1lxa0Q4QTdPRkp6UDd5?=
 =?utf-8?B?VW5Ua25sNEptUjY1R1pKdkdPbWE3aWNVVytPMXAxVEI0VUZoa3dvNjR4OWls?=
 =?utf-8?B?cG13YUl3cDNzNHdTVE1NdkVVTHNxVW9OWXJLaE5wMjhnUjBPZnIrSkthZlpY?=
 =?utf-8?B?UW1VdHVrbmRzclh2WFRYYnl5OVpNTnZuZnBLSXJBa0pIY09ISW11S0t4aHBV?=
 =?utf-8?B?ZkhJcFk0Y2E4QVBkTGcvK0pDaVZ3bksrd1FwaEI2VG44LytyR3pXQzNxbjR0?=
 =?utf-8?B?OWQwL01ncWhXVyt3eEZ3M3JxbElqVTJicnlkMGEyajg1cDJUbmZiSVB1VkVD?=
 =?utf-8?B?elRqQ3BqeXdCMVBPN3ZhSkt1V1Jtd2R0NHNvbmxjNVdRSldsMFRiZG9kOFJ4?=
 =?utf-8?B?TTlSZWl1dUdSN3FFOGNMUTFjYlY3dmJRTlRQdmJncVZQSXdBU3craDFqL29a?=
 =?utf-8?B?TlZEc3JJRCs3aGFMeVFMem5zaVRqTzRLTmdnUy9NOXpCMTJYMVVEZ0NFUFlE?=
 =?utf-8?B?ckJYUzJuUVJydmRkZ21aQXhSZWtwM1N0YUMxcndSSi8xc2xsTUNwY2x4UEZl?=
 =?utf-8?B?dmFZQnExTHZ1N3RRemNkNmIxdWZHTmlHWEVKNHVUYTNORU5LeUNzWlUxblFQ?=
 =?utf-8?B?Tzhacnk2djVUNU1xbCsxbW1MV2pXNGp3ZGFuQlM3dEtGQzY5cGJwRXV0aUFG?=
 =?utf-8?B?SS9UeEtYR1NxQW96LzJYZXBPSjF2TEtyRXgrdEJUWVFaa0cyT0F3Rm1oOEg2?=
 =?utf-8?B?TXkyNWFXb0NVb2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f3b4fb9-7063-44cb-62e8-08d9d1c4531d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 09:58:58.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3282
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 09:59:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160252

On 07.01.22 10:48, Konrad Weihmann wrote:
> this should prevent running into the very rare error
> sqlite3.OperationalError: attempt to write a readonly database

It's also possible that check_same_thread (that defaults to True ) in 
the sqlite3.connect causes this (see 
https://docs.python.org/3/library/sqlite3.html#sqlite3.connect) - I have 
too little experience with sqlite to provide any further input.

I'd be happy to get some feedback from users that do have that 
experience with sqlite in a highly multithreaded/multiprocess 
environment. Or by people that use cvecheck class in larger setups than 
just core.

> 
> As highlighted by https://www.sqlite.org/faq.html#q5
> it is likely that the adapter won't allow use multiple exec calls
> at the same time.
> 
> So it's best to prevent multiple accesses at a time, by reusing
> the already in place CVE_CHECK_DB_FILE_LOCK
> 
> YOCTO #14110
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>   meta/classes/cve-check.bbclass | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 70d1988a70..6c04ff9f09 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -111,6 +111,7 @@ python do_cve_check () {
>   }
>   
>   addtask cve_check before do_build after do_fetch
> +do_cve_check[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
>   do_cve_check[depends] = "cve-update-db-native:do_fetch"
>   do_cve_check[nostamp] = "1"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160251): https://lists.openembedded.org/g/openembedded-core/message/160251
> Mute This Topic: https://lists.openembedded.org/mt/88258164/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

