Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17908C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 00:18:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.771.1642119503864971705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=PWLO/wJo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8013922c5a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E07ZMY003545
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:18:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=885busUTOMLyAdTjs1/M+sz+heylStM2I31zRiMPrq0=;
 b=PWLO/wJoACNxAHn6I8s4Yrr1YJ9fKzpyeUls9h4t3/aQu/OvoYifpkiOOsXibq9f4p42
 QCNW1dusgMh4Nzh7U8l6EoKEvfKmr83NsI278w03hLbwOVqUo3Ch/KhbbrkLF7jLxB+e
 75Mp7mB2xm8gFZsoQkNdN6PZupoebFFa+PXSbyYuSdq+JrsrFq+ABkHY4z3mPpGY7j1W
 8v81yw87xkwyP+P/V7E/foABe3sslo3w61HfZo0hhRcqqy/0AD4NUn8i/JxejsWbTWv0
 zrAopqo/GIEu1Afuyy6cX7hvfFwwP8mrjrezjnaAEDdVeF0rVgvhyvkcb7sgBSyWpN1r iQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy07994p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:18:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKAZosjq5T0IPbrFKOVMX9vYEjP3FP8BjVywjMKqLchEFWOUnPNBg+WMGo6NuBiE5KX/d8FAXpFPZGl6Em1AwwEruzxJsOQjU5jEz51OjFATiaT3pBsOz0K7UX3OOqkKoZ9/FD/GbfLvCS9XpwmPViVUDfYl3F66L5bCIzf7ONTfvhSn5y7WcpsrnTfOzWjWV1tHIyLAx6Yt4fzM7eLZXzIgRjGGPlCeHqCMqsnpUbfDU45Se1X88a9A/VNY4zKuwB1Bw6TAEgTlgrOVXw/v/FqsEcUqVajKqoOHvvnPKv9MulLcqRBM5h65xgWa4HI/NZcXJcT9VcUrUApB2duKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=885busUTOMLyAdTjs1/M+sz+heylStM2I31zRiMPrq0=;
 b=XXOdd0rNqquxxGe02qYPWCwJMpB/4T6bT6+dQbQoyx6BJ4DnFHcziVelVdTt8lCn18DfcgPe2IvmQ7DuE8hSeuQE9Xp8BveFSdCTC3fJNakJz7j8erzgRHX+6uncEgaqnJ1arjDMKdm6DcmBJNVjG8yM5PZdWa5idC7qLlKrTx/jq9vEOce7CIZCRxFjE2YDC1CyV64H9Zih8ORYX+95cikCqQEyIHrPblcN9zv9+TsWPtFNxpY7DU863KC6op2xbde0/Eit2x5gm9CiPMGg7U+3/BQ87Ikqmpv4NuNfmxWxJMbhvLSFVTf0+xXApJAfydvDmQ+597z/bM8ono2X2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB2604.namprd11.prod.outlook.com (2603:10b6:5:c8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Fri, 14 Jan 2022 00:18:20 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344%3]) with mapi id 15.20.4867.012; Fri, 14 Jan 2022
 00:18:19 +0000
Subject: Re: [OE-core] [hardknott][PATCH 3/8] qemu: CVE-2021-3595
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <20220114000641.33969-1-sakib.sajal@windriver.com>
 <16C9FA5A611A7940.25962@lists.openembedded.org>
