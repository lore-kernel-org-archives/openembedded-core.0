Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74C7D715F4
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 20:03:27 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26148.1769285006580573803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 12:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i4JXF2Bq;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso2293255a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 12:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769285006; cv=none;
        d=google.com; s=arc-20240605;
        b=WhHeXB0hNWa9LW8wLCjFoJpf1yW2jPYpn27Bfq6iDI77xQIA7PsNEXCL1vn8IF1Y6S
         OFZfdofUC3e1ZjNIRuSk8Ksn2QrvdFyFG8JWCf3pKlaBh2VxHETxy715cvtWfbaiBYhG
         U9GNbdiz0C3eq2m1ysk2ANNevHZp/tUrDCzJ9iEo1zIg6LgrfRPsofgr3fP7JO5AEoeG
         8M3xvDOEcC4oWG6kJ+WPVCubVj8gKbgU8Z58oSaXxOR8sBnr6DGiEWiOP03p6NMSQdjY
         ZNuruTIa33WHA4WU8Ce6JOszswXK7qDL4mVB+5nI6Rndqur2XGtN0KxUPHxW2soW5KJ0
         v3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uGHd23M++f3laGw+2p77OdT/mzkbt3iihLQ0GROv6IA=;
        fh=WirXrjMFXSIhNborpqhbjwHlpaDfDdKfIw4VkrL58E8=;
        b=UZYY81MB5IdNa/llMV96+AM0n/d1naVUTZ3BycEz2jw3via1hTgkEoU3zjxXkQS/9E
         hVBcvz5IDMA3rZ4/darqmg9yR+qeTpe94AIvUTf5Rhzx1L5EAJiB0NAmy1ybLpPbafuW
         IIvimBRlrAPojRIgM5ThOYEw7r7ta39Qdy7Jav/oouQa/T8c4lZVzpXwsankFEI+MRG9
         CDQP5Rb+8Xa+1O/1KEYSvMTY6YieYE0ywROW0Ij3oo0i+29cUy3nc0hkCFHxE2vRiuZ+
         tL4T4HHPUh+ncul4pOPy5Dnq6A87/9cikGNYB+H8iCiDPMeea9jcxYeN53Cf0Q/guOlS
         4Img==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769285006; x=1769889806; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uGHd23M++f3laGw+2p77OdT/mzkbt3iihLQ0GROv6IA=;
        b=i4JXF2Bqjr836nFd2RImfGR9Nlh39KUz9beSKRvqJCRBwBD1b3RdR5vl3dPSPxghA/
         L/rSWSdIM8tRB/pXuY5MMkn5uI3MpyBmTfH59jMYJriFvaeu6eCSI4dhOQsdzj/h0pUV
         tl024oX8pU4PrF9OSxj6c/DEjTnsWO74Q38VQZz/R++aD+vp3v+gu69PF6QhPtAQ0anT
         eH/srTf1dDXGWT0v4PZQnlIGrIqN5E2iOebsSarC/rfGyitJAI6FPE5vSIV+ybS0upgF
         5xrra6nFxcEuyBXKeidyYgsNIVixvckizI3MUGEPX/b5pQ/HuWopmmGhmce4JGTuGZVa
         05LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769285006; x=1769889806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGHd23M++f3laGw+2p77OdT/mzkbt3iihLQ0GROv6IA=;
        b=CnHWXFtRX/WEzDU7Arj6JYbixXGxrFzoaCoeldzMMLPNLfljaSSgbAwxvCUFKALbFf
         fmlonLzmBMYrxSu891G4MZ/rCCbExmmhDlB6eVCaKQSCWZp7NojOeI9yWdKCxBiPlMJS
         mCpJmSG0XW7r4k+fOwNc8uD5poPtw4gbuSyztHrAJ7am5SQecMs3lLmRpl1A53A26Rh5
         0IeLVjYnAHJMQxkQYYz2wscL4o4qmkytmg0sZI5DWZhrgqt2y+iGbxVzxTmoaUaRsXn5
         QGl4SQ1ig5s/jYxkjgbYgOgXIBzuw553RDKlZ6kftdTrJGW/BxJTuEH1UEA7aAc5b8d+
         3heA==
X-Forwarded-Encrypted: i=1; AJvYcCXWE6Cy97/HlZhSnvRC/G38Fo/35+9Y1n0SHWoHAQT4D3ZsMCXLMc/bNFJw5lxx9LWvcUG4Nltqgx5lIYAb84i0Lg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7c1fVUWyyTbJjr6Z8QCqYCvtKnknVoayp3kTnaWwOyafb5LDk
	WmesnCJTU73hsSfL5QHU8iMJ7SgfCUPnLY0wjXEyyi1UTHH3V+NmfkldelUnY/Rv0LxJ8qmXBJf
	hIOBwFQskGPnjyZlVMbIYWyd40u0Jm7o=
