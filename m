Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA18AC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 11:30:19 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.8537.1721129418468057001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 04:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DM9hVNlM;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-490119007dfso3419503137.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 04:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721129417; x=1721734217; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYkL6HiDmV23jR6bjcAa6XjxaNxNnE8OtjwEokpgI1M=;
        b=DM9hVNlMcIH3s4A6T/CDoWKT24PvolKg4EghhJ7OsIZoJc2e4mukjDZ8l54oxVqohK
         VeBsnbi/wZE9df6IKO7jb+9Ey+7LlHwgMww2i5yM+Rv20St/bAfcT5Ni3C68r59j6sQz
         pIzCujDEApj38vLv/Cnf3/xSKyM9EGM0WPZce1/lX/N9RRXQdLX5NQVHM2tHFHMZUsXN
         AAyMWXnwIk+LHA4jLGAZ7gbEiEjwlx/inS/7FnJLSJBjV9jcKMhszUL6oYSQoQ/OPpd1
         INMRAYI0LyXJL6H3GkLXcB1FRjBpRSy7oXZKFdVuqCLrSbwAnuvlMHTT+To+KFZPUEfZ
         kxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721129417; x=1721734217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYkL6HiDmV23jR6bjcAa6XjxaNxNnE8OtjwEokpgI1M=;
        b=UAOkuKzEhyAk8UEB3an29vxqVFdKa7K5l/ZFgsGS+9NOm3OCLhHfioaFRmJ4np81VZ
         BIeN5U/SjLck+4BtcRT2q7TYcSeULiUpJXT3ueaKrR+Y7JcXH2zH8JzjUeksRiudyqYK
         wZBapO3bzMOnIOsQ9CahJf7734plRo3BJzJqVM61yEAkrTdd1A85Pq837iM6dzzpg/24
         pTyIbbDjHa/iLHK46iFaslEY8lGFRShAv51L8WXLH+6Y5vDFyOOyso1x+SC7llorGeEF
         vQ1ZcfhwL52FprW48kAFyi/KY7d7DTqg+WZILTIZEtrqnchjhi2jzHZsrz/Sd/o6JO+m
         mA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCULhTa4CzfUhzlQM0gCiYeALKUUKwhq9GUBmh72eu4/jsHdVquUr0ZXXZTe7JL+ArOtRI3OzTD9/dL8h76bwRgOu7ahI546PJugwyLxeBcdXHvj5RDreoaN
X-Gm-Message-State: AOJu0YxytuGauYvoksz2oYYaUR7VNzxP/s8+azd7SBxGitQDqAHoGeLH
	Iuv+RPNQhdQwAil7/sTR+ITLadtCH3VsEPXqEhOpUe3xVk8koBWC5nT3RmDmM02Ng92Fof+eVrO
	+6kf3ej0bP81bPY/tdzq9fru9Z68=
X-Google-Smtp-Source: AGHT+IGx/1XRjCqP91XzS9G5fsaKEsP53Xp4TGPySqHtT7ANiCW+tNOqSUVpH4LWX/8NHdy+NMYiXkKE4OthoPntzBs=
X-Received: by 2002:a05:6102:3f41:b0:48d:a4aa:35f9 with SMTP id
 ada2fe7eead31-4914d624287mr619459137.4.1721129417189; Tue, 16 Jul 2024
 04:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240716092955.2463-1-jose.quaresma@foundries.io>
 <20240716092955.2463-2-jose.quaresma@foundries.io> <0fcd691268dbbb1e3d8c3dc4c4714b64de53094c.camel@linuxfoundation.org>
 <8EFB65D9-7969-4570-9053-5649B9229241@arm.com> <CANNYZj9geo=_5qunxr5tYg_gX8xebAEjythXG0SHKKZDzZ4LaQ@mail.gmail.com>
In-Reply-To: <CANNYZj9geo=_5qunxr5tYg_gX8xebAEjythXG0SHKKZDzZ4LaQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 16 Jul 2024 12:30:06 +0100
Message-ID: <CANPvuR=-fjU0jAgaQUpCqvA86bD3kA48jLJtYGv_AP1K2enqog@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/3] openssh: systemd sd-notify patch was
 rejected upstream
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ross.burton@arm.com, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000863188061d5bab3a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 11:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202109

