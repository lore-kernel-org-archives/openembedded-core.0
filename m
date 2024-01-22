Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABB2C47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 00:58:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.62460.1705885100011604937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 16:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=T2eqL9V2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751debd67=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M0oYbf009351
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 00:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=8kciFc4T1SkVCMWRKV1
	K0GsTcVpmhMDkWgoV6aobqy4=; b=T2eqL9V2GLh02xuc5BYQBlLoRQKHDRwWhRe
	rWGPu5of9lQj/EFJnvesnweGAhR8IRaKzg0QLuR9TJTcPTc1fSVIz7KqRCLsgZKp
	qWLRxHMQ119ZfFIh4vFO+uOJ1OsujBSE9LUH3fyY8QY09xUKTp7G/JfhIG7/QZjA
	tEelfpzh2kq/n6X8cn67LvtbtTGD472h9mHwbLRaQMF+kUVHN9q8tRAlCv01fmaH
	dldQG32EChokm1Jz5qSj1hf3nK50Ts9YP/1DrE1Cr8DY8QH4ljksJM3ub1d3hJaH
	cQ1NesC9jugSFrFb2dolDoCQEa6KbUF/IvsS8ycNSHMFU1JcPzA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571cqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 00:58:18 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40M0wIuu019053;
	Mon, 22 Jan 2024 00:58:18 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571cqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 00:58:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m592B8EcXQM0+VNigQtwWaebWfgkjloZjxfpBLbccvQAu2mgBDpSAd7lI9TSjB3SnD/CIB6rhfY7b4VRb1VCv9g0MVSESzYt6hmg2dhQu+sHTbXsnZprS9rbRUeid0WWkcx8WbnZY/bQrZeUoTdueKYf4ofiT9qePBEuSa61L3YM+KUgBcQDd46Z2H49yc9X2pUhKF8+JjP4oNcubr3n3uPnR8VjRs6SUcu6OdXO6Xz1ZhtvX8kHuxL201tjeFQgoCGvow/3wiNtMa2+pIzOvJkXF5ve/1FjKUCxg2h77+uVslIsoVHWLtXtoeZ9n6YuJo/drMUJRheAIcpT8oHJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kciFc4T1SkVCMWRKV1K0GsTcVpmhMDkWgoV6aobqy4=;
 b=PTZWw6vjBWXn7L9rPBQ+D8bC2NBdaMyexFLkUI1f5HzhfpjYHi9aV+1AD3qK+YrG0+F9Fl38Yzhhyr4ecfz1hJuQpllYaFj40AI2JKi7wIg6/1+nVsF8DhlLp+MAo5lcpIdO7Fw2U4rvhA2pHzZuFdJx9Qfu/v8kfK0k/ym2e6mIzOqXwz/H7QTBYT9Dy1cUXIIbyJkGb/esIcAB8e4cImPu9h2AQidjWkJmBRgqyoDTJmWjLTaxGtGluRz9REOx5eQxO+Ox6a3W12O/3PLJqSv02WHBRLOt4ipCN3Xx4vm2LD963BzRxBqaa0VYPTKrA98Bdqn/0Xdn8aguT/IQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 00:58:15 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::494:39a4:56fb:9861]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::494:39a4:56fb:9861%4]) with mapi id 15.20.7202.028; Mon, 22 Jan 2024
 00:58:14 +0000
Content-Type: multipart/alternative;
 boundary="------------k38Z1RkhOFfskU90uKQUbRlN"
