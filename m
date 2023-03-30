Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9D6C7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 20:07:43 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.37365.1680206856753448289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 13:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f//Pr+4u;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id br6so25999361lfb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680206855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QhRJ9qjoccvZ14XS/D5y+uQ6u8ZAjdANVeFyuALNGn4=;
        b=f//Pr+4uIXIJio+gRrMxk/e98SVu3KqzjHyPeU+AdEzjjWqyTSK4KpXRVBIxAZqj3W
         M8AeA95ujSjEntCJweSdL9qjVKnH8g2zDN5OALGjuTyQxTPHnmalW254NY00tiY6Agzj
         CtSEeZ9j/xJXoxcDwh4I+uayT2kTTaW0bkYHrnxhk6k3ooc0v3ZWnWLptCsASGwxGY3F
         hkoa3p7ZH+KSRdBqTI/Mh1qTHo7GliYTlFSKdCqwBq8J+yp2TlAvUuQL5Qzd+xJAaFvh
         RNKa94onJgFCebvBLpCKbNkWFO90dk3lubDl1TUiKeKr5BeNY6OVXllBE8FC+8xW55x/
         12ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680206855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhRJ9qjoccvZ14XS/D5y+uQ6u8ZAjdANVeFyuALNGn4=;
        b=Ha9C8BBAAqhQEphZ4tLCqH6QPi3EP5kQWOmIsSZWFvfIbGU5Mtqi+pjyaVJk8yyubw
         Sp8kWQyO9URexW77q1VvFa1eHnbv2HgK/JuT8kabwjIWeuzlX65SGSCM+DctgIcQXhXy
         Mp281O2RZWLa9fW5l396NYNbZ6jBSc0qDFRU422xQkCBimPfVSpTQx24/ASgNycp6gOw
         L7bEiyWHKaOOtDkViTqm5KPbWlw8CM4I2bIgFu56WPqV46WUUZlSMmJRDb478qjblKsF
         mlDjuICTVtx4nNB1fWcPL23BZjOoDQwQcvxu5LCbPycXzwX9xtyDv8wcBF5vvxpPR9XN
         ZHsA==
X-Gm-Message-State: AAQBX9dunbzB6eXUAcclfFkXPmrqTFDwC5ge7BwzZySM5BhL+LrpwWXI
	IUTK4auSwp+xJko9RKIarR8RXVgSK95/fWf2RC0=
X-Google-Smtp-Source: AKy350Z26GkXS7EB48c1nh5asmbihpDAv+vb/MtwOhrJ2+miK2MNWB6OYuHOW6SdgfhibgyuEHdbkoCSBkyZqtlfWzw=
X-Received: by 2002:ac2:428b:0:b0:4d5:ca32:7bc5 with SMTP id
 m11-20020ac2428b000000b004d5ca327bc5mr7266268lfh.12.1680206854602; Thu, 30
 Mar 2023 13:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
 <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com> <CA+cAkerB9D=iztBn_VQDPQyDZUp5rMtfj=CwuU4aeFL=RDERbQ@mail.gmail.com>
In-Reply-To: <CA+cAkerB9D=iztBn_VQDPQyDZUp5rMtfj=CwuU4aeFL=RDERbQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 30 Mar 2023 22:07:21 +0200
Message-ID: <CA+cAkeobeK=g_oGJvOsLEMDtcuBVwrFKuyU6gR-z1GmB+Sv2Qg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7c5cd05f823a47b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 20:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179355

--000000000000b7c5cd05f823a47b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

By the way, about this "chickens and eggs" problem, isn't it the same for a
regular recipe you just upgraded?

Personnaly, when I update a recipe, I let bitbake tell me what is the new
checksum expected and put it the recipe (as the error message says).

But I'm aware this is not exactly the same, since a cargo based recipe
could contain a ton of crate:// uri and if you apply this method, you have
to copy the new checksum one by one, bitbake error after another...

Don't know how to make this better and I plead guilty for not mentioning
that in a dedicated commit message.

Of course, if someone come up with a smoothier way of doing this, I'll make
a new patch.

Le jeu. 30 mars 2023, 21:50, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> a =C3=A9crit :

