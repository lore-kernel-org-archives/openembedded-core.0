Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D5BC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:50:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37195.1702047028771230218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hBQi8N10;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07063bb361=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B8CbVDS021170
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 14:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=QgIMQVT2NopMqWdbABD
	VgISMYKEGveUJC/+YJsCXbUs=; b=hBQi8N108bcKFmkl+FTsJJQ1jnPA86JVTbV
	syOXCXtrEBOBDLqVqBjViKfxU7zgURYDwvO8zXKHVWjV2u9hWwsLi28k15bIx6hH
	Y+pTtq3hSDtujkAe8b35rJeHUc/BZ7eUyBFJFBY/0DlbZSOtX5URhHUSUSyUqhLn
	kREA75USYglNYh4JRUEKJFXO5t9QAIs4JYj/Q2zYrp4ohwUDq8VSotlL2hC5FLEo
	W4cjxqeH/crsD6pz8EdbUTVq9goUmgGZkor19xBmXPbyUT/+NDDYq3T7s6MJj0Fl
	x5PfN1HT8Dd1Ct8ehqUSHfVNQr8tnAFyHLI1v/HGeGlcRSLFmEQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53txt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:50:27 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B8ElqaY004924
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 14:50:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53txt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 14:50:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFuS0iNHX3aM3y6RdcbjxP+T2VJjYJvlSLoCEW3NoOBfePqvLJFM50Z8xoAf2Tc50cRo8FEcJf+ddzc8Hljc2Qiqpofq+G3xSvkjgETR31qVif/0kXTASopVDbbmk+WQQrUb6K663iA8w4pD2ET2+s8eE8fnF/UEvBFW0pezrrp0cUrGivlXg3Z0undQJZzSE9FkCljG86XQDztK5mJLX8fK3ThjSEwaDFzhv5lueHcHGw+EjnlwRtQr4KLMRA6aZzPqI4WBOpMVUsaHyG28lxpKkPygIi4L4qYBO5u6TpuYZ4gZZtfMY59tQM4IbUjutz28TpsiEHM50j7GUTIcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgIMQVT2NopMqWdbABDVgISMYKEGveUJC/+YJsCXbUs=;
 b=D6SUdP97jGvFLHci9SJ7QjDX5GTbOJLEodA8e8Rx8XMtBt/F8or3JxYrO7S/TI6fthhdgc6YtdNAqt6SeSerVF3T4SFCy8N/5nVMtuIVIW5kbBPoKm3QZyAdFMPt73GOuhNVopxPYkZkgaN1npvbM2OcFMqKMvG3JuEUCQlhcBXlDELxXOf0MIGFhUwabJH3AvbUtvSdvQwJvoQ36qbTkOBKDwPoEKNRyUUGK1JmB287UcLA3pTFOWmbbJIu+Ib+L8CMxPFPA4u/LLEWCbWZMHMTDCmcul5jieJeMKm2KBcNsWPcdWWrzrd/hd4E0R+DAZhfdkmKMrjwxGbRKS3ksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH0PR11MB5361.namprd11.prod.outlook.com (2603:10b6:610:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 14:50:22 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7046.033; Fri, 8 Dec 2023
 14:50:22 +0000
Content-Type: multipart/alternative;
 boundary="------------OgReOaIkjcWgRklGRb0FkXal"
Message-ID: <42d8769e-96f5-467f-b9fe-c621609d0875@windriver.com>
Date: Fri, 8 Dec 2023 20:20:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.70.0 -> 1.73.0
To: Alex Kiernan <alex.kiernan@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
 <CAO5Uq5R1hYwo+oa4QR9bFQif57OrXbWEY0QSZfJZZHmipfajqg@mail.gmail.com>
 <82c9303fff1e1f728b3aa08c47d75efbf239da88.camel@linuxfoundation.org>
 <CAO5Uq5RLXtwaVULLQWh_atppYvO_r-qibP7AMyE7KiLyj4SAvA@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAO5Uq5RLXtwaVULLQWh_atppYvO_r-qibP7AMyE7KiLyj4SAvA@mail.gmail.com>
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH0PR11MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e553881-22b6-4ec8-5786-08dbf7fd0119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gpu3R2uMw+XSFTxz+OphPKodrpHepGBvl1/bP8U/Yv4Dw8kQZVcv7wD5R3KppsaEfpJLfUlScvpyiwMVRBHI6xiO2TjFkf+ZS744L4yWsJDT/HaBxSRjOpXpwG1L1FVm2lPBFkZHSZWbuypekIQaYMXACiY6MgQuz0p0OYMPK1JUrTVO32tZVfF3PF0BC0b1ku+9ZqxQF8xLeAZ0j9e6qpas+OrTz035wB0fRRTy8SupvvtIcFaGwbu0m87/mer07gwl5SXQ0wgBlhFj4D3EcnWbkkTwts4KTt9gH02afeNkzii3x4fGPvZXwtlHUV9S+AUY4rRIPNdlQkqi+/CS4xd9AJlHTljyunSaqfCQ2UmyqmUqqNKE55imCzJfPIiH5AVWWoXbNXkwreEqD31l0laHDS1stfAWRz3ftR1P057JjRy2Mi+VaYU+WHqKKGrS/1e1ptgNmDpSyaiT0tRix8zGKsIe+EKf2kHGJ3kEEexf1Cv3w2MbqU2FieW7sUeHl98zWf95j+Frgwuv53ldS3nPxfQCyAZYep9dsYPSfTmXHtnD3GRNpnWICCXoeMTDrztx/QLjnM4sgsxrM0q7hEnv91SgjlcZWPCYuISEUUdh8H8Jp8YHBXtzlCtxdi4fyAQFetDf/Bz6/VY5GuTYH4uCSqPhFiCL8Ip7/O9z2+RNEuRuIV3x6GtIXb+4WEcP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(1800799012)(64100799003)(6666004)(478600001)(8676002)(26005)(6486002)(8936002)(2616005)(38100700002)(4326008)(86362001)(166002)(6512007)(31696002)(36756003)(107886003)(5660300002)(53546011)(41300700001)(31686004)(33964004)(6506007)(316002)(66556008)(66476007)(66946007)(110136005)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eTdZU2VSK29RckowRzBwcWdpZXJTS1h1bnk0cWtoU1pjYTk4ZkVVNFdzdXds?=
 =?utf-8?B?NUVFWHhNNUNKa2h4K0duUS9PdUdlVnJFTkVSYmRRUDcza0tQbVhNSXN4MS9G?=
 =?utf-8?B?czc5RDNpMXFORW9SZ0pnd1ZOdnRPNDcwYmlaL294Zk9CaXFnRTFDREJxeFVG?=
 =?utf-8?B?ODlzVjdlRFFaVVJzQmFHU0dMVFpBZit0SWFWeVU1d3ladC93bjJSRy9HTkd3?=
 =?utf-8?B?bUdmazYrNlhHQXRBVkdVSVlETXJYSlBzSW1PMm5EcSt2MUo5L2pveldjZVpQ?=
 =?utf-8?B?eE9tckhZR1VKaTdKRENiNXVsQkI2aThEWWExaFZzK3ZKUlhpamovWDlId2R0?=
 =?utf-8?B?Slorcm9GTGR0NnZUMkowMmNkak5vditKVjhtVkpqZXlpcC9SQVZHczM5MU1r?=
 =?utf-8?B?L1FRcnJyc2d6akJZVTN6QlpsNVExRFRGWmY3WGw3QUFhbDI2WTk5RjFRT1Rw?=
 =?utf-8?B?QVZYL0xXL3A4M05CcnlvYnRNZWwxZUkrNjI2TUJMbldvdWNXY2tKUmpKR0Rl?=
 =?utf-8?B?c01KbGRjMHZWcS9lcThBdzY2SFpZRllLK1JLS1VOS0dxaXJGcjlub1VMcklk?=
 =?utf-8?B?OHMvV0YwRTk1ZXBIOEJEVWJ3QkErc3NtWVFGMlFKbDNUZVI4WE5wOTJLdkRG?=
 =?utf-8?B?dG1IbThid0RTMVR6S2lFc3l3TDdITk0xK1FVTDAwb0ZlNWxoQXQ0aHk1bHRX?=
 =?utf-8?B?UERZNC92U3ZLcll6N01UQlhTR0dybXNzTkI1SFVNTURkbjM1cjR2aWhyWkNr?=
 =?utf-8?B?WW56SGpVQnJSdGsyU21KV0ppcVpqcHhNOEdaQzdRcVo2elR2eXJtUGUzT2Fa?=
 =?utf-8?B?Y0xwNnA0UjNvWExqaGlFSVV6aENXMlFhcFdjYW5ZL3dqQzE3aHVYdlJraCtt?=
 =?utf-8?B?ZUZjYy9YWVFtZk5ybjBISU03eGZwbTFON1VJSUdQdUpMZGxBdzZidXlNY05q?=
 =?utf-8?B?eHpObk8vazRMQmtMOXMxemhJVTJEdTQxaW9mck5ibFJ3T0QrTkJySXJhM2l5?=
 =?utf-8?B?Z0JIa29tSFZDaG9LZTdPUDBYZlp3MExxVGpscFh6cFRNYWNVbkpMOHh5aStk?=
 =?utf-8?B?QU9zWUlaYm5hMDhMTnIwMXh1YnJZWCtYZkR1N3poRjQyVUFWcGM3d1lUdDIv?=
 =?utf-8?B?dWhzaWwyQ0NHSHBXTzNabURIQWNieTVLVWZXYnhwR3VGcDJ5cXpTQkd6M3RW?=
 =?utf-8?B?cU5yVFZ3MG54Zm1RT3doeXp1ZzBKSGJad3Njdkh1Y3FCV1JxR3g1dU9TbU5O?=
 =?utf-8?B?b201cS9OVll4d3BCeGRxdVo2cjlUdGtJOXFNZU1DNWtiQ0Q2SndXSWNDeFZt?=
 =?utf-8?B?T291aHduMFJ5YTJsNkFQWTVlV3hSdDgwYWZsNlJUQXhocHdSYXJ0MjlXT1Na?=
 =?utf-8?B?QlhHZFlqcGhwWThNZkFERHdqU0pQZDdkakt3RUt5OStZTDZLWFRKSTgrMzBL?=
 =?utf-8?B?WFBFNmNQTWNXL25ucmVqRFhiUGJoTEdtendabXp4eW1jSzFXYzhyaWo5OG0w?=
 =?utf-8?B?T1VXeUxJelVTNGJESmIvQW9vck1iRFIxaWVnSlM5S0F5RkYxZTNybUE3cTVo?=
 =?utf-8?B?ZU51U1paRGpQc3VEYWhNYkQ1WjlkVHBWcFh1dEczcGt3cDJSckNrVzhCUmdH?=
 =?utf-8?B?ZHpVV1RweDNYWXN5Q2lBNDdTTGoxaDNWeGZLbXhaTGVPeEpNamFvdGZMWFE5?=
 =?utf-8?B?clFkRTNXZXlEWDh1ZmduRFJpYVBrQmtuTkRiK3dhN0dOUWxUWmN5b0RXNlhY?=
 =?utf-8?B?QzFWZXdxN2V1dlBiQnBLZ0FtQkU1bjgrRUs5c0VqZkFLWi85VSs2bjBUTFUz?=
 =?utf-8?B?MzMrSnJKTEhBNHE5NGNSMXFlcUJRY0N0UnUxcFErb0tPaXFheXcrUDQwVGpS?=
 =?utf-8?B?eFZLdTJyRnBmd0lUZTk2MWNqd1lVYkVyL0kxTmQvbnBlN3lqUmlWS1RzR1B0?=
 =?utf-8?B?akNqMk52ZThZRFdhNTkwL2xzRGFGVUx6SGZlRU5ScVVjYjQ4d245TVpNaHQr?=
 =?utf-8?B?QmptclJ2aEJQZkhOZTFGeityRDZPSVJuaFZmWVJvdnMrcXZwQnlLTXhWSndJ?=
 =?utf-8?B?T0ZJQlRKUVIvMFRCclV1VVhZNGdsNUtDakgvZWdxYWVPZjh4NHlLQnVhMHNr?=
 =?utf-8?B?cTNEUDNsRjFRV2JxRW5xOWRkU2dNQTAyZFpub3d3eWZDVDFBczcxTisydS9q?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e553881-22b6-4ec8-5786-08dbf7fd0119
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 14:50:22.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWwwuGoQ7NvWJhFl+qalDK2hVqalNBeCQWZMbelegHZlWy6i1wquTb+PRpHeEmzU/C2Wwd5BONVxignPpoonObjSUB4+HYffRmoF2JHH8Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5361
X-Proofpoint-GUID: 0WnkYdRoQJkFfNBfhyzUkVw6aOyzyn1p
X-Proofpoint-ORIG-GUID: wPNqTnA6-HkBuCgX1bLNygH2XBFVcTgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192074

--------------OgReOaIkjcWgRklGRb0FkXal
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B8CbVDS021170


On 08-12-2023 19:37, Alex Kiernan wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Dec 8, 2023 at 1:55=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>> On Fri, 2023-12-08 at 13:47 +0000, Alex Kiernan wrote:
>>> On Fri, Dec 8, 2023 at 9:56=E2=80=AFAM Shinde, Yash via lists.openemb=
edded.org
>>> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org>  wrote:
>>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>>
>>>> In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from t=
ier2 to tier3.
>>>> The mips bootstrap compiler is removed from src/stage0.json file and
>>>> so the same are removed from rust-snapshot.inc. [https://github.com/=
rust-lang/rust/releases/tag/1.72.0]
>>>>
>>>> Drop bootstrap_fail.patch, getrandom-open64.patch
>>>> as they are merged in upstream rust.
>>> ]>
>>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>>> ---
>>> If we're going to go down the road of disabling the rust oe-selftest
>>> (and I don't see a better option right now as we're well behind), I
>>> have a series which steps us through each of the releases up to
>>> 1.74.0.
>>>
>>> It also avoids the need for the library/test hack (upstream has a new
>>> target we can use for libstd).
>> This sounds useful, particularly this last piece. Can you send it? We
>> could probably combine it with 2/2 in this series if Yash/Randy agree.
>>
> I've pulled that in as the first patch in the series so if you were
> bisecting you wouldn't see the oe-selftest fail on upgrade to 1.71.
> It's on top of the cargo cleanups I posted yesterday, so I suspect
> those are prerequisites (or I could combine the two into one series?)
>
> I've not tested every step extensively, but they all build and I've
> tested cargo in most of them manually inside qemu.
>
Thanks Alex for re-ordering my patch with your patches. Regards, Yash.
--------------OgReOaIkjcWgRklGRb0FkXal
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B8CbVDS021170

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 08-12-2023 19:37, Alex Kiernan
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5RLXtwaVULLQWh_atppYvO_r-=
qibP7AMyE7KiLyj4SAvA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Fri, Dec 8, 2023 at 1:55=E2=80=AFPM Richard Purdie
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfou=
ndation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On Fri, 2023-12-08 at 13:47 +0000, Alex Kiernan wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Dec 8, 2023 at 9=
:56=E2=80=AFAM Shinde, Yash via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde=3Dwindriver=
.com@lists.openembedded.org">&lt;Yash.Shinde=3Dwindriver.com@lists.openem=
bedded.org&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
From: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.=
Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from tier2 =
to tier3.
The mips bootstrap compiler is removed from src/stage0.json file and
so the same are removed from rust-snapshot.inc. [<a class=3D"moz-txt-link=
-freetext" href=3D"https://github.com/rust-lang/rust/releases/tag/1.72.0"=
>https://github.com/rust-lang/rust/releases/tag/1.72.0</a>]

Drop bootstrap_fail.patch, getrandom-open64.patch
as they are merged in upstream rust.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">]&gt;
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Yash Sh=
inde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windri=
ver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
If we're going to go down the road of disabling the rust oe-selftest
(and I don't see a better option right now as we're well behind), I
have a series which steps us through each of the releases up to
1.74.0.

It also avoids the need for the library/test hack (upstream has a new
target we can use for libstd).
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
This sounds useful, particularly this last piece. Can you send it? We
could probably combine it with 2/2 in this series if Yash/Randy agree.

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I've pulled that in as the first patch in the series so if you were
bisecting you wouldn't see the oe-selftest fail on upgrade to 1.71.
It's on top of the cargo cleanups I posted yesterday, so I suspect
those are prerequisites (or I could combine the two into one series?)

I've not tested every step extensively, but they all build and I've
tested cargo in most of them manually inside qemu.

</pre>
    </blockquote>
    <span style=3D"white-space: pre-wrap">
Thanks Alex for re-ordering my patch with your patches.

Regards,
Yash.





</span>
  </body>
</html>

--------------OgReOaIkjcWgRklGRb0FkXal--