X-Gm-Gg: AZuq6aItISaw8YW/c1E/6qw11waztn0ZOUSXzRxCfK+U/z3aTh1IoOS76SnuDbbNNcp
	v11ZNhVsaxD3g8t6870mISa5SBj/Tf8A6TURBkpyOpNWDuJP3tDNOax2S3TZwJEHAcCyefMZD8K
	rsYqt9JCB8/SI3vvHXG9TslK2Ls1YxhmgzOFHJTpSG94ygupIrOUatYzxz4BCFkNT5To0WXZ0u8
	Ydisdj3gSwfiA1Dn31+T1W8ALd6pNIgbACS+frixs0ZV9042tn5bs9L5LJNU3+RD7jobZAp
X-Received: by 2002:a17:90b:3503:b0:341:ae23:85fd with SMTP id
 98e67ed59e1d1-35367025551mr5993673a91.11.1769285005724; Sat, 24 Jan 2026
 12:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20260123230820.289540-1-reatmon@ti.com> <CADkTA4OA-Vx9tPqkuyK4tLsxv2BXB8r_1+jKxJ6x5vB-5xC-Dg@mail.gmail.com>
 <3b59555b-0edb-4c2c-b203-e1172d0482b4@ti.com>
In-Reply-To: <3b59555b-0edb-4c2c-b203-e1172d0482b4@ti.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 24 Jan 2026 15:03:13 -0500
X-Gm-Features: AZwV_QhWT3gwydzPX7tdjKj5MTbYc4ERjtJmgsPzUfrzKy7o7c70zSOdA74bmQs
Message-ID: <CADkTA4O9wPhDM1c8oG0guSE-4fAL=iM2W2T+kBO=zn_C4+rZUQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lttng-modules: Fix CONFIG_TRACEPOINTS patch
To: Andrew Davis <afd@ti.com>
Cc: reatmon@ti.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000045d0bb064927c463"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 20:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229921

--00000000000045d0bb064927c463
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 1:21=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:

> On 1/23/26 5:55 PM, Bruce Ashfield via lists.openembedded.org wrote:
> >
> >
> > On Fri, Jan 23, 2026 at 6:08=E2=80=AFPM Ryan Eatmon via lists.openembed=
ded.org <
> http://lists.openembedded.org> <reatmon=3Dti.com@lists.openembedded.org
> <mailto:ti.com@lists.openembedded.org>> wrote:
> >
> >     The check for CONFIG_TRACEPOINTS is guarded by a check for
> >     CONFIG_LOCALVERSION.  But what happens if your .config has
> >     CONFIG_LOCALVERSION=3D"" ?  Then the check never runs and you try a=
nd
> >     build the module even though CONFIG_TRACEPOINTS is missing.
> >
> >     Update the guard to check for either CONFIG_LOCALVERSION or
> >     CONFIG_LOCALVERSION_AUTO.
> >
> >     Signed-off-by: Ryan Eatmon <reatmon@ti.com <mailto:reatmon@ti.com>>
> >     ---
> >       ...-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 7
> ++++---
> >       1 file changed, 4 insertions(+), 3 deletions(-)
> >
> >     diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> >     index 1854d9a944..a47b5b9789 100644
> >     ---
> a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> >     +++
> b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> >     @@ -16,8 +16,8 @@ Upstream-Status: Inappropriate [embedded specific=
]
> >
> >       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com <mailto:
> bruce.ashfield@gmail.com>>
> >       ---
> >     - src/Kbuild | 7 ++++++-
> >     - 1 file changed, 6 insertions(+), 1 deletion(-)
> >     + src/Kbuild | 9 +++++++--
> >     + 1 file changed, 7 insertions(+), 2 deletions(-)
> >
> >       Index: lttng-modules-2.14.0/src/Kbuild
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     @@ -25,7 +25,8 @@ Index: lttng-modules-2.14.0/src/Kbuild
> >       +++ lttng-modules-2.14.0/src/Kbuild
> >       @@ -3,10 +3,13 @@
> >
> >     - ifdef CONFIG_LOCALVERSION     # Check if dot-config is included.
> >     +-ifdef CONFIG_LOCALVERSION     # Check if dot-config is included.
> >     ++ifneq ($(CONFIG_LOCALVERSION)$(CONFIG_LOCALVERSION_AUTO),)    #
> Check if dot-config is included.
> >          ifeq ($(CONFIG_TRACEPOINTS),)
> >       -    $(error The option CONFIG_TRACEPOINTS needs to be enabled in
> your kernel configuration)
> >       +    $(warning The option CONFIG_TRACEPOINTS needs to be enabled
> in your kernel configuration)
> >
> >
> > Why is this changing to a warning ?
> >
>
> It isn't, this is a patch for a patch, these diff change lines are alread=
y
> part of
> the patch from before.
>
>
Right!

