Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC2CC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 10:35:11 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.5446.1678790101352578694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 03:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H3qqum1n;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id h3so15468466lja.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678790099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg0kNnAUf7BVnaGm2PebNykh3FoFexKSMfrOAUSc3MA=;
        b=H3qqum1nPJeqWIbuRXvQeZvkAKGM9kBbQ1MegToxcBDMgHwdwaMtnAurqHkj5xizqI
         PP/KHqaVk9YH6HYrbtwUGtIBDgYaYLnxOiO2q0Z0pewNtOlUe3RIxAWEFkaWnFBy6ti+
         edPPsMtJaYWeGWs6PYzuBXtq44GjhRhCyDV6bcmIBGYcJyNXCaJjxmSOYDou34ur+Gwh
         VVEDhtYmWkpR48tqyloxY4DBDzzcSd+4YQGu5BERDbdboVIrAZuXrG8jIfszTqbB3BhS
         spdKvHaN+VP1Y5ZJ2aU8Rk/e3GeGie0FKqfbPxlAxqerxwDGqWlxovzHmIAYjF0nuNJi
         1TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678790099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sg0kNnAUf7BVnaGm2PebNykh3FoFexKSMfrOAUSc3MA=;
        b=aeAp2dMcWN0tgEtEliXGRdvxwLYwO0ajcvUicKv6gvbIAroIrVIGEs3z8XEKv9up4v
         BSeC70foUsJfT1SYmm9Q1qEsDlf0JsluBATb29pjMQg/WS/HH/s+/g70dC/RJKKAK/nJ
         Hyelyn3kc+nU0m0fnTrakZMWGT4mx7lPRUL2x1vg4mCEyq4yohmZl4554hOKAJsE+7t9
         DCm/dgVTjZ3+6ju3fTnTbOSOzFyvEfWPQdiqAVPysMa9up22c04uMGKLd7kuj/c+OX5g
         2ms+agRQjJndOpbjSkuudEZiK951nT8pYI2+pgiSzYdC723TjH6Mta3QG7acTTrzgov7
         OGaw==
X-Gm-Message-State: AO0yUKWdZ2jKuLjUSRGVPfTqgrtoqW/UU2CA0OYS0BC72g3y9lCCv/sa
	ex7FZukO93saX4jkeC1t0/Zlo4xxSMXTFatKELw=
X-Google-Smtp-Source: AK7set/cHCRxVp36xKfqGK5KaeaLGqFfi8GRaI+xGI0yCquh+9E5lO+xRm9k1iq4C0SzGJE0TOa3M6WoqMsjCzDCK+8=
X-Received: by 2002:a05:651c:2322:b0:295:945d:b381 with SMTP id
 bi34-20020a05651c232200b00295945db381mr11683423ljb.7.1678790099384; Tue, 14
 Mar 2023 03:34:59 -0700 (PDT)
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
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Mar 2023 11:34:47 +0100
Message-ID: <CANNYZj9nxUwbJ6yQbnDZMtraM+Fv05LFkUQ8gKEkSbk1_70w+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 10:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178480

--offline seems like the right thing to add, if it produces better errors.

Generating Cargo.lock on the other hand is not right. We rely on rust
checking the source tree against the checksums in Cargo.lock (to
prevent supply chain attacks), and this would completely subvert that.
There could be better diagnostics around missing Cargo.lock, and steps
to address the issue, but such steps must be manually taken (even
though they could be codified in a special task, similar to how
generating list of crates in SRC_URI is a task).

Alex

On Tue, 14 Mar 2023 at 11:25, Fr=C3=A9d=C3=A9ric Martinsons
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
> Anyway, I would like to know how to you feel with this need for
> Cargo.lock problem ?
> Because for it to be generated, the project needs to be built once and
> if this is expected for binary type to have Cargo.lock under version
> control:
>  https://doc.rust-lang.org/cargo/faq.html#why-do-binaries-have-cargolock-=
in-version-control-but-not-libraries
> It is not for "library" project.
>
> Maybe we can add a "cargo generate-lockfile"
> (https://doc.rust-lang.org/cargo/commands/cargo-generate-lockfile.html)
> at the end of do_fetch ?
> Moreover, I think we should add the `--offline` option to cargo build
> because the error generated will be more clear:
>
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

