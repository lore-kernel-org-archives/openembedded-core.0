Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6778FC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 03:33:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1611.1785286947169155265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 18:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QBJSLGMl;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ALv7z/fd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: hangtian.zhu@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL3cYA4132887
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 01:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cldnTlUnYiUKgS9zCH3XKTJ60sHQAPqOMR+1/qGajTc=; b=QBJSLGMl8BPUnHSl
	ub6L1tdV28jVaTTvj+53uyPKcTG8QB1vriWALir1pvFAe2DAH3iNhOYYUK4j5lH4
	T+XuF+oWr8gRpFUbbrxixeslIAm7YmtEMmNo/ECZpKZt6uShZ+ezAXzBgTgXgED/
	hn/RcGZSvGokO+C25QilA3BF64VQ0C4QN86lMpLk5LZAsjQX0X6Qev2LFJ3HwTdE
	5EjRoI/kXXFAAVtd9I5RdgckrPFpIjZ7P7aY6xQATRle1ZrxlRHYPLpWMLdgDw9a
	pa7aEFmERc5OkGWQFsKKdwfyy/XXIeJu8A5eLz2QnnCBMvvuTO4S/KtvSIzfcZ8i
	ActbYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq10c9f4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 01:02:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so8176505ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 18:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785286944; x=1785891744; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cldnTlUnYiUKgS9zCH3XKTJ60sHQAPqOMR+1/qGajTc=;
        b=ALv7z/fdWQTo7B+9tYcqmrgH51ut19TZX7/D25u37paVoyZRSxvaZUaAYrSfC/uT6P
         unS1FGvwSiAdfJDVXGsKSil0qTHrC50jKqDvvz2M2Yidhe+Te62SsyOvMXZo6QtPD6B+
         gGrZ150npruJXQ56alxooHZlYzgjhoerD97RGTFmk6M/z7XkvJBCpBtMeAdO4H4WP3+x
         8q1ngZk7+d9HFoXplXQbCImvKmQu5Kd6YUWwsrmDsAA5BuN7oGfEE9vzwNRop5eT+zwJ
         G87+1tvNAP3gEm5KO0KMSpO6Tqmz9zCucRKk8IMYa4SZRXrk+IgftNJL/7eEnqz8sLAz
         DhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286944; x=1785891744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cldnTlUnYiUKgS9zCH3XKTJ60sHQAPqOMR+1/qGajTc=;
        b=S8GCrOSsI9sMp4dIOh6uAfaI2XdKNTUceWccdGG2hKkQbjnxFxZFXGaR8GN7QEi2Vf
         YsTLje6ln9NjzVp+7fTnAmAM5yb2PjuYVMJ5Gyd4xi9t+OlfIUu1/abA2MMEz4hn+6sb
         zhtQHr/W0iBttlBBIvjHMEYRUuijduEuwX5ssz8wJvQOegdtcTjpvKRobi1BJiG9hdVS
         tKuk3K2EZc2T+DnpllZA1X0LSgtvN+HIW2lWi8FU9dGAddFZy5i9fNIbI9kQDQKFYje3
         c4rJpL04i5RALbCaQ2NHQ/aJ14w03u5U61PepydZAkRIPNES/14eeyB5Qgj1V8aQrvTb
         qZuA==
X-Forwarded-Encrypted: i=1; AHgh+Rpahv7D0RX/at3vN3U3bruxDbNC4qea/2iBjzLLtShBP0bKRAq7UwJKHriqv/2LMIvGPXd477lFAX+6wDZ1b2OTWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2UxeqNdkmDacRRgcB3Ygivg9RDQtxUv+XyQufOCUm6POJBsU0
	uC3eRJOSjwWnO6OCliclHey6NIViIAsstEGC9Y/PGou/XecFbbfT4s5BrtRXN5VtjlmFT1LUsPH
	c5/Y3uF0gY+EYKyPxW1Q8093JXg+JZxRhEd01K+fBu+6vbU0ODIH7hzsk6pF+tkRClgbSHgt7Z8
	H6vx5MnVc=
X-Gm-Gg: AR+sD13yzpY5IQ2DnXEqU5HvsLeZtjbNDEMq8Mfr82De1HP7USTNHF1TmtDGHLfZ4cj
	0ipQZj/DZ35kncqEG1wbrPv3Wc/BPjSS9iyCzmqhpcdutl29+ppOhYuUSf7B0CKrGTr9PoJ/0h2
	cX9KXUSf2cVVfwQB52bgH538E+kORPu6ULdQnA4B9KP53HyjBp0FlPwey7pH8HygxgqYf7SNiV6
	+Pnz0O89LERZQ2ifmO4nVO38O6rRmJzn4Squvbu2oVbtBTQjt8XOtJJkE3pGemfuvRoNGaCKbXW
	cTWfUDn37PbRmGEMmvAHsZZ/OeCkzFaqYIN8GpFaFJBGkXYXb7L12XqwsIIrMIz8O9vVmdcHgob
	VpMaVcise2x4CIXZzWVoXq7/z3YE=
