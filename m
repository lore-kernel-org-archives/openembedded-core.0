Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE37C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 03:42:42 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.36160.1676346157523222990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 19:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lteUxYDa;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-15f97c478a8so17547147fac.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 19:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+iBexBm4HIR3QO82YcRQyioDszvB5QU0hzYz1KQFVls=;
        b=lteUxYDaMw/LLAibqFggS1BF7kaAr1Qx0gzCCv887aN0U7Zhhcg+VDsHfGfu9j1xHI
         2e3IlBWptT5tDnA9eI4RbnHz2TCYqxU0AWV4kUTPDnDWsVWBM/9S3y8iUbYV2knPvdXZ
         1NcNqtWhOu8d5J/PwtU3MeS+V0mmzbozF1ZrsHo/6HdDlfn5iBcyHqUi2j9nek7zlutn
         1mZ/wjQ4p4IKn+J4/Q5Uhhp+Yyci7G89b367bmzTM+H3OlH/jNqbpvDi13s04D0egrzF
         86EEuW4MjqiILKnRFP5R1OufFST9Y6qnrhTVKCVKI8rCRgNhHWiwo7HdJbb5VfpLC9Wk
         TnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iBexBm4HIR3QO82YcRQyioDszvB5QU0hzYz1KQFVls=;
        b=trcCNjE1dLfSgJjmguRsrYdyVZ6rRWF4Gj81a5U6AHfTAY8h9fZchIxfKQw5TKusjg
         i5Pcoq1KKN1gkw5C5fKFSS4pHzCGE7aZRbpvl8Kfaw1sAImF7t+oWIiqACaOIWmdsIpt
         e7j428RKi0OKzAIegIe84fVAgV0Ql0kXnoxCGBRaKplD0U8N6NcL6GkXJ+HQykRbFtKV
         dy5nDeX1cHaS3ErcuwBuxYqgpkb7Ut+GasTM269mZq4c4mig90/nCxDSv6L0lk+qIToC
         fhrKO481xnF5mUchSGzcH7wd445tD4Avhv2C1GIW7t9UN2NZUNpDpOW9V4ZgkdFRuTRc
         tDmw==
X-Gm-Message-State: AO0yUKX8tarFD5yzLCnb/U/m2QG50ULu+nY3uVWnycBL8aSEjCx1F5vY
	H1/si03ear8LU0qfFUolrVpcPxSgp9YWxDW/0Rk=
X-Google-Smtp-Source: AK7set83GPKJKd0cEIU3akno/zka1CMplGFIUN/6a7yk8Qc5dPI1mvMvOa1NuGlJoOiiC0/VDAng4KZGOUwjISYh8X0=
X-Received: by 2002:a05:6870:e0c6:b0:16d:e8ac:8424 with SMTP id
 a6-20020a056870e0c600b0016de8ac8424mr54592oab.179.1676346156643; Mon, 13 Feb
 2023 19:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20230211153828.2113018-1-dmitry.baryshkov@linaro.org> <CANNYZj-O2ozNM6NUJuKEzKHiOPf7y1kcE=b2eDwwkAY4RBCKkA@mail.gmail.com>
In-Reply-To: <CANNYZj-O2ozNM6NUJuKEzKHiOPf7y1kcE=b2eDwwkAY4RBCKkA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 14 Feb 2023 05:42:24 +0200
Message-ID: <CALT56yOs97bVa0hc9NZs80qg_MJX6yOJtcF4MPr4XP5hZj_FzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust-android-sparse: add lightweight
 simg2img/img2simg implementation
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 03:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177119

On Sat, 11 Feb 2023 at 19:10, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> But is it necessary or desirable to have it in core? This does seem
> like something that belongs in meta-oe rather.

My goal was to move sparse image handling in a way to be able to
generate them from the BSP layers, removing dependency on the meta-oe
layer. This way it is possible to generate sparse images
unconditionally and then let the user feed them to fastboot.

But yeah, if it's recommended to keep it in meta-oe, I can move my recipe there.

