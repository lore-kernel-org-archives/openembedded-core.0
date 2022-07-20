Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47CCC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:35:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.51834.1658309709050134531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=ciyY4qQD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4200d4e672=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26K8ffDK028022
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:35:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=K1L0z25v1rSSyHRIyG8Ds6hbLRJ67TrIfEN2on0j+M4=;
 b=ciyY4qQDSTZeGedQpFd+a4cyRL0/YVwIvxJduV1OHD81oZtiZ92GjlMj4X4Po7CPpO78
 Qzb38Jb8MC2SeumHvysJGQh3BD+t0RiDBcWWPHj3oOjhxodm8s5G4+kbTphsXcF+/j13
 OZrWd8Uoif87sH/Z6lYdIy4vAob6SNYn0JIk+m05WunoDbi8l/dyj/mOOuaU7kH4wI3q
 DVvxKxr8ZXc4J+MsxDKtCiJJ7pmF+tieVpVeqop4Qo86q/fFPv2yAKLeUee+Y5SX7PVX
 KSK3eFWWIWZSl49xEG7riNjktWsEVHw7aRmtTaMRbxVI61uND830PewnDKtkmuFeo02c 1g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvuktuk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:35:08 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26K9Z7VX013283
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:35:07 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvuktuk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 02:35:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9LvVt4ZYbe7j4emIgrWrjoOhobfkolersLaSpSljn+U1Yd33fPwKnmFTOa1iHmqlCRjI6t8+2gHqXn27hNC1FzTvJWG2n99MSzx80hszVF6ZT6xsou4UnUfmtJr6GGdkDyzEnaC6iFqDnOTbGM9mys+iRbiZlsJ9AweC6Ye1zPiK7YmqwErkCMgyDAazWP6rvkfDWtkTKIJQepMwNx3L6YF3N909o9KNxSvvsFZ7GQKc1/zHbNICrLdWsbMI3Te4gVJ340LQ35VrzoM6Ba+PxmFY29rEDsknzyAOJQcmfbB49LTnZz6LWqqiDCPu/UANWibx8Dn5lt8Gk9oMYYolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1L0z25v1rSSyHRIyG8Ds6hbLRJ67TrIfEN2on0j+M4=;
 b=kWvGQW1X4/u5a8AwPc7PikF8qktU7n3CDh9jP1XUPHTIMs8Ms7treac4OCJQ0tDwwg6EItOoiNcLDnSn0L9mNLXnP7L4ap5yODYsFDpLoldfnQL6/O89uSX0eAA9FO1+vaSyncjM3QU/fhPl6XCKEIG/pBPFsc775h4B1ilqc4JXEELEDwG/FeSKPrnB8zHoi4QevRznBs5RbsaVSYyiNPuV9DhriIdexe70Pn8N53KpIWawY1ZraFONAHyyZZZ/4Ew2ckKbPuD3EpykZUw01xyrV9fYsllT1lLaO1hTG6wX4JQxXzOV0gM4V8EAtvbkkb6O+3Ppj9r+BaVOgE0+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY5PR11MB6389.namprd11.prod.outlook.com (2603:10b6:930:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 09:35:06 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c8fd:b278:54f9:c64d]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c8fd:b278:54f9:c64d%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 09:35:06 +0000
