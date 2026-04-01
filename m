Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEDA10FCADE
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 20:40:34 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1560.1775076028729540674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 13:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s3SLcdf/;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6501d32b04bso213569d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 13:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775076028; cv=none;
        d=google.com; s=arc-20240605;
        b=PNQBps3wpevyuu0p5sXVMjSSY5MLe6MuKT83IDLgtk6UC46oDWUGFxteJ+jcj1YU/Q
         0zUQRIMGxooN9KMCSjpUfhh6qiOtgB9AtsPvQPOFIhYzBZd7ub50PxBftYua0SoxNjz6
         iYz385/5SYrIJGfYvgUh45j4jxxUr952igYmFCiDWQyKN2FpmhyblnyKu/aZtspRJ+wg
         b0WOOH1lVAbOsqgRwoJF0DVh1ESVAsdlhjysAt14KDOtThDTvymjtgPPDkWoZrte0iNC
         trXGQOtVUxITptGL7xaKCAjs8nyTSIq8nvOc6XffwQfQ4/iLG0VDVHD9vFaMDJDEVuX6
         9p8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KEb3lwi1xT0lJg8E9gMSXBvLeb8v97qwupJLrlXJqhw=;
        fh=b1sZgLnRRZv1RPUw7lnzsOHnrhAa1ffLeV8wcrgx/Bo=;
        b=l3qQ1rt5zJDC8vk2oPiXnZ2SzZJiKBFdAcG21u7PGoKWyM8Ov21kU4BvE4YgY3jJ+3
         TuJDzij4ym2HwKaFB/PKejdNuA0/AK/snimhVNlxCKKLc7KZfW1A36CSSZu2xcsxkW6K
         tLMTm2kn2fDxvSP7JXi1wUXxWGV9S2K7uIzbiQUNkepwxyePvevsjdxUgzn6Ugi64xoy
         PW4xd7PTLmfafkbJinvLUMUzS00AOBhVbU+hl+dK0hkPo7lpSvVnwI9EKkGu6/2gYjR7
         wGvsxQdfie/fzhyZeRn/zS6mzQpdrC7x7SpZt+gsyskVjmAk5VBM+VZJNyCtjcmMMc48
         KuPA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775076028; x=1775680828; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KEb3lwi1xT0lJg8E9gMSXBvLeb8v97qwupJLrlXJqhw=;
        b=s3SLcdf/Ign/XfwbYxERVxhqWNUqps9ojppSvvBja/UiTACdVXWFcT4pn4kjOzhbyM
         niBXp61zx2Bqm/RKT377+b9GkUIfzj7jPj16mHokiWsq1QIZO5bB2nYClsd7HgQCsf7a
         HZi3U4pCFU1Fie/1lczTQUXa7t7uxEUPBWzKrPArupBur4eB5DTnYORS8yXmoIl4VY8+
         wkNrKAZ1K1tOyF7AJ7pKzP2elqFFZbPfo7qMF3rz3fyP0O0nsnM6+bvw69RlyoSjmccN
         ARXCuiFXIS+k5nkdsFKKC3HscE5SA8Vcnhpqpk2qoJiv5sQR5tuevKi1uvp7G98KP4LV
         ldOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775076028; x=1775680828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEb3lwi1xT0lJg8E9gMSXBvLeb8v97qwupJLrlXJqhw=;
        b=m/tevNAyKYwRaCm345f4QTxPQW0euS2BSzMndnXoRIxlp0fPp42KASrVPc1pPDz2By
         lUSHku7VFuQt4qXDQhZI4zKDhROwqTiwjU0+Vlf7NqALxPis/Bdi821cinOG9xaZ3HXO
         Q2BtQ9KcHs5kcvgnmTjRbMOXDIBkHwfRTAsR4p+FfLNEVXA4lkJaJuNH6gYoAVX3MHPO
         RY3q6VESegHkCeIWrWvBEOPjoPLJ+g/f4x+G08hHkZeWltvUcDFzc42TsKf8toMTuIwN
         qwXjXnSD/trj6ZjkP/IxGUqanNgL8qqB0A8302q/p2tHqoZs42G5HaO4RJeXDHUvRXCF
         61IA==
