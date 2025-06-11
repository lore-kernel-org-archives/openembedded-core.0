Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9062C71135
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 19:32:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.4239.1749670350887041051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 12:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YnRepyJA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DLG3027902
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 19:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0XQYST0p2R7m+R9vi4DTIwL2HKbTkbxO7Cliuctln3c=; b=YnRepyJA1sbOE4yJ
	XbyOC4N8r4IJOSJEYjSvsONlJtB/XZvvyyCXYekgI9toxll4dr7qauustQKFAuCt
	qAzwSFm1t+ayv6VYqQLRuOdY1w3PZSifdJGa8i1CgsB2CTdtb1TMbsY6Z8lG5xIO
	1BAHT+rr+PNxjqrY3UKKs/FFSNagw6SJ19swfYJDSuPQfzIaR74MtMvGy2Ov2Dh3
	a0ydF3ov70LHxpEerwexg0DTdSfmGep/5RwKMEnWeJoqaGfEfPRhEMPdF0pYTG66
	B/H3B/KkE7HwYRh/Wvm4irsdtaHG+IaVQT8d+LmEiUMI7j9IC6XV6pjWUTRMEwqO
	QQbY2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhd2v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 19:32:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2362e130be8so1326785ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 12:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749670348; x=1750275148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XQYST0p2R7m+R9vi4DTIwL2HKbTkbxO7Cliuctln3c=;
        b=tFsUYzeFx3Wje6+mNBCOktWJimsQIuSDdSnqz1XvYTQGS+3W8kiFg4Uh4gLWyf5XTK
         Y9qDFgjqTkBkz27qpZDXLG83eKs0DMfwkGR+OkCTnBHHehrQnvginzTsBw8qO3+B97hy
         djfCGsQb865Qzoe/3THMFUgP3HsvT5UhZRC/C0zzDU4XQT0i6929MshzhFispZIcM54o
         iJ5+XUqBdGw///7QwbKjNZVr0DxA1UyVID9HNfSxxcWDABxZEgWqe+uwBHlgdbC1OZAA
         R4DCmOu9U304pHz2pp735rHJLksohTJRcahm/YKi6gL1YCV74E8BMhRnXsHIG0z1jdxh
         n8ew==
X-Gm-Message-State: AOJu0Yz46O/Di6W56ivtONWWPdApGufHQsa84Xa/iiT3kDvCzZFG6TyB
	pVXvm5gLy7oR1mR0SYoozsQBdQqBsD8NzUJcAJPnRUHP9CXfhbp3sV9hyGumoyg9Swkw3YWHhgT
	KY47u8swi4rvv6OjMFQRPWPSScJewv9NKYkidHwGrWAYbOojtcKpETLJmj+MSQ0GWqERhWOdpE4
	6X3i4AVFQJQ+hT0wvcm5pO86FUFOdlnZNJ6XoimwyE98AvsP5Wg/YMmDaqmw==
X-Gm-Gg: ASbGncvJP716TFZyfF2YXZPEVP68P9V7fvOHw8lV1HwtLmE4Lw/pLWQuFF9LutIPZex
	ddKP8c5Yvi/CLsw1WmLn9ZHrChYwnPNon+5XPz5/MYuKJ48DXEUqnEqNe1jLuQcDJbLqWGITveg
	1kPw==
X-Received: by 2002:a17:90b:1c09:b0:312:e8ed:758 with SMTP id 98e67ed59e1d1-313bfb677c7mr1030432a91.13.1749670348310;
        Wed, 11 Jun 2025 12:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFrjhfiDBbCtPgHKyu81OvbAmLxgtz9N3Utf7fF+VF1kjd84GLeTGBxALoNCuDpI5cyQ2lGxzR5WQsLSSk2RA=
X-Received: by 2002:a17:90b:1c09:b0:312:e8ed:758 with SMTP id
 98e67ed59e1d1-313bfb677c7mr1030395a91.13.1749670347697; Wed, 11 Jun 2025
 12:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250610142413.681911-1-zboszor@gmail.com> <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
 <8e9387de-14f0-4def-a41e-3b8aeaa178a0@gmail.com> <8155d605-c759-4645-a82a-15ef65f95e66@oss.qualcomm.com>
 <63ef3071-74eb-4caf-a08e-77d91bf82c44@gmail.com>
