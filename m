Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07E4E706E7
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:17:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11165.1695284215370783569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 01:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oRaeJlHd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=762864786e=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38L6rdp2017689
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=XFeEoCBR/4y5fNEBXNnw9q6hJhOvNmbfbbmDU4qL614=; b=
	oRaeJlHdNMAP1hXz/8Lr2oMul4myNmo7ILh653Yqfue3QsGESc5084sKrLIVQM3d
	hiylXR/WNTtVsljHlsT/9WXQTWudlHnTIx1W0ZT9ggeKOiMs1Azl5rvSH/mEAazR
	AWlNkIIR2co9WWkmHA/IPEMx24K7yfTqpt8LtArJbfQwehP/D3VHmOMRPYY5Vbsy
	U1pIGcDRsVxEPIAP+UPT+NGl7GzOJoFfXPz9Rk6oFYD6bihhxb3z/l0i3PSzsXF1
	blqVGMl4sZ5MqkfRdjEmonLmG7E9mmOgKtLVFqMvSTl+CBsfRvnL421Dgp5ipl+j
	822Fdtx5xe7dnlBvl8Mfgg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t51jxcdkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:16:54 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38L8G62G002252
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:16:53 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t51jxcdke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 08:16:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWjFH5eMhbPe5BiLcrY2yHjhcK7rlusXx/owWNkYZ5bzrM3t+xst4plJDeP1qBAxQhnZmodx5bwRtEeDGqsM3i5UthZXe21lL+vly3Q70SBLaiModKFbEEOSiPWggW+cWZUQu3wlpFZSBowXtzf036kEgjaNniQu7QuK3Zq3PDHU81LZmiWtOH/Dvw1sTNiQDmn0i9JpwKt/7X3ZEWp+bjmfz54umM8RbqZdk2xka4t7VZ9H+feiNTdbfSXzbhQ/0A1Zhr3nSyXTXILy6c+OE8hUSmeLcxl0EuwdhbJq2rmbE8pBbmiQXXxtNKFjsUu/Oz+dt5lp02ErfDg1Zxg+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFeEoCBR/4y5fNEBXNnw9q6hJhOvNmbfbbmDU4qL614=;
 b=HzNyBYDqX6gYlQRBK/RNcbE1b6VPFVJ1vjyaDbGWc2CnqERMnkLqYxmGC8aYVB7W67Li1D5z7Lq9T+azOUG+sXhAbCZORaYepvenmuIX9PVLVBdiLeeUXyGkDuUTFUqzlNu1o/21bB4/7R1Gg8JvxHjt4cdD+1vDGq45Lxd4Hz634KIGU7pjehza2Q0Txcuc9tVXUs30bMr2sQPddwK7jaPv8AQtWZH1u/cVZuPr7Ck+sUdlBpS3sY+TAkS5TLgx1oT9ZFJvYXPI0DC5KlVkFFv1/mtO5YJ+u3Vh+LYj14yQSYm16v6NyCI4N4d2VOdqE1A+1eyD9Kp8srQJP9X92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 08:16:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 08:16:51 +0000
Message-ID: <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
Date: Thu, 21 Sep 2023 16:16:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] adwaita-icon-theme: 43 -> 45.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230921064727.1260198-1-kai.kang@windriver.com>
 <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:180::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5025:EE_
