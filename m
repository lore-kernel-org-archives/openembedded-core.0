Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F89ACFD2F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 01:34:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6941.1764293689152157720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 17:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ak+I8+Fg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GdjTEun1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA6t0b3840313
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kt+Ls4eiXxav+0mTM5wmGa7sBIMLdRACOf8y68pAE0w=; b=ak+I8+FgRjdZsbGD
	abmz5BiO8GsLGFY8vSNBFlDCN/cWUJQWFRJ2JSJ/bElQstv+zdmP7qNs26MF44rS
	5+G1kTH2as46Xhp4Jm/YvAA7aClO3Z2DJADmDOyOilETq+9faNkc9AkcpUZV/HsY
	ZAOWWeMwyUFGZj2L2eSAjg5aw+BH+efKr/ZRL0e5Td3e035v/Ps7n5DSfIoAVKe9
	zze4d4lal6miyZl3bQWFuHSf8EMDgH9bHPevhg6zVYDSoU3ZuMMZEwAuZ7osqicF
	oxq6jpVHrpdheStwdVGXFEScYGN119JE3FE4i9lwehS6Yu/BLA2FC6twRuKfXLJE
	Z/Gepg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj0b1h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:34:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29845b18d1aso24009565ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764293687; x=1764898487; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kt+Ls4eiXxav+0mTM5wmGa7sBIMLdRACOf8y68pAE0w=;
        b=GdjTEun1z0Ny2ww9C5qB8tAU9J4WTRDGr4hVlAJW52UIHWd9AVLWWe8A2ho9/Z3+es
         pavqvqvom/zNYZL0Fo1jIy8fnD2WpksDzzzW4jBkc/r2e+xpb3nJxjHk+FHi56kWyHci
         wtUmgaMKmhumjfmkN8bUq6jnpAtNMTi3F+FOKNDfd/SYU3ZjSlLQEo71hh5l/IIOLuvg
         UFj54GqwPckNuI8yoGPGnbilrNotlo4cmzx89b3w0O1CBDFeO8x4IPckXNk/nEVprpSw
         TeVIcIVtdc89wOPKYX10oV0NaGnAf73q/EW9TNdHfNC7VSFDM++eQbT6skN2C8o99cqf
         jOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293687; x=1764898487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kt+Ls4eiXxav+0mTM5wmGa7sBIMLdRACOf8y68pAE0w=;
        b=k5yjRX89rE8SM61ovejcEVodOHneErLofMtjZ/3uWbEnRvXwXDDHh+IwbPkiCHrYxg
         0MQavzdZaHHtM4HMIOTraELhVeRHKpbu40K5NOMogkJViywkcSCTM9af+ZfieE7IiWhO
         v9QgM4OBqC0MaNgbN8Tq+vEEmIRoI6vHlp+9ZXp25fHPAckPfMkW357Vt6bSBUtjHH96
         Eqa4Vxud3zH6E9r61crdUsPk9f7HIiA55Dr3lI4ghgQ8ui6xQHhHznTc45ZIlXbx+I9m
         uz+HJRvJF/3r2pCtWzkr+JOzLm1piPHgMk9+z7rBzhqEJVMs72/VL4mSAQaAh3k+S5qg
         Cl8Q==
X-Gm-Message-State: AOJu0Yw9WwpRuVQgNt6TX90qNtu46DOjNIOxOVBbf/8yQibT/UntQZ4H
	CSPPQTpBQPMtiZ3dqxhJNeyip3vrErmF3DGVLbLohTbzrgpTJOiANMtAsJJ+9EccLU6Y0rJWX/M
	AvRCiXXHsX0QuKPpeGkysl6KTh8C/7sw2OaiUES4UcDbbZ5eSYmn1HlUGjTmd4BpTgN9OUyuP/T
	sDJVoD8NM=
X-Gm-Gg: ASbGncttw+sqyjwTHQzXc4f3whC1+uecLxKSzwhfipZMBOTcTHrkBoO/JXtXWToTFI/
	0WF+9bM71eOM1HXFySY0w1seGHH/fSYzybEy6FGTKjNYuPOBy5QMUxShXVcrVC1DJoMcP3m/7Ym
	6fNVatV7Suw8gNvqMXd02wCnEFely/4/4RMHoS3kwTmDlgao6JP3Xdp3tzRNXedVPnl/R4fP8e6
	wuNhErHdwY9K2QYOW5Upzd7vfarrxSp7+f0LaB5A50W+HWtTv372QwLVZbGisN5+d9enOBqs+4A
	8p3utfM1+sEv72B0m0tJJS4CRXkAJNMw24kzde3BOb4RpHpz2ZjJTA0//k50lJPiMnuu2Roh87b
	Jy809FOXO4kA4t100+URa/ogbSZCmCnl7VB5lA/fRGEeRv8A/u/mM1TDLUG0gn0pszVnTG3xNxr
	rDD89S
