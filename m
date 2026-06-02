Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7889C5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:39:58 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19111.1780382396257688346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jntjb9TQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: saisneha196@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so7831288a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780382394; cv=none;
        d=google.com; s=arc-20240605;
        b=J9ttYJp4h1soedEjfhEAIRj3VMrzMYtL9pIVB/dV3nFbLzYDeaYdPJXk6KbwBolq3T
         UNFH4b+rKvXnbHzKlRIfmB3nm/J2f0TAxU9m9irSGdFsRNdLT2SzAHpY1Gr3L6M5gjHT
         H159QIGyQ6uxuHJPsCDtEWgILPCHmuKiQNeAprDNZ+J1RS4fl6EUdn9eR1bhlwfn6AxP
         zpW2NgQnYHj5YoINJqDEHnTyIZUkJfNUVjE1aG+dFh5VjTLjl+v6wv5XYMhEC8z3ZRqC
         1JYcM4glNTDqXPWNAlK2MUP+oz32p36REkgW9FBTTydwqP1ps2gBKlWdQIpGTtu/A/7H
         QD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3QuKqpJC/u6AljJSJSuntnsA4XG6xyapgCDaCQjwt/A=;
        fh=cbXhiV/qcMcFPUORNzkj5eMbeG6lB0ec9WTM00hGKzI=;
        b=EtD0Ww+0wO7Ly4uH+w7h78lSF3US1lMzaWI+FP8Qia6RUlUFoDBrquxn+EJcVr7TxA
         27ryJuMblO5//N/ojz/5JegAOEdyJsIMF0fLnJ4manOBVahSkQ56J5/DEJe/Ewjfst1C
         BykMftlpEGU/KgcZWj1udxl+PYK7YmkK4Cf/yLWTxXkfJuMs/oLJLuy/sB9Fs0BJ89JA
         vSj/AHk+Sw3r4FsO3J6THdWcUphPqRjgSsuL0JVymItlB9O2nsfbqVi4BfCeVJXO74oT
         Uukd3GuyipMnPqXrlCmQeBUWHuVerx+eG9V27Mr11yMUbPnma/6tS+rX3Pw0ZNaZPOjL
         H60Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780382394; x=1780987194; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3QuKqpJC/u6AljJSJSuntnsA4XG6xyapgCDaCQjwt/A=;
        b=Jntjb9TQR09qcJRBKH7i5wgqDBhSjULh3Jr8o57Oe/2NrmZ7UJYQUZ3vsVIIX4/yUf
         TcjC0UBx2AF+FWdDVJc6c6TAe41lseaDw3EEJhD8f0cBfmhjHr6SFhW/3ebL7VWybsQT
         2ketb2jNDnm3FldWrmM+jAnggL1pqwBeTVjezPo/iwxNG1OpNcEr5HUFkOJyTDlfL3Hw
         1W5jYW/r3QCvffD96/bQVDs2X9QNaXmCFo4vAFLXuk28RD/WVcw/Wd1bRNVTChiHntqE
         r1nhDIctcrG9YWzX+4SDSo2Dcl43KVxry1rtj9tcMeP61OzOF0+UGwIgnpzRrvrmjRlU
         dxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780382394; x=1780987194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QuKqpJC/u6AljJSJSuntnsA4XG6xyapgCDaCQjwt/A=;
        b=tHAzwDdQbPezF1o3uef3PXqwTZ98jYPIRXR+LI6G1zaoNwbtPIAQn+lf4vNhPfXM4p
         27hBotHwIxjG2oh/F+T5sMlwDt1/P0e4C8RGPg4M2TfVI89R2OmSsImNV5HPW1gZMqhN
         0A4bzYIvEvSKEm/duKEcwhwiU5j7NGv7nhzi/d5iIWEkKFrh1hFTxlmCLwRJnWyOY6x+
         qRej4QIgil/4NPcGtyXNe436CckpA5Luo+NJEAiWrvo+bAwHPWLFSn8YEsryu0/N+Rua
         zE4OjAgMsyy7Hrji46OWrXsr1Fzlu4koucTYybCLa1bJ9cn1p1Rtwu++rIQHPfYM8LFx
         HkyQ==
