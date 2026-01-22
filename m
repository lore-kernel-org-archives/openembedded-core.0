Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60721D46977
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:33:41 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42750.1769103214210471940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 09:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaeTxZFX;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fba1a1b1eso23952537b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:33:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769103213; cv=none;
        d=google.com; s=arc-20240605;
        b=U7e8nx+6hgUsIpkmy0o48N2id4lYecxLbSYdGJ/yvNYJx8cwdU7JgMNUwFT3tXjxzd
         I6cNO1EpspSR+F1OU0U7yzv9VO2hjw7Ioxx9NoyeaJXEt067FepvIUuSFRmydXrp51Xx
         Yal23rj5OqhuZjRMz8B3fwAq7P1YJkluqELbpK0oHUcjxKHwgAiT1u12uLiURf/Ddujp
         KITE+VK1Ro26A/96LG9n1yu7G7Yc1ktM+mdhN0WKysUxtkUxrrwtEi7LFH/F13sGddH2
         /6I4iHSb4kvTEV85okgE5oz6cjEEm0McnPvMqp7oEXEhS8Cer/9AnMoerUJAeEwwxQmm
         gYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KifYfpH1Uw22pKIMjbBq11crhRt7hPmZITG2kebN/cI=;
        fh=xF2rDKmivvGXOlLIVZ4xTB6sb9jRdeJ8SBFxItH1jOA=;
        b=IhfOgyiZoH2OolfrLueJPjJD+njGq+HsVjZNYpyIsLw6oi1i7FKbT3ggTG8rJ4IQSL
         oK+0s44tkljWMnaSGbmJN0mGgQbnW7NPvrQfTajxtwF8HXP90/pmor+VTtXLg5xt2JlX
         O+zRbuLwuTGrjrtFSZNXx6rdMgzqw6H0s0ewdZQPnRiQBCnEq4vfWt+DU4gcebXUuFeC
         5H4S/Kc4Q2n1TWN0GNkzmITWdrPjlJBOsxTw7++D5/XuvqwVBfgvtJ14Zs06mpuIZfx8
         jdrtUCcgwdrW8SdJUY35jiOP6823MYz+yx+SqHthP9dfBw2As86W/9iMcSUwWUq4wm4g
         WhtA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769103213; x=1769708013; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KifYfpH1Uw22pKIMjbBq11crhRt7hPmZITG2kebN/cI=;
        b=IaeTxZFXn5mHJptSk6ALqtLX515T4ukOP2BJ3Jd6m1EbspFyM1lrM8gAFhF/MHATKX
         bGV18UVz3B5JUVXztuqIpye4nXi1D/GXmqGCHeIBpc4zZ3QhGWHZU2/lN+A55Mz1mbVd
         zSeFR0zr9gYwseMIs+E2ToHAZJt4wxCjKScP86zFpIDpoIP1FTy8zfaen6HFQ8alrzTP
         yP3ZSnVbgWrnseA8Lnq3FURlX35fYdtK9jF4KHlZVBeCiWpmyaFakn9/l64qop1Tm/8x
         1zkM6d/eLd7vCHwBGga7X7UxmIs75ZYKCZ5M9VzUXGShyPo1XToonuUAwsvEx2O7jZ27
         Ez1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769103213; x=1769708013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KifYfpH1Uw22pKIMjbBq11crhRt7hPmZITG2kebN/cI=;
        b=rYYzP/0hmQoroaDBXXoASCFjZN2ZXmbtt8YynrERiy+vlRB8+LJGRdL4GTZSW4g/Vo
         xE2apCL0YpfMJgkQifKGsRnmtkUcxAoB1ca7rlVFFMHKDQ8PSbUKZxqgh1O/vxBJnlDC
         90JM47nUz1z8bFSKDoRawm4Hk3xHTNInkd8kwt/Vwr4Avq9281ZFEvRBNsVkFN6lcQQQ
         zpfAuFGfl88bEohiXF1A5kas1nLa9tKdKwvdhYBrLhvSPdHfu7OtSeP8vQANKap596bG
         PuhvUR6/3NNIL9hwWxGyv/86RwsXxDL22nrUyP2Md7q3o8MXn/7gjMUWRd2l1K0JcRbK
         b3Cw==
X-Gm-Message-State: AOJu0YxWtI7n/vLJe8NgO+cEpla54vvSwKaqqPxJvfSgAe1s4HOWzA0d
	o7HTgrE0LcPCvvlBstOCSz6zEunmoYtZpgawAe5PQvnYZ8y/WYi2J7Woti6zdy06rjaftml5QOr
	nxPdZpoJCSrv00RVFpKSs20Lx0adA5HM=
