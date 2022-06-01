Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC68C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 03:52:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3477.1654055555605620827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 20:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=IMwkfkki;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3151ea4108=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2513puN6022459
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Jun 2022 03:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KJLkc+bIjcbGjC/2SGpCGMV0/Ap93mTNYLmVsWqz61g=;
 b=IMwkfkkiOKflVptFs3VNClFqn8hNUqGFPCzEpcWsnSstSpXHWD4HHI6ClqM/a1NceGGW
 4N8Qx/6jwTOyFH6DmYptaSWkQ9l4/ZjiNmxVxnEuT3iJ8NHNpjgIB3pDbZWR4ylowmIw
 Wsr/v8qzCf10wJw/KKz6sZKfdLN18w9f7cYp/cM67l+MsbcGl4c9mVC0lYu+uxuJ0rd/
 KoIDA0KEbROou7ezCRkoA6CysTrRxhX3KZjEiZqMtkVe1o14XCMzrx9lIjLt9XmRSQEx
 3dzF09rqpX8JBHqDKjnYNO1h1d4MpOID1KW+I6GklnwQsWb0JGSSuQ+dlsB77gDNdqsA /Q==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbbxkamaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:52:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcP80aYMXjKsX/Ry4mK0Mg/38yLBaXxoOrCzMwfgz9venhzALE1OYFak4gKAyTzGU+ZFsd87++QNjEhuhBzckBPWt0P8vWofsUeYSPulnGfV6CCzLdsN4FQqWdsRxD6/xmkUlq7e45BQ1LERqwLgx/mWx2tl9SCNjgEJ5rIMWzl4ExioP389ag7jDyKvYvSuGNUp7pBdB5MDIkubf5FVg92ijZLxeNsy2KH0xSjrn2LZFXrIzCYTUA0gF2sRB0shtiOWK3WUYrzlKk3E5Nd+t0J0AXatHg2HHukBZNipNaPq2eI3JtJ09ytCZOLD1fgsa0JNvpeeVcCyFG4TZR5vNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJLkc+bIjcbGjC/2SGpCGMV0/Ap93mTNYLmVsWqz61g=;
 b=jB8JyK5unGkmQ4Md89deFxWUu52UrAJIqJnJ0oAVSHLbS/z76yFMi+N4F4GVFwBJV9zExJTTUlqX0WJyCEFFV7kw7O35fDo8tNUJnWdn1SBZWniJsmOiAcoB1q74KAp07IKamt9F36w4S+042fYWNterWAx+WFShIfpNoV7xSxLETBKqmoxhT9xC7XuR8hx58cZNmKG+50WlNAPvshzCcersizno/AfWSbfpn67KMZWeMzgIf7GLMOx6YG9RoJdYo7quUwHgwjinRqKf8q8LJ4p/SbtVvjJOmPOf8gZHn2mPTzoFe/FMkbc3oa/0fBTtKBimqrLGgTAOW+6vQ8Qo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.19; Wed, 1 Jun 2022 03:52:32 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 03:52:32 +0000
