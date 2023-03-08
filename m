Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE4BC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 11:38:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4806.1678275508676164978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 03:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Mzq/hODM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2431915962=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328BM3lo026835
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Mar 2023 11:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XHr2YX00o8YUKvyFTJxM0/j/a+IoyB9aUmH8Dg8lrMc=;
 b=Mzq/hODMK2OsjUvk/YfL6H6iE7u+snqJLBFKPfRcERjb12fgevsvvmlOO8Ia/5XBsmZY
 dxZS9pQTryqmO4bh8wAY0q/1RFd7/ABLlwFFBxwRdfb3z16HItjuzK6qFXKKC8Jo2j83
 /3/IKNr+gkvdvfMTUxXNZxwrCratNrVyeMAfLcSZVhE+YFGuvfVJxLpUtnyMxCV7fpFh
 p+h6FrHbJIzmpvBvAVfNkKy4fKoLEPkTk5hZw4e6GXbLI+2yQUt4UV/cczE3h57xTyco
 Ok5mHTFxo2RWnX/CX7kTUkvfK+nC7akHml6fwSu3NwoGmUGXzhjjClso8bSkh8/hpe+I nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6ge2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:38:27 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 328BcRhB029336
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Mar 2023 11:38:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6ge2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 11:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg8mn1rsEPdzp3GHzNgTCG+f2B0N84advB6ciaVsfmc6mToPmkQ3sBe6NgBxFDW667avLQHfJjhRXDOZ4dWmku3tabv3lbuwIsVpgq7gXCZe463MEZqwcT87C3qtfHOy/MTq/32Unao3JsGwg05YawGSUUrxIzAhWAEpCAkHuyKwVZeiouk9jzZHrHeAWMGRhP4sJ6D6NvLu2qq+re/p8L3MZgQKpAAhfmpJ9kTCPkqGOkwWzk60PbKg0Bk/1T2Z/G0RE5o5HY3LPGWu/BLcR+RdbLzm+SEF+ecGI4a+RZbpluiY+/s+FvR37XiBpTVsp84mM4ZVAD5J2KQhrLOK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHr2YX00o8YUKvyFTJxM0/j/a+IoyB9aUmH8Dg8lrMc=;
 b=fJY9txV6FkyR1eh3agPncX2TKCYL+bHTjBUfQpDYsjJZlpl1F5tNbubgGiNQwDD1C4A11KqP0uqPfja05ZrJo2OF0YJgZ6aJQY8+Vig8JOpk0ksYe9dpNWN41R2Bqs1jH5BF0Jtu/UeFAc5MQHoTBYR7OHfahw/Ks/eXV8llnG0Dk4gxJ0jp64k26m2jY5m69PTIyBnHLqlzOAAQ7m8BAkVi35Hd6u+0dvsokSbmx+bXN/9t9Nnf3p7wXP3L7PMt2TqUTQJzxTBwa6Qq3FFgneCVf3mz8NH4oVTbN1W5dwpt0jyyq/83+Pi08X827+nItXBMZ6vkVqijlBfN25adFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by BY1PR11MB8006.namprd11.prod.outlook.com (2603:10b6:a03:52d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Wed, 8 Mar
 2023 11:38:23 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::9f42:14ae:2b0a:d1fb]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::9f42:14ae:2b0a:d1fb%3]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 11:38:23 +0000
Message-ID: <2bae94ef-fc9d-1413-6117-0de51a7c38e4@windriver.com>
Date: Wed, 8 Mar 2023 13:35:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 2/2] sstate.bbclass: fix cleanup when sysroot in
 manifest != RECIPE_SYSROOT
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ovidiu Panait <ovidiu.panait@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
 <20230227154230.3566400-2-ovidiu.panait@eng.windriver.com>
 <1bb2511c3505e7d215e74fe3aaffe8d7bbf51976.camel@linuxfoundation.org>
 <b0a4bad5-3c42-5b61-497d-4e2c9a74b828@windriver.com>
 <72a6bfc96bebf4bc8a6d3720b072e65e38a2c515.camel@linuxfoundation.org>
 <b9769316-02e6-90d2-fda6-4892bd1e8b02@windriver.com>
 <2e299a9c85e296fd265c3598f1329da78ba3c425.camel@linuxfoundation.org>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
