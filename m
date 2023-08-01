Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF41EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:02:59 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.8505.1690880569879051977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IUtQGNcf;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso8544675e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690880568; x=1691485368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/AiVYECahu2EbZGhnegksXhsnBIZPn+RhSHcYcyQio0=;
        b=IUtQGNcfrZlOO2B9WP7uUv61zGhD5T/O6tzn+HIRsJjW79P9J1mqM91BbglnxCHGmr
         6QO7VpwRcl5WfmrBj+1T+fF86Ugf01pGr7Sst3rDYnMn/eziqgOYvskcEkg7CQ3Y50V3
         3t3658mc57xiWGUW3UCzUxF0+Lxb3sHZskuMBxMoFbtxOmq6Tv9MlVG0qJpvIWKUfGc3
         f7SRzkHXkX7G0IT8wMWaqbZhU9Pcd7+saOlDQk/G+IRS/zSruI/VdGIc6TwkNbdV+1Lh
         tA088l62SJgFXrz83NWYgU6qGYAv1VdOeVYZP9u+lAcpeeO59hjSFigEIXPCa+48EZ3F
         4LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880568; x=1691485368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AiVYECahu2EbZGhnegksXhsnBIZPn+RhSHcYcyQio0=;
        b=M1ZYw4gEepXMfsG0gth9BghlDV4z+2zugGJ9lhn68vwuy7SUKTGx06YB5C1asmlHzQ
         64B8VuceErk8VnZ/phuGBiS2KKrqBPBZBazxxyF3kBdAuv0bog6yBg7Efhsnk2ITHKC0
         uHUxRRa8wih5ckWlU/igwvEecHlC0MGtXH73mjQZ6oxe+g7B5ikQ3iOeThWVFFQ7CHvp
         2t1SOIWwixO5zHlo57k9WN+XBhBZmKLky5u4A6WXOrArtBrVbvrqmkEeqJdnBMa6YAAd
         Gx2xdEWwdwMxAP+OCk/80YVyNfP671xaz3L3HFk0pDvOdngbBzBVWv3eQluDkkE87top
         WvLA==
X-Gm-Message-State: ABy/qLby+zILwzx7x/awWIgVc1T4rIOw0UbU3sVstpVcnU27vugoO9kF
	CL66iqeK11wwB4P2LLkNnHUwVTN1yo7TZsZYNjvWfS0p
X-Google-Smtp-Source: APBJJlGVUgHP9YnK1dozcvy8GQtSTSn62DkM3aeTgxd1eshZD9XeMKDByJzIMpTFrNOg4J85coyqZNB5o509QJHnGF0=
X-Received: by 2002:a19:9159:0:b0:4fb:8ff3:1f72 with SMTP id
 y25-20020a199159000000b004fb8ff31f72mr1647762lfj.1.1690880567720; Tue, 01 Aug
 2023 02:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <3553fa6951145c0504e272b0c57eecbf109e7488.1690795930.git.frederic.martinsons@gmail.com>
 <bf9c75ff0f54303fdf56c48b79c4d0084303f05a.camel@linuxfoundation.org>
In-Reply-To: <bf9c75ff0f54303fdf56c48b79c4d0084303f05a.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 1 Aug 2023 11:02:36 +0200
Message-ID: <CA+cAkeoDH9HGrSnCqz09cQijWzk5de53+3bez7JA05cXTU203A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] cargo_common.bbclass: Handle Cargo.lock
 modifications for git dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="00000000000098be190601d8cf5a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185217

--00000000000098be190601d8cf5a
Content-Type: text/plain; charset="UTF-8"

Thank you for the tips, will work on a v2 implementing that you suggested

