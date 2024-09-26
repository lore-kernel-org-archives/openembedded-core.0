Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A023CDE037
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 20:38:49 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.54437.1727383121003482945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 13:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CwpdUEYj;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f762de00fbso17851391fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727383119; x=1727987919; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESAC9PWggWHoK3r5HtZ4tD68e+3ow1DFgLrZoG6uv8Y=;
        b=CwpdUEYjgEtfpiKruy1FERbdzBEVEMKpD3wkwobzO7TjZA21pVJaQjQEdEd3Q/yvjw
         7HhU4MqDxU66+TFCtAIaNmueZGfmpctTH0mXCVKJzSbZhJ1L53ijXL/xY49q58ctHTzp
         TDbyVCMZ53ibCHP3hGhQ+/7NOoK1n0xIfogr28xAQhs4K1UrmDhLWzan12ITHGJm1es7
         pwwZBQLOdXe7jYYfKx9x9ckF7zUXK8mxrIZI6NIh5bARgDH7s91QKl0Z3yMbOlOQfyhp
         LzEYeMYz/tnyA1zAlpJvr7txQl681LTPS2V2C10UZlS3CjLZO7F5XXuGyNb5K6ee+oA1
         WRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727383119; x=1727987919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESAC9PWggWHoK3r5HtZ4tD68e+3ow1DFgLrZoG6uv8Y=;
        b=jL+JVYpZ8QU3Sfl2h/XQ//h6Bde0T6ntQ2/Ugyeb2iUB0Waaf01TM1aq4k8PCQnkyq
         aIH8Enz3i0NV4TdB4wRZWqbqj9BwTiLtu9BjkUzUptbE6NMBblBvsKOCB3w6hGUabjlW
         apSKo+Cq04AouN8HQkERHDSr0QPISWuLgyk1OeUOy7dwoYmcOpXpNa3tFeLkaXKJrdxS
         LDeN6wW7m1LqoDUskAwON4iwwOJIeGUami+0uuFHez0XvGcXW/VzXZnuntQknArVJ/ZX
         XWb3UQcKDI4aUiJTrzJigV8fJHUIocvEkZM9YXxLs4N8Lu+7FyhqSK7CT+kVXgzWruRR
         M9zw==
X-Forwarded-Encrypted: i=1; AJvYcCXJKWUR4Zn3OVSm8QGNPK1bqn5BV13vIkjTdz5jEQqchRDANbZRakePoWFxR5EEPuVdfUtdZmN+yyPyO5GTPEuI6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwkhCWstL8LmI8TeU3ju0aOKom1eMFMebkGbNmBuFnkvdiAt6Ur
	kcGv9Exihgbmk4HnwgySGCTrVva8KIlDLlh2xcZNWJY4zUbtPG8U/6YbEHVIof2Xl3bvWmjYTO+
	x+Ayd5Ft6VXtch/4g/tmehyY9KaY=
X-Google-Smtp-Source: AGHT+IGe5RmftvNRpA2gk51YBNsWlov1V705spUO5aB/Ou3VZn2psSssXhfXGMY7i9w3u4biwt3e+Nkin6hdJDhQlQQ=
X-Received: by 2002:a05:651c:54a:b0:2f7:4b90:204b with SMTP id
 38308e7fff4ca-2f9d3e5d349mr6579491fa.12.1727383118582; Thu, 26 Sep 2024
 13:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240926133449.1159940-1-yash.shinde@windriver.com>
 <3947F298-D474-4F42-928C-D916C0A06FDF@arm.com> <CAMKF1sp+rbjqe-DUVn3fDaKSpOK0DSx32vLnxcCibgN28QyZ-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sp+rbjqe-DUVn3fDaKSpOK0DSx32vLnxcCibgN28QyZ-Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Sep 2024 22:38:27 +0200
Message-ID: <CANNYZj_U3trh2Ps_LBSn1J5CdVCxtPFUmkDAFajSQjfSNJcrqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.79.0->1.80.0
To: raj.khem@gmail.com
Cc: ross.burton@arm.com, 
	"Yash.Shinde@windriver.com" <Yash.Shinde@windriver.com>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>, 
	"Naveen.Gowda@windriver.com" <Naveen.Gowda@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"SunilKumar.Dora@windriver.com" <SunilKumar.Dora@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000002c9e3906230bb920"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 20:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204997

--0000000000002c9e3906230bb920
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That=E2=80=99s in the qa stage, you need to look at preceding build stage w=
here the
actual fail is.

Alex

On Thu 26. Sep 2024 at 22.10, Khem Raj via lists.openembedded.org <raj.khem=
=3D
gmail.com@lists.openembedded.org> wrote:

> On Thu, Sep 26, 2024 at 12:46=E2=80=AFPM Ross Burton via
> lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>
> wrote:
> >
> > I threw this series at the autobuilder. It=E2=80=99s still running now,=
 but
