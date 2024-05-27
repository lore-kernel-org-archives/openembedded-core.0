Return-Path: <jkbestfamily@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A1EC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:41:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.1806.1716828078065140660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CII8ni5B;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: jkbestfamily@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so80167895e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716828076; x=1717432876; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uotUdsuJLsReycdP3h9ZdiFD8+RtkxFfZkpxwzhv9tw=;
        b=CII8ni5BUJtuknzDwdEk23KZ5hQ1kMaK+KqbgTuRppevoIag8kcHTGwzStEhfLAdvt
         MYidAAcpXVUCHyh0Btuc/bXWcdhXyoOZZv447ZXnbP5dFeXUDO91752FuyPdOrCgN2f6
         GVeNmDNaOb/1bP58Kjp2F9+erfLXwZey+vAdQBgMaeDZYgBA3mWGy5t7fK7sQfPi71I6
         H1YnBjaL3PaV9Dofzy70fdeCJR5A44oFLer48nxgIITwQ+OV/YPN+ryVK2s23PpkbH8+
         8O2AdiVP49R9aaVRU2sE++c2sCBfGRd4ae7S/LaG3lUToNPQK6o9rTzNoTRnAnWMaf3v
         L54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716828076; x=1717432876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uotUdsuJLsReycdP3h9ZdiFD8+RtkxFfZkpxwzhv9tw=;
        b=JMsBjQeRJ/nHqEI+k4mq7tlrJlF8vGU9UggExLbLX8/wiP/711nyvzvi3zKNHWHlXF
         LJnIl8MmSfHpUyC4n2fb6rFwiZOb3e2QsRXy9B9J9GoD3BnQzmZmhNp9eRwFETJDA/Um
         vM+JqtTm5Qw2thMYcgLRpMgwy4xF4pSGsjcX7O0U+hiG2BBiuFhGzV+SLk4TKmSYUuO2
         co3k2s9TI8EmoMvJfqiFApegB/ARB5V3jApDjsvTzAjp7T+LJ8WsEBm2m5bDjjN8dHLS
         VqiREsIuPkflC8cZabcI/Ktbz8Ellgocyy6v3xL7rus1jXN+0zUgw9ebjaRDoxpUNeOX
         /4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlzvcIKqtpNJC44a7Nu+oG8OquyXFUscQnE5oKqlIRyQxDsYc+o1cxpKLbP0mxvx5QczNpl54oEgGsePg05V0LFmJlPn6PEGLOZBV75YgUvppcXBiqJsLk
X-Gm-Message-State: AOJu0YwhZtU1jUya1VUAYTo5BUaL5eFPz8e7X1gnvWXkR2rDXqiuBsfa
	EFel1aXCbR9b+9ATgW3kKlvHRy8dybEKU5DvZHiXiD+myjA0Kl/+vZvLzZ9aGR9GwssokejxHEH
	Pv9Mn4zHXl128n1dU5Swq5uw07so=
X-Google-Smtp-Source: AGHT+IHSGp2z4qZWUXnmrGNyEJE5jBZoIW2DaG+k0KOI6uYNanQMLxq6+7lVMpdA91Dnfzix0rK/YwWs3JsvtjnET9o=
X-Received: by 2002:a7b:cc85:0:b0:41c:190:2ba9 with SMTP id
 5b1f17b1804b1-421089f38c7mr89076145e9.31.1716828075950; Mon, 27 May 2024
 09:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240527134416.10699-1-jaekyu.lee@lge.com> <CANNYZj9yFM1zNjVum=sPaHXE4ZGbvB4ubkMnmt1gEPpHwz=X2w@mail.gmail.com>
In-Reply-To: <CANNYZj9yFM1zNjVum=sPaHXE4ZGbvB4ubkMnmt1gEPpHwz=X2w@mail.gmail.com>
From: =?UTF-8?B?7J207J6s6rec?= <jkbestfamily@gmail.com>
Date: Tue, 28 May 2024 01:41:05 +0900
Message-ID: <CABVd4mGAV0HHg8ky9o=S5i0AnpOGyYVCo9torP+PGDmp55w5UA@mail.gmail.com>
Subject: Re: [PATCH] [OE-core][scarthgap] rust: remove unnecessary git signature
To: alex.kanavin@gmail.com
Cc: jaekyu.lee@lge.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009b89ec0619722fac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199914