X-Received: by 2002:a17:902:f543:b0:2ce:d5e4:2fcf with SMTP id d9443c01a7336-2d015f3fa7fmr51633195ad.42.1785286944551;
        Tue, 28 Jul 2026 18:02:24 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2ce:d5e4:2fcf with SMTP id d9443c01a7336-2d015f3fa7fmr51632765ad.42.1785286943994;
        Tue, 28 Jul 2026 18:02:23 -0700 (PDT)
Received: from [10.253.38.40] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c55a7dsm3237095ad.84.2026.07.28.18.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 18:02:23 -0700 (PDT)
Message-ID: <2ea06f45-ba2e-4745-bc49-7a6799531b0f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 09:02:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose] wpa-supplicant: add PACKAGECONFIG controls for suiteb, wnm, and mbo
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: miaoqing.pan@oss.qualcomm.com, gaole.zhang@oss.qualcomm.com
References: <20260728090159.3864155-1-hangtian.zhu@oss.qualcomm.com>
 <DKA6WJ3DRSM1.15EVL7LBX6ZC0@smile.fr>
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <DKA6WJ3DRSM1.15EVL7LBX6ZC0@smile.fr>
X-Proofpoint-ORIG-GUID: Y3vJBFYPwnOdH5GQvXkWTf2rEJ4qBtdZ
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a695121 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=JCnTOS9uHKa4kWWIw-UA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: Y3vJBFYPwnOdH5GQvXkWTf2rEJ4qBtdZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX4HKRp4AJezvs
 A+gxDAPVglnNdjBFI1pRYbVx9xZKlv1yojw/PbDD3prtUnfcuHsZGlmJb0E+jaixK1Xp8e5v8g9
 zr1oso1F3x8ltNW7SpU8weQ7UXmLdu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX7+KxZXreYA6h
 WpTBpuAiJRlm0NVHfch7Or7XFHQZ257e2nAlMAYvvwuOMGuV2J0VdxO6aX8XCdzPODYkAs+gtNP
 cFhmPlgwM43mJdLxLQ11EuCBhm9j85FgSQ8IIVRI+UQLR3T0gE0GGhVrZxdH7FR6sYz1CWLVegs
 Dryu84zq24LIh/Sg5DSuOqsaJr3rjkgqzAC+ahyHySNzWOce5IRpu0x54Ngs4pjZLnHvaYnitOk
 hjTvZ8zXKm7VLFSNqILeXOzgBPvn/hl1RYRbNdMUoRTnydYeNkxhb5q2VKZooeEUqlHSMUSobR/
 OalvslIYcaH6flJQRAqxfxX66XZoU2FoJvz/b5dj5SvsQOncl7HpHOQ1Hx8543SbqHzYq7k4Xma
 tCfuFk6w42fu+fTVumNeoOXcogmfpfks+/Qb2frisUbjfXofFx7+lVeLlnFXVbNZhWV9UGvqMRF
 cMt64F/yNAPymL6eF+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 03:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242226



On 7/28/2026 20:06, Yoann Congal wrote:
> On Tue Jul 28, 2026 at 11:01 AM CEST, Hangtian Zhu via lists.openembedded.org wrote:
>> Add optional PACKAGECONFIG entries for suiteb, wnm, and mbo and map
>> these to the corresponding upstream build flags:
>>
>> - suiteb: enable CONFIG_SUITEB and CONFIG_SUITEB192 for
>>    WPA-EAP-SUITE-B/WPA-EAP-SUITE-B-192 enterprise modes
>> - wnm: enable CONFIG_WNM for IEEE 802.11v Wireless Network Management
>> - mbo: enable CONFIG_MBO for Multi Band Operation extensions used with
>>    BSS Transition Management
>>
>> Upstream hostap configuration keeps these as optional capabilities.
>> Exposing them as PACKAGECONFIG options lets distros opt in for
>> enterprise and roaming use cases without changing the default oe-core
>> feature set.
>>
>> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 38860938302e6167b1c890b75e808f3a4ff08805)
>> ---
>>   .../wpa-supplicant/wpa-supplicant_2.11.bb        | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
> Hello,
>
> I'm sorry but PACKAGECONFIG adding new features are not acceptable per
> stable policy. I recommend doing this in downstream layers.
it's a cherry-pick commit from master branch, by adding PACKAGECONFIG, 
distros can opt in to enabling these features.
>
> Regards,


