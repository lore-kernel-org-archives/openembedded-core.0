Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1954EECAAD3
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 01:43:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.308.1662601389427717781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 18:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ExG4H8pY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6250d0c078=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2881XLmH026648
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Sep 2022 01:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=IpUmsR1B8hLgnDlHbLUrkKIadp8h7eT2depiUQfbApM=;
 b=ExG4H8pYbhR/iaLFYEBFpSfsxojt+nTYj/KPyWGu15jdD+Hr1TrXGDUA6KqPY/YUPT+0
 NDJOLY2VC6WO93GJoTL0A/EVujrM7u/yZeK1w/Bbi6bRmtKanHq1abVccZoTcjjYDIGa
 W/+S23o3JWgr8KQvIBQuOEQs0z/1D1J2gqs9caihih5CaTqEPBxy+LyzCpuQYBsfGAso
 fOwpxB+WEgupGh/2tE5CuJEMoSZCJm2sENlC9/DL6h7PITdLxBrpeA3I8lTYDG11Cxi0
 SoMXixa0OW0Uap1FJP4q3fvtydjL2mdJ/XE/+SDhctNahC9iP87U56YFrhjRfIJcYhYr KQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jegyv18d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 01:43:08 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2881h73d014428
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Sep 2022 01:43:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jegyv18d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 01:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnqiBn2OZ+KKn8199Pa7e1iMf9qmKeFAPyRQ9BrEqRI07jy8Q22SP+qgEcgmsRbzqlf+9AmKqXqxDapjDoAJ09Zn8UsHZ1biji/HoXGj40ShJRQoh6oUDADJpvkWKtPHqN8cY+V7sGYBO/evMODFvSGJDVWWBTzXF5BrkLqi5qPI74EPaEDxm1XbAiVZ01v89pV5mp0hnBoCjnxz3H96KPajT6WWUJTqzVhLp+M9EqHpO9pyfjVoOegp8a7VQ31MnE+u3k9das6GBfx+Rgi6LpeEfNPB7cNgaA+P69ep9gg+ztSlMVLA9xVFaiTKks1gY3lldlsBL0yXPhDAB6G9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpUmsR1B8hLgnDlHbLUrkKIadp8h7eT2depiUQfbApM=;
 b=J0QTvuofExYQ3IG16YbMNKhxQOxTG//0qLUgO2bxHJCemvmMZmFW+dKpW919VDrixIySXwaUBhMwuAJ5+zHM9LR6JEAFxJ+6SgeHedXdqjUDjjkRZ0bV5u+UgFVcGlpYppvVN6P1QmR0D3YP3VSylcUOhIaqBG3shabPtW286ZEWalmX/OwKl1lhoNqOwtt5mKaDEEzsgNOrJujN0qJSHG1f88g1KoHaFoFYyao3xV7b76mWsIjSeGWXqNRn5kny1HKdaR47ppfSAJOwboLpsUDngWz7vt6Xe2/d/uK/47kFHKjmZUeXK4rJcEsdCh5ipW20joCh8GkufgS3C00hnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM5PR11MB1643.namprd11.prod.outlook.com (2603:10b6:4:b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.16; Thu, 8 Sep 2022 01:43:05 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 01:43:05 +0000
