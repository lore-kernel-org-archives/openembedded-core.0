Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47FFE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:54:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.20587.1736258087032743391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QE6d5uws;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862df95f92so6856677f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736258085; x=1736862885; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/BQ2WBXrZmU3KkZHUqjejX1S+fdXK/sMeIQJAfrijA=;
        b=QE6d5uwsV3p8Okan4a09HKpgcmtOoRXOCwniTQs5zI/HXoomCjwari5qa+GUWAc/4z
         291SRBluSFTvJhjTGrQJlZj419H6IFP0yyZwFEBBQeYtZziJvW3zmJXU/WA1f+kBH5i6
         qz1+q10rPJslYNgO6bqGAxRhELgJIB1ZIsUxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258085; x=1736862885;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/BQ2WBXrZmU3KkZHUqjejX1S+fdXK/sMeIQJAfrijA=;
        b=QfPGqNE+18NJ+XX+/QqPDCepuqcL3Jl7ZUZkvNxs58tg4oJuwsQ0fAl7YedJizUuB/
         xevaCFaT1nuVV+izbr30qu0OjRfI3kMX2j8uZujnAdMunDAaSJmxihfrqis4ghyxCVPv
         YAjdpJ++aWenXCsh/5TTCKjgnR93w3g10n8utsbevk4N6cgl8uh6J7+ahGAMz4CqYuJf
         qfkT0v3nAauLqWqeXEHdMFD20gJ1QKqOI6C9YnTovP0edPH3yFndspc6ELAhDtPZtWTa
         GvV4PO65p+GNwwvVSrpT5Vhh+j+HFj0cv/xE20+3qLD3MpSO3WRE499+Spn9lI5y3Bre
         ocXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk5EAJMlDeaOTyANCxnJOA/4qL5riEfa/P0Yqb0Gsp5qLfvC6t5NuLIJovsEo8rqPXegeOeMoh4H7JfcypaR1rEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnVAF/7Bn45pCCRwLgJ4yo9BceT4VZeUGzgaWDy6DQr34MseD5
	7vXtwu8zCic5ffLW7VCKaiBZ5nqq6TNORKKOtmEx1/wTjy7IfiSdNBNO67cqVSBM7CiHvb+Dnsr
	ScAs=
X-Gm-Gg: ASbGncuuvGmox2MH884DhYErnHprLdryLiXpceUAArAe0Y2rkvqHbMZuFds45qTusWe
	yBNHFN4SN4HHfnj7YdjW8WWDTseQ0QP6e2xJjc8CDMwpzjCqmd/xMJe2BNtAyDRF0bZsS7iNxa3
	GPGJFfnBYoOWqraNnE9PRYV6di0PqsBDRRPGmVbK0q5Ytp/RN6yiEqQcodCOgDlhPBmv2GNfBxZ
	NaRXNTdnzz1ltawWg6rm8fjU26o262+yB3LX9z10E8uZC9mSEnPYSMIIklUT/P/f1uZqOQnUAI4
	93JNtohy2QuLkYCPSBw5hmAWO5pNwrrOPgrs1UOYE/rK/g==
