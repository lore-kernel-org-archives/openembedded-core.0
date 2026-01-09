Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DA6D1A63E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:06:59 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11923.1767971215609759331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=amSR98pZ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c2c36c10dbso387458185a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 07:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767971214; x=1768576014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdODYWcUs+Y+nI9Gw0aD+p324xFff57dvEsK7DorDWw=;
        b=amSR98pZ9X7Jf4m7OCAgxJARsD8gpSLTuGc52TpdtvJgKNDkm8cLGDrFR1fTM21v5f
         6a6q+Z3wvR6eBl/2d0rbyknkyEGx7liTvd2zlkhzlxLStwiKcZs5Q0F4IvR+Q14HjjaF
         cpiblh3uhFSLVoyBQLdJnVAijBdOtAt3X33DRfvcl178fZjKtTUqUX+RNlr23oj4qKz3
         7hEDI2l8T0M61SkVGpZzi6YSaDkZDyBs3uByHqDWc1dUubup9JFj6AiqV/xrJ4iwzn+1
         JQYTy9C7ZTCYUduBxEOatgEixJAYgHRW8yT1HoKVvM21Nhqawpj+cKGrr5eFP7+w0gcB
         aD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971214; x=1768576014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdODYWcUs+Y+nI9Gw0aD+p324xFff57dvEsK7DorDWw=;
        b=aIccn5Q9uMOIxex8SzpiThhrnchA6CIxpYwDDDDB1T/rfQXbvHsPAYIrK79C36vp3+
         kdu3TSualpoFrgRriNwaTkexMZ/hL249btI9v2zA29RJgGQMN2bVHl1Ya2do+9yzHgiC
         +nfh8FOStekJrw8LgpNegiJQ0Wxjb1bfWjk4KYqRhChGGqrJgsnkWxotmha9BDVn+vzX
         Na9Fz/MKKwHjFR6cEv1GdbzxILe1SFXAR9JmCYyr+zuJtctu3eVEKwhHgkZ0F3RngALZ
         2b0Ccd+MdCMsMjkqh9BkE4UsGGLXLVQBMUFortLRiibONltwDG5PUWXDL83+GjWIE2EQ
         PAow==
X-Gm-Message-State: AOJu0Yz5OGL2O2dB9ZpJpWV/kFZxuwkWifiCejWahTtPRZA+ze68un04
	zVGw2srJBDQU1oQKOOFB1Rlj6rhbu7aHxRdC7rmfB7oYPe1zOVC72LZprbkAdQ9oLK7J6/3eXvo
	Wr37I1r8=
X-Gm-Gg: AY/fxX7wGhXLf0rjOQU/Br4rIaYOjcclrpyUPTFN0z3xCZsl8A4QObJyelgY95xH2BL
	gEqeD26J85SPoH5z+/2unykVcVSeuGK1WM2cii1XpjFM4d+anjqXMws3alceHQ81Qg5uGlm0LT0
	WFiXqUep41uLL57ETGgCv/mAmg9yP5YR3NT5SyUPvYCMl0KRB0KO57ns8c3XsMuX2KHZDQPPaF0
	ifidzUlGksqUPQjH3czMYfCTQbhqVftPBIS6DrJ2cOGJPOhDkTgcGySgTJ9/zWH6AhGLy1EbmfW
	qCnANFQq0bqAoLv/ciDd6XH61+tY1bzsgoR2+RJlFhjVylIX/7s+syATH+2zfFESvWzAT0xDXKd
	YHCts5aJfJdJZ8s2ERedhyF+8lgutGI3uM64Q4agEaZ6pJD5iBSawHweaPvnsILGXbKQhMZo23e
	dMY1fTyBGUAm9O7WI=
X-Google-Smtp-Source: AGHT+IGX1Z20UkLpGpRg0Y2IPETiNrE+j58QplNWTTRLyDptRUrR97zhHt6slXXWuBE7pDZq9bSIsQ==
X-Received: by 2002:a05:620a:448a:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8c3893dcaa1mr1401330485a.54.1767971213557;
        Fri, 09 Jan 2026 07:06:53 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a9a19sm842360185a.1.2026.01.09.07.06.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:06:52 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/6 v3] python3: upgrade 3.13.11 -> 3.14.2
Date: Fri,  9 Jan 2026 10:06:45 -0500
Message-ID: <20260109150651.469332-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229126

