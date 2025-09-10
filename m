Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEDECA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 16:32:42 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.web10.23643.1757521953196575190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 09:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=memaYLf2;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-60170e15cf6so3418910d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757521952; x=1758126752; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdvHVFfmYySPoYMYjMX0DTOqfZqtVBfXZotTvPD7pC8=;
        b=memaYLf2mgYMHZ8dNhJuwV9UmgScajSxVyB4IdjOXxc/pa4MNXjW8psFJ94D2gLgDU
         piphYbSx1SD+M0svfZUHC8w7cWeWUuhgYuIXHcdAYEGEB9i34zS2greVwfFxk3XkkMqA
         SHuJyOkezyvLglNIvihNcTxICzEE7VL0E6StMOMG95B4d2ET5QKK5Z1yf/lyU1YCvsHV
         iVqEaS0EquNJ7lpO+BGPPIZ1TmEhv8aeUpXNUnz/fV2HD/ma7F7BKDFMn0d8u6HazIB1
         fT4rek6fvCoyrKQZ69WWMgXq43u4ngSPNhPE22yoK6ui+kHXe13/aA1p0/whlYHIDkhg
         lHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757521952; x=1758126752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdvHVFfmYySPoYMYjMX0DTOqfZqtVBfXZotTvPD7pC8=;
        b=IOEkYm6SgNu0psEZlflA1E0i2B/Mi++qxP11w4z+0Y5T7sSRicWJJqk9FhTZZWz51A
         pW6FxCZbCtm8mjtkCnL2HodvEvIjiLcoIKVU5R1M59jjW/CeI+LAOTZdaoRt91JQaFjN
         nWhsLr5s55aC6vJJXhEFn1Y5vq9h2KEM+FnrMNw9CcskeWGZ7atmQrlfCct+zjc2RUYq
         4p4jpkp6wADJE36k+n6TtCM1B9XrR+PB56sojqOUzLFzV3zrUmLbFu8yX9sURHPL962S
         v+3EYzi0YUAEE/q0CS4jip+P6WC4i4Y2KO3RlZnGmAG0u0NkBYVTCofhjWHlfREf20IY
         RNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRuuyUKf6OnvadvENjOQdDmz348FFCEzY4mpapfPw7A75pCaVmb8LZxtrvLmE04pIWPQep5izHgbWYscJ5JuIcFQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyg4lJPfIW28YfLKGnhF5FCXIYKEuUSJC7uhb7mhw23hDN2Ytwe
	3vM1WEsQK4WM+tiBd3GZMwrUn+WvUxg6Zg6h0sNBEGHmRnNwptwfQjMAl97/aZOk9FY7GYhKtbE
	tVQhSpdA1pXQ4UwWw20A9QjJRnjFzxzY=
X-Gm-Gg: ASbGncs8Q2xrDuLAq+q2O9pQ4JnPm3rQpX0G8WH5cMxTRQBQTYZcfe7Yq8zHZ09NKND
	+nI1MtkxxNT8xMVZSC3/OqIUA8t6UY1Q9onRSkdyo7BHM0T9SvOyGB1KOAOpd9rKPiVwSSzSmOp
	TV0YtUnfotS1xnTet2/bLb3eXub/87yU+yqQ1hK8QgfWyozosrYYtUawUZ71iGyrFiW1LnPhqx5
	ZOlsyQW3IAJqqk0U1JNnHkkdxByb6ABc8Qj88rDJT3RBmXdGjkAMAygUUbPA3KO/oPP6S2/SHxN
	zNb+eUccbJHlYASSP5hUL0+kSC25c04x5WriM1z9CO4oYZur/3QpcikPHQ==
X-Google-Smtp-Source: AGHT+IG6VPpJ7/RMepTRMeKo0+gWnY1LqqcH+hkXvPjc7micm0Rmbi3P9ulmicTeC+1BYQX1cXhbwoN1Hd/bZIS3s2w=
X-Received: by 2002:a05:690c:a96:b0:71c:bf3:afb0 with SMTP id
 00721157ae682-727f5649a1dmr133615387b3.40.1757521951993; Wed, 10 Sep 2025
 09:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
 <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com>
 <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com> <CAMKF1srZbQepXc5MAHphPARTu9XJFyQM-9fyotVX9bqA4LQNBg@mail.gmail.com>
 <2bb8039f-394b-4963-bae7-10edeb817686@windriver.com>
In-Reply-To: <2bb8039f-394b-4963-bae7-10edeb817686@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Sep 2025 09:32:04 -0700
X-Gm-Features: Ac12FXynyNAkmZvV3fdl1jeDWP88f6Qt3kjnPtyIUzv44-WsvQ5vxrWnQT83tA0
Message-ID: <CAMKF1spNo+N93K1-6rJycvVTxTR-v0GB4_z212a1LGmH5Vveqg@mail.gmail.com>
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>, 
	"Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 16:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223228

