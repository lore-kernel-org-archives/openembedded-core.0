Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE3CCD3445
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 23:22:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2037.1778196124373208395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 16:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pN5uS3+c;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so16938465e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778196123; cv=none;
        d=google.com; s=arc-20240605;
        b=CpypIJduA3gHjOnx6xq8qHdcWCjV8Va8tUiC/Waf7hNxNAQsXfKjmcfstPPtwnyKJA
         Jo/oZiLDYUSfJjAVT9LMH0UfmvgThtgzRyF1H69q79zpqzM6fTQNpCg9LZQg/SuvBtz+
         2np00v8oRMdXrERfGrQl2cJ16g55F8q3qZjS0Ty3Z9GDT8cJ1ocfpttDwKbuf5VDgqC5
         TGRWHTK3WrEcInLxBSj/+C4L39mG2ZQLbO54ajmFzhQgPNmFBLpNUSqme2kNv/aaOvEG
         PDT9aRg1n0asc61EyMq0Hxbighs7JiMWi02no8TG2cnd6yswNFO4QACWVkKjk8CiDTdI
         OPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P4lfkm/jj2HVHHIrVR6Zb8m0YUpC3Rw7cLANJnqWjeg=;
        fh=PSpI+hIO2z34VQZ4JNUAU9BkuvcclG+ArbQ88QYF5H4=;
        b=DHqG7eOXCfd11pRnezzvWBN31/MNezzVLx/U2JE22qNAPXvbqhKJAFs7d4rVglR3zV
         Tv6YPCallkR6QDkc9cS8GGb9Qe/oMETfhmFFlhNOcZ2eKtDLmWl5Du6Ikhd4ZEmzIaPv
         wCOju/7wS/6K0ZTSXV3D+47FTGn+UPPUR+bAcoZNfuucrfDe7b6UNe2XBzwwsi1GriWX
         tg4lAH+a81I0MZ00fWdMv88VEAGqbG9tBb7h8WL74nAVF6eFp0Imfy8TjSwHLddXaJQ7
         rcINrWOaT1i+ZtISkEubA+VufwGquds5RuUbaSPF+oD1DLkUzYONq60gTeKzbHyLd/m0
         KRTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778196123; x=1778800923; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P4lfkm/jj2HVHHIrVR6Zb8m0YUpC3Rw7cLANJnqWjeg=;
        b=pN5uS3+c//Wey3KsdlCCGvMGAabzSrTulXD0iQAaYSDcd1HH4hsPKX/WhP1hNehVKm
         CA5kaO+aIg63bnXbMPwbsDinHhmtMpBekuVvQdOxNYRzfkKM6KbiWuA2skQKYCXGW8DT
         Z4xxsBSXZ9GNoM4hGPKS4hCc4Pzl+sEyQK+eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196123; x=1778800923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4lfkm/jj2HVHHIrVR6Zb8m0YUpC3Rw7cLANJnqWjeg=;
        b=E08iUWUAXCL4ejuFSPyyesExejjzaPVK1kvQEkkW2swV7fKi7yN46utXfCeCbVtYlR
         ptdNhDh6kRoozII0WgDY8ctWQyV85iEqk/enqAxogXT+frAQlqLNUMIjv6M5RW+bwNLb
         lKoZCtSONdK2GZgmJKkAwWnPGQKXZbwz9lLL3EHTn0fq0z/CxqpN+ms5+0GDpMa3UN+a
         4vrwDIB++6jIC1k+EriGR3O/tJSqzzgFMJj2bwpN+J5O/zPqJVZtLEVu/FQ2OqVDwMKL
         kFUyYDpHPXHuXDcquJ7hefR86gw8RUJ4HINxxVWQmkGE9hnq9JD1PD0IYPFYFml33w3H
         ENXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0TZ7fQjhhfxInbxLR2ZqOfImWgWTMjrsY5tulj/oLiVaVFTV8qr85DayvMXHZQ3KFPHfyciFOOUrwLXA/uP7X5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySVtUfzlRVNjFqdQwQsqHgl5IVmJcbXuKbFx0zbmHLYwKriS5G
	gViwXT/45tZjGJPbMNVLXriF4ldclsjJmc9vJ2SIZp6OYAVpdQZiWbPKBTH6X2cvS7wEBY6Wg/0
	FiGMHFON+KW34VIInDvWgGNBsqYOguPyrs0PQ4yGTaQ==
