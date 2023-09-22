Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73306E7D0C9
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 04:02:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14243.1695355362988055085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 21:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Q1lDQqch;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76293d9d5c=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M40ArG003111
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 21:02:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=HKOk9QvDIRbKzdheanU
	Kkd/+Km04SNoyKgD6bpieNPw=; b=Q1lDQqchT9HpcojzKf5wLkKTNgAmp2HqXBc
	7pb7F6EfRArph7fnk/6d0IopBnZfYfSpQPFySltbImfxGsk3nvP0jwaJxYN9pbGf
	a6udaHivCV43cdWt6BLDLW/JBKGsw0WJ4pTVLU49KR4EmgxIQGIkQ4P0SHfdMbCT
	ECXk9lx32s66hxnyJTdUH1ultAw6YbQ8QKPTAuYLOX1ECvN46rcDpdlEJbpl7n/y
	Tm1puM9dCZR1YiySr1P1LdbjHPQ/+oIQvcQ5QBi1450TgweKT9wJEdQWMGMcTD27
	mbuH5d77JJCIHPkQAyK7+pFc485x7LLfYgnbqnx1nKgXqe64UzA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr5rd78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 21:02:42 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38M42gOk007376;
	Thu, 21 Sep 2023 21:02:42 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr5rd77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 21:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De995FFWO+KyqdX0unHeJnew/QUOvcKZkUwUjgedzkEVuKJiYaqDbjtXtsd2+m/Rn3OYbYJIiqq3sqoj+CykNe0wpXnpFveyXqRz0qWQWyhCHPfZDUY2wN+Wt+ohS0PdL+sA1hZNPoABlVol3zggVipo53/n8fc0pohMdAPFoE8ef8W8gTSvHOVg4ZIZYc28B5jMmGPUTKI0tBadncsgmRysGsFH3n9RDIEYdaC9fC/wliLBiNAqevqxgPG0zaUNRGFPLKAdq7MK+v06uRAOTPk3A5Zt/PoN/pG5dZzumKJUX4qvX1mudJcxS1FVbm052ZsP2pRu5cLGgdpauZ69YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKOk9QvDIRbKzdheanUKkd/+Km04SNoyKgD6bpieNPw=;
 b=og2COKScnjLIJTEa0yDnHITzvBvSS4yjBt2An7pfEs41g6GK83XvZcTRd7XB6pfwM/0WXAcHtV7yidZ2DmQBHpKtZ2aT4u2M66cbCvcEnkRBfSBoL0PGrIhrQTL6sKfTzJFs93PoPi87auOAtvWLoqxSj4gl/HF3ShhLbZ4CWYqja/StJ7PmFKdSk4nRbEKeSQLk3K1TbzgFIc9CaDir37urj91FMw3DCs31qw1ZUbWinKuCHkesbyCQtpecilbi5h1L+Sx5uvhV9L6kWZtGh2DnAFBUo6nmMOl27uz79IW5kvrh2oi7Gryt3Un7UDOlKTsviR/xZAIFMxdSp218lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Fri, 22 Sep
 2023 04:02:37 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::cd09:b7e2:f2e0:3306]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::cd09:b7e2:f2e0:3306%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 04:02:37 +0000
Content-Type: multipart/alternative;
 boundary="------------n7SgYEP0OOyOhe5WV9qh0M48"
