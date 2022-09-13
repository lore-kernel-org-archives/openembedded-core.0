Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9B5ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 18:42:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1327.1663094537348683495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=of6uuAk0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6255b889b1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28DIGVQO000361
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 18:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=5n0k4wmWiqiNoUywCYqIv/4dqJw+clU3JEVcayCscbI=;
 b=of6uuAk0apmLl+uO6GTXxOZbNQnW+9x/vntw1zFTrJKnPfKyX0Fq3Wcu3abUdd88bq0b
 /rsBQDZSBX3RU7k+4cZRQxKpRTb8vUlT5o/ipUpdlbvskjD/sORO4UvSI+2vERODgbVd
 56l6TU+QS30oH3fE7v5U/n/7vlrdZ2RCV77sKowhHmvI8gt/wY9U9pYG0YgSoA2VTwOA
 Ayc2qvIlyt5l6hpyr4giazAMZXmfXT42jGBwfe8H4qe+kkCS2q98JdVof/sDyioLTp3k
 sUZ3nlBr0eDqhp4FGQeeyfyc4SdsNmrPylRTidlipsz709vlVDixo4N5nE2EYDLIrFMg Jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jjy0eg0uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 18:42:16 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DIf1GL023759
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 18:42:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jjy0eg0uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 18:42:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUGDw+A/Z5cdu34N6OVD/MvZb3fTyQP2YSHGLzXodSnuCcv6HuBognKaR1limRptX5BQA4t7QETe/tmeUnbLIv6TuI5Yp7I2ueAzE3G6KfLLLC2fWS3rYFRpYqvCIAojeNxul3t7DgiXN1SGypEvGkNnOs1UdHEdrUfkoiJX8GbFpnAxtBGlCNskjA29Mnhlx8nfU6BsvJpvMxr8EUYn9WD0YR5BS4NtIeCAjWMOnCv70WWdlJDUAJy+OnCqw8BWTqqgNga4Mh0jdk0dBgfD98H4O02P2mz6zL7rhv2JrWnqPj9uuJZrlsKFMR3B+xddojEHf3po/M6QaDQEjOTNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n0k4wmWiqiNoUywCYqIv/4dqJw+clU3JEVcayCscbI=;
 b=NK9w/Hmuf8wV8qOD5gB/SoRcjFfvOpx+te8mB5YnwQ3AyiDcfMbY+Q9ZFJjMytek39EesEGWw54k7DgVwWQwfw+m78tDn8eM/+mZk2Q94P7w9SyDAsUq4B8wh7+SajbYs2ympnHqjjrw2QqSdp0/3cDJrm6TyrE2qlpUfqTPo7ilPNsoEihCokx4S3aCOyoyFzLWcsJnCpFPlvJHGxRo0SJAe1RP75G8d3tIUDjBIjyj+iOCg8nFY6d7eGEHoN51UjkDtT7IR35FsCEAzcpKEWQCgWe81voom4mli6JJTj8iAg2TJG3owJ2m4PBAsuB6gnxX51xFV+X2GHx3uQW6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 18:42:12 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 18:42:12 +0000
Message-ID: <7cd419c6-f3fc-6ebe-8dee-ee969d26e88a@windriver.com>
Date: Tue, 13 Sep 2022 14:42:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [kirkstone] binutils: stable 2.38 branch updates
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: 
 <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
 <28994.1663062196921833526@lists.openembedded.org>
 <d96f949e-99f9-82e9-088e-d351327adba9@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>,
        Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
