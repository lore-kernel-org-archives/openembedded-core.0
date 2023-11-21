Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E58C61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 15:58:11 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.45027.1700582288189877497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 07:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJTGSuLm;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3594cb642beso20543875ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 07:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700582287; x=1701187087; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uN9aEEUXlp83064kTiIoQUmnoAQol63F75g5vU5kQqQ=;
        b=WJTGSuLmNNKzX+yqKI3NlRYzV6nmW652WjeZJxS2i2kkhqs6uQBYOu3fJ6dacr9mgR
         KKSPxftsQUTshVuFC5Rk9ldjQ64qCt5cY3qjGL93EWr8TYEr/FGy5yobvREgIRL67qgL
         UUk5YGj3Uvf9/v7HM4nRVNB5d7oEndl8JSTPcciQbEu0zeWPyObfIepzgfBl7+U8EDoK
         8JmYHsgf30+aQ1hsyJKLk97ow2Ld+jipjpLrM55QTQJ9Gn0XbKLSAgc7p9RmIqup0Hnt
         J4WNWo2lwCJwSIAGPcCUH4zHc3YSGCO+FgyAPSUJnTVopDZIE2A7OKIoBl799W1Y0hCD
         fYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582287; x=1701187087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uN9aEEUXlp83064kTiIoQUmnoAQol63F75g5vU5kQqQ=;
        b=cZoUgc69h7oLN3rPDmaDkXsCY/3KrZMsdmRHLbC4tEo41vI1j7QLqwy0B8GQ2++ZZI
         rtc/uL2RRULVGDxdBM2R+kz8ku8PNh4pLcJxJbSLZpnJy3oaiOC8LiCbLd8keuExMmqY
         Wy6DvuhubdgiweiL5eaQkgnmkJTi4zk+ys7JxnufSOsE/6AkFCNq97dWlDkHlJqW1e16
         No8z+oAYzR3OeF8F1gifyLQF91lx8a27As0+ir3446CKpBTaTKBwDIgS5NhI389WRujY
         8HVmZE1dzaJ/VPt1KJoFKhH7b3tpDCOWGcBGxxmSQ02Hc95Ke+APNiLecWc4TJgzLKOQ
         cvwQ==
X-Gm-Message-State: AOJu0YwalOzMlMorrj20ic10o4L76OgQarYpJmfuYs3ySrRBXUned3MG
	OFrmcCTT97YgHbQRQt6T+MpH7MSo9muYjuDLo74=
X-Google-Smtp-Source: AGHT+IGhWwCjDfk/ekMjHNR5N/tNlvy/ZhFityCCLswK/hmozc9usIhq+RZ8bQ65Ln65bMfHgoV5y4dyuKLam64TVZU=
X-Received: by 2002:a05:6e02:220e:b0:359:30b1:425b with SMTP id
 j14-20020a056e02220e00b0035930b1425bmr17801450ilf.23.1700582287427; Tue, 21
 Nov 2023 07:58:07 -0800 (PST)
MIME-Version: 1.0
References: <1795D005C571B567.15940@lists.openembedded.org>
 <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com> <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
 <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com> <179867874B67F596.6542@lists.openembedded.org>
 <CAO5Uq5Tn=M_P5ZqPobN8nsu1KtgvHgZhPhQWpvUSR-6UmFdzeg@mail.gmail.com> <2d435d97-a7c0-40b4-88ea-6e8b9f245dab@windriver.com>
In-Reply-To: <2d435d97-a7c0-40b4-88ea-6e8b9f245dab@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 21 Nov 2023 15:57:56 +0000
Message-ID: <CAO5Uq5Qq1V0pWT4F915QSG6rkjMwJU7BukBAXPVAO6=07YpOSA@mail.gmail.com>
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, randy.macleod@windriver.com, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 15:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190985

