Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA79C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:24:27 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.90745.1700745865355871967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2SSWXcT;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35b07f701c4so2416005ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700745864; x=1701350664; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM0U3Nshqcja87AgwSc+/nt8Ysz7/RSiHBucerv7zHA=;
        b=g2SSWXcT/DYTjaET0vhLKojhqreUA86LKGon3p1WvGNjpKySVReUVv9GOucTCVyg5y
         K5VmrzTRUk5wo3WBRa5SFRQLwyzGUdXPTiH25vsldm3ChTkwtmtPyYt7N8ckL1JZpMlP
         3xpHSwLqLNjK+9N3zgo27AEKpdp/G3m8/cfrXzETaDT+mWPt/dqAvb0bn2vccgIgck/S
         DFzPRU0gvVYUxNE3acCZQTtTeIV8vc33wSZcVcACXlIDSgl4iAopafe1YsA0wKbRWYCh
         HhiVJP4DNPyNcN2MTGovNk4SmAhspQ6kvogQXrGhIamI/UCr3rQftI+TcrWSIn4QTxV8
         0xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700745864; x=1701350664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM0U3Nshqcja87AgwSc+/nt8Ysz7/RSiHBucerv7zHA=;
        b=l3uGF6AjiLxaWeUS5YhyJjOLh8NjN08fXeHJdjMChnwNyHRysqv+0/1XqMqoDgjDij
         SklxX/dMxpnBKJSC/DfmWTbSiMMRLNgq+nsuQoutaq5gQZy9UUBCkl5lTKMSVlawhHDe
         X5FyC1rnmCubcbzbpZVU9yOt+QCb4PbnyUnAyyavz+CVjR3WgJmfPt4kkmPQjKWlRKMj
         qMdwOIQv1drgR1EmNDKLpQ4zavotdIvfKmrEfwat7TC4rc+60gWBpe1z8Ky20M2pJU2e
         DpK9ASyEqQpDHaxTxeDJ3OrtGOR60PNAapoyDk8595Vq98oP2F3UCdWtG49K6fvmFqMv
         mVUw==
X-Gm-Message-State: AOJu0YzgUMHvWyw9FdOC3rWtKCJFfs76sZDK2nlfcsbYIEr9U2jS0rB5
	SxNzRVLwirIwOwYEde5GjoY0WVsDshqkLNSuWpI=
X-Google-Smtp-Source: AGHT+IGFcLfnNLhRBbRpPmqv6HcUwXBYWvpzLSNdffOWTy2wpGVRw+/ShfLA/fST7SSBvyAu54oQMbpJ8lVz7Antuxo=
X-Received: by 2002:a05:6e02:1a0c:b0:35b:37a:f25e with SMTP id
 s12-20020a056e021a0c00b0035b037af25emr6865384ild.5.1700745864481; Thu, 23 Nov
 2023 05:24:24 -0800 (PST)
MIME-Version: 1.0
References: <1795D005C571B567.15940@lists.openembedded.org>
 <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com> <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
 <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com> <179867874B67F596.6542@lists.openembedded.org>
 <CAO5Uq5Tn=M_P5ZqPobN8nsu1KtgvHgZhPhQWpvUSR-6UmFdzeg@mail.gmail.com>
 <2d435d97-a7c0-40b4-88ea-6e8b9f245dab@windriver.com> <CAO5Uq5Qq1V0pWT4F915QSG6rkjMwJU7BukBAXPVAO6=07YpOSA@mail.gmail.com>
 <26429db3-06a7-459c-b17a-bea4af0cda3c@windriver.com>
In-Reply-To: <26429db3-06a7-459c-b17a-bea4af0cda3c@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 23 Nov 2023 13:24:13 +0000
Message-ID: <CAO5Uq5TdNY81mLFmfiPf6HExwCD9SXp2R=j0j95kP-pgCO40AA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191150

