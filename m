Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC20C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 11:25:51 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.6227.1678793149369398127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 04:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LGqjV2Fs;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id j11so19509599lfg.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678793147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TQYBO5DiONBeFCdKqHrz1SnBmsftwbrveSUJXkgvMcs=;
        b=LGqjV2FsHYSOOfRq5CbAhyTEm75TKHWMkSrvy9rV1r3NAkOdgSDyEY/I1UzCqEEBkN
         3UhPlvaPMPhkDBBt/JpdKbttjR3G6Iy4IS8M6fDAJxxJ74Mt+RGmqNG5CprjO687Ds38
         3sj9HIwbip6w5gvAexE0+4V9sKKSXFsKXqsjdrptO0Uvks636wW2ykNshafbj6+qCx1W
         3ZojGA+mnG9RoyirKCvb/ykib0glEiykYkbvyLYcFn7ymkTonAOMpbWWpmD9AUI+cipE
         zNzIVeKe6XZEVq4EtP6cjjYZbkFVWt78jgb9kKJjI4lxM2EooS9kSTAzvv9u7trB7pPM
         HaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678793147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQYBO5DiONBeFCdKqHrz1SnBmsftwbrveSUJXkgvMcs=;
        b=vwpfmAc7jqL9iVhLp+6dnn3AhveclylnZD4bChY8+Wee/rq9febwTGnTJQIMd1/8vY
         Mw3uwMtOxt5CppEcxSLyh0zM0t79iRa2VpavIbb9t00ZKPltRoQnZtmWOfKxkBFxvkDJ
         dLmnYW6lFibcuRRMMFHK0dr0PJyIpu8vHLuTA1oqX2c6boVmal1naOzM1q1fV63MN2Dq
         uZyOIO9VGPM4f0ndVSJuJ2yHIxnnpBJiPyrLKxZauuw65k5vcbXRvc7KB/Rr4ead8wZK
         TexItNgwiar8BEcCjUjZdpEYfzOQLlPwv94daN3mSmuDUpgB4iQE9a7EZEYJEZKR1DUX
         ms5w==
X-Gm-Message-State: AO0yUKVAhk429nyGQoGuh0xIW6S+mFhNebBfULwXiPFtjHu1xTRIEP2S
	RBIOb1hpYRZ00im8+TQ16D+Ko0UXG4GiS7ikDhE=
X-Google-Smtp-Source: AK7set/hJBNvcQA3DYdvcUYU3waX5j/ELg/xwwd7mitfLAzdZg0CyKT+3WFaIfaSrteVtHT3LSV5oe078f9S0frqF/I=
X-Received: by 2002:ac2:5385:0:b0:4d5:ca42:aeeb with SMTP id
 g5-20020ac25385000000b004d5ca42aeebmr616218lfh.11.1678793147190; Tue, 14 Mar
 2023 04:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
 <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
 <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
 <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
 <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com> <174C42B3FC629754.1180@lists.openembedded.org>
In-Reply-To: <174C42B3FC629754.1180@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Mar 2023 12:25:36 +0100
Message-ID: <CANNYZj-=Wh68FKK0SLcsZYqwheT06q3Ons7B+5EefsT5aKzzig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: alex.kanavin@gmail.com
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	=?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000308fc305f6da7d87"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 11:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178482

--000000000000308fc305f6da7d87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The other option is to add checksumming support to crate fetcher in
bitbake. If all items in src_uri are verified by fetchers directly for
integrity from checksums in the recipe, the cargo can generate cargo.lock
anytime it wants to.

Alex

