Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E21ACD0433
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:35:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2260.1767777593389232353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=HXZVafJC;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=XZjeDm9b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074m1q01642761
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIf/se91hQL3n4L+Ii4UW8Ug27WwKsMsV5TLgeyNSV0=; b=HXZVafJCuXFrBRvI
	Ehzsw+JquN0EwGjNErSXz+6qxUjRdi8j484BWof/4xkNuulJ3zctkBvUal7csaNI
	l8P7p+DxwtrpSHa05rRW5LVG+uKM50048OfsK0WCWtXOxrXezUPRQ21yhkItYIc2
	PNOUd6w7KuLudfE9m1j51oQYPi0G6v7IsNKjETlWaeuuP6GhAzXYewiQFP1rDs2i
	F+8H4nIKi+0gk+JytyezGuIvSE/Exv4ngr6shIP54si5kY4ddfg2BBKgO+2EsSY2
	XNjb9M7JbeBNbqS00FqFK/05MN5MjVhsq1f8JrzeSEhZQy2pufMQoQFEn8mzKxCn
	tky0sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfgtcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:19:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso3790967a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 01:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767777591; x=1768382391; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIf/se91hQL3n4L+Ii4UW8Ug27WwKsMsV5TLgeyNSV0=;
        b=XZjeDm9bsb9SelCxBjWeEqmBaLgGRm4eINtzoNy+WWw0/HNKc0c8RCvD2YOSCmyMjo
         zbOXXXePnTVoacYoKgIhubEn70KEJYT+8xuwilHW5TG+SONHlaqxh9wx4cs9gNIFWIgk
         zgvqZp8F1Gjb/IfmQ3NksKBK8RvFTVfOhzYvl8ns7ctu3YjxIrcqmn7aZSm1L6yQ/Lm/
         XTgr+w5vsOCGRLQmpNAGtxh64ij20vNtwj2QeboX2I8KnoD4lUwER7tWNo932JuvwCcP
         QBZBm5Vn/B0E2Y9Kr/32NqvuZLivDJKW1B9u2sy9RgNkDvjv7k9AY+3JycnLJsqwiId0
         1SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777591; x=1768382391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIf/se91hQL3n4L+Ii4UW8Ug27WwKsMsV5TLgeyNSV0=;
        b=Tw4pl5TpitzgXAlsPTla34sjrcQCltjoMJHvBUPvM0U4xhyOlPxj09PFX+KYXR5uXD
         MmlJHyJPHYq7S+vQKIoNu72j59N0wrfnnCJ7bbla/2lEvFpqV1+BbHqyK0KGpW/ExmJs
         S0SLFfXqn8pmTmUe/RfvmtQN/bq36W5NQdBtXbMDpqQguMmVRB27PXAgQHgWLGK6nqwF
         iwj4Olnqc3NQAXCE2Mk58d0ju96DWgihxhashutVb0c6AHZ9CNcQxBks/bhT/gAWzg8z
         gm9UnSTFVE4BR7BXQVSwx14aokJFLhmZL5wiajwex95zPYOGIklHjMUxbfiycddzYzNP
         icoA==
X-Gm-Message-State: AOJu0YxtUt4I2ZjlmIaOwIb9ycL+1pgUlkEN+bl5CZUo1yoOfUClt021
	+DP+f/F3f/0CwQ5uZ6lLdJMv6QviNgirD7kX6VOrULYARayhx952Zdu1kRkRfy4lOihtSoJDO4r
	kDmOvx+Ne5GXuhsNiCNRHaTF++z9l54WZBoC03eKC+FUiFRg0ohBFt+wE+w9BhwNgUyTHERXDuS
	6231FzpUw8iLuU9FU=
X-Gm-Gg: AY/fxX6VulssruLBw7eD5iABE82wdXLU2U2MFiezgg3FmM4dbs768ONKz68eCS0sGVN
	IC8P6ny7AtQzdAoQHbtIyYelosypjck1bPjWZ02taKH9NGFuSJELnmmfAhiZom0hcjnm5mNFaZ2
	/KW/0xSgPbcjRzLYP3TU/Xn8RQOBVRkJkVSd6r856lEU8ZvhTqqwHH6gC0XLf5E+k7S0hex0ZHu
	DpeTkFrwJqYqp81WYbazsGgtcB/vQftPxLFUlnONbTqkMbU5DeoJo3Ft86cQ2rc8RcKz1ykye2L
	v8RR/KghqzggfEclyiWWvC2nTs0kbrpivXuxDpFVkrIphkmKX89nK8qgeQnZAaIoNgor8+CYupR
	+/PXvOSo6EkdG4ObcnBsC+uGEceN32TAYL7Y8DSFQYsc8Mdq1
