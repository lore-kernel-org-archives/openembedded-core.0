Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5415C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 02:44:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34102.1679453059088307852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 19:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=CJzcznY5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2445593400=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M2ah0c020033
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=0qW1ouS4GNgjvMGDFiPMpiQ1j3ekqE1dv/K/NIghUjw=;
 b=CJzcznY5int5y42TW50C4AAVpVAA+pScB7g5FrcZquUwCIHp9Kq0/LewSRAVI1BnEQb8
 llCvKGoed5VumsL7uWAoAAoA+FiMMwJmvK8LFMZOSv/ySO2atef0D2Q31m5iGGfX23AW
 +zQOqY2D0RCKGj2Mm1puDoycyZ/QC2iUqgiZM79kfiIEVGWOP0pVgKcwqXWkRVE7/Yrl
 WfUXyuAMzcCUCjVz3CcHOxrTYnEuVzqGjY/JTZ5LD9VxdXNqyckDgY8Y8+nW7L9PDyFS
 bc+WfRGAVfxyyZn69+BFMxeEF30fa5Wuz/ss7ldhsJI4KatKeBeDzjSgLLMopz8yz7U8 VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqu4g277-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:44:18 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32M2iHNs001197
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:44:17 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqu4g276-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 02:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5wv9Tv3UXmUKaedQNBurXoxPMUkIp84N+bkzG9SbxEA+AHgkh0QaKaiAnCr3ioPw+DQoPOBRDqEQ4aFbXLLGsIG3slS7JP25tCOiMQxGsXjTSoCwVKG9mfG+Pakpd4hmFsXC+uKAgDe2uUKPlsrA+b+qHtUvEHZtnVPtlqtd9eMScf+lmXvGYis7fQdkwgfX6rrfEDs7zDpXMUHE0yuKyjcm7J9kofZydFa5K1ItLtluyo7lFFbqQqSZRM0PzELu71ud9qRrUsynEtt9YHuSWQ5Jt696zX3m9bxqopsyiwuRIKEYgHeBnB3j9wR5yRD0lXA3FNO8ZZI55Ra2EmCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qW1ouS4GNgjvMGDFiPMpiQ1j3ekqE1dv/K/NIghUjw=;
 b=dctCArJ2SCtFx2ffP4uYZtfktGQ+DCDIWPd0beq6tmAMnHHfR7umWDLmZCbfKY2rTPu/rSxJXc7reondbK0ukEao9JzP2tMJ5/6J2ho+FcoNQxhxKdQP+998gy39I5/9It1ZZ77b4NeJ2TQ8x0hHm5DW+wl4tfYANK6E0l7lLjyxVTmNLnxiRATH4ds5mSyfuk+Uw2lJ0jG+QwJMmppIk1QBOvuwXx+vIMiK/n9zN6Im5JsoMvZ8XPKp4RtsSRAvqkltXjrEDKVhi3Ard0pjPW2p/h5N1ejvbezWu3vRQfdo0ncAeuEmGWBRJpi/rDJ7jqx3sFyAi5X/4mv0Ye6BKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 02:44:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 02:44:15 +0000
