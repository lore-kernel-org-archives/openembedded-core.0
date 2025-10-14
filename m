Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443D1CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 15:23:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.19527.1760455430509259404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 08:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Hj2QFHvC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Irc017781
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcPIfktbw+4kEWgLo8Lzyo/AwQDe0A5v7vqzDzybWDQ=; b=Hj2QFHvCVq94kibA
	kapFME+Cq6yoyV2ZRTAb8LzjZzclmPHUcUHme1NRN+n5LDD5pGJKclF8hGnZV3od
	XOJd+wSQxEExRTwqdIMeCTnqwZ6K/NEI+pLpY6oEwWWFAlsvttEVhYrKCDyq/IgH
	nn7XrmvXw9vUvUeuZtWAOMDaoD2ISj1jKlVupf9Azl/f7VcA5XV+IN5LnZki1KAE
	q7HFGaj++qXcIAUuaDylu7c9K/+ucAFbnlDkzX1ke5Uy0w4oNU35yS0DmI10N6vx
	SYSdrEQ3eUXaGa0B5vroKyCH/rvEViSpU+sVHrb0zzfHtid9H5Ue+omnJj7V+kX3
	GC8Smg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1adaux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:23:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29085106b99so1274465ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 08:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455429; x=1761060229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcPIfktbw+4kEWgLo8Lzyo/AwQDe0A5v7vqzDzybWDQ=;
        b=dDZVH3J0+wlkR5SJobELIGNUmikayy+8oM4c1Q/fV1PVQWn2yj8A4mXAW7VRn8I9tq
         boxszjaxKj1Khapzyh3Vmr9I5zMn/YXNVyA3aSBtXzxEUPrPdMByZ/Rva+bsgmvn3C7p
         Ye7SDXSxjW6xIgywEvT7/nPBU3gTF+i9FDYf0vJ/+1n9icLk18iuEq94JLwyYiCn0XZF
         4/dxaqU0wiZNVYdIuE2o9FosNi25G6cnNKk/r1elycIyy5y+781z/d58Z12E8D8r5hgi
         u/XbIqdQOaCLW/D8jt/NWKPOpX4pYShgzJrUMvffavzSDIAR32OeT+MT7waMf+A1ij+s
         JfYQ==
X-Gm-Message-State: AOJu0YwHE1X8SP+Ov3ZVaqcjBB2QQ3xCEjwHvjVjnLmJalyC4CtbGs5C
	Vo1B5AwYZ6Q/QDTGXPqCSBkolzFJI3N1Aw3/XpRGZZNXPdPEOBz+EnsfSZ7n1SlQ6GxIJx9Ngq+
	V1+M7ABFaTdUhMoDN+S0mAFFJmlYOGk/aIGh6OteHjnOmflGiLrvGVUHy3eKjTAn02Co1jwwrGJ
	YbDhL7GKmieK9tu3pMjChZtLnnRqv8SfipyBN9uGHfBfsJy/ESn6ucgLIoEA==
X-Gm-Gg: ASbGncv+t9WQles5ilxSoyEAQuQApXQSBj152LOdgrvsz8lfe3tux5QSCo84GnrIcyJ
	4fJia4pU0N35zM3j3Wt0jgfY14VFbVmXkeL5ikVDceTeK0EREN8GWSvsjdzHatprerp6s9qbCf8
	STQYvDkvQeVWOrdIsJ0SkUPISIYTsdeyx2HQzT7b33VHH9kwnidc4=
X-Received: by 2002:a17:902:f78e:b0:290:3626:fc28 with SMTP id d9443c01a7336-2903626fc5bmr276290745ad.54.1760455428994;
        Tue, 14 Oct 2025 08:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf04xB5/X3Whw6ZpMPTwW84tZeRufwhAoltulxVMbOICTmtWyT81FZyjmtNedNHTVY5ZMnJSuDg7kEt4m6izs=
X-Received: by 2002:a17:902:f78e:b0:290:3626:fc28 with SMTP id
 d9443c01a7336-2903626fc5bmr276290275ad.54.1760455428286; Tue, 14 Oct 2025
 08:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251010120125.2868011-5-dmitry.baryshkov@oss.qualcomm.com> <0E1D022C-354A-4064-9537-8835AB5B5332@arm.com>
In-Reply-To: <0E1D022C-354A-4064-9537-8835AB5B5332@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 18:23:36 +0300
X-Gm-Features: AS18NWCol02hmsNRvOgzOFfW_bVs6_5hhq3tLxMyp-jK_N9HItA3pH-t3eUQ5iM
Message-ID: <CAO9ioeVxazVkNT9Wk5YcuHGAaLUbi9S+XPhPM3tZbZDDdK-3_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] mesa: drop useless freedreno-fdperf PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee6b06 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8 a=Q4-j1AaZAAAA:8
 a=veukWq_dYipDmctxKs0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 95FI9e51pyfbgZrDfrMJd79w5VojCYk8
X-Proofpoint-ORIG-GUID: 95FI9e51pyfbgZrDfrMJd79w5VojCYk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX0OmE2A1SjIBH
 yO3uCW5oXYdNOK8xe5oHUGEFG5uh0OZFvreBrsfz6hSdRUlLlUWJre/4bU1Pii6PzODIomB2NjS
 HZEkn6NpdxD/ml6g+0ziF5Um0PfrB+nunhUKbCOKvDCUclpCG1Af04P8doGVCqEYVsoYGMDju0D
 Gunh24AA9khkMUHSc49Sbw7MXsJrk3hChdhjZR4NbkBjwlRAyCwM7l1TzPq/EehEJsDlzkWj7Ip
 GetvpZbbPr+c2TxxixPmLjmYU6Bas15shvrojppU3IVaT2vV9o7vfI/MoHztziESeNm7ycKo1GV
 tzjtB9O2ODWVr+cReUBVCbLkp7REdzu0kf7FDNyY0ivVrEUWimIC72pGotAincyQtJfquvhHm9R
 uwWl05OkPWnXJsm8TjwfwballRhfWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224835

On Tue, 14 Oct 2025 at 18:13, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 10 Oct 2025, at 12:59, Dmitry Baryshkov via lists.openembedded.org <dm=
itry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> > -PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
> > +TOOLS_DEPS_FREEDRENO =3D " ncurses libxml2 ${@bb.utils.contains('BBFIL=
E_COLLECTIONS', 'openembedded-layer', 'libconfig', '', d)}"
> > +TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedren=
o', ' ${TOOLS_DEPS_FREEDRENO}', '', d)}=E2=80=9D
>
> The packageconfig is slightly unconventional as it=E2=80=99s just a depen=
dency, but it is deterministic.  We looked at this on the review call yeste=
rday and nobody liked the fact that simply adding meta-oe causes mesa to re=
configure.

Well... It also requires freedreno to be enabled in the PACKAGECONFIG
(which is done only by meta-qcom, which already has meta-oe as
LAYERRECOMMENDS).
I added freedreno-fdperf two years ago, but I don't think it serves
its purpose: there is no link between it and meta-oe, there are no
config options being toggled by it, it simply pulls in a dependency in
order to enable one of the tools. If libconfig was a part of OE-Core,
it would not have existed from the beginning. No other drivers have
such "split out" tools, etc. Thus, I think, it's a lesser evil to
merge it into the freedreno tools handling rather than having a
separate PACKAGECONFIG entry.

--=20
With best wishes
Dmitry

