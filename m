Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E18C27C76
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 08:03:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8923.1674892995768212185
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 00:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=VpEpT5wf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0392f8f93e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30S83F3N022403
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 08:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=trseAalb8Z3dEY2Bp8p0riVrW/8T3ffZV6czwjF2MW8=;
 b=VpEpT5wf4jbhsOELBLjlLYuyi19g51XITPwrMOzQqaXrQ0QG0vcHi75ViHnfhhR6RVDh
 Gyo1/AYiiU6JSBPwuFxFAtrm/YywdxE3X3lInxLgq82rfNdpNcD8nbPwdvNQyPzBVjOt
 suZUQXxGqfst1HMxbttfQwWUdP++Qd8DaV4jF8Q358c9XhXZrTqYful/acrxjfETm8HB
 o6SGKQYbnUbvrRxeScFv4OsXyWSFp2nbC/f/2mg9UGQM2YATD1oa7g78bBlnjtDCrR7x
 oOVkqUAlZ28NYC/5dpPoprAMCRzL3eCAmn5h4a96wnF5gyxbj/zBMq6WEoPHjzSRQ9yG Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpar8ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 08:03:14 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30S83EGe022397
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 08:03:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpar8eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Jan 2023 08:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMjaVxCE9SDw7coAgvmMGOeW8GZ40HMwdPTKBFI5EY1oQghmBlyI7/HVRvM+VeilhsijKWwjO3B41kwaByryXwkS1eUX+R3WRFmI+MBfDeeq8t5wl9grRLwvjpiPm0x5nGD4WiM6oIEBGECvKdLu1VZnjllONcYDzc0XlKPo2LfHDZGAJYrX9sJcFM1RDkqL5Wm9Tdr3XAtPV72lBNY7CXoDVDv2gdEyM6CQG2ejwiiy8s6VEkeVE/IcaN/XsjMUBTrkSbAgGJ341BpbJvCrwItTYIEciltnPIjJX+PItr9DuqN4clN4F+p8rS0SMEyArVKph7KmZSSFrJ5TrkFnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trseAalb8Z3dEY2Bp8p0riVrW/8T3ffZV6czwjF2MW8=;
 b=f+wnhlLBH9dpYo9jSBHqrMVERAtrzCSYDoKHMqNOoS7HFJoXdnSsb2nhEoJMj5cOUnzXq8Ugizb1lHzVvbX7oi1PeCRi1KhBZn+M4B6FrBkuFlmz6SZdAXhQWs7QHaOQhU5zJrtTySSu/HLBGVfzI8kSxvPHmw07PyDJb05sL/HXJXgNyp3ZMaZ+CAlnL8GotZLMqU0oRWNTL0rNvsc8aJb25tRVtuHLItrOiak724v37s98ANB0zzj2+8yjTrsvpEEEQgrJCurta93VCU9ZiyMRCg7ZI3svKVE9cl3RAK38O2Q9z3nO8wlvplAdYVWXSAByW3SPPqgQpbmJhe4Uiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6SPR01MB0087.namprd11.prod.outlook.com (2603:10b6:805:2::18)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Sat, 28 Jan
 2023 08:03:11 +0000
Received: from SN6SPR01MB0087.namprd11.prod.outlook.com
 ([fe80::e0cc:c910:fa9b:d927]) by SN6SPR01MB0087.namprd11.prod.outlook.com
 ([fe80::e0cc:c910:fa9b:d927%7]) with mapi id 15.20.6043.025; Sat, 28 Jan 2023
 08:03:11 +0000
