Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB451C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 17:10:02 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.31595.1680196198689829567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 10:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T9TS4xzl;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id k37so25466777lfv.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CjvbPEjH7ZbIexiao3IhHxIXt7OzbgAxnEOl6o7emaw=;
        b=T9TS4xzlA2OsK3WJQdjdgCcjqlKdm4UGQ4oVNc3/ia0ZbTQ4Aj3aqevBehSVO0Lues
         TJ/IlYy4uEFP5oZZsRdvPmHymoXQ+vZRKOntEQssodHxppAmNx88UOiz3USgT/iu7+Dr
         sW9n8JPaf3PJQWLvE1jAt58C2LTZcYQ4YYnLJawMdrdRkLxUZrG1ehYgG/yvh/okNG7d
         g39MeKhSAToPk1/7QkYG15L8YELIQNPB5a2S/feRMyYnOAFmFqaLSEjwjUKwFeA31Tri
         I+yVEm91h4/lZ0eAGSrf0MHpPeIZJ/yDunC0TfhooBFRZOxaZCe4Fw7a9p2cjWjUYBGK
         ymgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjvbPEjH7ZbIexiao3IhHxIXt7OzbgAxnEOl6o7emaw=;
        b=6/PiFXbH4zKwR2iZSZxDvut7l5s/Yse0MQOdSUomhQKGhzE7kEhsqkab2Pb8CRoPKp
         xacgnYFhUVwaQ9JJkMEsQF7bKvLDnK5l7x0Y+j7go1asdvnNwES+BGgR0MqP24mX8mz2
         VsXWULfkWvIu2Mf6fsYSSjo1+FP0oPWwR41or7Tc+25US0rE/Howp6Mod/IJEvuMCQxz
         KAKMoMTUmoJHThaU6UZHT7nY+ENxrxS40zxX+AO6Uz2yz4b7mxObT+EcMPcyShy0CDOq
         36Ao51Rx8d348IFDOxBK9yYPomQJ/BmrxmsrM10KR2rptQptw+jB3d5FACx6QrYLK2lV
         eewQ==
X-Gm-Message-State: AAQBX9e+I6whUtJjSVGLtEnAUV/aE/Gu9H/2f4zotRivD3twcSiYpoTv
	m3Ibnh3dcmH2oS1gmbFljztgB1CA2GtaCya9Sgk=
X-Google-Smtp-Source: AKy350Yad/e2RrupewapCGiKv3koOO4wbrUU9xsduBCBgI1VCNRCylSoPCTI3aGwLxtFHBtW3R9pC4JoqhfHcjrNWXw=
X-Received: by 2002:ac2:5223:0:b0:4d5:ca43:7049 with SMTP id
 i3-20020ac25223000000b004d5ca437049mr7152870lfl.12.1680196196725; Thu, 30 Mar
 2023 10:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
In-Reply-To: <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 30 Mar 2023 19:09:45 +0200
Message-ID: <CA+cAkerHn8iWgTDKw1AC0MGRxx26eun_8KZRSJZaQa-qD-JFtw@mail.gmail.com>
Subject: Re: [PATCH V5 6/6] cargo-update-recipe-crates: don't walk on the
 whole dir
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007578a705f82129b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 17:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179346

--0000000000007578a705f82129b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pretty much indeed, except for the exception catching part (which allows a
better error message)
Do I need to submit another whole series (PATCH V6) or can I submit just
this change ?