> Well I see what you mean, I'll take a look at your example to try to find
> out if multiple Cargo.lock could be expected.
>
> And for your second remark, yes, there is a chicken and eggs issue for
> updating crates checksum from scratch.
> You didn't miss anything, I came across this when updating crates checksu=
m
> that was "pristine"
>  and I only manage to execute update_crates by locally patching
> bitbake/lib/bb/fetch2/crate.py for
> recommends_checksum method to return False .
> I'm aware that is not ideal but I don't know how to make this better
> (maybe make do_update_crates
> after do_fetch instead of after do_patch ? )
>
>
> Le jeu. 30 mars 2023, 21:23, Martin Jansa <martin.jansa@gmail.com> a
> =C3=A9crit :
>
>> I don't remember the exact details now, but when I was working on
>> updating solana recipes to use this
>>
>> https://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee7=
9cc339d0770cd86b4
>>
>> the S was pointing to just some subdirectory and multiple Cargo.locks
>> files were parsed in other directories as well, that's why I was adding
>>
>> https://git.openembedded.org/openembedded-core/commit/meta/classes-recip=
e/cargo-update-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a874=
2a12d58
>>
>> in the end I've changed to use the root directory in S and just
>> set CARGO_SRC_DIR to right subdirectory to build.
>>
>> I don't have much experience with crates other than these solana recipes=
,
>> but isn't there some valid use-case for multiple Cargo.locks?
>> I assume Alex in original implementation didn't use the os.walk just to
>> make it more complicated :).
>>
>> And FWIW when trying to regenerate these .inc files with current master
>> and with:
>> $ bitbake -c update_crates solana-keygen
>> it fails with:
>> ERROR: solana-keygen-1.14.5-r0 do_fetch: No checksum specified for
>> '/OE/lge/build/webos/mickledore/downloads/Inflector-0.11.4.crate', pleas=
e
>> add at least one to the recipe:
>> SRC_URI[Inflector.sha256sum] =3D
>> "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
>> ERROR: solana-keygen-1.14.5-r0 do_fetch: Bitbake Fetcher Error:
>> NoChecksumError('Missing SRC_URI checksum', '
>> https://crates.io/api/v1/crates/Inflector/0.11.4/download')
>>
>> Isn't it an chicken&egg issue now when do_fetch enforces checksums to be
>> used? Or am I just missing some of the pending changes or just using it
>> incorrectly?
>>
>>
>> On Thu, Mar 30, 2023 at 6:34=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail=
.com>
>> wrote:
>>
>>> On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM <frederic.martinsons@gmail.com>=
 wrote:
>>> >
>>> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>>> >
>>> > There is no need to do such things, Cargo.lock file
>>> > has to be at the root of CARGO_LOCK_SRC_DIR.
>>> > This avoid finding other possible Cargo.lock that
>>> > would be in subdir (for example if a patch is applied
>>> > on the recipe, we can have .pc subdir in S and a Cargo.lock
>>> > can be there)
>>> >
>>> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
>>> > ---
>>> >  .../cargo-update-recipe-crates.bbclass               | 12 ++++++++--=
--
>>> >  1 file changed, 8 insertions(+), 4 deletions(-)
>>> >
>>> > diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> > index daa363b0dd..549cfe627e 100644
>>> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> > @@ -68,10 +68,14 @@ def get_crates(f):
>>> >  import os
>>> >  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\=
n"
>>> >  found =3D False
>>> > -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>>> > -    for file in files:
>>> > -        if file =3D=3D 'Cargo.lock':
>>> > -            crates +=3D get_crates(os.path.join(root, file))
>>> > +for file in os.listdir('${CARGO_LOCK_SRC_DIR}'):
>>> > +    if file =3D=3D 'Cargo.lock':
>>> > +        try:
>>> > +            cargo_lock_path =3D os.path.join('${CARGO_LOCK_SRC_DIR}'=
,
>>> file)
>>> > +            crates +=3D get_crates(cargo_lock_path)
>>> > +        except Exception as e:
>>> > +            raise ValueError("Cannot parse '%s'" % cargo_lock_path)
>>> from e
>>> > +        else:
>>> >              found =3D True
>>> >  if not found:
>>> >      raise ValueError("Unable to find Cargo.lock in
>>> ${CARGO_LOCK_SRC_DIR}")
>>>
>>> Isn't this just a long-winded version of something like this
>>> (completely untested):
>>>
>>> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> index daa363b0dd65..22ddcfa5c1e3 100644
>>> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>> @@ -67,14 +67,7 @@ def get_crates(f):
>>>
>>>  import os
>>>  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
>>> -found =3D False
>>> -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>>> -    for file in files:
>>> -        if file =3D=3D 'Cargo.lock':
>>> -            crates +=3D get_crates(os.path.join(root, file))
>>> -            found =3D True
>>> -if not found:
>>> -    raise ValueError("Unable to find Cargo.lock in
>>> ${CARGO_LOCK_SRC_DIR}")
>>> +crates +=3D get_crates(os.path.join("${CARGO_LOCK_SRC_DIR}",
>>> "Cargo.lock"))
>>>  open("${TARGET_FILE}", 'w').write(crates)
>>>  EOF
>>>
>>> --
>>> Alex Kiernan
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#179344):
>>> https://lists.openembedded.org/g/openembedded-core/message/179344
>>> Mute This Topic: https://lists.openembedded.org/mt/97953740/3617156
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> Martin.Jansa@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--000000000000b7c5cd05f823a47b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">By the way, about this &quot;chickens and eggs&quot; prob=
lem, isn&#39;t it the same for a regular recipe you just upgraded?=C2=A0<di=
v dir=3D"auto"><br></div><div dir=3D"auto">Personnaly, when I update a reci=
pe, I let bitbake tell me what is the new checksum expected and put it the =
recipe (as the error message says).</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">But I&#39;m aware this is not exactly the same, since a cargo b=
ased recipe could contain a ton of crate:// uri and if you apply this metho=
d, you have to copy the new checksum one by one, bitbake error after anothe=
r...=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Don&#39;t kno=
w how to make this better and I plead guilty for not mentioning that in a d=
edicated commit message.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Of course, if someone come up with a smoothier way of doing this, I&#39;ll=
 make a new patch.=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le jeu. 30 mars 2023, 21:50, Fr=C3=A9d=C3=A9r=
ic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com">frederic=
.martinsons@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"auto"><div>Well I see what you =
mean, I&#39;ll take a look at your example to try to find out if multiple C=
argo.lock could be expected.<div dir=3D"auto"><br></div><div dir=3D"auto">A=
nd for your second remark, yes, there is a chicken and eggs issue for updat=
ing crates checksum from scratch.</div><div dir=3D"auto">You didn&#39;t mis=
s anything, I came across this when updating crates checksum that was &quot=
;pristine&quot;</div><div dir=3D"auto">=C2=A0and I only manage to execute u=
pdate_crates by locally patching bitbake/lib/bb/fetch2/crate.py for</div><d=
iv dir=3D"auto">recommends_checksum method to return False .<br></div><div>=
I&#39;m aware that is not ideal but I don&#39;t know how to make this bette=
r (maybe make do_update_crates</div><div>after do_fetch instead of after do=
_patch ? )</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le jeu. 30 mars 2023, 21:23, Martin Jansa &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">martin.ja=
nsa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">I don&#39;t remember the exact details now, but whe=
n I was working on updating solana recipes to use this<div><a href=3D"https=
://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee79cc339d0=
770cd86b4" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/webosose/meta-webosose/commit/9bdfae7988077d0211eeee79cc339d0770cd86b4</=
a></div><div><br></div><div>the S was pointing to just some subdirectory an=
d multiple Cargo.locks files were parsed in other directories as well, that=
&#39;s why I was adding=C2=A0<br><div><a href=3D"https://git.openembedded.o=
rg/openembedded-core/commit/meta/classes-recipe/cargo-update-recipe-crates.=
bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742a12d58" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://git.openembedded.org/openembedded-core/=
commit/meta/classes-recipe/cargo-update-recipe-crates.bbclass?id=3D7636a2b8=
080521ed2ad54b0edce47a8742a12d58</a><br></div><div><br></div><div>in the en=
d I&#39;ve changed to use the root directory in S and just set=C2=A0CARGO_S=
RC_DIR to right subdirectory to build.</div><div><br></div><div>I don&#39;t=
 have much experience with crates other than these solana recipes, but isn&=
#39;t there some valid use-case for multiple Cargo.locks?</div><div>I assum=
e Alex in original implementation didn&#39;t use the os.walk just to make i=
t more complicated :).</div><div><br></div><div>And FWIW when trying to reg=
enerate these .inc files with current master and with:</div><div>$ bitbake =
-c update_crates solana-keygen<br></div><div>it fails with:</div><div>ERROR=
: solana-keygen-1.14.5-r0 do_fetch: No checksum specified for &#39;/OE/lge/=
build/webos/mickledore/downloads/Inflector-0.11.4.crate&#39;, please add at=
 least one to the recipe:<br>SRC_URI[Inflector.sha256sum] =3D &quot;fe438c6=
3458706e03479442743baae6c88256498e6431708f6dfc520a26515d3&quot;<br>ERROR: s=
olana-keygen-1.14.5-r0 do_fetch: Bitbake Fetcher Error: NoChecksumError(&#3=
9;Missing SRC_URI checksum&#39;, &#39;<a href=3D"https://crates.io/api/v1/c=
rates/Inflector/0.11.4/download" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://crates.io/api/v1/crates/Inflector/0.11.4/download</a>&#39;)<b=
r></div><div><br></div><div>Isn&#39;t it an chicken&amp;egg issue now when =
do_fetch enforces checksums to be used? Or am I just missing some of the pe=
nding changes or just using it incorrectly?</div><div>=C2=A0</div></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Mar 30, 2023 at 6:34=E2=80=AFPM Alex Kiernan &lt;<a href=3D"mailto:ale=
x.kiernan@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">alex.k=
iernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM &lt;<a href=3D"mail=
to:frederic.martinsons@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_=
blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">frederic.martinson=
s@gmail.com</a>&gt;<br>
&gt;<br>
&gt; There is no need to do such things, Cargo.lock file<br>
&gt; has to be at the root of CARGO_LOCK_SRC_DIR.<br>
&gt; This avoid finding other possible Cargo.lock that<br>
&gt; would be in subdir (for example if a patch is applied<br>
&gt; on the recipe, we can have .pc subdir in S and a Cargo.lock<br>
&gt; can be there)<br>
&gt;<br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">frederic.=
martinsons@gmail.com</a>&gt;<br>
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
enembedded-core/message/179344" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
179344</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97953740/3617=
156" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/mt/97953740/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Mart=
in.Jansa@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">Martin.=
Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div></div>
</div>
</blockquote></div>

--000000000000b7c5cd05f823a47b--

