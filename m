Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2C8C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 18:13:28 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.9.1647281607055726253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 11:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lg6m8OyX;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z3so14248445plg.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TM+UPKK0nrQFA0h0mVnx6aVYMA4flUhA76Q9OVCnDTc=;
        b=Lg6m8OyXxeC3YGWB4NZ98/I6XbqwNRLottPz9v6DXtHZ4QIp5keowYriwvVU2JdhVj
         yolWymOodrB9NHWf4IBjAIAubB+WaijEOn5wV6VGOCMFgrrW2qzrvKUxd8Ldcefm9waH
         XT+3iUhc2kHZ/FnZ1dkKFN7gtSEafjYV0MYKMMNnc5zzbyapdoRqVJlSXJe6hmKkoJFF
         li2Phw/Sxjg70uo95kmftlU3sF/X3MiXYai2W6Ip8FEzPrpXRrkzAbGUAQGKWUpBEBCD
         GYFbFthu63bb0EAB/O48rczHr9cI7WOXv8sAYcjz6vPziWUbdjgYJfGKJmtaQKH4bR3W
         Q+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TM+UPKK0nrQFA0h0mVnx6aVYMA4flUhA76Q9OVCnDTc=;
        b=aPSx6w2Yf4P1rDnL0tQ0uRJbpT05t0djizSeuzEwBtWRyizFUeB/OOcg5o/LtTG7Mj
         uz7hd9yifKZUhESpmoQXnw2ne8yDlnlXc0d3mpkwJc5p3atXGMCYgVNSD4Dbi1tUgUq9
         319OvzWl1KW8tFE+dacgH5MbJtyOvHTo9QpNb3DkfPUVCc2mvAg8+zB9Y2Wg/f6pTWpB
         DO+kh2SLBEmG+zMS9YYw+F/coJeX5CUpCAHXrp3tEIxYwwXKO2D3rbY4uf8fRD3oqRsG
         EvO2K3/NKx5/fRei+RHiEaq+ivLat1GN5p5gHwYZ8aC/s7Vf7ZP4hslkw20zdMDYJO9J
         guLA==
X-Gm-Message-State: AOAM533N/J5kCMKOQ4FNNIiZ/YCZTMQv1ztn188WwiVBdjfruwEqQ1iS
	tjgn17+0y6Ww/1d5LZvb3BV57GbC/U/O/Q==
X-Google-Smtp-Source: 
 ABdhPJyg+5HIK/CQ2ze5BRTMm5i59GkJGCO4VmCG5IWHiDSXsM4IWEea9rrCh43DS3AQuj92Hvbjdg==
X-Received: by 2002:a17:902:e547:b0:151:c5d5:a2c4 with SMTP id
 n7-20020a170902e54700b00151c5d5a2c4mr24637622plf.78.1647281605519;
        Mon, 14 Mar 2022 11:13:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 2-20020a17090a034200b001bfc572d018sm144201pjf.48.2022.03.14.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:13:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libstd-rs: Fix build on riscv64/musl
Date: Mon, 14 Mar 2022 11:13:22 -0700
Message-Id: <20220314181322.1027366-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 18:13:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163163

Backport necessary patch, which was dropped in upgrade to 1.59

Fixes:

error[E0425]: cannot find value `SYS_clone3` in this scope
   --> library/std/src/sys/unix/weak.rs:202:17
    |
202 |                   concat_idents!(SYS_, $name),
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: a constant with a=
 similar name exists: `SYS_clone`
    |
   ::: library/std/src/sys/unix/process/process_unix.rs:165:9
    |
165 | /         raw_syscall! {
166 | |             fn clone3(cl_args: *mut clone_args, len: libc::size_t) =
-> libc::c_long
167 | |         }
    | |_________- in this macro invocation
    |

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...syscalls-to-musl-riscv64-definitions.patch | 44 +++++++++++++++++++
 ...checksums-for-modified-vendored-libc.patch | 23 ++++++++++
 .../recipes-devtools/rust/libstd-rs_1.59.0.bb |  5 +++
 3 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/libstd-rs/0001-Add-400-serie=
s-syscalls-to-musl-riscv64-definitions.patch
 create mode 100644 meta/recipes-devtools/rust/libstd-rs/0001-Update-checks=
ums-for-modified-vendored-libc.patch

