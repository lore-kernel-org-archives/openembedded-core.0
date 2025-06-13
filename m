Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57A7C61CE8
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 00:26:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.9558.1749774361676940630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 17:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PhIXejRH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CIWDch029603
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 00:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3mLJWseZwD2buFKKpPh7GirJ
	Ah/btnZusNKXCnpSQcU=; b=PhIXejRHQSUowhcCetDv2FjrFemA+Gue4Brf77Q3
	PcORp3jP4you2lFD13OVaZZPcRa8DGrg6ysvjX2HLNiVBg8tF0Obj/ucuDQl49sP
	v0mA5+L5kp20DbRlgpGrj2pmZVoHo069KERyMNcBnZnLh/a/s+nRDSTtFXVCPpZt
	CzcRxT9WnxK91RJpYnIIy9gZ8vt2zO1J8XXbTd9oA6VBFK3FxSjtY1TGTwQ0EiU0
	In0qjgz2+7aKk7MYW/DmKi8DhYof7j780OHqwe1Nu5i/wwRXRMmMkD5J2IquZmMk
	EzTv8gD3GovHuCYsUWw1rWxryM8MVIAPiqyjey+w0E+jYQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d12a5ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 00:26:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb1f84a448so16920836d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 17:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749774359; x=1750379159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mLJWseZwD2buFKKpPh7GirJAh/btnZusNKXCnpSQcU=;
        b=BtSdYEcGL9MPugMd2TMEzQ6f4dRiZx9BiCABzvp4iUlpohSnp064ldj7LWets6LOVu
         IKUQdK/WoEbAXlhElTzfdK1iYsRjgIVykV0JPEO0VtLJuKSwesnJ9n2+Y6VDi3+jcW+J
         394NYzrbNCSxBco6klxbDc1MavOy0h3aLQ6u3oYIW2iSlqYNZcQWwm6rOeihBkeH0zhB
         avJuOc0KBiI+H87TSoZWwx6W+TP1kXY6Did5Jj1EgBan9MkBeqIE4mHqbdOsZSHt9CHy
         Ccw1LTNQCf9PE2wj565LSoI/1o6YkCAl9XV9AlPGfwgPzwhlYgIzDCQik1pvYCsKgq15
         Gqxg==
X-Gm-Message-State: AOJu0Ywh4HWe4vSK7ehxNykYSJDYo2Gb/i22vxDPQBh5f57dvhhhgwZF
	HyMYxolOGYt2jGrKb/aDDfnpCuvBhcNQicQZn/qUe39whhoYCkDt2cic/qfqat5nr9RZmuAIWs7
	ywo8W3BFFiZ7vQ2lVjmnovEVR3ePc1SL+o9F1CMh2cEriWaRJNHiIzQspP/HWrx2aMjx/Mi8bRA
	2jPsi+YdSuWGzB1T4fNA==
X-Gm-Gg: ASbGncuuZuEMqDAQ3Oh/4gc6C6MxmE0ehkyWvlNyNphUkA0s9jaZR3eRRX9kZ9fFlDQ
	5ctn5ZJok9LT5g6NW+ntuoyK8jPT2WnNhYbYp6bHiwAipM9Mbibblo+tcYX6iRySEXNctNPsWH+
	auhD8SEiwrZwfdAEGYY8X5XbfJSobma3BEtdgbq0N1IavubogjyEomwvetFsK/Rzfmlzu8f2xlR
	DTQnCq2iYcb5ICiJ7QtQrleVY0nT26zvB9fkqkqyGV7FnL1TpVVqTcbJYpssr6RyYHBpj2VJYfC
	rMCBUtCL0uM21cEPDj64DA9+bOun4df7uN5S2Vsg0gMkZCOqKQf/Ur+SgZoO7V1JVFBgvjtVYWc
	jzZKeL3BHpSeM3PvTYi6OZAjn/UuFrLRXVOY=
X-Received: by 2002:a05:6214:2506:b0:6fa:c81a:6204 with SMTP id 6a1803df08f44-6fb3e637ac7mr14879746d6.10.1749774359096;
        Thu, 12 Jun 2025 17:25:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQqkVf7Xo+VDcy3QosWJZYaDWigGfRfXBPna4g/mvfATRMJUkxWz6LRBUxOnu3RSO7rO96IA==
X-Received: by 2002:a05:6214:2506:b0:6fa:c81a:6204 with SMTP id 6a1803df08f44-6fb3e637ac7mr14879476d6.10.1749774358650;
        Thu, 12 Jun 2025 17:25:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1aad39sm263654e87.116.2025.06.12.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 17:25:56 -0700 (PDT)
Date: Fri, 13 Jun 2025 03:25:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/2] mesa: do not build r300 AMD gallium-llvm driver if
 not requested
Message-ID: <23edupjlac3gujipvi5yaova7xfijw2pmpysj2rxcng32awbks@dgjbafshqmlh>
References: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-0-479632e13175@cherry.de>
 <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-1-479632e13175@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-1-479632e13175@cherry.de>
X-Proofpoint-GUID: INTvl02PsigZmCPzQzM1actGI0t3qQmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAwMiBTYWx0ZWRfX2YrBDuenxUbw
 8W/PH7s2OIbaEveMczeW7KN1AMdIAXx0wG69w/G3VJRF8t1Zl+dq1eD+7xIfl/pLbcBHq0NAbow
 IiBOqxozsgwrr4k+pHOdJUSZZ5s24X98drxsRze20eBYqsr+JOm6iN23Wdpiz+Gzxz9dwXymyaR
 2SStRq/QEp2812DzftyxDVNjapc/e1QP/icl+ZobrB4+w5Nv5nv+4GfseLETaKPx8nDWia6mXo0
 zqWT5hBO6JtlN6BT61W2+SSlUeUABAs0qMXvPD2nrYrVN1DkrJ8SQ1nIqhinLUiz6n3oSReS1Xp
 I5NlJ87JnkZCNc/f+zXK50a62DGHm/kc8N1yP0tqRME/8Ghcn+S5qDFjwGU5Ut0ZVesHFy5I10t
 b6IoBiQB9QtxO3BSqi9MV+erHJGT1i4d8Ai9U6/SUhXDezSHLIpwmH72nzmbwJ9uWwWnTCAI
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684b7018 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=btSJu0IwteGRy430bNAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: INTvl02PsigZmCPzQzM1actGI0t3qQmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=844 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 00:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218544

On Thu, Jun 12, 2025 at 02:14:31PM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> It doesn't make much sense to always build the r300 AMD gallium LLVM
> driver as that's HW-specific.
> 
> Instead, let's guard it with the amd PACKAGECONFIG.
> 
> This will only disable R300 for target mesa on non-x86/i686 machines
> where gallium-llvm PACKAGECONFIG is selected but not amd, otherwise
> behavior is left unchanged.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

