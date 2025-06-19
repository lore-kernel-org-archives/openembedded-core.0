Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E35C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 10:31:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.11422.1750329084949837508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 03:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=k2XM9cwM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J6bKCN003269
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 10:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TeD1Z3fw02GF1Wizy4mjCAZU/KYYhgkn3TEruiLeHgA=; b=k2XM9cwMmomwsRjO
	effTQHhpqzwD0Vfu9GuNMskCbt6+tT15e2HO5OmPAVDpfu5hFwTZpdTdO3KbTr3W
	wW+tTPOjBqvQoNB7cVGyFIT55LPiZNjgPoySd53fTc+//OAU/PGODXehJdiZZBFW
	frWgsUv4dHEIhREXlC1rPkknezU9KbzG2UYIJMHvAQ7F5IjyGqWP1pWz3rvLvKW4
	Uv4nA09hCzZfi/78OEYWoa4xQr6SZWkXOCntzoYAjCbJz7wGJaOOj1MrbL9vrnNZ
	4ohlD+fxV96747m01t4b/rYDpXOgkcl1f9hh0ZAvdUr58HwOF4taw7i19Y5ZEvSG
	xE4xtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag23bkx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 10:31:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399070cecso132324885a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 03:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750329083; x=1750933883;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeD1Z3fw02GF1Wizy4mjCAZU/KYYhgkn3TEruiLeHgA=;
        b=cjsj7B1NrHJP5V8sRpJmR0qmJyU2EKpcm+qu5616cErotEgqoKtkCnAXYCXE8oU1iV
         21yE5B5Yj51HdL0/yD8yuuThNtv5jzF8xW7abk5nANUUGDSsTGafjfFvGo1DcSh0UD/8
         SQTby51HNPIBFWbM0gH4846TRd68uqIb66MLny97TQ3dmUMqeQmFLNEy4WO5Hg8OOMnH
         9Jf1SNqRiFeV2oiw0zzMEGzOMlbDYv2XU6DahJGLzMw00jVhRGGTQ5HLw0vXG19CtTSC
         aGb2XxWPVMW67/Br2NsZSndqBdaYX35i7vBe4J2KDyW7WGGYpvV/AjvUVE6pG+yNZE5I
         HRQg==
X-Gm-Message-State: AOJu0Yx3W/X0beLKa5CP19TKfsDx4cxRIM72lWGGBU6NBNk67jadzVBR
	bAkFFkAXVrqXr3SRQ/ayO72X3lKrr/Tf1w5JLguC4YuOPs6th4Ri1CHKZ66Wgy/EtOcY8RA8oYW
	hpUEd/GjPKej85hplF5BjieIMcg7RHJiR5Iln8tYx3i2lpmbFZH0n5MgoCWTzHtJ/jOu06EVvea
	fwzhoTy5t5E0BaLk89cMfz
X-Gm-Gg: ASbGnctJ3TpiGARIjqrsllpPsfZaJkc6jH0x4MkLzVhh2bMPxmAHJdJY6CC1hggF0bD
	5HpxtW75ZQhy4Udt0SloWDSKF4f44yLyl9sHWebUxibxLYaHbAD5HeVY2P0FQXWdPeS7nrdEB81
	qRxzHbdYzRqUOgBz0mgKuk5XUaXCjtE2JQuyGbkhqcmzOQpBTKjRLdPb/Z9wQUHsxbFGEbuGiGq
	xx2Y+VFMqOwMzE9oa7F6CqqNqiTSMH/Cl3sVis3Ijodi7EHqitzufojlRGzAcjBEJnjij6fJ/Oy
	l/R1xXQgbms1Z7XZXebaJduEp7WcyuSvQXWyhLkbiw==
X-Received: by 2002:a05:620a:3199:b0:7d2:27ff:2133 with SMTP id af79cd13be357-7d3c6c090c0mr3002707285a.1.1750329082923;
        Thu, 19 Jun 2025 03:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVY+PaP0g8jIzitU+J0qQ3sAPZTYbITjs3WXqmBpAdQhO3AH6E/iMEGYly6kq+r5UgXHLJ6Q==
X-Received: by 2002:a05:620a:3199:b0:7d2:27ff:2133 with SMTP id af79cd13be357-7d3c6c090c0mr3002703585a.1.1750329082387;
        Thu, 19 Jun 2025 03:31:22 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c60f1sm1213169366b.60.2025.06.19.03.31.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 03:31:21 -0700 (PDT)
Message-ID: <35d83c74-b6fc-43cb-89f1-7d7aa48294c7@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 13:31:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] fixup! libglvnd: migrate from meta-oe
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250618212055.1529969-8-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250618212055.1529969-8-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xw4ObSMzmvt1HMjB-kiLB_f6ijwOhart
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6853e6fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Kch52H_EZlXUohy0w54A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA4OCBTYWx0ZWRfX2LqjhpTq8ltj
 RpcV0ykGIO6bEBrkXPUXmgrsfYwAnPS7GFJFI9wc6oyU7JDi6p4BMkx332/+2FTuSvVRH1X5MH/
 UL2QdW0qkJYzCusEy1tueToz2bUyULOtW4AzcLToLdLOL3keF84d0SU/MpwHTg7BK+t+0XLVJtN
 IKtmDfl71Tw0Rothh24N+3ij9XZgPeT2al/tVU/Qswr8JQQT8apats9fVVRqGlXlaJErkaq/nBx
 ZZDEXq7lu+cY7tYH+5CAEC1AT3mHcgtvBtbBg0skKEy3uc3sEC6V472Fy/rr75udDBzpTJCRWo/
 VyzKUx4dwajeayzhfrB0mCAqYf7zKybN91aVCqtN/FWzvUfPtNR5wt7sERnvvLWtvERhmvevN8k
 CRvB1si7cJfrec9xr/yHbNcnq928+mxKaFao/wEZvH2XhB/be6er7wTpqDcAsbr5Fi3hXNf/
X-Proofpoint-GUID: xw4ObSMzmvt1HMjB-kiLB_f6ijwOhart
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=595 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 10:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219065

On 19/06/2025 00:20, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Ouch, This should have been squashed into the earlier patch. I got 
distracted and forgot about it...

> ---
>   meta/lib/oeqa/selftest/cases/distrodata.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
> index 1e88ea82e6a8..f2c6124d704f 100644
> --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> @@ -56,7 +56,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
>   
>           def is_maintainer_exception(entry):
>               exceptions = ["musl", "newlib", "picolibc", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
> -                          "cve-update-nvd2-native", "barebox"]
> +                          "cve-update-nvd2-native", "barebox", "libglvnd"]
>               for i in exceptions:
>                    if i in entry:
>                        return True


-- 
With best wishes
Dmitry

