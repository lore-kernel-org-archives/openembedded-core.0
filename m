Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E321C46CA0
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:42:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.29817.1701168126521696623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 02:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=APnJRI/g;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-332f90a375eso1783411f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 02:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701168125; x=1701772925; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jPtzIYpCQZkmdJxgBVrmIHfK3JbsiJb5wLBawd9Apdk=;
        b=APnJRI/gFZQI19ntR5viK1lp3dtR5lowEuuK82a08Zy/GhdIQ4QAlFuoTUhfUCWdzI
         /gvlvbnAEG4h/x7dwMdYngiU5quOwSeU1HhxuXEEstKZUDF5/Ylo7zxyzkDJVYYsxuuO
         x13T6aIwwmvqo/DJXambUxZXYYi5ro2ij3DH2VQwJvjvpBpJ/WABgwMp6vPWKn8WuZeD
         1v6703eiXiQe3HsxW6LBTJbpk/TQEs6HV2uaCmjmsyS82X08s5v8WJGe4AYjw2brXVEa
         IljSEwINTBdIsra6SuqxkHXYcTbi2NYh7Qne1EwrNGLTXkpfu2nOFa/5D3n4ECGhuH6x
         Whxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701168125; x=1701772925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPtzIYpCQZkmdJxgBVrmIHfK3JbsiJb5wLBawd9Apdk=;
        b=sB8loHBpfiFNIXB7cU2/GwXzgRGUyUFGGZ8eB7crIKgiipFeFE7EHAMvU9zHxCX8F8
         30rf7yGFO7oKYYb7lm9scxYn+N+uiGj4yk1VUZ3U95Ov9PiCHyrtH2Iohu47bWWd4rMJ
         T8Z9C8PQfC2/B4p7uRIcpxB0/qxltRXYH/S7OSwcS5dRYp26mw/lGX+sR7ER6kcR5sRi
         msSXuvwAF3b2OuiaAZ2aBKRHpFupFH765j+t+Qrr0/toTR1Jfz91dMUksVbyS3d+5MN1
         GH9sCtiuXXqLYP/9mCeGgfgacAyOSGq2NultezmSwsOKXmlHt9JQKB+b+Yzam2vnWVqy
         XRLw==
X-Gm-Message-State: AOJu0YxNSscPXyR/j402e2gGLnaJsxPWif7Kw7VGPLL9pFf9axVYzdbx
	xNe6DK2KGiz4dcOmShXtC7k/DE63e6EY1pumpLI=
X-Google-Smtp-Source: AGHT+IGuugHfoVSbpsZI/IAugdUqO26U6tiyNIZdRmH5pAZZXUQI/aaYDGarCzu7YYN0PwzvinBkBhNtdhQ6z0GeFjI=
X-Received: by 2002:a5d:51c5:0:b0:332:ca67:b6a1 with SMTP id
 n5-20020a5d51c5000000b00332ca67b6a1mr10537105wrv.0.1701168124510; Tue, 28 Nov
 2023 02:42:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1678709427.git.Martin.Jansa@gmail.com> <06c7db2b170b9cf47c803ea12c83b58f886074b2.1678709427.git.Martin.Jansa@gmail.com>
 <45473015.fMDQidcC6G@linc> <CA+chaQdxp=E_mNZ15daXhb3EyHwqiStB09c2vWG-k2AWAQu28A@mail.gmail.com>
In-Reply-To: <CA+chaQdxp=E_mNZ15daXhb3EyHwqiStB09c2vWG-k2AWAQu28A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Nov 2023 11:41:52 +0100
Message-ID: <CA+chaQcBvfCJWaNOoj0YH3tk7GyuOSSf6ymcqDbz-1tmRS1Cpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/14] image-artifact-names: add
 IMAGE_MACHINE_SUFFIX variable
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3c849060b34118e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 10:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191355

--000000000000c3c849060b34118e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

this was fixed in:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D19541
please check it and share your opinion about these changes, otherwise it
won't get merged and https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12=
937
will be closed as "won't fix".

Cheers,

