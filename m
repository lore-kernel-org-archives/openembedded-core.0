Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FDFC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 12:51:19 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.11668.1714740668848625948
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 05:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J4uKtk6l;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d3907ff128so7184842a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714740668; x=1715345468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAlaN3W4vHKCi3l/RbxEnJVSCu0ndzpvRtt5dDo0Q60=;
        b=J4uKtk6lMiCMQHVVYU3bSWTqRBbMhOHRSbG64Dy80IUAOT22UbhRhfZI2q7F8eS70P
         /1XfR3Gi3cRz7vQt6+DjdVbq33NKvnifUm0RoI1u7iAYj4ecRbg7QuXi+IHNmkQ8gDiE
         jpmvZ84OBxMr2zt3t5I+IF4Q7PRc9wZrQVVhFVSIwBi4ordD0tk+Pjc2B/ssWsK9xDph
         6N9tI/1/zGg/xmq8FWrbXOSsv1NYs+qljqwDg43COORA9NzCm6wak0lJeyYMeM3a7HWX
         gpPa7rgQTmRr38qUZw1NDVMyVdhNxJf1gZEMKPsCQheLxneFdXUqzVg/zjGpqXGMa9zE
         avgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714740668; x=1715345468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAlaN3W4vHKCi3l/RbxEnJVSCu0ndzpvRtt5dDo0Q60=;
        b=Z5dsDW+Rx5AMfeVrrcdZVEjGWbhWbSZX0szRFC6bf68w6FQ5Vpo/yfjR8rkvSG1RKg
         /B2FCO8RdO054kiHuFeZfGkkj055LtjboL5GgVS03GmhHnYJnQtC+KXHkyIWK3NqEAjs
         9f7W9h8ocIUpD8Wy6OpnFiU+BTDxIbsOEFVD+yN4lwtyI+L3OfWdF4I/7h91YVWsE9CU
         84ry05BT1cB+9GvThRKRXjX4gLxQHhpvqdAlf0zS3i/N0tI9PxgePBQY4VDj/lZNkuuw
         XNcTaI20RYE7kx0ogRlvGAXcvpf5Otnm4+djntCLCWOQFHOQOVkMI/sBRiWkKAQLdhok
         n8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7XgActII1EudF6j6musxBAwBKksCcGAfU8JrWzmfcqR+wDC/hADEkizWpbp1PMR245JUExzxEaRzqbb3lirk5Dy8WeGEw1VM8MpdZnE8p4EREhvCilq3z
X-Gm-Message-State: AOJu0YxxR+BwI5EMCP7RS2rXzmsCWc1My2J4qt1gztn+DVJ43ulBGcGV
	JbaprXUJUYsygXKDCON6ATAQ+CBxJ8cFB1eQiCCfC4o/gUQA6FCSTMPMcT6fwUBrvuiSdAfejpa
	tTNMaTR0ZX5+r0qUg3DqB7gvB8CvEkQ==
X-Google-Smtp-Source: AGHT+IFkrgm5ul5ro07H2PeqvWm1/lKFnYR47sDOXBa8U4tL8tfi8pmbOYSFR1Lygr2fut6N8QMzyOA6wwvghHKs9KM=
X-Received: by 2002:a17:90b:46d0:b0:2a2:cf1d:895c with SMTP id
 jx16-20020a17090b46d000b002a2cf1d895cmr2324277pjb.41.1714740668069; Fri, 03
 May 2024 05:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
 <fd6e4f80902a641f397ac02aa3de486aa2dcd137.1714703667.git.bruce.ashfield@gmail.com>
 <CAApg2=R-fUrVcD3Fb1gvozynwCJE-pW+7=erXFUG7iW0npFPqw@mail.gmail.com>
In-Reply-To: <CAApg2=R-fUrVcD3Fb1gvozynwCJE-pW+7=erXFUG7iW0npFPqw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 May 2024 08:50:56 -0400
Message-ID: <CADkTA4MhZjv6jo22XmakDgt-c0wpGb2H66LU7m3oiWrqp1pMXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/12] linux-yocto/6.6: update CVE exclusions (6.6.24)
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: yocto-security@lists.yoctoproject.org, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000067041106178c2c89"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 12:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198984

--00000000000067041106178c2c89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 1:42=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.c=
om>
wrote:

> Hello Bruce et al,
> For information, the linux_kernel_cves repo has now a banner "This
> repository has been archived by the owner on May 2, 2024. It is now
> read-only. ",
>

