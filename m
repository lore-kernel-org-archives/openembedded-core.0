Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC4EC433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 09:17:54 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.47])
 by mx.groups.io with SMTP id smtpd.web12.9288.1633511871648767762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 02:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=hDRBMcTM;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.47,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA3y0O51+DCf1bg9eGJv6JaYiueoedSbC8P1uvYvWGsk1y6k0PTBgcbQ2FYH/LNAdvjWIcZKm/UCLSHdZwBY5mUNuxYKZIzegOLOwSvnCvE3y3TygGNlGzCegbI5elFkpZLRlhQQEwYv9L2QqA7pBO+xniCYo2lbsZOAcwNvAf3m9ImZbaA1Q61c57rXglDwcoFR5h+0pxg8SC1FS307Ar9HFJbCR/xDQkutP4alUfjqiRofhBhgag2VA05DdXHuH1ITK/6WJ9V3rf2jFdgw10dlOMDlJ0lkAqHhCQTqu7usAXwUKlYXhEM8kOn4WXyB+svgv4ujtcn8fFU0EsG9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZPOznQM02HaxXXgPhUmHq4YHtWvb6pToMVK/KcuhBI=;
 b=Ji5GIpIXUi2QJWQ7ia8IqnQbObVgLnzsjtRJc1fzm6dQUV5mIKR/SuHhfgbPMUnHJmmCKcLq6bq/47lK+xf+h8Cf7jGMAW9VwSJxGBNhuujOwbuGzza64WmEwbGL7KSASiIJ8wr8q9TSpo4pGquw2wcDX7mj+DISc0YrOOg7jOi1zZAJtw6Yld24r+CgAZy4K+q+bGDjNyEvwpqf0UL11ciZ5OtDqcie3b/V98eFPhcOkIxc4svsjrGMkvrjHF6tZjsTCXcC4PQE7mHmXI9rdfGFZfN+EwQEA5PwgysJGcjOJB1rcNYI7/VIQilUm/Fg0vw1uYrg50ApQBtOY5a13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZPOznQM02HaxXXgPhUmHq4YHtWvb6pToMVK/KcuhBI=;
 b=hDRBMcTMCVhA0ER63b/FG/yNiFGRSRdz9dL7YGhTX+dDsTUPnimy6dDVRrE0zO7QAF3WdwsfKLGXLqWN6vhk2VKJJHQT4w/RGQPzxSIRJmXypaido9NfhkuSCm3VFjl2CShwOseEYu31HX2XdavbZzAoMdIpLxkjJqVnxRge7hY=
Authentication-Results: outlook.com; dkim=none (message not signed)
 header.d=none;outlook.com; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5675.eurprd08.prod.outlook.com (2603:10a6:102:8a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 09:17:48 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 09:17:48 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Robert Berger <oecore.mailinglist@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Konrad Weihmann <kweihmann@outlook.com>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <be0e2d75-7d7e-039a-5517-98c5f6603e3d@gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <45ee8262-1b6c-e63b-b3d3-5b685926b27b@weidmueller.com>
Date: Wed, 6 Oct 2021 11:17:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <be0e2d75-7d7e-039a-5517-98c5f6603e3d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::44) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [10.175.8.182] (87.129.248.106) by
 AM5PR0101CA0031.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Wed, 6 Oct 2021 09:17:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eeaa4cb-dc38-4c6e-fc87-08d988aa29f5
