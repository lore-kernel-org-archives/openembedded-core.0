Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF3FC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 09:20:58 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.61])
 by mx.groups.io with SMTP id smtpd.web10.8924.1676884850757150522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 01:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=K+xrTUNB;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.61, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mihd99/G+dG72y6arAk1W9VvjLZ9oEQx8YWfvyMXOOzoDm2NlyDUHipditb+uNAK7LhlJL1nFEMJ3MfC1u+w5ZXTjDY8lCOQqd4I0zGC/rxjj2DugagntCkgKPtbSVncGQz7m7RHBw6Pyr66bqXDVaJKuy24OaEfHrZzvAHzBOo2b+HBhNUvc4YEs22VKfFihYe4IDuD3XL20kSvVOF0lfQOhM0DW1brVz2dcA5BYUZU4/4k1dJy5dCXy9kw9iakFhc4iW1q97tAfFLGApz7qqCLPhMkzbEGLivEWkzCzpcwybXyzqbLFFjh85eghQ6DAHXX+QAh47W8iAJp/wVzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTTL0+K3k6Watej/hphEslSiWGtyMPY7tJWvqHr992c=;
 b=bqLfL+9twqljo0Bs3SLK0iKAoXy+tKAVml2GIt/rbOiZxP0CLiYuFYe3x5TYFgT0i7U8+F4L7KBHe9dO+JitWLurjIid+rsHPchANhh08qRpOifG3fw/SRtVHYFwqGIGu2RPlW6vMCyQpJQzu/xIwMFvRGGvVLz7dLhKiJLO+Hxr34Letcg/4IzZsNm+2da1G9kv8f0q80mHp9A5Bl45feNgtCidACmIu5/E4bA+oUL3DXmTHe6Z9QrJh1JA2r1wSMi1uy3IYiKH/ZRapAEKwENIkm5DnGtPhCyiRAEDAO2rw/+wfF7ZLyaXpawJMIUpbViZz+MWfNfXCjVLXkV1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTTL0+K3k6Watej/hphEslSiWGtyMPY7tJWvqHr992c=;
 b=K+xrTUNBiesvVVRyr/ukOv0vyGPHuHfLYPSQMXPbv+Qm+wTclsKkiCzodq88cc6ZEH04+nD+n++ym9E6g+NBNvDuWxcC7rBRDSKchtGcgO6rXXg3sbNmSapXsi3Un1dQkdB6+8psPqjzUEJTDX3Fj/8TDIR9C8kGAy2SpELVxbefBUs+79GFnbXtsdubtmw31q+8LAvTLRrsODs6C+VaxTB52BPsmIH/Nd1bBswCio5JyNiwX3gTVptk7n8pUOrqAZYa9+/7Yp5fKvnR+sQfC4zxeLUHWpCRcWx679Xgu7Lu7rU3ZNPu5a0n76s9tY9lkC/GcHDK3OGaDXPZWqq1FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7977.eurprd04.prod.outlook.com (2603:10a6:10:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Mon, 20 Feb
 2023 09:20:47 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%7]) with mapi id 15.20.6111.020; Mon, 20 Feb 2023
 09:20:47 +0000