On Wed, Nov 22, 2023 at 2:18=E2=80=AFPM Yash Shinde <Yash.Shinde@windriver.=
com> wrote:
>
>
> On 21-11-2023 21:27, Alex Kiernan wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Tue, Nov 21, 2023 at 11:30=E2=80=AFAM Yash Shinde <Yash.Shinde@windr=
iver.com> wrote:
> >>
> >> On 20-11-2023 21:57, Alex Kiernan wrote:
> >>> CAUTION: This email comes from a non Wind River email account!
> >>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> >>>
> >>> I've finally got this running in a way I can usefully inspect and try
> >>> things and it's beginning to feel like we've headed into something
> >>> which simply isn't supported.
> >>>
> >>> The failure is this:
> >>>
> >>>     thread 'main' panicked at src/tools/compiletest/src/common.rs:519=
:30:
> >>>     no entry found for key
> >>>
> >>> Which is empty because the mapping list is collected by running rustc
> >>> with -Z unstable-options --print=3Dall-target-specs-json, but that fa=
ils
> >>> because we're not running a nightly compiler:
> >>>
> >>>     error: the option `Z` is only accepted on the nightly compiler
> >>>     help: consider switching to a nightly toolchain: `rustup default =
nightly`
> >>>     note: selecting a toolchain with `+toolchain` arguments require a
> >>> rustup proxy; see
> >>> <https://rust-lang.github.io/rustup/concepts/index.html>
> >>>     note: for more information about Rust's stability policy, see
> >>> <https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstabl=
e-features>
> >>>
> >>> Basically feels like running the test suite is only supported on the
> >>> nightlies...
> >> I saw the same error earlier.
> >>
> >> Investigating further, we understood that the issue is not related to
> >> running on nightly channel. The '-Z unstable options' were also presen=
t
> >> in earlier rust versions and removing of the newly added -Z options
> >> after 1.70 also didn't solve the problem.
> >>
> > There's a fair number of changes in the test framework around the code
> > that calls out to rustc with new paths that use
> > --print=3Dall-target-specs-json unconditionally. Assuming I've read it
> > right, -Zunstable-options is only evaluated at the point where you
> > actually try and use such an option which is covered by
> > unstable-options, so just passing it in doesn't get you a failure.
> >
> >> On doing further analysis, we found that the custom target config/spec=
s
> >> were not fetched during the rust build.
> >>
> >> The log for reference is as follows:
> >>
> >> Building stage1 library artifacts (x86_64-unknown-linux-gnu ->
> >> x86_64-poky-linux-gnu)
> >> error: failed to run `rustc` to learn about target-specific informatio=
n
> >>
> >> Caused by:
> >>     process didn't exit successfully: `
> >> build-st/tmp/work/core2-64-poky-linux/rust/1.72.0/rustc-1.72.0-src/bui=
ld/bootstrap/debug/rustc
> >> - --crate-name ___ --print=3Dfile-names -Csymbol-mangling-version=3Dle=
gacy
> >> -Zunstable-options -Zunstable-options '--check-cfg=3Dvalues(bootstrap)=
'
> >> '--check-cfg=3Dvalues(stdarch_intel_sde)'
> >> '--check-cfg=3Dvalues(no_fp_fmt_parse)'
> >> '--check-cfg=3Dvalues(no_global_oom_handling)' '--check-cfg=3Dvalues(n=
o_rc)'
> >> '--check-cfg=3Dvalues(no_sync)' '--check-cfg=3Dvalues(freebsd12)'
> >> '--check-cfg=3Dvalues(freebsd13)'
> >> '--check-cfg=3Dvalues(backtrace_in_libstd)'
> >> '--check-cfg=3Dvalues(target_env,"libnx")'
> >> '--check-cfg=3Dvalues(target_arch,"asmjs","spirv","nvptx","xtensa")'
> >> -Zmacro-backtrace -Clink-args=3D-Wl,-z,origin
> >> '-Clink-args=3D-Wl,-rpath,$ORIGIN/../lib' -Csplit-debuginfo=3Doff
> >> -Cprefer-dynamic -Zinline-mir -Cembed-bitcode=3Dyes
> >> '-Zcrate-attr=3Ddoc(html_root_url=3D"https://doc.rust-lang.org/1.72.0/=
")'
> >> --target x86_64-poky-linux-gnu --crate-type bin --crate-type rlib
> >> --crate-type dylib --crate-type cdylib --crate-type staticlib
> >> --crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo
> >> --print=3Dcrate-name --print=3Dcfg` (exit status: 1)
> >>     --- stderr
> >>     error: Error loading target specification: Could not find
> >> specification for target "x86_64-poky-linux-gnu". Run `rustc --print
> >> target-list` for a list of built-in targets
> >>
> > Out of interest, did you try 1.71.0 to see if that failed? Based on
> > reading the commit log for src/tools/compiletest/src/common.rs, I
> > suspect it will fail.
> >
> Yes, that fails in 1.71.0 also. The 1.71 build progresses to check some
> test suites before failing as follows-
>

I think this is where our problems start:

commit c075691b825dce55e4261aba570cd2d9665950c0
Author: Pietro Albini <pietro.albini@ferrous-systems.com>
Date:   Thu Mar 9 17:14:25 2023 +0100

    use --print=3Dall-target-specs-json for stage1+

But there's a bunch of commits in 1.71.0 which build on that, but
which aren't isolated to just that code, so I'm struggling to "revert"
just that change to prove it.

If it's useful I brought up all the intermediate versions into my tree
if it's useful (though I've only build tested 1.71.0 and 1.74.0).

--=20
Alex Kiernan

