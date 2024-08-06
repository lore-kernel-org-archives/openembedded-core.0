Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8161FC49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:01:40 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.6593.1722949298405448387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jxl+IWKM;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-260e6298635so2909018fac.1;
        Tue, 06 Aug 2024 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722949297; x=1723554097; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gC0FAyFsyvVI2nTJkDRCxpo9yeDlxnpodBnuhbDZvpg=;
        b=Jxl+IWKMlig0XP12bzHxADfGyIiuoL4c8vaInuDK4ymfI1/OoR+io4568ek+8t4yWg
         dH8t4ukI2gwSNHYFdRhT0BwXnz7NnMkpQFJn3OfSs9p4i7omRh+4gQhdjYpS8OP57oSZ
         Id/iymgAOWc6RXFl48HWlGl0k1oDz12DK1UNnZyI2iGglWAf0Hg/JAl6JwsU5GXI2MOD
         rjzGb/SoGzg/+Ydd1qJHkGB6qnm2AVwtOzKXNxANqlm2mfTtJk6nvLg/phtZ1s/FKQT6
         Vwzd0YFSJBJvXk5FZwgYt2Rjh0uIEL3YmOIPAym+vCOdZYvs6kGRfxGK5MarBP7aF/jN
         Rrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722949297; x=1723554097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gC0FAyFsyvVI2nTJkDRCxpo9yeDlxnpodBnuhbDZvpg=;
        b=S3Q2dvhBbVfbqmPzjWgJF4wyCxr6K4EdySZOdGwgsmX7CQjkHNgKpB5KZVLCIoYqVL
         VEZZb1R3wGgjYrO8lHsjHPmd/bo5ko/Sew8nlXBbcWqibTL9FDcxzY89HQyAhTjrU1Yk
         IiEvEFm4MhJVnE8udycfZtp2mZ9l5Rt7iGFB22iwTIeWcrL+nU5nKoDLTElG17ajbOcx
         hDhb+ePQAo8sJGbJSHzH/mG2e4HZ2Uj9BdS2VCpnsW83M2FqnlzlFuNsuA3WPe3+zuAv
         QR80P9QHPUETtt86Q0XcoQl2s0WZZuPIbaxast6jzgVahfrpvWF27tTbXbAuxVDvsLAr
         6DoA==
X-Forwarded-Encrypted: i=1; AJvYcCVyT4OHRvW4sDd3cJznW6Tc44qB2LXjpBqfRHN4w0rDro0P9FvdxnPfO8SymJdRNifHUxG+QmIjAT1DWzlmMkxKUZpQhTTi8g6D15I05pPXC83SUxkbXqA15c3mysjfn56G0/+Zjz4d0e4=
X-Gm-Message-State: AOJu0YwFFNs9TTgcm7mv91jl9EQCUKJf23c1/hHmyPVhHMQPyRLlondW
	57doMEhZx/ehkjYmOAjCzB6fjoQnZXbKx/6O0zh5vbqxGXneXt8tTuqskn/JrJsQNdYN9Cb38Cd
	/NLqCeepo1grEKrxVNL6ul57K9lY=
X-Google-Smtp-Source: AGHT+IF5OJxBhHEX97DnrMJP21xbhSsfMphJee7adjU2Fn9R9FWZ9Ym5gHs0cKpZunSB72pdkscHDCM5V+TiWMvdExc=
X-Received: by 2002:a05:6870:420d:b0:268:282b:be0e with SMTP id
 586e51a60fabf-26892662ac3mr5581368fac.15.1722949297169; Tue, 06 Aug 2024
 06:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240806094623.38564-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240806094623.38564-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2024 06:01:26 -0700
Message-ID: <CAMKF1so-nQMsj6of8XWgnAs-yHpR7WY59MvennvxSpnBOxAP9Q@mail.gmail.com>
Subject: Re: [PATCH] musl: Show error when used with multilibs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	"Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2ee3b061f03648a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203021

--000000000000d2ee3b061f03648a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 2:46=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> From: "Richard Purdie via lists.openembedded.org" <richard.purdie=3D
> linuxfoundation.org@lists.openembedded.org>
>
> As discussed in the bugzilla entry, musl doesn't work with multilibs.
>
> I originally sent this patch in 2020 but was told that support was being
> added. I recently revisited the bug and retested a basic config which sti=
ll
> fails the way it did in 2019. Since clearly nobody is using this, make it
> clear
> we don't support it. If anyone does add support, we can remove this error
> very
> easily.
>
> [YOCTO #13122]


I am ok with patch in general. What is triggering it in your testing now

>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/musl/musl.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-core/musl/musl.inc
> b/meta/recipes-core/musl/musl.inc
> index 6ca52b186a5..9999b4d2d64 100644
> --- a/meta/recipes-core/musl/musl.inc
> +++ b/meta/recipes-core/musl/musl.inc
> @@ -32,3 +32,9 @@ COMPATIBLE_HOST:riscv32 =3D "null"
>  B =3D "${WORKDIR}/build"
>
>  do_configure[cleandirs] =3D "${B}"
> +
> +python () {
> +    multilibs =3D d.getVar("MULTILIBS")
> +    if multilibs:
> +        raise bb.parse.SkipRecipe("musl is not compatible with multilibs=
")
> +}
>

--000000000000d2ee3b061f03648a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 6, 2024 at 2:46=E2=80=AFAM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">From: &quot;Richard P=
urdie via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a>&quot; &lt;richard.purdie=3D<a href=
=3D"mailto:linuxfoundation.org@lists.openembedded.org" target=3D"_blank">li=
nuxfoundation.org@lists.openembedded.org</a>&gt;<br>
<br>
As discussed in the bugzilla entry, musl doesn&#39;t work with multilibs.<b=
r>
<br>
I originally sent this patch in 2020 but was told that support was being<br=
>
added. I recently revisited the bug and retested a basic config which still=
<br>
fails the way it did in 2019. Since clearly nobody is using this, make it c=
lear<br>
we don&#39;t support it. If anyone does add support, we can remove this err=
or very<br>
easily.<br>
<br>
[YOCTO #13122]</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I =
am ok with patch in general. What is triggering it in your testing now=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-core/musl/musl.inc | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.=
inc<br>
index 6ca52b186a5..9999b4d2d64 100644<br>
--- a/meta/recipes-core/musl/musl.inc<br>
+++ b/meta/recipes-core/musl/musl.inc<br>
@@ -32,3 +32,9 @@ COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
<br>
=C2=A0do_configure[cleandirs] =3D &quot;${B}&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 multilibs =3D d.getVar(&quot;MULTILIBS&quot;)<br>
+=C2=A0 =C2=A0 if multilibs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;musl is not co=
mpatible with multilibs&quot;)<br>
+}<br>
</blockquote></div></div>

--000000000000d2ee3b061f03648a--

