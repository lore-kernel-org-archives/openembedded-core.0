Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4F3CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:51:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3218.1759783887274517686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=jkfrFo5N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FESvK029512
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Oct 2025 20:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acayiPmxMZTg2hsvbsA/hefDbei25Uxn0YlYvgHeylA=; b=jkfrFo5NItcOLMQR
	KOZklC4NiuT/5dQ8g3tc874lYKEi/6txoerSoQDfM55kLsVDPmIafRkvcUApTb6c
	aPl9SFNujksCeHw8wIc0T7VGStqDEcevx1E1gOY6N/vjX4bUeGo+C32CqqkfWEPV
	LBZy3sKWGhusfEUiX8dbEMhMXRHrzmUn5uhBi33XoXeeCTojx7DxM5Jp/paI0WWq
	N+kBknMVUiU4XtGpajKF+ztpDKnRcsE8IThElS7ikH3ojHrr/R+E8M6IAN/KyOnp
	BADyNdHB3/479mTCPSWVkd8vyoQZNZihQh7rEJ/2T8V3Hdvjq/ANqWH4VK8hRfQA
	KzYW5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgn61j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 20:51:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4deb67c61caso147932261cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759783885; x=1760388685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acayiPmxMZTg2hsvbsA/hefDbei25Uxn0YlYvgHeylA=;
        b=TiTZ5ZNaPogKOLM8DhpS8jHvVVqeIiqgUOVuqpBKN9RrBAYiXyW3fR3zK4aux9fsvD
         if8MBMvO4+hSMHJEf8QE++i4N/lplshp6banBOBzGP9ZxEWARZwbYFeh4TSaBW0p2Zi7
         shH7esEM2KpAC75WBugRFX9I5zF1kzQqCx543sOXJcqRXxGeci2gBwR3d23XtWKzYV7Y
         SA0f/A1OTcu0cqbiCVIov6URKtHLXpo1OEiwcYdITg1pPclE/wJGxIo4/a+5UthrnhBj
         y21J6opfn3J7d1GrbhysL/p1sH0Em+nfvuY168vw3HObzZiYtcQNCIVgA8fgdQIVFKnb
         VIvg==
X-Gm-Message-State: AOJu0YxmcLjBu7+3iA/n+nKLmtBgR8YhneV0TQPNOOatzm0K4C3qruNq
	TAOP8708a9CCu5CJvx5IbmSdx6t7Y+ACZRvdMNhfjHs6x9tOFDP/VYfEOHiWJ8i52OXy027Xxe3
	jEMcIQc4Bu+5LJKt7CpGcrwfDkhtHehVbTIOBVA3RkZoG42Jt9QVcfIGsIs5XqvsuLNZIMjlhF/
	UMj7BUfcs=
X-Gm-Gg: ASbGncvcHtgCqZ/gX4JLgLH0J8m6OQl7rxbufRFG43IFmRhgN3D+BrUDYydbjsi6rI/
	6dFhucmC7TCyv5Bf4GL52JjLpI7UhPGVBgzFn/mm32WBwrmJf3s8NNvd4nL3Bdr2JQuoR1XwTjs
	g5f/6iqXsHcCaU1XGlUpo0yeyks6HbQitcuSr4SIf9T9lCKoe8eVZ3u2mSAa613WJglgsosePQm
	Nfk/oWzKP0NdirNfv1xuptOO98rBcYx46B4Wx85LzKFgphcIhN4AAVVyHEQdRh/lezjgSCJVg/2
	KrB9er0EGqBGjzLO/BXUaXkBu0GtesUMkMUG74L0w6I1MPKLI4wK+XGFCbF13/bQqW8DrHa6fjY
	vszFCo6uktqCJFClLAXSDpeOGR8WbGwcJDpjxZKv+D5fiPIUolPEWDWqITo/BexmKO5rSuQ1tkf
	Xqvkb75f/yUStjjFUdwhtzdBU=
X-Received: by 2002:a05:622a:4a14:b0:4de:e0:de78 with SMTP id d75a77b69052e-4e576b09856mr192756791cf.71.1759783885348;
        Mon, 06 Oct 2025 13:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1oQnYJaHAps1NrxZ7fbS84pJQi9R6xbZ7qQi3x6Daa7xt1hFaq2mvHHRzjy0hNONKN8sI8g==
X-Received: by 2002:a05:622a:4a14:b0:4de:e0:de78 with SMTP id d75a77b69052e-4e576b09856mr192756401cf.71.1759783884648;
        Mon, 06 Oct 2025 13:51:24 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a7:bfe7:c886:d4fd:b8c9:2e72? (2001-14bb-a7-bfe7-c886-d4fd-b8c9-2e72.rev.dnainternet.fi. [2001:14bb:a7:bfe7:c886:d4fd:b8c9:2e72])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011af752sm5406605e87.125.2025.10.06.13.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:51:23 -0700 (PDT)
Message-ID: <9179d213-ebd5-43d9-8748-6981807c29f6@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 23:51:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-demos: split info tools to a separate
 package
To: Ross Burton <Ross.Burton@arm.com>,
        "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
 <feae4e64-0969-4e02-84b4-3ecba5e41a02@cherry.de>
 <282130EB-8DFE-45D1-A1C1-B7720DCB615D@arm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <282130EB-8DFE-45D1-A1C1-B7720DCB615D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX5fu6OYUrTzAS
 Wnr9T0cIlutIa4vy1NfmFirGD12R2syiLvdEnQPPuuI27SvuLc0RbsfaoPcOnSBYMe/3JbyKJHg
 L4xjgimYo+0RdqhxrwQR2G/iS7SFQaR/5VTtpbgLoRdHEXef1zR71Un9CXQ4D1eJ5J4/dM5WIcS
 8yqsSl/FyLh0iMIvw/Xa+dMLVSTTAl4o+ZORrXbupehwtgibaI/ClFdcx/SoWj6yGQ0S9HZp/j3
 5zh1T5Y3n7ESjmBQmFEGcpr4g/L96Sp74Znw716a6vFeyHE3voc3e7S5rQ8n37QY9mKcPwLe7LK
 gn0YQ3npDOL5UHHwo8dx3OoyY7OLjB2+AeaH24VRYki49/oWoxfA9NxY4bwrHfqnhMfoEXJIPGW
 +ccn6ablxNg6l5RGM+NjE9xhD+Gk/Q==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e42bce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=Q4-j1AaZAAAA:8 a=8q9CGXBrk4KCfeDiTLEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: seWEpKuMjcpUX66rEhnCm7Xvl1rp4Pj4
X-Proofpoint-ORIG-GUID: seWEpKuMjcpUX66rEhnCm7Xvl1rp4Pj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 596FESvK029512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 20:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224505

On 06/10/2025 19:39, Ross Burton wrote:
> On 6 Oct 2025, at 15:01, Quentin Schulz via lists.openembedded.org <que=
ntin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>>
>> Is there really a dependency from demo applications on the various inf=
o binaries?
>>
>> Can you justify this dependency?
>>
>> Otherwise this looks good to me.
>=20
> I=E2=80=99m not Dmitry, but I=E2=80=99d imagine so that if you install =
mesa-demos you get _all_ of mesa-demos, but you can just install mesa-dem=
os-info for just the info tools if desired.

Exactly. The distros / users might be pulling mesa-demos and expecting=20
both kinds of apps. Let's not disappoint them.

--=20
With best wishes
Dmitry

