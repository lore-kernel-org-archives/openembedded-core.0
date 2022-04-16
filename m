Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18136C433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17365.1650103168282165576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 02:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VmhgTC9N;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=110578f926=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23G9ol10021122
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Apr 2022 09:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=GpRUHWvQZZnGDhRZ43I2vuyGF7VcahTevXdmH9b1ZOY=;
 b=VmhgTC9NxqpDQr00wDPMoFr636P/eF3UW3NnX4Ex6YL7qemeVUHoRhP5N7YbPee1qXai
 UhUg/kjftffl/ZOM+XiH872a6OAzL+OLAAimHiy1O0R/j+3yoK/46rqht6JmQ84xruxZ
 Ued5TiF9BW/ax+chvhfhHrX2zP8dIS3d+l+wMcjQ6Q2l6qfY6RG9ww8RS2PxM2xZE0mh
 jl9qXIF7gA5Mr4QF9OfFhfUztx7esvUk/i3/NoO3d8SDv71FqT68HehZ3BlFR3YdHdis
 Al5m5eR7Uua6M5r8zhM8bv6Hq8mWkjTP6UtHtrcNbaUYLvQIkB7Q2ul72kNRjwmA6MSi bg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2r47s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 09:59:27 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23G9xQHa003185
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Apr 2022 09:59:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2r47r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Apr 2022 09:59:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPA3Y3TsUsV8PiepIqeCkKErKj//G49YrhUIAq5pcCyA0LXUhh87rB6Goqp9uYdL3xH24S6n33R4zD0MvpAZ5hNqMAwZOGt3GzjMYjigptpmy5wd2a+ASGyV66AAgpfKbym2+E8GPICjPkxhQvNU6yLwCuh6D9FWYNjQ12SBSlTGNkeIiMMJwC1XUVag8bo2EuK5lc3f97fvdMFO6+5kL08U+9s48AwYfW7GjGmbtWFA9M6114jEBdHVDfW8VQ8DqftZPOp9xqZ5O8QJL/0uzJERQDqrgJrmUvVwC7rKu4MkAfIxfg9kSFuu1h/RmlXRjxMWj1+JfJsbe+izNLrMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpRUHWvQZZnGDhRZ43I2vuyGF7VcahTevXdmH9b1ZOY=;
 b=jxi/jLG77SLzO+2YhWBR0uCfAxHPAMA4OpcAH8wohtzFxlawEYR7mbgCAIAvbuNtReq4bUkwkPN5YQzrLVp0hleOhHwIcjyn/bblBWVt2Rpj9LY5/05Yv+hoXkLZ0hdqRs9N7/CPMVuUqjCQJ7/rygDyqGs0HurujAVBQ/4i73XeyKVj7RKiHgAWj7WrIGL8Ktslzw+YDhakIkCo7McmjXbdY7vOVuVYkBzgTo9RYJOWg/rcfH+jtrJ9PLmdjUNb+4uNd6E7I9dLh3SyzVCZu4FKbZYGDTdJrNpJzmOmdHGJqn6tLU99T5igPImjmQvrt7gMJ/wpT/tKa6UnLsQDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Sat, 16 Apr
 2022 09:59:24 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e%3]) with mapi id 15.20.5164.020; Sat, 16 Apr 2022
 09:59:24 +0000
Message-ID: <1c7fe0e3-6ad0-19ba-d461-84ef0f626941@windriver.com>
Date: Sat, 16 Apr 2022 17:59:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] License mismatched for libxshmfence_1.3.bb and
 recipeutils-test_1.2.bb
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        oe-core <openembedded-core@lists.openembedded.org>
References: <73be0c1d-e8e8-5361-5132-62f2c837205c@windriver.com>
 <c79d74d02d7f6b58628fdb4521f60808c2d55020.camel@linuxfoundation.org>
 <8062c9cb-3fee-7c9c-ef87-a19b777ca2c1@windriver.com>
 <428626f1e547d6d3c17c3b6f19ff3f161fb6d8e9.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <428626f1e547d6d3c17c3b6f19ff3f161fb6d8e9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0202.apcprd02.prod.outlook.com
 (2603:1096:201:20::14) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae891b65-05c8-416f-a5f1-08da1f8fc960