Message-ID: <8b58d703-93d4-11f8-4d0e-d6b922e995d4@theobroma-systems.com>
Date: Mon, 20 Feb 2023 10:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] ref-manual: Fix invalid feature name
Content-Language: en-US
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <20230219143133.66511-1-niko.mauno@vaisala.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230219143133.66511-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 962ed1dc-ef6d-40b0-c16b-08db1323c019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	umuz7Q+5XKCKVsCiiu62pknsBwppmQWQXR5uGWvJTBN1ZdptylqxvNhlKnBem/NY+1s/znNA1ptEpB0LRPoa73kOiu9AmLmUcPmDBoh3/JFDU4dWmD/1xAZRymOzsVQv+zw+Nq9obUt2cGBC6lsnKvXP8O1egZBynszlr7wAi+QdTWW3IrvVFJGD+rKDzIpcQ6Ptyy0mFfc986cFsJx12Cr6SwMVP7iG5s3E5rjChg8R9X8+/w6o7J/CY8aLG37dTyMPKehlslQ80zcmo4Cl8UZwuyYtrYE1jpe3lj8vw7iaThKyF7KihGIivFeSpCIUMIlkLDnWqh+1FRbc2f5nTevUwa2WD4jr5g4gzMmoMGEsWU97NHWOsbhpCGPo4ZjX85cYjYUg07ogZGdicRq8iAOlxHdtXuHYDZJJZJqsLUwMt3zof2QwbRR+l1kZQOK5yY1w2f2U4gK+NLrS+72/erzIUbwXlGk57NH2+5k0pw859Y1sWDf4VgQwx3PN3V60Q8NiwbYkb4lP4UhdKIKYuSgU45ZTXDJTULvydGngy95G5ByJx2XAz5wSqLj8iT+jdV2tDfK6FMNxxuDAFg6Ua5I1zPVV11jvndi54F9DLuZl2vLkzOIQ3VrZl5InqrvGTML9Udtht5hu6TU11QkhKll6i6lpZwuO8nZB/BxWVvw4vwOnSahk05l/MAGQx9KWnbpChNywYjBF0Nk6O/1xbirF9pAa9pl7Iqhc587iNr8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39850400004)(366004)(451199018)(8936002)(4744005)(44832011)(41300700001)(36756003)(5660300002)(2906002)(6916009)(31686004)(86362001)(6486002)(38100700002)(8676002)(66946007)(31696002)(186003)(26005)(6506007)(66556008)(316002)(478600001)(53546011)(2616005)(6512007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2ZhMnYyUVM4TXUrWFQrbnpPNnpPTjJJM0RnQnBRUHhOMmp2R2l6cVBVQXZG?=
 =?utf-8?B?NXRSOHFic1FzVFJCc0RVM3IrNDhwRGliNWFBUmhKd1FJbjZhVm5KdHdRaEFU?=
 =?utf-8?B?MXJlR3Ztdnp5Q0NjRXpiM3NHZnVRLzc3NHBwbFB2ckxXTUZhRjBvVXJPZ2JS?=
 =?utf-8?B?QlRtdzAzODUyUDhaTkQ3b09OMzYrVjdVcS9JaUwyWW9WK040Q01xVk13eEZ1?=
 =?utf-8?B?OHNJNjE2Z0JPQWtMbnRQbVRYd1dCQU9SaUd4ZXNhaTVSRmRBWkJ2ZmVrQnZJ?=
 =?utf-8?B?c2VLaWVMeHhWT0lWeGl0c091Z3h1NWFaQ1ZJY0dOczFpcXo1OTJoS0V0UndC?=
 =?utf-8?B?Uk9mL1Ntdk5IMTFCaWNRaEVnbndFZ0F0YnZ0QnRBWlNUTy9ZZ1dVRjYwNVg5?=
 =?utf-8?B?SFQ2UWI3dDE0TlFuUmxZbDA1dEJUMkFZZ0VRRkVaMDUxa00zVndDdDdkWm9o?=
 =?utf-8?B?bjhIMmNpbEpwQW42UnBtdGRiNEE1TTA3Q1dkUi81dlEreHRwS2YxUUF1cVNw?=
 =?utf-8?B?bkEvSGxLTDQ2L01FZHdleWt4NklnRXRTYzVoTEJQZ0QybzVPV3FFOVlDT004?=
 =?utf-8?B?aW5DU2k3d2dGVDdIdVp6RkhOSXhCVmg2cGRuayt0NVRpNkY3SnAwbXl1cnM1?=
 =?utf-8?B?MC9mYkxaR3lxNEhjSCtGVWl6MHE0TW1qaGxJZHFHalRiRkY0bzdJbFhqUHRB?=
 =?utf-8?B?NlQyeXBMaU5STklpMHNWZFpvYkVpWU9WSnB5RG1CNnNnYWdPTlh3TC9oWlls?=
 =?utf-8?B?Wm85Tk05QjFrVTRGRjcwcURsOHUrQy9LSUM3ZDNjUmhvQW1sQUdOV2NKWUdi?=
 =?utf-8?B?aWxMY0VFY0JkUWVpRlFSZE5sTm1rTDZpYzVWOTBLN0xRSjVKWXFmWGJURFJW?=
 =?utf-8?B?VVEyLzhhbWtXUU1pUjArNnNVOU9MZUJMWGhVWVJZU0xGakpaTVJMcWlqUHZL?=
 =?utf-8?B?VExYSmdqaGZKUzZ3Zy91aTBlQWZKY1FOL0QvMEFNVkhxZm5CR2s4MGhBL3JI?=
 =?utf-8?B?aUpuaVp4c1p1ekRQK0FNSWErdjB6TUhseDVTWU1uKzMrSC9ZMS9OeHhmek1n?=
 =?utf-8?B?TTFuS044ZzRyUkRzK0NiTkowSExSUGh4V3YvTTBYMktYZ0R6SHAwbzRmK0lV?=
 =?utf-8?B?RnRWeDRzT3lsS0NSR2VJUkloZ2kzTEpsYnBha0Z6RjBEajRmZ2wwSEhPZHU3?=
 =?utf-8?B?aWJEZTFRbTA4ZGcwR09EUm1SdUZRcHNjSTB4U3RxVmx2UUNFdm5qbmFnb0Y5?=
 =?utf-8?B?ZW9WU2dXN1BRYnAyMnVSaUdES2VraEZyajZmRWpJN1dFMUE2M25DbWJhN0RP?=
 =?utf-8?B?RGFwdGNsQnFwZmR4U0crYktRcmFDSE5wdE1Ec0x0MlJYQkFDRXB0eVBrVjZK?=
 =?utf-8?B?SnJ2YXJ6L2FVeVQ5K0wxOGxMR3lEb0NRMzFlUE5lbzI3VklodG50UkRQV2hn?=
 =?utf-8?B?Q3ZURnpvKytoaDJ0TkdCMDZBSXFON1FzVkxrNlNRc2hNcmY3Yk8wLzBxUnFY?=
 =?utf-8?B?RHdrZVpJaFZyZVZUMEtrWloxRDZoY1VtZ0V0RHFacXpaSEM3eWwwT1ZRNHhO?=
 =?utf-8?B?ZXR0bVBGNCtyVndFTEIvMWQ5V2xGRVUvZkRINjlSazA3QmRYL1NTTUdsZ1ZH?=
 =?utf-8?B?OHUrald1dTdPTFI3SFFFaGVSbjVnd3ZXTUxKVDZLWjM4RHkrekhyZTBOKzdF?=
 =?utf-8?B?dXhsWkdHdytGY3JGbGs5QWNab0hySzhHUVJvbitqU09wcmFCUm5BR2txYzV0?=
 =?utf-8?B?Z1lFbjVicDNuM0N3VTdWRGtscjRJWjlkVlJ2T1VQM0g4UWF3dnYxODBCQVll?=
 =?utf-8?B?bEFwM0ZuR0MyMlFoTWVtUGNLLzF5NjZKaWlsemNJNnhEdnRoOWRGbFBmVDBm?=
 =?utf-8?B?R2JYQkpkNWdRM0UzcjVudXR3QjhVUTlKNEhobnduUTU5UGhJQnZucW8xNGQ2?=
 =?utf-8?B?YVlCaDEyUWVNaWZRTVNSMHoza3NvMTJudHdyYmJJN0d4THdPbWZsSFpCL0pV?=
 =?utf-8?B?Y1hla3JvVDA2ZUY4YlpiSnBGQlBCS3hkc3Z4SThoQjlhb21SN1RDUDBnZTY3?=
 =?utf-8?B?Z25rN29sb2Q0VnlyM25YUSszak9aYTlwU3BmQzZOdnZSRDdKQVpUbkpPOUJR?=
 =?utf-8?B?ckZUZlFjckhXeG9KZmJURVE0WDdITjlyS1pIQjBydEpnQ0Zja2RWRnlnV2cr?=
 =?utf-8?Q?pnqWayDcM0RFqvKTOK3cXBs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962ed1dc-ef6d-40b0-c16b-08db1323c019
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 09:20:47.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnBfaEjHFwyzExf//A2POW8cf5rmO2vdpjnjq1CSw8qG2HvD29yBlHCzjSZGkUkgGZJHKqKoTkSs1L6+vsjfqoLolBoMksuPw3wfcT7giSaLfWX8450+QjFVv0S6vUPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7977
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 09:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177398

Hi Niko,

This should be sent to the docs mailing list instead 
(docs@lists.yoctoproject.org). Cc'ing now.

On 2/19/23 15:31, Niko Mauno via lists.openembedded.org wrote:
> Replace the invalid feature name with correct one which helps to avoid
> following bitbake error
> 
>    ERROR: Nothing PROVIDES 'core-image-minimal'
>    core-image-minimal was skipped: 'empty-root-passwd' in IMAGE_FEATURES (added via EXTRA_IMAGE_FEATURES) is not a valid image feature.
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

@Michael, this typo seems to have landed in langdale too so probably a 
candidate for backport.

Cheers,
Quentin

