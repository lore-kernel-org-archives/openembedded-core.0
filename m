Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688A1C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 03:18:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32902.1675048705482965047
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 19:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1394667adb=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30U3IO7K032278
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 03:18:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpasrk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 03:18:24 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30U3IOgG032271
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 03:18:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpasrk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 03:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gpmpuv9Y8ArSO/sGpHQwrfFL9q/Ivm995P6TVaxZ6PQgX8/9AhZfV7J2iDed+FPEJEX1Ya0dU1HjHr4LYb/GTb12iTyHQHEdgibT9w9Xqc52iqsyTd7/jnvvbhSFF3RT884V/cJt1oCu5wZgiPb/dFiuImHqMgVGoOkAALR8Kajs967KTSfSG+J5hk4yf24WvtMKrPnmibZpHXD0SQCRTHbD8yO5jUWDoeBeFF6K8U4HBCG/XmpBSf0hcyeFltdUQV91BdMQ1DErwKvF2z3QrqUdCE+ZcuAug+ttTfKa6Qh9IfhrXtMzwyEzbg7vJ+KZPEOPVmaFlGZEa5dg134Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33/Lv1y/WYjCdnxpeHhw4Wt2LJqubjN9eo6FHSm5vcM=;
 b=AlKIp/jJNZF88ixUt8O/EwG7r369Z9GQ4ZZprMo+xBQ6UH9KQaDq7aNaSKD1+d6T9ilEEhBpnn6cIt5v4F1vlXF6NJkRfAl7Qvj9u8VDZkHoOJGkyh5ySofo3YwAoOZuSnQcXZ++0cYJOYOK/29PW3s0rURs76HRnnSJN8kmVkckizJA6hIpyH4PCuvP+2RGEoXQZ9d/B+ou4peNvLuKRrtcwcbUVy/zqmGpUqnWWFZXB/x4bp11R03voZ3lcpSzIZXG1OTCZ5MgGY4xg0r7hOWCynBePOPXOTfJTqPwwYl9+0El8N15czPnt1sZisjJf42015BRz3J0PNTMNxWZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH0PR11MB5707.namprd11.prod.outlook.com (2603:10b6:610:110::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 03:18:21 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%7]) with mapi id 15.20.6043.028; Mon, 30 Jan 2023
 03:18:21 +0000
Message-ID: <d7a5bc0f-73f0-4e48-f694-d6b36b65d4dd@windriver.com>
Date: Mon, 30 Jan 2023 11:18:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][kirkstone][PATCH] numactl: skip test case when
 target platform doesn't have 2 CPU node
