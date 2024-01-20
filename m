Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CE9C47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 08:49:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.18349.1705740587011862833
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jan 2024 00:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cl7Da+nV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33924df7245so473159f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 00:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705740585; x=1706345385; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WHIsAtU6yZ3t4CXrv5mFSL45BTF6/H42gQc2GpPQ7G4=;
        b=cl7Da+nVOyiA/lka+PP2rQ0MuKsC1uZ3/zk3jsC41hX+dkx5W5pxLppkaW3SF6VqB4
         PoTjk3skoQrezzQZWG1AyQF3hoz6UGjF5I+kMHZswlXmtwGWZlXzv74S0C8XHvtnZes2
         ziHTwEwp6ukIKf9t9AVoDjUtFToF1khHePbuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705740585; x=1706345385;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHIsAtU6yZ3t4CXrv5mFSL45BTF6/H42gQc2GpPQ7G4=;
        b=gPh4OkOzmUsaVGrZkH4LjW5Q5Po9tMvrOp/FwJMOMUnA59D0QjgvRrKZR4zFtj5E9c
         gJjuBz+oSpzoqJu1EubaCt1G7j5pNx4gwAKWm3mI5XAVagnNRBJMIwHuAnjC8FV5G8GY
         V6S3sN26YJkimOGg9XrX0VaT98WjjjJDC6+5Jfpb0eoloyWW9Hkzp+inywZ8NIka0B2x
         9t2lPxGnnz9aWObodvtnKIN8fQXMwJWQUx8Gz5CE/Xo8rZhYB1MAKmU28UDGtKE05rba
         5JZvMnVnwM/JN3YJRVcdiRUYY8DCMVjHsQIO3lcucG4MUPog190kgVZelykmIQUdjLFP
         rA5w==
X-Gm-Message-State: AOJu0YyLNY8o4WtcwNa/LlVnUn/w0scu9x4YfIWHK7yR0Lr4PNkEquNF
	kjW97ZwavThbjh1Lg+Do7TqBiIZq/wckryc1Enblo6lW0slDskHUiSrakeQm9W4=
X-Google-Smtp-Source: AGHT+IEYInoOKhO4GNrUlCur0hvTghmdDtH+G3GwW/O38dL26+NDDczRReHsxyHhz5SAeNfTPKOF5g==
X-Received: by 2002:a5d:5f8c:0:b0:337:c6b6:fe5f with SMTP id dr12-20020a5d5f8c000000b00337c6b6fe5fmr623405wrb.94.1705740584809;
        Sat, 20 Jan 2024 00:49:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a61:f8ad:d942:3289? ([2001:8b0:aba:5f3c:4a61:f8ad:d942:3289])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d530f000000b003391720fa51sm3431072wrv.60.2024.01.20.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 00:49:44 -0800 (PST)
Message-ID: <15cc528bef581b15f6010f22999640a6320509b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/5] rust: Fetch cargo from rust-snapshot
 dir.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com
Date: Sat, 20 Jan 2024 08:49:43 +0000
In-Reply-To: <17AC01A476481111.16230@lists.openembedded.org>
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
	 <17AC01A476481111.16230@lists.openembedded.org>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 08:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194082

On Sat, 2024-01-20 at 08:42 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2024-01-19 at 07:09 -0800, Shinde, Yash via
> lists.openembedded.org wrote:
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >=20
> > Fixes: Exception: no cargo executable found at
> >        `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin=
/cargo`
> >=20
> > Fix the cargo binary path error on oe-selftest and path set to rust-sna=
pshot dir.
> >=20
> > Patch sent to upstream- https://github.com/rust-lang/rust/pull/120125
> >=20
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > ---
> >  .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
>=20
> The series failed on mips in testing:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/1196/s=
teps/12/logs/stdio
>=20
> Sadly the error redirection is to a file and even in the failed build,
> we do not have that file as far as I can see so it is hard to know what
> went wrong.

I was able to find the file:

https://autobuilder.yocto.io/pub/failed-builds-data/summary.txt

(buildbot-venv) [pokybuild@rocky9-ty-1 build-st-1051644]$ cp ./tmp/work/mip=
s32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/summary.txt /srv/autobuilder/=
autobuilder.yocto.io/pub/failed-builds-data/

---- [ui] tests/ui/issues/issue-32805.rs stdout ----

