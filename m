Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A218CDE036
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 20:10:19 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.53747.1727381413114157799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 13:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SoystoFv;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-260e6298635so1147960fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727381412; x=1727986212; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s67C5K20ESATbKEDjQwW5+W5n9SKOJsZFLOXYXfU0Q0=;
        b=SoystoFvnZWhRUM+kVfkGSsHwMa/nFtEYsCVcCJ8HSbVzrLFCOUcS3hVUwUW6/vPg2
         zoZbeIOI8WgaDDzBVsSCXV5UB8+E8uDI7QlMfK14IHOx3ndXzVTj3DwUsCPjWqtwshoT
         k5b57xmQ1C8C9IGXTYShusqv58qLOuzwCVEAY3QM69ZPKuMeLQofogxX4b6N+Pjvexk+
         G0jpPJfnL/1HvWVLjDLcQlyQ8zASGSUSdc1EM8h4hHNNRICQMqrk3fE41kMBQijShUMG
         VC7UN0YZeoJAxCiLv7D+ZqspKqzbHFkOM91RKX8eR8hOk9cE7Rin+ugXmDi3ySg1bEV0
         z0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727381412; x=1727986212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s67C5K20ESATbKEDjQwW5+W5n9SKOJsZFLOXYXfU0Q0=;
        b=Ga2maYACYUf6cRP2PHtyK84y9zEUhqjjXkcx7nVn738U3sbEiFyH/Ved8vyS/FQW+/
         4k8PJUKyW1npUOq+G5+JZehCAof/sHeKZMi2L8wqh5rq6/Koa1W5Yvg/fdJGQ4dmRLyQ
         nmQeAznV75u5XR08X3aPQt2AiJSkftu9iUyaURhSslD2GI7trCwwWD+MOGitVx4wp6kd
         imGOggYFiXjZeA4UWS3EduoRJwRoBxGa1V2/UgIkBcXNDn7CdaW/wseAym/n4MCbZm6b
         dXT2eyzKofobVqWbjlNbXjYZvFOi5YwndpZFNazhaSQxdriI26HkMeQpAn1Ptxm/8v1C
         pjsA==
X-Forwarded-Encrypted: i=1; AJvYcCUThx4JRbjSQQuGA2QM7E1bZevaDLdydQmlsD7Cg4OnhbTh5fQkbfwr55Jy6NTlfEp7NAxfyUh92H51LsBlaDo9xQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7iup4RG73jmIIS1i6xncPm8xRAGH2cW7ToCYY5fwJ1nxXUZ9+
	DeSfHeNW6pqNlu5huULFDUWHSDqRnvjkTIhVigiWtxOlvoMVUKdG8DaFvwn0ulwYcvg/nZzTQay
	PlMAuc74uWBkESf1nV/larOITroclDV+ru2A=
X-Google-Smtp-Source: AGHT+IH5q5f1r8fHCeNE1t2I8f+aRBXmVsMwBpjaTLctMx9P5AOi9qijEhO+UonPX54K/Fy7pGmO3C66/H5lQHoj5Ws=
X-Received: by 2002:a05:6870:b87:b0:277:73ce:da7c with SMTP id
 586e51a60fabf-28710c15406mr564253fac.23.1727381412049; Thu, 26 Sep 2024
 13:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240926133449.1159940-1-yash.shinde@windriver.com> <3947F298-D474-4F42-928C-D916C0A06FDF@arm.com>
In-Reply-To: <3947F298-D474-4F42-928C-D916C0A06FDF@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2024 13:09:45 -0700
Message-ID: <CAMKF1sp+rbjqe-DUVn3fDaKSpOK0DSx32vLnxcCibgN28QyZ-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.79.0->1.80.0
To: ross.burton@arm.com
Cc: "Yash.Shinde@windriver.com" <Yash.Shinde@windriver.com>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>, 
	"Naveen.Gowda@windriver.com" <Naveen.Gowda@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"SunilKumar.Dora@windriver.com" <SunilKumar.Dora@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 20:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204996

On Thu, Sep 26, 2024 at 12:46=E2=80=AFPM Ross Burton via
lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>
wrote:
>
> I threw this series at the autobuilder. It=E2=80=99s still running now, b=
ut there have been some failures in the musl builds:
>
> https://valkyrie.yoctoproject.org/#/builders/29/builds/212
>
it seems to not find testdata json file.

