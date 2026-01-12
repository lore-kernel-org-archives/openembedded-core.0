Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BEBD25031
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 00:42:59 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22551.1768178572295635040
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 16:42:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mS+/4GmI;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alistair23@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8719ac9af7so63373366b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 16:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768178571; x=1768783371; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfzvtQxv6Gv67ibc80/9qgU/xmXRqi5aicjft5EO/eE=;
        b=mS+/4GmIQhYAPlgCGB/Jf5eV+uP9YxbUOy2ukEr7bsREQPvc+y32EwRL69WJEPUI3T
         epowX7NmjkjWG4eV7z3ueeOgjyph54z5GSaiB71svQJyn/ANcr07Z6VdmubZYKtnTdw0
         F6AxzYt08/wuf/VvcVcYtOoWPFKwp9DUJozOHyeF38+KM3baRv3ufSHLTbppC5fD1RDU
         8cNGlQrjhCThzKD5nG77UWCJoMfPAM0Wi3MG1vKBzLZw0NBqFeYXnBP9hxF/mzq+wW4N
         JX73YtOOP/7hFN/hdJYIHiqPM8sHrTtzsu7k00y8E7ZQnlKDmqS5PzDomEU8/tIOmArR
         Y3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768178571; x=1768783371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SfzvtQxv6Gv67ibc80/9qgU/xmXRqi5aicjft5EO/eE=;
        b=HvaSAgFSknM2ZZuUo1Pbhr+lU8qYJTy47H35rof5gNxZDjTHPhCCozI+0YORSfMlGk
         YgYs9SXQbY9JtP4ECKVLXQK+TgHascj7cv3PngYFoyRJT1PJ9f2vZJX5Q0eABq5eiSwi
         KlzqfknYH7ol/BjgSBUTFh6yE17znNWujaKjAmcoclbncYPsjhd/uN3M/5+ZXDtykYXu
         PQrtCO+yXx7tilDWcsJqZBf2Lz8UCBWdXN9X4S/XoVi4icwFEiqnDVks0YSeTWvUvpqj
         vqXwlPc6/Kl62KSjCDb0uaQe5KUbgE6amhYOPzs9MsHAftekqSyeWBgCdxa+QzEXdwfU
         4Sxw==
X-Forwarded-Encrypted: i=1; AJvYcCV/BYP5xggD8JZwa3tJV2hVrHRIkcuzYSo4myXzWG3nkPywoS9vVBVG14YpMt/iYpCk/imNqS1Mk7ZG/mF14vhNvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEBgbi9rQzqvwbDw/UqEoXIDxH3TWHa/oylBlSBphDFLDm9Uzq
	7e5UPEQjyGfct1D1Y0izRYHFybDpT/1hC2whd6uGhiztBL6mNvxtF6RoH+NR/6r1+JOb/10MMpN
	2Z89YfI0qGLiI8AU1Zvu+JhQ07galfoo=
X-Gm-Gg: AY/fxX5IpkFgGjTxabAZlfFpjISOPDzuROS8hoD/+H/iHTEJxy6cSRcPT5OgB1pSmOO
	V21Y4EefYT+1XAmg4IOhxfqiI/CpdW7ktBho/FC1CSkxOJdKDN4BhUOyJboOgaEhSI3V7ppcgxi
	9I1sN9A6mBL5mbuDu+HKL+hh12IssA8r61PEhoVoF1scqABS4+mAccxX7uv4GPvznsp+9e1KwxL
	TO8hLG7gbT1kLSv7RreCLeSIhjw+K/i6ZdbteIlBn3YTokCR4s681bmfICXlYeMTCBp804OAi1C
	uHhEaa67TZkTWTrqsyqAsuqy5A==
X-Google-Smtp-Source: AGHT+IF3ui0cbgusm/oj5jxoSWXY7JVT0jheU+57abdXkpPgOqgl5O6y0AYjzu8hsNW55iKiSqIkX/t7yjb8Y2h7Xf4=
X-Received: by 2002:a17:907:c04:b0:b87:191f:4fab with SMTP id
 a640c23a62f3a-b87191f52a1mr172967866b.26.1768178570492; Sun, 11 Jan 2026
 16:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-4-Harish.Sadineni@windriver.com> <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
 <ad562934-8523-4071-801a-8dd5709c0868@windriver.com> <6baec353-7ac4-4801-8e13-225e4d9432f2@windriver.com>
 <663fe060-072a-43a4-b0f9-20e172007c47@windriver.com> <980e869b-15e4-4b6a-a2ac-3e13ecb43b00@windriver.com>