Message-ID: <02c4b06a-c664-7b77-d1b4-8cec69c941e7@windriver.com>
Date: Fri, 22 Sep 2023 12:02:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230921064727.1260198-1-kai.kang@windriver.com>
 <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
 <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
 <VGUB1S.EQNLFG4U297D@t-online.de>
 <CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
 <3SXB1S.VJD0PU0SDSPS1@t-online.de>
 <CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
 <V3DC1S.GMOO9XQMVAE72@t-online.de>
 <CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
 <EPEC1S.ET9N9UD2HEU43@t-online.de>
 <CANNYZj9qZX1yH4aH922Xb8fiM2U_Q57R8UQJiVfS73xn1BvJ3A@mail.gmail.com>
 <BDRC1S.9ON3267ENA9Q@t-online.de>
 <CANNYZj-7ZFnGg914eZ3rVd5TcpNwdPADgY8Ph5-A=fftsYr3AA@mail.gmail.com>
 <LQAD1S.UGTSIS239E9B@t-online.de>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <LQAD1S.UGTSIS239E9B@t-online.de>
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b18afd-a313-430a-ca17-08dbbb20c211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MCVzZgVfRFI+IOYwud5ODKFEg+nxBu+XEWVNAA9UpvszzGZyDNJNLM+9GddxYCuptvKuDofRcoOG5s8XBsDmfIkulPh6cr8HBlitAFZcHGpbeYCKBmzqP4zDXdmhRLssx0U2ylpu/ug83ZMJ4EvkLCb7VsvepFOXNh6WYQWBtKjqX/Ml/Bn26GEBv+vE5lP+eQpZS2nggJoXtgT+bNXSnRK6h/4Z0bhhmgQ1/cnwE2S+Cj8Fp2VjAipnXSPRUE0Rp2bFcp+Aoj+H0NCWyysDtobZz8jM+mgwhawQJ5PJ3dsuQsUljsnoLv20y34WBYuqkl2lwfkUd8uJ7GX2KAOY526qxX+nQehbnDz1k5hjNeLy42LTlfJ68zU9XPBevnqb0YxkNbOy51DsZrQSLXNn+EZi9i8Hd+Ye0anvZ2WSINWfno0Fj1bOeRLHWNaRSnCM6ZuJ8rMEMJsgE2Vw0BgmOv0qZ+lfWmLqGYSkIUApjAJ/apONQtWDuAyV0HS7Tza+1UPQ8kpLbP/W4H74AkVwf8K+wzgWg2WPSTxGx1URGeSYgocFzqLbS4Wirt4W2xdHLRlF9dUybaOiuEJd0P9GS3+Y1yEJ2liiEtxc8WVtC7OSIzo0dqRoOA2F0TxM+M0KdgaLXag06uOctWyMd6KyTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39850400004)(396003)(376002)(366004)(186009)(1800799009)(451199024)(5660300002)(2906002)(8936002)(36756003)(33964004)(6666004)(6512007)(6506007)(6486002)(53546011)(4326008)(110136005)(66946007)(316002)(41300700001)(66476007)(31696002)(66556008)(8676002)(38100700002)(478600001)(86362001)(2616005)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1E3SDRTUzl6T3RyaWRYSEE1NTRodmhIZ1hWSDF3QXowRVpGUzl4YVc1eWV2?=
 =?utf-8?B?Znl2Y2UwOUVhbWJwdWpKY0lyVE1UdWxBM2Jib2JJZ3pBblhPRU81Z0srKzIw?=
 =?utf-8?B?V1lnSDJvRTlzSStUb0k4UHpJdDQvRk1aclNpUzgwZDI5SXgwamgyU0RIUmkz?=
 =?utf-8?B?eFY1ZGw0YnlRWld1N2pWUnV1U0dKVUJ1bElzNHdnejh4Vk9TWnpleG5sV1Jn?=
 =?utf-8?B?eXhpQzA3dDhMUm54eXpQS20ya2lLWjFMd2pvbm9MTjljMlF5b2tYbnZBV1A4?=
 =?utf-8?B?Ny9XUVhYNG5oeTUraElkalQ3cmFBRWY1NzlkYUhTQmxPYjk1eW5aOXlGNjN0?=
 =?utf-8?B?M3k0ak1NV1ZMZkRyTVhoaURVR3hRclVCZUdERmhRVGNJTyttMzg5VXI3dXdP?=
 =?utf-8?B?bGFtRTg5QkRVUFkxRXExaDh3M0kyVG5UVytBL3hwUGdXUEpPd1NkOUJubEFG?=
 =?utf-8?B?b2JVc2N6ZVNvV0d1aTlDTktFdnVsYXprTmFmcDdnVVlxdXhxemJuejI4blB6?=
 =?utf-8?B?VUNNV2N5dVRtVGNheXZ6dDVHdnhQUlo4N0hBbXhwemd5d0dRaVZzd0hLWmlG?=
 =?utf-8?B?UThqMVNVQjhSUUVTUHhJUDMrVWFkVFhsWDByWnIyNGZwYkRYSlpTN2J5RC85?=
 =?utf-8?B?SHc2TDhJclVFdFZZVEFBd3dMVzlXYVhsNGJPd3hlVTJ4Q0grQ3hvazhlc0k2?=
 =?utf-8?B?NVVOcmJoc2c2STRIUHNHR0dGSm0rSzRFSHVobHFoam5uSzlwL3Zqby8xK245?=
 =?utf-8?B?ZUVyam83THdOMGNJUU1kdzFUa01PSk5hekpnd2R2STV4ZkxTdldFZENiMGw0?=
 =?utf-8?B?QlROUE1ZWWREcDMwOGk0dWs1V3VZSmI2NVkzOGJ2RzR5bHRpc0F2Z2F5K0lt?=
 =?utf-8?B?TWhYWTlNOHlMNGVyYWY4M1ovTmZ1bmhqMTgyRU5lT1prM3E5WGdkWmUyNUQ1?=
 =?utf-8?B?RFdDMEthMHdUcDNYRCtzLzRkVDRtUlQ3SldJcGZ6elRxQUcrck5SUVE1MGRR?=
 =?utf-8?B?WXBFOFlpNG5kV3J6TUh1NWV5dmJyaEpxbVg0cVJxMStuWGYwMDY5WVgzYnBM?=
 =?utf-8?B?cXB1UW02eGI1bE1QeUNnM0pYN044VGhHZk1VRGRwYlBHTXZTelBiY0lvdGhS?=
 =?utf-8?B?NnQ4VSsxTFhXbXJtd3gzeEFwa1JtZmtUK2NTcHBiMWxpa2pKOGh5MXpDNHFR?=
 =?utf-8?B?WFdsNm1LY0ZsM3J0SnFNWjdZNHk4YTBOUXVNRnA2SXRPYTZBaXJCMHhnamlC?=
 =?utf-8?B?Z1NFb2NWd1Y3aGlVcUxHZU92SzNXNEx2bnZ0dG5TNGtPWFpYMEs1Wi9PS0Ux?=
 =?utf-8?B?U1paeGd2UGNYMCtOZFNwNW1oaEJPRDRTSUk1NEJ4UDZuOHUzQlFzazRZQlor?=
 =?utf-8?B?NVJmS255QjR0UmwrN3FvNnpTQXpHVnBsazlPYVJ1eGZlazBTQTNEblh3ZnQy?=
 =?utf-8?B?TDFQTFJtUnJOYWFKMkZueTYwRUc1VVdLRUt4dk5XVjU1U1hsTHd6TkN3d0ds?=
 =?utf-8?B?Rmt4T1h3bmtRbXJtc3FPeG1tSno3a0hRSUY1RXhVZmcxMmk0OWZFT0ZwZGpn?=
 =?utf-8?B?MCtUQlV2TWFGT1JJVWFuOWl5a084ZjRVKy9PbEFhVWFNZWZlOXg3MVhjcGFi?=
 =?utf-8?B?RUh3MjJoVVBSdW13RW5BNDkwdHV4eEFZMmg5KzhIanc5alo5WFF0Q01XSlpa?=
 =?utf-8?B?NVVFM0UrVG5LSEs0Zis5NUpLRFcrTk9rYmpmNUdtN096UVZMbXQrZiswR2pJ?=
 =?utf-8?B?NTZWbEZzT2ZXMG5acUZlSk1wKzhXL3dIOUxyNmZmRHR4RTdMRy8yeFdHOTdm?=
 =?utf-8?B?MWI3SmtrRUxnMXVjZTFWTnRJTnVwbVdUTEppaGVhU2xidXFZWHZSVmFzb3N1?=
 =?utf-8?B?QVU2WTE5TnhNWjUvZ0RKUkJBbCt2MVIzQnptUll3VGxUMEVnd29Od1VDUGh6?=
 =?utf-8?B?NkhOZU1YaWljbElTb0h4cldJVTNkWmx5d25VZHJOWUZEbVljZ3NFWVhxRXRH?=
 =?utf-8?B?THRhZkM4a2lKQUJBa1hVWHpmU2Q5aDNNa2RKY09HMUZpaVBVbWFPRU1hTWVO?=
 =?utf-8?B?bTRzMGkrdEtJanloK2pDSjRRM1h3MjJ0cmI4WEJqZUxaemtCamQ1MXBUekRZ?=
 =?utf-8?Q?HL/sp22SV84eWL/PdloGfhNbu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b18afd-a313-430a-ca17-08dbbb20c211
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 04:02:37.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbuPkur/3HHdDrqbGhdqONecgP15SPYF/oI2xHAqjUlkn+k6ZN4USFIPQZi/8IjAFNIXoJD7XnSty9QqMw4NyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
X-Proofpoint-ORIG-GUID: iNZ34l6fV3crdxYUggdCcFhhWv0RF91p
X-Proofpoint-GUID: mk6hMhjJWn51Fzsj4-I77RASQWnwGMMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_01,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=808
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2309220035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 04:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188036

