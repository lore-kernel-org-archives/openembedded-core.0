Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99611C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 09:32:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.100131.1673343156133911575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 01:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Xli0/D8T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0374936233=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A9CTJn002070
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 01:32:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zYeiMaIXa+4uz6QCxufG4Vl5cUyCDjRrl8vbaJSFV14=;
 b=Xli0/D8TusdCaTHc9FU3MW6MpuEuuNYL0gjYznwOEa9j1y/KxLb0QNJPK5o2fKwbezRl
 mIuYW4X55iAbK5rKrLy3ykmduoc048bbSQ/UlWJtgcnrlrHcIfxlOeN5/hbc3hY/yjbN
 EPMR2YqCw1A7X+ADaZrSjMigWUB7NqYY3UlfxuMawpEpx/qLy3kQmTbQiFiJEGcEa9oT
 tN3aEb2Od+xec1NrToFTwAqbbhzALtnij0zg9XmgNoLg8Geg6Vy2or4gCCsGgktFhxgC
 eeIbJWqz8Zv40n3IMkvsp4pVXjkr2lkMPGV0TTNmpe1JUJ0csEcxPcC7OjEIUTtY4hNz gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my4w8tedv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 01:32:35 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30A9WYFb016779
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 01:32:34 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my4w8tedt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 01:32:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6xvP36u/T0KyZpmxKr62lNcUDvraYIoXN3eDtXfJPuNj8vHZJV2ngLR14JOlF3rBeif5IeSkmTdxYha9hJeaK3BQPyZ13CAWsdD8gUw1XgY+hjCzQxGd9FbOHoEv4hm7iNy5wUeeBSdViMRYWyNofKf3aWYSmeZi5OZFi8s0mQ2B68/GB3x13/Uvb/exgZRnl+SQ3nSYp7vBv18u8MFkrM4oa6ayr/zOFRRm3v4kP+5yRnWx1fhVb1H/nTlB5Bv64vh1mOO7Y3kr1yl/17fgPTD3NhkX8As/hg3YVNrw4OLZG+/zao4O1208AzPEE9tEDrD5yuh2G7i7xnMiDMT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYeiMaIXa+4uz6QCxufG4Vl5cUyCDjRrl8vbaJSFV14=;
 b=Sr38CCQYhrBn/VzaS1p//VDcOUMkbp6ViwdlduYFJzGe5E9r+03maIgjXlMLwiAlw22xrkiW7i8yceAKRSant15hAzt98VIEzNTHy2PqmjRxQgXf6JQA55TTKrA2esyC64OPp27UZLGFJOqLbPev0X7A+QJAMH4PIGL7+n/ka/EUdf7BwfggW+2OMG+dKE3rwEMWq2nuRPn6Tr6FpKfsJ+q1+7WBFGVmJVH/bq0WWezIka7+TzNWkw/YL6dmSHk47gPRt/4F07HLwQQ+Lu+25LPNTCgCjHxRPAgY8+H6NDQIaIivly/DH91qvyvUda5Gq26nG4MNwGAQYNdwLPZgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by CO6PR11MB5649.namprd11.prod.outlook.com (2603:10b6:5:35b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:32:30 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::94c6:34b0:8120:fe2e]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::94c6:34b0:8120:fe2e%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:32:29 +0000
