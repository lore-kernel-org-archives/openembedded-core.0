Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E62EEE4982
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:58:14 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66784.1767110293287087675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ECa6ZJAO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43260a5a096so5043577f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 07:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767110291; x=1767715091; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/DIXNhi2e3o6ZhFa8xpnPQnt63QJ1aJaSSPROvxUoxA=;
        b=ECa6ZJAO1D0ZcLBiuJjio/m9w0GuDdVFupZ2oISLLXLMYOMMUkbqyUKYfOk1K42D3O
         VEUZqEgBGg2OxorGnASfL/Y5J0oEPVfs1MwlNQLyNFL0ii1bib7AdjnhFFdt5gvI98jD
         Xh2RQyJ7ZTSeCCGxc2zMOdQfAR6vY56RaDmRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767110291; x=1767715091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DIXNhi2e3o6ZhFa8xpnPQnt63QJ1aJaSSPROvxUoxA=;
        b=iXy8r4W4+Gf1NCjcdkGYdfdoZBzxpD3+OEgiOT7ea82JRmj9krrPJ81A/UxQGSb5y9
         8eSt4tQVQysvfhc4ZoD18EXvsVYXgi9GwbJrxiro7Tk77vIkJ2Is2LmvlXE5bhU4Wgv2
         trrQDgal3NIN2mT0V1EHPtnIwcrFTu1AGYCq2k5Ot7r6UhmjdTAVGpDkCJeLNaUKq54R
         b29NaKtlPZ2yjYrOttQ9Oq881csIG2gn+lkPFK4M9pBbcrZIlEhHd0il7NbThmjbpt+8
         GRs2Ebg8lX4/UyYqhGeW3JX6jg19KeHps/d1kCwlAkiB1mRqHJPePVFhZvGzWviaCkWO
         iisw==
X-Forwarded-Encrypted: i=1; AJvYcCWFvWkeYCGYI9cuSWeS74ZFVqDEWuxITLdfT800aYik3gTStcMgMVaIIr9aq4glyVJbeb2nRs+1RXXsG4LbOEGEJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIXK+Drjb3amHZ1VXyPSVGX46rgG5YPYTqKOrUFin0OKCpnrri
	rSC6Qk3VVzIyrsFzkVEUrCd8z0P6I5BHw3ISL2jeaOLz9HJP0MwvGfzoxxJAcGLial7HMVl06Iv
	reIu/Up8=
X-Gm-Gg: AY/fxX5QjHb+cWBzzfw/MjQdoCupy7ILxUvBCOg9jZ6meP8BtOb5N9B3N7wH9qvJYRA
	0pSK70SQDDxkqOq8HkTEbAbsKX7IkZc8YAkVwodKVX1HvUKlELjZxO/mbm03TswbrCDDx2rGElF
	b6Jz/gd4Lnyuect5SRtDej688fWeStEFET/aCBcwIUQnu2U+2zNbC9KwmNi6VlRTfM0GKIp+lnn
	W5L0DiNttrjuOIa/dBvS0ou9Z7jhNmNEswPA4ESRnJX9FRl7LtkCVsHMCXaTo9s783eGFWFzzYn
	Hohz8DCU0Es2XsBYQM75XUowTSsQNm95uis7MqVWlwggqUZlks+J9a0Tulpe0Bdvtvfq9PXh4Cr
	PaEON9zBX5It38U1tC6D4FAQy7MJ5eGDwnDRnb9fL5nBiO3PRjd8DZsk6OeuNaMreFz9EyQ6LeV
	XjI9XVQO5B/s5zmP/QszruVjWZmDgL/nU8FXh7BqCSJWMrmi5xsqb99nQ/jyBX6TgoxRPXo7PPQ
	t8=
X-Google-Smtp-Source: AGHT+IFuRrozrcj+qbzGBoEhzHV6m5rzjuDBJMRIW4O6Vk51SqNMIzSsUwZvnFULfxqv8P24JMV8/Q==
X-Received: by 2002:a05:6000:2c01:b0:431:92e:1d44 with SMTP id ffacd0b85a97d-4324e4cbc63mr38085226f8f.20.1767110291230;
        Tue, 30 Dec 2025 07:58:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5448:9bd4:4831:3c06? ([2001:8b0:aba:5f3c:5448:9bd4:4831:3c06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2721sm68755646f8f.39.2025.12.30.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:58:10 -0800 (PST)
Message-ID: <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources
 for 'make rustavailable' support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	bruce.ashfield@gmail.com, yoann.congal@smile.fr, elmehdi.younes@smile.fr
Date: Tue, 30 Dec 2025 15:58:09 +0000
In-Reply-To: <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
	 <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 15:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228686

On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> The `make rustavailable` process (1) expects the Rust standard library so=
urce files (e.g., `lib.rs`)
> to be present in the `library/` directory under `rustlib/src/rust/`.
>=20
> This patch ensures the required sources are available by:
> - Copying the `library/` directory from the Rust source tree into `${TMPD=
IR}/work-shared/rust`
> =C2=A0 during the snapshot setup.
> - Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rust=
lib/src/rust` for the
> =C2=A0 `nativesdk` class, making them available in them available in sdk
>=20
> 1) See the kernel tree for Documentation/rust/quick-start.rst in the sect=
ion: Requirements: Building
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/rust/quick-start.rst#n145
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++++
> =C2=A01 file changed, 17 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-dev=
tools/rust/rust_1.91.1.bb
> index a25f65f674..7644ecf2d2 100644
> --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}
> +
> +do_rust_setup_snapshot:append:class-native () {
> +=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '=
true', 'false', d)}; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! -d "${TMPDIR}/wo=
rk-shared/rust" ]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mkdir -p ${TMPDIR}/work-shared/rust
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +=C2=A0=C2=A0 fi
> +}
> +
> =C2=A0addtask rust_setup_snapshot after do_unpack before do_configure
> =C2=A0addtask do_test_compile after do_configure do_rust_gen_targets
> =C2=A0do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
> =C2=A0	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_=
SYSROOT/lib/${SDKLOADER}"
> =C2=A0	export CC_$RUST_HOST_CC=3D"${CCACHE}${HOST_PREFIX}gcc"
> =C2=A0	EOF
> +=C2=A0=C2=A0=C2=A0=20
> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kern=
el', 'true', 'false', d)}; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! -d $=
{D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cp -r --no-preserve=3Downership=C2=A0 ${S}/library ${D}$=
{SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}
> =C2=A0
> =C2=A0FILES:${PN} +=3D "${base_prefix}/environment-setup.d"

The commit message should mention the size of these files. Does this
make sense as a distro feature or should we just do this all the time?
Do the nativesdk components get packaged separately? If they were, we
could then make that an SDK feature instead. What happens for on target
kernel module development? Shouldn't there be a target package too?

Cheers,

Richard