On Tue, 1 Aug 2023 at 10:44, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2023-07-31 at 11:44 +0200, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > Now we use --frozen, Cargo.lock cannot be modified by cargo build.
> > These patched git dependencies requires that the git url is removed
> > from Cargo.lock.
> >
> > Fixes #15104
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  meta/classes-recipe/cargo_common.bbclass | 40 ++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/meta/classes-recipe/cargo_common.bbclass
> b/meta/classes-recipe/cargo_common.bbclass
> > index db54826ddb..01afb74640 100644
> > --- a/meta/classes-recipe/cargo_common.bbclass
> > +++ b/meta/classes-recipe/cargo_common.bbclass
> > @@ -117,6 +117,8 @@ cargo_common_do_configure () {
> >  }
> >
> >  python cargo_common_do_patch_paths() {
> > +    import shutil
> > +
> >      cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config")
> >      if not os.path.exists(cargo_config):
> >          return
> > @@ -146,6 +148,44 @@ python cargo_common_do_patch_paths() {
> >              print('\n[patch."%s"]' % k, file=config)
> >              for name in v:
> >                  print(name, file=config)
> > +
> > +    if not patches:
> > +        return
> > +
> > +    # Cargo.lock file is needed for to be sure that artifacts
> > +    # downloaded by the fetch steps are those expected by the
> > +    # project and that the possible patches are correctly applied.
> > +    # Moreover since we do not want any modification
> > +    # of this file (for reproducibility purpose), we prevent it by
> > +    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
> > +    # here is better than letting cargo tell (in case the file is
> missing)
> > +    # "Cargo.lock should be modified but --frozen was given"
> > +
> > +    manifest_path = d.getVar("MANIFEST_PATH", True)
> > +    lockfile = os.path.join(os.path.dirname(manifest_path),
> "Cargo.lock")
> > +    if not os.path.exists(lockfile):
> > +        bb.fatal(f"{lockfile} file doesn't exist")
> > +
> > +    # There are patched files and so Cargo.lock should be modified but
> we use
> > +    # --frozen so let's handle that modifications here.
> > +    #
> > +    # Note that a "better" (more elegant ?) would have been to use
> cargo update for
> > +    # patched packages:
> > +    #  cargo update --offline -p package_1 -p package_2
> > +    # But this is not possible since it requires that cargo local git db
> > +    # to be populated and this is not the case as we fetch git repo
> ourself.
> > +
> > +    newlines = []
> > +    with open(lockfile, "r") as f:
> > +        for line in f.readlines():
> > +            if not line.startswith("source = \"git"):
> > +                newlines.append(line)
> > +
> > +    lockfile_mod = lockfile + ".new"
> > +    with open(lockfile_mod, "w") as f:
> > +        f.writelines(newlines)
> > +
> > +    shutil.move(lockfile_mod, lockfile)
> >  }
> >  do_configure[postfuncs] += "cargo_common_do_patch_paths"
>
> This patch isn't "wrong" but there are some tips we've picked up over
> the years of doing this which might help things in the future.
>
> Some questions:
>
> What happens if we run the cargo_common_do_patch_paths function
> multiple times?
> What happens if the user hits Ctrl+C at an inopportune moment?
>
> In this case the function is mostly ok but it might easily change in
> the future to something that isn't.
>
> The best practise we've come to is the pattern of firstly copy X to
> X.orig if X.orig doesn't exist. This ensures you always start from a
> pristine backup. You can then directly open and write to X reading from
> X.orig.
>
> This ensures that both of the questions I ask above become non-issues.
>
> I'm know I'm being a little picky by mentioning this but I do want to
> raise awareness of the better pattern in general and make sure that
> examples in the class code are good as people will copy them!
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
>
>

