Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941D1C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 12:23:01 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.7171.1678796574039032000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 05:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eAG4XfM7;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id bf15so6307183iob.7
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678796573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4SHGFoVXl33YiJBss4Sw2BJbLvlY9q5vgdqHwrSbp4=;
        b=eAG4XfM76Tz3ODm9nd0rw0EMsi1abhcy8URgToFE8eCoxyWrZkBPrOUOdssy5nIUyJ
         Ltz/jlC3OnimKgDu0G5U+w7P76K8swCT2g8M5JRSpZJPIXDE5E0wul1EXCu+M2Hr+9bh
         kmIw4Srlb82z6ysv4P8W+N1z4ZI2i/6s+LlTP2VUHIW1L4QA1rf5x1eGkPj/at+G946K
         kmvRfsqiZFxvr/ZO9sUxLVAg/H/jaHBU/bENtZT3w1Rv0lO0leamGZ9AfHt8oCUxJqTl
         tG1g0eUKnsPEmTEzDsWX2BVLHcXCzquvaTUcjPrTMdF917VNYxWMhWr9txMOmms/VOk+
         1KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678796573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4SHGFoVXl33YiJBss4Sw2BJbLvlY9q5vgdqHwrSbp4=;
        b=UXKqmZcR3aZOGaTZl/Qhc6paBHZsJOmInsML6t2GaQXvXGrXjcJz3Q9kXUOkVwoKS3
         2S5ecDrktA1O3e1Qw+nTO+HS99sf89TDV7lAR29ZNSrCtKBeVrTwCK47LqYd14j6SSPa
         PyWnTTZfCDXCzlOUkSmxcSjoZqBhhwht5jxy/iQW1mgThBVmq2wD8XOWRb32l+V73K4P
         cSpbLkxZiRnFP4NhUk6ChasbLgdojlezfgLB98yX+gnHyVFXHk0neJV7x3OMQA3/7iRY
         V5nYdclOinYfW1i+N3ZpaeR3xJbVBa6nyPzrXgdQgCp7W5Kk75AM76RR/5Mcvxm4j+Ne
         v+RQ==
X-Gm-Message-State: AO0yUKUeuWIAhNznWV2lYqtv5nf9ZrmdAty3u6dOXzKj08vxM29SAhrs
	wHQHDMIjd922RV6jiUX8tEYf46+bYw2aWfu7uao=
X-Google-Smtp-Source: AK7set+hpOCqZu+9ChnSklWp8+xMpkiZHjuUWG2xSlS4reYYfwQcKgi89vZxz8gZj1Qt8svSnJL40nEOffentDIFROY=
X-Received: by 2002:a02:7310:0:b0:3c5:1971:1b7b with SMTP id
 y16-20020a027310000000b003c519711b7bmr17824264jab.1.1678796573122; Tue, 14
 Mar 2023 05:22:53 -0700 (PDT)
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
 <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com> <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com>
In-Reply-To: <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 14 Mar 2023 12:22:41 +0000
Message-ID: <CAO5Uq5RSduyH-4Rhxzn=L3yS+V1ogM5GNoakbP-sHB9w0Www2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178483