error: test run failed!
status: exit status: 101
command: RUST_TEST_THREADS=3D"56" "/home/pokybuild/yocto-worker/qemumips-tc=
/build/build-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74=
.1-src/build/x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test-client" =
"run" "0" "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/=
tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkn=
own-linux-gnu/test/ui/issues/issue-32805/a"
--- stdout -------------------------------
uploaded "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/t=
mp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkno=
wn-linux-gnu/test/ui/issues/issue-32805/a", waiting for result
------------------------------------------
--- stderr -------------------------------
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/issues/issue-32805.rs:9:5:
assertion `left =3D=3D right` failed
  left: "9007199000000000"
 right: "9007200000000000"
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
------------------------------------------


---- [ui] tests/ui/numbers-arithmetic/i128.rs stdout ----

error: test run failed!
status: exit status: 101
command: RUST_TEST_THREADS=3D"56" "/home/pokybuild/yocto-worker/qemumips-tc=
/build/build-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74=
.1-src/build/x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test-client" =
"run" "0" "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/=
tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkn=
own-linux-gnu/test/ui/numbers-arithmetic/i128/a"
--- stdout -------------------------------
uploaded "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/t=
mp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkno=
wn-linux-gnu/test/ui/numbers-arithmetic/i128/a", waiting for result
------------------------------------------
--- stderr -------------------------------
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/numbers-arithmetic/i128.rs:77:5:
assertion `left =3D=3D right` failed
  left: "-147573952589676412928"
 right: "-147573966419676412928"
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
------------------------------------------


---- [ui] tests/ui/numbers-arithmetic/saturating-float-casts.rs stdout ----

error: test run failed!
status: exit status: 101
command: RUST_TEST_THREADS=3D"56" "/home/pokybuild/yocto-worker/qemumips-tc=
/build/build-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74=
.1-src/build/x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test-client" =
"run" "0" "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/=
tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkn=
own-linux-gnu/test/ui/numbers-arithmetic/saturating-float-casts/a"
--- stdout -------------------------------
uploaded "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/t=
mp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkno=
wn-linux-gnu/test/ui/numbers-arithmetic/saturating-float-casts/a", waiting =
for result
------------------------------------------
--- stderr -------------------------------
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/numbers-arithmetic/saturating-float-casts-impl.rs:306:5:
assertion `left =3D=3D right` failed
  left: 9223372034707291136
 right: 9223372036854774784
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
------------------------------------------


---- [ui] tests/ui/runtime/backtrace-debuginfo.rs stdout ----

error: test run failed!
status: exit status: 101
command: RUST_TEST_THREADS=3D"56" "/home/pokybuild/yocto-worker/qemumips-tc=
/build/build-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74=
.1-src/build/x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test-client" =
"run" "0" "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/=
tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkn=
own-linux-gnu/test/ui/runtime/backtrace-debuginfo/a"
--- stdout -------------------------------
uploaded "/home/pokybuild/yocto-worker/qemumips-tc/build/build-st-1051644/t=
mp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unkno=
wn-linux-gnu/test/ui/runtime/backtrace-debuginfo/a", waiting for result
---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184"]

--- stdout
backtrace-debuginfo.rs:120
backtrace-debuginfo.rs:184

--- stderr
test case 0
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:81:5:
explicit panic
stack backtrace:
   0: 0x77cd3ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77d4e0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77c82d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77cd3800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77cada60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77cad60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77caed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x555e4924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x555e42dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x555e4858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x555f6bf0 - backtrace_debuginfo::inner::h5b01f04da66e8433
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:81:5
  11: 0x555f76e8 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:120:5
  12: 0x555f90b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  13: 0x555e5724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  14: 0x555e4314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  15: 0x555e43ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  16: 0x77cae4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  17: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  18: 0x77cae2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  19: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  20: 0x77c6bcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  21: 0x555e4390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  22: 0x555f9184 - main
  23: 0x779f4fe4 - <unknown>
  24: 0x779f5120 - __libc_start_main
  25: 0x555e2200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184"]

--- stdout
backtrace-debuginfo.rs:120
backtrace-debuginfo.rs:184

--- stderr
test case 1
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:82:5:
explicit panic
stack backtrace:
   0: 0x77cd3ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77d4e0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77c82d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77cd3800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77cada60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77cad60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77caed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55604924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x556042dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55604858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x55616d44 - backtrace_debuginfo::inner::h5b01f04da66e8433
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:82:5
  11: 0x556176e8 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:120:5
  12: 0x556190b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  13: 0x55605724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  14: 0x55604314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  15: 0x556043ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  16: 0x77cae4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  17: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  18: 0x77cae2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  19: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  20: 0x77c6bcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  21: 0x55604390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  22: 0x55619184 - main
  23: 0x779f4fe4 - <unknown>
  24: 0x779f5120 - __libc_start_main
  25: 0x55602200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184"]

