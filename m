Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.18.1588019537759273407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 13:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KDKxwQC9;
 spf=pass (domain: gmail.com, ip: 209.85.210.67, mailfrom: krussell7711@gmail.com)
Received: by mail-ot1-f67.google.com with SMTP id g19so28644554otk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 13:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T2VM0kwHoFn1gaWQAg2wPBBbP6WC4qKdqInZZoS6G2E=;
        b=KDKxwQC9f6iyOt+iav7/VaYPkx4OUrmnsHvVGHldSShPVTbBqSxKmuD0NiPM1zkuyF
         ITmZzpj93z/LXqLGe7NQ2hPSJqfAEMNGsWHZHQ/lC00ySF0P8pll7N8lSedmDOMfvnvS
         ewpUZv8qSwLZO44GNrpc7/Non6I8SdjOtOuO3Km5H8+ZSXyPyXaL/vZD0TpO1NPj0a2j
         ZMR62Vtsfka5h6p7NDlI0MhzktvnJWujs6ckyd40S9fQx49UNEZ/aT7hHHiPi+kaDIY/
         J3sMvjLFp2oRFu5TaRnzAuzGEKGMzcPzd2759A3Uuy7sO8CE0VWRKnDwFOHo31AIEmFb
         8dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T2VM0kwHoFn1gaWQAg2wPBBbP6WC4qKdqInZZoS6G2E=;
        b=jYiiLbXQkLGuenMB1bkdi4MHYcKaxjOKIq6H+aPwXuxClxj10klFdEtMvI6AkyeiyI
         ryu5IYVVm3Nn+U9mtJ5AWMDfB0PQ08xg7h3Ec7CoZAO6xR9duMY7wUIg2QZ4P5h8PXN/
         pnh4Gzw3OxYaqiJcfoXKwPpsXSDzZINFbJ/xpvCsn1ybHMWTeJllqPunjpxt1MTRmrjX
         ZjPmCQnS4/LiDCJRPlGClT0Yoq8/+h0FCOm59ybZU+SeawnbZa0cfdKA2n+LApUNRUtY
         x+IXGmcDKG9OeBdpwG91cRaVqVVYz67vrEkTBSKZMr7DsbWLz1BKT1WIJi/HyBpiX/TH
         uU/g==
X-Gm-Message-State: AGi0PuaKbJ+hIvgft9GNVzQOAFTLmzFinGqowu65oHKzfez1I9itSX5Q
	aAa3Ymim7EQzEhc5PcF4MrrXzo4brgi4hp0nRpw=
X-Google-Smtp-Source: APiQypKWbPgJj0AdhwC74W5zQFjk4HVN9fAKlGS8ThlMOWGmEdhJpqndaXiTiZdOSjlXewtNZSI4thoWr74S3VJdiZs=
X-Received: by 2002:a9d:3ee1:: with SMTP id b88mr20197097otc.355.1588019536969;
 Mon, 27 Apr 2020 13:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200409044116.27070-1-bkylerussell@gmail.com>
 <20200409044116.27070-2-bkylerussell@gmail.com> <b1f74d2ff1a76a6f66c23fe9ee09971346a886b1.camel@linuxfoundation.org>
In-Reply-To: <b1f74d2ff1a76a6f66c23fe9ee09971346a886b1.camel@linuxfoundation.org>
From: bkylerussell@gmail.com
Date: Mon, 27 Apr 2020 16:32:05 -0400
Message-ID: <CAFrQVPMFCxHN4hzp2ktmP0wEH1Bp571z1KkSL5pfbHdWcuaFQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] patch: don't strip GitApplyTree patches
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, wesley.lindauer@gmail.com
Content-Type: multipart/alternative; boundary="00000000000065c43a05a44b9c68"

--00000000000065c43a05a44b9c68
Content-Type: text/plain; charset="UTF-8"

Sorry, it has taken me a while to get back to this.

> If you changed the patch tool to git for those recipes, doesn't it fail
with this patch applied?