--------------n7SgYEP0OOyOhe5WV9qh0M48
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38M40ArG003111

On 9/22/23 11:23, Markus Volk wrote:
> On Thu, Sep 21 2023 at 10:35:13 PM +02:00:00, Alexander Kanavin=20
> <alex.kanavin@gmail.com> wrote:
>> Please read again what I said about task signatures because the=20
>> problem with allarch compatibility is there.
>
> I read it and also looked at the signatures. But it didn't tell me as=20
> much as it would have told you. At least it pointed me in the right=20
> direction. But I needed more research to get a handle on it. In my=20
> case, it was a combination of two problems. In the case of the=20
> original recipe, it's just the first one.
>
> - allarch must be last in inherit
> =C2=A0 'inherit gnomebase gtk-icon-cache allarch'

There are same name functions qemu_wrapper_cmdline() in allarch.bbclass=20
and qemu.bbclass which is involved by meson.bbclass.

In qemu_wrapper_cmdline() of qemu.bbclass, it uses var ${OLDEST_KERNEL}=20
which becomes a dependency:

63 QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL}=20
${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"

But in qemu_wrapper_cmdline() of allarch.bbclass, the function has been=20
set empty. So there is no such dependency and the task checksum don't=20
change.

That's why inherit allarch after gnomebase which inherit meson doesn't=20
fail the oe-test.

Many thanks.

Kai


>
> - you should not set GTK_IC =3D "4", as I had previously assumed
>
>

--=20
Kai Kang
Wind River Linux

--------------n7SgYEP0OOyOhe5WV9qh0M48
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/22/23 11:23, Markus Volk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:LQAD1S.UGTSIS239E9B@t-online.de">
      
      <div id="geary-body" dir="auto">On Thu, Sep 21 2023 at 10:35:13 PM
        +02:00:00, Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
        wrote:<br>
        <blockquote type="cite">
          <div class="plaintext" style="white-space: break-spaces;">Please read again what I said about task signatures because the
problem with allarch compatibility is there.</div>
        </blockquote>
        <div><br>
        </div>
        <div>
          <div>I read it and also looked at the signatures. But it
            didn't tell me as much as it would have told you. At least
            it pointed me in the right direction. But I needed more
            research to get a handle on it. In my case, it was a
            combination of two problems. In the case of the original
            recipe, it's just the first one.</div>
          <div><br>
          </div>
          <div>- allarch must be last in inherit</div>
          <div>&nbsp; 'inherit gnomebase gtk-icon-cache allarch'</div>
        </div>
      </div>
    </blockquote>
    <p>There are same name functions qemu_wrapper_cmdline() in
      allarch.bbclass and qemu.bbclass which is involved by
      meson.bbclass.</p>
    <p>In qemu_wrapper_cmdline() of qemu.bbclass, it uses var
      ${OLDEST_KERNEL} which becomes a dependency:</p>
    <p>63 QEMU_OPTIONS = &quot;-r ${OLDEST_KERNEL}
      ${@d.getVar(&quot;QEMU_EXTRAOPTIONS_%s&quot; % d.getVar('PACKAGE_ARCH')) or
      &quot;&quot;}&quot;</p>
    <p>But in qemu_wrapper_cmdline() of allarch.bbclass, the function
      has been set empty. So there is no such dependency and the task
      checksum don't change.</p>
    <p>That's why inherit allarch after gnomebase which inherit meson
      doesn't fail the oe-test.</p>
    <p>Many thanks.</p>
    <p>Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:LQAD1S.UGTSIS239E9B@t-online.de">
      <div id="geary-body" dir="auto">
        <div>
          <div><br>
          </div>
          <div>- you should not set GTK_IC = &quot;4&quot;, as I had previously
            assumed</div>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------n7SgYEP0OOyOhe5WV9qh0M48--