X-Gm-Message-State: AOJu0YwlnlupwIXpxH7OLyjcmo4UQZ6dFXYVeuk98X2NwBiWyJT4t6FO
	1mtWyWBK9nzDS0/QM16yq0rLjnElBh4GdZ/yeZDJHgfGTRPVfUN3r30amoAJdrbOQeWjc/VD+Nq
	8zuPMC2fPAPGUUke1ZuPbhqbZ07idO+4=
X-Gm-Gg: Acq92OHDZ3GygO/Y4yHsjAnRfDwU6RSGVGbBNhKgnTd4LljJaJ7NYrbpD4w4PbHAlCg
	JsOeFq4RWAxd+T2pG8yvyK63aR65tyBvxMU+PuK9ytMp+4JsdPxiGUeo5dbXkmBDk61jD2awhmm
	k4xGt/8t09OA+VKXqBrzPgfMxMz+iB/uji6rxIA24igASZ0+LsCvczJpB7LDVRUgUfGRyqrb/o1
	ZV3IlUK/ZQmPyjHNsE75xz9Y5YOS5d54DDSKtpVfW7vYjR1Hw1oLG13BdOXXgY2ZvzSlaOO/yKJ
	XaIW1cbbI/LveI6Hbd9Sd55IdRsv577LwH7wZM475xUaHA+I/w==
X-Received: by 2002:a17:907:a786:b0:bee:a4b8:d595 with SMTP id
 a640c23a62f3a-beea4b8d664mr287974266b.7.1780382393796; Mon, 01 Jun 2026
 23:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260527111756.1306022-1-saisneha196@gmail.com>
 <20260527111756.1306022-3-saisneha196@gmail.com> <d1023d5b6fa9f1ba8173d685c633c04a7b1a169e.camel@pbarker.dev>
In-Reply-To: <d1023d5b6fa9f1ba8173d685c633c04a7b1a169e.camel@pbarker.dev>
From: Sai Sneha <saisneha196@gmail.com>
Date: Tue, 2 Jun 2026 12:09:19 +0530
X-Gm-Features: AVHnY4Igmm6OmTuh4GQQKUQb0xTcqMcGoeMugytGiJ4w2MneM7eUyQR-KeAaK7c
Message-ID: <CANcU11d7bw=-B88ngyuHaYTKPTYdEcHJ06kA-WTz1NtMc0ae+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/4] base.bbclass: warn when SRCREV is
 missing for SCM URIs at parse time
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr, 
	corentin.guillevic@smile.fr, martin@geanix.com
Content-Type: multipart/alternative; boundary="000000000000258a8206533f948c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238005

--000000000000258a8206533f948c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

You were right to raise the tag=3D concern =E2=80=94 it turned out to be ex=
actly the
cause of the selftest failure reported by Mathieu. Recipes using tag=3D in
SRC_URI intentionally leave SRCREV empty, and my check was incorrectly
treating this as missing.

The fix adds tag=3D to the list of URI parameters that bypass the SRCREV
check, alongside the existing rev=3D handling:

if params.get('rev', '') or params.get('tag', ''):
return ''

I have verified the fix by running the full bbtests.BitbakeTests selftest
suite =E2=80=94 32/33 passed. The one failure (test_image_manifest) require=
s
building a full image and fails due to network constraints in my
environment, unrelated to this patch.

I have sent v5 with this fix.

Best regards,
Sai Sneha
On Thu, 28 May 2026 at 8:39=E2=80=AFPM, Paul Barker <paul@pbarker.dev> wrot=
e:

