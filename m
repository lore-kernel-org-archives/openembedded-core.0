Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDABC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 12:57:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8059.1684933068574643853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 05:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bzwha+x+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4508594f4b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OAeDPO022715
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:57:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=fo0VSyg2WXTPG+iHKYl5dzJlCfLFdxY6HHIe7jdYMIY=;
 b=bzwha+x+e27Hf4F055m4IQYFelbNdGVHOs1PasKVpP02k50KRQiyCKhQEG8IVQ4i1yFp
 wTJ8X+oOoDb1OOgAqx611UtnpbW+2wdfY9LfQcuZMkjQkBYX9iJeahnufIWci8okrY43
 Xu7nq6xFrv9vxd9ZCLulCtaRbD1heaQroXDBfV+Jgdfm1lWjDDS9a0rBt0Dh+8zXf66P
 T2S3vXWNa9XpGnvK/98mpINwGWtK+jZC68RajRLgnZOIuwT0GzLzSh3D+hELzGyY8Wak
 thM7yDNX628F8yZhhzNiJnWEJl0ZywJjXdt9QyFUMmvlVu6c9B2lZ4X4mYrw8orsdEA2 JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhbpu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:57:48 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34OCvlnp022748
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:57:47 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhbpu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 05:57:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmq2EQJTIReUiSGFdDUFNXRrcFQCYHsKqE6Co7B8G1HXVnkCTvSN10/58qMQH/F3GcLe1qOjlcDQEjhnyRPxvfR6Ho0wN7fPqNbBWhfz7vvwKiB9U1zFPtDyoE8gmj9BwPc4LEBfk1LfQxUjWzNepg3zOgxju+up2w5/Ww3kPC4yjFmpQ5Cf6D9Cqhw+8vMi3gvB6S92/etviMB9aUNgOg7liYBGWyu4D5EnoViax5ULKReFN8yzkbMHq5MJ8vwubvRHncfnm5SACq64QbkHGchDpEglJ6KD2bDT3/IiMrHmSFO1fNTqBf9tM1+fpTN66g+pFWox+G5NmESJ86VTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fo0VSyg2WXTPG+iHKYl5dzJlCfLFdxY6HHIe7jdYMIY=;
 b=KW0u8oiJToLAf0r0LO+WIGFc81DT8tVsXJcnTM3q8cZ15hJeFSqGWdlxFYZZl3YKbhZYklDAXjs2VJ9Wgmr1IxiEgKGizSg6a2Pt9cDv7ZuvlwqFC4D4iH7HHCcwaLAL1UDhuOHgDQvx60CH2vE5Gpu0E/uCacgFbjYPM+bi1aaOXMNGek3W7dP+K6Z9zVh5AC0By0L45w2CuFUtd7uJ1GQYD22DDGZze/6w3sI7et9GCKxP/RQ7X86W9GYLW5qOvK8ii9uDkVcJmaNUphUqG5kI4qIpX7KUdByqQNmyBIjpt7CHYaLt2DYGFP8HNeGb1A486TRIM4vILQP9q94zpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 12:57:44 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 12:57:44 +0000
Content-Type: multipart/alternative;
 boundary="------------vUg9B1rEfkks24d3iDl3MaKG"
Message-ID: <8f1d515d-0eb3-c9de-65df-1034c61154e2@windriver.com>
Date: Wed, 24 May 2023 08:57:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core][PATCH] p11-kit: add native to BBCLASSEXTEND ->
 kirkstone
