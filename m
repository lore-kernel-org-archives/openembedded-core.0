Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C56CD343B
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 07:14:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6667.1778138033531733768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 00:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=czl/7szq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: igor.opaniuk@foundries.io)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LLUv1067923
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 07:13:53 GMT
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh18d1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 07:13:52 +0000 (GMT)
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-38e817d9498so2041091fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 00:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778138031; cv=none;
        d=google.com; s=arc-20240605;
        b=fGfOBpKionNtmL055+WF9IRSR7Zn2ujpfk2nfbpth0+8t+K9WWJMFXRb3xDqaNdBLS
         EFR1VwUtIArcFI9rfgWoScwEmgz4/g6keiqN2dTWKkhv23ZZBnq3WcXPd/KDzi5V8A6b
         p/cEWLtiwwGblgfTHvLiJqC3FmyakSXAEshlpTaCV4ycbySCmzvKTTi4DMiHnGoHHuru
         NqWcKLubm2FdQogfNy1q1GnWxy8QgUt7MtEx4jevyEPxAQb90qPrLHDAackvFgSRrBnL
         3qlP2SRcm6pkArMuaC5aGvRuo6i5HS8rhxXSlRtXhvhnigKTkey5pGl22Aecc1WQNoyg
         MsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZBqc6wZBI9fmLf5Tf51urvFs1/r51Ucl7Cg/kvedK9Y=;
        fh=eSHs77o+1e8rrYY9HlIjoXBcQsPuH2vZyUVYKZJXqKc=;
        b=k/kv1BMMOPFT/CbpGXvSokMvtbSW/ghBUml9vCMy8714HpnSg0ix1kXFXjbzH8uyMY
         bXwZCjZHa0ninO62cllOQetjIAGDWKlZqxKJ6las9rYDKXyvXhN6LZqH+QUJzdlj69Xl
         xOj+NfRuo9gyEEETYTY66MVX85hyta6IYI7erqA97j/j6w1Jtr2k99BJFYUSI9gqapCo
         63detL068b5eyw6ymh0y5wocfmook1acyDU3IgFBRzX7r4F9FlRSgsEXfNM9ZRtOHoJm
         0ptIQ+th0NMVYuM1XSXhXHRVOxxu75lXptMuZGq2vSGDd+caa5r2o2W3Yl4pu4m1IdSA
         djKg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1778138031; x=1778742831; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBqc6wZBI9fmLf5Tf51urvFs1/r51Ucl7Cg/kvedK9Y=;
        b=czl/7szqTPem1xIiZsPPwypS5M6qsWOccIaKUW5V2t/Isj897j7VmR0jVk8jZ3v8VO
         l5DS75hOMwbWYpUPWUXFFfY6HE0WGix8QwONmfN0uPeM2veoY18JMiUMN3HCSjeXNHwf
         eOBHA3RZTPKCS9PYqk1pVO1V8dMynM2lPyJfeKR1jNO8Zdc6034FBn3t/TxuTu1f4lKQ
         p266vkaBkUvLY+S8D7NDOdxK1Zpz503f766jVrNSdY0mvUuzWNlc06iM6kps1v7JBY2g
         +KmckDJaeicSb0T8oOaGUCWvAPj4QZysZ2IMaQSeQ0Jawk/KvDybqJP/ZmRII8u7zuVb
         hhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778138031; x=1778742831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZBqc6wZBI9fmLf5Tf51urvFs1/r51Ucl7Cg/kvedK9Y=;
        b=jL0wQSPZbPO45aBgNfT7jY8ejF0x7kov8LT8kwn1LqLDncxUv0KPpzvGEGNrYHSq3N
         hjzU54UQrUyJSlLob5eecMgkPscJX6CPj/VG2xm10INhA2BI0WDWy8zcmPyyUwFVa3vu
         X7fViniZ1pJ6KsXQY01VtqnARH4rrGRWuI0Wrb5js7raB12Oik9SGkIzfd+ZWm+Ggni+
         Ioi5+yisrso41pmKW1vKrVCQ41tT6x9YAH1NmIPp4+yG8xcl44+VKvSSsthWEVdudxr3
         G2XVp/LyI6/iJtL2s4Cpy6kLF7xDdwB/DsqJDQOePEiVm1coF8g2OZBKX2pm2PyjKXos
         SAqw==
X-Gm-Message-State: AOJu0YzXPX4Hnc+8vxnlR+kMonrK1dggChUbhSv8E7j7j8OAKjTSt/Is
	ilbJk+ZLo6MSlE04dqofrGT4sm/+oPitgVBp+ElXgdaJ/M6zgkKlptia2jQ1SPphzmX3xNkpa9z
	jG258hoErGRFaVg193rTlnSqlG9nD8cMy68It1qPfvec+/Ltw2ySA+HpxrtsDjjPXZv+DsU0/ca
	c9xCj+1vHz9zaxCFCgm74fvh1feZT+FRqvDgH1z1bFib9ly2l4yyRGvp31
X-Gm-Gg: AeBDieuV5bdTMXPHdBHlmMVWpMcNwYR/UsA3eWcmKN4DzBqhWdCpo7tFgDt/kJhWM4k
	x9vg3QRVbjuyOGf4UBSrRx3JGspoJYzIncp3d8TcN/fFfy2ApajT3UQ0nY4NmHyMVDUkFFTKYAu
	4iOdKJnJji+bgxmLNZYOr+4J+UqqJaA/sQvXjXyXgvQA1aX9XOmz37zllKiaCUlS2zWguzJSy1e
	AUbkJVxpowuvmvW
X-Received: by 2002:a05:6512:3188:b0:5a3:e7df:2396 with SMTP id 2adb3069b0e04-5a887adff9cmr2721559e87.13.1778138030647;
        Thu, 07 May 2026 00:13:50 -0700 (PDT)