diff --git a/meta/recipes-devtools/rust/libstd-rs/0001-Add-400-series-sysca=
lls-to-musl-riscv64-definitions.patch b/meta/recipes-devtools/rust/libstd-r=
s/0001-Add-400-series-syscalls-to-musl-riscv64-definitions.patch
new file mode 100644
index 00000000000..5b330b85a68
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs/0001-Add-400-series-syscalls-to-=
musl-riscv64-definitions.patch
@@ -0,0 +1,44 @@
+From 7b3bc1de0c79a1b410105ce36bbe9f774438d263 Mon Sep 17 00:00:00 2001
+From: Ross Schulman <ross@rbs.io>
+Date: Tue, 1 Feb 2022 09:13:16 -0500
+Subject: [PATCH] Add 400-series syscalls to musl riscv64 definitions
+
+Upstream-Status: Backport [https://github.com/rust-lang/libc/commit/7b3bc1=
de0c79a1b410105ce36bbe9f774438d263]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../linux_like/linux/musl/b64/riscv64/mod.rs  | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/vendor/libc-0.2.108/src/unix/linux_like/linux/musl/b64/riscv6=
4/mod.rs b/vendor/libc-0.2.108/src/unix/linux_like/linux/musl/b64/riscv64/m=
od.rs
+index 6b17621c7..2036583d5 100644
+--- a/vendor/libc-0.2.108/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
++++ b/vendor/libc-0.2.108/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+@@ -465,6 +465,25 @@ pub const SYS_pkey_mprotect: ::c_long =3D 288;
+ pub const SYS_pkey_alloc: ::c_long =3D 289;
+ pub const SYS_pkey_free: ::c_long =3D 290;
+ pub const SYS_statx: ::c_long =3D 291;
++pub const SYS_pidfd_send_signal: ::c_long =3D 424;
++pub const SYS_io_uring_setup: ::c_long =3D 425;
++pub const SYS_io_uring_enter: ::c_long =3D 426;
++pub const SYS_io_uring_register: ::c_long =3D 427;
++pub const SYS_open_tree: ::c_long =3D 428;
++pub const SYS_move_mount: ::c_long =3D 429;
++pub const SYS_fsopen: ::c_long =3D 430;
++pub const SYS_fsconfig: ::c_long =3D 431;
++pub const SYS_fsmount: ::c_long =3D 432;
++pub const SYS_fspick: ::c_long =3D 433;
++pub const SYS_pidfd_open: ::c_long =3D 434;
++pub const SYS_clone3: ::c_long =3D 435;
++pub const SYS_close_range: ::c_long =3D 436;
++pub const SYS_openat2: ::c_long =3D 437;
++pub const SYS_pidfd_getfd: ::c_long =3D 438;
++pub const SYS_faccessat2: ::c_long =3D 439;
++pub const SYS_process_madvise: ::c_long =3D 440;
++pub const SYS_epoll_pwait2: ::c_long =3D 441;
++pub const SYS_mount_setattr: ::c_long =3D 442;
+=20
+ pub const O_APPEND: ::c_int =3D 1024;
+ pub const O_DIRECT: ::c_int =3D 0x4000;
+--=20
+2.35.1
+
diff --git a/meta/recipes-devtools/rust/libstd-rs/0001-Update-checksums-for=
-modified-vendored-libc.patch b/meta/recipes-devtools/rust/libstd-rs/0001-U=
pdate-checksums-for-modified-vendored-libc.patch
new file mode 100644
index 00000000000..33071ccdf14
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs/0001-Update-checksums-for-modifi=
ed-vendored-libc.patch
@@ -0,0 +1,23 @@
+From 7d16c193959f306b50978b415cc3718029c0d8d5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Mar 2022 11:06:39 -0700
+Subject: [PATCH] Update checksums for modified vendored libc
+
+Upstream-Status: Inappropriate [Relevant until backported patch is needed]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ vendor/libc-0.2.108/.cargo-checksum.json | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vendor/libc-0.2.108/.cargo-checksum.json b/vendor/libc-0.2.10=
8/.cargo-checksum.json
+index 6b976e48a..a6906588e 100644
+--- a/vendor/libc-0.2.108/.cargo-checksum.json
++++ b/vendor/libc-0.2.108/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"b9b717fb9711be557a118b14d96536014cfa6a8=
e877ca7efc50d8c2a0bab3e50","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"0a4edcc040533d370=
a2a736f2e218516182471e8b0d9ed5dc2a6c08d5d852a83","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"adc4f6af60e57ea=
dc01042ec4312bd592fa3002850b8c70740bfd95ddd2d77fb","src/macros.rs":"148cf62=
f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"8cdae0cc37c43dabd4253a534e700bec6b6a57293c0c8e36c9ce16675=
d16799a","src/solid/arm.rs":"852b58a0837fde089cb9b5af131bf653daeb8c726f7540=
032756db8b7d4f8149","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
52d40885a0024fbe43676fe54d14b","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"f0c321=
265dd7671f16106b84951ac7dd77ed2e65c6623cbf2d29e76531984770","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"490002f64087a48628aa8c5cf74460df0d45ea743c00fee920f2db4adc78688f"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"6c70759e7fc945e8eedf2657ff58b1f1ce76bf1357b3d4b94b60852b8dc43bd9",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"8c45b3c623512b996f116e96a5041fa8d6018f737bd5eea6c93e986e=
d4c46ecf","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"684f692968eb1f285d69daec15837257088408bdb01=
6f6130b6c0bbfcd867c72","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"e7102c14ffa535958751785b26d5320f5ceb7e568ecedad8a6aefa2f7d=
95463a","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"f33c5b22f11d15effdcb8a9723c8f56164b630a1d4a4bc387ac6e413e623a4e4","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"c075711f7b9f06fe48ac222c8472c2cb2f5818b64cf523dc675efa2861823510","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272=
320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_6=
4/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde=
70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99=
e7d9cbee4cf088d3dd47995110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.=
rs":"d0569c1a6261fb39ad80bae3b55ffc2900a6d80ee52d28276ba58048ccb8d3d8","src=
/unix/bsd/mod.rs":"2fed08973739d7f6a7412b204724af64b1a915c712689c250cf9a082=
63ba05ff","src/unix/bsd/netbsdlike/mod.rs":"07b97b75fa72215b54c9869f50eee31=
67ea835fd674cf3fa036bdbd6904c563b","src/unix/bsd/netbsdlike/netbsd/aarch64.=
rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src=
/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c469=
0db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"ddbdc8=
526a0267ffeb0ab9bb5f01ebb38a14cf759c025b5c0b0ff1178fec889b","src/unix/bsd/n=
etbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489f=
a641465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e=
4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netb=
sdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f=
98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cd=
d68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/o=
penbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb29=
1e1ba36af","src/unix/bsd/netbsdlike/openbsd/mod.rs":"52f1487bea76ecc82c6f78=
1081b4bedd7a8a986e18872d2ebcd09c7b6db4a890","src/unix/bsd/netbsdlike/openbs=
d/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f=
4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd=
86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86=
_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1",=
"src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed9=
5dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa263=
53f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"aadfb394c0025b5fa7=
247ca9d5933edd121efa9b27f5c6a32c91c38cc60fa255","src/unix/haiku/native.rs":=
"44855f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/uni=
x/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789=
f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae=
10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd=
4b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs=
":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/u=
nix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5=
e00150063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b9=
8530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux=
_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4=
cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388b=
d3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linu=
x_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2f=
af6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/mod.r=
s":"8fe667d2b14abc5ac8aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/=
unix/linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaab=
b6b2d45705225d3ece1c5cce37","src/unix/linux_like/android/b64/x86_64/align.r=
s":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/=
unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52=
b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/android/mod.rs":"75=
5db99ecd7598eee9c0c21656cda3e63ae2c4c952f8285b3d7095d983ee4631","src/unix/l=
inux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2c=
b86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.rs":"b71d3710675=
0f57bc2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/unix/linux_like=
/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544=
a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e70ebed2703e14a9c=
f17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/ar=
ch/generic/mod.rs":"52706a1e232f0b3d4ef1c064306eb4ae312535a16635c982c2fa6d9=
aa957d4cd","src/unix/linux_like/linux/arch/mips/mod.rs":"2c1fbabc54efc5fb3e=
7ae218d0b0084281b67eceec0c62e5978e20aea8c512ef","src/unix/linux_like/linux/=
arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec5=
93a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"96f702ef5b0bae40ce3bf=
ff58ec99fe8291b37de139890c011147f0ebc906771","src/unix/linux_like/linux/arc=
h/sparc/mod.rs":"66c0d9590cdc88920860ac8539a59846ad83d34a207c8350fa00a027ed=
2e82c8","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32=
/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25=
f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"bc2272a2e7cbc160baa4=
54c8203932d6c5f59a32c2bf3a0e0cf37057f25484cb","src/unix/linux_like/linux/gn=
u/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd58=
7472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"46a72f8be5fc8=
260a002996ad30b55a0f1df33ca20bff808427c449425cbc4a5","src/unix/linux_like/l=
inux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4=
b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"c21dd4f8bedf34=
1c8ea799f923a8dd55b9b907acfc1da717755c37f5e71cd4bb","src/unix/linux_like/li=
nux/gnu/b32/riscv32/mod.rs":"9ace9d12271e83967f76fdc6b6670027528f2382e17912=
a7299c357e196262bc","src/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21a=
dbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/li=
nux_like/linux/gnu/b32/sparc/mod.rs":"8afb0bcd6d947fb50dcd81e1c0f89242ce236=
5233d5165627c9dcb996ce66a0a","src/unix/linux_like/linux/gnu/b32/x86/align.r=
s":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/=
unix/linux_like/linux/gnu/b32/x86/mod.rs":"0fbf5120805535aca7dd4e06c1143934=
1d8f528ae95b9b93140b984e0b246251","src/unix/linux_like/linux/gnu/b64/aarch6=
4/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c=
7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4=
371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/linux_like/linux=
/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7b=
f830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"3587b=
384a42ac52df67471ba9a56f4624872a7ff3338ec152118acf501647677","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"8871eeff3a338b8f06a775e1735b637174bc2c0923d581ad88867428693a4cfa","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea3=
6af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"7533175c322e22caf=
b932364c9b310658d08d1ac6e2cea03e42f551eff955999","src/unix/linux_like/linux=
/gnu/b64/riscv64/mod.rs":"aa9368dc335306d43dc05628c4419ed1e15244060f182cfa2=
4d3c34e7d25cd90","src/unix/linux_like/linux/gnu/b64/s390x.rs":"0c1725854b81=
46a191df36e83931bf591a31334f2d72dc6867d143d44b8a53b6","src/unix/linux_like/=
linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc=
1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":=
"37d7cf814319678512547b0f122cf84c9fc4cdad83e9ebbf0dee2c2baa10d9a1","src/uni=
x/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_=
64/mod.rs":"580ef4c16a36a15e51407faa8e3875430394887d006d16cc93a4b3e67e268ad=
1","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63=
053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/linux_like/linux=
/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681=
926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"d5442593aab9becf1a9=
55f8c6fb2aa1a3133730fac4b7f85263cdd0d0a641d61","src/unix/linux_like/linux/g=
nu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c866=
53db25","src/unix/linux_like/linux/mod.rs":"2a26a908b0426923fa32010dd143c4f=
f0a9f7c2e6675ffe3b84fd545d43cf469","src/unix/linux_like/linux/musl/b32/arm/=
align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c=
","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"da189402060f8a777126b818=
a6011041e09f3b4b40952ac82cbc6268a7f30193","src/unix/linux_like/linux/musl/b=
32/hexagon.rs":"bfeb3121229d8f1bc6ba519bf35f7f64a8c45a1f285b25ad18cfaab7845=
164d8","src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143=
602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linu=
x/musl/b32/mips/mod.rs":"e23a8784925f1f7d9d504bb2db3efc483fba7cd854cd743747=
d9ad3bbb9ac287","src/unix/linux_like/linux/musl/b32/mod.rs":"8ede3985e62438=
82814ce91e8ce543e7edbafc0cee5932816072b6f14207a671","src/unix/linux_like/li=
nux/musl/b32/powerpc.rs":"14d18bf690bc41b73823152376b4e73a11e57638e0b359e6c=
b84f3fdd39c5605","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fb=
d7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_=
like/linux/musl/b32/x86/mod.rs":"3223e0d87b94c865f97a47a3e47dadd3a2beebbf06=
b11825475bc26cee8fefd4","src/unix/linux_like/linux/musl/b64/aarch64/align.r=
s":"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/=
unix/linux_like/linux/musl/b64/aarch64/mod.rs":"6b9c1a3474b8fa23ca14eec9b5a=
bb0cbc85b62076055ad0173c46005d77f9a0b","src/unix/linux_like/linux/musl/b64/=
mips64.rs":"5ff053e8f489f9672244b3b67117a7c64d01df0c68964fcb87104b294c68c79=
0","src/unix/linux_like/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a93=
8cdccf40d985dafc11e90f235947735a09bac","src/unix/linux_like/linux/musl/b64/=
powerpc64.rs":"5386ab54bacc199c5d4e1bc07592b151bb61fb86eb4eee2d15d7a351672b=
ed13","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"c9c9f68ca13a2fd0=
e1a7176d1e6bb4eb99a848332685a297fab0c071c847863b","src/unix/linux_like/linu=
x/musl/b64/s390x.rs":"20149a2b8c3739be7be7903ce361cf2f8d3f7bb464f782990fccc=
b38665f347d","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"7169d07a=
9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_l=
ike/linux/musl/b64/x86_64/mod.rs":"3789856e0f550fbd847db0dcc9402f870567efad=
dd6c1c1355d2f4382dc5e228","src/unix/linux_like/linux/musl/mod.rs":"3a949d40=
9efb3dbd77a3732a8fd95269ae0a9ee764efc12243903e16c1e1c2d7","src/unix/linux_l=
ike/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98=
950caafa3507b","src/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb=
911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/l=
inux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d4=
4014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a=
57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/=
linux/uclibc/arm/mod.rs":"1e3bf809508b5872949136859bf48ddf58b7d24ae9f0b663e=
79f0efd1aaeb6a6","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223=
135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux=
_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc7064=
6edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mip=
s32/mod.rs":"fa4102d9a596d90de604ce2962b0e64f184dfbf10552a4c3ecf28f12d47043=
79","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de=
75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like=
/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f541=
2adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/m=
od.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a487fcd","=
src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c852=
29599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linu=
x/uclibc/mips/mod.rs":"a2877679fef0f14f54a89ccbc41fb02f0c25bf6e536f9eb2cb2f=
a437e1d3f739","src/unix/linux_like/linux/uclibc/mod.rs":"abb9a1a905a7d992ed=
290557e3619627d9f3a1ccf3a6d4ba9506b936fc56fa04","src/unix/linux_like/linux/=
uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d=
59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e8=
52dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/=
linux/uclibc/x86_64/mod.rs":"66e8f5b7509a6e638b8b904906f89badbab0da8fb5b602=
d07ebd88649c4b961a","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c=
3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/li=
nux_like/mod.rs":"ffce98bdd208fd9d335c65feafbf0d9742bea67c7eec1ee48657f2921=
32ec3f0","src/unix/mod.rs":"b72f18e053cca0ade0f0606f1848a773fcf1885c72cbb31=
889275e8195f060bd","src/unix/newlib/aarch64/mod.rs":"bb269c1468a96764425546=
00e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.rs":"28a=
af87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/ne=
wlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc8020b395=
91af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102da74dc51=
ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"d7271c13748be083=
05d36f9af6f41f6950a7a1d6d4382149194a35d5fe2090de","src/unix/newlib/no_align=
.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","sr=
c/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5=
af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954=
eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"cc4794afa4fbe=
d9d6612894ea476228f9d8533950162d6416fc4d16073e1dac4","src/unix/solarish/com=
pat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c",=
"src/unix/solarish/illumos.rs":"7d8f47fd37880715b449723688aaee568785325a46f=
1c360a05bdca13252278e","src/unix/solarish/mod.rs":"c7376a8b0cd093bf67157fac=
19065b114aeae271fbaf0b7a9cc27c369a915196","src/unix/solarish/solaris.rs":"6=
5b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/=
solarish/x86_64.rs":"9d761573bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069=
611f495085","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed673758549=
0a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d9=
8f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"aea3da66f21=
40f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc=
.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","sr=
c/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d494=
1d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841=
252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff=
9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"0935c061e947e33=
89b77a3597ab2ce289d913132f9ea2727a2c98732fade7691","src/windows/gnu/align.r=
s":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/=
windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4=
e38375767a","src/windows/mod.rs":"e3ad95ba54f76e74c301611fe868d3d94f6b8939b=
03be672f568b06b10ae71c7","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf4=
4bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","tests/const_fn.rs":"cb75a1f0864=
f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"8521a1b5=
7e76b1ec69af7599e75e38e7b7fad6610f037db8c79b127201b5d119"}
+\ No newline at end of file
++{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"b9b717fb9711be557a118b14d96536014cfa6a8=
e877ca7efc50d8c2a0bab3e50","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"0a4edcc040533d370=
a2a736f2e218516182471e8b0d9ed5dc2a6c08d5d852a83","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"adc4f6af60e57ea=
dc01042ec4312bd592fa3002850b8c70740bfd95ddd2d77fb","src/macros.rs":"148cf62=
f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"8cdae0cc37c43dabd4253a534e700bec6b6a57293c0c8e36c9ce16675=
d16799a","src/solid/arm.rs":"852b58a0837fde089cb9b5af131bf653daeb8c726f7540=
032756db8b7d4f8149","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
52d40885a0024fbe43676fe54d14b","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"f0c321=
265dd7671f16106b84951ac7dd77ed2e65c6623cbf2d29e76531984770","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"490002f64087a48628aa8c5cf74460df0d45ea743c00fee920f2db4adc78688f"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"6c70759e7fc945e8eedf2657ff58b1f1ce76bf1357b3d4b94b60852b8dc43bd9",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"8c45b3c623512b996f116e96a5041fa8d6018f737bd5eea6c93e986e=
d4c46ecf","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"684f692968eb1f285d69daec15837257088408bdb01=
6f6130b6c0bbfcd867c72","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"e7102c14ffa535958751785b26d5320f5ceb7e568ecedad8a6aefa2f7d=
95463a","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"f33c5b22f11d15effdcb8a9723c8f56164b630a1d4a4bc387ac6e413e623a4e4","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"c075711f7b9f06fe48ac222c8472c2cb2f5818b64cf523dc675efa2861823510","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272=
320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_6=
4/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde=
70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99=
e7d9cbee4cf088d3dd47995110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.=
rs":"d0569c1a6261fb39ad80bae3b55ffc2900a6d80ee52d28276ba58048ccb8d3d8","src=
/unix/bsd/mod.rs":"2fed08973739d7f6a7412b204724af64b1a915c712689c250cf9a082=
63ba05ff","src/unix/bsd/netbsdlike/mod.rs":"07b97b75fa72215b54c9869f50eee31=
67ea835fd674cf3fa036bdbd6904c563b","src/unix/bsd/netbsdlike/netbsd/aarch64.=
rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src=
/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c469=
0db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"ddbdc8=
526a0267ffeb0ab9bb5f01ebb38a14cf759c025b5c0b0ff1178fec889b","src/unix/bsd/n=
etbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489f=
a641465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e=
4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netb=
sdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f=
98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cd=
d68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/o=
penbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb29=
1e1ba36af","src/unix/bsd/netbsdlike/openbsd/mod.rs":"52f1487bea76ecc82c6f78=
1081b4bedd7a8a986e18872d2ebcd09c7b6db4a890","src/unix/bsd/netbsdlike/openbs=
d/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f=
4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd=
86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86=
_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1",=
"src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed9=
5dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa263=
53f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"aadfb394c0025b5fa7=
247ca9d5933edd121efa9b27f5c6a32c91c38cc60fa255","src/unix/haiku/native.rs":=
"44855f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/uni=
x/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789=
f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae=
10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd=
4b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs=
":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/u=
nix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5=
e00150063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b9=
8530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux=
_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4=
cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388b=
d3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linu=
x_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2f=
af6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/mod.r=
s":"8fe667d2b14abc5ac8aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/=
unix/linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaab=
b6b2d45705225d3ece1c5cce37","src/unix/linux_like/android/b64/x86_64/align.r=
s":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/=
unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52=
b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/android/mod.rs":"75=
5db99ecd7598eee9c0c21656cda3e63ae2c4c952f8285b3d7095d983ee4631","src/unix/l=
inux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2c=
b86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.rs":"b71d3710675=
0f57bc2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/unix/linux_like=
/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544=
a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e70ebed2703e14a9c=
f17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/ar=
ch/generic/mod.rs":"52706a1e232f0b3d4ef1c064306eb4ae312535a16635c982c2fa6d9=
aa957d4cd","src/unix/linux_like/linux/arch/mips/mod.rs":"2c1fbabc54efc5fb3e=
7ae218d0b0084281b67eceec0c62e5978e20aea8c512ef","src/unix/linux_like/linux/=
arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec5=
93a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"96f702ef5b0bae40ce3bf=
ff58ec99fe8291b37de139890c011147f0ebc906771","src/unix/linux_like/linux/arc=
h/sparc/mod.rs":"66c0d9590cdc88920860ac8539a59846ad83d34a207c8350fa00a027ed=
2e82c8","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32=
/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25=
f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"bc2272a2e7cbc160baa4=
54c8203932d6c5f59a32c2bf3a0e0cf37057f25484cb","src/unix/linux_like/linux/gn=
u/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd58=
7472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"46a72f8be5fc8=
260a002996ad30b55a0f1df33ca20bff808427c449425cbc4a5","src/unix/linux_like/l=
inux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4=
b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"c21dd4f8bedf34=
1c8ea799f923a8dd55b9b907acfc1da717755c37f5e71cd4bb","src/unix/linux_like/li=
nux/gnu/b32/riscv32/mod.rs":"9ace9d12271e83967f76fdc6b6670027528f2382e17912=
a7299c357e196262bc","src/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21a=
dbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/li=
nux_like/linux/gnu/b32/sparc/mod.rs":"8afb0bcd6d947fb50dcd81e1c0f89242ce236=
5233d5165627c9dcb996ce66a0a","src/unix/linux_like/linux/gnu/b32/x86/align.r=
s":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/=
unix/linux_like/linux/gnu/b32/x86/mod.rs":"0fbf5120805535aca7dd4e06c1143934=
1d8f528ae95b9b93140b984e0b246251","src/unix/linux_like/linux/gnu/b64/aarch6=
4/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c=
7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4=
371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/linux_like/linux=
/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7b=
f830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"3587b=
384a42ac52df67471ba9a56f4624872a7ff3338ec152118acf501647677","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"8871eeff3a338b8f06a775e1735b637174bc2c0923d581ad88867428693a4cfa","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea3=
6af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"7533175c322e22caf=
b932364c9b310658d08d1ac6e2cea03e42f551eff955999","src/unix/linux_like/linux=
/gnu/b64/riscv64/mod.rs":"aa9368dc335306d43dc05628c4419ed1e15244060f182cfa2=
4d3c34e7d25cd90","src/unix/linux_like/linux/gnu/b64/s390x.rs":"0c1725854b81=
46a191df36e83931bf591a31334f2d72dc6867d143d44b8a53b6","src/unix/linux_like/=
linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc=
1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":=
"37d7cf814319678512547b0f122cf84c9fc4cdad83e9ebbf0dee2c2baa10d9a1","src/uni=
x/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_=
64/mod.rs":"580ef4c16a36a15e51407faa8e3875430394887d006d16cc93a4b3e67e268ad=
1","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63=
053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/linux_like/linux=
/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681=
926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"d5442593aab9becf1a9=
55f8c6fb2aa1a3133730fac4b7f85263cdd0d0a641d61","src/unix/linux_like/linux/g=
nu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c866=
53db25","src/unix/linux_like/linux/mod.rs":"2a26a908b0426923fa32010dd143c4f=
f0a9f7c2e6675ffe3b84fd545d43cf469","src/unix/linux_like/linux/musl/b32/arm/=
align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c=
","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"da189402060f8a777126b818=
a6011041e09f3b4b40952ac82cbc6268a7f30193","src/unix/linux_like/linux/musl/b=
32/hexagon.rs":"bfeb3121229d8f1bc6ba519bf35f7f64a8c45a1f285b25ad18cfaab7845=
164d8","src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143=
602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linu=
x/musl/b32/mips/mod.rs":"e23a8784925f1f7d9d504bb2db3efc483fba7cd854cd743747=
d9ad3bbb9ac287","src/unix/linux_like/linux/musl/b32/mod.rs":"8ede3985e62438=
82814ce91e8ce543e7edbafc0cee5932816072b6f14207a671","src/unix/linux_like/li=
nux/musl/b32/powerpc.rs":"14d18bf690bc41b73823152376b4e73a11e57638e0b359e6c=
b84f3fdd39c5605","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fb=
d7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_=
like/linux/musl/b32/x86/mod.rs":"3223e0d87b94c865f97a47a3e47dadd3a2beebbf06=
b11825475bc26cee8fefd4","src/unix/linux_like/linux/musl/b64/aarch64/align.r=
s":"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/=
unix/linux_like/linux/musl/b64/aarch64/mod.rs":"6b9c1a3474b8fa23ca14eec9b5a=
bb0cbc85b62076055ad0173c46005d77f9a0b","src/unix/linux_like/linux/musl/b64/=
mips64.rs":"5ff053e8f489f9672244b3b67117a7c64d01df0c68964fcb87104b294c68c79=
0","src/unix/linux_like/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a93=
8cdccf40d985dafc11e90f235947735a09bac","src/unix/linux_like/linux/musl/b64/=
powerpc64.rs":"5386ab54bacc199c5d4e1bc07592b151bb61fb86eb4eee2d15d7a351672b=
ed13","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"b46633c76eeaffa6=
19e7008b91fbfbcfccac0d75c20c9df3bf2a0078a64fa4b0","src/unix/linux_like/linu=
x/musl/b64/s390x.rs":"20149a2b8c3739be7be7903ce361cf2f8d3f7bb464f782990fccc=
b38665f347d","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"7169d07a=
9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_l=
ike/linux/musl/b64/x86_64/mod.rs":"3789856e0f550fbd847db0dcc9402f870567efad=
dd6c1c1355d2f4382dc5e228","src/unix/linux_like/linux/musl/mod.rs":"3a949d40=
9efb3dbd77a3732a8fd95269ae0a9ee764efc12243903e16c1e1c2d7","src/unix/linux_l=
ike/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98=
950caafa3507b","src/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb=
911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/l=
inux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d4=
4014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a=
57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/=
linux/uclibc/arm/mod.rs":"1e3bf809508b5872949136859bf48ddf58b7d24ae9f0b663e=
79f0efd1aaeb6a6","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223=
135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux=
_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc7064=
6edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mip=
s32/mod.rs":"fa4102d9a596d90de604ce2962b0e64f184dfbf10552a4c3ecf28f12d47043=
79","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de=
75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like=
/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f541=
2adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/m=
od.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a487fcd","=
src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c852=
29599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linu=
x/uclibc/mips/mod.rs":"a2877679fef0f14f54a89ccbc41fb02f0c25bf6e536f9eb2cb2f=
a437e1d3f739","src/unix/linux_like/linux/uclibc/mod.rs":"abb9a1a905a7d992ed=
290557e3619627d9f3a1ccf3a6d4ba9506b936fc56fa04","src/unix/linux_like/linux/=
uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d=
59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e8=
52dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/=
linux/uclibc/x86_64/mod.rs":"66e8f5b7509a6e638b8b904906f89badbab0da8fb5b602=
d07ebd88649c4b961a","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c=
3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/li=
nux_like/mod.rs":"ffce98bdd208fd9d335c65feafbf0d9742bea67c7eec1ee48657f2921=
32ec3f0","src/unix/mod.rs":"b72f18e053cca0ade0f0606f1848a773fcf1885c72cbb31=
889275e8195f060bd","src/unix/newlib/aarch64/mod.rs":"bb269c1468a96764425546=
00e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.rs":"28a=
af87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/ne=
wlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc8020b395=
91af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102da74dc51=
ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"d7271c13748be083=
05d36f9af6f41f6950a7a1d6d4382149194a35d5fe2090de","src/unix/newlib/no_align=
.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","sr=
c/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5=
af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954=
eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"cc4794afa4fbe=
d9d6612894ea476228f9d8533950162d6416fc4d16073e1dac4","src/unix/solarish/com=
pat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c",=
"src/unix/solarish/illumos.rs":"7d8f47fd37880715b449723688aaee568785325a46f=
1c360a05bdca13252278e","src/unix/solarish/mod.rs":"c7376a8b0cd093bf67157fac=
19065b114aeae271fbaf0b7a9cc27c369a915196","src/unix/solarish/solaris.rs":"6=
5b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/=
solarish/x86_64.rs":"9d761573bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069=
611f495085","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed673758549=
0a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d9=
8f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"aea3da66f21=
40f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc=
.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","sr=
c/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d494=
1d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841=
252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff=
9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"0935c061e947e33=
89b77a3597ab2ce289d913132f9ea2727a2c98732fade7691","src/windows/gnu/align.r=
s":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/=
windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4=
e38375767a","src/windows/mod.rs":"e3ad95ba54f76e74c301611fe868d3d94f6b8939b=
03be672f568b06b10ae71c7","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf4=
4bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","tests/const_fn.rs":"cb75a1f0864=
f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"8521a1b5=
7e76b1ec69af7599e75e38e7b7fad6610f037db8c79b127201b5d119"}
+--=20
+2.35.1
+
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.59.0.bb
index d4721029e88..7c453a593a5 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb
@@ -1,5 +1,10 @@
 require rust-source.inc
 require libstd-rs.inc
=20
+# Check if libc crate is >=3D 0.2.17 before dropping this patch
+SRC_URI +=3D " \
+    file://0001-Add-400-series-syscalls-to-musl-riscv64-definitions.patch;=
patchdir=3D../../ \
+    file://0001-Update-checksums-for-modified-vendored-libc.patch;patchdir=
=3D../../ \
+"
 # libstd moved from src/libstd to library/std in 1.47+
 S =3D "${RUSTSRC}/library/std"
--=20
2.35.1


