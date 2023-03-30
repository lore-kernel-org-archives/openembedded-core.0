Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E78C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 19:24:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.35159.1680204234006225913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 12:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=JgMaux/Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id m2so20169499wrh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680204232; x=1682796232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNkvFtuG9pdU2t6knAL4wBRxa/esRI6IznRpuW3WWE0=;
        b=JgMaux/QIot60MGpTAUbxSj4PRBU2VakFMh0QZ231B0GMe0cqK+By6Hi9EdSku/UwZ
         gySgpl6FSu7Y069LR7lASTfJPqlkXWrN30ozXrToRGtjTMOEYQOhWj04EuxnSl9Mjl+U
         ocfpUz7veh04FEspsSWyAsbLQLIGxbTIpHBELJ+bSjc7gRmAW4HA2PFUSZLgH87X0Sv0
         lTQyOtFqcH123tbqxVejIeCcPYbA8/IdxUHsZcBKeCLuvU6vy/cHEbUy/EY6RXEALBiN
         Z2Sv3Z8BcyPaI6U0utWW+CfKDuK9Icm+kORqKSy37UBYRjSFpNDAPlrSOe1DaT4N2GyP
         Uw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680204232; x=1682796232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNkvFtuG9pdU2t6knAL4wBRxa/esRI6IznRpuW3WWE0=;
        b=l/olYdpW6es4jGhRG6Rbn4a/JDV8Ft8pViMHq7IrPAdCFbyM+swfCrdJMrU+VIWMVA
         JXJH2y/8TuBjm+8VzCePx7k6z+EIPfG1SESJWDgPQ2TpUkAEFQMNNtrc7aC/VP0vwVZi
         HcR/hnuOpjAI5BjD3G73H1tV3qkdjKcW9X+Wrq2dRQH1lEF2ZccxLRpl1+rjpE/y9Rbn
         IZWWIsiO5rh6+qmeWLx9Ltki5d0k5dqZ8No/s4UZtgyLQxcWhkoyy3yCgAtspWokyyLK
         2WQI/ip2iqA2LYPrAu9qHbMbJF8dnle/85Wsy7KDFpBFKjcjJ5KJnALxi9AVu8gtNEXw
         ftkQ==
X-Gm-Message-State: AAQBX9eWfEGvwsAR+THlUeVub7KKq/dHTP8VydCEJG/opW8kXUKBymCj
	lK7JoeEI3QxOQRTCoNST4qj09NJSdd/zrIC9r7o=
X-Google-Smtp-Source: AKy350Y0EoM1Rvw80BiSi4zz+PBchSv/ZqGrLQex/9f/kfRdu24K+thzj9ERgq6Sqzw69gQeIlcR5pCHNGIcQb2MEH0=
X-Received: by 2002:a5d:5142:0:b0:2e4:cbfe:da51 with SMTP id
 u2-20020a5d5142000000b002e4cbfeda51mr677269wrt.1.1680204232279; Thu, 30 Mar
 2023 12:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
In-Reply-To: <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 Mar 2023 21:23:37 +0200
Message-ID: <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: frederic.martinsons@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006a4ad105f8230825"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 19:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179352

--0000000000006a4ad105f8230825
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't remember the exact details now, but when I was working on updating
solana recipes to use this
https://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee79cc=
339d0770cd86b4

the S was pointing to just some subdirectory and multiple Cargo.locks files
were parsed in other directories as well, that's why I was adding
https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/c=
argo-update-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742a1=
2d58

in the end I've changed to use the root directory in S and just
set CARGO_SRC_DIR to right subdirectory to build.

I don't have much experience with crates other than these solana recipes,
but isn't there some valid use-case for multiple Cargo.locks?
I assume Alex in original implementation didn't use the os.walk just to
make it more complicated :).

And FWIW when trying to regenerate these .inc files with current master and
with:
$ bitbake -c update_crates solana-keygen
it fails with:
ERROR: solana-keygen-1.14.5-r0 do_fetch: No checksum specified for
'/OE/lge/build/webos/mickledore/downloads/Inflector-0.11.4.crate', please
add at least one to the recipe:
SRC_URI[Inflector.sha256sum] =3D
"fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
ERROR: solana-keygen-1.14.5-r0 do_fetch: Bitbake Fetcher Error:
NoChecksumError('Missing SRC_URI checksum', '
https://crates.io/api/v1/crates/Inflector/0.11.4/download')

Isn't it an chicken&egg issue now when do_fetch enforces checksums to be
used? Or am I just missing some of the pending changes or just using it
incorrectly?


On Thu, Mar 30, 2023 at 6:34=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:

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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179344):
> https://lists.openembedded.org/g/openembedded-core/message/179344
> Mute This Topic: https://lists.openembedded.org/mt/97953740/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006a4ad105f8230825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t remember the exact details now, but when I was=
 working on updating solana recipes to use this<div><a href=3D"https://gith=
ub.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee79cc339d0770cd86=
b4">https://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee=
79cc339d0770cd86b4</a></div><div><br></div><div>the S was pointing to just =
some subdirectory and multiple Cargo.locks files were parsed in other direc=
tories as well, that&#39;s why I was adding=C2=A0<br><div><a href=3D"https:=
//git.openembedded.org/openembedded-core/commit/meta/classes-recipe/cargo-u=
pdate-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742a12d58">=
https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/c=
argo-update-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742a1=
2d58</a><br></div><div><br></div><div>in the end I&#39;ve changed to use th=
e root directory in S and just set=C2=A0CARGO_SRC_DIR to right subdirectory=
 to build.</div><div><br></div><div>I don&#39;t have much experience with c=
rates other than these solana recipes, but isn&#39;t there some valid use-c=
ase for multiple Cargo.locks?</div><div>I assume Alex in original implement=
ation didn&#39;t use the os.walk just to make it more complicated :).</div>=
<div><br></div><div>And FWIW when trying to regenerate these .inc files wit=
h current master and with:</div><div>$ bitbake -c update_crates solana-keyg=
en<br></div><div>it fails with:</div><div>ERROR: solana-keygen-1.14.5-r0 do=
_fetch: No checksum specified for &#39;/OE/lge/build/webos/mickledore/downl=
oads/Inflector-0.11.4.crate&#39;, please add at least one to the recipe:<br=
>SRC_URI[Inflector.sha256sum] =3D &quot;fe438c63458706e03479442743baae6c882=
56498e6431708f6dfc520a26515d3&quot;<br>ERROR: solana-keygen-1.14.5-r0 do_fe=
tch: Bitbake Fetcher Error: NoChecksumError(&#39;Missing SRC_URI checksum&#=
39;, &#39;<a href=3D"https://crates.io/api/v1/crates/Inflector/0.11.4/downl=
oad">https://crates.io/api/v1/crates/Inflector/0.11.4/download</a>&#39;)<br=
></div><div><br></div><div>Isn&#39;t it an chicken&amp;egg issue now when d=
o_fetch enforces checksums to be used? Or am I just missing some of the pen=
ding changes or just using it incorrectly?</div><div>=C2=A0</div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Mar 30, 2023 at 6:34=E2=80=AFPM Alex Kiernan &lt;<a href=3D"mailto:alex=
.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Thu, Mar 30, 2023 at 4:45=E2=
=80=AFPM &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_bl=
ank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179344): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179344" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179344</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97953740/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97953740/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006a4ad105f8230825--