X-Forwarded-Encrypted: i=1; AJvYcCV5fP2Q0Ze/2FI0Do4XrpIdbdNA08Q/LwgHdRai7IUhWRZ3FatZUoe8m+U6LRazaST/fhNS68A3q82VLzsyuyOYGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx40j7dxOE1VUEbFpsMeqx9M4XGOx5uZ9jhsiX2hIrWAoCkmWNe
	MJrF69BAIWhPYqJcRvufCiVX42ouPbWnYlWRq7PVWLDxu94heIn0E6dQvGubjvUDBZt6Zvt7bQM
	CM12KTq5a4NxcFNsORwMIT50wP4C4pvI=
X-Gm-Gg: ATEYQzx6PfwUQLAmOJBckSY5EpE34ATSgSfmlsNEKU2rlCPJWvuPmz3GKBBRhO3PUG1
	L7kdpu2sHPMoF3QNxwZ963pzGaYxP5qvsMSOFMlPp0dDpf1AVOLJh25X8a6jtJzWIAI9qXnyAuq
	0K9pBTbLbiiq7+j+y6IACsoXqRcSMpWcgXTjJgSTSBxxx58px+sAEQH50zGZ5qqAGSb+3nU2q/5
	s+Kh9bP+tv4gKNClVDdqfi0cGxzTp2Rm+OG4TW2PswOxjZjIPDM0GzXiAe23Ur/+QFUyDnGDB8i
	dS4JslrcLRrKZyRVSx+ccvYkViQBdHQKNk7ZNPrMcSpS70PyQWe37aPnU7KvOK0GLgEcZJQjJR4
	W6UiiabgfFQjiTDiUGDslo1Dv
X-Received: by 2002:a53:b461:0:b0:64e:ef47:83f1 with SMTP id
 956f58d0204a3-6502fe8d13amr4276067d50.69.1775076025520; Wed, 01 Apr 2026
 13:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
 <d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org>
 <93d2d7a5-a6c7-4b0c-ad89-01be28b407ed@windriver.com> <d63a917901287e45aeee4b6b256615537124c2a6.camel@linuxfoundation.org>
 <CAMKF1sqqwTwN2z1=rFbUVgFm3sFdd48MvtXPt3=B5_+MZJi26Q@mail.gmail.com> <ceebb344-ebba-4da8-b80a-75212151f834@windriver.com>
In-Reply-To: <ceebb344-ebba-4da8-b80a-75212151f834@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Apr 2026 13:39:58 -0700
X-Gm-Features: AQROBzBMFFIlfnttCw_biqrHI_08YAAqZbfeO8yPu2YeVslXYP4tJG-wegVmlpI
Message-ID: <CAMKF1spo4XF17=xncarjfSZijWtX2_gpeXX45k+H52_64BQeUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Add missing perl
 mpodules to RDEPENDS
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000f354ec064e6c178b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 20:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234460

--000000000000f354ec064e6c178b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 5:41=E2=80=AFAM Harish Sadineni <
Harish.Sadineni@windriver.com> wrote:

>
> On 10/1/2025 10:26 PM, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > On Wed, Oct 1, 2025 at 2:57=E2=80=AFAM Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >> On Wed, 2025-10-01 at 14:17 +0530, Harish Sadineni wrote:
> >>>   On 9/30/2025 7:17 PM, Richard Purdie wrote:
> >>>   On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Harish via
> lists.openembedded.org wrote:
> >>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >>>>>
> >>>>> In sdk while running "x86_64-poky-linux-gp-display-html --help" giv=
es
> >>>>> following error:
> >>>>> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
> >>>>> ./x86_64-poky-linux-gp-display-html --help
> >>>>> Can't locate bigint.pm in @INC (you may need to install the bigint
> module
> >>>>>
> >>>>> By adding the following perl modules to RDEPENDS fixes the above
> errors:
> >>>>>    nativesdk-perl-module-bignum
> >>>>>    nativesdk-perl-module-bigint
> >>>>>    nativesdk-perl-module-math-bigint
> >>>>>
> >>>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> >>>>> ---
> >>>>>   meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
> >>>>>   1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git
> a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> >>>>> index 7d7ffe92ce..9dc73fbdf1 100644
> >>>>> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> >>>>> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> >>>>> @@ -5,6 +5,7 @@ PN =3D
> "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> >>>>>   BPN =3D "binutils"
> >>>>>
> >>>>>   DEPENDS =3D "flex-native bison-native virtual/nativesdk-cross-cc
> virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
> >>>>> +RDEPENDS:${PN} +=3D "nativesdk-perl-module-bignum
> nativesdk-perl-module-bigint nativesdk-perl-module-math-bigint"
> >>>>>   EXTRA_OECONF +=3D
> "--with-sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${T=
ARGET_OS}
> \
> >>>>>                   --enable-poison-system-directories \
> >>>>>                   "
> >>>>>
> >>>> This is probably the right direction but shouldn't this be for the
> >>>> gprofng package rather than ${PN}?
> >>>>
> >>> Hi Richard,
> >>>
> >>>   In the SDK at $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-
> >>> poky-linux, the script "x86_64-poky-linux-gp-display-html" is not
> >>> pulled or packaged by the gprofng package.
> >>>   Instead, it is installed as part of the binutils-cross-canadian
> >>> package.
> >>>
> >>> Adding the perl module dependencies to gprofng package will not
> >>> resolve this issue , it would be effective only if "nativesdk-
> >>> gprofng" is explicitly installed by the user.
> >>>
> >> Fair enough. Should x86_64-poky-linux-gp-display-html not be part of
> >> the gprofng package though? Perhaps we should change it to be packaged
> >> there, then add the dependency to that?
> > right, that would make it live with the right set of sub-package as wel=
l.
>
> Hi Khem, Richard,
>
> We attempted to package gprofng separately from binutils-cross-canadian.
> We=E2=80=99ve verified that under the package split and its working corre=
ctly,
> and gprofng is being generated as an independent package.
>
> However, during SDK population, the gprofng package is still being
> included along with the main binutils-cross-canadian package,
> even though it hasn=E2=80=99t been explicitly added.
>
> I also checked whether there is any code that packages all the packages
> created under binutils-cross-canadian,
> but I couldn=E2=80=99t find anything relevant. Is this expected or do you=
 have
> any suggestion.
>
>
I would suggest to look into shared libraries that gets into
gprofng package and
then see if there is a binary or .so in other other packages listing one of
those
.so in DT_NEEDED section of the ELF header.


> Thanks,
> Harish
>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#224204):
> https://lists.openembedded.org/g/openembedded-core/message/224204
> >> Mute This Topic: https://lists.openembedded.org/mt/115512852/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000f354ec064e6c178b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1, =
2026 at 5:41=E2=80=AFAM Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadine=
ni@windriver.com">Harish.Sadineni@windriver.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 10/1/2025 10:26 PM, Khem Raj wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; On Wed, Oct 1, 2025 at 2:57=E2=80=AFAM Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.opene=
mbedded.org" target=3D"_blank">linuxfoundation.org@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt;&gt; On Wed, 2025-10-01 at 14:17 +0530, Harish Sadineni wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0On 9/30/2025 7:17 PM, Richard Purdie wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Haris=
h via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;&gt;&gt;&gt; From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sad=
ineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt=
;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; In sdk while running &quot;x86_64-poky-linux-gp-displa=
y-html --help&quot; gives<br>
&gt;&gt;&gt;&gt;&gt; following error:<br>
&gt;&gt;&gt;&gt;&gt; $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky=
-linux-&gt;<br>
&gt;&gt;&gt;&gt;&gt; ./x86_64-poky-linux-gp-display-html --help<br>
&gt;&gt;&gt;&gt;&gt; Can&#39;t locate <a href=3D"http://bigint.pm" rel=3D"n=
oreferrer" target=3D"_blank">bigint.pm</a> in @INC (you may need to install=
 the bigint module<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; By adding the following perl modules to RDEPENDS fixes=
 the above errors:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 nativesdk-perl-module-bignum<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 nativesdk-perl-module-bigint<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 nativesdk-perl-module-math-bigint<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:H=