X-Received: by 2002:a05:6a20:2450:b0:366:14ac:e1e0 with SMTP id adf61e73a8af0-3898f9e9074mr1791858637.70.1767777591190;
        Wed, 07 Jan 2026 01:19:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhm9PrLxXZYdWPrOpIgW+iH9AgkVcKV2OVVk8cPwiuBhmpvbJz0I/tC2nDf9aZ3O62EwQtSQ==
X-Received: by 2002:a05:6a20:2450:b0:366:14ac:e1e0 with SMTP id adf61e73a8af0-3898f9e9074mr1791833637.70.1767777590672;
        Wed, 07 Jan 2026 01:19:50 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfe1ca23sm4546832a12.12.2026.01.07.01.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 01:19:50 -0800 (PST)
Message-ID: <61c1aa0a-ae4b-4e15-9996-e10971749f9a@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:49:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v1] alsa-utils: Include upstream fix for unsupported bit format
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260107063605.3838495-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <CA+s=J=wMDt6CgKHF4G2xtgKQQnYNybEDGsDmYS=PE6fuiOZyyA@mail.gmail.com>
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <CA+s=J=wMDt6CgKHF4G2xtgKQQnYNybEDGsDmYS=PE6fuiOZyyA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3NCBTYWx0ZWRfX7Br3jkg8IxjB
 pqE6XpKTC7OHhkJolQiiMf6oipNWHbq1ghfKiX+6C4M2J5+UqNKKV0C1VA/3wz5i+e8zWJ0Qugk
 LQYaCiO30vrcSB3rTz0ncuosT1lnK7OVJytONaINbIoKXQIAYkUOqMnmFVv3LhTmeya9fKgzXoK
 4/8wvSeNZafYZAQ0JI/YJnvw+vjjj5F9+O5UsCm3/p3XBGmYLfZmH/gj/tsqZwHDz3QlNsFSF4Z
 ev+VKDhJPRg1GcNFfPMQxrHl6eSCVy7HQoVSNF/IYTYMlUVAZjw4y1fQwsFL9KLVqWeDMQvucpz
 TzP1xqQoosO/FMIL0/dgZiea1OZ2TtBIp+1jxhrQtuI8VVXe1pPphcUR5tKN0SBFXsZTd753Eu3
 Qul5WNt+bqrOXESFDhRGT/K+1zUSY0V1ly8IBRz8k4IOduPGWvcyaaiwRCNVp4q2xez3XeiJ3Dc
 LpYLxobkbOeAeVApaZA==
X-Proofpoint-GUID: yPoXJ23Q76L8BwRuvl3olmJH62rEMD8z
X-Proofpoint-ORIG-GUID: yPoXJ23Q76L8BwRuvl3olmJH62rEMD8z
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e2538 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=Q4-j1AaZAAAA:8
 a=8F2kzdYppqewGzDoECUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=h8a9FgHX5U4dIE3jaWyr:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070074
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6074m1q01642761
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228968



On 1/7/2026 2:35 PM, Anuj Mittal wrote:
> On Wed, Jan 7, 2026 at 4:44=E2=80=AFPM Mohammad Rafi Shaik via
> lists.openembedded.org
> <mohammad.rafi.shaik=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> Include upstream patch addressing the unsupported bit format issue
>> in arecord/aplay.
>>
>> Commit:
>> https://github.com/alsa-project/alsa-utils/commit/a12ec83fa93e16a76f5c=
57f128f819dfe332f96c
>>
>> Upstream change log:
>> https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1#aplay/arec=
ord
>>
>=20
> There's already a patch on list to upgrade to this version.
>=20

ACK,

Thanks for the update. will drop this fix.

Best Regards,
Rafi.

> Thanks,
>=20
> Anuj



