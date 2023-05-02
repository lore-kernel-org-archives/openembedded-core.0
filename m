Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCA9C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:47:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1789.1683038870096194714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=FOR6QCUF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4486efa346=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342DaFQj021049
	for <openembedded-core@lists.openembedded.org>; Tue, 2 May 2023 14:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=ldbi8kX5oSedGBSFxo5MG9B6okE6afVNJhSGRvVIsZA=;
 b=FOR6QCUFHmmrxs0KP/cB7fi4f1J8aKtyxMQWOYZ8eFo8WXfv5D8QYI/UepZjS8nYL2So
 QGl/Rr3htP4h32sI30uE9G8w4s2sDnxQ3RBvtMxgB7y1S0joReIOMuRcU2BRSpjTSAex
 nqo8jHGf8eIZl1uuJ0K6BqmX6FQqfvZM3a9e6BFtJ4KZGg4+EWnd4FZkSs8iUdBlXxeW
 Ju8SqKG05ZJZiLj2iX1BoUP5TxBYbad/6XTtcOddVCYVQkNGdrjLM96JoXt96HNKjXcq
 TTBggUh1zxh/n3dFxnKdZ+/OLEuSROcX2GVGRYQmt3/5Odih7R+Kf/taobKROpF1O8PU wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qaahu951f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:47:49 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 342ElmBp025630
	for <openembedded-core@lists.openembedded.org>; Tue, 2 May 2023 14:47:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qaahu951d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 14:47:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAnBxLkDZFbSjGDbMrID3qXYvG1xjFNtRR2JXNoDuVVngsh3V4ziim4hdFKS468qnGx/uYlE1CHsYHWD6o0nKDsbOvNYOLygDrRx/s5WO4d5HErDuTgYGIcOSp9831PKdvmU25K/2zPFSgrpJLltUDAhd2Tvde7aYqUcmFeTOBPRi9ZoPIzjv5rmjKkD2JgYbJGD2zL2YTiNn+/DlPEo7WaokIJ0qjgkRORnk9YBV7pIabg0VZXT+6E/VVPRF5uGRN8/oe1H/sMnuhuxSeYMfpFO7Dy3QhlMF6X8bZpoG/BDCsgzBrq1w6X+94puhHxnkLdKP0ZPdqC1Sw6X6KXPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldbi8kX5oSedGBSFxo5MG9B6okE6afVNJhSGRvVIsZA=;
 b=YuGQmu4DuaAr4Tlcjx4vJGPessahKNd56HTlLXqNX7tUgbdzcSRiV8v5XlsC2JKeoYahDQ8yeODGJAdvSReRyv4drXrPLnNfiXL5COQ3tMCvbxhQdySDS+YFwkRNZP0ExzJ49W7sL1J4DHkZ0ZhNTrqnptDvQRNdm4w9ea1viwto5D2jT+CsbP1g2g9nOd3queRI39d0nu/F+XOYpecsCBU6YIhwTE06JyuqqyuLVlTdajns/qtjvznU8JbHaWyzrf3WZrZXswDgIlAjuR6rhIKJ3oxz/WeCwp+PvqxufzlbWCk1Aja2dZiRM/JyL1wmTZG21vXMvjwnOrG5adHz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 14:47:46 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab%3]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 14:47:46 +0000
Content-Type: multipart/alternative;
 boundary="------------6ngpIluN00K2IRwowU8nNeBb"
