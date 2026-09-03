Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD73C61DD6
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 01:08:39 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10332.1788397717257997257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 18:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gKjJnRgz;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-866e57f63a3so23187237b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 18:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788397716; cv=none;
        d=google.com; s=arc-20260327;
        b=pE0kcpS5aa0D+ZH7tlh8Yh5oDRY33VZcDfNUR+onAVFg/nR5yYOSXL6q96XgkOA751
         EmLLJZGu1l2+YH5Ct6lHi/KfHrakPKtX69s6sc1AOEu6k7JqnSKTAuZiyUQg8GlSv4Uu
         0OUuTV7rlGI0XdyokuMYc7hMTP6wiaY73ATOEJNZhjq5Q3KxXxQzUQvE1EWsu4zxTl5P
         fFc1NEXt0cH3zbyuPARrwkynyRmA+1A0LUvDStHAGiGC06vL+zxMhaHYoWrOT+C90twP
         9hOK1QbOSySGflxw7V6N3EvzRlCoYi3z2pp+m76RCEb6RzUaztkHXzgLhwe1eamOlN2H
         PD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8ZuemwCMiXyuPQXipS7rAjxQKUJ7nyE/iixgzpnEMsE=;
        fh=aFV7J8ngdfO0qf/7Exvg31KDr2OGL+G2lw9KMbsH+8g=;
        b=jWd4vL+Enmg1kg6nnmPaamkWXE1zkCXZFsJK59Vz2TNJ1CdagBbsrr9SCwr6K2h3op
         h7kHk3CC4w7uGQi6pUl3kTgSuxZvRF63E3XtFcNrlQgP+TvAge01DkVgWNQ5K38vxkYT
         q4CNty/hUwGAZ8YmoXRGbT093X0cqLEJNpEINLJgfxOkzE+0lyIDiNXYuTH9aQlkvCac
         jGysIkdBZnLVYp0SBYXrSeEd6eBTfVTYJHn4X+oDr+/rS6lFlViDEEVGC9KKZJHjeXMH
         qt6D/iub1GQr7UJ+Osx8VSyBl5+w19bYuLxR0hTF8hlgLKuMboHdmpqJOiAFKqfAbsBY
         BPOw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788397716; x=1789002516; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZuemwCMiXyuPQXipS7rAjxQKUJ7nyE/iixgzpnEMsE=;
        b=gKjJnRgzLaNdyih3F3QVExjbEdvRrT2ZEHduCU5fFE5MiTb1UTeu56u6mywP1JMCSR
         EKSm2PI3ujOrGbkZ2mL3Uithw2MNmxJ/3UdrC88adGYO5FLQECHTCAQui7rF30u2xSEA
         RloLkxVvP1zlYKx5ypPOUej8Y8hhK2HjZ2keVvbdRz8m/hGP0H+GG2bOlh1GfKb4QUzt
         I3upK6XtavrYoo781jtDO5lc4u4YE39NUheU1uqK1vbH9JttzUn65q5tGzRBkJ764yAA
         MPQnWMSuOnCuCfKnOjO1tP7OzmQgRZG6u+wBkS71wHGkgbPijNmyJI2cHxqJtE3Vvpu/
         zXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788397716; x=1789002516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ZuemwCMiXyuPQXipS7rAjxQKUJ7nyE/iixgzpnEMsE=;
        b=BrpuEvdyU0/QB+7Xx8l8l63MtU+RkT13TlE0uctt7FgMGPloRtTrj1OcqpLqh7p4at
         aLBczsHxtCSdCZ+Y6IzMQZ29C9xkp55YxEe23l1CGoNjDan0bKrIvSIozwfmmMP55wFy
         dfQMIQ1qMT7hr0sDPXmSsTfjkLF75HKl3EbJ7j3naC97aujOyMXrWz7tzFudBXGlJBom
         +hOVtpXM01Lgd2Xonuko41lpDcBRkpqKVUZXTP/0LDtwee13zDpfgIq8We+m3XH9yD+h
         zsAgSvasl9DIUt1MEbinL7QT67+sQ7HHuYvAXvOjNlU8BtodmnfU7TUmtKDD41NOXARw
         aYrA==
X-Gm-Message-State: AFuF++lb9TWov69ldDvryqLNQY2sEcz83kXlBhUvykYXNu9lEhkpIHOA
	4uQ2Z0/xj6zonsFLoyMj3SU3CgN+uZDAUkin1rS2hG0a3+Mie++0tcpVWyo9K5FEpfeuuRmEEcI
	Zh7y/zlureIOut7epwQSmvk5IrdwlfGd2Gg==
X-Gm-Gg: AYBFou0IVEcAJRHn/lOgNmkE/z4Id8yQOnpuJ9A7c655eKVmIRhnAtoagsPAgBbFh3v
	ddnGgweFG4AmycmPvaIXu5YzF90+A2PV9XA5XU1DVIjGksXA4Lb7EYMKWrQp2so9Un8fTedpLB9
	U1OWnx4+tr8QXk6gtHcxSdS3GusqWx8vmLtZKoTtwDkpicGvMy7s/7pBQhUbvVrpomZLaaVvoHG
	Fr0P0xOdJSje8KJdT0cM9n6FwHz+8A/zuKWFfWC1+n8ypPUK+R2iR5qiqThbKpZa3n2XbnyZlHe
	jueDkF1CczgRbmrFalRG5K38bCYlpPZsBIJS738SBUR61+vi7/5u6CEuwatFqyg2UF9sEZeNB1I
	ZQzGyKVW8UWwOHAr6Y29yFudCFsTimA7hv2HOWoN+FzcqZOgr2U2FHSPJCJnyHA42WvNOITscS2
	xuXL/303CRWlsilxhZf1iuDjEfeFBAqPMN9tENzQnq1bGTHrGt4J16iAS/ByoSO2uOOWUdeowX5
	V0MMmaXAw3yqw==
X-Received: by 2002:a05:690c:a613:b0:85b:7fb9:22fa with SMTP id
 00721157ae682-86c4f66987bmr35956807b3.10.1788397715942; Wed, 02 Sep 2026
 18:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
 <20260830125853.1139807-5-sunilkumar.dora@windriver.com> <CAMKF1sqMUeSk=TBrD7VN6HvEWrhPzYUQkJxAngQyQHJAH=PDwQ@mail.gmail.com>
 <d5f983c7-2098-4969-a93e-f00ec65a637c@windriver.com>
In-Reply-To: <d5f983c7-2098-4969-a93e-f00ec65a637c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Sep 2026 18:08:09 -0700
X-Gm-Features: AcwNN1W7NiYi1AtJ8r-4ii8N921WXwRnnDwWYrEfYh2bdq9VnN6RPpWGuEFU9vg
Message-ID: <CAMKF1soSi078w3JFZDHQTMv3GUkvRM2=+M13=qb49rPzy--jfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/11] rust: Fix build and oe-selftest failures
 with LLVM 23
To: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"deepesh.vatharaj@windriver.com" <deepesh.vatharaj@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000093713d065a89caf5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 01:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244994

--00000000000093713d065a89caf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:17=E2=80=AFPM Dora, Sunil Kumar <
SunilKumar.Dora@windriver.com> wrote:

> On 8/31/2026 1:17 AM, Khem Raj via lists.openembedded.org wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
> I wonder if each backport should have been a patch of its own. It would
> make it easy to maintain of some of them get backported to later versions
> of rust.
>
> I checked with Deepesh. These all exist for the same llvm 23 bump, mostly
> test guarding plus the one AssignGUID wrapper fix, and they become
> redundant
> together once we move to a rust that supports LLVM 23. So one patch keeps
> it simple here. For real compiler or library backports we agree
> separate patches make life easier and we will do that going forward. Ok t=
o
> keep this one as is?
>

OK, Lets try it this way, Since we will bump minor versions of llvm during
its lifetime we will see if it will cause conflicts too much.