In-Reply-To: <d96f949e-99f9-82e9-088e-d351327adba9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: b536241c-4867-4fa7-b6ec-08da95b7abd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3nmrsrWce5tc9CQdVmD/T0UkzCkqkgf5o2nfOZCseCbe4jayZWTK1igzv6Mxo177fx886bFalV5x4sue+QLYgFwGpo5w9KaNB+9dB+2GxoJFIirDACRh7cJzYd00YhdqKiW2J/73o5hxvmSL124WPMglC3FaiFxEWpJXoS5VlA0CWnC+SU0UkI7GPyV/jJFkia89DFmkvs3dLGRduYQcQxvUmGMwvvJzX2z75UJ4eJhe1RGelIitYbzzWCKeBdj0b30X99IK2dRwVGxb5/Eie6agZdp5ccvBXyePodckM2ILOQekeLlsDQ+vmxRWH+pfc6ua6nQaBSUApdLRb9laoq1ouHkHWP/cLHzr5RUXCWOqVc/q2XeBM+VTc9T4eXOQf/8BjGqQdosYl1M1eUEQwC+iTEvDrz4w7WZ2+aPUB4qrxgc4uQzbyD5xQZ2cenfhsaXz/kvfKHMdl6p2+g/nzpjkrmrwoTp9FY5Wa026PGXbpkynWWXmXplTq9lreS4qdzS54CACcbovoM6MPFt0r6tF+GTF80xWOOyXjfgl86kAhhdWYIAY9yNPWj28sRy9FqdLZvT5Pk/O3/8S4Q0F4yI+8tOCNHPdiGXgX/XP3yUKhlq5+iyacsz9BplXXZ5nuLWYI//kVwo/WmJ4wRpH2ZqNBQeh27UvbLXC9uEdOB+XM5VmGRFg0t+YxCmHuwLnAr7E09y5wEbVCKQEt+ZYv2ibgoE/hPa8wS5HtsEbQTuoJ3v2JnmWn8/HESQA8R0N5dNsWzgKDxoWmaWq/NF+F45vBTG3U5RHpq6XeIOkIVsL79mZwoW4RfPKjqFVstxTaLRbkUkXJzF5r27pMO2+RNpQcoUBjYXlMDs2M7d7Kd0kkD2MYc+euTdWm/2AhhGa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199015)(31696002)(86362001)(6862004)(8936002)(31686004)(2906002)(15650500001)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(186003)(41300700001)(36756003)(6512007)(26005)(53546011)(2616005)(37006003)(316002)(6506007)(38100700002)(6636002)(54906003)(966005)(6666004)(478600001)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnpWdVRWaDNLUFQ3QXFjaWxja3VKNFVVS1c0QXpsM3Fsa0t4NlBPSXozWXFm?=
 =?utf-8?B?VGxhSHdKUVMrc1U5MzBtWm5VUnREYWlHNUhTUDBlSzhSSDljNXEreDlUY1RP?=
 =?utf-8?B?RUgxU0EyaG8vcXNNOXZncDVSUnlubWtUSGVzSStYZHdKRkNWSVZMNWw1OUxO?=
 =?utf-8?B?cFJQM1lsci9nV000Y0dsYlZ6ME5nRjA1OWpqTHpEcVc0NklzZktnK3M4WUxi?=
 =?utf-8?B?cklaRXVxaGRzZE0zWkpaYjg5WmtsTHhEZXFybUNpTXNjYWhtZlFCT2FKY3Fn?=
 =?utf-8?B?R1daZHM3SGszTTJEelJpWU14ZGRQSDZpaUszYTlycyszV2FqeTIzL1VCM3Rr?=
 =?utf-8?B?aFFRcUNKVm82eUROWkhlYjBJSlY2ZGwrcVRIZnB1MWhmeDE0K3V1dzQ3TmZn?=
 =?utf-8?B?bEh2Ynp4aHN5N0RYSzdtM0UwK0Q4S2NPMmU1NkNodHJEc0pxK01sR0ZWZXQ5?=
 =?utf-8?B?VDdKNHBiVVBMNGFUbGFqVWk2R01XOXZnRE82Rnl5aGY4b0JRMGFUQ01UaFJi?=
 =?utf-8?B?MXVpK1JwOW1mTEowVjczUnNPVFNaOHYyQUNubGhzemxoMDBIdnF5RDBUOWM1?=
 =?utf-8?B?aDlaNEVucDZVK1kvb0JxbmdQOWRRbFVEZDNpbXpkc1M2QWgxcTUzQit2UXls?=
 =?utf-8?B?ZnNVTUNDdnV1OEpvNkd2dkEybEthSU1HTHhNMHhEMjdsTWdCNlU3QVNwV1Rz?=
 =?utf-8?B?NkJSQXBVTE5HY2tjSStoQzhPUDdMTHJUNnpwZURwZEFmUmdNb1FocXVhZWZ1?=
 =?utf-8?B?TnNlb3ZjZStGYVhRVEx1ZUM4bTVvZXhBQnZpd3NsY3JnUkRBZmFCRDA2V052?=
 =?utf-8?B?eWlyZ0FidEtDWEZXNUdscTBEQUpLL0ZBdXNNbGFaS08rYnJjWHFidFBVcHJS?=
 =?utf-8?B?NEI4aS9idnZJM1QxVEZjNVFES2VhWG9VYytPUlVXZTZYdjBBME1oTWtIYUpj?=
 =?utf-8?B?VldvcU9EOFZsM1l5WkIzcGdtdE9qL041Vk12anRMZFNXei9qQXpzbnRKaHJl?=
 =?utf-8?B?RFpmTkduWEJibzJqVkh4dXBRemdjR25KelNXb2lKQnBYbUttZEpQY0cyeFJm?=
 =?utf-8?B?MDZSVjU5ZHY3WGFtUm1aaklTSzZ1emhtWnhPQWZXWUttNjlPRXovUnB6cHV4?=
 =?utf-8?B?QkpoeGI2OWNlR3JnNWh0am0wd0FVajRFRWZHeUJ2ak5CTlVNUmN3UnRmbmtK?=
 =?utf-8?B?Rk9haU80bjdleW1lcEJqQUhWL1pXL3hhUmMyaDhsd2hJVGhiNUtpRkQxaVB6?=
 =?utf-8?B?dnF0MEsrUzQ0UWo4b2I0QTVCNjB5dWtxK1hOL2FCL2tlS0dZTER6eXNEZ3B1?=
 =?utf-8?B?SjB1RENBMVR1WjB6cEFvV0lCTGE1cndMVHVCNURFUXpBQU5mUC8wVzAxMVEz?=
 =?utf-8?B?eVdkMmtEM0lWUzZwWDJoeEZDN1hPaFdLWVhzaEpzUkhwcXI0Z3V0UkxiQ1dm?=
 =?utf-8?B?RHZNSzNlbVdraWhML1JNU0NCMVZsTDVrREZhbWZ5OEoyZGRNbzcxUENla1c3?=
 =?utf-8?B?MGlMMXVvdnVQemJuU3JHTXgxbUFHOXlwYzdhZUxoZ1Q4RjFNMlp5c0t6bDZT?=
 =?utf-8?B?ampFY25IaElMcFREdVZLMm5jWGlWbURzanZOcXB0MUU3TlRIZTZrMVJhVTRV?=
 =?utf-8?B?dTNtUTd3RnB4OXVUdHE0RHptOS9kMXQycVZHS0N6aWdicmhXKzNnYk12a2JS?=
 =?utf-8?B?cE5OK2M5eFJPQU96bTZaY2tMV1gxaE9PdEhHYzZ2SXorendBSy9Sb241UjFp?=
 =?utf-8?B?N3djUWlsaFNER1dhTWJZaHBzdlNNbXA1RFNXakxmQUxQVlQrYk5iMXJSU2Jk?=
 =?utf-8?B?L3ZkUE80emIzczlIcXlNVTZaeG5CU1M5U0lwRkxiVUlTWCtObFFWRFhkMVIv?=
 =?utf-8?B?bWZGQ2xKQmk1Smg5VHEyK05VOTV4bk5SdFF6SVdCb3pqZ2tHR3FMQ0d4L0FW?=
 =?utf-8?B?ZlpxTFpWaGljbU5mR3QwSC9lbVRRZDgwNWVMQVZ0c2pDalk2dDMzYlhxVnBj?=
 =?utf-8?B?Qk56WnV6S2xPSXVCWnVIK3hDQW83OFF2R3Z6ZzBpcE9RanRQbmY0SGV4bmdZ?=
 =?utf-8?B?MEJycWxpR0IyRHFybGJFdStpVTJMaVc4ZnB1d1hQRjJ1cHBPdXdlUm5EdWtq?=
 =?utf-8?B?UzRyTnJDaVVKa1BFV3VvemRQOFFxUVRKc3NWTnc0RnBzK25pMXN6OXovQkUy?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b536241c-4867-4fa7-b6ec-08da95b7abd6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 18:42:12.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m8dIHOyVavPHoPzLnv70EFHDMilVurZPVjUIjRSQpf2qZTTsdC9nqnC5v0CiR+wOac+aE67hQqE9/yYbNQ69kjHZSollh0rq8g2tyDy8mo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-GUID: nbSPRoseTva92aIVFQk-I9xIKjD4fpKn
