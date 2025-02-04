Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75136C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:33:27 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.114003.1738668801665127555
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVzJoevR;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: uvv.mail@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e5b1c4b952dso259690276.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738668801; x=1739273601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fu6Gf6aJ02NLclblNLZXwi+E7liOnmuzYx07d15zNhI=;
        b=IVzJoevRjxDxCXTYR3lyMLuFFQOjO5WeLl+n/ruz5/Y2zGzUEI7o0Tq5jmds2szOIj
         Z+YjjYAhMXSNDU7Ngw7o+2UxxGR2kuPEVT5OxX+loOnhx/gsXDW0VTgUpwopoexJ69o5
         or41RcniiGyvf7Y6QpE2O0QFsmy+nyGw0klO+BrZ2yenoaK8/4mgQQ4YeSwxFsjRgay1
         za5+C6cvfLKD8EFyBqLfpUA04JruQzseJJ0L7kpiwSfv421uTlFa8S3bAc0hKqCV1Yxw
         yRlUaE67BREA9CetXS1Barozd07fi2tDjBcA9scnbS2k98iWAufO2rLfZIiP36qGbDhN
         9o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738668801; x=1739273601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fu6Gf6aJ02NLclblNLZXwi+E7liOnmuzYx07d15zNhI=;
        b=MBBW6PvlCdL3ggo2qeEb+KjTYc2o5w42Ue+6tXgbuDfKzriDzVNDIey0d1/FIXzquk
         H83Uc+wiuJop+7cDI62ZsZ+YBPhrcDsLjLdeVjgMiADX7TMHYvldoao7OelfRRBPAe5c
         kvaomgigjV97PkWkdtbmtz3ma3S4UC1eVccal75jgHOj/ureiet7qyrQe6/wvg5wOC7w
         W8c+vvPjlhz3AWa3Qf/GaBZ0V2yQXKHwzsWS7neBeDeyTr0YT+1qxaXgLqOFMwp+VwT3
         gIa2NKeayS2AUF7tHnE+gUqgArAoua7QluZRJBWDakccZFY1jqMi8+zyp3n2dBWcjErE
         YUAA==
X-Gm-Message-State: AOJu0YzNv/3eg5PF2sStTeRVzjjpanoOgsamJI8dr3qlRJ4tcEpaw8nQ
	Hp2wN6nBH4uUVgkGgOkIKhq3cdsNzgOZNFSaEvfKAG3eeq7wojUdHg/81a/Sn/nlmQynPUmUEdl
	ntzZwFPMcbNryNsr59DE/1VOa6Jk=
X-Gm-Gg: ASbGncuWkJRQHZCe+S0Ph8BBCrjgJE39vyOZDGDmP4J3v8W7SA5V4cR9khMiovlcoYd
	1z0Jr0gm8jASCrrK1JxbE69FNhMHgFVlspDE+LLUnUXSsNkR1ahiy9DdKLNv7J8KHKuz4
X-Google-Smtp-Source: AGHT+IGA8OE3EAxA3jVOMASD6Bkt23uD4qZGK0XoQTJui1KPvgENJBIf/j2fqcc80yI6NtOvsgrGbGYFbIJu5XDnHkc=
X-Received: by 2002:a05:690c:9a03:b0:6ef:827b:2442 with SMTP id
 00721157ae682-6f7a8424a29mr210396997b3.35.1738668800780; Tue, 04 Feb 2025
 03:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20250204105315.84079-1-uvv.mail@gmail.com> <e1e68f2bdd10981d996869d23fe36b34f15c0bf9.camel@linuxfoundation.org>
In-Reply-To: <e1e68f2bdd10981d996869d23fe36b34f15c0bf9.camel@linuxfoundation.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Tue, 4 Feb 2025 12:33:10 +0100
X-Gm-Features: AWEUYZmdh0t5tanPK_COfCQRbiF7ieoFy37KGe7URJgdIlblj3UejdYQQ2nxVcA
Message-ID: <CAKHfEagcq7f7GB2u4U=P3hHdX=WKbhdZwomqd0XB8TLHgn3crA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] bitbake.conf: Add conditional host tool getent
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040b659062d4f6087"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210774

