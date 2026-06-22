Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6BFCDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 15:13:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45581.1782141229277729573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 08:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IHbaxrJZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-464192ab2e1so2838985f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782141227; x=1782746027; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCSn7Ce4T8rIFRcTpwIGx7oj8sc2TYWzDbvbUmERDGw=;
        b=IHbaxrJZRRtrWWk0zu2+9q+ahmCMFFWQAczxXCLJiGvvKmgLBZ+6sO2V4s8TrBc+xy
         SesNGLaqCea36xqCYwraDq4xIOZVnTE9zq1JuNtCY12omq7P2J1fky52gFD/UZIzaqnp
         zIa2Bsnn4vV22tk2iE+HudrmFlo1Kw5fZ5kl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141227; x=1782746027;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCSn7Ce4T8rIFRcTpwIGx7oj8sc2TYWzDbvbUmERDGw=;
        b=tQAAjAcoumE5cKOraR4FQqzKcqSkY2DAAJL4UfNWEhlvaZOWSUX8muxr5VsyKIimhB
         IHQl8j+yteHXQk/fo6cU3KQXYWTYLSlpKFj1p3GX1qxGtYJOy2NpsLKPKhi28AZCfvNb
         aamCmECcC8vP48yuDUs8OS1IKwnrhMgDiLWdidMBiTVHwV8CjtxAodN0dI6Ei5koOGIi
         mMXkqZ14zpJkdjjQxgHKCtt3CxkJrtddjhEJ7KdYpP3WZQSTJVDKzocl68QLLdYI0FXm
         LlZXlyblK9Oz93j6FgZc6KWgtmUpUmUaylH+yc11wT0V3HK+1eD9QDetly48ulJ1Ao+J
         txkw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1D65G4mXNljbA2mUaiDlroyDAaDfI9tYsiBEcNehwENbBn82wZlEeZiODQBFnL0dFvQvmsj1zsfFGxPshxLX8GA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzoaEOTnku7C/STgsi7vsIs0NOCa1agMZKihCCgATNR8tKUj4F4
	qYb8K6iIvdxmDjzff4RvEh2ReWDR2DK162gY4oqOLoy/WjvMCXL0cs6XSS3mylywkHw=
X-Gm-Gg: AfdE7cmMFd048uc60X9fhz5wqHGsOqn+HX3/7TWBLQW9HDgfEQoE9zFA9baXVpZRiwg
	naGNrzC/DDDIoM9kQXAQ82YukFP9jx638N/5HpAulktoq0OFRuJPFsn2GxwMuLZIEDvkrWsrkFQ
	MjYB9JgnH1NZNQ2OPApTQGXC/QfBE4KmqmL+FyFfXTh2zHUIBX3IbuyWGOpds7AaXtc6gYfMY/q
	FJc0FCNiY0seJgvXdKCcOeaFC+7lvven0CKRnDQkXYSN/uvLFbrsxb28e+Pm2pNwReWRf+v/QIr
	0LJOSpd2Wn1YAKVwGrtwHfDSNeXXgC6tnyzNSdzl0gQanFdkP4JDncjPh9LYseRvInnUuN7YXyQ
	VHj5p9hdKH05kGAtJHOWC5l4g/KBv3Ae7KloMvRezVxLbu+9wR+eYENuP+NsW06R+T9MuQsnsV0
	S6/DCqSw6u8+h+MtsH9Gyp7oQE4Py6Hir5p/Hv9Sivc32lWxN/JlSNMog2ReYdDqTtW9E6eOyDo
	hE+7A2ee4/f/v0=
X-Received: by 2002:a05:6000:2884:b0:465:81cb:bb20 with SMTP id ffacd0b85a97d-46581cbbe76mr23937931f8f.9.1782141227329;
        Mon, 22 Jun 2026 08:13:47 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788547sm28534610f8f.18.2026.06.22.08.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:13:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 17:13:46 +0200
Message-Id: <DJFOC9503UH8.3F0S7S25XBUU8@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/2] cargo: Fix CVE-2026-5222
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260615130043.14442-1-adongare@cisco.com>
In-Reply-To: <20260615130043.14442-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239307

On Mon Jun 15, 2026 at 3:00 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using the commi=
t shown in [1].
>
> [1] https://github.com/rust-lang/cargo/commit/c4d63a44234de22dc745231c416=
b80ed848d997f
> [2] https://security-tracker.debian.org/tracker/CVE-2026-5222
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---

Hello,

Looks like this CVE impact wrynose. Can you send a fix there, and then,
ping here?

I suspect the same goes to the patch 2/2.

Thanks!

>  .../rust/files/CVE-2026-5222.patch            | 92 +++++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |  1 +
>  2 files changed, 93 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch
>
> diff --git a/meta/recipes-devtools/rust/files/CVE-2026-5222.patch b/meta/=
recipes-devtools/rust/files/CVE-2026-5222.patch
> new file mode 100644
> index 0000000000..50ba608c1c
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/CVE-2026-5222.patch
> @@ -0,0 +1,92 @@
> +From c4d63a44234de22dc745231c416b80ed848d997f Mon Sep 17 00:00:00 2001
> +From: Arlo Siemsen <arkixml@gmail.com>
> +Date: Mon, 25 May 2026 09:49:43 +0200
> +Subject: [PATCH] CVE-2026-5222: avoid stripping .git suffix when for non=
 git