Message-ID: <59d621b6-67a0-4e9b-bf0c-a1c2dbb4020a@windriver.com>
Date: Mon, 22 Jan 2024 08:58:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] tcmode-default.inc: use ?= to set
 PREFERRED_VERSION_llvm/llvm-native/nativesdk-llvm
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20240119073509.934362-1-changqing.li@windriver.com>
 <6546abd13a7991e0654ba98cf0878b405ad6ba3f.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <6546abd13a7991e0654ba98cf0878b405ad6ba3f.camel@linuxfoundation.org>
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba47e6c-59bc-49a5-4a42-08dc1ae53679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wvOvW1xM1fUoMyUBJq+zXCU4JEXEL7Bxu0HIL9YOzfXcnDf2g8wTF71rl7OP4I0P5lY1RbA+MbF8ypR41VSJnb/qsZspyN/feMFIg+M2/c/Y8elV52hGXru9Q0exIQ/vMqIkJo5+VKhearxB9mu/oUAinG61LeZrAbBcJ8ycgI+8oPU2IurOQgOGA6XNITVkekkkbblqojYfJVtFVlyXCYcBSFeEggQeqc/3/fqwAhWQn1pp1WTTRO169XfCH+Acy+em63NawSkCdAdGvtSwYEIBt5VM0XoX1KRD27M386/b4gBwTbVzcplhGl470Ak59WH/QYtBSqZFkMAtRJ+LKsGCA+psQ7EGIQqnI3DhGrMTW0pzZsL10P/q1Aks1DMjbObkH9y4xrOfHeldHdIAnIkevlu7P3F2q9M7fADSFcNwkN7dkjWeHIUJCoGw0plxEIOhuAK0zA/Fw7cz5tgFBs8142Rv5ubOC3kbrWZO8jPVx0CLWG+l+TE2aQ3staH391ytBOBUVsf5BzJS78ECxT+jsqzgpCeADaOSB8m/UHO6SSaerfmt6hAVLXg2CCfi9/zbAjCe/n/Ag5twSdyavJTcvTcXZE2jGd2vS4tHRSOgT8OMps9Mea0mM8FA6d8UKI8hdW5xfs5c+adPEjTtcUv3QWc2ucFwvR8f+2D27cDp/O8NMs2LObmZD/nI7Al1D/MI18+40+rzQI8K9ABEgw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39840400004)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(36756003)(31696002)(86362001)(38100700002)(83380400001)(478600001)(6666004)(6506007)(33964004)(8676002)(8936002)(6512007)(316002)(6486002)(66946007)(66556008)(66476007)(110136005)(5660300002)(26005)(2906002)(53546011)(2616005)(44832011)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVpqZG9JUDc3TlMyOTREaGgyK3ExaVg4d2h6d3FzcmgrY3JyK3lENmZNanZy?=
 =?utf-8?B?bUxydytucjNmd28yeFVyZmRuYkozMXpPdzJPaHRscVhQMHRtYWorRm15K21m?=
 =?utf-8?B?WTJUQ2JBWUJldWtuOWg5MFBYMnhtT1lkZTR4L3hvMTY1dzB0L0ZITEJaUDlR?=
 =?utf-8?B?SUJ0TDBaMG80R3ljbHoydXI4UHYwTy9CTHZTUllsd2JheXhXaTR4MGFCU0lR?=
 =?utf-8?B?SmM5dlRuVElZc2pHbWpZa0Q3NTNRbmdaaUREd09SNGdWS2RoSmdpQm1USU5l?=
 =?utf-8?B?cmtFMExSbDR6YUZ5eUFOZlpCVFpheEZHcG8yK1hUR05idCtSV0VJSVpidGkv?=
 =?utf-8?B?U1NnRHY5TjcyNVhyd0d6aTVWWHN4eFRWUGk4K25qK2xQUHh0NDFhc3hRWlp5?=
 =?utf-8?B?YWRvOENVb0lJOEtNVTd5dTRLVURvTGVpTXpkNHJtNXFMc1l2N1NMaVdrLzl0?=
 =?utf-8?B?aXZlMmx2eGFvN1Q4cFJJckRNNm1vR01vcHdacDJzOXJ1NmhWSzhrbnprRHp2?=
 =?utf-8?B?dnV2UjRSVjlqM2VnTEorTVBoenRObm9qYWxRVlN3aDhJbmdEVm5WdnRYZTlm?=
 =?utf-8?B?SXgyTUhIeHR5eXJyU1hlcm93L1V1WFEvdHo3MjlBMjhHbmRCN0NaQkhNRHBs?=
 =?utf-8?B?Smg3clFXRWVJbVEveXQ1di9PeXJoTDB1SW5VV2JRbHYwRnE1WHdGWjdFYnR5?=
 =?utf-8?B?ZUhacDRBaWJWMHZnbGdOZTlJdmxsaEFYaTFaaFpzb01pYk1VZEpsdmdJTUl5?=
 =?utf-8?B?dlRMc0JOWWRrY3JCRlhZb3E4REhqT2RaT1RidzB1OGVvQUkxd2NEaDdCY0RC?=
 =?utf-8?B?bm54WW5CZVVWaFlXd3ljQUdsRjVqamxFNk0zZ24wdEZBSGQxY1duNHppdTR2?=
 =?utf-8?B?NXU5b1FZS3h2UUVuU1JEcUtmT2hNZjNjMU1zSkxKT1pxTXl3SER2THZmWTRX?=
 =?utf-8?B?Uzd6eU1Ya2UvT2RldUtBbkVnbDdGVFRqa0M3NGxQUllUcUQzUVlHUHJDZTlr?=
 =?utf-8?B?Z1BwK080aUpPZWJOZHJxa2diUUV6VnFxcTVkcXVwckdjbG5XSlVlUHRLSkVI?=
 =?utf-8?B?Q1pnS0VVUW9yNVBmYkoxNFBJMDF1d3d6T1Vid0REcnkyN0R1cHJ3Uk9xSldC?=
 =?utf-8?B?ajIyd1I4Z0tqWnh5Qkl2ZDVsMEcyK0tjTHlmNitFNWdOa0szUml1Q04vU3Fx?=
 =?utf-8?B?amE0TUZQTUcyRnhOd1NiUm1TekZjOFYyTWQ5dGkzemVTRFZzSkozUkZ5Mnls?=
 =?utf-8?B?NGRjWUpiTkJUR2lvdW9qelpuMWtCVUpIMkwyaGs5UitYQXI4MHR2ZXRyZzFL?=
 =?utf-8?B?ODlhVUN3ZTF0ZWR0MVpLNE04SytVQkRzVFB2U3JoMFNmYTdaVThWTVFBQ2Zz?=
 =?utf-8?B?YzFMV0NZRE5TM1E4VWJzeTJZWGVzZGVYdjJLTHNhS1M2Tk1BSjRqV2ZqK0ZE?=
 =?utf-8?B?UFZ1dlFtczZMTThzbTBQdEFDVnBCVGlna3VYTHdxWnNqcWtGVEFwdXo4OWlW?=
 =?utf-8?B?eW9DQk1NY1pPZHpvOFozN3k2bVRsQ3hIWGp3enNmMHZwbXF0SStQK3dCT3l1?=
 =?utf-8?B?OUVuc2tSZHJLSmYzSi8xMzVyRXRoUXdLVjUzY3lkOWsyVDJKcmhBSWE4ZDlG?=
 =?utf-8?B?YVhFSTJObkZmQnVCVVNmcVVtOHZ4Z3BFSEE4blh0TzBPZWdtL0JUZTN3eWxJ?=
 =?utf-8?B?ZnJGaGZ0cDEvSFlTS1daR1BXV1lYY0dBWWxOYU9pUytFOERkYkhTN1pNZkU5?=
 =?utf-8?B?RTNoM3orTjh4V0F5U3R6WW5WSHZ5K21oWXkyWVlwZUx2OXc3dlpzU0ZHSkdw?=
 =?utf-8?B?dFBRZzVjL00vV0kzNHZoMjNvOEczWFc1Rm1CNEwxSkVNdnVwYzZuMzZudWFs?=
 =?utf-8?B?QW9FQ2UxdDBpeklpYmNoOUhNZGV2ZlpIMHNhOG9Edy84dDkrdXZub1J4VzBI?=
 =?utf-8?B?UUozOXJJSldPUldVM0t2SWdMa0lKREVpVHlwM3Q0ZHA4a0FHUkVHTjNQUE45?=
 =?utf-8?B?L2RNbnBEMHdrT0xLNkV5WVdTWXEzdWZHZm9PNGNDOExGZFFkT1BWL2pKdlRC?=
 =?utf-8?B?dWVDYzRmRXZUT0x4REtwSmpjajVGWDhzZmgrSkROd0xpcmxoUU43ZURhMnB0?=
 =?utf-8?B?M0kwRzJQZmc4NEhyZlE5bjJXMGNhazNkRWkyNlUwV1N1VXhtTmZhcFZCUnBB?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba47e6c-59bc-49a5-4a42-08dc1ae53679
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 00:58:14.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjiRY1wmOHHe2fEP4gxjVgjh3j/I+ljuSVYVKXZOJx4hX3S14vrS2Q504rfyPPoGWwMaDMfAp5Zv5nmav21G+DIPadidh6SXekYbZqf3xVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
X-Proofpoint-GUID: mqEBbC_nGP2Mhv9jhB1ZnH1Rg1dnL7Pm
X-Proofpoint-ORIG-GUID: re8N6ljTJaHOhXJu5kf6A1rysJcOHf_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=919 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 00:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194106