Message-ID: <37fd9f16-929e-4e1d-9fc5-1fd33cf3110b@windriver.com>
Date: Sat, 28 Jan 2023 16:03:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com>
 <Y7baMI4MLdLKahf+@mail.local>
 <a690d84f-aa54-4187-e0dd-780a966cf454@windriver.com>
 <Y8RwajkarV+GAz+O@mail.local> <173BE13D4A763969.24231@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <173BE13D4A763969.24231@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SA9PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:806:24::10) To SN6SPR01MB0087.namprd11.prod.outlook.com
 (2603:10b6:805:2::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6SPR01MB0087:EE_|MW4PR11MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2ab3b3-dcde-45ee-ad11-08db0106196d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TMZlm2wJj6QeQVf8x7CU22TF8aCJ7zO6clXxzDm7rw2p1KRauxV1zoQBZRpzR7iaslvQ7chzahqIfyg7fKMSMyWQzNmUdodqcFWUfELnKfwocODKp3MTkx5PfF8t13ay/nL75+/S+/yjAX6r5rsTnZgWZUzsitBBQ3AXXB/vfn38OVjk+M1FM/c6Q6PC2FgeXcctaHWDQ8NuDO7LkEb12WMq6t9rZdQweGJStgEEDvmA0CIITqyhfGTTIXEy4DJ6oj0cC+IruZrswi7P8els9RlYPZRU1Urz2NEymBDewY2rKUUUIj7GdlqzgHnGJCTdrswWUTa5qNgej4BNvkp/GfSmHstx0vJ8kOl7OJoP7G80ZKmCa2oFgEUh99m1LfuwwWqfGSGljUhERyTFJpr/P7DcIXh/cfqqAXMA3XSOIp2+bG1hVu1yBW1+jUxVp/NjsV1u/+2grOPF+KywvXAqWNTU/LxXQ7tAxHoWx2cs8z6zAJ9ETo/6RLymQBtrm1FIHy+jMSd0mdLPasbyH9pjx82BXoAkIJ1uGSt56n2P3vbU21nZQ/E6gXzzqqnhND2yYrPLqIvkrv6fD4hMESEEcASdaNqdLi7sEjJG0o8w1p+heEEtvd3G19Ij7GU1u2GJcAkEMu7PuWPhfmUhvmtoujEwJFS5uCqheDRv537uJnaRqMGDSPBuECDboQpqrbDaQJD+ofxUq29y0aAepYZWFQb2A7GQDaa5rZkj1uRIgZQQcjmcJ8JWoLzYW7ogKsa31kQ2s00HyB7pagECeh8fbLOzX64MbH3XDJXLP2tdEe8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6SPR01MB0087.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(376002)(346002)(396003)(136003)(366004)(451199018)(38100700002)(41300700001)(8676002)(66556008)(66476007)(66946007)(83380400001)(4326008)(44832011)(2906002)(8936002)(30864003)(5660300002)(36756003)(86362001)(31686004)(478600001)(6486002)(966005)(6512007)(6506007)(53546011)(26005)(6666004)(31696002)(186003)(316002)(2616005)(66899018)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmI3Tis5QWtTcW9GY25hYm9HNGQvRVZaZHlGY3U0QmV2b3YxTW05VUQ1Umc1?=
 =?utf-8?B?akorZ2ppdE1YRHVGMXVRU2hoeXA0cXcyN1dLSmN4SDYzZm9sTmFTWmtVWTlw?=
 =?utf-8?B?NnVSVitXYkxwUE5ySmJ5OE9mM3VqYkVkRmJaSUtPYWptcmc2dXMrT0c1Y2d5?=
 =?utf-8?B?MFlFTHd4UzdUYlBBeGFwTjEwd3JlYmtyOW54WnVvcnN1bDNzZDlYTGdmdjNa?=
 =?utf-8?B?U3ZLeDhKakNsbjlIeVphQms3d0dxQUdYZjRtblJGcVExVEl3ZW1BRE4zSTdK?=
 =?utf-8?B?RzZJMHBlUkphN2ZRTjhFbms5R2lxVjI2bTZsSThxOWkrOHdkWmpJRENiaFVq?=
 =?utf-8?B?L2p5dVJoM1JUQXBlZGE5VWtmVnFaTTdtYVRoUHBmWUh6bStkOGNCbloxaE41?=
 =?utf-8?B?ZGcvOTJuWWtTcFdXQ2Z3dllXd2lTQjRWK1VoMGtRa0Y2Wko5aWRXaExuVVBp?=
 =?utf-8?B?cHJTOFFQRXhocXQvYjlGQXZCV2swRmxyZ3l1U1NoUGNGNC9pTDBtYmo1VzU2?=
 =?utf-8?B?Ukh1QmVVRVRCTDIwYzdNRHZQbHFuMks3dkYzVHFkQkdNL0Q0N3lycDRHUkFJ?=
 =?utf-8?B?aE1rSHVEbDM4K2htcUZ2Wmptc0o0aFdBYVpJN0JBNnBiSnVBdkxhdjZoMTE2?=
 =?utf-8?B?NC94ZXVjQTVHVC9WMXhWbkVwbDhuWkw1emhxRS9zbkFJYy9wak1oQ2gwemxW?=
 =?utf-8?B?RFpqelZ5emw4SFRSc002b05CNWI1bmZjakRHZG95TnRYYy9CS1lLRTdUcU94?=
 =?utf-8?B?a3NzRzVhaWZGMlZESEtjWTdyVnYvckNNZjJTa0J4QmJBQjlTTzZpdW9seWNS?=
 =?utf-8?B?Y0p0by80Z0haMUh3Z1k0dUVRSFZtZitMUHo4RjVaNHZoSCtTc0IwOVRGdGRW?=
 =?utf-8?B?eEhXbTlvanlLSURreUZBbFJGTkFhVHFOQTZFWitwY3FEVkY4aDNrTkZXRTVw?=
 =?utf-8?B?ck13VTdXVlNpRnVlWStMenRPejF3bE90RHRVbTNUV1U3bjBVZEpuUVQzTjdE?=
 =?utf-8?B?RUJhelJmS3dlNFFtRnRtRXpmQWx2RCthNGpJaVN4REhpblNPUmV3WVlybDVI?=
 =?utf-8?B?bnMvQVJhSk10elk4L1gxQW9EQnh6dlIvYU44eVhQeFM4WDBnYVV6cEk4bFl5?=
 =?utf-8?B?Ky9wa1dLOGJkWXJUSEtZYStpWFAvVWkvZEVNa3hWMy9NRGFyNWZDS1ZUT0Vu?=
 =?utf-8?B?NGhuaEMvYlR4N2NYTXgvZDd5TC81QW1aRGpLUGRjdHZCWEdmdFNCeXBmUi9X?=
 =?utf-8?B?a0o0VWxTTmVKWmlQbmlSRkp0d2MyNCs2VzVCSjh6WkRrMEhVS0o0K09SdnFH?=
 =?utf-8?B?NVV2ZHJueEkwd3lVS0JadGFLZTlrUHNIU1Z0Y0t5L2t3b2NtNFdOOGJST21U?=
 =?utf-8?B?TGYzZGF2Tk1uWjRDdm1rbU4xZWhWeHd5MFVlc3pqY3RIV1ZGVFk3Q2RFU25Y?=
 =?utf-8?B?V0xDTkU0aS9kMkhXYlVOQnBuUG5TY0VCb0RKUkRrejRsWGNkUklWTTdiYWdQ?=
 =?utf-8?B?SWhVUDMvU1BCaXNZVnlXbEFPTXduTmFhYTZ3NFhvSlVIMlFuMVNaSTJORndJ?=
 =?utf-8?B?WXM3aGxoZGZ1ZDJrb1RPeWs5SXc0QTJ3eWoxc1JhUFIwKzM5cXhJUjhEVkw1?=
 =?utf-8?B?NVBSRTFuVlN2aWoxaVR3aVFLSlYyTTVtcjhMbVRvSytZMzVCNWZ6dWRwRjdl?=
 =?utf-8?B?b1FpeEVBV0xoVmdsMWhSYXJnOWpOQW5OOEcwMXRTNDBFTDZHRnE1SXYrNEpx?=
 =?utf-8?B?Tmo0RGxJUDlVMThWWEV4endNdERNT2FFMmRIK1VrVktzYWsxcU1nb0hxY0xQ?=
 =?utf-8?B?eExDYXFrbnMxYjdhT2NLL3hQR3VjUzh3RlpxbzRybHFtNmFNNWQvcGF6RUlU?=
 =?utf-8?B?VVhOejFETThQYzk1NnlyeFRuUDQwY3NIRStVYlZCTHdIZ25wVEwyRXNhc09D?=
 =?utf-8?B?TzRNby9jM25yT1U3cUN5NjBaRmFQTXBvajBjS2x0M1FlRzBPRlRVNmdXN2hn?=
 =?utf-8?B?ekxiYzdrYWtvRzBWWUhYS1RGKzVnTG5jTTBEUzVrRDZnai9oaEtRV0hSSHEx?=
 =?utf-8?B?R0xvcmQ1R09jTUFkdEUwZmxZQWFVTThOWEUzbEI4U0xxUXhaK2c4R3F4eldY?=
 =?utf-8?B?enkvcHhVczRHN2VkenhJV1ZvNnBYUEExU0ZqeDM4Z0x3Vk5TN0xmQkVIUkxh?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2ab3b3-dcde-45ee-ad11-08db0106196d
X-MS-Exchange-CrossTenant-AuthSource: SN6SPR01MB0087.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 08:03:11.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElIOjSTt9QLUOzVUnjsA9x9nK2K9c3ZrEIc0Yi2wSh0tidVJWXOOVOC6hpkffKVx4/rQXtelVLL3UZL/to9ymnZZxLmRVYiN+QjwXKvVJYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
X-Proofpoint-GUID: WaQxdZ67dy8kYivh4qr05ANhrQL-T99p
X-Proofpoint-ORIG-GUID: 9zMIPQgsUSeV7NA1wFS2soF934KBwAcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-28_02,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301280078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30S83F3N022403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 08:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176459

On 1/20/23 09:48, Changqing Li wrote:
>
> On 1/16/23 05:30, Alexandre Belloni wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On 13/01/2023 16:04:42+0800, Changqing Li wrote:
>>> On 1/5/23 22:09, Alexandre Belloni wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the=20
>>>> sender and know the content is safe.
>>>>
>>>> This fails on the AB:
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/45=
80/steps/14/logs/stdio=20
>>>>
>>> Hi, Alexandre
>>>
>>> I need some help to debug this issue.
>>>
>>> I cannot reproduce this issue on my host. First,=C2=A0 the gcc comman=
d=20
>>> used to
>>> build the binary conftest will
>>>
>>> have as-needed enabled by default,=C2=A0 so actually,=C2=A0 these lib=
s will=20
>>> not be
>>> linked, and runtime check will passed.
>>>
>>> Refer the command:
>>>
>>> gcc -o conftest=20
>>> -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87=
.0-r0/recipe-sysroot-native/usr/include
>>> -pipe -Werror-implicit-function-declaration -g -O2 -std=3Dgnu89 -peda=
ntic
>>> -Wall -W -Wpointer-arith -Wwrite-strings -Wunused -Wshadow -Winline
>>> -Wnested-externs -Wmissing-declarations -Wmissing-prototypes=20
>>> -Wno-long-long
>>> -Wbad-function-cast -Wfloat-equal -Wno-multichar -Wsign-compare -Wund=
ef
>>> -Wno-format-nonliteral -Wendif-labels -Wstrict-prototypes
>>> -Wdeclaration-after-statement -Wold-style-definition=20
>>> -Wstrict-aliasing=3D3
>>> -Wcast-align -Wtype-limits -Wold-style-declaration=20
>>> -Wmissing-parameter-type
>>> -Wempty-body -Wclobbered -Wignored-qualifiers -Wconversion
>>> -Wno-sign-conversion -Wvla -ftree-vrp -Wdouble-promotion -Wformat=3D2
>>> -Warray-bounds=3D2 -Wshift-negative-value -Wshift-overflow=3D2
>>> -Wnull-dereference -fdelete-null-pointer-checks -Wduplicated-cond
>>> -Wunused-const-variable -Wduplicated-branches -Wrestrict -Walloc-zero
>>> -Wformat-overflow=3D2 -Wformat-truncation=3D2 -Wimplicit-fallthrough=3D=
4
>>> -Wno-system-headers=20
>>> -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87=
.0-r0/recipe-sysroot-native/usr/include=20
>>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/usr/lib/..//include=20
>>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
>>>
>>> -DOPENSSL_SUPPRESS_DEPRECATED=20
>>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/usr/lib=20
>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/lib=20
>>>
>>> -Wl,--enable-new-dtags=20
>>> -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-nat=
ive/7.87.0-r0/recipe-sysroot-native/usr/lib=20
>>> -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-nat=
ive/7.87.0-r0/recipe-sysroot-native/lib=20
>>> -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7=
.87.0-r0/recipe-sysroot-native/usr/lib=20
>>> -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7=
.87.0-r0/recipe-sysroot-native/lib=20
>>>
>>> -Wl,-O1 -Wl,--allow-shlib-undefined=20
>>> -Wl,--dynamic-linker=3D/mnt/lincd/build/tmp-glibc/sysroots-uninative/=
x86_64-linux/lib/ld-linux-x86-64.so.2=20
>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/usr/lib/..//lib=20
>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=20
>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=20
>>>
>>> conftest.c=C2=A0=C2=A0 -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz
>>>
>>>
>>> I also tried to add "-Wl,--no-as-needed" in above comand, and=20
>>> manually run
>>> it,=C2=A0 then conftest will link those libraries. These libraries ca=
n=20
>>> also be
>>> found at runtime
>>>
>>> since these libraries will be in recipe-sysroot-native.
>>>
>>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build# l=
dd
>>> conftest
>>> =C2=A0=C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x00007ffd447c1000)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 libnghttp2.so.14 =3D>=20
>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/re=
cipe-sysroot-native/usr/lib/libnghttp2.so.14
>>> (0x00007f6bd36af000)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 libssl.so.3 =3D>=20
>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/re=
cipe-sysroot-native/usr/lib/libssl.so.3
>>> (0x00007f6bd3606000)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 libcrypto.so.3 =3D>=20
>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/re=
cipe-sysroot-native/usr/lib/libcrypto.so.3
>>> (0x00007f6bd31cf000)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 libz.so.1 =3D>=20
>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/re=
cipe-sysroot-native/usr/lib/libz.so.1
>>> (0x00007f6bd31b5000)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so=
.6 (0x00007f6bd2fb9000)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D> /lib/x86_64-linux-gnu/l=
ibpthread.so.0
>>> (0x00007f6bd2f96000)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.=
so.2=20
>>> (0x00007f6bd2f90000)
>>> /mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-lin=
ux-x86-64.so.2=20
>>> =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f6bd36e6000)
>>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build#
>>> ./conftest
>>>
>>>
>>> This should be an host related issue,=C2=A0 Does the worker=20
>>> "debian11-ty-3" means
>>> that this build is built on debian11 docker or debian11 host? Thanks.
>> This is a debian 11 host.
>
> Hi, Alex
>
> I cannot reproduce this with debian 11 docker image.
>
> $ cat /etc/os-release
> PRETTY_NAME=3D"Debian GNU/Linux 11 (bullseye)"
> NAME=3D"Debian GNU/Linux"
> VERSION_ID=3D"11"
> VERSION=3D"11 (bullseye)"
> VERSION_CODENAME=3Dbullseye
> ID=3Ddebian
> HOME_URL=3D"https://www.debian.org/"
> SUPPORT_URL=3D"https://www.debian.org/support"
> BUG_REPORT_URL=3D"https://bugs.debian.org/"
>
> configure:33927: checking run-time libs availability
> configure:33983: gcc=C2=A0 -o conftest=20
> -isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/re=
cipe-sysroot-native/usr/include=20
> -pipe -Werror-implicit-function-declaration -O2 -Wno-system-headers=20
> -isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/re=
cipe-sysroot-native/usr/include=20
> -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/usr/lib/..//include=20
> -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/usr/lib/pkgconfig/../../../usr/include=20
> -DOPENSSL_SUPPRESS_DEPRECATED=20
> -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/usr/lib/pkgconfig/../../../usr/include=20
> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/usr/lib=20
> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/lib=20
> -Wl,--enable-new-dtags=20
> -Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87=
.0-r0/recipe-sysroot-native/usr/lib=20
> -Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87=
.0-r0/recipe-sysroot-native/lib=20
> -Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/usr/lib=20
> -Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/lib=20
> -Wl,-O1 -Wl,--allow-shlib-undefined=20
> -Wl,--dynamic-linker=3D/mnt/yocto/build/tmp/sysroots-uninative/x86_64-l=
inux/lib/ld-linux-x86-64.so.2=20
> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/usr/lib/..//lib=20
> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/usr/lib/pkgconfig/../../../usr/lib=20
> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-s=
ysroot-native/usr/lib/pkgconfig/../../../usr/lib=20
> conftest.c -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz=C2=A0 >&5
> configure:33983: $? =3D 0
> configure:33983: ./conftest
> configure:33983: $? =3D 0
> configure:33985: result: fine
>
>
> Is it possible to login the autobuilder host to check this?

