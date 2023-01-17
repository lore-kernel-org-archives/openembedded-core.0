Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F97C54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 21:57:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.261.1673992624419441572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 13:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=I+VIrES8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03811a1422=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HJjOdr002649
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 21:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Lrs2DMeU0T188Ry7ZcyopnxlXpZ+o+bJRvGIzph/hzo=;
 b=I+VIrES8d/Y6tn6oJjVEBmTHJNIvt9gPuq+d33TOArXDPM9gGNrySlhrN4QZwvYfrXQu
 RBctKNvAzB80hFT8NjcM9oeO4FpQOIH18sQaUouyoHLRiB4PuceXlPXXMvxBEoKSZbPp
 pYW4CJ+qQOQ52Ynr1lbqiL8/le+7Aylwzf4VRFRLC07vnXK4bwzXt/MQZ4ZGozU06nPh
 /6nQrw3tWYPjKmGbOXPD1bFRZBnkPzgIS2wAwcTnMYlCtfLg8hBf9apVdhU2U7YuAWxc
 qODoKI04o8rhjkefdFi5qMSIi6LsZcn0Cu3Qi6sRfmAahEQCgGG4QZMXi0aohdhf8wBT /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6kdhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 21:57:01 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HLv1Un009820
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 21:57:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6kdhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 21:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibn5FqQxR+JhI8/xDbTIH9G3ARPFWg8NUaSVriRsDTnHkUrfQcjd3tpxAARwB3s37Q8m60cuews64kJ7mrYztsEmWS0gxwd8efCV/ri7NUs3ZyOJuWTX7XWId8qxYbkIE5l/rr3WyBqVUYqXH0bl8+lZHzEkgi5FYlNJsgAn8jSUh0QmGXs6PlRGX3rvK8q1I8Vw1pgXsOZnr1YtnFztiifV+GAdkHl+XqAzLzppIgAJCrhzjO36jTtcrD76hWOkAyyT/4KxbYrL6/WHg+EdKctHr1fC7ma4/EmT2yiMV/aFTwYP1xMr+bMx2TEmUbxmC/9GCaGFgOTUM+WqH/t/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lrs2DMeU0T188Ry7ZcyopnxlXpZ+o+bJRvGIzph/hzo=;
 b=LFV4qov7UvbKZCaeDFnFajTJ0UXMNfscK3GSWGUzULjq1Fhxur9P6nh2Q8wPJQbSlzndJwDUpXpWicwEQ3ecJIW1/hbagAnutiQZ8v9TUOV36WAfWmMeGGUjTRzC1AIDq8hGmiEL+/tjbqBHyQuz57l7k16RzBmDyvYeBCCb51Q4vvcv8j2yvKR7fVGYqoW+gMQ/bqOd9yh+zCmon91EkuJF9awGG9X9EFSYWZREnUpB0ah5R0JMGj/DccNNE23CWlHFNFuvs+THeW/Ujzixv+cXGqSVrJlGZLZIBEjneoUTZ0q0ZnA9TMnogtG4ahcsXVVYMX+kkGSgrzuMvRjkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 21:56:57 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 21:56:57 +0000