>
> Thanks,
> Sunil Dora
>
>
> On Sun, Aug 30, 2026 at 5:59=E2=80=AFAM <sunilkumar.dora@windriver.com> w=
rote:
>
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Backport upstream Rust commits to address build and oe-selftest
>> failures introduced by the LLVM 23 upgrade.
>>
>> New patch:
>> 0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch
>> The backported changes update LLVM 23 compatibility in the Rust LLVM
>> wrapper and adjust affected LLVM codegen tests.
>>
>> Selftest Changes:
>> Exclude the following Windows-specific test from oe-selftest,
>> as it is not relevant.
>> tests/assembly-llvm/x86_64-windows-float-abi.rs
>>
>> Excluded tests:
>> +---------+---------+---------+
>> | Before  |  After  | Skipped |
>> +---------+---------+---------+
>> |   43    |   44    |   +1    |
>> +---------+---------+---------+
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>> ---
>>  meta/lib/oeqa/selftest/cases/rust.py          |   1 +
>>  ...ommits-from-rust-Fix-selftest-llvm23.patch | 661 ++++++++++++++++++
>>  meta/recipes-devtools/rust/rust-source.inc    |   1 +
>>  3 files changed, 663 insertions(+)
>>  create mode 100644
>> meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-sel=
ftest-llvm23.patch
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py
>> b/meta/lib/oeqa/selftest/cases/rust.py
>> index fa8a8c1e7c..645b5d5fbf 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -83,6 +83,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,
>> OEPTestResultTestCase):
>>                              'src/tools/tidy',
>>
>>  'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
>>                              'tests/assembly-llvm/c-variadic/arm.rs',
>> +
>> 'tests/assembly-llvm/x86_64-windows-float-abi.rs',
>>                              'tests/codegen-llvm/thread-local.rs',
>>                              'tests/mir-opt/',
>>                              'tests/run-make',
>> diff --git
>> a/meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-s=
elftest-llvm23.patch
>> b/meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-s=
elftest-llvm23.patch
>> new file mode 100644
>> index 0000000000..1e1bf089f1
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-s=
elftest-llvm23.patch
>> @@ -0,0 +1,661 @@
>> +Backport commits that fix build and oe-selftest failures seen with llvm
>> 23
>> +
>> +Upstream-Status: Backport [
>> https://github.com/rust-lang/rust/commit/b8d3a4ac9cfeb81d1e929fe6eab0af4=
b77ba3bb4
>> ]
>> +Upstream-Status: Backport [
>> https://github.com/rust-lang/rust/commit/d4a24cd6e18b98326429d8c7e7bbb26=
9da14a5aa
>> ]
>> +Upstream-Status: Backport [
>> https://github.com/rust-lang/rust/commit/20ac2125a2142c9bde53ca06d9b3cfb=
6941fd437
>> ]
>> +Upstream-Status: Backport [
>> https://github.com/rust-lang/rust/commit/2d18054569d1169bfae7ce21e5c7111=
f32f16774
>> ]
>> +Upstream-Status: Backport [
>> https://github.com/rust-lang/rust/commit/e2159107f6ebc615ba6a92960d65528=
baf90cd35
>> ]
>> +Upstream-Status: Backport [
>> https://github.com/rust-lang/rust/commit/283a60b64339d611b76a4ed2f9286f4=
17b269b2f
>> ]
>> +Upstream-Status: Backport [
>> https://github.com/rust-lang/rust/commit/61d9ba28a99f073fbeb19dbb552ddf3=
43aef62f0
>> ]
>> +
>> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
>> +
>> +diff --git a/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp
>> b/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp
>> +index fe5b8edce4a..e4807f10805 100644
>> +--- a/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp
>> ++++ b/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp
>> +@@ -49,6 +49,9 @@
>> + #include "llvm/Transforms/Instrumentation/RealtimeSanitizer.h"
>> + #include "llvm/Transforms/Instrumentation/ThreadSanitizer.h"
>> + #include "llvm/Transforms/Scalar/AnnotationRemarks.h"
>> ++#if LLVM_VERSION_GE(23, 0)
>> ++#include "llvm/Transforms/Utils/AssignGUID.h"
>> ++#endif
>> + #include "llvm/Transforms/Utils/CanonicalizeAliases.h"
>> + #include "llvm/Transforms/Utils/FunctionImportUtils.h"
>> + #include "llvm/Transforms/Utils/NameAnonGlobals.h"
>> +@@ -925,6 +928,9 @@
>> +   if (NeedThinLTOBufferPasses) {
>> +     MPM.addPass(CanonicalizeAliasesPass());
>> +     MPM.addPass(NameAnonGlobalPass());
>> ++#if LLVM_VERSION_GE(23, 0)
>> ++    MPM.addPass(AssignGUIDPass());
>> ++#endif
>> +   }
>> +   // For `-Copt-level=3D0`, and the pre-link fat/thin LTO stages.
>> +   if (ThinLTOBufferRef && *ThinLTOBufferRef =3D=3D nullptr) {
>> +@@ -1464,6 +1470,9 @@
>> +         PB.registerLoopAnalyses(LAM);
>> +         PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);
>> +         ModulePassManager MPM;
>> ++#if LLVM_VERSION_GE(23, 0)
>> ++        MPM.addPass(AssignGUIDPass());
>> ++#endif
>> +         MPM.addPass(ThinLTOBitcodeWriterPass(OS, nullptr));
>> +         MPM.run(*unwrap(M), MAM);
>> +       } else {
>> +diff --git a/tests/codegen-llvm/bpf-allows-unaligned.rs
>> b/tests/codegen-llvm/bpf-allows-unaligned.rs
>> +index c7a70d5b2e5..7e95a56d984 100644
>> +--- a/tests/codegen-llvm/bpf-allows-unaligned.rs
>> ++++ b/tests/codegen-llvm/bpf-allows-unaligned.rs
>> +@@ -5,7 +5,7 @@
>> +
>> + #[no_mangle]
>> + #[target_feature(enable =3D "allows-misaligned-mem-access")]
>> +-// CHECK: define noundef zeroext i8 @foo(i8 noundef returned %arg)
>> unnamed_addr #0 {
>> ++// CHECK: define noundef zeroext i8 @foo(i8 noundef returned %arg)
>> unnamed_addr #0
>> + pub unsafe fn foo(arg: u8) -> u8 {
>> +     arg
>> + }
>> +diff --git a/tests/codegen-llvm/branch-protection.rs
>> b/tests/codegen-llvm/branch-protection.rs
>> +index ed1cb2cd137..11847c256d6 100644
>> +--- a/tests/codegen-llvm/branch-protection.rs
>> ++++ b/tests/codegen-llvm/branch-protection.rs
>> +@@ -22,7 +22,7 @@
>> + use minicore::*;
>> +
>> + // A basic test function.
>> +-// CHECK: @test(){{.*}} [[ATTR:#[0-9]+]] {
>> ++// CHECK: @test(){{.*}} [[ATTR:#[0-9]+]]
>> + #[no_mangle]
>> + pub fn test() {}
>> +
>> +diff --git a/tests/codegen-llvm/frame-pointer-cli-control.rs
>> b/tests/codegen-llvm/frame-pointer-cli-control.rs
>> +index 911a5f03cbc..79cdfc70f1a 100644
>> +--- a/tests/codegen-llvm/frame-pointer-cli-control.rs
>> ++++ b/tests/codegen-llvm/frame-pointer-cli-control.rs
>> +@@ -45,7 +45,7 @@
>> +
>> + extern crate minicore;
>> +
>> +-// CHECK: i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]] {
>> ++// CHECK: i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]]
>> + #[no_mangle]
>> + pub fn peach(x: u32) -> u32 {
>> +     x
>> +diff --git a/tests/codegen-llvm/frame-pointer.rs
>> b/tests/codegen-llvm/frame-pointer.rs
>> +index 1d0dd762826..a52d95a2386 100644
>> +--- a/tests/codegen-llvm/frame-pointer.rs
>> ++++ b/tests/codegen-llvm/frame-pointer.rs
>> +@@ -18,7 +18,7 @@
>> + extern crate minicore;
>> + use minicore::*;
>> +
>> +-// CHECK: define i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]] {
>> ++// CHECK: define i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]]
>> + #[no_mangle]
>> + pub fn peach(x: u32) -> u32 {
>> +     x
>> +diff --git a/tests/codegen-llvm/gpu-convergent.rs
>> b/tests/codegen-llvm/gpu-convergent.rs
>> +index bb9271ab699..376d65a3d4a 100644
>> +--- a/tests/codegen-llvm/gpu-convergent.rs
>> ++++ b/tests/codegen-llvm/gpu-convergent.rs
>> +@@ -17,7 +17,7 @@
>> +     fn ext();
>> + }
>> +
>> +-// CHECK: define {{.*}}_kernel void @fun(i32{{.*}}) unnamed_addr
>> #[[ATTR:[0-9]+]] {
>> ++// CHECK: define {{.*}}_kernel void @fun(i32{{.*}}) unnamed_addr
>> #[[ATTR:[0-9]+]]
>> + // CHECK: declare void @ext() unnamed_addr #[[ATTR]]
>> + // CHECK: attributes #[[ATTR]] =3D {{.*}} convergent
>> + #[no_mangle]
>> +diff --git a/tests/codegen-llvm/instrument-coverage/testprog.rs
>> b/tests/codegen-llvm/instrument-coverage/testprog.rs
>> +index ef61ede6de8..67c49c438f9 100644
>> +--- a/tests/codegen-llvm/instrument-coverage/testprog.rs
>> ++++ b/tests/codegen-llvm/instrument-coverage/testprog.rs
>> +@@ -101,7 +101,7 @@ fn main() {
>> + // CHECK-SAME:   @__llvm_prf_nm
>> + // CHECK-SAME:   section "llvm.metadata"
>> +
>> +-// CHECK:        define internal { {{.*}} }
>> @_R{{[a-zA-Z0-9_]+}}testprog14will_be_called() unnamed_addr #{{[0-9]+}} =
{
>> ++// CHECK:        define internal { {{.*}} }
>> @_R{{[a-zA-Z0-9_]+}}testprog14will_be_called() unnamed_addr #{{[0-9]+}}
>> + // CHECK-NEXT:   start:
>> + // CHECK-NOT:    define internal
>> + // CHECK:        atomicrmw add ptr
>> +@@ -109,7 +109,7 @@ fn main() {
>> +
>> + // CHECK:        declare void @llvm.instrprof.increment(ptr, i64, i32,
>> i32) #[[LLVM_INSTRPROF_INCREMENT_ATTR:[0-9]+]]
>> +
>> +-// WIN:          define linkonce_odr hidden i32
>> @__llvm_profile_runtime_user() #[[LLVM_PROFILE_RUNTIME_USER_ATTR:[0-9]+]=
]
>> comdat {{.*}}{
>> ++// WIN:          define linkonce_odr hidden i32
>> @__llvm_profile_runtime_user() #[[LLVM_PROFILE_RUNTIME_USER_ATTR:[0-9]+]=
]
>> comdat {{.*}}
>> + // WIN-NEXT:     %1 =3D load i32, ptr @__llvm_profile_runtime
>> + // WIN-NEXT:     ret i32 %1
>> + // WIN-NEXT:     }
>> +diff --git a/tests/codegen-llvm/link_section.rs
>> b/tests/codegen-llvm/link_section.rs
>> +index f196ea86c44..61bde683c0a 100644
>> +--- a/tests/codegen-llvm/link_section.rs
>> ++++ b/tests/codegen-llvm/link_section.rs
>> +@@ -29,7 +29,7 @@ pub enum E {
>> + #[link_section =3D "__TEST,three"]
>> + pub static VAR3: E =3D E::B(1.);
>> +
>> +-// CHECK: define {{(dso_local )?}}void @fn1() {{.*}} section
>> "__TEST,four" {
>> ++// CHECK: define {{(dso_local )?}}void @fn1() {{.*}} section
>> "__TEST,four"
>> + #[no_mangle]
>> + #[link_section =3D "__TEST,four"]
>> + pub fn fn1() {}
>> +diff --git
>> a/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-no=
rmalized-generalized.rs
>> b/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-no=
rmalized-generalized.rs
>> +index 7639ce7b104..5b1aa97ab33 100644
>> +---
>> a/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-no=
rmalized-generalized.rs
>> ++++
>> b/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-no=
rmalized-generalized.rs
>> +@@ -7,21 +7,21 @@
>> +
>> + pub fn foo(f: fn(i32) -> i32, arg: i32) -> i32 {
>> +     // CHECK-LABEL: define{{.*}}foo
>> +-    // CHECK-SAME:  {{.*}}![[TYPE1:[0-9]+]]
>> ++    // CHECK-SAME:  {{.*}}!type ![[TYPE1:[0-9]+]]
>> +     // CHECK:       call i1 @llvm.type.test(ptr {{%f|%0}}, metadata
>> !"_ZTSFu3i32S_E.normalized.generalized")
>> +     f(arg)
>> + }
>> +
>> + pub fn bar(f: fn(i32, i32) -> i32, arg1: i32, arg2: i32) -> i32 {
>> +     // CHECK-LABEL: define{{.*}}bar
>> +-    // CHECK-SAME:  {{.*}}![[TYPE2:[0-9]+]]
>> ++    // CHECK-SAME:  {{.*}}!type ![[TYPE2:[0-9]+]]
>> +     // CHECK:       call i1 @llvm.type.test(ptr {{%f|%0}}, metadata
>> !"_ZTSFu3i32S_S_E.normalized.generalized")
>> +     f(arg1, arg2)
>> + }
>> +
>> + pub fn baz(f: fn(i32, i32, i32) -> i32, arg1: i32, arg2: i32, arg3:
>> i32) -> i32 {
>> +     // CHECK-LABEL: define{{.*}}baz
>> +-    // CHECK-SAME:  {{.*}}![[TYPE3:[0-9]+]]
>> ++    // CHECK-SAME:  {{.*}}!type ![[TYPE3:[0-9]+]]
>> +     // CHECK:       call i1 @llvm.type.test(ptr {{%f|%0}}, metadata
>> !"_ZTSFu3i32S_S_S_E.normalized.generalized")
>> +     f(arg1, arg2, arg3)
>> + }
>> +diff --git
>> a/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs
>> b/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs
>> +index 35317b0dd39..3df2d569f9a 100644
>> +--- a/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs
>> ++++ b/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs
>> +@@ -72,7 +72,7 @@ pub unsafe fn some_non_zero_from_atomic_get() ->
>> Option<NonZeroUsize> {
>> + ///
>> + /// The way we check that the LLVM IR is correct is by making sure tha=
t
>> neither
>> + /// `panic` nor `unreachable` is part of the LLVM IR:
>> +-// CHECK-LABEL: define {{.*}} i64 @some_non_zero_from_atomic_get2()
>> {{.*}} {
>> ++// CHECK-LABEL: define {{.*}} i64 @some_non_zero_from_atomic_get2()
>> {{.*}}
>> + // CHECK-NOT: panic
>> + // CHECK-NOT: unreachable
>> + #[no_mangle]
>> +diff --git a/tests/codegen-llvm/target-feature-negative-implication.rs
>> b/tests/codegen-llvm/target-feature-negative-implication.rs
>> +index a9cdca42839..376599738e5 100644
>> +--- a/tests/codegen-llvm/target-feature-negative-implication.rs
>> ++++ b/tests/codegen-llvm/target-feature-negative-implication.rs
>> +@@ -13,7 +13,7 @@
>> + #[no_mangle]
>> + pub unsafe fn banana() {
>> +     // CHECK-LABEL: @banana()
>> +-    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]] {
>> ++    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]]
>> + }
>> +
>> + // CHECK: attributes [[BANANAATTRS]]
>> +diff --git a/tests/codegen-llvm/target-feature-overrides.rs
>> b/tests/codegen-llvm/target-feature-overrides.rs
>> +index 2adc8ee6f53..3bf05c7977e 100644
>> +--- a/tests/codegen-llvm/target-feature-overrides.rs
>> ++++ b/tests/codegen-llvm/target-feature-overrides.rs
>> +@@ -23,7 +23,7 @@
>> + #[no_mangle]
>> + pub unsafe fn apple() -> u32 {
>> +     // CHECK-LABEL: @apple()
>> +-    // CHECK-SAME: [[APPLEATTRS:#[0-9]+]] {
>> ++    // CHECK-SAME: [[APPLEATTRS:#[0-9]+]]
>> +     // CHECK: {{.*}}call{{.*}}@peach
>> +     peach()
>> + }
>> +@@ -32,7 +32,7 @@ pub unsafe fn apple() -> u32 {
>> + #[no_mangle]
>> + pub unsafe fn banana() -> u32 {
>> +     // CHECK-LABEL: @banana()
>> +-    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]] {
>> ++    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]]
>> +     // COMPAT: {{.*}}call{{.*}}@peach
>> +     // INCOMPAT: {{.*}}call{{.*}}@apple
>> +     apple() // Compatible for inline in COMPAT revision and can't be
>> inlined in INCOMPAT
>> +diff --git a/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs
>> +index ecace722e0d..279780e3a7a 100644
>> +--- a/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs
>> +@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
>> + // `aapcs-unwind` extern functions. `aapcs-unwind` functions MUST NOT
>> have this attribute. We
>> + // disable optimizations above to prevent LLVM from inferring the
>> attribute.
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "aapcs" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "aapcs-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs
>> +index 46c08b5fc4f..1b3312839e3 100644
>> +--- a/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs
>> +@@ -7,11 +7,11 @@
>> +
>> + #![crate_type =3D "lib"]
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "C" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "C-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs
>> +index 8e643d6ce49..6f4eafb353c 100644
>> +--- a/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs
>> +@@ -7,11 +7,11 @@
>> +
>> + #![crate_type =3D "lib"]
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "cdecl" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "cdecl-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs
>> +index 7df46813ed1..51c6fd15b9c 100644
>> +--- a/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs
>> +@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
>> + // `fastcall-unwind` extern functions. `fastcall-unwind` functions MUS=
T
>> NOT have this attribute. We
>> + // disable optimizations above to prevent LLVM from inferring the
>> attribute.
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "fastcall" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "fastcall-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs
>> +index cc06ee12549..b5fcea52b4d 100644
>> +--- a/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs
>> +@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
>> + // extern functions. `stdcall-unwind` functions MUST NOT have this
>> attribute. We disable
>> + // optimizations above to prevent LLVM from inferring the attribute.
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "stdcall" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "stdcall-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs
>> +index 5f910248346..15fce95fe28 100644
>> +--- a/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs
>> +@@ -7,11 +7,11 @@
>> +
>> + #![crate_type =3D "lib"]
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "system" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "system-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs
>> +index 69bfaf80b4b..1293e7c0a5f 100644
>> +--- a/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs
>> +@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
>> + // `sysv64-unwind` extern functions. `sysv64-unwind` functions MUST NO=
T
>> have this attribute. We
>> + // disable optimizations above to prevent LLVM from inferring the
>> attribute.
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "sysv64" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "sysv64-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs
>> +index 05f6b8b70e1..a9b6c34ee58 100644
>> +--- a/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs
>> +@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
>> + // `thiscall-unwind` extern functions. `thiscall-unwind` functions MUS=
T
>> NOT have this attribute. We
>> + // disable optimizations above to prevent LLVM from inferring the
>> attribute.
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "thiscall" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "thiscall-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs
>> +index d001a16b32a..8cedb55ae1d 100644
>> +--- a/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs
>> +@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
>> + // `vectorcall-unwind` extern functions. `vectorcall-unwind` functions
>> MUST NOT have this attribute.
>> + // We disable optimizations above to prevent LLVM from inferring the
>> attribute.
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "vectorcall" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "vectorcall-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs
>> b/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs
>> +index 257f00b54e4..2a3ad330406 100644
>> +--- a/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs
>> ++++ b/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs
>> +@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
>> + // `win64-unwind` extern functions. `win64-unwind` functions MUST NOT
>> have this attribute. We
>> + // disable optimizations above to prevent LLVM from inferring the
>> attribute.
>> +
>> +-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
>> ++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
>> + #[no_mangle]
>> + pub extern "win64" fn rust_item_that_cannot_unwind() {}
>> +
>> +-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
>> ++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
>> + #[no_mangle]
>> + pub extern "win64-unwind" fn rust_item_that_can_unwind() {}
>> +
>> +diff --git a/tests/assembly-llvm/slice-is_ascii.rs
>> b/tests/assembly-llvm/slice-is_ascii.rs
>> +index e53cd5160cf..6d660e78147 100644
>> +--- a/tests/assembly-llvm/slice-is_ascii.rs
>> ++++ b/tests/assembly-llvm/slice-is_ascii.rs
>> +@@ -6,6 +6,11 @@
>> + //@ only-x86_64
>> + //@ ignore-sgx
>> +
>> ++// No longer optimizes as desired, tracked at:
>> ++// https://github.com/rust-lang/rust/issues/154141
>> ++// https://github.com/llvm/llvm-project/issues/209216
>> ++//@ max-llvm-major-version: 22
>> ++
>> + #![feature(str_internals)]
>> +
>> + // CHECK-LABEL: is_ascii_simple_demo:
>> +diff --git a/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs
>> b/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs
>> +index 40d16886c6d..d3698fda5fe 100644
>> +--- a/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs
>> ++++ b/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs
>> +@@ -1,12 +1,16 @@
>> + // verify that simd mask reductions do not introduce additional bit
>> shift operations
>> + //@ add-minicore
>> +-//@ revisions: x86 aarch64
>> ++//@ revisions: x86 aarch64-llvm22 aarch64
>> + //@ [x86] compile-flags: --target=3Dx86_64-unknown-linux-gnu -C
>> llvm-args=3D-x86-asm-syntax=3Dintel
>> + // Set the base cpu explicitly, in case the default has been changed.
>> + //@ [x86] compile-flags: -C target-cpu=3Dx86-64
>> + //@ [x86] needs-llvm-components: x86
>> ++//@ [aarch64-llvm22] compile-flags: --target=3Daarch64-unknown-linux-g=
nu
>> ++//@ [aarch64-llvm22] needs-llvm-components: aarch64
>> ++//@ [aarch64-llvm22] max-llvm-major-version: 22
>> + //@ [aarch64] compile-flags: --target=3Daarch64-unknown-linux-gnu
>> + //@ [aarch64] needs-llvm-components: aarch64
>> ++//@ [aarch64] min-llvm-version: 23
>> + //@ assembly-output: emit-asm
>> + //@ compile-flags: --crate-type=3Dlib -Copt-level=3D3 -C panic=3Dabort
>> +
>> +@@ -33,12 +37,19 @@
>> +     // x86-NEXT: {{cmp ax, -1|cmp eax, 65535|xor eax, 65535}}
>> +     // x86-NEXT: sete al
>> +     //
>> ++    // aarch64-llvm22-NOT: shl
>> ++    // aarch64-llvm22: cmge v0.16b, v0.16b, #0
>> ++    // aarch64-llvm22-DAG: mov [[REG1:[a-z0-9]+]], #1
>> ++    // aarch64-llvm22-DAG: umaxv b0, v0.16b
>> ++    // aarch64-llvm22-NEXT: fmov [[REG2:[a-z0-9]+]], s0
>> ++    // aarch64-llvm22-NEXT: bic w0, [[REG1]], [[REG2]]
>> ++    //
>> +     // aarch64-NOT: shl
>> +     // aarch64: cmge v0.16b, v0.16b, #0
>> +-    // aarch64-DAG: mov [[REG1:[a-z0-9]+]], #1
>> +-    // aarch64-DAG: umaxv b0, v0.16b
>> +-    // aarch64-NEXT: fmov [[REG2:[a-z0-9]+]], s0
>> +-    // aarch64-NEXT: bic w0, [[REG1]], [[REG2]]
>> ++    // aarch64-NEXT: addp [[REG1:d[0-9]+]], v0.2d
>> ++    // aarch64-NEXT: fmov [[REG2:x[0-9]+]], [[REG1]]
>> ++    // aarch64-NEXT: cmp [[REG2]], #0
>> ++    // aarch64-NEXT: cset w0, eq
>> +     simd_reduce_all(m)
>> + }
>> +
>> +@@ -50,10 +61,17 @@
>> +     // x86-NEXT: test eax, eax
>> +     // x86-NEXT: setne al
>> +     //
>> ++    // aarch64-llvm22-NOT: shl
>> ++    // aarch64-llvm22: cmlt v0.16b, v0.16b, #0
>> ++    // aarch64-llvm22-NEXT: umaxv b0, v0.16b
>> ++    // aarch64-llvm22-NEXT: fmov [[REG:[a-z0-9]+]], s0
>> ++    // aarch64-llvm22-NEXT: and w0, [[REG]], #0x1
>> ++    //
>> +     // aarch64-NOT: shl
>> +     // aarch64: cmlt v0.16b, v0.16b, #0
>> +-    // aarch64-NEXT: umaxv b0, v0.16b
>> +-    // aarch64-NEXT: fmov [[REG:[a-z0-9]+]], s0
>> +-    // aarch64-NEXT: and w0, [[REG]], #0x1
>> ++    // aarch64-NEXT: addp [[REG1:d[0-9]+]], v0.2d
>> ++    // aarch64-NEXT: fmov [[REG2:x[0-9]+]], [[REG1]]
>> ++    // aarch64-NEXT: cmp [[REG2]], #0
>> ++    // aarch64-NEXT: cset w0, ne
>> +     simd_reduce_any(m)
>> + }
>> +diff --git a/tests/codegen-llvm/asm/global_asm.rs
>> b/tests/codegen-llvm/asm/global_asm.rs
>> +index 32075daa3cf..8c1c4a3b588 100644
>> +--- a/tests/codegen-llvm/asm/global_asm.rs
>> ++++ b/tests/codegen-llvm/asm/global_asm.rs
>> +@@ -7,10 +7,10 @@
>> +
>> + use std::arch::global_asm;
>> +
>> +-// CHECK-LABEL: foo
>> + // CHECK: module asm
>> ++// CHECK-LABEL: foo
>> + // this regex will capture the correct unconditional branch inst.
>> +-// CHECK: module asm "{{[[:space:]]+}}jmp baz"
>> ++// CHECK: "{{[[:space:]]+}}jmp baz"
>> + global_asm!(
>> +     r#"
>> +     .global foo
>> +diff --git a/tests/codegen-llvm/asm/global_asm_include.rs
>> b/tests/codegen-llvm/asm/global_asm_include.rs
>> +index 98be9c3e333..cad9901336b 100644
>> +--- a/tests/codegen-llvm/asm/global_asm_include.rs
>> ++++ b/tests/codegen-llvm/asm/global_asm_include.rs
>> +@@ -7,9 +7,9 @@
>> +
>> + use std::arch::global_asm;
>> +
>> +-// CHECK-LABEL: foo
>> + // CHECK: module asm
>> +-// CHECK: module asm "{{[[:space:]]+}}jmp baz"
>> ++// CHECK-LABEL: foo
>> ++// CHECK: "{{[[:space:]]+}}jmp baz"
>> + global_asm!(include_str!("foo.s"));
>> +
>> + extern "C" {
>> +diff --git a/tests/codegen-llvm/asm/global_asm_x2.rs
>> b/tests/codegen-llvm/asm/global_asm_x2.rs
>> +index 9e3a00f0680..8c6f38289de 100644
>> +--- a/tests/codegen-llvm/asm/global_asm_x2.rs
>> ++++ b/tests/codegen-llvm/asm/global_asm_x2.rs
>> +@@ -8,12 +8,12 @@
>> +
>> + use core::arch::global_asm;
>> +
>> +-// CHECK-LABEL: foo
>> + // CHECK: module asm
>> +-// CHECK: module asm "{{[[:space:]]+}}jmp baz"
>> ++// CHECK-LABEL: foo
>> ++// CHECK: "{{[[:space:]]+}}jmp baz"
>> + // any other global_asm will be appended to this first block, so:
>> + // CHECK-LABEL: bar
>> +-// CHECK: module asm "{{[[:space:]]+}}jmp quux"
>> ++// CHECK: "{{[[:space:]]+}}jmp quux"
>> + global_asm!(
>> +     r#"
>> +     .global foo
>> +diff --git a/tests/codegen-llvm/array-cmp.rs
>> b/tests/codegen-llvm/array-cmp.rs
>> +index 0106b9c15c1..5b0a802f409 100644
>> +--- a/tests/codegen-llvm/array-cmp.rs
>> ++++ b/tests/codegen-llvm/array-cmp.rs
>> +@@ -2,6 +2,9 @@
>> +
>> + //@ compile-flags: -C opt-level=3D2
>> + //@ needs-deterministic-layouts (checks depend on tuple layout)
>> ++//@ revisions: LLVM22 LLVM23
>> ++//@ [LLVM22] max-llvm-major-version: 22
>> ++//@ [LLVM23] min-llvm-version: 23
>> +
>> + #![crate_type =3D "lib"]
>> +
>> +@@ -66,7 +69,8 @@ pub fn compare() -> bool {
>> +     // CHECK-NEXT: br i1 %[[EQ01]], label %{{.+}}, label %[[EXIT_U]]
>> +
>> +     // CHECK: [[DONE]]:
>> +-    // CHECK: %[[RET:.+]] =3D phi i1 [ %{{.+}}, %[[EXIT_S]] ], [ %{{.+=
}},
>> %[[EXIT_U]] ], [ true, %[[L11]] ]
>> ++    // LLVM22: %[[RET:.+]] =3D phi i1 [ %{{.+}}, %[[EXIT_S]] ], [
>> %{{.+}}, %[[EXIT_U]] ], [ true, %[[L11]] ]
>> ++    // LLVM23: %[[RET:.+]] =3D phi i1 [ %{{.+}}, %[[EXIT_U]] ], [
>> %{{.+}}, %[[EXIT_S]] ], [ true, %[[L11]] ]
>> +     // CHECK: ret i1 %[[RET]]
>> +
>> +     a <=3D b
>> +diff --git a/tests/codegen-llvm/enum/enum-match.rs
>> b/tests/codegen-llvm/enum/enum-match.rs
>> +index 6d8b97328f8..a0cba452e12 100644
>> +--- a/tests/codegen-llvm/enum/enum-match.rs
>> ++++ b/tests/codegen-llvm/enum/enum-match.rs
>> +@@ -1,5 +1,8 @@
>> + //@ compile-flags: -Copt-level=3D1
>> + //@ only-64bit
>> ++//@ revisions: LLVM22 LLVM23
>> ++//@ [LLVM22] max-llvm-major-version: 22
>> ++//@ [LLVM23] min-llvm-version: 23
>> +
>> + #![crate_type =3D "lib"]
>> + #![feature(core_intrinsics)]
>> +@@ -18,8 +21,9 @@ pub enum Enum0 {
>> + // CHECK-LABEL: define{{( dso_local)?}} noundef{{( range\(i8 [0-9]+,
>> [0-9]+\))?}} i8 @match0(i8{{.+}}%0)
>> + // CHECK-NEXT: start:
>> + // CHECK-NEXT: %[[IS_B:.+]] =3D icmp eq i8 %0, 2
>> +-// CHECK-NEXT: %[[TRUNC:.+]] =3D and i8 %0, 1
>> +-// CHECK-NEXT: %[[R:.+]] =3D select i1 %[[IS_B]], i8 13, i8 %[[TRUNC]]
>> ++// LLVM22-NEXT: %[[TRUNC:.+]] =3D and i8 %0, 1
>> ++// LLVM22-NEXT: %[[R:.+]] =3D select i1 %[[IS_B]], i8 13, i8 %[[TRUNC]=
]
>> ++// LLVM23-NEXT: %[[R:.+]] =3D select i1 %[[IS_B]], i8 13, i8 %0
>> + // CHECK-NEXT: ret i8 %[[R]]
>> + #[no_mangle]
>> + pub fn match0(e: Enum0) -> u8 {
>> +diff --git a/tests/assembly-llvm/simd-bitmask.rs
>> b/tests/assembly-llvm/simd-bitmask.rs
>> +index 98f63c165f3..e8bb335c5b0 100644
>> +--- a/tests/assembly-llvm/simd-bitmask.rs
>> ++++ b/tests/assembly-llvm/simd-bitmask.rs
>> +@@ -11,7 +11,7 @@
>> + //@ [aarch64] min-llvm-version: 23
>> + //@ [aarch64] compile-flags: --target=3Daarch64-unknown-linux-gnu
>> + //@ [aarch64] needs-llvm-components: aarch64
>> +-//@ [aarch64-llvm-pre-23] ignore-llvm-version: 23 - 99
>> ++//@ [aarch64-llvm-pre-23] max-llvm-major-version: 22
>> + //@ [aarch64-llvm-pre-23] compile-flags:
>> --target=3Daarch64-unknown-linux-gnu
>> + //@ [aarch64-llvm-pre-23] needs-llvm-components: aarch64
>> + //@ assembly-output: emit-asm
>> +diff --git a/tests/codegen-llvm/array-equality.rs
>> b/tests/codegen-llvm/array-equality.rs
>> +index 706caebdcb6..c0f716b6067 100644
>> +--- a/tests/codegen-llvm/array-equality.rs
>> ++++ b/tests/codegen-llvm/array-equality.rs
>> +@@ -1,5 +1,5 @@
>> + //@ revisions: llvm-current llvm-next
>> +-//@[llvm-current] ignore-llvm-version: 23-99
>> ++//@[llvm-current] max-llvm-major-version: 22
>> + //@[llvm-next] min-llvm-version: 23
>> + //@ compile-flags: -Copt-level=3D3 -Z merge-functions=3Ddisabled
>> + //@ only-x86_64
>> +diff --git a/tests/ui/explicit-tail-calls/support/bystack.rs
>> b/tests/ui/explicit-tail-calls/support/bystack.rs
>> +index ddd9c79f5c7..c89ad194f8b 100644
>> +--- a/tests/ui/explicit-tail-calls/support/bystack.rs
>> ++++ b/tests/ui/explicit-tail-calls/support/bystack.rs
>> +@@ -36,11 +36,11 @@
>> + //@ revisions: loongarch32
>> + //@[loongarch32] compile-flags: --target loongarch32-unknown-none
>> + //@[loongarch32] needs-llvm-components: loongarch
>> +-//@[loongarch32] ignore-llvm-version: 22 - 23
>> ++//@[loongarch32] max-llvm-major-version: 21
>> + //@ revisions: loongarch64
>> + //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
>> + //@[loongarch64] needs-llvm-components: loongarch
>> +-//@[loongarch64] ignore-llvm-version: 22 - 23
>> ++//@[loongarch64] max-llvm-major-version: 21
>> + //@ revisions: bpf
>> + //@[bpf] compile-flags: --target bpfeb-unknown-none
>> + //@[bpf] needs-llvm-components: bpf
>> +diff --git a/tests/ui/explicit-tail-calls/support/byval.rs
>> b/tests/ui/explicit-tail-calls/support/byval.rs
>> +index f451a953f2a..e6f26b9292e 100644
>> +--- a/tests/ui/explicit-tail-calls/support/byval.rs
>> ++++ b/tests/ui/explicit-tail-calls/support/byval.rs
>> +@@ -36,11 +36,11 @@
>> + //@ revisions: loongarch32
>> + //@[loongarch32] compile-flags: --target loongarch32-unknown-none
>> + //@[loongarch32] needs-llvm-components: loongarch
>> +-//@[loongarch32] ignore-llvm-version: 22 - 23
>> ++//@[loongarch32] max-llvm-major-version: 21
>> + //@ revisions: loongarch64
>> + //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
>> + //@[loongarch64] needs-llvm-components: loongarch
>> +-//@[loongarch64] ignore-llvm-version: 22 - 23
>> ++//@[loongarch64] max-llvm-major-version: 21
>> + //@ revisions: bpf
>> + //@[bpf] compile-flags: --target bpfeb-unknown-none
>> + //@[bpf] needs-llvm-components: bpf
>> +diff --git a/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs
>> b/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs
>> +index 5834255f3d3..c3090a20e4d 100644
>> +--- a/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs
>> ++++ b/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs
>> +@@ -14,7 +14,6 @@ pub unsafe fn foo(x: &mut Copied<Iter<'_, u32>>) ->
>> u32 {
>> +     // CHECK-NOT: br {{.*}}
>> +     // CHECK-NOT: select
>> +     // CHECK: [[RET:%.*]] =3D load i32, ptr
>> +-    // CHECK-NEXT: assume
>> +-    // CHECK-NEXT: ret i32 [[RET]]
>> ++    // CHECK: ret i32 [[RET]]
>> +     x.next().unwrap_unchecked()
>> + }
>> diff --git a/meta/recipes-devtools/rust/rust-source.inc
>> b/meta/recipes-devtools/rust/rust-source.inc
>> index dd3e89a097..d87271b29c 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -7,6 +7,7 @@ SRC_URI +=3D "
>> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>>
>> file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;p=
atchdir=3D${RUSTSRC}
>> \
>>
>> file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=
=3D${RUSTSRC}
>> \
>>
>> file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patch=
dir=3D${RUSTSRC}
>> \
>> +
>> file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdi=
r=3D${RUSTSRC}
>> \
>>  "
>>  SRC_URI[rust.sha256sum] =3D
>> "271fa73d8174f53d713c46a8310da7bf7cfdcfb8b7cfd1c2b74b84a83ae9fb1e"
>>
>> --
>> 2.43.0
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244695): https://lists.openembedded.org/g/openembedde=
d-core/message/244695
> Mute This Topic: https://lists.openembedded.org/mt/120998122/8968818
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Su=
nilKumar.Dora@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
>

--00000000000093713d065a89caf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 31,=
 2026 at 10:17=E2=80=AFPM Dora, Sunil Kumar &lt;<a href=3D"mailto:SunilKuma=
r.Dora@windriver.com">SunilKumar.Dora@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>




<div>
<div>On 8/31/2026 1:17 AM, Khem Raj via <a href=3D"http://lists.openembedde=
d.org" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<strong></strong>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:rgb(25=
2,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,0)">CA=
UTION: This email comes from a non Wind River email account!</span><u></u><=
/strong><br>
<u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click links o=
r open attachments unless you recognize the sender and know the content is =
safe.</span><br>
<u></u></div>
<div>
<div dir=3D"ltr">I wonder if each backport should have=C2=A0been a patch of=
 its own. It would make=C2=A0it easy to maintain of some of them get backpo=