Message-ID: <cd8d5ccc-09ab-f68b-59e1-7d608c766a93@windriver.com>
Date: Tue, 10 Jan 2023 17:32:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com>
 <CAMKF1soyU8OdM8zWSP353ifsvXLn3yAQ3wgheOgYa-wm=MH=7A@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1soyU8OdM8zWSP353ifsvXLn3yAQ3wgheOgYa-wm=MH=7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|CO6PR11MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d86c554-8c6c-4f2e-c113-08daf2ed97a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WQlQpiFBKUWaut89Lsm6uYZq80KChHf8IF/0XZiKXY1qL7qqsK1D5v1yYFTKtyaJUa29X71OtTFV+mwCkB/LQUBfoKqK7dLkOzrGzZQuEHheazWvW8QuSVcoVbQG76tDH6syu+lsa0MWdxjwQzTFP36HOjukZyQMKQLrK1w9TGnAAC5+Xz2JmQ+LgqOX0T0c5Y2FRFBohRNwzGYWjVSRDlSK3zvZR85CM52lesnP5JhvKqmJakbHh2ZwD8ZYMSfVIb6kx3MqKTHzcmPC9YDt7ZiPOpOIq144wNjTuj/dc56NcrdwUO6FkDPY0epCxLN/fNK+ov+uKmneIwmPAyLiwITV9ZnmY8ZdZhDqvq5b3sb8rW0n//yzLmWFA6uIRj2oVmM0CgzWWrody5cXd9qPcnCBI6wR49KPT8UOj0eQxoX//zrHeirYK4zaHdVgn5EixBhI+uclMe5EhjyFMluC0DnJ667TyR6uXwh1m6Qdw5xvxQGG1lhussCzgYUKymL2Ki8LiGh02oJcAzvH9nb95NMwLvYAXqRUQETK2wmmDKiWL547EhMd1bKwVaBXiDlYKPEGvFx7waaR5rbKL58RgPR/3ZA0liJtF7n88YGwXjDwZruqM3gc7uSLkNyPkp1q8o0Ei7VwSOBDkA7sJiAMngCFKP/n9lVKmuyR5Lid2UChga8pBVI2PuGjolhSQoenG7LkkdHGahO/A2oR8Yl2/dOEgHh4NtYva1SgyXnH1krtNqSqiNbLwys1MWT24C34PIHGkUqhVrMs0YHeYtyiio+brT7+2vNQ5KU6aLTe8WU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39850400004)(396003)(136003)(451199015)(44832011)(2906002)(66899015)(83380400001)(2616005)(66476007)(66556008)(5660300002)(66946007)(6666004)(53546011)(8936002)(26005)(186003)(36756003)(6506007)(6512007)(31686004)(478600001)(38100700002)(110136005)(6486002)(8676002)(41300700001)(86362001)(966005)(4326008)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2x5OU0xektPQXFJcEJaTE9ITkZQc1hrWUxOdHVQZzhCM2xvWHRXYTlaUHA1?=
 =?utf-8?B?ek5OdzBkNmhpOGlGU1Bib3BURlk2OFdTblVTYXUyWEF5TXNPZFVESnNpdEda?=
 =?utf-8?B?dHRFQkFRaUVWZ2l2M3RndzNoWVQwcFNGUU1iaFhIZEoreUhqUDNhalBlSlJs?=
 =?utf-8?B?aGNtYVJEaytBWEtXaDJicy82TENST0xSUGJMbnl3OVZEK3VISjBoMlJSUEpi?=
 =?utf-8?B?ZlNHRjN5aG1pQlBrRzQwZjNkMnZrYXdSWTlGREFGcXNCb2JzK2J3dXUyOVF0?=
 =?utf-8?B?UExFSTBMU2Qzd1VSUjAvQVpCM3pvMDYvVUtvdE96bVFuTkpkeElqNU9wdFZj?=
 =?utf-8?B?QXFaUWVieU8yc3diZ3QwdUVBVXNGQnlIWDBPRm1hcmN5LzhuUWc1dlE5MlVQ?=
 =?utf-8?B?bC9HTXpBRG1mZDlvenZCWE1vOW1FZkVsSEtrQkRuREhKdWc3WkJFSUNpdW5N?=
 =?utf-8?B?c2ducUZxRjVyc1E4NlFKSHNNVnFHU2J1eEgrYm5TdHlOR010ZGFiaW1qWkVM?=
 =?utf-8?B?ckUxbjR1N011R1BDbzNZSklFY0gwOENrUDN3ODhURU13TGEzR0Rjd2J3UWlL?=
 =?utf-8?B?Z2psbXRSei9yeDNHMGNQY3ZlNENGdUJ4WE9HQXVKZno1aitZZjRSaEttZWox?=
 =?utf-8?B?eG1mOHdyeGdTaWZ6eTVnbEtDVTFRdlRMVzQ1REVvUldZVTdITWwwN25NTVda?=
 =?utf-8?B?T2Y1RjI5MzRtUTV2S3lNRHZGUnlxNFprdnhob2xkL2xVRlJkeUV5Z1FWMkdi?=
 =?utf-8?B?TFdldFN6ekpqQXYzejhTSWJpZUFGSzllWW9ON0pJZEZiSGNORHV2d3dpTHpR?=
 =?utf-8?B?K1lHTXZZMHY2eWs5WEtEa014VDdRYi9qV2F5WVoxaG4yNmtDV2RnQXVyL0tD?=
 =?utf-8?B?Tm5PYzVOY0NPZEJuY0wrQVFNSzNDWW9WeHZ0aVQwWTIzd2xZc2orMVdoaE1P?=
 =?utf-8?B?S2EySGlKYktOQVFKbmNOOHJHZUtFTldOZ1JHU0R3UTNoZE9od2lORlZTTUxl?=
 =?utf-8?B?VkxBQkl3eENoOGl2VkRJTThJNzlBenlVdVhHdVRzOHBrZFlYN2lBR0RaM01I?=
 =?utf-8?B?OCtYbUhkb211SXZXOGVlcHdwaGg4YjlIV3EyMUNVSFpuZjFtcFlYQ0dhbUhZ?=
 =?utf-8?B?RXkwOHJHb1Uzdmc1NjMycVVYY1B5MEZiWk10UVdCa2ZBdElBdFZnRGJZbThI?=
 =?utf-8?B?dVdRUzlDSkJCb21idjJVVlJ2STV1YUFhUWZiR2xtVVkxbDdManpXai9Ec3lo?=
 =?utf-8?B?YndoQ2xRQm5CU282eXBMbjBmSnJNdGZqenhSR001b2xxdC9taGVVNG14ZHFv?=
 =?utf-8?B?bmp4bDhIUU05Q2t5L1o1V0I1ak9QRjBSNktJczhTNWk3MlFuR2xJSGZVYXpQ?=
 =?utf-8?B?THlZQzg5MkhXTG5wRVhESWVtOVMySWg1OW5ON0E3UE0vaGQ1OTk3dzJGNk55?=
 =?utf-8?B?cGw1cEh3ZmF6b242SnhXMEFhT2xkY1ZWUE1ORFNRM2pvYXRQdVlFNXN0bS9Z?=
 =?utf-8?B?RGtvU281ZXQyUGw4QXNwNmZPQThRMHpRckNMeXNoZlJ0S0tSOXZrbmtpRXRK?=
 =?utf-8?B?M284QlRVdEZPaHJURFpwd1YrY0JTeFhWVHIyMmNURGExbW90bzAxdHc4bXNO?=
 =?utf-8?B?QURReGJvT3p3a1VMQXQxaEY3cWtHQjhPMnowQ3RuNDkrY28zQ3ArdDMrK0xB?=
 =?utf-8?B?R1JnR1JNMHloUjlnVWN4Vk81YXczTFdoOXdtTmxaWXNEMTR1bFdHK0NOVlY2?=
 =?utf-8?B?ejVVWlE5UEhiaTE4NTU4Kzl6VVYxd3l6RGlYeDZsK3VSQS9JUG9PQWNxazA3?=
 =?utf-8?B?cUNOMXo4MU0rNlo2OEluSm5JKzZ6SUpBUlJENWhtbDlLdEJRZGluSXF3cERs?=
 =?utf-8?B?UGVLa3lDT3QyWVBVMDR2MkhLWEhGMFc4UGtJOTZzZGJNdDQzSVRlUFdWeVJC?=
 =?utf-8?B?NGMvSWdOT04vbTlTUzZtMThVUXdjbEtlaTRpMDRTZ2RFdDdDWFdjRU1WQTZn?=
 =?utf-8?B?alA2akFjUmZSbUFxU00vdDhjWEtRd256bU5YZnpWbERmZlcvVHdySDZMWE9k?=
 =?utf-8?B?MW1SYU9XMTZVL1hUT3FzSnQ2WDU2QnRnaVEyQzJ6OGZQZVlHdUxNVzNaYnE3?=
 =?utf-8?B?eFJGWEtQWk8wcDdvOGFKUGpnUEVaNXdPTmJCVENsZmptYnpxYjJYZ2p3S2VV?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d86c554-8c6c-4f2e-c113-08daf2ed97a8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 09:32:29.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xu773Mhy/cIhlEq8e6AQdrS2emtMsHxBo36bBNutDS/7cu8P88uJagopCJdDbQPhaHqFJrWrlGu0gyw0LHbHkV87erdNEM6MlacQXgvce6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5649
