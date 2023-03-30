Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFB3C77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 18:53:23 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.34399.1680202394582266941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 11:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1DoHk26;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id y15so25774525lfa.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 11:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680202392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nK3BiJE8Nd9ySmYIWDBJxcAynXsGoIE0E4L5CdHay9k=;
        b=a1DoHk26RdpI/9ZCANpW9WnIym4V+a2w+zL6M/Fcfq8j0sW6t4fdLfOQbv11C5xxj/
         Co9uQ78YoRuAIYEMBr6pZUDMk2hb957Oz0L9E40iYcAW7bbto+SXWtqKjt9j/Z4a8A+g
         nNk11r5hdcFYFbRJv04DmV5z97Ls8lWWVlya6ND5G0Uc3Oc4g3mkfDQ7ZKJwYEGbdmyr
         cHWAc2bnSObhBrr+t+IaHMfLniWk7ZCBmkek0fwmzZN9KRLMmnZgwDCt8bdBHiNK8FV3
         K5UIKxMp0ZKq2AJiM4KJXrPPU6t+eIbr3YafEhnA03ell3HqQv/cQ8KlRaoL9iZxzvff
         yR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680202392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nK3BiJE8Nd9ySmYIWDBJxcAynXsGoIE0E4L5CdHay9k=;
        b=aDV+XUzPfQ0db3/CkOMXjXv3z2TdvsqD2z4l3dQGgUmBIWxCuWOOZSKGdFsdPstGI7
         dbCUA0jrvOlTkMe3UZumRmMLY3KENvoj/2wHO+dfIyb8gNsBFOU4cndsf2uO4pPWjDnN
         s62vTUu6oxyWDQbU8Rw6jPFwkhNTeBUucPt7GrIJnvoqfh7BeZQez3iy9CJyKx+DMngh
         PZq7gOMb5LiS8d+2dIuzQYmNQx7bwqvx3taFRLvV6unsNLH9hTxvw3CEYfIPqxi6xZGN
         KvrqcJfQiUPR3z5gT7QggB3cV7GeYY86eEJMrs8cHwO09RvNeKOqS1mstxsPuWfWJuNk
         fF/w==
X-Gm-Message-State: AAQBX9dpaNoUfS5T5OQ73Ul3RHUofzHyFUXLQEeBf4MoCpPWfBZiB/cC
	tA27spSLvQEGxKVRhY2LYp+5mnbyIAkbhjRzawE=
X-Google-Smtp-Source: AKy350a5B8Q/V0BJl2OlzOz5o2xObTfybdQIyb1AatfRSBEWjmpHquQOf7LY3NKD6pC99v7B4f+cEacCLHWJVYMgg24=
X-Received: by 2002:ac2:5a06:0:b0:4e8:45d5:53cd with SMTP id
 q6-20020ac25a06000000b004e845d553cdmr7024743lfn.12.1680202392293; Thu, 30 Mar
 2023 11:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com> <1751418A85B52050.27612@lists.openembedded.org>
In-Reply-To: <1751418A85B52050.27612@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 30 Mar 2023 20:53:00 +0200
Message-ID: <CA+cAkeqTOz7tWxXqeZy9v0fUsEr9V7eqis_3gTCKUjY9zhBHEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000be562a05f8229ac6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 18:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179351

--000000000000be562a05f8229ac6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nevermind, I'll submit a new v6 series tomorrow.

Your comment is totally accurate and follow the PEP20 which I should follow
too ("readability counts" and "explicit is better than implicit" at most )

