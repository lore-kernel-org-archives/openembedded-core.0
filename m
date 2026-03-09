Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5413FCA17C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 19:20:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23038.1773084004343675527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 12:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U7UZ9OEd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439bcec8613so6326980f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773084003; x=1773688803; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FbHrRp2vYuSMdHD02d8j+UOQxDEMI9XKr12h+I+DOO0=;
        b=U7UZ9OEdF1sOkHCklbWwOpwBS3rpQ/V8txXivIb/oNH+5ZHqq1p+ZwTF+R2d7tsk14
         7mQO5X/D1BEy2gQni6O7/7hdDd1WkEjIg/OLN+BuDtf/sQuR2IlzFUj1IwywupHFrVr6
         UUiLThmEECGdThxN0sS/+8V6MO9oQareOkIGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773084003; x=1773688803;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbHrRp2vYuSMdHD02d8j+UOQxDEMI9XKr12h+I+DOO0=;
        b=oAC5O0CJDgmMvVATjt4YcEEPl4dhj0HCskMQ0Xuyo4OMw1a77yMsGVAof//6Z9vTF4
         zpQcF/8dSFrugfzD32aFSo/AF36UufydbK2wtM4Xr31fzmHXyc825mJLL5hOeLRJCY9d
         9Mm5O0PF9eGBvv9hpM48PmbiMa87BmuIlCMSNryiXdo825w9Gjkic8Q4SF+uJHRjJ61t
         ajhdliaN/dk5sml/JJz0r3yitlkW8M0V+D+ujwxVhT3SquhXRtGtqSgXTEG/6uuH3Owp
         y7S2pQuHMFJIblC4ZgaNOJtC6N8azbGIkzik0KhWBvUzYekEDu8m4D2d0qygCIUx7L0P
         mFXQ==
X-Gm-Message-State: AOJu0YxNgcw3zlQonCnGmSQ5q4nJwXtfpM8RpgiEexcrHVvk3i9vcQeK
	6PBHStSEEHYTvoEZlyykKU6odwAR32SjpboWrLAMOjF16T9VCDh5ky2tBbkftAzoJZc=
X-Gm-Gg: ATEYQzy2yzAs8uWyo7HrGxfCPi5i7fEpH347Rn2ssX0QB7ntyUEwocIVh6RjcPI/sPf
	iy3sBwPj8+BLVJ7c4Owzva9shphOCbDniYz5AJr7VBZKg0BC+4g0HFcETvWEQ4WAnk3/3JpkBE7
	21X5oLIS2gOlPtV/dLjWHle51cSoC1cDmsMcmS2yHfTZLnqejDj1C+3QKgqjepMnG592qvuUX0i
	jYPMOmSLbS3VSIRmfsPifRRdlPKZbsD1sF8Yxh/hdvRtkLn+U/riZPzEYvZOjPj/PTI7aPRJA5G
	08FrE9aad9aD/2xHDmPXWYbWvI3Q6X/1bw9yvEOFIv1rjwB4OItNS+oVQpFr6/lknriokASbEW+
	10/w9BzYXgiwybVOpZnI/ARtL4pms73YpdmYpYaK7UpIIsccRSWqkQDYGHHWw5pBeUIyXtQEb9C
	nOieZduhLqUzOVIMAIEAqWCXkeVs/vR3l7oRnT9MEk7tCXYN5pPwhwCAVxadUaC5QDEwnmOLk2G
	k5epe3S3uJK