It is even my patch :)

Bruce



>
> https://git.openembedded.org/openembedded-core/commit/?id=3D6215ffec6a3d5=
069cc74ae9853167c3c6395b1db
>
> Andrew
>
> > You have no mention of it in the changelog. Although the check wasn't
> > working, the intention of making this an error is still the same.
> >
> > Bruce
> >
> >     --
> >     2.43.0
> >
> >
> >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#229917):
> https://lists.openembedded.org/g/openembedded-core/message/229917
> > Mute This Topic: https://lists.openembedded.org/mt/117427953/3619733
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> afd@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000045d0bb064927c463
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 24, 2026 at 1:21=
=E2=80=AFPM Andrew Davis &lt;<a href=3D"mailto:afd@ti.com">afd@ti.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 1/2=
3/26 5:55 PM, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Jan 23, 2026 at 6:08=E2=80=AFPM Ryan Eatmon via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">http://lists.openembedded.org</a>&gt; &lt;reatmon=
=3D<a href=3D"mailto:ti.com@lists.openembedded.org" target=3D"_blank">ti.co=
m@lists.openembedded.org</a> &lt;mailto:<a href=3D"mailto:ti.com@lists.open=
embedded.org" target=3D"_blank">ti.com@lists.openembedded.org</a>&gt;&gt; w=
rote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The check for CONFIG_TRACEPOINTS is guarded by a ch=
eck for<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_LOCALVERSION.=C2=A0 But what happens if your=
 .config has<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_LOCALVERSION=3D&quot;&quot; ?=C2=A0 Then the=
 check never runs and you try and<br>
&gt;=C2=A0 =C2=A0 =C2=A0build the module even though CONFIG_TRACEPOINTS is =
missing.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Update the guard to check for either CONFIG_LOCALVE=
RSION or<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_LOCALVERSION_AUTO.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:re=
atmon@ti.com" target=3D"_blank">reatmon@ti.com</a> &lt;mailto:<a href=3D"ma=
ilto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-Kbuild-change-missing-CONFIG_TRACEPOINTS=
-to-warn.patch | 7 ++++---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 4 insertions(+), 3 deletions=
(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-kernel/lttng/lttng-module=
s/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/re=
cipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRAC=
EPOINTS-to-warn.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 1854d9a944..a47b5b9789 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-kernel/lttng/lttng-modules/0001-=
src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-=
src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -16,8 +16,8 @@ Upstream-Status: Inappropriate [e=
mbedded specific]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_bla=
nk">bruce.ashfield@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0- src/Kbuild | 7 ++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 1 file changed, 6 insertions(+), 1 deletion(-)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+ src/Kbuild | 9 +++++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 7 insertions(+), 2 deletions(-)<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Index: lttng-modules-2.14.0/src/Kbuild<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -25,7 +25,8 @@ Index: lttng-modules-2.14.0/src/K=
build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+++ lttng-modules-2.14.0/src/Kbuild<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -3,10 +3,13 @@<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- ifdef CONFIG_LOCALVERSION=C2=A0 =C2=A0 =C2=A0# Ch=
eck if dot-config is included.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-ifdef CONFIG_LOCALVERSION=C2=A0 =C2=A0 =C2=A0# Ch=
eck if dot-config is included.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ifneq ($(CONFIG_LOCALVERSION)$(CONFIG_LOCALVERSIO=
N_AUTO),)=C2=A0 =C2=A0 # Check if dot-config is included.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifeq ($(CONFIG_TRACEPOINTS),)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 $(error The option CONFIG_TRA=
CEPOINTS needs to be enabled in your kernel configuration)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 $(warning The option CONFIG_T=
RACEPOINTS needs to be enabled in your kernel configuration)<br>
&gt; <br>
&gt; <br>
&gt; Why is this changing to a warning ?<br>
&gt; <br>
<br>
It isn&#39;t, this is a patch for a patch, these diff change lines are alre=
ady part of<br>
the patch from before.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Right!=C2=A0</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">It is even my patch :)</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D6215=
ffec6a3d5069cc74ae9853167c3c6395b1db" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3D6215ffec6a3d506=
9cc74ae9853167c3c6395b1db</a><br>
<br>
Andrew<br>
<br>
&gt; You have no mention of it in the changelog. Although the check wasn&#3=
9;t<br>
&gt; working, the intention of making this an error is still the same.<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.43.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#229917): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/229917" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/229917</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11742795=
3/3619733" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/117427953/3619733</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:afd@ti.com" target=3D=
"_blank">afd@ti.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000045d0bb064927c463--