Compared to v2
(https://lists.openembedded.org/g/openembedded-core/message/228232):

- rebase on top of the 3.13.11 python3 recipe in master;
- add a patch to include the _ast_unparse module in the core split, fixing some
  import issues for annotationlib

I've kept the original ptest, reproducibility, and buildall checks in the
respective patches, but here is another set of runs for completeness:

ptests:

|== Tests result: SUCCESS ==
|
|28 tests skipped:
|    test.test_asyncio.test_windows_events
|    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
|    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
|    test.test_gdb.test_misc test.test_gdb.test_pretty_print
|    test_android test_apple test_asdl_parser test_clinic test_devpoll
|    test_free_threading test_generated_cases test_idle test_kqueue
|    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
|    test_ttk test_ttk_textonly test_turtle test_winapi
|    test_winconsoleio test_winreg test_wmi
|
|8 tests skipped (resource denied):
|    test_curses test_peg_generator test_smtpnet test_socketserver
|    test_urllib2net test_urllibnet test_winsound test_zipfile64
|
|455 tests OK.
|
|Total duration: 3 min 44 sec
|Total tests: run=46,462 skipped=2,384
|Total test files: run=483/491 skipped=28 resource_denied=8
|Result: SUCCESS
|DURATION: 224
|END: /usr/lib/python3/ptest
|2026-01-08T14:58
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Reproducibility OK (saw issue with gcc-doc, but not python3):

|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/gcc-doc_15.2.0-r0_amd64.deb
|The following ipk packages are different and not in exclusion list:
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/gcc-doc_15.2.0-r0_x86-64-v3.ipk
|The following rpm packages are different and not in exclusion list:
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/gcc-doc-15.2.0-r0.x86_64_v3.rpm
|
|2026-01-08 13:18:28,640 - oe-selftest - INFO - ----------------------------------------------------------------------
|2026-01-08 13:18:28,640 - oe-selftest - INFO - Ran 1 test in 1285.587s
|2026-01-08 13:18:28,640 - oe-selftest - INFO - FAILED
|2026-01-08 13:18:28,640 - oe-selftest - INFO -  (failures=1)
|2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS:
|2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED (1285.41s)
|2026-01-08 13:18:31,660 - oe-selftest - INFO - SUMMARY:
|2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1285.588s
|2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)

buildall-qemu:

|BUILDALL-QEMU LOG FOR python3
|START TIME: 2026-01-08_13:27:10
|HOSTNAME: megalith
|HOST OS: Fedora Linux 43 (Server Edition)
|HOST KERNEL: 6.17.12-300.fc43.x86_64
|===============
|BUILD RESULTS:
|[glibc]
|PASS: qemuarm
|PASS: qemuarm64
|PASS: qemuarmv5
|PASS: qemuloongarch64
|PASS: qemumips
|PASS: qemumips64
|PASS: qemuppc
|PASS: qemuppc64
|PASS: qemuriscv32
|PASS: qemuriscv64
|PASS: qemux86-64
|PASS: qemux86
|[musl]
|PASS: qemuarm
|PASS: qemuarm64
|PASS: qemuarmv5
|FAIL: qemuloongarch64
|PASS: qemumips
|PASS: qemumips64
|PASS: qemuppc
|PASS: qemuppc64
|PASS: qemuriscv32
|PASS: qemuriscv64
|PASS: qemux86-64
|PASS: qemux86
|===============
|PASSED: 23
|FAILED: 1

Previous iteration details below.

Compared to v1
(https://lists.openembedded.org/g/openembedded-core/message/227955):

- Drop python3-bcrypt upgrade, as someone else has submitted that;
- Drop rpm patch to manually override Python3_SITEARCH with a patch, as that was
  masking the real issue (see below);
- Add a new patch to fix python3targetconfig by exporting _PYTHON_PROJECT_BASE,
  which Python's sysconfig looks for (as of 3.14.0) when doing
  cross-compilation. The absence of this was resulting in packages like rpm
  finding paths for the native interpreter when making use of sysconfig, when
  they needed the host values.

Note that I've dropped my own version of the python3-bcrypt upgrade, but I
tested this patch series on top of the other one that was submitted, as
otherwise the ptest images would break during build (version mismatch errors
around PyO3, which is fixed with the bcrypt upgrade).

v1 details below.

This supersedes a previous series sent, which only did the 3.14.0 upgrade.

Compared to the first series
(https://lists.openembedded.org/g/openembedded-core/message/227310), I've
done the following:

- Added a commit for including the '_py_warnings' and 'annotationlib' modules in
  python3-core;
- Adds the python 3.14.2 upgrade;
- Removed commits for adding python3-misc to RDEPENDS for python3-pytest and
  python3-jsonpointer, as these are now solved by a new patch to add new modules
  to python3-core in the manifest. Doing it this way was fragile in the sense
  that there were many other recipes needing this same fix that testing didn't
  easily catch, and it doesn't make sense to add python3-misc to recipe RDEPENDS
  just because (for example) python3-logging (another package split) is trying
  to make use of warnings, but can't find the right module;
- Modified the rpm commit to apply a patch (submitted upstream) to fix
  CMakeLists.txt, rather than a do_configure prepend;
- Fixed the Python 3.14.0 upgrade commit so that one of the patches we carry to
  skip tests doesn't include duplicate calls to the relevant skip functions.

I've kept the upgrades from 3.13.11 to 3.14.0 and 3.14.0 to 3.14.2 separate to
reflect separate testing and let people review those changelogs individually if
desired.

Trevor Gamblin (6):
  python3: upgrade 3.13.11 -> 3.14.0
  python3targetconfig: export _PYTHON_PROJECT_BASE
  python_pep517: add --prefix to nativepython3 call
  python3: upgrade 3.14.0 -> 3.14.2
  python3: add _py_warnings, annotationlib to core
  python3: add _ast_unparse to core

 meta/classes-recipe/python3-dir.bbclass       |    2 +-
 .../python3targetconfig.bbclass               |    1 +
 meta/classes-recipe/python_pep517.bbclass     |    2 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
 ...-use-prefix-value-from-build-configu.patch |   35 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   31 +-
 ...ctive_children-skip-problematic-test.patch |   17 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   31 +
 ...-test_unix_console.test_cursor_back_.patch |   46 +
 ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
 .../python/python3/python3-manifest.json      |    6 +-
 .../{python3_3.13.11.bb => python3_3.14.2.bb} |   20 +-
 12 files changed, 188 insertions(+), 1487 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.14.2.bb} (95%)

-- 
2.52.0


