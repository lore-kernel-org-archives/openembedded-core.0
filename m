Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B86CD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 10:14:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7003.1780049255517689401
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 03:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=en06Qg3+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Vt5G8h8t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mengshi.wu@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T69WLu562430
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 10:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1E5WlQwu4lvLsL05bOlqt3dDufjV+SxZavU3FMCfGs=; b=en06Qg3+NriZ+mVD
	4rHiMbtlsnMlWzcQpwUf+ru4SvoJN+0/ulHb/Lo3Ro3Yk9UyjWCoKWo+aHVxgN9Q
	fLp1dDCzaOSytWLcmgeCa/CNjo3a7jyEj1k043CJ1IuSVe3UBxjpcq7VqepOdxqR
	kQ2InN/vAPQE8C6x0roitmrBM38HJjjsPWALH8aQcpOBuMBuSS8ujF7aqcau5Q4L
	1TrBfNmQBydKTgUFTL5zYPMfAW0V2q6AsdaPOsQBEY4lYUNNob7ZNzhu3/D0EIC1
	VuBNwwDekQ7W0YuB0OMZr3MzcfblF7FxAQA6Yv5J7C3UHJArXMNv0KZnfvX/eKyD
	fv5FCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug2ysf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 10:07:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304efad654dso908109eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 03:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780049254; x=1780654054; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1E5WlQwu4lvLsL05bOlqt3dDufjV+SxZavU3FMCfGs=;
        b=Vt5G8h8twTwebeFixJIw5wzIeI76n+s8S9GqGCpSlYdVQyIsYJb7ES1Lj+wedAJ+Fm
         rggF5lo1DSxCzqOJnTviBXIeAdvmqnB8mwlxYv4IaFyVT8pZ9i0FplXKrYF543g/Esbb
         tz6JuN1OMTgr2SSSPYk2VHEH/Tb+My8kNWUTwWsIIC/jlHOQ6fwbDGek7AZk2MuypxIn
         2ZxCDASBttfIcG7R3/Z1iq+gTYFtvpps0qoW+ax1AVjqRQMG0AlcMtgLCTHM/l4cFa+5
         x3X3SmFSHfeBBg1ZZgcGM4OTKQdJlF+DEzeUAcfAimNr+akXLSgAoEP9pr5w4Bv3GHCt
         FoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049254; x=1780654054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1E5WlQwu4lvLsL05bOlqt3dDufjV+SxZavU3FMCfGs=;
        b=UpRXBMR6xU9SHzB/MFRK6Aqoy/lpPeIvzQ6uljSmpf/+Vf0FEsFczIpz+/EB6Sqfvo
         QTwXPQFiEiW6kHJnIEhepQZSIj4PrtnQet73XdiwkAHyfoxgBxM+EveTf6mScwCmYPNi
         foBwnW8PBDU/C9V4RP7hKn512U2uNUrgUFLr1g2ByIUSJdY5VsytbPnxCijy/qHU3xWS
         hhs/Eb3+1YefCaLjGRq9NlVrexEkGBn120/fAR7QeNLZ3UgQnUqW+jkVRT2CSMqlZaLE
         bORo6rJCf1uU9Zefi0NqjthHBgdn0SETSi3ICMUNmLOZcg8jSMmcX0rq099/edUckvzF
         +flQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZPU+HvCGu+9C3T2O939exoq7MX9/Vw33EjrGQoGpEUDdY1dkfYZ1u5bXa5z6gEDUuETndRZVUo3jDb85tr+4yQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKFlM2WKVzM0eA7/VUAOeI79RYfhGNF0N2sgRkNQ+1TZEEZQ7i
	CG9sWetJ9343qX5NtU0bi0bT3SlHj7XFJDeVMxg6dT50twp/UGWVsgqV38uJabp2LZJHbs+goZ0
	C76Pz6CsVBnWtfLK7QjeE6+vyNwBhG9l/9/K0rNZlkEZsN/IhWW/tZzSHhQMD0sj3vIzZdpWwLt
	y9GTNExsE=