--00000000000098be190601d8cf5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the tips, will work on a v2 implementing tha=
t you suggested</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 1 Aug 2023 at 10:44, Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, 2023-07-31 at 11:44 +0200, Frederic Martinsons wrote:<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Now we use --frozen, Cargo.lock cannot be modified by cargo build.<br>
&gt; These patched git dependencies requires that the git url is removed<br=
>
&gt; from Cargo.lock.<br>
&gt; <br>
&gt; Fixes #15104<br>
&gt; <br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/cargo_common.bbclass | 40 ++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 40 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-r=
ecipe/cargo_common.bbclass<br>
&gt; index db54826ddb..01afb74640 100644<br>
&gt; --- a/meta/classes-recipe/cargo_common.bbclass<br>
&gt; +++ b/meta/classes-recipe/cargo_common.bbclass<br>
&gt; @@ -117,6 +117,8 @@ cargo_common_do_configure () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 python cargo_common_do_patch_paths() {<br>
&gt; +=C2=A0 =C2=A0 import shutil<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cargo_config =3D os.path.join(d.getVar(&quot;CARGO=
_HOME&quot;), &quot;config&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not os.path.exists(cargo_config):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; @@ -146,6 +148,44 @@ python cargo_common_do_patch_paths() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;\n[patch.&q=
uot;%s&quot;]&#39; % k, file=3Dconfig)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in v:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(na=
me, file=3Dconfig)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if not patches:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Cargo.lock file is needed for to be sure that artifac=
ts<br>
&gt; +=C2=A0 =C2=A0 # downloaded by the fetch steps are those expected by t=
he<br>
&gt; +=C2=A0 =C2=A0 # project and that the possible patches are correctly a=
pplied.<br>
&gt; +=C2=A0 =C2=A0 # Moreover since we do not want any modification<br>
&gt; +=C2=A0 =C2=A0 # of this file (for reproducibility purpose), we preven=
t it by<br>
&gt; +=C2=A0 =C2=A0 # using --frozen flag (in CARGO_BUILD_FLAGS) and raise =
a clear error<br>
&gt; +=C2=A0 =C2=A0 # here is better than letting cargo tell (in case the f=
ile is missing)<br>
&gt; +=C2=A0 =C2=A0 # &quot;Cargo.lock should be modified but --frozen was =
given&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 manifest_path =3D d.getVar(&quot;MANIFEST_PATH&quot;, T=
rue)<br>
&gt; +=C2=A0 =C2=A0 lockfile =3D os.path.join(os.path.dirname(manifest_path=
), &quot;Cargo.lock&quot;)<br>
&gt; +=C2=A0 =C2=A0 if not os.path.exists(lockfile):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&quot;{lockfile} file doesn&#39=
;t exist&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # There are patched files and so Cargo.lock should be m=
odified but we use<br>
&gt; +=C2=A0 =C2=A0 # --frozen so let&#39;s handle that modifications here.=
<br>
&gt; +=C2=A0 =C2=A0 #<br>
&gt; +=C2=A0 =C2=A0 # Note that a &quot;better&quot; (more elegant ?) would=
 have been to use cargo update for<br>
&gt; +=C2=A0 =C2=A0 # patched packages:<br>
&gt; +=C2=A0 =C2=A0 #=C2=A0 cargo update --offline -p package_1 -p package_=
2<br>
&gt; +=C2=A0 =C2=A0 # But this is not possible since it requires that cargo=
 local git db<br>
&gt; +=C2=A0 =C2=A0 # to be populated and this is not the case as we fetch =
git repo ourself.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 newlines =3D []<br>
&gt; +=C2=A0 =C2=A0 with open(lockfile, &quot;r&quot;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f.readlines():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not line.startswith(&quo=
t;source =3D \&quot;git&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newlines.appe=
nd(line)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 lockfile_mod =3D lockfile + &quot;.new&quot;<br>
&gt; +=C2=A0 =C2=A0 with open(lockfile_mod, &quot;w&quot;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.writelines(newlines)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 shutil.move(lockfile_mod, lockfile)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 do_configure[postfuncs] +=3D &quot;cargo_common_do_patch_paths&q=
uot;<br>
<br>
This patch isn&#39;t &quot;wrong&quot; but there are some tips we&#39;ve pi=
cked up over<br>
the years of doing this which might help things in the future.<br>
<br>
Some questions:<br>
<br>
What happens if we run the cargo_common_do_patch_paths function<br>
multiple times?<br>
What happens if the user hits Ctrl+C at an inopportune moment?<br>
<br>
In this case the function is mostly ok but it might easily change in<br>
the future to something that isn&#39;t.<br>
<br>
The best practise we&#39;ve come to is the pattern of firstly copy X to<br>
X.orig if X.orig doesn&#39;t exist. This ensures you always start from a<br=
>
pristine backup. You can then directly open and write to X reading from<br>
X.orig.<br>
<br>
This ensures that both of the questions I ask above become non-issues.<br>
<br>
I&#39;m know I&#39;m being a little picky by mentioning this but I do want =
to<br>
raise awareness of the better pattern in general and make sure that<br>
examples in the class code are good as people will copy them!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000098be190601d8cf5a--

