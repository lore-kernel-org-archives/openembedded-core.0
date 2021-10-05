Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11744C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 16:14:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3008.1633450444829138265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 09:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CFpToom/;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5912617e4a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195CvQdt025092
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Oct 2021 09:14:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=k7wT7PwIZvOKggz2jIJJE8S3Ww7YFIzsXqwclonDbDo=;
 b=CFpToom/rDkbdbVfs6fjqmGWV8cAgh7wBATt3TWL9kDN7CFZMsoGWuwqh4ReZc/jFB4p
 pwz/gZ/eZtAgpXVyuZTxx6Lcsj+n3Ft/5s0+OPI1ZH5Fk2Rx/X45kQWCnmqzd0zzvFDL
 JgU0GQzW5aW2XqSwqSk8SxLGrA9lWa/Zjw9q3H1tCobKk+vq0zyNwh/ALi7L0HscDPBX
 naRHmQ8/lfhsUkfss3UYoBF8bdBrdG9KirjmRM4DpijlvEnfTEsXJX3p2v8VcYhAqIfx
 0cOzHRLW4kgir7g/mLDk6IEzVUHCCuqxQmD9iIUqbRUMjp+s2SJnoimoOUsK0tQ/Y5or rQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bg8938suy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 09:14:03 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195GDqSq007172
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Oct 2021 09:14:03 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bg8938sux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Oct 2021 09:14:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjsP3gavlgrZnWnnbZ2Xtc6unbaNCDZ+b62QEZRPzd6AmXb1ERA5WszXUHQM7guws2tJ1eqOfV18A4eKmHtWfwBih7qekAtG5GLp8sLHSQAYkwfORbmwXMZf5cJ9vSxn1lmaSwQOelgVETfyoyp6FiBlYMjUX53oZaZBO48MUNRB3DHNUTcDP8aN+p2hVW210MtVpsAFsMcIQ114d/rzLwT/Iys3W1gScUbZbiSjt+E9eq9OiytcTcYd03x+q+GSOUXClYhEmcOlRu7r+E/V8ezZydUOZhvw1BzoNo9KnQq4w80QeuHJPhzJYr/1Mh6gUkDqCH9EtKlO/dTe5B/sow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7wT7PwIZvOKggz2jIJJE8S3Ww7YFIzsXqwclonDbDo=;
 b=T47dlPkz4rmYTrXBkWwLl1rlnnctEYtzuaUi6Tkf2Z33fw11ehiEAb/J48whZz7FEcHMGC2uv2x9diCUYglClQVD2U5us9ujqvo04Ny09Kpu34SWeO+IUEVz7veeHWzaRZhKPS/5uvOm3BcH9Mo++yjCFe9GvtPfkz5Bq+axdsdNrS31f05qMsd/CiIvCGpr5X8Gfia4OyOSm3359il3kJXYb36tcMJgh0li7MHN4mvlPItCMhwLKTcXYKTbr/+Cl9Sewgw+maSjBfZrnDLR4YlJ2Q3mLeJ6fMuYg2wMTK5dBinR12IG2iSGHW0AHtnOVtKVS+jcpdOYblYWDqhnMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2604.namprd11.prod.outlook.com (2603:10b6:5:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:14:01 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:14:01 +0000
Subject: Re: [OE-core] [PATCH v2 3/3] Rust oe-selftest file
To: Pgowda <pgowda.cve@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randy MacLeod <rwmacleod@gmail.com>, alex.kanavin@gmail.com,
        umesh.kalappa0@gmail.com, Vinay Kumar <vinay.m.engg@gmail.com>
References: <20210929080448.16224-1-pgowda.cve@gmail.com>
 <20210929080448.16224-3-pgowda.cve@gmail.com> <YVTv6yOlPK6LmW5d@piout.net>
 <CALY4987_k43oqQKiGP0Znf9FYaJ50YzpQqejBbqUvvObqhxdXA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e2ff8b3f-a9e1-00f6-7536-3bb8712fad84@windriver.com>
Date: Tue, 5 Oct 2021 12:13:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CALY4987_k43oqQKiGP0Znf9FYaJ50YzpQqejBbqUvvObqhxdXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 SJ0PR03CA0340.namprd03.prod.outlook.com (2603:10b6:a03:39c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Tue, 5 Oct 2021 16:13:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c9ec1c-9dad-4bae-d06e-08d9881b24e6
X-MS-TrafficTypeDiagnostic: DM6PR11MB2604:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2604D0D5C80580400F41CF0DF8AF9@DM6PR11MB2604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VUepKyNHIBcD/vUS1V9H1VQv6J7xB+kS5yAZfpqARV4o8+88mP+eCej5vNn+IjfWwvs7FfbS7gSrJUzF0PSSsUuK6U3C/p3bc/mmSPOFpZMWi34BAk+GQvSTzUIFnZJscYegrkEpXXAvRCyP7dwh/BAX8Oy79Er3EjWzW0KnqgQuoxmR/yb7YBupWTUF9XunLG71EXhScDgIYmWKoI8tYPhcGYwUYsZgFosuTOqgJPkWOcATNFQEfe/K4JSrdQ37SxEtRfprexP1uREnK+/j9FdjassPdK29koEEg8IqgACjeiKJ8SvP6ED9kSdeFEFyc8QiiGEoNdaCzG782KEax2dot0WnecXrlD64sw+7rOpiTJQj843xU+OyQ/wSQmsZlFQ1K5REDl/QFtR5/UsSS3qXU3bzOjMZKcHmyH1v5s9n/DOim9bn2CXtwA9KsYolWuK0IdwoOF17XwFKgOB5snEvLqoUgP0iz7Tvy2i0k9NaOsvGpjMi8t7Ts1J4UWeLeNM6F8pCUXoBr4yMeBODcvw5/EZaftxDBKfKc6P5mHyJ5ZCDhoCzN1GNzGHtrfSVTHJBgxKFdJ/E+eZAFMRs4qLR7Rq5RsELCTT8UPBuI+ZZdiTRdWUL/tt5GN+Zq7fHjZBJdYYTDNBYHdACyztl+FDj83KmuPwCfrZC1DijgrUEd22JB1eSoApuLd2NM09Ggxt9oBk4fiWqamI2SfZHv6UJp2MDgT8PagOvwU9y/+7DyAjXCNApzwRzBXB4gM/ojWep/uslVSS2LZvMZ07xLZX7ByAC01fac8E5qYKdiCCTbK5EfY9cLFWhlHeqPgtg7rZ7ZFLN1/Wm59ZGKIxhfbhSGGIluBGpdHe8TYrGovXQRiySnlv7KHeTXIjBaAbInA+fSgZFKDy65JD7bKH/cA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(316002)(2906002)(52116002)(38350700002)(31686004)(54906003)(110136005)(36756003)(38100700002)(186003)(8676002)(16576012)(31696002)(5660300002)(6486002)(508600001)(6666004)(66556008)(83380400001)(66476007)(966005)(2616005)(86362001)(8936002)(4326008)(956004)(53546011)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V0N5MVJsRW5PeHd0Qi9XMHRvNFdWMGs1Z1huMmJGeVhPdnBBYVJzeUswQjJ2?=
 =?utf-8?B?TE1XNEFCSGhhTEV0MmhFVGszSlgwa3FmK2Z0dEVPbHVqSVVMS1pXUFNqd2o1?=
 =?utf-8?B?aXdna0JZa3UrOXBZRHJsR3N1YUFPdVhHNWZCNUMzNGRQV1FJT1RMRXlPRUhQ?=
 =?utf-8?B?dlpzbTlxbVpjSm10UklnUE5VYVlCQTdtWTZsY2Vaa1RMczdUejM0NW1DRk80?=
 =?utf-8?B?NE1yc1lHa0NIRmFVNDQ4ZG5XK3dndGROOVlyb2JQQk5kOE1OaGJQaDNMZ3R4?=
 =?utf-8?B?Vlk0dGNITnIxQkRRdXlhU0p6RnF6UFZDbWVhTU8ra1JYdmxGclhFMU5OTVA4?=
 =?utf-8?B?d0JyK0M3WmNXWFl0b0wwSGMrb25ueS9Td25Senl5cUxKdUpkNlZhMVk4M0ly?=
 =?utf-8?B?bm5weDdwdC9veDhKVnJ2N0pEZG1wNWJldEZFem53d0tvZWZtQndkWmVTNVVE?=
 =?utf-8?B?VjZvRHdYb09lV2xjb0dnV004aGMwbnB1QUROTVZMU2hHYm1oQVphczNhcU1a?=
 =?utf-8?B?b2xmdUZiNllRWGIwdXg3aGxIUGZEV0lZaGF4RlFwd0NlbnVXQS9PdlF3WG9G?=
 =?utf-8?B?T1hVWlhlT1cvTXRMM005K2lsWXpPZWJpeTR1L0VyNFpxUzFZNzRScWFQQVZw?=
 =?utf-8?B?R0lVVWkwUDFqb1ZTMURpUE1VUkoyb3FROTZlQ3hWOUFyamRIcDJINEJaUTND?=
 =?utf-8?B?c1lkYi9jYVp5enVnRFFkRGg2YWNGdUJmcVZzVlN3czZWWStNODZEQUlyanE1?=
 =?utf-8?B?R3BKN0NpUXNOZkFseTZ5VS9DYlpJY2RFaDNiWWhJNERjTXluS0daemxVcWI1?=
 =?utf-8?B?aHdtb1RCMXVZeEpCWXBhbm1XK2lzUE53V0Qxc05UYnR6a2VuTGpVUllXOHp4?=
 =?utf-8?B?d1doVllIRnQ5cGsvT3ovVFNXcm04MEwxZWZReWxzUlBlK1BtR2JvMUJiV0FH?=
 =?utf-8?B?TjZ5MjRBYjQ2TFM1K0dka3ZmVWZOMTRybXpQU0FwU2dQc2JsZVEvY255TUV4?=
 =?utf-8?B?QWdKcTFCZEZBcUVXMHFLbUJxTlNocW1iRmJ6N2x0Z0t2K1FPMzIxK2NlaFp1?=
 =?utf-8?B?QVo4NmV2S0d2RDFxRmlQT2dRSll3bVY5QzJOMzR3UlhJajhiaUU1bUVWUnpP?=
 =?utf-8?B?Y1hEcW95MVYrUWRTYndSRG5ydjdldENDWkRmZUp6bDZqUnczTGJQdHoxRTQ0?=
 =?utf-8?B?YzB5ekRmalFJYzRPUi90WlNoY0ZDc3BReVVLTnh6eHJIcC90WmNwUUZKNHJE?=
 =?utf-8?B?UDVUYXhWYjZYa2FQNHhNTFpFRjZOa2xZRWNGZlJ5U3gwTVVyUEo5am1xeldH?=
 =?utf-8?B?ZGxhREh4cFdlUC9JUlRjZXJNZ24vV2lmbkswV3VTZjhrd3YyWTY4NmRHZFBp?=
 =?utf-8?B?V2wzSTYyQVRuRTFhQzladlFOU0htM0ovNVBOekIwYW1ZUTFNRFJkZlkwNkZh?=
 =?utf-8?B?U3hHTExHcTBpWnNaaGdXdHRCcUpZcG93ejd6SFYvM2t1MHBBTE5DZmk3eUhJ?=
 =?utf-8?B?VURjQ2V2VWJkMW9JbUZaRVB3eWdhY0pLRHRvbVpoQWV0bTBweUZRdFJHVmo2?=
 =?utf-8?B?Y1J2dERYeGRRYTRlVm1VMHo2MnFLZVBYbUprWnpvRkZtT3pwelUvbUttd3JH?=
 =?utf-8?B?VHI5UElEcnhxclVkQmNvYmFUYTdVTjRQTHlxZUZ6cjBzd2E0WEJIWndTZysv?=
 =?utf-8?B?Y05UZmZiN3RCR2E3UldjTUg4VXdUTXJaa3ZldkovYzJoUmw0OFBPUzNLZkhB?=
 =?utf-8?Q?FPdb2dHGmaCgqQXmzVWaRfTnGZKsnxWLkDHZ+8f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44c9ec1c-9dad-4bae-d06e-08d9881b24e6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:14:01.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YOYnYFb1bYpqfvJN8jVOexOrNp/y43970O3wsexO18s8RcvTMONSl4HQi2Yr5jTaWbgrXi5a6P3EaqZgES4gpEokKSe00PoVJk8zbqAdw4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2604
X-Proofpoint-GUID: my2II_IHE7jz9bUIL_M7jT98bXjPysze
X-Proofpoint-ORIG-GUID: UoFkQLTsTz2--bf-CySVeiI7M0wTHnwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_03,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=717 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 16:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156650

On 2021-09-30 12:31 a.m., Pgowda wrote:
> Hi Alexandre,
> 
> Thanks for mentioning it.
> 
> It's already been taken care of as the following patch:-
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=50f7a13e69e8987b3629d455f9f56720c376e89b

Hi Naveen,

That link is for a commit in master-next that is no longer valid.
I guess you should send a v3.

../Randy

> 
> Thanks & Regards,
> pgowda
> 
> 
> On Thu, Sep 30, 2021 at 4:29 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>>
>> Hello,
>>
>> On 29/09/2021 01:04:48-0700, Pgowda wrote:
>>> Add file for rust oe-selftest
>>>
>>> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
>>> ---
>>>   meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
>>>
>>> diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
>>> new file mode 100644
>>> index 0000000000..ad758b71f4
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
>>> @@ -0,0 +1,3 @@
>>> +require rust-testsuite.inc
>>> +require rust-source-${PV}.inc
>>> +require rust-snapshot-${PV}.inc
>>
>> Unless I missed something, this is missing a maintainer entry:
>>
>> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
>> rust-testsuite (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb)
>>
>>> --
>>> 2.31.1
>>>
>>
>>>
>>>
>>>
>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#156480): https://lists.openembedded.org/g/openembedded-core/message/156480
>> Mute This Topic: https://lists.openembedded.org/mt/85943726/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


-- 
# Randy MacLeod
# Wind River Linux