X-MS-Office365-Filtering-Correlation-Id: 246c5d0a-57f6-48ba-9861-08dbba7b1bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SECd/FrBm/o2HJ4mfJY92d+vLnYXNY8UCvriqVtOw8LRhHVOgZ/dCFBfwDJN7E89jh79kSjV1tNtQBP3XMjRInCtziQHqJuvUHjeJSqZmlMBeimn4G+3X6gYYJt7wBf67OdDnNmm6A9gVibbJB9LUY7g7y83iF/p5f9RruYBMvPYjmdW1ua3SXy5ge+HwajjXc5QagZpx+oLqXaXuTf/PeShO9lRsWRjoTSv0SKK1bJu7e1XNJwaSm2ZyOqYC5LG0LLLBp7WDUJMywk1TK7ZVLEbBRf8iZKqEtzN7qHUyjINTD9fGqzZlPvUStwwd0fTTsN1+3paGquaE7LWF3c385hvuEgzNcEctuluR505gdE+g0i1vz5qewTlG+PgFLVmhilMS7g8X/fGK5vG79m4QQDfyBDav5xezByoRypd9+7C5LV5+kqDYKceyXDRvJXF6TeziZTxei+USbdA0s1b7ud/LSDGarhGQ13KfetiZOGXpYlqaMxEeOdPPLuF9c0zsEmEX8pVrBnUrihvOOdydhN02XYDCabRIEp2wqvjxegBxwEUa7Zl6k9deqUEflQwGUhKbKteTqir9KDJX8LtRHHSvhqbTzjZrmEydQEMrIFdUP4X3vAmB44ZYnQS9+363xhcKMRQghm0IOw1A3GeNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(366004)(396003)(136003)(346002)(451199024)(186009)(1800799009)(66556008)(26005)(8936002)(8676002)(4326008)(83380400001)(2616005)(2906002)(5660300002)(31686004)(36756003)(86362001)(53546011)(6666004)(6512007)(66476007)(966005)(6506007)(6486002)(31696002)(66946007)(38100700002)(316002)(41300700001)(478600001)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bEl3REU2Q3AxUXFnTENYdDFhdy9CNXBXaUExZnpZY0ExUUtvRktpZkJUK1Vx?=
 =?utf-8?B?UzZtbUxoQThnK2dKOXVLaU10a3N1bmo0S0p3c29GSDcrMDVqNmIwcjZ3ZnUv?=
 =?utf-8?B?ZzY2TjdlUGF3N2VsTERadWtuUENHTDdMR1A0Rjl5MkJLSFJiYlBtL1dibFI4?=
 =?utf-8?B?d2hlT1lIdnBzT0xYS2xNekVONjVvWHFoVDJwRlVCSTN6SUtwUXRwZGt4Tjli?=
 =?utf-8?B?K25FVXMvUTR1bGlPWmNZMU9ja0dNQlB6dU1BalFVZ3dVWnIwT0lSUVczWkh0?=
 =?utf-8?B?dXFrOEJJWVBKVjBubkFNQ0F6amZSZkw5UmJDRVBHQThGSXgxQUlLUUt1RllM?=
 =?utf-8?B?MmNpa2NiRzhacFhhMW9sSjBTNk5zREhJU2ZVWklwL3p0UzJjRHhlTXZ5VUpy?=
 =?utf-8?B?QWU4YnNxd1lqUGszSE9vQ0c2MWJoNDdvN0thdUp4eENDaUZnbGhBM0k0bnRx?=
 =?utf-8?B?L2F1ZWZZK1duL3Q3UUxUb1B5TWtLeFVtS1A3cVYvVlJESU9JY2lIYy81Q2I1?=
 =?utf-8?B?R2lqY1JyWjY4dnZyeGdXdUlpMWdYeWxDV1NtdCtwMzhUMGlyQ3QzVnAvb2tT?=
 =?utf-8?B?TDJSZktCcTU1TlpqenF1NWhkNWxCZ2VqNFhiV2hxanp4aDNzdy9MNk1pOHRZ?=
 =?utf-8?B?TkdlTWMrOThoMEpMMzQrejlJclpkVzkwSTE1WmlnWDhkWElsWjhMM2dJZjA5?=
 =?utf-8?B?Slpoa1laVkRWRTFVbUs1SUNwcEthZ3RUOG1oZ0paNkxjQ3piaGdmZDlYQjFK?=
 =?utf-8?B?enhqeTU5QmdiclJudHp1TTNXYmJ6MkZNUlEzQkhZaUw4L3M0NU5Rek1GYmkz?=
 =?utf-8?B?bEtmZG9DWmRUTnlrOEcwWnVrZW5sdUZtTG1EWXg1MzUxL3pxUDBIRmNVYUo2?=
 =?utf-8?B?eCtHR0FRZGw5cUtDWHhMN25QYjdGejJrcVMvZnFtYUU2UkhrdE9PT3JDZ0NV?=
 =?utf-8?B?TWt2Sm8zUEN4R2NiQVV2Umw3N3RvekM4Um1SMDEvWU5oVkhVeVBUMEpMZVZ3?=
 =?utf-8?B?d2pHR0ZiM3dDRlI4TTZaeGdTbWswVlNTanZwTGxUMGxDRS8vem1oMFVYNmFk?=
 =?utf-8?B?RFFqeGtEb0FjRndKOTU3TXJPZE5tUFVCbk80YnZhcEZrNjJBK2ZXR0g0bW12?=
 =?utf-8?B?bHFTdXpGdlozbmlqOHNHUXE2blRSZERmRzhOVzZnakJZV29XazBiYk9jR2lE?=
 =?utf-8?B?cHdpdTNFVWdIVDQ5Ykh1WnRGWGJnTjNUUVlVMURBZWxVTGRjM3lYSFNuUXFP?=
 =?utf-8?B?cU9pS0dkRkpDTUlqL2MrQlJiMlBmUVFwYlpTWldhSWhWNFpGQ21hb1E2cWFH?=
 =?utf-8?B?dTAyZ2ROcW1Ubi8zQWRjeUhTMitPL2VPWlN5RGZTdzZYUEtCMXZZZXZxUG1h?=
 =?utf-8?B?THd6eUVBb25LeDVpUjFsTjhScEE0Y3lxUkNsMnBoRXN6RWJ2SEJKTHpxWGgv?=
 =?utf-8?B?OEhQa01HenhZb0VmeHRKM3NrSjJVUjR3d0dWNEhkejU2dzJxbjNQSHBtV2Y1?=
 =?utf-8?B?SzRzVHNIK0ZsMElDc3prQjQ2L2FMczFPbzNEZXZ2YVpTcENCVDlHT3JLRlZV?=
 =?utf-8?B?RmZEQ2Z3S3d4aEQvQlFOZ0ZDWE5rQnNpZ0Y4cStvajJaQTFock1YNGVwWFZH?=
 =?utf-8?B?Z3dIZGM2L2NHOERyc0ZVdlVZRWZZV0xKbWJ3UFFpazlEREl3RFB5VUNmZnNm?=
 =?utf-8?B?WlVLUUYvS1lzMm1SZ3dpY0E3a2Z3bStlM0taQWRWUnNJK2E0dFBaT3k2czha?=
 =?utf-8?B?TlNIMExrOC9BUUpUSmhxMG1obEM2bndqQm5GNDBQK3lDOG9QYUNQVmlzNkZp?=
 =?utf-8?B?cnA0ay9zQkpXRWJNREc5dUtWYmJiUnpPWkw1bE9HVjJLR2NHUnhMU0VpU3ov?=
 =?utf-8?B?dkRQcTRmYjg1a2JXajlwTkZkWnc4VTJ2cXlXUkVya0Q5d1NKZDM4WlNucHgz?=
 =?utf-8?B?Y1FjSUFIaytucEErYVFXdlBvb01EU081bGVVU1hlS1ZaNkEzb3N3SXAwcVNy?=
 =?utf-8?B?VFBzOERuejNUTEdjVHE2WUcvdFlpM0laQWorR0pHaEJML1BScWdBZjRQcFd0?=
 =?utf-8?B?ZjgxTnFRdTRIZDVFRVdLSEJVaXJIazJlS1EyT1YyRXdOWXF2aVl4dWg2Wmpy?=
 =?utf-8?Q?xSAW89OY+nkR8umaKgnh1Mm9+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246c5d0a-57f6-48ba-9861-08dbba7b1bb0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 08:16:51.3046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twXJ7l8CtjYJOfP2kTVcoRrS0jzkS2G5IvXQ2mdFOijmCQ5tHGzIB/ANCRT9vxhHm/+kA/NEtQzaKV39r3M1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
