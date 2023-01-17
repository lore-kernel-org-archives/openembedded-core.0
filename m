Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7A2C54EBE
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 00:22:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.184549.1673914957231380684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 16:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U7DwCD3/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03811a1422=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H09R1B002428
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:22:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xMYVo+d8fbp5FjI3V2vpa3MePj+uMDozVK+FwN4chPY=;
 b=U7DwCD3//w4eGY7FE7/eGoGhKuoMYxSLFZOx1JGAiwS3eR2MUHta7GgezUum0GPqqAcW
 OG/D0evcWjIwBk1k8UAaajAOXIsIgi4286CLXTzxkXFkhaLxqSiF+oYtM9BYuJ0SnBGA
 SBRHRFmfPSmg2/sD3U1pIpXPk1+Vaar9Bxs1t2qNgOvoKl/IXpOxbQC0uuhq7u9Zofqf
 irWRT94SHXhdEOM8L2VAbfPn/ox4UPDlMgyYD5wEegSuIquP5jp8lIcgRvAXKzBgxLAa
 Ex7oCfkuKOUt8FLvE3+bqC83S/Jqu7SUGmtMYAnIXnCnEjli9XM/Ue/nvavKDFv4gkgT OQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6t8g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:22:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eoq0rd/qg4t059CaJP1/66t6qJtP6l400xTVS7oecT3a6FO7k14dGr4GIslKF757pY5gvgr3m95FnwmuAfJ65kmuVvwWxSmtNg8zukvDf/XTlVqXsFGdDrI+dw4UUaUQwfZ2Oj9Yowztdmgh66xlJcVgKsqJG+QCvjVZgZpat74kn0aBSMRctq0DCZT8CjItqoz4pFbdCal1N06qBtdL0d5quRdsoSKmK7dFyXWhpshQNkp3JsqtiAqkshpv5RuAkD9k7IHR4QKR5bQh6YX4FZr0tQnEnrmtwFGT7nilPBctnCLy1QrK/DpU4NVR3sVsk2HCMF+9399/0sf8EEVCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMYVo+d8fbp5FjI3V2vpa3MePj+uMDozVK+FwN4chPY=;
 b=G4vksMFIeXRxXBRiJDgrTuJPPhKA7eaBr5io+oWppNBQ3B8ueCwhHkr/uW1cmXDRrJyazbxq77PlwzCBkVqbUNcEtOmDf4sdQQ/tl3afqiFYTQUluofFHi4R7sLZljn/m0X4sJTp6R8BmnCFTGZtIghZkGcxTwhHJdBIhWutnp+mpcDhveuC+XaQ3M7aF2xBwMkbA+gCjyeHPQfGf+rpQ9sH4yW5+u+XQkpMA2YiHNYoh41/AgC76qIC6yuStDyLOP9uC0bkl1H0ecyPP4taTTd4XpYNPQe5hEZEla7tZkUxuubUIpKzI0CI+MJSjJfiSaSZ1DsTs5IU0a8mtBK4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 00:22:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 00:22:34 +0000
Message-ID: <9ff8d23a-d44b-2480-ca3d-dfd5d057436d@windriver.com>
Date: Mon, 16 Jan 2023 19:22:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH v2] rust: Merge all rustc-source patches into
 rust-source.inc