Message-ID: <cfcc8dd3-b2ec-348e-47a6-c5db732360cc@windriver.com>
Date: Thu, 13 Jan 2022 19:18:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16C9FA5A611A7940.25962@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------278219597EF351494C315167"
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::30) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad355b17-6f74-42aa-166c-08d9d6f35e36
X-MS-TrafficTypeDiagnostic: DM6PR11MB2604:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2604403941591CA178F886F9F2549@DM6PR11MB2604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:210;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n2phE8ncZ0yNVQ0rb30Fbp0ao6U+NA15Qa2TssMYmG1jZtuXIJx5KHr+nlg6MKckgykE8rVgSR4DQGX+jndvkjUhWyaR0UaIh6IePBz3bHYROAOuMWNyFLrzbLqnnUbfJZHpA9P6oZ7i3A4maSsjMJNXFFDosOrQKnnJ0d3LhgZGJ17cypZf37Q4CvGF1JYLKvCxWuTLjL7CSnbgzO/CYfDn0Ua8x/dksKv8LRLqcghUufB3HNY+6JLHgiz8QgbMRtGhKj7FTrjprd3ImFSjgP2u3gUHmY6PrKK/yY97lzJhaB8ohm0abB9DU8mFpc0Jre8QfQlbCmBXccbfa3vgnPF5S6+uvf6kHpxBepxzthpues08xO0zHc120/Wry1ElBce0djfDMXDSkctqXlIxsDMdpo/A8eDGmHWWs1mRODD29xqC4tCC9bagzoMUzS/4qxQQ8VvdHJVyw2Bb1ReiJUxNWWnZynlFr4J+wupREuklURvKmzyq1HjWmWce01py2+NJ8ymZ5t0DsCO1IpJUYa9+D33SXUjJbzL1UWrUvAwrf/rfzOuW15EdkgPnlyX3QXzqfhx9aIXQCIP6BV90KDrG76hsy3WP0hM4jB5SJniWHRynwlXARPwie6Eejjou1lyxAQfpDdOWjCvqO/M5rzCXrUFKFDrT00W3EfI8oHE5oPGvgeXtrivB+eRWns7/Gq9oMgV5lzX7pNClvaWZETPXrIsIUBOAoDiYUIlrbgCFd19oCnqafYcqFjdLa4ud/N1xJRk2TFJ1yShbJoOamKUE64wqw8K1ikKQS95xk4JWhUrqVWFg44vK8txbmZ9PmUhSEu0q87tZMbBkjc5d3OHjuwgszyRrT9uE1PPVXd//hLFZ+KUPyMLBinl7IRzo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(66556008)(6512007)(36756003)(44832011)(86362001)(33964004)(31696002)(66476007)(31686004)(26005)(966005)(2616005)(52116002)(6506007)(53546011)(66946007)(186003)(5660300002)(38100700002)(30864003)(316002)(6916009)(83380400001)(166002)(8676002)(2906002)(6486002)(38350700002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aC9ac3dIYS83TWhqdTBPb0pXR0tSeE1OT05CNStkdUpVVlVqNm95cXUzMjhR?=
 =?utf-8?B?MDcvbXhzTmh4dVZ2UjExbC95SU1jQTR4YjJwSm84NjJFWml6Z2RmeElObVAv?=
 =?utf-8?B?cW5CdnlLZU5XclMvdDJ5WUtpWmplTUllR3JiVFJ3V29sdU9QOXp2MWZzOEJD?=
 =?utf-8?B?TmxIMmhFTWIwbEw0RExaYk93SjFFejV0YnFNQ01KTXY0NWppRHNhbTNJSUpI?=
 =?utf-8?B?bk1aMVFuSERjQnZEaEJSVUlEUDZTOFp0SW1qaEljaDYyV2hMcGJDTjZkVXRv?=
 =?utf-8?B?dTk5eUNFd0FNNms0VGhTNTVRZDRoY3VrT2psd29KS0tScGx0dWNiNytuUG1v?=
 =?utf-8?B?dUtzK3dQZTNlOW03cVhBSDJBZk1LZDhkZlp0M0Z2c0hSckRxOWcrQVowdHZ3?=
 =?utf-8?B?Umxsc3FveHZqaDVFYjZHV1hmK3dRUWdCalp1SHBRSDgyYkZtcDFIT016VmR1?=
 =?utf-8?B?enNUUC9NVEVYWit1OEpsdXhBcEJwVGJSeTZIQlpUaHFMVWRvM1BhUjZJVVkw?=
 =?utf-8?B?Q1JEdkhsT2E2cDVEdVBnbGNybThOcVhWeE0rbDZvNVIra0VoM0JYQ3g5SXBm?=
 =?utf-8?B?RWdPTUY4am1zbmswMTcxU29rSHhWdDMzZDdsUnJTWVJkT3NHV09aZllLQWpq?=
 =?utf-8?B?ZytYcE1WS2V3QUVWVkhWMlB3V2k1ZXBESXUwUGdaV2RGNUl5N2xDVGc1ZDBF?=
 =?utf-8?B?SXlHczhHa0pUaUxjbTNyQ2RhbVJSMy94OUQ0aThhR0Erdnlpenh6U0hHMWN3?=
 =?utf-8?B?NW1XTXVjZ0NOeUkxcmFKNnVFb2o4RkhnSVlCdTB4QVZ0SXdGQ2orN01MQktG?=
 =?utf-8?B?b2VhTEVBZkk0MkZQSXpFcHltMUxtajhpdWVUWjdaOXJldWI2OEpmUjE3d2NH?=
 =?utf-8?B?cDFtbXJCejJDUlNYM1FUL0pscjFBWEtDNDNmNDBqUWk0ak5BVHYwNkNGbDIr?=
 =?utf-8?B?bnhrcEVOaFBjdnk2N3FtWkZjcENMVEpUQ0hreEcreG03SXpEWUFPWW1HNlZh?=
 =?utf-8?B?emltcDNCWFZRNEc0YjYwUlNzcitmRk5JZ1BRTHQrbVhkVHNUTGtEOHBlOTZT?=
 =?utf-8?B?ajFPclpnYnBGYXJyK1Z1cExLT1ppT0NDTFRxdjVyakdnQ2FNY1c1YU1UalRu?=
 =?utf-8?B?SHhEeUhMWm9MK2RoeTBhQ0JraFBsaVRwbnlkZjJXNFZsc1NNNm1EaEp4MEY3?=
 =?utf-8?B?b0pJN2QyNlNFbmVXNk92NGIxVWZsZEhxcG9KcW5uMUFVS2lFWGEwb29IWXhk?=
 =?utf-8?B?ZVR5TTRzSTRhRU1yeGhuczUvQ3M3QURnanAvQjRzUUJjMmVNS3QwM2F2cVdB?=
 =?utf-8?B?VmJLOVdReFN4RGJWS2J6SkxjdU4zL0xwcXZoU05wVEt4NXdFM1kwRjdMR3d4?=
 =?utf-8?B?dmJnOGQrVVJacFRWZS9UYnFHa3puRFRlZFBWYVBqSnpHeWVMODBzTkRZeStC?=
 =?utf-8?B?ajN1TE0xeWxjWnp2b3Y0WU05dmswa1NqdjNGVTBPbHAweUdTN0dOWFdQL0l5?=
 =?utf-8?B?Y21yVGpwMDdQdlh3QnIzQ2lmeWM2ZHpaMGt2aWo5NXRVUk0ya0Fyemg2YnMr?=
 =?utf-8?B?UE1yTjFQNWRveHRIcUx3dVBNSEtQWnJuMm50RDJLM1NRWVNVL3U3NlB5bFpL?=
 =?utf-8?B?V0Zqb2NPd3NZQU00aGJZZXRsVzBHNTJrd1graDBZVEdjdk5uQXBDVTVxRHhT?=
 =?utf-8?B?RDRCNXR5R0VtdHNZOHlXSXRhOENuQW0rK2ZNNzN6UTRhYVFreEV3b2VtOHcr?=
 =?utf-8?B?b3BWRWd4UEMvUmd2cDE3RnZJeldSODlRS1FqZ2YwTW01UHVmUGFpQlBBUDR6?=
 =?utf-8?B?RkRqRFQvWVR6dTlmM21pNE43b29mZkVjblU2M1JmaSs3VWkyR25wejlySmRq?=
 =?utf-8?B?bFJkNDFJSmFpWVU0dm9YQlBaRTFOYmttcVVhbGpUTjZuMHpuVnU3Q1lWeGt1?=
 =?utf-8?B?V0E4b1pxekF2RVZjNDdwQWJ2WmtzV2xkV3pEd0RKb3RkbTJ5VW8rbWVrRkFY?=
 =?utf-8?B?OVlMdldyTmMwNlREYTJya1ZhbzVTekNGdzloZEJCbWVneXZhNTQ0WnlWTUV3?=
 =?utf-8?B?ZnROaEJKdnhlRzB3eEg5Q0dHY3lnbXp2bWJ2WEZwZlRaQXNqWENUdTk5UXA1?=
 =?utf-8?B?YTRyWjk0KzNUQWhPdTEyZ3JJUXRIcmRLVGFnVGNxc2xwUk83MytwSFdLTWNv?=
 =?utf-8?B?VGpPeGQxemRaNy9YM0FkK1pFWG5uNmZvbjMrRys5KzRIRjJaNEFtNlNGTXRL?=
 =?utf-8?Q?MwF2Z+b0PSZ5L4kp3mjpl3FXnGZnSuGydOvIB1bHvg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ad355b17-6f74-42aa-166c-08d9d6f35e36
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 00:18:19.7666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5wSxGidgkPeVZ9uioEq5RzXx1d2Ikqf17+wIrhjvvZfkvRGp7s97AJjMmB4mXO0cyRM2wrkT1yRwg61RgoWPYm2Ua1IGhQEbQmgMmrywBZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2604
X-Proofpoint-GUID: 5INElTXZc3sNqZbq6KvJSiOalGfdLBTm
X-Proofpoint-ORIG-GUID: 5INElTXZc3sNqZbq6KvJSiOalGfdLBTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 00:18:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160551

