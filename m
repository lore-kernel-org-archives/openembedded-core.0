Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BB7E82CDC
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 21:14:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.291.1695849249297549116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 14:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c3APiodz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=763404f351=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38RBDale024988
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 21:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Sn3Z4v3d7zp5U2vti1j
	UIUhoYZROnA+ptDem2+s5P/M=; b=c3APiodzSy6xKpxhV9zlE0+oTBXX6BvzRSm
	aNJtxH4oNhPcY+BjisxTAnrdrmnFE2dQ51HawPUFI1SUiMdKadAc775SCS1ewRMV
	JwyrmSP5VDMVVtHB9J2qvBiq4JadQ+pJWpiEe2HGnb+KjlO1gY7sRmJEwsVNm4R6
	YIDyu3QQue79rV5UOChberHs0m26/UKChG9RDKbjZJjjW569+g8ZAqeTMGSXYQtO
	2mhO2ehy1+KKPj1v/4o1P+dkFUZqmmDt8VRT+/jpxyWMUQNLeoBkgCykI2cqijjN
	u9mNQb8l8rRK38lcZHwQOcI8sBURBTDVlkkF18xYPvIV3tVh97w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06ccfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 21:14:08 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38RLE7CJ007013;
	Wed, 27 Sep 2023 21:14:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06ccfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 21:14:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOO0fBqniLGkxbngi5ToC4NRE8N5h4MRVmU8BnjrlxjTYoO+rY86QKIA1DlRR7oIGUbbhEOtSl3NibJYQ+FvOs8X6uxHILCj0sRQXHlTXTUBa3asCx+mTk3d4Pr7O1eEQWQS7hht/IhMO7Qpu9funx8bF2WFv3GstzIyWBEQTx0qMADxzrVumvB1OrZgBRLO6YrqqcfMb39ZyjM2ilzouyI6oMq9M+xi7S7GOZIEQvnjMfD692wEa+eldaUlMi1WHjNXmUlLODjkMQcLF+3CjePSF/fk0DpfFRPeJNN/neeWeTT6x71RvrVJjHN00OWx+btdQjEWJzrWaDjUs2vqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sn3Z4v3d7zp5U2vti1jUIUhoYZROnA+ptDem2+s5P/M=;
 b=YBh+3iOhiPkdWSMClW2DSXCuj3ArGGixs33SGfn8xcu5Do1PiPygPgUreWQg8Hv4Ru/cgFl3dYAt0A258Q1NTi6VScSYpVC476D4+3D2ZMPcAAK4r4o7upKBlbxGXG8JS+bT8bB997u5PP+ENHyELXd9GwinGUFB5fNJ973CIrB3kV1B496gKvg/7lCPSTWtKrQvxp7CaF0sXbDP4nduK3iuG1MdajBrxN1vb/sdW57enjdrfPkSKbQwawPuMlyMkYCBgZsO/1gL53bI6ZQmG/V1nKH3K5a58q2iJJ5sID5IDbj8L+7yFMAMktcZEg6t6ONDU3wtMdngeTAXW+Zl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 21:14:05 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 21:14:05 +0000
Content-Type: multipart/alternative;
 boundary="------------RRDmcM3EuXROG0ae8pRNt0KU"
Message-ID: <12e2c571-da8c-7d47-03a1-4be85bc9a3c7@windriver.com>
Date: Wed, 27 Sep 2023 17:14:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH V2] glibc: stable 2.38 branch updates.
Content-Language: en-CA
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, steve@sakoman.com,
        Deepthi.Hemraj@windriver.com