Le jeu. 30 mars 2023, 19:10, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Pretty much indeed, except for the exception catching part (which allows =
a
> better error message)
> Do I need to submit another whole series (PATCH V6) or can I submit just
> this change ?
>
> On Thu, 30 Mar 2023 at 18:34, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>
>> On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM <frederic.martinsons@gmail.com> =
wrote:
>> >
>> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> >
>> > There is no need to do such things, Cargo.lock file
>> > has to be at the root of CARGO_LOCK_SRC_DIR.
>> > This avoid finding other possible Cargo.lock that
>> > would be in subdir (for example if a patch is applied
>> > on the recipe, we can have .pc subdir in S and a Cargo.lock
>> > can be there)
>> >
>> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
>> > ---
>> >  .../cargo-update-recipe-crates.bbclass               | 12 ++++++++---=
-
>> >  1 file changed, 8 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> > index daa363b0dd..549cfe627e 100644
>> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> > @@ -68,10 +68,14 @@ def get_crates(f):
>> >  import os
>> >  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n=
"
>> >  found =3D False
>> > -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>> > -    for file in files:
>> > -        if file =3D=3D 'Cargo.lock':
>> > -            crates +=3D get_crates(os.path.join(root, file))
>> > +for file in os.listdir('${CARGO_LOCK_SRC_DIR}'):
>> > +    if file =3D=3D 'Cargo.lock':
>> > +        try:
>> > +            cargo_lock_path =3D os.path.join('${CARGO_LOCK_SRC_DIR}',
>> file)
>> > +            crates +=3D get_crates(cargo_lock_path)
>> > +        except Exception as e:
>> > +            raise ValueError("Cannot parse '%s'" % cargo_lock_path)
>> from e
>> > +        else:
>> >              found =3D True
>> >  if not found:
>> >      raise ValueError("Unable to find Cargo.lock in
>> ${CARGO_LOCK_SRC_DIR}")
>>
>> Isn't this just a long-winded version of something like this
>> (completely untested):
>>
>> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> index daa363b0dd65..22ddcfa5c1e3 100644
>> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> @@ -67,14 +67,7 @@ def get_crates(f):
>>
>>  import os
>>  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
>> -found =3D False
>> -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>> -    for file in files:
>> -        if file =3D=3D 'Cargo.lock':
>> -            crates +=3D get_crates(os.path.join(root, file))
>> -            found =3D True
>> -if not found:
>> -    raise ValueError("Unable to find Cargo.lock in
>> ${CARGO_LOCK_SRC_DIR}")
>> +crates +=3D get_crates(os.path.join("${CARGO_LOCK_SRC_DIR}", "Cargo.loc=
k"))
>>  open("${TARGET_FILE}", 'w').write(crates)
>>  EOF
>>
>> --
>> Alex Kiernan
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179346):
> https://lists.openembedded.org/g/openembedded-core/message/179346
> Mute This Topic: https://lists.openembedded.org/mt/97953740/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000be562a05f8229ac6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Nevermind, I&#39;ll submit a new v6 series tomorrow.=C2=
=A0<div dir=3D"auto"><br></div><div dir=3D"auto">Your comment is totally ac=
curate and follow the PEP20 which I should follow too (&quot;readability co=
unts&quot; and &quot;explicit is better than implicit&quot; at most )=C2=A0=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Le jeu. 30 mars 2023, 19:10, Frederic Martinsons via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;frederic.martinson=
s=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.ope=
nembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">Pretty much indeed, except for the exception catchi=
ng part (which allows a better error message)<div>Do I need to submit anoth=
er whole series (PATCH V6) or can I submit just this change ?</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
30 Mar 2023 at 18:34, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Ma=
r 30, 2023 at 4:45=E2=80=AFPM &lt;<a href=3D"mailto:frederic.martinsons@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt;<br>
&gt; There is no need to do such things, Cargo.lock file<br>
&gt; has to be at the root of CARGO_LOCK_SRC_DIR.<br>
&gt; This avoid finding other possible Cargo.lock that<br>
&gt; would be in subdir (for example if a patch is applied<br>
&gt; on the recipe, we can have .pc subdir in S and a Cargo.lock<br>
&gt; can be there)<br>
&gt;<br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@=
gmail.com</a>&gt;<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179346): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179346" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/179346</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97953740/6213=
388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/97953740/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000be562a05f8229ac6--