X-Proofpoint-ORIG-GUID: 581sExKVo1LMMviKk8ZcYLoAX8UYtfPC
X-Proofpoint-GUID: otbhjM6RCn3K92VL8i-yRqZTpAL2iqAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30A9CTJn002070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 09:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175711


On 1/5/23 03:17, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> nghttp2-native fails to build which is exposed by this change
>
> ERROR: nghttp2-native-1.50.0-r0 do_compile:
> ExecutionError('/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-n=
ative/1.50.0-r0/temp/run.do_compile.1646093',
> 1, None, None)
> ERROR: Logfile of failure stored in:
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/=
temp/log.do_compile.1646093
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: cmake --build
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/=
build
> --target all --
> | [1/1] cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native=
/1.50.0-r0/build/python
> && /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-=
r0/recipe-sysroot-native/usr/bin/python3-native/
> python3 setup.py build
> | FAILED: python/CMakeFiles/python
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/=
build/python/CMakeFiles/python
> | cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.=
0-r0/build/python
> && /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-=
r0/recipe-sysroot-native/usr/bin/python3-native/python
> 3 setup.py build
> | Traceback (most recent call last):
> |   File "/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/=
1.50.0-r0/build/python/setup.py",
> line 24, in <module>
> |     from setuptools import setup, Extension
> | ModuleNotFoundError: No module named 'setuptools'
> | ninja: build stopped: subcommand failed.
> | WARNING: /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native=
/1.50.0-r0/temp/run.do_compile.1646093:161
> exit 1 from 'eval ${DESTDIR:+DESTDIR=3D${DESTDIR} } cmake --build
> '/mnt/b/yoe/master/build/tmp/work/x8
> 6_64-linux/nghttp2-native/1.50.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUIL=
D}'
> | WARNING: Backtrace (BB generated script):
> |       #1: cmake_runcmake_build,
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/=
temp/run.do_compile.1646093,
> line 161
> |       #2: cmake_do_compile,
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/=
temp/run.do_compile.1646093,
> line 155
> |       #3: do_compile,
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/=
temp/run.do_compile.1646093,
> line 150
> |       #4: main,
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/=
temp/run.do_compile.1646093,
> line 174
> ERROR: Task (virtual:native:/mnt/b/yoe/master/sources/poky/meta/recipes=
-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
> failed with exit code '1'

Hi, Khem

I think autobuilder reproduced=C2=A0 this issue since on this machine, cy=
thon=20
and PythonLibs is found so ENABLE_PYTHON_BINDINGS is set to ON,

but on my build host,=C2=A0 it will be OFF, so python subdir will not be=20
compiled. I plan to just disable ENABLE_PYTHON_BINDINGS directly to make

deterministic build, and send V2 later.


Refer part of the CMakeList.txt

find_package(Cython)

find_package(PythonLibs)

if(CYTHON_FOUND AND PYTHONLIBS_FOUND)

set(ENABLE_PYTHON_BINDINGS_DEFAULT ON)

else()

set(ENABLE_PYTHON_BINDINGS_DEFAULT OFF)

endif()

>
> On Wed, Dec 28, 2022 at 6:34 PM Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
>> libcurl, but it needs http2 support, otherwise it will fail with
>> error:
>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_n=
ext_curl_request: assertion failed (rc =3D=3D CURLM_OK): (1 =3D=3D 0)
>> | Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:88=
6:initiate_next_curl_request: assertion failed (rc =3D=3D CURLM_OK): (1 =3D=
=3D 0)
>>
>> Enable nghttp2 to fix above error.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-s=
upport/curl/curl_7.86.0.bb
>> index f5e3e7235d..6cee548f35 100644
>> --- a/meta/recipes-support/curl/curl_7.86.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
>> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_heade=
r ptest
>>   # Entropy source for random PACKAGECONFIG option
>>   RANDOM ?=3D "/dev/urandom"
>>
>> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)=
} libidn openssl proxy random threaded-resolver verbose zlib"
>> -PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-re=
solver verbose zlib"
>> -PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random threaded=
-resolver verbose zlib"
>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)=
} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
>> +PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-re=
solver verbose zlib nghttp2"
>> +PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random threaded=
-resolver verbose zlib nghttp2"
>>
>>   # 'ares' and 'threaded-resolver' are mutually exclusive
>>   PACKAGECONFIG[ares] =3D "--enable-ares,--disable-ares,c-ares,,,threa=
ded-resolver"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#175090): https://lists.openembedded.org/g/openembe=
dded-core/message/175090
>> Mute This Topic: https://lists.openembedded.org/mt/95931602/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