> + registries
> +
> +CVE: CVE-2026-5222
> +Upstream-Status: Backport [https://github.com/rust-lang/cargo/commit/c4d=
63a44234de22dc745231c416b80ed848d997f]
> +
> +(cherry picked from commit c4d63a44234de22dc745231c416b80ed848d997f)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + src/tools/cargo/src/cargo/sources/git/source.rs |  7 +++++++
> + src/tools/cargo/src/cargo/util/canonical_url.rs | 44 +++++++++++++-----=
-------
> + 2 files changed, 31 insertions(+), 20 deletions(-)
> +
> +diff --git a/src/tools/cargo/src/cargo/sources/git/source.rs b/src/tools=
/cargo/src/cargo/sources/git/source.rs
> +index a75c1ec..1c8dbc8 100644
> +--- a/src/tools/cargo/src/cargo/sources/git/source.rs
> ++++ b/src/tools/cargo/src/cargo/sources/git/source.rs
> +@@ -377,6 +377,13 @@ mod test {
> +         assert_eq!(ident1, ident2);
> +     }
> +=20
> ++    #[test]
> ++    fn test_canonicalize_idents_does_not_strip_dot_git_for_sparse() {
> ++        let ident1 =3D ident(&src("sparse+https://crates.io/fake-regist=
ry"));
> ++        let ident2 =3D ident(&src("sparse+https://crates.io/fake-regist=
ry.git"));
> ++        assert_ne!(ident1, ident2);
> ++    }
> ++
> +     fn src(s: &str) -> SourceId {
> +         SourceId::for_git(&s.into_url().unwrap(), GitReference::Default=
Branch).unwrap()
> +     }
> +diff --git a/src/tools/cargo/src/cargo/util/canonical_url.rs b/src/tools=
/cargo/src/cargo/util/canonical_url.rs
> +index 7516e03..2716d2d 100644
> +--- a/src/tools/cargo/src/cargo/util/canonical_url.rs
> ++++ b/src/tools/cargo/src/cargo/util/canonical_url.rs
> +@@ -33,27 +33,31 @@ impl CanonicalUrl {
> +             url.path_segments_mut().unwrap().pop_if_empty();
> +         }
> +=20
> +-        // For GitHub URLs specifically, just lower-case everything. Gi=
tHub
> +-        // treats both the same, but they hash differently, and we're g=
onna be
> +-        // hashing them. This wants a more general solution, and also w=
e're
> +-        // almost certainly not using the same case conversion rules th=
at GitHub
> +-        // does. (See issue #84)
> +-        if url.host_str() =3D=3D Some("github.com") {
> +-            url =3D format!("https{}", &url[url::Position::AfterScheme.=
.])
> +-                .parse()
> +-                .unwrap();
> +-            let path =3D url.path().to_lowercase();
> +-            url.set_path(&path);
> +-        }
> ++        // Perform further canonicalization specific to git registries,=
 which
> ++        // do not contain a `+` specifier.
> ++        if !url.scheme().contains('+') {
> ++            // For GitHub URLs specifically, just lower-case everything=
. GitHub
> ++            // treats both the same, but they hash differently, and we'=
re gonna be
> ++            // hashing them. This wants a more general solution, and al=
so we're
> ++            // almost certainly not using the same case conversion rule=
s that GitHub
> ++            // does. (See issue #84)
> ++            if url.host_str() =3D=3D Some("github.com") {
> ++                url =3D format!("https{}", &url[url::Position::AfterSch=
eme..])
> ++                    .parse()
> ++                    .unwrap();
> ++                let path =3D url.path().to_lowercase();
> ++                url.set_path(&path);
> ++            }
> +=20
> +-        // Repos can generally be accessed with or without `.git` exten=
sion.
> +-        let needs_chopping =3D url.path().ends_with(".git");
> +-        if needs_chopping {
> +-            let last =3D {
> +-                let last =3D url.path_segments().unwrap().next_back().u=
nwrap();
> +-                last[..last.len() - 4].to_owned()
> +-            };
> +-            url.path_segments_mut().unwrap().pop().push(&last);
> ++            // Repos can generally be accessed with or without `.git` e=
xtension.
> ++            let needs_chopping =3D url.path().ends_with(".git");
> ++            if needs_chopping {
> ++                let last =3D {
> ++                    let last =3D url.path_segments().unwrap().next_back=
().unwrap();
> ++                    last[..last.len() - 4].to_owned()
> ++                };
> ++                url.path_segments_mut().unwrap().pop().push(&last);
> ++            }
> +         }
> +=20
> +         Ok(CanonicalUrl(url))
> +--=20
> +2.44.4
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index 5b433ceae7..963b5debcd 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -13,6 +13,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
>              file://0001-Handle-vendored-sources-when-remapping-paths.pat=
ch;patchdir=3D${RUSTSRC} \
>              file://repro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC}=
 \
>              file://0001-cargo-do-not-write-host-information-into-compila=
tion.patch;patchdir=3D${RUSTSRC} \
> +            file://CVE-2026-5222.patch;patchdir=3D${RUSTSRC} \
>  "
>  SRC_URI[rust.sha256sum] =3D "4526f786d673e4859ff2afa0bab2ba13c918b796519=
a25c1acce06dba9542340"
> =20


--=20
Yoann Congal
Smile ECS