Message-ID: <37a6afa2-6fe6-8d61-6348-2ffaa898cfaa@windriver.com>
Date: Tue, 2 May 2023 10:47:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-48434
Content-Language: en-CA
To: narpat.mali@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: hari.gpillai@windriver.com
References: <20230428165832.1290909-1-narpat.mali@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230428165832.1290909-1-narpat.mali@windriver.com>
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 73279030-ebd4-4670-71fd-08db4b1c3170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DKLAT2IBfH9j9SUqKx3E+md5YdI3UtU30h7kAoi3mqUO/mOU92pZujkj60c9nKQup44qmv8SaH7lUM2vATGYawnoon8Mjxpu/PGCuRvqikwO4crH/bSupE6rzDex6pU5FCghuG9KqdzxAEQ3F+Y2eCo2cyQOvKnThT9Apj1PmhLa4ZpBIUwZ+MPaIxJRB74neDASAwkpF+jDYlqAZDk24ABZRLXuTiZo179oRmPvXisjyFh19dbVjS9YCNtva/UUah08oBXpL6OF6baAKXQhONU79C/xW+Jxgp2ZEB8jWbZ/tX7YEgIU6ZbeSCilDIoEdM14r8rfhQkLQNeh921LdIlyN8iC4BjIXUDqMKflTrgg66ZiEC1DJbxJEhfYMGI2kO1Rnjk9YuDZUrosUEieTJ3GhTy/nqFLuXNZK1FEatpeZLN3yT8TEvnQnPyjdVSPOIKO6NQiMYSJOPYLogVAig070Y9UyTIOr/S4GwvrJqNrH4DP6bVa+uSuq1fKG+G3IReztLwLF+x8iegS6rsAfzVuS3zEQX2eMearbrjcCMgb0fA3nYoZXN23n4FPZsyzMYwKlFKj6lQjoQXCom2eo+EuR+lap1TiN+GGGpc0CJ5ru4y9IfG5rEzQxJIiwTOliOk3OV6OstAkrra88pSgRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(376002)(346002)(451199021)(478600001)(6666004)(6486002)(33964004)(38100700002)(66946007)(316002)(2906002)(66476007)(6916009)(66556008)(4326008)(36756003)(86362001)(31696002)(107886003)(31686004)(8936002)(8676002)(2616005)(83380400001)(53546011)(6506007)(5660300002)(186003)(26005)(6512007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGpMcVl2bmRHZmdvZUVFNG5pemZ0eUNNWFpYMHJMOU50R1ZTRnNHT1ZELzdl?=
 =?utf-8?B?Y2hPL3c0N2ZTU0JtYzk4ejNjQllRRE11QWY1clVvRHM4aXJJV2xCakZQdHNw?=
 =?utf-8?B?cTVqRmNEQ3N2UmQxMmNpS1hXNVMvZnh5VmZYckFzRW9PMHQ1V1J6QkdROHNn?=
 =?utf-8?B?dU1hdFdUMHRoM3dzT05VNWIzVWFCbFJ2TEdOaWcwclc3NkpMSi9RSFJaMnpa?=
 =?utf-8?B?Z1B6ZXF1bGUvWkVER1hMN1FTdzlCemloWTZSVVU4NHNQTWVOVjN5VXNabjRT?=
 =?utf-8?B?UU5XazlrUU5CL1dXQVFpNWQ3RWNiUTZTZHNDaXVpcVpVK1VzV0s2bDBtdFpp?=
 =?utf-8?B?RXpXdDU5N3h5aTR0cEJxWHBtb3JURGx5ckw1UFVhSHQ4Q2FLU2wvV25ucEZZ?=
 =?utf-8?B?YUw3R2RobnhRNDNxSWxCRWtkOWl1UjBGcUZ3RXg5NEtleTR1ZU5sZ2JRdVpC?=
 =?utf-8?B?UmhCSjlNaXFURTNldDBUUjBMZlh6RUdhRHdSUzY5R2p2ZXIxTGs3V0R2MW1p?=
 =?utf-8?B?a3A3UkNuNEVlL2ZKWDhVWlIzdFVtOHVqZkx6cEhYdjJhR1RudDFtK3UzWXpO?=
 =?utf-8?B?cnpGcUlOblJFUGRUbXlXWFRUUHJLOFJMRlJyRHRkV2VJdTNNcEVmMlRucVdl?=
 =?utf-8?B?ZHp0RzUvSHIrTGhNY1JZWWQ4dUF3aXM1bWxvWTRiZUZQbFp3NllabXhMNWV2?=
 =?utf-8?B?RW5vQ0JyTUJxUldqWXluc1hRbzV3NnRMTGFHRGVxRFlSWkExUk12c01vb2Za?=
 =?utf-8?B?ZFc5L1M0L01UVS9ITHZmWE0wZ3Nia0NaRXo3NUxIS0xrTERIb0R0SW9YdndL?=
 =?utf-8?B?MzlZS3E5blNwY3pOamNXcEtzcERvZE9iQ1plamx1Wk9pem5pMTlHN0dvMlBS?=
 =?utf-8?B?OGVHQlhkL2xPSGhMbUdxUHZETGxmVEtRSk9TTUh4dEVJcysrNklNVSs2c1U2?=
 =?utf-8?B?bERWRnFhc0xsNE5obVJJM040MWRlV2JVK2txeDUrM3pyS2hPMmRHc3F0UWE1?=
 =?utf-8?B?SXBXSjExRmNXY01jOUJhRkIzYyt2RHlRNnZzNGo2YllpK2h5ZlNNUGEvMlVM?=
 =?utf-8?B?VlFrRWV2TU5GQVhCK2JpNFE0UUxjbi9uRG1QR2VNYjc3VDNiUFhrY2krclF2?=
 =?utf-8?B?ckQ1WjYrY0VGeXl2R2ZaeHVGWHhIaWtoYzZzZVlwY2E3Ymp5TlU5YVdnSkFx?=
 =?utf-8?B?WWtWSkgvKzBFd0lVRmIwVjRXck5nYnpTeHd5emV1NWtWamFWRzQyYkNhcUpa?=
 =?utf-8?B?M2t6cWlwU0hnUDN0UDFMV1g5VUhYNWFETHJzK2wzcTBYbXdPTTI3eHZuaXNo?=
 =?utf-8?B?ZXYxU2V5K05LWnY3SE5xSnF2ZmhnTDJaa2FVQmtCSzczZjBmT2FOVlhFOWsw?=
 =?utf-8?B?MDU5WTJkNGQyVGtvWWtmOGlZbnVCQ3JRaFZHRDZTZHg5OHBTYlFTbmlleHNq?=
 =?utf-8?B?czR2aVh1V0dmNXpaTzRwbG5JQzRnenVLV055N0swcGN0enpEb2tHRVZXeU5l?=
 =?utf-8?B?b1gyVytTUWxKT1EzRG1xTUxXMDBrdS9zd2szZzQzNG9IdVdnVmJmbjI4ai9L?=
 =?utf-8?B?ejdIUS9DdWt6Rm8ranB2WW1UNWt4aUJhNEl3d1p3cGhpMk5mTUJXbFhTcU4y?=
 =?utf-8?B?NGg5T3pFNmg1OVZwUDkrVlNPdGwyT0dsSEdkWWxHeWg5L2tWb3p0dkIwYkV6?=
 =?utf-8?B?YVhpOFVpQThzSERON0Q2VHdTNmdsUXI2bEtxS01PVXpuWDJ3dndrYUpaaEpp?=
 =?utf-8?B?RGdmNm5DUWpuVVU0VS9GbmNUNUVRY0tjR3dSWGhOSmVwR0ZjcGt6NngwU1Jx?=
 =?utf-8?B?SU5mUDR5bGNGVHBQYmJGMGRDYTNZaXlCbGJPM0Y0TjhWMzg3MVhkK21NSUxt?=
 =?utf-8?B?bFZRb0o5SVV6ZWs2U1pzR1FsZkdsMnNBMXk4ZlJVQ2pQbi9RbDF5OGh0MVVm?=
 =?utf-8?B?cG5Jc2hkQkgvcXZaNlVtUCtXbjl1T1NZSEp6anY4RFd4dWxhdmZkRjdHQ1Fu?=
 =?utf-8?B?U25Ea3FHTFliKy8zSlF5bTlaQllyNkdpZU52dm9xMmFybUFYb2s3OE1tVnBB?=
 =?utf-8?B?ZkRqSlZnQTlKZzFJdFJxVlJUNktvT3BEY2ExOHJuQmlIWjVvZ0k3cUVLTVRG?=
 =?utf-8?B?aERpWCtTbGZHWlgyQnY5Ty9NZDkwajBPWnh0a29Ic0VvK1R4K0ordHdwT3BW?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73279030-ebd4-4670-71fd-08db4b1c3170
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 14:47:46.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9fX1CYAc+FhvbuPlZFUrFU1/MB4iFdkLfC2tCgyj5DzpdSJIAbGhn2pANzK0m4egFE25JDc1et/Qp0NruswhApiW3oT9TTKZggvGuBAHi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-Proofpoint-ORIG-GUID: bjU-i5ZxW-7GvDEhISuYp6UuNRYya_LL
X-Proofpoint-GUID: uvXcf1JcAwSHjkQkGhBJ4xgZL7hoKUkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180740

--------------6ngpIluN00K2IRwowU8nNeBb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 342DaFQj021049

On 2023-04-28 12:58, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali<narpat.mali@windriver.com>
>
> libavcodec/pthread_frame.c in FFmpeg before 5.1.2, as used in VLC and
> other products, leaves stale hwaccel state in worker threads, which
> allows attackers to trigger a use-after-free and execute arbitrary
> code in some circumstances (e.g., hardware re-initialization upon a
> mid-video SPS change when Direct3D11 is used).

Thanks for working on this fix.

LGTM but see some nitpics below.

../Randy



Note that it's nice to minimize whitespace noise (but no need to re-submi=
t):

