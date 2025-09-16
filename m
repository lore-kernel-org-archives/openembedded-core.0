Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01853CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 16:41:46 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.web11.357.1758040904652388970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 09:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KYcvtk7s;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63289cc1785so961226d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758040904; x=1758645704; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zkmfQQyqTiiWvgOBZ6NrCUC5y4OxVDHj1raE9A4BPM=;
        b=KYcvtk7sa13kcMo5dGBc+UdVRIxpKNEl0MWxZJN1cSLRcIePo92mfIcYj6AFj90B0Y
         qx5VQhxJbZNtL2o/fFtp0Az8D6pGKCrzhSjojc6OcE14zPW5dfIRE7yeUdZBZ3O+XtKb
         DdSs4rj7gadvxj3MiQ9HIjWKZeuXKzpC+NthoDqAI1F24+/AK00YsOmRn3CSPrUsYoNV
         eZ3xbW6jjv55k7Ujw85chVNzRYamrCovOeVv8KSJyrF9OLhKoEgf+CE+5/K9FhvR0HdA
         1IzOxjbwLT0HswkpbXihSdG2x3d0dfO2D7S0HjYAF9pS+SaounaH2Ey6qTTYFBDfp1Vy
         6TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040904; x=1758645704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zkmfQQyqTiiWvgOBZ6NrCUC5y4OxVDHj1raE9A4BPM=;
        b=g9M7fbqaVBzX8hPXzWJ4C/fDYbiSUKyDvriR8HdTmdv85QaPfSeNLWeYwmmwLt2LBJ
         rS9MwhYJQjZobWhW+Bti2Y056XgaiC5+JgTOna7SzFG65R5pG0RgubYMK8bCY5H8+dmI
         vF8Mrd436F+9Jb+2rpahdOkhdjza24ajDyny/W+D3HlX6ONAeIcB3ugE8yguRggOFDR1
         u4KDvfz1XL5V2C2lC/6jLT31qFzFnKzZIhvN/Y9C7Q75zIsb9yh6jYZFNWVQal+CQaxP
         G8JR0mCUH5+Ysr41YAvD+9eNJHW3aGczsWF5Nu9MLPBcUMxl5XtNAlrKNkFZhE2cFOix
         xd5A==
X-Gm-Message-State: AOJu0Yx36PbJ6qHhC0qlfwu7fWSu1MjVCboUmZ2ODgdd4B4Fo00DLf88
	2MzRducIZRjy1yhHJFfeeZ2gU2PVCmI6YVwN6jeZA97O33fYGpL+evV1eZciixLpFLWGEv+Qeqq
	Z1WMcZZDM3vxEks1O9tdcjgxVrm3Ilhc=
X-Gm-Gg: ASbGnctMQY/InBzXwmlU78c2bO2aS9sGZMLcJOLVV69vk9GTlgfi2XhuoK2xp+mE9Kn
	pA1Mbtsekyr3zdr9aXg4CdupckJAY7Lwt0GWlk0fVbJFXuPhqjNvX9jKqXeOd+DcymbcYhL5vsM
	pqFz9lR+AsmR4Zj92FI0AJeSMvxEYV3zXyvue7mvAxUjdkwYh3LILKIANsSC7agMcKN2f9xD9ll
	D0JMVLWwwm6Ly9MV8JUcOxcGCtBHTI8CHLQo3GLewyTHvapzceLX0ul4vCw4LLWov9QVP2zA+PV
	qwfzfWzyZkmxvEFii2IRWm8+2pAMMOgg4ioWnNnYc1QQ1Iyt4hOQ
X-Google-Smtp-Source: AGHT+IG+zGukkPcZtfzLL+6q3lXwWTUela2449mYMGGvKUFNll6YOXQiDCoMAHE91Er2AX50dKx0MyQ3TX28JcbKtHQ=
X-Received: by 2002:a05:690e:1550:20b0:62b:2f8b:76d1 with SMTP id
 956f58d0204a3-62b2f8b7ceemr9694494d50.20.1758040903579; Tue, 16 Sep 2025
 09:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250911120855.2268283-1-Harish.Sadineni@windriver.com>
 <CAMKF1srWBq3io0+s1WAap2n4ER7-40386kOjp6B1TmucEVSmXg@mail.gmail.com> <7edb1a64-aeb9-49bf-b465-68e2f6493129@windriver.com>
In-Reply-To: <7edb1a64-aeb9-49bf-b465-68e2f6493129@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Sep 2025 09:41:17 -0700
X-Gm-Features: AS18NWAp6kJ6Maq_nxZc-SQtCcdRu0DvdYrVw4ViMV9v4iOqen2Fa8uCCYKX66A
Message-ID: <CAMKF1soROJz4zyEghjoX-qKSNghTFLc-3Y84bnMabcST5Y0mzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nativesdk-packagegroup-sdk-host: add
 nativesdk-gprofng package to RDEPENDS
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 16:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223577

On Tue, Sep 16, 2025 at 3:47=E2=80=AFAM Harish Sadineni
<Harish.Sadineni@windriver.com> wrote:
>
>
> On 9/16/2025 1:53 AM, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Thu, Sep 11, 2025 at 5:09=E2=80=AFAM Sadineni, Harish via
> > lists.openembedded.org
> > <Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >>
> >> In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
> >> following error:
> >> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
> >> ./x86_64-poky-linux-gp-display-html --help
> >> Can't locate bigint.pm in @INC (you may need to install the bigint mod=
ule
> >>
> > This means we are missing a rdep on perl-module-bigint, please add that=
 instead.
> Earlier, we followed a same implementation but later modified the patch
> based on Richard's feedback in
> https://lists.openembedded.org/g/openembedded-core/message/204666 and
> updated patch as in following link
> https://lists.openembedded.org/g/openembedded-core/message/204681.
> This will fix the issue but only when nativesdk-gprofng is installed.
>

Alright, I see. How is gp-display-html getting into SDK ? I think it
should be part of nativesdk-gprofng
so if it is not pulled in means it's being provided by another package ?

> Thanks,
> Harish
> >
> >> The patch from below link will fix this issue but only when
> >> nativesdk-gprofng is installed.
> >> https://lists.openembedded.org/g/openembedded-core/message/204681
> >>
> >> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> >> ---
> >>   .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1=
 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sd=
k-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host=
.bb
> >> index c1d3c25060..5374067bab 100644
> >> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
> >> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
> >> @@ -30,6 +30,7 @@ RDEPENDS:${PN} =3D "\
> >>       nativesdk-bison \
> >>       nativesdk-flex \
> >>       nativesdk-perl-module-integer \
> >> +    nativesdk-gprofng \
> >>       "
> >>
> >>   RDEPENDS:${PN}:darwin =3D "\
> >> --
> >> 2.49.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#223272): https://lists.openembedded.org/g/openembe=
dded-core/message/223272
> >> Mute This Topic: https://lists.openembedded.org/mt/115186510/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