rted to later versions of rust.</div>
</div>
</blockquote>
I checked with Deepesh. These all exist for the same llvm 23 bump, mostly t=
est guarding plus the one AssignGUID wrapper fix, and they become redundant=
=C2=A0<br>
together once we move to a rust that supports LLVM 23. So one patch keeps i=
t simple here. For real compiler or library backports we agree=C2=A0<br>
separate patches make life easier and we will do that going forward. Ok to =
keep this one as is?<br></div></blockquote><div><br></div><div>OK, Lets try=
 it this way, Since we will bump minor versions=C2=A0of llvm during its lif=
etime we will see if it will cause conflicts too much.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
<br>
Thanks,<br>
Sunil Dora
<blockquote type=3D"cite">
<div><br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30, 2026 at 5:59=E2=80=AF=
AM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" target=3D"_blank">s=
unilkumar.dora@windriver.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varatharajan@windr=
iver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>&gt;<br>
<br>
Backport upstream Rust commits to address build and oe-selftest<br>
failures introduced by the LLVM 23 upgrade.<br>
<br>
New patch:<br>
0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch<br>
The backported changes update LLVM 23 compatibility in the Rust LLVM<br>
wrapper and adjust affected LLVM codegen tests.<br>
<br>
Selftest Changes:<br>
Exclude the following Windows-specific test from oe-selftest,<br>
as it is not relevant.<br>
tests/assembly-llvm/x86_64-windows-float-abi.rs<br>
<br>
Excluded tests:<br>
+---------+---------+---------+<br>
| Before=C2=A0 |=C2=A0 After=C2=A0 | Skipped |<br>
+---------+---------+---------+<br>
|=C2=A0 =C2=A043=C2=A0 =C2=A0 |=C2=A0 =C2=A044=C2=A0 =C2=A0 |=C2=A0 =C2=A0+=
1=C2=A0 =C2=A0 |<br>
+---------+---------+---------+<br>
<br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...ommits-from-rust-Fix-selftest-llvm23.patch | 661 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A03 files changed, 663 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0004-Backport-com=
mits-from-rust-Fix-selftest-llvm23.patch<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py<br>
index fa8a8c1e7c..645b5d5fbf 100644<br>
--- a/meta/lib/oeqa/selftest/cases/rust.py<br>
+++ b/meta/lib/oeqa/selftest/cases/rust.py<br>
@@ -83,6 +83,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPT=
estResultTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;src/tools/tidy&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;tests/assembly-llvm/asm/aarch64-outline=
-atomics.rs&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;tests/assembly-llvm/c-variadic/arm.rs&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/assembly-llvm/x86_64-windows-float-abi.=
rs&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;tests/codegen-llvm/thread-local.rs&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;tests/mir-opt/&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;tests/run-make&#39;,<br>
diff --git a/meta/recipes-devtools/rust/files/0004-Backport-commits-from-ru=
st-Fix-selftest-llvm23.patch b/meta/recipes-devtools/rust/files/0004-Backpo=
rt-commits-from-rust-Fix-selftest-llvm23.patch<br>
new file mode 100644<br>
index 0000000000..1e1bf089f1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-=
selftest-llvm23.patch<br>
@@ -0,0 +1,661 @@<br>
+Backport commits that fix build and oe-selftest failures seen with llvm 23=
<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/rust/co=
mmit/b8d3a4ac9cfeb81d1e929fe6eab0af4b77ba3bb4" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/rust/commit/b8d3a4ac9cfeb81d1e929fe6e=
ab0af4b77ba3bb4</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/rust/co=
mmit/d4a24cd6e18b98326429d8c7e7bbb269da14a5aa" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/rust/commit/d4a24cd6e18b98326429d8c7e=
7bbb269da14a5aa</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/rust/co=
mmit/20ac2125a2142c9bde53ca06d9b3cfb6941fd437" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/rust/commit/20ac2125a2142c9bde53ca06d=
9b3cfb6941fd437</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/rust/co=
mmit/2d18054569d1169bfae7ce21e5c7111f32f16774" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/rust/commit/2d18054569d1169bfae7ce21e=
5c7111f32f16774</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/rust/co=
mmit/e2159107f6ebc615ba6a92960d65528baf90cd35" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/rust/commit/e2159107f6ebc615ba6a92960=
d65528baf90cd35</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/rust/co=
mmit/283a60b64339d611b76a4ed2f9286f417b269b2f" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/rust/commit/283a60b64339d611b76a4ed2f=
9286f417b269b2f</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/rust/co=
mmit/61d9ba28a99f073fbeb19dbb552ddf343aef62f0" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/rust/commit/61d9ba28a99f073fbeb19dbb5=
52ddf343aef62f0</a>]<br>
+<br>
+Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathar=
ajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a=
>&gt;<br>
+<br>
+diff --git a/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp b/compiler/r=
ustc_llvm/llvm-wrapper/PassWrapper.cpp<br>
+index fe5b8edce4a..e4807f10805 100644<br>
+--- a/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp<br>
++++ b/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp<br>
+@@ -49,6 +49,9 @@<br>
+ #include &quot;llvm/Transforms/Instrumentation/RealtimeSanitizer.h&quot;<=
br>
+ #include &quot;llvm/Transforms/Instrumentation/ThreadSanitizer.h&quot;<br=
>
+ #include &quot;llvm/Transforms/Scalar/AnnotationRemarks.h&quot;<br>
++#if LLVM_VERSION_GE(23, 0)<br>
++#include &quot;llvm/Transforms/Utils/AssignGUID.h&quot;<br>
++#endif<br>
+ #include &quot;llvm/Transforms/Utils/CanonicalizeAliases.h&quot;<br>
+ #include &quot;llvm/Transforms/Utils/FunctionImportUtils.h&quot;<br>
+ #include &quot;llvm/Transforms/Utils/NameAnonGlobals.h&quot;<br>
+@@ -925,6 +928,9 @@<br>
+=C2=A0 =C2=A0if (NeedThinLTOBufferPasses) {<br>
+=C2=A0 =C2=A0 =C2=A0MPM.addPass(CanonicalizeAliasesPass());<br>
+=C2=A0 =C2=A0 =C2=A0MPM.addPass(NameAnonGlobalPass());<br>
++#if LLVM_VERSION_GE(23, 0)<br>
++=C2=A0 =C2=A0 MPM.addPass(AssignGUIDPass());<br>
++#endif<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0// For `-Copt-level=3D0`, and the pre-link fat/thin LTO stage=
s.<br>
+=C2=A0 =C2=A0if (ThinLTOBufferRef &amp;&amp; *ThinLTOBufferRef =3D=3D null=
ptr) {<br>
+@@ -1464,6 +1470,9 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PB.registerLoopAnalyses(LAM);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PB.crossRegisterProxies(LAM, FAM, CGAM, =
MAM);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ModulePassManager MPM;<br>
++#if LLVM_VERSION_GE(23, 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 MPM.addPass(AssignGUIDPass());<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MPM.addPass(ThinLTOBitcodeWriterPass(OS,=
 nullptr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MPM.run(*unwrap(M), MAM);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+diff --git a/tests/codegen-llvm/bpf-allows-unaligned.rs b/tests/codegen-ll=
vm/bpf-allows-unaligned.rs<br>
+index c7a70d5b2e5..7e95a56d984 100644<br>
+--- a/tests/codegen-llvm/bpf-allows-unaligned.rs<br>
++++ b/tests/codegen-llvm/bpf-allows-unaligned.rs<br>
+@@ -5,7 +5,7 @@<br>
+ <br>
+ #[no_mangle]<br>
+ #[target_feature(enable =3D &quot;allows-misaligned-mem-access&quot;)]<br=
>
+-// CHECK: define noundef zeroext i8 @foo(i8 noundef returned %arg) unname=
d_addr #0 {<br>
++// CHECK: define noundef zeroext i8 @foo(i8 noundef returned %arg) unname=
d_addr #0<br>
+ pub unsafe fn foo(arg: u8) -&gt; u8 {<br>
+=C2=A0 =C2=A0 =C2=A0arg<br>
+ }<br>
+diff --git a/tests/codegen-llvm/branch-protection.rs b/tests/codegen-llvm/=
branch-protection.rs<br>
+index ed1cb2cd137..11847c256d6 100644<br>
+--- a/tests/codegen-llvm/branch-protection.rs<br>
++++ b/tests/codegen-llvm/branch-protection.rs<br>
+@@ -22,7 +22,7 @@<br>
+ use minicore::*;<br>
+ <br>
+ // A basic test function.<br>
+-// CHECK: @test(){{.*}} [[ATTR:#[0-9]+]] {<br>
++// CHECK: @test(){{.*}} [[ATTR:#[0-9]+]]<br>
+ #[no_mangle]<br>
+ pub fn test() {}<br>
+ <br>
+diff --git a/tests/codegen-llvm/frame-pointer-cli-control.rs b/tests/codeg=
en-llvm/frame-pointer-cli-control.rs<br>
+index 911a5f03cbc..79cdfc70f1a 100644<br>
+--- a/tests/codegen-llvm/frame-pointer-cli-control.rs<br>
++++ b/tests/codegen-llvm/frame-pointer-cli-control.rs<br>
+@@ -45,7 +45,7 @@<br>
+ <br>
+ extern crate minicore;<br>
+ <br>
+-// CHECK: i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]] {<br>
++// CHECK: i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]]<br>
+ #[no_mangle]<br>
+ pub fn peach(x: u32) -&gt; u32 {<br>
+=C2=A0 =C2=A0 =C2=A0x<br>
+diff --git a/tests/codegen-llvm/frame-pointer.rs b/tests/codegen-llvm/fram=
e-pointer.rs<br>
+index 1d0dd762826..a52d95a2386 100644<br>
+--- a/tests/codegen-llvm/frame-pointer.rs<br>
++++ b/tests/codegen-llvm/frame-pointer.rs<br>
+@@ -18,7 +18,7 @@<br>
+ extern crate minicore;<br>
+ use minicore::*;<br>
+ <br>
+-// CHECK: define i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]] {<br>
++// CHECK: define i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]]<br>
+ #[no_mangle]<br>
+ pub fn peach(x: u32) -&gt; u32 {<br>
+=C2=A0 =C2=A0 =C2=A0x<br>
+diff --git a/tests/codegen-llvm/gpu-convergent.rs b/tests/codegen-llvm/gpu=
-convergent.rs<br>
+index bb9271ab699..376d65a3d4a 100644<br>
+--- a/tests/codegen-llvm/gpu-convergent.rs<br>
++++ b/tests/codegen-llvm/gpu-convergent.rs<br>
+@@ -17,7 +17,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0fn ext();<br>
+ }<br>
+ <br>
+-// CHECK: define {{.*}}_kernel void @fun(i32{{.*}}) unnamed_addr #[[ATTR:=
[0-9]+]] {<br>
++// CHECK: define {{.*}}_kernel void @fun(i32{{.*}}) unnamed_addr #[[ATTR:=
[0-9]+]]<br>
+ // CHECK: declare void @ext() unnamed_addr #[[ATTR]]<br>
+ // CHECK: attributes #[[ATTR]] =3D {{.*}} convergent<br>
+ #[no_mangle]<br>
+diff --git a/tests/codegen-llvm/instrument-coverage/testprog.rs b/tests/co=
degen-llvm/instrument-coverage/testprog.rs<br>
+index ef61ede6de8..67c49c438f9 100644<br>
+--- a/tests/codegen-llvm/instrument-coverage/testprog.rs<br>
++++ b/tests/codegen-llvm/instrument-coverage/testprog.rs<br>
+@@ -101,7 +101,7 @@ fn main() {<br>
+ // CHECK-SAME:=C2=A0 =C2=A0@__llvm_prf_nm<br>
+ // CHECK-SAME:=C2=A0 =C2=A0section &quot;llvm.metadata&quot;<br>
+ <br>
+-// CHECK:=C2=A0 =C2=A0 =C2=A0 =C2=A0 define internal { {{.*}} } @_R{{[a-z=
A-Z0-9_]+}}testprog14will_be_called() unnamed_addr #{{[0-9]+}} {<br>
++// CHECK:=C2=A0 =C2=A0 =C2=A0 =C2=A0 define internal { {{.*}} } @_R{{[a-z=
A-Z0-9_]+}}testprog14will_be_called() unnamed_addr #{{[0-9]+}}<br>
+ // CHECK-NEXT:=C2=A0 =C2=A0start:<br>
+ // CHECK-NOT:=C2=A0 =C2=A0 define internal<br>
+ // CHECK:=C2=A0 =C2=A0 =C2=A0 =C2=A0 atomicrmw add ptr<br>
+@@ -109,7 +109,7 @@ fn main() {<br>
+ <br>
+ // CHECK:=C2=A0 =C2=A0 =C2=A0 =C2=A0 declare void @llvm.instrprof.increme=
nt(ptr, i64, i32, i32) #[[LLVM_INSTRPROF_INCREMENT_ATTR:[0-9]+]]<br>
+ <br>
+-// WIN:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 define linkonce_odr hidden i32 =
@__llvm_profile_runtime_user() #[[LLVM_PROFILE_RUNTIME_USER_ATTR:[0-9]+]] c=
omdat {{.*}}{<br>
++// WIN:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 define linkonce_odr hidden i32 =
@__llvm_profile_runtime_user() #[[LLVM_PROFILE_RUNTIME_USER_ATTR:[0-9]+]] c=
omdat {{.*}}<br>
+ // WIN-NEXT:=C2=A0 =C2=A0 =C2=A0%1 =3D load i32, ptr @__llvm_profile_runt=
ime<br>
+ // WIN-NEXT:=C2=A0 =C2=A0 =C2=A0ret i32 %1<br>
+ // WIN-NEXT:=C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/tests/codegen-llvm/link_section.rs b/tests/codegen-llvm/link_=
section.rs<br>
+index f196ea86c44..61bde683c0a 100644<br>
+--- a/tests/codegen-llvm/link_section.rs<br>
++++ b/tests/codegen-llvm/link_section.rs<br>
+@@ -29,7 +29,7 @@ pub enum E {<br>
+ #[link_section =3D &quot;__TEST,three&quot;]<br>
+ pub static VAR3: E =3D E::B(1.);<br>
+ <br>
+-// CHECK: define {{(dso_local )?}}void @fn1() {{.*}} section &quot;__TEST=
,four&quot; {<br>
++// CHECK: define {{(dso_local )?}}void @fn1() {{.*}} section &quot;__TEST=
,four&quot;<br>
+ #[no_mangle]<br>
+ #[link_section =3D &quot;__TEST,four&quot;]<br>
+ pub fn fn1() {}<br>
+diff --git a/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-c=
xx-abi-normalized-generalized.rs b/tests/codegen-llvm/sanitizer/cfi/emit-ty=
pe-metadata-itanium-cxx-abi-normalized-generalized.rs<br>
+index 7639ce7b104..5b1aa97ab33 100644<br>
+--- a/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-=
normalized-generalized.rs<br>
++++ b/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-=
normalized-generalized.rs<br>
+@@ -7,21 +7,21 @@<br>
+ <br>
+ pub fn foo(f: fn(i32) -&gt; i32, arg: i32) -&gt; i32 {<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-LABEL: define{{.*}}foo<br>
+-=C2=A0 =C2=A0 // CHECK-SAME:=C2=A0 {{.*}}![[TYPE1:[0-9]+]]<br>
++=C2=A0 =C2=A0 // CHECK-SAME:=C2=A0 {{.*}}!type ![[TYPE1:[0-9]+]]<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK:=C2=A0 =C2=A0 =C2=A0 =C2=A0call i1 @llvm.type=
.test(ptr {{%f|%0}}, metadata !&quot;_ZTSFu3i32S_E.normalized.generalized&q=
uot;)<br>
+=C2=A0 =C2=A0 =C2=A0f(arg)<br>
+ }<br>
+ <br>
+ pub fn bar(f: fn(i32, i32) -&gt; i32, arg1: i32, arg2: i32) -&gt; i32 {<b=
r>
+=C2=A0 =C2=A0 =C2=A0// CHECK-LABEL: define{{.*}}bar<br>
+-=C2=A0 =C2=A0 // CHECK-SAME:=C2=A0 {{.*}}![[TYPE2:[0-9]+]]<br>
++=C2=A0 =C2=A0 // CHECK-SAME:=C2=A0 {{.*}}!type ![[TYPE2:[0-9]+]]<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK:=C2=A0 =C2=A0 =C2=A0 =C2=A0call i1 @llvm.type=
.test(ptr {{%f|%0}}, metadata !&quot;_ZTSFu3i32S_S_E.normalized.generalized=
&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0f(arg1, arg2)<br>
+ }<br>
+ <br>
+ pub fn baz(f: fn(i32, i32, i32) -&gt; i32, arg1: i32, arg2: i32, arg3: i3=
2) -&gt; i32 {<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-LABEL: define{{.*}}baz<br>
+-=C2=A0 =C2=A0 // CHECK-SAME:=C2=A0 {{.*}}![[TYPE3:[0-9]+]]<br>
++=C2=A0 =C2=A0 // CHECK-SAME:=C2=A0 {{.*}}!type ![[TYPE3:[0-9]+]]<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK:=C2=A0 =C2=A0 =C2=A0 =C2=A0call i1 @llvm.type=
.test(ptr {{%f|%0}}, metadata !&quot;_ZTSFu3i32S_S_S_E.normalized.generaliz=
ed&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0f(arg1, arg2, arg3)<br>
+ }<br>
+diff --git a/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs =
b/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs<br>
+index 35317b0dd39..3df2d569f9a 100644<br>
+--- a/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs<br>
++++ b/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs<br>
+@@ -72,7 +72,7 @@ pub unsafe fn some_non_zero_from_atomic_get() -&gt; Opti=
on&lt;NonZeroUsize&gt; {<br>
+ ///<br>
+ /// The way we check that the LLVM IR is correct is by making sure that n=
either<br>
+ /// `panic` nor `unreachable` is part of the LLVM IR:<br>
+-// CHECK-LABEL: define {{.*}} i64 @some_non_zero_from_atomic_get2() {{.*}=
} {<br>
++// CHECK-LABEL: define {{.*}} i64 @some_non_zero_from_atomic_get2() {{.*}=
}<br>
+ // CHECK-NOT: panic<br>
+ // CHECK-NOT: unreachable<br>
+ #[no_mangle]<br>
+diff --git a/tests/codegen-llvm/target-feature-negative-implication.rs b/t=
ests/codegen-llvm/target-feature-negative-implication.rs<br>
+index a9cdca42839..376599738e5 100644<br>
+--- a/tests/codegen-llvm/target-feature-negative-implication.rs<br>
++++ b/tests/codegen-llvm/target-feature-negative-implication.rs<br>
+@@ -13,7 +13,7 @@<br>
+ #[no_mangle]<br>
+ pub unsafe fn banana() {<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-LABEL: @banana()<br>
+-=C2=A0 =C2=A0 // CHECK-SAME: [[BANANAATTRS:#[0-9]+]] {<br>
++=C2=A0 =C2=A0 // CHECK-SAME: [[BANANAATTRS:#[0-9]+]]<br>
+ }<br>
+ <br>
+ // CHECK: attributes [[BANANAATTRS]]<br>
+diff --git a/tests/codegen-llvm/target-feature-overrides.rs b/tests/codege=
n-llvm/target-feature-overrides.rs<br>
+index 2adc8ee6f53..3bf05c7977e 100644<br>
+--- a/tests/codegen-llvm/target-feature-overrides.rs<br>
++++ b/tests/codegen-llvm/target-feature-overrides.rs<br>
+@@ -23,7 +23,7 @@<br>
+ #[no_mangle]<br>
+ pub unsafe fn apple() -&gt; u32 {<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-LABEL: @apple()<br>
+-=C2=A0 =C2=A0 // CHECK-SAME: [[APPLEATTRS:#[0-9]+]] {<br>
++=C2=A0 =C2=A0 // CHECK-SAME: [[APPLEATTRS:#[0-9]+]]<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK: {{.*}}call{{.*}}@peach<br>
+=C2=A0 =C2=A0 =C2=A0peach()<br>
+ }<br>
+@@ -32,7 +32,7 @@ pub unsafe fn apple() -&gt; u32 {<br>
+ #[no_mangle]<br>
+ pub unsafe fn banana() -&gt; u32 {<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-LABEL: @banana()<br>
+-=C2=A0 =C2=A0 // CHECK-SAME: [[BANANAATTRS:#[0-9]+]] {<br>
++=C2=A0 =C2=A0 // CHECK-SAME: [[BANANAATTRS:#[0-9]+]]<br>
+=C2=A0 =C2=A0 =C2=A0// COMPAT: {{.*}}call{{.*}}@peach<br>
+=C2=A0 =C2=A0 =C2=A0// INCOMPAT: {{.*}}call{{.*}}@apple<br>
+=C2=A0 =C2=A0 =C2=A0apple() // Compatible for inline in COMPAT revision an=
d can&#39;t be inlined in INCOMPAT<br>
+diff --git a/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs b/tests/co=
degen-llvm/unwind-abis/aapcs-unwind-abi.rs<br>
+index ecace722e0d..279780e3a7a 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs<br>
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}<br>
+ // `aapcs-unwind` extern functions. `aapcs-unwind` functions MUST NOT hav=
e this attribute. We<br>
+ // disable optimizations above to prevent LLVM from inferring the attribu=
te.<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;aapcs&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;aapcs-unwind&quot; fn rust_item_that_can_unwind() {}<br>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs b/tests/codege=
n-llvm/unwind-abis/c-unwind-abi.rs<br>
+index 46c08b5fc4f..1b3312839e3 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs<br>
+@@ -7,11 +7,11 @@<br>
+ <br>
+ #![crate_type =3D &quot;lib&quot;]<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;C&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;C-unwind&quot; fn rust_item_that_can_unwind() {}<br>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs b/tests/co=
degen-llvm/unwind-abis/cdecl-unwind-abi.rs<br>
+index 8e643d6ce49..6f4eafb353c 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs<br>
+@@ -7,11 +7,11 @@<br>
+ <br>
+ #![crate_type =3D &quot;lib&quot;]<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;cdecl&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;cdecl-unwind&quot; fn rust_item_that_can_unwind() {}<br>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs b/tests=
/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs<br>
+index 7df46813ed1..51c6fd15b9c 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs<br>
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}<br>
+ // `fastcall-unwind` extern functions. `fastcall-unwind` functions MUST N=
OT have this attribute. We<br>
+ // disable optimizations above to prevent LLVM from inferring the attribu=
te.<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;fastcall&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;fastcall-unwind&quot; fn rust_item_that_can_unwind() {}<=
br>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs b/tests/=
codegen-llvm/unwind-abis/stdcall-unwind-abi.rs<br>
+index cc06ee12549..b5fcea52b4d 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs<br>
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}<br>
+ // extern functions. `stdcall-unwind` functions MUST NOT have this attrib=
ute. We disable<br>
+ // optimizations above to prevent LLVM from inferring the attribute.<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;stdcall&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;stdcall-unwind&quot; fn rust_item_that_can_unwind() {}<b=
r>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs b/tests/c=
odegen-llvm/unwind-abis/system-unwind-abi.rs<br>
+index 5f910248346..15fce95fe28 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs<br>
+@@ -7,11 +7,11 @@<br>
+ <br>
+ #![crate_type =3D &quot;lib&quot;]<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;system&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;system-unwind&quot; fn rust_item_that_can_unwind() {}<br=
>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs b/tests/c=
odegen-llvm/unwind-abis/sysv64-unwind-abi.rs<br>
+index 69bfaf80b4b..1293e7c0a5f 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs<br>
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}<br>
+ // `sysv64-unwind` extern functions. `sysv64-unwind` functions MUST NOT h=
ave this attribute. We<br>
+ // disable optimizations above to prevent LLVM from inferring the attribu=
te.<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;sysv64&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;sysv64-unwind&quot; fn rust_item_that_can_unwind() {}<br=
>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs b/tests=
/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs<br>
+index 05f6b8b70e1..a9b6c34ee58 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs<br>
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}<br>
+ // `thiscall-unwind` extern functions. `thiscall-unwind` functions MUST N=
OT have this attribute. We<br>
+ // disable optimizations above to prevent LLVM from inferring the attribu=
te.<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;thiscall&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;thiscall-unwind&quot; fn rust_item_that_can_unwind() {}<=
br>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs b/tes=
ts/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs<br>
+index d001a16b32a..8cedb55ae1d 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs<br>
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}<br>
+ // `vectorcall-unwind` extern functions. `vectorcall-unwind` functions MU=
ST NOT have this attribute.<br>
+ // We disable optimizations above to prevent LLVM from inferring the attr=
ibute.<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;vectorcall&quot; fn rust_item_that_cannot_unwind() {}<br=
>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;vectorcall-unwind&quot; fn rust_item_that_can_unwind() {=
}<br>
+ <br>
+diff --git a/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs b/tests/co=
degen-llvm/unwind-abis/win64-unwind-abi.rs<br>
+index 257f00b54e4..2a3ad330406 100644<br>
+--- a/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs<br>
++++ b/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs<br>
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}<br>
+ // `win64-unwind` extern functions. `win64-unwind` functions MUST NOT hav=
e this attribute. We<br>
+ // disable optimizations above to prevent LLVM from inferring the attribu=
te.<br>
+ <br>
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {<br>
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0<br>
+ #[no_mangle]<br>
+ pub extern &quot;win64&quot; fn rust_item_that_cannot_unwind() {}<br>
+ <br>
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {<br>
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1<br>
+ #[no_mangle]<br>
+ pub extern &quot;win64-unwind&quot; fn rust_item_that_can_unwind() {}<br>
+ <br>
+diff --git a/tests/assembly-llvm/slice-is_ascii.rs b/tests/assembly-llvm/s=
lice-is_ascii.rs<br>
+index e53cd5160cf..6d660e78147 100644<br>
+--- a/tests/assembly-llvm/slice-is_ascii.rs<br>
++++ b/tests/assembly-llvm/slice-is_ascii.rs<br>
+@@ -6,6 +6,11 @@<br>
+ //@ only-x86_64<br>
+ //@ ignore-sgx<br>
+<br>
++// No longer optimizes as desired, tracked at:<br>
++// <a href=3D"https://github.com/rust-lang/rust/issues/154141" rel=3D"nor=
eferrer" target=3D"_blank">
https://github.com/rust-lang/rust/issues/154141</a><br>
++// <a href=3D"https://github.com/llvm/llvm-project/issues/209216" rel=3D"=
noreferrer" target=3D"_blank">
https://github.com/llvm/llvm-project/issues/209216</a><br>
++//@ max-llvm-major-version: 22<br>
++<br>
+ #![feature(str_internals)]<br>
+<br>
+ // CHECK-LABEL: is_ascii_simple_demo:<br>
+diff --git a/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs b/tests/ass=
embly-llvm/simd-intrinsic-mask-reduce.rs<br>
+index 40d16886c6d..d3698fda5fe 100644<br>
+--- a/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs<br>
++++ b/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs<br>
+@@ -1,12 +1,16 @@<br>
+ // verify that simd mask reductions do not introduce additional bit shift=
 operations<br>
+ //@ add-minicore<br>
+-//@ revisions: x86 aarch64<br>
++//@ revisions: x86 aarch64-llvm22 aarch64<br>
+ //@ [x86] compile-flags: --target=3Dx86_64-unknown-linux-gnu -C llvm-args=
=3D-x86-asm-syntax=3Dintel<br>
+ // Set the base cpu explicitly, in case the default has been changed.<br>
+ //@ [x86] compile-flags: -C target-cpu=3Dx86-64<br>
+ //@ [x86] needs-llvm-components: x86<br>
++//@ [aarch64-llvm22] compile-flags: --target=3Daarch64-unknown-linux-gnu<=
br>
++//@ [aarch64-llvm22] needs-llvm-components: aarch64<br>
++//@ [aarch64-llvm22] max-llvm-major-version: 22<br>
+ //@ [aarch64] compile-flags: --target=3Daarch64-unknown-linux-gnu<br>
+ //@ [aarch64] needs-llvm-components: aarch64<br>
++//@ [aarch64] min-llvm-version: 23<br>
+ //@ assembly-output: emit-asm<br>
+ //@ compile-flags: --crate-type=3Dlib -Copt-level=3D3 -C panic=3Dabort<br=
>
+<br>
+@@ -33,12 +37,19 @@<br>
+=C2=A0 =C2=A0 =C2=A0// x86-NEXT: {{cmp ax, -1|cmp eax, 65535|xor eax, 6553=
5}}<br>
+=C2=A0 =C2=A0 =C2=A0// x86-NEXT: sete al<br>
+=C2=A0 =C2=A0 =C2=A0//<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-NOT: shl<br>
++=C2=A0 =C2=A0 // aarch64-llvm22: cmge v0.16b, v0.16b, #0<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-DAG: mov [[REG1:[a-z0-9]+]], #1<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-DAG: umaxv b0, v0.16b<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-NEXT: fmov [[REG2:[a-z0-9]+]], s0<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-NEXT: bic w0, [[REG1]], [[REG2]]<br>
++=C2=A0 =C2=A0 //<br>
+=C2=A0 =C2=A0 =C2=A0// aarch64-NOT: shl<br>
+=C2=A0 =C2=A0 =C2=A0// aarch64: cmge v0.16b, v0.16b, #0<br>
+-=C2=A0 =C2=A0 // aarch64-DAG: mov [[REG1:[a-z0-9]+]], #1<br>
+-=C2=A0 =C2=A0 // aarch64-DAG: umaxv b0, v0.16b<br>
+-=C2=A0 =C2=A0 // aarch64-NEXT: fmov [[REG2:[a-z0-9]+]], s0<br>
+-=C2=A0 =C2=A0 // aarch64-NEXT: bic w0, [[REG1]], [[REG2]]<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: addp [[REG1:d[0-9]+]], v0.2d<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: fmov [[REG2:x[0-9]+]], [[REG1]]<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: cmp [[REG2]], #0<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: cset w0, eq<br>
+=C2=A0 =C2=A0 =C2=A0simd_reduce_all(m)<br>
+ }<br>
+<br>
+@@ -50,10 +61,17 @@<br>
+=C2=A0 =C2=A0 =C2=A0// x86-NEXT: test eax, eax<br>
+=C2=A0 =C2=A0 =C2=A0// x86-NEXT: setne al<br>
+=C2=A0 =C2=A0 =C2=A0//<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-NOT: shl<br>
++=C2=A0 =C2=A0 // aarch64-llvm22: cmlt v0.16b, v0.16b, #0<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-NEXT: umaxv b0, v0.16b<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-NEXT: fmov [[REG:[a-z0-9]+]], s0<br>
++=C2=A0 =C2=A0 // aarch64-llvm22-NEXT: and w0, [[REG]], #0x1<br>
++=C2=A0 =C2=A0 //<br>
+=C2=A0 =C2=A0 =C2=A0// aarch64-NOT: shl<br>
+=C2=A0 =C2=A0 =C2=A0// aarch64: cmlt v0.16b, v0.16b, #0<br>
+-=C2=A0 =C2=A0 // aarch64-NEXT: umaxv b0, v0.16b<br>
+-=C2=A0 =C2=A0 // aarch64-NEXT: fmov [[REG:[a-z0-9]+]], s0<br>
+-=C2=A0 =C2=A0 // aarch64-NEXT: and w0, [[REG]], #0x1<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: addp [[REG1:d[0-9]+]], v0.2d<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: fmov [[REG2:x[0-9]+]], [[REG1]]<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: cmp [[REG2]], #0<br>
++=C2=A0 =C2=A0 // aarch64-NEXT: cset w0, ne<br>
+=C2=A0 =C2=A0 =C2=A0simd_reduce_any(m)<br>
+ }<br>
+diff --git a/tests/codegen-llvm/asm/global_asm.rs b/tests/codegen-llvm/asm=
/global_asm.rs<br>
+index 32075daa3cf..8c1c4a3b588 100644<br>
+--- a/tests/codegen-llvm/asm/global_asm.rs<br>
++++ b/tests/codegen-llvm/asm/global_asm.rs<br>
+@@ -7,10 +7,10 @@<br>
+<br>
+ use std::arch::global_asm;<br>
+<br>
+-// CHECK-LABEL: foo<br>
+ // CHECK: module asm<br>
++// CHECK-LABEL: foo<br>
+ // this regex will capture the correct unconditional branch inst.<br>
+-// CHECK: module asm &quot;{{[[:space:]]+}}jmp baz&quot;<br>
++// CHECK: &quot;{{[[:space:]]+}}jmp baz&quot;<br>
+ global_asm!(<br>
+=C2=A0 =C2=A0 =C2=A0r#&quot;<br>
+=C2=A0 =C2=A0 =C2=A0.global foo<br>
+diff --git a/tests/codegen-llvm/asm/global_asm_include.rs b/tests/codegen-=
llvm/asm/global_asm_include.rs<br>
+index 98be9c3e333..cad9901336b 100644<br>
+--- a/tests/codegen-llvm/asm/global_asm_include.rs<br>
++++ b/tests/codegen-llvm/asm/global_asm_include.rs<br>
+@@ -7,9 +7,9 @@<br>
+<br>
+ use std::arch::global_asm;<br>
+<br>
+-// CHECK-LABEL: foo<br>
+ // CHECK: module asm<br>
+-// CHECK: module asm &quot;{{[[:space:]]+}}jmp baz&quot;<br>
++// CHECK-LABEL: foo<br>
++// CHECK: &quot;{{[[:space:]]+}}jmp baz&quot;<br>
+ global_asm!(include_str!(&quot;foo.s&quot;));<br>
+<br>
+ extern &quot;C&quot; {<br>
+diff --git a/tests/codegen-llvm/asm/global_asm_x2.rs b/tests/codegen-llvm/=
asm/global_asm_x2.rs<br>
+index 9e3a00f0680..8c6f38289de 100644<br>
+--- a/tests/codegen-llvm/asm/global_asm_x2.rs<br>
++++ b/tests/codegen-llvm/asm/global_asm_x2.rs<br>
+@@ -8,12 +8,12 @@<br>
+<br>
+ use core::arch::global_asm;<br>
+<br>
+-// CHECK-LABEL: foo<br>
+ // CHECK: module asm<br>
+-// CHECK: module asm &quot;{{[[:space:]]+}}jmp baz&quot;<br>
++// CHECK-LABEL: foo<br>
++// CHECK: &quot;{{[[:space:]]+}}jmp baz&quot;<br>
+ // any other global_asm will be appended to this first block, so:<br>
+ // CHECK-LABEL: bar<br>
+-// CHECK: module asm &quot;{{[[:space:]]+}}jmp quux&quot;<br>
++// CHECK: &quot;{{[[:space:]]+}}jmp quux&quot;<br>
+ global_asm!(<br>
+=C2=A0 =C2=A0 =C2=A0r#&quot;<br>
+=C2=A0 =C2=A0 =C2=A0.global foo<br>
+diff --git a/tests/codegen-llvm/array-cmp.rs b/tests/codegen-llvm/array-cm=
p.rs<br>
+index 0106b9c15c1..5b0a802f409 100644<br>
+--- a/tests/codegen-llvm/array-cmp.rs<br>
++++ b/tests/codegen-llvm/array-cmp.rs<br>
+@@ -2,6 +2,9 @@<br>
+<br>
+ //@ compile-flags: -C opt-level=3D2<br>
+ //@ needs-deterministic-layouts (checks depend on tuple layout)<br>
++//@ revisions: LLVM22 LLVM23<br>
++//@ [LLVM22] max-llvm-major-version: 22<br>
++//@ [LLVM23] min-llvm-version: 23<br>
+<br>
+ #![crate_type =3D &quot;lib&quot;]<br>
+<br>
+@@ -66,7 +69,8 @@ pub fn compare() -&gt; bool {<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-NEXT: br i1 %[[EQ01]], label %{{.+}}, label %=
[[EXIT_U]]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK: [[DONE]]:<br>
+-=C2=A0 =C2=A0 // CHECK: %[[RET:.+]] =3D phi i1 [ %{{.+}}, %[[EXIT_S]] ], =
[ %{{.+}}, %[[EXIT_U]] ], [ true, %[[L11]] ]<br>
++=C2=A0 =C2=A0 // LLVM22: %[[RET:.+]] =3D phi i1 [ %{{.+}}, %[[EXIT_S]] ],=
 [ %{{.+}}, %[[EXIT_U]] ], [ true, %[[L11]] ]<br>
++=C2=A0 =C2=A0 // LLVM23: %[[RET:.+]] =3D phi i1 [ %{{.+}}, %[[EXIT_U]] ],=
 [ %{{.+}}, %[[EXIT_S]] ], [ true, %[[L11]] ]<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK: ret i1 %[[RET]]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0a &lt;=3D b<br>
+diff --git a/tests/codegen-llvm/enum/enum-match.rs b/tests/codegen-llvm/en=
um/enum-match.rs<br>
+index 6d8b97328f8..a0cba452e12 100644<br>
+--- a/tests/codegen-llvm/enum/enum-match.rs<br>
++++ b/tests/codegen-llvm/enum/enum-match.rs<br>
+@@ -1,5 +1,8 @@<br>
+ //@ compile-flags: -Copt-level=3D1<br>
+ //@ only-64bit<br>
++//@ revisions: LLVM22 LLVM23<br>
++//@ [LLVM22] max-llvm-major-version: 22<br>
++//@ [LLVM23] min-llvm-version: 23<br>
+<br>
+ #![crate_type =3D &quot;lib&quot;]<br>
+ #![feature(core_intrinsics)]<br>
+@@ -18,8 +21,9 @@ pub enum Enum0 {<br>
+ // CHECK-LABEL: define{{( dso_local)?}} noundef{{( range\(i8 [0-9]+, [0-9=
]+\))?}} i8 @match0(i8{{.+}}%0)<br>
+ // CHECK-NEXT: start:<br>
+ // CHECK-NEXT: %[[IS_B:.+]] =3D icmp eq i8 %0, 2<br>
+-// CHECK-NEXT: %[[TRUNC:.+]] =3D and i8 %0, 1<br>
+-// CHECK-NEXT: %[[R:.+]] =3D select i1 %[[IS_B]], i8 13, i8 %[[TRUNC]]<br=
>
++// LLVM22-NEXT: %[[TRUNC:.+]] =3D and i8 %0, 1<br>
++// LLVM22-NEXT: %[[R:.+]] =3D select i1 %[[IS_B]], i8 13, i8 %[[TRUNC]]<b=
r>
++// LLVM23-NEXT: %[[R:.+]] =3D select i1 %[[IS_B]], i8 13, i8 %0<br>
+ // CHECK-NEXT: ret i8 %[[R]]<br>
+ #[no_mangle]<br>
+ pub fn match0(e: Enum0) -&gt; u8 {<br>
+diff --git a/tests/assembly-llvm/simd-bitmask.rs b/tests/assembly-llvm/sim=
d-bitmask.rs<br>
+index 98f63c165f3..e8bb335c5b0 100644<br>
+--- a/tests/assembly-llvm/simd-bitmask.rs<br>
++++ b/tests/assembly-llvm/simd-bitmask.rs<br>
+@@ -11,7 +11,7 @@<br>
+ //@ [aarch64] min-llvm-version: 23<br>
+ //@ [aarch64] compile-flags: --target=3Daarch64-unknown-linux-gnu<br>
+ //@ [aarch64] needs-llvm-components: aarch64<br>
+-//@ [aarch64-llvm-pre-23] ignore-llvm-version: 23 - 99<br>
++//@ [aarch64-llvm-pre-23] max-llvm-major-version: 22<br>
+ //@ [aarch64-llvm-pre-23] compile-flags: --target=3Daarch64-unknown-linux=
-gnu<br>
+ //@ [aarch64-llvm-pre-23] needs-llvm-components: aarch64<br>
+ //@ assembly-output: emit-asm<br>
+diff --git a/tests/codegen-llvm/array-equality.rs b/tests/codegen-llvm/arr=
ay-equality.rs<br>
+index 706caebdcb6..c0f716b6067 100644<br>
+--- a/tests/codegen-llvm/array-equality.rs<br>
++++ b/tests/codegen-llvm/array-equality.rs<br>
+@@ -1,5 +1,5 @@<br>
+ //@ revisions: llvm-current llvm-next<br>
+-//@[llvm-current] ignore-llvm-version: 23-99<br>
++//@[llvm-current] max-llvm-major-version: 22<br>
+ //@[llvm-next] min-llvm-version: 23<br>
+ //@ compile-flags: -Copt-level=3D3 -Z merge-functions=3Ddisabled<br>
+ //@ only-x86_64<br>
+diff --git a/tests/ui/explicit-tail-calls/support/bystack.rs b/tests/ui/ex=
plicit-tail-calls/support/bystack.rs<br>
+index ddd9c79f5c7..c89ad194f8b 100644<br>
+--- a/tests/ui/explicit-tail-calls/support/bystack.rs<br>
++++ b/tests/ui/explicit-tail-calls/support/bystack.rs<br>
+@@ -36,11 +36,11 @@<br>
+ //@ revisions: loongarch32<br>
+ //@[loongarch32] compile-flags: --target loongarch32-unknown-none<br>
+ //@[loongarch32] needs-llvm-components: loongarch<br>
+-//@[loongarch32] ignore-llvm-version: 22 - 23<br>
++//@[loongarch32] max-llvm-major-version: 21<br>
+ //@ revisions: loongarch64<br>
+ //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu<br=
>
+ //@[loongarch64] needs-llvm-components: loongarch<br>
+-//@[loongarch64] ignore-llvm-version: 22 - 23<br>
++//@[loongarch64] max-llvm-major-version: 21<br>
+ //@ revisions: bpf<br>
+ //@[bpf] compile-flags: --target bpfeb-unknown-none<br>
+ //@[bpf] needs-llvm-components: bpf<br>
+diff --git a/tests/ui/explicit-tail-calls/support/byval.rs b/tests/ui/expl=
icit-tail-calls/support/byval.rs<br>
+index f451a953f2a..e6f26b9292e 100644<br>
+--- a/tests/ui/explicit-tail-calls/support/byval.rs<br>
++++ b/tests/ui/explicit-tail-calls/support/byval.rs<br>
+@@ -36,11 +36,11 @@<br>
+ //@ revisions: loongarch32<br>
+ //@[loongarch32] compile-flags: --target loongarch32-unknown-none<br>
+ //@[loongarch32] needs-llvm-components: loongarch<br>
+-//@[loongarch32] ignore-llvm-version: 22 - 23<br>
++//@[loongarch32] max-llvm-major-version: 21<br>
+ //@ revisions: loongarch64<br>
+ //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu<br=
>
+ //@[loongarch64] needs-llvm-components: loongarch<br>
+-//@[loongarch64] ignore-llvm-version: 22 - 23<br>
++//@[loongarch64] max-llvm-major-version: 21<br>
+ //@ revisions: bpf<br>
+ //@[bpf] compile-flags: --target bpfeb-unknown-none<br>
+ //@[bpf] needs-llvm-components: bpf<br>
+diff --git a/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs b/=
tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs<br>
+index 5834255f3d3..c3090a20e4d 100644<br>
+--- a/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs<br>
++++ b/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs<br>
+@@ -14,7 +14,6 @@ pub unsafe fn foo(x: &amp;mut Copied&lt;Iter&lt;&#39;_, =
u32&gt;&gt;) -&gt; u32 {<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-NOT: br {{.*}}<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK-NOT: select<br>
+=C2=A0 =C2=A0 =C2=A0// CHECK: [[RET:%.*]] =3D load i32, ptr<br>
+-=C2=A0 =C2=A0 // CHECK-NEXT: assume<br>
+-=C2=A0 =C2=A0 // CHECK-NEXT: ret i32 [[RET]]<br>
++=C2=A0 =C2=A0 // CHECK: ret i32 [[RET]]<br>
+=C2=A0 =C2=A0 =C2=A0x.next().unwrap_unchecked()<br>
+ }<br>
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc<br>
index dd3e89a097..d87271b29c 100644<br>
--- a/meta/recipes-devtools/rust/rust-source.inc<br>
+++ b/meta/recipes-devtools/rust/rust-source.inc<br>
@@ -7,6 +7,7 @@ SRC_URI +=3D &quot;<a href=3D"https://static.rust-lang.org/=
dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n=
</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://0001-src-core-bui=
ld_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=3D$</a>{RUSTSRC} \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://0002-Fix-rust-bui=
ld-failure-with-unstable-options.patch;patchdir=3D$</a>{RUSTSRC} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://0003-bootstrap-sk=
ip-StdarchVerify-when-remote-testing.patch;patchdir=3D$</a>{RUSTSRC} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>
file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=
=3D$</a>{RUSTSRC} \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[rust.sha256sum] =3D &quot;271fa73d8174f53d713c46a8310da7bf7cf=
dcfb8b7cfd1c2b74b84a83ae9fb1e&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote>
</div>
</div>
<br>
<fieldset></fieldset>
<pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#244695): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/244695" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/244695</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120998122/896=
8818" target=3D"_blank">https://lists.openembedded.org/mt/120998122/8968818=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:SunilKumar.Dora@windriver.com" target=3D"_bla=
nk">SunilKumar.Dora@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
</blockquote>
<p><br>
</p>
</div>

</blockquote></div></div>

--00000000000093713d065a89caf5--

