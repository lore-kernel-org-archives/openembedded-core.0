Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1586D1D888
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38403.1764834973681212470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=R9zTjzHp;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=QfIz/Pju;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468uO9492237
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 07:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N6LC0oVgWGzaIi7sWjHVOdawWLyWvh+BOJh/fyfOwA=; b=R9zTjzHpG887ZG36
	3NRLLep4GFMWYZVy4VEn5lk7UyhBlXUHYSwTFHQoxadTkUOMXQZw1hJb5GLH08oQ
	0mnLW1IH3tam6On1Ul9aVOiexO3U/lwmaitYir6va9ZKwkWtjumLFlmnlPPS3Q7i
	OMj906sF7RRzLgUnLXGfMrkFZtj3W25vS7gEgJejqWTZALjIP/jshiAbEo9t42lt
	HYHjnHK7YaZgIhJUeE8OHxDE4FwtBggdjk2FGZf/dvMvat0eAn6lv0jX7iiSJPWG
	CxJzWo42DO2kb4e/ZAT/A6UsD2Ft+l1Ackmwxlal/P+dbf7xPITmfsQaLrrlwJYz
	DlS6HQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtkahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29be4d2ef78so16250385ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764834972; x=1765439772; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N6LC0oVgWGzaIi7sWjHVOdawWLyWvh+BOJh/fyfOwA=;
        b=QfIz/PjuLu0SqpHz96pZZzgzJ8C3X2VJ/RmLO/OYpNwm97nH2r/bnLQqs58NksQKg4
         pyff2umQ6t+6Ou6mPFYdkqr4idPOsDMKtfSGPjT/kEVSm7PLx2m8n5375hJXSefV2t2z
         FLl36nQLqfs+sOLxu5GxBr77K2AoWT2FGk8DUpg03XM1c86ZVN5qyYN5XU3a3cyH5Pv6
         ildXJXkE1kVyF6DVkegrZixLZYkP+LJRrgXy5lKA0Y4JEQVKQQwISeztn5JZ22Cr2avw
         zjfHrbENKKNe0rLdoz7ypmrr1QcZMJ8Mu/AeUTW+6JDmo+tZa21Qy4M9EOEVHr3lY7UG
         x4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834972; x=1765439772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N6LC0oVgWGzaIi7sWjHVOdawWLyWvh+BOJh/fyfOwA=;
        b=fvksigl3O/G+7zDjCwUDRVqRpsZ7MiaTOwtN6R75orauLmmLrOJEqN1fuuxiqEa0WR
         Y+R1u6yrkhovAYEkc8rUnCtSVo0FG2BqpJWEXGEvhVg7K8/L8qT5S6MZnbyV5m9ClrUq
         veedT8P0BEaHrKs7sdNpxPDjyI2fP5A+qcOXYctOnHuoX4G9EFbavkR7OwRIZWKrRCXh
         l0hQhoMgMz136S7sbQKepNs2hlvoQvWlJptC8abq/uk/y8vQjfu/+7rA2kST3ZRjuaV/
         5SJQbRnzUCUX24rGJInmrR1od+DoztmSJJI8I3NqGpmeK5fZ8MH0xqKokf54vLGTzJm3
         myMA==
X-Gm-Message-State: AOJu0Yy5OOX+cg6tyO3kYvpXEiHG71ZBEuqV12lujN03naaMYVH3t0FW
	b4/sglFZglt2Jf26EfFMkSY67wY7yt115rge8seewhnh0Kbq7pt3Kp2Tfp5AaitTqFzZ5LgTmKJ
	FB/vKa8ymlkQGP3riOqZRR+yelYSQwVTLsotfVK4gA8yeCQOXYPrgKmJNjLIapXW/uKQs85NmRl
	kdgHw+T6E=