poky.git on kirkstone [$]

=E2=9D=AF git am /tmp/narpat-ffmpeg.eml
Applying: ffmpeg: fix for CVE-2022-48434
.git/rebase-apply/patch:49: trailing whitespace.

.git/rebase-apply/patch:53: trailing whitespace.

.git/rebase-apply/patch:66: trailing whitespace.

.git/rebase-apply/patch:72: trailing whitespace.

.git/rebase-apply/patch:81: trailing whitespace.

warning: squelched 8 whitespace errors
warning: 13 lines add whitespace errors.


I also note that in the ffmpeg git repo, this commit has been back-ported=
:

ffmpeg.git on release/5.0
=E2=9D=AF git log --oneline -1 3bc28e9d1ab33627cea3c632dd6b0c33e22e93ba
3bc28e9d1a lavc/pthread_frame: avoid leaving stale hwaccel state in=20
worker threads

ffmpeg.git on release/5.0
=E2=9D=AF git branch -a --contains 3bc28e9d1ab33627cea3c632dd6b0c33e22e93=
ba
* release/5.0
 =C2=A0 remotes/origin/release/5.0


Your patch is identical to the backport so that's good and we can accept=20
the patch
unless Steve finds a problem. Next time, check the git repo and see if=20
there is a
branch that matches the version we're using and if someone has already=20
done the
backport.


