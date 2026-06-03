Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C40ACD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 06:11:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13671.1780466775405156242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 23:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=ep04fo1A;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=cR3UsZ47;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652KWhQg3803520
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jun 2026 04:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4ybWa0jMvpPQIP32w04H3mVDBfQx3WOIWjCn1Zg+8w=; b=ep04fo1ADFSwF63K
	m+tD1DGMwcrHoRpPB5KV+LFvbQlL+D9QdUGqveYp42QerzfdjhvBlbly9NPVHFU2
	2CF3yC+kxRpAkjLtH5t5xivAY18ATmVL2Bb1mIx0x2E3ykZ3flQw6fdRebW/RzEG
	V41nHgPG3fCZuDJqsGUIp9pQ0F9ZIJRfoz1nmRfdvwgPwHZ+lj1SrrOMaEDJ9ey0
	foemhyeRp/U38/uIDU1hmfD3ZCAdjyzjoeLowoye7OY2iE2wJMtb+zGUMZFY4dD1
	OmHdL/xckWznhKjcew8c0SlsvXOIGG/Ww2KZrAoeW6m/PJjpLAzsPSut39Epjdq4
	mX2LQg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9hka4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 04:29:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f2083280so805551c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 21:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780460953; x=1781065753; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4ybWa0jMvpPQIP32w04H3mVDBfQx3WOIWjCn1Zg+8w=;
        b=cR3UsZ47y5GVHxIi3A6tz/LlnZzCtOjWiUyNXvkAGXg/ddsEHwWQLYP4P2Cok1uhuz
         TFoY5g3kS5O2mCM6Ht3JBEjcT29+eO4a4oniGseiB9R8DdrqHE9Bv7zK5Ft+KTFhLQoI
         d/VeWRhD5vb5fBCG7Vs+IXShuG2APjJndAh4Y4pU9H3ZXjtT4OyNkA9GZLCbxJRrbI/d
         l2vsmNGL+ILIqMcG6/wGPDiGCVQbNLFbtTGNIUoTNywtNP+K1yELPkXEsPMdIfpAii3A
         ieC4ZIMQMQmZGIYFSPTTtmI8KTGrOPJBxCuHVZtH4u3VLU7L/csEO/bK2LqOPg9NCn+I
         tcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780460953; x=1781065753;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4ybWa0jMvpPQIP32w04H3mVDBfQx3WOIWjCn1Zg+8w=;
        b=QAxoZSpr9SXvvSsx5gTr5lzND2YQb2ZY0vJrCSOCJjEzjqemia5h6hWEzRZT9w4yC9
         NBL80UtHI6Eo0xM+K/JR6yFcurA5w+u/Xv6MSwTnMejT/j0q3fIHOXUOJ2oR0FH8SrIY
         1X3wsAPoWjKtV3Ds8YwBhsP95+qmamT4P8E09aGoV6CFhh6HYs2EvTXD1nO1Wgcd2QXK
         cJLc3hn35QFsIYRh49/0LHKHwHUFeGsSZtQ4qGNjErJxj/cReEbHSbQ0b1Ms60A9CdGI
         h9n9hwSc2/EgY/VCRp9nJ3Asmp/omHEB8xs+ggIUW+ke4X4PVecJPbAPh1QZqQ3qUPLM
         CBYw==
X-Gm-Message-State: AOJu0YywkkXZhvLOD+/j08kfsJni+Znw/eGej3a34jnrv1hIP/RlTUtZ
	Oxv3vZyZ5MMkofGAwaVCSXraNkHiiHpddKLR4F26tSa+K9PyJUUO1wV3+hk9ZDkeQw89BtlKGGt
	y2Ub/fQ2zWa3TtttSLzO6dJt0iRsAnTDudwqTtkCL0X4WNEYNdMTAwt0yDiqoKPdbEqMd7cXTBY
	8M4TlQc28=
X-Gm-Gg: Acq92OGVnu+ziSsqXMMtuLw4JW3dFhMzhOE13/VCvLjFhRRndA0501kPbmWTLMSRb71
	poKzDLKJORVzIAhgTt/DKZ3cte27IWmVVs2X13exbfOXitGcZhDli7dwgJNVkjll56JnPkqv7NA
	WfR6Hk/FpU1N28vvP0Qqj+e6/jyp386uchwSQqmZeZPNyQw2EvLo4PDkUDEsEQa58N+Y68MTZrw
	YhHKGSWTxAesBCcA5uvAns638W2HC4SuooGpOM50PPgW6vuQExIXRrxjrJRaEMXMSk+WjO7dmau
	vDIod4rJsGZI/1tp5IgxSopE3hzta5T5biQ4VyPDgFn5MnXnOwXGjfWmKUSmcgQyoBhIuTKbZcZ
	suN2L3tcp94zIozvOrNp2Yfq+uQg8xpr4mqMNPIjts9lvbzB7uelHyXyXGx79L3aJPFrsljK0ia
	+gNTNAI2fHiS8=
