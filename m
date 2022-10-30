Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B77ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 18:35:45 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.814.1667154940866553427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 11:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=itCg2ty/;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id d25so15769315lfb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 11:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFcP6ziIdvoQxooKNGBBCFYKoDNflnn0GLiIXoLYRkE=;
        b=itCg2ty/fIbbAu2dwHz3nnlP2tTHfoyE5DPHPZoVzXdJ7UJSFRy8z1KzpTs+DydE+Q
         x2nNrnTfMdXrRh+LE5kNXeAsBjupD9oDhPzrbYWoIvK7CCc9TeLKveFiiBlnJ0+t2O6R
         MmpWNs5qY34AS/G5kKhEE4/tlNMQYcUMAIkcrtDSGiRust4cLLoSbEX+GT2KonrJ79+p
         2K250Eh7F6lQ8RN5koFVreQJzT0ttvAivT2Lq9m/vy2vEdM4VTM7d3wjSCxOtelZpdNK
         Vi/oNaMpCWRoDfNpMmRnZ0kBcEM/QMeX3R8XI+T1qECd7J1IwbUr84KGa/QoV4xSnbFQ
         9L4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFcP6ziIdvoQxooKNGBBCFYKoDNflnn0GLiIXoLYRkE=;
        b=wUep/dXmHvfCAKBHbIE0F6O2L0tUngp9x21GY8mUCkWxI7P4073yjB5WCFqCqk59KY
         VYPuCzrOCCgwNJovdpQEclbtzPRXzelkwqQ/Qr7k6kNkBQZxz7DmXQFSL8nAk6tzix5b
         dakqDts8Mjvm0q8NmYNA4JQxeL5gD6+JIQrTpJR9cZ73q6fxeWuzJkErwEiYMCnI8vL0
         yUoPBKooZKeapLkinwsovRv5w4WHd4N7nZhKqM4UgzxrxTCK6mridN3cHaTTELn/q8tH
         w+iGNIjWuzhnQG+qJzg1lmOtKQTrWaFKSxIiCTG2xPaBjZ4164ahigncXjSCNepeHCcZ
         8w8g==
X-Gm-Message-State: ACrzQf3iN0r3uWdFgUcw06w0VFk/BgsFXZ1vpRsbwDU/P2sAPWX5s/P6
	DsQ4mCpx4ZnhUQ6pygXV3uQ9FLlbowDIEv4V7c8=
X-Google-Smtp-Source: AMsMyM5oPhZYrxKUneGgl+ArchttyvXc5x2I9jrbx4kAvLolDv2cEisQJDxTI1t56CwAP8yNkJ+AdIc6pC1uP0wTdUY=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr3749556lfl.367.1667154938727; Sun, 30
 Oct 2022 11:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221030173815.10212-1-alex.kiernan@gmail.com>
 <20221030173815.10212-2-alex.kiernan@gmail.com> <CANNYZj_VyT8xSFF=un1cF_4PugEOhuP-hkN3K66XOc_MvbAV6g@mail.gmail.com>
 <CAO5Uq5TkQtPoGV4NETup9NSVf+ybewXhi=YzoSQ4t2GTpDhecA@mail.gmail.com>
In-Reply-To: <CAO5Uq5TkQtPoGV4NETup9NSVf+ybewXhi=YzoSQ4t2GTpDhecA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Oct 2022 19:35:27 +0100
Message-ID: <CANNYZj_e632YO2XqXccYq65HQi_1_Musu=X7ybFqLYv+a7gEvQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] cargo_common.bbclass: Support local github repos
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e892f005ec44c191"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 18:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172287

--000000000000e892f005ec44c191
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It would also help if there=E2=80=99s an actual recipe and component somewh=
ere
where the problem exists now. The uuid-test does look like a made up
example.

Let=E2=80=99s merge the crate updater to core first, then we can think of h=
andling
other ways to specify dependencies. =E2=80=98cargo bitbake=E2=80=99 is pret=
ty broken and
dead.

Alex

