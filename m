Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66424C433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 19:13:34 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web12.56414.1638818013887201716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 11:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=l8txgXhS;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=7974a63cae=alex.stewart@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B6HppwE005091;
	Mon, 6 Dec 2021 13:13:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 references : from : in-reply-to : content-type : content-transfer-encoding
 : mime-version : subject; s=PPS11062020;
 bh=wF7zGEqAK4wTU6sM2wRDencnovrFZLU17r7fgo/Bhew=;
 b=l8txgXhS2mVhfbWbEWAcuMmRBnlhJMmfslaM6gIrS0P6cWvMy4ExmV4dQAqgXxecDNud
 suKkTpzsSN7c9ik91x//yU/FjyBfP9plkfBuse40/llvmDI4qlH+f9W3p13myLWwcTnV
 deRCVLcVyVU5sOamj5noxSgdDRb2a4tdQUxwna9plo82m/P06iXbVVC0eJH2Y1+oy4I0
 GH/YH8i9fyl8Zk60Tq8lVYSqi/Xcm1y6MPreUVSfuLPmXQklJ3ma+Glyte4D9sRU7jDM
 1hFQlE1PMJBh+14kirALRa3Nl+LmKOB2DEi7xvFfAQWJWbsZ2ws9XHuPzqqqmTi4sOWC oQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3csa8jsfd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Dec 2021 13:13:26 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE/iwWviWkGuKa24cQYdXaqUu1aMvZez7RyJOTBDKAML3P1ezl7A75f16gqmV+4BT0Xs7PVVY0lVBkCTXgfUMviMT3PJ3mzrZhnLld3xBunzcBeocHqW1Neb9x/dYt5IrGE09oSDyxQW6Xgxtbae9DKGu8pOpVX7mz3VewfGuW09zHIp6nDIiBP4yE0kAvV18JXwjacKeTl6fQLZ+vhb/lbDd5nsCuCFpaEb+raVOoiTN2jBHxSsBPmPQgucvlvsYPLRVgUI0PRv7zM0YNPu3Qls3OSemezjFrETKxGlyDCtKNW1weNEsSFBKNiN/YL22QFHS3cFBtGP1qf34ejsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF7zGEqAK4wTU6sM2wRDencnovrFZLU17r7fgo/Bhew=;
 b=GDXq2K6nB/aC0fHrVvsvJDAX6TDS5RHTw3GsSglaiRj4QIcq29UekVdGKPZQzNF0oEawtwjcCvOP8F5RxakSw+QHcqn4K69jaFhq/5XO8K76h+Fc+YhdNMac8Dvo6fuVV/YDqWwh3C7bpJoSRTXCLOPQO/W08Y2dD/2Hka314U4uOnm3r9MD/Tufc6gwdIert0RcflPhqiV0Bv6gmswsyG5s8mKaXygt03nfRroEEhcGmuT+ODmjgonCHtckNghmEYD3zAH5OzBfwec1xJ5xhvhooK+q8yOvdVIdkuS6OBe0jukCUHAXhkNAZbsypkSpcJsfLD7p1wrSJkoZMlU4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF7zGEqAK4wTU6sM2wRDencnovrFZLU17r7fgo/Bhew=;
 b=gFp5MvdcrktNDOSVQbc64UCeNPM0x41owTETyYW9bP+XA46RHTXdxMqglhXzW0ez6Th1xM5pW4C0YLk/fOqZ/v9xuVCotZjCQuFm+D+fMapxU7ByqiOhGXvxGOBmqlflInxPy7ECFoDnRquS59pFDZzmqJ6bNpz4OP5Z79DIAvA=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN4PR0401MB3581.namprd04.prod.outlook.com (2603:10b6:803:46::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 19:13:23 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67%4]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 19:13:23 +0000
Message-ID: <9e13c762-07e0-cace-2c51-927c25e07904@ni.com>
Date: Mon, 6 Dec 2021 13:13:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
        openembedded-core@lists.openembedded.org
References: <1638835541-3789-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <1638835541-3789-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::30) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
Received: from [10.8.0.5] (37.19.213.64) by
 YT1PR01CA0091.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 19:13:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc123ae-3dc8-4c9e-4cc6-08d9b8ec7939
