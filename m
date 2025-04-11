Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41218C369A9
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 10:28:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.22563.1744367277312373286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LmcgrgHn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6G1G1030687
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAhNTF7KbwJAhHMWCKe8jR+I81SB1v24cvn2izkbemw=; b=LmcgrgHncn56ZSFf
	WIK88oiX9UZgQxhomRwU8SWm00Tei45co6RTcuBldL8fB/ML9ii+RmgV36apvxQ7
	XakEs1r9hzI2oykYwCPcLvznf4kTtPxtNmlJLMLjouLEDNCBI5nP1g8vYXz+3aLd
	+BknSGJmVBK8MBf53221jRZezOM80kQDmSfei7W+h1DuPv83AyNxZMCjrlAP9QT7
	FF5t4+uE3inNCwu2wWUeB2rJRjq4e11hd4A2q21mc3Ll75i4cfH9QvidG7Si5UeK
	N6cqqj06bUg6DK4An9Ka1WZVgy3P30KiJjS58XgzocXf8fnPXNKQEh6TGTTkczBe
	jxgsAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftsuuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:27:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c544d2c34fso265860385a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 03:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367275; x=1744972075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAhNTF7KbwJAhHMWCKe8jR+I81SB1v24cvn2izkbemw=;
        b=KQlPnx+3GG4zPh+6tGj2uw4kYGrLwCST9FxE0BQg6W2eujW89NvZKHs21C0R/UDEKl
         HsHEXrJNXZrbt0OJmj739NRjeegtK+VCw1Ic0hHrAU6XcUcIjuQiMlg4FCuPHUFyeScE
         IjcSWYlkeR6ewI3vqeZZuKRTkja6+h0GZeytbLfKs7TA458mO+ZDb2d/4JY+jbXp4MRR
         SxJItHBaMyQFyBzq+SG5D746/YFSUNxsxsc/YNlO1TlKfN3gvtiuo/MobzAkHHm1PEIC
         y0wzkkze5dL+t5GyCTtwlG1pSd4i9ivPcmihyiZtlXgYop4HS2yiLYByvldZLydWRJWy
         WlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2t9wvfh4pEOmaVJPOQx6N7BZlbhqqZD29imxA8qa4O8rsIlCoSsIBsUBjvp4dFwZ3ss4mqJmMjzFtkSrU8YVbbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzlXylIc/FlpkQF45t4BVJlx6c+AQT/rPX8HlGNcgAw52XYshX
	QirmTRW4atU6lWEzx/aiO8aUWIlO/SBt5jXP7UoAr0jJCLUQXYJvW7T7hbD/CgVfPWBYNOJFSHq
	auqs1HccNS7Xpl3FQakAGHB5st3wyRlifdvFQ6OMNahFGEfeac7WydXmfbFkO1APmzvzeA5JbmO
	wmWzM=
X-Gm-Gg: ASbGncuMSPRJQGDWw9rkabodBhoQHeGaKc0hV4KFB497DH+CNNKmEDPjElFwehi1+7h
	WBkHvqiTIj9YnSq3zIvBsslWPL+QMLAsa28gqBF6Wcc0hp6qUrSYFuPCTZDwZW4mmZ5sYgzwTmh
	5GaIAc6UT4U5ocyELzCj3Y7YCyKX2aFpup48cYNfnFRsdz7phWlBUm/1QYejXNvKCkuIkv3mFDA
	xnGZBDxv8BYIbP0rt/m/9Hq229FO3x7ats/AvMqnvbZPKJMRjRroVBFPo7bYBmNsSm6i318F8lQ
	USn5rBHoIo3RDAO+yMQKGaFfZog65k9r4t7gyVUTqbOv3qm/hUrWed5siQ2xWUqImo4=
X-Received: by 2002:a05:620a:25cb:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7c7af20b1b1mr337915985a.47.1744367275412;
        Fri, 11 Apr 2025 03:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvApppr/j+aFuD1rK0REJ/IQo0FMQv3oXTQBgdC29/TEg2SY090MTuVhVpIutY/qhhTcWpGg==
X-Received: by 2002:a05:620a:25cb:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7c7af20b1b1mr337913485a.47.1744367275083;
        Fri, 11 Apr 2025 03:27:55 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5170a3sm402646e87.210.2025.04.11.03.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:27:53 -0700 (PDT)
Message-ID: <70709363-e364-4a7c-8fa6-0cdbe772a01a@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 13:27:51 +0300
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
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8eeac cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=OohN55oUiUWgp0WuyTAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jcqp-1yHfz1t9U4MXWg79D3UAbpDMx1Q
X-Proofpoint-ORIG-GUID: jcqp-1yHfz1t9U4MXWg79D3UAbpDMx1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214729

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
in the lib on its own.

-- 
With best wishes
Dmitry

