Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6674CD6E50
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 14:35:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11619.1780065099938079742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 07:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PckDn1h9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=D7EXSjGF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mengshi.wu@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDaS421279413
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 14:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFYGNtbWjshwhOFLNCHs0EwwpszwiDtxwBLqfxQEgXk=; b=PckDn1h9Bw6ABHwf
	P0uxeHuhdxGZTGYoJQwuLK1iCnMQ8wiGAS06kPlgxWsz+x8EZ3OTHbpihCkV9HIa
	QAgH+6lLMrga5jsHLpzvnbdIG4jTxYZ3+CppQL0uE9zBJ0p40+anX10Ttz5vjMXP
	G0vA6muOjQnWbc+CZIfw59fWD7j9Qex9+5tn07GkNS2rhjrKOJuI/9CBHNMuDbra
	MZsduERuUuKmemL06xAtVdrs2QFQMah4XPz/rgH5JV9zqyxZw+VWcSdfwxNja7zk
	FhmzNdxPuXdD4c6MPf29LOiVqkUQcMao5k0WznrLt9xS4PcUMyNaBqdMvY2n6qXY
	msrW3g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu507rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 14:31:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13709ab38a8so6532472c88.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065099; x=1780669899; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFYGNtbWjshwhOFLNCHs0EwwpszwiDtxwBLqfxQEgXk=;
        b=D7EXSjGFbKkuDrWW3MeqR7a4gpF9Z/WhrMstH9Vui1xNXaNcE8zzjDPn0PQK/AFNLq
         pEXknn2VS6Qu1bDewlrml/aQ41jxt7C7h5ZhEPdf3KYcLkmeTPuTPFV7Sv0CY4lcHovX
         v0qiiZACefLSQTwWD8/PO4PgWr4ynGxEz13Sw3YHCxaUgfFsOOruYL8jz5wlP0WXo/3C
         TkcLL8fMuWKv6mt8Rp5NdLFq/iIhIgMswexsDgsM9D7E0t+1kCxTTIkwsf6yoCK+WaUe
         EFOXCvC59jIBZ8lf/lIbuVzp5hRoJLJVypPhcsDNwyeyiebSULmLCuObUGqABWp1GxK3
         qKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065099; x=1780669899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFYGNtbWjshwhOFLNCHs0EwwpszwiDtxwBLqfxQEgXk=;
        b=OTHT1m/Eu8mbRN8UEJHwWcxxYJ9asONUGWLtX0h/deKL0Ek5NjBiZ6iXDuSnFo9a/h
         iovWLvAUVSKcBR7BcZ5D3oKG7BcejpoimHYbu+i9queS/V1/UeQVUlic88gpz550Qesh
         4uNUD23oM3xe2jgg4d+PUJh59n5d3jnPtgOz31k+2Ib78WA7EICcYJoH47X+3HVtSXQs
         bb2P5dFTXlZEeD7w7U7TgqO3Ds4vVpJMK8pSnmugIKmEYDlDi+IWWFTedIJBahIskPaO
         cGpdc+wDtX6sLC893vivV+1iOhfSBrKuCvSFxarNR0fQIfa56D/xo5unD/cJ/ms8yJuy
         /2yw==
X-Forwarded-Encrypted: i=1; AFNElJ8mgwygB/CUS/o7LOkrfXTq4GpkX/MRD1mK7AHHXIZ+9FzaxYXI/EMNH61x+gUGf9EEblQ6AyVm8EfBdwGaFYgPiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxILigLjtCu+rHBmcIpewmMKsA6G8WGsz31K+A2PQhl2TKckZGj
	R/4EGM9hmu20lHKMOqIzx2fyXzsUX9JcBLohno4Z9MgcKINUOTM61kwFVXNBtrIM8mNOCPk3ew+
	PdsyGv8l7RBUo7ZCwiJTRqFtCukp5KPkKqONk5zUuXPFL/3I1R3ubWJD0edFms1wyJmzTmGe+fF
	GNP/tZHFA=