X-Gm-Gg: AeBDiesi2XJg+YvcViJcv74BAgZ8U48BWCSCFjooJQcdHBh2ngbcKxL3WAqJxu3y0I1
	nLfcg/iox6cgZ7ohzeygyGMrKaL9bpmTZ67SG8oP5Qf/SEGYKqJEdrOJ3hXuXspF7sO7B7Avjx7
	UcxdOOV0TyclMJ1aJshG/GDRFxdiRIlkczPI4ajT4zGSVXAl+BcxmX4iDpCGImzVN/RsLvoMxNK
	rw8ZxAnsQ0goFjBWIhZucf/by7D5Mj267cw0SwLGwMcGGZR2B2vkMn8WjCzvzr7ipQOdzCWOa69
	IXnl/sUN52fUVBBgj840RGrSOCjQOKC4CHzxCOUR
X-Received: by 2002:a05:600c:3b17:b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-48e51e20705mr144887175e9.9.1778196122528; Thu, 07 May 2026
 16:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260506194507.3786568-1-igor.opaniuk@foundries.io>
 <DIBVZ5KGY6VD.3JQ0DG3RR7SJG@smile.fr> <CAL6CDMH02AETCQ68CozA+DtYCAei4KyTeMm2WGOntcjfPQOVSQ@mail.gmail.com>
 <CANPvuR==eX=rLYTiAzJ-K0024gc5ojntG-jmqHC+wF9z8-3KsA@mail.gmail.com>
In-Reply-To: <CANPvuR==eX=rLYTiAzJ-K0024gc5ojntG-jmqHC+wF9z8-3KsA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 8 May 2026 01:21:36 +0200
X-Gm-Features: AVHnY4Jv3MBS2JYY-xiuBq9ekLbOdixlyHXuJwu1hzf_1HI-U07COpDpLS2GbYQ
Message-ID: <CAMSfU+5+HiEUWfSWx9tdV9v8ymcOs0cM8y=pn3zKF_VJV3KduA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] shadow: add libxcrypt-native dependency for
 native and nativesdk variants
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: igor.opaniuk@foundries.io, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin <alex@linutronix.de>, 
	Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000397a970651428cf6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236628

--000000000000397a970651428cf6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 7 mai 2026 =C3=A0 10:54, Jose Quaresma <quaresma.jose@gmail.com> a
=C3=A9crit :

>
>
> Igor Opaniuk via lists.openembedded.org <igor.opaniuk=3D
> foundries.io@lists.openembedded.org> escreveu (quinta, 7/05/2026 =C3=A0(s=
)
> 08:13):
>
>> Hi Yoann,
>>
>> On Wed, May 6, 2026 at 10:46=E2=80=AFPM Yoann Congal <yoann.congal@smile=
.fr>
>> wrote:
>> >
>> > On Wed May 6, 2026 at 9:45 PM CEST, Igor Opaniuk via
>> lists.openembedded.org wrote:
>> > > Configure fails with "crypt() not found" when building shadow-native
>> on
>> > > hosts where libcrypt is no longer part of glibc and the libxcrypt
>> > > development files are not installed (e.g. fresh Ubuntu 24.04+, where
>> > > glibc 2.39 dropped libcrypt and libxcrypt-dev is not pulled in by
>> > > default).
>> > >
>> > > virtual/crypt-native is in ASSUME_PROVIDED (meta/conf/bitbake.conf),
>> > > which is why a plain DEPENDS =3D "virtual/crypt" does not pull
>> > > libxcrypt-native into the native sysroot - the host is expected to
>> > > provide libcrypt. That assumption no longer holds on current
>> > > distributions.
>> >
>> > Note that we added libcrypt-dev as a documented host dependency here:
>> >
>> https://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d175ea1924bf401=
a203fb678261fefb228dc
>>
>> Thanks, I missed that. With virtual/crypt-native in ASSUME_PROVIDED
>> this is consistent with how OE-core treats other
>> host-provided libraries. I'll drop the patch.
>>
>> One small follow-up if it's worth the time:
>>
>> the failure mode for users who miss the doc update is a configure
>> error deep in shadow-native
>> (checking for crypt in -lcrypt... no -> configure: error: crypt() not
>> found), which doesn't obviously point at
>> "install libcrypt-dev on the host".
>>
>> Would a sanity-check addition (something along the lines of
>> ./meta/classes-global/sanity.bbclass
>> testing for crypt.h / -lcrypt on the build host and emitting the same
>> hint as the docs) be welcome?
>>
>
> I think that would be useful and help in interpreting the error. However,
> there's nothing like that in sanity.bbclass.
>