Yes, I had noticed that, but was letting my release scripts do their "thing=
"
to at least update the date on the file. That way it was documented that
I'm checking and waiting for the replacement to arrive.

I did squash all the commits against the 6.1 kernel for that reason, since
they are a no-op until something new arrives.

Bruce



> so I guess this is the last update.
>
> Greg has scripting for statistics of the new process, haven't looked
> into them yet.


> Regards,
> Marta
>
> On Fri, May 3, 2024 at 4:40=E2=80=AFAM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Data pulled from: https://github.com/nluedtke/linux_kernel_cves
> >
> >     1/1 [
> >         Author: Nicholas Luedtke
> >         Email: nicholas.luedtke@uwalumni.com
> >         Subject: Update 25Feb24
> >         Date: Sun, 25 Feb 2024 07:03:08 -0500
> >
> >     ]
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> > index bb9ba49c48..133cab88a3 100644
> > --- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> > +++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> > @@ -1,9 +1,9 @@
> >
> >  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> > -# Generated at 2024-03-28 16:40:04.102652+00:00 for version 6.6.23
> > +# Generated at 2024-04-04 03:23:25.421265+00:00 for version 6.6.24
> >
> >  python check_kernel_cve_status_version() {
> > -    this_version =3D "6.6.23"
> > +    this_version =3D "6.6.24"
> >      kernel_version =3D d.getVar("LINUX_VERSION")
> >      if kernel_version !=3D this_version:
> >          bb.warn("Kernel CVE status needs updating: generated for %s bu=
t
> kernel is %s" % (this_version, kernel_version))
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198933):
> https://lists.openembedded.org/g/openembedded-core/message/198933
> > Mute This Topic: https://lists.openembedded.org/mt/105881317/5827677
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000067041106178c2c89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 3, 2024 at 1:42=E2=80=AFAM Marta Rybczy=
nska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello =
Bruce et al,<br>
For information, the linux_kernel_cves repo has now a banner &quot;This<br>
repository has been archived by the owner on May 2, 2024. It is now<br>
read-only. &quot;,<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">Yes, I had noticed that, but was letting=
 my release scripts do their &quot;thing&quot;<br></div><div class=3D"gmail=
_default" style=3D"font-size:small">to at least update the date on the file=
. That way it was documented that</div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;m checking and waiting for the replacement to ar=
rive.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">I did squash all th=
e commits against the 6.1 kernel for that reason, since</div><div class=3D"=
gmail_default" style=3D"font-size:small">they are a no-op until something n=
ew arrives.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
so I guess this is the last update.<br>
<br>
Greg has scripting for statistics of the new process, haven&#39;t looked<br=
>
into them yet.</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Regards,<br>
Marta<br>
<br>
On Fri, May 3, 2024 at 4:40=E2=80=AFAM Bruce Ashfield via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Data pulled from: <a href=3D"https://github.com/nluedtke/linux_kernel_=
cves" rel=3D"noreferrer" target=3D"_blank">https://github.com/nluedtke/linu=
x_kernel_cves</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A01/1 [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Nicholas Luedtke<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Email: <a href=3D"mailto:nicholas.lue=
dtke@uwalumni.com" target=3D"_blank">nicholas.luedtke@uwalumni.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Subject: Update 25Feb24<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Date: Sun, 25 Feb 2024 07:03:08 -0500=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0]<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/re=
cipes-kernel/linux/cve-exclusion_6.6.inc<br>
&gt; index bb9ba49c48..133cab88a3 100644<br>
&gt; --- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc<br>
&gt; +++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc<br>
&gt; @@ -1,9 +1,9 @@<br>
&gt;<br>
&gt;=C2=A0 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.<br>
&gt; -# Generated at 2024-03-28 16:40:04.102652+00:00 for version 6.6.23<br=
>
&gt; +# Generated at 2024-04-04 03:23:25.421265+00:00 for version 6.6.24<br=
>
&gt;<br>
&gt;=C2=A0 python check_kernel_cve_status_version() {<br>
&gt; -=C2=A0 =C2=A0 this_version =3D &quot;6.6.23&quot;<br>
&gt; +=C2=A0 =C2=A0 this_version =3D &quot;6.6.24&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel_version =3D d.getVar(&quot;LINUX_VERSION&qu=
ot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if kernel_version !=3D this_version:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Kernel CVE status need=
s updating: generated for %s but kernel is %s&quot; % (this_version, kernel=
_version))<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#198933): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/198933" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/198933</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10588131=
7/5827677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/105881317/5827677</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com"=
 target=3D"_blank">rybczynska@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000067041106178c2c89--