Message-ID: <74624131-710a-8dfa-8f74-ea4f554481f7@windriver.com>
Date: Wed, 22 Mar 2023 10:44:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core][PATCH 1/2] debugedit: add recipe
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20230321154016.34836-1-Qi.Chen@windriver.com>
 <BEEE1608-0309-4213-ADB0-7FC39A1F61F8@arm.com>
 <174E9D3E5115C82C.19937@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <174E9D3E5115C82C.19937@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 466e24ad-d668-4dcc-57b9-08db2a7f5367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Abupnli5L0AT72LXuPxjUndzfgKHEtY9OTx7Gv22qWOpB5KCsQI22DHE6VkJ5rwOpAbw3IGpbIDKbXAitIBBVoLcrcUNmeR+aMfe4L0r9vI9E9LrbcUmVNzTliRRy8mlBDzPjPl7bm2+b6KsFdfG7805F8Px1wsgcoypjW3zuj1qJ81ibg+D33Zbo9znt9iv6EyCFloEVcu+bjS6Xj5ZLODYkgof0NKOns5u7f93pxzRYK4vuGcIVeD+qixMK7dere3+YesbYSAENWS3jLkvAZfIwSHf2NNDB6wbnWcxu49K/fmaHuzQCac336PUzd5DS+fKDEopNqK5RhPRS4ilc7kgpSu+ARn+g4iFCG/IH+6UbahPfboaWL5WP/nckKZ10/pOOhCISKOYBJ8Hys+QaH7kmux55rzF24y3mmb9loPoP8ZMxqpbJd+4jYbUuzE/+w20jiyD9OzpN5UW6ir+yf4D2YBJk7dHDVvUW3srstfJociBityeiR9wd1zZG97WJy09Q6+DGolzOP2YUjCYdxFeo/idLCVek7DNwYHo+mCN4aJ+7ZaOSiQKI/soIX+QvCgvJbxeenAT3OUIOT7pH8vh8rs4q6IkJs6F/C+bhXJV2j8mvLD0eynXpGa1P8wRJ39F0liHMDr5dAg8FC7x/ImFKvG1b2myju7IeamCPsqNIowEdhUkC1qoAjAau78QsqgISHifUyOv/SFfmsEbVqjNFOwo2Do3Y4x06pE6eFGtSjK2ME4prYXk+hn0v7UN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199018)(31696002)(36756003)(86362001)(38100700002)(2906002)(41300700001)(66946007)(8676002)(6916009)(4326008)(66476007)(66556008)(5660300002)(8936002)(2616005)(186003)(53546011)(83380400001)(478600001)(316002)(6512007)(26005)(6666004)(6486002)(966005)(6506007)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0U1eE5Lc2tEMU9DZ3d5NXZtYlljSldpVzRZYjVMek9aK0tZc0RqK1ZRTmwx?=
 =?utf-8?B?b1NocXNwREEvaVhFZHlKSU9WUElXOUV1Rmx5U21pZE5mS3NIM2N0bmZNei9s?=
 =?utf-8?B?RmRsckFCcWFYMzF6cGFJa1JYbkh6OTViUHVZckpDTTBjZVZCWHNkVEtXSmMy?=
 =?utf-8?B?a1ZJSUFucmxrV1JkRW5pZEpBWkl6VERSNkRHUlJEZlVkVDQzUEczUGRJZzVI?=
 =?utf-8?B?cS9iemwzZnEvSlFsY2hnMy9ocHhvTExmTFd0QUpXTWF4RXUrMHVUWmY4WFpJ?=
 =?utf-8?B?YWxYWXQ0a202OEdKckFWSlJLRUxIR2dpSklQOE0yN2RFS005SUVzSWh1MmdL?=
 =?utf-8?B?OEphdjNtSzJqbWhLc1NpRDNnRk9YNmJycEVmYW12ak53TitwQjdJVHAvL3NP?=
 =?utf-8?B?Qk9CSVlYMVQrZTQ4cE5CbHlYaldoczZTblh5T1VIK1ZvSm1icXlkOHA2WEZF?=
 =?utf-8?B?M0g3ZDZUNWxJZFJUMHJJb0F4aFNmQmpwQnREcThhTGFXejFCdmlTTVoyMFhr?=
 =?utf-8?B?K0xNK1Z0WnVJRUh0aUppQUw3TGpsSzVFQXlQdHYwOUNTOTlPQkgwQVo4ZUtu?=
 =?utf-8?B?andBcXFzUVFGaURqQUtKeFJFSDZZdFgvaDVaMDhwV1U4Nlo5dFk3dWlrUlRy?=
 =?utf-8?B?WlpybEExWkVxcHF1eGRzS3hCaDE1OUk5ZVhiSzcySWhKdTcxd2psOGJPTEJY?=
 =?utf-8?B?WnZXN0s3TmhKcGY3d1U5Q2FvZkdYdWN5Ym1UMlgxeFBURERDd3ZJNE9jTDdY?=
 =?utf-8?B?NFZBT2VWVnh6a1NNSDVGb0FPMUZxb1ZHajdyT0czT3YwdE16T1FTWThQc01r?=
 =?utf-8?B?TDBnVlJGd0xnUitJT016Q2Y1S2VSbURuMDVxS3dZZGdSTmFoZm5Idy9RclVS?=
 =?utf-8?B?QTFKZ0pEcU1FdDBLV29ZMXo3Y1FFRTJYdHJzMURNNjhUTE1JNlpJWkFRQllP?=
 =?utf-8?B?SkpXVGUzTDdBcUNzaEhNYUhkdnFxOGFHMUhiYmdNTWdGQlRPeGZqamRwN3RI?=
 =?utf-8?B?RVFtL3lsSnBDUmJYZllEWUJkeXZhNXlsb2NwRURPaFgxYjRCREVpOW5mK01R?=
 =?utf-8?B?UmxKTE4wdk1PWUJBNHc1V0MzaXdCT294UFV2QWl3dWd4a2xjbWp2OXNIQ21H?=
 =?utf-8?B?dmlsTUo0S0dpalhpWlA0bVd1NGlRRlU3NHgyM09XN1UzYWt4eWtSK1VEYVc4?=
 =?utf-8?B?RlZoSFkyaUlvcmQrbUdoUzR0ZnpST3VYTE9FQUdJbjNjVWVLWWNJRlFmMFJJ?=
 =?utf-8?B?VTJuQitHdDh5QkQ4MTRlbm5CVE1BM1c3M2I4Rm96ZktKUEJreEFoT2Jvdzdt?=
 =?utf-8?B?ejQ4QVlFNWxSZXROTnAzb2ZqQXdrckRRVEZrNXA3ZzdwQnF0UWF3bCtGYXQ2?=
 =?utf-8?B?bHV4K2hGdUxGWHZuQVB4UWhTbVhsTmhSYi8rVXdmU25vVERTY3hTeVBDcTF1?=
 =?utf-8?B?bXRRNmJxM2p1aVkyeThNS05vRm01dlN2VDhnaVJVTDBBTWk2ZHJ1TFI3OHUr?=
 =?utf-8?B?VzlFSmd2ck04S0pNTE1tWmE3bTl0Y0R4YUhhUEk3NjZhY0k1ZWNHMmQrd0I2?=
 =?utf-8?B?djhRTTh3YmVaSk4vVDhab0w4NmJrN2puRnN1azk5SUdMQVRBUFVBU0JzdzFI?=
 =?utf-8?B?a0FFaitzTzFEbEVaYmVWaUE5Qks3bk9ObHVhQUdjZXRhTjl6bHZCSDYyUzNk?=
 =?utf-8?B?bVZjdG53Qk5iYyt6R0VEL2E4TXhjK1JxNjBRb09CZ1JZRDJWR0hYaHdOcGJQ?=
 =?utf-8?B?TjlXNlFBaWtiVnZ3SUNTS0l0enByT2pFQXRyL3JtZEU5SndUN0YyWlFITlE5?=
 =?utf-8?B?RGlQcGpvVUdOQnpGUFFPekQvOW43MWpqZm1GcWN2MlJBUVVCNURjR3lMZzN2?=
 =?utf-8?B?T1lJNC9JeWtiZXNZUUpyRkxYd091RnE4c2kzL0J6R0tpYkFOemJaZ2VOa3I1?=
 =?utf-8?B?TzNwRFN6aFI2bTRYTDRPK0pPdWdmbFJZNFpSb2Q5YTB0d3diOVc3Q1FGUVNj?=
 =?utf-8?B?RUR1cXhvaUVqTHlWeUNuYVgwZ1dmN3l0NmlGemxKNU5OZDlpZjh3L0N2cDlh?=
 =?utf-8?B?WU8rTVV5Vy9RblV3NUtiMzFUOUIreXNCZktVT1RWMVcwYTNTcHNaSmxpU1h6?=
 =?utf-8?Q?5yrN4TYEv0cW5cif+A4CuJSm+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466e24ad-d668-4dcc-57b9-08db2a7f5367
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 02:44:15.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NA3K+SIhE4JSRfUD+5aADSV9kiWc3B3oy2CAew9BenME3EeCETfCy7JsHQ0DDQRtY0ZfKz6ISHQQO09SoCbNbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-Proofpoint-GUID: jaAhF5Gs0SIFpGw4p_p4jeamwkDs33f8
X-Proofpoint-ORIG-GUID: gmh30ZpxNjK2BvgUI2hXDyCy-O55vZP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=701 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220017
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32M2ah0c020033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178907

