Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AE6C678D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 00:57:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34569.1674089871739685356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 16:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=U7tPyTuG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0383287c4c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J0ntgU001214
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 16:57:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=K4rEdKTzc2mqEWvXXu1dENishGefGO3n9IzFg8s9DYo=;
 b=U7tPyTuGpLhzGpvqoH4TvK+uqzd1aOCU4lly5C+UOKMDBlpm2DcTTzF8TqnkF6WyuPDS
 D8xO29pkDkafjmLWrZks0aKNBmLqG3ZAAup9OqNZy32F4n043zjokbBffTzxN7ztu7Ff
 6xeNev9RtCFwh41Nocr0G9nlG/9IN/4jNYMJWr2Zii6Cu8UdghHH1rLbDCuEeOwt+AZW
 j+e4Fr0hiIf+U1Y9LgBQTiQlKKzN3xx186ZgOXvYKhtWsFraOlsY8y6qiXv21rUNtOL7
 Xh0P81VGhrsM4xZnBk3LhJEx9rlLurR4cRt61miZ1FCXmJAL4F7A2n8I9+VV8E00xpFT dg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqc9fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 16:57:51 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30J0t683011771
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 16:57:50 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqc9fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 16:57:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD+0ce/n1RQkKJWa6JBYok3+dGXxup57aqIner5Js7aE8M4MwrE+yEgB99s6TT5sIUWZ8jIar2oZR9E4kwIyoDZocXGw8JZOrVjmqnVEXAChJ51SkG4bMfir3uHcZ3s3kFUCMpwEaDcqYZfXGgiH0AEBF82arYyexS9An97u0WYnDc5t45KGGodq0932E3HEKz8oANi5Pce7VuBGdxZ9x4emsY9tsd5BZvoRsNGEw5TKjOyI2Cq2ccaj2KjFL3RLBEgU25Wf/jEqzWRV6Nt4FtyZJqkmT7rKHWdaOhZQZli2+rTqahEgbO5Z+xdhBN643r3U02FKT8dEHtbX03+Sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4rEdKTzc2mqEWvXXu1dENishGefGO3n9IzFg8s9DYo=;
 b=A61Rt1qx5himM1vrlbd3sAO1Kwq+NWsNfjU3ZiO4tCfmdGifm9ulS3lM13JGGF28IXlE6NveLkLZsYZaNc0IyaP/mHCkn6QWG7BneLewC08ZU+cyIgcf///oFB2KnWelpPFoiaP6tPoUZStOotRZ63CKRXdF6D45NQ/CXkgNp9p8DSPQWmCng09080YuQbUXrz1dDmg4QteZ3RHBtnxLTE8Svtf/Bc2mD+98N6erHtVgNXzqZcVLAH9Pap43nSpiXCCTTYQUrIxkOgPwAV4AkR8bNAvt9KgZXlomga2HCR+Hdmf/QwYgJ6QbH3iO9DxP1pvYirmGrn6jGBAa889y5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 00:57:44 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 00:57:43 +0000
