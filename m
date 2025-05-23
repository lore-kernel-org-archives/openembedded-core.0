Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1270EC54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 16:22:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.52054.1748017340509219817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 09:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723836d92d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NEjm4U017792
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:22:20 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrc220-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeaJgt4kxQ83hyijAOxc2m92Vwxv/ORgE3NhAN2gYYu0lhHcNc3tHmC2+tiLF9e6xvBDdgh+qZLzgu1wBVYXmNzTo7qLyt86L5ikOKmmNEXKzslmyrUIpTtBup3BG6UV3u3JgYKeV7NlM6QQA1CUgDZR7YLdt/q7brxqN1DAmELSst/fh0ddMHzwnyRop8jn++wgJDZlTmeQyEdEa1wd4bvUueFoe7cXI0AHYkknrCL21s/RYX7zIflyoLuuIplSZDF9N1yEQLxzHBwQWzD2NVCY8iXtBjXzQ2ipqJ3YWKw1kjRCRYCbPXRj6qDCuf2TOvYJtTp2cEiMiMcFN5QklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWIcOffLfnbWuSx1VBGXNxl+v5tQnYLQCmLGqGw1/1M=;
 b=fgmQ3xzMUlcmUxggpC0483JJH10D5X0hfyYXmkAkrJwuvNIcUwz5T+Deo80C9Mt1qlDzgIxeP6wv4uY0buSdRzcdf0mgEHyADz0PW/7BVr+7Oo88ro8gw2aL4miuWSuXFE3Q6Udi54g6pXDYJa0vUIihnbDdM4em+gq/JgYzLLlEZ3lCXsFCxf5q0wxpkKwk6bslanvfhBOQ7xWukzgfe3JUTyhsFr/8fj3d0Lw8rVmFyS/t9TjZ3LJfjxhvGFz4802cS/z1r3HmVm/QytvQzWRNg/9/i4R1p9JV0zRkQ3EOxz8oZwUFLpajQ0Cts8Ri+DH1Rt1+2z4FUr9eZREdPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 16:22:16 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:22:15 +0000
