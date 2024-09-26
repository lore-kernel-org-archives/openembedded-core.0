Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530DFCDE03A
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 20:43:19 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.54555.1727383392226371224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 13:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFEd+sN/;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5e1b6e8720dso785596eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727383391; x=1727988191; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mvVvm9txKiuryAIYIcxIXS90uKbFDMelfBIcBa4Gv4=;
        b=VFEd+sN/wv+F55eusc1MgyYYIg9Ef0xl9mrc87PPS+hF3GhXNAPJOETYjjdIISYKhd
         TrT8C8uxmYICHvrkOQ6ZeXVpgGTD7W2HXkrg4Kxbo67wctrmPcgIZcH4jFItdJ8LNTqn
         Fdy+M79qK6wbANCqc4ej6ZwRkio2miI4R82SZH7/MkxiAfdj+dxU6NgK9cfAOYQhwcZ0
         6CcN2C0rNmc1LLZFxJ6WYzKU+Q+5NG/DjurYdaBGY0y1nCgwGzGE4KMlepkdp3oYMTpE
         EtRlILus5rr0cDLnRBbcLgHnc5wsmYfQ0gbeaoyn/uSQc3DrMZ3DPRH0UgFZvncBOvaB
         95Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727383391; x=1727988191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mvVvm9txKiuryAIYIcxIXS90uKbFDMelfBIcBa4Gv4=;
        b=bd5AhtslVH01aUQBMmz3SXKECFuTX7+5jb3Tnnhm/9/b+Dr725nR+UgLlPU3Td3hDa
         dvoNCNvT/HDlyYTafCUFKc05MuhWjcWxGUhHmRTVy4m9GltWyKf6UuX4FfHHk9kHIxnP
         9DfS/fnWWaX1jnzoG3P4pKtuNsj4rTA6GmCLgKn+lRy/gsGMd9SUXc2j52HchzvzH9PN
         wNlkauPDlnw6UBkvQGuRxms2hLMhk+DN8L2CCkaSaC/xhNv8DGrD7qEnxMITTJcLFD6Q
         2W4IDiBZypP1lKIgGu1EOfApzODtbPGi8wT69yr+tFR5MwG2LqpxJwMxfVPzM1kpKRoE
         iFKA==
X-Forwarded-Encrypted: i=1; AJvYcCVU6n5RC+j7MltrmOqfGAHWsTDJFj0jQe9jUa+8es3ezFipcfOFN4cWTTI8SQXwWbsiO77W2GgTGaV+F3I1vyw96Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxSLZMueoows0SKIetsTEcbwRAmN6XKahoEfZcKjKXo5VFLYB73
	clz4mT41PVIMngF9xdNk/4iNVHyEwJWA2NPrIQkpZGT0I8ro9NhYSAoePW2rOqo1hY73UVb1FPo
	dDQFUH8W2Sa439APxdZrBYesS0IQ=
X-Google-Smtp-Source: AGHT+IGrdCwjuzYMUQuG2o5CiAUsryM4pY7MPHhGKPCRzEKmjcYomZc/EpmMOwv94KZAUf3Is+CKvl9QDY6sHwjzgm0=
X-Received: by 2002:a05:6871:548:b0:27b:5890:bd38 with SMTP id
 586e51a60fabf-287109f6edbmr1327316fac.7.1727383391192; Thu, 26 Sep 2024
 13:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240926133449.1159940-1-yash.shinde@windriver.com>
 <3947F298-D474-4F42-928C-D916C0A06FDF@arm.com> <CAMKF1sp+rbjqe-DUVn3fDaKSpOK0DSx32vLnxcCibgN28QyZ-Q@mail.gmail.com>
 <CANNYZj_U3trh2Ps_LBSn1J5CdVCxtPFUmkDAFajSQjfSNJcrqA@mail.gmail.com>
In-Reply-To: <CANNYZj_U3trh2Ps_LBSn1J5CdVCxtPFUmkDAFajSQjfSNJcrqA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2024 13:42:44 -0700
Message-ID: <CAMKF1sp2pFNs2pyj4TvWDL41enp-C-ei+Xc=BYmU=KBuNGd_dQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.79.0->1.80.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ross.burton@arm.com, 
	"Yash.Shinde@windriver.com" <Yash.Shinde@windriver.com>, 
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
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 20:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205000