--- stdout
backtrace-debuginfo-aux.rs:6
backtrace-debuginfo.rs:83
backtrace-debuginfo.rs:120
backtrace-debuginfo.rs:184

--- stderr
test case 2
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:84:9:
explicit panic
stack backtrace:
   0: 0x77d23ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77d9e0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77cd2d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77d23800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77cfda60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77cfd60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77cfed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55594924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x555942dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55594858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x555a701c - backtrace_debuginfo::inner::{{closure}}::hd7243845f0587c=
af
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:84:9
  11: 0x555a684c - backtrace_debuginfo::aux::callback::he17da27d625d76ab
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo-aux.rs:6:5
  12: 0x555a6d9c - backtrace_debuginfo::inner::h5b01f04da66e8433
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:83:29
  13: 0x555a76e8 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:120:5
  14: 0x555a90b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  15: 0x55595724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  16: 0x55594314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  17: 0x555943ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  18: 0x77cfe4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  19: 0x77d00e8c - __rust_try.llvm.18295924575204975277
  20: 0x77cfe2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  21: 0x77d00e8c - __rust_try.llvm.18295924575204975277
  22: 0x77cbbcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  23: 0x55594390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  24: 0x555a9184 - main
  25: 0x77a44fe4 - <unknown>
  26: 0x77a45120 - __libc_start_main
  27: 0x55592200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184", "backtrace-debuginfo.rs:1=
20", "backtrace-debuginfo.rs:86", "backtrace-debuginfo-aux.rs:13"]

--- stdout
backtrace-debuginfo-aux.rs:13
backtrace-debuginfo.rs:86
backtrace-debuginfo.rs:120
backtrace-debuginfo.rs:184

--- stderr
test case 3
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:87:9:
explicit panic
stack backtrace:
   0: 0x77d33ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77dae0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77ce2d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77d33800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77d0da60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77d0d60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77d0ed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x555a4924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x555a42dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x555a4858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x555b7218 - backtrace_debuginfo::inner::{{closure}}::h3f1727189fdeb2=
ac
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:87:9
  11: 0x555b6e2c - backtrace_debuginfo::aux::callback_inlined::h06cdd336843=
b84bf
  12: 0x555b6e2c - backtrace_debuginfo::inner::h5b01f04da66e8433
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:86:29
  13: 0x555b76e8 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:120:5
  14: 0x555b90b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  15: 0x555a5724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  16: 0x555a4314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  17: 0x555a43ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  18: 0x77d0e4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  19: 0x77d10e8c - __rust_try.llvm.18295924575204975277
  20: 0x77d0e2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  21: 0x77d10e8c - __rust_try.llvm.18295924575204975277
  22: 0x77ccbcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  23: 0x555a4390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  24: 0x555b9184 - main
  25: 0x77a54fe4 - <unknown>
  26: 0x77a55120 - __libc_start_main
  27: 0x555a2200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184"]

--- stdout
backtrace-debuginfo.rs:121
backtrace-debuginfo.rs:184

--- stderr
test case 4
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:95:5:
explicit panic
stack backtrace:
   0: 0x77d23ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77d9e0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77cd2d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77d23800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77cfda60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77cfd60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77cfed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55594924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x555942dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55594858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x555a77f0 - backtrace_debuginfo::inner_inlined::h55411b2de0d92a78
  11: 0x555a77f0 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:121:5
  12: 0x555a90b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  13: 0x55595724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  14: 0x55594314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  15: 0x555943ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  16: 0x77cfe4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  17: 0x77d00e8c - __rust_try.llvm.18295924575204975277
  18: 0x77cfe2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  19: 0x77d00e8c - __rust_try.llvm.18295924575204975277
  20: 0x77cbbcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  21: 0x55594390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  22: 0x555a9184 - main
  23: 0x77a44fe4 - <unknown>
  24: 0x77a45120 - __libc_start_main
  25: 0x55592200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184"]

--- stdout
backtrace-debuginfo.rs:121
backtrace-debuginfo.rs:184

--- stderr
test case 5
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:96:5:
explicit panic
stack backtrace:
   0: 0x77d63ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77dde0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77d12d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77d63800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77d3da60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77d3d60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77d3ed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55624924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x556242dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55624858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x55637914 - backtrace_debuginfo::inner_inlined::h55411b2de0d92a78
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:1:5
  11: 0x55637914 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:121:5
  12: 0x556390b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  13: 0x55625724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  14: 0x55624314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  15: 0x556243ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  16: 0x77d3e4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  17: 0x77d40e8c - __rust_try.llvm.18295924575204975277
  18: 0x77d3e2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  19: 0x77d40e8c - __rust_try.llvm.18295924575204975277
  20: 0x77cfbcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  21: 0x55624390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  22: 0x55639184 - main
  23: 0x77a84fe4 - <unknown>
  24: 0x77a85120 - __libc_start_main
  25: 0x55622200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184"]