To: Steve Sakoman <steve@sakoman.com>
References: <173B9E6E840C64D1.24231@lists.openembedded.org>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <173B9E6E840C64D1.24231@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH0PR11MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bdaa6c-14e5-4743-27b8-08db0270a40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	92P/2mroS9ccEQ6VfZ2N1NOn8vw4iuaswDJUuKig9jYF0DeKiG9T6O45jRfU5gnkJEC5wCtFm8kfgwUO7i4+xTvcHKpdx4Lqt9lkRS7Qzwla8q3rRWWrj/tt37aTmDvgSWNID1AzDNjkp2LLqqUY/gNV0g+V5fck2dQ5hqNMi2OnviqFku+uFojIqruq/KbLJaip2/600f8FNRGse23esBpcDvaX7iFsTaJ1By3KLkZhfHssANsg5xegV4k4g3rBgOhAiyx9TkmqP8JaVR+acxm+jn+iw3cTC90cXtJLBPo6COcdGa74KxHiCKsMmuq8iPaNK1PvI1xh5894e0RfUuPGIeZ3HS1LaFp/s6Vve1UiC9Vz0W7z6HGOiMEctaBTUgKFypHIULpUvRLPkGGlnQCW+48gSpyuuJYRPetogyAL+ey3wuhOpjCaydLdTR0MI+RQyeYw+gQpNW1SOuTAdB4I5XT3b/etSnEXaWvbxps+1abnHjQxjiFoLiehAO5GIFBw3URwWI/JRJpMk4Ba0DhLK4opI+slJasEPHf4lICV1SJRd3Mg98dISIh06L3zMk2qXvUvvR3ZPkRZb/WXTgMvGG+YdYyoNee+cgfGeo7f/qfo0N6qTNYQu+/O2paLsH2DHuujr9AWRXuZOK2S/rqwsHwV9R2rosFcP7eM9i94T7jDmlV95m7Wa1vnazh/Kq36hs7LbbREv1/Lj1nNHwV5dbVD7/8p2BU1aUw+PNCQZNCtwp+tx2v4BBJs/wDWjQqCZ393qIHsYm96LjKXjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(451199018)(316002)(4326008)(8676002)(66946007)(5660300002)(44832011)(6916009)(66476007)(66556008)(8936002)(41300700001)(83380400001)(478600001)(966005)(6486002)(9686003)(26005)(6512007)(186003)(6666004)(53546011)(6506007)(31696002)(2906002)(38100700002)(83170400001)(36756003)(31686004)(66899018)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUpmNTNiRW9pSDFBNGhtV2FHUU54a2lqbkpGTWVCcG0rY3kxcC9hSE9yYzl0?=
 =?utf-8?B?dzB0Rm82U2haUDRYajZjN2JKWHlRMnVvallJTU5qSFNXM1hKczdCaGY4d0lP?=
 =?utf-8?B?MVM3Rmd6MnQ4MXd3S2dKQ1dSeEEvejdNaVN6UXViYi9ZR2UyTDRuaUh5V1FV?=
 =?utf-8?B?aXZEOUdIcGN5aGE1SmdXVm81UWtDV1ZKbHB4VmlFYnptTHFuM0I2bWpueXVE?=
 =?utf-8?B?QWJEVkRoLzdNTnN2RGdFTmwva2hhdyt5OVlKa3VwV203UTFhS0RTa2dJaFNY?=
 =?utf-8?B?VDEwTm4vRUR0aElVK0QxNXhPUDh2NkY2TUV6TndibXJ4cmFDUkhqREp1Ky9J?=
 =?utf-8?B?TTVuOFRSMnlaQ0ZKTWpwMVJyMkwxTWRhWTFOQlF2L2VhWmR2bDhQaktEU2Y0?=
 =?utf-8?B?cVduOHI3bkl4bDZ2clBYK2o3bFh5eVZNc21KMFZCZGswRUtOKzY4ZDVYbVpH?=
 =?utf-8?B?cit2cjhLRm53bng0VkJSVlhXSC9YU1lCQkR6VjNIbE1XeDB6Qm4zT0NYdDZS?=
 =?utf-8?B?YnhDRHNTaVZWY05SQjQ1WkF1R3BwUDl4ZXpscFJYZ1pielUwWXQxdFM4UStN?=
 =?utf-8?B?a3V5YlFEOXhRd3lZUGJCWmlJVmFMOUFFcE1Ld2VUeXZ4Ti80cTJ5RG9BMjJE?=
 =?utf-8?B?Q0JlMlVvZ3hHTUFFeGJ5OWpxZHRLa0xiSHZZSjFWRXpVK1o0bUtrUjBOcEZU?=
 =?utf-8?B?MzJRWmxGRW9aeFdsc1c1V2x6WGN6MWNOMC80SjlrMnhEYXNqY0FqMHo5dkti?=
 =?utf-8?B?Q2s5UFlDVlpDc0xSSGR2UHYzTGprQ2RVUXRNZjgxMGVCVFVKUDJRakJlYmIv?=
 =?utf-8?B?KzNiclptaG5yQnhydHhhTlZuZXBnTHBuTENoR2tYKzBXc1pmYlM2SkxRSzRa?=
 =?utf-8?B?V0J4amdzcEU4WjVrdlBlRlg1eG1rbXQzaXpnQnpNQ1VVdXlOTDhUTW16djZR?=
 =?utf-8?B?eXk3Qmc3Qm5aVTl1UGttVmRtZnRZbkhUSldVSGV5aGN2MmhPSHdOMFdhV24y?=
 =?utf-8?B?TmNHZ0FPQ3JEVXA5dmo4K1JEaXBBSUV4RFJOV0VQY0prNjBzRWp2dTNlc1Jz?=
 =?utf-8?B?UVcyLytwQ2xybExlMGkwY0tHdURpMkJ6SWFCSXlqc21FbXRxeWxrdlpOQUVV?=
 =?utf-8?B?cU5sVmplUURPSlBITVZ4K3ZHN3Q2T0U5S3RMWWVqRmF5QWhuaytvR1l1QVU1?=
 =?utf-8?B?U0xsdzNiN3htZW9XVG9ISnZmaTVyd0kyZXZ5ekxxQ09tZkFCVE10UnFTOHlh?=
 =?utf-8?B?WEtvTFJLelRDTW1qWnI1OWxuUzYrRkt5WEllb2pJdTJZMm5ta1B5Vjcva3NV?=
 =?utf-8?B?S0RNV0JURFBNWHNGdENYTHl4NkJKYWQwaTNLNVVhRXBhTGtyUVM2aEJrYncr?=
 =?utf-8?B?eTRKMkhCekQ2K3VHWnhHcFJvZ05ONVpFM200U2t4bWJPN3lRYXVXL0c1b3hZ?=
 =?utf-8?B?K3B6bER1TkZvTWczUlVxeHNJbDJmSDV1TjZjV3VaQlRLWmtvN2RMd0YyTmFh?=
 =?utf-8?B?Vjl5SjZiZXRNaU1MdXZqR2tjcWVMajhqQ2RlZXlVbnMvQUVLVXl1OGtZTVo5?=
 =?utf-8?B?N2c0aWMwT05QR2FCdUthSnVjQ2IyQ2NVTVdESzJBQ0FUSnVNc1ZkcmVPVFkv?=
 =?utf-8?B?YUR5TEdYWElLRmZ6WDNITU0zQ0pqTlpJT3hhTGwyZHF6Z0lPaEg1UnExNVhl?=
 =?utf-8?B?RWIyTHJLUnlXZDFGTmpZeWtpenRoN3R4UU9QS0RURnlFdlV1Yi9yMURXeXNC?=
 =?utf-8?B?a2lJRm5RbkdNVTJRMzdlMWs1Y3dDYnRaenAzZk13dHNCUnRGLzhuR0tFR2Vy?=
 =?utf-8?B?L2RPaHZ5N3VTYnprNG1FQTdJZGtNa0RwVGdLUjBpRnBmNm5zcFM0VUhUamFH?=
 =?utf-8?B?WjJLczJWY3c2Z2ZGRklCWWQxTG5Qb1Vmb3JqT25NS2hpanZWcnJ4cGIrdXM4?=
 =?utf-8?B?UFlkRVVDZWxDZzN4ZUwyakJzeGlTd2lPcVFrQzVwL2grVzd4cVU0ZStxN1A3?=
 =?utf-8?B?Y2k2aWhEbjl1VURCZytaeWY3RlJXOW9HdktYKzh6eks2ZXZFS28wYU1Ud21U?=
 =?utf-8?B?L0lIM3FxSnBtOGNkQ0didngvZzc5UGpiVmw1SlFEYTUxd3ZrNVI3Y05mMXFk?=
 =?utf-8?B?a0xRRHZJYUpCNUdZb2F4MGttWGhkRkdkZm9pb2dpUzgrOGRvbDF0N21XS090?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bdaa6c-14e5-4743-27b8-08db0270a40e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 03:18:21.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dETi0Oc9TOzy9eN1IhBrw7BIaea1a/mWfBdMyPvT2nNGqC1LyZeLjCrCX3f/tmHhUOplA8nbrD5JMBkhkMAN6rerrDaSu70sRfm6YuWMeSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5707