X-Received: by 2002:a17:903:2acb:b0:294:fc77:f021 with SMTP id d9443c01a7336-29b6c6b32f7mr292537195ad.49.1764293686815;
        Thu, 27 Nov 2025 17:34:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWWSHko5y6oD91TN3B3lGryZHCHRHxOopxvQsC5ek5eePK1RXdzcHEQamOoRcY4GvzPGCE4w==
X-Received: by 2002:a17:903:2acb:b0:294:fc77:f021 with SMTP id d9443c01a7336-29b6c6b32f7mr292536825ad.49.1764293686203;
        Thu, 27 Nov 2025 17:34:46 -0800 (PST)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44285bsm28350085ad.26.2025.11.27.17.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 17:34:10 -0800 (PST)
Message-ID: <1b09c7f5-1125-444d-8c99-d2e8b545fecd@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 09:33:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wpa-supplicant: enable OWE support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
 <20251127030008.1421302-5-miaoqing.pan@oss.qualcomm.com>
 <CAO9ioeUNNg9WWvVz747E256VD62ERSXAOq9G0mQ=y2BHwcgsBQ@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUNNg9WWvVz747E256VD62ERSXAOq9G0mQ=y2BHwcgsBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAwOSBTYWx0ZWRfXwsmNg2wq8Npj
 TybPq9odgnMaDi9axzjmXdhtikM/JDMZbsvXz5yFSLZOuZ8QgPconfTlSF9H2sSFo4DdaTsSNx2
 nEiRMpkUKLMoVFnlhtDLLySIcJ+pAtywlkDqn1Nf+W7SCopg2gbsoaMLHstDcab9wn6q4g02LYk
 7E3dDeeLMbP/j4MvrMU2Bv01g1OssmiS72cWSToZbB+vaQfhUxvhf4o33w0W24QO8u9tvRayyat
 geLwxAlSWptkPBoOtLjLPodma1AIKMulPwTvlgPPxGfYXk+IEifEYaQTcec4PlggBXDKdgeLLwx
 /bXYZ9h53rYJKuK0zUInBaaTFZtSYDHlFzH9ggQCwaHjjV+iq847drRCJwJlz2qxaB5bBKbDvRN
 iDOnwZBxMmDxgLxw+exK6BWMjCY/xA==
X-Proofpoint-GUID: gSucR04ttOG6G6v2TNgLLgA6OW8PuXge
X-Proofpoint-ORIG-GUID: gSucR04ttOG6G6v2TNgLLgA6OW8PuXge
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=6928fc37 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wYO0r7ZVvPo0EuW_OwMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226872



On 11/28/2025 5:17 AM, Dmitry Baryshkov wrote:
> On Thu, 27 Nov 2025 at 05:00, Miaoqing Pan
> <miaoqing.pan@oss.qualcomm.com> wrote:
>>
>> Enable Opportunistic Wireless Encryption (OWE) in wpa_supplicant for
>> easier testing and examples by setting CONFIG_OWE=y in defconfig.
>>
>> OWE is standardized in IEEE Std 802.11-2024 and specified by RFC
>> 8110 (updated by RFC 9672).
>>
>> Disable OWE when PACKAGECONFIG selects gnutls to prevent build
>> failures.
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
>>   meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
>> index e313894ecd..8a68d56ffd 100644
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
>> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
>> @@ -639,7 +639,7 @@ CONFIG_BGSCAN_SIMPLE=y
>>
>>   # Opportunistic Wireless Encryption (OWE)
>>   # Experimental implementation of draft-harkins-owe-07.txt
> 
> This didn't get better, it still talks about experimental
> implementation of an outdated draft.
> 

The outdated comment will be removed.

>> -#CONFIG_OWE=y
>> +CONFIG_OWE=y
>>
>>   # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
>>   CONFIG_DPP=y
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> index 4a8ee1423f..971e55150d 100644
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> @@ -48,6 +48,7 @@ do_configure () {
>>                  echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
>>                  sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
>>                      -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
>> +                   -e 's/\(^CONFIG_OWE=\)/#\1/' \
>>                      -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
>>          fi
>>
>> --
>> 2.34.1
>>
> 
> 