On Tue 14. Mar 2023 at 11.35, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> --offline seems like the right thing to add, if it produces better errors=
.
>
> Generating Cargo.lock on the other hand is not right. We rely on rust
> checking the source tree against the checksums in Cargo.lock (to
> prevent supply chain attacks), and this would completely subvert that.
> There could be better diagnostics around missing Cargo.lock, and steps
> to address the issue, but such steps must be manually taken (even
> though they could be codified in a special task, similar to how
> generating list of crates in SRC_URI is a task).
>
> Alex
>
> On Tue, 14 Mar 2023 at 11:25, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Hello, I finally found why my setup didn't work. That was not related
> > to https versus ssh.
> > For the patch provided in
> >
> https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.1=
0212-2-alex.kiernan@gmail.com/
> > to work, the repository should have a Cargo.lock file.
> > WIthout the Cargo.lock file, the cargo build will try to generate it
> > (and so needs network access).
> >
> > Note that I made a little change to the patch to support user in url
> > (the patch process in cargo only work if url is exact match):
> >
> > @@ -135,7 +135,10 @@ python cargo_common_do_patch_paths() {
> >              name =3D ud.parm.get('name')
> >              destsuffix =3D ud.parm.get('destsuffix')
> >              if name is not None and destsuffix is not None:
> > -                repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
> > +                if ud.user:
> > +                    repo =3D '%s://%s@%s%s' % (ud.proto, ud.user,
> > ud.host, ud.path)
> > +                else:
> > +                    repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path=
)
> >                  path =3D '%s =3D { path =3D "%s" }' % (name,
> > os.path.join(workdir, destsuffix))
> >                  patches.setdefault(repo, []).append(path)
> >
> > Anyway, I would like to know how to you feel with this need for
> > Cargo.lock problem ?
> > Because for it to be generated, the project needs to be built once and
> > if this is expected for binary type to have Cargo.lock under version
> > control:
> >
> https://doc.rust-lang.org/cargo/faq.html#why-do-binaries-have-cargolock-i=
n-version-control-but-not-libraries
> > It is not for "library" project.
> >
> > Maybe we can add a "cargo generate-lockfile"
> > (https://doc.rust-lang.org/cargo/commands/cargo-generate-lockfile.html)
> > at the end of do_fetch ?
> > Moreover, I think we should add the `--offline` option to cargo build
> > because the error generated will be more clear:
> >
> > | DEBUG: Executing shell function do_compile
> > | NOTE: Using rust targets from
> >
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/
> > | NOTE: cargo =3D
> >
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/bin/=
cargo
> > | NOTE: cargo build -v --offline --target x86_64-poky-linux-gnu
> > --release
> --manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/=
work/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git//Cargo.t=
oml
> > | error: failed to get `zbus-git-dep-test` as a dependency of package
> > `zbus-test v0.0.1
> >
> (/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-pok=
y-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`
> > |
> > | Caused by:
> > |  failed to load source for dependency `zbus-git-dep-test`
> > |
> > | Caused by:
> > |  Unable to update
> > ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git?branch=3Dmain
> > |
> > | Caused by:
> > |  can't checkout from
> > 'ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git': you are in
> > the offline mode (--offline)
> > | WARNING: exit code 101 from a shell command.
> >
> > Instead of
> >
> > | DEBUG: Executing shell function do_compile
> > | NOTE: Using rust targets from
> >
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/
> > | NOTE: cargo =3D
> >
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/bin/=
cargo
> > | NOTE: cargo build -v --target x86_64-poky-linux-gnu --release
> >
> --manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/=
work/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git//Cargo.t=
oml
> > |   Updating git repository
> > `ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git`
> <http://git@gitlab.com/fmartinsons/zbus-git-dep-test.git>
> > | warning: spurious network error (2 tries remaining): failed to
> > resolve address for gitlab.com: Temporary failure in name resolution;
> > class=3DNet (12)
> > | warning: spurious network error (1 tries remaining): failed to
> > resolve address for gitlab.com: Temporary failure in name resolution;
> > class=3DNet (12)
> > | error: failed to get `zbus-git-dep-test` as a dependency of package
> > `zbus-test v0.0.1
> >
> (/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-pok=
y-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`
> > |
> > | Caused by:
> > |  failed to load source for dependency `zbus-git-dep-test`
> > |
> > | Caused by:
> > |  Unable to update
> > ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git?branch=3Dmain
> > |
> > | Caused by:
> > |  failed to clone into:
> >
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/cargo_home/git/db/zbus-git-dep=
-test-7f2b6322e3bb0cd5
> > |
> > | Caused by:
> > |  network failure seems to have happened
> > |  if a proxy or similar is necessary `net.git-fetch-with-cli` may help
> here
> > |
> https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-c=
li
> > |
> > | Caused by:
> > |  failed to resolve address for gitlab.com: Temporary failure in name
> > resolution; class=3DNet (12)|
> > |  WARNING: exit code 101 from a shell command.
> >
> >
> > In any case, I'll be glad to work on this patch if you tell me what
> > strategy to adopt.
> >
> > On Mon, 13 Mar 2023 at 17:08, Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > I understand, I'll pursue all my tests with the current poky master.
> Thanks
> > >
> > > On Mon, 13 Mar 2023 at 11:42, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > > >
> > > > You need to use kirkstone or newer to see the bitbake-driven networ=
k
> > > > disabling in action. Can you try on current poky master? You don't
> > > > need to port the whole build to that, just one sample recipe.
> > > >
> > > > It is also expected that if you submit patches for master, they wer=
e
> > > > tested on master.
> > > >
> > > > Alex
> > > >
> > > > On Mon, 13 Mar 2023 at 11:06, Fr=C3=A9d=C3=A9ric Martinsons
> > > > <frederic.martinsons@gmail.com> wrote:
> > > > >
> > > > > hmm, how is the network disabled ?
> > > > >
> > > > > Because with the patch I provided , the git clone in do_compile i=
s
> successful.
> > > > >
> > > > > One major thing I forget to mention is that I use dunfell branch
> where
> > > > > I backport all the cargo/rust relatives from master.
> > > > > The backport was functional and straightforward, I just have to
> keep
> > > > > the custom crate fetcher in openembedded-core (meta/lib/crate.py)
> > > > > because I'm stuck with bitbake 1.46.
> > > > >
> > > > >    -
> > > > >
> > > > > On Mon, 13 Mar 2023 at 10:46, Alex Kiernan <alex.kiernan@gmail.co=
m>
> wrote:
> > > > > >
> > > > > > Are you listing your ssh repos in your SRC_URI? We run with
> network
> > > > > > disabled everywhere other than fetch and with that patch we
> don't see
> > > > > > fetches from local ssh repos in compile.
> > > > > >
> > > > > > On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Mart=
insons
> > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > >
> > > > > > > Thanks for the patch alex, I did try it and the same happened
> (git
> > > > > > > clone failure during do_compile), I'll
> > > > > > > dig more on that and possibly submit patches if I found a way
> of
> > > > > > > supporting git dependencies in Cargo.toml
> > > > > > >
> > > > > > > On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <
> alex.kiernan@gmail.com> wrote:
> > > > > > > >
> > > > > > > > ISTR I tried this and ran into a different set of different
> problems.
> > > > > > > >
> > > > > > > > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > > > > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Note that we're all rust neophytes, and rust support in
> yocto is still
> > > > > > > > > evolving towards maturity. If you can see better ways to
> do things,
> > > > > > > > > patches would be most welcome - but 'no network access
> except in
> > > > > > > > > bitbake fetchers' is a core rule.
> > > > > > > > >
> > > > > > > > > Alex
> > > > > > > > >
> > > > > > > > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinso=
ns
> > > > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > I understand there should not be a fetch during build
> step , I'll try
> > > > > > > > > > to find why .
> > > > > > > > > > In the mean time, if this is a strong rule, shouldn't w=
e
> invoke "cargo
> > > > > > > > > > build" with  --offline option ?
> > > > > > > > > >
> > > > > > > > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Mart=
insons
> > > > > > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > > > > > > But the compile step tried to git clone anyway and
> so it failed like I
> > > > > > > > > > > > showed in my first email.
> > > > > > > > > > >
> > > > > > > > > > > You need to figure out why this happens, because it
> should not. We
> > > > > > > > > > > have plenty of recipes that list crates in SRC_URI in
> oe-core, so you
> > > > > > > > > > > could start by studying how they work.
> > > > > > > > > > >
> > > > > > > > > > > Accessing network anywhere except do_fetch is not
> allowed for
> > > > > > > > > > > reproducibility and license compliance reasons (both
> break if that
> > > > > > > > > > > happens).
> > > > > > > > > > >
> > > > > > > > > > > 'cargo bitbake' is a 3rd party project with
> questionable maintenance
> > > > > > > > > > > status that we do not support. The official way is to
> use
> > > > > > > > > > > cargo-update-recipe-crates class.
> > > > > > > > > > >
> > > > > > > > > > > Alex
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Alex Kiernan
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178480):
> https://lists.openembedded.org/g/openembedded-core/message/178480
> Mute This Topic: https://lists.openembedded.org/mt/97555635/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000308fc305f6da7d87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The other option is to add checksumming support to crate =
fetcher in bitbake. If all items in src_uri are verified by fetchers direct=
ly for integrity from checksums in the recipe, the cargo can generate cargo=
.lock anytime it wants to.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue 14. Mar 2023 at 11.35, Alexander Kanavin via <a href=3D"=
http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">--offline seems like =
the right thing to add, if it produces better errors.<br>
<br>
Generating Cargo.lock on the other hand is not right. We rely on rust<br>
checking the source tree against the checksums in Cargo.lock (to<br>
prevent supply chain attacks), and this would completely subvert that.<br>
There could be better diagnostics around missing Cargo.lock, and steps<br>
to address the issue, but such steps must be manually taken (even<br>
though they could be codified in a special task, similar to how<br>
generating list of crates in SRC_URI is a task).<br>
<br>
Alex<br>
<br>
On Tue, 14 Mar 2023 at 11:25, Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello, I finally found why my setup didn&#39;t work. That was not rela=
ted<br>
&gt; to https versus ssh.<br>
&gt; For the patch provided in<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
221030173815.10212-2-alex.kiernan@gmail.com/" rel=3D"noreferrer" target=3D"=
_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/2022103017=
3815.10212-2-alex.kiernan@gmail.com/</a><br>
&gt; to work, the repository should have a Cargo.lock file.<br>
&gt; WIthout the Cargo.lock file, the cargo build will try to generate it<b=
r>
&gt; (and so needs network access).<br>
&gt;<br>
&gt; Note that I made a little change to the patch to support user in url<b=
r>
&gt; (the patch process in cargo only work if url is exact match):<br>
&gt;<br>
&gt; @@ -135,7 +135,10 @@ python cargo_common_do_patch_paths() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D ud.parm.get(&=
#39;name&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destsuffix =3D ud.parm=
.get(&#39;destsuffix&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name is not None an=
d destsuffix is not None:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo =3D &#39=
;%s://%s%s&#39; % (ud.proto, ud.host, ud.path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ud.user:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 repo =3D &#39;%s://%s@%s%s&#39; % (ud.proto, ud.user,<br>
&gt; ud.host, ud.path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 repo =3D &#39;%s://%s%s&#39; % (ud.proto, ud.host, ud.path)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D=
 &#39;%s =3D { path =3D &quot;%s&quot; }&#39; % (name,<br>
&gt; os.path.join(workdir, destsuffix))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patches.=
setdefault(repo, []).append(path)<br>
&gt;<br>
&gt; Anyway, I would like to know how to you feel with this need for<br>
&gt; Cargo.lock problem ?<br>
&gt; Because for it to be generated, the project needs to be built once and=
<br>
&gt; if this is expected for binary type to have Cargo.lock under version<b=
r>
&gt; control:<br>
&gt;=C2=A0 <a href=3D"https://doc.rust-lang.org/cargo/faq.html#why-do-binar=
ies-have-cargolock-in-version-control-but-not-libraries" rel=3D"noreferrer"=
 target=3D"_blank">https://doc.rust-lang.org/cargo/faq.html#why-do-binaries=
-have-cargolock-in-version-control-but-not-libraries</a><br>
&gt; It is not for &quot;library&quot; project.<br>
&gt;<br>
&gt; Maybe we can add a &quot;cargo generate-lockfile&quot;<br>
&gt; (<a href=3D"https://doc.rust-lang.org/cargo/commands/cargo-generate-lo=
ckfile.html" rel=3D"noreferrer" target=3D"_blank">https://doc.rust-lang.org=
/cargo/commands/cargo-generate-lockfile.html</a>)<br>
&gt; at the end of do_fetch ?<br>
&gt; Moreover, I think we should add the `--offline` option to cargo build<=
br>
&gt; because the error generated will be more clear:<br>
&gt;<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | NOTE: Using rust targets from<br>
&gt; /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-p=
oky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/<br>
&gt; | NOTE: cargo =3D<br>
&gt; /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-p=
oky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/b=
in/cargo<br>
&gt; | NOTE: cargo build -v --offline --target x86_64-poky-linux-gnu<br>
&gt; --release --manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/po=
ky/build/tmp/work/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0=
/git//Cargo.toml<br>
&gt; | error: failed to get `zbus-git-dep-test` as a dependency of package<=
br>
&gt; `zbus-test v0.0.1<br>
&gt; (/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-=
poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 failed to load source for dependency `zbus-git-dep-test`<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 Unable to update<br>
&gt; ssh://<a href=3D"http://git@gitlab.com/fmartinsons/zbus-git-dep-test.g=
it?branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">git@gitlab.com/fmart=
insons/zbus-git-dep-test.git?branch=3Dmain</a><br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 can&#39;t checkout from<br>
&gt; &#39;ssh://<a href=3D"http://git@gitlab.com/fmartinsons/zbus-git-dep-t=
est.git" rel=3D"noreferrer" target=3D"_blank">git@gitlab.com/fmartinsons/zb=
us-git-dep-test.git</a>&#39;: you are in<br>
&gt; the offline mode (--offline)<br>
&gt; | WARNING: exit code 101 from a shell command.<br>
&gt;<br>
&gt; Instead of<br>
&gt;<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | NOTE: Using rust targets from<br>
&gt; /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-p=
oky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/<br>
&gt; | NOTE: cargo =3D<br>
&gt; /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-p=
oky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/b=
in/cargo<br>
&gt; | NOTE: cargo build -v --target x86_64-poky-linux-gnu --release<br>
&gt; --manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/t=
mp/work/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git//Carg=
o.toml<br>
&gt; |=C2=A0 =C2=A0Updating git repository<br>
&gt; `ssh://<a href=3D"http://git@gitlab.com/fmartinsons/zbus-git-dep-test.=
git" rel=3D"noreferrer" target=3D"_blank">git@gitlab.com/fmartinsons/zbus-g=
it-dep-test.git`</a><br>
&gt; | warning: spurious network error (2 tries remaining): failed to<br>
&gt; resolve address for <a href=3D"http://gitlab.com" rel=3D"noreferrer" t=
arget=3D"_blank">gitlab.com</a>: Temporary failure in name resolution;<br>
&gt; class=3DNet (12)<br>
&gt; | warning: spurious network error (1 tries remaining): failed to<br>
&gt; resolve address for <a href=3D"http://gitlab.com" rel=3D"noreferrer" t=
arget=3D"_blank">gitlab.com</a>: Temporary failure in name resolution;<br>
&gt; class=3DNet (12)<br>
&gt; | error: failed to get `zbus-git-dep-test` as a dependency of package<=
br>
&gt; `zbus-test v0.0.1<br>
&gt; (/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-=
poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 failed to load source for dependency `zbus-git-dep-test`<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 Unable to update<br>
&gt; ssh://<a href=3D"http://git@gitlab.com/fmartinsons/zbus-git-dep-test.g=
it?branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">git@gitlab.com/fmart=
insons/zbus-git-dep-test.git?branch=3Dmain</a><br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 failed to clone into:<br>
&gt; /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-p=
oky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/cargo_home/git/db/zbus-git-=
dep-test-7f2b6322e3bb0cd5<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 network failure seems to have happened<br>
&gt; |=C2=A0 if a proxy or similar is necessary `net.git-fetch-with-cli` ma=
y help here<br>
&gt; |=C2=A0 <a href=3D"https://doc.rust-lang.org/cargo/reference/config.ht=
ml#netgit-fetch-with-cli" rel=3D"noreferrer" target=3D"_blank">https://doc.=
rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli</a><br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 failed to resolve address for <a href=3D"http://gitlab.com" re=
l=3D"noreferrer" target=3D"_blank">gitlab.com</a>: Temporary failure in nam=
e<br>
&gt; resolution; class=3DNet (12)|<br>
&gt; |=C2=A0 WARNING: exit code 101 from a shell command.<br>
&gt;<br>
&gt;<br>
&gt; In any case, I&#39;ll be glad to work on this patch if you tell me wha=
t<br>
&gt; strategy to adopt.<br>
&gt;<br>
&gt; On Mon, 13 Mar 2023 at 17:08, Fr=C3=A9d=C3=A9ric Martinsons<br>
&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank"=
>frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I understand, I&#39;ll pursue all my tests with the current poky =
master. Thanks<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 13 Mar 2023 at 11:42, Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You need to use kirkstone or newer to see the bitbake-driven=
 network<br>
&gt; &gt; &gt; disabling in action. Can you try on current poky master? You=
 don&#39;t<br>
&gt; &gt; &gt; need to port the whole build to that, just one sample recipe=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It is also expected that if you submit patches for master, t=
hey were<br>
&gt; &gt; &gt; tested on master.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Alex<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, 13 Mar 2023 at 11:06, Fr=C3=A9d=C3=A9ric Martinsons<=
br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=
=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; hmm, how is the network disabled ?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Because with the patch I provided , the git clone in do=
_compile is successful.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; One major thing I forget to mention is that I use dunfe=
ll branch where<br>
&gt; &gt; &gt; &gt; I backport all the cargo/rust relatives from master.<br=
>
&gt; &gt; &gt; &gt; The backport was functional and straightforward, I just=
 have to keep<br>
&gt; &gt; &gt; &gt; the custom crate fetcher in openembedded-core (meta/lib=
/crate.py)<br>
&gt; &gt; &gt; &gt; because I&#39;m stuck with bitbake 1.46.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, 13 Mar 2023 at 10:46, Alex Kiernan &lt;<a href=
=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com=
</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Are you listing your ssh repos in your SRC_URI? We=
 run with network<br>
&gt; &gt; &gt; &gt; &gt; disabled everywhere other than fetch and with that=
 patch we don&#39;t see<br>
&gt; &gt; &gt; &gt; &gt; fetches from local ssh repos in compile.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=
=C3=A9ric Martinsons<br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.co=
m" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks for the patch alex, I did try it and t=
he same happened (git<br>
&gt; &gt; &gt; &gt; &gt; &gt; clone failure during do_compile), I&#39;ll<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; dig more on that and possibly submit patches =
if I found a way of<br>
&gt; &gt; &gt; &gt; &gt; &gt; supporting git dependencies in Cargo.toml<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, 13 Mar 2023 at 10:23, Alex Kiernan &l=
t;<a href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@=
gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ISTR I tried this and ran into a differe=
nt set of different problems.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM =
Alexander Kanavin<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Note that we&#39;re all rust neophy=
tes, and rust support in yocto is still<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; evolving towards maturity. If you c=
an see better ways to do things,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; patches would be most welcome - but=
 &#39;no network access except in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; bitbake fetchers&#39; is a core rul=
e.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Alex<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, 13 Mar 2023 at 10:14, Fr=C3=
=A9d=C3=A9ric Martinsons<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I understand there should not =
be a fetch during build step , I&#39;ll try<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to find why .<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; In the mean time, if this is a=
 strong rule, shouldn&#39;t we invoke &quot;cargo<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; build&quot; with=C2=A0 --offli=
ne option ?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, 13 Mar 2023 at 09:38, =
Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_=
blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, 13 Mar 2023 at 09=
:29, Fr=C3=A9d=C3=A9ric Martinsons<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:fre=
deric.martinsons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com=
</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; But the compile step=
 tried to git clone anyway and so it failed like I<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; showed in my first e=
mail.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; You need to figure out wh=
y this happens, because it should not. We<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; have plenty of recipes th=
at list crates in SRC_URI in oe-core, so you<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; could start by studying h=
ow they work.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Accessing network anywher=
e except do_fetch is not allowed for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; reproducibility and licen=
se compliance reasons (both break if that<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; happens).<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;cargo bitbake&#39; i=
s a 3rd party project with questionable maintenance<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; status that we do not sup=
port. The official way is to use<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; cargo-update-recipe-crate=
s class.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Alex<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Alex Kiernan<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; Alex Kiernan<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178480): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178480" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178480</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97555635/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97555635/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000308fc305f6da7d87--