Even without my patch, I don't think bash works normally with PATCHTOOL =
"git" since we unpack it from a tgz.  I added PATCHTOOL = "git" to the bash
recipe, and it seems to trash my poky repo's git history instead of the
source in my bash workdir. :( There might be a separate case we should
protect against for that, but I'll have to look at it separately.

llvm looks like the perfect example though, and is much more interesting.
Initially, it actually fails the git am attempt with "fatal: empty ident
name (for <>) not allowed".  I think this might be because git doesn't find
a "From" line first, or something like that.  (If I move Upstream-Status
and Signed-off-by below "From" then git am is happy.). But by default git
am fails, and the first fallback, git apply, doesn't work with my patch as
I expected.  git apply appears to only focus on its current directory,
unlike git am which I think applies from the work-tree root.  I may have
only exercised the git am path initially, but I'll investigate the
difference here further before providing an updated patch.

> We may need to teach GitApplyTree to calculate the difference between the
git repodir and patchdir and adjust the offsets accordingly?

That was the approach I started with, but I couldn't come up with a
scenario where we would end up with an offset other than the default (1)
for commands that work from the repo root (git am).  So maybe the git am
case is the only one that needs to ignore the striplevel, if it truly
always expects to work from the repo root.  Maybe git apply is the case I
unintentionally broke.

When I post a revised patch, I'll also update the commit message subject as
Peter pointed out.

On Thu, Apr 9, 2020 at 6:07 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-04-09 at 00:41 -0400, bkylerussell@gmail.com wrote:
> > Don't pass a path removal parameter to git am/git apply since
> GitApplyTree
> > always applies patches from the root of the git repo, not from each
> > individual patchdir (like quilt).
> >
> > GitApplyTree uses `git rev-parse --show-toplevel` to find the root of
> > the repo no matter which patchdir is passed into the GitApplyTree
> instance.
> > In most cases, this works fine when applying patches since the three-way
> > merge can figure out where the patch should be applied to existing files
> > based on the history, even if the file paths are excessively stripped.
> >
> > An exception to this occurs if a patch adds a new file to the repo
> > and a custom ${S} has been set to a subdirectory of the repo such
> > that the patch requires a non-default striplevel parameter.
> >
> > When processed by GitApplyTree, the patch will have its striplevel
> > parameter given to git even though it's applied at the root of the
> > tree.
> >
> > For example, consider a patch that adds a new file src/foo to a repo.
> >
> >   --- /dev/null
> >   +++ b/src/foo
> >   @@ -0,0 +1 @@
> >   +new file test
> >
> > The recipe sets S = "${WORKDIR}/git/src" and the patch is added to
> SRC_URI
> > using "striplevel=2" since the default patch tool, quilt, applies each
> > patch at its patchdir, which defaults to ${S}.
> >
> > When the GitApplyTree patch class is used (for example, through devtool),
> > the root of the repo is passed to git as the work tree, in addition to
> the
> > path removal paramter.  In the case above, GitApplyTree creates
> > ${WORKDIR}/git/foo instead of ${WORKDIR}/git/src/foo.
> >
> > Interestingly enough, you can take a more typical patch example that only
> > changes existing files (instead of adding a new file) and remove the -3
> > argument from the git am/git apply commands issued by GitApplyTree.  In
> > this scenario, the patch will also fail to apply because the path removal
> > arg is still being passed, and the resulting path does not exist.
> >
> > Since GitApplyTree always applies from the root of the repo, it should
> > ignore any striplevel arguments.
>
> I don't follow this argument. We have several recipes in OE-Core which
> set striplevel in SRC_URI (e.g. bash, llvm and a pointless looking one
> in build-compare). If you changed the patch tool to git for those
> recipes, doesn't it fail with this patch applied?
>
> I think you're right and there is an issue here since do_patch assumes
> ${S} is the root for patches whilst git assumes the root of the repo is
> the patch root. If those are different, it will break.
>
> Put another way, I think your patch fixes one case whilst breaking
> others :(.
>
> I'm not sure how we reconcile this. I certainly do not like hoping 'git
> am -3' figures it out. We may need to teach GitApplyTree to calculate
> the difference between the git repodir and patchdir and adjust the
> offsets accordingly?
>
> Cheers,
>
> Richard
>
>
>

--00000000000065c43a05a44b9c68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, it has taken me a while to get back to this.</=
div><div><br></div><div>&gt; If you changed the patch tool to git for those=
 recipes, doesn&#39;t it fail with this patch applied?</div><div><br></div>=
<div>Even without my patch, I don&#39;t think bash works normally with PATC=
HTOOL =3D &quot;git&quot; since we unpack it from a tgz.=C2=A0 I added PATC=
HTOOL =3D &quot;git&quot; to the bash recipe, and it seems to trash my poky=
 repo&#39;s git history instead of the source in my bash workdir. :( There =
might be a separate case we should protect against for that, but I&#39;ll h=
ave to look at it separately.</div><div><br></div><div>llvm looks like the =
perfect example though, and is much more interesting.=C2=A0 Initially, it a=
ctually fails the git am attempt with &quot;fatal: empty ident name (for &l=
t;&gt;) not allowed&quot;.=C2=A0 I think this might be because git doesn&#3=
9;t find a &quot;From&quot; line first, or something like that.=C2=A0 (If I=
 move Upstream-Status and Signed-off-by below &quot;From&quot; then git am =
is happy.). But by default git am fails, and the first fallback, git apply,=
 doesn&#39;t work with my patch as I expected.=C2=A0 git apply appears to o=
nly focus on its current directory, unlike git am which I think applies fro=
m the work-tree root.=C2=A0 I may have only exercised the git am path initi=
ally, but I&#39;ll investigate the difference here further before providing=
 an updated patch.</div><div><br></div><div>&gt; We may need to teach GitAp=
plyTree to calculate the difference between the git repodir and patchdir an=
d adjust the offsets accordingly?</div><div><br></div><div>That was the app=
roach I started with, but I couldn&#39;t come up with a scenario where we w=
ould end up with an offset other than the default (1) for commands that=C2=
=A0work from the repo root (git am).=C2=A0 So maybe the git am case is the =
only one that needs to ignore the striplevel, if it truly always expects to=
 work from the repo root.=C2=A0 Maybe git apply is the case I unintentional=
ly broke.<br>
</div><div><br></div><div>When I post a revised patch, I&#39;ll also update=
 the commit message subject as Peter pointed out.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 9, 2020 =
at 6:07 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2020-0=
4-09 at 00:41 -0400, <a href=3D"mailto:bkylerussell@gmail.com" target=3D"_b=
lank">bkylerussell@gmail.com</a> wrote:<br>
&gt; Don&#39;t pass a path removal parameter to git am/git apply since GitA=
pplyTree<br>
&gt; always applies patches from the root of the git repo, not from each<br=
>
&gt; individual patchdir (like quilt).<br>
&gt; <br>
&gt; GitApplyTree uses `git rev-parse --show-toplevel` to find the root of<=
br>
&gt; the repo no matter which patchdir is passed into the GitApplyTree inst=
ance.<br>
&gt; In most cases, this works fine when applying patches since the three-w=
ay<br>
&gt; merge can figure out where the patch should be applied to existing fil=
es<br>
&gt; based on the history, even if the file paths are excessively stripped.=
<br>
&gt; <br>
&gt; An exception to this occurs if a patch adds a new file to the repo<br>
&gt; and a custom ${S} has been set to a subdirectory of the repo such<br>
&gt; that the patch requires a non-default striplevel parameter.<br>
&gt; <br>
&gt; When processed by GitApplyTree, the patch will have its striplevel<br>
&gt; parameter given to git even though it&#39;s applied at the root of the=
<br>
&gt; tree.<br>
&gt; <br>
&gt; For example, consider a patch that adds a new file src/foo to a repo.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0+++ b/src/foo<br>
&gt;=C2=A0 =C2=A0@@ -0,0 +1 @@<br>
&gt;=C2=A0 =C2=A0+new file test<br>
&gt; <br>
&gt; The recipe sets S =3D &quot;${WORKDIR}/git/src&quot; and the patch is =
added to SRC_URI<br>
&gt; using &quot;striplevel=3D2&quot; since the default patch tool, quilt, =
applies each<br>
&gt; patch at its patchdir, which defaults to ${S}.<br>
&gt; <br>
&gt; When the GitApplyTree patch class is used (for example, through devtoo=
l),<br>
&gt; the root of the repo is passed to git as the work tree, in addition to=
 the<br>
&gt; path removal paramter.=C2=A0 In the case above, GitApplyTree creates<b=
r>
&gt; ${WORKDIR}/git/foo instead of ${WORKDIR}/git/src/foo.<br>
&gt; <br>
&gt; Interestingly enough, you can take a more typical patch example that o=
nly<br>
&gt; changes existing files (instead of adding a new file) and remove the -=
3<br>
&gt; argument from the git am/git apply commands issued by GitApplyTree.=C2=
=A0 In<br>
&gt; this scenario, the patch will also fail to apply because the path remo=
val<br>
&gt; arg is still being passed, and the resulting path does not exist.<br>
&gt; <br>
&gt; Since GitApplyTree always applies from the root of the repo, it should=
<br>
&gt; ignore any striplevel arguments.<br>
<br>
I don&#39;t follow this argument. We have several recipes in OE-Core which<=
br>
set striplevel in SRC_URI (e.g. bash, llvm and a pointless looking one<br>
in build-compare). If you changed the patch tool to git for those<br>
recipes, doesn&#39;t it fail with this patch applied?<br>
<br>
I think you&#39;re right and there is an issue here since do_patch assumes<=
br>
${S} is the root for patches whilst git assumes the root of the repo is<br>
the patch root. If those are different, it will break.<br>
<br>
Put another way, I think your patch fixes one case whilst breaking<br>
others :(.<br>
<br>
I&#39;m not sure how we reconcile this. I certainly do not like hoping &#39=
;git<br>
am -3&#39; figures it out. We may need to teach GitApplyTree to calculate<b=
r>
the difference between the git repodir and patchdir and adjust the<br>
offsets accordingly?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--00000000000065c43a05a44b9c68--
