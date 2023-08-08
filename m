Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD3DC001E0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 23:07:02 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.76509.1691536015763330822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 16:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Tjmm7BLs;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-56ce156bd37so3960130eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691536015; x=1692140815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjYSdvCdd1DhwoRM4GCOqrUBDqKIMqaklDUauJRJwtA=;
        b=Tjmm7BLswMmGJaJpnSCKFhntlpOzF2+C0Y6rMfnLRcAhZIxI3tXfLS2PiXLkN9qON8
         EPNVSeC1838W5+x+cKOXDZEhDCNHDxtjHKZ/ya8uuq812LyTFqRYET3BeaFPMQLAVMv/
         VblSUB49cDBfEpzkmyzt+2K9ZP57m8ct79eBU7VcpEPE0pmC+BTrEu42TE1K7YeibFL8
         9oyfwLO/gVz+7KLxE/VUJLHEZdY83egU7XI9RsPD+7rsSK/hbiMnGb7wCu9XYpGHd5Bf
         pSvtHuONAMvgq2197xQ6skFAYCv7XV3A0usL5/1N5d//tI2pV1uDLRHyMMzXo0liatO5
         2Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536015; x=1692140815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjYSdvCdd1DhwoRM4GCOqrUBDqKIMqaklDUauJRJwtA=;
        b=BMi1qwP6Xwb+KkQYqIGSYc6juVKJNCkOXSQuF69uU0z9CeQpA7BA/h0mvAgAqyB/U7
         DZU67UWuCrG8XLLNLiLNn6S+3UKdNR4DRVA3bKQzGNsHnx25xj9ag5gU2ySKvYCXm2hm
         LLEnBypqGl72Nn69LbqcDxqbTgtqSEeq0zZHFSTZzEtyS5Qnj9eTSh8LN5HT/vMFYAML
         oTB9KqrJtum9RYLdCKJWrKX2X0dtITUMMueqnjcFICpPw1DY5J3xLNmp4nbxC18Z4yU1
         RVbrbR9fGFGeZENH77U2nYdyjeggrJcChr7EHh12z2U1R+eJ0IBxNFnG2l3eRhclsg1b
         mLlQ==
X-Gm-Message-State: AOJu0YzeXsKo113Y7jsq1+vESOp2YGeL49lbR8JJQTRL6C+H/vWWktrZ
	NxtXYEvVw79Cpzxd6Wzd2hWTvqFAnlZTuIrt1Ye9o8ePbu0=
X-Google-Smtp-Source: AGHT+IHPc2E98CZYUrTQbEv5SWzusm3umtBHQiDtGzGgEbhEi7UAQWsjQU4xDYqxZ76Qhl+D2ApQ9FZh5R+jglmuhu8=
X-Received: by 2002:a54:470d:0:b0:3a7:1e86:e83f with SMTP id
 k13-20020a54470d000000b003a71e86e83fmr1127475oik.51.1691536014781; Tue, 08
 Aug 2023 16:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
 <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com> <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com>
In-Reply-To: <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2023 16:06:44 -0700
Message-ID: <CAMKF1so0DFL3CZqtPKzi1QBV2cQ=6FD=J=TsaFS8ME8KXyPsYg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Jose Quaresma <jose.quaresma@foundries.io>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004934740602716b9a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 23:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185680

--0000000000004934740602716b9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 4:00 PM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

>
>
> Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 8/08/2023 =C3=
=A0(s) 18:05:
>
>> On Tue, Aug 8, 2023 at 9:08=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
>> wrote:
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  meta/recipes-core/systemd/systemd-boot_254.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb
>> b/meta/recipes-core/systemd/systemd-boot_254.bb
>> > index 5d69cf83ab..b91bbfe485 100644
>> > --- a/meta/recipes-core/systemd/systemd-boot_254.bb
>> > +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
>> > @@ -53,7 +53,7 @@ COMPATIBLE_HOST =3D
>> "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
>> >  COMPATIBLE_HOST:x86-x32 =3D "null"
>> >
>> >  do_compile() {
>> > -       ninja systemd-boot
>> > +       ninja -v systemd-boot
>>
>> I think this is only useful during debugging. So perhaps a comment to
>> enable it is better than enabling it always.
>>
>
> The meson bbclass also compile with verbose so in my opinion it is better
> to do the same
> and make it consistent with the main systemd recipe
>
> meson_do_compile() {
>     meson compile -v ${PARALLEL_MAKE}
> }
>

Ideally we only want the verbosity when something goes wrong and meson
ninja etc are good at that with their defaults perhaps that -v should be
turned off by default as well

>
>
> Jose
>
>
>> >  }
>> >
>> >  do_install() {
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#185665):
>> https://lists.openembedded.org/g/openembedded-core/message/185665
>> > Mute This Topic: https://lists.openembedded.org/mt/100625045/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>> raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>

--0000000000004934740602716b9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 8, 2023 at 4:00 PM Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 8/08/2023 =C3=A0(s) 18:05:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug 8, =
2023 at 9:08=E2=80=AFAM Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@g=
mail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_=
254.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb" rel=3D"norefer=
rer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; index 5d69cf83ab..b91bbfe485 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; @@ -53,7 +53,7 @@ COMPATIBLE_HOST =3D &quot;(aarch64.*|arm.*|x86_64.*|=
i.86.*)-linux&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST:x86-x32 =3D &quot;null&quot;<br>
&gt;<br>
&gt;=C2=A0 do_compile() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja systemd-boot<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja -v systemd-boot<br>
<br>
I think this is only useful during debugging. So perhaps a comment to<br>
enable it is better than enabling it always.<br></blockquote><div><br></div=
><div>The meson bbclass also compile with verbose so in my opinion it is be=
tter to do the same</div><div>and make it consistent with the main systemd =
recipe<br><br></div><div>meson_do_compile() {</div>=C2=A0 =C2=A0 meson comp=
ile -v ${PARALLEL_MAKE}<br>}</div></div></blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Ideally we only want the verbosity when something g=
oes wrong and meson ninja etc are good at that with their defaults perhaps =
that -v should be turned off by default as well=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote" dir=3D"auto"><br=
><br>Jose</div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install() {<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#185665): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/185665" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/185665</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10062504=
5/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100625045/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
</blockquote></div></div>

--0000000000004934740602716b9a--