On Sun 30. Oct 2022 at 19.12, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> I was wondering about how to do that - my test case was
> https://github.com/akiernan/uuid-test, but that's clearly not
> adequate; the recipe there comes from `cargo bitbake` as `bitbake -c
> update_crates` doesn't deal with git dependencies, or dig down into
> transitive deps, which also needs solving.
>
> I'm not clear if something like this could be added as part of the
> stuff that's in master-next for rust tests? Or if we need to build out
> something new.
>
> On Sun, Oct 30, 2022 at 5:58 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > There doesn=E2=80=99t seem to be a test case or an example for this. Ho=
w can we
> ensure the code is correct?
> >
> > Alex
> >
> > On Sun 30. Oct 2022 at 18.38, Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >>
> >> Since disable network was added cargo configurations which reference g=
it
> >> repos fail as they attempt to fetch across the network as part of
> >> do_compile, even if EXTRA_OECARGO_PATHS to add them as part of `paths`
> >> is used, as this is documented as only working for packages which exis=
t
> >> in crates.io.
> >>
> >> Add parsing of the SRC_URIs for git repos and include `[patch]` sectio=
ns
> >> to redirect to the checked out source repos which the bitbake fetcher
> >> has already populated.
> >>
> >> There are still cases which don't work - if you have multiple copies o=
f
> >> the same repo with different revisions, there's currently no way to
> >> represent that and anything using a repo which has a virtual manifest
> >> will fail to build (see https://github.com/rust-lang/cargo/issues/4934
> ).
> >>
> >> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >> ---
> >>  meta/classes-recipe/cargo_common.bbclass | 30 +++++++++++++++++++++++=
+
> >>  1 file changed, 30 insertions(+)
> >>
> >> diff --git a/meta/classes-recipe/cargo_common.bbclass
> b/meta/classes-recipe/cargo_common.bbclass
> >> index f503a001dd8e..63b13829084b 100644
> >> --- a/meta/classes-recipe/cargo_common.bbclass
> >> +++ b/meta/classes-recipe/cargo_common.bbclass
> >> @@ -116,6 +116,36 @@ cargo_common_do_configure () {
> >>         EOF
> >>  }
> >>
> >> +python cargo_common_do_patch_paths() {
> >> +    cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config")
> >> +    if not os.path.exists(cargo_config):
> >> +        return
> >> +
> >> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
> >> +    if len(src_uri) =3D=3D 0:
> >> +        return
> >> +
> >> +    patches =3D dict()
> >> +    workdir =3D d.getVar('WORKDIR')
> >> +    fetcher =3D bb.fetch2.Fetch(src_uri, d)
> >> +    for url in fetcher.urls:
> >> +        ud =3D fetcher.ud[url]
> >> +        if ud.type =3D=3D 'git':
> >> +            name =3D ud.parm.get('name')
> >> +            destsuffix =3D ud.parm.get('destsuffix')
> >> +            if name is not None and destsuffix is not None:
> >> +                repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
> >> +                path =3D '%s =3D { path =3D "%s" }' % (name,
> os.path.join(workdir, destsuffix))
> >> +                patches.setdefault(repo, []).append(path)
> >> +
> >> +    with open(cargo_config, "a+") as config:
> >> +        for k, v in patches.items():
> >> +            print('\n[patch."%s"]' % k, file=3Dconfig)
> >> +            for name in v:
> >> +                print(name, file=3Dconfig)
> >> +}
> >> +do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"
> >> +
> >>  oe_cargo_fix_env () {
> >>         export CC=3D"${RUST_TARGET_CC}"
> >>         export CXX=3D"${RUST_TARGET_CXX}"
> >> --
> >> 2.35.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#172284):
> https://lists.openembedded.org/g/openembedded-core/message/172284
> >> Mute This Topic: https://lists.openembedded.org/mt/94668827/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>
> --
> Alex Kiernan
>

--000000000000e892f005ec44c191
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">It would also help if there=E2=80=99s an actual reci=
pe and component somewhere where the problem exists now. The uuid-test does=
 look like a made up example.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Let=E2=80=99s merge the crate updater to core first, then we can thin=
k of handling other ways to specify dependencies. =E2=80=98cargo bitbake=E2=
=80=99 is pretty broken and dead.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div></div><div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun 30. Oct 2022 at 19.12, Alex Kiernan &l=
t;<a href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">I was wondering about =
how to do that - my test case was<br>
<a href=3D"https://github.com/akiernan/uuid-test" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/akiernan/uuid-test</a>, but that&#39;s clear=
ly not<br>
adequate; the recipe there comes from `cargo bitbake` as `bitbake -c<br>
update_crates` doesn&#39;t deal with git dependencies, or dig down into<br>
transitive deps, which also needs solving.<br>
<br>
I&#39;m not clear if something like this could be added as part of the<br>
stuff that&#39;s in master-next for rust tests? Or if we need to build out<=
br>
something new.<br>
<br>
On Sun, Oct 30, 2022 at 5:58 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; There doesn=E2=80=99t seem to be a test case or an example for this. H=
ow can we ensure the code is correct?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Sun 30. Oct 2022 at 18.38, Alex Kiernan &lt;<a href=3D"mailto:alex.=
kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; Since disable network was added cargo configurations which referen=
ce git<br>
&gt;&gt; repos fail as they attempt to fetch across the network as part of<=
br>
&gt;&gt; do_compile, even if EXTRA_OECARGO_PATHS to add them as part of `pa=
ths`<br>
&gt;&gt; is used, as this is documented as only working for packages which =
exist<br>
&gt;&gt; in <a href=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blan=
k">crates.io</a>.<br>
&gt;&gt;<br>
&gt;&gt; Add parsing of the SRC_URIs for git repos and include `[patch]` se=
ctions<br>
&gt;&gt; to redirect to the checked out source repos which the bitbake fetc=
her<br>
&gt;&gt; has already populated.<br>
&gt;&gt;<br>
&gt;&gt; There are still cases which don&#39;t work - if you have multiple =
copies of<br>
&gt;&gt; the same repo with different revisions, there&#39;s currently no w=
ay to<br>
&gt;&gt; represent that and anything using a repo which has a virtual manif=
est<br>
&gt;&gt; will fail to build (see <a href=3D"https://github.com/rust-lang/ca=
rgo/issues/4934" rel=3D"noreferrer" target=3D"_blank">https://github.com/ru=
st-lang/cargo/issues/4934</a>).<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gma=
il.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes-recipe/cargo_common.bbclass | 30 ++++++++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 1 file changed, 30 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/class=
es-recipe/cargo_common.bbclass<br>
&gt;&gt; index f503a001dd8e..63b13829084b 100644<br>
&gt;&gt; --- a/meta/classes-recipe/cargo_common.bbclass<br>
&gt;&gt; +++ b/meta/classes-recipe/cargo_common.bbclass<br>
&gt;&gt; @@ -116,6 +116,36 @@ cargo_common_do_configure () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EOF<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +python cargo_common_do_patch_paths() {<br>
&gt;&gt; +=C2=A0 =C2=A0 cargo_config =3D os.path.join(d.getVar(&quot;CARGO_=
HOME&quot;), &quot;config&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 if not os.path.exists(cargo_config):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 src_uri =3D (d.getVar(&#39;SRC_URI&#39;) or &quot;&=
quot;).split()<br>
&gt;&gt; +=C2=A0 =C2=A0 if len(src_uri) =3D=3D 0:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 patches =3D dict()<br>
&gt;&gt; +=C2=A0 =C2=A0 workdir =3D d.getVar(&#39;WORKDIR&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 fetcher =3D bb.fetch2.Fetch(src_uri, d)<br>
&gt;&gt; +=C2=A0 =C2=A0 for url in fetcher.urls:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ud =3D fetcher.ud[url]<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ud.type =3D=3D &#39;git&#39;:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D ud.parm.get(&#=
39;name&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destsuffix =3D ud.parm.=
get(&#39;destsuffix&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name is not None and=
 destsuffix is not None:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo =3D =
&#39;%s://%s%s&#39; % (ud.proto, ud.host, ud.path)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D =
&#39;%s =3D { path =3D &quot;%s&quot; }&#39; % (name, os.path.join(workdir,=
 destsuffix))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patches.s=
etdefault(repo, []).append(path)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 with open(cargo_config, &quot;a+&quot;) as config:<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in patches.items():<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;\n[patch.&qu=
ot;%s&quot;]&#39; % k, file=3Dconfig)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in v:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(nam=
e, file=3Dconfig)<br>
&gt;&gt; +}<br>
&gt;&gt; +do_configure[postfuncs] +=3D &quot;cargo_common_do_patch_paths&qu=
ot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 oe_cargo_fix_env () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CC=3D&quot;${RUST_TARGET_C=
C}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX=3D&quot;${RUST_TARGET_=
CXX}&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.35.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#172284): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/172284" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/172284</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9466=
8827/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/94668827/1686489</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div></div>
</div>

--000000000000e892f005ec44c191--