--------------k38Z1RkhOFfskU90uKQUbRlN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40M0oYbf009351

On 1/19/24 17:29, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2024-01-19 at 15:35 +0800, Changqing Li wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> use ?=3D to set following configs in order to allow user
>> to override the default settings:
>> PREFERRED_VERSION_llvm
>> PREFERRED_VERSION_llvm-native
>> PREFERRED_VERSION_nativesdk-llvm
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/conf/distro/include/tcmode-default.inc | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> You're said what this does but not *why*. I'm not against doing this
> but I do want to make it clear it is actually quite risky as others
> often rely on the existing behaviour.

OK,=C2=A0 I will send a V2, add more detail commit messages.

The reason is that=C2=A0 LLVMVERSION is set to a higher version in=20
meta-clang's layer.conf, and set PREFERRED_PROVIDER_llvm =3D "clang",

so llvm is actually provided by clang.

but this PREFERRED_VERSION_llvm setting makes bitbake llvm-native have=20
this warning:

WARNING: preferred version 16.0.1 of llvm-native not available (for item=20
llvm-native) WARNING: versions of llvm-native available: 15.0.7

I want to set this PREFERRED_VERSION_xxx to ?=3D, so that is meta-clang i=
s=20
included,

this PREFERRED_VERSION_xxx can be override to fix above warning.