X-MS-TrafficTypeDiagnostic: MW3PR11MB4572:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4572A06BA05060A98EA7790FFFF19@MW3PR11MB4572.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tCCpG5xl7G3cz0URvg6n94QjCtuvDcWPKwN5e9SlOIwkN/NA/Uq2s2SeF4RJx0Om5jVXqZa3eq7YEwKFDeV3XUMXuOueQv+erbNLWoMttQC4WHVcpOsR9i4oICNR6sPpbmrTchwC4kgkFGbXHIghVF9nKRL/aVnxsgr9wEZ2dn7pqV5mkV/uiZPIFS0v87+69RQc8I/83UMp0ck1slrAb1RrkWfvgfc3QMdavWO+b9swNPKdv2dbT6FzTpRpwOeemw/OAz1XKU/wHxkWLFibhPUU4AZo3Gcx+2tq+wXgSHYuQaxrvWPl/WTMYIl+rlOKcVzi5A4tFm1ty0uLkdAGOiWf7bqcnX3BTkoKs4MwejhIeUIPI6FsyWRyBgOHg0iKOdubBpR40wpUx/v/0Mmsuv/YuA4efHHJg4e62B9ThFWunR4PdR/vBIjrxxzrwciM1iZiEzzLpxYJevMZcK+uMklvuWUJU89xhL9O7htwqFLb3nqtKqhIzhhi5E5VDy9Fi0StoJhvxX+WPSXgReBNm7Jkfj8hC9ENTr94M4crq6x9N3QR+sDW/DpTOIOCLoFEbtaSxCK7yleFHgblBbCd05jipjqV/JQRJWrARoS16ODW15VeaNG/cXDbx5G34WPY+ZnRGQxjhu+qItJzr+CJBw0/TFwa1B6fuq2OzoA/cP97tQobN0xH1/RsWzLYs5fygsbKuIMcGQQnSACkRq7qY6yHqMjSUEf4GlTnG1dtI2wVWNcvK50mq0fCHWk39/DR9vz5bDnznVE38smtkCACQXOFie7bw2pkmyoX15oA/Lg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6512007)(6666004)(52116002)(4744005)(53546011)(6506007)(38350700002)(38100700002)(2906002)(66556008)(8936002)(26005)(186003)(2616005)(5660300002)(86362001)(31696002)(31686004)(8676002)(66946007)(66476007)(110136005)(316002)(36756003)(6486002)(9126006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEtVWnpUYWtXQ0pQNVd1aG94NE56eGZlM2pFRDgweFY1UWZtYWcrUE12SndG?=
 =?utf-8?B?Wi9kSFFpWmdMeUI2WVNsVFlIS2RKbW0wK0dCbktPb1FDLy9yd1RQY2h1eS9J?=
 =?utf-8?B?NjJrelg3WGs2TUYvcFVSYTI5OU84RERjMUhHMTUxTlVGSmcwUmZGcjc4azdq?=
 =?utf-8?B?NGhLYnRtOUFRMTl6MVFtZU9jZU9TOWpyTncxKzNleEpMTXAwSkRJVHVUQ0tq?=
 =?utf-8?B?aW8vMmcwbFoxbjgvcHJ5bFNlbm1LLzRKeFU0UTkyeFNuWTVzMVJ6b3NqTEdT?=
 =?utf-8?B?SVlGcnp6dWpRbjRFTC9qa25oSGVvcXNzbWc5dFBiektiNjBWdURaYUVvdkJM?=
 =?utf-8?B?NkcrM0crUEtpUC9idFl5VHd3WEpEMHB4bzV5YWcwa3dDdW16VE1FaTFXdzUz?=
 =?utf-8?B?RXRBUG9hTnFtanZwbkU3MncwSHF5TXRCQ0ZmbE4ycElxbEJVU0I5RTJNMXNM?=
 =?utf-8?B?V3VUZ0FDdWdlSnkrOHQyNk9oVXgwZ1l6TlREcWE2UDQ0YmdyUW5iZ1JjWUhO?=
 =?utf-8?B?U1ZTbW1JSzZ6ZWpqQ3BMYkJDZkx5Nmc2SC9UWW9vZ2FmYzdIOVBSZkd0ZEpn?=
 =?utf-8?B?bWZZQUZHWTJ4YkJHelFsaUplRXptWUxrL3RFR0szSUtaU1FYN3gvZHBHcXhw?=
 =?utf-8?B?STNCOFBFWXIxczU1aitYaElDWFloOHdYemFNL1c3eU9iMVNmNXdxNkN6Y2gx?=
 =?utf-8?B?Nk9yR2pkdmZRSHlLNXFjYUVtd1pXSjVVWkE5eFpqTE1RWmJ2ZTd4LzZFNklZ?=
 =?utf-8?B?RVdBMWJJcWJOcU9yMWh0b2RITWRxOVlLdjZGeUJhMUFnZ3dDTFAvN0twY29W?=
 =?utf-8?B?VWowbmZBbVhac2s4SmhHalJScEZubHhXMy9ScjI4N2cydHplVnRtNnJTeUtS?=
 =?utf-8?B?Rk1GeC9jUUpnSjljWDNXMGtXQ0hxRURkRU5lM0NnZVBOeU5VWTZ4Z0RYd1NX?=
 =?utf-8?B?UWdrSkxSVWNtVTlVREhZUlh3QjdqL20xZ1U0ZUlrbUlNUG9hZVl5WG9zM1hB?=
 =?utf-8?B?ZkRJT3JRdzdRblloQjZ5UTZ1aDBHb3FLaWhVdjFwREs4dmRTbUh6K3IrUkhT?=
 =?utf-8?B?eWp3WGtkSWkxR2UwcDRURnIxU2dzZ1RCRzJqMnI4bXFRMG1ld1pnQVM3bFpz?=
 =?utf-8?B?Yk9CdkI0YUk5Z1l6ME96SU84OGxFbXc5T3c5R2M4OUF3cDJtbEFGdUl2c3hD?=
 =?utf-8?B?RHVPNW9XQXBxcFN0M2dIWnJjTTNZSERsTXFDRGxWN2ttTU84aE1MazlSVHR1?=
 =?utf-8?B?emlvZ0xERG9PRlkwNld4ZG83TkhjQ1BuRVNXWUt3bE1iaUNsK1hqLyttRmNO?=
 =?utf-8?B?NGYzL0xaUndZRXJ4OVB4R0lRNFEyczhON3NLcHI0UEwrdlBZTE9vaVNwMGNQ?=
 =?utf-8?B?NTM1QUQ4VC8vT0tENTN5V3grcXBhazg5eHQ4OXk5cEhEbWtKQlNuVXZJZ3dl?=
 =?utf-8?B?cENNMGJlTVhSNHFtWS9uaFQxMzM2SzF2NTIrdENZYTdLUHVkaC94d3JQVXlN?=
 =?utf-8?B?T0dPYWxodVo3ZGZGZFVDVVc1a09Eb25FSEJ5Z1ZyckNYWVdlMFFzRzIxTCtV?=
 =?utf-8?B?SFpXeUYzZ1BDOW9BdElLUmpWWlF1T25PZ3JoNE5TVkVUQ3Nod25Tb1llMVpx?=
 =?utf-8?B?V3Jacy9OYkg2UzlBbWxxd0RqeG1wRUpmd3dBSHRvU3g1ZzRkV2xndnI5TFcx?=
 =?utf-8?B?NFdlWVcyS0VaQ213V29nN2l3RjNsVXVsTEtjMWlLdXpFQUhja0RSZmxldEtJ?=
 =?utf-8?B?K1d5RHpoZDF3TisxL1BaQ3lUK3M4YVBoVHR3bVJyWWVhSVRUeHFtd2NTUTYw?=
 =?utf-8?B?WXoxbmFmK1IxRjFEZjdVL3pSNUNQNUIxSytwZ1BrRDJTK3FJckdyNDZjNGhV?=
 =?utf-8?B?VG9EUndOaDVTVXlNb0xHNjgzOEtQVnZ5MkROTjU0V1VFb0pwNDFySksyVTky?=
 =?utf-8?B?UFpMUHNhOFlZSXlyUEFXVk12YlVaL041eUZiMmxRajJVeUVYTFJiWWtObE5x?=
 =?utf-8?B?aDNydndDbzVwb0lvdEtjb1VLQlVhazB3K1VETVM3RU13YmNwYjhBYURXYSs2?=
 =?utf-8?B?cjRveTY3ZjhGNW1YZktsSTRLWTl4bkE2NXFhQlJFZ08vek5jMU10UEdqOUMv?=
 =?utf-8?B?ZVBCK0x4MW9PbjlEQ2RHSmw1MGM3cVA1Z0N4RHNnWUVHUGltNmJrS3E4N0VC?=
 =?utf-8?B?S1BYTk5md1hPYzJkMFhRaERTTEJTbms4d2hQSUYyRDF0Y294TEFmbTJqdXJU?=
 =?utf-8?B?a3FyWVFkalN0c2dBSXR3cEpXYlRRVU9Tajk0OC94MWdNa0tsSndTWnRBWnVG?=
 =?utf-8?B?SGx3cithcW9YTnpmZmxzUGdqQ2ZBSmUzM2ZZcG5QVGs5eXFpMHMxTTY4M0s5?=
 =?utf-8?Q?MrROp8x8HVCAKoZA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae891b65-05c8-416f-a5f1-08da1f8fc960
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2022 09:59:24.8341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 laVVbwgZkC0l16OZsJV2luou7ScQZGs38Ic5Qa/AmTuyW4UumQKAc0A4skucx2HTmhj70X6ZZjevu60WDuk8CocFdN87ZKqLtLAavOukiEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-Proofpoint-ORIG-GUID: zKDE8bl-j3H39FYQvQaHU6HB9IH4Sq8D
X-Proofpoint-GUID: nuWxr8X6WHgAJOooE9xAzqaXZzxXnb9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-16_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=851 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204160065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164530



On 4/16/22 17:50, Richard Purdie wrote:
> On Sat, 2022-04-16 at 17:48 +0800, Robert Yang wrote:
>> Thank you very much, I'm trying to run the test cases, but I found that you've
>> already fixed them, thanks again.
> 
> I don't know why it was set to proprietary in the test but it doesn't seem to
> cause any regressions so I removed it. It is at an older version which should
> mean it doesn't affect other builds so I'm happy to leave it on the older
> version.

The following supported versions have the same problem, should we also fix them?

Dunfell
Hardknott
Honister

I'd like to send the patches after testing if we need fix them.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