X-Google-Smtp-Source: AGHT+IGg7qTZsWX3TWYz0ulXoQ0SZ5aR9vYLt3N4uIX+Mx2j6zvo4WeJd/H/DJ8qV+Tsn0z6kS5XFg==
X-Received: by 2002:a05:6000:18a5:b0:382:5aae:87c7 with SMTP id ffacd0b85a97d-38a221f9d65mr51457643f8f.31.1736258085368;
        Tue, 07 Jan 2025 05:54:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb? ([2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm51252432f8f.71.2025.01.07.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:54:44 -0800 (PST)
Message-ID: <9838c182548b234dab425b3e74982cd9a98659e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 07/19] clang: Migrate clang and related
 recipes from meta-clang
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2025 13:54:44 +0000
In-Reply-To: <20241105184540.3450302-7-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
	 <20241105184540.3450302-7-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209470

On Tue, 2024-11-05 at 10:45 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> This includes compiler, tools and runtime libraries, they are
> brought in together to avoid major rehashing due to their
> interdependence.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../clang/clang-cross-canadian_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 36 ++
> =C2=A0.../recipes-devtools/clang/clang-cross_git.bb |=C2=A0 35 ++
> =C2=A0.../clang/clang-crosssdk_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 ++
> =C2=A0meta/recipes-devtools/clang/clang.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +
> =C2=A0...ibunwind-headers-when-LIBCXXABI_LIBU.patch |=C2=A0 60 +++
> =C2=A0...-support-a-new-embedded-linux-target.patch | 309 ++++++++++++
> =C2=A0...lify-cross-compilation.-Don-t-use-na.patch |=C2=A0 44 ++
> =C2=A0...ryInfo-Undefine-libc-functions-if-th.patch |=C2=A0 90 ++++
> =C2=A0...-env-override-of-exe-and-libdir-path.patch |=C2=A0 71 +++
> =C2=A0...g-driver-Check-sysroot-for-ldso-path.patch |=C2=A0 75 +++
> =C2=A0...tools.cpp-Add-lssp_nonshared-on-musl.patch |=C2=A0 32 ++
> =C2=A0...08-clang-Prepend-trailing-to-sysroot.patch |=C2=A0 39 ++
> =C2=A0...e-the-target-sysroot-for-compiler-ru.patch |=C2=A0 41 ++
> =C2=A0...efine-releative-gcc-installation-dir.patch |=C2=A0 47 ++
> =C2=A0...ad-and-ldl-along-with-lunwind-for-st.patch |=C2=A0 35 ++
> =C2=A0...UTABLE-when-cross-compiling-for-nati.patch |=C2=A0 24 +
> =C2=A0...3-Check-for-atomic-double-intrinsics.patch |=C2=A0 34 ++
> =C2=A0...gure-for-packages-using-find_package.patch | 115 +++++
> =C2=A0...ce-dir-location-for-cross-toolchains.patch |=C2=A0 42 ++
> =C2=A0...-dyld-prefix-when-checking-sysroot-f.patch |=C2=A0 79 +++
> =C2=A0...-clang-Use-python3-in-python-scripts.patch |=C2=A0 35 ++
> =C2=A0...-Yocto-based-GCC-install-search-path.patch |=C2=A0 70 +++
> =C2=A0...or-for-adding-OE-distro-vendor-names.patch |=C2=A0 32 ++
> =C2=A0...ot-use-backtrace-APIs-on-non-glibc-l.patch |=C2=A0 68 +++
> =C2=A0...iple-for-non-debian-multiarch-linux-.patch |=C2=A0 28 ++
> =C2=A0...libunwind-Added-unw_backtrace-method.patch |=C2=A0 56 +++
> =C2=A0...ot-use-install-relative-libc-headers.patch |=C2=A0 34 ++
> =C2=A0...-Fix-lib-paths-for-OpenEmbedded-Host.patch |=C2=A0 79 +++
> =C2=A0...ry-search-path-for-OpenEmbedded-Host.patch |=C2=A0 84 ++++
> =C2=A0...0026-lldb-Link-with-libatomic-on-x86.patch |=C2=A0 33 ++
> =C2=A0...ompiler-rt-Enable-__int128-for-ppc32.patch |=C2=A0 73 +++
> =C2=A0...ot-use-cmake-infra-to-detect-libzstd.patch |=C2=A0 62 +++
> =C2=A0...t-Fix-stat-struct-s-size-for-O32-ABI.patch |=C2=A0 44 ++
> =C2=A0...f-_TIME_BITS-along-with-_FILE_OFFSET.patch |=C2=A0 43 ++
> =C2=A0....cpp-ARMLibDirs-search-also-in-lib32.patch |=C2=A0 81 +++
> =C2=A0...d-OE-specific-ABI-triple-for-N32-ABI.patch |=C2=A0 78 +++
> =C2=A0...unwind.pc.in-and-llvm-config-scripts.patch |=C2=A0 90 ++++
> =C2=A0...spect-LLVM_LIBDIR_SUFFIX-like-other-.patch |=C2=A0 92 ++++
> =C2=A0meta/recipes-devtools/clang/clang_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 463 ++++++++++++++++++
> =C2=A0meta/recipes-devtools/clang/common-source.inc |=C2=A0 17 +
> =C2=A0meta/recipes-devtools/clang/common.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 66 +++
> =C2=A0.../clang/compiler-rt-sanitizers_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 123 +++++
> =C2=A0.../recipes-devtools/clang/compiler-rt_git.bb | 126 +++++
> =C2=A0meta/recipes-devtools/clang/libclc_git.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 36 ++
> =C2=A0meta/recipes-devtools/clang/libcxx_git.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 115 +++++
> =C2=A0.../clang/llvm-project-source.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0.../clang/llvm-project-source.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 99 ++++
> =C2=A0.../clang/nativesdk-clang-glue.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 ++
> =C2=A0meta/recipes-devtools/clang/openmp_git.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 65 +++
> =C2=A049 files changed, 3506 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang-cross-canadian=
_git.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang-cross_git.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang-crosssdk_git.b=
b
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang.inc
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0001-libcxxabi=
-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0002-compiler-=
rt-support-a-new-embedded-linux-target.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0003-compiler-=
rt-Simplify-cross-compilation.-Don-t-use-na.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0004-llvm-Targ=
etLibraryInfo-Undefine-libc-functions-if-th.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0005-llvm-allo=
w-env-override-of-exe-and-libdir-path.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0006-clang-dri=
ver-Check-sysroot-for-ldso-path.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0007-clang-Dri=
ver-tools.cpp-Add-lssp_nonshared-on-musl.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0008-clang-Pre=
pend-trailing-to-sysroot.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0009-clang-Loo=
k-inside-the-target-sysroot-for-compiler-ru.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0010-clang-Def=
ine-releative-gcc-installation-dir.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0011-clang-Add=
-lpthread-and-ldl-along-with-lunwind-for-st.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0012-Pass-PYTH=
ON_EXECUTABLE-when-cross-compiling-for-nati.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0013-Check-for=
-atomic-double-intrinsics.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0014-cmake-Fix=
-configure-for-packages-using-find_package.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0015-clang-Fix=
-resource-dir-location-for-cross-toolchains.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0016-clang-dri=
ver-Add-dyld-prefix-when-checking-sysroot-f.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0017-clang-Use=
-python3-in-python-scripts.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0018-For-x86_6=
4-set-Yocto-based-GCC-install-search-path.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0019-llvm-Inse=
rt-anchor-for-adding-OE-distro-vendor-names.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0020-compiler-=
rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0021-clang-Fix=
-x86-triple-for-non-debian-multiarch-linux-.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0022-libunwind=
-Added-unw_backtrace-method.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0023-clang-Do-=
not-use-install-relative-libc-headers.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0024-Fix-lib-p=
aths-for-OpenEmbedded-Host.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0025-Correct-l=
ibrary-search-path-for-OpenEmbedded-Host.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0026-lldb-Link=
-with-libatomic-on-x86.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0027-compiler-=
rt-Enable-__int128-for-ppc32.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0028-llvm-Do-n=
ot-use-cmake-infra-to-detect-libzstd.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0029-compiler-=
rt-Fix-stat-struct-s-size-for-O32-ABI.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0030-compiler-=
rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0031-ToolChain=
s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0032-clang-llv=
m-Add-OE-specific-ABI-triple-for-N32-ABI.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0033-llvm-Add-=
libunwind.pc.in-and-llvm-config-scripts.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0034-scan-buil=
d-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
> =C2=A0create mode 100644 meta/recipes-devtools/clang/clang_git.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/common-source.inc
> =C2=A0create mode 100644 meta/recipes-devtools/clang/common.inc
> =C2=A0create mode 100644 meta/recipes-devtools/clang/compiler-rt-sanitize=
rs_git.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/compiler-rt_git.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/libclc_git.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/libcxx_git.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/llvm-project-source.=
bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/llvm-project-source.=
inc
> =C2=A0create mode 100644 meta/recipes-devtools/clang/nativesdk-clang-glue=
.bb
> =C2=A0create mode 100644 meta/recipes-devtools/clang/openmp_git.bb

One of the first questions that will be asked are what is the
status/plan for the 34 patches here? Can we update the patch
descriptions and status to be better than "Pending"? I'd like ideally
like a plan about how we could engage with upstream to reduce this
queue. I have made an effort to clean up the gcc ones and others in
core.

Cheers,

Richard





