Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2175C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 01:10:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1988.1634692241649998833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 18:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=On64iGPw;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5927a4c3e1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19K1Aerh011591
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 18:10:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=5dVRywzEzUMqRdxdCuFH0TBdmETSRNX47r4+k7tMcBg=;
 b=On64iGPwbgsCgJN8GsT4OkUw9a8X/tURQ8yvihKOXPzGrcqbT0ouMaiNEL3cJZkmy+Os
 3B+/taX+POkKbwADHgDCy55m+CHy2CdGn8TRIjb+F3u2KEJLGx1KjSaNXQ0ePja6H1pY
 QZ04mfA+das20Ha1ev2RaAhO2OeOWmLmAKUhZdMwCQgeXvwAQrQeRtdE/xzRYp9ljelm
 6mWYsLzbgJcRCnMnOIcZT/uptiPplLNAqUbwNu2hn2uHKYLukUI6Y753NtXOsiiHirFz
 puJ1BQMj1MY2FuuwtrJQyKnSeHFRmacZYtPzXF9jDJJ03+DU2H6Lc5PjaRMvg9pDQO4h iQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt7up81ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 18:10:40 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19K1AeH3011582
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 18:10:40 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt7up81fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Oct 2021 18:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFGb3CWy/Ey5pQKuKTpr3VlGl+z3jdiHqoLl66WexvKwsfXN6vT4+3orVsEPmdw9+9KP+tqdQ9/sj+1y7PZfNzk1Hm01Xv5FPZIq1EHAKUX1azvo9rp2PK093enH90jCBwdPbfzcHJg2lvzj7qCRYl99A+HRJiLGj9HnkP2b+A4W97DRw1GFJTQ31P+elK0YOZEcYyUtQvS3gSXhtY1jic5gXiTS4E4njoi4Nt47u1jf10qk5ZsKROPTTef55Z+P8Owkd2eWlPApgJAWb3sVjScKxIQAuOIqQH3bKHEWo6YhKbrFDGtz/qmvt4aSTRQHg260oWF/m7hlJQ3CxJQySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dVRywzEzUMqRdxdCuFH0TBdmETSRNX47r4+k7tMcBg=;
 b=in3v7WtW4VJtZRfZO6Ku3yRMDoqnKmomieMhxzxLmpzn1x/wygzq2C0GlQwien0F+FxDPg7k/fIFWWW6ByIEPT4a+W9B1jAruZGO86W5y3SfaQbdwkOwvBXSTJEUyAg1wK+j/CFzZfcJmxFEiI315DRs9XMX5NnCTdC05CSRJ12EA8Ih7OBkMfAgZZOqgqhaEw/kWoAnAgMXINXjVAt9dq4QRKbe+lgNzaca3XvZANUaErt9HLnUF5ixcSmTUf/wpWrhPddCxMssOHnJoFhHm0Xw43r8yPiPHzckmO7KajU0azwbfif3JGhjTZR6pOGxSW7UOJc9ZMYkw+p/4PaBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1964.namprd11.prod.outlook.com (2603:10b6:3:111::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 01:10:39 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 01:10:39 +0000
Subject: Re: [OE-core] [PATCH 02/65] rustfmt: remove
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-2-alex@linutronix.de>
 <6c4d94b7-22e4-bf35-4fc1-bf9c680262e6@gmail.com>
 <CANNYZj8QiFX59VyR72TPZQPE2TLoy9tscTByQbFVjT75T5OqXg@mail.gmail.com>
 <CAMKF1srRnFs5Qe8+bxLEUq6h3hrR50w5-1Ru6NzTya88qeTNXg@mail.gmail.com>
 <CANNYZj_kzzBM7v96_fkivVgA4ksNBpk00hsCHPmkq4am1EpGXA@mail.gmail.com>
 <CAMKF1soyXWyzFd-FJTPopYt3Sds=4=A6=tVLz+fKrC59VgYKxg@mail.gmail.com>
 <CANNYZj9Q=9hXRziLC6c3_EVRViDfFcTe3-27ifOOnpz94P7_-w@mail.gmail.com>
 <5903b2623057b6861cef3b84562acecddb0adb14.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b31536e7-51b6-e822-82bc-494cd574c41a@windriver.com>
Date: Tue, 19 Oct 2021 21:10:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <5903b2623057b6861cef3b84562acecddb0adb14.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 BY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:180::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Wed, 20 Oct 2021 01:10:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1ae543a-fe3b-4f34-15d8-08d993666dbe
X-MS-TrafficTypeDiagnostic: DM5PR11MB1964:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1964D5D3CD1F7206FB0261B7F8BE9@DM5PR11MB1964.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KouS+TUtpmWFm95Sa75kzgaELQynCTeVctfAW96wpxVm3GXeCzVBd06S3ifH/dXPxG4FMNxZWdIVwLWZO4pn3JK5IhSYux9PjcWhz/cRGblOpMQNIpfAcilXplCOo0EG9h0c4grm6gOk40fwh6FZRiXA6gn6MxhHvPUBlgizImBN7dufn9aFK/2lefT9OFJ7mmid45Kn4xfdxyjCtfLrc2AhSa5rhsZwXCxlkYYRI2ZyX4fzb0FiZH4Gf3LJyWn3L4a/MLlkm59N99Tgg5OkFyBSaAkJg1pakiwFn5hD0osx2m7toBYna6wGDptPXFazbp9rOquneqg4UotcoS+btMIPVIpejG0vkb8coNVUO3uTkYyBAivyTgwHQcTUbEky83HzguPHK+RIaCVxTEQImEZERuubxvMt4Dy8Xy02OXlWPri5B14bkiv8e8ZBkFjHmuuEGNafD9NX+l7jnObThAujqMZLhC2LSFe/QMq5LIW5/7Vm28F+OpaLmTJtoQTG0D6hA1J/RuREsTk5uIQeMpoK/VMaOz4turM46LQIA0y72A33w6xp4eRJ6kB3891Dv+/k1H59gIWHa1OHRL6GE3DOd7iQR4XjWulAEyt8asC2LxVNJh9h8iHfhNSNCAZnKVjIqx0kIEUnJYjAg1yWoCV3J+SGlshImWFzgK/bVkjlq905ECCkUVm2Ylndsn/ZNxT4/xOCseEWyTUibMjaZ5U0WPo2HNj9YaiorxzyfOwHP+tcPzhxaGgCxLDVdbsBAXtN9mCUJE+nPnZeA8jteqKkRa7O5sS4Pvmbh7/duMnPtPsZ+G0gRiyP1kEzvGHdbFF6CT7fV4fAL5SbB5jok0BFSxayNEOLHnONts0qGKQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(4326008)(36756003)(52116002)(66476007)(2616005)(966005)(83380400001)(8936002)(38100700002)(8676002)(31696002)(6486002)(2906002)(53546011)(54906003)(86362001)(956004)(4001150100001)(66556008)(186003)(16576012)(5660300002)(316002)(38350700002)(26005)(66946007)(110136005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S00vMGRNaEFkZEFST0ptbXpyczRKbHByUEF6d1pCbjF2a1o3eGxSRG9ubUVj?=
 =?utf-8?B?bW1SdW5aK25aRzRTdkhPOS8yRCtlcm92UEUvWTJNRXBzakxEWGlTTmMwdSsr?=
 =?utf-8?B?MjVudThNTXhXRVV3akl3RXdiaE0wLy9ua3dYRUo4L29SUkI2ajcxNmtraDda?=
 =?utf-8?B?YlBqVk9FaHpWK2JYKzdpSytjQ0F4eGo0MktKdW1oUjdFU0hDb2xmbCtscFZD?=
 =?utf-8?B?ekJFQjIrUG4xQmZnOWtlUnNYWTBiVVhYQnhueWpaLyt6bURwbzVaNzR0SnNW?=
 =?utf-8?B?RkduVFMyWUdyVjh2WlNhbm5SOTAvOE9nZm5PVmgyT0VPNHhuWWt0WW9Wdnhi?=
 =?utf-8?B?Yy9jbFdoZ3AxRUQ4R1Z4NFFCZWkzenZ1UGNIOGhmNTRoRXdNZTF6UHNlSDBs?=
 =?utf-8?B?TURnY3FZKzYzQU1pN2RHSHE0eFFCV0hpWWhoeHFQa0ZpYitBdXdoaUI2NlZa?=
 =?utf-8?B?OXEwMVVqNU9xeVZ6WnNuN3I0MHBLWTJyalhqUWlldkE2dmV1ZXlyb3ppd0FE?=
 =?utf-8?B?ZTN3ZE01cWRsUnI4VHNjb2g0bXB2dnQrUkRqbE1pRVg5OUJGNlNpTVdZWWdI?=
 =?utf-8?B?UnpwUzR3T2NVdnBPWW5jUCtXWllCVk02R200S3FvdHJPRHJvUFFIalhmN3lq?=
 =?utf-8?B?M3gvTTZBMDljYTY2dkcwMUdhNFBwZnZmOStxUHBOSEc1bGptNGE4ZTNSYVc5?=
 =?utf-8?B?WmxuY05MbUFTVzRsNG5qWkpnak5lMW9EdkFHb0xTL3FqczBRQlNLK0Ztd09p?=
 =?utf-8?B?aDNjdzhXOGkvemtWL2R2aGpDVEZQWi9JUHRZanJ5VGlOTHVMeUpxVDBGOElr?=
 =?utf-8?B?NGxpMFpNcmpDSm9Qb21MTmNQQWkvYkNQZUJsOFhPdXQzYnRUY215U2Q3OGtT?=
 =?utf-8?B?VGFPVURLN01KRzI1TlhjQzNsZ2w4RS9VUVBXS2pQMXUrdzh6Z25Ha29VL3hq?=
 =?utf-8?B?RlQ0OWpSbk9sK1JsK3lLQS9jVXdNYU01U211RkhVc1ExSFRyejA3aGxlZEpo?=
 =?utf-8?B?YnZYR3ErSVB6L2xOMEJrMFlkUldKZHZaanRwRHNyZ1A2RC96cUQyQllmOEYr?=
 =?utf-8?B?M0IwS09IODlSSVF0eWFtcHhTTEZFbGVvYXI3U1paR2ZSRDYwbFJMTktta0pI?=
 =?utf-8?B?ZFYvMUZiUDF1TnFkRWtZRVhsUGpvZDNwUnJaWVJkN0hFT0d4T2JERkwvWmNk?=
 =?utf-8?B?WkxmL1NyWTZWdHVDeCtlRTFzOGxXSjdGZmRoSTA4cUpxOEMvdDhKTmpjUnJq?=
 =?utf-8?B?c0loUXJ1N1UzS2h1Yy9UckFPOEhpRjVGbHN4UlNwalZxTEtzVkFKMittQWNL?=
 =?utf-8?B?ZXlJV1lDWVFWTWZNV0JnR3VCc21hVExVY2dOQ2ZVN2NVWVFYWnBxU3FNeXkx?=
 =?utf-8?B?NGtqakU3VHU5ZVZVK1h2aFV2LzJHNzJKZlZLZ0FXUVFOR0JTQlYvSDNhRmpp?=
 =?utf-8?B?ZTZXZmxxK0VNeFZpMUdwVTFjS2IxUklQM216cXFQSlNENlBkcGh0TTdEOUFo?=
 =?utf-8?B?QTBlQklGYTBtL0lNRjRDK0xSalBzUGMxdmxXYXJRSUZTUlNxTzJjUU5JNTNQ?=
 =?utf-8?B?RzRlT2lXV0l0eTFDT1lDUTRaSFpMVG15K29UWFZ2WG9FaWdaWGNuQXRYbTFm?=
 =?utf-8?B?R3pPQmYza2U5dlF0cU53b291dGpYRWNCalQ4OVJzTjkyNzVKRURwcTVWVGov?=
 =?utf-8?B?R0FHTmgvN0YxQ2ZPYVhnVVdaR0NadHE5dFBqdmNib2tOM2wzWVVYV0c1Z1c4?=
 =?utf-8?Q?J4lC77l7hg8Txj4g/HQhqJDLp1rX3KQDQQ7dzXq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1ae543a-fe3b-4f34-15d8-08d993666dbe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 01:10:38.8486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5+TWbQzSqiJtN1njv7YJdLmdxtW8v2gyLgB928Q5svYERfexopRANWcVhgjWQauptVVESnTLJyRxF2o0Kg7Shll5A+vHF0rNbumz4K6d31M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1964
X-Proofpoint-GUID: LWsIaU_iUgNmXwFgn6xHYcoTLLY8vXJJ
X-Proofpoint-ORIG-GUID: Vo-GSvAahU0I8dl16qn7MrFv-T8zQQP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110200003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 01:10:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157247

On 2021-10-19 3:58 p.m., Richard Purdie wrote:
> On Tue, 2021-10-19 at 20:37 +0200, Alexander Kanavin wrote:
>> On Tue, 19 Oct 2021 at 20:31, Khem Raj <raj.khem@gmail.com> wrote:
>>> It would be wise to hear people who use rust and develop applications
>>> using rust, meta-rust is being used
>>> to develop field deployed products. Again I urge you to think with a
>>> little bit of wider scope.
>>>
>> Look, it's just an example of a recipe generated with cargo-bitbake. Where is
>> this
>> cargo-bitbake in core, so we can test that it works as it should? Until it's
>> available,
>> there's no point in keeping the recipe.
> Rust is a story that is more at the start than at the finish and as such I think
> it is too premature to be removing this just yet. Having a rust recipe in core
> generated by cargo-bitbake does have some value in its own right. I'd hope over
> time we find the tool becomming a first class citizen in core but that will
> likely take time.
>
> I am curious about Randy's views on this.

I can see both points of view.

It is nice to have an example cargo bitbake recipe and that's why this 
one was added to meta-rust and oe-core:

https://github.com/meta-rust/meta-rust/commit/49d94ef0a74bb3274ffcb3fe25011b64865b80bc

It's also possible that some users would not want to use anything except 
the version of
rust and associated tools that are provided by oe-core and that populate 
an SDK.
I don't have that requirement yet but I expect it may come given that 
some organization's
systems are tightly controlled.

I started to update my cargo-bitbake and the rustfmt recipe so let me 
finish that and we'll see what makes sense.

../Randy



> Cheers,
>
> Richard
>

-- 
# Randy MacLeod
# Wind River Linux