References: <20230927104659.2900531-1-Deepthi.Hemraj@windriver.com>
 <20230927195200a7a1ed1e@mail.local>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230927195200a7a1ed1e@mail.local>
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a743e73-3778-48d9-8fac-08dbbf9eae00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pO6XzaRVtzeCIE6yC5Q0ImlIBTp6NhBNYxUGqPBpn8siWWjOrnjOkIWDItLVlBsx1I+xX4FfTR1QDvMgBAPN2dbjYgWqU+99Nv/COFXrAQz5jl8/n5oi2egTyHJ7kIEpFodALExCvb0NGX7rxnpkFM6grBfk6GTIVvnNHF8FSrvrMT4vfGGijQtqngMSXBOJ2+hI6kTzztAEB35L84jf3nO8dLrDEr1L3yis/zjZ4gJ8w6NStoaxbz+8rPRPI/5o8YweqofskX4MUwGTib8DFPgRk34n+hXDQBCHt9sQ+zydGDpPQWj2n2/ZEHXMVXirc4q8n0+znpvhYO+l2tUrswti8wzSowJBcZGdTKmhIKv5SplLQDmyd4KcZj3wG29BiC6oceMMVT4NPqIWD0VwfqrwCqi7b+U5ifSOGd1hu+ZdrLZJi2OCrTH4L3UEIa+cQ43tm0VjVizcsTS9Zd20vCfQ9l4Z3gFdOwnCQuWBMwUwA/aMDjx0laGy82WBgYVedON86s956USNITrQkDU5Wa/n0rGE4kRy97CG5/QVoNXDL0dHm3H/6ISZ4sep5+JLARyRKNeWTZ9haFb1HrPRFbwpFIF+hDjHUNtAUFHeE2K+pY0YSix85bDgd+1LOTp0jzwQl3wMaor2MCs/5VjqqHaoSlbDGbW0iY8q0iWy57s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(376002)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799002)(451199024)(41300700001)(6486002)(6666004)(33964004)(66899024)(66556008)(6506007)(6916009)(66476007)(66946007)(31686004)(478600001)(966005)(53546011)(8936002)(6512007)(4326008)(8676002)(36756003)(2616005)(107886003)(5660300002)(26005)(316002)(83380400001)(15650500001)(2906002)(86362001)(31696002)(38100700002)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cll6Y0xaNkhmUTNPV1poQVBmSGREZitxckhCMTY0aEhkRGhSTE9MNzQ4Y0VF?=
 =?utf-8?B?YVI3ajhnM29xZHZpaEtpN1prSDBKNlpmN1p4bVNiaG05NUw3Vjd3VnB2bWhQ?=
 =?utf-8?B?cmc1ME1nR0N6VkQxWUExMDFEd3Z6bTRycGZBK09qRkFUT2EvM1F6LzBWUlNO?=
 =?utf-8?B?d1J0SXc3VHpTWFdiMmprUkRnd0JtamJxZm9FZkVyaDdUQmd3c01nNEFsMTNG?=
 =?utf-8?B?YkQvcHd6dWpCbStaeWxMWDh0SnFrb21keWtWUFFYOVBCaUpxenkycXdGYjBG?=
 =?utf-8?B?eXdBTUxTM1FSejkvUkx6ckFSSzNzOVFXREZRZEo4RU9EcE45cTlnOENLSFRJ?=
 =?utf-8?B?eHhqRnRKbGhWTmRBcC8zcVBIdVgwdFZkWVp1Q0haL0ZQZm5DSXVkNWVvY3No?=
 =?utf-8?B?VXZRMGZxWWx1WjNUZEc2c0JEMll0VmpqK0RsaEVwcFgwK0o4ZXUybEs2V3JE?=
 =?utf-8?B?RWUxcGFpT1k3YTJQdXlHOVpvQjFRMjFYbVk3TlYreHlaRVhQUlFiK2ZUcFNZ?=
 =?utf-8?B?dGpZeWNqeDMxOXNRR0JBLzBUakZ6eW5JSnlPN1hubXByaEJHbkZuR3RteSta?=
 =?utf-8?B?Sm5rQ0lCZW15dEJuT3VVc1o1SmVhTEVOUkJTNTYyRHlMbWkrblJxUGY4VFV0?=
 =?utf-8?B?M2FQdDlrR2w4TWRuNUJTR21HMzRWZ01kZzlKWTE2dHlaR3lLZE5FcGRXc3NI?=
 =?utf-8?B?V3duOHVsdHE1Zkpmckxad0hXVWh1eW4yK2t4TlRTcEZaU3ZFVjBRa3ROcUs3?=
 =?utf-8?B?RFVUb281SjlObWJjeFZpSEEvanZqSnE3WTEwTDBPa3hGZVlTMDEzdk1FYUFQ?=
 =?utf-8?B?VHpZSUhvd0diZnE3MHVDdE1YeEpaT0Vtdll2Y1dJNHQ2RGtDZWlzNXZIeE8v?=
 =?utf-8?B?dExJdWJGMnhsM3pIc2d3TTdnaEsvS25WVHo3am13MGUydlV0TXhLN2QxV29N?=
 =?utf-8?B?RkVPQWNYR2Z4TENqSEc4N0Job0p0blpLNzI0N0RZTGhOeGN4a2E4WGZsQ24r?=
 =?utf-8?B?TE11aUdvSEZ1L2J1UndEWXpIUEdsR3FsL0VvMFRxTE4wTlNram00VUFocFVG?=
 =?utf-8?B?MHZFNGJ1Ukc2R0Q4TGdvNFZTaXUxWkd5QVMxT0FBYnVrQ1BRcUtjempuZEgv?=
 =?utf-8?B?d2ZDNm5BZUd5Zld2R1dIK1Vtbkg4aFRuazZ0WmJKMEhMVjF5enF3RlhLa2Fq?=
 =?utf-8?B?OTh6ZklUR0txNk5RcDVhemYrbk1Wc0xINTVtajhvRzRUNEVKN25RYkRPaXpU?=
 =?utf-8?B?RDNwcHBXOER6bTk0WUQva3pWSEtUK2M1b3JVV1pibGZWQ0NObTloTGQ1UEg4?=
 =?utf-8?B?KzljQUpURzZGUUtYTFU1L1NESHBIV1RVNG1PY3dERUR2VEZyMkgyVXpGclZJ?=
 =?utf-8?B?cGJJbnNyM2cxYncrNklkdkVrOHlxNVQ5WDBXaWZ4cU9wSlFjZmhFYkhkVjNm?=
 =?utf-8?B?dy9qLzZOOUV1dDlYbjdaOEhHOHJwQ2hJV0JhY1h5bjF3UUtOVmdqdEhuUE51?=
 =?utf-8?B?dUl0anB1U09KRWlXVzdKMHQxRkRBVld1U2J5UDllak9QcWkvN3J3OWJ1YXA2?=
 =?utf-8?B?NmViRjMwbmN2V1QzYW5kZjM3RGc2N0J4ekQ5T1Z5YzR1YllWVnNoWU9CQXJG?=
 =?utf-8?B?d2J5NFhZa3Y1OFRGLzI0S1o1UGhZOGpSNSs2ZkcraDl6cFBGQitFN3dWU2Nw?=
 =?utf-8?B?cVZnOGpzUGZwKy9iWmRzT0IyNTNCUGVSTkdBY3VldnlxSGd1QjQ4eXIwZmNT?=
 =?utf-8?B?bmhObHd4Q05ESGlUa1JRaUt3WlBPVFBpYXpKbVpEb2pkSGdwS2VFSGUyV1hX?=
 =?utf-8?B?dm8vQUtXeWd2cjZZRGZQSi8zdVN4UHRQaHY0R29jeG55c0RkSWtjRmhTeVZj?=
 =?utf-8?B?TWVTcHNsclVBR1JpQ2J3T1dlRlhhRTVPS2loV0REME82MFdTaTVaWXhQVnpH?=
 =?utf-8?B?YlU5a2kyUU5mZWZmbmZRYnJWK0Y2SXFyKzJncjZWQ29idHNxRkVBS2NDdm5j?=
 =?utf-8?B?RmxURFFzNFE4Vm5PeXlVcGNLWEpmTVBoOFR6ZWRGWFQ3OHpKQUlFZkdjazda?=
 =?utf-8?B?MENEaUZlSUUrbXYyY2VsckI5bHFMR1NXRk8yTGRsS3pBSVMvbm9lWTduckMz?=
 =?utf-8?B?SGpyWDFQRUFZTUdXb3ZDSkdOOWNzbzVCZzgrWWdWSENhSk4yYkhub0VmRjVM?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a743e73-3778-48d9-8fac-08dbbf9eae00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 21:14:04.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d10pM2XQ6sFPHvIpC8BKIhych4SO1908Ii8e7isxh+KhAbCcdsEg/rdRCpkp1AoUvIwOSeZnSV2TjcFz4BWrG/bT90rDo2IaZi2PeY6Qa8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