On Thu, 30 Mar 2023 at 18:34, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM <frederic.martinsons@gmail.com> w=
rote:
> >
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > There is no need to do such things, Cargo.lock file
> > has to be at the root of CARGO_LOCK_SRC_DIR.
> > This avoid finding other possible Cargo.lock that
> > would be in subdir (for example if a patch is applied
> > on the recipe, we can have .pc subdir in S and a Cargo.lock
> > can be there)
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  .../cargo-update-recipe-crates.bbclass               | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > index daa363b0dd..549cfe627e 100644
> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > @@ -68,10 +68,14 @@ def get_crates(f):
> >  import os
> >  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
> >  found =3D False
> > -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
> > -    for file in files:
> > -        if file =3D=3D 'Cargo.lock':
> > -            crates +=3D get_crates(os.path.join(root, file))
> > +for file in os.listdir('${CARGO_LOCK_SRC_DIR}'):
> > +    if file =3D=3D 'Cargo.lock':
> > +        try:
> > +            cargo_lock_path =3D os.path.join('${CARGO_LOCK_SRC_DIR}',
> file)
> > +            crates +=3D get_crates(cargo_lock_path)
> > +        except Exception as e:
> > +            raise ValueError("Cannot parse '%s'" % cargo_lock_path)
> from e
> > +        else:
> >              found =3D True
> >  if not found:
> >      raise ValueError("Unable to find Cargo.lock in
> ${CARGO_LOCK_SRC_DIR}")
>
> Isn't this just a long-winded version of something like this
> (completely untested):
>
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> index daa363b0dd65..22ddcfa5c1e3 100644
> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -67,14 +67,7 @@ def get_crates(f):
>
>  import os
>  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
> -found =3D False
> -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
> -    for file in files:
> -        if file =3D=3D 'Cargo.lock':
> -            crates +=3D get_crates(os.path.join(root, file))
> -            found =3D True
> -if not found:
> -    raise ValueError("Unable to find Cargo.lock in ${CARGO_LOCK_SRC_DIR}=
")
> +crates +=3D get_crates(os.path.join("${CARGO_LOCK_SRC_DIR}", "Cargo.lock=
"))
>  open("${TARGET_FILE}", 'w').write(crates)
>  EOF
>
> --
> Alex Kiernan
>

--0000000000007578a705f82129b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Pretty much indeed, except for the exception catching part=
 (which allows a better error message)<div>Do I need to submit another whol=
e series (PATCH V6) or can I submit just this change ?</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Mar =
2023 at 18:34, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">a=
lex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM &lt;<a href=3D=
"mailto:frederic.martinsons@gmail.com" target=3D"_blank">frederic.martinson=
s@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt;<br>
&gt; There is no need to do such things, Cargo.lock file<br>
&gt; has to be at the root of CARGO_LOCK_SRC_DIR.<br>
&gt; This avoid finding other possible Cargo.lock that<br>
&gt; would be in subdir (for example if a patch is applied<br>
&gt; on the recipe, we can have .pc subdir in S and a Cargo.lock<br>
&gt; can be there)<br>
&gt;<br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 .../cargo-update-recipe-crates.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++----<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/=
meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; index daa363b0dd..549cfe627e 100644<br>
&gt; --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; @@ -68,10 +68,14 @@ def get_crates(f):<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 crates =3D &quot;# Autogenerated with &#39;bitbake -c update_cra=
tes ${PN}&#39;\n\n&quot;<br>
&gt;=C2=A0 found =3D False<br>
&gt; -for root, dirs, files in os.walk(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br=
>
&gt; -=C2=A0 =C2=A0 for file in files:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if file =3D=3D &#39;Cargo.lock&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crates +=3D get_crates(os.p=
ath.join(root, file))<br>
&gt; +for file in os.listdir(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br>
&gt; +=C2=A0 =C2=A0 if file =3D=3D &#39;Cargo.lock&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_lock_path =3D os.path=
.join(&#39;${CARGO_LOCK_SRC_DIR}&#39;, file)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crates +=3D get_crates(carg=
o_lock_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(&quot;Cann=
ot parse &#39;%s&#39;&quot; % cargo_lock_path) from e<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D True<br>
&gt;=C2=A0 if not found:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 raise ValueError(&quot;Unable to find Cargo.lock i=
n ${CARGO_LOCK_SRC_DIR}&quot;)<br>
<br>
Isn&#39;t this just a long-winded version of something like this<br>
(completely untested):<br>
<br>
diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
index daa363b0dd65..22ddcfa5c1e3 100644<br>
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
@@ -67,14 +67,7 @@ def get_crates(f):<br>
<br>
=C2=A0import os<br>
=C2=A0crates =3D &quot;# Autogenerated with &#39;bitbake -c update_crates $=
{PN}&#39;\n\n&quot;<br>
-found =3D False<br>
-for root, dirs, files in os.walk(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br>
-=C2=A0 =C2=A0 for file in files:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if file =3D=3D &#39;Cargo.lock&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crates +=3D get_crates(os.path.j=
oin(root, file))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D True<br>
-if not found:<br>
-=C2=A0 =C2=A0 raise ValueError(&quot;Unable to find Cargo.lock in ${CARGO_=
LOCK_SRC_DIR}&quot;)<br>
+crates +=3D get_crates(os.path.join(&quot;${CARGO_LOCK_SRC_DIR}&quot;, &qu=
ot;Cargo.lock&quot;))<br>
=C2=A0open(&quot;${TARGET_FILE}&quot;, &#39;w&#39;).write(crates)<br>
=C2=A0EOF<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>

--0000000000007578a705f82129b3--