yeah figured as I was walking the stack

On Thu, Sep 26, 2024 at 1:38=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> That=E2=80=99s in the qa stage, you need to look at preceding build stage=
 where the actual fail is.
>
> Alex
>
> On Thu 26. Sep 2024 at 22.10, Khem Raj via lists.openembedded.org <raj.kh=
em=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Thu, Sep 26, 2024 at 12:46=E2=80=AFPM Ross Burton via
>> lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>
>> wrote:
>> >
>> > I threw this series at the autobuilder. It=E2=80=99s still running now=
, but there have been some failures in the musl builds:
>> >
>> > https://valkyrie.yoctoproject.org/#/builders/29/builds/212
>> >
>> it seems to not find testdata json file.
>>
>> /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/image=
s/qemux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json
>> not found ([Errno 2] No such file or directory:
>> '/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/deploy/imag=
es/qemux86-64/core-image-sato-sdk-qemux86-64.rootfs.testdata.json').
>> Have you built the image with IMAGE_CLASSES +=3D "testimage" in the
>> conf/local.conf?
>>
>> > Ross
>> >
>> > > On 26 Sep 2024, at 14:34, Yash Shinde via lists.openembedded.org <Ya=
sh.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>> > >
>> > > From: Sunil Dora <SunilKumar.Dora@windriver.com>
>> > >
>> > > https://blog.rust-lang.org/2024/07/25/Rust-1.80.0.html
>> > >
>> > > Signed-off-by: Sunil Dora <SunilKumar.Dora@windriver.com>
>> > > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> > > ---
>> > > meta/conf/distro/include/tcmode-default.inc   |  2 +-
>> > > .../rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.bb} |  0
>> > > ...epro-issue-fix-with-cc-crate-hashmap.patch | 12 +--
>> > > ...ibstd-rs_1.79.0.bb =3D> libstd-rs_1.80.0.bb} |  0
>> > > ....79.0.bb =3D> rust-cross-canadian_1.80.0.bb} |  0
>> > > ...ust-llvm_1.79.0.bb =3D> rust-llvm_1.80.0.bb} |  0
>> > > meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++--------=
--
>> > > meta/recipes-devtools/rust/rust-source.inc    |  2 +-
>> > > .../rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb}   |  0
>> > > 9 files changed, 47 insertions(+), 47 deletions(-)
>> > > rename meta/recipes-devtools/rust/{cargo_1.79.0.bb =3D> cargo_1.80.0=
.bb} (100%)
>> > > rename meta/recipes-devtools/rust/{libstd-rs_1.79.0.bb =3D> libstd-r=
s_1.80.0.bb} (100%)
>> > > rename meta/recipes-devtools/rust/{rust-cross-canadian_1.79.0.bb =3D=
> rust-cross-canadian_1.80.0.bb} (100%)
>> > > rename meta/recipes-devtools/rust/{rust-llvm_1.79.0.bb =3D> rust-llv=
m_1.80.0.bb} (100%)
>> > > rename meta/recipes-devtools/rust/{rust_1.79.0.bb =3D> rust_1.80.0.b=
b} (100%)
>> > >
>> > > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf=
/distro/include/tcmode-default.inc
>> > > index 1d2771239e..b8f0ba2b5f 100644
>> > > --- a/meta/conf/distro/include/tcmode-default.inc
>> > > +++ b/meta/conf/distro/include/tcmode-default.inc
>> > > @@ -24,7 +24,7 @@ GLIBCVERSION ?=3D "2.40%"
>> > > LINUXLIBCVERSION ?=3D "6.10%"
>> > > QEMUVERSION ?=3D "9.0%"
>> > > GOVERSION ?=3D "1.22%"
>> > > -RUSTVERSION ?=3D "1.79%"
>> > > +RUSTVERSION ?=3D "1.80%"
>> > >
>> > > PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>> > > PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
>> > > diff --git a/meta/recipes-devtools/rust/cargo_1.79.0.bb b/meta/recip=
es-devtools/rust/cargo_1.80.0.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/cargo_1.79.0.bb
>> > > rename to meta/recipes-devtools/rust/cargo_1.80.0.bb
>> > > diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-c=
c-crate-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-wi=
th-cc-crate-hashmap.patch
>> > > index 164f2eb87c..dedfbff497 100644
>> > > --- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch
>> > > +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch
>> > > @@ -110,8 +110,8 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@=
windriver.com>
>> > > -{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e=
84dd988ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe=
14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d=
7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25da=
c0a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"3ef95bd=
cd79a43406fdab275d8a8f45ba787876399b54df34068955ec0109e69","src/lib.rs":"71=
e55cf18e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src/parall=
el/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9=
190d85b45983","src/parallel/job_token.rs":"0676c3177b5be9d7ede483bf4bd45c5c=
a0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"aaffed5ad3dc0d2864=
1533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/parallel/stderr.rs":"a=
2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src/tool.=
rs":"172cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src=
/windows/com.rs":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737=
ebf9535","src/windows/find_tools.rs":"f6f391294511c376c3ce10ac2fd29967fe6f2=
1d256d9575d8733c1c7cb1befde","src/windows/mod.rs":"42f1ad7fee35a17686b003e6=
aa520d3d1940d47d2f531d626e9ae0c48ba49005","src/windows/registry.rs":"c521b7=
2c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/se=
tup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996d=
bbec8","src/windows/vs_instances.rs":"76e3cee74b5fd38ddaf533bba11fe401667c5=
0dda5f9d064099840893eaa7587","src/windows/winapi.rs":"250d51c1826d1a2329e98=
89dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"=
f6b90b87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"package=
":"8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
>> > > \ No newline at end of file
>> > > +{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e=
84dd988ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe=
14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d=
7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25da=
c0a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"0977a08=
e49a78e4065858e650a7e92151806e247b542b87cbbeee96a9177153c","src/lib.rs":"71=
e55cf18e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src/parall=
el/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9=
190d85b45983","src/parallel/job_token.rs":"0676c3177b5be9d7ede483bf4bd45c5c=
a0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"aaffed5ad3dc0d2864=
1533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/parallel/stderr.rs":"a=
2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src/tool.=
rs":"172cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src=
/windows/com.rs":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737=
ebf9535","src/windows/find_tools.rs":"f6f391294511c376c3ce10ac2fd29967fe6f2=
1d256d9575d8733c1c7cb1befde","src/windows/mod.rs":"42f1ad7fee35a17686b003e6=
aa520d3d1940d47d2f531d626e9ae0c48ba49005","src/windows/registry.rs":"c521b7=
2c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/se=
tup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996d=
bbec8","src/windows/vs_instances.rs":"76e3cee74b5fd38ddaf533bba11fe401667c5=
0dda5f9d064099840893eaa7587","src/windows/winapi.rs":"250d51c1826d1a2329e98=
89dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"=
f6b90b87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"package=
":"8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
>> > > ---- a/vendor/cc-1.0.92/src/command_helpers.rs
>> > > -+++ b/vendor/cc-1.0.92/src/command_helpers.rs
>> > > +--- a/vendor/cc-1.0.97/src/command_helpers.rs
>> > > ++++ b/vendor/cc-1.0.97/src/command_helpers.rs
>> > > @@ -1,11 +1,9 @@
>> > >  //! Miscellaneous helpers for running commands
>> > >
>> > > @@ -158,9 +158,9 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@=
windriver.com>
>> > >
>> > >          match obj.parent() {
>> > >              Some(s) =3D> fs::create_dir_all(s)?,
>> > > ---- a/vendor/cc-1.0.92/.cargo-checksum.json
>> > > -+++ b/vendor/cc-1.0.92/.cargo-checksum.json
>> > > +--- a/vendor/cc-1.0.97/.cargo-checksum.json
>> > > ++++ b/vendor/cc-1.0.97/.cargo-checksum.json
>> > > @@ -1 +1 @@
>> > > --{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a=
465b0c14cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc=
35930a5a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_com=
piler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf39=
2f5a29","src/lib.rs":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553=
160dec5975e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c1=
6bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"0676c317=
7b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod=
.rs":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","sr=
c/parallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a763=
07e31597f34b","src/target_info.rs":"3e6cf011d4fe52065db2716277661342eb8ab9f=
2516fda4c551d0dc0fe0d9c87","src/tempfile.rs":"47a58e904ac07da6682004b5b615d=
c83250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43=
26583ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c=
9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_t=
ools.rs":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6"=
,"src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9a=
e0c48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed0=
66ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab49=
2afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_insta=
nces.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587"=
,"src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076=
147c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753=
186797793bc5d7896292c408fb44c12dfed3"},"package":"2678b2e3449475e95b0aa6f9b=
506a28e61b3dc8996592b983695e8ebb58a8b41"}
>> > > +-{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf=
2a756cda9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc=
35930a5a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_com=
piler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf39=
2f5a29","src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b=
3fdebcfdcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c1=
6bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295=
c965c684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod=
.rs":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","sr=
c/parallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a763=
07e31597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f17=
1648e15e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615d=
c83250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43=
26583ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c=
9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_t=
ools.rs":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a"=
,"src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9a=
e0c48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed0=
66ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab49=
2afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_insta=
nces.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587"=
,"src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076=
147c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753=
186797793bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8ea=
fa9a79a902c2f76911e5747ced4e032edd8d9b4"}
>> > > \ No newline at end of file
>> > > -+{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a=
465b0c14cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"edff7d=
8ad5d6f7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src/detect_com=
piler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf39=
2f5a29","src/lib.rs":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553=
160dec5975e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c1=
6bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"0676c317=
7b5be9d7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod=
.rs":"aaffed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","sr=
c/parallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a763=
07e31597f34b","src/target_info.rs":"3e6cf011d4fe52065db2716277661342eb8ab9f=
2516fda4c551d0dc0fe0d9c87","src/tempfile.rs":"47a58e904ac07da6682004b5b615d=
c83250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43=
26583ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c=
9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_t=
ools.rs":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6"=
,"src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9a=
e0c48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed0=
66ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab49=
2afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_insta=
nces.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587"=
,"src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076=
147c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753=
186797793bc5d7896292c408fb44c12dfed3"},"package":"2678b2e3449475e95b0aa6f9b=
506a28e61b3dc8996592b983695e8ebb58a8b41"}
>> > > ++{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf=
2a756cda9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"edff7d=
8ad5d6f7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src/detect_com=
piler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf39=
2f5a29","src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b=
3fdebcfdcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c1=
6bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295=
c965c684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod=
.rs":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","sr=
c/parallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a763=
07e31597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f17=
1648e15e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615d=
c83250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb43=
26583ef074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c=
9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_t=
ools.rs":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a"=
,"src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9a=
e0c48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed0=
66ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab49=
2afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_insta=
nces.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587"=
,"src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076=
147c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753=
186797793bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8ea=
fa9a79a902c2f76911e5747ced4e032edd8d9b4"}
>> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb b/meta/r=
ecipes-devtools/rust/libstd-rs_1.80.0.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/libstd-rs_1.79.0.bb
>> > > rename to meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
>> > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.b=
b b/meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.bb
>> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
>> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb b/meta/r=
ecipes-devtools/rust/rust-llvm_1.80.0.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/rust-llvm_1.79.0.bb
>> > > rename to meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
>> > > diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/rec=
ipes-devtools/rust/rust-snapshot.inc
>> > > index e183303ed6..66d777f623 100644
>> > > --- a/meta/recipes-devtools/rust/rust-snapshot.inc
>> > > +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
>> > > @@ -4,56 +4,56 @@
>> > > ## The exact (previous) version that has been used is specified in t=
he source tarball.
>> > > ## The version is replicated here.
>> > >
>> > > -SNAPSHOT_VERSION =3D "1.78.0"
>> > > +SNAPSHOT_VERSION =3D "1.79.0"
>> > >
>> > > -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "5173f84a07d4cc6b19f2=
7eda7464999c5886232ce8e54bf61b06617635d43fb9"
>> > > -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "086367aa83ea8c30ce4=
1fb6c097ae6ebdc92363fb1ce8ee9f01d44cafa625f61"
>> > > -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "66cf114dcd8056a59=
6bf169f824ff95ff1837bc065daaafdbcaa02ce92903304"
>> > > -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "e0450bef5537e6b0bb82=
872e9f837c3b3f6397cc8eba6f53211481c82426e1ce"
>> > > +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "4ca5e9bd141b0111387e=
a1aa0355f87eb8d0da52fbc616cefa4ecde4997aa65b"
>> > > +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "77803cfff2ea0342f26=
b59eabec353bc43a1791012aa70855ecfea0fb7ae76ac"
>> > > +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "519abf4757fbd8d7e=
3bb4e4cfdc362ded972c1d95f04675684df2d31e8c0899b"
>> > > +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "9c847b42b81325d25a92=
40e33bf03fa8652f5dd321ae90a9a7a58b46bf124b17"
>> > >
>> > > -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "472230d0a04c6a2db806715=
49cb970176299817883dafbffb15c993f5aeaa909"
>> > > -SRC_URI[clippy-snapshot-i686.sha256sum] =3D "1abc63d39850194580c22f=
998ff14aade2601f7cfc2465cf68828dcfc9d5536d"
>> > > -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "9e5e02311853354c1540=
e1b4da6c1686616cea9d3a233c033023f36d950977c0"
>> > > -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "8ba9c213e5daaf08a13c578=
7a4ea0d7ae8d1e7004126de2b8dc6a6dcd798becd"
>> > > +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "57bd43f363ebd399a38aa4a=
c3b137e9172706770f8b23479f9dd859c6ae779ab"
>> > > +SRC_URI[clippy-snapshot-i686.sha256sum] =3D "1d2612c829d946ca8ce32f=
2beacfde2c5ebed1fcacb720a58fb8e7786e4c82f2"
>> > > +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "158294f7c424ef75d840=
46b573f225c15d531745cc79d416a18c11aa8253830e"
>> > > +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "4695a6eb66252d519510ca0=
a859803fff3a5041f71004404df0ccc9fbf0298d5"
>> > >
>> > > -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "fabe8c461fb87eff=
8bdf7845fca7051c5dc6e46da4dc6b3023c90efc7d7bd918"
>> > > -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "d9366b69bd41673=
bccd7617c2f3fe6a1cdd478fda407c7d9fda0021e33deb825"
>> > > -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "9f5dc7bfd8602=
a594157d04c480fb74804a3cdd9b77f46202e289a546af7c846"
>> > > -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "9f19f781cdfa51f5=
e8b540602a6a07d45ab5f2e063a86af6177625ecf9d79358"
>> > > +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "354d498a8e36abe6=
ebd7bd859c8c7e7f02b029aa1897b9b60a87e9902ebb1079"
>> > > +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "88eab562705d56a=
246a09f2897cbae9e37a66dc3cc2cab52c781cd78024f2b52"
>> > > +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "88730b1b0d9c5=
252e041ed1fc2375d7292dc45132bcc8b6214490c578de240d3"
>> > > +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "f39a604e1a5a5ba1=
c7342c9d98c9952b5ba252cda4b55cc6ae7bd6fca72f3889"
>> > >
>> > > -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "3d73d16f1b7c4aaf53e6=
d9ac6d04586c60698b0c2c793c55585b0234f75d247d"
>> > > -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "f9b0d7ac6bdd26b6782=
01d068f8777df5fdc7f524602f73eff54c7e8a5844892"
>> > > -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "4ac9958386c4225b1=
4f8e6281dd64a2b00d5db32c5b336fac137c7c729df25a0"
>> > > -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "33bbd45416ce00f2e210=
73ebcef8668575a3955189c85a13172bf5f5750e00ef"
>> > > +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "2a55e97ce512c27a0127=
20bb2a0cd86554c1d734b5cb91b98f58af167cc0fde1"
>> > > +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "1ae0bbe5835d9461a12=
f22d509787e6c11aac8335c677152a57a04f8d22cf755"
>> > > +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6aa2f351bc7dccb54=
4781f4fecddb5ef67e05bb310c84e0106d968231384d9f4"
>> > > +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "3b9a8067e97dd269a27f=
e91be163e046e85b47973f5d512c3368c49d332dacb1"
>> > >
>> > > -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "271e121aa1324d37d2=
bd650217256a792ed387af4b14df0b2757ba22dab50ee5"
>> > > -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "53294b52155bb3205=
70dd125e58b07ee3a0cb35e47a33716b3561d1751ccc538"
>> > > -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "303e3533e72099d=
4f0a1d5c2f31c68ef93b3a3ef8af5d36773eac394f920fb22"
>> > > -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "338299628336aa97e6=
d2f30b5d3c4beaf78038f1e1347a378cbbf80d02a461ea"
>> > > +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "1e2ffcc41a2083be2f=
4733d534d5ee0e05fc2ace1f21033792a4e2497cbbfbe4"
>> > > +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "0bceeb8dc5b48e5ea=
9cff67cdcf8488fe2afe44d7e75ca04669c7c0c2e02a0df"
>> > > +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "af95929af71494e=
e3e6988ead07204ea05b6f2b729cdb1ffcc26db75e47bf318"
>> > > +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "2295d50425ed5dfb02=
8560ac0f9a611212d8deb43791a1d199419043157ab95e"
>> > >
>> > > -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "b58d7e61fb36295e=
bd0a09242e292c7bc4fa24fc189aa285b6e266263f356316"
>> > > -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "5b2b621b79a7635=
d5670bc17d992f6a0bff0e153b6629fdd501a08cf0df7b126"
>> > > -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "117a01afab9d4=
c6e39bc32b57f8a4b9ad8d693869dde0c52fa51a6ec05eaab8b"
>> > > -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "45ba3091f9f17abf=
b01d0c03c87e8de33f0a210aefbdb007905dbf6cfba8590d"
>> > > +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "bec32adad9f2cd16=
50ed24ee82fccf7329c68243cdef7cef1e720ccaea097dab"
>> > > +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "6bb12041b6171e8=
0598c0c04eb7e9bd07ab4fb4d654a9289618e3288a4d2f6c8"
>> > > +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "3b5d53d70837d=
5ec942ec41a8da37ed932bbdc1e53f78dc54e218db458701588"
>> > > +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "3b144840f179114c=
de3078909370bfb6928153d0ae303ac9848622c57cee3578"
>> > >
>> > > -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "fc3fda5412f2b1a53c=
6a3fe6c0a98864d50eac8c63e9b38383085abad6487e3b"
>> > > -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "44745c59092bc449b=
0338ab6788eb0b2a6d5ad382224fe1ba1017931ebb6e6dc"
>> > > -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "e5d0e1e532f4ca4=
656d971c4301e87cbcd571daeffd7830b1d02055f95bdaca6"
>> > > -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "6925c93e4b5b21e37b=
27aed7723cdd6da317eec3f06f86fb0e5be868f58ea052"
>> > > +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "83e28f3e02cce4a9d1=
9841bcb40ec0c8ad4e9af9fb215c39876028e6e9e6baf1"
>> > > +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "fbc978db4be2e6fdb=
1dbcb3ca00ee54c44dafd08930738f1c6aa7ae249685a34"
>> > > +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "2b8af4060acb10f=
347c66a3477ae92151beba12192590ea40723dcf9b1f7f5b2"
>> > > +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "1b952b8cd597060ac0=
7bbe99cea382651ca6eee4ac2abe0a90303ccf2278e60e"
>> > >
>> > > -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "59da021df10c62786d33bc=
6b186a7d1114f788bebcd09f0dd323032fad2f7f5d"
>> > > -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "1a5542ac30cbcfb15512a=
ba2d53b30dd8835058514085067bbcf7c938c05b79e"
>> > > -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "aee53a0a04fb44c95b9=
aa6217c5483113e1f67fa595dea6fdcbbbd72826e729b"
>> > > -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "1f458a0b3b947d78d50c67=
b16bb68e8528cb71d52a7021c3b1652b5f9004c40b"
>> > > +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "5663e6ea018a13f1c87ac7=
4de267829952ea979fbe5f8ee5c1c3531e25d1749c"
>> > > +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "c00bd892e0f29bbc2514f=
87c7521210ced8c175a41eee0a428e19a6ef157779f"
>> > > +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "d70e710a5138871e8d9=
72f195ced9f7aa639ccef23a87fa03cc527d2b9c3cd36"
>> > > +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "ef4b494fb7356b6e88a69b=
71378c04ae0f4a3c264adae84c9d4f3a1314eaa2b4"
>> > >
>> > > -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f8aacf7a101eb10dc000b=
8bf26de90a9d0ce678d02ccf70430ed20dd31ecec6b"
>> > > -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "b15184ba6078dd7976f0=
6239a258313a96de2677b37e4c560779cf7f261c3ee5"
>> > > -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "95aece42a336f237c5=
bac5c5d9aca051b7f0bd3e6a64fb3c5828e6d0d3af2e8c"
>> > > -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "3994971e5923716d54e4b=
574ce238f04c4e20cda03990670f7cc3f87d36e5499"
>> > > +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "07fcadd27b645ad58ff4d=
ae5ef166fd730311bbae8f25f6640fe1bfd2a1f3c3c"
>> > > +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "3fb282ee97626e4f25c4=
f6faac3997859b89f13983dd6fa111e25182dfcb91fa"
>> > > +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "2c914483c0882d44af=
2e50a181cbd2c953d672d50b31aa669ee2346cade1f108"
>> > > +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a04cf42022d0a5faf01c3=
1082bfb1dde9c38409f0ca6da90a3e40faa03e797ae"
>> > >
>> > > -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "c119866af24c91108d34=
267e24886ad90fd8784edfdfd0d36c64013b06974f71"
>> > > +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "9c38f2cd4c19196fcf11=
3166237ab03512bf19ce5a7f13c3bfe0e5cc3317eb44"
>> > >
>> > > -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "7e158a16f73384497=
5e65090b07706596401719bd3f5aca44da9f98fb3c11b04"
>> > > +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "f7c7a73a8e5640f9d=
5aca6b26866b4da08cf3d3509ed1c4184309fb868acbff2"
>> > >
>> > > SRC_URI +=3D " \
>> > >     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust=
-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
>> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recip=
es-devtools/rust/rust-source.inc
>> > > index becaf2b8ac..a7d52d9405 100644
>> > > --- a/meta/recipes-devtools/rust/rust-source.inc
>> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
>> > > @@ -10,7 +10,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/ru=
stc-${RUST_VERSION}-src.tar.xz;n
>> > >             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
>> > >             file://repro-issue-fix-with-cc-crate-hashmap.patch;patch=
dir=3D${RUSTSRC} \
>> > > "
>> > > -SRC_URI[rust.sha256sum] =3D "ab826e84b8d48ec6eda3370065034dea8c006f=
6a946d78a9ba12bcb50e6d3c7a"
>> > > +SRC_URI[rust.sha256sum] =3D "0b9ca1e2e45b8a5f0b58db140af0dc92f8311f=
aeb0ad883c5b71a72c02dc6e80"
>> > >
>> > > RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
>> > >
>> > > diff --git a/meta/recipes-devtools/rust/rust_1.79.0.bb b/meta/recipe=
s-devtools/rust/rust_1.80.0.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/rust/rust_1.79.0.bb
>> > > rename to meta/recipes-devtools/rust/rust_1.80.0.bb
>> > > --
>> > > 2.43.0
>> > >
>> > >
>> > >
>> > >
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204996): https://lists.openembedded.org/g/openembedd=
ed-core/message/204996
>> Mute This Topic: https://lists.openembedded.org/mt/108667337/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