X-Proofpoint-GUID: _8jIoES-IOR3ehVpvf3WaWkL2ufXzf2p
X-Proofpoint-ORIG-GUID: nuBxYrrHdaZ63dJypR3eLvcGHIqxp3F0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_14,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 21:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188345

--------------RRDmcM3EuXROG0ae8pRNt0KU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-09-27 3:52 p.m., Alexandre Belloni via lists.openembedded.org wrote:
> Randy,
>
> Can you please ensure everyone at Windriver that will contribute to YP
> has setup their from identity? This is described here:
>
> https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity
>
> Thanks!
Hi Alex,


I've broadcast a summary of your email, the link and content internally.

If this continues next week, please just reject any patches until people 
make the change.

../Randy

>
> On 27/09/2023 03:46:59-0700, Hemraj, Deepthi via lists.openembedded.org wrote:
>> Below commits on glibc-2.38 stable branch are updated.
>> 0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) manual/jobs.texi: Add missing @item EPERM for getpgid
>> d94461bb86 string: Fix tester build with fortify enable with gcc < 12
>> 63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug 30694)
>> 00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
>> b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in no-aaaa mode
>> 89da8bc588 NEWS: Add the 2.38.1 bug list
>> d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in link map
>> 750f19526a elf: Remove unused l_text_end field from struct link_map
>> a3189f66a5 elf: Always call destructors in reverse constructor order (bug 30785)
>> 7ae211a01b elf: Do not run constructors for proxy objects
>> 92201f16cb libio: Fix oversized __io_vtables
>> 5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64
>>
>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> ---
>>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>> index a907444f50..f5ebbb2ee6 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>>   SRCBRANCH ?= "release/2.38/master"
>>   PV = "2.38+git"
>> -SRCREV_glibc ?= "1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1"
>> +SRCREV_glibc ?= "0e1ef6779a90bc0f8a05bc367796df2793deecaa"
>>   SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
>>   
>>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
>> -- 
>> 2.39.0
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188340):https://lists.openembedded.org/g/openembedded-core/message/188340
> Mute This Topic:https://lists.openembedded.org/mt/101614685/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------RRDmcM3EuXROG0ae8pRNt0KU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-09-27 3:52 p.m., Alexandre
      Belloni via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230927195200a7a1ed1e@mail.local">
      <pre class="moz-quote-pre" wrap="">Randy,