Message-ID: <468d4b98-b086-c5db-281d-678c21522492@windriver.com>
Date: Thu, 8 Sep 2022 09:42:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] webkitgtk: Update to 2.6.37
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220903092100.3544874-1-raj.khem@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20220903092100.3544874-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0146.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::17) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DM5PR11MB1643:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d251c50-8ae1-4389-7ac4-08da913b796a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/wh2pYVbL1QTf62uxBKL1mBkZQ6K8ltdRH54akfThL29aox1IXGRE5UEHGzDigpRl+VOt/nSVMTanGgl0M7RuEwIFweTjT3diFs78dEvWdvla3v1rxt1hwMLUpNEHLMhvd270oInMBwfIPoyf0lX+7YemQhYGkoN3z5cADSySMQ88gn62Wu+jmaZDc3VyePb1Vytsj3Ezi5OAQbvOGLTT/+a8yWpjTpXx6joz064PXnKkrweOkjNXnUuPH3L15K1o7qQi8WZ8ZncXeV8GsFkSjMNHWtbtsQ3KNp0hysFaglpHzKK9umdUl6vQLzmVFENgbam9UxJ3SOk/MDreez1TBjzwkQiBOaO0SxaxoE7XOBecvI50meOq2RNNlzJPaFykQlYitLrkCmQ7E5iXHj4aLh75zLomUE8nhuKKcKhexHLYR9E9ee0PJWeFGIm8dWdlsiLgSYSFTjdAtwhSv707MVuPd5EU9+vcokxrdx4WTMdmFt2Iod6aXvj58xGwAiLOND9bz6dZXtdJLPjup+9F+zgrvq5D0xwyYw5HrL3TFf399LNKtOWL5mBL3mUfLmQUxguSEs6Yz7DuYB+nlQ2mhR49irv/KMpVums+uGsMZXutAVJH3Ouo73/liwRXSXsCzlUDnlrC/0UZRG+pAC/Tg3psHvn5Ogc56N59oLowHxaoGd2SFaQuJeS/yXF4IAOBmh4zxewgrbjHVZc7vb69qvuufGrngSaPZyHDXEqXJ9y3JlbpW20voVdg9ueTUhSCIB/TWkW0LTBreR2/UxuFf0qlZwOkTfrBrMnkwlO9zk9NgGBfHYveWPfR1weQRiyDNgXo3oSXqNa3XT6dyo06fMeB//DoSuAUKatazXggZE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(38100700002)(53546011)(83380400001)(36756003)(2906002)(31696002)(66946007)(66476007)(8676002)(66556008)(86362001)(316002)(15650500001)(8936002)(26005)(5660300002)(6506007)(6486002)(6666004)(6512007)(186003)(2616005)(41300700001)(478600001)(31686004)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YkNnUXZ0MTlncWVUSlJrTWRoQmh0SzZUdk5LQzQyM3haQnpWVnRucldyUzl6?=
 =?utf-8?B?QmNqcG1mVEhkY25RTXBaYnFsYitSZ0dMcWl5Z0dycUFucTZnYUR5cmRnL0pM?=
 =?utf-8?B?YVRzU2Z4eklnMTRUTmpCOXNtSGlOVGlybklDM04yYmRGZ3BMb0Z2cHN1Skwr?=
 =?utf-8?B?eWlJdVJDOG1PN1Zqa1cyUUp6Y3pPaEVaWFIvbEdlMy9PMUgrTTQ2U3ZleGpP?=
 =?utf-8?B?T2JEY3gyc29ObnVGTWFnTFJpRDliYnpRSjczYkFSZy9KM1FGb29FaWJYdFZt?=
 =?utf-8?B?M2RpbzhBWlJteitUUWhEUEE5Rk1xemxweUk1ODlMVUJqV1FCVUVpdE1hSHZT?=
 =?utf-8?B?Q25KeVBlNWdhbk5OSUxzbFFHMHhwbFlvM0NHOTAvVGRmNmxKZmNMejNUb2FO?=
 =?utf-8?B?ZkdtQjBRV29GZjdyUm5HVmkxbE9XTzZXQXFmci9RdUpzM2JZRmIxd3NVTGhn?=
 =?utf-8?B?VzVleVhJb1ZWT3c0UEFndGwyek40Qmo0SDJldTIrSXN5YTF4NUpVblFJSERE?=
 =?utf-8?B?b2x2OFRqdG05SnAyWnprQkRqbTFkL2JBNWZMbTl1Y0hyTjRQRXRsZlh1M3JZ?=
 =?utf-8?B?bUNzSzRmUWkxZCtRVkloUmJsVTVMRFBYeTNENjFOZkFlSUFjR25xVE51dUQ5?=
 =?utf-8?B?T21BZlJSUGVwSTZndkZCME9aL2pUVmVwUjJhRXd4Rm4zdXBJdWg2bnFRNjBq?=
 =?utf-8?B?RkdPY0drUnJhT2RjQXd5dDRKbWhZd0Y4SlphaCtGT1BucjhHMmFRT0VTbSty?=
 =?utf-8?B?d1FJSEVRZEk3WHc5RmpOSTBOZWRBNlVmd0dEVTRVQjFzd21WUTZEd0duZXJT?=
 =?utf-8?B?c2EwRkQzVFl6dVZBRFFOa1I3LzJ3K3VqZ1Q2bTV4aUkzSXF1MlZxbC9xMExm?=
 =?utf-8?B?Q2MraDFrZUFPeTN3VjExWmtxTW1pZUhQb2R4clU2MkViRlZ5YzcrL0Qzai9X?=
 =?utf-8?B?N0pWRzR1bHRKK3NveXkrcHpnRWtZM0xXRm1PemZWWUZyN3hRUEZCcHdidmVC?=
 =?utf-8?B?RmxzMDZtRlJGa3p3ZzN4dWtETkFZMGtaOEp0OVhEbU0ySUVpYmZGVWNEYldZ?=
 =?utf-8?B?QXZ1M0NEMWhQZk1ZajlWQWlSNStGWnVBZmpveXVuRVFoL2YyZ1gxeGwrMWFQ?=
 =?utf-8?B?ME5weFRKM2lvTG9hdllGdm0zdzhXNXhTMFVPWm9NUjJTWmpleHMrSWFrdXdq?=
 =?utf-8?B?aUxuMTZwd0QwTENxODYxaHJPVnhULzFwc1h4Ky9qWG5DME9HYjczd2NteHc0?=
 =?utf-8?B?eUJiM1l2VnVUc21ab1JaNGk0RzFpaExwbkVZYnJCSlIwRHZJMGJ2WGVqYVBn?=
 =?utf-8?B?QzhiMmZGOC9aNmh0cXUrekpjYTJOdTlrZUpIREh1cnVDVjE1Z1FieVhtb2lH?=
 =?utf-8?B?eGsxVGpMNzJvZkh0RlZyelhSdHZMakVuUmd3eC93VTJ2U3QvMWkzelNaRzFW?=
 =?utf-8?B?R3F1V3YxRXVXVnB2QWRUbGZWdGY1ZktDalVRWlpxQTdVZFhDVlZTZmJXalRR?=
 =?utf-8?B?Sys5ZWQ5K0MraERsMTJ1aUYybXBQa0I1U0hoa1JYZ1YrUVhINFJhbGdod2Zv?=
 =?utf-8?B?WWxFNnhuS3JEZ0hkZ3l1NnRqenNSTGM1N1NEL2JSV0FsaldSUlR3OWo5cVF3?=
 =?utf-8?B?Q0JwelJRQy9YeUh2Qm05NmJsSFVjTUlyY0FSWTlLQ3lHR01lUFlRMFBkUlVM?=
 =?utf-8?B?TmtNWnNtRnp4dWVDamFzb3huWm1XRy93bFNvUlY2YjgxVEl1MnhySFBpbXVF?=
 =?utf-8?B?bjRERjRsbmo3UVJoV3Z3VlU2VUMwUmZMMHZIQ0ljYW12eWM3ZHJMZVBTeFhS?=
 =?utf-8?B?M1lWdVBFSGdGRGVtUXlwV29FTDlJc3dUVUF2UnI5QnNZVkdQQWhRVTljNXVR?=
 =?utf-8?B?Sjh2Zmd3RExBMFFqV2NXdklaNmJDTVNjTHNiNzFqSDFFSTRQcDZkSXB2ODEy?=
 =?utf-8?B?Tmw2WGhYQlpXYXlrbHo1aytNQnlHMmgxd2xrNW9ZdVdQa0VBcU8zWGNjRzUx?=
 =?utf-8?B?UXhmckJobSt0WmVzUlVRSUdNWG56UHNxOEJqR2VxR0dGeXBDNi93WEp1MGJk?=
 =?utf-8?B?b1M4WnZWSGFpOFZrUUFQOUpnK0ZkUHpnaS9WTHcwR2RpcU5rMWRZT0xZYWJk?=
 =?utf-8?Q?tzjxfLwQPKlETQLKchlndhUvU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d251c50-8ae1-4389-7ac4-08da913b796a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 01:43:05.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 K8qxhSMdG97FyUZn7Cj3P1EQ2YM9f+QLEutC3R9VvdiB4MsAd2iHM49MSilHc1LQyoSEBGPVWuPsiMj6mNiUlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1643
X-Proofpoint-ORIG-GUID: SgX9HQtaS3E20lwWR2oZSb4kSqzR5t01
X-Proofpoint-GUID: UjXAIlyCYdIwr4teu6B345gDRR56dqDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 01:43:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170436


Fail to build on beaglebone-yocto.

/build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
ebCore/platform/graphics/filters/FELighting.h:72:41: error: 
'LightingData' does not name a type
    72 |     inline void platformApplyNeon(const LightingData&, const 
LightSource::PaintingData&);
       |                                         ^~~~~~~~~~~~

Thanks,

On 9/3/22 17:21, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb}        | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta/recipes-sato/webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb} (98%)
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> similarity index 98%
> rename from meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> index 37b977f9ba..026e24ae39 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> @@ -16,8 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>              file://reproducibility.patch \
>              file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
>              "
> -
> -SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
> +SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
> 
>   inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
> 
> --
> 2.37.3
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170267): https://lists.openembedded.org/g/openembedded-core/message/170267
> Mute This Topic: https://lists.openembedded.org/mt/93436476/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