On Thu, May 11, 2023 at 9:41=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> Hi Paul,
>
> I'm sorry about that, will make sure this is supported again in final
> state with all [YOCTO #12937] changes where the *_NAME and *_LINK_NAME
> variables are reversed:
>
> -IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
> -IMAGE_LINK_NAME ?=3D
> "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
> +IMAGE_NAME ?=3D
> "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
> +IMAGE_LINK_NAME ?=3D "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
>
> and versioned hardlinks (instead of symlinks) *_LINK_NAME are created by
> separate task. Which will respect *_LINK_NAME variables being set to empt=
y
> to disable creating them.
>
> I've just added another commit to my [YOCTO #12937] staging branch
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/art=
ifacts
> to respect empty *_LINK_NAME variables also for kernel artifacts.
>
> Cheers,
>
> On Wed, Apr 19, 2023 at 12:43=E2=80=AFAM Paul Eggleton <
> bluelightning@bluelightning.org> wrote:
>
>> Hi Martin
>>
>> On Tuesday, 14 March 2023 01:15:36 NZST Martin Jansa wrote:
>> > * to make it easier for projects to avoid default -${MACHINE} suffix i=
f
>> >   the ${MACHINE} named DEPLOY_DIR_IMAGE works better for them
>> >
>> > * also use IMAGE_LINK_NAME in IMAGE_NAME to make it more clear
>> >   that IMAGE_NAME is the same as IMAGE_LINK_NAME but with version
>> >   suffix
>> >
>> > * adding it as separate variable helps us to catch the cases
>> >   where we didn't respect ${IMAGE_LINK_NAME} variable and just used
>> >   the common default ${IMAGE_BASENAME}-${MACHINE}.
>> >
>> > [YOCTO #12937]
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta/classes-recipe/image-artifact-names.bbclass  | 15 ++++++++++++--=
-
>> >  meta/classes-recipe/kernel-artifact-names.bbclass |  2 +-
>> >  2 files changed, 13 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/classes-recipe/image-artifact-names.bbclass
>> > b/meta/classes-recipe/image-artifact-names.bbclass index
>> > 9dc25b6dde..ac2376d59a 100644
>> > --- a/meta/classes-recipe/image-artifact-names.bbclass
>> > +++ b/meta/classes-recipe/image-artifact-names.bbclass
>> > @@ -11,11 +11,20 @@
>> >  IMAGE_BASENAME ?=3D "${PN}"
>> >  IMAGE_VERSION_SUFFIX ?=3D "-${DATETIME}"
>> >  IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME SOURCE_DATE_EPOCH=
"
>> > -IMAGE_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
>> > -IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}"
>> > +IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
>> > +IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
>>
>> So there's a minor unfortunate side-effect of this in that you can no
>> longer
>> just set IMAGE_LINK_NAME =3D "" to drop the symlinks - a minority use ca=
se,
>> but
>> something I have used. Of course you can just re-set the value of
>> IMAGE_NAME.
>> I am making a note in the manual and migration guide.
>>
>> Cheers
>> Paul
>>
>>
>>
>>
>>

--000000000000c3c849060b34118e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<div><br></div><div>this was fixed in:</div><div><=
a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D19541">https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D19541</a><br></div><div>please check it and share your opinion about the=
se changes, otherwise it won&#39;t get merged and=C2=A0<a href=3D"https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D12937">https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D12937</a> will be closed as &quot;won&#39;t fix&=
quot;.</div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 11, 2023 at 9:41=
=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mart=
in.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">Hi Paul,<div><br></div><div>I&#39;m sorr=
y about that, will make sure this is supported again in final state with al=
l=C2=A0[YOCTO #12937] changes where the *_NAME and *_LINK_NAME variables ar=
e reversed:</div><div><br></div><div>-IMAGE_NAME ?=3D &quot;${IMAGE_LINK_NA=
ME}${IMAGE_VERSION_SUFFIX}&quot;<br>-IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BAS=
ENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}&quot;<br>+IMAGE_NAME ?=3D=
 &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}&quot;<b=
r>+IMAGE_LINK_NAME ?=3D &quot;${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}&quot;<br=
></div><div><br></div><div>and versioned hardlinks (instead of symlinks) *_=
LINK_NAME are created by separate task. Which will respect *_LINK_NAME vari=
ables being set to empty to disable creating them.</div><div><br></div><div=
>I&#39;ve just added another commit to my [YOCTO #12937] staging branch <a =
href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djan=
sa/artifacts" target=3D"_blank">https://git.openembedded.org/openembedded-c=
ore-contrib/log/?h=3Djansa/artifacts</a> to respect empty *_LINK_NAME varia=
bles also for kernel artifacts.</div><div><br></div><div>Cheers,</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Apr 19, 2023 at 12:43=E2=80=AFAM Paul Eggleton &lt;<a href=3D"mailto:blu=
elightning@bluelightning.org" target=3D"_blank">bluelightning@bluelightning=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hi Martin<br>
<br>
On Tuesday, 14 March 2023 01:15:36 NZST Martin Jansa wrote:<br>
&gt; * to make it easier for projects to avoid default -${MACHINE} suffix i=
f<br>
&gt;=C2=A0 =C2=A0the ${MACHINE} named DEPLOY_DIR_IMAGE works better for the=
m<br>
&gt; <br>
&gt; * also use IMAGE_LINK_NAME in IMAGE_NAME to make it more clear<br>
&gt;=C2=A0 =C2=A0that IMAGE_NAME is the same as IMAGE_LINK_NAME but with ve=
rsion<br>
&gt;=C2=A0 =C2=A0suffix<br>
&gt; <br>
&gt; * adding it as separate variable helps us to catch the cases<br>
&gt;=C2=A0 =C2=A0where we didn&#39;t respect ${IMAGE_LINK_NAME} variable an=
d just used<br>
&gt;=C2=A0 =C2=A0the common default ${IMAGE_BASENAME}-${MACHINE}.<br>
&gt; <br>
&gt; [YOCTO #12937]<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/image-artifact-names.bbclass=C2=A0 | 15 ++++=
++++++++---<br>
&gt;=C2=A0 meta/classes-recipe/kernel-artifact-names.bbclass |=C2=A0 2 +-<b=
r>
&gt;=C2=A0 2 files changed, 13 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; b/meta/classes-recipe/image-artifact-names.bbclass index<br>
&gt; 9dc25b6dde..ac2376d59a 100644<br>
&gt; --- a/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; +++ b/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; @@ -11,11 +11,20 @@<br>
&gt;=C2=A0 IMAGE_BASENAME ?=3D &quot;${PN}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX ?=3D &quot;-${DATETIME}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D &quot;DATETIME SOURCE_=
DATE_EPOCH&quot;<br>
&gt; -IMAGE_NAME ?=3D &quot;${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUF=
FIX}&quot;<br>
&gt; -IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}-${MACHINE}&quot;<br>
&gt; +IMAGE_NAME ?=3D &quot;${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}&quot;=
<br>
&gt; +IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}&q=
uot;<br>
<br>
So there&#39;s a minor unfortunate side-effect of this in that you can no l=
onger <br>
just set IMAGE_LINK_NAME =3D &quot;&quot; to drop the symlinks - a minority=
 use case, but <br>
something I have used. Of course you can just re-set the value of IMAGE_NAM=
E. <br>
I am making a note in the manual and migration guide.<br>
<br>
Cheers<br>
Paul<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000c3c849060b34118e--