X-Received: by 2002:a05:7022:eaca:b0:12d:de3e:cbfc with SMTP id a92af1059eb24-137f6bd71edmr686508c88.35.1780460953142;
        Tue, 02 Jun 2026 21:29:13 -0700 (PDT)
X-Received: by 2002:a05:7022:eaca:b0:12d:de3e:cbfc with SMTP id a92af1059eb24-137f6bd71edmr686492c88.35.1780460952567;
        Tue, 02 Jun 2026 21:29:12 -0700 (PDT)
Received: from [10.110.100.237] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f554f732sm1114229c88.12.2026.06.02.21.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 21:29:11 -0700 (PDT)
Message-ID: <5f067594-0a77-4bb5-b44a-62c8b1c8bb76@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:29:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] wpa_supplicant: Handle invalid op_class 255 in BSS Transition candidates
From: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, jouni.malinen@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        hangtian.zhu@oss.qualcomm.com
References: <20260526083048.4122860-1-wei.zhang@oss.qualcomm.com>
 <qvdfgutqr7wpdkycvhkvexjl6nbkdaqtyyv5zdkor2ylivvewo@4aoqgsynvgca>
 <CANNYZj8Q7kD4Q1PGvfOzC8LzVDDDuaSHnTXMWep_quZpOqeoEw@mail.gmail.com>
 <75b044b4-eb36-4aef-9630-f5ad09712950@oss.qualcomm.com>
In-Reply-To: <75b044b4-eb36-4aef-9630-f5ad09712950@oss.qualcomm.com>
X-Proofpoint-GUID: W0_mnKy3uckiiNOVg0AP6D6I80wK2cyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAzOSBTYWx0ZWRfX90MBIYNzncxF
 Z/jk04LLXCdMdFo63yC8NbiEsDrYR4x3k32HtliWZHO7h/sBNdVvBr4+VRTCk74x+QpRgi44dmq
 0DiScVcYaP3Lv8lUjU6Nivr9gC2HAqr68UqlsOB3ORdsBXU2HGdzOQoNnIf/maMYRzJ5+vFXDkN
 4g7AL9ImAqcA4Tkw2xBkNQn5tmo6tZZQCj8DZZr4K/H6KcxiMK3xE8TAThENxuYJMcmMQjT7ecQ
 kjCKds7UnA3i6y+XZg7MYWEwkDMuNYaHhg4SNZo4PUVSOsbOoAep3X1Sjo9RhcozQYNqExIbB3i
 TLmsu69KhILBhUL/3eqN880VRKahqPuvTB+Ui4r69sknneR+rtbtThxfY5O51RoaDKp93TSDPoY
 6UoOgw5EHS+N9hrJmyMuIEBND/hIvLYgcJ8IVpeD8WoH5RG7k2KvFn3iYwRsTXucwiow4hHZgiN
 LmSfp86UPO2Drvp4dVQ==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1fad99 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=LkTzLyQabQiJZSZuuFQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: W0_mnKy3uckiiNOVg0AP6D6I80wK2cyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030039
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 652KWhQg3803520
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 06:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238081

Hi Alex,

I followed up with Jouni on the hostap/wpa_supplicant release plan.

He confirmed that there is no clear timeline for a formal release. His=20
recommendation is not to
depend on upstream releases, but instead to pull a =E2=80=9Csnapshot of t=
he day=E2=80=9D=20
from the hostap.git main
branch when an update is needed.

Given this upstream guidance, would OE-Core be open to consuming the=20
required post-2.11 fixes
through such a hostap.git snapshot-based update, rather than waiting for=20
a new formal release?

Thanks,
Wei

On 5/27/2026 7:02 PM, Wei Zhang (Stone) wrote:
>
> On 5/27/2026 6:18 PM, Alexander Kanavin wrote:
>> On Wed, 27 May 2026 at 11:53, Dmitry Baryshkov via
>> lists.openembedded.org
>> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>> The same question. Which branches does it need to be backported to?
>> Wait. This ever-increasing mass of backports coming from Qualcomm=20
>> isn't great.
>>
>> You need to engage with wpa-supplicant upstream (which also works for
>> Qualcomm), and try to convince them to make a new release (and make
>> releases more frequently). This was previously requested, but wasn't
>> acknowledged or acted on, so I have to press you again to do it. You
>> are in the same company, so it's not difficult.
>>
>> Alex
> Thanks for the feedback.
>
> I agree that improving the upstream release cadence would help reduce=20
> these backports.
>
> CC=E2=80=99ing Jouni here to get guidance on the release plan.
>
> Jouni, could you please advise:
> - whether a new release is planned soon, and
> - how fixes like this should be handled before an official release ?
>
> From our side, we can also help coordinate or prepare any updates if=20
> needed.
>
> Thanks,
> Wei Zhang

