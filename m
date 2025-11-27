Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98667D116EC
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 02:54:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10171.1764212053495990605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 18:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LZNgK3Lt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=izIBngTU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQJMC442387647
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 02:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uUSWR+jw4BBk9uLy9ffhSNcgq4pfFsjM7vSekQgCAs=; b=LZNgK3Ltnpksxhgf
	nSX1QF7Z/z/QwIpRP3N2spHO3SPUkIKkFbLOuEcIVUY+mmaacwWtnpx1R3xO42ac
	8wblkXv7ZLXFU70tcRqsb1WSdI1SMT+k0ApwS6WXDBX6/By73NSfTS4YFpa/h6dl
	H/CdEe+CNmLEmhET6u05f3f8G1GjiKEFbixuFdpeBBcbXmU6YTJ4vlAf5KM1Mbsv
	2umIEt6eiAhC7HkTdbZ+oSP9MJHQkKPvKcQ1p1MkdWPoyqUBkJvlc15z5cffkibD
	Bh5DlN6fGhm9qcwOvgo60pTFIfAA2SdARkV4L0ZoVd4QM2CWQAbJW+mb1wO/+LeP
	MInAIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8guxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 02:54:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7aa9f595688so549497b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764212052; x=1764816852; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2uUSWR+jw4BBk9uLy9ffhSNcgq4pfFsjM7vSekQgCAs=;
        b=izIBngTUEE3CLYGD1OGEDgbQs4TXPCZFk52ZhX0y6cPBNKLDdEZXc7ohRWu5tGBDFc
         v+PFLhoHDZeS1Ta6hd4V6CEvsMGz0gOgWWtVhCZcDAy40ghvpAemW4q241RE3XBePNgT
         hjK+l7A3CnfwPUuBurj4rU68bYrtQzwS5BedkOtsmpblRMVbKSBZRBjtz2cmCL8uGwMv
         D+c8cZO7SI21C3jUu6KWLmrs81q65N1cWa34WCUVZY3FVs81dbiiXRFVfMFfcUuxE/BI
         u2FVzObbmIiEKB4hT2O4WrObJWMiRS+pgZ8kCH1Dv6ibw07a8IcBIYfM3Z2LoURREvAp
         Eqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764212052; x=1764816852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uUSWR+jw4BBk9uLy9ffhSNcgq4pfFsjM7vSekQgCAs=;
        b=tGmV0vQ2kNzveftOVoKuaNu5WvFb/I4bYaJBOsQrRVeTGNZk9GqpVncIG4u6aoBzqr
         sk+YyJGOnnNoZ0p2ddOkwbSdu7rp4DUKfFY0CqKQ6R77WRECeuWHPmaSrA304Q/QFMMV
         eExMa7QWOeiAJ1USMJiAlsI1t/AbhSbl/DjYqNPkiv1xqREnooYRjWTUUZcrDSxO9vDU
         ptwkBzvOMKbHF78XQxXjawVD15Qd5wO3uD4NIJ/SH4OJA0Lc1aYyjfpASB6pccku7r5V
         GGIznWqRua5C/l4eUNEcQJmUGxYzia7zJRduYBIJYYp6XWa/qXHM5x1rtXXnB7N3fg/u
         Xa+Q==
X-Gm-Message-State: AOJu0YxZCfPPKUj9XcIXpvIqKUbIaceuaI+wyJjQz8fOF8OzSnh/Z2Gm
	+UFH32hHEYvgrdxn2SprNRIM4WRL4uNliris4O3da4ubrxHUuKMViH7I/uf58CuB5U1XY1teHDk
	fIKFEINUNaIZIJd22kC2lvG/vtAiXeWRGgUvPNmyc29LAScJ4ycsTdx/uZu2WwGv/KyPWhzJvOS
	zTRiNUQxg=