X-Received: by 2002:a05:6512:3188:b0:5a3:e7df:2396 with SMTP id
 2adb3069b0e04-5a887adff9cmr2721528e87.13.1778138029685; Thu, 07 May 2026
 00:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260506194507.3786568-1-igor.opaniuk@foundries.io> <DIBVZ5KGY6VD.3JQ0DG3RR7SJG@smile.fr>
In-Reply-To: <DIBVZ5KGY6VD.3JQ0DG3RR7SJG@smile.fr>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Thu, 7 May 2026 09:13:37 +0200
X-Gm-Features: AVHnY4L1DC96E18mz5vhBBMKyvCDtwdxYuEQYV3Ud9yffDs02V3mMAYnnZx70S8
Message-ID: <CAL6CDMH02AETCQ68CozA+DtYCAei4KyTeMm2WGOntcjfPQOVSQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] shadow: add libxcrypt-native dependency for
 native and nativesdk variants
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex@linutronix.de>,
        Ricardo Salveti <ricardo@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: VQt6MmDfgJsha2WJxewsfZnbC5L95nxb
X-Proofpoint-ORIG-GUID: VQt6MmDfgJsha2WJxewsfZnbC5L95nxb
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc3bb0 cx=c_pps
 a=/zUzjrEyDQOchHorqPmRvg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=iGHA9ds3AAAA:8 a=jVwDQN0dAAAA:20 a=Q4-j1AaZAAAA:8
 a=6jbKIeu7AAAA:8 a=EmXL969uBuqZkB3jJLUA:9 a=QEXdDO2ut3YA:10
 a=zJl3WwEMzhwkf_fFxYei:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=-0VUF4iAjVmhXKmeMUOz:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OSBTYWx0ZWRfX/etUdG6m9lQl
 8qPx/tYvVW9JgGjRS62VO9tKm2KHpZ2gzZ3Ac93BFBJZ8RSqSglaBHLPFfXC7Jf/AiTaCz+LG5k
 97dnk0s41QjziAlFXBL8s9vuPXBAoy5sazvcpu7P89uQeCz8wqX/v4AHTMX58uzsiUeknQlr47b
 ojTHYyrZ1JQb8sIzP6egy2oo66W3Dejp7TS8mrAggYhcv8uHynyfUU4IletGH16oV4MA44jY7D0
 97VqEqjYosGM/ILVibYtnI7GsfgfQNUA+oMxNwPexoXDU7caHfjGOOQhcaWMNf2Cu5Ds/bV/vGa
 k9MTBU0KYq6hYii9JIwHh3xd1FOWVdQBpU+ROs469gn51teee879mYhonSKHaol1omDQgCypUqz
 SAWGsqAJYHEO7cTrSmntqn3PziGJj5zU15T06TWRg1pzNELZ9741/6j/cf9FkroehTj+uff2QVF
 VMoPPFxb0ukQvbcXd2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 07:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236565

Hi Yoann,

On Wed, May 6, 2026 at 10:46=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Wed May 6, 2026 at 9:45 PM CEST, Igor Opaniuk via lists.openembedded.o=
rg wrote:
> > Configure fails with "crypt() not found" when building shadow-native on
> > hosts where libcrypt is no longer part of glibc and the libxcrypt
> > development files are not installed (e.g. fresh Ubuntu 24.04+, where
> > glibc 2.39 dropped libcrypt and libxcrypt-dev is not pulled in by
> > default).
> >
> > virtual/crypt-native is in ASSUME_PROVIDED (meta/conf/bitbake.conf),
> > which is why a plain DEPENDS =3D "virtual/crypt" does not pull
> > libxcrypt-native into the native sysroot - the host is expected to
> > provide libcrypt. That assumption no longer holds on current
> > distributions.
>
> Note that we added libcrypt-dev as a documented host dependency here:
> https://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d175ea1924bf401a=
203fb678261fefb228dc

Thanks, I missed that. With virtual/crypt-native in ASSUME_PROVIDED
this is consistent with how OE-core treats other
host-provided libraries. I'll drop the patch.

One small follow-up if it's worth the time:

the failure mode for users who miss the doc update is a configure
error deep in shadow-native
(checking for crypt in -lcrypt... no -> configure: error: crypt() not
found), which doesn't obviously point at
"install libcrypt-dev on the host".

Would a sanity-check addition (something along the lines of
./meta/classes-global/sanity.bbclass
testing for crypt.h / -lcrypt on the build host and emitting the same
hint as the docs) be welcome?
Happy to put a patch together if so.

Thanks for the review.


>
> > A previous attempt to fix this by adding libxcrypt-native to DEPENDS
> > unconditionally (commit 65532fc751 "shadow: add libxcrypt-native
> > dependency") was reverted in 54eccb76eb because it incorrectly pulled
> > a -native recipe into the target build. Use class-specific overrides
> > so the target build is unaffected and only shadow-native (and
> > nativesdk-shadow) gain the explicit dependency on libxcrypt-native /
> > nativesdk-libxcrypt.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
>
>
> > ---
> >  meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recip=
es-extended/shadow/shadow_4.19.4.bb
> > index 94f155641c..cc69864a2a 100644
> > --- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
> > +++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
> > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc9a450b7be84=
eac23e6353efecb60b5b \
> >                      "
> >
> >  DEPENDS =3D "virtual/crypt"
> > +DEPENDS:append:class-native =3D " libxcrypt-native"
> > +DEPENDS:append:class-nativesdk =3D " nativesdk-libxcrypt"
> >
> >  GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shadow/releases"
> >  SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Senior Software Engineer, Embedded & Security
E: igor.opaniuk@foundries.io
W: www.foundries.io