> On Wed, 2026-05-27 at 16:47 +0530, Sai Sneha via lists.openembedded.org
> wrote:
> > A recipe with a git:// (or other SCM) URI in SRC_URI must have a
> > corresponding SRCREV set. Without it, BitBake performs a live query
> > on the remote repository at every parse, breaking reproducibility
> > and causing parse failures under BB_NO_NETWORK=3D1.
> >
> > The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa
> > fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV
> > at parse time before QA checks run, causing a FetchError that halts
> > parsing entirely. This was identified in Corentin Guillevic's RFC
> > series and confirmed by Mathieu Dubois-Briand's autobuilder testing.
> >
> > The fix intercepts at the vardepvalue expansion point by introducing
> > check_srcrev_set() which uses the shared oe.qa.check_uri_srcrev()
> > helper. The function is called conditionally:
> >
> >   fetcher_hashes_dummyfunc[vardepvalue] =3D
> >     "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"
> >
> > Note on design choice: we intentionally use d.getVar(candidate, False)
> > in oe.qa.check_uri_srcrev() rather than srcrev_internal_helper()
> > because the latter expands SRCREV, triggering get_autorev() and live
> > network fetches -- the exact problem this patch fixes.
> >
> > Note: parse-time warnings intentionally complement the QA-time warnings
> > added in insane.bbclass. This is necessary because CI pipelines running
> > 'bitbake --parse-only' with BB_NO_NETWORK=3D1 (the original motivation
> > from Ross Burton) would miss the issue entirely if only QA-time
> > warnings existed. This pattern is already established in the codebase
> > (e.g. src-uri-bad fires at both parse and QA time).
> >
> > Reported-by: Yoann Congal <yoann.congal@smile.fr>
> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> > AI-Generated: Developed with assistance from Anthropic Claude
> > Signed-off-by: Sai Sneha <saisneha196@gmail.com>
> > ---
> >
> > Changes in v4:
> > - Refactored to use shared oe.qa.check_uri_srcrev() helper
> > - Eliminates duplicated URI parsing logic
> > - Added docstring explaining True/False return values
> >
> > Changes in v3:
> > - Added AI-Generated disclosure and Reported-by tag
> > - Added design decision notes to commit message
> >
> > Changes in v2:
> > - Initial public submission
> >  meta/classes-global/base.bbclass | 30 ++++++++++++++++++++++++++++--
> >  1 file changed, 28 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> > index 62f2814bb7..7de896ca7d 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -164,14 +164,40 @@ def setup_hosttools_dir(dest, toolsvar, d,
> fatal=3DTrue):
> >
> >      if notfound and fatal:
> >          bb.fatal("The following required tools (as specified by
> HOSTTOOLS) appear to be unavailable in PATH, please install them in order
> to proceed:\n  %s" % " ".join(notfound))
> > +
> > +def check_srcrev_set(d):
> > +    """
> > +    Inspect SRC_URI for SCM URIs missing a valid SRCREV.
> > +
> > +    Returns True if all SCM URIs have a valid SRCREV or AUTOREV set,
> > +    allowing get_hashvalue(d) to proceed normally.
> > +
> > +    Returns False if any SCM URI is missing SRCREV, suppressing
> > +    get_hashvalue(d) to prevent a FetchError parse crash.
> > +    """
> > +    import oe.qa
> > +    src_uri =3D (d.getVar('SRC_URI', False) or '').split()
> > +    pn =3D d.getVar('PN')
> > +    for uri in src_uri:
> > +        rev =3D oe.qa.check_uri_srcrev(pn, uri, d)
> > +        if rev is None:
> > +            # SRCREV missing =E2=80=94 warn and suppress hash expansio=
n
> > +            if bb.utils.contains('ERROR_QA', 'missing-srcrev', True,
> False, d):
> > +                bb.error("%s: SRCREV not set for %s" % (pn, uri))
> > +            elif bb.utils.contains('WARN_QA', 'missing-srcrev', True,
> False, d):
> > +                bb.warn("%s: SRCREV not set for %s" % (pn, uri))
> > +            return False
> > +        if rev and '${AUTOREV}' in rev:
> > +            return True
> > +    return True
> > +
> >
> >  # We can't use vardepvalue against do_fetch directly since that would
> overwrite
> >  # the other task dependencies so we use an indirect function.
> >  python fetcher_hashes_dummyfunc() {
> >      return
> >  }
> > -fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(d=
)}"
> > -
> > +fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(d=
)
> if check_srcrev_set(d) else ''}"
>
> How confident are you that this is a safe change to make?
>
> This is an area where I would not make AI-driven changes myself, as a
> change here could cause quite subtle issues. We may not have sufficient
> test coverage to catch such issues.
>
> Specifically, what happens if a SRC_URI has a 'tag=3D...' property, SRCRE=
V
> is not set, and the tag is changed upstream?
>
> Best regards,
>
> --
> Paul Barker
>
>