X-Gm-Gg: AZuq6aLQSTPCfkLIAD6eMhzbJJit0d39PoJwoE4leXRtBKfDHOIYWnN4lcA3Y+oOf6L
	INxrHi6Qp2Dlvl9L2vau7S2RZmXQWtlV4j3AMZbmhRPADOINJ3Y8e6dzTKOv3UF2JGqR8KBiKES
	r2ZuVwnmZoJ8/H4d3r6dhv6niR96m/uHd/nPbw6iGYAQN7jQW+D6R74njhFKnNh7cyJFxVMewru
	2jp3KxZvLNGICDFCQ9O1Nz5fu33qt3iHQ7xX7ZHWnO/ngOCxu/wHdjvsO2t04U1Z7IjuP91fQMq
	pFvigPu8MTcipGFOWshBHsygZ7rU2Zwbiyxf2ziY6aGo91yObWL4gnVJehUf2nWORB70sRoztqx
	Ky9j9FRZ5U9eK7rv0TAd7AaMovPlYijF6/0P0pQUR7oVIOQ==
X-Received: by 2002:a05:690c:c533:b0:78c:2fc2:dae3 with SMTP id
 00721157ae682-7942a822407mr28484397b3.22.1769103212847; Thu, 22 Jan 2026
 09:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20260113175758.1409859-1-tgamblin@baylibre.com>
In-Reply-To: <20260113175758.1409859-1-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jan 2026 09:33:05 -0800
X-Gm-Features: AZwV_QgnYgzBUcuqO799fXepSQ-cO78vcpiokg_kSq4HBaHwMNF5C2Kd9CITtNg
Message-ID: <CAMKF1sqV8FyUWsbC8RgmQQk7KrP9Mv7idA_T+BL3nESDCHA5=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7 v4] python3: upgrade 3.13.11 -> 3.14.2
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000092a98a0648fd703a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229854

--00000000000092a98a0648fd703a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

here are few recipes in meta-openembedded which are failing with python
3.14, help in fixing this is appreciated

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1260

On Tue, Jan 13, 2026 at 9:58=E2=80=AFAM Trevor Gamblin via lists.openembedd=
ed.org
<tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:

