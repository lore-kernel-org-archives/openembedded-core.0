Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53466EB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 10:27:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.31275.1691404057709867026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 03:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IW5DxEKU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAC2B1BF209;
	Mon,  7 Aug 2023 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691404055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXlV4SKxoSWJCTciIuGwsLOgfm8jbf3pF7bVosp7kqw=;
	b=IW5DxEKU5Qh4zcu8/S1Sf8WAI9gsBDALZB0Ea54FY5AgFA8FPZqUzCB/Tt93bsocCXbBQ6
	6uSbmEejtLMyXSJuiCaQ9FdkV+vULMzlBDpNgw2jGJoigEoSpjpFkIzv5lZHWEBqMA8Xs1
	dZHSzUKcbQD5wUTNcnmWKKG2MnJ0iYdmomfwodN/KMbF5MoOMru3+G6j5NA3HwO7ymq4+o
	cpm+OplhXofp5eO3K/UA7Z35StXzNDGDC8EB1JJ1N1jyH5rw5uF6MwM3FFdCaJgzenVVB6
	w+X4VjPk6G5rWeT7ry1XrCRIoC1ICkUgLosQWBCmSOHd6mbfEVnPIv+8LJVxdQ==
Date: Mon, 7 Aug 2023 12:27:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: fix target_features for
 vfpv3d16
Message-ID: <20230807102734f5b9517d@mail.local>
References: <20230802-rust-vfpv3d16-v1-1-9af645a4b407@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230802-rust-vfpv3d16-v1-1-9af645a4b407@skidata.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 10:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185592

Hello,

This causes failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/151/builds/304/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/301/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/306/step=
s/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/299/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/301/step=
s/13/logs/stdio

2023-08-04 17:28:45,215 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2023-08-04 17:28:45,215 - oe-selftest - INFO - FAIL: rust.RustSelfTestSyste=
mEmulated.test_rust (subunit.RemotedTestCase)
2023-08-04 17:28:45,215 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2023-08-04 17:28:45,215 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemumips-tc/build/meta/lib/oeqa/selfte=
st/cases/rust.py", line 293, in test_rust
    runCmd(cmd)
  File "/home/pokybuild/yocto-worker/qemumips-tc/build/meta/lib/oeqa/utils/=
commands.py", line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command ' export PATH=3D/home/pokybuild/yocto-worker/qemumi=
ps-tc/build/build-st-3391980/tmp/work/mips32r2-poky-linux/rust/1.70.0-r0/re=
cipe-sysroot-native/usr/bin:$PATH; export TARGET_VENDOR=3D"-poky"; export P=
ATH=3D/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-3391980/tmp/w=
ork/mips32r2-poky-linux/rust/1.70.0-r0/recipe-sysroot-native/usr/bin/mips-p=
oky-linux:/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-3391980/t=
mp/hosttools:$PATH; export RUST_TARGET_PATH=3D/home/pokybuild/yocto-worker/=
qemumips-tc/build/build-st-3391980/tmp/work/mips32r2-poky-linux/rust/1.70.0=
-r0/rust-targets; export TEST_DEVICE_ADDR=3D"192.168.7.2:12345"; cd /home/p=
okybuild/yocto-worker/qemumips-tc/build/build-st-3391980/tmp/work/mips32r2-=
poky-linux/rust/1.70.0-r0/rustc-1.70.0-src; python3 src/bootstrap/bootstrap=
=2Epy test  --exclude compiler/rustc  --exclude compiler/rustc_interface/sr=
c/tests.rs  --exclude library/panic_abort  --exclude library/panic_unwind  =
--exclude library/test/src/stats/tests.rs  --exclude src/bootstrap/builder/=
tests.rs  --exclude src/doc/rustc  --exclude src/doc/rustdoc  --exclude src=
/doc/unstable-book  --exclude src/librustdoc  --exclude src/rustdoc-json-ty=
pes  --exclude src/tools/compiletest/src/common.rs  --exclude src/tools/lin=
t-docs  --exclude src/tools/rust-analyzer  --exclude src/tools/rustdoc-them=
es  --exclude src/tools/tidy  --exclude tests/assembly/asm/aarch64-outline-=
atomics.rs  --exclude tests/codegen/abi-main-signature-32bit-c-int.rs  --ex=
clude tests/codegen/abi-repr-ext.rs  --exclude tests/codegen/abi-x86-interr=
upt.rs  --exclude tests/codegen/branch-protection.rs  --exclude tests/codeg=
en/catch-unwind.rs  --exclude tests/codegen/cf-protection.rs  --exclude tes=
ts/codegen/enum-bounds-check-derived-idx.rs  --exclude tests/codegen/force-=
unwind-tables.rs  --exclude tests/codegen/intrinsic-no-unnamed-attr.rs  --e=
xclude tests/codegen/issues/issue-103840.rs  --exclude tests/codegen/issues=
/issue-47278.rs  --exclude tests/codegen/issues/issue-73827-bounds-check-in=
dex-in-subexpr.rs  --exclude tests/codegen/lifetime_start_end.rs  --exclude=
 tests/codegen/local-generics-in-exe-internalized.rs  --exclude tests/codeg=
