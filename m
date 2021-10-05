Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26D3C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 12:48:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web08.22.1633438119094826793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 05:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=hABRDTWu;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.76,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBZ1GmOuF6NaOjmb0+hTwY6KOP0D+xIwu0u9WP/O1c/eUMrjLgCMRuoPMZpip44BkmS2J/rdNI3QSnOIvU/bogfz4nNpZq5nTT2pg96CP3ikaAdJ77C9dWKINFHU+OYCBAw7cqmhNir8fTNG+FSCSwFKk7Klxc+kJzAwRFiN6GffOhRhTeANffR4LHltyiGUiN+Vf8elTUoNpkkvAyz/YRwRYChLg8alnBn3YdIbj1P5WA7KMZ3LCnK4zn4OEEkVkwRZaCw7+QFU2Z+ul4bkpBN68/FbFjBpD2rvU+Lhhcvj6H1o56xbL+b+OLnPNBVSUS+iiIGU9UUOqwX9tOmbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lY54T4zwRT0bXxlkCRFSsF664m2UrEk+d1jLMfPtY8=;
 b=EK1uO1HErJ3jxtleMBgxIL8cpWhAiFZ6chDScUzPqfWce76qCqT9gs5wuKXKcUs14H4lRPatQvpKGqkIPbMC4++nM8W0tuswhdwj2Hk6b4f4xGjeXXTXgR93wAx5qCUMEKp3USGg3PYCNC00XBUKVldN7i255eRH75ojMD095S0GajcuIHdXB+TYE61l5JKBbY2ojg+HxhaQdwgltAY8iDP416yxqKnJXSHIqy9ogdesNnSPXFqTtdv6tFiRkslpBkXxgwpQkPtdisgA3deRp13JmGObbxyQHIzj7HNYWkBnlq3apOwP3L+EaXWNdGo21XtFvnnrXtbSVQ6Q6yBZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lY54T4zwRT0bXxlkCRFSsF664m2UrEk+d1jLMfPtY8=;
 b=hABRDTWuHB/ErteAr267k62SZTkcH/ucc3GYfK2kShgtuoJkwYmv3KTN91L96pigYw5GRoWi5UMgqVAbMeAydHL14tDrQ1oNKf6g3XYwHBS76NRC4QdhPJySKgz97k5b1Wr8GH/pCdE32DN7/pMF6n69aTJq8CNFGx+aGwOJ3L0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6303.eurprd08.prod.outlook.com (2603:10a6:102:e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 12:48:36 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 12:48:36 +0000
Subject: Re: Improve npm support to run build scripts
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
Date: Tue, 5 Oct 2021 14:48:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0199.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::24) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.240) by
 AS8PR04CA0199.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 12:48:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1de0275f-c3d9-4e91-7c86-08d987fe7299
