Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D27EC369B5
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 08:58:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.15485.1744707498727722684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 01:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=UddN697w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tDAw019556
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7R7Zo+IVhX8sZgBo77vEdbhuk5d55Ht3IzFjTXwqfM=; b=UddN697wLSlI+i9d
	XXoJJ1SMRzqaBuu1YvA532SM/OM/01wTjuBqkmd0y4EZ8D6CdcmO8vfffC7i2Tfx
	xe3tuNG14g6sD62jV7GRY+wbydn4WV3fZf/GA1bVJjMIVavvQsY+aU0+oiLOT8IK
	yrBWQDpkX0DJPHbvqzr4O7Rt3YPNmH+EaB7BkU9TRAJZg9YoHfKM84djIwOMsPPE
	3zKam4j1XS1e3/7zh3BJm0oqamZ6abT9ztNPcYqprItlzz9ZXq9Y6rSY4+CaMvEA
	D0rYnaSGD2CvsUCTAOIktCSDAxEqzcCrMR0sS0fC3fs+pLH8NK9yHxkHpA0etCex
	Q+YlSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcy9ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:58:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so873828685a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 01:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707496; x=1745312296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7R7Zo+IVhX8sZgBo77vEdbhuk5d55Ht3IzFjTXwqfM=;
        b=p1IoREglFW5SafPiCm4VE6btORWCXXA2Et486wmX+aSheEORmRh8Eie4kGpeKyhHrp
         5/Cw2aJmnvOG2OdQuvjiT54qxWEmEBRvT7N69L7Zgzl5044s/iqVJavnyRjwFMfj7zoy
         WGq3tx7cimvxBYc1G3dDZDeGZY5TUDZodxty5cjT9m6h4/Nsuo971kFr7+r3ujncTRe3
         MgzUNUryY9QNqti0Qa0lJJmU5PgcJkKKz3C9LwIqh/LlK30pg4CosvzcWv9rORZTYlHu
         lmte0XFAq5O4f8eldPNqlmp+8tEIc9zmloA0r+NEqBSo9EBDXJE+gLE2zWVIvxFcpWKQ
         MJaw==
X-Gm-Message-State: AOJu0Ywd6ZelqaJKgzt4ydZTQzQGPHxjg2PpKzFOgPOY+CkU6jYCaSvl
	VXce0TLYvmfCOyUxGeyGNXyrbKbsbI4SQWeepKWXzlurNOaYhDUE3e99hSjjfc8L/nb/Hvw428v
	RdXLX/iNPk/wDtG57RETt8E0HYGKd8qWbXwqJci8PPFw965Rz79LM9H5VQTZITCQ1YqifLiT/55
	K3l/A=
X-Gm-Gg: ASbGncsAD8ujDE1BsE3fqakkXZVEX+9BQRM6dW3BTKolbwZf/olRYhOBsWfOrjqRuj4
	SO7Jc3gP7JkZVWB2jGvCo1zDgNtjzXpbOivQt11VaVAB+5GQVblOQW8MnBW2heMnQ1nG9gagfTu
	aXZx8mBk8bZaqwu96tGoflyx4rF5IctEJxUiSWD9fluTrOtYATdsouM1/R7QwcB04beB71nIJA7
	p5sVjt7EvD0Klj/TuOaEj5YmOCjivnnrKPTlGoWL/F5SUQKkM0xUybKWdc7nUPBClfaNMyU3DP5
	+RgwuMTK9QdMxlFLgHW/rM6uHUFtXyuYErLqilOPRqLzCzFfDoFMveyQIO2HHd5QnbUpndp4WH2
	KI76uV6NG7RR+4MPYxa57hFH4ZNkcus91qZMsuSdX1uQVJjS1t/tWSIA6cc5R
