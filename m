Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB50CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 14:36:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21635.1791210973598546510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 07:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NmNp7H2h;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso15352385e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791210972; x=1791815772; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SCzMerLBHd0wpNS8jzyJNBXGZUbfPDathlHjTLamB+Y=;
        b=NmNp7H2htc084pFawF3o3BjZD1ZmjwSIEwtfRquB0godqQnmlpbAN2fNFTTzcTmlbw
         VMXlqvp8dEAVrwpMQy3EQYZLXyTfLGw0vno069/VrosJw5WjoDkriLXZoAmGj8eWYMCQ
         a3ctffY8APVp1MAu2oIRQjQABa4XE2bwJReDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210972; x=1791815772;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCzMerLBHd0wpNS8jzyJNBXGZUbfPDathlHjTLamB+Y=;
        b=lz2wYxHHcg2go6xbWTZ9wzsIN+1zzCEclwMTsLs31s/noRAs6eqTxqwUTSjRN0+4KM
         IzY1xkGuf0qCj9lPhQxksKc48FmLF4GQ5ABEUhBRJFgHGEk1eURoiCS42jjXPERY392d
         fiXrnARfaHh8AO4IL3ekNHn/R4M8wb+pn4r9eJITLKiM1uo2A/gvR/ZNpzXVGOF9ELP6
         splQ9waP5ggQIcIBzSyY59qHCUcHfotTVpzyb/CTsridhjd97SHRzS9alnWEeVaBx/mH
         3haWw8rPmlL8MuVDvsfDBIRsH0BZXIn+s9BdI27AGRvanh08RY7/b5vdErZqZKJVa9Lh
         OMpA==
X-Forwarded-Encrypted: i=1; AKwUvByMnJwXa4y8+fJh7yoQ/OU6M2sm/VHdrABTd9YeDE/LBHpRCfipvKh+qDmrhNTT7aPRG2SSdbwDCGdkB07ubXAf/A==@lists.openembedded.org
X-Gm-Message-State: AFuF++moXLO6Idh4Lkdt4qqhIlNrbzohP5XXyIKR/aCy/w1MSqwGV10q
	XeH+1j/QQQxjjGuvcN3C++v/pQ/9x+pXfkF3FwpGKY9LOsDbXvu67WeEiodwi5+U7zvrXuJE690
	Y1zgG184=
X-Gm-Gg: AYBFou1SH3SH718FscVgTb/YeMkW6tTQWzCqKpNhu/4zw0SGu7cf2D8H0Fy5H0Lksrh
	RV9xAYIxagEInMF+DI1REQbshNk9imKpWxH3GNxNi7YJcZYKUe5/uBGwA2oQtoJ8Ny2PrJSasHg
	6dvmxTR293TTup6al9kAZGlW8f9VlSJm/lxfXOPmzvuCJir0Pt54xXnzvUWyRF80EloPxq1TTzV
	pm4Ft2UyjfSaKzPvw46doMHcIn9PxpKmuUXGhJUGlahPRSrHb88dwqz/KHPgLUiGnHz9ZOusSm5
	3Lj3B+D0A4HWswcDeIae92HCbsxXbxykKY3DwHTUATd/EHsH8TU0pg9HW0NaYhdcAvokypvAeuL
	6pn/hRQRTcPnARPKfKu/Oqer0vJExPj5moPdMKsJKlGj4NN1Nm4IF9zNhfUQA/uvuLnYlUW541x
	smvkg1HBSQ3CSpTpKwghuqehtZg+PZomVo564cd4oZY4XS9b7cVd/fgKuNQEZuwaqIgY6wpIPm9
	5epwX/ZeQyeqfZdtAxqrhDNA/ldOelahGXnb1Q76fnlyd2ganKwrwqTtBuadTc=
X-Received: by 2002:a05:600c:19d2:b0:4a1:7703:e549 with SMTP id 5b1f17b1804b1-4a17703e672mr17040345e9.26.1791210971704;
        Mon, 05 Oct 2026 07:36:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c007:fc8d:8a7f:1be5? ([2001:8b0:aba:5f3c:c007:fc8d:8a7f:1be5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm343576975e9.14.2026.10.05.07.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:36:11 -0700 (PDT)
Message-ID: <baff8d8df699d2a0b282ce80ccc0147061ee2f33.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.98.1 -> 1.99.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Mon, 05 Oct 2026 15:36:10 +0100
In-Reply-To: <20261005095200.3309867-1-Hemanth.KumarMD@windriver.com>
References: <20261005095200.3309867-1-Hemanth.KumarMD@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 14:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247243

On Mon, 2026-10-05 at 02:51 -0700, Hemanth Kumar M D via lists.openembedded=
.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>=20
> Rust Changes:
> https://github.com/rust-lang/rust/releases/tag/1.99.0
>=20
> Cargo Changes:
> https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html
>=20
> Update local patches:
> 0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
> 0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
> rust-oe-selftest.patch
>=20
> Drop merged patches:
> 0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
> 0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch
> 0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
>=20
> rust_1.99.0.bb: drop "rust.use-lld" and "rust.lld" options.
> =C2=A0 "rust.use-lld" was renamed to "rust.bootstrap-override-lld" and it=
s
> =C2=A0 alias removed this release, so bootstrap now rejects it and do_ins=
tall
> =C2=A0 fails. The new option keeps the previous default, so dropping thes=
e
> =C2=A0 lines is sufficient. See [1] and [2].
>=20
> [1] https://github.com/rust-lang/rust/pull/147046
> [2] https://github.com/rust-lang/rust/pull/160142
>=20
> rust v1.99.0 (from autobuilder)
> +-------------+---------+---------+
> > Machine=C2=A0=C2=A0=C2=A0=C2=A0 | Passed=C2=A0 | Skipped |
> +-------------+---------+---------+
> > qemux86-64=C2=A0 |=C2=A0 23690=C2=A0 |=C2=A0 1022=C2=A0=C2=A0 |
> > qemux86=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23427=C2=A0 |=C2=A0 1285=C2=A0=
=C2=A0 |
> > qemuarm=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23407=C2=A0 |=C2=A0 1305=C2=A0=
=C2=A0 |
> > qemuarm64=C2=A0=C2=A0 |=C2=A0 23521=C2=A0 |=C2=A0 1191=C2=A0=C2=A0 |
> > qemuriscv64 |=C2=A0 23463=C2=A0 |=C2=A0 1249=C2=A0=C2=A0 |
> +-------------+---------+---------+
>=20
> Test results difference (1.99.0 - 1.98.1):
>=20
> +-------------+--------+---------+
> > Machine=C2=A0=C2=A0=C2=A0=C2=A0 | Passed | Skipped |
> +-------------+--------+---------+
> > qemux86-64=C2=A0 |=C2=A0 +520=C2=A0 |=C2=A0 +214=C2=A0=C2=A0 |
> > qemux86=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 +512=C2=A0 |=C2=A0 +222=C2=A0=
=C2=A0 |
> > qemuarm=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 +512=C2=A0 |=C2=A0 +222=C2=A0=
=C2=A0 |
> > qemuarm64=C2=A0=C2=A0 |=C2=A0 +520=C2=A0 |=C2=A0 +214=C2=A0=C2=A0 |
> > qemuriscv64 |=C2=A0 +519=C2=A0 |=C2=A0 +215=C2=A0=C2=A0 |
> +-------------+--------+---------+
>=20
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

The autobuilder showed one issue so far:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/4613

Cheers,

Richard

