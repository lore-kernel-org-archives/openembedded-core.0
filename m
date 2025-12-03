Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E167D1268F
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 01:37:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5109.1764725820097741889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 17:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=d3Ud5P6s;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FpNiOki5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2ISlsJ4130364
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 01:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfKjU1QLaFm9SMsdCG5iBab98K2I2QmVFSrjEwJX1q4=; b=d3Ud5P6sHIYRCHHI
	Xu3fT+sd8R6+PcIjg8rJTUL/QbmlKU1RkRMIuIzzzEw6lhSJAmGR/b1A8vr/9C4V
	xpxkmu4ZrxSQa3RzjvD/y8WLkSpJHrve+tDXPFvRrQ8Jwnc5g3sact+2e6dyq1zX
	FIQ0ESIrie1VGyEYCkxFH40mJVKE4FnP2XTOlV30FprWdn3gwbhCJBo+ekX8h+Dd
	7dcay9kMy2H5ToBLDQ6g68CgqV/j2Q4sN324IF9nCXhrd2+szLsc1HqHE2GMMzHT
	GFPvvxMhKgCEeK4zQT99E5e9m3jIb6QQmGwU/ufTWGtqypfHpH793IMd9YgwvnpY
	uKMqDw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5e7909h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 01:36:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8ed43cd00so6156100b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 17:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764725819; x=1765330619; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfKjU1QLaFm9SMsdCG5iBab98K2I2QmVFSrjEwJX1q4=;
        b=FpNiOki5cRJiVKvnPoohbRwcqIseWB+skI2TzfpgyiVVatioybMMcjdXuYODT1zSzm
         6sTqemoR6nDd9pizi9zIbajmFSF+ZFrgPnt6BxMkbypZ/TP4zl0gGFbe15FBc5en1onO
         OMgrWqsTbA7VbvO3PvPYdjr2fiYwE1P04irsglWHo3vZHOpJHYTgUIbMoAzaWrFaY4oA
         NtO5SgpNpcOxN1x9tFQvcjBSd1udz587mGizDE6ie/GACU5+0Gn+HxqK+jbv4fAZviGp
         swYGZGQv2s5OhQw9xueXof2Qirkzt/OsJ4r/IIHEPFjsbgT96jIsD01Nce6O5OzMftNX
         33sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764725819; x=1765330619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfKjU1QLaFm9SMsdCG5iBab98K2I2QmVFSrjEwJX1q4=;
        b=ujYAp4iwH9F6I1yernMw718ABZuIL4x4RBqs19SHFppjI8LR9yMe14Qut+D8opxw6E
         z8kvD3uk9l6gl3QfUFpY8Q8SWqXw9D47X4iEvcOg3aYariwzJb6ZOAGlS0u7lpSUOx0Z
         ABkZkfo2M3blLIyBGqnT3RJj4454Ejfi7fao+XipIGina6Jnda2cAufdKuJTVbJjs3kS
         9MZYpCR2HLfH7WtSj4VM0aoPvhpjzqG4eXJ+swJ9bj6BQUkfX/EaTZqXg/7Ps7/mGQjW
         kzdwyUuD4b6S8dCqeB1WwzJmEq4vVmGFnqBFydvSiYmy0RAMostE0hKBalXkXmaVPVwn
         ixJg==
X-Gm-Message-State: AOJu0Yye52vfOVZSry43g5YZX2aupNXEfeOk7LL1oJbKUK0xD/tKyaEf
	QrDuSwKfr2/fziqvuirSDZokuaMHYW16vJTqbxSYlcNCHRaps++Ho88RkSwOkJYbCbPsrl0Hadd
	7lSMHRPUuDHhJ6AU5+HdLN2dZ68WtijFe0sDOwssAjQrY7XTUVf8uf524pZEG3DbLrVG9Mfj+Dr
	DyLKDxYt0=
X-Gm-Gg: ASbGnctjOUm3QzJLhTgnkdXzyQB88E34N6VvyTppvq2t4a6LnrEddxYPg+vUtkoSqdk
	ikikL1UoiLztpdAfjevyqdLmI93oGYqPfDQuQgiEdH+2Ll4zT3XL5kZZnSRCzOYve6JxA/C7Z9S
	WY89rg0/Z9mRz0ksHq7VXzhztD5G2PD3njcWnxK1u3fYgy4wXwdrA94jWWOzis81yz8DvXp0nQr
	nliITVv6FX6BUvCnuvYybuX3xVw5MlgTKyqgqwJDG2awYqMHw1q71qH8T1IPRPmCB5MFtOYX0Y6
	y8wCnyYo+5pnpCfCJxSbmQV6vhtkabGdBbtOihwxn4/Ct5zd7wIBWv6PhtDlrrNj7DB1nkLqyjk
	33X/FsdZD7Xs8BdRmMblAqqGFx327D/9RqkPo5mt1b4WpVIYmqglF77pP9qJ287O5QU+6zQPlLE
	/+H+S/
