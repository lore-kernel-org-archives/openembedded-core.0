Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5C6D111A8
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 01:12:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6784.1764292330037968638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 17:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BStnB4dO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dfT9K+92;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARMj7Yd2275033
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yb6Xv9m1eJ1XLN5aDnmAXk+I+xilzh4kZybNTUyrF8=; b=BStnB4dOSM+R9IGn
	z3XGQGsbBYQiVuxxEHsbWl90PWcbndhzpHxkqdf3jDATwQkKq1u8QJl2qbQD53wk
	g4UXhke565m/hDJxgVCh08fZg3xO5WcyFyPVWjJGdpjsI7q3xj1Wab+SngryVPdc
	JSfKSwpt8RXJKai7fsVRTCvyeFSYCfhYxxfqiiJCS7Fe4MyPxmvz259RQPqQdDhH
	ejY2z9BtoH6oMBMnBLoTuiIYvQfIvIYeFydLuwfYydWYCfNLJWVJ2kHriNkeX0DF
	LyiLDjUTWxtAkcZbyZt/zREbgt1UFIEkjJMmkFdGh/Q3DyMgiHjnai79eSn0eVXD
	QRD2oQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpu8q1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:12:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so854019b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764292328; x=1764897128; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yb6Xv9m1eJ1XLN5aDnmAXk+I+xilzh4kZybNTUyrF8=;
        b=dfT9K+92lk+AIFyE9q1y6rtcmauXet9yvGv7nI6gwS/aDhX63M9GJqQ93eTQhPX/f3
         Kd3+/HWnqZ6LbezaswwnTpiO/vM3DzqgBpzHBpUxWHeUpUwnUQeEOBojNfxwLsnoKAZG
         foUSuEc+yB2bjhv05CqQdpBFjc/BAfmQff7/KJxga4OYAZpu9Ka7gjpA3IlamPGxGXO5
         uVv+a3IaCjEcgGWhs79YjJfsWU20VrtYR0ZMbIemQ7dUzvv+RBVNIOXsLt0pCUTAhPnc
         Y/5Kxua7Q00T+7aS7aw7OJI/DHkCqLx1+mDYAXALME2RtMp9uIIVN9jrKF2RVlLenxr7
         zPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764292328; x=1764897128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yb6Xv9m1eJ1XLN5aDnmAXk+I+xilzh4kZybNTUyrF8=;
        b=gsnq2iOHvEEb96cGphZvp+Eu7vGOzEX4lhMXMKnPwA8nTD0IKUppVD0hAjvIoBn8hC
         oBIzR3MYETvV3L53NApMq6VWM/FahOrEGJ8p1cY5tXlAjdq5gyuGOqfpg0mcMdnv2rGH
         KhDF+9vEwuVvtKbdeomO9R26d+t1UKmaPDBgcJfNGA4BU03eJOKPy5R58lEDjxaK8Zib
         1cXalZK1ryrqWuPtF2Zbm7A0IM1ebXRmMV2zO6nhYw7h5xRO2Y8MpiiaWsyA+0ApPYZr
         0fWdqgfMktrxqsrXujOKhuGwCJVXLR41xstFuYKTbJnYmr9W2il7jHhF/G7ENeu98oJs
         1Klg==
X-Gm-Message-State: AOJu0Yx13LurdNyHhecf1Vtdjl5QOcAT2RV2QG2SGcJtWKa+CFVq078p
	uiPRCzHl1Ik5yZM4yfYMFNUpFna/2QY0VOo4A1byU49xPOzAR/5jOzrzU4xaY5/Z7ShQzRckasW
	MJ8/TFl9QVWeBlejpP4gdQAtZfLJxa1MUB/J7kaO7DGViANBsh7oI9dPW4+qTOOnGEqYuwxcf5k
	flIBc4FVA=