> I know that there's a large backlog and bigger issues than taking an
> upgrade
> patch series right now, but I wanted to make sure I had tested this
> properly and
> submitted it with all of the necessary components before moving on.
>
> Compared to v3
> (https://lists.openembedded.org/g/openembedded-core/topic/117176199):
>
> - Added compression module changes to python3-compression split in a new
> patch
>
> One final set of tests:
>
> ptests:
>
> |=3D=3D Tests result: SUCCESS =3D=3D
> |
> |28 tests skipped:
> |    test.test_asyncio.test_windows_events
> |    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
> |    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
> |    test.test_gdb.test_misc test.test_gdb.test_pretty_print
> |    test_android test_apple test_asdl_parser test_clinic test_devpoll
> |    test_free_threading test_generated_cases test_idle test_kqueue
> |    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
> |    test_ttk test_ttk_textonly test_turtle test_winapi
> |    test_winconsoleio test_winreg test_wmi
> |
> |8 tests skipped (resource denied):
> |    test_curses test_peg_generator test_smtpnet test_socketserver
> |    test_urllib2net test_urllibnet test_winsound test_zipfile64
> |
> |455 tests OK.
> |
> |Total duration: 3 min 43 sec
> |Total tests: run=3D46,462 skipped=3D2,384
> |Total test files: run=3D483/491 skipped=3D28 resource_denied=3D8
> |Result: SUCCESS
> |DURATION: 224
> |END: /usr/lib/python3/ptest
> |2026-01-13T17:51
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemux86-64:~#
>
> Reproducibility (gcc-doc failed, python3 did not):
>
> |2026-01-13 12:42:25,446 - oe-selftest - INFO -
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |2026-01-13 12:42:25,446 - oe-selftest - INFO - FAIL:
> test_reproducible_builds
> (reproducible.ReproducibleTests.test_reproducible_builds)
> |2026-01-13 12:42:25,446 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> |2026-01-13 12:42:25,446 - oe-selftest - INFO - Traceback (most recent
> call last):
> |  File
> "/home/tgamblin/workspace/yocto/openembedded-core/meta/lib/oeqa/selftest/=
cases/reproducible.py",
> line 406, in test_reproducible_builds
> |    self.fail('\n'.join(fails))
> |    ~~~~~~~~~^^^^^^^^^^^^^^^^^^
> |AssertionError: The following deb packages are different and not in
> exclusion list:
>
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-=
extended/tmp/deploy/deb/./x86-64-v3/gcc-doc_15.2.0-r0_amd64.deb
> |The following ipk packages are different and not in exclusion list:
>
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-=
extended/tmp/deploy/ipk/./x86-64-v3/gcc-doc_15.2.0-r0_x86-64-v3.ipk
> |The following rpm packages are different and not in exclusion list:
>
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-=
extended/tmp/deploy/rpm/./x86_64_v3/gcc-doc-15.2.0-r0.x86_64_v3.rpm
> |
> |2026-01-13 12:42:25,446 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> |2026-01-13 12:42:25,446 - oe-selftest - INFO - Ran 1 test in 1549.611s
> |2026-01-13 12:42:25,446 - oe-selftest - INFO - FAILED
> |2026-01-13 12:42:25,446 - oe-selftest - INFO -  (failures=3D1)
> |2026-01-13 12:42:28,656 - oe-selftest - INFO - RESULTS:
> |2026-01-13 12:42:28,656 - oe-selftest - INFO - RESULTS -
> reproducible.ReproducibleTests.test_reproducible_builds: FAILED (1549.36s=
)
> |2026-01-13 12:42:31,461 - oe-selftest - INFO - SUMMARY:
> |2026-01-13 12:42:31,461 - oe-selftest - INFO - oe-selftest () - Ran 1
> test in 1549.611s
> |2026-01-13 12:42:31,461 - oe-selftest - INFO - oe-selftest - FAIL -
> Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=
=3D0)
>
> buildall-qemu:
>
> |BUILDALL-QEMU LOG FOR python3
> |START TIME: 2026-01-13_11:25:54
> |HOSTNAME: megalith
> |HOST OS: Fedora Linux 43 (Server Edition)
> |HOST KERNEL: 6.17.12-300.fc43.x86_64
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |BUILD RESULTS:
> |[glibc]
> |PASS: qemuarm
> |PASS: qemuarm64
> |PASS: qemuarmv5
> |PASS: qemuloongarch64
> |PASS: qemumips
> |PASS: qemumips64
> |PASS: qemuppc
> |PASS: qemuppc64
> |PASS: qemuriscv32
> |PASS: qemuriscv64
> |PASS: qemux86-64
> |PASS: qemux86
> |[musl]
> |PASS: qemuarm
> |PASS: qemuarm64
> |PASS: qemuarmv5
> |FAIL: qemuloongarch64
> |PASS: qemumips
> |PASS: qemumips64
> |PASS: qemuppc
> |PASS: qemuppc64
> |PASS: qemuriscv32
> |PASS: qemuriscv64
> |PASS: qemux86-64
> |PASS: qemux86
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |PASSED: 23
> |FAILED: 1
>
> v3 details below.
>
> Compared to v2
> (https://lists.openembedded.org/g/openembedded-core/message/228232):
>
> - rebase on top of the 3.13.11 python3 recipe in master;
> - add a patch to include the _ast_unparse module in the core split, fixin=
g
> some
>   import issues for annotationlib
>
> I've kept the original ptest, reproducibility, and buildall checks in the
> respective patches, but here is another set of runs for completeness:
>
> ptests:
>
> |=3D=3D Tests result: SUCCESS =3D=3D
> |
> |28 tests skipped:
> |    test.test_asyncio.test_windows_events
> |    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
> |    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
> |    test.test_gdb.test_misc test.test_gdb.test_pretty_print
> |    test_android test_apple test_asdl_parser test_clinic test_devpoll
> |    test_free_threading test_generated_cases test_idle test_kqueue
> |    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
> |    test_ttk test_ttk_textonly test_turtle test_winapi
> |    test_winconsoleio test_winreg test_wmi
> |
> |8 tests skipped (resource denied):
> |    test_curses test_peg_generator test_smtpnet test_socketserver
> |    test_urllib2net test_urllibnet test_winsound test_zipfile64
> |
> |455 tests OK.
> |
> |Total duration: 3 min 44 sec
> |Total tests: run=3D46,462 skipped=3D2,384
> |Total test files: run=3D483/491 skipped=3D28 resource_denied=3D8
> |Result: SUCCESS
> |DURATION: 224
> |END: /usr/lib/python3/ptest
> |2026-01-08T14:58
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
>
> Reproducibility OK (saw issue with gcc-doc, but not python3):
>
>
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-=
extended/tmp/deploy/deb/./x86-64-v3/gcc-doc_15.2.0-r0_amd64.deb
> |The following ipk packages are different and not in exclusion list:
>
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-=
extended/tmp/deploy/ipk/./x86-64-v3/gcc-doc_15.2.0-r0_x86-64-v3.ipk
> |The following rpm packages are different and not in exclusion list:
>
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-=
extended/tmp/deploy/rpm/./x86_64_v3/gcc-doc-15.2.0-r0.x86_64_v3.rpm
> |
> |2026-01-08 13:18:28,640 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> |2026-01-08 13:18:28,640 - oe-selftest - INFO - Ran 1 test in 1285.587s
> |2026-01-08 13:18:28,640 - oe-selftest - INFO - FAILED
> |2026-01-08 13:18:28,640 - oe-selftest - INFO -  (failures=3D1)
> |2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS:
> |2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS -
> reproducible.ReproducibleTests.test_reproducible_builds: FAILED (1285.41s=
)
> |2026-01-08 13:18:31,660 - oe-selftest - INFO - SUMMARY:
> |2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest () - Ran 1
> test in 1285.588s
> |2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest - FAIL -
> Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=
=3D0)
>
> buildall-qemu:
>
> |BUILDALL-QEMU LOG FOR python3
> |START TIME: 2026-01-08_13:27:10
> |HOSTNAME: megalith
> |HOST OS: Fedora Linux 43 (Server Edition)
> |HOST KERNEL: 6.17.12-300.fc43.x86_64
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |BUILD RESULTS:
> |[glibc]
> |PASS: qemuarm
> |PASS: qemuarm64
> |PASS: qemuarmv5
> |PASS: qemuloongarch64
> |PASS: qemumips
> |PASS: qemumips64
> |PASS: qemuppc
> |PASS: qemuppc64
> |PASS: qemuriscv32
> |PASS: qemuriscv64
> |PASS: qemux86-64
> |PASS: qemux86
> |[musl]
> |PASS: qemuarm
> |PASS: qemuarm64
> |PASS: qemuarmv5
> |FAIL: qemuloongarch64
> |PASS: qemumips
> |PASS: qemumips64
> |PASS: qemuppc
> |PASS: qemuppc64
> |PASS: qemuriscv32
> |PASS: qemuriscv64
> |PASS: qemux86-64
> |PASS: qemux86
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |PASSED: 23
> |FAILED: 1
>
> v2 details below.
>
> Compared to v1
> (https://lists.openembedded.org/g/openembedded-core/message/227955):
>
> - Drop python3-bcrypt upgrade, as someone else has submitted that;
> - Drop rpm patch to manually override Python3_SITEARCH with a patch, as
> that was
>   masking the real issue (see below);
> - Add a new patch to fix python3targetconfig by exporting
> _PYTHON_PROJECT_BASE,
>   which Python's sysconfig looks for (as of 3.14.0) when doing
>   cross-compilation. The absence of this was resulting in packages like r=
pm
>   finding paths for the native interpreter when making use of sysconfig,
> when
>   they needed the host values.
>
> Note that I've dropped my own version of the python3-bcrypt upgrade, but =
I
> tested this patch series on top of the other one that was submitted, as
> otherwise the ptest images would break during build (version mismatch
> errors
> around PyO3, which is fixed with the bcrypt upgrade).
>
> v1 details below.
>
> This supersedes a previous series sent, which only did the 3.14.0 upgrade=
.
>
> Compared to the first series
> (https://lists.openembedded.org/g/openembedded-core/message/227310), I've
> done the following:
>
> - Added a commit for including the '_py_warnings' and 'annotationlib'
> modules in
>   python3-core;
> - Adds the python 3.14.2 upgrade;
> - Removed commits for adding python3-misc to RDEPENDS for python3-pytest
> and
>   python3-jsonpointer, as these are now solved by a new patch to add new
> modules
>   to python3-core in the manifest. Doing it this way was fragile in the
> sense
>   that there were many other recipes needing this same fix that testing
> didn't
>   easily catch, and it doesn't make sense to add python3-misc to recipe
> RDEPENDS
>   just because (for example) python3-logging (another package split) is
> trying
>   to make use of warnings, but can't find the right module;
> - Modified the rpm commit to apply a patch (submitted upstream) to fix
>   CMakeLists.txt, rather than a do_configure prepend;
> - Fixed the Python 3.14.0 upgrade commit so that one of the patches we
> carry to
>   skip tests doesn't include duplicate calls to the relevant skip
> functions.
>
> I've kept the upgrades from 3.13.11 to 3.14.0 and 3.14.0 to 3.14.2
> separate to
> reflect separate testing and let people review those changelogs
> individually if
> desired.
>
> Trevor Gamblin (7):
>   python3: upgrade 3.13.11 -> 3.14.0
>   python3targetconfig: export _PYTHON_PROJECT_BASE
>   python_pep517: add --prefix to nativepython3 call
>   python3: upgrade 3.14.0 -> 3.14.2
>   python3: add _py_warnings, annotationlib to core
>   python3: add _ast_unparse to core
>   python3: add new files to compression
>
>  meta/classes-recipe/python3-dir.bbclass       |    2 +-
>  .../python3targetconfig.bbclass               |    1 +
>  meta/classes-recipe/python_pep517.bbclass     |    2 +-
>  ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
>  ...-use-prefix-value-from-build-configu.patch |   35 +-
>  ...sts-due-to-load-variability-on-YP-AB.patch |   31 +-
>  ...ctive_children-skip-problematic-test.patch |   17 +-
>  ...1-test_cmd-skip-bang-completion-test.patch |   31 +
>  ...-test_unix_console.test_cursor_back_.patch |   46 +
>  ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
>  .../python/python3/python3-manifest.json      |   14 +-
>  .../{python3_3.13.11.bb =3D> python3_3.14.2.bb} |   20 +-
>  12 files changed, 195 insertions(+), 1488 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-a=
nd-add-it-to-multissl.patch
>  create mode 100644
> meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-t=
est.patch
>  create mode 100644
> meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_cons=
ole.test_cursor_back_.patch
>  create mode 100644
> meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_syscon=
fig.test_sysconfigdat.patch
>  rename meta/recipes-devtools/python/{python3_3.13.11.bb =3D>
> python3_3.14.2.bb} (95%)
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229280):
> https://lists.openembedded.org/g/openembedded-core/message/229280
> Mute This Topic: https://lists.openembedded.org/mt/117247400/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000092a98a0648fd703a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">here are few recipes in meta-openembedded which are failin=
g with python 3.14, help in fixing this is appreciated<div><br></div><div><=
a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/build=
s/1260">https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/=
1260</a></div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 13, 2026 at 9:58=E2=80=AFAM=
 Trevor Gamblin via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;tgamblin=3D<a href=3D"mailto:baylibre.com@lists.openembed=
ded.org">baylibre.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">I know that there&#39;s a large=
 backlog and bigger issues than taking an upgrade<br>
patch series right now, but I wanted to make sure I had tested this properl=
y and<br>
submitted it with all of the necessary components before moving on.<br>
<br>
Compared to v3<br>
(<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/117176=
199" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/=
openembedded-core/topic/117176199</a>):<br>
<br>
- Added compression module changes to python3-compression split in a new pa=
tch<br>
<br>
One final set of tests:<br>
<br>
ptests:<br>
<br>
|=3D=3D Tests result: SUCCESS =3D=3D<br>
|<br>
|28 tests skipped:<br>
|=C2=A0 =C2=A0 test.test_asyncio.test_windows_events<br>
|=C2=A0 =C2=A0 test.test_asyncio.test_windows_utils test.test_gdb.test_back=
trace<br>
|=C2=A0 =C2=A0 test.test_gdb.test_cfunction test.test_gdb.test_cfunction_fu=
ll<br>
|=C2=A0 =C2=A0 test.test_gdb.test_misc test.test_gdb.test_pretty_print<br>
|=C2=A0 =C2=A0 test_android test_apple test_asdl_parser test_clinic test_de=
vpoll<br>
|=C2=A0 =C2=A0 test_free_threading test_generated_cases test_idle test_kque=
ue<br>
|=C2=A0 =C2=A0 test_launcher test_msvcrt test_startfile test_tcl test_tkint=
er<br>
|=C2=A0 =C2=A0 test_ttk test_ttk_textonly test_turtle test_winapi<br>
|=C2=A0 =C2=A0 test_winconsoleio test_winreg test_wmi<br>
|<br>
|8 tests skipped (resource denied):<br>
|=C2=A0 =C2=A0 test_curses test_peg_generator test_smtpnet test_socketserve=
r<br>
|=C2=A0 =C2=A0 test_urllib2net test_urllibnet test_winsound test_zipfile64<=
br>
|<br>
|455 tests OK.<br>
|<br>
|Total duration: 3 min 43 sec<br>
|Total tests: run=3D46,462 skipped=3D2,384<br>
|Total test files: run=3D483/491 skipped=3D28 resource_denied=3D8<br>
|Result: SUCCESS<br>
|DURATION: 224<br>
|END: /usr/lib/python3/ptest<br>
|2026-01-13T17:51<br>
|STOP: ptest-runner<br>
|TOTAL: 1 FAIL: 0<br>
|root@qemux86-64:~#<br>
<br>
Reproducibility (gcc-doc failed, python3 did not):<br>
<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO - FAIL: test_reproducible_bui=
lds (reproducible.ReproducibleTests.test_reproducible_builds)<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO - ---------------------------=
-------------------------------------------<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO - Traceback (most recent call=
 last):<br>
|=C2=A0 File &quot;/home/tgamblin/workspace/yocto/openembedded-core/meta/li=
b/oeqa/selftest/cases/reproducible.py&quot;, line 406, in test_reproducible=
_builds<br>
|=C2=A0 =C2=A0 self.fail(&#39;\n&#39;.join(fails))<br>
|=C2=A0 =C2=A0 ~~~~~~~~~^^^^^^^^^^^^^^^^^^<br>
|AssertionError: The following deb packages are different and not in exclus=
ion list:<br>
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-ex=
tended/tmp/deploy/deb/./x86-64-v3/gcc-doc_15.2.0-r0_amd64.deb<br>
|The following ipk packages are different and not in exclusion list:<br>
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-ex=
tended/tmp/deploy/ipk/./x86-64-v3/gcc-doc_15.2.0-r0_x86-64-v3.ipk<br>
|The following rpm packages are different and not in exclusion list:<br>
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-ex=
tended/tmp/deploy/rpm/./x86_64_v3/gcc-doc-15.2.0-r0.x86_64_v3.rpm<br>
|<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO - ---------------------------=
-------------------------------------------<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO - Ran 1 test in 1549.611s<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO - FAILED<br>
|2026-01-13 12:42:25,446 - oe-selftest - INFO -=C2=A0 (failures=3D1)<br>
|2026-01-13 12:42:28,656 - oe-selftest - INFO - RESULTS:<br>
|2026-01-13 12:42:28,656 - oe-selftest - INFO - RESULTS - reproducible.Repr=
oducibleTests.test_reproducible_builds: FAILED (1549.36s)<br>
|2026-01-13 12:42:31,461 - oe-selftest - INFO - SUMMARY:<br>
|2026-01-13 12:42:31,461 - oe-selftest - INFO - oe-selftest () - Ran 1 test=
 in 1549.611s<br>
|2026-01-13 12:42:31,461 - oe-selftest - INFO - oe-selftest - FAIL - Requir=
ed tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D0)<br>
<br>
buildall-qemu:<br>
<br>
|BUILDALL-QEMU LOG FOR python3<br>
|START TIME: 2026-01-13_11:25:54<br>
|HOSTNAME: megalith<br>
|HOST OS: Fedora Linux 43 (Server Edition)<br>
|HOST KERNEL: 6.17.12-300.fc43.x86_64<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|BUILD RESULTS:<br>
|[glibc]<br>
|PASS: qemuarm<br>
|PASS: qemuarm64<br>
|PASS: qemuarmv5<br>
|PASS: qemuloongarch64<br>
|PASS: qemumips<br>
|PASS: qemumips64<br>
|PASS: qemuppc<br>
|PASS: qemuppc64<br>
|PASS: qemuriscv32<br>
|PASS: qemuriscv64<br>
|PASS: qemux86-64<br>
|PASS: qemux86<br>
|[musl]<br>
|PASS: qemuarm<br>
|PASS: qemuarm64<br>
|PASS: qemuarmv5<br>
|FAIL: qemuloongarch64<br>
|PASS: qemumips<br>
|PASS: qemumips64<br>
|PASS: qemuppc<br>
|PASS: qemuppc64<br>
|PASS: qemuriscv32<br>
|PASS: qemuriscv64<br>
|PASS: qemux86-64<br>
|PASS: qemux86<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|PASSED: 23<br>
|FAILED: 1<br>
<br>
v3 details below.<br>
<br>
Compared to v2<br>
(<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2282=
32" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/message/228232</a>):<br>
<br>
- rebase on top of the 3.13.11 python3 recipe in master;<br>
- add a patch to include the _ast_unparse module in the core split, fixing =
some<br>
=C2=A0 import issues for annotationlib<br>
<br>
I&#39;ve kept the original ptest, reproducibility, and buildall checks in t=
he<br>
respective patches, but here is another set of runs for completeness:<br>
<br>
ptests:<br>
<br>
|=3D=3D Tests result: SUCCESS =3D=3D<br>
|<br>
|28 tests skipped:<br>
|=C2=A0 =C2=A0 test.test_asyncio.test_windows_events<br>
|=C2=A0 =C2=A0 test.test_asyncio.test_windows_utils test.test_gdb.test_back=
trace<br>
|=C2=A0 =C2=A0 test.test_gdb.test_cfunction test.test_gdb.test_cfunction_fu=
ll<br>
|=C2=A0 =C2=A0 test.test_gdb.test_misc test.test_gdb.test_pretty_print<br>
|=C2=A0 =C2=A0 test_android test_apple test_asdl_parser test_clinic test_de=
vpoll<br>
|=C2=A0 =C2=A0 test_free_threading test_generated_cases test_idle test_kque=
ue<br>
|=C2=A0 =C2=A0 test_launcher test_msvcrt test_startfile test_tcl test_tkint=
er<br>
|=C2=A0 =C2=A0 test_ttk test_ttk_textonly test_turtle test_winapi<br>
|=C2=A0 =C2=A0 test_winconsoleio test_winreg test_wmi<br>
|<br>
|8 tests skipped (resource denied):<br>
|=C2=A0 =C2=A0 test_curses test_peg_generator test_smtpnet test_socketserve=
r<br>
|=C2=A0 =C2=A0 test_urllib2net test_urllibnet test_winsound test_zipfile64<=
br>
|<br>
|455 tests OK.<br>
|<br>
|Total duration: 3 min 44 sec<br>
|Total tests: run=3D46,462 skipped=3D2,384<br>
|Total test files: run=3D483/491 skipped=3D28 resource_denied=3D8<br>
|Result: SUCCESS<br>
|DURATION: 224<br>
|END: /usr/lib/python3/ptest<br>
|2026-01-08T14:58<br>
|STOP: ptest-runner<br>
|TOTAL: 1 FAIL: 0<br>
<br>
Reproducibility OK (saw issue with gcc-doc, but not python3):<br>
<br>
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-ex=
tended/tmp/deploy/deb/./x86-64-v3/gcc-doc_15.2.0-r0_amd64.deb<br>
|The following ipk packages are different and not in exclusion list:<br>
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-ex=
tended/tmp/deploy/ipk/./x86-64-v3/gcc-doc_15.2.0-r0_x86-64-v3.ipk<br>
|The following rpm packages are different and not in exclusion list:<br>
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-ex=
tended/tmp/deploy/rpm/./x86_64_v3/gcc-doc-15.2.0-r0.x86_64_v3.rpm<br>
|<br>
|2026-01-08 13:18:28,640 - oe-selftest - INFO - ---------------------------=
-------------------------------------------<br>
|2026-01-08 13:18:28,640 - oe-selftest - INFO - Ran 1 test in 1285.587s<br>
|2026-01-08 13:18:28,640 - oe-selftest - INFO - FAILED<br>
|2026-01-08 13:18:28,640 - oe-selftest - INFO -=C2=A0 (failures=3D1)<br>
|2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS:<br>
|2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS - reproducible.Repr=
oducibleTests.test_reproducible_builds: FAILED (1285.41s)<br>
|2026-01-08 13:18:31,660 - oe-selftest - INFO - SUMMARY:<br>
|2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest () - Ran 1 test=
 in 1285.588s<br>
|2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest - FAIL - Requir=
ed tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D0)<br>
<br>
buildall-qemu:<br>
<br>
|BUILDALL-QEMU LOG FOR python3<br>
|START TIME: 2026-01-08_13:27:10<br>
|HOSTNAME: megalith<br>
|HOST OS: Fedora Linux 43 (Server Edition)<br>
|HOST KERNEL: 6.17.12-300.fc43.x86_64<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|BUILD RESULTS:<br>
|[glibc]<br>
|PASS: qemuarm<br>
|PASS: qemuarm64<br>
|PASS: qemuarmv5<br>
|PASS: qemuloongarch64<br>
|PASS: qemumips<br>
|PASS: qemumips64<br>
|PASS: qemuppc<br>
|PASS: qemuppc64<br>
|PASS: qemuriscv32<br>
|PASS: qemuriscv64<br>
|PASS: qemux86-64<br>
|PASS: qemux86<br>
|[musl]<br>
|PASS: qemuarm<br>
|PASS: qemuarm64<br>
|PASS: qemuarmv5<br>
|FAIL: qemuloongarch64<br>
|PASS: qemumips<br>
|PASS: qemumips64<br>
|PASS: qemuppc<br>
|PASS: qemuppc64<br>
|PASS: qemuriscv32<br>
|PASS: qemuriscv64<br>
|PASS: qemux86-64<br>
|PASS: qemux86<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|PASSED: 23<br>
|FAILED: 1<br>
<br>
v2 details below.<br>
<br>
Compared to v1<br>
(<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2279=
55" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/message/227955</a>):<br>
<br>
- Drop python3-bcrypt upgrade, as someone else has submitted that;<br>
- Drop rpm patch to manually override Python3_SITEARCH with a patch, as tha=
t was<br>
=C2=A0 masking the real issue (see below);<br>
- Add a new patch to fix python3targetconfig by exporting _PYTHON_PROJECT_B=
ASE,<br>
=C2=A0 which Python&#39;s sysconfig looks for (as of 3.14.0) when doing<br>
=C2=A0 cross-compilation. The absence of this was resulting in packages lik=
e rpm<br>
=C2=A0 finding paths for the native interpreter when making use of sysconfi=
g, when<br>
=C2=A0 they needed the host values.<br>
<br>
Note that I&#39;ve dropped my own version of the python3-bcrypt upgrade, bu=
t I<br>
tested this patch series on top of the other one that was submitted, as<br>
otherwise the ptest images would break during build (version mismatch error=
s<br>
around PyO3, which is fixed with the bcrypt upgrade).<br>
<br>
v1 details below.<br>
<br>
This supersedes a previous series sent, which only did the 3.14.0 upgrade.<=
br>
<br>
Compared to the first series<br>
(<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2273=
10" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/message/227310</a>), I&#39;ve<br>
done the following:<br>
<br>
- Added a commit for including the &#39;_py_warnings&#39; and &#39;annotati=
onlib&#39; modules in<br>
=C2=A0 python3-core;<br>
- Adds the python 3.14.2 upgrade;<br>
- Removed commits for adding python3-misc to RDEPENDS for python3-pytest an=
d<br>
=C2=A0 python3-jsonpointer, as these are now solved by a new patch to add n=
ew modules<br>
=C2=A0 to python3-core in the manifest. Doing it this way was fragile in th=
e sense<br>
=C2=A0 that there were many other recipes needing this same fix that testin=
g didn&#39;t<br>
=C2=A0 easily catch, and it doesn&#39;t make sense to add python3-misc to r=
ecipe RDEPENDS<br>
=C2=A0 just because (for example) python3-logging (another package split) i=
s trying<br>
=C2=A0 to make use of warnings, but can&#39;t find the right module;<br>
- Modified the rpm commit to apply a patch (submitted upstream) to fix<br>
=C2=A0 CMakeLists.txt, rather than a do_configure prepend;<br>
- Fixed the Python 3.14.0 upgrade commit so that one of the patches we carr=
y to<br>
=C2=A0 skip tests doesn&#39;t include duplicate calls to the relevant skip =
functions.<br>
<br>
I&#39;ve kept the upgrades from 3.13.11 to 3.14.0 and 3.14.0 to 3.14.2 sepa=
rate to<br>
reflect separate testing and let people review those changelogs individuall=
y if<br>
desired.<br>
<br>
Trevor Gamblin (7):<br>
=C2=A0 python3: upgrade 3.13.11 -&gt; 3.14.0<br>
=C2=A0 python3targetconfig: export _PYTHON_PROJECT_BASE<br>
=C2=A0 python_pep517: add --prefix to nativepython3 call<br>
=C2=A0 python3: upgrade 3.14.0 -&gt; 3.14.2<br>
=C2=A0 python3: add _py_warnings, annotationlib to core<br>
=C2=A0 python3: add _ast_unparse to core<br>
=C2=A0 python3: add new files to compression<br>
<br>
=C2=A0meta/classes-recipe/python3-dir.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../python3targetconfig.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0meta/classes-recipe/python_pep517.bbclass=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 ----------------=
-<br>
=C2=A0...-use-prefix-value-from-build-configu.patch |=C2=A0 =C2=A035 +-<br>
=C2=A0...sts-due-to-load-variability-on-YP-AB.patch |=C2=A0 =C2=A031 +-<br>
=C2=A0...ctive_children-skip-problematic-test.patch |=C2=A0 =C2=A017 +-<br>
=C2=A0...1-test_cmd-skip-bang-completion-test.patch |=C2=A0 =C2=A031 +<br>
=C2=A0...-test_unix_console.test_cursor_back_.patch |=C2=A0 =C2=A046 +<br>
=C2=A0...kip-test_sysconfig.test_sysconfigdat.patch |=C2=A0 =C2=A032 +<br>
=C2=A0.../python/python3/python3-manifest.json=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A014 +-<br>
=C2=A0.../{<a href=3D"http://python3_3.13.11.bb" rel=3D"noreferrer" target=
=3D"_blank">python3_3.13.11.bb</a> =3D&gt; <a href=3D"http://python3_3.14.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.14.2.bb</a>} |=C2=A0 =
=C2=A020 +-<br>
=C2=A012 files changed, 195 insertions(+), 1488 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate=
-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd=
-skip-bang-completion-test.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyr=
epl-skip-test_unix_console.test_cursor_back_.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/0001-test_sys=
config-skip-test_sysconfig.test_sysconfigdat.patch<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3_3.13.1=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.13.11.bb</a> =3D&gt; <=
a href=3D"http://python3_3.14.2.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3_3.14.2.bb</a>} (95%)<br>
<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229280): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229280" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229280</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117247400/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117247400/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000092a98a0648fd703a--

