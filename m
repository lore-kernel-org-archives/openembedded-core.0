Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E678C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 12:50:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7318.1743598238812713750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 05:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aJowBN3f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326A9wU008471
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 12:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hbw1Z73fDJL0+MFI8GHuBLSYvtEi+aKlRLtGhBsFHBA=; b=aJowBN3fFL/fI9rN
	/ZF5Q9brzjeX4A5rVIKY/Sj2za6qwLWrfe6gwxYcaAyy4jnVRHSQlPM4B7WqI4ut
	vqSjHWTec/9mKlkMHWj/m9B9IyrSS74IN3pc1Ido1q5/2VSf7tEPlB1WrJzDjV7J
	URDfCCr0SuzEYH8mrTS+qHCLoll0AZnw+McMDhUS/KSOlmy/IUWURCFFCyLunsxH
	5VN0e0ub4K24G/996l+GXpIe4aGCohCtVNDLRBIaywlE3j+n+4PFFCk6RcEvxd8y
	H8VAQT2Js67fnxnT1cSXmpnpAbPw+1KNF4GUGCOsLC+V2vxItyJ956McOhkHAHab
	aHuMKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnnvd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 12:50:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c8f8ab79so989187685a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 05:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598237; x=1744203037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hbw1Z73fDJL0+MFI8GHuBLSYvtEi+aKlRLtGhBsFHBA=;
        b=W3zmejr7EvOYBDzSMr88CQNi2YdPohIHNOGzWtd+fmJ9Buua0K44uQ5R+pN2Q5rrhU
         LeoEP+3ihIyeueYtWRftVf7Ovi8aXLU2olZ95O1ny8kxTN/gRTYCpLPExP+bsWSTY9tp
         qt1xGvUgqEVdN7gtV67yNI4ymkph3ajcuLc1gJL7iyoO2VdE6GxrN3SUMLsoHLwN8G7g
         WyE10zz0QATfKkqufOuC8Zs9dWPy+dmL4JRAmTbrr6Ur8N95wGxmXRsZOIRDwEfOBk1D
         3RAm+FhVuSBZbD9+ZIAcaKdjsXUNzGOW64pipQgMutGC/aDXWi9KvhRG/fzDtqlaovTk
         Kvew==
X-Gm-Message-State: AOJu0YzFlyQctfv+EGqHMUZBWIXLn5AqMsRdAI1P8v+sn8aChc2IyUAV
	BjF27MdjdiKscAeyBONvK4bUn4DhGVQJhKL1kcGrSqKUt864jYJ4Dd1oUr+Usz9VzDdR8d9Hjfe
	EMVbfFadgiFptuhHZ5nQhT/ke9sij1bPRCJH8kqPMTqFPwDib7G3gaNP3Z4vy8Mu6fhBV9bkTeA
	Oj8xw=
X-Gm-Gg: ASbGncst5yU2zKdDbPorV9Uhw2fUj+FVJqT4hvrEA+FxfwnPFp6meMXrFyAHLKByb2n
	XdsTEED4tRBh/qCAESzWjzpsT7/eYhjj3Lh2SZ4TqthchS8Md4HWBWTE7w6TOF+VbMLUsunWd3M
	jhwW5NFVOzKAzE5gqPFNFkPcfSmLOPIRVn/DqFXE8s48vRxsNQcZjTPKGmVHQjJPV57XE2DEhkx
	H7Ttc8VqehjxWGiUkQhBmpFVtnxRWizq8X9cZ0Lb4RZoYnHfP9XvJPfF2uEL5OXLwj8fpTsFSxn
	XS40aSQetDVG1Vfv58FUJg++TcckOZSv3wMZpGeOQcVBR+g2PgCcPlMu2ki31RZfhIcmTaxlJba
	eh7zItQEh+yb6m64rtg==
X-Received: by 2002:a05:620a:4485:b0:7c5:a249:901b with SMTP id af79cd13be357-7c7664efa48mr349580785a.49.1743598236823;
        Wed, 02 Apr 2025 05:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsHmC6rzKbARAYCGVMNN41bAQo1vfUIM1XuCHBYJocL+o527lV5hIGQNc+2Y5fXw75X5nYlQ==
X-Received: by 2002:a05:620a:4485:b0:7c5:a249:901b with SMTP id af79cd13be357-7c7664efa48mr349578085a.49.1743598236436;
        Wed, 02 Apr 2025 05:50:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0ef951e6sm1359374e87.138.2025.04.02.05.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:50:35 -0700 (PDT)
Message-ID: <1eb53d83-b260-4c9e-823f-c54d6fb38dfc@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 15:50:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
        =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
 <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
 <8d4b0884-985f-4e81-a3d3-03a1abb91e73@oss.qualcomm.com>
 <CANNYZj_aEritSc0Te9hWR+OZVQ1DDFY0b4A0Q0H148L5YjEKcw@mail.gmail.com>
 <0926082a-b09e-4d8d-8199-671823db87bd@oss.qualcomm.com>
 <D8VYG3D9S5MK.1G3JUTQ3QIFF2@bootlin.com>
 <CANNYZj8WSiADaBNgiZuO3f1XxxNb_nyCfoPe1O3y7x3CF37UNg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CANNYZj8WSiADaBNgiZuO3f1XxxNb_nyCfoPe1O3y7x3CF37UNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GwNVGtdAq7DbcdNoFW0y1-jRR2hJ2YAK
X-Proofpoint-ORIG-GUID: GwNVGtdAq7DbcdNoFW0y1-jRR2hJ2YAK
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67ed329d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=s4_vylfmw5V6YJEsev4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 12:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214263

On 02/04/2025 10:56, Alexander Kanavin wrote:
> On Wed, 2 Apr 2025 at 08:55, Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
>   >
>>> It's really strange as my build host is Debian 12. And it's even more
>>> strange as mesa-clc was built few lines above (16406).
>>
>> Ok, I will try to play a bit with it today, let's see if I can reproduce
>> easily.
> 
> I took v4, and ran 'bitbake mesa-native' on the exact build host
> (debian-12-vk-1) where it happened, and it built without issues.
> mesa_clc is built and used in build logs.
> 
> If this happens again, we should take care to preserve the failing
> build directory, so it can be inspected post-mortem. 'Not found' error
> can be misleading: it may mean there's a problem with one of the
> libraries, or the executable is somehow in an incorrect format, etc.

Okay, I was able to reproduce the issue. It happens when the llvm-native 
was built with a different build-dir as the current build, because then 
the other build-dir (which might not exist ATM) crawls into llvm-config 
--ldflags.

For example, I caught this while doing builds in build-test, while the 
sstate-cache contained llvm-native build from the build-test-st (from 
selftests builds).

-- 
With best wishes
Dmitry