Message-ID: <6688ea8a-7ff0-1ef7-1875-ae4e8403d9b1@windriver.com>
Date: Wed, 18 Jan 2023 19:57:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Content-Language: en-CA
To: kubiznak@2n.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230104114555.575278-1-kubiznak@2n.com>
 <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com>
 <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com>
 <CAO5Uq5RTENq4mFXVHf5qpG2+Le2OnM_4C48TAV4c5_t7+NvdAQ@mail.gmail.com>
 <DB4PR02MB100307DAFF17C02D888D5BFFDE2C69@DB4PR02MB10030.eurprd02.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DB4PR02MB100307DAFF17C02D888D5BFFDE2C69@DB4PR02MB10030.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CO1PR11MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d190a6-4d26-472d-de8b-08daf9b82c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tz+8hCR0WDBWOsof1eQgly08CSOn/mNj1BULA8evv9dlya3/DM84vqEnLyTB0P9f+1pnV/499qTv0QCmGsYh/vJFiQ6dhNdn+sFqTZiqm0XHVIzlCodfW+yMXFucOroJN2s25EJvPyMUv38OT1xTisyh0c8AM/7yAdi0/7k58NDIV6t+NNGlNk7CNraNLCnZdrdvhknRFlLfJugc2nlkG1NElcsCDGBdI+ai2i+jdcxs5DSbCy3NyY2o6DSIshLCstTspDXskJsI9+kuBbLpxw8qwm4uJv1k3sWsILYytSwyDkYV6M0rLbGrgkMq6/OtU/RgPKpmE+rjBAI1EpvgbVQPM5DCMOT+Mx8SeBXRA4frnIK26hjThh4AqtBoNlzNQjK3DsvJ96KzDkKal6doTOsundr8JnYcLSWGOLGbUNAcCg0VJQTHdD2QVNVUpRHDp/ApZcC60H/IextX06pOmSUjnJG8x3Mq6VOb6vPk/e6kJ4g6hn3NCqdbwhF69TyoF1CVWHLU2iRbr8XGvpdgGWM1Wja7eJmOZsybLTdiExsF1Cd43atTqDUywj+yMjiQUE501v/vi+oQjyhsnVPn3fDP6yhhKpqH+CcA2bJoF5EQSsuGi21vvaeyQ42InJ6MYQ91PeMT/DieNexFvdQWnpuJ/AuRAyqSDPzJ9WAgENruAqK14cLWJEkKMmZ3QvyGRmz7DAmsbIvkgjIriXt6egqEkYXMo1gMT27nqGFESRsNRV6yi/AO2VPGPJ3Wy4MK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(451199015)(36756003)(86362001)(31696002)(66556008)(186003)(26005)(53546011)(66476007)(6916009)(6512007)(66946007)(41300700001)(2616005)(8676002)(6506007)(966005)(2906002)(316002)(38100700002)(6486002)(478600001)(4744005)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qy9jdHh5L1NxWG5nVS9hVXIxTHE5Z3FqN3c4ZjJLTEg1L1BodDBwTWZQcGZC?=
 =?utf-8?B?WFNVanpySlRKWmJqYTc2UVZDYW55dkFPRnUyNEZJUkNsd2NpVnNQT09yTW5D?=
 =?utf-8?B?bEdNTkRCRXRyazl4ZHUzRVBvV29JVkwreTFmSE5VY1ZJQTZwcUtTelJMaXQy?=
 =?utf-8?B?UzMyeStMbkZrZXJPQU03cnZ3VUw2WjBxNnAvNS9saDVzNnNZY3liY0E5Y3M0?=
 =?utf-8?B?Q0M4VWxHQ1R5cStOeEliaUdGWVRxVitkaklUKzlDOFlyelJvTEFadGUySmpp?=
 =?utf-8?B?cmpEZW1jc1NGOWp1SjBnSEoyVFRjYUtnUk8rOW16WHdrMVpOZHIzUnhGSFpw?=
 =?utf-8?B?eWFVdVBKTjRQWXQ5L01IUXp5cUlyaTFySE51eVdsT3NKeXhibUY4LzQrOUp2?=
 =?utf-8?B?N1owMHUxeDFzVGNjNVR5NkhZeWEvaGVDNHNWQzFyaFAxMHM4Ulc1RnFzdmNj?=
 =?utf-8?B?b0VRNUJQcWU3c2dnK25NVUxlTGxBMFIzZzVQN1JPVzR2SWdXS0FlRUJYdEc4?=
 =?utf-8?B?MnZlVWg4bGdoUjFXT2R6Vi91TFVRMVo4VlJPY1BLZDA1WllyaURyUXhZYXpx?=
 =?utf-8?B?OEh2a0oyQUNZUVl4dm8yNVhYUWZRRDZDajVNc0lQVStaMjNzOW1DZWJmbzE2?=
 =?utf-8?B?aVVmSU5DYldnWFVPeXhuR3ZuOTZDNWpvRnV6VHg4TEsvMXp1eGFZR05VVk83?=
 =?utf-8?B?U3JtcmJIRHRma256Nk5MSlhTT21mMzRVaVduQS9JaUh1TkRudjNYNEsvSy9N?=
 =?utf-8?B?aURmN3pydlBXUWIvTlphRy9jRWFSKy83aDlydkV0allueDA1MEtzaWNPQlNo?=
 =?utf-8?B?Y2kybW1Bd0taajlyaGk5OXpXa1BjekttMTJ4U0dTdEROV2JmZlRTTnBMU0p6?=
 =?utf-8?B?bVFOWlQrRjRESmJHV1lGdCtyUytrdmo5T21kcXo3WnJGNytCZXdpaGNlY3FP?=
 =?utf-8?B?eDZEanR5THpnNFM2MlZPRVNCQlpyR2ZwZmdLQ1JYWUJUbFlWdVBxeDZiYlY0?=
 =?utf-8?B?ckRYWDhDYkFUWStzNmcwM28rb01NQjVPcGJHKzlRTzdtaWpLazRzdzIxUC9l?=
 =?utf-8?B?YVU1LytIZHI2cHRoZS91bjd6TGt5cVZvSkFaYktyWG1DRUVzdDc1TTNFTThO?=
 =?utf-8?B?aExSdjkxZmxzQW1tVHhITURSQzZtSlRvdXZoZklMZzRvalZ0UmVLVnJ2K0Zp?=
 =?utf-8?B?bzFIRnJBVUdFVVoyNGt4bUlaUDJ3N2tRT0o3L0ZUTC8wNnZMNzduU25qVHls?=
 =?utf-8?B?S3VLbjhjZVJjL2kxM05raWl4a3ZTUC9vMlJkQm51bkY0cEFIU21NZ0lqcm5J?=
 =?utf-8?B?RFpJR2d6cE9IT01jaXA3blhvM21YS0dVQkNpeTNuNnF3RHpOYncwVmwxTklr?=
 =?utf-8?B?aldycG5obDREanJpTkN4UmFibE1xWUJyMnlGbFMxSVl1TGpHc2dnV0pjN2Jy?=
 =?utf-8?B?NUVJeTRCemVlRVFlc3ZScU12ZEY3SzRrTzJCVnhUNXZBQmNQeDV6QVJlNGxi?=
 =?utf-8?B?NUt2NzB5SWJFTGlhS1N0M1Z4Ni9WRkdKUS9uK0ZORGsybm5KOFlDN0pjV2du?=
 =?utf-8?B?N3lKRnp0VmNiTnhtRmVMV3dxQVVpajBsNWxtaTR2N2FPTzU5NVZsM0grd1VV?=
 =?utf-8?B?YUtGVzNOOElQdnV1QWxZNVVRRDBHMnF2LzZ4V1JhZExPeGNKci93WEk5bE1u?=
 =?utf-8?B?dXBwTE1oSjNCbDIwZGFteUdyeWRURGtOcFNnRGUwYzdEeUFvSy9uWEFKQzFI?=
 =?utf-8?B?STc3MTU5eHJBcDVDcWJOQ3NSVC9ZNjRJSzlqZXV2YjMwRkQwTmx3TlRmZXI2?=
 =?utf-8?B?bnFyZXZZdCt4UHpVcTIvL3Z2MDFIQXhQWkZoWU9FdTdyRTJBR25VSm5JQkhY?=
 =?utf-8?B?OEI4NC8yenZuY2hDSEVOZU9jUjZjU05FNk5obGN1L05NRUcvcGU5Ukcvd0tG?=
 =?utf-8?B?ajNaR1BVdm9PbHl0UGZiRHdCWEN3dW5wVytlNEJWczUwMXBtMjVGQTduZTU2?=
 =?utf-8?B?ZTdXNGhObFozZFN4cUNieExtWHFpbWlRcEcrUnhSN1p6WFJuSWFzQlY4bUhY?=
 =?utf-8?B?eGlXdDFkY050Ujl6elpYaXdHbDM2c1pHUktrYkl6SFlKSXNlWjJDZGwxdlBq?=
 =?utf-8?B?TzhrSEJiTlZDQ2VBSlVqRXdCL1oyOGJUTFllck90d0UyOCtTTmhzWU9wWW5S?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d190a6-4d26-472d-de8b-08daf9b82c18
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 00:57:43.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 044Zg30O0CjoAjAKT/iF6umd6539Og/QhF4xgde+Vwy7MKOsZO/U3sY0SVaKP1IMnxjxUxs/ucyjd3JVl19I87WRZ23nqA4qgkHt2+LQIl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-Proofpoint-GUID: QDzgqaCVuYlbUT9GYbQ_4NOZXMrN8hTa
X-Proofpoint-ORIG-GUID: HGD7rmfwhfIfkdUACT5pZEyrSQO65Ojn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301190003
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30J0ntgU001214
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 00:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176115

On 2023-01-17 07:58, Petr Kubiz=C5=88=C3=A1k via lists.openembedded.org w=
rote:
> This issue was actually caused by missing host dependencies. Shame on m=
e...

Do you mean standard host dependencies from our documented list:
=20
https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-=
packages
?
--=20
# Randy MacLeod
# Wind River Linux