X-Proofpoint-GUID: LXHPI9_h4H2DcSKVUEIbwa5al-OSccx9
X-Proofpoint-ORIG-GUID: zA25gPwbSWmuDKoH6YWc6OMixKu2TYoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_01,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 03:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176478


On 1/19/23 13:24, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> when current test platform doesn't have 2 or more CPU node, the test
> case would report FAIL, according to numa test script and numademo
> code, when return code=77 should be skip test, so using SKIP instead
> of FAIL in test script.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

Hi Steve,

Friendly ping, this fix has already merged to master and it also can be 
applied on kirkstone, could you please help to merge it on kirkstone? 
thanks!


Br,

Xiangyu

> ---
>   .../numactl/numactl/Fix-the-test-output-format.patch        | 3 ++-
>   meta/recipes-support/numactl/numactl/run-ptest              | 6 +++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
> index 9812ecc8b3..a7bc8d322e 100644
> --- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
> +++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
> @@ -7,6 +7,7 @@ Upstream-Status: Pending
>   
>   Signed-off-by: Roy Li <rongqing.li@windriver.com>
>   Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>   ---
>    test/regress  |  6 +++---
>    test/regress2 | 11 +++++------
> @@ -20,7 +21,7 @@ index 2ce1705..d086a47 100755
>    	if [ $numnodes -lt 2 ] ; then
>    	    echo "need at least two nodes with at least $NEEDPAGES each of"
>    	    echo "free memory for mempolicy regression tests"
> -+	    echo "FAIL: numa regress"
> ++	    echo "SKIP: numa regress"
>   	    exit 77  # Skip test
>    	fi
>    }
> diff --git a/meta/recipes-support/numactl/numactl/run-ptest b/meta/recipes-support/numactl/numactl/run-ptest
> index bf269da755..e019b0d364 100755
> --- a/meta/recipes-support/numactl/numactl/run-ptest
> +++ b/meta/recipes-support/numactl/numactl/run-ptest
> @@ -8,7 +8,11 @@ if ! numactl -s | grep -q "No NUMA support available on this system."; then
>   	if  numademo -t -e 10M; then
>   		echo "PASS: numademo"
>   	else
> -		echo "FAIL: numademo"
> +		if [ "$?" = 77 ] ; then
> +			echo "SKIP: numademo"
> +		else
> +			echo "FAIL: numademo"
> +		fi
>   	fi
>   else
>   	echo "SKIP: ./../test/bind_range"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176122): https://lists.openembedded.org/g/openembedded-core/message/176122
> Mute This Topic: https://lists.openembedded.org/mt/96372135/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [xiangyu.chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