Content-Language: en-CA
To: jlu@pengutronix.de, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20230126064612.3803320-1-jlu@pengutronix.de>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230126064612.3803320-1-jlu@pengutronix.de>
X-ClientProxiedBy: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f841bbb-170b-4677-2bd1-08db5c56773d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BOQauClr8xWTyn/sGmN3ifeeDWOJN3iESER//Oe2NxWmr7a2HwNAzKKd9xPYtMGu81i1vZxMfRZ3ZOHqc4uaSc60Sg7YWj/cI0YFTQ7xHh2k3hHtuaDv9jhBU07XOh43p5JPYuB5aWY+XXCK2ACcYyG28i+q19AwxLfZ8lD2ef75zqSKQ5jGHXxYu/wXnRnWV7LMAuImQgBYkJIZeDFVefq32Wl6kvbJh6fJKup/dwPXw34abyolIT00txCXFDXXVKYOxWEPJB+mthebzt1XsU0wUDJyPJ0S5MENHf/vvyYtDFnYsSF8qev01S/2/zloCSBQFP5XXneDUCpJiSYAZm34y1NF1qWRKe9M8TmqCIlNzRBgMgqaZmua1sEkXuSofW5HlEQTd+rSAeH+UlPOgJT4vBmPnv5R+W+Qpmp38AXy6XuZS3ABp8FzdpGrXCQrZboTCI514m7vvhopoFmPZk7RWXBXMQ9GtIY4qkm/E+CIsSw52hQFe+rl478a5Y0ogtOx/ghdDNsSWvvgiAeWj+rlm2qaDmGIHfQJ8mQBlJBVPy49dm5mXpOOT69gBH7XoJlLe84aVBIrrLBz1HWlyKGVp33IFiZDi7RASwsVBFR+0ZicvGmlzEpF2iEknR2oHjvxx9mZly9dBiqhrw4BTzNi5DLOxVMQVXJl8RM8gbs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39850400004)(366004)(451199021)(166002)(86362001)(31696002)(66946007)(66476007)(66556008)(478600001)(38100700002)(31686004)(83380400001)(966005)(6486002)(2906002)(2616005)(33964004)(6666004)(36756003)(316002)(6916009)(8676002)(8936002)(66899021)(53546011)(186003)(26005)(5660300002)(41300700001)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aW8zNFNYS1l0WjVpZFh1WnpodFVXbkNZZUNEMGp1Rks2ZVp0amtCODdCNSs2?=
 =?utf-8?B?cDlwM2hxeEVtZlNibkVKTXRKRnplcjdSaXRYL25NT2QrSHUvL0pwVDhTK3VX?=
 =?utf-8?B?OFJpMkEyTFEvcys5YkM3M2NvQ2M2MGlXR3hPVVQrQXpiZGtPUDNlajNyS0th?=
 =?utf-8?B?ZmE5VjNxSklTTmFUTWFWOXZhb25VRHdqcUQxSU9TUzd1TTRqS2JHazU1MW1v?=
 =?utf-8?B?QTFQMStoemdtVDhsT3NOL1hXa3JUVjBlQmFiSWFrQVBBRVBkb2dDS1ZmZjBU?=
 =?utf-8?B?ZnFUTVdBVUw5cGpVRm40cEpERk0rai9YbmRKaFZDZmVxRDNkSzdUUWV4MGcw?=
 =?utf-8?B?SjNjVTB0VUkwMlYxWWdEeCtoQnJRV29HZDVtMURuRWd2K3RoM0FMUEpUU0lI?=
 =?utf-8?B?cWZqUGlpM0MwSXhQU0J5RTNrSDBCdXIwZ2kyczgzT2JYQlRtdkNIRTZ0OWNO?=
 =?utf-8?B?d1IwbHkvY3FkQUdqT1ZXYkU1aHBabEJZajZXUkVRdXE2elB4N3NHaGZkb2xa?=
 =?utf-8?B?VTRPNzZ1ZCtPMndja0FOb1M5NGh2T2NCN0E2TnBxeHB3ck9lVFliSXQzcStj?=
 =?utf-8?B?TG1GS2pKSVpCWDdETHFnRjBqbHV0azhvL014ZGU5aFlpU0R3V1p3UXppaThy?=
 =?utf-8?B?b3ZNUTc2UzgydE5rTzNWci9JMVI5OGw3OXBZVlFjSzZUdnpyWnZpUUFKYUxu?=
 =?utf-8?B?aWFwdHZJUVhoTDFiazZycWpwdDhaNUgrc0djdnJteGZtSlRrL1pGSHRrR1c0?=
 =?utf-8?B?bCt5N2cyM1hIY1VmdWdWemJJSDVqTXpiamhpMFJCZ1B2dzMwV0lxditMcmVo?=
 =?utf-8?B?bmF0ZXcrenhtaSt5SkloRVZRdUg1M3lYa1lkUzZZU1pYUEROM2JlNWhkMUlt?=
 =?utf-8?B?N1huRzhBUXlaZjFBZW9mNHY3OS9TL0swRW1GZU1oOUtBYkRhRlQ3b0h4U2tF?=
 =?utf-8?B?ODcvM3pIdEFwOXYxdWFWRTY4MEh5R2RlUHd5MFFTcGxiNHd4aWZMQXdkNStV?=
 =?utf-8?B?ME91c2svQkZ1d1ozeDFENUdVZEhobVhHNGhVbzJJcGFGeStKNkt5dEU4YjJm?=
 =?utf-8?B?ZW1oK3JTS3VxUHRqbnl0ckd3RTBWQnArWHg1dnNmMEdFRUdCRDJRVGt2Tzhv?=
 =?utf-8?B?dWRFRk1uS016dm8wOFE3VEhRYWxRQ0pNWTkrUGFBaXBhb3IwdmpYYW1UcThW?=
 =?utf-8?B?aGViSWFSS2MxUG82WDFhYVIxVnJhOWo0SStlVGVhZ0l2emRaOTErbU1FeDV4?=
 =?utf-8?B?TU9lbnRaRXdrS1lKeXg0TkxrZG8vSUFJQmN2cHcyeGVHK0pqWHV4c2pFc3Rw?=
 =?utf-8?B?UE45OHNhR1RaYXlGazdhc2NicTFzQm0xcG8xMnBLSFhsVlJFbEVUeDhvVEtk?=
 =?utf-8?B?OG5zQmwxOE13RWNUZGY0L2JHYmlZNTFjZUVWWHEwd0EvZUZWWGZUTmFqeG9M?=
 =?utf-8?B?bEVZSWNnaHlYMUNiWWxtVGM4ZzFnVW1CQTVPbloyNFhKY2RLWC9CSU4xbzRz?=
 =?utf-8?B?ZitTcmdQYUlRQTZWaWxmeDZLbnY0Z3VTWExnYWMrYTZJUzNYd2M2aWZETVZX?=
 =?utf-8?B?M3BJWEhJZWdXdXg2TjIyMVZoU2g1TC9GM3I4S1BuM1JETjhSQ3BMM0lsbkdz?=
 =?utf-8?B?RGVyeEY2bkJXaGFnRm1jMGRNQWliZm1rYVJ0NzV6a2dIZlR3eTVKdkRxZ2I4?=
 =?utf-8?B?TlgrbFI1bHR3ZUlzSzlrZVJwVGNVM0JLQmQ3UUhHbllmSE9nNkYxa1pldCsr?=
 =?utf-8?B?VzVUaVR2TVIzMlNUMldCQk1NSkpmbDlTOXZSSU4rU253SFlmMVkvd2pXNGZa?=
 =?utf-8?B?WlJSM2NGYmltcWc3Y1BqM3U3WkRMcGZRNGdQMUZxZ1FnQ2JQc21QZXlmZnB0?=
 =?utf-8?B?UkYxZElJaDE4dDRyN3NNOHlBMndwUUtIMWhYaEMySHEzZmc2WmROaHhNZHcz?=
 =?utf-8?B?N3BJSUdCN1Y0YWNLZ1lOUDF3ZVcwNlRzc25XbFJFdUlqeHRLaUIydXk4VmNt?=
 =?utf-8?B?bDlwZnp6M1dJeTlnN2hiam12RUM5VXkyaTdHQzVsTy91QytmdzFpa2w2Zkt5?=
 =?utf-8?B?K3JnVFpCTVJjNTNXSGRVT0xiRnZGcFQzTzdOdTYxT3N6ZFBNMTJuSkt6a2tu?=
 =?utf-8?B?OThsKzZTSnJBMUdLSkI5dGtCWU13cmkyTHRvcG15ckMwT1RqbVNZZ012NU9y?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f841bbb-170b-4677-2bd1-08db5c56773d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 12:57:44.5730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEJQRcGICoyWS5LXqJuQn9i62QAOvNKFnB4FZ/OTaD3fiVhT6NFoA57JyR5gusTzuuMjRvn27h4ShpiCS91k5o/Aif/0/uzh4YA7tGhIr9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-Proofpoint-GUID: XaT_SBTpDEkZcP0-W9BEl5pVpnrk-Fxn