X-Received: by 2002:a5d:588c:0:b0:439:cb1f:44f9 with SMTP id ffacd0b85a97d-439da67c424mr20643962f8f.47.1773084002626;
        Mon, 09 Mar 2026 12:20:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f0f:27a5:814a:c92a? ([2001:8b0:aba:5f3c:f0f:27a5:814a:c92a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm31852223f8f.36.2026.03.09.12.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:20:02 -0700 (PDT)
Message-ID: <cff0fc23fcf9e5176fc4830f1ff395a79bcaffe8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Harish Sadineni
	 <Harish.Sadineni@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, paul@pbarker.dev, yoann.congal@smile.fr
Date: Mon, 09 Mar 2026 19:20:00 +0000
In-Reply-To: <CADkTA4OZVd17y5v2XYzZx1gRqSE81A+RRo4-WaL13195GpKTAw@mail.gmail.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
	 <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
	 <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
	 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com>
	 <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
	 <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com>
	 <CADkTA4OZVd17y5v2XYzZx1gRqSE81A+RRo4-WaL13195GpKTAw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 19:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232753

On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield wrote:
>=20
>=20
>=20
> On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadineni
> <Harish.Sadineni@windriver.com> wrote:
> > =C2=A0
> > =C2=A0
> >=20
> > =C2=A0
> > =C2=A0
> > On 3/9/2026 9:59 PM, Bruce Ashfield wrote:
> > =C2=A0
> > =C2=A0
> > > =C2=A0=C2=A0=C2=A0
> > > CAUTION: This email comes from a non Wind River email account!
> > > =C2=A0Do not click links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > >=20
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni
> > > <Harish.Sadineni@windriver.com> wrote:
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > > =C2=A0
> > > >=20
> > > > =C2=A0
> > > > =C2=A0
> > > > On 3/9/2026 4:56 PM, Richard Purdie wrote:
> > > > =C2=A0
> > > > =C2=A0
> > > > > =C2=A0
> > > > > CAUTION: This email comes from a non Wind River email
> > > > > account!
> > > > > Do not click links or open attachments unless you recognize
> > > > > the sender and know the content is safe.
> > > > >=20
> > > > > On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via
> > > > > lists.openembedded.org wrote:
> > > > > =C2=A0
> > > > > > =C2=A0
> > > > > > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> > > > > >=20
> > > > > > Conditionally add 'clang-native', 'rust-native' and
> > > > > > 'bindgen-cli-native' to 'DEPENDS'
> > > > > > when Kernel Rust Support is enabled.
> > > > > >=20
> > > > > > These tools are required for building Rust-enabled kernels
> > > > > > and for
> > > > > > generating Rust FFI bindings via bindgen during the kernel
> > > > > > build.
> > > > > >=20
> > > > > > This ensures the additional dependencies are only pulled in
> > > > > > when
> > > > > > Rust support is explicitly enabled, avoiding unnecessary
> > > > > > native
> > > > > > dependencies for non-Rust kernel builds.
> > > > > >=20
> > > > > > Signed-off-by: Harish Sadineni
> > > > > > <Harish.Sadineni@windriver.com>
> > > > > > ---
> > > > > > =C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
> > > > > > =C2=A01 file changed, 3 insertions(+)
> > > > > >=20
> > > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > index 4d0a726bb6..b7961bbcdf 100644
> > > > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > @@ -76,11 +76,14 @@ do_install:append(){
> > > > > > =C2=A0KERNEL_FEATURES:append:qemuall =3D " features/kernel-
> > > > > > sample/kernel-sample.scc"
> > > > > >=20
> > > > > > =C2=A0KERNEL_DEBUG ?=3D ""
> > > > > > +KERNEL_RUST_SUPPORT ?=3D ""
> > > > > > =C2=A0# These used to be version specific, but are now common
> > > > > > dependencies.  New
> > > > > > =C2=A0# tools / dependencies will continue to be added in
> > > > > > version specific recipes.
> > > > > > =C2=A0DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86",
> > > > > > "arm64", "powerpc" ], "elfutils-native", "", d)}'
> > > > > > =C2=A0DEPENDS +=3D "openssl-native util-linux-native"
> > > > > > =C2=A0DEPENDS +=3D "gmp-native libmpc-native"
> > > > > > +RUST_KERNEL_DEPENDS ?=3D
> > > > > > "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True',
> > > > > > 'clang-native rust-native bindgen-cli-native', '', d)}"
> > > > > > +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
> > > > > >=20
> > > > > > =C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need t=
o
> > > > > > make pahole-native available before do_kernel_configme
> > > > > > =C2=A0do_kernel_configme[depends] +=3D
> > > > > > '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-
> > > > > > native:do_populate_sysroot", "", d)}'
> > > > > > =C2=A0
> > > > > =C2=A0
> > > > > I thought we were going to try and use KERNEL_FEATURES for
> > > > > this?
> > > > > =C2=A0
> > > > =C2=A0Hi Richard,
> > > > =C2=A0
> > > > =C2=A0I have tried this but i got circular dependency error with
> > > > KERNEL_FEATURES. So, I opted using variable
> > > > KERNEL_RUST_SUPPORT.
> > > > =C2=A0
> > > >=20
> > > =C2=A0
> > >=20
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > I'm curious about that. Can you share the details ? (diff and the
> > > bitbake error)
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > =C2=A0
> > =C2=A0As discussed previously, I attempted to use the following in
> > meta/recipes-kernel/linux/linux-yocto_6.18.bb:
> > =C2=A0
> > =C2=A0KERNEL_FEATURES:append =3D " ${@bb.utils.contains('KERNEL_FEATURE=
S',
> > 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
> > =C2=A0
> > =C2=A0This resulted in a BitBake variable dependency chain failure. The
> > issue occurs because the expression is trying to read
> > KERNEL_FEATURES=20
> > =C2=A0while simultaneously modifying KERNEL_FEATURES, which creates a
> > circular dependency.
> >=20
>=20
>=20
> Yes, that's clearly not going to work, but that wouldn't have been
> the suggestion.
>=20
> Wasn't Richard asking about setting the RUST_KERNEL_DEPENDS based on
> the KERNEL_FEATURES containing rust.scc ?

Yes, along with maybe with a tweak to the KERNEL_FEATURES code which
could expand " rust " or maybe " kernel-rust "in KERNEL_FEATURES into
"features/kernel-rust/kernel-rust.scc" too just so there was a nice
short cut for it?

Cheers,

Richard