/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/images/q=
emux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json
not found ([Errno 2] No such file or directory:
'/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/images/=
qemux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json').
Have you built the image with IMAGE_CLASSES +=3D "testimage" in the
conf/local.conf?

> Ross
>
> > On 26 Sep 2024, at 14:34, Yash Shinde via lists.openembedded.org <Yash.=
Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Sunil Dora <SunilKumar.Dora@windriver.com>
> >
> > https://blog.rust-lang.org/2024/07/25/Rust-1.80.0.html
> >
> > Signed-off-by: Sunil Dora <SunilKumar.Dora@windriver.com>
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > ---
> > meta/conf/distro/include/tcmode-default.inc   |  2 +-
> > .../rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.bb} |  0
> > ...epro-issue-fix-with-cc-crate-hashmap.patch | 12 +--
> > ...ibstd-rs_1.79.0.bb =3D> libstd-rs_1.80.0.bb} |  0
> > ....79.0.bb =3D> rust-cross-canadian_1.80.0.bb} |  0
> > ...ust-llvm_1.79.0.bb =3D> rust-llvm_1.80.0.bb} |  0
> > meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++----------
> > meta/recipes-devtools/rust/rust-source.inc    |  2 +-
> > .../rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb}   |  0
> > 9 files changed, 47 insertions(+), 47 deletions(-)
> > rename meta/recipes-devtools/rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.bb=
} (100%)
> > rename meta/recipes-devtools/rust/{libstd-rs_1.79.0.bb =3D> libstd-rs_1=
.80.0.bb} (100%)
> > rename meta/recipes-devtools/rust/{rust-cross-canadian_1.79.0.bb =3D> r=
ust-cross-canadian_1.80.0.bb} (100%)
> > rename meta/recipes-devtools/rust/{rust-llvm_1.79.0.bb =3D> rust-llvm_1=
.80.0.bb} (100%)
> > rename meta/recipes-devtools/rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb} =
(100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/di=
stro/include/tcmode-default.inc
> > index 1d2771239e..b8f0ba2b5f 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -24,7 +24,7 @@ GLIBCVERSION ?=3D "2.40%"
> > LINUXLIBCVERSION ?=3D "6.10%"
> > QEMUVERSION ?=3D "9.0%"
> > GOVERSION ?=3D "1.22%"
> > -RUSTVERSION ?=3D "1.79%"
> > +RUSTVERSION ?=3D "1.80%"
> >
> > PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> > PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> > diff --git a/meta/recipes-devtools/rust/cargo_1.79.0.bb b/meta/recipes-=
devtools/rust/cargo_1.80.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/cargo_1.79.0.bb
> > rename to meta/recipes-devtools/rust/cargo_1.80.0.bb
> > diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-=
cc-crate-hashmap.patch
> > index 164f2eb87c..dedfbff497 100644
> > --- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-ha=
shmap.patch
> > +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-ha=
shmap.patch
> > @@ -110,8 +110,8 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@win=
driver.com>
> > -{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84d=
d988ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d=
059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2=
ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a=
7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"3ef95bdcd7=
9a43406fdab275d8a8f45ba787876399b54df34068955ec0109e69","src/lib.rs":"71e55=
cf18e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src/parallel/=
async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190=
d85b45983","src/parallel/job_token.rs":"0676c3177b5be9d7ede483bf4bd45c5ca0f=
5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"aaffed5ad3dc0d2864153=
3ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/parallel/stderr.rs":"a2d1=
8ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src/tool.rs"=
:"172cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src/wi=
ndows/com.rs":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf=
9535","src/windows/find_tools.rs":"f6f391294511c376c3ce10ac2fd29967fe6f21d2=
56d9575d8733c1c7cb1befde","src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa5=
20d3d1940d47d2f531d626e9ae0c48ba49005","src/windows/registry.rs":"c521b72c8=
25e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup=
_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbe=
c8","src/windows/vs_instances.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dd=
a5f9d064099840893eaa7587","src/windows/winapi.rs":"250d51c1826d1a2329e9889d=
d9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"f6b=
90b87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"package":"=
8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
> > \ No newline at end of file
> > +{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84d=
d988ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d=
059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2=
ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a=
7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"0977a08e49=
a78e4065858e650a7e92151806e247b542b87cbbeee96a9177153c","src/lib.rs":"71e55=
cf18e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src/parallel/=
async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190=
d85b45983","src/parallel/job_token.rs":"0676c3177b5be9d7ede483bf4bd45c5ca0f=
5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"aaffed5ad3dc0d2864153=
3ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/parallel/stderr.rs":"a2d1=
8ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src/tool.rs"=
:"172cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src/wi=
ndows/com.rs":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf=
9535","src/windows/find_tools.rs":"f6f391294511c376c3ce10ac2fd29967fe6f21d2=
56d9575d8733c1c7cb1befde","src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa5=
20d3d1940d47d2f531d626e9ae0c48ba49005","src/windows/registry.rs":"c521b72c8=
25e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup=
_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbe=
c8","src/windows/vs_instances.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dd=
a5f9d064099840893eaa7587","src/windows/winapi.rs":"250d51c1826d1a2329e9889d=
d9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"f6b=
90b87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"package":"=
8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
> > ---- a/vendor/cc-1.0.92/src/command_helpers.rs
> > -+++ b/vendor/cc-1.0.92/src/command_helpers.rs
> > +--- a/vendor/cc-1.0.97/src/command_helpers.rs
> > ++++ b/vendor/cc-1.0.97/src/command_helpers.rs
> > @@ -1,11 +1,9 @@
> >  //! Miscellaneous helpers for running commands
> >
> > @@ -158,9 +158,9 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@win=
driver.com>
> >
> >          match obj.parent() {
> >              Some(s) =3D> fs::create_dir_all(s)?,
> > ---- a/vendor/cc-1.0.92/.cargo-checksum.json
> > -+++ b/vendor/cc-1.0.92/.cargo-checksum.json
> > +--- a/vendor/cc-1.0.97/.cargo-checksum.json
> > ++++ b/vendor/cc-1.0.97/.cargo-checksum.json
> > @@ -1 +1 @@
> > --{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a465=
b0c14cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b=
2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0=
a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc359=
30a5a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_compil=
er_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5=
a29","src/lib.rs":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160=
dec5975e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd=
65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"0676c3177b5=
be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs=
":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/p=
arallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e=
31597f34b","src/target_info.rs":"3e6cf011d4fe52065db2716277661342eb8ab9f251=
6fda4c551d0dc0fe0d9c87","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83=
250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43265=
83ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3=
ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tool=
s.rs":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6","s=
rc/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c=
48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066a=
d8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492af=
d44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instance=
s.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","s=
rc/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147=
c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753186=
797793bc5d7896292c408fb44c12dfed3"},"package":"2678b2e3449475e95b0aa6f9b506=
a28e61b3dc8996592b983695e8ebb58a8b41"}
> > +-{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a7=
56cda9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b=
2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0=
a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc359=
30a5a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_compil=
er_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5=
a29","src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fd=
ebcfdcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd=
65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c96=
5c684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs=
":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/p=
arallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e=
31597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f17164=
8e15e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83=
250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43265=
83ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3=
ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tool=
s.rs":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","s=
rc/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c=
48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066a=
d8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492af=
d44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instance=
s.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","s=
rc/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147=
c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753186=
797793bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8eafa9=
a79a902c2f76911e5747ced4e032edd8d9b4"}
> > \ No newline at end of file
> > -+{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a465=
b0c14cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b=
2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0=
a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"edff7d8ad=
5d6f7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src/detect_compil=
er_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5=
a29","src/lib.rs":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160=
dec5975e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd=
65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"0676c3177b5=
be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs=
":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/p=
arallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e=
31597f34b","src/target_info.rs":"3e6cf011d4fe52065db2716277661342eb8ab9f251=
6fda4c551d0dc0fe0d9c87","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83=
250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43265=
83ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3=
ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tool=
s.rs":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6","s=
rc/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c=
48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066a=
d8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492af=
d44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instance=
s.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","s=
rc/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147=
c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753186=
797793bc5d7896292c408fb44c12dfed3"},"package":"2678b2e3449475e95b0aa6f9b506=
a28e61b3dc8996592b983695e8ebb58a8b41"}
> > ++{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a7=
56cda9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14=
d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b=
2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0=
a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"edff7d8ad=
5d6f7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src/detect_compil=
er_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5=
a29","src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fd=
ebcfdcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd=
65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c96=
5c684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs=
":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/p=
arallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e=
31597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f17164=
8e15e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83=
250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43265=
83ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3=
ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tool=
s.rs":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","s=
rc/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c=
48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066a=
d8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492af=
d44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instance=
s.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","s=
rc/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147=
c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753186=
797793bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8eafa9=
a79a902c2f76911e5747ced4e032edd8d9b4"}
> > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb b/meta/reci=
pes-devtools/rust/libstd-rs_1.80.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/libstd-rs_1.79.0.bb
> > rename to meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
> > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.bb b=
/meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.bb
> > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
> > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb b/meta/reci=
pes-devtools/rust/rust-llvm_1.80.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-llvm_1.79.0.bb
> > rename to meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
> > diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipe=
s-devtools/rust/rust-snapshot.inc
> > index e183303ed6..66d777f623 100644
> > --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> > +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> > @@ -4,56 +4,56 @@
> > ## The exact (previous) version that has been used is specified in the =
source tarball.
> > ## The version is replicated here.
> >
> > -SNAPSHOT_VERSION =3D "1.78.0"
> > +SNAPSHOT_VERSION =3D "1.79.0"
> >
> > -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "5173f84a07d4cc6b19f27ed=
a7464999c5886232ce8e54bf61b06617635d43fb9"
> > -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "086367aa83ea8c30ce41fb=
6c097ae6ebdc92363fb1ce8ee9f01d44cafa625f61"
> > -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "66cf114dcd8056a596bf=
169f824ff95ff1837bc065daaafdbcaa02ce92903304"
> > -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "e0450bef5537e6b0bb82872=
e9f837c3b3f6397cc8eba6f53211481c82426e1ce"
> > +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "4ca5e9bd141b0111387ea1a=
a0355f87eb8d0da52fbc616cefa4ecde4997aa65b"
> > +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "77803cfff2ea0342f26b59=
eabec353bc43a1791012aa70855ecfea0fb7ae76ac"
> > +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "519abf4757fbd8d7e3bb=
4e4cfdc362ded972c1d95f04675684df2d31e8c0899b"
> > +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "9c847b42b81325d25a9240e=
33bf03fa8652f5dd321ae90a9a7a58b46bf124b17"
> >
> > -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "472230d0a04c6a2db80671549c=
b970176299817883dafbffb15c993f5aeaa909"
> > -SRC_URI[clippy-snapshot-i686.sha256sum] =3D "1abc63d39850194580c22f998=
ff14aade2601f7cfc2465cf68828dcfc9d5536d"
> > -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "9e5e02311853354c1540e1b=
4da6c1686616cea9d3a233c033023f36d950977c0"
> > -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "8ba9c213e5daaf08a13c5787a4=
ea0d7ae8d1e7004126de2b8dc6a6dcd798becd"
> > +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "57bd43f363ebd399a38aa4ac3b=
137e9172706770f8b23479f9dd859c6ae779ab"
> > +SRC_URI[clippy-snapshot-i686.sha256sum] =3D "1d2612c829d946ca8ce32f2be=
acfde2c5ebed1fcacb720a58fb8e7786e4c82f2"
> > +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "158294f7c424ef75d84046b=
573f225c15d531745cc79d416a18c11aa8253830e"
> > +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "4695a6eb66252d519510ca0a85=
9803fff3a5041f71004404df0ccc9fbf0298d5"
> >
> > -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "fabe8c461fb87eff8bd=
f7845fca7051c5dc6e46da4dc6b3023c90efc7d7bd918"
> > -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "d9366b69bd41673bcc=
d7617c2f3fe6a1cdd478fda407c7d9fda0021e33deb825"
> > -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "9f5dc7bfd8602a59=
4157d04c480fb74804a3cdd9b77f46202e289a546af7c846"
> > -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "9f19f781cdfa51f5e8b=
540602a6a07d45ab5f2e063a86af6177625ecf9d79358"
> > +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "354d498a8e36abe6ebd=
7bd859c8c7e7f02b029aa1897b9b60a87e9902ebb1079"
> > +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "88eab562705d56a246=
a09f2897cbae9e37a66dc3cc2cab52c781cd78024f2b52"
> > +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "88730b1b0d9c5252=
e041ed1fc2375d7292dc45132bcc8b6214490c578de240d3"
> > +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "f39a604e1a5a5ba1c73=
42c9d98c9952b5ba252cda4b55cc6ae7bd6fca72f3889"
> >
> > -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "3d73d16f1b7c4aaf53e6d9a=
c6d04586c60698b0c2c793c55585b0234f75d247d"
> > -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "f9b0d7ac6bdd26b678201d=
068f8777df5fdc7f524602f73eff54c7e8a5844892"
> > -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "4ac9958386c4225b14f8=
e6281dd64a2b00d5db32c5b336fac137c7c729df25a0"
> > -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "33bbd45416ce00f2e21073e=
bcef8668575a3955189c85a13172bf5f5750e00ef"
> > +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "2a55e97ce512c27a012720b=
b2a0cd86554c1d734b5cb91b98f58af167cc0fde1"
> > +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "1ae0bbe5835d9461a12f22=
d509787e6c11aac8335c677152a57a04f8d22cf755"
> > +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6aa2f351bc7dccb54478=
1f4fecddb5ef67e05bb310c84e0106d968231384d9f4"
> > +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "3b9a8067e97dd269a27fe91=
be163e046e85b47973f5d512c3368c49d332dacb1"
> >
> > -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "271e121aa1324d37d2bd6=
50217256a792ed387af4b14df0b2757ba22dab50ee5"
> > -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "53294b52155bb320570d=
d125e58b07ee3a0cb35e47a33716b3561d1751ccc538"
> > -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "303e3533e72099d4f0=
a1d5c2f31c68ef93b3a3ef8af5d36773eac394f920fb22"
> > -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "338299628336aa97e6d2f=
30b5d3c4beaf78038f1e1347a378cbbf80d02a461ea"
> > +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "1e2ffcc41a2083be2f473=
3d534d5ee0e05fc2ace1f21033792a4e2497cbbfbe4"
> > +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "0bceeb8dc5b48e5ea9cf=
f67cdcf8488fe2afe44d7e75ca04669c7c0c2e02a0df"
> > +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "af95929af71494ee3e=
6988ead07204ea05b6f2b729cdb1ffcc26db75e47bf318"
> > +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "2295d50425ed5dfb02856=
0ac0f9a611212d8deb43791a1d199419043157ab95e"
> >
> > -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "b58d7e61fb36295ebd0=
a09242e292c7bc4fa24fc189aa285b6e266263f356316"
> > -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "5b2b621b79a7635d56=
70bc17d992f6a0bff0e153b6629fdd501a08cf0df7b126"
> > -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "117a01afab9d4c6e=
39bc32b57f8a4b9ad8d693869dde0c52fa51a6ec05eaab8b"
> > -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "45ba3091f9f17abfb01=
d0c03c87e8de33f0a210aefbdb007905dbf6cfba8590d"
> > +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "bec32adad9f2cd1650e=
d24ee82fccf7329c68243cdef7cef1e720ccaea097dab"
> > +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "6bb12041b6171e8059=
8c0c04eb7e9bd07ab4fb4d654a9289618e3288a4d2f6c8"
> > +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "3b5d53d70837d5ec=
942ec41a8da37ed932bbdc1e53f78dc54e218db458701588"
> > +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "3b144840f179114cde3=
078909370bfb6928153d0ae303ac9848622c57cee3578"
> >
> > -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "fc3fda5412f2b1a53c6a3=
fe6c0a98864d50eac8c63e9b38383085abad6487e3b"
> > -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "44745c59092bc449b033=
8ab6788eb0b2a6d5ad382224fe1ba1017931ebb6e6dc"
> > -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "e5d0e1e532f4ca4656=
d971c4301e87cbcd571daeffd7830b1d02055f95bdaca6"
> > -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "6925c93e4b5b21e37b27a=
ed7723cdd6da317eec3f06f86fb0e5be868f58ea052"
> > +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "83e28f3e02cce4a9d1984=
1bcb40ec0c8ad4e9af9fb215c39876028e6e9e6baf1"
> > +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "fbc978db4be2e6fdb1db=
cb3ca00ee54c44dafd08930738f1c6aa7ae249685a34"
> > +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "2b8af4060acb10f347=
c66a3477ae92151beba12192590ea40723dcf9b1f7f5b2"
> > +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "1b952b8cd597060ac07bb=
e99cea382651ca6eee4ac2abe0a90303ccf2278e60e"
> >
> > -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "59da021df10c62786d33bc6b1=
86a7d1114f788bebcd09f0dd323032fad2f7f5d"
> > -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "1a5542ac30cbcfb15512aba2=
d53b30dd8835058514085067bbcf7c938c05b79e"
> > -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "aee53a0a04fb44c95b9aa6=
217c5483113e1f67fa595dea6fdcbbbd72826e729b"
> > -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "1f458a0b3b947d78d50c67b16=
bb68e8528cb71d52a7021c3b1652b5f9004c40b"
> > +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "5663e6ea018a13f1c87ac74de=
267829952ea979fbe5f8ee5c1c3531e25d1749c"
> > +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "c00bd892e0f29bbc2514f87c=
7521210ced8c175a41eee0a428e19a6ef157779f"
> > +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "d70e710a5138871e8d972f=
195ced9f7aa639ccef23a87fa03cc527d2b9c3cd36"
> > +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "ef4b494fb7356b6e88a69b713=
78c04ae0f4a3c264adae84c9d4f3a1314eaa2b4"
> >
> > -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f8aacf7a101eb10dc000b8bf=
26de90a9d0ce678d02ccf70430ed20dd31ecec6b"
> > -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "b15184ba6078dd7976f0623=
9a258313a96de2677b37e4c560779cf7f261c3ee5"
> > -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "95aece42a336f237c5bac=
5c5d9aca051b7f0bd3e6a64fb3c5828e6d0d3af2e8c"
> > -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "3994971e5923716d54e4b574=
ce238f04c4e20cda03990670f7cc3f87d36e5499"
> > +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "07fcadd27b645ad58ff4dae5=
ef166fd730311bbae8f25f6640fe1bfd2a1f3c3c"
> > +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "3fb282ee97626e4f25c4f6f=
aac3997859b89f13983dd6fa111e25182dfcb91fa"
> > +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "2c914483c0882d44af2e5=
0a181cbd2c953d672d50b31aa669ee2346cade1f108"
> > +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a04cf42022d0a5faf01c3108=
2bfb1dde9c38409f0ca6da90a3e40faa03e797ae"
> >
> > -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "c119866af24c91108d34267=
e24886ad90fd8784edfdfd0d36c64013b06974f71"
> > +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "9c38f2cd4c19196fcf11316=
6237ab03512bf19ce5a7f13c3bfe0e5cc3317eb44"
> >
> > -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "7e158a16f733844975e6=
5090b07706596401719bd3f5aca44da9f98fb3c11b04"
> > +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "f7c7a73a8e5640f9d5ac=
a6b26866b4da08cf3d3509ed1c4184309fb868acbff2"
> >
> > SRC_URI +=3D " \
> >     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-st=
d-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
> > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> > index becaf2b8ac..a7d52d9405 100644
> > --- a/meta/recipes-devtools/rust/rust-source.inc
> > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > @@ -10,7 +10,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc=
-${RUST_VERSION}-src.tar.xz;n
> >             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
> >             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=
=3D${RUSTSRC} \
> > "
> > -SRC_URI[rust.sha256sum] =3D "ab826e84b8d48ec6eda3370065034dea8c006f6a9=
46d78a9ba12bcb50e6d3c7a"
> > +SRC_URI[rust.sha256sum] =3D "0b9ca1e2e45b8a5f0b58db140af0dc92f8311faeb=
0ad883c5b71a72c02dc6e80"
> >
> > RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >
> > diff --git a/meta/recipes-devtools/rust/rust_1.79.0.bb b/meta/recipes-d=
evtools/rust/rust_1.80.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust_1.79.0.bb
> > rename to meta/recipes-devtools/rust/rust_1.80.0.bb
> > --
> > 2.43.0
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204995): https://lists.openembedded.org/g/openembedde=
d-core/message/204995
> Mute This Topic: https://lists.openembedded.org/mt/108667337/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