--- stdout
backtrace-debuginfo.rs:104
backtrace-debuginfo.rs:121
backtrace-debuginfo.rs:184

--- stderr
test case 6
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:102:9:
explicit panic
stack backtrace:
   0: 0x77cc3ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77d3e0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77c72d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77cc3800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77c9da60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77c9d60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77c9ed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55634924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x556342dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55634858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x55647a8c - backtrace_debuginfo::inner_inlined::inner_further_inline=
d::h4fdfd57c7edbf831
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:7:9
  11: 0x55647a8c - backtrace_debuginfo::inner_inlined::h55411b2de0d92a78
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:104:5
  12: 0x55647a8c - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:121:5
  13: 0x556490b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  14: 0x55635724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  15: 0x55634314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  16: 0x556343ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  17: 0x77c9e4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  18: 0x77ca0e8c - __rust_try.llvm.18295924575204975277
  19: 0x77c9e2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  20: 0x77ca0e8c - __rust_try.llvm.18295924575204975277
  21: 0x77c5bcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  22: 0x55634390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  23: 0x55649184 - main
  24: 0x779e4fe4 - <unknown>
  25: 0x779e5120 - __libc_start_main
  26: 0x55632200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184", "backtrace-debuginfo.rs:1=
21", "backtrace-debuginfo.rs:106"]

--- stdout
backtrace-debuginfo-aux.rs:6
backtrace-debuginfo.rs:106
backtrace-debuginfo.rs:121
backtrace-debuginfo.rs:184

--- stderr
test case 7
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:107:9:
explicit panic
stack backtrace:
   0: 0x77cd3ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77d4e0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77c82d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77cd3800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77cada60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77cad60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77caed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55634924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x556342dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55634858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x55647414 - backtrace_debuginfo::inner_inlined::{{closure}}::hd6497c=
9cceb9b086
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:107:9
  11: 0x556467c0 - backtrace_debuginfo::aux::callback::h6768a2f4a4c9de81
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo-aux.rs:6:5
  12: 0x55647b44 - backtrace_debuginfo::inner_inlined::h55411b2de0d92a78
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:11:29
  13: 0x55647b44 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:121:5
  14: 0x556490b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  15: 0x55635724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  16: 0x55634314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  17: 0x556343ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  18: 0x77cae4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  19: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  20: 0x77cae2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  21: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  22: 0x77c6bcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  23: 0x55634390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  24: 0x55649184 - main
  25: 0x779f4fe4 - <unknown>
  26: 0x779f5120 - __libc_start_main
  27: 0x55632200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184", "backtrace-debuginfo.rs:1=
21", "backtrace-debuginfo.rs:109", "backtrace-debuginfo-aux.rs:13"]

--- stdout
backtrace-debuginfo-aux.rs:13
backtrace-debuginfo.rs:109
backtrace-debuginfo.rs:121
backtrace-debuginfo.rs:184

--- stderr
test case 8
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:110:9:
explicit panic
stack backtrace:
   0: 0x77d33ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77dae0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77ce2d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77d33800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77d0da60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77d0d60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77d0ed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55624924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x556242dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55624858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x55637610 - backtrace_debuginfo::inner_inlined::{{closure}}::h455636=
82bb90bb96
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:110:9
  11: 0x55637bd4 - backtrace_debuginfo::aux::callback_inlined::h99af8f3c81a=
5476e
  12: 0x55637bd4 - backtrace_debuginfo::inner_inlined::h55411b2de0d92a78
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:109:29
  13: 0x55637bd4 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:121:5
  14: 0x556390b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  15: 0x55625724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  16: 0x55624314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  17: 0x556243ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  18: 0x77d0e4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  19: 0x77d10e8c - __rust_try.llvm.18295924575204975277
  20: 0x77d0e2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  21: 0x77d10e8c - __rust_try.llvm.18295924575204975277
  22: 0x77ccbcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  23: 0x55624390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  24: 0x55639184 - main
  25: 0x77a54fe4 - <unknown>
  26: 0x77a55120 - __libc_start_main
  27: 0x55622200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110

---------------------------------------
trace does not match position list
still need to find ["backtrace-debuginfo.rs:184"]

