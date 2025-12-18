Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3370ED68BD5
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 03:10:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32946.1766027395393597485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 19:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=d6gwO7ib;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=c9v/K4LG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Ycuo813844
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0obVLUmKX2tZkxWtpNf8JuoC5Vrf/QqqHnVkzWf0C4M=; b=d6gwO7ibhpE16ljn
	NHRSWfr5m5MqYm3ESkz3nM2Yj0jDeW/dwTQSIV66waUEoUzU2lR8iDrqON1NHc2p
	l/Xm7+DJ3/ATE6FClTR92Bgb3O+6i9W+SUgBDPA6+LIloY+rNm82bwZK80Hsksh0
	647XRTd79MALxjFYOB5efVJ4ExZG1WVHyPSDwn2wg5UcnUOCSXN51wJE8PwcG4zv
	CLhvjfIqZomF7Fb4dLfPcyWDcWx7y8w2ro2xgPidMyrAMZnpXTEzHn1hTTOq47LR
	EwKI3FN1ukKyz+JpycKXe+w5xIreYSuw20FfHeTtVFpS122a+vtlpmq3Uu5rRXOt
	8ttitg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v79cxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:09:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f29ae883bso2852945ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766027393; x=1766632193; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0obVLUmKX2tZkxWtpNf8JuoC5Vrf/QqqHnVkzWf0C4M=;
        b=c9v/K4LGfsx8zKpQbdox915n3ar5gWEkway8zTQ6GNgYXZcUGBTd5cEg/EYmSwtLQP
         uz60UqpcYrsKzBgi/iOI0a2UC7USFtGhA93dOvse8aZlLp/XivtA0ffycEwLpXrBuNBO
         FUg5kOYuE5IsiglamPOlmFEXZai31qPuE9Q0JLMQOnrYh+JA+JVoqj7h+Xkid1zAhmP1
         Up9BMPKlDNRPsUasKmKfV3nmh2JAwiA2O6iM+kgDDWl/UPuf9BEjWw43eQOHab2eAqMh
         5tRZpjKpc76SRdz3AXKq0J2micmHNQOyfxcpWb56XOq6rnbZibGyUjmG0XamRkb39P4C
         6wKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766027393; x=1766632193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0obVLUmKX2tZkxWtpNf8JuoC5Vrf/QqqHnVkzWf0C4M=;
        b=jQ/VGUOSCggex4riUvHlDwia5n4BsjbY4+Iog7l9kb5V/l8Xj52KX8cGSuy1Ci5Kj2
         RtelQOW4R6xySV+Oo/Tg4SjNCScxg5+/KUlYD6P7cy8KELq4G2kM9CqRYeake10acxCj
         hUeV13VEjATGkuF2x1uDRXYS1ngd73f58KplRe5kGCjtNpY9Iow3oFa8DZxCTC5hEV/W
         ByweiDQGTnr6nXBptxkt5ulvkLTFMQ5Z30XSed7W6kb534vuqnsKW6fhUH8IiwFaQO1a
         SjWC4oRdwFLqjm6GTpPRnRBXhIPlhXf4KYwZmE779xDx7WRpyfpLKjbEDcNF3Do8Tw6H
         rn0w==
X-Forwarded-Encrypted: i=1; AJvYcCVXjVXa6MAWcWuvMKtlZtiTBjSVVq3ALge6ovtFeP4XAMLtIs5abTynAjPQhnhGfaDYd1wlf06xEqOeda1A4yjDVg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzapFj+mutn9Rhb+bKypMWPKBpkz30JfMQFdyV93jAVjMV4V75z
	O/u4ZAqFrKclCpWGmd8e5MHxC9S+5zgJTQu+gmvPqbq9ucPh2TEOfJ/ePi/fw4xqYiZx0bobCh+
	v85cxr91jIGrTyQM3s00avhF3voB8zz80Q7MQNHZvjWSQ3zDI87PcLVI7P0bCuGkagNNU2e5H0o
	HyJkg7x/I=
