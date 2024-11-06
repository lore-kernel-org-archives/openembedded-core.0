Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20E7D59F50
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 16:04:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.49253.1730909049445223511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 08:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aLEQVhTz;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so8576406e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 08:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730909047; x=1731513847; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xXWwuKujWITNgDhHi6pqIOnFtxzPvfMKLEK0xdQxXpY=;
        b=aLEQVhTzaz8g0n4KkOvMiOSVgIQ8rbovn32GNRF6kivewku8kCjeBgRCSAywS1WLYN
         0ZTXf8U1Va4j2QMhKa4gOLTJ+U/lgMfV2Co1FJ9sL1oAja8qa6yaKZiWK9naA7VXKNkK
         dd+zK1swrYl95nJGFKa+6ZWTrT5OEllJG4AhR4rMJdsKdCl7++0cUvHFP62qpR9QItbK
         U2Y74NGQ+WBImMIqpXI98QhMu0L7ly1ecOqVIYCbO60DCUEza2Fqg+a2FwQ5YL9zZIIw
         o3b0zlkZwcoE/lZibtEyZ+s1FpzwaHdqjmEC2OGnTrHAVUEOZMafw3oxPE61nuh7nGWc
         JqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909047; x=1731513847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXWwuKujWITNgDhHi6pqIOnFtxzPvfMKLEK0xdQxXpY=;
        b=W1BfzfCcbQLtSSECmAXupwvlEFK2qRZMU28KSm0OjxPn3wEwAmLBnTv+rEd3NT1v6q
         WxwDkqyBg6DW9ck7I5vby4R0K451+xAw6qqPCmi8PkFHNDOixARx7CWd6BhlVTbSiujX
         HTdYVoyzb+jskzDKGp46igPjYx9bxvULx/lKmqQg16on/ZM1uTrk8fOZGfyPU2o//1Gl
         IeMp5ed6e+wCwLgZqnOsPkLWhe4kjlFlNMphIH++zJpp79Qml+Jnc7gkj3bP1pR78fwu
         7T6qWWVEdyj3VtESoSYcP1b8GqnWNnoRiv80BwwyAY06jUtiU/Hv90kquLwpdRv120Gk
         fwwg==
X-Forwarded-Encrypted: i=1; AJvYcCWzAwPEE5aM/5wfJ4R6wax7NlfpKrBuCQ6IRSS5CFYvI+h7aBCB1VOJMFJC01Gq4ei3GvEP8KsJoI2cRlmS4A1+5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwO/bjQ0eUXhTj1pQM63QNIUbCoe83Pq/XcvYmgUaXb7HLv9sP8
	4aMSv8M5qM617SUy4LGpuRtLP342GfDxHqGYqSnaA+H++oKIBvx860kVRRTYWDOAlkhldjYgTP5
	1E+3dVoDd8iZcW9sMMO8JDKQ5Sts=
X-Google-Smtp-Source: AGHT+IHAsjZvBr2qvFnRo89zziDYq1dm6zV5USnAHm4RcFyrNMw6WMmLj/DBq38PZV2G+LKhU4JyUnaPFgagRZ+yzSc=
X-Received: by 2002:a05:6512:3e25:b0:52f:2ea:499f with SMTP id
 2adb3069b0e04-53b3490eab7mr21433162e87.24.1730909046951; Wed, 06 Nov 2024
 08:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
 <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org> <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
In-Reply-To: <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Nov 2024 17:03:56 +0100
Message-ID: <CANNYZj9Rmrpucd1mtj7jCkPa1b-GS+r5ZJtjS6-A82XjxYw0Kg@mail.gmail.com>
Subject: Re: [OE-core] bitbake.conf: require lz4 instead of lz4c
To: jsbronder@cold-front.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Enrico Jorns <ejo@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000e1d840062640aa6e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 16:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206793

--000000000000e1d840062640aa6e
Content-Type: text/plain; charset="UTF-8"

Can we rather make the affected recipe depend on the native tool rather
than the host one? And pls file a ticket with barebox upstream or maybe the
maintainer can respond right here.

Alex

On Wed 6. Nov 2024 at 16.52, Justin Bronder via lists.openembedded.org
<jsbronder=cold-front.org@lists.openembedded.org> wrote:

