Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BB0C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:41:33 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.11963.1740591689226980957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y7gHr+zh;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f404933b1cso35964b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740591688; x=1741196488; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GCv9rZNWVGICmLydscnSjq+UQWP24Jb933cbPivQlNQ=;
        b=Y7gHr+zh/qIHLSsWGuyIxm18eiQ7rzhWCIm2I1Chuhqs6+vRDvhdqol8cSjIRLHLzG
         gkO1wpoU+/57Mudy8tIaoODpSzmCMr4XxsW76fiLroAprOeymeASOnQKM0kIN4FDhAnP
         U0yg2N1ZT9sx7u/TNu9XwNIXfs4VfhCrperaBMYkKKCIle2+GKmmxg+DscD4WICNCzTa
         oTq4keHGfpp0yiaqyRXRBx1kdpebaRmW9uEKKZTQDNpGoA7sS08Wugqok0PqrkuCYppJ
         +TJ9NAhROCSjIOA8vk3P8SYOoYX9qJaE1vszWGFAkMpi6tdjANuoGAk9FBjQrzc+JbdJ
         BGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591688; x=1741196488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCv9rZNWVGICmLydscnSjq+UQWP24Jb933cbPivQlNQ=;
        b=DzGJxRgI4HeJn9E/3MMnGWsBTZG8EvVCK/+VF5uQNFIVY5ubDR0YenZ2m0pjUHmKUq
         OLMGqN+2D1290ThZ298Zu/Hj9xYC3F08dkXlMpCghAWmdo9RGUosxsMqLetxqvzX5VYu
         ul5So0zzuxOftm9PxUTWAegg5SkHPjKe/WNhXVzQhE5tvTd2U5f8XwDgpLTcNnXxeuMA
         ZJ7D7t1OHE7sLXxsmiwh7apt8EXolPfAhPaORfPD/q6D0TtAJXQ2hJ4vE7a94xDUjQCw
         L3v5tpARfVA2qK+WNSS/VsqTyveWfDSAgAqZcd789U1Vvpbc7BLUOW+jQ8Da8/+oJPRM
         eoZA==
X-Gm-Message-State: AOJu0YyUppFDUc3Ni/lLFbeBKfKDRvPzAiK4K5Wa7EpULad8qUyYbuB/
	W24Fx4c2decgmW4/XFoRhKPORH57Ja8pDtMGpg4MoZFDtEjHxdxzod7NLj2iIh6hoawTXnL2Ebj
	Sj2JyypbjFtN0bYiaQi7W4W60iAY=
X-Gm-Gg: ASbGncvgQbTrQhTyDY+sZNQQQPRF8Iefu4nyLDW+HWr/KN/gj3wwogEFYAnyKAy1x9d
	fFeMPqWH5u1xuk/CyYVXsrxTNA64fWQ8KUez0kp7gnAQuREnNgRHjUhRYBxdHoVIkLOBwfYhoaV
	14igNbX2k=
X-Google-Smtp-Source: AGHT+IG2IhoEJAqHC92IVQdRc+ALHSpRc45HaQltSM49eWz92wH4ps1OCwvK+IDZ7ra2x7g0EZXZZMzFnTC7dIBY0NI=
X-Received: by 2002:a05:6808:148f:b0:3f4:41a:197e with SMTP id
 5614622812f47-3f425a9432fmr14639986b6e.20.1740591688388; Wed, 26 Feb 2025
 09:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20250226122033.2547511-1-zboszor@gmail.com>
In-Reply-To: <20250226122033.2547511-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2025 09:41:17 -0800
X-Gm-Features: AQ5f1Jq_L_WTKZjQyCs9-qHukN2e-dSm0Tld0vVrt4DYh48uM6qeXFJGb-VsmKQ
Message-ID: <CAMKF1sq8vWS47gq=0Wq7L=m84hq7pLaLK-GbxSoNBgMtWpvBHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rpm-sequoia-crypto-policy: clean up dependencies
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000491752062f0f1548"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 17:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211969

--000000000000491752062f0f1548
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:20=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org> wrote:

> Rely on host-provided coreutils and make.
>

What is the reason to do so ?


> openssl-native is not needed either, as the build scripts
> use crypto functionality via python.
>
> Python 3.11+ is needed by the python build scripts, which is
> ensured by "inherit python3native".
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb               | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm-sequoia/
> rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/
> rpm-sequoia-crypto-policy_git.bb
> index 098881e3da..f66cb56468 100644
> --- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
> @@ -5,8 +5,7 @@ LICENSE =3D "LGPL-2.1-or-later"
>
>  LIC_FILES_CHKSUM =3D
> "file://COPYING.LESSER;md5=3Da6f89e2100d9b6cdffcea4f398e37343"
>
> -DEPENDS =3D "coreutils-native openssl-native make-native"
> -
> +# Python 3.11+ is needed to build fedora-crypto-policies
>  inherit allarch python3native
>
>  SRC_URI =3D "git://
> gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=3Dhttps;bran=
ch=3Dmaster
> "
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211955):
> https://lists.openembedded.org/g/openembedded-core/message/211955
> Mute This Topic: https://lists.openembedded.org/mt/111394788/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000491752062f0f1548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2025 at 4:20=E2=80=AFAM=
 Zoltan Boszormenyi via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;zboszor=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Rely on host-provided coreutils and make.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">What is the reas=
on to do so ?</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
openssl-native is not needed either, as the build scripts<br>
use crypto functionality via python.<br>
<br>
Python 3.11+ is needed by the python build scripts, which is<br>
ensured by &quot;inherit python3native&quot;.<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../rpm-sequoia/<a href=3D"http://rpm-sequoia-crypto-policy_git.bb" r=
el=3D"noreferrer" target=3D"_blank">rpm-sequoia-crypto-policy_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoi=
a-crypto-policy_git.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia-cr=
ypto-policy_git.bb</a> b/meta/recipes-devtools/rpm-sequoia/<a href=3D"http:=
//rpm-sequoia-crypto-policy_git.bb" rel=3D"noreferrer" target=3D"_blank">rp=
m-sequoia-crypto-policy_git.bb</a><br>
index 098881e3da..f66cb56468 100644<br>
--- a/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia-crypt=
o-policy_git.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia-crypto-po=
licy_git.bb</a><br>
+++ b/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia-crypt=
o-policy_git.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia-crypto-po=
licy_git.bb</a><br>
@@ -5,8 +5,7 @@ LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.LESSER;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343&quot;<br>
<br>
-DEPENDS =3D &quot;coreutils-native openssl-native make-native&quot;<br>
-<br>
+# Python 3.11+ is needed to build fedora-crypto-policies<br>
=C2=A0inherit allarch python3native<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/redhat-crypto/fe=
dora-crypto-policies.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferre=
r" target=3D"_blank">gitlab.com/redhat-crypto/fedora-crypto-policies.git;pr=
otocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211955): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211955" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211955</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111394788/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111394788/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000491752062f0f1548--