X-MS-TrafficTypeDiagnostic: PA4PR08MB6303:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6303648BD95AC73EB5A5A093D7AF9@PA4PR08MB6303.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qnn1DLeePZODBePwTT+1Mc9qzesP7OVx8EUfPS0R6O90EMcrQ2TOFQT23aRgpzJg3npMxwpUxndTlRJfsyLIkhZbjlPdnjcKTLL6LO9UxKMbgwjZ0LVMGrStQOoXGfUpJejfGOawrWZpCo8123ixWycYUDnKHN4iUIn8GIRBOX8lhV5748p74nDaMWmH1c1dm8544sSvyPruKyUuYGdmgi++N+fsraPMTyZC2MyQRK67hrDMT+cQrr50GES6PDxQgwiX3N97E8m1Iv4TwH8y8S9cERbfqo6Md0QfAEBisZLwmPB/Z8/16N+M6MaSdbrfegtODWyREA6eSY4kaQg3sPbkoidE2AdKpQIIsKJa37Bb9FH+Igbugh+HiHnBkr70T2A1KwbTo7NUf796XGF0Km19SdE+c1LD+PovjnwErIu+w1PCbZhdUymneQtlUR5dVMNEny2ZbIcxlF8zNGy1V3PfE1fGvJ1Jkyt3UrZGpJfuP9eaFRd/KiWs0haS/ybZOiuumBZ4K/ySNkuwUD7yd3U9rJq7QmhgFiW6xkY+ebRX/ZErTjCR4snwpM/Ance4r2HdNQXYcN3MglmoL/cEhFXw5lorp2D5qJw0ZdDGDunJ3VYZlVzA2Rg1L6QS41IgO6yE7FEYIqPh4l7ZXMUtTOiMHA/Nzhm9+ziO2/QssKRkDYFDTVpQUnA4D5Q70LckdzcsLRvrIhSvD71ZN8w3paF68umv99eFI59nGh4M8FkD6vBCg86JBrTl2qB/8vJ0D/f40BEjfs9nnKJW+hXz3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(66556008)(31686004)(2906002)(8936002)(86362001)(26005)(38350700002)(38100700002)(2616005)(8676002)(83380400001)(5660300002)(66946007)(956004)(66476007)(4326008)(16576012)(52116002)(6916009)(31696002)(186003)(508600001)(316002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUhJR05BaWRZaUhIL1NZODJGVmpRRE9VOHczQ3RrSXlObGpqL3UvdUFxQmRy?=
 =?utf-8?B?ZXdMaGp5TVFNajVRNitnRlJLM2FqYlJ5QzNzcmdRT05pYzNBTjNXOEdvcFFG?=
 =?utf-8?B?MG9uUi9RUjZhUXdZeER5UVpVRFRvQ0RzWFpHL1F6b2ovVVJkTlorMkIzcDlJ?=
 =?utf-8?B?djRMY1BvbkcyaFJTR1MydVVWZ2xnclVCY29yaTVZazA5dGdtQ3VKc3VRUXNB?=
 =?utf-8?B?QytveVc4L3NRczB5NDV3b0RkMjRLSFhJZE5yZXl5YkhZUXhWY2o2QWNGVEIx?=
 =?utf-8?B?UFZoQW8yNUtoTm01TTJwK0pQaXRhNEpDMkRnSGVmQktxQTVUN1Bqb0xwUUFH?=
 =?utf-8?B?aDgvSmN2ZGdqK3pzbXpXVk1zTVcxSWJtNm9ISllpQ3Z2UTkrVkZnY215QWl5?=
 =?utf-8?B?R2x3UVczaXBBTGZobkZsTjdGU2pXV0laOGtuSkxxWTFkajI4SlFUZ3hXMFox?=
 =?utf-8?B?Q2tOdEtMSjM4Y2lpQTZqaFpDMkJ6ZExDaU5hcjZIeVhvZ3ZlRDN3NnhzM0p5?=
 =?utf-8?B?citSY3l6aTV5N0FLLzE5eHhMdktwZmxvZWVYK1plaVIrc0JRclRHamZVSTVa?=
 =?utf-8?B?ZHhubTRKU0J2YmFkbUdrVENLeGp3YnVBZytOMzIvaTl1b3ZvQ1R2QXRaU2k2?=
 =?utf-8?B?eXlGVUZyeTU3b3FORGFLLzk2LzI5eEVNTWVuZ0ZrbEFaMHBtTFFkV2UyNDF4?=
 =?utf-8?B?MXdQdjVxYjN5TW1vMkt5QTJrSlZmU3BLNlV1eHM0REF3aG04S1B1eURhLzZP?=
 =?utf-8?B?eUlDeGFUL2ZRc2lLdTJueTlNSE5XNkhLZmRIUGlaZWdJS2tIK05EaTZJRFgy?=
 =?utf-8?B?UlJ0cGVmTEdNV3FXb25uV2tIRXRRYzJlVVlrTkNKa3I4SDVnTWpRWVNJd0U2?=
 =?utf-8?B?d1czaWlnT2hLVUxiUTA5TnhLNnlTNG5HdGhpVzNHdFhUTG9waE8wb29sZjBr?=
 =?utf-8?B?OWxWZFpYUENtZzFieTFjWEVWdnpkdFdSeWxjZkVXYWxvRnhWbVVuZFU4YmFw?=
 =?utf-8?B?OE9LV2h1MWRuR1R5RXZKVEd2YWE3UnZhVENCRFIrcDNFS01vd2J3UlNGOS9t?=
 =?utf-8?B?akJNR3lVUDB3NG01elVNR05MVlR2MUJGQlRoZE5WOS9LVkdmckFRb0VQTGZV?=
 =?utf-8?B?Uy9iWUJtTm5jemo3ZXJUT3NSR3FUeUtDc1JmcjVWVEw5VjEzV2lMUEVqUnhs?=
 =?utf-8?B?SFpSSWJCWU0rdjY4QkNQN1YvUnQ4OXU0OWQ1WWc4NHBZVlZhMGxDM2pwamxn?=
 =?utf-8?B?VXFqN0FuKzl0V1ZEWkRGRFF1VDJydTU2ZEZESlhDRnlrNllEK3JGclNoTVBB?=
 =?utf-8?B?UFQ5M3VWdklRNWYzVXNOcG04N0NVeUREZkFPSGtjMDQ5c0xVaktCallmTHkv?=
 =?utf-8?B?L2dtQlZGYnE0UElCWk1ub00wSFBYRVlVRGF2SDYxWnZIN1JUWkk1QmpES0hp?=
 =?utf-8?B?VUM1SVhWR0hrMDNYYzlQZERrVUVnNW0wZkZVKzlSYmQxMHZnWG5iK3lHV0pB?=
 =?utf-8?B?SjJDUVlGc2lxdEdyVktHcDZKd0tqZkI4UDhNaE9wd2MzSU9pNStCRTlOTElD?=
 =?utf-8?B?ellheWFOVjlFazFXS1V6Y05qWFh0aU9Hc24yZ29ZNEFrUElnNi9jOG9ieXFH?=
 =?utf-8?B?NktUTDU0NnovNzJCNCt5OFVKdjA1TVF0Mm40b0xDZW5HcFJqTGtVNkg3WThi?=
 =?utf-8?B?ZTR1MWR0djJNUm8xUGVGQnZnTlBlZGlNd05SQ0lFVnpVMTk4cjA0NFd5WC92?=
 =?utf-8?Q?GdR2qHK8bRXTD40ni+5ImynG0MZLL0Xj3710QBo?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1de0275f-c3d9-4e91-7c86-08d987fe7299
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 12:48:36.4925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 swRB74MdAVqkJY94ouWXGQsJIqgskYBPXX9wtcti1Z2ZT4COoCdnCPKwBGQDlvl0jpHGYFWDCo3kaq6tGFUC/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 12:48:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156644

Hi Richard,

Am 05.10.2021 um 13:09 schrieb Richard Purdie:
> Thanks for bring this up, I've been wondering on the status of our npm support.

Do you know any npm users?

> On Tue, 2021-10-05 at 12:04 +0200, Stefan Herbrechtsmeier wrote:
>> I must improve the npm support for our use cases but need some
>> fundamental decisions to proceed. I need to build express and angular
>> applications from git repositories.
>>
>> I have the following changes in my pipeline until now:
>> - Support npm packages with missing execute mode for directories
>> - Reduce command calls in npm run
>> - Add support for local tarball and local link sources
>> - Rework crunch license to recognize more variants
>> - Move known license checksums to CSV file
>> - Pass README as fallback to guess license if a license is missing
>> - Add support to pass build arguments to npm install
>> - Add support to run build scripts with native packages
>> - Parallelize the populate of the npm cache
>>
>> The build (install) of npm packages leads to problems because of old
>> versions in the dependency tree. For example, older versions of packages
>> are incompatible with the Node.js version and older versions of node-gyp
>> require Python 2.
> 
> Hopefully over time the python2 issue should reduce and fade at least. The
> node.js version is trickier.

The current implementation works like an project with embedded external 
dependencies. I both cases I have to patch the embedded dependencies or 
replace them with external DEPENDS.

>> I see three solutions to integrate npm packages:
>> - Build npm packages from the npm project outside of OE and only fetch
>> the data.
>> - Fork the npm project repository and fix everything inside the fork.
>> Use the fork direct or create patches from the fork to build inside OE.
>> - Create recipes per project and incompatible version to fix everything
>> in OE and reduce redundancy.
>>
>> The last solution keeps everything in OE and benefit from the existing
>> OE functions like download proxy as well as license, CVE and version
>> check. But it increases the initial costs and makes only sense if there
>> is an interest in an meta-nodejs layer.
> 
> The latter solution sounds like the only really viable option from an OE
> perspective since we do need the proxy/CVE/license handling, it is a huge part
> of our value and without it, it isn't really OE.

The problem are the many different packages. An Angular project could 
have more than 1000 different project. Thereby some dependencies only 
differ in the version or needed only for development like a development 
server or a unit test framework.

> Creating a meta-nodejs layer isn't an issue if there are people willing to look
> after it.

Is a layer with more more than 1000 recipes thinkable?

Regards
   Stefan