--000000000000258a8206533f948c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div></div><div style=3D"font-size:inherit" dir=3D"auto">Hi Paul,<br style=
=3D"font-size:inherit"><br style=3D"font-size:inherit">You were right to ra=
ise the tag=3D concern =E2=80=94 it turned out to be exactly=C2=A0the cause=
 of the selftest failure reported by Mathieu. Recipes using=C2=A0tag=3D in =
SRC_URI intentionally leave SRCREV empty, and my check was incorrectly trea=
ting this as missing.<br style=3D"font-size:inherit"><br style=3D"font-size=
:inherit">The fix adds tag=3D to the list of URI parameters that bypass the=
 SRCREV<br style=3D"font-size:inherit">check, alongside the existing rev=3D=
 handling:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit"> =
 if params.get(&#39;rev&#39;, &#39;&#39;) or params.get(&#39;tag&#39;, &#39=
;&#39;):<br style=3D"font-size:inherit">      return &#39;&#39;<br style=3D=
"font-size:inherit"><br style=3D"font-size:inherit">I have verified the fix=
 by running the full bbtests.BitbakeTests=C2=A0selftest suite =E2=80=94 32/=
33 passed. The one failure (test_image_manifest)=C2=A0requires building a f=
ull image and fails due to network constraints in my environment, unrelated=
 to this patch.<br style=3D"font-size:inherit"><br style=3D"font-size:inher=
it">I have sent v5 with this fix.<br style=3D"font-size:inherit"><br style=
=3D"font-size:inherit">Best regards,<br style=3D"font-size:inherit">Sai Sne=
ha<br style=3D"font-size:inherit"></div><div><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 May 202=
6 at 8:39=E2=80=AFPM, Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev">p=
aul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Wed, 2026-05-27 at 16:47 +0530, Sai Sneha via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a><br>
wrote:<br>
&gt; A recipe with a git:// (or other SCM) URI in SRC_URI must have a<br>
&gt; corresponding SRCREV set. Without it, BitBake performs a live query<br=
>
&gt; on the remote repository at every parse, breaking reproducibility<br>
&gt; and causing parse failures under BB_NO_NETWORK=3D1.<br>
&gt; <br>
&gt; The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa<br>
&gt; fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV<br>
&gt; at parse time before QA checks run, causing a FetchError that halts<br=
>
&gt; parsing entirely. This was identified in Corentin Guillevic&#39;s RFC<=
br>
&gt; series and confirmed by Mathieu Dubois-Briand&#39;s autobuilder testin=
g.<br>
&gt; <br>
&gt; The fix intercepts at the vardepvalue expansion point by introducing<b=
r>
&gt; check_srcrev_set() which uses the shared oe.qa.check_uri_srcrev()<br>
&gt; helper. The function is called conditionally:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0fetcher_hashes_dummyfunc[vardepvalue] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${@bb.fetch.get_hashvalue(d) if check_srcrev_=
set(d) else &#39;&#39;}&quot;<br>
&gt; <br>
&gt; Note on design choice: we intentionally use d.getVar(candidate, False)=
<br>
&gt; in oe.qa.check_uri_srcrev() rather than srcrev_internal_helper()<br>
&gt; because the latter expands SRCREV, triggering get_autorev() and live<b=
r>
&gt; network fetches -- the exact problem this patch fixes.<br>
&gt; <br>
&gt; Note: parse-time warnings intentionally complement the QA-time warning=
s<br>
&gt; added in insane.bbclass. This is necessary because CI pipelines runnin=
g<br>
&gt; &#39;bitbake --parse-only&#39; with BB_NO_NETWORK=3D1 (the original mo=
tivation<br>
&gt; from Ross Burton) would miss the issue entirely if only QA-time<br>
&gt; warnings existed. This pattern is already established in the codebase<=
br>
&gt; (e.g. src-uri-bad fires at both parse and QA time).<br>
&gt; <br>
&gt; Reported-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
 target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
16051" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D16051</a><br>
&gt; AI-Generated: Developed with assistance from Anthropic Claude<br>
&gt; Signed-off-by: Sai Sneha &lt;<a href=3D"mailto:saisneha196@gmail.com" =
target=3D"_blank">saisneha196@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes in v4:<br>
&gt; - Refactored to use shared oe.qa.check_uri_srcrev() helper<br>
&gt; - Eliminates duplicated URI parsing logic<br>
&gt; - Added docstring explaining True/False return values<br>
&gt; <br>
&gt; Changes in v3:<br>
&gt; - Added AI-Generated disclosure and Reported-by tag<br>
&gt; - Added design decision notes to commit message<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; - Initial public submission<br>
&gt;=C2=A0 meta/classes-global/base.bbclass | 30 ++++++++++++++++++++++++++=
++--<br>
&gt;=C2=A0 1 file changed, 28 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/ba=
se.bbclass<br>
&gt; index 62f2814bb7..7de896ca7d 100644<br>
&gt; --- a/meta/classes-global/base.bbclass<br>
&gt; +++ b/meta/classes-global/base.bbclass<br>
&gt; @@ -164,14 +164,40 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=
=3DTrue):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if notfound and fatal:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;The following require=
d tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, pleas=
e install them in order to proceed:\n=C2=A0 %s&quot; % &quot; &quot;.join(n=
otfound))<br>
&gt; +=C2=A0 =C2=A0 <br>
&gt; +def check_srcrev_set(d):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Inspect SRC_URI for SCM URIs missing a valid SRCREV.<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Returns True if all SCM URIs have a valid SRCREV or AUT=
OREV set,<br>
&gt; +=C2=A0 =C2=A0 allowing get_hashvalue(d) to proceed normally.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Returns False if any SCM URI is missing SRCREV, suppres=
sing<br>
&gt; +=C2=A0 =C2=A0 get_hashvalue(d) to prevent a FetchError parse crash.<b=
r>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 import <a href=3D"http://oe.qa" rel=3D"noreferrer" targ=
et=3D"_blank">oe.qa</a><br>
&gt; +=C2=A0 =C2=A0 src_uri =3D (d.getVar(&#39;SRC_URI&#39;, False) or &#39=
;&#39;).split()<br>
&gt; +=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
&gt; +=C2=A0 =C2=A0 for uri in src_uri:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D oe.qa.check_uri_srcrev(pn, uri, d=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rev is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # SRCREV missing =E2=80=94 =
warn and suppress hash expansion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.contains(&#39;E=
RROR_QA&#39;, &#39;missing-srcrev&#39;, True, False, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quo=
t;%s: SRCREV not set for %s&quot; % (pn, uri))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif bb.utils.contains(&#39=
;WARN_QA&#39;, &#39;missing-srcrev&#39;, True, False, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;%s: SRCREV not set for %s&quot; % (pn, uri))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rev and &#39;${AUTOREV}&#39; in rev:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
&gt; +=C2=A0 =C2=A0 return True<br>
&gt; + <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # We can&#39;t use vardepvalue against do_fetch directly since t=
hat would overwrite<br>
&gt;=C2=A0 # the other task dependencies so we use an indirect function.<br=
>
&gt;=C2=A0 python fetcher_hashes_dummyfunc() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 }<br>
&gt; -fetcher_hashes_dummyfunc[vardepvalue] =3D &quot;${@bb.fetch.get_hashv=
alue(d)}&quot;<br>
&gt; -<br>
&gt; +fetcher_hashes_dummyfunc[vardepvalue] =3D &quot;${@bb.fetch.get_hashv=
alue(d) if check_srcrev_set(d) else &#39;&#39;}&quot;<br>
<br>
How confident are you that this is a safe change to make?<br>
<br>
This is an area where I would not make AI-driven changes myself, as a<br>
change here could cause quite subtle issues. We may not have sufficient<br>
test coverage to catch such issues.<br>
<br>
Specifically, what happens if a SRC_URI has a &#39;tag=3D...&#39; property,=
 SRCREV<br>
is not set, and the tag is changed upstream?<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div>

--000000000000258a8206533f948c--