X-Gm-Gg: Acq92OELSSYSU1RcHIXTMKwqARVoVfmqnhxQACJYQYSShaz+nSCaDHe9hWG6Mlth8l6
	Y4yAjIm9LsBqZfXy7iNGqkh9p0n+s7CY9OAODq8mT0CL4wxMUKTvPQieWEst+Tp9fi6X6fOYDXq
	drHeLcK227TltUMhQS8uLJQ7Lp3n+Cju1M6SYq0DL18Kud7NiD3S75IaKIh+TaYXzk2oz3veMeo
	MTBF2pSfoFs6Y7Q7mumpJUstdewFMrgTapHA+d6pKSdQwdGnYQowmdB1KoysC5W7CEFBCv/MgPh
	cTP20Jq8v3q6MC7GucACwrD8Hc7IUB85LxagoRMrtEIDHyedl9xlIHC5UPUmmQHNpL+TRC2T1V0
	HYgsOJzQMxxP8kX5LqlDjMmy0ateoibwlxxs+YqZIZxGmcJYXPvTm1dHbc1Xui9T9DV9Hq5/Maz
	2KVdsU6SsK3A==
X-Received: by 2002:a05:7022:eca:b0:12b:f8d6:d4bc with SMTP id a92af1059eb24-137aeee7b7bmr1238453c88.34.1780065098555;
        Fri, 29 May 2026 07:31:38 -0700 (PDT)
X-Received: by 2002:a05:7022:eca:b0:12b:f8d6:d4bc with SMTP id a92af1059eb24-137aeee7b7bmr1238432c88.34.1780065097855;
        Fri, 29 May 2026 07:31:37 -0700 (PDT)
Received: from [10.110.63.66] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b35a6cf0sm1222267c88.3.2026.05.29.07.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:31:37 -0700 (PDT)
Message-ID: <6cfec67a-0361-4306-82f5-3fc8521c5951@oss.qualcomm.com>
Date: Fri, 29 May 2026 22:31:32 +0800
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
 <66751e5d-1d57-40d6-b1c9-15689f657b06@oss.qualcomm.com>
 <5cf7128c-1c12-4cd8-8405-d99b8bfa5de2@oss.qualcomm.com>
 <DIV83KFSNYA3.7KIHEGXISPD7@bootlin.com>
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <DIV83KFSNYA3.7KIHEGXISPD7@bootlin.com>
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a19a34b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=2UdK7sJmaZ-p2ky7I00A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=vr4QvYf-bLy2KjpDp97w:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: OjUny8_GIHNkqj9iPnJ_vxxgi_A-HeXm
X-Proofpoint-ORIG-GUID: OjUny8_GIHNkqj9iPnJ_vxxgi_A-HeXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfXwJqG3AQ7uLdq
 kHobfh2nyJkM6qdfqfTRBZJx6I65iGScPF0L2XqjtQTTuDY6ecNaGCIs5zYJkEDWTTHTshrjVsd
 osNQ/xnAgYos4V/wznaEtWB+4vn0JdkdjSYc2eUyKhFm++BasFavYVl+p/T7IrIkKOx9rCn3+II
 8hnIOsQj9PLRT9rZDU7OMAj+yh3zAQME0UqPuSY2N2JzwyTkNJHC5OZtPIuiM4vqQ+Y4l97lZVl
 oLKqYrQTZiiyseSM7R4G0xMP7IFwqB6qm8yG9xgmnIO3Ri5vA12MoI4653+fvfFbty4+KHaZeD2
 /2N/H9ko0CYxKDlAMgtA/iiZXis6MvLFUKLAw0e76WBy7YBC2FbHNkEC7XG3SI+VS3C+oxdt7If
 aGZUBN/Sya2V4wPzVTxSpArp19SkfKO8p3musCDvHSX0bzUjd3QXMNRvzytPjyLBDJi4QC0bDeK
 JKtL3Kr4ZDciSzoXd1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 14:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237758

OK, Thanks!

On 5/29/2026 10:16 PM, Mathieu Dubois-Briand wrote:
> On Fri May 29, 2026 at 2:34 PM CEST, Mengshi Wu wrote:
>> Hi,
>>
>> It seems that all the patches I sent are blocked by the upstream email server.
>>
>> ----- The following addresses had permanent fatal errors ----- <openembedded-core@lists.openembedded.org>
>> (reason: 500 This message has been flagged as spam.)
>>
>> Best regards,
>> Mengshi Wu
>>
> 
> You can send a mail to the helpdesk: helpdesk@yoctoproject.org. Michael
> might be able to help you on this point.
> 
> Thanks,
> Mathieu
> 