X-Proofpoint-ORIG-GUID: mc98pOdVXhlMwIhutDvaEGH6UHlcwipO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209130086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28DIGVQO000361
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 18:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170605

On 2022-09-13 12:59, Khem Raj wrote:
> On 9/13/22 2:43 AM, Sundeep KOKKONDA wrote:
>> Hello,
>> I am planning to take the gcc, glibc & binutils updates to Kirkstone.=20
>> I found only the glibc-2.35 branch is having a few updates (given=20
>> below).
>> /f8ad66a4ca nscd: Fix netlink cache invalidation if epoll is used [BZ=20
>> #29415]/
>> /9e960717e1 Apply asm redirections in wchar.h before first use/
>> /577c2fc7f3 elf: Call __libc_early_init for reused namespaces (bug=20
>> 29528)/
>> /83f1d9851e NEWS: Add entry for bug 28846/
>> /cbd8685e82 socket: Check lengths before advancing pointer in=20
>> CMSG_NXTHDR/
>> /4bafc4001d alpha: Fix generic brk system call emulation in=20
>> __brk_call (bug 29490)/
>> /37fd2ac665 stdlib: Fixup mbstowcs NULL __dst handling. [BZ #29279]/
>> /a1ec4157bc stdlib: Remove attr_write from mbstows if dst is NULL=20
>> [BZ: 29265]/
>> /813a8d0171 Update syscall lists for Linux 5.19/
>> /e200127c6c riscv: Update rv64 libm test ulps/
>> /8c172a6cb0 dlfcn: Pass caller pointer to static dlopen=20
>> implementation (bug 29446)/

Ideally you'd get that in this week since I think that 4.0.4 is being=20
built on Monday, September 19th.

CCing Steve in case he missed this thread.


>> The binutils-2.38 has no new commits. And, gcc-11.x also not have any=20
>> new release after 11.3.

That's good to know. I was just wondering if there was going to be=20
gcc-11.4 so this info is timely.


>> In /master/ branch gcc_12.2, glibc_2.36 & binutils_2.39 versions are=20
>> used. Kirkstone will continue to use the old versions?


To answer this more directly than Khem. ;-)

The Kirkstone branch will NOT update to the versions shown above. Users=20
want a stable version

for the supported timeline of a release; some even may be surprised that=20
we update from 11.2 to 11.3
even if it's all bug fixes.


>>
>
> the glibc fixes are good so go ahead bump the SRCREV to latest on 2.35=20
> branch

Agreed.


> =C2=A0major version backports are exceptions. We can consider doing mix=
in=20
> layers if needed for say newer compiler.


Answered above.

Thanks Sundeep!

../Randy


>
>>
>>
>> Thanks,
>> Sundeep K.
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170603): https://lists.openembedded.org/g/openembed=
ded-core/message/170603
> Mute This Topic: https://lists.openembedded.org/mt/92739561/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