On Tue, Nov 21, 2023 at 11:30=E2=80=AFAM Yash Shinde <Yash.Shinde@windriver=
.com> wrote:
>
>
> On 20-11-2023 21:57, Alex Kiernan wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > I've finally got this running in a way I can usefully inspect and try
> > things and it's beginning to feel like we've headed into something
> > which simply isn't supported.
> >
> > The failure is this:
> >
> >    thread 'main' panicked at src/tools/compiletest/src/common.rs:519:30=
:
> >    no entry found for key
> >
> > Which is empty because the mapping list is collected by running rustc
> > with -Z unstable-options --print=3Dall-target-specs-json, but that fail=
s
> > because we're not running a nightly compiler:
> >
> >    error: the option `Z` is only accepted on the nightly compiler
> >    help: consider switching to a nightly toolchain: `rustup default nig=
htly`
> >    note: selecting a toolchain with `+toolchain` arguments require a
> > rustup proxy; see
> > <https://rust-lang.github.io/rustup/concepts/index.html>
> >    note: for more information about Rust's stability policy, see
> > <https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-=
features>
> >
> > Basically feels like running the test suite is only supported on the
> > nightlies...
> I saw the same error earlier.
>
> Investigating further, we understood that the issue is not related to
> running on nightly channel. The '-Z unstable options' were also present
> in earlier rust versions and removing of the newly added -Z options
> after 1.70 also didn't solve the problem.
>

There's a fair number of changes in the test framework around the code
that calls out to rustc with new paths that use
--print=3Dall-target-specs-json unconditionally. Assuming I've read it
right, -Zunstable-options is only evaluated at the point where you
actually try and use such an option which is covered by
unstable-options, so just passing it in doesn't get you a failure.

> On doing further analysis, we found that the custom target config/specs
> were not fetched during the rust build.
>
> The log for reference is as follows:
>
> Building stage1 library artifacts (x86_64-unknown-linux-gnu ->
> x86_64-poky-linux-gnu)
> error: failed to run `rustc` to learn about target-specific information
>
> Caused by:
>    process didn't exit successfully: `
> build-st/tmp/work/core2-64-poky-linux/rust/1.72.0/rustc-1.72.0-src/build/=
bootstrap/debug/rustc
> - --crate-name ___ --print=3Dfile-names -Csymbol-mangling-version=3Dlegac=
y
> -Zunstable-options -Zunstable-options '--check-cfg=3Dvalues(bootstrap)'
> '--check-cfg=3Dvalues(stdarch_intel_sde)'
> '--check-cfg=3Dvalues(no_fp_fmt_parse)'
> '--check-cfg=3Dvalues(no_global_oom_handling)' '--check-cfg=3Dvalues(no_r=
c)'
> '--check-cfg=3Dvalues(no_sync)' '--check-cfg=3Dvalues(freebsd12)'
> '--check-cfg=3Dvalues(freebsd13)'
> '--check-cfg=3Dvalues(backtrace_in_libstd)'
> '--check-cfg=3Dvalues(target_env,"libnx")'
> '--check-cfg=3Dvalues(target_arch,"asmjs","spirv","nvptx","xtensa")'
> -Zmacro-backtrace -Clink-args=3D-Wl,-z,origin
> '-Clink-args=3D-Wl,-rpath,$ORIGIN/../lib' -Csplit-debuginfo=3Doff
> -Cprefer-dynamic -Zinline-mir -Cembed-bitcode=3Dyes
> '-Zcrate-attr=3Ddoc(html_root_url=3D"https://doc.rust-lang.org/1.72.0/")'
> --target x86_64-poky-linux-gnu --crate-type bin --crate-type rlib
> --crate-type dylib --crate-type cdylib --crate-type staticlib
> --crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo
> --print=3Dcrate-name --print=3Dcfg` (exit status: 1)
>    --- stderr
>    error: Error loading target specification: Could not find
> specification for target "x86_64-poky-linux-gnu". Run `rustc --print
> target-list` for a list of built-in targets
>

Out of interest, did you try 1.71.0 to see if that failed? Based on
reading the commit log for src/tools/compiletest/src/common.rs, I
suspect it will fail.

--=20
Alex Kiernan