X-Gm-Gg: ASbGnctQ2kZ/GHrBjdI/1jCmnZp99YzO1zWuDqawpkBMM/X1zn2MTFpdgd6PeQ0HwMs
	o3wopypvO6jtNmfW/QljrtqadDHqz51hPcdnAUudM+HQYOFhJLFSFNriZgRz902JsU8Nlp0Xw+1
	K+TtHH1Ip8xbgpM7sddn6vz39xm0Al5NuFgB1R2tpGoc/fa2cNq9xYtgcqkij7cx9oCvt+0NB8y
	kkrdKfu1L4/DgxAxQwccQyvhmbIN5TgOEPEbNwybAQBdUY9/6QUiWI/xmMeaRT4jIl8fYOw2b9Q
	uGfTijfVMszEfiESFAVv0e7ZmJb0Ch7X/JPuYgQi5a36o8l+jU8EcpAtPDK/aWZd0Juk7iRWcHo
	lFp56D5XKmAqFGFVYWGyae7Hb1xpABODcYRWyDS6o2IldmfCikiewQWJ9DoV9+7CxzoE4mcvZCh
	yVy7Z+
X-Received: by 2002:a05:6a20:7284:b0:35f:5fc4:d885 with SMTP id adf61e73a8af0-3614eb27707mr20838071637.9.1764212052250;
        Wed, 26 Nov 2025 18:54:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxuL8YSj002dvO6RqBEeXbk6X5bozli4nJGGDAn9PADl4Y1uA6g0sNkZVPgnYmW9eb6y7DjA==
X-Received: by 2002:a05:6a20:7284:b0:35f:5fc4:d885 with SMTP id adf61e73a8af0-3614eb27707mr20838051637.9.1764212051720;
        Wed, 26 Nov 2025 18:54:11 -0800 (PST)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b68805sm59934b3a.9.2025.11.26.18.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 18:54:11 -0800 (PST)
Message-ID: <df6c774a-f330-4cab-8ce2-32b84e8b8906@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 10:54:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wpa-supplicant: enable OWE support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
 <20251126140713.1414484-5-miaoqing.pan@oss.qualcomm.com>
 <CAO9ioeVU7jKd9mKy_XCGGyfp-uwuqJWgM4OyDxfB02ApGw2k5w@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVU7jKd9mKy_XCGGyfp-uwuqJWgM4OyDxfB02ApGw2k5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pQWwWedNE89B9DmzR9aEvT6tQPxVBnbh
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=6927bd54 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Z60WDNdKfztJu2T6ioA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: pQWwWedNE89B9DmzR9aEvT6tQPxVBnbh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyMiBTYWx0ZWRfX75KuJS8Wk5dL
 G88Hx5jT/m2UGE7kZI2c0ni8lg8e15pWzAxlvWtKHIQCzkUtFyY5DJ/nlMLeCubp1Uz59ej2izl
 a5vdG80mbNBsAcf8/Lq7Lky7nEDU/PgpT2vmGpsFrKLW9BTup5f1XBWZwlHJoP8G/EWE3r+ObJ8
 PyUkoP0XGe6czXy2XlH4BBTLIPfqxLjLZKNY6mchamPsWejVMGn9m85Q1hUwz/rgeK29JiDKKPO
 HaIKhSPlEgbeRGx/ZtGzpg7I2Km9VR+wwTcBzWwGIo9+bC9CWYbuy1qwAp9OHV/OXOy2gfkEufp
 zme9B0ceqdGJ57YOEvy5L/6lLAuWuOSiFIqRfJZ8JbiuJM/TKYfKnp/vsP4nRFXiwd5PLUgJ7MJ
 l3CpOSeUSxoxS2oDtYyHpGUY9JZOrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 02:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226819



On 11/27/2025 2:43 AM, Dmitry Baryshkov wrote:
> On Wed, 26 Nov 2025 at 16:07, Miaoqing Pan
> <miaoqing.pan@oss.qualcomm.com> wrote:
>>
>> OWE is now standardized under IEEE 802.11-2024 (RFC 8110, RFC 9672).
>> Enable CONFIG_OWE=y in defconfig for easier testing and examples.
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
> Again, this mentions an outdated draft. Does it (supposedly) conform
> to the final standard?
> 

OWE is specified by RFC 8110 and updated by RFC 9672. The 
implementation conforms to the finalized IEEE 802.11-2024 baseline
where OWE operation is recognized in the context of 802.11 WLANs;
it does not rely on any outdated drafts.

And will add the information in patch v2.

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