X-Proofpoint-ORIG-GUID: ELDzyCKlCemJORYqQy-DxDN55Xy3CxNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_08,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=809
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 12:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181672

--------------vUg9B1rEfkks24d3iDl3MaKG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-01-26 01:46, Jan Luebbe via lists.openembedded.org wrote:
> This recipe is needed to build softhsm (in meta-oe) in with p11-kit
> support, which is useful when multiple PKCS#11 modules need to be used.
>
> Signed-off-by: Jan Luebbe<jlu@pengutronix.de>
> ---
>   meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> index 59cbb67961ac..72b446204a1c 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> @@ -29,4 +29,4 @@ FILES:${PN} += " \
>   # PN contains p11-kit-proxy.so, a symlink to a loadable module
>   INSANE_SKIP:${PN} = "dev-so"
>   
> -BBCLASSEXTEND = "nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
Steve, could this change be back-ported to kirkstone?

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176382):https://lists.openembedded.org/g/openembedded-core/message/176382
> Mute This Topic:https://lists.openembedded.org/mt/96538706/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------vUg9B1rEfkks24d3iDl3MaKG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-01-26 01:46, Jan Luebbe via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230126064612.3803320-1-jlu@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">This recipe is needed to build softhsm (in meta-oe) in with p11-kit
support, which is useful when multiple PKCS#11 modules need to be used.

Signed-off-by: Jan Luebbe <a class="moz-txt-link-rfc2396E" href="mailto:jlu@pengutronix.de">&lt;jlu@pengutronix.de&gt;</a>
---
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
index 59cbb67961ac..72b446204a1c 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -29,4 +29,4 @@ FILES:${PN} += &quot; \
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP:${PN} = &quot;dev-so&quot;
 
-BBCLASSEXTEND = &quot;nativesdk&quot;
+BBCLASSEXTEND = &quot;native nativesdk&quot;</pre>
    </blockquote>
    Steve, could this change be back-ported to kirkstone?<br>
    <br>
    <blockquote type="cite" cite="mid:20230126064612.3803320-1-jlu@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#176382): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/176382">https://lists.openembedded.org/g/openembedded-core/message/176382</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96538706/3616765">https://lists.openembedded.org/mt/96538706/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------vUg9B1rEfkks24d3iDl3MaKG--

