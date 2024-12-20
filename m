Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A35E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 16:25:33 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.155311.1734711924384655148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 08:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8I8znkR;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f44353649aso1619670a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734711924; x=1735316724; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uZJmJT1uRMpnXM3GY+M34RwbRxDmvJOttWM3h2wMIFI=;
        b=L8I8znkRFrbqgpxMNRyFwaPEIR3Fo9vL8Ptgr9cMco+W8EWOzaeAbRKW6fvZJsiidM
         yX6Lk+DvWNlku77/zu2AaSzhWiH4ro8ifg9WxIUF6tib9Fo9GEucoS9BNNRRqYYAHb3M
         g7QRNN+AI140r8C4a8vLpEVJrA0/n35/pMmP6QZPsZHjkIpN24N2kuSijsQmgs2siLAX
         0whxWl/L4UkaRRVSfI9sYTWEJ8ZsAN3coMohSR7rA7pqKBZ5YhD26EKqVw2krpxNqzc+
         M4hNrJY1UXrdNrbWrrxB110ePCVDn2MdhDpxAAgB4GqX96ZfO+3SBvaUEkqQH83PYMy9
         S0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711924; x=1735316724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZJmJT1uRMpnXM3GY+M34RwbRxDmvJOttWM3h2wMIFI=;
        b=PjgZzD3gwbukXUEkg8CZKDBbNAycRo3U9swJreyHUhjjzz+NbaBr2rhwdTowlT+KeJ
         e4LQfv9CSs78oibSSPjLRG2VbwM+gf5mCfLFkYtnlN7yEDuqk3PRFgm9bFsVCvqv8nQx
         AZtZez7vDQ32+mazOQ0vIAzCGAX7x9piTuD1zpkeXKqidETbOSJkQNyU8cbZnQDFZoIz
         G4gDP45lIPpi9HF+vxSzL4u98EX6+gQ1YdIZz1s4O3FcOxZDnkveeFVOhXgXf8QyUQ2Y
         mUAP7kDPjWSWtZwY+d8MoKA8gdLeIXP6Q+u8Lp2BjCmnPZWK2g+5WqKMVw4umXuDuASt
         VFsA==
X-Gm-Message-State: AOJu0YwqxOKAsGqMxm3+DjS7VC5eJEs5O3P77V4ARRloo2UnOSO6sE/t
	1YvE8LIHFH58vurOUFrzXtbwaDaQf1o0RtatQMWXLdMcRAsBXzNj3WuIpYCXA0dmFgBXtEOVbaF
	iMr3pzV0f2f29bX/wVFqcxYF8xsCdXZEv
X-Gm-Gg: ASbGncuJrPJIMcDlUddJMWwyHUINK4cTHROtiLYQP3tKWOpxjKbvBZw/x7R1bhJF/Gs
	CtBUT88Y4ldqV6ojRKpodyNrtkp3E3dr/vg9kl4s=
X-Google-Smtp-Source: AGHT+IHQYTXtY0EubHNsr1mGqKHJHr5k009hEcK+u0+b57WGP6c1tJBbNrYo5BOtUuowJwfNvbo51X8icFfC9ka65Ss=
X-Received: by 2002:a17:90b:3d45:b0:2ee:accf:9685 with SMTP id
 98e67ed59e1d1-2f452dfd36fmr5248652a91.4.1734711923765; Fri, 20 Dec 2024
 08:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20241220153004.2199488-1-christian.taedcke-oss@weidmueller.com>
In-Reply-To: <20241220153004.2199488-1-christian.taedcke-oss@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Dec 2024 11:25:12 -0500
Message-ID: <CADkTA4NnL2wKidGd7u9MxjUR2stRRH=rvpCvCe14mUaOAXQzkw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] kernel-yocto: enable fetching kernel metadata
 using file fetcher
To: christian.taedcke-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org, 
	Christian Taedcke <christian.taedcke@weidmueller.com>
Content-Type: multipart/alternative; boundary="00000000000000f9b70629b61804"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 16:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208984

--00000000000000f9b70629b61804
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 10:30=E2=80=AFAM <christian.taedcke-oss@weidmueller=
.com>
wrote:

> From: Christian Taedcke <christian.taedcke@weidmueller.com>
>
> If no destsuffix parameter is supplied and the file fetcher is used,
> the folder name (i.e. basepath) is added to the kernel-meta search
> directories.
>
> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
> ---
>
> Changes in v2:
> - always use destsuffix if available
> - do not restict fetcher type
>