Regards

Sandy

>
> Cheers,
>
> Richard
--------------k38Z1RkhOFfskU90uKQUbRlN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>
</p>
    <div class="moz-cite-prefix">On 1/19/24 17:29, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6546abd13a7991e0654ba98cf0878b405ad6ba3f.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 2024-01-19 at 15:35 +0800, Changqing Li wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

use ?= to set following configs in order to allow user
to override the default settings:
PREFERRED_VERSION_llvm
PREFERRED_VERSION_llvm-native
PREFERRED_VERSION_nativesdk-llvm

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You're said what this does but not *why*. I'm not against doing this
but I do want to make it clear it is actually quite risky as others
often rely on the existing behaviour.</pre>
    </blockquote>
    <p>OK,&nbsp; I will send a V2, add more detail commit messages. </p>
    <p>The reason is that&nbsp; LLVMVERSION is set to a higher version  in meta-clang's layer.conf, and set PREFERRED_PROVIDER_llvm = &quot;clang&quot;,</p>
    <p>so llvm is actually provided by clang.</p>
    <p>but this PREFERRED_VERSION_llvm setting makes bitbake llvm-native have this warning:
</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">WARNING: preferred version 16.0.1 of llvm-native not available (for item llvm-native)
WARNING: versions of llvm-native available: 15.0.7</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">I want to set this </span>PREFERRED_VERSION_xxx to ?=, so that is meta-clang is included,  </p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">this PREFERRED_VERSION_xxx can be override to fix above warning.</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;"></span></p>
    <p><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <p>Regards</p>
    <p>Sandy
</p>
    <blockquote type="cite" cite="mid:6546abd13a7991e0654ba98cf0878b405ad6ba3f.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------k38Z1RkhOFfskU90uKQUbRlN--