X-Gm-Gg: ASbGncuzO8lXcG4vw6P2TSn4y3UJFUZ8QKqgcrLRfJGEVE3Ws8zIzDmwN4+cq1evKj/
	42AM3DZDu2VdSsKUkdxbB1mUexXiMBQ+G8AbmLM+tg2XzepB/4uzD114RARfOUhagOTJtXrsmZ5
	Lg8czkeBNafp5pDrLoODVbBa+dJLknlpI2kutY+khvywAtJm8PwYQoW0eSoDHf8bwquo17vzA9i
	vXvEnt4Wc9/uSDbriL+v8unmoU3ZV+AeJaqlzNZPjzGz8q1ZOemYYDCw6ocKvz9h/LeWxLARnZo
	771Xr02Ps2vUMY5Ubb7FQAEHTHXIkrlX/bW5qtB0HtnkYn0STjpm+BRm3ZfTAgMBF8AhlS/i96h
	8mVxpk5Sm6WeO8ApdRBH32I7IU/RW6gUNsGm+Ai3ude6PwuAlt5WeMbVjKGzFoLS9ikCLo1tDC/
	wMsRTD
X-Received: by 2002:a05:6a20:3c8e:b0:334:a180:b7ac with SMTP id adf61e73a8af0-363f5e6fac7mr6483467637.39.1764834972358;
        Wed, 03 Dec 2025 23:56:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfUxFoxHi61FcbxhcDlIB592HATTxQCensy1lfFlicabnRcL5z0OsYx9ItA9tgsPybZ75r6g==
X-Received: by 2002:a05:6a20:3c8e:b0:334:a180:b7ac with SMTP id adf61e73a8af0-363f5e6fac7mr6483435637.39.1764834971865;
        Wed, 03 Dec 2025 23:56:11 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ade44b77sm1237988b3a.32.2025.12.03.23.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 23:56:11 -0800 (PST)
Message-ID: <a89409ba-8786-42fd-a587-70606fe57f63@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 15:56:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged
 defconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        dmitry.baryshkov@oss.qualcomm.com, jouni.malinen@oss.qualcomm.com
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com>
 <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
 <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com>
 <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
 <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com>
 <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=69313e9d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5aJCULmbZfkzB_2l32kA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: xgsynOM5GELSyRTpK4saYQCuBKSGYgpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2MyBTYWx0ZWRfX33I8HkZ/tULs
 BUcLyyJQmDb74v7bSuXlL3W9Fx6wbp2UePMo4EtxJ6g1b7GYlrthTkeWQiAcwisdJ1tMcWHrVOg
 ZV7+akOXihzxaBkYtao/aaEd6Lwv8hEAnYruoF++QCEn1x8miea3w+BcPwIt0bwupbhqUkcZk6H
 2NxQ8cYxlBVhuTCYHKCCMCNLwCvqv/zLvNRwGcbbndymkqDfZMNSv/ecECmtb12Cox710qc6U+m
 y1p6ScD13L82AUyhnlzFO4LCl0TrwOkUGMflzujPoDPamNzRDqW9AeYLEChqMbF5Mlsa7bSpk3Z
 I39u0wi/5VLFLO8ozx1icHc1hs1HJD0acKn5OOlkOhhvzH/2lt6bYgIoAiBuNspXpTTw1vkdIBl
 z/630qKqROHftEjDsuexviIDQYv4Kw==
X-Proofpoint-ORIG-GUID: xgsynOM5GELSyRTpK4saYQCuBKSGYgpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5B468uO9492237
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227273



On 12/3/2025 7:23 PM, Alexander Kanavin wrote:
> On Wed, 3 Dec 2025 at 02:37, Miaoqing Pan <miaoqing.pan@oss.qualcomm.co=
m> wrote:
>=20
>> The version of wpa_supplicant in oe-core is a fixed release version, a=
nd
>> its defconfig will not be updated. If we upgrade to v2.12 in the futur=
e,
>> the corresponding defconfig will need to be updated as well. This does
>> not require significant maintenance effort.
>=20
> You can still modify the upstream defconfig by adding patches to the
> recipe. At that point we can meaningfully review them and consider
> whether they should be sent upstream. And when upstream makes a new
> version, some or all of these patches would be removed as upstream has
> already taken them and made a release with them.
>=20
> This is the standard practice, and it has been repeatedly proven as
> far more maintainable and sustainable than making copies of files and
> modifying them privately. Please work with upstream to get the changes
> you need into the master branch.
>=20
> Alex


Jouni, do you think it=E2=80=99s the right time to enable CONFIG_IEEE8021=
1BE and=20
CONFIG_OWE in the upstream codebase?

