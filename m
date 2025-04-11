Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A90C369AA
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 10:28:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.22588.1744367270207030735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kaBm8Kch;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5pIv4032000
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rwy8FGgXkNeR2VsO2FocrAJiaNCN9EIn6gU6KYvgHGU=; b=kaBm8KchmmrlQS3R
	GNLNdM3HA8oAiIMRTY/0rUAVm6n27j7COG7dxO6k6m+E4z9JhEfdi2ICoyFddXSF
	MODqPDUJue+hwkuzzOkK7qW3z1cGocdHSMSa34wmo40fXMLhJt9v9mZHYE5fGs/c
	rjroHHe78lIJejyilgE71/e1+z8/82/EFcVtPqPdENUa1JelRKqYbRPEMeUTG7An
	FrL+10AGBOjdM1zJEPAMHAa82NPGGZy9sarG4h7VjAujPYn2yt4J6TUMmEcOLEzm
	h+umB6ynrTTSuLEeEd2fcfWyDzfPyMAwUaLZDf6j75kB2y2jHVEyM+db7mddFh0e
	wptMdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmj0cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:27:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so332921585a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 03:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367268; x=1744972068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwy8FGgXkNeR2VsO2FocrAJiaNCN9EIn6gU6KYvgHGU=;
        b=U3oFDxP6XEt972X5Andbwz3Rcr9MFiN62CYCt0m+Otj+no2VzPzcGpDKNhFSVtrPET
         chfiQPvPaxNekT3XHsBJEh3BQdbMYerMZpjz+BaG8u+/1PjQS+fq/CelTBSkQZjKTV/3
         Mhq5Bf3ev0UYCBb4GEr2J0lA0SSUOUvAOKnQr3siBOoIZa6P/TfbMvQMz8NApIs4artA
         IiTotCamQpm0awJi+9+KG3j1214FbAIbZYHiXUJhxu6zfE2IKBasvmDxzFE2z4u9V39F
         BF1C8qz8/NS+8tiEa4xfmF3cjtWoD30fxQoGKRgfV4qkVNNnNoCBnq4v0FdGDmqxmgO3
         JO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoGp23vZyuSRUA97nqnrxW06b7m/ANqv/u4qQmEeDte+EEuB9uBlgFQOIIxdbp7dC1MAUhGqhXM0RaJHhKKfPWtA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyjsi1jKSXGG9SonKLFI9Stl09KFTyMgaNuipL/VD4vV5FsOUbt
	EZIvGXnWX3xAhYXe9l7+Y4twKWlNEa5ve8nWLMH2z90IVaNQ3iLrNhJLwa5ed+BOI4GF1EXf3v2
	AVrYD2tMCBh1fo4/j1pyClM2pic3btfq9jE3+VzUUHdWmZbtQCbv67Bngz9CZ9ZpxEJ1CNoZPQ9
	Ap0FQ=
X-Gm-Gg: ASbGnct4lhVTmQJwEnY8/hoKJAC5wNFwgWSF5aiF1bJNRFdoXr5lxxH5J/QeY7CD/Yh
	LqGHbSIV6MrueflV1xc6ctcBNKuRUgmtazCEBASNfNjoQAYkpt/FLTiUZZh7YZwIf4LiNd0NFch
	yJtNb4divHqOerzqVtnhvi4K+kFpfd6f/dwyVQ++EeMcg1P2znk4ZSg400xcb98iLwam3HzlmXn
	paYno5qZNg1OCZ9707z+HJsrhxq1DSg0GCCRZ+A9Lj86froCOXLYqfIb+LdR+APWzx9DT4miSOX
	jnUqMQlWpXHt6DQa1TFp9QKyx4JSEtbIq4aYspwaeEOvYXZExP18mBGLy7U3in2h5gQ=
X-Received: by 2002:ad4:5cee:0:b0:6e2:481b:7cd9 with SMTP id 6a1803df08f44-6f23f1346eemr35144046d6.25.1744367268036;
        Fri, 11 Apr 2025 03:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuu9q6S1nZFvy6PNSJ2fUnzk6q0s/Woy/Q9v2qbqfEC9UglD6HuK7sHnnkGgMOCP+QRPILEw==
X-Received: by 2002:ad4:5cee:0:b0:6e2:481b:7cd9 with SMTP id 6a1803df08f44-6f23f1346eemr35143756d6.25.1744367267702;
        Fri, 11 Apr 2025 03:27:47 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d61csm7556431fa.7.2025.04.11.03.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:27:46 -0700 (PDT)
Message-ID: <f3a9d261-906c-414a-9c2e-322aad5c3d72@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 13:27:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate
 package
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
 <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
 <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com>
 <3mmfhxscjnsdpimcrsw72sjvumxh5cnjrntro3ko7etgtjmqzc@slvytxctp6lv>
 <CANNYZj_6bKTFQburZyBOq7sO_7coVsh_ZTiu+r2byWYdo4DYxQ@mail.gmail.com>
 <s2gh445rrjgnljexk25k2k5tnbf2ogkcrtb2twykoujpcsdype@yjgziyjlhdaa>
 <CANNYZj8yxBZZ9_j6OLKhp4q-1jwudHsikv+sN7EYnk9rG_Ohqw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CANNYZj8yxBZZ9_j6OLKhp4q-1jwudHsikv+sN7EYnk9rG_Ohqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ixpn1ZpwHmtOqFuaQR6O1-KQlzoN1TIt
X-Proofpoint-ORIG-GUID: ixpn1ZpwHmtOqFuaQR6O1-KQlzoN1TIt
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8eea5 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=OohN55oUiUWgp0WuyTAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214728

On 11/04/2025 13:12, Alexander Kanavin wrote:
> On Thu, 10 Apr 2025 at 20:36, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>> Can you provide a way to reproduce this with just oe-core/poky?
>>
>> echo 'RDEPENDS:${PN} += "libinput"' >> ../meta/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb && bitbake bitbake packagegroup-core-weston
>>
>> ERROR: packagegroup-core-weston-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (libinput to libinput10)
> 
> Yes, I can see it. The reasoning still doesn't hold water though - "we
> can't put a library package into a packagegroup for <reasons>, but
> fortunately it has some stuff that can be split into its own package,
> and then that can be used as a proxy".
> 
> What's the original reason for wanting to add libinput to a packagegroup?

To let libinput setup & handle input devices.

But probably I see your point. I have checked my Debian system and 
libinput-bin (rules & quirks) is being pulled by libinput10 (which in 
turn is being pulled by xserver-xorg-input-libinput, libmutter-16-0, 
etc). We will verify that in our distro libinput gets pulled in by the 
actual packages that depend on input even processing rather than pulling 
in the lib itself.

-- 
With best wishes
Dmitry