X-Received: by 2002:a05:6a20:6a26:b0:34f:ce39:1f4b with SMTP id adf61e73a8af0-363f5e25339mr945634637.36.1764725818712;
        Tue, 02 Dec 2025 17:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7yBYsT1ZASlcPhrpbJEQjdb5bkimtF+0KEmD4XZPqLUSTWI3oFVxHv6ik//OZzHZs4moNHg==
X-Received: by 2002:a05:6a20:6a26:b0:34f:ce39:1f4b with SMTP id adf61e73a8af0-363f5e25339mr945607637.36.1764725818141;
        Tue, 02 Dec 2025 17:36:58 -0800 (PST)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151acee53sm18219424b3a.24.2025.12.02.17.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 17:36:57 -0800 (PST)
Message-ID: <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:36:52 +0800
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
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAxMCBTYWx0ZWRfX4+VrblDpTuYY
 15/3p4da8UdjuswKuND0nodzh4DMk981i30iXfrBKj8/DwB4Se5NbVxhldg3os3l3pEJ2SL5Fnk
 GwBg6vFulxnaevo6NBhGLHtO61K6JHiHomxhgiLH1MAF2rbUxrxDdaY+ZH2Sz3mSBAsv6PBbQgo
 xXHWZ5vhcotByKIxxrdhfkFnI7xEb/xl3NhCzyHr/2xCxAG6CwUNTLLy/YBQ2hefTIr/tQrLbdt
 OSyJRKVKf7a1CTt4s85SQhVmOjtjoa7ewpAouqHkUbheoqJ3D8tLW2Bcpo2NFPY5ykBZ1e3Wgxk
 yy2VC712xTpneCNNieJMdNiC6y+nliHvbAYPoNEwxGnCtWG82fapyoZeBdxY1LRvfD6ZAEnE928
 jjiVkz+NPittKgOeZVoOnQFRbWwJlQ==
X-Authority-Analysis: v=2.4 cv=KcrfcAYD c=1 sm=1 tr=0 ts=692f943b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yaAG3qJ-AAAA:8 a=EUspDBNiAAAA:8
 a=VRl91MJk67P3yT7-KngA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=oLVlbjkABFOu4cUI0CGI:22
X-Proofpoint-GUID: uEYqGAsJIMNjB4ffnRmvOyUsDnmGlc-t
X-Proofpoint-ORIG-GUID: uEYqGAsJIMNjB4ffnRmvOyUsDnmGlc-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 01:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227197



On 12/2/2025 4:02 PM, Alexander Kanavin wrote:
> On Tue, 2 Dec 2025 at 03:12, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com> wrote:
>>> I went and read the commit you reference:
>>>
>>>       wpa-supplicant: Use upstream defconfig
>>>
>>>       The copy of defconfig we were carrying was from 2014 and very out of
>>>       date; drop it and use the upstream version with appropriate edits for
>>>       our PACKAGECONFIG.
>>>
>>> So this was done for exactly the reasons I mentioned. Let's not go back there.
>>
>> Commit d97bedd8bdcc ("wpa-supplicant: Use upstream defconfig") uses the
>> defconfig from http://w1.fi/releases/wpa_supplicant-2.11.tar.gz rather
>> than from https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/defconfig.
>> In other words, the copied defconfig without any modifications. By
>> maintaining own defconfig, ensure a consistent baseline and simplify the
>> process of enabling additional options.
> 
> It may be simpler for you to copy a file from upstream into oe-core
> and effectively make a fork, when you have modifications you'd like to
> make, but this creates a significant maintenance burden for the
> project that is already stretched very thin. How is the file going to
> be kept in sync with upstream? Who is going to do it, and what ensures
> they suddenly don't stop and disappear (this happens all the time)?
> How is the situation described in the commit message not going to
> repeat itself?
> 
> Neither you, nor Dmitry are answering this, so please propose your
> needed changes to upstream, add them as backports, and devise a
> configuration/packageconfig mechanism in the recipe for things that
> need to be selected at build time. I know Debian does carry a copy,
> that in itself is not a reason to mimic them.
> 
> Alex

Add Jouni to the CC list, he is the maintainer of wpa_supplicant.

The version of wpa_supplicant in oe-core is a fixed release version, and 
its defconfig will not be updated. If we upgrade to v2.12 in the future, 
the corresponding defconfig will need to be updated as well. This does 
not require significant maintenance effort.