en/match-unoptimized.rs  --exclude tests/codegen/noalias-rwlockreadguard.rs=
  --exclude tests/codegen/non-terminate/nonempty-infinite-loop.rs  --exclud=
e tests/codegen/noreturn-uninhabited.rs  --exclude tests/codegen/repr-trans=
parent-aggregates-3.rs  --exclude tests/codegen/sse42-implies-crc32.rs  --e=
xclude tests/codegen/thread-local.rs  --exclude tests/codegen/uninit-consts=
=2Ers  --exclude tests/pretty/raw-str-nonexpr.rs  --exclude tests/run-make =
 --exclude tests/run-make/cdylib-fewer-symbols/foo.rs  --exclude tests/run-=
make/doctests-keep-binaries/t.rs  --exclude tests/run-make-fulldeps  --excl=
ude tests/run-make/issue-22131/foo.rs  --exclude tests/run-make/issue-36710=
/Makefile  --exclude tests/run-make/issue-47551  --exclude tests/run-make/p=
go-branch-weights  --exclude tests/run-make/pgo-gen  --exclude tests/run-ma=
ke/pgo-gen-lto  --exclude tests/run-make/pgo-indirect-call-promotion  --exc=
lude tests/run-make/pgo-use  --exclude tests/run-make/pointer-auth-link-wit=
h-c/Makefile  --exclude tests/run-make/profile  --exclude tests/run-make/st=
atic-pie  --exclude tests/run-make/sysroot-crates-are-unstable  --exclude t=
ests/run-make/target-specs  --exclude tests/rustdoc  --exclude tests/rustdo=
c/async-move-doctest.rs  --exclude tests/rustdoc/async-trait.rs  --exclude =
tests/rustdoc/auto-traits.rs  --exclude tests/rustdoc/check-source-code-url=
s-to-def.rs  --exclude tests/rustdoc/comment-in-doctest.rs  --exclude tests=
/rustdoc/const-generics/const-generics-docs.rs  --exclude tests/rustdoc/cro=
ss-crate-hidden-assoc-trait-items.rs  --exclude tests/rustdoc/cross-crate-h=
idden-impl-parameter.rs  --exclude tests/rustdoc/cross-crate-links.rs  --ex=
clude tests/rustdoc/cross-crate-primitive-doc.rs  --exclude tests/rustdoc/d=
octest-manual-crate-name.rs  --exclude tests/rustdoc/edition-doctest.rs  --=
exclude tests/rustdoc/edition-flag.rs  --exclude tests/rustdoc/elided-lifet=
ime.rs  --exclude tests/rustdoc/external-macro-src.rs  --ex
stdoc-ui/nocapture.rs  --exclude tests/rustdoc-ui/no-run-flag.rs  --exclude=
 tests/rustdoc-ui/run-directory.rs  --exclude tests/rustdoc-ui/test-no_std.=
rs  --exclude tests/rustdoc-ui/test-type.rs  --exclude tests/rustdoc/unit-r=
eturn.rs  --exclude tests/ui/abi/stack-probes-lto.rs  --exclude tests/ui/ab=
i/stack-probes.rs  --exclude tests/ui/array-slice-vec/subslice-patterns-con=
st-eval-match.rs  --exclude tests/ui/asm/x86_64/sym.rs  --exclude tests/ui/=
associated-type-bounds/fn-apit.rs  --exclude tests/ui/associated-type-bound=
s/fn-dyn-apit.rs  --exclude tests/ui/associated-type-bounds/fn-wrap-apit.rs=
  --exclude tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.r=
s  --exclude tests/ui/drop/dynamic-drop.rs  --exclude tests/ui/empty_global=
_asm.rs  --exclude tests/ui-fulldeps/deriving-encodable-decodable-box.rs  -=
-exclude tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs  --=
exclude tests/ui-fulldeps/deriving-global.rs  --exclude tests/ui-fulldeps/d=
eriving-hygiene.rs  --exclude tests/ui-fulldeps/dropck_tarena_sound_drop.rs=
  --exclude tests/ui-fulldeps/empty-struct-braces-derive.rs  --exclude test=
