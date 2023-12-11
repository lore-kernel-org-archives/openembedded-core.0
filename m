Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C742C10DC3
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 07:08:21 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.3032.1702278492116905799
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 23:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eNrpadGs;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1eb39505ba4so2517541fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 23:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702278491; x=1702883291; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NnCNW5eC0PsDwvX5g5rz22rBWuDVNlLJdTBoRbjgtHo=;
        b=eNrpadGsxcxIK7WauR+MB+gliHTVYL+W0W11CNx7wYenvEWKfMLqgbNXIdgx8iBwuF
         O33/qMeSKQ8MZv8AKNk+ArTVRYIyTjhsJSpIS1u2SXQ9OEGrIowQL16Fhe9U74cfjg6O
         rBE32CeAvmeHJRIudX2SK+Etxu4RGWycKbEW9dAsyRT+T2Mgtf+VfgIydzutM5oJkAVE
         kNncpVNO07uXCGgULbryFPSkKXsH4F3kAenvVVfWgm8woD+7gs0jczgOxxV0Ip6GCMjU
         dTI5/sabUUaH7yS8r5a6BVk5GsyP8UvX5SvLu2bbrxZygDLHoSURUKCJepJ9QK+wru9a
         x5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702278491; x=1702883291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnCNW5eC0PsDwvX5g5rz22rBWuDVNlLJdTBoRbjgtHo=;
        b=IH7TLu50HXwNDQ4gRhJXGZgT56Vs10vKy+6YekZtnxkwBusTTNnEzhhFbVCQuw3fYN
         83XPMhgvGF+4NUE8Z9u/ulZ0rhHgr4VBVLlMGLW8rOgn61abujOB3Z1n7o1tytVq3pEb
         353lWJ130MSxphzKWc2aWZTF2T8VKaWGS0cjiTOstV10jwDsUJflFNT2ypSFgu7wiJB6
         9JGBYXAS3hl5n3CHbtEO+LckCE+LtcgYYHt0qoI5EvlmJ9MJafGPYHTWgyLFfjpXBhvQ
         q0Y4X5MmWfO+5mlMZA7oKE0cU914WXeHQ8JE6u0sTaEQmABjabw6FVpJIrBjYeY+lkxy
         lXIQ==
X-Gm-Message-State: AOJu0YzTSbmQUR9dGG2LrRYN07uH5A5/yEwXjgNRcMmtVMyZJFyN227Q
	dBnM06H9Dc2fNyE0viadk/WCskAvxWodRDuCMwA=
X-Google-Smtp-Source: AGHT+IFCsFUdY7SeRo71wK0/m4kmPsMs+5cC15ZEkBZ0bMtAXvCODmPzHVh4HPu8az0IlsngeNVBdgC5HqkuToYW2Uo=
X-Received: by 2002:a05:6870:610d:b0:1fb:75b:99a2 with SMTP id
 s13-20020a056870610d00b001fb075b99a2mr5367683oae.81.1702278491227; Sun, 10
 Dec 2023 23:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20231210191046.4785-1-alex.kiernan@gmail.com> <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
In-Reply-To: <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 11 Dec 2023 08:08:00 +0100
Message-ID: <CA+cAkeqCf846si8G44bTgAehcK=+aS_emj_9ut241Z3DrqAd1Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c74a66060c369845"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192143

--000000000000c74a66060c369845
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Dec 2023 at 21:35, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

>  I have to say, I struggle to see this as an improvement, and I want
> to object to it.
>
> Why set the path manually, if the code to find where Cargo.lock is
> just works, and handles the situations where upstreams move it around
> in source trees?
>
> Also, is the assumption that there's only one Cargo.lock valid? I'm
> not so sure. Note that the code was specifically written to pull in
> items from multiple files.
>

I think the assumption of a single Cargo.lock is valid.

For workspace project (so project which generate multiple artifacts) , it
is explicitly
said: "A workspace is a set of packages that share the same Cargo.lock and
output directory"
(taken from https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html)