X-MS-TrafficTypeDiagnostic: PR3PR08MB5675:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5675857EC1915B362AFE8654D7B09@PR3PR08MB5675.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hz9obmF3Ljbk/NwnagMYBIl/wm7s1fWO7GhPfw1nbcQQCt+rBKfkNJxpB/mdwfPxtUtbzSKhpMPh288ubCodjOeGJt4owIlBRpOFgzhqpmWb1i4oxA156LeAYwgxddOxwtPpoouMIFk+7vPjD19XY4eryeLlk44/JdKQlngeOrf+WMi+dlmvw0g30jknuUstiOlun3zsWYS2LtZcNqQo9lqSD4OscNYTg/OQmmp3Kt02baRBs0xbcIFkFe2HWsiv1ZEKeOWKTGZpBb8k22C0qnJshVsYSLYzvUTZH1Au8oD1xQo80H4AB+EKScOjhOm9cR1XTboJp/ejk6qLOQQhlEUyk0rGwwlGmA6kbyZn4Q1WaOQ+q8jkaCuj5DmVaTG3xAwO2hNMAlc6kRZlFNM+RwXDqagsCQEnXRBGWVReoC4cZkLdTeCyV4ElwgK8KKckRegvzvt4XKuW4pZh6RgKS/t6MHZHo1MhV7dFBC6yfZ2O+J+uNWRNWYWtWgv+1jgU+FfGQhfYUYeN1loW37WBuPwQ1dYYRBWuKxBGhdXEOy+HzIyhzCF07xpAg9qWzz0ckKSaCe3tuNyt70YFAbgctXkWiKr1AH/M2exLG7pvtNs1DrSLVrPOCY7wUEow0kJdHE/+lvegdSIi2dv6CdztPsdwAHMbz3aMw6s4rg2+YGihiR50ghwbS1yORYvIVQUygQO7SlZ8EO6zCGKf6JsE3fS750ZWJ3ayqUIrEIxLu4o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(52116002)(54906003)(16576012)(26005)(8676002)(6666004)(53546011)(316002)(8936002)(4326008)(966005)(66556008)(6486002)(4744005)(508600001)(5660300002)(31696002)(66946007)(66476007)(6916009)(38100700002)(83380400001)(2616005)(956004)(86362001)(2906002)(38350700002)(186003)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFN1V0VXZkpRYUxWLy96NmVScmdmU0J0bHRobFZkRFhsdDhKKzMyMEs3bVlB?=
 =?utf-8?B?VHdaamp0Um5pYkxIUjFDWTAwUUo0Y1RBQmorU3czWHZVZnJoWmV2VkRjaFpq?=
 =?utf-8?B?V3dnSTRaa2w3eHNLQ2wyNDkySkU2bmMvNUJrSitzZGJFaDRBVEpySUg5aXJ5?=
 =?utf-8?B?cE42eGJXdGtzNW9RNytDY1NXQXB3bnVKQ1daalZ3clVMWXQzWWFZdTc0d2dq?=
 =?utf-8?B?WWpCRklwYi9qT3Y3NzdWamxONHpGQzNiZXZyV2hrelhQOGtTN1FPSjg1TWxs?=
 =?utf-8?B?L3NLUWVHVGI0QzZZcGZLaWxhaGtCYzNGL0Q5YjR2V09CMkwrUFowdXU4b0U0?=
 =?utf-8?B?RitNZ2JnWno5UjVwTXRTVmJVK3pjb21VWTlIcFAwUzUwRmdCY2YvbkVWMWQ1?=
 =?utf-8?B?bDg4OXR5NGFFV2IvYktpblZCY2syaWMxbGhJeU5JNmcrNEMyc1FyNGNpQjJI?=
 =?utf-8?B?Z0NlSWxKckhUMm9JY09PdThvc3c1cnZmeVZtK1ZybmhmRVJVZmpoaGhLYXJk?=
 =?utf-8?B?TUQzZ3BNd0ppaGFmQnpxY1M4eW42NWJ1VitmU25CVm85TzZneFNvcnMzV3pn?=
 =?utf-8?B?dlM2S2V5L3ZQUkpCa1ZmamtlcnhCaW1QMDNhYm9SYTlGRGcybHVrWFRVWTk1?=
 =?utf-8?B?MEVTdjMwWXoyQUdPY0NDWVlveWRWV0NRdW4xajFTTnVDNTM0K3U0K0NCR0gy?=
 =?utf-8?B?a1dpTWhSZTVCVWdQL2Fobk9nR0FlbjhaTlhTeEh4eFUyVWQyWmQxY0I1ekJS?=
 =?utf-8?B?T2dJYm5HQkx3OXJRN1I1RXhJc1puekpicjZVRUFtUVlvOXQvVEZoZ2Z5YWhU?=
 =?utf-8?B?OWJHVyt5Ujg2Sll4eTV2VlBEampXVE0zR00yM1BzRTRoL0Fva1Q1dGVVQkpp?=
 =?utf-8?B?RmcxeUp4TVBTMDg5eGpuZVJzd2E3TmJRVHdyUXVXd1dQallxaFZzY2RhenZK?=
 =?utf-8?B?c1hyYzVwcjBveE41RzViMzQrRnVNTG1sQ2dXOUlWSVFPK1k1N3hKZnhLT0Vt?=
 =?utf-8?B?SGd0N21hdjdjb1A2dytPSHZ4Nm4yajNobk03cklYMWZ2RlpETkcrNm56YjR3?=
 =?utf-8?B?MENpRnBoLytWL3N1cjlPaXRubG9DVXgyVXBHdlgxSjVQQ1hGOVVXanlSNitI?=
 =?utf-8?B?RS9Gb0pTUFA5Q2dNU0h0cnZNS1ZSUWttYVRyVHVXL1h2alR4QlZLWlhuekhR?=
 =?utf-8?B?YW5WVGtGWEV1MDBuaFZxd2N5OVB1MDkzRk5BWW5DcHVUb3NvMWh1eGpzUndQ?=
 =?utf-8?B?WkZibmRPWFBzUDFmQlBjdWNpSkIzR1ZxZnlCRlY1blVnV1NTRGxuZkdEOXJN?=
 =?utf-8?B?WkR4eVV6NW5EeVVqUDNHbGF6OTlhNkVSQ1llQUR4NXo3SW1Uc281cVFxMTJo?=
 =?utf-8?B?MmRMSWpDWkhDVHFUSm41Z1VndlFUUXo1VlJwTVdpcDFmVm5iUzU5RmkxOGY1?=
 =?utf-8?B?bUNpTXk5TWNVL1JvUEdNdVlvYzhPU295US9uM1VLTWJrUEx4WTZVcUFzT3Fi?=
 =?utf-8?B?M0ZkQkJyNDMweGs5dTQ3d1VpbGt1U08zeTcyK3hZK3JpeHllK3VWdEdOeTJ2?=
 =?utf-8?B?RDAwbnl1Ris2dWlhR2hhcy9NVUphTUZsQUFOUFhNVys2V2V6TUVxZ2EvdzFJ?=
 =?utf-8?B?YkoyYldHZEVDQUFNN2FrUDRPK1pWMk5TRVJkQmJqWWIySlQyKzNrRmZxMHFX?=
 =?utf-8?B?Q1F4c3dqQmpKOENublpEYW9MZlh0QWQxRXBIbS9DekwwRHlxeFJBNjlMb1ZP?=
 =?utf-8?Q?diZ5yY15sEtaMhDVlBY7S8JklOfrO5xSUlKYQd6?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7eeaa4cb-dc38-4c6e-fc87-08d988aa29f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 09:17:48.1332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vfXdCIsXv+f1OvomkFYAo77PXX4+0r76irWnbvNoxTEiP8mGcmxmDRERQRxQflEUqarix7QkztC4TPfoM6rLow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 09:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156677

Hi Robert,

Am 05.10.2021 um 20:18 schrieb Robert Berger:
> On 05/10/2021 15:48, Stefan Herbrechtsmeier wrote:
>>
>> Is a layer with more more than 1000 recipes thinkable?
> 
> Did you have a look at this[1]?
> 
> It says: "For instance I currently am using around 10 NPM-packages, 
> those culminated into (currently) 937 recipes that are required to build 
> these."
> 
> [1] 
> https://bitbakesoda.blogspot.com/2020/05/a-different-approach-to-npm-with-yocto.html 

thanks for the link. It matches with my idea.

Regards
   Stefan