Message-ID: <d680d620-a906-0f53-80e2-7a446b670742@windriver.com>
Date: Tue, 31 May 2022 23:52:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 2/4] qemu: fix CVE-2021-3750
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220531220807.8032-1-sakib.sajal@windriver.com>
 <16F44FFA6E0E788F.31706@lists.openembedded.org>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <16F44FFA6E0E788F.31706@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::22) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ffa5dc1-76b8-4530-35a1-08da438227ea
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6131:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ1PR11MB6131B955438B28854DB5ECC6F2DF9@SJ1PR11MB6131.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QVl7xZ66api8o7FMX8VP07qhUuzz4R1TD1C05fuuDZeB2L/mRSLnNdaZu5GAm+pkskcxzliaMRmCfpuXuBNV1dUW6+7Ic3ZNZbaTOUxisQmIlO2WzgELvc2PcbuFyBumLIQ6y3qoxQUCkU+Y8TstpaLJWDd89jvlNiFceSSfASlWFqyEiRhp4HgPS65bFFvZEADqJ28Hw7DW7eECwH9ozHsCSGtywVakeSRpSuUnJIhylmX9weGS33/yPGV0kAqTwXFIOivSZ1cuxvnC881vCgQWdYi/QBPV5AvS19RB+HCUrNEmekoDsSA6FQ9rstsCgu5spsRqCNYzDomlIij6WR9sXRpP1VaaOcwAzGbFztXjwO9FQf6g7jAN2ZUnqxyeVXIb7WEvkuuggDw4Ih7ixQOJIfbbk+hLoJGmn8XSRM3YDMop66Aubt/lCgWuuVuEkiBWelRnA2DnymqxhdV8HZRCVr4TEMzm0IAK9fU1Izfd6eJW3R7/eGlwEU4HvrCCayXj0IQlMWffiUo1vpkAX92BF7wY0hgkvDz5xEcaSY7fmiFF7PUPrF/qsBTseMMAtKpTiPM+FFFUoquiPr6HJcgu71Yv4cQx3wvc6hNnHGaCAHcsPfCjRyhicudcct8LLLCiIrPPptzYcM44blFoOArK++aSP5GBHi40rSy0GR5PjCUy9R29wLUwN6KGQ1RvQvk36pEXtuiK/Oy6v12+KgbLqGmER0LpTq8gHLllHX4fchUhnZK8gxo6R8RTwr0Lr/uGZODgXqx9evljjPHY3i34nhBhciu7fylZM9pWAmL9Aeuj8kqBv7OLP5M/Dcejv9mFA8xF61yvr8COxG/o2Jm0rdxJe6O07Kf6bRHGrFOmfPEDj9JHpfIE2KY/JxffROA5F5ws52E7bKVS5CLWQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(44832011)(83380400001)(5660300002)(6506007)(2616005)(38100700002)(66556008)(66476007)(66946007)(31686004)(36756003)(30864003)(8936002)(316002)(38350700002)(53546011)(2906002)(186003)(6666004)(52116002)(31696002)(86362001)(6916009)(26005)(6486002)(6512007)(966005)(508600001)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjRHV0tGU0ZwNXhibTRaamZwRFpMMHRnemR0OGk4T3RZVXd0SlpIRENqbTZs?=
 =?utf-8?B?a1dncmRTdGYzZjJIQkc1aTEzMVY1cTdmejV3MEplREJaeEZwdXlYR29qaHRG?=
 =?utf-8?B?S09COHhRL09xWFZvdWhaeVpHSUZUenRsck9ReUpFdURXVkJHaG0xakI5Z3di?=
 =?utf-8?B?ODBadllkR3pKS3k5WS9ndDNUL2VROGZhUm9IbWRYOURjU3NyUm5Rdms3UjJa?=
 =?utf-8?B?dWdCbWYzMzh3eFRBcjZrZHpSazd3eUxsazFDckdOS0gxOVQyYVJ6dmxZUEkx?=
 =?utf-8?B?Mm5Rak8wYXYvQ1pXbS8yT1hCYURNSmh1bVJIRUtjUTgyREtWS1JkV0dDeXhu?=
 =?utf-8?B?aUhJbUV5QXJ3VUhhYW5iMFRaWi85cWVoaEI4M2lXeVA4TjdVMlRSYmFlQXVa?=
 =?utf-8?B?QllGRm42QStLdGJnZEJSREFPSm9Dc3dKczA1R011N0tCSnh0N0NhTlY3ekl0?=
 =?utf-8?B?MnhGMnZNV3dCVmZUeVJUcTlNZG1WT3NrUWFJbjQ4N1Nyc3A1OE1BYUttKysv?=
 =?utf-8?B?OGVxcjBLN2x4SER2anpKU0lBTlBFdlAzYmpLY0FHOHJSNnRaTjd4bm9WalVq?=
 =?utf-8?B?dlZxUU5CY2k3dDRWZFJTLy9qaXVXSW9DMkJkWGtZK1dzM3pvYmR0WnFxaXZP?=
 =?utf-8?B?THpIWEEyaXFwRERKQUJsQjZabkJYNTVXcEY3VlVSWWhEbmt3Y3c4clVJL3lz?=
 =?utf-8?B?U2lVV2ZRdGRma1RXbm1ZL2Z5SkVQbGxQbndiNmNGRWszN2JmM1VrU004TnFX?=
 =?utf-8?B?Tk1JNmtoTjViL1dlV3Btdm9jdGwwa1ROejc2M3dZWWE4STQwdWs5RlVkWnRW?=
 =?utf-8?B?UkJ5Qkc3V2JsWkl2YjVSZnNtMTZZMTgrb0k3ZStWWWtpM01YZWJqZnM2YjNN?=
 =?utf-8?B?VndXaEM1aE9qOEdVLzk3RVdqb2pWbmxJTnZUNWZFU0Vqa2pkR0J3dnpNWVBv?=
 =?utf-8?B?bEdMY2RmcWdrYjVmdEVyZjRwOENwM1FUYWlRZkgvTjJMM3YrZ3V3TFR4ZGJE?=
 =?utf-8?B?bnE3RXdWUmdlZFdFVkdNK0ZYaXB3OFRLTm8rN3lwbHJjOFZ1N3h6SjM1NWZv?=
 =?utf-8?B?c3ZtdExEbzVCdmRBbzkwa1FtQ1p2QnNmeDZ2dHM5WlV3QmM4bUVXRG1DR2c5?=
 =?utf-8?B?TlNUajRCckJOTFZpdmJFWEFQUlU0TFEvK0pRaXRiNmtNMkYrbzB0Tnk3ZkJP?=
 =?utf-8?B?aUN4N1l5SkJTa3VQWTJKcEpFVW1wbTBTS21tNk5NVlcrbXI0QlBMWTUvSVdo?=
 =?utf-8?B?NzhlZktWSEJRZ2JQbXpZNmRkVXBRTXNwYkZTTExSWm1UTkpUNDhKdEM2RFFk?=
 =?utf-8?B?bXAwem50bFI1VzRrQXcxT0dIR0VTbm1LN2YwckZ5emEwb1FkWG1SK21pbkhq?=
 =?utf-8?B?Wjd0VEFZQWQ1NDNPM05ZdVJWVWx5YndnYjdxcml3ZGRxYlZaZjcwSmo5ek5w?=
 =?utf-8?B?cXFhT2g5V01PelRzL2FtUUNXNGoxNjZBS003YWdlMWh3RytGSTcrWWxxMHpN?=
 =?utf-8?B?YnJGY0JOOGM3M2VTT2hpNkppQTNxQ2E3NFpISEdNYk1xeklWeWVYbk1SbGpR?=
 =?utf-8?B?dnlMSUVlcVRLTlE5SWJkTENIZlRQRHRJcEcwdXRNb3kxS01kdUR3czhKODFj?=
 =?utf-8?B?QWhuWU56dlMxNHNaNUJ3OVpEWFZNdjhDK2FWRGowZ0N2dDZhaisxeVhWY3Vy?=
 =?utf-8?B?YWJ0bWg3b0pwUTlWRjVaQlNibi9oeU00ZFdBMGVDVXdEV3JRUTdsQnNpV0xJ?=
 =?utf-8?B?TUNNcURpY003QkpiRGZ2ckpIeXFtcFVCbGZ4VHBqaEdENmNqbURSZFFsVjZK?=
 =?utf-8?B?MFVydElHY3VuZG5NbjlETmVGU1B5cnRqQW5yNmllTGNhQVE2NWREYytROXVU?=
 =?utf-8?B?STJndlJKb1EwQlo0d3ZWSzRqQzFoMXdWUEF0NktOVEdlSWM1WVhoaW5lYXNM?=
 =?utf-8?B?QW01QWlJdFVlUkpDUnpZSXZYU0VoRzA0TjZJbm9RYjdGWlZ3dXdiNnpVT1FS?=
 =?utf-8?B?aEF5MWR3enFYOS8vV1ZxaTJaN0Nzd2E5bkRac1kyOStQYWZTbTV0ZXNvMnZq?=
 =?utf-8?B?dzhsWWJZb3lZNnV3eldUa1pjbXp0RDhEZkJmL21Ua0RTak94dWZDNmhkUERM?=
 =?utf-8?B?a2RCTkxCVFN0SXVUM3hIeUFxNStwOGJGRTExTm9kbnFDS1VyblRHNm03eXFZ?=
 =?utf-8?B?RXR3cjN5aWFheTIvYjAzMmp6djY5UnI1TVVlbUpxYnpLNE1adlRMekt4Qmth?=
 =?utf-8?B?RE1YS1RUVEZMTjkyRWFMZ1ZqN3RUckpRVmsrVFVOT3puUzFRdDhNb3h5Zk9r?=
 =?utf-8?B?MTBkSHBOeFk0clhDNkROQzJDSC8vZ042dHovQnZzYWtTVXBpZ2FQOU5KRnVB?=
 =?utf-8?Q?+B1G6oJwwFqLI3Ok=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ffa5dc1-76b8-4530-35a1-08da438227ea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 03:52:32.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7Qr+bHiPIvpJIKHqqGx9TXzz+qQFwm051rW98Be1ZLleOSMVPWItaYORxJD5jAbnDePITW6csM/kWcERVb+kBvAFRhZMpEfC12AyZO4DRUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-Proofpoint-GUID: i_gWO5FSRWDKb4HmEwodgJtIrg5ho7pB