> there have been some failures in the musl builds:
> >
> > https://valkyrie.yoctoproject.org/#/builders/29/builds/212
> >
> it seems to not find testdata json file.
>
>
> /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/images=
/qemux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json
> not found ([Errno 2] No such file or directory:
>
> '/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/image=
s/qemux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json').
> Have you built the image with IMAGE_CLASSES +=3D "testimage" in the
> conf/local.conf?
>
> > Ross
> >
> > > On 26 Sep 2024, at 14:34, Yash Shinde via lists.openembedded.org
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > From: Sunil Dora <SunilKumar.Dora@windriver.com>
> > >
> > > https://blog.rust-lang.org/2024/07/25/Rust-1.80.0.html
> > >
> > > Signed-off-by: Sunil Dora <SunilKumar.Dora@windriver.com>
> > > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > > ---
> > > meta/conf/distro/include/tcmode-default.inc   |  2 +-
> > > .../rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.bb} |  0
> > > ...epro-issue-fix-with-cc-crate-hashmap.patch | 12 +--
> > > ...ibstd-rs_1.79.0.bb =3D> libstd-rs_1.80.0.bb} |  0
> > > ....79.0.bb =3D> rust-cross-canadian_1.80.0.bb} |  0
> > > ...ust-llvm_1.79.0.bb =3D> rust-llvm_1.80.0.bb} |  0
> > > meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++---------=
-
> > > meta/recipes-devtools/rust/rust-source.inc    |  2 +-
> > > .../rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb}   |  0
> > > 9 files changed, 47 insertions(+), 47 deletions(-)
> > > rename meta/recipes-devtools/rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.=
bb}
> (100%)
> > > rename meta/recipes-devtools/rust/{libstd-rs_1.79.0.bb =3D>
> libstd-rs_1.80.0.bb} (100%)
> > > rename meta/recipes-devtools/rust/{rust-cross-canadian_1.79.0.bb =3D>
> rust-cross-canadian_1.80.0.bb} (100%)
> > > rename meta/recipes-devtools/rust/{rust-llvm_1.79.0.bb =3D>
> rust-llvm_1.80.0.bb} (100%)
> > > rename meta/recipes-devtools/rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb=
}
> (100%)
> > >
> > > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > > index 1d2771239e..b8f0ba2b5f 100644
> > > --- a/meta/conf/distro/include/tcmode-default.inc
> > > +++ b/meta/conf/distro/include/tcmode-default.inc
> > > @@ -24,7 +24,7 @@ GLIBCVERSION ?=3D "2.40%"
> > > LINUXLIBCVERSION ?=3D "6.10%"
> > > QEMUVERSION ?=3D "9.0%"
> > > GOVERSION ?=3D "1.22%"
> > > -RUSTVERSION ?=3D "1.79%"
> > > +RUSTVERSION ?=3D "1.80%"
> > >
> > > PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> > > PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> > > diff --git a/meta/recipes-devtools/rust/cargo_1.79.0.bb
> b/meta/recipes-devtools/rust/cargo_1.80.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/cargo_1.79.0.bb
> > > rename to meta/recipes-devtools/rust/cargo_1.80.0.bb
> > > diff --git
> a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.=
patch
> b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.=
patch
> > > index 164f2eb87c..dedfbff497 100644
> > > ---
> a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.=
patch
> > > +++
> b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.=
patch
> > > @@ -110,8 +110,8 @@ Signed-off-by: Harish Sadineni <
> Harish.Sadineni@windriver.com>
> > >
> -{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84dd9=
88ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d05=
9d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba=
96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a75=
98e678e9b601a7d99a791069bddaf180dfe","src/
> command_helpers.rs
> ":"3ef95bdcd79a43406fdab275d8a8f45ba787876399b54df34068955ec0109e69","src=
/
> lib.rs
> ":"71e55cf18e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src=
/parallel/
> async_executor.rs
> ":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","src=
/parallel/
> job_token.rs
> ":"0676c3177b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src=
/parallel/
> mod.rs
> ":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src=
/parallel/
> stderr.rs
> ":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src=
/
> tool.rs
> ":"172cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src=
/windows/
> com.rs
> ":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src=
/windows/
> find_tools.rs
> ":"f6f391294511c376c3ce10ac2fd29967fe6f21d256d9575d8733c1c7cb1befde","src=
/windows/
> mod.rs
> ":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005","src=
/windows/
> registry.rs
> ":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src=
/windows/
> setup_config.rs
> ":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/
> vs_instances.rs
> ":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src=
/windows/
> winapi.rs
> ":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src=
/windows/
> windows_sys.rs
> ":"f6b90b87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"pa=
ckage":"8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
> > > \ No newline at end of file
> > >
> +{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84dd9=
88ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d05=
9d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba=
96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a75=
98e678e9b601a7d99a791069bddaf180dfe","src/
> command_helpers.rs
> ":"0977a08e49a78e4065858e650a7e92151806e247b542b87cbbeee96a9177153c","src=
/
> lib.rs
> ":"71e55cf18e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src=
/parallel/
> async_executor.rs
> ":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","src=
/parallel/
> job_token.rs
> ":"0676c3177b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src=
/parallel/
> mod.rs
> ":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src=
/parallel/
> stderr.rs
> ":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src=
/
> tool.rs
> ":"172cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src=
/windows/
> com.rs
> ":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src=
/windows/
> find_tools.rs
> ":"f6f391294511c376c3ce10ac2fd29967fe6f21d256d9575d8733c1c7cb1befde","src=
/windows/
> mod.rs
> ":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005","src=
/windows/
> registry.rs
> ":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src=
/windows/
> setup_config.rs
> ":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/
> vs_instances.rs
> ":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src=
/windows/
> winapi.rs
> ":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src=
/windows/
> windows_sys.rs
> ":"f6b90b87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"pa=
ckage":"8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
> > > ---- a/vendor/cc-1.0.92/src/command_helpers.rs
> > > -+++ b/vendor/cc-1.0.92/src/command_helpers.rs
> > > +--- a/vendor/cc-1.0.97/src/command_helpers.rs
> > > ++++ b/vendor/cc-1.0.97/src/command_helpers.rs
> > > @@ -1,11 +1,9 @@
> > >  //! Miscellaneous helpers for running commands
> > >
> > > @@ -158,9 +158,9 @@ Signed-off-by: Harish Sadineni <
> Harish.Sadineni@windriver.com>
> > >
> > >          match obj.parent() {
> > >              Some(s) =3D> fs::create_dir_all(s)?,
> > > ---- a/vendor/cc-1.0.92/.cargo-checksum.json
> > > -+++ b/vendor/cc-1.0.92/.cargo-checksum.json
> > > +--- a/vendor/cc-1.0.97/.cargo-checksum.json
> > > ++++ b/vendor/cc-1.0.97/.cargo-checksum.json
> > > @@ -1 +1 @@
> > >
> --{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a465b0=
c14cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2b=
a96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a7=
598e678e9b601a7d99a791069bddaf180dfe","src/
> command_helpers.rs
> ":"15afbc35930a5a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src=
/detect_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa12=
79cd08abf392f5a29","src/
> lib.rs
> ":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160dec5975e","src=
/parallel/
> async_executor.rs
> ":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","src=
/parallel/
> job_token.rs
> ":"0676c3177b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src=
/parallel/
> mod.rs
> ":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src=
/parallel/
> stderr.rs
> ":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src=
/
> target_info.rs
> ":"3e6cf011d4fe52065db2716277661342eb8ab9f2516fda4c551d0dc0fe0d9c87","src=
/
> tempfile.rs
> ":"47a58e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142","src=
/
> tool.rs
> ":"b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5f96","src=
/windows/
> com.rs
> ":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src=
/windows/
> find_tools.rs
> ":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6","src=
/windows/
> mod.rs
> ":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005","src=
/windows/
> registry.rs
> ":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src=
/windows/
> setup_config.rs
> ":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/
> vs_instances.rs
> ":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src=
/windows/
> winapi.rs
> ":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src=
/windows/
> windows_sys.rs
> ":"5a440eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3"},"pa=
ckage":"2678b2e3449475e95b0aa6f9b506a28e61b3dc8996592b983695e8ebb58a8b41"}
> > >
> +-{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a756=
cda9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2b=
a96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a7=
598e678e9b601a7d99a791069bddaf180dfe","src/
> command_helpers.rs
> ":"15afbc35930a5a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src=
/detect_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa12=
79cd08abf392f5a29","src/
> lib.rs
> ":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebcfdcda","src=
/parallel/
> async_executor.rs
> ":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","src=
/parallel/
> job_token.rs
> ":"352a0295c965c684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src=
/parallel/
> mod.rs
> ":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src=
/parallel/
> stderr.rs
> ":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src=
/
> target_info.rs
> ":"342be00f6215e161d8163e272a2945bb9f52f171648e15e11d46800a73186955","src=
/
> tempfile.rs
> ":"47a58e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142","src=
/
> tool.rs
> ":"b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5f96","src=
/windows/
> com.rs
> ":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src=
/windows/
> find_tools.rs
> ":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","src=
/windows/
> mod.rs
> ":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005","src=
/windows/
> registry.rs
> ":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src=
/windows/
> setup_config.rs
> ":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/
> vs_instances.rs
> ":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src=
/windows/
> winapi.rs
> ":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src=
/windows/
> windows_sys.rs
> ":"5a440eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3"},"pa=
ckage":"099a5357d84c4c61eb35fc8eafa9a79a902c2f76911e5747ced4e032edd8d9b4"}
> > > \ No newline at end of file
> > >
> -+{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a465b0=
c14cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2b=
a96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a7=
598e678e9b601a7d99a791069bddaf180dfe","src/
> command_helpers.rs
> ":"edff7d8ad5d6f7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src=
/detect_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa12=
79cd08abf392f5a29","src/
> lib.rs
> ":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160dec5975e","src=
/parallel/
> async_executor.rs
> ":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","src=
/parallel/
> job_token.rs
> ":"0676c3177b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src=
/parallel/
> mod.rs
> ":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src=
/parallel/
> stderr.rs
> ":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src=
/
> target_info.rs
> ":"3e6cf011d4fe52065db2716277661342eb8ab9f2516fda4c551d0dc0fe0d9c87","src=
/
> tempfile.rs
> ":"47a58e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142","src=
/
> tool.rs
> ":"b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5f96","src=
/windows/
> com.rs
> ":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src=
/windows/
> find_tools.rs
> ":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6","src=
/windows/
> mod.rs
> ":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005","src=
/windows/
> registry.rs
> ":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src=
/windows/
> setup_config.rs
> ":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/
> vs_instances.rs
> ":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src=
/windows/
> winapi.rs
> ":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src=
/windows/
> windows_sys.rs
> ":"5a440eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3"},"pa=
ckage":"2678b2e3449475e95b0aa6f9b506a28e61b3dc8996592b983695e8ebb58a8b41"}
> > >
> ++{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a756=
cda9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2b=
a96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a7=
598e678e9b601a7d99a791069bddaf180dfe","src/
> command_helpers.rs
> ":"edff7d8ad5d6f7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src=
/detect_compiler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa12=
79cd08abf392f5a29","src/
> lib.rs
> ":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebcfdcda","src=
/parallel/
> async_executor.rs
> ":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","src=
/parallel/
> job_token.rs
> ":"352a0295c965c684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src=
/parallel/
> mod.rs
> ":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src=
/parallel/
> stderr.rs
> ":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src=
/
> target_info.rs
> ":"342be00f6215e161d8163e272a2945bb9f52f171648e15e11d46800a73186955","src=
/
> tempfile.rs
> ":"47a58e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142","src=
/
> tool.rs
> ":"b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5f96","src=
/windows/
> com.rs
> ":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src=
/windows/
> find_tools.rs
> ":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","src=
/windows/
> mod.rs
> ":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005","src=
/windows/
> registry.rs
> ":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src=
/windows/
> setup_config.rs
> ":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src=
/windows/
> vs_instances.rs
> ":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src=
/windows/
> winapi.rs
> ":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src=
/windows/
> windows_sys.rs
> ":"5a440eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3"},"pa=
ckage":"099a5357d84c4c61eb35fc8eafa9a79a902c2f76911e5747ced4e032edd8d9b4"}
> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb
> b/meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/libstd-rs_1.79.0.bb
> > > rename to meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.bb
> b/meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.bb
> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb
> b/meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-llvm_1.79.0.bb
> > > rename to meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc
> b/meta/recipes-devtools/rust/rust-snapshot.inc
> > > index e183303ed6..66d777f623 100644
> > > --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> > > +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> > > @@ -4,56 +4,56 @@
> > > ## The exact (previous) version that has been used is specified in th=
e
> source tarball.
> > > ## The version is replicated here.
> > >
> > > -SNAPSHOT_VERSION =3D "1.78.0"
> > > +SNAPSHOT_VERSION =3D "1.79.0"
> > >
> > > -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D
> "5173f84a07d4cc6b19f27eda7464999c5886232ce8e54bf61b06617635d43fb9"
> > > -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D
> "086367aa83ea8c30ce41fb6c097ae6ebdc92363fb1ce8ee9f01d44cafa625f61"
> > > -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D
> "66cf114dcd8056a596bf169f824ff95ff1837bc065daaafdbcaa02ce92903304"
> > > -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D
> "e0450bef5537e6b0bb82872e9f837c3b3f6397cc8eba6f53211481c82426e1ce"
> > > +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D
> "4ca5e9bd141b0111387ea1aa0355f87eb8d0da52fbc616cefa4ecde4997aa65b"
> > > +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D
> "77803cfff2ea0342f26b59eabec353bc43a1791012aa70855ecfea0fb7ae76ac"
> > > +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D
> "519abf4757fbd8d7e3bb4e4cfdc362ded972c1d95f04675684df2d31e8c0899b"
> > > +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D
> "9c847b42b81325d25a9240e33bf03fa8652f5dd321ae90a9a7a58b46bf124b17"
> > >
> > > -SRC_URI[cargo-snapshot-i686.sha256sum] =3D
> "472230d0a04c6a2db80671549cb970176299817883dafbffb15c993f5aeaa909"
> > > -SRC_URI[clippy-snapshot-i686.sha256sum] =3D
> "1abc63d39850194580c22f998ff14aade2601f7cfc2465cf68828dcfc9d5536d"
> > > -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D
> "9e5e02311853354c1540e1b4da6c1686616cea9d3a233c033023f36d950977c0"
> > > -SRC_URI[rustc-snapshot-i686.sha256sum] =3D
> "8ba9c213e5daaf08a13c5787a4ea0d7ae8d1e7004126de2b8dc6a6dcd798becd"
> > > +SRC_URI[cargo-snapshot-i686.sha256sum] =3D
> "57bd43f363ebd399a38aa4ac3b137e9172706770f8b23479f9dd859c6ae779ab"
> > > +SRC_URI[clippy-snapshot-i686.sha256sum] =3D
> "1d2612c829d946ca8ce32f2beacfde2c5ebed1fcacb720a58fb8e7786e4c82f2"
> > > +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D
> "158294f7c424ef75d84046b573f225c15d531745cc79d416a18c11aa8253830e"
> > > +SRC_URI[rustc-snapshot-i686.sha256sum] =3D
> "4695a6eb66252d519510ca0a859803fff3a5041f71004404df0ccc9fbf0298d5"
> > >
> > > -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D
> "fabe8c461fb87eff8bdf7845fca7051c5dc6e46da4dc6b3023c90efc7d7bd918"
> > > -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D
> "d9366b69bd41673bccd7617c2f3fe6a1cdd478fda407c7d9fda0021e33deb825"
> > > -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D
> "9f5dc7bfd8602a594157d04c480fb74804a3cdd9b77f46202e289a546af7c846"
> > > -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D
> "9f19f781cdfa51f5e8b540602a6a07d45ab5f2e063a86af6177625ecf9d79358"
> > > +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D
> "354d498a8e36abe6ebd7bd859c8c7e7f02b029aa1897b9b60a87e9902ebb1079"
> > > +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D
> "88eab562705d56a246a09f2897cbae9e37a66dc3cc2cab52c781cd78024f2b52"
> > > +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D
> "88730b1b0d9c5252e041ed1fc2375d7292dc45132bcc8b6214490c578de240d3"
> > > +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D
> "f39a604e1a5a5ba1c7342c9d98c9952b5ba252cda4b55cc6ae7bd6fca72f3889"
> > >
> > > -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D
> "3d73d16f1b7c4aaf53e6d9ac6d04586c60698b0c2c793c55585b0234f75d247d"
> > > -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D
> "f9b0d7ac6bdd26b678201d068f8777df5fdc7f524602f73eff54c7e8a5844892"
> > > -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D
> "4ac9958386c4225b14f8e6281dd64a2b00d5db32c5b336fac137c7c729df25a0"
> > > -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D
> "33bbd45416ce00f2e21073ebcef8668575a3955189c85a13172bf5f5750e00ef"
> > > +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D
> "2a55e97ce512c27a012720bb2a0cd86554c1d734b5cb91b98f58af167cc0fde1"
> > > +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D
> "1ae0bbe5835d9461a12f22d509787e6c11aac8335c677152a57a04f8d22cf755"
> > > +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D
> "6aa2f351bc7dccb544781f4fecddb5ef67e05bb310c84e0106d968231384d9f4"
> > > +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D
> "3b9a8067e97dd269a27fe91be163e046e85b47973f5d512c3368c49d332dacb1"
> > >
> > > -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D
> "271e121aa1324d37d2bd650217256a792ed387af4b14df0b2757ba22dab50ee5"
> > > -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D
> "53294b52155bb320570dd125e58b07ee3a0cb35e47a33716b3561d1751ccc538"
> > > -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D
> "303e3533e72099d4f0a1d5c2f31c68ef93b3a3ef8af5d36773eac394f920fb22"
> > > -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D
> "338299628336aa97e6d2f30b5d3c4beaf78038f1e1347a378cbbf80d02a461ea"
> > > +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D
> "1e2ffcc41a2083be2f4733d534d5ee0e05fc2ace1f21033792a4e2497cbbfbe4"
> > > +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D
> "0bceeb8dc5b48e5ea9cff67cdcf8488fe2afe44d7e75ca04669c7c0c2e02a0df"
> > > +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D
> "af95929af71494ee3e6988ead07204ea05b6f2b729cdb1ffcc26db75e47bf318"
> > > +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D
> "2295d50425ed5dfb028560ac0f9a611212d8deb43791a1d199419043157ab95e"
> > >
> > > -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D
> "b58d7e61fb36295ebd0a09242e292c7bc4fa24fc189aa285b6e266263f356316"
> > > -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D
> "5b2b621b79a7635d5670bc17d992f6a0bff0e153b6629fdd501a08cf0df7b126"
> > > -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D
> "117a01afab9d4c6e39bc32b57f8a4b9ad8d693869dde0c52fa51a6ec05eaab8b"
> > > -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D
> "45ba3091f9f17abfb01d0c03c87e8de33f0a210aefbdb007905dbf6cfba8590d"
> > > +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D
> "bec32adad9f2cd1650ed24ee82fccf7329c68243cdef7cef1e720ccaea097dab"
> > > +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D
> "6bb12041b6171e80598c0c04eb7e9bd07ab4fb4d654a9289618e3288a4d2f6c8"
> > > +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D
> "3b5d53d70837d5ec942ec41a8da37ed932bbdc1e53f78dc54e218db458701588"
> > > +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D
> "3b144840f179114cde3078909370bfb6928153d0ae303ac9848622c57cee3578"
> > >
> > > -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D
> "fc3fda5412f2b1a53c6a3fe6c0a98864d50eac8c63e9b38383085abad6487e3b"
> > > -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D
> "44745c59092bc449b0338ab6788eb0b2a6d5ad382224fe1ba1017931ebb6e6dc"
> > > -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D
> "e5d0e1e532f4ca4656d971c4301e87cbcd571daeffd7830b1d02055f95bdaca6"
> > > -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D
> "6925c93e4b5b21e37b27aed7723cdd6da317eec3f06f86fb0e5be868f58ea052"
> > > +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D
> "83e28f3e02cce4a9d19841bcb40ec0c8ad4e9af9fb215c39876028e6e9e6baf1"
> > > +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D
> "fbc978db4be2e6fdb1dbcb3ca00ee54c44dafd08930738f1c6aa7ae249685a34"
> > > +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D
> "2b8af4060acb10f347c66a3477ae92151beba12192590ea40723dcf9b1f7f5b2"
> > > +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D
> "1b952b8cd597060ac07bbe99cea382651ca6eee4ac2abe0a90303ccf2278e60e"
> > >
> > > -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D
> "59da021df10c62786d33bc6b186a7d1114f788bebcd09f0dd323032fad2f7f5d"
> > > -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D
> "1a5542ac30cbcfb15512aba2d53b30dd8835058514085067bbcf7c938c05b79e"
> > > -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D
> "aee53a0a04fb44c95b9aa6217c5483113e1f67fa595dea6fdcbbbd72826e729b"
> > > -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D
> "1f458a0b3b947d78d50c67b16bb68e8528cb71d52a7021c3b1652b5f9004c40b"
> > > +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D
> "5663e6ea018a13f1c87ac74de267829952ea979fbe5f8ee5c1c3531e25d1749c"
> > > +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D
> "c00bd892e0f29bbc2514f87c7521210ced8c175a41eee0a428e19a6ef157779f"
> > > +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D
> "d70e710a5138871e8d972f195ced9f7aa639ccef23a87fa03cc527d2b9c3cd36"
> > > +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D
> "ef4b494fb7356b6e88a69b71378c04ae0f4a3c264adae84c9d4f3a1314eaa2b4"
> > >
> > > -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D
> "f8aacf7a101eb10dc000b8bf26de90a9d0ce678d02ccf70430ed20dd31ecec6b"
> > > -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D
> "b15184ba6078dd7976f06239a258313a96de2677b37e4c560779cf7f261c3ee5"
> > > -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D
> "95aece42a336f237c5bac5c5d9aca051b7f0bd3e6a64fb3c5828e6d0d3af2e8c"
> > > -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D
> "3994971e5923716d54e4b574ce238f04c4e20cda03990670f7cc3f87d36e5499"
> > > +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D
> "07fcadd27b645ad58ff4dae5ef166fd730311bbae8f25f6640fe1bfd2a1f3c3c"
> > > +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D
> "3fb282ee97626e4f25c4f6faac3997859b89f13983dd6fa111e25182dfcb91fa"
> > > +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D
> "2c914483c0882d44af2e50a181cbd2c953d672d50b31aa669ee2346cade1f108"
> > > +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D
> "a04cf42022d0a5faf01c31082bfb1dde9c38409f0ca6da90a3e40faa03e797ae"
> > >
> > > -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D
> "c119866af24c91108d34267e24886ad90fd8784edfdfd0d36c64013b06974f71"
> > > +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D
> "9c38f2cd4c19196fcf113166237ab03512bf19ce5a7f13c3bfe0e5cc3317eb44"
> > >
> > > -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D
> "7e158a16f733844975e65090b07706596401719bd3f5aca44da9f98fb3c11b04"
> > > +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D
> "f7c7a73a8e5640f9d5aca6b26866b4da08cf3d3509ed1c4184309fb868acbff2"
> > >
> > > SRC_URI +=3D " \
> > >
>  ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-sna=
pshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components
> \
> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> > > index becaf2b8ac..a7d52d9405 100644
> > > --- a/meta/recipes-devtools/rust/rust-source.inc
> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > > @@ -10,7 +10,7 @@ SRC_URI +=3D "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> > >             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
> > >
>  file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D${RUSTSRC}=
 \
> > > "
> > > -SRC_URI[rust.sha256sum] =3D
> "ab826e84b8d48ec6eda3370065034dea8c006f6a946d78a9ba12bcb50e6d3c7a"
> > > +SRC_URI[rust.sha256sum] =3D
> "0b9ca1e2e45b8a5f0b58db140af0dc92f8311faeb0ad883c5b71a72c02dc6e80"
> > >
> > > RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > >
> > > diff --git a/meta/recipes-devtools/rust/rust_1.79.0.bb
> b/meta/recipes-devtools/rust/rust_1.80.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust_1.79.0.bb
> > > rename to meta/recipes-devtools/rust/rust_1.80.0.bb
> > > --
> > > 2.43.0
> > >
> > >
> > >
> > >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204996):
> https://lists.openembedded.org/g/openembedded-core/message/204996
> Mute This Topic: https://lists.openembedded.org/mt/108667337/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002c9e3906230bb920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That=E2=80=99s in the qa stage, you need to look at prece=
ding build stage where the actual fail is.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu 26. Sep 2024 at 22.10, Khem Raj via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;raj.=
khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Thu, Sep 26, 2=
024 at 12:46=E2=80=AFPM Ross Burton via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@=
lists.openembedded.org" target=3D"_blank">arm.com@lists.openembedded.org</a=
>&gt;<br>
wrote:<br>
&gt;<br>
&gt; I threw this series at the autobuilder. It=E2=80=99s still running now=
, but there have been some failures in the musl builds:<br>
&gt;<br>
&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/29/builds/212"=
 rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproject.org/#/b=
uilders/29/builds/212</a><br>
&gt;<br>
it seems to not find testdata json file.<br>
<br>
/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/images/q=
emux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json<br>
not found ([Errno 2] No such file or directory:<br>
&#39;/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/ima=
ges/qemux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json&#39;).<b=
r>
Have you built the image with IMAGE_CLASSES +=3D &quot;testimage&quot; in t=
he<br>
conf/local.conf?<br>
<br>
&gt; Ross<br>
&gt;<br>
&gt; &gt; On 26 Sep 2024, at 14:34, Yash Shinde via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;Yash.Shinde=3D<a href=3D"mailto:windriver.com@lists.openembedde=
d.org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; From: Sunil Dora &lt;<a href=3D"mailto:SunilKumar.Dora@windriver.=
com" target=3D"_blank">SunilKumar.Dora@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://blog.rust-lang.org/2024/07/25/Rust-1.80.0.html=
" rel=3D"noreferrer" target=3D"_blank">https://blog.rust-lang.org/2024/07/2=
5/Rust-1.80.0.html</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:SunilKumar.Dora@w=
indriver.com" target=3D"_blank">SunilKumar.Dora@windriver.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@wind=
river.com" target=3D"_blank">Yash.Shinde@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 2=
 +-<br>
&gt; &gt; .../rust/{<a href=3D"http://cargo_1.79.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">cargo_1.79.0.bb</a> =3D&gt; <a href=3D"http://cargo_1.80.0=
.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.80.0.bb</a>} |=C2=A0 0<br=
>
&gt; &gt; ...epro-issue-fix-with-cc-crate-hashmap.patch | 12 +--<br>
&gt; &gt; ...<a href=3D"http://ibstd-rs_1.79.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ibstd-rs_1.79.0.bb</a> =3D&gt; <a href=3D"http://libstd-rs_1.8=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.80.0.bb</a>} |=C2=
=A0 0<br>
&gt; &gt; ....<a href=3D"http://79.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">79.0.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.80.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust-cross-canadian_1.80.0.bb</a>} |=C2=
=A0 0<br>
&gt; &gt; ...<a href=3D"http://ust-llvm_1.79.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ust-llvm_1.79.0.bb</a> =3D&gt; <a href=3D"http://rust-llvm_1.8=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.80.0.bb</a>} |=C2=
=A0 0<br>
&gt; &gt; meta/recipes-devtools/rust/rust-snapshot.inc=C2=A0 | 78 +++++++++=
----------<br>
&gt; &gt; meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 2=
 +-<br>
&gt; &gt; .../rust/{<a href=3D"http://rust_1.79.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">rust_1.79.0.bb</a> =3D&gt; <a href=3D"http://rust_1.80.0.bb=
" rel=3D"noreferrer" target=3D"_blank">rust_1.80.0.bb</a>}=C2=A0 =C2=A0|=C2=
=A0 0<br>
&gt; &gt; 9 files changed, 47 insertions(+), 47 deletions(-)<br>
&gt; &gt; rename meta/recipes-devtools/rust/{<a href=3D"http://cargo_1.79.0=
.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.79.0.bb</a> =3D&gt; <a hr=
ef=3D"http://cargo_1.80.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.=
80.0.bb</a>} (100%)<br>
&gt; &gt; rename meta/recipes-devtools/rust/{<a href=3D"http://libstd-rs_1.=
79.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.79.0.bb</a> =3D&g=
t; <a href=3D"http://libstd-rs_1.80.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libstd-rs_1.80.0.bb</a>} (100%)<br>
&gt; &gt; rename meta/recipes-devtools/rust/{<a href=3D"http://rust-cross-c=
anadian_1.79.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadian=
_1.79.0.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.80.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust-cross-canadian_1.80.0.bb</a>} (100%)=
<br>
&gt; &gt; rename meta/recipes-devtools/rust/{<a href=3D"http://rust-llvm_1.=
79.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.79.0.bb</a> =3D&g=
t; <a href=3D"http://rust-llvm_1.80.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rust-llvm_1.80.0.bb</a>} (100%)<br>
&gt; &gt; rename meta/recipes-devtools/rust/{<a href=3D"http://rust_1.79.0.=
bb" rel=3D"noreferrer" target=3D"_blank">rust_1.79.0.bb</a> =3D&gt; <a href=
=3D"http://rust_1.80.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.80.0=
.bb</a>} (100%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/c=
onf/distro/include/tcmode-default.inc<br>
&gt; &gt; index 1d2771239e..b8f0ba2b5f 100644<br>
&gt; &gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt; &gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt; &gt; @@ -24,7 +24,7 @@ GLIBCVERSION ?=3D &quot;2.40%&quot;<br>
&gt; &gt; LINUXLIBCVERSION ?=3D &quot;6.10%&quot;<br>
&gt; &gt; QEMUVERSION ?=3D &quot;9.0%&quot;<br>
&gt; &gt; GOVERSION ?=3D &quot;1.22%&quot;<br>
&gt; &gt; -RUSTVERSION ?=3D &quot;1.79%&quot;<br>
&gt; &gt; +RUSTVERSION ?=3D &quot;1.80%&quot;<br>
&gt; &gt;<br>
&gt; &gt; PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSION}&quot;<br>
&gt; &gt; PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D &quot;${GCCVERSIO=
N}&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1=
.79.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.79.0.bb</a> b/meta/r=
ecipes-devtools/rust/<a href=3D"http://cargo_1.80.0.bb" rel=3D"noreferrer" =
target=3D"_blank">cargo_1.80.0.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://cargo_1.=
79.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.79.0.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://cargo_1.80=
.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.80.0.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-wit=
h-cc-crate-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix=
-with-cc-crate-hashmap.patch<br>
&gt; &gt; index 164f2eb87c..dedfbff497 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-cr=
ate-hashmap.patch<br>
&gt; &gt; +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-cr=
ate-hashmap.patch<br>
&gt; &gt; @@ -110,8 +110,8 @@ Signed-off-by: Harish Sadineni &lt;<a href=3D=
"mailto:Harish.Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@wi=
ndriver.com</a>&gt;<br>
&gt; &gt; -{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;ad60f12609a272a=
3d052258f9521807fd627181125e84dd988ddb2b2e7dfedf6&quot;,&quot;LICENSE-APACH=
E&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f75=
9f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c39418f3f2d7b2ba96=
f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&quot;f1ddbede208=
a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe&quot;,&quot;src/<a hr=
ef=3D"http://command_helpers.rs" rel=3D"noreferrer" target=3D"_blank">comma=
nd_helpers.rs</a>&quot;:&quot;3ef95bdcd79a43406fdab275d8a8f45ba787876399b54=
df34068955ec0109e69&quot;,&quot;src/<a href=3D"http://lib.rs" rel=3D"norefe=
rrer" target=3D"_blank">lib.rs</a>&quot;:&quot;71e55cf18e32dab3b9feae2add4f=
f57932a10084cc5aad4680c12eb3a91ed124&quot;,&quot;src/parallel/<a href=3D"ht=
tp://async_executor.rs" rel=3D"noreferrer" target=3D"_blank">async_executor=
.rs</a>&quot;:&quot;4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190=
d85b45983&quot;,&quot;src/parallel/<a href=3D"http://job_token.rs" rel=3D"n=
oreferrer" target=3D"_blank">job_token.rs</a>&quot;:&quot;0676c3177b5be9d7e=
de483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc&quot;,&quot;src/parallel/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232&q=
uot;,&quot;src/parallel/<a href=3D"http://stderr.rs" rel=3D"noreferrer" tar=
get=3D"_blank">stderr.rs</a>&quot;:&quot;a2d18ba3f2e04deb9047ece9ab7ca5452d=
9a76b515afbe20a76307e31597f34b&quot;,&quot;src/<a href=3D"http://tool.rs" r=
el=3D"noreferrer" target=3D"_blank">tool.rs</a>&quot;:&quot;172cfcbecd7c6a3=
63ea841a48a10a75b0a01e83b83c0691107c601598b68dedf&quot;,&quot;src/windows/<=
a href=3D"http://com.rs" rel=3D"noreferrer" target=3D"_blank">com.rs</a>&qu=
ot;:&quot;be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535&=
quot;,&quot;src/windows/<a href=3D"http://find_tools.rs" rel=3D"noreferrer"=
 target=3D"_blank">find_tools.rs</a>&quot;:&quot;f6f391294511c376c3ce10ac2f=
d29967fe6f21d256d9575d8733c1c7cb1befde&quot;,&quot;src/windows/<a href=3D"h=
ttp://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;4=
2f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005&quot;,&quot=
;src/windows/<a href=3D"http://registry.rs" rel=3D"noreferrer" target=3D"_b=
lank">registry.rs</a>&quot;:&quot;c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1&quot;,&quot;src/windows/<a href=3D"http://setup_con=
fig.rs" rel=3D"noreferrer" target=3D"_blank">setup_config.rs</a>&quot;:&quo=
t;754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8&quot;,&q=
uot;src/windows/<a href=3D"http://vs_instances.rs" rel=3D"noreferrer" targe=
t=3D"_blank">vs_instances.rs</a>&quot;:&quot;76e3cee74b5fd38ddaf533bba11fe4=
01667c50dda5f9d064099840893eaa7587&quot;,&quot;src/windows/<a href=3D"http:=
//winapi.rs" rel=3D"noreferrer" target=3D"_blank">winapi.rs</a>&quot;:&quot=
;250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c&quot;,&qu=
ot;src/windows/<a href=3D"http://windows_sys.rs" rel=3D"noreferrer" target=
=3D"_blank">windows_sys.rs</a>&quot;:&quot;f6b90b87f23e446284bde86749b53858=
c0d37b8a43515ed8d0e90b1ac8cf7771&quot;},&quot;package&quot;:&quot;8cd6604a8=
2acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5&quot;}<br>
&gt; &gt; \ No newline at end of file<br>
&gt; &gt; +{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;ad60f12609a272a=
3d052258f9521807fd627181125e84dd988ddb2b2e7dfedf6&quot;,&quot;LICENSE-APACH=
E&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f75=
9f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c39418f3f2d7b2ba96=
f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&quot;f1ddbede208=
a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe&quot;,&quot;src/<a hr=
ef=3D"http://command_helpers.rs" rel=3D"noreferrer" target=3D"_blank">comma=
nd_helpers.rs</a>&quot;:&quot;0977a08e49a78e4065858e650a7e92151806e247b542b=
87cbbeee96a9177153c&quot;,&quot;src/<a href=3D"http://lib.rs" rel=3D"norefe=
rrer" target=3D"_blank">lib.rs</a>&quot;:&quot;71e55cf18e32dab3b9feae2add4f=
f57932a10084cc5aad4680c12eb3a91ed124&quot;,&quot;src/parallel/<a href=3D"ht=
tp://async_executor.rs" rel=3D"noreferrer" target=3D"_blank">async_executor=
.rs</a>&quot;:&quot;4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190=
d85b45983&quot;,&quot;src/parallel/<a href=3D"http://job_token.rs" rel=3D"n=
oreferrer" target=3D"_blank">job_token.rs</a>&quot;:&quot;0676c3177b5be9d7e=
de483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc&quot;,&quot;src/parallel/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232&q=
uot;,&quot;src/parallel/<a href=3D"http://stderr.rs" rel=3D"noreferrer" tar=
get=3D"_blank">stderr.rs</a>&quot;:&quot;a2d18ba3f2e04deb9047ece9ab7ca5452d=
9a76b515afbe20a76307e31597f34b&quot;,&quot;src/<a href=3D"http://tool.rs" r=
el=3D"noreferrer" target=3D"_blank">tool.rs</a>&quot;:&quot;172cfcbecd7c6a3=
63ea841a48a10a75b0a01e83b83c0691107c601598b68dedf&quot;,&quot;src/windows/<=
a href=3D"http://com.rs" rel=3D"noreferrer" target=3D"_blank">com.rs</a>&qu=
ot;:&quot;be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535&=
quot;,&quot;src/windows/<a href=3D"http://find_tools.rs" rel=3D"noreferrer"=
 target=3D"_blank">find_tools.rs</a>&quot;:&quot;f6f391294511c376c3ce10ac2f=
d29967fe6f21d256d9575d8733c1c7cb1befde&quot;,&quot;src/windows/<a href=3D"h=
ttp://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;4=
2f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba49005&quot;,&quot=
;src/windows/<a href=3D"http://registry.rs" rel=3D"noreferrer" target=3D"_b=
lank">registry.rs</a>&quot;:&quot;c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1&quot;,&quot;src/windows/<a href=3D"http://setup_con=
fig.rs" rel=3D"noreferrer" target=3D"_blank">setup_config.rs</a>&quot;:&quo=
t;754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8&quot;,&q=
uot;src/windows/<a href=3D"http://vs_instances.rs" rel=3D"noreferrer" targe=
t=3D"_blank">vs_instances.rs</a>&quot;:&quot;76e3cee74b5fd38ddaf533bba11fe4=
01667c50dda5f9d064099840893eaa7587&quot;,&quot;src/windows/<a href=3D"http:=
//winapi.rs" rel=3D"noreferrer" target=3D"_blank">winapi.rs</a>&quot;:&quot=
;250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c&quot;,&qu=
ot;src/windows/<a href=3D"http://windows_sys.rs" rel=3D"noreferrer" target=
=3D"_blank">windows_sys.rs</a>&quot;:&quot;f6b90b87f23e446284bde86749b53858=
c0d37b8a43515ed8d0e90b1ac8cf7771&quot;},&quot;package&quot;:&quot;8cd6604a8=
2acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5&quot;}<br>
&gt; &gt; ---- a/vendor/cc-1.0.92/src/<a href=3D"http://command_helpers.rs"=
 rel=3D"noreferrer" target=3D"_blank">command_helpers.rs</a><br>
&gt; &gt; -+++ b/vendor/cc-1.0.92/src/<a href=3D"http://command_helpers.rs"=
 rel=3D"noreferrer" target=3D"_blank">command_helpers.rs</a><br>
&gt; &gt; +--- a/vendor/cc-1.0.97/src/<a href=3D"http://command_helpers.rs"=
 rel=3D"noreferrer" target=3D"_blank">command_helpers.rs</a><br>
&gt; &gt; ++++ b/vendor/cc-1.0.97/src/<a href=3D"http://command_helpers.rs"=
 rel=3D"noreferrer" target=3D"_blank">command_helpers.rs</a><br>
&gt; &gt; @@ -1,11 +1,9 @@<br>
&gt; &gt;=C2=A0 //! Miscellaneous helpers for running commands<br>
&gt; &gt;<br>
&gt; &gt; @@ -158,9 +158,9 @@ Signed-off-by: Harish Sadineni &lt;<a href=3D=
"mailto:Harish.Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@wi=
ndriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match obj.parent() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(s) =3D&gt; f=
s::create_dir_all(s)?,<br>
&gt; &gt; ---- a/vendor/cc-1.0.92/.cargo-checksum.json<br>
&gt; &gt; -+++ b/vendor/cc-1.0.92/.cargo-checksum.json<br>
&gt; &gt; +--- a/vendor/cc-1.0.97/.cargo-checksum.json<br>
&gt; &gt; ++++ b/vendor/cc-1.0.97/.cargo-checksum.json<br>
&gt; &gt; @@ -1 +1 @@<br>
&gt; &gt; --{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;3874a391e74398=
7dfdb8719b2fedf6ea9bfd83d13a465b0c14cf25251f639799&quot;,&quot;LICENSE-APAC=
HE&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f7=
59f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&quot;f1ddbede20=
8a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe&quot;,&quot;src/<a h=
ref=3D"http://command_helpers.rs" rel=3D"noreferrer" target=3D"_blank">comm=
and_helpers.rs</a>&quot;:&quot;15afbc35930a5a53f00d74a8910cff35caeb5511c266=
42cffe5630377aced901&quot;,&quot;src/detect_compiler_family.c&quot;:&quot;7=
2903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29&quot;,&quot=
;src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs<=
/a>&quot;:&quot;4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160dec=
5975e&quot;,&quot;src/parallel/<a href=3D"http://async_executor.rs" rel=3D"=
noreferrer" target=3D"_blank">async_executor.rs</a>&quot;:&quot;4ce24435fff=
6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983&quot;,&quot;src/paral=
lel/<a href=3D"http://job_token.rs" rel=3D"noreferrer" target=3D"_blank">jo=
b_token.rs</a>&quot;:&quot;0676c3177b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9=
f181a0bc83db05dc&quot;,&quot;src/parallel/<a href=3D"http://mod.rs" rel=3D"=
noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;aaffed5ad3dc0d28641533=
ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232&quot;,&quot;src/parallel/<a href=
=3D"http://stderr.rs" rel=3D"noreferrer" target=3D"_blank">stderr.rs</a>&qu=
ot;:&quot;a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b&=
quot;,&quot;src/<a href=3D"http://target_info.rs" rel=3D"noreferrer" target=
=3D"_blank">target_info.rs</a>&quot;:&quot;3e6cf011d4fe52065db2716277661342=
eb8ab9f2516fda4c551d0dc0fe0d9c87&quot;,&quot;src/<a href=3D"http://tempfile=
.rs" rel=3D"noreferrer" target=3D"_blank">tempfile.rs</a>&quot;:&quot;47a58=
e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142&quot;,&quot;src=
/<a href=3D"http://tool.rs" rel=3D"noreferrer" target=3D"_blank">tool.rs</a=
>&quot;:&quot;b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5=
f96&quot;,&quot;src/windows/<a href=3D"http://com.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">com.rs</a>&quot;:&quot;be1564756c9f3ef1398eafeed7b54ba610ca=
ba28e8f6258d28a997737ebf9535&quot;,&quot;src/windows/<a href=3D"http://find=
_tools.rs" rel=3D"noreferrer" target=3D"_blank">find_tools.rs</a>&quot;:&qu=
ot;dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6&quot;,&=
quot;src/windows/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bl=
ank">mod.rs</a>&quot;:&quot;42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d6=
26e9ae0c48ba49005&quot;,&quot;src/windows/<a href=3D"http://registry.rs" re=
l=3D"noreferrer" target=3D"_blank">registry.rs</a>&quot;:&quot;c521b72c825e=
8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1&quot;,&quot;src/window=
s/<a href=3D"http://setup_config.rs" rel=3D"noreferrer" target=3D"_blank">s=
etup_config.rs</a>&quot;:&quot;754439cbab492afd44c9755abcbec1a41c9b2c358131=
cee2df13c0e996dbbec8&quot;,&quot;src/windows/<a href=3D"http://vs_instances=
.rs" rel=3D"noreferrer" target=3D"_blank">vs_instances.rs</a>&quot;:&quot;7=
6e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587&quot;,&quot=
;src/windows/<a href=3D"http://winapi.rs" rel=3D"noreferrer" target=3D"_bla=
nk">winapi.rs</a>&quot;:&quot;250d51c1826d1a2329e9889dd9f058cfce253dbf2a678=
b076147c6cdb5db046c&quot;,&quot;src/windows/<a href=3D"http://windows_sys.r=
s" rel=3D"noreferrer" target=3D"_blank">windows_sys.rs</a>&quot;:&quot;5a44=
0eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3&quot;},&quot;p=
ackage&quot;:&quot;2678b2e3449475e95b0aa6f9b506a28e61b3dc8996592b983695e8eb=
b58a8b41&quot;}<br>
&gt; &gt; +-{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;5c15212a19ab74=
32d834b92cc7f6af9461c860fbaf2a756cda9b6f40d7b0e845&quot;,&quot;LICENSE-APAC=
HE&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f7=
59f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&quot;f1ddbede20=
8a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe&quot;,&quot;src/<a h=
ref=3D"http://command_helpers.rs" rel=3D"noreferrer" target=3D"_blank">comm=
and_helpers.rs</a>&quot;:&quot;15afbc35930a5a53f00d74a8910cff35caeb5511c266=
42cffe5630377aced901&quot;,&quot;src/detect_compiler_family.c&quot;:&quot;7=
2903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29&quot;,&quot=
;src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs<=
/a>&quot;:&quot;d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebc=
fdcda&quot;,&quot;src/parallel/<a href=3D"http://async_executor.rs" rel=3D"=
noreferrer" target=3D"_blank">async_executor.rs</a>&quot;:&quot;4ce24435fff=
6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983&quot;,&quot;src/paral=
lel/<a href=3D"http://job_token.rs" rel=3D"noreferrer" target=3D"_blank">jo=
b_token.rs</a>&quot;:&quot;352a0295c965c684904329d334f3b9889db3a9c3f201701f=
8db44e4d00e00515&quot;,&quot;src/parallel/<a href=3D"http://mod.rs" rel=3D"=
noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;bd9c1334d17d138c281961=
c690b8d8118a2d6295a7d6cd7296826255436fa063&quot;,&quot;src/parallel/<a href=
=3D"http://stderr.rs" rel=3D"noreferrer" target=3D"_blank">stderr.rs</a>&qu=
ot;:&quot;a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b&=
quot;,&quot;src/<a href=3D"http://target_info.rs" rel=3D"noreferrer" target=
=3D"_blank">target_info.rs</a>&quot;:&quot;342be00f6215e161d8163e272a2945bb=
9f52f171648e15e11d46800a73186955&quot;,&quot;src/<a href=3D"http://tempfile=
.rs" rel=3D"noreferrer" target=3D"_blank">tempfile.rs</a>&quot;:&quot;47a58=
e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142&quot;,&quot;src=
/<a href=3D"http://tool.rs" rel=3D"noreferrer" target=3D"_blank">tool.rs</a=
>&quot;:&quot;b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5=
f96&quot;,&quot;src/windows/<a href=3D"http://com.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">com.rs</a>&quot;:&quot;be1564756c9f3ef1398eafeed7b54ba610ca=
ba28e8f6258d28a997737ebf9535&quot;,&quot;src/windows/<a href=3D"http://find=
_tools.rs" rel=3D"noreferrer" target=3D"_blank">find_tools.rs</a>&quot;:&qu=
ot;06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a&quot;,&=
quot;src/windows/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bl=
ank">mod.rs</a>&quot;:&quot;42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d6=
26e9ae0c48ba49005&quot;,&quot;src/windows/<a href=3D"http://registry.rs" re=
l=3D"noreferrer" target=3D"_blank">registry.rs</a>&quot;:&quot;c521b72c825e=
8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1&quot;,&quot;src/window=
s/<a href=3D"http://setup_config.rs" rel=3D"noreferrer" target=3D"_blank">s=
etup_config.rs</a>&quot;:&quot;754439cbab492afd44c9755abcbec1a41c9b2c358131=
cee2df13c0e996dbbec8&quot;,&quot;src/windows/<a href=3D"http://vs_instances=
.rs" rel=3D"noreferrer" target=3D"_blank">vs_instances.rs</a>&quot;:&quot;7=
6e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587&quot;,&quot=
;src/windows/<a href=3D"http://winapi.rs" rel=3D"noreferrer" target=3D"_bla=
nk">winapi.rs</a>&quot;:&quot;250d51c1826d1a2329e9889dd9f058cfce253dbf2a678=
b076147c6cdb5db046c&quot;,&quot;src/windows/<a href=3D"http://windows_sys.r=
s" rel=3D"noreferrer" target=3D"_blank">windows_sys.rs</a>&quot;:&quot;5a44=
0eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3&quot;},&quot;p=
ackage&quot;:&quot;099a5357d84c4c61eb35fc8eafa9a79a902c2f76911e5747ced4e032=
edd8d9b4&quot;}<br>
&gt; &gt; \ No newline at end of file<br>
&gt; &gt; -+{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;3874a391e74398=
7dfdb8719b2fedf6ea9bfd83d13a465b0c14cf25251f639799&quot;,&quot;LICENSE-APAC=
HE&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f7=
59f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&quot;f1ddbede20=
8a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe&quot;,&quot;src/<a h=
ref=3D"http://command_helpers.rs" rel=3D"noreferrer" target=3D"_blank">comm=
and_helpers.rs</a>&quot;:&quot;edff7d8ad5d6f7064ea1ec9ec816f055f87cbe0cd8d5=
05687a67fd544ad7eb11&quot;,&quot;src/detect_compiler_family.c&quot;:&quot;7=
2903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29&quot;,&quot=
;src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs<=
/a>&quot;:&quot;4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160dec=
5975e&quot;,&quot;src/parallel/<a href=3D"http://async_executor.rs" rel=3D"=
noreferrer" target=3D"_blank">async_executor.rs</a>&quot;:&quot;4ce24435fff=
6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983&quot;,&quot;src/paral=
lel/<a href=3D"http://job_token.rs" rel=3D"noreferrer" target=3D"_blank">jo=
b_token.rs</a>&quot;:&quot;0676c3177b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9=
f181a0bc83db05dc&quot;,&quot;src/parallel/<a href=3D"http://mod.rs" rel=3D"=
noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;aaffed5ad3dc0d28641533=
ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232&quot;,&quot;src/parallel/<a href=
=3D"http://stderr.rs" rel=3D"noreferrer" target=3D"_blank">stderr.rs</a>&qu=
ot;:&quot;a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b&=
quot;,&quot;src/<a href=3D"http://target_info.rs" rel=3D"noreferrer" target=
=3D"_blank">target_info.rs</a>&quot;:&quot;3e6cf011d4fe52065db2716277661342=
eb8ab9f2516fda4c551d0dc0fe0d9c87&quot;,&quot;src/<a href=3D"http://tempfile=
.rs" rel=3D"noreferrer" target=3D"_blank">tempfile.rs</a>&quot;:&quot;47a58=
e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142&quot;,&quot;src=
/<a href=3D"http://tool.rs" rel=3D"noreferrer" target=3D"_blank">tool.rs</a=
>&quot;:&quot;b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5=
f96&quot;,&quot;src/windows/<a href=3D"http://com.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">com.rs</a>&quot;:&quot;be1564756c9f3ef1398eafeed7b54ba610ca=
ba28e8f6258d28a997737ebf9535&quot;,&quot;src/windows/<a href=3D"http://find=
_tools.rs" rel=3D"noreferrer" target=3D"_blank">find_tools.rs</a>&quot;:&qu=
ot;dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6&quot;,&=
quot;src/windows/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bl=
ank">mod.rs</a>&quot;:&quot;42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d6=
26e9ae0c48ba49005&quot;,&quot;src/windows/<a href=3D"http://registry.rs" re=
l=3D"noreferrer" target=3D"_blank">registry.rs</a>&quot;:&quot;c521b72c825e=
8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1&quot;,&quot;src/window=
s/<a href=3D"http://setup_config.rs" rel=3D"noreferrer" target=3D"_blank">s=
etup_config.rs</a>&quot;:&quot;754439cbab492afd44c9755abcbec1a41c9b2c358131=
cee2df13c0e996dbbec8&quot;,&quot;src/windows/<a href=3D"http://vs_instances=
.rs" rel=3D"noreferrer" target=3D"_blank">vs_instances.rs</a>&quot;:&quot;7=
6e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587&quot;,&quot=
;src/windows/<a href=3D"http://winapi.rs" rel=3D"noreferrer" target=3D"_bla=
nk">winapi.rs</a>&quot;:&quot;250d51c1826d1a2329e9889dd9f058cfce253dbf2a678=
b076147c6cdb5db046c&quot;,&quot;src/windows/<a href=3D"http://windows_sys.r=
s" rel=3D"noreferrer" target=3D"_blank">windows_sys.rs</a>&quot;:&quot;5a44=
0eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3&quot;},&quot;p=
ackage&quot;:&quot;2678b2e3449475e95b0aa6f9b506a28e61b3dc8996592b983695e8eb=
b58a8b41&quot;}<br>
&gt; &gt; ++{&quot;files&quot;:{&quot;Cargo.toml&quot;:&quot;5c15212a19ab74=
32d834b92cc7f6af9461c860fbaf2a756cda9b6f40d7b0e845&quot;,&quot;LICENSE-APAC=
HE&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f7=
59f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&quot;f1ddbede20=
8a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe&quot;,&quot;src/<a h=
ref=3D"http://command_helpers.rs" rel=3D"noreferrer" target=3D"_blank">comm=
and_helpers.rs</a>&quot;:&quot;edff7d8ad5d6f7064ea1ec9ec816f055f87cbe0cd8d5=
05687a67fd544ad7eb11&quot;,&quot;src/detect_compiler_family.c&quot;:&quot;7=
2903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29&quot;,&quot=
;src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs<=
/a>&quot;:&quot;d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebc=
fdcda&quot;,&quot;src/parallel/<a href=3D"http://async_executor.rs" rel=3D"=
noreferrer" target=3D"_blank">async_executor.rs</a>&quot;:&quot;4ce24435fff=
6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983&quot;,&quot;src/paral=
lel/<a href=3D"http://job_token.rs" rel=3D"noreferrer" target=3D"_blank">jo=
b_token.rs</a>&quot;:&quot;352a0295c965c684904329d334f3b9889db3a9c3f201701f=
8db44e4d00e00515&quot;,&quot;src/parallel/<a href=3D"http://mod.rs" rel=3D"=
noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;bd9c1334d17d138c281961=
c690b8d8118a2d6295a7d6cd7296826255436fa063&quot;,&quot;src/parallel/<a href=
=3D"http://stderr.rs" rel=3D"noreferrer" target=3D"_blank">stderr.rs</a>&qu=
ot;:&quot;a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b&=
quot;,&quot;src/<a href=3D"http://target_info.rs" rel=3D"noreferrer" target=
=3D"_blank">target_info.rs</a>&quot;:&quot;342be00f6215e161d8163e272a2945bb=
9f52f171648e15e11d46800a73186955&quot;,&quot;src/<a href=3D"http://tempfile=
.rs" rel=3D"noreferrer" target=3D"_blank">tempfile.rs</a>&quot;:&quot;47a58=
e904ac07da6682004b5b615dc83250b253a8d3e8ba1b9bcaf6cdf4fd142&quot;,&quot;src=
/<a href=3D"http://tool.rs" rel=3D"noreferrer" target=3D"_blank">tool.rs</a=
>&quot;:&quot;b48a7a0efbeb24dc4ccdb4326583ef074e69c670330681a5be9d5c19492e5=
f96&quot;,&quot;src/windows/<a href=3D"http://com.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">com.rs</a>&quot;:&quot;be1564756c9f3ef1398eafeed7b54ba610ca=
ba28e8f6258d28a997737ebf9535&quot;,&quot;src/windows/<a href=3D"http://find=
_tools.rs" rel=3D"noreferrer" target=3D"_blank">find_tools.rs</a>&quot;:&qu=
ot;06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a&quot;,&=
quot;src/windows/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bl=
ank">mod.rs</a>&quot;:&quot;42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d6=
26e9ae0c48ba49005&quot;,&quot;src/windows/<a href=3D"http://registry.rs" re=
l=3D"noreferrer" target=3D"_blank">registry.rs</a>&quot;:&quot;c521b72c825e=
8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1&quot;,&quot;src/window=
s/<a href=3D"http://setup_config.rs" rel=3D"noreferrer" target=3D"_blank">s=
etup_config.rs</a>&quot;:&quot;754439cbab492afd44c9755abcbec1a41c9b2c358131=
cee2df13c0e996dbbec8&quot;,&quot;src/windows/<a href=3D"http://vs_instances=
.rs" rel=3D"noreferrer" target=3D"_blank">vs_instances.rs</a>&quot;:&quot;7=
6e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587&quot;,&quot=
;src/windows/<a href=3D"http://winapi.rs" rel=3D"noreferrer" target=3D"_bla=
nk">winapi.rs</a>&quot;:&quot;250d51c1826d1a2329e9889dd9f058cfce253dbf2a678=
b076147c6cdb5db046c&quot;,&quot;src/windows/<a href=3D"http://windows_sys.r=
s" rel=3D"noreferrer" target=3D"_blank">windows_sys.rs</a>&quot;:&quot;5a44=
0eb39d8a0c176b66177e8753186797793bc5d7896292c408fb44c12dfed3&quot;},&quot;p=
ackage&quot;:&quot;099a5357d84c4c61eb35fc8eafa9a79a902c2f76911e5747ced4e032=
edd8d9b4&quot;}<br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://libstd-=
rs_1.79.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.79.0.bb</a> =
b/meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_1.80.0.bb" rel=3D"=
noreferrer" target=3D"_blank">libstd-rs_1.80.0.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://libstd-r=
s_1.79.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.79.0.bb</a><b=
r>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_=
1.80.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.80.0.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-cr=
oss-canadian_1.79.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-can=
adian_1.79.0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust-cro=
ss-canadian_1.80.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-cana=
dian_1.80.0.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust-cro=
ss-canadian_1.79.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-cana=
dian_1.79.0.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust-cross=
-canadian_1.80.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadi=
an_1.80.0.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-ll=
vm_1.79.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.79.0.bb</a> =
b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.80.0.bb" rel=3D"=
noreferrer" target=3D"_blank">rust-llvm_1.80.0.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust-llv=
m_1.79.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.79.0.bb</a><b=
r>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_=
1.80.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.80.0.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/=
recipes-devtools/rust/rust-snapshot.inc<br>
&gt; &gt; index e183303ed6..66d777f623 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/rust/rust-snapshot.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/rust/rust-snapshot.inc<br>
&gt; &gt; @@ -4,56 +4,56 @@<br>
&gt; &gt; ## The exact (previous) version that has been used is specified i=
n the source tarball.<br>
&gt; &gt; ## The version is replicated here.<br>
&gt; &gt;<br>
&gt; &gt; -SNAPSHOT_VERSION =3D &quot;1.78.0&quot;<br>
&gt; &gt; +SNAPSHOT_VERSION =3D &quot;1.79.0&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D &quot;5173f84a07d4=
cc6b19f27eda7464999c5886232ce8e54bf61b06617635d43fb9&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D &quot;086367aa83e=
a8c30ce41fb6c097ae6ebdc92363fb1ce8ee9f01d44cafa625f61&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D &quot;66cf114dc=
d8056a596bf169f824ff95ff1837bc065daaafdbcaa02ce92903304&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D &quot;e0450bef5537=
e6b0bb82872e9f837c3b3f6397cc8eba6f53211481c82426e1ce&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D &quot;4ca5e9bd141b=
0111387ea1aa0355f87eb8d0da52fbc616cefa4ecde4997aa65b&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D &quot;77803cfff2e=
a0342f26b59eabec353bc43a1791012aa70855ecfea0fb7ae76ac&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D &quot;519abf475=
7fbd8d7e3bb4e4cfdc362ded972c1d95f04675684df2d31e8c0899b&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D &quot;9c847b42b813=
25d25a9240e33bf03fa8652f5dd321ae90a9a7a58b46bf124b17&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-i686.sha256sum] =3D &quot;472230d0a04c6a2=
db80671549cb970176299817883dafbffb15c993f5aeaa909&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-i686.sha256sum] =3D &quot;1abc63d3985019=
4580c22f998ff14aade2601f7cfc2465cf68828dcfc9d5536d&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D &quot;9e5e02311853=
354c1540e1b4da6c1686616cea9d3a233c033023f36d950977c0&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-i686.sha256sum] =3D &quot;8ba9c213e5daaf0=
8a13c5787a4ea0d7ae8d1e7004126de2b8dc6a6dcd798becd&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-i686.sha256sum] =3D &quot;57bd43f363ebd39=
9a38aa4ac3b137e9172706770f8b23479f9dd859c6ae779ab&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-i686.sha256sum] =3D &quot;1d2612c829d946=
ca8ce32f2beacfde2c5ebed1fcacb720a58fb8e7786e4c82f2&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D &quot;158294f7c424=
ef75d84046b573f225c15d531745cc79d416a18c11aa8253830e&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-i686.sha256sum] =3D &quot;4695a6eb66252d5=
19510ca0a859803fff3a5041f71004404df0ccc9fbf0298d5&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D &quot;fabe8c46=
1fb87eff8bdf7845fca7051c5dc6e46da4dc6b3023c90efc7d7bd918&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D &quot;d9366b6=
9bd41673bccd7617c2f3fe6a1cdd478fda407c7d9fda0021e33deb825&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D &quot;9f5dc=
7bfd8602a594157d04c480fb74804a3cdd9b77f46202e289a546af7c846&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D &quot;9f19f781=
cdfa51f5e8b540602a6a07d45ab5f2e063a86af6177625ecf9d79358&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D &quot;354d498a=
8e36abe6ebd7bd859c8c7e7f02b029aa1897b9b60a87e9902ebb1079&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D &quot;88eab56=
2705d56a246a09f2897cbae9e37a66dc3cc2cab52c781cd78024f2b52&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D &quot;88730=
b1b0d9c5252e041ed1fc2375d7292dc45132bcc8b6214490c578de240d3&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D &quot;f39a604e=
1a5a5ba1c7342c9d98c9952b5ba252cda4b55cc6ae7bd6fca72f3889&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D &quot;3d73d16f1b7c=
4aaf53e6d9ac6d04586c60698b0c2c793c55585b0234f75d247d&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D &quot;f9b0d7ac6bd=
d26b678201d068f8777df5fdc7f524602f73eff54c7e8a5844892&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D &quot;4ac995838=
6c4225b14f8e6281dd64a2b00d5db32c5b336fac137c7c729df25a0&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D &quot;33bbd45416ce=
00f2e21073ebcef8668575a3955189c85a13172bf5f5750e00ef&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D &quot;2a55e97ce512=
c27a012720bb2a0cd86554c1d734b5cb91b98f58af167cc0fde1&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D &quot;1ae0bbe5835=
d9461a12f22d509787e6c11aac8335c677152a57a04f8d22cf755&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D &quot;6aa2f351b=
c7dccb544781f4fecddb5ef67e05bb310c84e0106d968231384d9f4&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D &quot;3b9a8067e97d=
d269a27fe91be163e046e85b47973f5d512c3368c49d332dacb1&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D &quot;271e121aa1=
324d37d2bd650217256a792ed387af4b14df0b2757ba22dab50ee5&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D &quot;53294b521=
55bb320570dd125e58b07ee3a0cb35e47a33716b3561d1751ccc538&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D &quot;303e353=
3e72099d4f0a1d5c2f31c68ef93b3a3ef8af5d36773eac394f920fb22&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D &quot;3382996283=
36aa97e6d2f30b5d3c4beaf78038f1e1347a378cbbf80d02a461ea&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D &quot;1e2ffcc41a=
2083be2f4733d534d5ee0e05fc2ace1f21033792a4e2497cbbfbe4&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D &quot;0bceeb8dc=
5b48e5ea9cff67cdcf8488fe2afe44d7e75ca04669c7c0c2e02a0df&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D &quot;af95929=
af71494ee3e6988ead07204ea05b6f2b729cdb1ffcc26db75e47bf318&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D &quot;2295d50425=
ed5dfb028560ac0f9a611212d8deb43791a1d199419043157ab95e&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D &quot;b58d7e61=
fb36295ebd0a09242e292c7bc4fa24fc189aa285b6e266263f356316&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D &quot;5b2b621=
b79a7635d5670bc17d992f6a0bff0e153b6629fdd501a08cf0df7b126&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D &quot;117a0=
1afab9d4c6e39bc32b57f8a4b9ad8d693869dde0c52fa51a6ec05eaab8b&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D &quot;45ba3091=
f9f17abfb01d0c03c87e8de33f0a210aefbdb007905dbf6cfba8590d&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D &quot;bec32ada=
d9f2cd1650ed24ee82fccf7329c68243cdef7cef1e720ccaea097dab&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D &quot;6bb1204=
1b6171e80598c0c04eb7e9bd07ab4fb4d654a9289618e3288a4d2f6c8&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D &quot;3b5d5=
3d70837d5ec942ec41a8da37ed932bbdc1e53f78dc54e218db458701588&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D &quot;3b144840=
f179114cde3078909370bfb6928153d0ae303ac9848622c57cee3578&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D &quot;fc3fda5412=
f2b1a53c6a3fe6c0a98864d50eac8c63e9b38383085abad6487e3b&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D &quot;44745c590=
92bc449b0338ab6788eb0b2a6d5ad382224fe1ba1017931ebb6e6dc&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D &quot;e5d0e1e=
532f4ca4656d971c4301e87cbcd571daeffd7830b1d02055f95bdaca6&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D &quot;6925c93e4b=
5b21e37b27aed7723cdd6da317eec3f06f86fb0e5be868f58ea052&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D &quot;83e28f3e02=
cce4a9d19841bcb40ec0c8ad4e9af9fb215c39876028e6e9e6baf1&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D &quot;fbc978db4=
be2e6fdb1dbcb3ca00ee54c44dafd08930738f1c6aa7ae249685a34&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D &quot;2b8af40=
60acb10f347c66a3477ae92151beba12192590ea40723dcf9b1f7f5b2&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D &quot;1b952b8cd5=
97060ac07bbe99cea382651ca6eee4ac2abe0a90303ccf2278e60e&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D &quot;59da021df10c62=
786d33bc6b186a7d1114f788bebcd09f0dd323032fad2f7f5d&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D &quot;1a5542ac30cbc=
fb15512aba2d53b30dd8835058514085067bbcf7c938c05b79e&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D &quot;aee53a0a04f=
b44c95b9aa6217c5483113e1f67fa595dea6fdcbbbd72826e729b&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D &quot;1f458a0b3b947d=
78d50c67b16bb68e8528cb71d52a7021c3b1652b5f9004c40b&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D &quot;5663e6ea018a13=
f1c87ac74de267829952ea979fbe5f8ee5c1c3531e25d1749c&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D &quot;c00bd892e0f29=
bbc2514f87c7521210ced8c175a41eee0a428e19a6ef157779f&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D &quot;d70e710a513=
8871e8d972f195ced9f7aa639ccef23a87fa03cc527d2b9c3cd36&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D &quot;ef4b494fb7356b=
6e88a69b71378c04ae0f4a3c264adae84c9d4f3a1314eaa2b4&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D &quot;f8aacf7a101eb=
10dc000b8bf26de90a9d0ce678d02ccf70430ed20dd31ecec6b&quot;<br>
&gt; &gt; -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D &quot;b15184ba6078=
dd7976f06239a258313a96de2677b37e4c560779cf7f261c3ee5&quot;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D &quot;95aece42a3=
36f237c5bac5c5d9aca051b7f0bd3e6a64fb3c5828e6d0d3af2e8c&quot;<br>
&gt; &gt; -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D &quot;3994971e59237=
16d54e4b574ce238f04c4e20cda03990670f7cc3f87d36e5499&quot;<br>
&gt; &gt; +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D &quot;07fcadd27b645=
ad58ff4dae5ef166fd730311bbae8f25f6640fe1bfd2a1f3c3c&quot;<br>
&gt; &gt; +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D &quot;3fb282ee9762=
6e4f25c4f6faac3997859b89f13983dd6fa111e25182dfcb91fa&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D &quot;2c914483c0=
882d44af2e50a181cbd2c953d672d50b31aa669ee2346cade1f108&quot;<br>
&gt; &gt; +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D &quot;a04cf42022d0a=
5faf01c31082bfb1dde9c38409f0ca6da90a3e40faa03e797ae&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D &quot;c119866af24c=
91108d34267e24886ad90fd8784edfdfd0d36c64013b06974f71&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D &quot;9c38f2cd4c19=
196fcf113166237ab03512bf19ce5a7f13c3bfe0e5cc3317eb44&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D &quot;7e158a16f=
733844975e65090b07706596401719bd3f5aca44da9f98fb3c11b04&quot;<br>
&gt; &gt; +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D &quot;f7c7a73a8=
e5640f9d5aca6b26866b4da08cf3d3509ed1c4184309fb868acbff2&quot;<br>
&gt; &gt;<br>
&gt; &gt; SRC_URI +=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.=
tar.xz;name=3Drust-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-c=
omponents \<br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/re=
cipes-devtools/rust/rust-source.inc<br>
&gt; &gt; index becaf2b8ac..a7d52d9405 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; &gt; @@ -10,7 +10,7 @@ SRC_URI +=3D &quot;<a href=3D"https://static.ru=
st-lang.org/dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"noreferrer"=
 target=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-=
src.tar.xz;n</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rust-oe-sel=
ftest.patch;patchdir=3D${RUSTSRC} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://repro-issue=
-fix-with-cc-crate-hashmap.patch;patchdir=3D${RUSTSRC} \<br>
&gt; &gt; &quot;<br>
&gt; &gt; -SRC_URI[rust.sha256sum] =3D &quot;ab826e84b8d48ec6eda3370065034d=
ea8c006f6a946d78a9ba12bcb50e6d3c7a&quot;<br>
&gt; &gt; +SRC_URI[rust.sha256sum] =3D &quot;0b9ca1e2e45b8a5f0b58db140af0dc=
92f8311faeb0ad883c5b71a72c02dc6e80&quot;<br>
&gt; &gt;<br>
&gt; &gt; RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST_VERSION}-src&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.=
79.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.79.0.bb</a> b/meta/rec=
ipes-devtools/rust/<a href=3D"http://rust_1.80.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">rust_1.80.0.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust_1.7=
9.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.79.0.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust_1.80.=
0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.80.0.bb</a><br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204996): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204996" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204996</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108667337/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108667337/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002c9e3906230bb920--

