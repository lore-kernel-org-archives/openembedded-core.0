Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1591BC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 16:38:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27249.1706891916445331944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 08:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cgChWoLe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2762c8d993=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4126Ux2b029790
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 16:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=ZHaAcUmAOU68QwzCHJe
	7pSTT0QpAdMCqFlH1T2X8Yjc=; b=cgChWoLe6v9oF1BRS9HdbhrHC8zcsfqUin7
	kRuCsRWHp/E+VDA8xys+xqxmQndBYGYNCRtoBUJ9EJAbnfelCF8mPi49Wv5jPl8e
	v9I7vSG8aJRvBoQMuj9DMN9YjP+uJnCegdQzZCxm9wvCyFfi5x6jKdCuu+GZX2h7
	iK8zgc3YKWZz1igTO8cRy17MPlUCCZ8HoNLvQQc9YFWZqFPqhtNYhjloeJI4zlQu
	gNaSvAF1bI9QTMobf9fmi/x5WM0ZE3lRFPlVkMSPF1Zh82ihovbB8Oh/o1Ci9G80
	HvNytnDxX0GS9SLJsxHq9BiVDOlmW/hWG9QncWOMB26/4fzAmpQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvcrn1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:38:35 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 412GcZCq004689
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 16:38:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvcrn1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 16:38:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyA/rqhLlTCRGb2fpHvRcBxeMdmF0HlavI/DjJ/x3BxGhi5M/3ogL0QA6qRAJO1GeRdTu/RhedmT7br7f6sZl+IYWEOwP8AiQtf3aiHPRmtB4pqWwTt3bCtooFZv+TOlsmtPLSdUHGRj2fgfDlvHYcMegjoihjtX2yO24TWjY25i8HfnBT6C7Egdqt8n6eKKs1PfYSd7y/jFgGHlPklVhX1knSLf17cpHmPg+EpifcsyH7MGX5vn3r/rBVWO95kYpLJ24HX+n8RxE3YmuYe2VMBenNvAW05bOkncVj+93IhBoCi59HXpulyLassCPO0AL15M/egb7Tgq1hraoUpAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHaAcUmAOU68QwzCHJe7pSTT0QpAdMCqFlH1T2X8Yjc=;
 b=WJ0KY9/TEfqF7FByQL5MdiLbWY4zW1t5YiMc6LP5xEG2vKF2nPT6VkOk/wByusEUjf2w2GK/izRqT2m5lZPXUnRQuJoTtzUGPbzl9QYPXBSzZlnz8TonOK8AILl3mIt8Dacd5r1gl45/Lwevk0ggq2Nu6A47erhMiCmxQ1l8TFzNL/j1AaYinIY/colSdYmXESS0ajU53fUGn1e9Pr8nWUdoZJBRWEIHqzfYqTRSv2T71YF4E6DMhAd/QSkG1UiBgc62WRICbfpfXFsQV8kAS7LoxGXx/2u5ijnfJVH24qsxJJl518jQosCxmbKRWnoD2eDkzCigVkzF7MDUCAzTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by CY8PR11MB6988.namprd11.prod.outlook.com (2603:10b6:930:54::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 16:38:22 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 16:38:21 +0000
Content-Type: multipart/alternative;
 boundary="------------lW8ycW2L2L4QPyDKBvjSYZKP"
Message-ID: <06967e71-38e7-45e7-99c1-952bf1e95696@windriver.com>
Date: Fri, 2 Feb 2024 11:38:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
Content-Language: en-CA
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>, Khem Raj <raj.khem@gmail.com>
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
References: <20240202120735.3742584-1-Deepthi.Hemraj@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240202120735.3742584-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|CY8PR11MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b49c027-d0df-4227-d4b4-08dc240d5e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NrLPubK0vAf+gE1WFRnfupvxpGYX2Pd6pT/08xa1NV/kjGzopj8k9FTMXCNqIIalL/ieYPVJ2xx9wClB5ELr3aEQ81zTiIY47wdTvCMfW6iJn+5YkWd3VCMSzLqcplYQeqpoPjmffzAKiZsZprytOsXJ0eWIChtwmmtihuVCHybs4jIvch+Eu1fsdY5GobmjbVM+duMctex6zbUBhSmFWb8enKkzONM6WcgxEmJxuByRJDEbj4RbK3wiINsBRR7ECVCyDf65GKa115SHGZ13m0gmeAvPpZHfRgfnUNWPrzJaOusy00uKhswIfWD1Ob/hW5iO5wjo8oUAnFLqm70/PAXeTCdSb9NHi21gLbC+PKCMpyKq7RIoYlrNfSUW1F173Oj9iS1rueQs0uYAVpxgbsJK5rlnSnKvjO3wEnfb8LMhGcx8E1tso2HqtquwgoJnMMPOW3waC02C0sKQpgWd2DJvQmFaDhzjmzs3o1agvhxrJz76RG3EEqVQaqWWG8kJxjyquu05p1uRYTqD+YrwYuUjWisLoFfWNGB26qiqLUEKQBuiDYM4oXwY+wBiIvdnT0WYDOzHxOe2n+gnc9oXq+TzVbP9jSSUrb4o9+6Y5ES7TKNa2O+tZUenjuYsT4es
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(39850400004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(41300700001)(83380400001)(26005)(38100700002)(2616005)(6512007)(166002)(4326008)(5660300002)(8676002)(8936002)(316002)(66476007)(2906002)(110136005)(478600001)(53546011)(66556008)(6486002)(66946007)(6666004)(6506007)(966005)(33964004)(31696002)(36756003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZEEyOFQ4ZG5aMnZiNk5zWEtpMVZpV0dZdUJXcDlib1YzU3ZWWWdRaURiNVJT?=
 =?utf-8?B?bHFCVmNlZFl2WmZpeFdCejdETVhkRU11bTRXTVBuTFMzSDUwMk5UbnIwS3M4?=
 =?utf-8?B?UWlCODZ0cXBaYnhkenJCaVo3TDdmYVZFbzBaVG5OV1VzQTB1eVZIKzNqRUFS?=
 =?utf-8?B?S2kyYmh5ZnJnYTlSZ29tKzZqNk1TaWtjSVA4VHU3RlRRSDBLU0tBelhsNCtV?=
 =?utf-8?B?Z3NzajlTRnBzSExobkRZOVNLcGQrNnU4a2pjMGEzZWhDdXRzRVNyeDZNVVVK?=
 =?utf-8?B?RklrMWQyTjRFQldjckJvZm03UExYSG5qVTRkMDhtbGZPeC9lZEZlelVobjNU?=
 =?utf-8?B?Z2xRUUgwaWRab01ib0tIbXZmZXhhSkhoUDZTak5IQzN0Z2Y4VXk3TG91ZFJ1?=
 =?utf-8?B?U0pac2xKMXlMOS91Q3BLOHZ2UnlBSldmK1gxMkhRaWRvZDdaOXg3SGhtK1Zw?=
 =?utf-8?B?VlNVa25RZFF0NnVFZ282SHZrV0JGU0UzOUlaMXJNRjh5ZG9vT3IxY29JVk1n?=
 =?utf-8?B?WlA2MXhlYncvMkw0a0UxK013ayt3OXI4dEJTcmNtMDE2NGVsNm90NGRncVNq?=
 =?utf-8?B?Ync2d3B4RUE1VXRmODJVaDY2WS83QWtqUUNPUGtqL1EzeFdWZjNCMjAyZnpL?=
 =?utf-8?B?SUliS0xqVmdqQyt1dExCQ1FwY1IrNUVPOFkvZUFZMlgxSCtyZ3p4NkFlaXVh?=
 =?utf-8?B?WDltV0RJUHVDV3EwdHZZYjFESmh2ZGNHTWFWWU11RXpNYXJYMStBNHpkbjBu?=
 =?utf-8?B?Ny9wMWxFMmtRQzdLQTd4NVpXTWZoTW1FLzJZTWQ0ZUJwbDh5dVBTeU16a1Ax?=
 =?utf-8?B?OFBRWTAxSk1JNmhXS1ZvakhLTlBLV1k4bGNJRTNGUE5SZXozWmVkRUxFclhM?=
 =?utf-8?B?Z0NrZ1U0YmcvYWt0bjR2WWI1THhOQ1FySG1ZdW5XM0g2VS9sdThQU3ZISDVN?=
 =?utf-8?B?bncxWTNzd1ErYW5Pd1F5SlY2L2xRQ21OOGlrVGdmZ3ZqVDg1amhJSEdKZCtJ?=
 =?utf-8?B?dE5qc3EwMEF4a1l6UWFyZzN4T09TRFpTTEd6dnNhSGp2TXlOTWZ3czhpb1li?=
 =?utf-8?B?QTlrNzUrcWhJdW5Vb3Rwd1ErT2NaYnJYRGdyV3Z6K1RQYXdYNmpRaGpoZWFu?=
 =?utf-8?B?ODMxMzJ2YkQrbDVPMldvT3pQY1Jqb1N6dWFMV3hyZGF6cXljcjBUOGhsRTBO?=
 =?utf-8?B?dngwbmxhVnNhSkFpWHFFdUlJNnd5cFpCOC9hbWljL1ZYSWpHQ3VyMzRucHcw?=
 =?utf-8?B?ZTZ5NUpLdEJOazVqMjdjTVJRN05lQmlXekRWV0N5SEVpdDVRZFNyRDRlMEJr?=
 =?utf-8?B?dVM0WkhMeWg3K1g2dTh6QzA2dkRJYVJhZHBCcWhHSzRGbU9rZ2lHQ3UyZVo2?=
 =?utf-8?B?bjVVR2xKbk84K3ZRWXgzU29YSVdJeHRJVFZ1VlIvNXR3L2dEMDE4RUFCWHFi?=
 =?utf-8?B?azFYaFE3TkR0eWc2TUpQR05CbE4xL2piQ2w4bVVpQzBzM25EZTNpS09FdnJ0?=
 =?utf-8?B?dENPS3JsaVplUkI4eXZMNHVkL3FBRWI0UkxrYml2amtmOWZOdWpNalQ5WTFE?=
 =?utf-8?B?YThHeFlnUXFGQ1g3U0dNNEhpYkx0RWxoQU80V2ZpZnNuYnhVSzVjUzRUckJW?=
 =?utf-8?B?bGZmcDhENUh3R2ZUcEtRcklaTnBUMzBJMUNxd1ljZ0F2V2ZjdXY3QzBsZm5s?=
 =?utf-8?B?UC9HRW9sQXRiWVJKcllHWnNjUjZZZ1hOZXdiaWx4b0RoOTNHazUxS3c5c0ow?=
 =?utf-8?B?VldoeCtpMVV1eE9uZWZ3OXJWWmhoWWxPYU9GTjlsTm03MjdrSkFpcVNzeEJ1?=
 =?utf-8?B?M1dQL0c0aXpqeTdaRFZETGl0M0o0ZXlOSVBGQUFKSWdIeXhyYzNSYUMwb3BS?=
 =?utf-8?B?ODhhT2V3VGZaSUpybHlMMGJlOXlPZHlYamtvRWd3Rmlnc1NoalZUZTRTZHZE?=
 =?utf-8?B?bmFaNklyS0llbTBsSU9WS2RnRlpMWjl4MTEvNFFEYlZ6elRQOE95RnliZzV0?=
 =?utf-8?B?a3FsMTdFUE5uWjlxTnluZlpLb0E4aW9oWXQxcHlaMk9rU2tIUVhmdGh6UzFY?=
 =?utf-8?B?alAwRVlCb0VxK3Y0VEpRalBBdEJtUGlhVDJEV29VekZhekJ4NGczdFhtUE10?=
 =?utf-8?B?MGlCQ1lQcmJhTlVtdnlZMUJBWExNY3N4QUJjTi9jYkJkb1M5THI3SUxXSW8z?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b49c027-d0df-4227-d4b4-08dc240d5e18
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:38:21.2951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eHYl4SBDS64InI3AS1J+TPvGqSGy5efnY85K/cdLO+VLUB/3+TIdhHrfO1osetttCZlMhN5yAPeuLosxXP+ZsNN6gSvGS6TqiKmK9BsMqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6988
X-Proofpoint-GUID: 9bUB95FYTnI3vXSwmw50U56u4xQX0bPB
X-Proofpoint-ORIG-GUID: ZuvMxzKHC9QhbE44fI5c4yB3RqQlncR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1011 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194809

--------------lW8ycW2L2L4QPyDKBvjSYZKP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4126Ux2b029790

On 2024-02-02 7:07 a.m., Hemraj, Deepthi via lists.openembedded.org wrote=
:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> Issue: LIN1022-4854
>
> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   .../binutils/binutils-2.38.inc                |  1 +
>   .../binutils/0035-CVE-2023-39129.patch        | 50 ++++++++++++++++++=
+
>   2 files changed, 51 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2=
023-39129.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/re=
cipes-devtools/binutils/binutils-2.38.inc

This commit fixes the version of gdb internal to binutils.
I had forgotten that binutils carried a copy of gdb so it's good that=20
you noticed but
our binutils recipe disables compiling gdb or gdb-server:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/binutils/binutils_2.38.bb?h=3Dkirkstone#n21

And from a mickledore build, it seems that we don't install an binary=20
with gdb in it's name, as expected from the reicpe;

=E2=9D=AF fd gdb tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packa=
ges-split/
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/gold/gdb-index.cc
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/gold/gdb-index.h
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/include/gdb
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/include/gdb/gdb-index.h


Added Khem in case Steve isn't sure if we should be patching the=20
internal gdb in binutils.
I guess it won't do any harm but it is extra work that we could just avoi=
d.


If you need to re-submit, please do so with a proper shortlog:
You have:
[kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129

It should be something like:
[kirkstone][PATCH V3 1/2] binutils: internal gdb: Fix CVE-2023-39129

Thanks,

--=20
# Randy MacLeod
# Wind River Linux

--------------lW8ycW2L2L4QPyDKBvjSYZKP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4126Ux2b029790

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-02-02 7:07 a.m., Hemraj,
      Deepthi via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240202120735.3742584-1-Deepth=
i.Hemraj@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Deepthi Hemraj <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver.com">=
&lt;Deepthi.Hemraj@windriver.com&gt;</a>

Issue: LIN1022-4854

Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;=
</a>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0035-CVE-2023-39129.patch        | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2023=
-39129.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc</pre>
    </blockquote>
    <p>This commit fixes the version of gdb internal to binutils.<br>
      I had forgotten that binutils carried a copy of gdb so it's good
      that you noticed but <br>
      our binutils recipe disables compiling gdb or gdb-server:<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/openembedded-core/tree/meta/recipes-devtools/binutils/binutils_2.38=
.bb?h=3Dkirkstone#n21">https://git.openembedded.org/openembedded-core/tre=
e/meta/recipes-devtools/binutils/binutils_2.38.bb?h=3Dkirkstone#n21</a><b=
r>
      <br>
      And from a mickledore build, it seems that we don't install an&nbsp=
;
      binary with gdb in it's name, as expected from the reicpe;</p>
    <p>=E2=9D=AF fd gdb
      tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/<=
br>
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/gold/gdb-index.cc<br>
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/gold/gdb-index.h<br>
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/include/gdb<br>
tmp-glibc/work/core2-64-wrs-linux/binutils/2.40-r0/packages-split/binutil=
s-src/usr/src/debug/binutils/2.40-r0/include/gdb/gdb-index.h<br>
    </p>
    <p><br>
    </p>
    <p>Added Khem in case Steve isn't sure if we should be patching the
      internal gdb in binutils.<br>
      I guess it won't do any harm but it is extra work that we could
      just avoid.<br>
    </p>
    <p><br>
    </p>
    <p>If you need to re-submit, please do so with a proper shortlog:<br>
      You have:<br>
      [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129</p>
    <p>It should be something like:<br>
      [kirkstone][PATCH V3 1/2] binutils: internal gdb: Fix
      CVE-2023-39129</p>
    <p>Thanks,<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------lW8ycW2L2L4QPyDKBvjSYZKP--