I agree with the idea of a sanity check.
We do have a test for -lstdc++:
https://git.openembedded.org/openembedded-core/tree/meta/classes-global/san=
ity.bbclass#n835
That might be used as a starting point?

Thanks!


>
> Jose
>
>
>> Happy to put a patch together if so.
>>
>> Thanks for the review.
>>
>>
>> >
>> > > A previous attempt to fix this by adding libxcrypt-native to DEPENDS
>> > > unconditionally (commit 65532fc751 "shadow: add libxcrypt-native
>> > > dependency") was reverted in 54eccb76eb because it incorrectly pulle=
d
>> > > a -native recipe into the target build. Use class-specific overrides
>> > > so the target build is unaffected and only shadow-native (and
>> > > nativesdk-shadow) gain the explicit dependency on libxcrypt-native /
>> > > nativesdk-libxcrypt.
>> > >
>> > > Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
>> >
>> >
>> > > ---
>> > >  meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 ++
>> > >  1 file changed, 2 insertions(+)
>> > >
>> > > diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb
>> b/meta/recipes-extended/shadow/shadow_4.19.4.bb
>> > > index 94f155641c..cc69864a2a 100644
>> > > --- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
>> > > +++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
>> > > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Dc9a450b7be84eac23e6353efecb60b5b \
>> > >                      "
>> > >
>> > >  DEPENDS =3D "virtual/crypt"
>> > > +DEPENDS:append:class-native =3D " libxcrypt-native"
>> > > +DEPENDS:append:class-nativesdk =3D " nativesdk-libxcrypt"
>> > >
>> > >  GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shadow/release=
s"
>> > >  SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
>> >
>> >
>> > --
>> > Yoann Congal
>> > Smile ECS
>> >
>>
>>
>> --
>> Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations
>>
>> Igor Opaniuk
>> Senior Software Engineer, Embedded & Security
>> E: igor.opaniuk@foundries.io
>> W: www.foundries.io
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#236565):
>> https://lists.openembedded.org/g/openembedded-core/message/236565
>> Mute This Topic: https://lists.openembedded.org/mt/119185904/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>


--=20
Yoann Congal
Smile ECS

--000000000000397a970651428cf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 7 =
mai 2026 =C3=A0=C2=A010:54, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jo=
se@gmail.com">quaresma.jose@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Igor Opaniuk via <a href=3D"http://lists.openembedded.org" tar=
get=3D"_blank">lists.openembedded.org</a> &lt;igor.opaniuk=3D<a href=3D"mai=
lto:foundries.io@lists.openembedded.org" target=3D"_blank">foundries.io@lis=
ts.openembedded.org</a>&gt; escreveu (quinta, 7/05/2026 =C3=A0(s) 08:13):<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On Wed, May 6, 2026 at 10:46=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:=
yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Wed May 6, 2026 at 9:45 PM CEST, Igor Opaniuk via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; &gt; Configure fails with &quot;crypt() not found&quot; when building =
shadow-native on<br>
&gt; &gt; hosts where libcrypt is no longer part of glibc and the libxcrypt=
<br>
&gt; &gt; development files are not installed (e.g. fresh Ubuntu 24.04+, wh=
ere<br>
&gt; &gt; glibc 2.39 dropped libcrypt and libxcrypt-dev is not pulled in by=
<br>
&gt; &gt; default).<br>
&gt; &gt;<br>
&gt; &gt; virtual/crypt-native is in ASSUME_PROVIDED (meta/conf/bitbake.con=
f),<br>
&gt; &gt; which is why a plain DEPENDS =3D &quot;virtual/crypt&quot; does n=
ot pull<br>
&gt; &gt; libxcrypt-native into the native sysroot - the host is expected t=
o<br>
&gt; &gt; provide libcrypt. That assumption no longer holds on current<br>
&gt; &gt; distributions.<br>
&gt;<br>
&gt; Note that we added libcrypt-dev as a documented host dependency here:<=
br>
&gt; <a href=3D"https://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d1=
75ea1924bf401a203fb678261fefb228dc" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d175ea1924bf401a203f=
b678261fefb228dc</a><br>
<br>
Thanks, I missed that. With virtual/crypt-native in ASSUME_PROVIDED<br>
this is consistent with how OE-core treats other<br>
host-provided libraries. I&#39;ll drop the patch.<br>
<br>
One small follow-up if it&#39;s worth the time:<br>
<br>
the failure mode for users who miss the doc update is a configure<br>
error deep in shadow-native<br>
(checking for crypt in -lcrypt... no -&gt; configure: error: crypt() not<br=
>
found), which doesn&#39;t obviously point at<br>
&quot;install libcrypt-dev on the host&quot;.<br>
<br>
Would a sanity-check addition (something along the lines of<br>
./meta/classes-global/sanity.bbclass<br>
testing for crypt.h / -lcrypt on the build host and emitting the same<br>
hint as the docs) be welcome?<br></blockquote><div><br></div><div>I think t=
hat would be useful and help in interpreting the error. However, there&#39;=
s nothing like that in sanity.bbclass.</div></div></div></blockquote><div><=
br></div><div>I agree with the idea of a sanity check.</div><div>We do have=
 a test for -lstdc++: <a href=3D"https://git.openembedded.org/openembedded-=
core/tree/meta/classes-global/sanity.bbclass#n835">https://git.openembedded=
.org/openembedded-core/tree/meta/classes-global/sanity.bbclass#n835</a></di=
v><div>That might be used as a starting point?</div><div><br></div><div>Tha=
nks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Jose</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Happy to put a patch together if so.<br>
<br>
Thanks for the review.<br>
<br>
<br>
&gt;<br>
&gt; &gt; A previous attempt to fix this by adding libxcrypt-native to DEPE=
NDS<br>
&gt; &gt; unconditionally (commit 65532fc751 &quot;shadow: add libxcrypt-na=
tive<br>
&gt; &gt; dependency&quot;) was reverted in 54eccb76eb because it incorrect=
ly pulled<br>
&gt; &gt; a -native recipe into the target build. Use class-specific overri=
des<br>
&gt; &gt; so the target build is unaffected and only shadow-native (and<br>
&gt; &gt; nativesdk-shadow) gain the explicit dependency on libxcrypt-nativ=
e /<br>
&gt; &gt; nativesdk-libxcrypt.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Igor Opaniuk &lt;<a href=3D"mailto:igor.opaniuk@fo=
undries.io" target=3D"_blank">igor.opaniuk@foundries.io</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.=
4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a> | 2 ++<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-extended/shadow/<a href=3D"http://shado=
w_4.19.4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a> b/me=
ta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.4.bb" rel=3D"noref=
errer" target=3D"_blank">shadow_4.19.4.bb</a><br>
&gt; &gt; index 94f155641c..cc69864a2a 100644<br>
&gt; &gt; --- a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.=
4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a><br>
&gt; &gt; +++ b/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.=
4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a><br>
&gt; &gt; @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc=
9a450b7be84eac23e6353efecb60b5b \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS =3D &quot;virtual/crypt&quot;<br>
&gt; &gt; +DEPENDS:append:class-native =3D &quot; libxcrypt-native&quot;<br=
>
&gt; &gt; +DEPENDS:append:class-nativesdk =3D &quot; nativesdk-libxcrypt&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/sha=
dow-maint/shadow/releases" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/shadow-maint/shadow/releases</a>&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/${PV}/${BP}.t=
ar.gz \<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
&gt;<br>
<br>
<br>
-- <br>
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations<br>
<br>
Igor Opaniuk<br>
Senior Software Engineer, Embedded &amp; Security<br>
E: <a href=3D"mailto:igor.opaniuk@foundries.io" target=3D"_blank">igor.opan=
iuk@foundries.io</a><br>
W: <a href=3D"http://www.foundries.io" rel=3D"noreferrer" target=3D"_blank"=
>www.foundries.io</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236565): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236565" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236565</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119185904/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119185904/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000397a970651428cf6--