s/ui-fulldeps/internal-lints/bad_opt_access.rs  --exclude tests/ui-fulldeps=
/internal-lints/bad_opt_access.stderr  --exclude tests/ui-fulldeps/internal=
-lints/default_hash_types.rs  --exclude tests/ui-fulldeps/internal-lints/di=
agnostics.rs  --exclude tests/ui-fulldeps/internal-lints/lint_pass_impl_wit=
hout_macro.rs  --exclude tests/ui-fulldeps/internal-lints/qualified_ty_ty_c=
txt.rs  --exclude tests/ui-fulldeps/internal-lints/query_stability.rs  --ex=
clude tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs  --exclude te=
sts/ui-fulldeps/internal-lints/ty_tykind_usage.rs  --exclude tests/ui-fulld=
eps/issue-14021.rs  --exclude tests/ui-fulldeps/lint-group-denied-lint-allo=
wed.rs  --exclude tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs =
 --exclude tests/ui-fulldeps/lint-pass-macros.rs  --exclude tests/ui-fullde=
ps/regions-mock-tcx.rs  --exclude tests/ui-fulldeps/rustc_encodable_hygiene=
=2Ers  --exclude tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.r=
s  --exclude tests/ui/functions-closures/fn-help-with-err.rs  --exclude tes=
ts/ui/linkage-attr/issue-10755.rs  --exclude tests/ui/macros/restricted-sha=
dowing-legacy.rs  --exclude tests/ui/process/nofile-limit.rs  --exclude tes=
ts/ui/process/process-panic-after-fork.rs  --exclude tests/ui/process/proce=
ss-sigpipe.rs  --exclude tests/ui/simd/target-feature-mixup.rs  --exclude t=
ests/ui/structs-enums/multiple-reprs.rs --doc --no-fail-fast --bless --targ=
et mips-poky-linux-gnu > summary.txt 2>&1;' returned non-zero exit status 1:


On 02/08/2023 22:07:54+0200, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
>=20
> A build with vfpv3d16 (armv7at2hf-vfpv3d16) tune currently warns:
> '+d16' is not a recognized feature for this target (ignoring feature)
>=20
> This correlates with the supported target_features for arm[1].
>=20
> With the now enabled features, rustc might use vdiv.f64 with register
> d17, which leads to an illegal instruction on the given platform.
>=20
> Therefore, adapt the features s.t. they correspond to the
> armv7_unknown_linux_gnueabihf target[2].
>=20
> [1] https://github.com/rust-lang/rust/blob/1.70.0/compiler/rustc_codegen_=
ssa/src/target_features.rs#L32
> [2] https://github.com/rust-lang/rust/blob/1.70.0/compiler/rustc_target/s=
rc/spec/armv7_unknown_linux_gnueabihf.rs#L15
>=20
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index 21a56ede3e..7d3965ed2e 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -19,18 +19,22 @@ def llvm_features_from_tune(d):
>      mach_overrides =3D d.getVar('MACHINEOVERRIDES')
>      mach_overrides =3D frozenset(mach_overrides.split(':'))
> =20
> +    if target_is_armv7(d):
> +        f.append('+v7')
> +
>      if 'vfpv4' in feat:
>          f.append("+vfp4")
> -    if 'vfpv3' in feat:
> +    if 'vfpv3' in feat or 'vfpv3d16' in feat:
>          f.append("+vfp3")
> -    if 'vfpv3d16' in feat:
> -        f.append("+d16")
> -
>      if 'vfpv2' in feat or 'vfp' in feat:
>          f.append("+vfp2")
> +    if 'vfpv3d16' in feat:
> +        f.append("-d32")
> =20
>      if 'neon' in feat:
>          f.append("+neon")
> +    else:
> +        f.append("-neon")
> =20
>      if 'mips32' in feat:
>          f.append("+mips32")
> @@ -38,9 +42,6 @@ def llvm_features_from_tune(d):
>      if 'mips32r2' in feat:
>          f.append("+mips32r2")
> =20
> -    if target_is_armv7(d):
> -        f.append('+v7')
> -
>      if ('armv6' in mach_overrides) or ('armv6' in feat):
>          f.append("+v6")
>      if 'armv5te' in feat:
>=20
> ---
> base-commit: b2594471209fafd45ea907371b5bd26df95ab2ac
> change-id: 20230801-rust-vfpv3d16-a65080a9bcfa
>=20
> Best regards,
> --=20
> Benjamin Bara <benjamin.bara@skidata.com>
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185433): https://lists.openembedded.org/g/openembedde=
d-core/message/185433
> Mute This Topic: https://lists.openembedded.org/mt/100513507/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

