Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB08C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 11:50:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.8545.1749815393979278118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 04:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UimAWG/r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7H7cD026015
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LuDyAJwcstesfvNwp/ybylzedsPcH+/Ln06Nq7kwpSc=; b=UimAWG/ri24YM8dH
	gA3PADM4ZH/tyHE1q7+jPemNqcBNJEyhqDmcSTtUUvA/o0MYub7u18XRGM8blW2q
	feetEO8rKsVgLsQAeSwm8BrDtJ4D1MUlL/m7vyvv7ifFFJ113lTHBY+ffBYlocM4
	gyPT1Z/UASrUijBULKOa2oGuTZVDZorYQHajYfaEdnf3+EnvM1YEJFM/ih7gNIzp
	Pe4CXWmqFBMp5/HoXDIys0Ma16SP2PIxubRfKzJGAs2HeEcHUkateYs9fu0/jP3b
	3bMGVRnnkRajlpGpQaY7xUOZbSMzSfFTLJnwquMWkF8dwfAwQmd+LsLYBgR8lt4W
	G/u6sA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2ye82n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:49:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234dbbc4899so29413545ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 04:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815392; x=1750420192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuDyAJwcstesfvNwp/ybylzedsPcH+/Ln06Nq7kwpSc=;
        b=tf/pdWckb7un2+sfwONLFqdfkTMkf2k+dy5ypi5mptkyj8fiIeMakg3eN27Zv94xmd
         Wt85Nb8yg3TnvxWAWSR+ZWc1tWWaocw+bbae/tgXIh/pk8tQiTqe/iM+BMAcvDpc+67l
         RubquFdmSo/Pg6BEIyLwFJN7DVD+A6/M/cEiKKRVD333d/qsNMu/4ImvACB+8WIPgDzI
         WLtn39QxQsH1+C3lLUgEnZn62e3IhHFj126X87YS4diNljxolyToWMF8vpjbFVfbqHQr
         6FZZ+eR57jiW3gevwnqwAN4pYgwHkLGvgtwItwuHLJ6G8FR33HoPDwpW6wigHSCeqqff
         i3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVHLWt0sNQ19eZ9RY8pzEMM5Nk3k+sbUPZbKHAqSDyQmaEpTlOOnpyo8jMwEOiWPYDv4Eq/0uGmMhmFSupRllQb/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyUvfYbhPCLn7UT8os3j/KIbodKkctnNnaNSjhmg2btal5cCSY
	JUCtW0d7jHi+B4a5T6nNkrt5Et+LEmTV7yWXvZhXpRrGKTUlq8i1Iac+IgnwgXUUK2I/+Yh36Rx
	jbe0bNxsAjwai9+nNKp7zIRRQjv+gR0xVZfFBJMKfmmvNNSxbdmth1zlUB4xGuqJeF0sZZ70XAh
	oGi5sS8Hj93stQtbOAnAFnZnTcBPvKAtGKBvd+NsAI6QSlCGWRqZ8MKO7vEg==
X-Gm-Gg: ASbGncszb/bvyPsuc6d7n2OMPysOCJrhbMyHf0mt9lhtk1NVLaYT0iZ3xHesURjU8nl
	U1R6qzGpCpMqSmOoq4yeFjlktV/+1GCzW4jRTlwmQSAK9KycYOo/L9XLon4DyT7dRSmX1x6Y2hq
	ishSpP
X-Received: by 2002:a17:903:8c8:b0:234:eea2:9483 with SMTP id d9443c01a7336-2365de54dd9mr38494475ad.51.1749815392550;
        Fri, 13 Jun 2025 04:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8ZlA3x51L+HxV7vvBQ5u6rYFlohd19hxG3AJXncvGMTOR5vG2mC9wEjC3F1STUhknp6fC3ituIrXEjVQleEA=
X-Received: by 2002:a17:903:8c8:b0:234:eea2:9483 with SMTP id
 d9443c01a7336-2365de54dd9mr38494185ad.51.1749815392145; Fri, 13 Jun 2025
 04:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-0-479632e13175@cherry.de>
 <7277bf5b-1140-4d1c-8e89-168ce6cbd873@gmail.com>
In-Reply-To: <7277bf5b-1140-4d1c-8e89-168ce6cbd873@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 14:49:46 +0300
X-Gm-Features: AX0GCFvo27jzadEGrtdlu7E7gSs66hXAeTPM7sOmUqBLlNDLirA-eMekJdp8qTc
Message-ID: <CAO9ioeVnN29=E26momM+uBDT5g-3wXF6KH3irv40tUK531hscA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] mesa: disable building nouveau/r300 on
 non-x86/i686 machines by default
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: foss@0leil.net, openembedded-core@lists.openembedded.org,
        Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4NiBTYWx0ZWRfXyqtPMuxwK5cW
 CMxNBbzYXwWqPFPbzuptsKPvWW1EFdI2a91rQtHqO94xsygPvz1RrAg4pUETn5hz7JETp0mpEY7
 omM8sHmphri1AwQFUo2R6AlQ7UHw3gqbu/YVFVA62ap+Ev4C8VQQhyEn4VUjLOW3fVWChDDkRPa
 STBvtkuqr4iiAQMpfpvP09dBONmdd1rx4SzVyo4DBw9dUyB+huRF/p9xA4BOuTB0mpo2fTK9bCs
 U1Yf5Okz1T2EUNrwQwfni00GpHJKyq9Z17kHi4y2iuPOVeDbY/3x0SQu9UsJGPF6AkU1X+igdqF
 Z0kVFhRJ31Cp/GIYCiN0WgJYOFTCKGdohXPVtWw5LItxbOXXgmTknxbaWw9sw3hiTuJySp7Mg9h
 JXTz0LGQYOlRavQvxPELEVt1v0tsgeZUI+EOoud9DOdGy5Gbdrkgg5lndALM3GfRo42M93at
X-Proofpoint-GUID: 0mCC4ezuWhfx3Nn2HKbq2T8WxTcAzIfg
X-Proofpoint-ORIG-GUID: 0mCC4ezuWhfx3Nn2HKbq2T8WxTcAzIfg
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684c1061 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=j6Mij4Im-E2EUdQU8O8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=899 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218593

On Fri, 13 Jun 2025 at 09:40, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2025. 06. 12. 14:14 keltez=C3=A9ssel, Quentin Schulz via lists.openembedd=
ed.org =C3=ADrta:
> > Whenever building gallium-llvm drivers on non-x86/i686 machines, we
> > currently always build r300 and nouveau drivers but they aren't
> > necessarily needed.
>
> How about r600?
>

r600 is already gated by the 'amd' PACKAGECONFIG.

--=20
With best wishes
Dmitry