X-MS-TrafficTypeDiagnostic: SN4PR0401MB3581:EE_
X-Microsoft-Antispam-PRVS: 
	<SN4PR0401MB35818ED1D7AB64DF9B18ADD9FE6D9@SN4PR0401MB3581.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IE4Ln4D4EdJhgpTsnMLo6GFnHbQY807wHPQkh7leK2aKWXQtOnVSvs+F1F3Ore01fcGU7wX7Uo9BWkQ4QUyoEBuy2DhZOgSl+cjI1nPbYpBAKU/JvuJ/kjT3ZyD6Kh2cEmvjyH080t51Q5ULlN3eonLbtyf2oPIN4JK2TXuEVcf5xdJFyphegj7THdyIAT0AdkfzfH0yj3Y3u4Djda8QCKBSBgw6ZOX7OUTxwBlT/c0siFwteW0T00nh/BcY3RxPzOqjIg/Ib+Jl9BE5wpaTUpqeH6MhAMpbzclm4EtVQYbKfgloEji6JNsMbSYbVpfLWxVxwz+dBfLIGabdZ7SyixqDu+/X759UYJZTwXJ1RCyeOaX1XW4o1UUD8dCzk/Km4CHDeMo1rLz907Qug/pVrjSauLPKtyankbO8L7Y3Z0DkwTM0EiyKcP1zBnizkiL4kFdhv1HfppCJpeIwOZddW9d1CDXqEX0A6yJtwoD7Qu4IRYSdd+EtBF/F/UblnjzUeB1eKHFIWHNAljfvmbFaR/f7OxJxL3KgrLvWit0og9HFB6/38sOLr5xnu1G41iI1FPi+vRSjbNpYEPFlN+PiG54lq3uKD8rPsxejYTJ0Os+eMreRld8UvjfbyApPoNT6Hs/B5PN1Pnfv3GjK20soV/M66Q+HSnOfj36Pfx2F4WDIQKGYFAwsbdJ0unvcee7dXcqlnkiJtghnqPDfgWXspxr+SGt956hyR+9M7YpQcVcgldiFO+Ym4tK3+G/IlJr9bH1EaWBJ7ir0RjB1OgMC/MAW3gEIk6lTTC/A3e7wDgOALYKyg+SwpF0KtD3sfD8fbQui8CwG+YfwN3UW3TgfJy/iO5bnHy+R+MmaxsGKIGA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(8936002)(31686004)(66556008)(66476007)(508600001)(66946007)(16576012)(316002)(44832011)(31696002)(86362001)(2616005)(36916002)(5660300002)(966005)(53546011)(6486002)(186003)(36756003)(2906002)(26005)(38100700002)(38350700002)(8676002)(956004)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTA0K2pQN3ZWUHRaZUNaeldWUEMyVFcybHNCSjhuY01UdDF2UFFVQ2RPL282?=
 =?utf-8?B?VEF6ZzVXU2NremkzS01EN0RwSVhQNHIyREhNUEdGM2V1S3VWSEVkMUxMN1Yx?=
 =?utf-8?B?L0Ezc2tNKytCYmI2bE43QjdLelJCUFJaWU1idTVpNnF0VkNsRHpOZzRtSDRP?=
 =?utf-8?B?cUFKMnh6N2doL1cxaGpHOEg2QnpOeHpvWGVZR1ZmMDkyWGVySXdvSldSdmNP?=
 =?utf-8?B?ZzJIaWdMUUNLWE1qR0hFb2lyenBLWXd4N1o1TlVMcVgreWcrSXVvWm56My9r?=
 =?utf-8?B?d1NwV2dpY29OQ2hObHRJb3NGQTFBbEpobndVQkErMkFieG1JL2dsNW1yZWNt?=
 =?utf-8?B?MTNhSVY1QzUyTHNINUEzSGZaa1BLY0VnTldWNTRtNktOb0VoWmxhMVNURjJy?=
 =?utf-8?B?Q0pNcEVXSk42OGFLVkZiakROQTNTT2NKaHpsemZ5ZmEwSW11bXVGY1d3Ulho?=
 =?utf-8?B?L01WTzlLZmQ4YWFzMUgvcXRMZGQ5bWpRS293R1RreHpVNjhCaWMvSy9qYjJD?=
 =?utf-8?B?UEhwcVBNSmsvQkhiY250UnNVS3NRM2J1aG5FSHo1WDhGZ0ttck1JeERXMDVE?=
 =?utf-8?B?c1ExWFNtWHg4V3c4ZzhwSFl2ejNWZGIvVm8ySVlWTTdaVkpRQS8yVUJWemhv?=
 =?utf-8?B?UFA0bnhVRS94YWx2clVwSitZVjM2dkxCNXViVUYxRitIZGJacnNOMmM1ZStp?=
 =?utf-8?B?M3dBd0VBOUUvWGxsaXVGRjI3MW5CVlN3MUlIVTFtZW4zTEkveHlxbVhKVGZi?=
 =?utf-8?B?N2h3RFFUWmwwQ0Q2a0RZdkdZY1h4eUl0cGRyU2FDNmdSREhyVlRkSnNUMUV2?=
 =?utf-8?B?dldDODZsOGYzQzlBN1I0aDh3Z0ZuRWpDbTc5aUtJUkxtSTN2U2J4aEZqOEtw?=
 =?utf-8?B?L1llQXhzcGhLMTNUME9ERGhXZW53V2RUaTJHcGtLN25aR0dlSDMwODVlTUZT?=
 =?utf-8?B?R21UU0RxakE4ZWplbXl4dUhDSXVSOE1mNm9BUGhuTU5UUHVjckRmNWY5Vzdm?=
 =?utf-8?B?S2dhSHFmRU1zMDVZOTBQTU4xN2o5Z24veGwyeWZySTdYa3hiUk5wYzVPYmla?=
 =?utf-8?B?Q2d6TWh0RXR0ZTdhNnUxTUFOazBmdG01WWJ6S1pJcVhqLzNjMm9CdFQ0K1dL?=
 =?utf-8?B?RlBySy9hZGdjTGRLRDUzdWgybHU5Q2hYSXM2SkcrYk1oQ2Y0NUYvSVB5b3Zk?=
 =?utf-8?B?T2hoNDNpZGVFazdpMVpNNTU1ampvYmw0ellNNTRvTGVkNm5hc3FOM2lRaVBx?=
 =?utf-8?B?SUZJY1duUlNyYzQ5VFZwaExMSzdjY3JUZlQ0ekt6Rk9USGVjbzhwOHlIZDRM?=
 =?utf-8?B?UE12SG5LSEtrdzE0clJySkRLWUoyL2ZjSWdPM0hKMUZTaVhGanFUMGZmYUpY?=
 =?utf-8?B?a3hIb0hMT2h0R0FKR01rTmlCVXBmbHpjQ0FuS25vNjUreHo5WXdjZ0pTQXpy?=
 =?utf-8?B?ZmlSZ2dLd0lrWDZ3eHFHaDArUkQ3dndJZEF1SFo2UUZyU25iVWxIVHhqcXR1?=
 =?utf-8?B?a29FbW5CUE1VYnYrVGJkMTMveFRHTmFMRXBIa25heko5ekVyOGZLSlZnZ2h0?=
 =?utf-8?B?NXVaanovUWZpSHkxSHJ5SzRORnFHN2Ird0RuRmYvbjg3MnhGK1k1ZklLVTBH?=
 =?utf-8?B?bnViLzVzek04aEhGR0VsWEd4QjgyV1JnODF6SmlnVUZGSTNPT2paSDNOclhh?=
 =?utf-8?B?Y2hjZ1pmbHVseloxL3ZNdWhab295dU9scHBZUERtMkdlemNRRjhORkRBcFFj?=
 =?utf-8?B?d0YvSHIvZEdwL2ZuQWhsSjJwMGFucGpvTzlQRHpBeFZJR0EzR2xWQ3B5YzF5?=
 =?utf-8?B?SXZ5WEtRa3F6SDdWUHVHTGpKNkJHaEVWak9TOEdMeFZZV0ltK3RVYUZBZWxp?=
 =?utf-8?B?dlZ5b3NoMEkzekticUpHbUM3Z2ZGQnVHd3VuczNxTTFHYkluUUJyY0U1Q05v?=
 =?utf-8?B?T1RYTHJLNkJBMzl5cERxZUg1TTF2Mk11NEtZMW1qbThOZlVxenh6L3Nnc2U1?=
 =?utf-8?B?OFhYMWVsNTBUQWcvdVR2UnFuaThrVnlmMitsSHR0M1NyVzdtaElQZXB1eW92?=
 =?utf-8?B?QVhabkpjOFdGUFpLcGFrRU1yWUVjVTN3cE5rcjlEUkNTQm9TVDl4WGNGVi9R?=
 =?utf-8?B?NjN1cStSSzJRSUpaVXV5czdLQk0wYnFLdERJMWxrTzRPUmFKeVFqTyt4eUta?=
 =?utf-8?Q?lwwh1aS3iJyTXVOfiTOS/1w=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3dc123ae-3dc8-4c9e-4cc6-08d9b8ec7939
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 19:13:23.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q0oHjqBH4bHRelNvxBS5obivGBTPoQxHa8Q3fGiWFX+tkon/dul0+0LSKJYZlc9oz3OoLSAitg/6GLl5fmLQDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3581
X-Proofpoint-ORIG-GUID: 5frrqlb8yxHgn5Q11c1O2Fe1PYBXjqew
X-Proofpoint-GUID: 5frrqlb8yxHgn5Q11c1O2Fe1PYBXjqew
Subject: Re: [OE-core] [PATCH] opkg: upgrade 0.4.5 -> 0.5.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_07,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112060116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 19:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159267