Can you please ensure everyone at Windriver that will contribute to YP
has setup their from identity? This is described here:

<a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity">https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity</a>

Thanks!</pre>
    </blockquote>
    Hi Alex,<br>
    <p> <br>
      I've broadcast a summary of your email, the link and content
      internally.<br>
    </p>
    <p>If this continues next week, please just reject any patches until
      people make the change.</p>
    <p>../Randy</p>
    <blockquote type="cite" cite="mid:20230927195200a7a1ed1e@mail.local">
      <pre class="moz-quote-pre" wrap="">

On 27/09/2023 03:46:59-0700, Hemraj, Deepthi via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Below commits on glibc-2.38 stable branch are updated.
0e1ef6779a (HEAD -&gt; release/2.38/master, origin/release/2.38/master) manual/jobs.texi: Add missing @item EPERM for getpgid
d94461bb86 string: Fix tester build with fortify enable with gcc &lt; 12
63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug 30694)
00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in no-aaaa mode
89da8bc588 NEWS: Add the 2.38.1 bug list
d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in link map
750f19526a elf: Remove unused l_text_end field from struct link_map
a3189f66a5 elf: Always call destructors in reverse constructor order (bug 30785)
7ae211a01b elf: Do not run constructors for proxy objects
92201f16cb libio: Fix oversized __io_vtables
5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64

Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a907444f50..f5ebbb2ee6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= &quot;release/2.38/master&quot;
 PV = &quot;2.38+git&quot;
-SRCREV_glibc ?= &quot;1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1&quot;
+SRCREV_glibc ?= &quot;0e1ef6779a90bc0f8a05bc367796df2793deecaa&quot;
 SRCREV_localedef ?= &quot;e0eca29583b9e0f62645c4316ced93cf4e4e26e1&quot;
 
 GLIBC_GIT_URI ?= &quot;git://sourceware.org/git/glibc.git;protocol=https&quot;
-- 
2.39.0

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#188340): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/188340">https://lists.openembedded.org/g/openembedded-core/message/188340</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101614685/3616765">https://lists.openembedded.org/mt/101614685/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------RRDmcM3EuXROG0ae8pRNt0KU--