Content-Language: en-CA
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
References: <CAO5Uq5StMcTxU9PvxDFNDW+s4Z8vAFbMaZyV8t2+8OakP_1ewA@mail.gmail.com>
 <17490.1673871441359314099@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <17490.1673871441359314099@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH0PR11MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 60822303-c6a9-4a4b-5489-08daf820edaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jUUPW1uajJB/FAvULvKMI499NZp4DoMZuyXUmA0d0qBkfPW+JV4Lk+rLzZlXPF1B0VKfMMCUuFZLfSivL6VdkOpiu/Kn7wgz1YhiFW8xVqazsI+EuhNQcorERnPK1kWECJIpni7Xei2sXoHR8K9K6dwc4MTPfm9I+ui7LnJbk5XlPLZuwl7EhL1F4kzJZoq4WTj/tuOpAHm9UItU2mQoyqX4aWUxL8kOAxabQnoEctG0c/J9PodIS4XUEL8aU5oDxuKSoIu6h++NV7rfWL9bFLf/EMjgLpY3MKEjzoryOzPB5WPkhFmE0nsqqQyvDwcmFbPmWaUSmktVzK67XOzQWuwFSHu4Yx7g3v0cykPNdB9Z2d8rru0nAvb/+BzEBTlvIGX0izrez5VqdTRQdc+Eyfg5ajXxfqA4kxLTDJoDJum/yCvkRcXVaf89W8QjaSw14yLshCiQ0LL4gX1j82eOLON85B3qCs2boYDtv8Nr6G9E57+x+tNdl42vZtS6Aiq6Q6RSMyxEHmAgFo8UPf+QSWTVwfThWzhi7m8xJZEvxUljkLbxzVNDUzSs1MipSry4vBiQN5jcPxST+LoML7DsTaEDQD0VgLjrfvHxt3O98XOmPa4IM9LIc0zh36EY2+IEs16aw0ZNVbg9YG06X7hRPKDgMQpWSYBFaApeI0PKVmQ0vYCvO6BY1FA8f6n/hc3xKcBUxbvsjnjqN/GFO3hNKpyTggNL3HTXhKo/ZJ9y3VN1QFYfl4HFJmN306woV9rq0o+HgBrMLRwD//blJzSf4OWJ8bCGpUhosib6Q/UTThZfVR35elNLGNcAhT+4Z8zn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(39850400004)(136003)(376002)(451199015)(38100700002)(36756003)(31696002)(86362001)(6486002)(966005)(66556008)(66946007)(26005)(66476007)(8676002)(6512007)(186003)(478600001)(31686004)(2616005)(53546011)(83380400001)(316002)(6506007)(8936002)(66899015)(41300700001)(6666004)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1duTENkcm1CZkV6VXB6dmVKaTg5Mi9EQU5zaDljN05nYk1NckgxMWc3dkcx?=
 =?utf-8?B?S3pMYkl1eFNmd3FDcXhPZFNNRGgwMWNsK0JVK2IwM1FQSU80Y01nTnQrdVd3?=
 =?utf-8?B?b3gzdjVGeit2SE9NRzBxTHd1NEpZNXByQ1pUQWh5QXVvbkZoSE5xYkJmeUZX?=
 =?utf-8?B?Tk5zc2EvajM4aDZ1ZVVTUzV2bFZJNGNveHd5a2ZIRjBoWXg4NjRNeGh4bU5s?=
 =?utf-8?B?TDNjT2dodUVOdGUrZFdTWW5zSDJWdGduemtYdHhHblIxb3FoM0h3THJQbkli?=
 =?utf-8?B?aUVmcW9mYndYdWhLcFQ2aWhOMXl4R1YzcXpRMHZ6WXhORTFBUWlOUCtxTC9k?=
 =?utf-8?B?dU0rM0UwckRoVGJ2Rk50K0pMM2pCSEoyR0lQTUNoUGwvam5KbUp0R2JHZ1ND?=
 =?utf-8?B?R3FHQVY2V3huLzk1ZG9HY3IwNU5RZWRiNlQ2aVIybFFpR1FYMFB5ejVIOG9a?=
 =?utf-8?B?aXNIbEsvZE9OZXFwSFRtT3pwK2dBdmlEbHBRZDFnOWEwT2Z3UDNrZFRMZWdS?=
 =?utf-8?B?bFFIZ1MrNDJ0cFAxU2xnMHozVFpkZDkrM0UyME80eVFSK2tIeW9zaUxwanhU?=
 =?utf-8?B?c1FrN0xPdUpiUmJWaVNjbTJ0QkNhNWZ4ZU9ZbTdrQlgyWjEzbERoaWc3RW16?=
 =?utf-8?B?QU14Q2ttMUVHYThKQU15U3dGTDUwNTgxU0FrU2lKQWZqMWhzdjVtSWhiVFM2?=
 =?utf-8?B?WFlxWkJLM2RzbXBQZjRHZ29OSDFqTnBsNkRrK2hGN3NXZDZ2OWM3NFJON0lW?=
 =?utf-8?B?S2N6WFdBaDhaRWg2WXJSZjJpUG1QUDRCT09yYVRFSEFmdnRXTmFtM2ZsWjBJ?=
 =?utf-8?B?ZGVMS2NhYU5INDJTd3grc0JUR3FvRzU4Vjg1V1ViM0djVWR1bFJwWHI3ckxS?=
 =?utf-8?B?Q3N3eHQ3NmhQV0Z3N0lSRWl4STk5T2NZN05XOE1BZEFQcFNQS0dRUWFmRVp4?=
 =?utf-8?B?R1hvMFBzWG5YR3VHQTR4UHBXL2JtcExiWVI2UU5pVEVsZ3Jsc0NXQmd2WlpY?=
 =?utf-8?B?NDZVZXpOOGV1R3ZxR1kvU1ExcFhWdndZVGMxTTBxTk5tclRZOTgwVDIrUVRF?=
 =?utf-8?B?cE04NnFBamxXaVUxcDNWSUlzaEVkbWtrZTd5cWxZQkUwUjNpMkRVcXp2NFhq?=
 =?utf-8?B?SXVYY2ZnNnp2WGhGb3RaMExTWlNnenM1em1xT0VBYnpWbkpFUk96RlNna0gz?=
 =?utf-8?B?MGZGdWFtRnJqb0loSm0yOXNQeEROczlSa2EybVVKZ0RlU0I2TU1LUks5VlN5?=
 =?utf-8?B?amw2OWNxWk1LNkJYV3BmcXZzbUtsWlA2aDFPcGFOSVNJSjZpWWg0YmkxK3ZQ?=
 =?utf-8?B?d003SVJwUjVtekluSWRyZERhSHdiSng5MGlCbVlmY1pUL2dlOXVZVkpySW0x?=
 =?utf-8?B?Ti9xbVhTd0JBTnhQYWF4czY3RXhTOGRKY1ROdmNNbmJZNDFlYjBETzhuc2pK?=
 =?utf-8?B?T2xHZW04WlpYOE5nQlR4dXh6V1dCV1VTTjBWK0NwM2hzejQrNTZCQ2VDNGVn?=
 =?utf-8?B?d291VU52LzN5ZzBYaTRNeDYzVTMrRGFwRTlnRGJUa2E5Q0JiL2ovQWQycGtr?=
 =?utf-8?B?Q3AzSWhCYkNwYjFmLzJhcGZhbHhkRDdWdWs2bENLVTQxcXRaQ3NGUjF5TzY5?=
 =?utf-8?B?cWNGMUxPblVRVVN3NC9lTjBqRnNQSXg5Y21tdlcyWDF6bW5WTWxmbXNDOHNN?=
 =?utf-8?B?NVFINnA0VnQvb0JlakNTSUV6UEFoUDlOTlNYZE1iZzlZN1NuOHFNUU5VbDBK?=
 =?utf-8?B?UEVWZ1dtSnRRSWVZenkrdzJRd3l3QlBFb21YMnoxb04vb0tkZm55c2ZySnE2?=
 =?utf-8?B?b2xwZWJXUjFOU1hkcVM2NEJVN3hlMm1MdVhaYjdZcDF2d1UxN2FiTW5rZEpj?=
 =?utf-8?B?dTliNVpqbTlGMzhMMERSdk02d1ptWkdhdWNRRC9rVUlsUldyaGpDbHNwRzFN?=
 =?utf-8?B?dTlmZWIzTzlYSlRXUmVtcGtLSUlaOFNBTHdtc3lZN1BjK2NtcHNrNnlDN0hC?=
 =?utf-8?B?MHB0TkFQS3p0NUdBMTVSWGppelNXeVhVb0J6b290Uk9LZHM5MVV6Y3AzNUxH?=
 =?utf-8?B?aDliVFVJcU1MZTV5TmR3STVqWGsrSWg3WWh2ak1CZUp2Yy9oN0FtYldkTy94?=
 =?utf-8?B?MzhHb2YzaVpEV0NTbFd4SWE3K2VqWHI1Rnd3STE1dlNwYmJmR2tQWWZvRWU1?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60822303-c6a9-4a4b-5489-08daf820edaa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 00:22:33.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pCGLxU1EPXbD73ifrEMw0dKfV+7JQUJkaNFdhZ6+Wy+MIChXwsLDWee19uDUulnQ+QkdNx4zHvcAe8sDK4DN8WR0tcYkUlMMgS7dPX3YgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