On Tue, Mar 14, 2023 at 10:25=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Hello, I finally found why my setup didn't work. That was not related
> to https versus ssh.
> For the patch provided in
> https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.1=
0212-2-alex.kiernan@gmail.com/
> to work, the repository should have a Cargo.lock file.
> WIthout the Cargo.lock file, the cargo build will try to generate it
> (and so needs network access).
>
> Note that I made a little change to the patch to support user in url
> (the patch process in cargo only work if url is exact match):
>
> @@ -135,7 +135,10 @@ python cargo_common_do_patch_paths() {
>              name =3D ud.parm.get('name')
>              destsuffix =3D ud.parm.get('destsuffix')
>              if name is not None and destsuffix is not None:
> -                repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
> +                if ud.user:
> +                    repo =3D '%s://%s@%s%s' % (ud.proto, ud.user,
> ud.host, ud.path)
> +                else:
> +                    repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
>                  path =3D '%s =3D { path =3D "%s" }' % (name,
> os.path.join(workdir, destsuffix))
>                  patches.setdefault(repo, []).append(path)
>

Cool, will pick that up... the code needs some tests which is where it
stalled last time.

> Anyway, I would like to know how to you feel with this need for
> Cargo.lock problem ?
> Because for it to be generated, the project needs to be built once and
> if this is expected for binary type to have Cargo.lock under version
> control:
>  https://doc.rust-lang.org/cargo/faq.html#why-do-binaries-have-cargolock-=
in-version-control-but-not-libraries
> It is not for "library" project.
>

So I'm clear, you're building a library project here?

Could you consume your library into a wrapper project which brings
Cargo.lock along with it? Other than running tests on it, I'm not sure
what the value in building a library project is.

> Maybe we can add a "cargo generate-lockfile"
> (https://doc.rust-lang.org/cargo/commands/cargo-generate-lockfile.html)
> at the end of do_fetch ?
> Moreover, I think we should add the `--offline` option to cargo build
> because the error generated will be more clear:
>

Let me chuck that across our code base, I was fairly sure I'd seen
different problems with it, but it may have been whilst I was
debugging this first time around and am mis-remembering.

> | DEBUG: Executing shell function do_compile
> | NOTE: Using rust targets from
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/
> | NOTE: cargo =3D
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/bin/=
cargo
> | NOTE: cargo build -v --offline --target x86_64-poky-linux-gnu
> --release --manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/=
build/tmp/work/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/gi=
t//Cargo.toml
> | error: failed to get `zbus-git-dep-test` as a dependency of package
> `zbus-test v0.0.1
> (/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-pok=
y-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`
> |
> | Caused by:
> |  failed to load source for dependency `zbus-git-dep-test`
> |
> | Caused by:
> |  Unable to update
> ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git?branch=3Dmain
> |
> | Caused by:
> |  can't checkout from
> 'ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git': you are in
> the offline mode (--offline)
> | WARNING: exit code 101 from a shell command.
>
> Instead of
>
> | DEBUG: Executing shell function do_compile
> | NOTE: Using rust targets from
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/rust-targets/
> | NOTE: cargo =3D
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/recipe-sysroot-native/usr/bin/=
cargo
> | NOTE: cargo build -v --target x86_64-poky-linux-gnu --release
> --manifest-path=3D/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/=
work/core2-64-poky-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git//Cargo.t=
oml
> |   Updating git repository
> `ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git`
> | warning: spurious network error (2 tries remaining): failed to
> resolve address for gitlab.com: Temporary failure in name resolution;
> class=3DNet (12)
> | warning: spurious network error (1 tries remaining): failed to
> resolve address for gitlab.com: Temporary failure in name resolution;
> class=3DNet (12)
> | error: failed to get `zbus-git-dep-test` as a dependency of package
> `zbus-test v0.0.1
> (/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-pok=
y-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/git)`
> |
> | Caused by:
> |  failed to load source for dependency `zbus-git-dep-test`
> |
> | Caused by:
> |  Unable to update
> ssh://git@gitlab.com/fmartinsons/zbus-git-dep-test.git?branch=3Dmain
> |
> | Caused by:
> |  failed to clone into:
> /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build/tmp/work/core2-64-poky=
-linux/zbus-test/0.1.0.AUTOINC+507d3327e2-r0/cargo_home/git/db/zbus-git-dep=
-test-7f2b6322e3bb0cd5
> |
> | Caused by:
> |  network failure seems to have happened
> |  if a proxy or similar is necessary `net.git-fetch-with-cli` may help h=
ere
> |  https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-wit=
h-cli
> |
> | Caused by:
> |  failed to resolve address for gitlab.com: Temporary failure in name
> resolution; class=3DNet (12)|
> |  WARNING: exit code 101 from a shell command.
>
>
> In any case, I'll be glad to work on this patch if you tell me what
> strategy to adopt.
>
> On Mon, 13 Mar 2023 at 17:08, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > I understand, I'll pursue all my tests with the current poky master. Th=
anks
> >
> > On Mon, 13 Mar 2023 at 11:42, Alexander Kanavin <alex.kanavin@gmail.com=
> wrote:
> > >
> > > You need to use kirkstone or newer to see the bitbake-driven network
> > > disabling in action. Can you try on current poky master? You don't
> > > need to port the whole build to that, just one sample recipe.
> > >
> > > It is also expected that if you submit patches for master, they were
> > > tested on master.
> > >
> > > Alex
> > >
> > > On Mon, 13 Mar 2023 at 11:06, Fr=C3=A9d=C3=A9ric Martinsons
> > > <frederic.martinsons@gmail.com> wrote:
> > > >
> > > > hmm, how is the network disabled ?
> > > >
> > > > Because with the patch I provided , the git clone in do_compile is =
successful.
> > > >
> > > > One major thing I forget to mention is that I use dunfell branch wh=
ere
> > > > I backport all the cargo/rust relatives from master.
> > > > The backport was functional and straightforward, I just have to kee=
p
> > > > the custom crate fetcher in openembedded-core (meta/lib/crate.py)
> > > > because I'm stuck with bitbake 1.46.
> > > >
> > > >    -
> > > >
> > > > On Mon, 13 Mar 2023 at 10:46, Alex Kiernan <alex.kiernan@gmail.com>=
 wrote:
> > > > >
> > > > > Are you listing your ssh repos in your SRC_URI? We run with netwo=
rk
> > > > > disabled everywhere other than fetch and with that patch we don't=
 see
> > > > > fetches from local ssh repos in compile.
> > > > >
> > > > > On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martin=
sons
> > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > >
> > > > > > Thanks for the patch alex, I did try it and the same happened (=
git
> > > > > > clone failure during do_compile), I'll
> > > > > > dig more on that and possibly submit patches if I found a way o=
f
> > > > > > supporting git dependencies in Cargo.toml
> > > > > >
> > > > > > On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
> > > > > > >
> > > > > > > ISTR I tried this and ran into a different set of different p=
roblems.
> > > > > > >
> > > > > > > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > > > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Note that we're all rust neophytes, and rust support in yoc=
to is still
> > > > > > > > evolving towards maturity. If you can see better ways to do=
 things,
> > > > > > > > patches would be most welcome - but 'no network access exce=
pt in
> > > > > > > > bitbake fetchers' is a core rule.
> > > > > > > >
> > > > > > > > Alex
> > > > > > > >
> > > > > > > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > I understand there should not be a fetch during build ste=
p , I'll try
> > > > > > > > > to find why .
> > > > > > > > > In the mean time, if this is a strong rule, shouldn't we =
invoke "cargo
> > > > > > > > > build" with  --offline option ?
> > > > > > > > >
> > > > > > > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kan=
avin@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martin=
sons
> > > > > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > > > > > But the compile step tried to git clone anyway and so=
 it failed like I
> > > > > > > > > > > showed in my first email.
> > > > > > > > > >
> > > > > > > > > > You need to figure out why this happens, because it sho=
uld not. We
> > > > > > > > > > have plenty of recipes that list crates in SRC_URI in o=
e-core, so you
> > > > > > > > > > could start by studying how they work.
> > > > > > > > > >
> > > > > > > > > > Accessing network anywhere except do_fetch is not allow=
ed for
> > > > > > > > > > reproducibility and license compliance reasons (both br=
eak if that
> > > > > > > > > > happens).
> > > > > > > > > >
> > > > > > > > > > 'cargo bitbake' is a 3rd party project with questionabl=
e maintenance
> > > > > > > > > > status that we do not support. The official way is to u=
se
> > > > > > > > > > cargo-update-recipe-crates class.
> > > > > > > > > >
> > > > > > > > > > Alex
> > > > > > > >
> > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > Links: You receive all messages sent to this group.
> > > > > > > > View/Reply Online (#178420): https://lists.openembedded.org=
/g/openembedded-core/message/178420
> > > > > > > > Mute This Topic: https://lists.openembedded.org/mt/97555635=
/3618097
> > > > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-=
core/unsub [alex.kiernan@gmail.com]
> > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Alex Kiernan
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Alex Kiernan



--=20
Alex Kiernan