X-Gm-Gg: Acq92OGXRvoDepnaQZx35OP/XJi3bSt7QM+5KKsx78uoxQ1YZqLE6pEgd7DYizOaOuq
	b0stI4tdtVd1Qx0a5HhoGPFPMx4l5LWvXbH/31M9jK4AGKtQFMx7zyTQIy+nu1/sFCCwNRNchE2
	U3/wPzMEc2TMkV1G1rNVPvu+a4TS540Yx4fQmE/12pHXAlv/IRCdq+WMfoG0f7F06sUXNykYIOT
	aqR+ywPqWE8tKebKvMgElP/qwrRggovDP97tU6gODU7qFgY7dnQx35kL97DMjPhVZWHwgt1joGq
	C0AfOqpkfaGDQxxZOn+d0xRTE/k3P4rS1frouUafMAr7OBHLH23xdk6rqz24KreCvzgr6E6HyJr
	vOKa9EwnXMgOq2wTUleMU7eH2z2b7Enj6xUR7PLIy80Xe0duHesb6ZsGQeFuuy1nQwkzauRHkhT
	Iq/iuAH1ztTKw=
X-Received: by 2002:a05:7300:a988:b0:2f5:3641:f126 with SMTP id 5a478bee46e88-304eb11c256mr1025207eec.24.1780049254220;
        Fri, 29 May 2026 03:07:34 -0700 (PDT)
X-Received: by 2002:a05:7300:a988:b0:2f5:3641:f126 with SMTP id 5a478bee46e88-304eb11c256mr1025192eec.24.1780049253678;
        Fri, 29 May 2026 03:07:33 -0700 (PDT)
Received: from [10.110.110.73] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2bdda4sm998302eec.2.2026.05.29.03.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:07:33 -0700 (PDT)
Message-ID: <66751e5d-1d57-40d6-b1c9-15689f657b06@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:07:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bluez5: add patch to fix 8.56 gatt cache issue
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: shuai.zhang@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com,
        chezhou@qti.qualcomm.com, wei.deng@oss.qualcomm.com,
        yiboz@qti.qualcomm.com, jinwang.li@oss.qualcomm.com
References: <20260521062216.3352030-1-mengshi.wu@oss.qualcomm.com>
 <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
 <DIUYUL35MIBC.28DFKH9L53KYC@bootlin.com>
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <DIUYUL35MIBC.28DFKH9L53KYC@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMCBTYWx0ZWRfX5877m+Ghb+sw
 KuXxW/CnCB8smIieD3SkxqiPk/V2jgpqHuqyutmSfGEm2lBv4pkZX4zDcV1dASf9zXz5WVcH3rC
 aGWCUMesWuSLk74Y47UaJPJXTOwksoJIU9bSto5cqyaYiLGGAyB+rx/ial7K4UgQFF986hOIhk/
 ldcJrs+vl8G3RmHuVQi2X9f6w/qXL4i6w1FhBlr9JBJlOdh8iEOIDyZsi5oDdA474B4bCh9s/fC
 w+jDPBWmvSVmGJZGTIvNXtKQ9gVnUQgr/44X7FMBVaS7Mz/Fq7KSOItc6qLrYf4m8EFTCVYLFo+
 OFYzfpY2c2n6loDiTOT9zO3a8fx6Hp7PEc3fKRyANuYAs4/V3D6gBZ7beXlZupt1aTLsz4xYyYW
 o/CdMJQiT0qq8DitnI1fvDXhzMbefl6NossvcK6CH+ZVUAKlLcI4UNTWqiNsEQkjz/VIItGgDS3
 j2Ggj9G8Mz1i6/gwOhw==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a196567 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=HpvXx_NjDNbq4ix8d8UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 4f1fiEm2UMroTHJDNKxlQCZDdjPV6ZxD
X-Proofpoint-GUID: 4f1fiEm2UMroTHJDNKxlQCZDdjPV6ZxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290100
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 10:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237747

Hi,

Thanks for kindly reminder. I have resent it.

Best regards,
Mengshi Wu

On 5/29/2026 3:01 PM, Mathieu Dubois-Briand wrote:
> On Fri May 29, 2026 at 6:06 AM CEST, Mengshi Wu via lists.openembedded.org wrote:
>> Dear maintainers,
>>
>> Please help review this patch. Sorry for bothering. Thanks
>>
>> On 5/21/2026 2:22 PM, Mengshi Wu wrote:
> 
> Hi,
> 
> This mail is not in my inbox, and it looks like it never reached the
> mailing-list:
> https://lore.kernel.org/openembedded-core/?q=bluez5%3A+add+patch+to+fix+8.56+gatt+cache+issue
> 
> Can you try to send it again?
> 
> Thanks,
> Mathieu
> 


