Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302ACC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:09:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8585.1690880964980067937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=p1oepG1Z;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so5991277e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690880963; x=1691485763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMk8mwOgrzklF2MIIZsXoVaao8nsAx4MzhiK0ayUqlg=;
        b=p1oepG1Zgx91kk5Sa68FKB0C9Spmj0PTc+GePd9MBzmyMKhirxHlAJ+uUe4tLqYvT5
         uJja2KTRCJE7QftzdeHtVLzmTdrePXhyLqOPZMZnvCt1ZOiqb8Jn/BuQJ07WjK7Gw7Cm
         6vYPTJqrur8dTfdSeas36JbiKXAMxCerApNeW6NbAzwNucVxUl1tTHayjDLp7AAoHllV
         b1mA96z3DksvTgpgh9/oONPjaF+S9oEj7rbHFUAVgMUYSsDiDPX7IvF11Avypa5/WQRo
         NEvp/fLN4XrcLxYaFcyAX2yHyytvpZIEw416clFIeA3f78AwK84Mxyaz6GLfbVFxEmZF
         H6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880963; x=1691485763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMk8mwOgrzklF2MIIZsXoVaao8nsAx4MzhiK0ayUqlg=;
        b=YehTQThCwOaHIGqiVJHmIxih+7wPPUx40HbWO/B7LEqIwpLNXm5/fPNklg0KpJ+HyQ
         /TRETJXcdCBA8E82Y6KbwBVVAnW1UCM3aUA2eFaFMMtw8BDu2VaGrOJG6h+bJ3jhGb0X
         An+wCSqgYxiXYpMDI2m40sYBzuijOYTYxNlATormcXR9EsSJoDcObhmTIpgkhMVQGaLz
         /9ICEJnij9dNWbwTpqqAIDpIL2gkizb3fHCG3E02vub3jpwms1w5pjkKcvYiUdLefVq6
         wcH9Or7OgTXuZQYggG2o60xV8LuYv1wC/2hAKrTFYuTxd+jB+Z4cOkziAU4ZFfnfhWEv
         qS7A==
X-Gm-Message-State: ABy/qLZTzNpWrEKjjFONE2VUoeEFiQuAmNXpeJU4R8VSw5FVOiB0+R8J
	3FDbTUVozzVw43AU/P7hxgHgfZK58hnykfg4Nwc+EHIOgMk=
X-Google-Smtp-Source: APBJJlFmd+vBlZaDK/PlBpbjZhzw6KJXmmOV98FF74BqELfwhh09oO3GHlpHr2ccJtLbUItmFTlUNHlhwIM9wbQLDiY=
X-Received: by 2002:a05:6512:314c:b0:4f9:571d:c50e with SMTP id
 s12-20020a056512314c00b004f9571dc50emr1579421lfi.36.1690880962854; Tue, 01
 Aug 2023 02:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com> <CANNYZj9-PaCUOp1jcuzzpNsU6Pde+LTGBSUHZGphNZPaLYPbFA@mail.gmail.com>
In-Reply-To: <CANNYZj9-PaCUOp1jcuzzpNsU6Pde+LTGBSUHZGphNZPaLYPbFA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 1 Aug 2023 11:09:11 +0200
Message-ID: <CA+cAkepFrqiBLztAE4nOeUakHArjzbzB+=16R2V7mGzA1D2EnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Use frozen flag for cargo build
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000002602a90601d8e750"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185220

--0000000000002602a90601d8e750
Content-Type: text/plain; charset="UTF-8"

Hello Alexander,

I tried to explain in the code and commit comments, you may also want to
read the ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15104
and I try to explain and ask for help in a dedicated topic on this very
list: see https://lists.openembedded.org/g/openembedded-core/topic/100254129

But to summarize, Cargo.lock is required for various purposes and it
includes the patching path process to work.
I think having no Cargo.lock for a rust recipe built under yocto is not
desirable.

For the  --frozen flag, it put harder constraints than --offline (--offline
prevent network access but doesn't prevent modification
of Cargo.lock)

The special case to revert the behavior introduced was made to comply with
rust-hello-world existence. I would like
to suppress this recipe instead of having this patch but I don't know if it
is desirable and I'd like to think
for other points of views.