X-Proofpoint-ORIG-GUID: i_gWO5FSRWDKb4HmEwodgJtIrg5ho7pB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206010016
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2513puN6022459
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 03:52:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166349

This set of patches is for hardknott branch.

On 2022-05-31 18:08, Sakib Sajal wrote:
> Backport appropriate patches to resolve CVE-2021-3750.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |   3 +
>   .../qemu/qemu/CVE-2021-3750_1.patch           |  60 +++++++
>   .../qemu/qemu/CVE-2021-3750_2.patch           |  65 ++++++++
>   .../qemu/qemu/CVE-2021-3750_3.patch           | 156 +++++++++++++++++=
+
>   4 files changed, 284 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750_1.pa=
tch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750_2.pa=
tch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750_3.pa=
tch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index aa372810ce..5605ece5bb 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -77,6 +77,9 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>              file://CVE-2021-20196_2.patch \
>              file://CVE-2021-4145_1.patch \
>              file://CVE-2021-4145_2.patch \
> +           file://CVE-2021-3750_1.patch \
> +           file://CVE-2021-3750_2.patch \
> +           file://CVE-2021-3750_3.patch \
>              "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_1.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2021-3750_1.patch
> new file mode 100644
> index 0000000000..8381661886
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_1.patch
> @@ -0,0 +1,60 @@
> +From d09eb9fc1459f5c8b623f3f2134c3c007b4e6344 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redh=
at.com>
> +Date: Wed, 15 Dec 2021 19:24:19 +0100
> +Subject: [PATCH 1/3] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of
> + MEMTX_ERROR
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Quoting Peter Maydell:
> +
> + "These MEMTX_* aren't from the memory transaction
> +  API functions; they're just being used by gicd_readl() and
> +  friends as a way to indicate a success/failure so that the
> +  actual MemoryRegionOps read/write fns like gicv3_dist_read()
> +  can log a guest error."
> +
> +We are going to introduce more MemTxResult bits, so it is
> +safer to check for !MEMTX_OK rather than MEMTX_ERROR.
> +
> +Reviewed-by: Peter Xu <peterx@redhat.com>
> +Reviewed-by: David Hildenbrand <david@redhat.com>
> +Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> +Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> +
> +CVE: CVE-2021-3750
> +Upstream-Status: Backport [b9d383ab797f54ae5fa8746117770709921dc529]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + hw/intc/arm_gicv3_redist.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> +index 8645220d6..44368e285 100644
> +--- a/hw/intc/arm_gicv3_redist.c
> ++++ b/hw/intc/arm_gicv3_redist.c
> +@@ -450,7 +450,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr=
 offset, uint64_t *data,