--0000000000009b89ec0619722fac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for reply.

I don't think we need to remove it specifically for this patch.
If possible, I will update patch to remove it from all patches. Do you
agree that information ( git version information) is unnecessary?

On Mon, May 27, 2024 at 11:40=E2=80=AFPM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:

> Hello,
>
> there are lots of patches in oe-core with git signatures at the end,
> why does it need to be removed from here in particular?
>
> Alex
>
> On Mon, 27 May 2024 at 16:25, Jaekyu Lee via lists.openembedded.org
> <jaekyu.lee=3Dlge.com@lists.openembedded.org> wrote:
> >
> > From: "jaekyu.lee" <jaekyu.lee@lge.com>
> >
> > Remove useless git signature
> >
> > Signed-off-by: jaekyu.lee <jaekyu.lee@lge.com>
> > ---
> >  .../0001-Handle-vendored-sources-when-remapping-paths.patch     | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git
> a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-rema=
pping-paths.patch
> b/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-rema=
pping-paths.patch
> > index a46ee14402..10ca1c2530 100644
> > ---
> a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-rema=
pping-paths.patch
> > +++
> b/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-rema=
pping-paths.patch
> > @@ -41,6 +41,4 @@ index cd276674dee6..48fdb2c7f7b7 100644
> >               }
> >               cargo.env("RUSTC_CARGO_REGISTRY_SRC_TO_REMAP", env_var);
> >           }
> > ---
> > -2.39.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199903):
> https://lists.openembedded.org/g/openembedded-core/message/199903
> Mute This Topic: https://lists.openembedded.org/mt/106323318/7530085
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jkbestfamily@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009b89ec0619722fac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for reply.<div><br></div><div>I don&#39;t think =
we need to remove it specifically for this patch.</div><div>If possible, I =
will update patch to remove it from all patches. Do you agree that informat=
ion ( git version information) is unnecessary?<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 27, 202=
4 at 11:40=E2=80=AFPM Alexander Kanavin via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br=
>
<br>
there are lots of patches in oe-core with git signatures at the end,<br>
why does it need to be removed from here in particular?<br>
<br>
Alex<br>
<br>
On Mon, 27 May 2024 at 16:25, Jaekyu Lee via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
<br>
&lt;jaekyu.lee=3D<a href=3D"mailto:lge.com@lists.openembedded.org" target=
=3D"_blank">lge.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: &quot;jaekyu.lee&quot; &lt;<a href=3D"mailto:jaekyu.lee@lge.com"=
 target=3D"_blank">jaekyu.lee@lge.com</a>&gt;<br>
&gt;<br>
&gt; Remove useless git signature<br>
&gt;<br>
&gt; Signed-off-by: jaekyu.lee &lt;<a href=3D"mailto:jaekyu.lee@lge.com" ta=
rget=3D"_blank">jaekyu.lee@lge.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-Handle-vendored-sources-when-remapping-paths.patch=C2=
=A0 =C2=A0 =C2=A0| 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sou=
rces-when-remapping-paths.patch b/meta/recipes-devtools/rust/files/0001-Han=
dle-vendored-sources-when-remapping-paths.patch<br>
&gt; index a46ee14402..10ca1c2530 100644<br>
&gt; --- a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-wh=
en-remapping-paths.patch<br>
&gt; +++ b/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-wh=
en-remapping-paths.patch<br>
&gt; @@ -41,6 +41,4 @@ index cd276674dee6..48fdb2c7f7b7 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cargo.env(&quot;=
RUSTC_CARGO_REGISTRY_SRC_TO_REMAP&quot;, env_var);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ---<br>
&gt; -2.39.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199903): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199903" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199903</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106323318/753=
0085" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106323318/7530085</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jkbestfamily@gmail.com" ta=
rget=3D"_blank">jkbestfamily@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009b89ec0619722fac--