In-Reply-To: <63ef3071-74eb-4caf-a08e-77d91bf82c44@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 22:32:16 +0300
X-Gm-Features: AX0GCFtNcoyd9KstYA0mcdwjGxnGZTj_N30NpJzC1aXX5JuKGkS_UbjzTU9F7fY
Message-ID: <CAO9ioeVE94tAha_o0Q1tcP-2LhD6YAVtLUMkqACr4q55=ahgVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Fix bindgen includes
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6849d9cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=IjkHuktu5FxUroAh0YQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: L_beYmvA2HniD5bR3WTMtbuQLcJmgeMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDE2NCBTYWx0ZWRfXwxGp5BsDIohK
 9rML/7DO9qBawS5SRa0PxFpqOYFrMEi2VaoRL4LyWjUByo0jSoCeQkPsPR0tg1QVgLrxOfSWGai
 vbzEO15G29XMDWkEoCyqb86U2fTrK73yZx/rilN/3OsXGJwGP/t/Kp2ifCJC1D6HFD7VqP2RRXP
 +zrnxdI3le4x6HNu6qmFLKBzLGrBt47LcP3RThB25Q8vwWn+yd5BVOvgoQELeuiHuVFUNQ7BE26
 lTl0CJECuSN3b8H/gA8vljHHFN1q3pqEPnEnJoz1KcrWI7sWBzqCbineDowXQgjxqcvfW6yvjbI
 cPAgx6RMX1SgaSBcumL+MOEkF1mjIksM1LvB6GrH8xMJ77hJGbUbMCt/HQPoR+l9/lPAEdcozBY
 5veBl5f26zS0usWQz/D3dDehr+l4UQTpXutcrwHGiUNQsF2Wz4lAfl8bozWV4iiI7p+asSsz
X-Proofpoint-GUID: L_beYmvA2HniD5bR3WTMtbuQLcJmgeMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=993
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 19:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218470

On Wed, 11 Jun 2025 at 21:36, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2025. 06. 11. 19:34 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
> > On 11/06/2025 13:46, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> >> 2025. 06. 10. 21:49 keltez=C3=A9ssel, Dmitry Baryshkov via lists.opene=
mbedded.org =C3=ADrta:
> >>> On Tue, 10 Jun 2025 at 17:24, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi =
<zboszor@gmail.com> wrote:
> >>>> Add a patch to fix bindgen errors due to not finding headers
> >>>> in the system, like:
> >>>>
> >>>> |...
> >>>> | ../mesa-25.1.2/src/gallium/frontends/rusticl/ rusticl_llvm_binding=
s.hpp:1:10: fatal
> >>>> error: 'clang/Basic/Version.h' file not found
> >>>> | Unable to generate bindings: clang diagnosed error: ../mesa-25.1.2=
/
> >>>> src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal =
error:
> >>>> 'clang/Basic/Version.h' file not found
> >>>> |...
> >>>> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/ =
glx.h:30:10:
> >>>> fatal error: 'X11/Xlib.h' file not found
> >>>> | Unable to generate bindings: clang diagnosed error: /data2/dtd-
> >>>> yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/
> >>>> include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
> >>> Can we fix this on the meson side by passing additional include path
> >>> through the cross file?
> >>
> >> This seems to work in mesa.inc without patching Mesa:
> >>
> >> CFLAGS:append:class-target =3D " -I${STAGING_INCDIR}"
> >> CXXFLAGS:append:class-target =3D " -I${STAGING_INCDIR}"
> >
> > My question was more about meson.bbclass, where we set bindgen_clang_ar=
gs. See the
> > bindgen_args() function.
>
> I wouldn't change meson.bbclass because it works for the
> most recipes already.

The bindgen_args was implemented for mesa as the first user. It is not
frequent for the packaged software to use rust.bindgen.

>
> Besides, it seems to be a meson bug, not a meson.bbclass bug
> as -isystem and other include path related flags (besides -I) are
> ignored in CFLAGS/CXXFLAGS.
>
> The "clang diag" messages are likely coming from mixed up host
> vs target header paths.
>
> See
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435#note_2952=
621
> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/rust.p=
y#L392-L397
>
> If we changed meson.bbclass to add -I${STAGING_INCDIR} to
> the proper places in meson.cross, it would still print the
> clang diag warning. Adding -isystem would still get ignored.

Are we ta

>
> FWIW, --sysroot is also ignored by meson and adding it forcibly
> throws a different error. See
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435#note_2952=
805

How were you passing it? Via CFLAGS / CPPFLAGS or via bindgen args?

>
> =C2=AF\_(=E3=83=84)_/=C2=AF
>
> >> but it also[1] prints this for some of the bindgen runs:
> >>
> >> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
> >> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:95:11: warning: '__INT=
64_C' macro
> >> redefined [-Wmacro-redefined]
> >> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
> >> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:96:11: warning: '__UIN=
T64_C' macro
> >> redefined [-Wmacro-redefined]
> >>
> >> [1] Using the previously posted patch also prints the same.
> >>
> >> It seems to be caused by a meson bug because it doesn't
> >> collect the -isystem or --sysroot flags for rust/bindgen.
> >> See the discussion at the MR link in the patch.
> >>
> >> CFLAGS and CXXFLAGS changes are both needed because
> >> bindgen is run on both .h and .hpp files for rusticl.
> >>
> >>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> >>>> ---
> >>>>   ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++++++=
++++
> >>>>   meta/recipes-graphics/mesa/mesa.inc           |  3 +-
> >>>>   2 files changed, 59 insertions(+), 1 deletion(-)
> >>>>   create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-
> >>>> Add-a-new-build-option-for-extra-bindgen-inc.patch
> >>>>
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#218438): https://lists.openembedded.org/g/
> >>> openembedded-core/message/218438
> >>> Mute This Topic: https://lists.openembedded.org/mt/113570520/3617728
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [zboszor@gmail.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
> >>
> >
> >
>


--=20
With best wishes
Dmitry

