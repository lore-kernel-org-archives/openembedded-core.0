Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7FEC3A59D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 20:51:33 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.2973.1666385485736972412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 13:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUpmJN1n;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id fw14so3416704pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IZv3iipX3VADFgIXgg9ht9XO+zuAZ4UUT7fIki3BWM=;
        b=DUpmJN1njgeMDTKdD0ZMlDCpKH90bpjQ5fuUOME+FiBiZPIS0GFGBb2VRnGPXLKn68
         MXTdunXAwzKVV18XC6nyLMr4/OfJdLRGtnCZNKdXUx+1PYPoYxc0drpE+q3fBJpTVvCZ
         3aV8FDZU2b8Hbo1Z1dQZrd4R+jb8iDkVZelF2kcGm9MG8I5nf4DXvytBywei4tQGzqoY
         qXGWMYvgpg5FylVF3i11Z6LuWtHM6mAy8P64c+kpAk+mctk0nj/hamb5UlLXHd9BcpDR
         wKbJw4rdwzfGTnORtg0VhvIcxZdLCGLqDh5xL1NC5JUI9GJ8r/FlU8KUp3kJ8uoA+ws4
         12rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IZv3iipX3VADFgIXgg9ht9XO+zuAZ4UUT7fIki3BWM=;
        b=eBW55JfuUfSIhtr3rRNW2ZHjWe54Uh/vhs95VnK508XsPNFXMzmp1tQGVj4590z/0i
         +dOljF/Mzw9INEYzMe6+/c34ZF7ppuh5mdWGAjJZSAV2tzUEiM0M9kbwt/heapOP2jRL
         918Mos7G3u7ueBCddH/FRWpraIfTXHRSOprW/jGdZfKu6N+9vuEHPDk7phPom4svoReK
         sAPlfrBpWDOr89qizmuVYRPMqZFV50lZ2BCqSHbvwSbE+grfvtmMfV9mnEGPikTIJ/iR
         4FAus1vvOPfF2m2btp83wDz+kMjFBgt0A4vnG94Cd3jE/ZC9wBqlOhHddJtdJcdIAGWN
         8XGg==
X-Gm-Message-State: ACrzQf2npxHbTBlm4AHxfG6N5CtOPp64oSW6+QMeLOYLm+RoCc8pZ8fG
	cbo3TAHjpHu/wFnDOU7rUHi0n2hF9zY=
X-Google-Smtp-Source: AMsMyM5/SS9ysG8b2l3zKG5e5ODCpPHCJuVVlyyGR4c7nuWnpSNTWdAaX6u+mAuLbw94XGqHAlV2Fg==
X-Received: by 2002:a17:902:7596:b0:186:603e:9cb8 with SMTP id j22-20020a170902759600b00186603e9cb8mr11050029pll.155.1666385484815;
        Fri, 21 Oct 2022 13:51:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id s21-20020a056a00195500b00562ef28aac6sm15798604pfk.185.2022.10.21.13.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 13:51:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] rust: Disable 64bit atomics on crossbeam on riscv32
Date: Fri, 21 Oct 2022 13:51:21 -0700
Message-Id: <20221021205121.1995225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 20:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172044

Update the arch part of tuple to consider OE's names
for riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
- Add riscv32-* to known arches for crossbeam-utils
- Keep the patch for both crossbeam versions

 .../rust/rust/crossbeam_atomic.patch          | 26 ++++++++++++-------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/meta/=
recipes-devtools/rust/rust/crossbeam_atomic.patch
index 2f3f985243..067918c048 100644
--- a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
+++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
@@ -48,19 +48,14 @@ Index: rustc-1.64.0-src/vendor/crossbeam-utils/.cargo-c=
hecksum.json
 \ No newline at end of file
 +{"files":{"CHANGELOG.md":"c2cdac68fbf3795e9c3cb0bbeace5f87736d0745fefbd3d=
b9c07f568dc70d1d1","Cargo.toml":"fc5b0f0f821aa944d4341dc97e7c3b4d4bf658483b=
a359b5bf2e53d8ad945ac9","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"d98=
3d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atomic.r=
s":"916ed15218bb7b75a4e0d432430e7134efd27ca43ca8a8766e0c90e89febb602","src/=
atomic/atomic_cell.rs":"f1b407b62b981de47968236eabb932384722c4dd7b7f08f52c5=
9943aefd0b113","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"78433f55ee3defeea348d65abc78e03d63d6a304e09c568b27b403e9ad205771=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"21cf9b3e965529e5c0a6ff8fc1ec846bfe0006c=
41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869c922a1cbf929c3b7=
41bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6a16c865a5aced621=
6d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"7d82ee10ce34d7bc12c2122495e759=
3a9c41347ecdd64185af4ecf72cb1a7f83"}
 \ No newline at end of file
-Index: rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.64.0-src.orig/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
-+++ rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
+--- a/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
++++ b/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
 @@ -1 +1 @@
 -{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"7e7=
4dc72343ff57e83d0a84a9fbdd9ff1645894165909999b4c3d2fba94bc96c","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
 \ No newline at end of file
-+{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"d98=
3d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
-\ No newline at end of file
-Index: rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/build.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.64.0-src.orig/vendor/crossbeam-utils-0.8.8/build.rs
-+++ rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/build.rs
++{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"d98=
3d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atomic.r=
s":"9d84c99f84a203a2bfc9dec8be56d58d7e4a85204986304f75f46e61ae6835df","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
+--- a/vendor/crossbeam-utils-0.8.8/build.rs
++++ b/vendor/crossbeam-utils-0.8.8/build.rs
 @@ -29,7 +29,7 @@ use std::env;
  include!("no_atomic.rs");
=20=20
@@ -79,3 +74,14 @@ Index: rustc-1.64.0-src/vendor/crossbeam-utils-0.8.8/bui=
ld.rs
=20=20
      // Note that this is `no_*`, not `has_*`. This allows treating
      // `cfg(target_has_atomic =3D "ptr")` as true when the build script d=
oesn't
+--- a/vendor/crossbeam-utils-0.8.8/no_atomic.rs
++++ b/vendor/crossbeam-utils-0.8.8/no_atomic.rs
+@@ -49,6 +49,8 @@ const NO_ATOMIC_64: &[&str] =3D &[
+     "powerpc-wrs-vxworks-spe",
+     "riscv32gc-unknown-linux-gnu",
+     "riscv32gc-unknown-linux-musl",
++    "riscv32-unknown-linux-gnu",
++    "riscv32-unknown-linux-musl",
+     "riscv32i-unknown-none-elf",
+     "riscv32im-unknown-none-elf",
+     "riscv32imac-unknown-none-elf",
--=20
2.38.1