Message-ID: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
Date: Fri, 23 May 2025 21:52:09 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
From: Yash Shinde <Yash.Shinde@windriver.com>
Subject: [RFC] rust: Upgrade 1.85.1->1.86.0
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH8PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::12) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|BL1PR11MB5270:EE_
X-MS-Office365-Filtering-Correlation-Id: 27108f96-9228-4131-84ea-08dd9a15fb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MzhpTFZBenhsRHRCOThZRjdJQitKRVVCeTR6bFdpelkxZ2ZFZDN4OVpXTWJo?=
 =?utf-8?B?ZGxwR2x2TCt5ZUVEK3JNczBuSnZMaUlYVFc5d016R3FMSmR2L0luOVM0a1RT?=
 =?utf-8?B?ZTVjMUF3SFBWZWlNdkpMYzlETEJqakJodkNyVFcyL3N4NUxvZURid2xMOGxa?=
 =?utf-8?B?M1RWOUVXZ2JGVk16THFLNkxBQzVQcm51SFlZZytRdHRyUWlkWTBVWE9YeFk4?=
 =?utf-8?B?YWgwUS9WeWlQempsdUNDbXZZamlLd2JQSXhDeFBEMjlsSHFTTW91cUdzZjNM?=
 =?utf-8?B?aTBNQXExVzBFekRYb0htRG5LemJndHg0eW1QM1poa2lpTG1Scjl5UUhBU2tn?=
 =?utf-8?B?c1lpYks2SVlVQWV3TGF2eVJNSGxId2NsekcyaDluQ3NzUHdRN3BsR1h5QnVz?=
 =?utf-8?B?c3JwTEhqd0xiSDhvUitJOTljYStlUWFlcjF6ZHFCU1Y3RStLcVN4dEtuT2Er?=
 =?utf-8?B?UGNxMnQzNFdyYzRXV0U0TWpWeWlHZk13SUV1VVJrYW1LQjZTQzZzdHBML2Er?=
 =?utf-8?B?VzJBQTN6QzEzbmRNVi9NRVBMWEY1VlJmV3czVmxGUk9kY0hGYnV5YmZNcmdz?=
 =?utf-8?B?ZDhCYzRCRXRyQUZBWU90TE96TjVqUnFGem1vQU11OVhEdGhpcnF1Y1BFVDl3?=
 =?utf-8?B?Nzh3blJYUXFsTjZKdzhFdGcyVFlXZlljQ3VpYWF4L3ZGQmY1YzlSays4a0xV?=
 =?utf-8?B?Um51a0tMd09kWnR6YzhVeW5zS2V2NDB5RmRYaWwrQlV5bDhZanI0ZGV2RjRm?=
 =?utf-8?B?OS9FcVpQZ1JRcmRUeGVicW9vRDdHMVNIdzJhM2Q1RTYxeGNiU1JYL1dVeUMz?=
 =?utf-8?B?bzl2SmRpaGFUYlVNcGtKMmxmendjODFaL2o4MFBsUCtiem1oQ1FZbHNBSlZR?=
 =?utf-8?B?eUhER3RiTURZdXR1OEJqOEVPUk1NUTMrZ3ltV0llV0J4Wk1nSXRRajJQWGs2?=
 =?utf-8?B?QlV3dkhNSDhUSU1vUy9SaWliaTNLdnl5Z2M3V0ZuUGp3Y25aNHN1eXE3bGYx?=
 =?utf-8?B?NVRXcXZjWmtqVTQ1dGhPVmZBaFZKZTRwYmdKZ2xocHlWY1plRUE2UjZuNmZO?=
 =?utf-8?B?YXAyUC9NdDFWMWc2UU9zdWtFMW8vOTVnMzJKOGg0a1NHU0tWUTdYUVJyRCtm?=
 =?utf-8?B?Zkd1bHRBVzMwQVlNMlE5QzZMSW51RVliUjR5bVA3Vzk5eFE1WktyQldWWDdL?=
 =?utf-8?B?T0VJRktHYnpLazczWFhsYUlUdEJCSEsvRXYrem1nZDhmWHc3OFF2TGtmRFdK?=
 =?utf-8?B?bTkzZ2QvNWg0YlZidGJ6WlZLRFFSYmwvZGNnYWJxaGZxQ3NsM2kxaXhwZ2ZT?=
 =?utf-8?B?bWlNTFRxNGgrd2dyQnBwVDZNd1c5cVIrZFltaUg1RGMzSi9UZkdCOE80VS9S?=
 =?utf-8?B?ejN1Y2FnSVBBc05TSTc0T2lZNjFPZUZLNmJzR1I0c1RNTkhoTUxkakRzd1JZ?=
 =?utf-8?B?L084UXlZcWtUVXR5bGxRb0gxQVMra3JQZkZVYnNiZTRXbVRTRUp2d0w5dGhX?=
 =?utf-8?B?aG85Vi83NWs5N1JjVWJJQlZzbXBUT0d5V2NOdnI1TEtQSXd4eGx3bWoxZjlF?=
 =?utf-8?B?Y25RaVF2U25ZOUZ4cTQ4dURHTWhiUU9nNXdEN0tVVm0yU1pvdTlRSVVJa0Nn?=
 =?utf-8?B?NHA4dFZpVnU2dzR2Ym13eTVydGU2T0Y3UVpCdHJMM2dwbzNtZ0RkdmdrYzY0?=
 =?utf-8?B?N2xqbEhMb3ZQaXNBMituSFk1M1dXYjNvT3FQS1BlZ25raVpnaGdNVEJCM2JQ?=
 =?utf-8?B?TEEyN04zWDJhbFE5eUE5aFRVV25qY1JBRFlRNm9GZlZjcGNiZEpnd2pyQS9v?=
 =?utf-8?B?blJTRlp5Sjd4UzJtSXE5S1RJNnJQd3pYQ1l4VEd5WEx6UGRVWFV3UXJuTGg1?=
 =?utf-8?Q?Sufx5cjyqxW9N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzU4YmNiejYyZ09qL1dyZ0NJMkZhUTZObExDN0U4RlMyd3FTL2preUxWWS9O?=
 =?utf-8?B?OEs4Zjd3WVdpNUJXVkNQcGNmNENGQzlIT20yV20vR3lLZGZNVW55di9idmp6?=
 =?utf-8?B?K2tEYUdSTGt1OUc2aWF4Zm4vdVpuUVpLcDF0ek9Ia2hwelNhNGpkcmhLRWlY?=
 =?utf-8?B?R3JlNm9tcnpmQncvM05CZ2RtN3BtWUp0aUE5Z1kxOHY5UC9FbWVtNmxydlRy?=
 =?utf-8?B?RWdzRGRWR0QvSkhEbVdnTk84VS94OUE3ZEhINWEzTDdmck4wVUZOeWwrWmtJ?=
 =?utf-8?B?T3N3azFMM1JaQk1FRGRDMU5wRXF1d1pTYldoUXd4ZGorVWhRcGJJV0k2UGkv?=
 =?utf-8?B?VllTbXUxOEFKNDg0ZFo5MGdFOUlJS1pRbzNzMjNscHZhT2YydThnV2hySjlv?=
 =?utf-8?B?eXl1L0dRcjEzT2x4L2hNT2tmYjhIUTZzQ2JSdHA5NXY1OHlyOHNLejg2dEE0?=
 =?utf-8?B?NmhMSFU0VEhGOEtEMk9EWWo1M3Z2MUs4aDdndlJsQVQ4ZlZjZUlYSnpqWkFQ?=
 =?utf-8?B?TVE2SnhZZEp2Q0pXaWhKa2g2YVNLZGZPcUIwaEtuQVc4VmRrYVMxSFpmNVVo?=
 =?utf-8?B?L01rRjcyMjBzbjhXYXR0YkRzMlFVem81Vzl2SnR4NjhUNlFWWEx2a1RocGlN?=
 =?utf-8?B?bG9RTitXdXBscmEwdXdNMnFkNXlVejZpR3NRWHhhdm4zSnV2c2R5aDdoZ0Fn?=
 =?utf-8?B?bG1kTHlPZEllSUNVUXpiNUxlUjYxMXNVTnpKc0ZGbi8venBIU3lNODhJNDBV?=
 =?utf-8?B?R2szMjBKNytsMmxjWHFVV2U1WjFKVDJPODNBdFB1MGRDVzZiTFB5YUpKQjgx?=
 =?utf-8?B?V3NoRGRncEdCSUxVQUdsYmZDakR2aUlTK1FmNjBoSy9CcVVDTkFBRjExT3lr?=
 =?utf-8?B?a05oakNwUW51aXE5V0hRSmR4OHV0MGE2SUlBNE9kNlZjWjA5MkFPdTJaMjFO?=
 =?utf-8?B?eVliVzg5TFVwK25iVm5sb3YvSHpPbmMwdkZkSm9tYkJ2Y3J0YytteGxPNjNM?=
 =?utf-8?B?Y3k2cnp4amoxRXBQN2dOVFppbVpGbmNteHY1VlM4bGtSVWtZcmNlY1gzMkNM?=
 =?utf-8?B?ZnZhV0R2cms2L21qZFg1c0VWRk4rNXR4cForeW9kdkpYVnlhcGM2dldNTzNO?=
 =?utf-8?B?N1hUMGp6OExGaUJvRXRSVEp3c1lLWnpKdXZFbzFQUFcyWUgreitDbEQvRlRm?=
 =?utf-8?B?cG5JMlFiR1UxQXJKKzNyZWZWeDNYVTJCcmJ0d0NMaFU5UU9lcWJGNEg3SDl5?=
 =?utf-8?B?VTk2cHYyamptdFppWlpXZXBCNkhhUjRKcXN6WUZZd0ZlRnd4UHVJc1dMa24x?=
 =?utf-8?B?SjJMUmErcE9XSlNJaDJ1OEEySlhITnJXNjlKS3UwVE5JdUJ3TTBlWGFRZ2w3?=
 =?utf-8?B?SUtGTUJLanVHY0FSck9PWis3N1hVTlFrOEM4QWxQL1MyNTN4dTJ0a0swaHEz?=
 =?utf-8?B?L0FhYzlUWks0OElvTkhBUE5qdEtxMkV2MmJRL2NsVExBYVMrZkxqSE8zMkQy?=
 =?utf-8?B?SnJqbHZkYVh3bFYrYXduTjd3a0tqbjlkRG1nQWZNY1U5bXJYa3AwOXk4SFhS?=
 =?utf-8?B?d2xreU4xelZrbnEwbVlyd3pYOFdReTZ4aWRWNDNGNjZTU2xzT0tNZGxTTGpW?=
 =?utf-8?B?M0FncXdYZnJwdkZFT2ZzVE9iYmxDSFUxNEtWNnpqYW5sb2YzVldwUlNYYmZj?=
 =?utf-8?B?a2FZRm5BamluNTZtNkZTVk4rUmhLajNPZ004T0xkSVcrOC8zZlJ1aldyZjFr?=
 =?utf-8?B?cDZYR0dLZ3V4KzJvUjlaRkRmdk1ETnpYUlFzc1UxOWRWK2Jnd2QvY3V3OUk1?=
 =?utf-8?B?WEJLOWNBbnhNYnA2NXhHUjBMVHpFMFdXL2hJajluNUYyNWpaVUFIalJZMFZm?=
 =?utf-8?B?aDF4b0FKMVI3bHkyQVVIV3hKeW1XRlJ5N2RhK293VDh4aUJVekNuY3A5QThr?=
 =?utf-8?B?ZGUzcWl2a0svOXBBazhIL0lVKy9GZXZEM0loUFIyb3MwYXRjOVMzRDl4K2x5?=
 =?utf-8?B?VEQreFBUWnYvTkZRb0pjVXhROUgzMUVxajZjMHB1RVlvanJKTFVzc1NRWHRa?=
 =?utf-8?B?NE1YOWJDb3h4OXVMeUtZUERNaVhOLzloUEdxYkNQcUtENWxWR3dBZkROYUtK?=
 =?utf-8?B?T3ZTaDdOM0lTVG9TMjIwdFhyTmxvS0lkTzlIanVpS21ObTBrbDBrdGhXNGkr?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27108f96-9228-4131-84ea-08dd9a15fb40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:22:15.9136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiqLXN7bc2pzm4QCJTv88TzfQjJHfTVC+3Lly78Tsgw+tqjZFN9gv/z2nZBzN9FiIF01Ug0sk69MSJT7404+mTcDvSYLaRFIe39jm49lecM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE0OCBTYWx0ZWRfX4zCg6wvc0ur/ 1+6r221ucubHaURsOmkTHw874jSOcPYWJemKQTk/2BPuUZisdBHNOHc2d7JgVoqLOXg141mef9o FodXEC2SQLDcNCiWe/tTWjun4J35/iPQRX57/8L2SLOlPVlbTPMUsi/p90GbbwYB9xPiD22viRR
 Xsqa25eHB15r8fcvx3Ikmte1Zflf8sv2DqOeqJNjLGhl4LiRtTzkisO9AL2xRsE2nDbj1AhrgZ+ 10q+87Cxi/EI9gmXAK2DKq3RpStx8LtB2eoj0WCxjI0oD63KLGBXDY3bPIkkDJxCaJygYAE09cY HDWKgynniqQkWTffEpc0uQZeLqpSmvAXHhHPjKfI0tbzPKlbyL0hs1HRj4d0vdBO6m5mzfc12pJ
 HXDX+UdoBqGzeOI92srm8LSJtVcvS5smg69wbXqz+5HXRwJq9wxSBHL7HDkAJul1ORfJowT+