--------------278219597EF351494C315167
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20E07ZMY003545

Please disregard this set of patches, somehow it failed to send the=20
first 2 and one in the middle. sending a V3.

Sorry for inconvenience
On 2022-01-13 7:06 p.m., Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |   2 +
>   .../qemu/qemu/CVE-2021-3595_1.patch           |  41 +++
>   .../qemu/qemu/CVE-2021-3595_2.patch           | 253 +++++++++++++++++=
+
>   3 files changed, 296 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.pa=
tch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.pa=
tch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index 6b544a4344..811bdff426 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -74,6 +74,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>              file://CVE-2021-3592_2.patch \
>              file://CVE-2021-3592_3.patch \
>              file://CVE-2021-3593.patch \
> +           file://CVE-2021-3595_1.patch \
> +           file://CVE-2021-3595_2.patch \
>              "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
> new file mode 100644
> index 0000000000..aefaff01cf
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
> @@ -0,0 +1,41 @@
> +From 6b62a09d6c264cb84f560a418beb027f47bc5069 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau=
@redhat.com>
> +Date: Fri, 4 Jun 2021 16:34:30 +0400
> +Subject: [PATCH 05/12] tftp: check tftp_input buffer size
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes: CVE-2021-3595
> +Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/46
> +
> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3595
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + slirp/src/tftp.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
> +index c6950ee10..e06911d42 100644
> +--- a/slirp/src/tftp.c
> ++++ b/slirp/src/tftp.c
> +@@ -446,7 +446,11 @@ static void tftp_handle_error(Slirp *slirp, struc=
t sockaddr_storage *srcsas,
> +
> + void tftp_input(struct sockaddr_storage *srcsas, struct mbuf *m)
> + {
> +-    struct tftp_t *tp =3D (struct tftp_t *)m->m_data;
> ++    struct tftp_t *tp =3D mtod_check(m, offsetof(struct tftp_t, x.tp_=
buf));
> ++
> ++    if (tp =3D=3D NULL) {
> ++        return;
> ++    }
> +
> +     switch (ntohs(tp->tp_op)) {
> +     case TFTP_RRQ:
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch
> new file mode 100644
> index 0000000000..1ffa6ca988
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch
> @@ -0,0 +1,253 @@
> +From d71caef98e331268519578fc0437e2ac02586940 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau=
@redhat.com>
> +Date: Fri, 4 Jun 2021 20:01:20 +0400
> +Subject: [PATCH 06/12] tftp: introduce a header structure
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Instead of using a composed structure and potentially reading past the
> +incoming buffer, use a different structure for the header.
> +
> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3595
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + slirp/src/tftp.c | 60 +++++++++++++++++++++++++----------------------=
-
> + slirp/src/tftp.h |  6 ++++-
> + 2 files changed, 36 insertions(+), 30 deletions(-)
> +
> +diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
> +index e06911d42..a19c889d3 100644
> +--- a/slirp/src/tftp.c
> ++++ b/slirp/src/tftp.c
> +@@ -50,7 +50,7 @@ static void tftp_session_terminate(struct tftp_sessi=
on *spt)
> + }
> +
> + static int tftp_session_allocate(Slirp *slirp, struct sockaddr_storag=
e *srcsas,
> +-                                 struct tftp_t *tp)
> ++                                 struct tftphdr *hdr)
> + {
> +     struct tftp_session *spt;
> +     int k;
> +@@ -75,7 +75,7 @@ found:
> +     memcpy(&spt->client_addr, srcsas, sockaddr_size(srcsas));
> +     spt->fd =3D -1;
> +     spt->block_size =3D 512;
> +-    spt->client_port =3D tp->udp.uh_sport;
> ++    spt->client_port =3D hdr->udp.uh_sport;
> +     spt->slirp =3D slirp;
> +
> +     tftp_session_update(spt);
> +@@ -84,7 +84,7 @@ found:
> + }
> +
> + static int tftp_session_find(Slirp *slirp, struct sockaddr_storage *s=
rcsas,
> +-                             struct tftp_t *tp)
> ++                             struct tftphdr *hdr)
> + {
> +     struct tftp_session *spt;
> +     int k;
> +@@ -94,7 +94,7 @@ static int tftp_session_find(Slirp *slirp, struct so=
ckaddr_storage *srcsas,
> +
> +         if (tftp_session_in_use(spt)) {
> +             if (sockaddr_equal(&spt->client_addr, srcsas)) {
> +-                if (spt->client_port =3D=3D tp->udp.uh_sport) {
> ++                if (spt->client_port =3D=3D hdr->udp.uh_sport) {
> +                     return k;
> +                 }
> +             }
> +@@ -148,13 +148,13 @@ static struct tftp_t *tftp_prep_mbuf_data(struct=
 tftp_session *spt,
> + }
> +
> + static void tftp_udp_output(struct tftp_session *spt, struct mbuf *m,
> +-                            struct tftp_t *recv_tp)
> ++                            struct tftphdr *hdr)
> + {
> +     if (spt->client_addr.ss_family =3D=3D AF_INET6) {
> +         struct sockaddr_in6 sa6, da6;
> +
> +         sa6.sin6_addr =3D spt->slirp->vhost_addr6;
> +-        sa6.sin6_port =3D recv_tp->udp.uh_dport;
> ++        sa6.sin6_port =3D hdr->udp.uh_dport;
> +         da6.sin6_addr =3D ((struct sockaddr_in6 *)&spt->client_addr)-=
>sin6_addr;
> +         da6.sin6_port =3D spt->client_port;
> +
> +@@ -163,7 +163,7 @@ static void tftp_udp_output(struct tftp_session *s=
pt, struct mbuf *m,
> +         struct sockaddr_in sa4, da4;
> +
> +         sa4.sin_addr =3D spt->slirp->vhost_addr;
> +-        sa4.sin_port =3D recv_tp->udp.uh_dport;
> ++        sa4.sin_port =3D hdr->udp.uh_dport;
> +         da4.sin_addr =3D ((struct sockaddr_in *)&spt->client_addr)->s=
in_addr;
> +         da4.sin_port =3D spt->client_port;
> +
> +@@ -185,14 +185,14 @@ static int tftp_send_oack(struct tftp_session *s=
pt, const char *keys[],
> +
> +     tp =3D tftp_prep_mbuf_data(spt, m);
> +
> +-    tp->tp_op =3D htons(TFTP_OACK);
> ++    tp->hdr.tp_op =3D htons(TFTP_OACK);
> +     for (i =3D 0; i < nb; i++) {
> +         n +=3D slirp_fmt0(tp->x.tp_buf + n, sizeof(tp->x.tp_buf) - n,=
 "%s", keys[i]);
> +         n +=3D slirp_fmt0(tp->x.tp_buf + n, sizeof(tp->x.tp_buf) - n,=
 "%u", values[i]);
> +     }
> +
> +-    m->m_len =3D G_SIZEOF_MEMBER(struct tftp_t, tp_op) + n;
> +-    tftp_udp_output(spt, m, recv_tp);
> ++    m->m_len =3D G_SIZEOF_MEMBER(struct tftp_t, hdr.tp_op) + n;
> ++    tftp_udp_output(spt, m, &recv_tp->hdr);
> +
> +     return 0;
> + }
> +@@ -213,21 +213,21 @@ static void tftp_send_error(struct tftp_session =
*spt, uint16_t errorcode,
> +
> +     tp =3D tftp_prep_mbuf_data(spt, m);
> +
> +-    tp->tp_op =3D htons(TFTP_ERROR);
> ++    tp->hdr.tp_op =3D htons(TFTP_ERROR);
> +     tp->x.tp_error.tp_error_code =3D htons(errorcode);
> +     slirp_pstrcpy((char *)tp->x.tp_error.tp_msg, sizeof(tp->x.tp_erro=
r.tp_msg),
> +                   msg);
> +
> +     m->m_len =3D sizeof(struct tftp_t) - (TFTP_BLOCKSIZE_MAX + 2) + 3=
 +
> +                strlen(msg) - sizeof(struct udphdr);
> +-    tftp_udp_output(spt, m, recv_tp);
> ++    tftp_udp_output(spt, m, &recv_tp->hdr);
> +
> + out:
> +     tftp_session_terminate(spt);
> + }
> +
> + static void tftp_send_next_block(struct tftp_session *spt,
> +-                                 struct tftp_t *recv_tp)
> ++                                 struct tftphdr *hdr)
> + {
> +     struct mbuf *m;
> +     struct tftp_t *tp;
> +@@ -241,7 +241,7 @@ static void tftp_send_next_block(struct tftp_sessi=
on *spt,
> +
> +     tp =3D tftp_prep_mbuf_data(spt, m);
> +
> +-    tp->tp_op =3D htons(TFTP_DATA);
> ++    tp->hdr.tp_op =3D htons(TFTP_DATA);
> +     tp->x.tp_data.tp_block_nr =3D htons((spt->block_nr + 1) & 0xffff)=
;
> +
> +     nobytes =3D tftp_read_data(spt, spt->block_nr, tp->x.tp_data.tp_b=
uf,
> +@@ -259,7 +259,7 @@ static void tftp_send_next_block(struct tftp_sessi=
on *spt,
> +
> +     m->m_len =3D sizeof(struct tftp_t) - (TFTP_BLOCKSIZE_MAX - nobyte=
s) -
> +                sizeof(struct udphdr);
> +-    tftp_udp_output(spt, m, recv_tp);
> ++    tftp_udp_output(spt, m, hdr);
> +
> +     if (nobytes =3D=3D spt->block_size) {
> +         tftp_session_update(spt);
> +@@ -282,12 +282,12 @@ static void tftp_handle_rrq(Slirp *slirp, struct=
 sockaddr_storage *srcsas,
> +     int nb_options =3D 0;
> +
> +     /* check if a session already exists and if so terminate it */
> +-    s =3D tftp_session_find(slirp, srcsas, tp);
> ++    s =3D tftp_session_find(slirp, srcsas, &tp->hdr);
> +     if (s >=3D 0) {
> +         tftp_session_terminate(&slirp->tftp_sessions[s]);
> +     }
> +
> +-    s =3D tftp_session_allocate(slirp, srcsas, tp);
> ++    s =3D tftp_session_allocate(slirp, srcsas, &tp->hdr);
> +
> +     if (s < 0) {
> +         return;
> +@@ -413,29 +413,29 @@ static void tftp_handle_rrq(Slirp *slirp, struct=
 sockaddr_storage *srcsas,
> +     }
> +
> +     spt->block_nr =3D 0;
> +-    tftp_send_next_block(spt, tp);
> ++    tftp_send_next_block(spt, &tp->hdr);
> + }
> +
> + static void tftp_handle_ack(Slirp *slirp, struct sockaddr_storage *sr=
csas,
> +-                            struct tftp_t *tp, int pktlen)
> ++                            struct tftphdr *hdr)
> + {
> +     int s;
> +
> +-    s =3D tftp_session_find(slirp, srcsas, tp);
> ++    s =3D tftp_session_find(slirp, srcsas, hdr);
> +
> +     if (s < 0) {
> +         return;
> +     }
> +
> +-    tftp_send_next_block(&slirp->tftp_sessions[s], tp);
> ++    tftp_send_next_block(&slirp->tftp_sessions[s], hdr);
> + }
> +
> + static void tftp_handle_error(Slirp *slirp, struct sockaddr_storage *=
srcsas,
> +-                              struct tftp_t *tp, int pktlen)
> ++                              struct tftphdr *hdr)
> + {
> +     int s;
> +
> +-    s =3D tftp_session_find(slirp, srcsas, tp);
> ++    s =3D tftp_session_find(slirp, srcsas, hdr);
> +
> +     if (s < 0) {
> +         return;
> +@@ -446,23 +446,25 @@ static void tftp_handle_error(Slirp *slirp, stru=
ct sockaddr_storage *srcsas,
> +
> + void tftp_input(struct sockaddr_storage *srcsas, struct mbuf *m)
> + {
> +-    struct tftp_t *tp =3D mtod_check(m, offsetof(struct tftp_t, x.tp_=
buf));
> ++    struct tftphdr *hdr =3D mtod_check(m, sizeof(struct tftphdr));
> +
> +-    if (tp =3D=3D NULL) {
> ++    if (hdr =3D=3D NULL) {
> +         return;
> +     }
> +
> +-    switch (ntohs(tp->tp_op)) {
> ++    switch (ntohs(hdr->tp_op)) {
> +     case TFTP_RRQ:
> +-        tftp_handle_rrq(m->slirp, srcsas, tp, m->m_len);
> ++        tftp_handle_rrq(m->slirp, srcsas,
> ++                        mtod(m, struct tftp_t *),
> ++                        m->m_len);
> +         break;
> +
> +     case TFTP_ACK:
> +-        tftp_handle_ack(m->slirp, srcsas, tp, m->m_len);
> ++        tftp_handle_ack(m->slirp, srcsas, hdr);
> +         break;
> +
> +     case TFTP_ERROR:
> +-        tftp_handle_error(m->slirp, srcsas, tp, m->m_len);
> ++        tftp_handle_error(m->slirp, srcsas, hdr);
> +         break;
> +     }
> + }
> +diff --git a/slirp/src/tftp.h b/slirp/src/tftp.h
> +index 6d75478e8..cafab03f2 100644
> +--- a/slirp/src/tftp.h
> ++++ b/slirp/src/tftp.h
> +@@ -20,9 +20,13 @@
> + #define TFTP_FILENAME_MAX 512
> + #define TFTP_BLOCKSIZE_MAX 1428
> +
> +-struct tftp_t {
> ++struct tftphdr {
> +     struct udphdr udp;
> +     uint16_t tp_op;
> ++} SLIRP_PACKED;
> ++
> ++struct tftp_t {
> ++    struct tftphdr hdr;
> +     union {
> +         struct {
> +             uint16_t tp_block_nr;
> +--
> +2.31.1
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160547): https://lists.openembedded.org/g/openembed=
ded-core/message/160547
> Mute This Topic: https://lists.openembedded.org/mt/88410487/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sakib.sajal@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------278219597EF351494C315167
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20E07ZMY003545

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Please disregard this set of patches, somehow it failed to send
      the first 2 and one in the middle. sending a V3.</p>
    Sorry for inconvenience
    <div class=3D"moz-cite-prefix">On 2022-01-13 7:06 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:16C9FA5A611A7940.25962@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Sakib Sajal <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sakib.sajal@windriver.co=
m">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-3595_1.patch           |  41 +++
 .../qemu/qemu/CVE-2021-3595_2.patch           | 253 ++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 6b544a4344..811bdff426 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,6 +74,8 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://download.qemu.org/${BPN}-${PV}.tar.xz\file://CVE-2021-3592_2.patc=
h\file://CVE-2021-3592_3.patch\file://CVE-2021-3593.patch\+file://CVE-202=
1-3595_1.patch\+file://CVE-2021-3595_2.patch\">&quot;https://download.qem=
u.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3592_2.patch \
            file://CVE-2021-3592_3.patch \
            file://CVE-2021-3593.patch \
+           file://CVE-2021-3595_1.patch \
+           file://CVE-2021-3595_2.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
new file mode 100644
index 0000000000..aefaff01cf
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
@@ -0,0 +1,41 @@
+From 6b62a09d6c264cb84f560a418beb027f47bc5069 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre=
.lureau@redhat.com&gt;</a>
+Date: Fri, 4 Jun 2021 16:34:30 +0400
+Subject: [PATCH 05/12] tftp: check tftp_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3595
+Fixes: <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedes=
ktop.org/slirp/libslirp/-/issues/46">https://gitlab.freedesktop.org/slirp=
/libslirp/-/issues/46</a>
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre.lureau@redhat.=
com&gt;</a>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3595
+
+Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ slirp/src/tftp.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
+index c6950ee10..e06911d42 100644
+--- a/slirp/src/tftp.c
++++ b/slirp/src/tftp.c
+@@ -446,7 +446,11 @@ static void tftp_handle_error(Slirp *slirp, struct =
sockaddr_storage *srcsas,
+=20
+ void tftp_input(struct sockaddr_storage *srcsas, struct mbuf *m)
+ {
+-    struct tftp_t *tp =3D (struct tftp_t *)m-&gt;m_data;
++    struct tftp_t *tp =3D mtod_check(m, offsetof(struct tftp_t, x.tp_bu=
f));
++
++    if (tp =3D=3D NULL) {
++        return;
++    }
+=20
+     switch (ntohs(tp-&gt;tp_op)) {
+     case TFTP_RRQ:
+--=20
+2.31.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch
new file mode 100644
index 0000000000..1ffa6ca988
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch
@@ -0,0 +1,253 @@
+From d71caef98e331268519578fc0437e2ac02586940 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre=
.lureau@redhat.com&gt;</a>
+Date: Fri, 4 Jun 2021 20:01:20 +0400
+Subject: [PATCH 06/12] tftp: introduce a header structure
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Instead of using a composed structure and potentially reading past the
+incoming buffer, use a different structure for the header.
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre.lureau@redhat.=
com&gt;</a>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3595
+
+Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ slirp/src/tftp.c | 60 +++++++++++++++++++++++++-----------------------
+ slirp/src/tftp.h |  6 ++++-
+ 2 files changed, 36 insertions(+), 30 deletions(-)
+
+diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
+index e06911d42..a19c889d3 100644
+--- a/slirp/src/tftp.c
++++ b/slirp/src/tftp.c
+@@ -50,7 +50,7 @@ static void tftp_session_terminate(struct tftp_session=
 *spt)
+ }
+=20
+ static int tftp_session_allocate(Slirp *slirp, struct sockaddr_storage =
*srcsas,
+-                                 struct tftp_t *tp)
++                                 struct tftphdr *hdr)
+ {
+     struct tftp_session *spt;
+     int k;
+@@ -75,7 +75,7 @@ found:
+     memcpy(&amp;spt-&gt;client_addr, srcsas, sockaddr_size(srcsas));
+     spt-&gt;fd =3D -1;
+     spt-&gt;block_size =3D 512;
+-    spt-&gt;client_port =3D tp-&gt;udp.uh_sport;
++    spt-&gt;client_port =3D hdr-&gt;udp.uh_sport;
+     spt-&gt;slirp =3D slirp;
+=20
+     tftp_session_update(spt);
+@@ -84,7 +84,7 @@ found:
+ }
+=20
+ static int tftp_session_find(Slirp *slirp, struct sockaddr_storage *src=
sas,
+-                             struct tftp_t *tp)
++                             struct tftphdr *hdr)
+ {
+     struct tftp_session *spt;
+     int k;
+@@ -94,7 +94,7 @@ static int tftp_session_find(Slirp *slirp, struct sock=
addr_storage *srcsas,
+=20
+         if (tftp_session_in_use(spt)) {
+             if (sockaddr_equal(&amp;spt-&gt;client_addr, srcsas)) {
+-                if (spt-&gt;client_port =3D=3D tp-&gt;udp.uh_sport) {
++                if (spt-&gt;client_port =3D=3D hdr-&gt;udp.uh_sport) {
+                     return k;
+                 }
+             }
+@@ -148,13 +148,13 @@ static struct tftp_t *tftp_prep_mbuf_data(struct t=
ftp_session *spt,
+ }
+=20
+ static void tftp_udp_output(struct tftp_session *spt, struct mbuf *m,
+-                            struct tftp_t *recv_tp)
++                            struct tftphdr *hdr)
+ {
+     if (spt-&gt;client_addr.ss_family =3D=3D AF_INET6) {
+         struct sockaddr_in6 sa6, da6;
+=20
+         sa6.sin6_addr =3D spt-&gt;slirp-&gt;vhost_addr6;
+-        sa6.sin6_port =3D recv_tp-&gt;udp.uh_dport;
++        sa6.sin6_port =3D hdr-&gt;udp.uh_dport;
+         da6.sin6_addr =3D ((struct sockaddr_in6 *)&amp;spt-&gt;client_a=
ddr)-&gt;sin6_addr;
+         da6.sin6_port =3D spt-&gt;client_port;
+=20
+@@ -163,7 +163,7 @@ static void tftp_udp_output(struct tftp_session *spt=
, struct mbuf *m,
+         struct sockaddr_in sa4, da4;
+=20
+         sa4.sin_addr =3D spt-&gt;slirp-&gt;vhost_addr;
+-        sa4.sin_port =3D recv_tp-&gt;udp.uh_dport;
++        sa4.sin_port =3D hdr-&gt;udp.uh_dport;
+         da4.sin_addr =3D ((struct sockaddr_in *)&amp;spt-&gt;client_add=
r)-&gt;sin_addr;
+         da4.sin_port =3D spt-&gt;client_port;
+=20
+@@ -185,14 +185,14 @@ static int tftp_send_oack(struct tftp_session *spt=
, const char *keys[],
+=20
+     tp =3D tftp_prep_mbuf_data(spt, m);
+=20
+-    tp-&gt;tp_op =3D htons(TFTP_OACK);
++    tp-&gt;hdr.tp_op =3D htons(TFTP_OACK);
+     for (i =3D 0; i &lt; nb; i++) {
+         n +=3D slirp_fmt0(tp-&gt;x.tp_buf + n, sizeof(tp-&gt;x.tp_buf) =
- n, &quot;%s&quot;, keys[i]);
+         n +=3D slirp_fmt0(tp-&gt;x.tp_buf + n, sizeof(tp-&gt;x.tp_buf) =
- n, &quot;%u&quot;, values[i]);
+     }
+=20
+-    m-&gt;m_len =3D G_SIZEOF_MEMBER(struct tftp_t, tp_op) + n;
+-    tftp_udp_output(spt, m, recv_tp);
++    m-&gt;m_len =3D G_SIZEOF_MEMBER(struct tftp_t, hdr.tp_op) + n;
++    tftp_udp_output(spt, m, &amp;recv_tp-&gt;hdr);
+=20
+     return 0;
+ }
+@@ -213,21 +213,21 @@ static void tftp_send_error(struct tftp_session *s=
pt, uint16_t errorcode,
+=20
+     tp =3D tftp_prep_mbuf_data(spt, m);
+=20
+-    tp-&gt;tp_op =3D htons(TFTP_ERROR);
++    tp-&gt;hdr.tp_op =3D htons(TFTP_ERROR);
+     tp-&gt;x.tp_error.tp_error_code =3D htons(errorcode);
+     slirp_pstrcpy((char *)tp-&gt;x.tp_error.tp_msg, sizeof(tp-&gt;x.tp_=
error.tp_msg),
+                   msg);
+=20
+     m-&gt;m_len =3D sizeof(struct tftp_t) - (TFTP_BLOCKSIZE_MAX + 2) + =
3 +
+                strlen(msg) - sizeof(struct udphdr);
+-    tftp_udp_output(spt, m, recv_tp);
++    tftp_udp_output(spt, m, &amp;recv_tp-&gt;hdr);
+=20
+ out:
+     tftp_session_terminate(spt);
+ }
+=20
+ static void tftp_send_next_block(struct tftp_session *spt,
+-                                 struct tftp_t *recv_tp)
++                                 struct tftphdr *hdr)
+ {
+     struct mbuf *m;
+     struct tftp_t *tp;
+@@ -241,7 +241,7 @@ static void tftp_send_next_block(struct tftp_session=
 *spt,
+=20
+     tp =3D tftp_prep_mbuf_data(spt, m);
+=20
+-    tp-&gt;tp_op =3D htons(TFTP_DATA);
++    tp-&gt;hdr.tp_op =3D htons(TFTP_DATA);
+     tp-&gt;x.tp_data.tp_block_nr =3D htons((spt-&gt;block_nr + 1) &amp;=
 0xffff);
+=20
+     nobytes =3D tftp_read_data(spt, spt-&gt;block_nr, tp-&gt;x.tp_data.=
tp_buf,
+@@ -259,7 +259,7 @@ static void tftp_send_next_block(struct tftp_session=
 *spt,
+=20
+     m-&gt;m_len =3D sizeof(struct tftp_t) - (TFTP_BLOCKSIZE_MAX - nobyt=
es) -
+                sizeof(struct udphdr);
+-    tftp_udp_output(spt, m, recv_tp);
++    tftp_udp_output(spt, m, hdr);
+=20
+     if (nobytes =3D=3D spt-&gt;block_size) {
+         tftp_session_update(spt);
+@@ -282,12 +282,12 @@ static void tftp_handle_rrq(Slirp *slirp, struct s=
ockaddr_storage *srcsas,
+     int nb_options =3D 0;
+=20
+     /* check if a session already exists and if so terminate it */
+-    s =3D tftp_session_find(slirp, srcsas, tp);
++    s =3D tftp_session_find(slirp, srcsas, &amp;tp-&gt;hdr);
+     if (s &gt;=3D 0) {
+         tftp_session_terminate(&amp;slirp-&gt;tftp_sessions[s]);
+     }
+=20
+-    s =3D tftp_session_allocate(slirp, srcsas, tp);
++    s =3D tftp_session_allocate(slirp, srcsas, &amp;tp-&gt;hdr);
+=20
+     if (s &lt; 0) {
+         return;
+@@ -413,29 +413,29 @@ static void tftp_handle_rrq(Slirp *slirp, struct s=
ockaddr_storage *srcsas,
+     }
+=20
+     spt-&gt;block_nr =3D 0;
+-    tftp_send_next_block(spt, tp);
++    tftp_send_next_block(spt, &amp;tp-&gt;hdr);
+ }
+=20
+ static void tftp_handle_ack(Slirp *slirp, struct sockaddr_storage *srcs=
as,
+-                            struct tftp_t *tp, int pktlen)
++                            struct tftphdr *hdr)
+ {
+     int s;
+=20
+-    s =3D tftp_session_find(slirp, srcsas, tp);
++    s =3D tftp_session_find(slirp, srcsas, hdr);
+=20
+     if (s &lt; 0) {
+         return;
+     }
+=20
+-    tftp_send_next_block(&amp;slirp-&gt;tftp_sessions[s], tp);
++    tftp_send_next_block(&amp;slirp-&gt;tftp_sessions[s], hdr);
+ }
+=20
+ static void tftp_handle_error(Slirp *slirp, struct sockaddr_storage *sr=
csas,
+-                              struct tftp_t *tp, int pktlen)
++                              struct tftphdr *hdr)
+ {
+     int s;
+=20
+-    s =3D tftp_session_find(slirp, srcsas, tp);
++    s =3D tftp_session_find(slirp, srcsas, hdr);
+=20
+     if (s &lt; 0) {
+         return;
+@@ -446,23 +446,25 @@ static void tftp_handle_error(Slirp *slirp, struct=
 sockaddr_storage *srcsas,
+=20
+ void tftp_input(struct sockaddr_storage *srcsas, struct mbuf *m)
+ {
+-    struct tftp_t *tp =3D mtod_check(m, offsetof(struct tftp_t, x.tp_bu=
f));
++    struct tftphdr *hdr =3D mtod_check(m, sizeof(struct tftphdr));
+=20
+-    if (tp =3D=3D NULL) {
++    if (hdr =3D=3D NULL) {
+         return;
+     }
+=20
+-    switch (ntohs(tp-&gt;tp_op)) {
++    switch (ntohs(hdr-&gt;tp_op)) {
+     case TFTP_RRQ:
+-        tftp_handle_rrq(m-&gt;slirp, srcsas, tp, m-&gt;m_len);
++        tftp_handle_rrq(m-&gt;slirp, srcsas,
++                        mtod(m, struct tftp_t *),
++                        m-&gt;m_len);
+         break;
+=20
+     case TFTP_ACK:
+-        tftp_handle_ack(m-&gt;slirp, srcsas, tp, m-&gt;m_len);
++        tftp_handle_ack(m-&gt;slirp, srcsas, hdr);
+         break;
+=20
+     case TFTP_ERROR:
+-        tftp_handle_error(m-&gt;slirp, srcsas, tp, m-&gt;m_len);
++        tftp_handle_error(m-&gt;slirp, srcsas, hdr);
+         break;
+     }
+ }
+diff --git a/slirp/src/tftp.h b/slirp/src/tftp.h
+index 6d75478e8..cafab03f2 100644
+--- a/slirp/src/tftp.h
++++ b/slirp/src/tftp.h
+@@ -20,9 +20,13 @@
+ #define TFTP_FILENAME_MAX 512
+ #define TFTP_BLOCKSIZE_MAX 1428
+=20
+-struct tftp_t {
++struct tftphdr {
+     struct udphdr udp;
+     uint16_t tp_op;
++} SLIRP_PACKED;
++
++struct tftp_t {
++    struct tftphdr hdr;
+     union {
+         struct {
+             uint16_t tp_block_nr;
+--=20
+2.31.1
+
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#160547): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/160547">https:/=
/lists.openembedded.org/g/openembedded-core/message/160547</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/88410487/4422444">https://lists.openembedded.org/mt/=
88410487/4422444</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------278219597EF351494C315167--