--- stdout
backtrace-debuginfo.rs:115
backtrace-debuginfo.rs:121
backtrace-debuginfo.rs:184

--- stderr
test case 9
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:102:9:
explicit panic
stack backtrace:
   0: 0x77cd3ae0 - <std::sys_common::backtrace::_print::DisplayBacktrace as=
 core::fmt::Display>::fmt::h6898032c3197bba5
   1: 0x77d4e0e4 - core::fmt::write::hf6bcb3d48b015242
   2: 0x77c82d54 - std::io::Write::write_fmt::hffe3e31c2861b5df
   3: 0x77cd3800 - std::sys_common::backtrace::print::h491eee5f314a6d3e
   4: 0x77cada60 - std::panicking::default_hook::{{closure}}::h3f9aca89bfc7=
d815
   5: 0x77cad60c - std::panicking::default_hook::h10484dd96d8a78c1
   6: 0x77caed38 - std::panicking::rust_panic_with_hook::h86181dc20368b5d6
   7: 0x55594924 - std::panicking::begin_panic::{{closure}}::hd81347ec628d3=
ce5
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:6=
39:9
   8: 0x555942dc - std::sys_common::backtrace::__rust_end_short_backtrace::=
hb942b2283d335406
                       at /rustc/FAKE_PREFIX/library/std/src/sys_common/bac=
ktrace.rs:170:18
   9: 0x55594858 - std::panicking::begin_panic::h80500b64f44d7de8
                       at /rustc/FAKE_PREFIX/library/std/src/panicking.rs:5=
50:12
  10: 0x555a7ce8 - backtrace_debuginfo::inner_inlined::inner_further_inline=
d::h4fdfd57c7edbf831
  11: 0x555a7ce8 - backtrace_debuginfo::inner_inlined::h55411b2de0d92a78
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:115:5
  12: 0x555a7ce8 - backtrace_debuginfo::outer::hb144f59b805e2ef5
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:121:5
  13: 0x555a90b8 - backtrace_debuginfo::main::h7f1d9bc6ac819adb
                       at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:92:9
  14: 0x55595724 - core::ops::function::FnOnce::call_once::h16f2dc3c14904d2=
2
                       at /rustc/FAKE_PREFIX/library/core/src/ops/function.=
rs:250:5
  15: 0x55594314 - std::sys_common::backtrace::__rust_begin_short_backtrace=
::hd19d7735b8befc66
  16: 0x555943ec - std::rt::lang_start::{{closure}}::h151e66a657c26aab
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:166:18
  17: 0x77cae4dc - std::panicking::try::do_call::hd0c2b6472aa643bd
  18: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  19: 0x77cae2c4 - std::panicking::try::do_call::hbdd1fae3cce0762a
  20: 0x77cb0e8c - __rust_try.llvm.18295924575204975277
  21: 0x77c6bcc8 - std::rt::lang_start_internal::hb3baca0999cfc254
  22: 0x55594390 - std::rt::lang_start::hfc18ff07c79696d1
                       at /rustc/FAKE_PREFIX/library/std/src/rt.rs:165:17
  23: 0x555a9184 - main
  24: 0x779f4fe4 - <unknown>
  25: 0x779f5120 - __libc_start_main
  26: 0x55592200 - <unknown>
                       at /usr/src/debug/glibc/2.38+git/csu/../sysdeps/mips=
/start.S:110
------------------------------------------
--- stderr -------------------------------
thread 'main' panicked at /home/pokybuild/yocto-worker/qemumips-tc/build/bu=
ild-st-1051644/tmp/work/mips32r2-poky-linux/rust/1.74.1/rustc-1.74.1-src/te=
sts/ui/runtime/backtrace-debuginfo.rs:174:9:
found some errors
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
------------------------------------------



failures:
    [ui] tests/ui/issues/issue-32805.rs
    [ui] tests/ui/numbers-arithmetic/i128.rs
    [ui] tests/ui/numbers-arithmetic/saturating-float-casts.rs
    [ui] tests/ui/runtime/backtrace-debuginfo.rs

test result: FAILED. 15246 passed; 4 failed; 291 ignored; 0 measured; 21 fi=
ltered out; finished in 693.24s

Some tests failed in compiletest suite=3Dui mode=3Dui host=3Dx86_64-unknown=
-linux-gnu target=3Dmips-poky-linux-gnu
Testing stage1 compiletest suite=3Drun-pass-valgrind mode=3Drun-pass-valgri=
nd (x86_64-unknown-linux-gnu -> mips-poky-linux-gnu)

Cheers,

Richard