On Mon, 31 Jul 2023 at 19:48, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I think you need to better describe the benefits. What are the
> improvements? Can we just stay with --offline?
>
> There's lots of intricate code added around cargo.lock handling, with
> special casing to revert to previous behavior via new variable, but
> I'm struggling to understand: to what end?
>
> Alex
>
>
>
>
>
> On Mon, 31 Jul 2023 at 11:44, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This patch series force the usage of --frozen instead of --offline
> during cargo build.
> > This has the advantage to be sure that Cargo.lock file will not be
> modified.
> > Moreover, raise a clear error when Cargo.lock is not present.
> > For this to work, we must modify ourself the Cargo.lock before building
> > in case there are git repo that have been patched.
> >
> > The last commit is to handle the specific case of rust-hello-world
> recipe.
> > If this recipe is no more necessary, we can drop this last patch.
> >
> > The following changes since commit
> 9b5b850d6a6982bb8ff14dcfbb6769b293638293:
> >
> >   libarchive: ignore CVE-2023-30571 (2023-07-30 12:00:13 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/fmartinsons/openembedded-core
> 15104-check-cargo-lock
> >
> > Frederic Martinsons (3):
> >   cargo.bbclass: Use --frozen flag for cargo operations
> >   cargo_common.bbclass: Handle Cargo.lock modifications for git
> >     dependencies
> >   cargo.bbclass: Offer a way to use --offline instead of --frozen
> >
> >  meta/classes-recipe/cargo.bbclass             |  9 +++-
> >  meta/classes-recipe/cargo_common.bbclass      | 43 +++++++++++++++++++
> >  .../rust-example/rust-hello-world_git.bb      |  2 +
> >  3 files changed, 53 insertions(+), 1 deletion(-)
> >
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185128):
> https://lists.openembedded.org/g/openembedded-core/message/185128
> > Mute This Topic: https://lists.openembedded.org/mt/100458213/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000002602a90601d8e750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Alexander,<div><br></div><div>I tried to explain in =
the code and commit comments, you may also want to read the ticket:=C2=A0<a=
 href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15104" target=
=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15104</a></=
div><div>and I try to explain and ask for help in a dedicated topic on this=
 very list: see=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedd=
ed-core/topic/100254129">https://lists.openembedded.org/g/openembedded-core=
/topic/100254129</a></div><div><br></div><div>But to summarize, Cargo.lock =
is required for various purposes and it includes the patching path process =
to work.</div><div>I think having no Cargo.lock for a rust recipe built und=
er yocto is not desirable.</div><div><br></div><div>For the=C2=A0 --frozen =
flag, it put harder constraints than --offline (--offline prevent network a=
ccess but doesn&#39;t prevent modification</div><div>of Cargo.lock)</div><d=
iv><br></div><div>The special case to revert the behavior introduced was ma=
de to comply with rust-hello-world existence. I would like</div><div>to sup=
press this recipe instead of having this patch but I don&#39;t know if it i=
s desirable and I&#39;d like to think</div><div>for other points of views.<=
/div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, 31 Jul 2023 at 19:48, Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">I think you need to better describe the benefits. What are the<br>
improvements? Can we just stay with --offline?<br>
<br>
There&#39;s lots of intricate code added around cargo.lock handling, with<b=
r>
special casing to revert to previous behavior via new variable, but<br>
I&#39;m struggling to understand: to what end?<br>
<br>
Alex<br>
<br>
<br>
<br>
<br>
<br>
On Mon, 31 Jul 2023 at 11:44, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This patch series force the usage of --frozen instead of --offline dur=
ing cargo build.<br>
&gt; This has the advantage to be sure that Cargo.lock file will not be mod=
ified.<br>
&gt; Moreover, raise a clear error when Cargo.lock is not present.<br>
&gt; For this to work, we must modify ourself the Cargo.lock before buildin=
g<br>
&gt; in case there are git repo that have been patched.<br>
&gt;<br>
&gt; The last commit is to handle the specific case of rust-hello-world rec=
ipe.<br>
&gt; If this recipe is no more necessary, we can drop this last patch.<br>
&gt;<br>
&gt; The following changes since commit 9b5b850d6a6982bb8ff14dcfbb6769b2936=
38293:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0libarchive: ignore CVE-2023-30571 (2023-07-30 12:00:13 +01=
00)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/fmartinsons/openembedded-cor=
e" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/fmartinsons/open=
embedded-core</a> 15104-check-cargo-lock<br>
&gt;<br>
&gt; Frederic Martinsons (3):<br>
&gt;=C2=A0 =C2=A0cargo.bbclass: Use --frozen flag for cargo operations<br>
&gt;=C2=A0 =C2=A0cargo_common.bbclass: Handle Cargo.lock modifications for =
git<br>
&gt;=C2=A0 =C2=A0 =C2=A0dependencies<br>
&gt;=C2=A0 =C2=A0cargo.bbclass: Offer a way to use --offline instead of --f=
rozen<br>
&gt;<br>
&gt;=C2=A0 meta/classes-recipe/cargo.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 9 +++-<br>
&gt;=C2=A0 meta/classes-recipe/cargo_common.bbclass=C2=A0 =C2=A0 =C2=A0 | 4=
3 +++++++++++++++++++<br>
&gt;=C2=A0 .../rust-example/<a href=3D"http://rust-hello-world_git.bb" rel=
=3D"noreferrer" target=3D"_blank">rust-hello-world_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 3 files changed, 53 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#185128): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/185128" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/185128</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10045821=
3/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100458213/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000002602a90601d8e750--

