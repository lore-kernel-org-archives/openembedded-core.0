Return-Path: <pham.francesco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D96C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:21:13 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.7764.1642170072574698133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BynJ8dvL;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: pham.francesco@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id t18so13375145plg.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=K6wsexO27sR4BIm6Svs2toxsTFBi3XoQJFKbxcQMnqw=;
        b=BynJ8dvLH1Ek940Z+I3FcD4it5+i5dx+MPBDNb3hcoRDNf7y0VGaCb6WxSYjbyaWxQ
         9JbNoyC675VJnvPBTjEs6RyMgj1UTfnHLvchd43tQrwK1lqzP8UEpRZKxVcv05nigGt5
         /1n9YWZNi/dCL7rribNX14mtP3XlipCRyDf26oZKXzW5AufabOAk3FY+RQwCTGoIQsku
         7bLpliIz4Nlxtfp6mwQ73ku6UmPwUfTADQx89FWB0xrHkYo+rHkK9W4x4fklUoih9He4
         t1paf8JprqL06wAw7PuHzxMa5u5uo9TeO8Ah0rprrBDnhL7o+Dur91SonH6pvvYiuccB
         INqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=K6wsexO27sR4BIm6Svs2toxsTFBi3XoQJFKbxcQMnqw=;
        b=0J34lvpuRvMIZfTxs7xfxEgCf5waFeAz2TQvQP22++R7/1RsVQOoyDOZsu9XYjtgZz
         YHRqrSuH1HQ75UqF+hv/Z9wz4QbZBgxVKJYh6rbjNfryERZDtl/tNw+JAAwjpD0ypfYE
         rGcL8Rac6FSiWIJiAkeMtAfRi7EZ+AgU9oClYq9C05YP/m/ZeZtDu7tWkJ9a5CbO6Rpy
         vFcuMu/f0zIPQU1GUpPu+xLNEKI0nYEzrAOgmoF1PvIyqVOfwJZxRnGBxCz+73/C5mok
         PgXj/q2sDg2gld/bDPnKXOmj6BC/egJVwUtbSnbjSAJGM7+WanRQHebNeRAatsxrbgYF
         WxWQ==
X-Gm-Message-State: AOAM531+ERAW3crb5eNco0WiXG+yMmfFXpzsMgfB1nzxeymhAoHnjGTD
	C7S9gZdIalcp/w98KXd6BBXJbOf28e3vhnCe7QgCnnd7
X-Google-Smtp-Source: 
 ABdhPJwaKnFO6WfsF+VNFP+vmYvXr8XD33+mlZrurrs4SrCIyZQYB+zwqUgHGOdgSvCGlm9tWd904ucOUzAv6yH0mwg=
X-Received: by 2002:a17:90a:d3c8:: with SMTP id
 d8mr10891904pjw.189.1642170071726;
 Fri, 14 Jan 2022 06:21:11 -0800 (PST)
MIME-Version: 1.0
From: Francesco Pham <pham.francesco@gmail.com>
Date: Fri, 14 Jan 2022 15:21:00 +0100
Message-ID: 
 <CAL1ChxrincK92a9tFxq=O6j8wNpccdebywqoeYMS+He1ED4tTA@mail.gmail.com>
Subject: [rust] error: the crate panic_abort does not have the panic strategy
 abort
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 14:21:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160568

Hi,
the following error appears when trying to build a simple rust hello
world that uses panic set to abort mode.

> | DEBUG: Executing shell function do_compile
> | NOTE: cargo =3D /home/francesco/Desktop/poky/build/tmp/work/core2-64-po=
ky-linux/rust-panic-test/git-r0/recipe-sysroot-native/usr/bin/cargo
> | NOTE: rustc =3D
> | NOTE: cargo build -v --target x86_64-poky-linux --release --manifest-pa=
th=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-p=
anic-test/git-r0/git//Cargo.toml
> |    Compiling rust-hello-world v0.0.1 (/home/francesco/Desktop/poky/buil=
d/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/git)
> |     Building [                             ] 0/1: rust-hello-world(bin)
> |      Running `rustc --crate-name rust_hello_world --edition=3D2018 src/=
main.rs --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --crate-typ=
e bin --emit=3Ddep-info,link -C opt-level=3D3 -C panic=3Dabort -C lto -C me=
tadata=3D38cc6f415494c65c -C extra-filename=3D-38cc6f415494c65c --out-dir /=
home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-t=
est/git-r0/build/target/x86_64-poky-linux/release/deps --target x86_64-poky=
-linux -C linker=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-pok=
y-linux/rust-panic-test/git-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-tes=
t/git-r0/build/target/x86_64-poky-linux/release/deps -L dependency=3D/home/=
francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/g=
it-r0/build/target/release/deps -L /home/francesco/Desktop/poky/build/tmp/w=
ork/core2-64-poky-linux/rust-panic-test/git-r0/recipe-sysroot/usr/lib/rust =
--remap-path-prefix=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-=
poky-linux/rust-panic-test/git-r0=3D/usr/src/debug/rust-panic-test/git-r0`
> | error: the crate `panic_abort` does not have the panic strategy `abort`
> |
> | error: aborting due to previous error
> |
> | error: could not compile `rust-hello-world`
> |
> | Caused by:
> |   process didn't exit successfully: `rustc --crate-name rust_hello_worl=
d --edition=3D2018 src/main.rs --error-format=3Djson --json=3Ddiagnostic-re=
ndered-ansi --crate-type bin --emit=3Ddep-info,link -C opt-level=3D3 -C pan=
ic=3Dabort -C lto -C metadata=3D38cc6f415494c65c -C extra-filename=3D-38cc6=
f415494c65c --out-dir /home/francesco/Desktop/poky/build/tmp/work/core2-64-=
poky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/de=
ps --target x86_64-poky-linux -C linker=3D/home/francesco/Desktop/poky/buil=
d/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/wrapper/target-rust-c=
cld -L dependency=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-po=
ky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps=
 -L dependency=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-=
linux/rust-panic-test/git-r0/build/target/release/deps -L /home/francesco/D=
esktop/poky/build/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0/recip=
e-sysroot/usr/lib/rust --remap-path-prefix=3D/home/francesco/Desktop/poky/b=
uild/tmp/work/core2-64-poky-linux/rust-panic-test/git-r0=3D/usr/src/debug/r=
ust-panic-test/git-r0` (exit status: 1)
> | WARNING: exit code 101 from a shell command.

A similar error also appears when the panic strategy is set to unwind
The recipe, generated using cargo bitbake, is as follows:

> inherit cargo
> SRC_URI +=3D "git://git@github.com/frankplus/rust-hello-world.git;protoco=
l=3Dhttps;branch=3Dmaster"
> SRCREV =3D "68b7f7ee7df6e08a0411ba7157761145c43baf5d"
> S =3D "${WORKDIR}/git"
> SUMMARY =3D "rust-hello-world"
> HOMEPAGE =3D "https://github.com/frankplus/rust-hello-world"
> LICENSE =3D "MIT | Apache-2.0"
> LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3De6b2207ac3740d2d01141c49208c=
2147"

Version: honister @ f286eef, master @ f9f3e1
Component: meta/recipes-devtools/rust
Relate-to: https://github.com/meta-rust/meta-rust/issues/343

