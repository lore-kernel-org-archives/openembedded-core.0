Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93D5C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 15:52:14 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.24568.1718812329740876752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 08:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tzjqc1GL;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-80b86cd886fso1883611241.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718812329; x=1719417129; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5cjcLzehc998A+q/UnG/sNbrDjJQgw4Ak72wbDSNnY=;
        b=Tzjqc1GLDCfoOsvb44oeEW+HaXhGLxKMrolh4kjyf7mCjGLmlSFxQNb44PM+sryTQj
         uaGtroCoLNcAKAWyjzGDq03KkKpCaVZDqzMHPrg8Rrp59jlJxqdcwsQcqQ4Nvu8Xug0Y
         ai2utg4nJ4FnPbweMI4Dwql2QP47NwlHeE1XhgzF5YsfhKw84D5N+Aw9N9m9yA3UPwtn
         I6t8kCtl0XFuKSBwaoC37CNCNaHlhXfHbF8m8pT0uFHFnqOmm5T1QVlPDHc8q5QIQNem
         Ut0Uj47okPdd6ZM+W+RmM93ShpOwhRzT8VM1f4cnFEKj5LDD74J4ZvKK4rwCJmMb1sWy
         HIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812329; x=1719417129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5cjcLzehc998A+q/UnG/sNbrDjJQgw4Ak72wbDSNnY=;
        b=tbrD7ofxRhHUprEti42A2kwQFb8VeJ81vfF30joL0oYxmqYXS2DYpY1v+KW4/BOR+4
         91/aOR6Efkz9cFCO3ry3TT6s/riLfDwk2i0YvRw56jfc/aLBOLg8z2cpIoszO9uUn7oc
         tJQDgmKxQb/c/n0qCcqQOFDUAoWTgyLcrDThZT8d/I0WERP4agoXmCKxFW1xz27CO5K+
         uZPre4vYshMRMPag7NF8azAw+/YlQ6dRR/FvLNyEEeKqktZYykyX0Ge0Lmsog8zA2Vxf
         q4jeZd1j/DENFpOSI3mSWDa2EvzdqCdcJ/o3tgygQ4efxp9JpkxpIJv/LI81yjtd+Atq
         iG6g==
X-Forwarded-Encrypted: i=1; AJvYcCVE6cci9+OA06WtpCQ+EAuZYq8jzr7BFC6Qz2hdakzQtFvYcZ8CfY+73OcizLzUbWQ3PLVVVFc0rWW+aDh10xhzVmI04aOXcn1beVRGqkajOkoQKwR5jnKv
X-Gm-Message-State: AOJu0YyCKEOw0v8offLBfei8fpFbnjQb3sJ8HEnO1dCfKKUX+QfBtZqF
	ut9swuJCAIxBIrSdIDsLwfKoYsXVjB+t5KZey/XGFecZxiHHsKb1mpYYuYl/nBK56NSJSz22Pkr
	N0gKXsU1xaueqLqDzamXd+5MJfqINER0nZ/s=
X-Google-Smtp-Source: AGHT+IGBQk/yhPxLXgrOUkEbk9pe+yDAj/ikrTJVHPBqtbK/X81xNP+4Fdd12WHMpMpAEkekUkXBEL6JLLNwmjNXpnU=
X-Received: by 2002:a67:e914:0:b0:48f:18de:1f6e with SMTP id
 ada2fe7eead31-48f18de20c3mr1901064137.18.1718812328739; Wed, 19 Jun 2024
 08:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
 <20240619085957.2787700-10-alex.kanavin@gmail.com> <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
 <CANNYZj-ZUTSpxwpycadiwnAyWkK2SbvX7BguE5hr3ZY0Kq6XWQ@mail.gmail.com>
 <D479E782-0AE4-45EE-A0B7-A7277B728857@arm.com> <CANNYZj-Ynnex=dPFv+yD_pvV8VFafv5Mwmvyeik_5VCH_YqCqw@mail.gmail.com>
In-Reply-To: <CANNYZj-Ynnex=dPFv+yD_pvV8VFafv5Mwmvyeik_5VCH_YqCqw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 19 Jun 2024 16:51:58 +0100
Message-ID: <CANPvuRkFCZMMexji=8=xn+R66VGEPn7qCJSVqz-Pe=a2ZsF4OQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/15] glslang: mark 0001-generate-glslang-pkg-config.patch
 as Inappropriate
To: alex.kanavin@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004a4c36061b402e6a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200922

--0000000000004a4c36061b402e6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin via lists.openembedded.org <alex.kanavin=3D
gmail.com@lists.openembedded.org> escreveu (quarta, 19/06/2024 =C3=A0(s) 16=
:40):

> On Wed, 19 Jun 2024 at 17:35, Ross Burton <Ross.Burton@arm.com> wrote:
> > >>> +Upstream-Status: Inappropriate [independently developed patch
> submitted at https://github.com/KhronosGroup/glslang/pull/3371]
> > >>
> > >>
> > >> Maybe we can switch to the upstream submission. It is mostly the sam=
e
> with the exception of the -lHLSL -lSPVRemapper we have in yocto.
> > >
> > > We can't because it hardcodes usr/lib and usr/include. I left a
> > > comment in the PR asking to fix that.
> >
> > I can=E2=80=99t see that comment in the PR=E2=80=A6
>
> It's right at the bottom. Visible here as well:
> https://github.com/KhronosGroup/glslang/pull/3371/files


I can't see it either, maybe it's in private mode


>
>
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200918):
> https://lists.openembedded.org/g/openembedded-core/message/200918
> Mute This Topic: https://lists.openembedded.org/mt/106757095/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004a4c36061b402e6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a=
 href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembed=
ded.org</a>&gt; escreveu (quarta, 19/06/2024 =C3=A0(s) 16:40):<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 19 Jun 2024 at 17:35=
, Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">=
Ross.Burton@arm.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; +Upstream-Status: Inappropriate [independently developed =
patch submitted at <a href=3D"https://github.com/KhronosGroup/glslang/pull/=
3371" rel=3D"noreferrer" target=3D"_blank">https://github.com/KhronosGroup/=
glslang/pull/3371</a>]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Maybe we can switch to the upstream submission. It is mostly =
the same with the exception of the -lHLSL -lSPVRemapper we have in yocto.<b=
r>
&gt; &gt;<br>
&gt; &gt; We can&#39;t because it hardcodes usr/lib and usr/include. I left=
 a<br>
&gt; &gt; comment in the PR asking to fix that.<br>
&gt;<br>
&gt; I can=E2=80=99t see that comment in the PR=E2=80=A6<br>
<br>
It&#39;s right at the bottom. Visible here as well:<br>
<a href=3D"https://github.com/KhronosGroup/glslang/pull/3371/files" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/KhronosGroup/glslang/pull/=
3371/files</a></blockquote><div><br></div><div>I can&#39;t see it either, m=
aybe it&#39;s in private mode<br></div><div>=C2=A0<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
<br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200918): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200918" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200918</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106757095/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106757095/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000004a4c36061b402e6a--