X-Proofpoint-GUID: 5uSU_k7hbzWYTxk2g5bzV35tSAGLSLQy
X-Proofpoint-ORIG-GUID: oK02vW_6tgcmlJ47qkifVfLoIcaNz45Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_06,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309210071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187978

On 9/21/23 15:06, Alexander Kanavin wrote:
> Did you verify that fail in
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5795/steps/14/logs/stdio
> does not occur?

Yes, it is caused by the update. I'll check the root cause.

Regards,
Kai

>
> Also booting sato and checking that it look ok is good to do.
>
> Alex
>
> On Thu, 21 Sept 2023 at 08:47, <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update adwaita-icon-theme from 43 to 45.0.
>>
>> * meson is used to replace autotools, then the patch is redundant
>> * not overwrite PACKAGES and split license files to ${PN}-doc
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2:
>> * not overwrite PACKAGES and split license files to ${PN}-doc
>>
>>   .../0001-Don-t-use-AC_CANONICAL_HOST.patch    | 27 -------------------
>>   ...theme_43.bb => adwaita-icon-theme_45.0.bb} | 11 ++++----
>>   2 files changed, 6 insertions(+), 32 deletions(-)
>>   delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
>>   rename meta/recipes-gnome/gnome/{adwaita-icon-theme_43.bb => adwaita-icon-theme_45.0.bb} (84%)
>>
>> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
>> deleted file mode 100644
>> index 0a1487f8e3..0000000000
>> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -From e1a12b73c25d1ad0f267b22ac5d799bc1fbd0fa4 Mon Sep 17 00:00:00 2001
>> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> -Date: Tue, 30 May 2017 14:55:49 +0300
>> -Subject: [PATCH] Don't use AC_CANONICAL_HOST
>> -
>> -This won't work when building allarch (and is only used to find out if
>> -target is windows).
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> -
>> ----
>> - configure.ac | 1 -
>> - 1 file changed, 1 deletion(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 6ddc49b..39752bb 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -3,7 +3,6 @@ AC_PREREQ(2.53)
>> -
>> - AC_INIT([adwaita-icon-theme], [43],
>> -         [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
>> --AC_CANONICAL_HOST
>> - AC_CONFIG_MACRO_DIR([m4])
>> - AC_CONFIG_SRCDIR([index.theme.in])
>> -
>> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
>> similarity index 84%
>> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
>> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
>> index 8cb4d147f1..076dc63427 100644
>> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
>> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
>> @@ -10,15 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
>>                       file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
>>                       file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
>>
>> -inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
>> +GNOMEBASEBUILDCLASS = "meson"
>> +inherit allarch gnomebase gtk-icon-cache
>>
>> -SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
>> -
>> -SRC_URI[archive.sha256sum] = "2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a65fd721e88d505f970da32ec6"
>> +SRC_URI[archive.sha256sum] = "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9d6215c623cb4e42ff1"
>>
>>   DEPENDS += "librsvg-native"
>>
>> -PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
>> +PACKAGES =+ "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires"
>>
>>   RREPLACES:${PN} = "gnome-icon-theme"
>>   RCONFLICTS:${PN} = "gnome-icon-theme"
>> @@ -37,4 +36,6 @@ FILES:${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
>>   FILES:${PN} = "${prefix}/share/icons/Adwaita/ \
>>                  ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
>>
>> +FILES:${PN}-doc = "${prefix}/share/licenses/adwaita-icon-theme"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.34.1
>>

-- 
Kai Kang
Wind River Linux