arish.Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.c=
om</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/recipes-devtools/binutils/binutils-cr=
oss-canadian.inc | 1 +<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-devtools/binutils/binutils-c=
ross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.=
inc<br>
&gt;&gt;&gt;&gt;&gt; index 7d7ffe92ce..9dc73fbdf1 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-devtools/binutils/binutils-cross-ca=
nadian.inc<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-devtools/binutils/binutils-cross-ca=
nadian.inc<br>
&gt;&gt;&gt;&gt;&gt; @@ -5,6 +5,7 @@ PN =3D &quot;binutils-cross-canadian-$=
{TRANSLATED_TARGET_ARCH}&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0BPN =3D &quot;binutils&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0DEPENDS =3D &quot;flex-native bison-native=
 virtual/nativesdk-cross-cc virtual/nativesdk-libc nativesdk-zlib nativesdk=
-gettext nativesdk-flex&quot;<br>
&gt;&gt;&gt;&gt;&gt; +RDEPENDS:${PN} +=3D &quot;nativesdk-perl-module-bignu=
m=C2=A0 nativesdk-perl-module-bigint nativesdk-perl-module-math-bigint&quot=
;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0EXTRA_OECONF +=3D &quot;--with-sysroot=3D$=
{SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0--enable-poison-system-directories \<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This is probably the right direction but shouldn&#39;t thi=
s be for the<br>
&gt;&gt;&gt;&gt; gprofng package rather than ${PN}?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi Richard,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0In the SDK at $sdk/sysroots/x86_64-pokysdk-linux/u=
sr/bin/x86_64-<br>
&gt;&gt;&gt; poky-linux, the script &quot;x86_64-poky-linux-gp-display-html=
&quot; is not<br>
&gt;&gt;&gt; pulled or packaged by the gprofng package.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0Instead, it is installed as part of the binutils-c=
ross-canadian<br>
&gt;&gt;&gt; package.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Adding the perl module dependencies to gprofng package will no=
t<br>
&gt;&gt;&gt; resolve this issue , it would be effective only if &quot;nativ=
esdk-<br>
&gt;&gt;&gt; gprofng&quot; is explicitly installed by the user.<br>
&gt;&gt;&gt;<br>
&gt;&gt; Fair enough. Should x86_64-poky-linux-gp-display-html not be part =
of<br>
&gt;&gt; the gprofng package though? Perhaps we should change it to be pack=
aged<br>
&gt;&gt; there, then add the dependency to that?<br>
&gt; right, that would make it live with the right set of sub-package as we=
ll.<br>
<br>
Hi Khem, Richard,<br>
<br>
We attempted to package gprofng separately from binutils-cross-canadian.<br=
>
We=E2=80=99ve verified that under the package split and its working correct=
ly, <br>
and gprofng is being generated as an independent package.<br>
<br>
However, during SDK population, the gprofng package is still being <br>
included along with the main binutils-cross-canadian package,<br>
even though it hasn=E2=80=99t been explicitly added.<br>
<br>
I also checked whether there is any code that packages all the packages <br=
>
created under binutils-cross-canadian,<br>
but I couldn=E2=80=99t find anything relevant. Is this expected or do you h=
ave <br>
any suggestion.<br>
<br></blockquote><div><br></div><div>I would suggest to look into shared li=
braries that gets into gprofng=C2=A0package and</div><div>then see if there=
 is a binary or .so in other other packages listing one of those</div><div>=
.so in DT_NEEDED section of the ELF header.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Harish<br>
<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#224204): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/224204" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/224204</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1155=
12852/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/115512852/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000f354ec064e6c178b--