In-Reply-To: <980e869b-15e4-4b6a-a2ac-3e13ecb43b00@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jan 2026 10:42:24 +1000
X-Gm-Features: AZwV_QgfkUwiTWQVZSGxwPOyR_WUx6cULQdghvz3FVDbwivVqdkqIFWj8zFe9-s
Message-ID: <CAKmqyKO68-STJkpC1=EO7xC-TGiM6xyzZj6gFEZB60kfeTKnpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources for
 'make rustavailable' support
To: randy.macleod@windriver.com
Cc: Harish Sadineni <Harish.Sadineni@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, bruce.ashfield@gmail.com, 
	Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 00:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229181

On Thu, Jan 8, 2026 at 4:22=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2026-01-07 11:34 a.m., Harish Sadineni wrote:
>
>
> On 1/7/2026 12:29 AM, Randy MacLeod wrote:
>
> On 2026-01-05 11:24 a.m., Harish Sadineni wrote:
>
>
> On 12/30/2025 9:28 PM, Richard Purdie wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via lists.openembedde=
d.org wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> The `make rustavailable` process (1) expects the Rust standard library so=
urce files (e.g., `lib.rs`)
> to be present in the `library/` directory under `rustlib/src/rust/`.
>
> This patch ensures the required sources are available by:
> - Copying the `library/` directory from the Rust source tree into `${TMPD=
IR}/work-shared/rust`
>    during the snapshot setup.
> - Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rust=
lib/src/rust` for the
>    `nativesdk` class, making them available in them available in sdk
>
> 1) See the kernel tree for Documentation/rust/quick-start.rst in the sect=
ion: Requirements: Building
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/rust/quick-start.rst#n145
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-dev=
tools/rust/rust_1.91.1.bb
> index a25f65f674..7644ecf2d2 100644
> --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
>           done
>       fi
>   }
> +
> +do_rust_setup_snapshot:append:class-native () {
> +   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'fa=
lse', d)}; then
> +         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
> +                mkdir -p ${TMPDIR}/work-shared/rust
> +                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
> +         fi
> +   fi
> +}

Note you can just use the Rust bootstrap tool to install the source,
see my patch here:
https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2_rust_ins=
tall_the/117170671

That way you don't need to manually copy the files

> +
>   addtask rust_setup_snapshot after do_unpack before do_configure
>   addtask do_test_compile after do_configure do_rust_gen_targets
>   do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
>        export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_=
SYSROOT/lib/${SDKLOADER}"
>        export CC_$RUST_HOST_CC=3D"${CCACHE}${HOST_PREFIX}gcc"
>        EOF
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'f=
alse', d)}; then
> +           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; th=
en
> +                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
> +                cp -r --no-preserve=3Downership  ${S}/library ${D}${SDKP=
ATHNATIVE}/usr/lib/rustlib/src/rust/
> +           fi
> +    fi
>   }
>
>   FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
>
> The commit message should mention the size of these files.
>
> Ok sure, I will add file size in v3.
>
> Does this make sense as a distro feature or should we just do this all th=
e time?
>
> This is suggestion from Bruce that we take it as distro feature.
> https://lists.openembedded.org/g/openembedded-core/message/225256
>
>
>
> Richard mentioned this thread in today's tech call when I asked for comme=
ntson the rust-kernel PR.
>
> Yes, the high level requirement is to have a DISTRO_FEATURE but common, i=
nfrastructure parts
> such as this code that just copies a hopefully small number of files arou=
nd,
> and is part of the rust recipe, could and likely be done regardless of th=
e rust-kernel DISTRO_FEATURE.
>
>
> Ok sure, We will remove the dependency on DISTRO_FEATURE  for copying the=
 library directory from rust recipe.
>
>
> Hold on, I said "small number of files...". See below.
>
>
>
> We don't want the rust recipe to change based on a kernel config unless w=
e *really* have to
> since that essentially doubles the testing that should be done or leaves =
a gap in testing of the
> rust builds. If you do that for the kernel first, then another recipe lat=
er, soon you have a maintenance mess.
>
> Also if the kernel needs these files, then it's likely that other softwar=
e will need it as well.
> You should analyze why the kernel needs these files and why other recipes=
 do not. Perhaps any
> kernel-like image will have the same requirement. Is there a baremetal im=
age  using rust anywhere
> that you can use to check on that? I looked but all I found was:
> https://github.com/ahcbb6/baremetal-helloqemu-rust
> Anyway, let's focus on the linux kernel's requirements for now.

The kernel needs the Rust core souce as the kernel is cross compiling
the Rust source in it's build system.

It seems unlikely that other software will do the same. It's a bit of
a niche Linux kernel thing to want to do.

>
>
> So, how many files are needed and how much FS space do they use?
>
>
> The file size of the library directory is around 50MB.
>
>
> I've been around since the 1990s, 50 MB doesn't seem small to me but
> let's see what other people think.
>
> Also, how may files is that?
>
> What's the content?  ls -lR if the list isn't too long.
>
> Does the kernel build need each and every file ? How did you check?
> Can we automate the generation of the list of required files by scraping =
the data from the kernel perhaps?

It's the core Rust library. Even if the kernel only uses a select
number of files, those files will pull in other files and modules.
Copying a subset of files would require editing the files to remove
imports to the missing files and seems very prone to breakage.

I agree 50MB isn't great, but it allows the rust-native package to
build the kernel without rebuliding rust-native, which seems like a
win.

>
>
>
>
> What are other build systems (gentoo for example) doing with their Rust b=
uilds to satisfy the kernel's rust requirements?
>
>
> I will check and update on this.
>
>
> Thanks.
>
>
>
>
> In future when rust is default in kernel we can change this, But till the=
n it is good to have it as a distro feature.
>
> Do the nativesdk components get packaged separately? If they were, we
> could then make that an SDK feature instead.
>
> No, We are not packaging it separately.
>
>
>
> The questions seems to be whether we should create a separate packaging r=
ule.
>
>
> Now by default it is getting packaged with nativesdk-rust, Do we need a s=
eparate packaging for libraries/files that being installed for rust in kern=
el support?

The Rust tooling actually does this (it's called rust-src) so maybe a
rust-src-native package would be the way to go

Alistair

>
>
>
> What happens for on target kernel module development? Shouldn't there be =
a target package too?
>
> Yes, I have made the necessary changes to include Rust library for target=
 as well and have tested Rust-based kernel module development on the target=
.
> I will send updated patches with v3.
>
>
>
> Before you spend time on polishing v3 please explain what your workflow i=
s, step by step,
> so we can be sure that things makes sense from a high level.
>
> We will update the rust recipe to copy the required libs to target image =
and then the below steps to be followed :
>
>
> This part we're still trying to work out...
>
> - Build the image by adding the required tools via IMAGE_INSTALL:append (=
 e.g kernel-devsrc, gcc, rust, cargo, bindgen-cli etc..).
>
> We could create / extend a packagegroup or use:
>    meta/recipes-extended/images/core-image-kernel-dev.bb
>
> Bruce, what approach do you use / prefer ?
>
>
> - In /usr/src/kernel, run "make rustavailable" to verify Rust support (Th=
is step will check all supporting tools are available for rust support in k=
ernel).
> - Run "make menuconfig" and enable "CONFIG_RUST".
> - Run "make scripts" and "make prepare".
> - Write a kernel module in Rust & build the module using "make", which ge=
nerates the "module_name.ko" file.
> - Load the module using "insmod module_name.ko".
>
>
> The rest seems sensible to a non-kernel guy like me.
>
> Thanks,
>
> ../Randy
>
>
> Thanks,
> Harish
>
> ../Randy
>
>
>
> Thanks,
> Harish
>
> Cheers,
>
> Richard
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229026): https://lists.openembedded.org/g/openembedde=
d-core/message/229026
> Mute This Topic: https://lists.openembedded.org/mt/116997864/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
istair23@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

