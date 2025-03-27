Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2371BC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:59:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.2925.1743098359417131257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 10:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=S1hj91Db;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REmrVt006080
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 17:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqaD6/EamGaYTG/TDA3dBDI6iWRybD9wyT1NuJYnq9M=; b=S1hj91DbCwCBgGKl
	HraMBCtqfeVPSiyD+MZlfOM8wnwLUEm6AD/XC8rVuiBTgEHMPE2BmNCAyl/49S8B
	Y523te9AdsBUGDR7hwOCo5xDAaXQP+4RzkRxTt2HJDKFFtx9VLjwtL62hHyY/9CB
	vbYo75BehjyIkDl05ppQkuBcg6rnisGT/XTr9RqjlsE4WaFkUlalqrhCo5Ms2rdG
	SXT0HzPs0UXB1glymZ0VrCa6EC+tpq/4YKYzYBJ+3ds6EjhMSadxa9riy/diO6+y
	wDjPLiWlapPMWVo3IEBXJjWf/XJ9KVYvCxXCxJdh6fw4qmCQTM259/c3CzkihuqS
	kEbzFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kteng98v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 17:59:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c572339444so186791785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 10:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743098357; x=1743703157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqaD6/EamGaYTG/TDA3dBDI6iWRybD9wyT1NuJYnq9M=;
        b=kguhccGycgzoUYc8BlX3kvYT7zfUnevDVvKSac4YgdSoBV6QBPXIFvjqkUvKJJgJ2H
         5yBmWJhkCGasodVnGHt3rnPPPlhDvj7gZW9g8b0dHao7mLImW9XpJBkojAMaTIAUf9hK
         ukkoCUKh4qVrN4rlhEGeydyr/h2mYRKVn8uH3wcaa/axeefgC4pTFD72jtCU5v4xE+f1
         wJGODeTLr2I8A5mWks87jr8sUU8YHO0hmU06tet+BzJgPDUvgu9QPwid77nj2YCPKjXl
         4bEaikbUoiq5ocN/nMXF3GnyLjkNmnAD2YdmYEowgcsfpmQQC52/Y8077PrIbkBSCJkk
         FMLQ==
X-Gm-Message-State: AOJu0YxsfbkNw5OIDe8um04O95s0W+O03WYx/TuGz655INrgneC05lxR
	SPdnit6Sh+6XuNIolHVEcqhXQ5w1kMA8uVDMUfUME2WoARXOPEmHhETRR+6uD/aR4ZW1uSPBusG
	Pkk+qJrOYf4SSUae1Jii2rEJI9Q88VxXbNPlJ7+KpUCpawRjuOjCYpdy2NXtaG0oKcenv28Idon
	V/0Lw=
X-Gm-Gg: ASbGncukaM+u4RYqV1H1qvpo2GBYmgoame8XXfd8LA4vcnVdqG5//Jgd6XfIM7W7g4U
	/HfPh5HMrV+k4wyfRh3GaA81r1lhoGpG57U24KU1IKSnQvTlCTcncZTOi2th2rKpMEVRDocUo8T
	f7L6A8cMz1z7opTc+kiVaTfwCmyTPSWFsUzlyrTd7JS7TslrC99JvZoR8MLVmaCHxPD6qq6lP81
	cC3SDFmio4Cc157m0FoE7KHGu/ZWnr39l8vuLKJIlaCdxf5zoWt+zCdOLPH5CuTsTdjPghLM3UE
	y7bEvG8XGu3YW/OcIQIXxGV/GNS64mivcsWNkxWceeL7M3Oufxp7uigId7vMUT2NzCt3aC6CRIV
	TBenmuAYvWiJ49AWCafeRqKD+Lm+STLej34hTDLN6m+cTNwTj9uQGJ9S86maF+k71
X-Received: by 2002:a05:620a:1924:b0:7c5:5e6b:4626 with SMTP id af79cd13be357-7c5eda0e57cmr632150885a.32.1743098357568;
        Thu, 27 Mar 2025 10:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbMF9maCp2Q0oxXzDBmoSXaD8nlV6LMfFNJMqVLa60bV9IGJl90asGvTD+xZ3gVri4f60Trw==
X-Received: by 2002:a05:620a:1924:b0:7c5:5e6b:4626 with SMTP id af79cd13be357-7c5eda0e57cmr632146685a.32.1743098357081;
        Thu, 27 Mar 2025 10:59:17 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:ffd6:501:5ae1:b167:ae27? (2001-14bb-ac-ffd6-501-5ae1-b167-ae27.rev.dnainternet.fi. [2001:14bb:ac:ffd6:501:5ae1:b167:ae27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590f43sm31804e87.177.2025.03.27.10.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 10:59:15 -0700 (PDT)
Message-ID: <60696331-0cb0-4239-8c04-7e73286135b3@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/8] mesa: upgrade to 25.0.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
 <CANNYZj-MktGQNmmejNBici+8wjPWRCZJfLCYV0T+2ETrBWEArw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CANNYZj-MktGQNmmejNBici+8wjPWRCZJfLCYV0T+2ETrBWEArw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e591f6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=P2wpbjDa7nUQnezw9Z0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Q_MBDKUMBtgVJcPNTU1BiCUenpv3FDYa
X-Proofpoint-ORIG-GUID: Q_MBDKUMBtgVJcPNTU1BiCUenpv3FDYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=849
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 17:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213774

On 27/03/2025 19:54, Alexander Kanavin wrote:
> On Thu, 27 Mar 2025 at 15:20, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
>> I think this approach provides a good balance between OE-Core being
>> stuck with the outdated Mesa release and being able to upgrade it,
>> bringing support for new hardware.
> 
> I like the approach, but I don't particularly like the volume and
> amount of 'Inappropriate' patches this set brings in. This will
> complicate future maintenance, and particularly version updates.
> 
> In addition to what Ross said, can you see what can be reworked for
> upstream submission, and what can be at least reported to upstream?

I have reworked the patch to use prefix+libdir instead of 
LLVM_LIBRARY_DIR, but I'll investigate if we can drop that completely in 
favour of reporting a correct libdir from llvm-config script.

Other than that, I'll ping Karol regarding the bindgen invocation hacks.

-- 
With best wishes
Dmitry