I was just looking at v1 a few days ago, to see how I could tweak
it and simplify a bit.

This version looks better to me, so I have no concerns as existing
user cases shouldn't be impacted.

Bruce



>
>  meta/classes-recipe/kernel-yocto.bbclass | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index a5d89dc2c8..7d80e9aa52 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -62,8 +62,8 @@ def find_sccs(d):
>
>      return sources_list
>
> -# check the SRC_URI for "kmeta" type'd git repositories. Return the name
> of
> -# the repository as it will be found in UNPACKDIR
> +# check the SRC_URI for "kmeta" type'd git repositories and directories.
> Return
> +# the name of the repository or directory as it will be found in UNPACKD=
IR
>  def find_kernel_feature_dirs(d):
>      feature_dirs=3D[]
>      fetch =3D bb.fetch2.Fetch([], d)
> @@ -71,13 +71,16 @@ def find_kernel_feature_dirs(d):
>          urldata =3D fetch.ud[url]
>          parm =3D urldata.parm
>          type=3D""
> +        destdir =3D ""
>          if "type" in parm:
>              type =3D parm["type"]
>          if "destsuffix" in parm:
>              destdir =3D parm["destsuffix"]
> -            if type =3D=3D "kmeta":
> -                feature_dirs.append(destdir)
> -
> +        elif urldata.type =3D=3D "file":
> +            destdir =3D urldata.basepath
> +        if type =3D=3D "kmeta" and destdir:
> +            feature_dirs.append(destdir)
> +
>      return feature_dirs
>
>  # find the master/machine source branch. In the same way that the fetche=
r
> proceses
> --
> 2.34.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000000f9b70629b61804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 20, 2024 at 10:30=
=E2=80=AFAM &lt;<a href=3D"mailto:christian.taedcke-oss@weidmueller.com">ch=
ristian.taedcke-oss@weidmueller.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Christian Taedcke &lt;<a href=3D"m=
ailto:christian.taedcke@weidmueller.com" target=3D"_blank">christian.taedck=
e@weidmueller.com</a>&gt;<br>
<br>
If no destsuffix parameter is supplied and the file fetcher is used,<br>
the folder name (i.e. basepath) is added to the kernel-meta search<br>
directories.<br>
<br>
Signed-off-by: Christian Taedcke &lt;<a href=3D"mailto:christian.taedcke@we=
idmueller.com" target=3D"_blank">christian.taedcke@weidmueller.com</a>&gt;<=
br>
---<br>
<br>
Changes in v2:<br>
- always use destsuffix if available<br>
- do not restict fetcher type<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">I was just looking at v1 a fe=
w days ago, to see how I could tweak</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">it and simplify a bit.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">This version looks better to me, so I have no concerns=
 as existing</div><div class=3D"gmail_default" style=3D"font-size:small">us=
er cases shouldn&#39;t be impacted.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 13 ++++++++-----<br>
=C2=A01 file changed, 8 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index a5d89dc2c8..7d80e9aa52 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -62,8 +62,8 @@ def find_sccs(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return sources_list<br>
<br>
-# check the SRC_URI for &quot;kmeta&quot; type&#39;d git repositories. Ret=
urn the name of<br>
-# the repository as it will be found in UNPACKDIR<br>
+# check the SRC_URI for &quot;kmeta&quot; type&#39;d git repositories and =
directories. Return<br>
+# the name of the repository or directory as it will be found in UNPACKDIR=
<br>
=C2=A0def find_kernel_feature_dirs(d):<br>
=C2=A0 =C2=A0 =C2=A0feature_dirs=3D[]<br>
=C2=A0 =C2=A0 =C2=A0fetch =3D bb.fetch2.Fetch([], d)<br>
@@ -71,13 +71,16 @@ def find_kernel_feature_dirs(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urldata =3D fetch.ud[url]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parm =3D urldata.parm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 destdir =3D &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;type&quot; in parm:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D parm[&quot;type&qu=
ot;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;destsuffix&quot; in parm:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destdir =3D parm[&quot;dest=
suffix&quot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if type =3D=3D &quot;kmeta&quot;=
:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_dirs.appen=
d(destdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif urldata.type =3D=3D &quot;file&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destdir =3D urldata.basepath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if type =3D=3D &quot;kmeta&quot; and destdir:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_dirs.append(destdir)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return feature_dirs<br>
<br>
=C2=A0# find the master/machine source branch. In the same way that the fet=
cher proceses<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000000f9b70629b61804--