>
> Alex
>
> On Sat, 11 Feb 2023 at 16:38, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> >
> > The Android's simg2img/img2simg comes from android-tools, which is a
> > huge package with lots of dependencies on its own. It resides inside
> > meta-oe rather than OE-Core. Add lightweight tool to handle sparse
> > images, which is small enough to be pushed into OE-Core.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../rust-android-sparse_0.6.0.bb              | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 meta/recipes-extended/rust-android-sparse/rust-android-sparse_0.6.0.bb
> >
> > diff --git a/meta/recipes-extended/rust-android-sparse/rust-android-sparse_0.6.0.bb b/meta/recipes-extended/rust-android-sparse/rust-android-sparse_0.6.0.bb
> > new file mode 100644
> > index 000000000000..83652b9d452f
> > --- /dev/null
> > +++ b/meta/recipes-extended/rust-android-sparse/rust-android-sparse_0.6.0.bb
> > @@ -0,0 +1,68 @@
> > +# Auto-Generated by cargo-bitbake 0.3.16
> > +#
> > +inherit cargo
> > +
> > +# how to get android-sparse could be as easy as but default to a git checkout:
> > +SRC_URI += "crate://crates.io/android-sparse/0.6.0"
> > +S= "${CARGO_VENDORING_DIRECTORY}/android-sparse-${PV}"
> > +
> > +# please note if you have entries that do not begin with crate://
> > +# you must change them to how that package can be fetched
> > +SRC_URI += " \
> > +    crate://crates.io/aho-corasick/0.7.18 \
> > +    crate://crates.io/assert_cmd/0.9.1 \
> > +    crate://crates.io/autocfg/1.0.1 \
> > +    crate://crates.io/bitflags/1.3.2 \
> > +    crate://crates.io/build_const/0.2.2 \
> > +    crate://crates.io/byteorder/1.4.3 \
> > +    crate://crates.io/cfg-if/1.0.0 \
> > +    crate://crates.io/clap/2.34.0 \
> > +    crate://crates.io/crc/1.8.1 \
> > +    crate://crates.io/difference/2.0.0 \
> > +    crate://crates.io/escargot/0.3.1 \
> > +    crate://crates.io/float-cmp/0.4.0 \
> > +    crate://crates.io/getrandom/0.2.3 \
> > +    crate://crates.io/itoa/0.4.8 \
> > +    crate://crates.io/libc/0.2.109 \
> > +    crate://crates.io/memchr/2.4.1 \
> > +    crate://crates.io/normalize-line-endings/0.2.2 \
> > +    crate://crates.io/num-traits/0.2.14 \
> > +    crate://crates.io/ppv-lite86/0.2.15 \
> > +    crate://crates.io/predicates-core/0.9.0 \
> > +    crate://crates.io/predicates-tree/0.9.0 \
> > +    crate://crates.io/predicates/0.9.1 \
> > +    crate://crates.io/proc-macro2/1.0.33 \
> > +    crate://crates.io/quote/1.0.10 \
> > +    crate://crates.io/rand/0.8.4 \
> > +    crate://crates.io/rand_core/0.6.3 \
> > +    crate://crates.io/rand_chacha/0.3.1 \
> > +    crate://crates.io/rand_hc/0.3.1 \
> > +    crate://crates.io/redox_syscall/0.2.10 \
> > +    crate://crates.io/regex-syntax/0.6.25 \
> > +    crate://crates.io/regex/1.5.4 \
> > +    crate://crates.io/remove_dir_all/0.5.3 \
> > +    crate://crates.io/ryu/1.0.6 \
> > +    crate://crates.io/serde/1.0.130 \
> > +    crate://crates.io/serde_derive/1.0.130 \
> > +    crate://crates.io/serde_json/1.0.72 \
> > +    crate://crates.io/syn/1.0.82 \
> > +    crate://crates.io/tempfile/3.2.0 \
> > +    crate://crates.io/textwrap/0.11.0 \
> > +    crate://crates.io/treeline/0.1.0 \
> > +    crate://crates.io/unicode-width/0.1.9 \
> > +    crate://crates.io/unicode-xid/0.2.2 \
> > +    crate://crates.io/wasi/0.10.2+wasi-snapshot-preview1 \
> > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi/0.3.9 \
> > +"
> > +
> > +LIC_FILES_CHKSUM = " \
> > +    file://LICENSE;md5=0ffe68749328daf57dd85d5ca6ee981f \
> > +"
> > +
> > +SUMMARY = "An implementation of Android's sparse file format."
> > +HOMEPAGE = "https://gitlab.com/ra_kete/android-sparse-rs"
> > +LICENSE = "MIT"
> > +
> > +BBCLASSEXTEND += "native"
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177007): https://lists.openembedded.org/g/openembedded-core/message/177007
> > Mute This Topic: https://lists.openembedded.org/mt/96898285/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



--
With best wishes
Dmitry