Message-ID: <fd32991d-822a-b452-5c5e-b367b8542961@windriver.com>
Date: Wed, 20 Jul 2022 17:34:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] strace: set COMPATIBLE_HOST for riscv32
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220705070318.737747-1-mingli.yu@windriver.com>
 <7af70882-4835-2316-5c54-52318b5e7d4b@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <7af70882-4835-2316-5c54-52318b5e7d4b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0099.apcprd02.prod.outlook.com
 (2603:1096:4:92::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88350bb5-de07-442c-44a6-08da6a33211e
X-MS-TrafficTypeDiagnostic: CY5PR11MB6389:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZaC1zswxJ+mrm0QwzW3GOK4DkZe8tDMNwcZMK7UHei+JBhh53bK7pZtZgRHUyKPV4s4asFZapSR00pAJL2KxG+wlloIked/RQz3uG1mcVwptwQ0k07KUjmaTK5HUkgGlo0cNencbkN4z9badRCmCdZVjX0Mh5zUcaEYWmPCHgGke4bHOQr5p1pmpPXMUE5uCX4uelrH5I4Z7vybErJwy78YnlH6KGxDc5l0/wcfwkUm3JpNeiZq6JqRWl4uQ+jAasdwgpJHqJfjvSPFjd4PDRSG6roc8FOuzX2OlBiJxfH+v9QIoaWy1jKYce9kI0egORQJaw33hBhf9guq7TmHUNdMTWjyX6M8HmML0smY5e99M5YNSKgOZJ7z9IeVTxkPiSZ65qU40A5HpdND9LqP+03tRU0/44lV8fcSRvAQyZbYu3hns/86l5AAlM5GfDOS5ZWSKK7rTp77UB8OZyfDrxxngr10skPLQTFw4xUFLD5ISqTOta/D+JWvBthXoFs+/pmPv4RuwWLgG9eK0SUpN09Xqvfo0/3AMIFk6liKKHbkN1vnKS07e57CHNwFqgRKpyAfWYaQm+gWUs4anWN0X6y4s4ny8EeDsbVwhRIFwsCkz9xTTbdca8EFlJ+fjXU5+FzUytEpYmYgsTkphqaBSUoFHmWAJVn0kI0l1/gZ+0U3mdu/us3WGnUHqhX/Uo7FEAWp8BvdFJew6Ed+TTcUf2xJ7JTJa8XbtBe+ARKbQ25LEZSPTPYDk0jnE8E5Cx7R8jBKMkec16syy6Jjkx0ocBe9O9INFFthXWOkN6wFhgqIe7jNvdGIf/Bf0XqAFQWH2CGALme/fVo7feK3O8I9TLkIscM1ONWp7Ydz0Bl0Xo1cpE/YVAMmAfBVesO9eUHItBn0P27ocrw4undoocVj7Qw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(6506007)(53546011)(83380400001)(2906002)(41300700001)(8936002)(5660300002)(6666004)(2616005)(478600001)(6486002)(966005)(86362001)(316002)(6512007)(186003)(36756003)(38100700002)(31686004)(66556008)(66476007)(66946007)(8676002)(31696002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHlXcVdNVUlyVkxtaW9CSkIraHEwQU4wSVQxRWxyRmtCd3k5MWJoUXE2TWRV?=
 =?utf-8?B?SEwxSlh5Q1o2cGtHNmFCM0l0MVZxR3hHOGovZEw1RTdtaUUvL2hRRy9RSEhF?=
 =?utf-8?B?S1c1UEdGbVFweXBUOU1tV0Jvd3FNSTI0bTh2ckc4ajRLeTBnSkFrbVR5V0pV?=
 =?utf-8?B?MW01S1d1enFtN3M4M1pRTC9icmtFMkY2R1RHVmU3czBPWUg2Y3Z5cjVpcnlO?=
 =?utf-8?B?VWpDZ0c4eitHS0t2L09rVmc3ZmN5ODNRR3B2bWw0OENWNUZOS2dwa1BoRlF2?=
 =?utf-8?B?a05CVk82M0NNdFMrTnJWdXg3ZmlQSEZtNWVjNEdscjduYXZReWozUXJFdGRI?=
 =?utf-8?B?ckpCVGMycFpWUXRwbXQxNlQ1d0J6TmY0ZFAzS3lSRjJtQzVERzZKdlEyUFBT?=
 =?utf-8?B?ZnlxQmtSRFFtYkhXNkRMd0JVU05UM0laQnFDelcxcWhZOTQ4Z25GZk5QdmJZ?=
 =?utf-8?B?cXZoN1JRMEJjZlltM21LTTZnekFmTnlmL1hySE9mV0VwTUFueWQwb1R4Z3dX?=
 =?utf-8?B?ejdQRGN5STU0d2lDVUhGL2ZBc1pxdmE2am9DWkdqbXNPMnZEN2E5ZmJ0cUpT?=
 =?utf-8?B?aG1CVjJYSWhGY0pNZjJSdjNCUDN0dEVoc29uK3VqdFNuejF0R0Noak9oMHI0?=
 =?utf-8?B?TlVGQmJmN2x0LzlSbVJEMktXVllVaUs3Tko2Z1NmZ2hubHpVYW5TZS9ESXps?=
 =?utf-8?B?UmhXSlpIWnE2ck1DNHp6d3VOOHlzbHpHWEVtc1d0KzNieEhmbUlKWThXb1ZZ?=
 =?utf-8?B?VllhQ0NHTnpTem1OaGNLNVZxMit2eE1YN2RpcHdZdWNoRC90ZURMMGw1SCta?=
 =?utf-8?B?a1hIL3N1RG5GQTdVeW5XZWY3YzVFZGJHaGgra0ttMjU4QWwwRXNOejd3RkRF?=
 =?utf-8?B?WmErL1g3RzdNWlB2Ty9ya21IRGxhTnVqbXZGc3k3dmlUaDRNUUMxZmplOUZN?=
 =?utf-8?B?ZVpzeEhuMWZqY2JRdmt4ZEwwNlZnM3hRUTBPWWpSaVVlaUxUdGxCM094enRT?=
 =?utf-8?B?MklCRFhVODNHOStBeFBkOWY1QVB6WlB2ZFJ6VmlhdzlTZDZwd0l0djdWOWJ3?=
 =?utf-8?B?S0VHZFZCU05mN3lwY2grOElOdE82NStSSU9pMTZZTlFlMVlWV1hmOEpIZE9l?=
 =?utf-8?B?akVkQmZZRXQzVGVKZ0kzOW5Fam9pOVUxSTBUTlczMWxZL09wVUdhcVJEZnhI?=
 =?utf-8?B?bGVxamdZYUJ2VVJrT0Nrd1Q2cnA4UjR4RU9BbTdYYXZKZS90S0VIVnF1R1N4?=
 =?utf-8?B?NGcvSkhSdmRqWGg3WWo5bHVIL1ZGc1hIT20ra0V2bTN0RFhraGdwempOSGVW?=
 =?utf-8?B?NzlDRlRrV2NCRHk5Ritsck85MU5JTWV2WGU5ODY3TyswMCtrQ2F1cWhQa2s3?=
 =?utf-8?B?NjJGSkJGNnFJUG9TTkY4SVZLRlpWUHlHR2tmUnRJZEtjRWtqelp5dWhwTnlm?=
 =?utf-8?B?T1pQdnpLdlJxdHQ4b09QSURSSDBtWWNianVpSHNraG5LNnNWaFVjWkM5VU1r?=
 =?utf-8?B?eVNaNHRUbXdkUlNBaEQwYW5JVndCVDI2ZWt6Zzh4Y213K25WQ0xaV0NlSFF5?=
 =?utf-8?B?OERkeVE5YlBuZWMzMnEveVp4T2NoZ0RMd0ppR0M4empXaVBYcTNPRzFYMFhT?=
 =?utf-8?B?NEpCeFZZWk1tQnkvOWc0QTZCdEZiVldpVVJndDBmWFk3RFcrQ0pQRUtSSXYw?=
 =?utf-8?B?RU5QdkNKTGlxb3dwa1pVZzdOTERUT0Z3QXFRWFl3NDN1dXFaQWVPNEk1dTl0?=
 =?utf-8?B?MWlmRHNKZElSYXlybmNzbm95SVB0VWVDWVI2cFc1NGlYekJIdzZUNkd6RGxC?=
 =?utf-8?B?cVE1RUtwMXgzWXdseXNHKzVaaGtXZFdaTzNCSHdQcTE3aHdORnNtcjhZZ0ps?=
 =?utf-8?B?K2xGbU5lMUxBVkthQUVJWTVqcUdIVTJPNVFEKzJsVDdNTE41Y292MXN5NGRF?=
 =?utf-8?B?Z3VrK2s3aVBTMmZXU2tzb0FXaVZGVkJGLzdDSmtCREg0Nk9hNW92aVpCTzdm?=
 =?utf-8?B?ZlI2UWltZmxtTTk1WlBTMWx3K3p5YWN2NHNZMnlWVEJtSlF4b1BrQzMzeHly?=
 =?utf-8?B?RFhTUTI3OWhRVVVRNEFYU0gyaTRwSVVkaFcxbG1DK3BkcmgyYnVyWGVhR3ZB?=
 =?utf-8?Q?oDIWVvlxJWu5DmSEoyUfNMApf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88350bb5-de07-442c-44a6-08da6a33211e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 09:35:06.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oYdwQQL2sDGu9TfjEvtQ/mYLnzizuVQJqoQbbl8J5deq7sPCDCTBGlKfQfUS7t9MjKB5ekBoW3Qf2IMMHXWuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6389
X-Proofpoint-GUID: k1lycDu5lb5SuKOxUDQEKBeWDEx8pyvg
X-Proofpoint-ORIG-GUID: aKnvQtmdKnSDah7fa5g7edl3j1BUQiOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200039
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 26K8ffDK028022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 09:35:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168350

Hi Khem,

On 7/5/22 21:39, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On 7/5/22 3:03 AM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Disable the build on riscv32 as it's not supported on riscv32 [1].
>>
>> [1]=20
>> https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088=
096db215da=20
>>
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0 meta/recipes-devtools/strace/strace_5.18.bb | 3 +++
>> =C2=A0 1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/strace/strace_5.18.bb=20
>> b/meta/recipes-devtools/strace/strace_5.18.bb
>> index 08f0f1d27e..75ff58bd50 100644
>> --- a/meta/recipes-devtools/strace/strace_5.18.bb
>> +++ b/meta/recipes-devtools/strace/strace_5.18.bb
>> @@ -18,6 +18,9 @@ SRC_URI[sha256sum] =3D=20
>> "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db
>>
>> =C2=A0 inherit autotools ptest
>>
>> +# Not yet ported to rv32
>> +COMPATIBLE_HOST:riscv32 =3D "null"
>> +
>=20
> there might be more changes needed especially in package groups perhaps.

What do you mean when you mentioned package groups here?

There comes do_configure error as below:
| checking for supported architecture... NO!
| configure: error: architecture riscv32 is not supported by strace
| NOTE: The following config.log files may provide further information.
| NOTE:=20
/buildarea/build/tmp-glibc/work/riscv32-wrs-linux/strace/5.18-r0/build/co=
nfig.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.

Considering no support for riscv32 until now as=20
https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096=
db215da,=20
so we set COMPATIBLE_HOST for riscv32.

Thanks,

>=20
>> =C2=A0 PACKAGECONFIG:class-target ??=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'bluetooth', 'bluez',=20
>> '', d)} \
>> =C2=A0 "
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#167640):=20
>> https://lists.openembedded.org/g/openembedded-core/message/167640
>> Mute This Topic: https://lists.openembedded.org/mt/92180245/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