--00000000000040b659062d4f6087
Content-Type: text/plain; charset="UTF-8"

I don't think systemctl actually needs it. But I believe the patch
disabling it won't be suitable for upstream.

Will send a v3 later today that doesn't modify HOSTTOOLS.

Slava

On Tue, Feb 4, 2025, 12:03 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2025-02-04 at 11:53 +0100, Vyacheslav Yurkov via
> lists.openembedded.org wrote:
> > From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> >
> > In case of systemd init mananger, it's required for the native build.
> > Even though we don't build systemd natively, we might build some of its
> > binaries, which need to run on the host system.
> >
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 8b607088c6..6b1bfaf64e 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -532,6 +532,9 @@ HOSTTOOLS += "${@'ip ping ps scp ssh stty' if
> (bb.utils.contains_any('IMAGE_CLAS
> >  # Used by archiver.bbclass when compression is xz
> >  HOSTTOOLS += "${@'xz' if (('archiver.bbclass' in
> (d.getVar('BBINCLUDED') or '')) and (d.getVarFlag('ARCHIVER_MODE',
> 'compression') == 'xz')) else ''}"
> >
> > +# Native build of systemd tools requires getent utility
> > +HOSTTOOLS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'getent', '', d)}"
> > +
> >  # Link to these if present
> >  HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz
> sftp socat ssh sudo"
>
> I'm a bit nervous about relying on getent being present. It comes from
> glibc and I'm a bit concerned about the host implications of depending
> upon that. It certainly gives us a very specific host dependency
> (unlike more generic things like coreutils).
>
> Do we have any more information about where/why systemctl is using it
> and whether we really do need it?
>
> Cheers,
>
> Richard
>

--00000000000040b659062d4f6087
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I don&#39;t think systemctl actually needs it. But I=
 believe the patch disabling it won&#39;t be suitable for upstream.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Will send a v3 later today that=
 doesn&#39;t modify HOSTTOOLS.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Slava<br><br><div class=3D"gmail_quote gmail_quote_container" dir=3D=
"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 4, 2025, 12:03 Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Tue, 2025-02-04 at 11:53 +0100, Vyacheslav Yurkov via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">uvv.mail@gmail.com</a>&gt;<br>
&gt; <br>
&gt; In case of systemd init mananger, it&#39;s required for the native bui=
ld.<br>
&gt; Even though we don&#39;t build systemd natively, we might build some o=
f its<br>
&gt; binaries, which need to run on the host system.<br>
&gt; <br>
&gt; Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">uvv.mail@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/conf/bitbake.conf | 3 +++<br>
&gt; =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 8b607088c6..6b1bfaf64e 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -532,6 +532,9 @@ HOSTTOOLS +=3D &quot;${@&#39;ip ping ps scp ssh st=
ty&#39; if (bb.utils.contains_any(&#39;IMAGE_CLAS<br>
&gt; =C2=A0# Used by archiver.bbclass when compression is xz<br>
&gt; =C2=A0HOSTTOOLS +=3D &quot;${@&#39;xz&#39; if ((&#39;archiver.bbclass&=
#39; in (d.getVar(&#39;BBINCLUDED&#39;) or &#39;&#39;)) and (d.getVarFlag(&=
#39;ARCHIVER_MODE&#39;, &#39;compression&#39;) =3D=3D &#39;xz&#39;)) else &=
#39;&#39;}&quot;<br>
&gt; =C2=A0<br>
&gt; +# Native build of systemd tools requires getent utility<br>
&gt; +HOSTTOOLS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;systemd&#39;, &#39;getent&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; =C2=A0# Link to these if present<br>
&gt; =C2=A0HOSTTOOLS_NONFATAL +=3D &quot;aws gcc-ar gpg gpg-agent ld.bfd ld=
.gold nc pigz sftp socat ssh sudo&quot;<br>
<br>
I&#39;m a bit nervous about relying on getent being present. It comes from<=
br>
glibc and I&#39;m a bit concerned about the host implications of depending<=
br>
upon that. It certainly gives us a very specific host dependency<br>
(unlike more generic things like coreutils).<br>
<br>
Do we have any more information about where/why systemctl is using it<br>
and whether we really do need it?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>

--00000000000040b659062d4f6087--

