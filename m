Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70180CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 12:47:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.8142.1761137227590980386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 05:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ughj/339;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MB0X2U029817
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 12:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxxQ3Dkcf/BZjHpL7AEhKim+bTXDd5uf1P3B1tDwNMs=; b=Ughj/3397CN0k+Uu
	Y+zVlYZXt8uu2Fsi/MYI6NH5gDTFZOlyHwPKBE2w/3pr23ul0pCG6ur4KEE7bxqD
	DADJ19eIopKdmxVmgrV28c6aeOnBie1hW8uIdXbsDOoOkUiHZ8ZsKoaOZHiW9TlD
	5wfKDGBFnLEiXwxap6q+V3SVSnJv+JL21hmVikfqxwBYNYld7D+2GxhyrFtuJQC2
	1VAk5Ge8UxpeB2xHLbL7eqUAfncqvsPMEOvH6w1ygOXSADVGKxOVSN1aZ3hytEI1
	0Nn1KzKJhhPcdXsZgPWWHrNUOdfDYV0CKsCZ0ZDcV3p9189rkj91Cg09FIv6u5PU
	Dic6pQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge4m9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 12:47:06 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-63e2d3351abso5070189d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137226; x=1761742026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxxQ3Dkcf/BZjHpL7AEhKim+bTXDd5uf1P3B1tDwNMs=;
        b=enfa4ijDaONkxj2gU37V3NBftUwPpiMpw079BUh/VW8vCPf5OZvhfisHqjHT1sV39V
         0jJj8s/QzzJbJlO7fpH6wQDkgWlB0E7Y8jBxcsAg3b6xxcJ7jR3PhpZX0HVFSV/Q+lgn
         7HYyjhpB5ISuPqiz8QmmczxgYV8tXu8N+zG1xs5cCBSAGzJ45tdos5Fv07arwBgunwXo
         IhNGkFRRdoOQHsE60tCoW9rt6pPKcXzHgRAW+2mwvPRp68qLVuSgiCKMN3tLMD3eZ2vJ
         Mq6PkK3n/+ZHh2PJwh13wBn0/2Hw4iyL89Bl7ljuDiLyVrQxtlY2MJA1wkdS1bnTc3Qn
         pGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtWbe6iSwkogglWwJfMviG/olbzvictQJeB3TG1fw0JZSiM4lAQ/lMIefRE4vT9i9A1sFpVID6x6i4LIXxF9GwKw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywp5qANNB+K8c+6leXwrjEtR2JthFlqIjV3d6xuC0gEYbW3tOIv
	/jKzFw46X2CC6chCIQjRh+tVRlACzMxVcBInJiVCDg1b2L1W9ZncZALDuZWLaGvJTlb31Z8OIEx
	g/WIWb4gNv5HUYe15nRnKvupK3SujzwTTqr5vdqjvPVqMh35Ag5/jIveiaJXPjp+/HuHhXJSUKa
	+zjsm5+cSUSjqbKmcVegEHGmomo/Or5RBsCB6DjB9J5G+4qXktGI0BfSD1NQ==
X-Gm-Gg: ASbGncuBLJ/0fVPr/q9OwW70UQJng6nY5jdi+lWYJQr1efYfbCgGsBPJHVKcXgtRMqI
	riQX4dkN+87doDcF3Xvsdhf3WdPSJ2cjLrDjuDl8sCFbYeIJxAk8aK/KdFEM6hiTOxEUxg1gyOX
	WJMxyE0lgC2dOSYLkZU1Q34hWScAa0okQKFuqoJ4STPh1jdamhdajm4eZG
X-Received: by 2002:a05:690c:25c6:b0:780:fdbb:5265 with SMTP id 00721157ae682-7836d1c62b1mr318131677b3.19.1761137225834;
        Wed, 22 Oct 2025 05:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjRmROtT3gDHBZ+3/rji2zXDsl5G1cVTi92pYHF5vb+W4R+dfM3Im24mFCahuBooU4LAWcWAomdx7OOoOq6+I=
X-Received: by 2002:a05:690c:25c6:b0:780:fdbb:5265 with SMTP id
 00721157ae682-7836d1c62b1mr318131447b3.19.1761137225382; Wed, 22 Oct 2025
 05:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3asfhhUoscOusRRkjWavdC3QvqROuo4WvZnVH2O0sCsuB1oA@mail.gmail.com>
 <774.1760628588661308317@lists.openembedded.org> <CAB3asfj-fTNZiOpsysPcLGGB2X-SbLW95gVWqym_7zf4DCJQBQ@mail.gmail.com>