Hi, Alex, Richard

Could you help to give some suggestions to debug this issue?

Thanks

Changqing

>
>
> Regards
>
> Changqing
>
>>
>>>
>>> Regards
>>>
>>> Changqing
>>>
>>>> | checking run-time libs availability... failed
>>>> | configure: error: one or more libs available at link-time are not=20
>>>> available run-time. Libs used at link-time: -lnghttp2 -lssl=20
>>>> -lcrypto -lssl -lcrypto -lz
>>>> | NOTE: The following config.log files may provide further=20
>>>> information.
>>>> | NOTE:=20
>>>> /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-10906=
6/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build/config.log
>>>> | ERROR: configure failed
>>>> | WARNING: exit code 1 from a shell command.
>>>> NOTE: recipe curl-native-7.87.0-r0: task do_configure: Failed
>>>> ERROR: Task=20
>>>> (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-debian/buil=
d/meta/recipes-support/curl/curl_7.87.0.bb:do_configure)=20
>>>> failed with exit code '1'
>>>>
>>>> On 29/12/2022 10:34:42+0800, Changqing Li wrote:
>>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>>
>>>>> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends =
on
>>>>> libcurl, but it needs http2 support, otherwise it will fail with
>>>>> error:
>>>>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiat=
e_next_curl_request:=20
>>>>> assertion failed (rc =3D=3D CURLM_OK): (1 =3D=3D 0)
>>>>> | Bail out!=20
>>>>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiat=
e_next_curl_request:=20
>>>>> assertion failed (rc =3D=3D CURLM_OK): (1 =3D=3D 0)
>>>>>
>>>>> Enable nghttp2 to fix above error.
>>>>>
>>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
>>>>> =C2=A0=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb=20
>>>>> b/meta/recipes-support/curl/curl_7.86.0.bb
>>>>> index f5e3e7235d..6cee548f35 100644
>>>>> --- a/meta/recipes-support/curl/curl_7.86.0.bb
>>>>> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
>>>>> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig=20
>>>>> multilib_header ptest
>>>>> =C2=A0=C2=A0 # Entropy source for random PACKAGECONFIG option
>>>>> =C2=A0=C2=A0 RANDOM ?=3D "/dev/urandom"
>>>>>
>>>>> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',=
=20
>>>>> d)} libidn openssl proxy random threaded-resolver verbose zlib"
>>>>> -PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random=20
>>>>> threaded-resolver verbose zlib"
>>>>> -PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random=20
>>>>> threaded-resolver verbose zlib"
>>>>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',=
=20
>>>>> d)} libidn openssl proxy random threaded-resolver verbose zlib=20
>>>>> nghttp2"
>>>>> +PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random=20
>>>>> threaded-resolver verbose zlib nghttp2"
>>>>> +PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random=20
>>>>> threaded-resolver verbose zlib nghttp2"
>>>>>
>>>>> =C2=A0=C2=A0 # 'ares' and 'threaded-resolver' are mutually exclusiv=
e
>>>>> =C2=A0=C2=A0 PACKAGECONFIG[ares] =3D=20
>>>>> "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
>>>>> --=20
>>>>> 2.25.1
>>>>>
>>>>>
>>>>>
>>>> --=20
>>>> Alexandre Belloni, co-owner and COO, Bootlin
>>>> Embedded Linux and Kernel engineering
>>>> https://bootlin.com
>>>
>>>
>>
>> --=20
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176177): https://lists.openembedded.org/g/openembed=
ded-core/message/176177
> Mute This Topic: https://lists.openembedded.org/mt/95931602/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