On Wed, Sep 10, 2025 at 7:13=E2=80=AFAM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 09-09-2025 21:44, Khem Raj wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Tue, Sep 9, 2025 at 1:19=E2=80=AFAM Deepesh Varatharajan
> <deepesh.varatharajan@windriver.com> wrote:
>
> On 28-08-2025 18:33, Alexander Kanavin wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Thu, 28 Aug 2025 at 13:45, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> We have removed rust-llvm and updated the Rust build to depend on Clang i=
nstead.
> With this change, we successfully built Rust for both native and target. =
Additionally,
> we ran a full bitbake world build without encountering any issues after d=
ropping rust-llvm.
>
> We now add these flags "-C link-arg=3D-lz -C link-arg=3D-lzstd" because o=
f this following diff
> otherwise we will get errors during link time.
>
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=3DOFF \
> -DLLVM_ENABLE_ZSTD=3DOFF \
> -DLLVM_ENABLE_FFI=3DOFF \
>
> Setup in clang
> -DLLVM_ENABLE_FFI=3DON \
> -DLLVM_ENABLE_ZSTD=3DON \
>
> You can find the relevant changes on the poky-contrib branch here:
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dharish/rust-llvm
>
> Differences seen in builds:
>
> with rust-llvm for bitbake rust
> real    54m54.184s
> user   0m13.470s
> sys     0m1.380s
>
> f/s usage
> 41G
>
> without rust-llvm for bitbake rust
> real    57m51.015s
> user   0m18.129s
> sys     0m2.051s
>
> f/s usage
> 45G
>
> We are open for suggestions, improvements, or concerns regarding this cha=
nge.
>
> Thanks for checking this! Is it possible to have a conversation in the
> rust upstream about starting to use proper clang, or reasons to
> continue using rust-llvm? Maybe there's a ticket or you can open one?
>
> While 'proper clang' appears to work now, deviating from what rust
> developers do is risky and can cause problems.
>
> Alex
>
> Hi All,
>
> Summary of discussion with the rust upstream about using latest LLVM inst=
ead of Rust maintained LLVM fork.
> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm=
-fork-what-rust-uses/23489
>
>
> Upstream LLVM is generally compatible:
> - Rust does support building with upstream (vanilla) LLVM, especially the=
 latest major release and the one or two preceding ones.
> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating=
-llvm
>
> Thanks for the discussion, I think its expected that there are rust
> specific backports, but it seems its not a whole lot of patches with
> llvm20
> and I hope things are just getting better with future releases. We
> need to ensure that such patches are not regressing clang if we do
> that sort
> of backport, hopefully there will be no conflcits.
>
> Things to note when using Upstream LLVM:
> - Rust may include cherry-picked bugfixes in its LLVM fork and so using u=
pstream LLVM might lacking bug fixes from rust's forked llvm. (But,
> this anyway we will catch it up with newly released rust update)
> - If a bug shows up using vanilla LLVM, it's on us to track it down unles=
s it's a known issue. (In general, the latest llvm is always under test wit=
h
> rust nightly builds)
>
>
> Impact on Yocto Rust upgrades:
> - Rust upgrades shall always check for updates on rust forked llvm and ba=
ckport the relevant patches to clang's llvm.
>
> right
>
>
> Regarding the rust forked llvm local patches:
> - There are no local patches on rust forked llvm other than the backporte=
d fixes from llvm master.
>
>
> Do let us know how can we proceed on this.
>
> I think we should go ahead, we have llvm-21 already in final stages so
> that might be a bit to address, do find out which version of rust will
> use llvm 21.
>
> Rust 1.91(Nightly) is using llvm 21.
>
> Regards,
> Deepesh
>
> 1) d35840afa50d [rust] Add CI Checks to Rust fork
> =E2=80=83=E2=80=83- This patch adds CI monitoring for PR statuses.
> 2) 801294e8f616 [rust] Changes needed for 'x86_64-fortanix-unknown-sgx' n=
ightly target.
> =E2=80=83=E2=80=83- This patch enables libunwind to work inside SGX encla=
ves (target: x86_64-fortanix-unknown-sgx)
> by replacing all OS and libc dependencies with Rust-based equivalents, al=
lowing safe stack unwinding in
> Rust SGX apps without relying on pthreads, malloc, or standard I/O.
>
>  https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html
>
> These two patches are specific to the Rust nightly forked llvm and have n=
ot been carried into the stable
> branch or official release tags, where only bug fixes backported from LLV=
M master are maintained.
>
> The backported bug fixing patches from llvm upstream applied on top of th=
e Rust forked LLVM (v20.1.7)
> for Rust 1.89 are already present in the upstream LLVM 21.1.0 tag. With t=
he poky master-next branch now
> upgraded to Clang 21.1.0, I was able to build Rust 1.89 successfully by d=
epending on Clang.
>

as per https://releases.rs/ 1.91 release is a couple of months away,
so it won't make it into the upcoming YP release.

> Can I go ahead and submit the patch to delete rust-llvm after the Clang 2=
1.1.0 upgrade is merged into poky-master?
>

This might have to consider the fact that there might be fixes in rust
itself to deal with newer LLVM or it might rely on some
llvm 21 features indirectly. so pushing rust < 1.91 to use llvm 21
while feasible needs some serious testing. If we get good
results we might have better confidence.

> Regards,
> Deepesh
>
>