X-Proofpoint-GUID: lQi2tODq1JIPf68oLrZR0zd6qVE2miGN
X-Proofpoint-ORIG-GUID: lQi2tODq1JIPf68oLrZR0zd6qVE2miGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_18,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=912 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 00:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176016

On 2023-01-16 07:17, Kokkonda, Sundeep via lists.openembedded.org wrote:
> Adding 'IMAGE_INSTALL:append = " packagegroup-core-buildessential" ' 

Please make the target build of rust (cargo?) depend on just the parts need
packagegroup-core-buildessential, i.e. you don't need autoconf, make, 
pkgconfig
and likely more from the packagegroup shown below.

I'd assume that it's rust that need the linker rather than cargo, right?

../Randy

cat `fd packagegroup-core-buildessential`
#
# Copyright (C) 2007 OpenedHand Ltd.
# Copyright (C) 2012 Red Hat, Inc.
#

SUMMARY = "Essential build dependencies"

# libstdc++ gets debian renamed
PACKAGE_ARCH = "${TUNE_PKGARCH}"

inherit packagegroup

RDEPENDS:packagegroup-core-buildessential = "\
     autoconf \
     automake \
     binutils \
     binutils-symlinks \
     cpp \
     cpp-symlinks \
     gcc \
     gcc-symlinks \
     g++ \
     g++-symlinks \
     gettext \
     make \
     libstdc++ \
     libstdc++-dev \
     libtool \
     pkgconfig \
     "


> fixed this linker issue.
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175980): https://lists.openembedded.org/g/openembedded-core/message/175980
> Mute This Topic: https://lists.openembedded.org/mt/96110740/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
# Randy MacLeod
# Wind River Linux