And the FAQ (
https://doc.rust-lang.org/cargo/guide/cargo-toml-vs-cargo-lock.html) doesn't
mention Cargo.lock in plural.



> Have you tested this change on all recipes in core and meta-oe that
> use the class?
>
> Alex
>
> On Sun, 10 Dec 2023 at 20:10, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Rather than searching for Cargo.lock, just use CARGO_LOCK_PATH, since we
> > have to know where the lock file is, else cargo_common_do_patch_paths
> > will fail. There should only ever be one lock file associated with a
> > project, so trying to aggregate across all of them makes no sense.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  .../cargo-update-recipe-crates.bbclass        | 30 +++++--------------
> >  1 file changed, 8 insertions(+), 22 deletions(-)
> >
> > diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > index 8980137d02cf..59415ee8cb45 100644
> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > @@ -4,6 +4,8 @@
> >  # SPDX-License-Identifier: MIT
> >  #
> >
> > +inherit cargo_common
> > +
> >  ##
> >  ## Purpose:
> >  ## This class is used to update the list of crates in SRC_URI
> > @@ -18,9 +20,6 @@ do_update_crates[depends] =
> "python3-native:do_populate_sysroot"
> >  do_update_crates[nostamp] = "1"
> >  do_update_crates[doc] = "Update the recipe by reading Cargo.lock and
> write in ${THISDIR}/${BPN}-crates.inc"
> >
> > -# The directory where to search for Cargo.lock files
> > -CARGO_LOCK_SRC_DIR ??= "${S}"
> > -
> >  do_update_crates() {
> >      TARGET_FILE="${THISDIR}/${BPN}-crates.inc"
> >
> > @@ -28,8 +27,7 @@ do_update_crates() {
> >
> >  def get_crates(f):
> >      import tomllib
> > -    c_list = '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
> > -    c_list += '\nSRC_URI += " \\\'
> > +    c_list = 'SRC_URI += " \\\'
> >      crates = tomllib.load(open(f, 'rb'))
> >
> >      # Build a list with crates info that have crates.io in the source
> > @@ -55,23 +53,11 @@ def get_crates(f):
> >  import os
> >  crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
> >  found = False
> > -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
> > -    # ignore git and patches directories
> > -    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
> > -        continue
> > -    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
> > -        continue
> > -    for file in files:
> > -        if file == 'Cargo.lock':
> > -            try:
> > -                cargo_lock_path = os.path.join(root, file)
> > -                crates += get_crates(os.path.join(root, file))
> > -            except Exception as e:
> > -                raise ValueError("Cannot parse '%s'" % cargo_lock_path)
> from e
> > -            else:
> > -                found = True
> > -if not found:
> > -    raise ValueError("Unable to find any Cargo.lock in
> ${CARGO_LOCK_SRC_DIR}")
> > +try:
> > +    cargo_lock_path = '${CARGO_LOCK_PATH}'
> > +    crates += get_crates(cargo_lock_path)
> > +except Exception as e:
> > +    raise ValueError("Cannot parse '%s'" % cargo_lock_path) from e
> >  open("${TARGET_FILE}", 'w').write(crates)
> >  EOF
> >
> > --
> > 2.39.0
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192126):
> https://lists.openembedded.org/g/openembedded-core/message/192126
> Mute This Topic: https://lists.openembedded.org/mt/103094777/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c74a66060c369845
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 10 Dec 2023 at 21:35, Alexand=
er Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">=C2=A0I have to say, I struggle to see this as an improvement, and I wa=
nt<br>
to object to it.<br>
<br>
Why set the path manually, if the code to find where Cargo.lock is<br>
just works, and handles the situations where upstreams move it around<br>
in source trees?<br>
<br>
Also, is the assumption that there&#39;s only one Cargo.lock valid? I&#39;m=
<br>
not so sure. Note that the code was specifically written to pull in<br>
items from multiple files.<br></blockquote><div><br></div><div>I think the =
assumption of a single Cargo.lock is valid.</div><div><br></div><div>For wo=
rkspace project (so project which generate multiple=C2=A0artifacts) , it is=
 explicitly</div><div>said: &quot;A workspace is a set of packages that sha=
re the same Cargo.lock and output directory&quot;</div><div>(taken from=C2=
=A0<a href=3D"https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html"=
>https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html</a>)</div><di=
v><br></div><div>And the FAQ (<a href=3D"https://doc.rust-lang.org/cargo/gu=
ide/cargo-toml-vs-cargo-lock.html">https://doc.rust-lang.org/cargo/guide/ca=
rgo-toml-vs-cargo-lock.html</a>) doesn&#39;t</div><div>mention Cargo.lock i=
n plural.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Have you tested this change on all recipes in core and meta-oe that<br>
use the class?<br>
<br>
Alex<br>
<br>
On Sun, 10 Dec 2023 at 20:10, Alex Kiernan &lt;<a href=3D"mailto:alex.kiern=
an@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Rather than searching for Cargo.lock, just use CARGO_LOCK_PATH, since =
we<br>
&gt; have to know where the lock file is, else cargo_common_do_patch_paths<=
br>
&gt; will fail. There should only ever be one lock file associated with a<b=
r>
&gt; project, so trying to aggregate across all of them makes no sense.<br>
&gt;<br>
&gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.c=
om" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt;=C2=A0 .../cargo-update-recipe-crates.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 30 +++++--------------<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 22 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/=
meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; index 8980137d02cf..59415ee8cb45 100644<br>
&gt; --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; @@ -4,6 +4,8 @@<br>
&gt;=C2=A0 # SPDX-License-Identifier: MIT<br>
&gt;=C2=A0 #<br>
&gt;<br>
&gt; +inherit cargo_common<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 ## Purpose:<br>
&gt;=C2=A0 ## This class is used to update the list of crates in SRC_URI<br=
>
&gt; @@ -18,9 +20,6 @@ do_update_crates[depends] =3D &quot;python3-native:d=
o_populate_sysroot&quot;<br>
&gt;=C2=A0 do_update_crates[nostamp] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_update_crates[doc] =3D &quot;Update the recipe by reading Car=
go.lock and write in ${THISDIR}/${BPN}-crates.inc&quot;<br>
&gt;<br>
&gt; -# The directory where to search for Cargo.lock files<br>
&gt; -CARGO_LOCK_SRC_DIR ??=3D &quot;${S}&quot;<br>
&gt; -<br>
&gt;=C2=A0 do_update_crates() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TARGET_FILE=3D&quot;${THISDIR}/${BPN}-crates.inc&q=
uot;<br>
&gt;<br>
&gt; @@ -28,8 +27,7 @@ do_update_crates() {<br>
&gt;<br>
&gt;=C2=A0 def get_crates(f):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import tomllib<br>
&gt; -=C2=A0 =C2=A0 c_list =3D &#39;# from %s&#39; % os.path.relpath(f, &#3=
9;${CARGO_LOCK_SRC_DIR}&#39;)<br>
&gt; -=C2=A0 =C2=A0 c_list +=3D &#39;\nSRC_URI +=3D &quot; \\\&#39;<br>
&gt; +=C2=A0 =C2=A0 c_list =3D &#39;SRC_URI +=3D &quot; \\\&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crates =3D tomllib.load(open(f, &#39;rb&#39;))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Build a list with crates info that have <a href=
=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blank">crates.io</a> in=
 the source<br>
&gt; @@ -55,23 +53,11 @@ def get_crates(f):<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 crates =3D &quot;# Autogenerated with &#39;bitbake -c update_cra=
tes ${PN}&#39;\n\n&quot;<br>
&gt;=C2=A0 found =3D False<br>
&gt; -for root, dirs, files in os.walk(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br=
>
&gt; -=C2=A0 =C2=A0 # ignore git and patches directories<br>
&gt; -=C2=A0 =C2=A0 if root.startswith(os.path.join(&#39;${CARGO_LOCK_SRC_D=
IR}&#39;, &#39;.pc&#39;)):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 if root.startswith(os.path.join(&#39;${CARGO_LOCK_SRC_D=
IR}&#39;, &#39;.git&#39;)):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 for file in files:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if file =3D=3D &#39;Cargo.lock&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_lock_pa=
th =3D os.path.join(root, file)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crates +=3D g=
et_crates(os.path.join(root, file))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueEr=
ror(&quot;Cannot parse &#39;%s&#39;&quot; % cargo_lock_path) from e<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D Tru=
e<br>
&gt; -if not found:<br>
&gt; -=C2=A0 =C2=A0 raise ValueError(&quot;Unable to find any Cargo.lock in=
 ${CARGO_LOCK_SRC_DIR}&quot;)<br>
&gt; +try:<br>
&gt; +=C2=A0 =C2=A0 cargo_lock_path =3D &#39;${CARGO_LOCK_PATH}&#39;<br>
&gt; +=C2=A0 =C2=A0 crates +=3D get_crates(cargo_lock_path)<br>
&gt; +except Exception as e:<br>
&gt; +=C2=A0 =C2=A0 raise ValueError(&quot;Cannot parse &#39;%s&#39;&quot; =
% cargo_lock_path) from e<br>
&gt;=C2=A0 open(&quot;${TARGET_FILE}&quot;, &#39;w&#39;).write(crates)<br>
&gt;=C2=A0 EOF<br>
&gt;<br>
&gt; --<br>
&gt; 2.39.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192126): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192126" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192126</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103094777/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103094777/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c74a66060c369845--