In-Reply-To: <CAB3asfj-fTNZiOpsysPcLGGB2X-SbLW95gVWqym_7zf4DCJQBQ@mail.gmail.com>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:16:54 +0530
X-Gm-Features: AS18NWCjyc5Jkuj1if7SmPQHPpYP5JFAFzRr2nkLMZ-OKc9_IRstvENBy-MPOPo
Message-ID: <CAHyS93oYYkpK3mQzOPbStBR3h_s-0m20HuL8q_QAyagQZUGy8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7] kernel-fit-image: allow overriding DTB
 compatible string
To: adrian.freihofer@gmail.com
Cc: kavinaya@qti.qualcomm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX/dEf46IOZbgb
 ZFHWncPszC17K6XiV7iXT0mCForOtoVbJn6VpK97D3oAagh/BChifNlJ5Pb69r/DxSV0pWpV5Bn
 aTD99Xi1Yv3mA8pQYTJpCShGuH1h/yhPyUWTLQCF9ohPm+QC39U2GKF0VNzzXorgwDME2sbJBK0
 rDS0ZpIPdsJYR9aNioDaEusYzJ1Sp1MGkKLGlXuHvtW8LsO3hqz91jOgNK4BTR/9+LK9+u79d87
 Qs/JxSN5W5i73uQv6BLDzFP8Z2SQTEjVEfvtkvf8m6+zkcacs2mApdeHdvcizRvTDcJcfqZy3E6
 AZ0dnFER4VpsyiUJHzhUSUOQUeh9cbgpUEFS1q3BHtkq2jco4iPY2sE+bV9EDXkhpxuMqiNFC2z
 rEaPK1fe2xrqvCm4k/IsBwkm3jK5Pw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f8d24a cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=TUU-_lIqmEzkpNw5IfgA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: P7dH-DqA5IyXVJJJy369HzOymFXT9BBS
X-Proofpoint-ORIG-GUID: P7dH-DqA5IyXVJJJy369HzOymFXT9BBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 12:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225191

Hi Adrian,
          Thank you so much for being so accommodating.

After posting the initial set of patches, we at Qualcomm realized that
our case may not have been presented in a sufficiently generic manner.
The current changes don=E2=80=99t fully capture our needs and expectations.=
 We
also felt the idea of modifying the kernel-fit-image implementation to
make it a dtb-only-fit-image, may not be the most appropriate
approach. It might be better for OE to support both options as
separate classes.

As we=E2=80=99re still finalizing the details, to avoid unnecessary
back-and-forth, we plan to share the following in the coming weeks,
which should help
ensure the right changes are made in the OE-Core layer:

1. Clear specification document outlining our requirements
2. Sample .its file
3. Reference implementation from the Qualcomm BSP layer

Thanks again for your support!

Best regards,
Viswanath

On Mon, Oct 20, 2025 at 11:58=E2=80=AFAM Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi Kavinaya
>
> It would be valuable to understand what gaps exist or what doesn't align =
with Qualcomm's requirements. Perhaps others have encountered similar issue=
s, and we should consider improving the core functionality.
> Here I attempted to organize the patches and prepare some test improvemen=
ts: https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/fitimage-imp=
rovements
> I'm curious to hear whether your final solution will be a combination of =
UKI and FIT images, or if that approach proved to be the wrong direction en=
tirely.
>
> Thank you and regards,
> Adrian
>
>
>
>
> Am Do., 16. Okt. 2025 um 17:29 Uhr schrieb Kavinaya S via lists.openembed=
ded.org <kavinaya=3Dqti.qualcomm.com@lists.openembedded.org>:
>>
>> On Wed, Oct 15, 2025 at 10:43 PM, Adrian Freihofer wrote:
>>
>> >
>> > What I don't quite understand yet is: Does this make sense from the ke=
rnel or
>> > DTB perspective? Or are we circumventing problems that should be fixed=
 on the
>> > kernel or DTB side instead of overriding them on the Yocto side? I mea=
n,
>> > wouldn't it make more sense to assign a compatible string that is usef=
ul for
>> > u-boot in the DTB without requiring FIT_DTB_COMPATIBLE_OVERRIDE?
>> > >
>> > >
>> > >
>> >
>>
>> Hi Adrian,
>>
>> Thank you for all your valuable reviews and inputs. After an internal di=
scussion with our colleagues, we feel that the proposed change does not ful=
ly align with Qualcomm=E2=80=99s current approach to implementing DTB-only =
FIT in the format expected by our UEFI bootloader. Given this, we=E2=80=99v=
e decided to hold off on upstreaming the change for now. Our plan is to fir=
st implement the DTB-only FIT support within our meta layer, refine it furt=
her, and then propose a solution to oe-core that support both kernel+DTB FI=
T and DTB-only FIT formats effectively.
>
>
>>
>> Thanks,
>> Kavinaya
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225096): https://lists.openembedded.org/g/openembedde=
d-core/message/225096
> Mute This Topic: https://lists.openembedded.org/mt/115767371/5192326
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [vi=
swanath.kraleti@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