X-Gm-Gg: ASbGnctjwukMO1Iki7bIZ1LPuSKRSA1y2CEl6bje7HV8j4sGndHpTpaZw182SOUjp5R
	ZXSdFmZEciFaB//ZGpkgrgCRVr0gXIBNMz1SXumgb8u8s35m5+nUOoefn2d5zZ1GobVQ+TDrY9+
	2wqhpNM1tXhcczTfzCGidmuGjr5bPFfYTPaNxA573Wjg0zrXr5XT69FSGi+F4Fihl11IN7uOR8u
	ShKFu8Fah0MbH/2dWXdYhwqZI6Bu8Nna5DHF21rBfVJArG2p0JyDwtdKo5qnb4V5KVMDs4swFnZ
	ZZnSpqKZ6STiPb06CXgS0Iz7QB2tpR4Xb5kH8lWj+Lptv00TpxVUZdPsvBwsHUcmXWD4EfPGJpq
	KcCXarxPMw0PeC6rhpmSIUS6krL3pmRVOiEJpCpxlwFcix9e09+CR/RB1e+nPTRiRCw9OsRp1Nw
	XuY8rE
X-Received: by 2002:a05:6a00:4b07:b0:7b8:a505:3f40 with SMTP id d2e1a72fcca58-7c58c3a6d19mr26155975b3a.13.1764292328508;
        Thu, 27 Nov 2025 17:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkMXQJzM0XcU8UEvfQEHrpT5/YA8RIp+kEUUafBVHDx/t0SzIXC2g1p0YavqBNeZL4Pjxmcg==
X-Received: by 2002:a05:6a00:4b07:b0:7b8:a505:3f40 with SMTP id d2e1a72fcca58-7c58c3a6d19mr26155941b3a.13.1764292327993;
        Thu, 27 Nov 2025 17:12:07 -0800 (PST)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3d90sm3033486b3a.38.2025.11.27.17.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 17:11:36 -0800 (PST)
Message-ID: <ea45dda6-fe00-4a6c-bc87-dfdf5c1211c9@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 09:11:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wpa-supplicant: enable 802.11be support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com>
 <20251127030008.1421302-4-miaoqing.pan@oss.qualcomm.com>
 <CAO9ioeVLReHHCJjKS7_N1XBmWLduBWVcb5U5+bjj0m+87qg+JQ@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVLReHHCJjKS7_N1XBmWLduBWVcb5U5+bjj0m+87qg+JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ysohpUqjHzai8YWghJ8ov2ub7SPnG-Fs
X-Proofpoint-ORIG-GUID: ysohpUqjHzai8YWghJ8ov2ub7SPnG-Fs
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=6928f6e9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fNotUqvUVpwErocWezwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAwNyBTYWx0ZWRfX3rF9R2hgvH0T
 /RsVnE++Sjhi2ndUzIbT1Upsx8aByvkZB8oKrjEA9ESdg24soXjcQOd4NDRsqQUbKtiDzbK8Zu7
 96iv/fSMpztzW6whQoeaHx8zVlRgSO0i52Edo52q+sfhvcaY+M1Y0QaOk9AUGnBbBhAgd/KsRZF
 ZhwtJc3EydQLC/cmpY7X01a1pOm+l61lMXupdjwljDQC4IJdkOU4fKncmdonMryJJ7KfMmlReBY
 ODMp7oIgvcmzEt44hfHBFhMBzgq7yus9PItuHfkCMiv5XWR76PDocvWSj0hOfEOB3DdwalCl/z3
 Y+d7HszceKR9bRw5hE8X44xbBHLJ+5u7b9YPHph6V1AVmIOLN9FTottQgOEd8Cu7pjkpzUagHbg
 7xUViyjZLWvs98fcXos9jwqI9BL/zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226871



On 11/28/2025 5:17 AM, Dmitry Baryshkov wrote:
> On Thu, 27 Nov 2025 at 05:00, Miaoqing Pan
> <miaoqing.pan@oss.qualcomm.com> wrote:
>>
>> wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
>> years. With growing market demand for Wi-Fi 7, it is now an
>> appropriate time to enable IEEE 802.11be Extremely High Throughput
>> (EHT) support, mainly for AP mode.
>>
>> This implementation conforms to IEEE Std 802.11be-2024, which was
>> approved by the IEEE SA Standards Board on September 26, 2024 and
>> officially published on July 22, 2025.
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
>> index 52befd8f15..e313894ecd 100644
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
>> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
>> @@ -510,7 +510,7 @@ CONFIG_IEEE80211AX=y
>>   # Note: This is experimental and work in progress. The definitions are still
>>   # subject to change and this should not be expected to interoperate with the
>>   # final IEEE 802.11be version.
> 
> And this disagrees with the commit message.
> 

Ok, I forgot to delete this comment.