../Randy


--------------6ngpIluN00K2IRwowU8nNeBb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 342DaFQj021049

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-04-28 12:58, Narpat Mali via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230428165832.1290909-1-narpat=
.mali@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Narpat Mali <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:narpat.mali@windriver.com">&lt;nar=
pat.mali@windriver.com&gt;</a>

libavcodec/pthread_frame.c in FFmpeg before 5.1.2, as used in VLC and
other products, leaves stale hwaccel state in worker threads, which
allows attackers to trigger a use-after-free and execute arbitrary
code in some circumstances (e.g., hardware re-initialization upon a
mid-video SPS change when Direct3D11 is used).
</pre>
    </blockquote>
    <p>Thanks for working on this fix.</p>
    LGTM but see some nitpics below.
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Note that it's nice to minimize whitespace noise (but no need to
      re-submit):<br>
    </p>
    <p>poky.git on kirkstone [$] <br>
    </p>
    <p>=E2=9D=AF git am /tmp/narpat-ffmpeg.eml <br>
      Applying: ffmpeg: fix for CVE-2022-48434<br>
      .git/rebase-apply/patch:49: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:53: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:66: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:72: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:81: trailing whitespace.<br>
      &nbsp;<br>
      warning: squelched 8 whitespace errors<br>
      warning: 13 lines add whitespace errors.<br>
      <br>
    </p>
    <p><br>
    </p>
    <p>I also note that in the ffmpeg git repo, this commit has been
      back-ported:</p>
    <p>ffmpeg.git on release/5.0<br>
      =E2=9D=AF git log --oneline -1 3bc28e9d1ab33627cea3c632dd6b0c33e22e=
93ba<br>
      3bc28e9d1a lavc/pthread_frame: avoid leaving stale hwaccel state
      in worker threads<br>
      <br>
      ffmpeg.git on release/5.0<br>
      =E2=9D=AF git branch -a --contains
      3bc28e9d1ab33627cea3c632dd6b0c33e22e93ba<br>
      * release/5.0<br>
      &nbsp; remotes/origin/release/5.0<br>
    </p>
    <p><br>
    </p>
    <p>Your patch is identical to the backport so that's good and we can
      accept the patch<br>
      unless Steve finds a problem. Next time, check the git repo and
      see if there is a <br>
      branch that matches the version we're using and if someone has
      already done the<br>
      backport.<br>
    </p>
    <p>&nbsp;<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
  </body>
</html>

--------------6ngpIluN00K2IRwowU8nNeBb--