X-Gm-Gg: AY/fxX4zFLDK11CZnDM41ST1zSTSRTVD8lqCYRlIFzdfTU577lT5D2CdVNx6Jh9bz1x
	i1i9gGDNvnmrGJc9xMLZEliM3CXjbHbNTA0H5DuMWZWSGojkG5My9pu8oXXo4BTRbZFphaSke9c
	r+YzuzhrUJgSbZNw5iJmmnTMUEZBC7oyNoNB56o99lr96oiE6y7rZ3wkEcBVVEVF8mzNPdjJs9e
	hToe0osNsO9EiNAAkRa9JENcfUbSqNQZgMFDvKfnCNtnLLUyLI1h87wr2zk1v2tGQX3tRAHu0xD
	rkLEyHO2tjAQeo3gPbrH5QnidrQzIAxdtg19DhanaPrIuw2IRceNwR4upAKWFCbwDnhNr8ScdGk
	GF6QqmzRLPI5l6ZwX2caDPttZPJVoCOUDmXvnxcTqY9MJ0dZ3QSY7bKo+SIAor2WT5Pp6WsgSea
	+vLI90JQ==
X-Received: by 2002:a17:903:41cf:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a139cd7789mr77711085ad.8.1766027393272;
        Wed, 17 Dec 2025 19:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMkEhL9eqzc6zUe8RNcrqmXmoN47V/Pn3dzPwzta7TDCbC75bfrTjF/a8viA3ELkJqZX+OKA==
X-Received: by 2002:a17:903:41cf:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a139cd7789mr77710805ad.8.1766027392664;
        Wed, 17 Dec 2025 19:09:52 -0800 (PST)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d193cf98sm7570165ad.94.2025.12.17.19.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 19:09:52 -0800 (PST)
Message-ID: <891cd6cd-6198-464a-8c9d-5a0901901a61@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 11:09:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged
 defconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jouni Malinen <jouni.malinen@oss.qualcomm.com>,
        openembedded-core@lists.openembedded.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com>
 <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
 <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com>
 <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
 <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com>
 <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
 <a89409ba-8786-42fd-a587-70606fe57f63@oss.qualcomm.com>
 <aTGthgduOuJaLV-2@anonymous>
 <CANNYZj_kvZxiuoYu5+Uo1Zs3k36--dexc5FOuaC7mrWA9t0X-w@mail.gmail.com>
 <98414d4d-260a-4fac-b8b9-9e8e47ffbabc@oss.qualcomm.com>
 <CANNYZj_LtOQ0m7=5cp+Y9kkNM_+rwDuTTveDZu8=66czYXXL1w@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CANNYZj_LtOQ0m7=5cp+Y9kkNM_+rwDuTTveDZu8=66czYXXL1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ViUIbOjuE3royoZfL3MNoAXfoDyuEvmk
X-Proofpoint-GUID: ViUIbOjuE3royoZfL3MNoAXfoDyuEvmk
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=69437082 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oyHuvEGzWWv9Ukya8ZkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyMyBTYWx0ZWRfXxERbIBOzyy8B
 h4qJA3+7XlpdWHGp5qHuuyLTHTG9FirFQu0CdY3LOaw7j022s9Wouich6UZRYBOlyketWtCglks
 DFD5C0pDAYuya0Nbp83IDWZVUW1h0Z40KCz7xkXe8x28Nax+ZRxpFg2cz4L7ebBvf6K2e8bUjng
 K5/CapboLnWe7H2Shvs32F9jQgqSIjjlMwBfVEr25h/jE4wNaWcIsx4l3nLWlmZzcUjGkjjMPNG
 FN2wIUd0L/mBcojyFApIrtn5iyKE1DEHJ5Rw1/dEIswZ3W/W1ufhkaBy6iOFDHHgVEQW9J+DrF9
 dgznuFCcYi2v2TeAZuE3HTgAmPYRafOZRQxHSonIWmtTDOWkkSAHcBFnOwPWBx24SYCIW/m6NAB
 5L1t2xdWDThSyVTCvXDLrmaN7gcXag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228084



On 12/9/2025 5:44 PM, Alexander Kanavin wrote:
> On Tue, 9 Dec 2025 at 08:37, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com> wrote:
> 
>> Kind reminder, final option?
> 
> There are two patches that should be submitted upstream, please do so
> (the parts of 3/4 and 4/4 in the set that adjust defconfig). Don't
> wait for someone to say something.
> 
> Alex

Updated in patch v4.