Message-ID: <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com>
Date: Tue, 17 Jan 2023 16:56:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        sundeep.kokkonda@windriver.com,
        openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org>
 <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c57fe28-bc7a-4da0-d1f8-08daf8d5c08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AsPDOA87R76KqdmDBfh3hOOCVMb4t0SmB8CebMfSMeoypooQ5G3kQB65KYhnkwiTf01w6bEnfa31iUzxwpE9iYg5Hp3kFuuURqXUumuIfTFVG9IkGKPeQlwwzUPAhCxUDs91dy8asGdBQZsTUUG17LwMhjtJW2KpIz56l42Jn30Oj4/hI4TSLFFwtZuiYiWO7u2fXJSav6Kz/ndxkC1KwRgvwrP1U1IHEGS0UuozTjf3ojS3N2QyMrBazEMtPN12qygvdo82KwOY4/1nKxbGTy21Py03SbfCKxm1lfsrYTAetBi+cJoqJWEWGroqS+0NRECDTvrXeF5f1Mq6NdHEngWuAS1rWSXDF0AfyA1UhnQ7eNWRfA0ooAqt4BZ6wtWtct2Lw1SIbYUTbXKsbgunwDciTgy64Wq5Ssy+4ECzkDQE8w8g4fUEUYfS+Y+6Xfqmd5FGwWZXccJfywZhmPGAKWXeWCK6rEp06IEkNJVXXHGN4rVEq0ykfxBkdOdAHxiyOFfH2fa9/KaDZgHp8UM7bTUuVgQpgGlTPj9KpKxKD9bPu/NRwhRxCAG29TWhcjUbJBVGxiuD+HlxuBEWUgEv0Be+JDOS4ciNDxoyf89d8QJS4ntUUURzfG4rt2icxXvUh8wSaEhDcxNVxxtPgF5lSpUYHXDvuQGqUJ9UoK3hFz8cl341RvY6MclMJOUAHhyIo8+5/X9MgJ01mz286/x8Hncl89CSo4SSX3lvn+1EmiAuNyiavT36F1OLVHczkm3UU7hmhxQfrp6hMdF7WPYG2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39850400004)(376002)(396003)(136003)(451199015)(38100700002)(36756003)(86362001)(31696002)(6486002)(966005)(6512007)(66476007)(8676002)(66556008)(66899015)(26005)(478600001)(31686004)(110136005)(66946007)(2616005)(186003)(53546011)(316002)(41300700001)(8936002)(83380400001)(6506007)(2906002)(6666004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUpSemh1aXZlSlFnMUY3V0pSSHo3eC80ZnZsZ2swWG1ORjdWdW5ra2U2NGM1?=
 =?utf-8?B?cE5QWmVqMGcvaXpMSDczRXg5dmRKN082Rnp2MFk3OWk1eFkzVUZiblQrNHpn?=
 =?utf-8?B?YkFseEgxRVpOQUZUL01RQS9TVnlJQ0dlbFlveWVLck10R1QvbVowZ2ovbGhC?=
 =?utf-8?B?eEJqb0FWeHI4K2xyNTZXUTlJQ2R1K1ZtVEQ0aWVSY3IwS0ZzZHVSYnRMbHFU?=
 =?utf-8?B?dWgrV1FqZ1pvY2dGVHJTNE5WOHhPSFhKVEQzTTFxOU5ud1l6Rm1HOUZWT1M1?=
 =?utf-8?B?Q0hSbk45dlBqUGcwZ0FPWXZUbTk5MW9HOXRQT3dRaFc0b0ljT3pYTkdqZUZW?=
 =?utf-8?B?RTlBR2RsODVXSUE5ZUdZQVpGSjZROGxpNW9md0s0RmNPZ0tOKzZBQ2NjblpP?=
 =?utf-8?B?anVOZzl3anV6dTBocmZwd0ZoTEVFSGdMY0pVUkVPaHdTeDExTkVnc1E1ZjAw?=
 =?utf-8?B?bVljekUrV3dCOWhacVduczFhUjM2T3JHeFk1R2JmNmVFWWh0NFltQW1ySitK?=
 =?utf-8?B?NnlJbWFDR2VocG43MVhTbzI5NnFiWUF5U2RIeVN2NHlCSGpYV1QrMEJmd0xv?=
 =?utf-8?B?VkdDbEIwcHl0NDlmNjJMcjY4L09IYmcxNTZCdHc3SExmL1B5Ynl3Ry91ZFVH?=
 =?utf-8?B?MzB4djdjTTk4RlRDenh3UXFmNDRtNis1SXd1Titsa1ZKRk84OWwvZzkwL014?=
 =?utf-8?B?RVBCNjlKWjdPR0xYQ1l4SERqbGtHZGM0MVpGU01LOC9VME81MnN3SHE0d0lV?=
 =?utf-8?B?ZHIzZHR3dDFMQ1M1QUdvcm96aWhFK2lPZzF6VEovSHdQcnJoNnhMV0RsUjlK?=
 =?utf-8?B?cnlXYndGN2JhT1Yyb1hEZFU5SXErVUVpYkg5OFBwWDhrUEMwWk90Y3Nxc294?=
 =?utf-8?B?ZUhWdUhmWkQxb1ZHNFRXeDJleTdqTUM2Y1JFU2EvWUNDaHlKYmlxWlhWMEFr?=
 =?utf-8?B?UDlsQWo3ZUlsKzZqbFRVQmV3RWRrV2p6ZmxrbkxRT2lHQnlSQVFsT3I0dThl?=
 =?utf-8?B?VWdKd1NnRDErWUptckJKMHZRSmZMbWhaRTVabnp4Z2JEUEwwU3RhSkZtUTBl?=
 =?utf-8?B?QW9vOWRnVm95VGZEYVhvTXZJWG93OUwweVo3eWJhbzhpdUxNZVZoUkRia1Bh?=
 =?utf-8?B?RXNiclh0aDE4cFRyMzd6ZGJDb0kyR2JZZUVwR3FtQnlVSEJKa0dxendmRU1W?=
 =?utf-8?B?Y1NQV08vNUplb1REMm5NT1d2QmhhV1dIVXdGeFFmZUpOczM0MXFNU2Y5MkQw?=
 =?utf-8?B?RDZPWlFWTHZxY3RoNGs5ZkpJN1Y0K09hUmwzN0N4UG04ZUYvZkRMRFNyYWUr?=
 =?utf-8?B?d2xOUUkrTXVjSDN5ZW1kK0JYRlhFd05JYVZtUGZyRE1RQkdhM3Y1UTNDTmlU?=
 =?utf-8?B?UUFtcDdDTlBuV0VxQkRLREc2OFErckp5YVlNMzFJaENPSll2SnkxcFNtLytv?=
 =?utf-8?B?TW85RkhmaVp6c1d6Vk1ZbmFLN0hzU3k3MHZVdHY2YTlSUGFBSVVkam1sdXBN?=
 =?utf-8?B?aHFFb2Q1dkhZeXBPeGhpL0VKYlVPZEpxbnlzdXJyR05wNEtncVJzb1lBUWFv?=
 =?utf-8?B?aEhQUTROazZFMUx2L25kVERWTGJWNnBva1lrdjVGbURKb0dQSkwwbmFueTFL?=
 =?utf-8?B?S0ZBSmIzYVJSTUtBMUtORDEyUmRqbG5KZkIrZDIzWmFIWVdoWXVTZFdJZ09z?=
 =?utf-8?B?a01IektjZmgrTHlzbFJEQ2pjYzlmWUJIaUlnZVpsK01iU1ZFb3ZuT2NGd1Ay?=
 =?utf-8?B?VTdnMEhWNWZzYTd6Mm52WU05OStUVEtJVkkwMVAwSjgvVEpOb0lwNTdJbnlQ?=
 =?utf-8?B?TFlLTmNLaVB5a1JJL0twNGtqaHpZVFdWbzBzeHVYR0JWTjBaTU13OXRDdnFU?=
 =?utf-8?B?NmtQVGt2M0Y1M1ZhNENRQ0RZai9YRjU2MHJ5U0xWa1FkMGgrSjNFM1oyK256?=
 =?utf-8?B?aDJ6cGVvVkt6citYSm5wNW85ZlB0OHVPQytMSTRpNmJ0RjJBUnNvTVhtY1Jy?=
 =?utf-8?B?WnlvS1kyUCtkZTdSdVBlVU1CNmd1UFVLeUhicS9oS1RVbGRnTG1SMU53UlBI?=
 =?utf-8?B?VHM2L3M4M2tLR0NHMlJpUVptc3F1U0pVWTAxQ2V6ZkRRb2xrb05zUmNFU3dh?=
 =?utf-8?B?T2t0K3hnNXNxOXhsQm5paFpGRC9weFZxZDdUaVVRLzlIT0FPNGI0WE04VXFu?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c57fe28-bc7a-4da0-d1f8-08daf8d5c08f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 21:56:57.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf24FKTvyYnVIdaNztg3vTC7r9//ujBf1WLGANOzbr1+v2Rr9uk7PnOnF8byNr2ZIhXMCWYJrJNrNCdZMmpEwxDbvmCGQ3bn9sbj2Iw6xMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
X-Proofpoint-GUID: B2GiIIBdQTz92xQJGeLzWNshE8lhX9JF
X-Proofpoint-ORIG-GUID: LBYw27YvqSv8Nt0vPhVgjTlUNAdEM7j_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=717 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170175
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30HJjOdr002649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 21:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176063

On 2023-01-17 16:54, Richard Purdie wrote:
> On Tue, 2023-01-17 at 15:29 -0500, Randy MacLeod wrote:
>> On 2023-01-16 10:20, Kokkonda, Sundeep via lists.openembedded.org
>> wrote:
>>  =20
>>>  =C2=A0Rust community said the security fixes are only for the curren=
t
>>> stable relases.
>>>  =20
>>> https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older
>>> -releases/18152/3?u=3Dsundeep-kokkonda
>>>  =C2=A0For old release we've to backport the patches ourselves.
>> The other alternatives are
>> 1. upgrade to 1.66.1 on older branches,
>> 2. add 1.66.1, which will be the PREFERRED_VERSION but keep the older
>> version for those who are risk averse,
>> 3. add a mix-in layer (1) with the upgrade to 1.66.1.
>>  =C2=A0For langdale, we'd update from 1.63 and for kirkstone, we'd upd=
ate
>> from 1.59
>> See the link above for a discussion about what Fedora/RHEL and other
>> distros are doing
>>  =C2=A0and a description of the rust / crates.io test system known as
>> crater that builds the
>>  =C2=A0world for any significant rust change.
>>
>> Is there any objection to doing 2 and if we don't see any problems
>> after some time,
>>  =C2=A0then removing the older version?
>> Sundeep,
>> If no one object, please update kirkstone and see if librsvg or
>> python-cryptography or
>>  =C2=A0anything else encounters a problem.
>=20
> I'm afraid I don't like option 2. We don't do this for anything else so
> we're now inventing some new policy. Either the upgrade is what we
> decide is right or it isn't, I don't really like the idea of hedging
> our bets and providing two versions, one of which nobody will use until
> they're forced. It will also make security scans tricky as is the issue
> dealt with or not?
>=20
> Just for context, going back in time OE used to be awash with many
> version of recipes and I'm reluctant to go back there as it was
> horrible. They were added for exactly this kind of reasoning, which at
> first seemed like a good idea.

Okay, make sense, option 1 it is!

../Randy
>=20
> Cheers,
>=20
> Richard
>=20
>=20

--=20
# Randy MacLeod
# Wind River Linux