> On 06/11/24 07:50 +0000, Richard Purdie wrote:
> > On Tue, 2024-11-05 at 10:37 -0500, Justin Bronder via
> lists.openembedded.org wrote:
> > > With bitbake commit 'bb: compress: use lz4 instead of lz4c' we require
> > > lz4, not lz4c [1].  Going as far back as Ubuntu 16.04/Fedora 25, they
> > > are packaged together so it should be safe to simply adjust the
> > > requirement from lz4c to lz4.
> > >
> > > Note that the two are largely the same, but upstream has considered
> lz4c
> > > deprecated since at least 2018 [2].
> > >
> > > 1.
> https://git.openembedded.org/bitbake/commit/?id=907472034b344e4eb73cfd43059a413469f52e1c
> > > 2. https://github.com/lz4/lz4/pull/553
> > >
> > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > ---
> > >  meta/conf/bitbake.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index eda505c861..14e761e2e7 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -517,7 +517,7 @@ HOSTTOOLS += " \
> > >      [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown
> chrpath cmp comm cp cpio \
> > >      cpp cut date dd diff diffstat dirname du echo egrep env expand
> expr false \
> > >      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip
> gzip \
> > > -    head hostname iconv id install ld ldd ln ls lz4c make md5sum
> mkdir mkfifo mknod \
> > > +    head hostname iconv id install ld ldd ln ls lz4 make md5sum mkdir
> mkfifo mknod \
> > >      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> > >      python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen
> sed seq sh \
> > >      sha1sum sha224sum sha256sum sha384sum sha512sum \
> > >
> >
> > This caused a failure in barebox:
> >
> >
> https://valkyrie.yoctoproject.org/#/builders/23/builds/409/steps/14/logs/stdio
> >
>
> I see, sorry about that.
>
> What would be the recommended path forward?
>
> - Add lz4c to HOSTTOOLS_NONFATAL so it's still symlinked.  This would fix
> barebox and any other recipes that still depend on lz4c on distributions
> where lz4c is still packaged but leave others without an early warning
> system.
> - Submit patches to barebox and others to use lz4 instead of lz4c.  This
> is probably more correct but will leave Tumbleweed unsupported by default
> with other distros to presumably follow.
> - Convince Tumbleweed (and others) to continue packaging lz4c.
>
>
> --
> Justin Bronder
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206790):
> https://lists.openembedded.org/g/openembedded-core/message/206790
> Mute This Topic: https://lists.openembedded.org/mt/109427109/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e1d840062640aa6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can we rather make the affected recipe depend on the nati=
ve tool rather than the host one? And pls file a ticket with barebox upstre=
am or maybe the maintainer can respond right here.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed 6. Nov 2024 at 16.52, Justin Bro=
nder via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;jsbronder=3D<a href=3D"mailto:cold-front.org@lists.openembedded.org"=
>cold-front.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">On 06/11/24 07:50 +0000, Richard Purdie wrote:<br>
&gt; On Tue, 2024-11-05 at 10:37 -0500, Justin Bronder via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; &gt; With bitbake commit &#39;bb: compress: use lz4 instead of lz4c&#3=
9; we require<br>
&gt; &gt; lz4, not lz4c [1].=C2=A0 Going as far back as Ubuntu 16.04/Fedora=
 25, they<br>
&gt; &gt; are packaged together so it should be safe to simply adjust the<b=
r>
&gt; &gt; requirement from lz4c to lz4.<br>
&gt; &gt; <br>
&gt; &gt; Note that the two are largely the same, but upstream has consider=
ed lz4c<br>
&gt; &gt; deprecated since at least 2018 [2].<br>
&gt; &gt; <br>
&gt; &gt; 1. <a href=3D"https://git.openembedded.org/bitbake/commit/?id=3D9=
07472034b344e4eb73cfd43059a413469f52e1c" rel=3D"noreferrer" target=3D"_blan=
k">https://git.openembedded.org/bitbake/commit/?id=3D907472034b344e4eb73cfd=
43059a413469f52e1c</a><br>
&gt; &gt; 2. <a href=3D"https://github.com/lz4/lz4/pull/553" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/lz4/lz4/pull/553</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Justin Bronder &lt;<a href=3D"mailto:jsbronder@col=
d-front.org" target=3D"_blank">jsbronder@cold-front.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/conf/bitbake.conf | 2 +-<br>
&gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; &gt; index eda505c861..14e761e2e7 100644<br>
&gt; &gt; --- a/meta/conf/bitbake.conf<br>
&gt; &gt; +++ b/meta/conf/bitbake.conf<br>
&gt; &gt; @@ -517,7 +517,7 @@ HOSTTOOLS +=3D &quot; \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 [ ar as awk basename bash bunzip2 bzip2 =
cat chgrp chmod chown chrpath cmp comm cp cpio \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 cpp cut date dd diff diffstat dirname du=
 echo egrep env expand expr false \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 fgrep file find flock g++ gawk gcc getco=
nf getopt git grep gunzip gzip \<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls l=
z4c make md5sum mkdir mkfifo mknod \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls l=
z4 make md5sum mkdir mkfifo mknod \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch pe=
rl pr printf pwd \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 python3 pzstd ranlib readelf readlink re=
alpath rm rmdir rpcgen sed seq sh \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 sha1sum sha224sum sha256sum sha384sum sh=
a512sum \<br>
&gt; &gt; <br>
&gt; <br>
&gt; This caused a failure in barebox:<br>
&gt; <br>
&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/23/builds/409/=
steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.=
yoctoproject.org/#/builders/23/builds/409/steps/14/logs/stdio</a><br>
&gt; <br>
<br>
I see, sorry about that.<br>
<br>
What would be the recommended path forward?<br>
<br>
- Add lz4c to HOSTTOOLS_NONFATAL so it&#39;s still symlinked.=C2=A0 This wo=
uld fix barebox and any other recipes that still depend on lz4c on distribu=
tions where lz4c is still packaged but leave others without an early warnin=
g system.<br>
- Submit patches to barebox and others to use lz4 instead of lz4c.=C2=A0 Th=
is is probably more correct but will leave Tumbleweed unsupported by defaul=
t with other distros to presumably follow.<br>
- Convince Tumbleweed (and others) to continue packaging lz4c.<br>
<br>
<br>
-- <br>
Justin Bronder<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206790): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206790" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206790</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109427109/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109427109/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e1d840062640aa6e--

