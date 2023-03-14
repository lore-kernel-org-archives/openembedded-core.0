Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297EFC6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 10:25:41 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.5296.1678789532487402479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 03:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zf8vAwCN;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id i20so15443243lja.11
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678789531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OkTmm4wgR4t7T1I8AUbBjMrcjqf8inQjT2FzelG+tY=;
        b=Zf8vAwCNYdadarhk4/xzZDED83xcMx7AsMw69fmxyu9CCY1xIsHsXhTwizlo4eGMpR
         lAHi4vshlm/X4VanZeepxOsnTbhoIkCzOKHNndlZDftpaSGMNN1UsrvY4GEXvHLxMszm
         z1mNHgJ33Wl5fYPlDbLHVofIJC74RXOSdx7Tjk9v2oW49JW+s4NwmWmEo3ooKDSst09G
         yZ8jS2ECFTOs0F/3cOHKc4c/sxBtJanpa5fQSVjtqbf22VuyIM84FZUN7D7eKquN+wTJ
         fpL6XbktvpXXJBJ7f93hmwdwFlvkyFA20+B1tsxj7EIE61g5e4sNVFDXN8bPKj+mg85m
         epog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678789531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OkTmm4wgR4t7T1I8AUbBjMrcjqf8inQjT2FzelG+tY=;
        b=13tp6RDOz2SKbyT7TLX6JrXi1xORwfkCTk/fihzldqzVO4ZoffpAYCv9Iwlbacgigj
         4NS2NNVImkjS7kmMkz71WKpRL9EN85svSqhlhPjXAm+mrAs1vUua7+i3jyXgWqr/KTyr
         sH5C4JkBk//O8WGJri1QACu6NGSycEkbGSq9GiMBn0po8LZzBGVqNaQJeXb1jsA716Dq
         bXPoZNZYZ4Tr4ayh/HpYoy31UnjIJdJlun0TauT4SavG9oqYiunlC0NLzUZOcxZ9yKPq
         NCvL+cz2nx9+Oi4mK9dZVV7hHsGl5XCOaUVMeX7sFaF9oaOkk2ke97kEOF4SJkRVGPOG
         ePtw==
X-Gm-Message-State: AO0yUKXf94V4S5TgppNDUbqYtx2rOcF+8MNYDkkW1uJKGOXW5M5K/lPO
	oMmDOSEt4Jgwu2DbSJDVbVpDTAI+4TXIFYhdq0g=
X-Google-Smtp-Source: AK7set9OFRDxXXVQUodd/GzPsV6aqWyPl9V61obKV10kOnyy8xIXHDTmDDOOrpB/JO3dPIwI0uzkWsjDsNEri6+S480=
X-Received: by 2002:a2e:a48e:0:b0:298:7006:c2c9 with SMTP id
 h14-20020a2ea48e000000b002987006c2c9mr6724704lji.3.1678789530550; Tue, 14 Mar
 2023 03:25:30 -0700 (PDT)
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
 <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com> <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
In-Reply-To: <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 14 Mar 2023 11:25:19 +0100
Message-ID: <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 10:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178479

Hello, I finally found why my setup didn't work. That was not related
to https versus ssh.
For the patch provided in
https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.102=
12-2-alex.kiernan@gmail.com/
to work, the repository should have a Cargo.lock file.
WIthout the Cargo.lock file, the cargo build will try to generate it
(and so needs network access).

Note that I made a little change to the patch to support user in url
(the patch process in cargo only work if url is exact match):