X-Proofpoint-ORIG-GUID: -Y8h1oJxC91mPoI-sMO_dotD4ptL6m2n
X-Proofpoint-GUID: -Y8h1oJxC91mPoI-sMO_dotD4ptL6m2n
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=6830a0bb cx=c_pps a=n4RqILhGRq/0WckfvtHWag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=_kiWjHJPwZ91meqQ5g8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=497
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230148
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54NEjm4U017792
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 16:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217215

Hello everyone,

I am working on upgrading rust to v1.86.0 and this time there were a=20
bunch of
dependencies to be included and some errors as well.

A complete breakdown of the changes for this version upgrade is available
in the commit message of a branch pushed in poky-contrib.
https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust_v1.86.0
(I haven't tested with Ross's patches that remove python3-native and=20
file-native DEPENDS yet.)


do_package_qa: QA Issue: File=20
/usr/lib/rustlib/x86_64-poky-linux-gnu/bin/rust-lld
in package rust doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

One of the issues I encountered was the QA error mentioned above and=20
here's my analysis:
I attempted to address some package QA errors related to LDFLAGS by=20
using TARGET_CC_ARCH +=3D "${LDFLAGS}",
(Like done here:=20
https://git.yoctoproject.org/poky/commit/?id=3Dcc24a0ff76f2e227cc3a0f478d=
078b2158299a80
https://git.yoctoproject.org/poky/log/?qt=3Dgrep&q=3DGNU_HASH)
but unfortunately, this approach didn=E2=80=99t resolve the issue.(Is the=
re any=20
specific task/way to add it?)

Although including ldflags in INSANE_SKIP isn=E2=80=99t ideal, but that p=
roved=20
effective after trying other alternatives.

Please review the proposed upgrade changes.
I would appreciate any feedback or suggestions.


Regards,
Yash.