In-Reply-To: <2e299a9c85e296fd265c3598f1329da78ba3c425.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|BY1PR11MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: ad95171d-0ea9-4c4d-3fb9-08db1fc99fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U+XPtaXJqTriGGyiJhiRli+VEbIlZk7l8bmpKq9hYh/EiZE6OIFxa42vPZVFcB3P098bh09vPHvgFNtWp1TdcwMicX0Pkg8AbmYJHe1EIq+xccZVBWpogad/F8WBE5Dc7cGlZK5a/XYmq2H/HafaSfxpcLJNq79OolVxq2xMeEWJoQ79nAVgP7Nzq3qSt3lCMEar9zvmtGTK0nYxNaI9IDD8jLXKNWj4s4X3CZzaxxWkPtrcQCKfXWgANUAHi5bVgKU1nkfJZld9g9BVJnhZ+3WU58mB5n4u1i1W/sHspAotILBN9YBuanhokd7tulDkBVitmbIwZtL6W131qbE8mp7Gfupn2X6kZJE+Z4qb7DVR8WcrpdhHCtrXI2v6TmYpob0BAkKvD23obe4tNjtv3Ez1595Wai5NQIm29BlPEYsmfB8BgYoqs1+bZtnGFG9Z2PyPTHTpY5eL41hAgscppzkM8gjpELR0DHCP8TG7cVrIKfQwI+9y/6vPvpXP77DYplSvUHt9mN/QPyyJsOnQ3HXovwyRBBSlCMH9yEL3ux63L+rHTXx9UdQkgR+pnw7kjmGj9ktNpkz23zK8rAjwdtWR6SaQzlRc8/eajb9NXr0LWMaGvPB/dtrtl8ojj3nIV73Z2JlkdtsIuVTxzJgm70E9V5sTXIJZxlK3BaqrZfIyh0+gygvms8/eOw2XsfBDe0uBZv3+AoF7Y/njy69gqhbkZ7OXIdX7UUqqWkvizWI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(451199018)(31686004)(316002)(110136005)(83380400001)(36756003)(8676002)(38100700002)(53546011)(66476007)(66946007)(31696002)(6506007)(6512007)(186003)(2616005)(6486002)(6666004)(26005)(966005)(44832011)(41300700001)(478600001)(8936002)(2906002)(66556008)(5660300002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OW1NbTUwVlpVamlER0plWkpudVRVbmxlcVJmWndjcWFVU3JIN0RwRFlISXd2?=
 =?utf-8?B?R2J4cDJMNkp3KysxSjZ0U0ZyRi9TMnVVTk42ZStuajJzMjFkT09lMVpLcUpr?=
 =?utf-8?B?NTZRdk80VDhSK3NyNTExTTJzTGttaUhGTUljOVhKeW9WR0xOa2FIMk9henRy?=
 =?utf-8?B?NFBESk1pTWpaVnNUNUk2NGZZbzVlc28xbksrZHEyN2JWMjl3VUZwa2h4Tm5Z?=
 =?utf-8?B?YTVlTlljd0YrQy9PeG1LSW1oTzlxRGJPTEFvWDJ0cm8veFpBbXZIMlpTR3hv?=
 =?utf-8?B?WUVKY2tqaHVZOWRoaWJzVXFhYVloWEgxekVYaTdPelhldE13emxWYlRxdVY3?=
 =?utf-8?B?RXRGL1VYT0o0VC9pSEhzb2RKeGJzVUtkaEVBV0RPdlJOMXNNTFloWGRCNXFV?=
 =?utf-8?B?aVBpaE5VWU1YbE5LRExESWdBQ1Z4dmQ2ZW9sZXRvME1aQVg1MnBjSnp0WnNw?=
 =?utf-8?B?RGZOUzVpL0I1c3J0Z21mUXFKemF5eFBib0JSVTdqNG5kb3BaY2RpRFFsQXFs?=
 =?utf-8?B?NTg0anFFUnFqTkhRWmpNUFlYWDdtTU96MllEWjJ0bWJqc0E0T1hieUkxOGg0?=
 =?utf-8?B?ck1KQmsyWm9VaW1yWmJEa3Z6dTFETmtVL2JodEpLVkp0ZndMNUxTNThnYUd3?=
 =?utf-8?B?eUw4cllQd3JjQUt0OXNDcDRpUmxtNDlrV0lkWjhMM0JEYjZsYjBFbDRHSkJq?=
 =?utf-8?B?N1hSNEdTYUJCbU9XL0xVSU5ZUkJSWnVUT1VSVFJDNXNRdzdxOGZmRkg0QUR2?=
 =?utf-8?B?c0d6cmRIZ1FFeDlmNFZhb1RkaEZUSG9QMmhZMlFHNWpnUzhRbitEaTVEbXYy?=
 =?utf-8?B?WDZWVHJhQjRYVFZzVmxzcTA4K3NqZStYdHhYbTR0VU4xSVA5cHpjYjVyVEJX?=
 =?utf-8?B?TDVZeFBvZmlkV01UeC9kR2toekFoOCtiZk81L2xTMk56di9NVDRGQlZCMWNG?=
 =?utf-8?B?TW15RTFQZVJWS0luYzkwMnBNaHQ3d0pPV2c4cmtYa2FBNmR4emNmS2tLM3pI?=
 =?utf-8?B?THo0ZU9NRWxOK21rZmNvaXZjYXpVRUZ2Y2hiMWp6aXV6eXAyRzczRzFJOStZ?=
 =?utf-8?B?Zk1NeHB2dlBaUlhyVk1CSGtFeDBzLzljVTdZeVorbVVlNDlmRG1JbkNNN2ZV?=
 =?utf-8?B?SG02UDlEMEpSNzVGNGZnY3NYTVZ2bjI3eEtZZU4xM0kxbGlqME1mLzZDM0ww?=
 =?utf-8?B?S0p6TWR4SldNaDkxN3p2b3N5VW5BVWMyT0hIeTBJdVplV1BxNzNNVWRpeEhO?=
 =?utf-8?B?VTRyK3k1L3hHMWRvRTBYY2RMSHZuVzBFT3B4VWhqSk02WFp6Nzh4cmY3VnVw?=
 =?utf-8?B?MDdtampPWldHanVFbTduaW5POVZNQWR1bzViTWRVb1QxSjdEclVQNllzTzY4?=
 =?utf-8?B?dC96UE5xYmFBT0pUaVFGYmxuZXRZYndXU2IzTDBwakJ6cVlQa3ExZS9ZcFpl?=
 =?utf-8?B?OVlsZWlBOW5nSllQdmVYYlpKNFU2RDNVc0o3L3pFcFh6UmRKMWJ2elpmT0lu?=
 =?utf-8?B?QWx0WFRxNUhReHBsMUJoSmdWTnFFMEtYeS9nZzFBc2VHbDhWeUlETUZDUzVN?=
 =?utf-8?B?Z2tkOXNPQnFGekt5TFZtYnhWNDgvdlNIY3N6RU9vN1BNaCtJcVllMXdpbGJS?=
 =?utf-8?B?M1NIQkdWL0tUWklMTG5LZmRWaGlLc1VJajJBaVhKYTVMUWl2RmhaZllOMU9s?=
 =?utf-8?B?MnM5eGJORFFhWmlaYXBGblA2Ymw5Q0FrNzAxbkI4dXY1djR4Z0ZkMVNKUVdy?=
 =?utf-8?B?UUE4b0prWFMzY2tRUk9iY2FBWXBqY3EwdUJGTTNhempMNkI1ZmVrWFpjeUk5?=
 =?utf-8?B?b3hFOVhTYjhnZElMQWZxUHJSdzl5TlBja2R3OUNqazdOSnVSK2s1bmdCNGIx?=
 =?utf-8?B?RlBtZkdqODg1V1JiNlJlTm1kU3B0Q2pwY2drbTEvVnNPTkVKMFRlSEpNMENK?=
 =?utf-8?B?Q3MxRDdvcFVydVM2S2hVZFlDVVlEdWZseWQrdFBFdjl6d2NwTFhVaE5mTjhJ?=
 =?utf-8?B?Nm9YbHA3TWh5NlFxOENFb1hTTmFGaENHT2NvKzF3Ym5BTmlGRi9ZQUd6c3hM?=
 =?utf-8?B?OE82VDU0ZkRBWnNoN2lMWEgxTDFCN0F0eWtCbkxEN29ZTUh2bkpFL0tseHNu?=
 =?utf-8?B?QjlBODY1WElSbG9pMU5JZjlwUjZxUWZvWjJUS3lHVjZVb1pYaEN0VWJiOTZK?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad95171d-0ea9-4c4d-3fb9-08db1fc99fb7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 11:38:23.3249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZXJTl45BGntxTFxrbNDkSXN3CjmlgvfCTXKAJQsb4533ZNwOFPOjtB9iBRL+FoV8ioAMr/AsFYVsEhASqouarD0bbVRk6XKbswvJ5JWXz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8006
X-Proofpoint-ORIG-GUID: TP0_Aa8ThGLoxWRM_PS8k7TstPCWydW4
X-Proofpoint-GUID: urvWZRXqghd0ZhbR-Z6RvEy-9OL0ajax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_06,2023-03-08_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178166


On 08.03.2023 12:18, Richard Purdie wrote:
>> Yes, this is still reproducible in a clean build, with a fresh poky
>> clone. Same steps as before:
>>
>> git clone https://github.com/yoctoproject/poky.git;  cd poky/; .
>> oe-init-build-env
>>
>>
>> add to local.conf:
>> require conf/multilib.conf
>> MACHINE = "qemuarm64"
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE:virtclass-multilib-lib32 = "armv7athf-neon"
>>
>> bitbake gcc-cross-canadian-arm
>>
>> update local.conf to force a rebuild:
>> GCCPIE = "--disable-default-pie"
>>
>> bitbake gcc-cross-canadian-arm
>>
> Sorry, it looks like I messed something up in testing. The approach is
> the right one but as you mention, it isn't quite working.
>
> I've sent another patch which does work with the steps above. We can't
> just use nativesdk since the file lists of the different canadian
> targets may be different and would cause a different kind of failure. I
> therefore tweaked the prefix accordingly and made the fix multilib
> specific at the call site that triggers the issue.

The new patch fixes the build for me as well, thanks a lot!


Ovidiu

> Cheers,
>
> Richard
>