--000000000000863188061d5bab3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu (ter=C3=A7a, 16/07/2024=
 =C3=A0(s)
11:37):

> On Tue, 16 Jul 2024 at 12:31, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > > I was reading about this in your previous patch and was planning to
> > > make a comment about it. Thanks for splitting it out!
> > >
> > > I remember when I was asked to originally merge this patch to OE-Core
> > > and I had reservations at the time. I tried to push back and was told
> > > all the other distros were doing it and it was essential we did as we=
ll
> > > :/.
> > >
> > > This does raise the question of whether we should be carrying it. Did
> > > the other distros do anything with it after the XZ issue?
> >
> > Red Hat have already rewritten the systemd integration piece to write
> directly to the pipe instead of using libsystemd:
> >
> >
> https://src.fedoraproject.org/rpms/openssh/blob/rawhide/f/openssh-9.8p1-s=
ystemd.patch
>
> So does Debian:
>
> https://salsa.debian.org/ssh-team/openssh/-/commit/cc5f37cb8405cba624a133=
f4b8f464fbe381c5c8
>
> Alex
>

After some research I checked that openssh can notify systemd without
depending on libsystemd.
https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa6d=
deb8ab57a1fd4f5c

Gentoo and Arch are already using this and what we need to change are small
modifications to the sshd service, mostly changing Type=3Dnotify-reload

I will send a v5 dropping this patch.

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000863188061d5bab3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu (ter=C3=
=A7a, 16/07/2024 =C3=A0(s) 11:37):<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, 16 Jul 2024 at 12:31, Ross Burton via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a><br>
&lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" target=
=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; I was reading about this in your previous patch and was planning =
to<br>
&gt; &gt; make a comment about it. Thanks for splitting it out!<br>
&gt; &gt;<br>
&gt; &gt; I remember when I was asked to originally merge this patch to OE-=
Core<br>
&gt; &gt; and I had reservations at the time. I tried to push back and was =
told<br>
&gt; &gt; all the other distros were doing it and it was essential we did a=
s well<br>
&gt; &gt; :/.<br>
&gt; &gt;<br>
&gt; &gt; This does raise the question of whether we should be carrying it.=
 Did<br>
&gt; &gt; the other distros do anything with it after the XZ issue?<br>
&gt;<br>
&gt; Red Hat have already rewritten the systemd integration piece to write =
directly to the pipe instead of using libsystemd:<br>
&gt;<br>
&gt; <a href=3D"https://src.fedoraproject.org/rpms/openssh/blob/rawhide/f/o=
penssh-9.8p1-systemd.patch" rel=3D"noreferrer" target=3D"_blank">https://sr=
c.fedoraproject.org/rpms/openssh/blob/rawhide/f/openssh-9.8p1-systemd.patch=
</a><br>
<br>
So does Debian:<br>
<a href=3D"https://salsa.debian.org/ssh-team/openssh/-/commit/cc5f37cb8405c=
ba624a133f4b8f464fbe381c5c8" rel=3D"noreferrer" target=3D"_blank">https://s=
alsa.debian.org/ssh-team/openssh/-/commit/cc5f37cb8405cba624a133f4b8f464fbe=
381c5c8</a><br>
<br>
Alex<br>
</blockquote></div><br>After some research I checked that openssh can notif=
y systemd=C2=A0without depending on libsystemd.<br><a href=3D"https://githu=
b.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4=
f5c">https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657=
aaa6ddeb8ab57a1fd4f5c</a><br clear=3D"all"><div><br></div>Gentoo and Arch a=
re already using this and what we need to change are small modifications to=
 the sshd service, mostly changing Type=3Dnotify-reload<br><br>I will send =
a v5 dropping=C2=A0this patch.<br><br>Jose<br><div><br></div><span class=3D=
"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div=
></div></div>

--000000000000863188061d5bab3a--