> +         break;
> +     }
> +
> +-    if (r =3D=3D MEMTX_ERROR) {
> ++    if (r !=3D MEMTX_OK) {
> +         qemu_log_mask(LOG_GUEST_ERROR,
> +                       "%s: invalid guest read at offset " TARGET_FMT_=
plx
> +                       "size %u\n", __func__, offset, size);
> +@@ -507,7 +507,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwadd=
r offset, uint64_t data,
> +         break;
> +     }
> +
> +-    if (r =3D=3D MEMTX_ERROR) {
> ++    if (r !=3D MEMTX_OK) {
> +         qemu_log_mask(LOG_GUEST_ERROR,
> +                       "%s: invalid guest write at offset " TARGET_FMT=
_plx
> +                       "size %u\n", __func__, offset, size);
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_2.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2021-3750_2.patch
> new file mode 100644
> index 0000000000..82d2675ab2
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_2.patch
> @@ -0,0 +1,65 @@
> +From 13e82fe73aca591cc4160688597515c7fb6f9788 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redh=
at.com>
> +Date: Wed, 15 Dec 2021 19:24:20 +0100
> +Subject: [PATCH 2/3] softmmu/physmem: Simplify flatview_write and
> + address_space_access_valid
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Remove unuseful local 'result' variables.
> +
> +Reviewed-by: Peter Xu <peterx@redhat.com>
> +Reviewed-by: David Hildenbrand <david@redhat.com>
> +Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> +Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +Message-Id: <20211215182421.418374-3-philmd@redhat.com>
> +Signed-off-by: Thomas Huth <thuth@redhat.com>
> +
> +CVE: CVE-2021-3750
> +Upstream-Status: Backport [58e74682baf4e1ad26b064d8c02e5bc99c75c5d9]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + softmmu/physmem.c | 11 +++--------
> + 1 file changed, 3 insertions(+), 8 deletions(-)
> +
> +diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> +index 2cd1de4a2..68612afbd 100644
> +--- a/softmmu/physmem.c
> ++++ b/softmmu/physmem.c
> +@@ -2792,14 +2792,11 @@ static MemTxResult flatview_write(FlatView *fv=
, hwaddr addr, MemTxAttrs attrs,
> +     hwaddr l;
> +     hwaddr addr1;
> +     MemoryRegion *mr;
> +-    MemTxResult result =3D MEMTX_OK;
> +
> +     l =3D len;
> +     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
> +-    result =3D flatview_write_continue(fv, addr, attrs, buf, len,
> +-                                     addr1, l, mr);
> +-
> +-    return result;
> ++    return flatview_write_continue(fv, addr, attrs, buf, len,
> ++                                   addr1, l, mr);
> + }
> +
> + /* Called within RCU critical section.  */
> +@@ -3096,12 +3093,10 @@ bool address_space_access_valid(AddressSpace *=
as, hwaddr addr,
> +                                 MemTxAttrs attrs)
> + {
> +     FlatView *fv;
> +-    bool result;
> +
> +     RCU_READ_LOCK_GUARD();
> +     fv =3D address_space_to_flatview(as);
> +-    result =3D flatview_access_valid(fv, addr, len, is_write, attrs);
> +-    return result;
> ++    return flatview_access_valid(fv, addr, len, is_write, attrs);
> + }
> +
> + static hwaddr
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_3.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2021-3750_3.patch
> new file mode 100644
> index 0000000000..e5748b50ce
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750_3.patch
> @@ -0,0 +1,156 @@
> +From 9df520db8c1bf24f1ff1c9739b7870056f2bc991 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redh=
at.com>
> +Date: Wed, 15 Dec 2021 19:24:21 +0100
> +Subject: [PATCH 3/3] softmmu/physmem: Introduce MemTxAttrs::memory fie=
ld and
> + MEMTX_ACCESS_ERROR
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Add the 'memory' bit to the memory attributes to restrict bus
> +controller accesses to memories.
> +
> +Introduce flatview_access_allowed() to check bus permission
> +before running any bus transaction.
> +
> +Have read/write accessors return MEMTX_ACCESS_ERROR if an access is
> +restricted.
> +
> +There is no change for the default case where 'memory' is not set.
> +
> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +Message-Id: <20211215182421.418374-4-philmd@redhat.com>
> +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> +Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> +[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove "inli=
ne"]
> +Signed-off-by: Thomas Huth <thuth@redhat.com>
> +
> +CVE: CVE-2021-3750
> +Upstream-Status: Backport [3ab6fdc91b72e156da22848f0003ff4225690ced]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + include/exec/memattrs.h |  9 +++++++++
> + softmmu/physmem.c       | 44 +++++++++++++++++++++++++++++++++++++++-=
-
> + 2 files changed, 51 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> +index 95f2d20d5..9fb98bc1e 100644
> +--- a/include/exec/memattrs.h
> ++++ b/include/exec/memattrs.h
> +@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
> +     unsigned int secure:1;
> +     /* Memory access is usermode (unprivileged) */
> +     unsigned int user:1;
> ++    /*
> ++     * Bus interconnect and peripherals can access anything (memories=
,
> ++     * devices) by default. By setting the 'memory' bit, bus transact=
ion
> ++     * are restricted to "normal" memories (per the AMBA documentatio=
n)
> ++     * versus devices. Access to devices will be logged and rejected
> ++     * (see MEMTX_ACCESS_ERROR).
> ++     */
> ++    unsigned int memory:1;
> +     /* Requester ID (for MSI for example) */
> +     unsigned int requester_id:16;
> +     /* Invert endianness for this page */
> +@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
> + #define MEMTX_OK 0
> + #define MEMTX_ERROR             (1U << 0) /* device returned an error=
 */
> + #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address =
*/
> ++#define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */
> + typedef uint32_t MemTxResult;
> +
> + #endif
> +diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> +index 68612afbd..f15216da0 100644
> +--- a/softmmu/physmem.c
> ++++ b/softmmu/physmem.c
> +@@ -38,6 +38,7 @@
> + #include "qemu/config-file.h"
> + #include "qemu/error-report.h"
> + #include "qemu/qemu-print.h"
> ++#include "qemu/log.h"
> + #include "exec/memory.h"
> + #include "exec/ioport.h"
> + #include "sysemu/dma.h"
> +@@ -2736,6 +2737,33 @@ static bool prepare_mmio_access(MemoryRegion *m=
r)
> +     return release_lock;
> + }
> +
> ++/**
> ++ * flatview_access_allowed
> ++ * @mr: #MemoryRegion to be accessed
> ++ * @attrs: memory transaction attributes
> ++ * @addr: address within that memory region
> ++ * @len: the number of bytes to access
> ++ *
> ++ * Check if a memory transaction is allowed.
> ++ *
> ++ * Returns: true if transaction is allowed, false if denied.
> ++ */
> ++static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attr=
s,
> ++                                    hwaddr addr, hwaddr len)
> ++{
> ++    if (likely(!attrs.memory)) {
> ++        return true;
> ++    }
> ++    if (memory_region_is_ram(mr)) {
> ++        return true;
> ++    }
> ++    qemu_log_mask(LOG_GUEST_ERROR,
> ++                  "Invalid access to non-RAM device at "
> ++                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
> ++                  "region '%s'\n", addr, len, memory_region_name(mr))=
;
> ++    return false;
> ++}
> ++
> + /* Called within RCU critical section.  */
> + static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
> +                                            MemTxAttrs attrs,
> +@@ -2750,7 +2778,10 @@ static MemTxResult flatview_write_continue(Flat=
View *fv, hwaddr addr,
> +     const uint8_t *buf =3D ptr;
> +
> +     for (;;) {
> +-        if (!memory_access_is_direct(mr, true)) {
> ++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
> ++            result |=3D MEMTX_ACCESS_ERROR;
> ++            /* Keep going. */
> ++        } else if (!memory_access_is_direct(mr, true)) {
> +             release_lock |=3D prepare_mmio_access(mr);
> +             l =3D memory_access_size(mr, l, addr1);
> +             /* XXX: could force current_cpu to NULL to avoid
> +@@ -2795,6 +2826,9 @@ static MemTxResult flatview_write(FlatView *fv, =
hwaddr addr, MemTxAttrs attrs,
> +
> +     l =3D len;
> +     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
> ++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
> ++        return MEMTX_ACCESS_ERROR;
> ++    }
> +     return flatview_write_continue(fv, addr, attrs, buf, len,
> +                                    addr1, l, mr);
> + }
> +@@ -2812,7 +2846,10 @@ MemTxResult flatview_read_continue(FlatView *fv=
, hwaddr addr,
> +     uint8_t *buf =3D ptr;
> +
> +     for (;;) {
> +-        if (!memory_access_is_direct(mr, false)) {
> ++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
> ++            result |=3D MEMTX_ACCESS_ERROR;
> ++            /* Keep going. */
> ++        } else if (!memory_access_is_direct(mr, false)) {
> +             /* I/O case */
> +             release_lock |=3D prepare_mmio_access(mr);
> +             l =3D memory_access_size(mr, l, addr1);
> +@@ -2856,6 +2893,9 @@ static MemTxResult flatview_read(FlatView *fv, h=
waddr addr,
> +
> +     l =3D len;
> +     mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
> ++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
> ++        return MEMTX_ACCESS_ERROR;
> ++    }
> +     return flatview_read_continue(fv, addr, attrs, buf, len,
> +                                   addr1, l, mr);
> + }
> +--
> +2.33.0
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166342): https://lists.openembedded.org/g/openembed=
ded-core/message/166342
> Mute This Topic: https://lists.openembedded.org/mt/91462670/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sakib.sajal@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