On 3/22/23 10:36, Chen Qi via lists.openembedded.org wrote:
> On 3/22/23 01:50, Ross Burton wrote:
>> On 21 Mar 2023, at 15:40, Chen Qi via lists.openembedded.org=20
>> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>>> This recipe provides find-debuginfo which is used by rpm, more
>>> specifically rpmbuild.
>>>
>>> RPM upstream removed find-debuginfo and switched to use debugedit
>>> in the following commit.
>>>
>>> https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd9=
466fb9dc717846f5bf15518cc
>>>
>>> Without debugedit, rpmbuild fails to generate debuginfo package when
>>> %debug_package is added to spec file.
>> Our spec files don=E2=80=99t do that, so why would this be a problem?
>>
>> Are you building =E2=80=9Cnative=E2=80=9D spec files on target?
>>
>> Ross
>
> The original problem comes from users using nativesdk-rpm-build to=20
> generate debuginfo packages inside SDK.
>
> This mainly affects target rpm-build and nativesdk-rpm-build.=20
> rpm-native is not affected, because our build system does not use=20
> %debug_package. And users would usually care about rpm on target and=20
> inside SDK, because that's the tool that would usually use to=20
> accomplish their tasks. Without this recipe, the 'rpmbuild' lacks the=20
> ability to generate debuginfo package. We can also see from the=20
> following link that RPM treats debugedit as a requirement.
>
> https://github.com/rpm-software-management/rpm/blob/master/INSTALL
>
> Regards,
> Qi

I'd like to add that this problem is a regression. RPM before that=20
commit (date: June 21, 2021) has find-debuginfo. We can see this from=20
the rpm recipe. It has '${libdir}/rpm/debugedit' and=20
'${libdir}/rpm/find-debuginfo.sh' in FILES:${PN}-build. That's why I=20
used the words 'add back' in [PATCH 2/2].

Regards,

Qi


>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178906): https://lists.openembedded.org/g/openembed=
ded-core/message/178906
> Mute This Topic: https://lists.openembedded.org/mt/97757563/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


