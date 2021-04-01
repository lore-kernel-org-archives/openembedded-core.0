Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.80])
 by mx.groups.io with SMTP id smtpd.web10.1591.1617241089200745647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 18:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UfEwiL12;
 spf=pass (domain: windriver.com, ip: 40.107.243.80, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR4aO+ngz2kPpGe64QDL8GKZctEvDMVRMtOlDVXmlCXHoP2m05u1ni70BFX+t37uXkARBJiqdvmkjSUJt9pKIdsSJd0zqP5nCcUREtA6APSyCTQo2zU0cKGhQerCVihvoiyd9euiQkunCSGdDVEq3LwO5dA3qj1Q7LI/v4Eou+wmDcMHQ7Ip55IDBkyCVK3CvPZSvZhSBEIv6xUfKKETaTxNSeSo62q/wzfKXGVLgsFTll5X1Co+qlRaxGEdAPjZbq6T2fNogPUgtZ8/Ef2QtMlltVoPx6VJVQzurh1AZx9cuvIr/zTxNb0OpuAfOQcMQDOt9UpuuqLsRR7uLfU0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1wPUKCSBTZ9XXnLmHkg76b9nPjaUB9Rqd4qFCyYlkM=;
 b=gkFu4WddJjqwXx3eRJnanv/tgPIQ9i77AHbjikbczK2/Hf2hA3mw3woVCmrDRA2/VZUDXwJ9rOefHTWjWVtXZpaHuf0PIgeZm2gi8iRCsdRUKjGhf1S5hG5KPA8a/vmyLZLXGmyekMNHJz94/5xGgQlGjwSGguEOyU+2vlAUWcSWFOYumrz5DHwoEefjTbolQVlYsZDQcsDlBKUx+OAoKyPGtg10PjuCfEQrrKZU//aLY3J3tb0Zqejz6yABC9DKMN930me1i3Yonreq8QeMUt58igkErw0sONu6wLKG6K7DV3VeTjf07uqpesepiqtdQbW7jxFyT/wtKAGt0ifp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1wPUKCSBTZ9XXnLmHkg76b9nPjaUB9Rqd4qFCyYlkM=;
 b=UfEwiL12eO2ykla694sTM1qGi0Ib2V9aXHOqJ6cS6ZYFUmfy0FARC4wUXPm7ZaJFLkpoT2p+k9EVGF2k/DTg+HAuXrFafB2J45ZrPmEZ+Z2pLz9OczUoLUYEFc0otkEF973Xqa6vf+a/C/vvntVbhyX2tGEQkwx1e5Y0Q347eL4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Thu, 1 Apr
 2021 01:38:06 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.3999.027; Thu, 1 Apr 2021
 01:38:06 +0000
Subject: Re: [OE-core][PATCH] apt: Fix do_compile error when enable ccache
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210331104608.7047-1-Qi.Chen@windriver.com>
 <cecb5490-9149-5663-32d1-a1d1ae65507d@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <9471558d-7ade-f108-4475-773539b11097@windriver.com>
Date: Thu, 1 Apr 2021 09:48:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <cecb5490-9149-5663-32d1-a1d1ae65507d@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3999.26 via Frontend Transport; Thu, 1 Apr 2021 01:38:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fae1264f-ea1b-43cc-ebc3-08d8f4aecc2e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41018CBD4E3FFB9EA52FF097ED7B9@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dHbCOLGXBM6CAraLK5hucAPOMGm7NuiaVem076qUtvCpxzeYYWlwx0MmEn4UZP1JfeBcVGGE0RLps+GcDQUjNEgxUFERPl6rT77tc9zRzkXt/PDn9T9WYuO1gOiVzTzf783ofWfSWFMmJiy8Md58rp7JayfKlnyZjx18/yoGqgBe/QSYH11dsESJFmeET2WSKqwA7RVFd5SFwFizN6Xf+wFUYdBatCrwPYcWBmk8C2TdjB22oVfprpuQdRwPH0J12tLbDbrTr98iwtmK87gQ8GX1ZiejFb76Pxjg5pCVx+aK+ufr13UhfNkmW0S+XEgaqI7G+LdIAuuh/6VJo9UAEmbgqC3fkG1UqJdESvo+A/6iUg8uMDnQNQ/dHSnw5DfyhtLVROguJCAoTtD7cSDji9D10k0DkEuYCBLZF+NARLdZ76Bie9HW1IFiBgTCLzACbelptGgYShDheYrGBi1CaXuBIWTvZVwuOSiIftTyCTCia6+GExCZEcN5pkjjHJ+akIso8/FNv/BzuslTS8WPO4SqZfVRx31YrHtM57prXdpk2EV8WSd/PQoE0vGVafs3jm87jouqEG9zWqxwZRr1hxMmhatEI/NjzCyE/2TXR6t8SdWmDJ86fOI8f0Ok2MNcgKBie87wV8fa8MU3EiMtJkHjEnxBeHY46HYqGo6hgwYVvgmMaAeRxdgpE1TMOHDIQe09vtCTNLo6FyIUN9zZleLSji+CkeVR4wgpA0OHpW+9Uv1wsDp8NzWgzYK1gm12Zd1RnVvP985ldr6oJsL1kYlngstKuxkCjaRUzCtj6JyqJ+WFb4Xyov4K2adfsWkX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(8676002)(26005)(8936002)(5660300002)(6706004)(16526019)(956004)(2616005)(186003)(52116002)(2906002)(66556008)(53546011)(36756003)(316002)(66476007)(66946007)(16576012)(966005)(86362001)(478600001)(31686004)(83380400001)(6666004)(6486002)(31696002)(38100700001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q05kNDhxcTNHRUVCcWdYaGtZRlFoQ0U4VHZSMWREQlBCV0NjdVdWSWFrVXZu?=
 =?utf-8?B?cTRCRUtUNmpadDhhcUNZM1NWUGhKTUFMMXlGdFRzeXNodHVOVjg4MHp6Yjhv?=
 =?utf-8?B?L3pPUUo5MHU1dlh2VVdZZ3ZUUEdCdm9JcExhNlBjTUF0cWtnYzNTaEhRbjh3?=
 =?utf-8?B?aTczakJueUM3aDlxWVVMdDdGa1l0Vk1oQi9LK00wQUNicU5Oc28zTHlTckVX?=
 =?utf-8?B?cjdhSUZiOXR0cG00R3pRajJJVG95QlFqd2dIdnFlc1JyUmJQQ0FFcTNFeDZq?=
 =?utf-8?B?Rks1WDEzTG9wNzFBcWdzRUxHWDhpSkp0Z0RTalZsbG9zVmlZREV6NGVnUHFF?=
 =?utf-8?B?L1FiMSszNW5YenpZeVJjelZCTTNtS041dUh6Y3lwb0x5N3UyMmZKSUl2MVo1?=
 =?utf-8?B?RDEwZzFFblVpcjFCb0k5QXlOWGd5Q25ONTZCVW5XTEg2SWl3K2orRW5yUTZQ?=
 =?utf-8?B?dXY3aHZpRmp3SG5MZkhGaTNZWE9HYVNEODlncmRRWVRDc0c0U3BIQnlYMjgv?=
 =?utf-8?B?UXk4U0w4QUxXRFk3YTllNEJzUzdjN3hqaVRxUlRBbHdseW8xMTc0dW0rVlRo?=
 =?utf-8?B?Tk0rR2VyeU5CZmxYS0RBa3JUTHlrNkl1dks1U1g3WXVWR1ZxZTFWQWREeGps?=
 =?utf-8?B?Y3IvV29HKzZGT2krS1B3K3pMdk0vVU5NRFRZbUhWSFNUa2VJTm15dTB0MENs?=
 =?utf-8?B?RG9wUHJ1STBZUkZaajZWZ0tKemhzWkczcFluSHY2aHVmNytlaGRhT1ZFREFi?=
 =?utf-8?B?NE4wMzREdWFmcFJ4MWEwZlIySkFsS09GbFhrZm01YU5LSjQrbTR2Ky9ObVpQ?=
 =?utf-8?B?K1Nzb3EwM25rdGU4azIwVnZ4ZTA3WU82R242Zzg2SWs5eHEvM2ZpL01Rc2xE?=
 =?utf-8?B?dlFQTU5Ub2RZbE54Q2U5MUdHWHJQdVJ0MW8vdHIraWc0U0hYeHhTbXRkeHps?=
 =?utf-8?B?UHZwT3BuYmpNMmpPdVpzaXFsS1Jnb1hvMWVENlNSa1ZKQllnb05IVStCSmJq?=
 =?utf-8?B?dmpML2FJWHh0ZWVPQTNoZGxNa3dENHdrVkRKSzRWQlRJYkgyQ1psZDZTMHlE?=
 =?utf-8?B?RlczMDJaQXRadTRjeXJYQ2s2WFNHT2VhQW56bjBCdy96bHppcXR4ZnN2NldS?=
 =?utf-8?B?WGYxeitHL2pXMXBOeGhPaU51SklpOFZDN1JUQWdJT29nNmZiRCtndElNbWF0?=
 =?utf-8?B?WkxkUDhhbEY2Wi8xdVJZS2tDUVBkNGdDcE8xNXB2b01QdHRneForZ2tVanEr?=
 =?utf-8?B?ejdVMUZobnNxa3lZa2pDUmxnNTRjMDRtUmhpVFM4bitzZEhueWs2YXd3enZF?=
 =?utf-8?B?aDh6ZEFrZ3Zxakx1L3ZoT0g0aW1FbDhIQi9uaTlLaUN5bTNOTnUzM3MyYmR6?=
 =?utf-8?B?Q2xLYkRCUlBZMEgvMDVlbDl2WkpUZnBtUWgzU0JHdXpTajJiNVZYQytpemJU?=
 =?utf-8?B?aHU0SDYxZFliSmpCN2ZZVUpRdFZKWllzV2NpZWN6Z3YzeFhmTVZGTVU5bDQr?=
 =?utf-8?B?S2lCay9UckpQdk1CT1dlV2lWZGlaWFZ5OHNXcExaWVNpQTNjWFhBL1dOZGRG?=
 =?utf-8?B?V3FucjhJSmNlT3NWR1JaSUxrSWs2NjJvd3NDNGpTb2VMZmIvdmNrM3BLUVAv?=
 =?utf-8?B?b2dZd2MwQVNXRWJHUkF1TmIxUFM2NUo3amQwY3VkeTZXMXc2RTI1NFMxVm9F?=
 =?utf-8?B?eWdCOXEwVlBxU2ZNaXBvQU9LZnVCa3hhb2tmd1pvRlpDUnpkS0VNVllJQTVB?=
 =?utf-8?Q?uw2Ei7Lix7pXoRUfSpIPV06kYQ01+G8nYvBqfpq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae1264f-ea1b-43cc-ebc3-08d8f4aecc2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 01:38:06.3786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqnzdzIWfJMxTCTqTl90Gl3DRqC0/hXaY3t34Aabr5P4mjnoC4beNz74hdayvdLBVKiOFKE9z+Rx8rRsxtFXxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2021 12:00 AM, Khem Raj wrote:
>
>
> On 3/31/21 3:46 AM, Chen Qi wrote:
>> When apt was upgraded, the '-DCMAKE_DISABLE_FIND_PACKAGE_Zstd=True'
>> was dropped. However, it was there to fix do_compile error when 
>> ccache is
>> enabled. See details in the following commit.
>>
>> """
>> commit 0aa7d612b8b7e5f14b4ed38f2a32b3f7eefca31c
>> Author: Robert Yang <liezhi.yang@windriver.com>
>> Date:   Tue Jan 19 01:23:45 2021 -0800
>>
>>      apt: Fix do_compile error when enable ccache
>>
>>      Fixed:
>>          apt-pkg/libapt-pkg.so.5.0.2: undefined reference to 
>> `ZSTD_endStream'
>>         collect2: error: ld returned 1 exit status
>>
>>      This is because ccache-native depends on zstd-native which makes 
>> apt wronly
>>          find it. Disable zstd for apt to fix the problem.
>> """
>
> should this only be disabled for apt-native then ? and perhaps it 
> could be turned into a packageconfig knob as well

No. It should be disabled for both, and mainly for the target apt. 
Because apt sets 'CMAKE_FIND_ROOT_PATH_MODE_INCLUDE' to 'BOTH'.

The packageconfig also does not solve the problem for the current codes, 
as the zstd dependency is added in ccache.bbclass via python anonymous 
function.
To make packageconfig work, the apt upstream needs to be patched to be 
able to enable/disable zstd explicitly. But there are many other 
'find_package' in apt, they will need to be changed in the same way. Not 
sure apt upstream would be happy to do so. I don't think It's worth the 
effort.

Best Regards,
Chen Qi

>
>>
>> Now we are meeting do_compile failure again when enabling ccache, so 
>> add it
>> back to solve the problem.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/apt/apt_2.2.2.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb 
>> b/meta/recipes-devtools/apt/apt_2.2.2.bb
>> index d1aa5de8df..7d1bce558d 100644
>> --- a/meta/recipes-devtools/apt/apt_2.2.2.bb
>> +++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
>> @@ -44,6 +44,7 @@ DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt 
>> xxhash"
>>   EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
>>       -DDPKG_DATADIR=${datadir}/dpkg \
>>       -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
>> +    -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
>>       -DWITH_TESTS=False \
>>   "
>>
>>
>>
>> 
>>
>