X-Received: by 2002:a05:620a:4485:b0:7c5:94b2:99da with SMTP id af79cd13be357-7c7af0e0f76mr1860290585a.28.1744707496664;
        Tue, 15 Apr 2025 01:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4QrYx3qpGzA9SUjsqrPRlcxcrdZTneAlzHq4zn8FqJPWehjyaF5aymTT2iw8Q6D7NmZZObA==
X-Received: by 2002:a05:620a:4485:b0:7c5:94b2:99da with SMTP id af79cd13be357-7c7af0e0f76mr1860289285a.28.1744707496294;
        Tue, 15 Apr 2025 01:58:16 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50fb8dsm1344698e87.164.2025.04.15.01.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 01:58:15 -0700 (PDT)
Message-ID: <a87cd617-78c7-47a2-ad64-747432a1e59a@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:58:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: add hook to prepare binaries before
 copying
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Koen Kooi <koen.kooi@oss.qualcomm.com>
References: <20250409221851.1005988-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAJdd5Ga=iKtV7KE0mYTTdWW5XsXgaa3ct+tBg=80azzYV7uNNQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAJdd5Ga=iKtV7KE0mYTTdWW5XsXgaa3ct+tBg=80azzYV7uNNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe1faa cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=GZ1xCM7SaMq-4SCVwDwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: cR40wjMvVtgvLSy4l4GubE7IHBt00COI
X-Proofpoint-ORIG-GUID: cR40wjMvVtgvLSy4l4GubE7IHBt00COI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=970 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150061
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53F8tDAw019556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214830

On 14/04/2025 20:00, Joshua Watt wrote:
> On Wed, Apr 9, 2025 at 4:18=E2=80=AFPM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> BSP layers might need to perform additional steps on the U-Boot binary=
,
>> which are not a part of the oe_runmake invocation. For example, the
>> binary might need to be signed or converted to the Android boot image.
>>
>> In order to let BSP recipes to perform such tasks without duplicating
>> u-boot.inc functions, add a special hook to be called before
>> uboot_compile_config_copy_binary().
>>
>> Note: it is of course possible to push necessary steps into
>> uboot_compile_config_copy_binary() itself, but it doesn't look as clea=
n
>> as just adding a hook.
>=20
> It's unclear why a _prepare is necessary, when it passes the exact
> same argument to _copy, and _copy is only one line (so you could do
> the same thing by making your _copy contain what you want in _prepare
> and the one `cp` line from _copy)
>=20
> Is there some distinct advantage to _prepare, beyond allowing keeping
> the one line default _copy?

Well. It makes a distinction logical: first you build something, then=20
you copy it. Also, if we prepend the copy hook, we also need to parse=20
the arguments, which then get parsed again, so the code looks untidy.

 From my POV it's just a matter of preference and I'd be happy to follow=20
any maintainer's decision on this topic.

>=20
>>
>> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   meta/recipes-bsp/u-boot/u-boot.inc | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-b=
oot/u-boot.inc
>> index 9464736b8418..fe86ba0ad011 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -81,6 +81,7 @@ uboot_compile_config () {
>>       for binary in ${UBOOT_BINARIES}; do
>>           k=3D$(expr $k + 1);
>>           if [ $k -eq $i ]; then
>> +            uboot_compile_config_prepare_binary $config $type $binary
>>               uboot_compile_config_copy_binary $config $type $binary
>>           fi
>>       done
>> @@ -93,6 +94,13 @@ uboot_compile_config () {
>>       fi
>>   }
>>
>> +# Do nothing by default, this is a hook to be extended by BSP recipes
>> +uboot_compile_config_prepare_binary () {
>> +    config=3D$1
>> +    type=3D$2
>> +    binary=3D$3
>> +}
>> +
>>   uboot_compile_config_copy_binary () {
>>       config=3D$1
>>       type=3D$2
>> --
>> 2.47.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#214598): https://lists.openembedded.org/g/openembe=
dded-core/message/214598
>> Mute This Topic: https://lists.openembedded.org/mt/112181580/3616693
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[JPEWhacker@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
With best wishes
Dmitry