You beat me to posting my own recipe upgrade commit. :)

Toward the bottom of the opkg_*.bb recipe file is a 
`package_qa_check_openssl_deprecation` function which I added in the 
0.4.5 release to warn BB users when they are building opkg with the 
openssl options. Could you amend your patchset to remove that function 
in its entirety, since it is no longer needed.

On 12/6/21 18:05, zhengruoqin wrote:
> Remove unsupported openssl and option --disable-pathfinder
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   meta/recipes-devtools/opkg/{opkg_0.4.5.bb => opkg_0.5.0.bb} | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>   rename meta/recipes-devtools/opkg/{opkg_0.4.5.bb => opkg_0.5.0.bb} (92%)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
> similarity index 92%
> rename from meta/recipes-devtools/opkg/opkg_0.4.5.bb
> rename to meta/recipes-devtools/opkg/opkg_0.5.0.bb
> index 1fe6ed5ecb..bc2ee9728b 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
> @@ -18,8 +18,7 @@ SRC_URI = "https://urldefense.com/v3/__http://downloads.yoctoproject.org/releases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0ZwI3Qg!7tN48q7yAANgWzzpMBAysrcbhsbWEdwp0sXfb2Hl7bFTyNxbtdOuRQFN01Y06ns$
>              file://run-ptest \
>   "
>   
> -SRC_URI[md5sum] = "5dc41ad37d88803b5e0f456a9c5a0811"
> -SRC_URI[sha256sum] = "a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e"
> +SRC_URI[sha256sum] = "559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14caaef76ddf0f7721ad1c"
>   
>   # This needs to be before ptest inherit, otherwise all ptest files end packaged
>   # in libopkg package if OPKGLIBDIR == libdir, because default
> @@ -39,11 +38,9 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
>       "
>   PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
>   PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
> -PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
>   PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
>   PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
>   
> -EXTRA_OECONF += " --disable-pathfinder"
>   EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
>   
>   do_install:append () {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159234): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/159234__;!!FbZ0ZwI3Qg!7tN48q7yAANgWzzpMBAysrcbhsbWEdwp0sXfb2Hl7bFTyNxbtdOuRQFNYTohWF4$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.org/mt/87541521/3616788__;!!FbZ0ZwI3Qg!7tN48q7yAANgWzzpMBAysrcbhsbWEdwp0sXfb2Hl7bFTyNxbtdOuRQFNxmktw8A$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!7tN48q7yAANgWzzpMBAysrcbhsbWEdwp0sXfb2Hl7bFTyNxbtdOuRQFNBNnQw3g$  [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