@@ -135,7 +135,10 @@ python cargo_common_do_patch_paths() {
             name =3D ud.parm.get('name')
             destsuffix =3D ud.parm.get('destsuffix')
             if name is not None and destsuffix is not None:
-                repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
+                if ud.user:
+                    repo =3D '%s://%s@%s%s' % (ud.proto, ud.user,
ud.host, ud.path)
+                else:
+                    repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
                 path =3D '%s =3D { path =3D "%s" }' % (name,
os.path.join(workdir, destsuffix))
                 patches.setdefault(repo, []).append(path)

Anyway, I would like to know how to you feel with this need for
Cargo.lock problem ?
Because for it to be generated, the project needs to be built once and
if this is expected for binary type to have Cargo.lock under version
control:
 https://doc.rust-lang.org/cargo/faq.html#why-do-binaries-have-cargolock-in=
-version-control-but-not-libraries
It is not for "library" project.

Maybe we can add a "cargo generate-lockfile"
(https://doc.rust-lang.org/cargo/commands/cargo-generate-lockfile.html)
at the end of do_fetch ?
Moreover, I think we should add the `--offline` option to cargo build
because the error generated will be more clear:

| DEBUG: Executing shell function do_compile
| NOTE: Using rust targets from
/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky-l=
inux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/
| NOTE: cargo =3D
/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky-l=
inux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/bin/ca=
rgo
| NOTE: cargo build -v --offline --target x86_64-poky-linux-gnu
--release --manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/bu=
ild/tmp/work/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git/=
/Cargo.toml
| error: failed to get `zbus-git-dep-test` as a dependency of package
`zbus-test v0.0.1
(/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky-=
linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`
|
| Caused by:
|  failed to load source for dependency `zbus-git-dep-test`
|
| Caused by:
|  Unable to update
ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git?branch=3Dmain
|
| Caused by:
|  can't checkout from
'ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git': you are in
the offline mode (--offline)
| WARNING: exit code 101 from a shell command.

Instead of

| DEBUG: Executing shell function do_compile
| NOTE: Using rust targets from
/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky-l=
inux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/
| NOTE: cargo =3D
/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky-l=
inux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/bin/ca=
rgo
| NOTE: cargo build -v --target x86_64-poky-linux-gnu --release
--manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/wo=
rk/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git//Cargo.tom=
l
|   Updating git repository
`ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git`
| warning: spurious network error (2 tries remaining): failed to
resolve address for gitlab.com: Temporary failure in name resolution;
class=3DNet (12)
| warning: spurious network error (1 tries remaining): failed to
resolve address for gitlab.com: Temporary failure in name resolution;
class=3DNet (12)
| error: failed to get `zbus-git-dep-test` as a dependency of package
`zbus-test v0.0.1
(/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky-=
linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`
|
| Caused by:
|  failed to load source for dependency `zbus-git-dep-test`
|
| Caused by:
|  Unable to update
ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git?branch=3Dmain
|
| Caused by:
|  failed to clone into:
/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky-l=
inux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/cargo_home/git/db/zbus-git-dep-t=
est-7f2b6322e3bb0cd5
|
| Caused by:
|  network failure seems to have happened
|  if a proxy or similar is necessary `net.git-fetch-with-cli` may help her=
e
|  https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-=
cli
|
| Caused by:
|  failed to resolve address for gitlab.com: Temporary failure in name
resolution; class=3DNet (12)|
|  WARNING: exit code 101 from a shell command.


In any case, I'll be glad to work on this patch if you tell me what
strategy to adopt.

On Mon, 13 Mar 2023 at 17:08, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> I understand, I'll pursue all my tests with the current poky master. Than=
ks
>
> On Mon, 13 Mar 2023 at 11:42, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
> >
> > You need to use kirkstone or newer to see the bitbake-driven network
> > disabling in action. Can you try on current poky master? You don't
> > need to port the whole build to that, just one sample recipe.
> >
> > It is also expected that if you submit patches for master, they were
> > tested on master.
> >
> > Alex
> >
> > On Mon, 13 Mar 2023 at 11:06, Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > hmm, how is the network disabled ?
> > >
> > > Because with the patch I provided , the git clone in do_compile is su=
ccessful.
> > >
> > > One major thing I forget to mention is that I use dunfell branch wher=
e
> > > I backport all the cargo/rust relatives from master.
> > > The backport was functional and straightforward, I just have to keep
> > > the custom crate fetcher in openembedded-core (meta/lib/crate.py)
> > > because I'm stuck with bitbake 1.46.
> > >
> > >    -
> > >
> > > On Mon, 13 Mar 2023 at 10:46, Alex Kiernan <alex.kiernan@gmail.com> w=
rote:
> > > >
> > > > Are you listing your ssh repos in your SRC_URI? We run with network
> > > > disabled everywhere other than fetch and with that patch we don't s=
ee
> > > > fetches from local ssh repos in compile.
> > > >
> > > > On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinso=
ns
> > > > <frederic.martinsons@gmail.com> wrote:
> > > > >
> > > > > Thanks for the patch alex, I did try it and the same happened (gi=
t
> > > > > clone failure during do_compile), I'll
> > > > > dig more on that and possibly submit patches if I found a way of
> > > > > supporting git dependencies in Cargo.toml
> > > > >
> > > > > On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
> > > > > >
> > > > > > ISTR I tried this and ran into a different set of different pro=
blems.
> > > > > >
> > > > > > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > >
> > > > > > > Note that we're all rust neophytes, and rust support in yocto=
 is still
> > > > > > > evolving towards maturity. If you can see better ways to do t=
hings,
> > > > > > > patches would be most welcome - but 'no network access except=
 in
> > > > > > > bitbake fetchers' is a core rule.
> > > > > > >
> > > > > > > Alex
> > > > > > >
> > > > > > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > >
> > > > > > > > I understand there should not be a fetch during build step =
, I'll try
> > > > > > > > to find why .
> > > > > > > > In the mean time, if this is a strong rule, shouldn't we in=
voke "cargo
> > > > > > > > build" with  --offline option ?
> > > > > > > >
> > > > > > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanav=
in@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinso=
ns
> > > > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > > > > But the compile step tried to git clone anyway and so i=
t failed like I
> > > > > > > > > > showed in my first email.
> > > > > > > > >
> > > > > > > > > You need to figure out why this happens, because it shoul=
d not. We
> > > > > > > > > have plenty of recipes that list crates in SRC_URI in oe-=
core, so you
> > > > > > > > > could start by studying how they work.
> > > > > > > > >
> > > > > > > > > Accessing network anywhere except do_fetch is not allowed=
 for
> > > > > > > > > reproducibility and license compliance reasons (both brea=
k if that
> > > > > > > > > happens).
> > > > > > > > >
> > > > > > > > > 'cargo bitbake' is a 3rd party project with questionable =
maintenance
> > > > > > > > > status that we do not support. The official way is to use
> > > > > > > > > cargo-update-recipe-crates class.
> > > > > > > > >
> > > > > > > > > Alex
> > > > > > >
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > Links: You receive all messages sent to this group.
> > > > > > > View/Reply Online (#178420): https://lists.openembedded.org/g=
/openembedded-core/message/178420
> > > > > > > Mute This Topic: https://lists.openembedded.org/mt/97555635/3=
618097
> > > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-co=
re/unsub [alex.kiernan@gmail.com]
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Alex Kiernan
> > > >
> > > >
> > > >
> > > > --
> > > > Alex Kiernan

