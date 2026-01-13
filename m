Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4072AD2F34E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:58:04 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65671.1768327082829298502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 09:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=O3jFPXBN;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee257e56aaso785861cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768327081; x=1768931881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8nufgsi0IxU24fhJ9gjv00oMC+vTtRMLJtU9weBTrE=;
        b=O3jFPXBNKQcqqgSSP1+yJSvbtWjL7/73ZeCKjvROy2OavHD4jay40l38ENo3V7QrMJ
         KzEyZkFaQp8mYHX32D62JVEdbdFHQ3N8aw7182KnEXCUpn8GYmPKTjCXyqXYzTUMY41B
         zPBUc28uXa7Lzl2Z7S9BBjtATN2Z1tg8mpkBZDz5bABpeC/M0F1jXXcURePccp942n9W
         aIp8Sh2Dt+0y9JjlFwOgPy78693owq9l3E/xBSU8Ur8qEZFmLJetPSqvMP36qrWGgQCG
         Mx6EvzxaCbXbS7En5A4VK5JH0FkP4w22joNbsFVHxuMUVTyvlZPDH0yNMwERIqkiNy8q
         jD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327081; x=1768931881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8nufgsi0IxU24fhJ9gjv00oMC+vTtRMLJtU9weBTrE=;
        b=X8KyQsj0Kzaxj4g7s7gUk21sFqhbRyxWhxTZF1DLHWF8o3WQeo/g11cJk3EDd+byRC
         d6B3ENwZc42ltDG6sAsjZijrNCJbL6L578JJWL7gLbn1QCFaKpXHfmpHGRbxgfwVSuea
         rBMTaGiKDRFs1ncNXxccRmtIRBP+BaUgw3+AJx3ITt0w1G4OELzIZyCtK+EC4a+XTQym
         TCqKX3GehvJnqWOiyTyrA9taFSJOIms1+XJ4zIRfKAsiRUSlYat6sSMumkskeuf9ynA8
         ePw4Tl5HS7P9KuBPATCfLUxhRJ7yWEzgV/lEzKMbdeFejcmmWhyP2Fuj9Wy2twWeTzzO
         dHqg==
X-Gm-Message-State: AOJu0YxAvWEIf7dJVT8RQBe8aKCg1PPgrI1S385q0wLzQSRRsDqxc7oX
	s0ylAgRqWeuBVe2J8Cff7akBZObSwlS75BlZxXZdSIgOGWNKCnIsdaAX+eb19iBaOaIMPon7np+
	yFISupQg=
X-Gm-Gg: AY/fxX5099SsRWymFjVZiGlIuRpZ/eLwgIzxdrkY+Cw/2Mo2YKfI7KxIAtuF3NcE1v1
	bkga3mGNSQj51ZFk8mBj6jtXcVOfdpnoZ3n/l6yOZvrPVZgMohXlnqQpmsvV4kjR/vc16ePYv/I
	veTR7UvsB3Fwfl5ovkUsO91OGc5eQW/I7fQaHMJh365WuMtdZAaGDDQeT5DI3FcBXI6WgINlmg0
	pDTPBpCpyYviKeWAIjZmzAHdyOLsU7mSDnIDZh4L3ILsooifR3YewHYl8iGiSm4+W89eAqH8zia
	kdTbwW1kMLKqzERFhA6EeCeL5gXeAXhHlwzBLaJch0fam2KoN26Lmm5/12O2BZZU7Imds3rDN1G
	XF5abCCgMltZk1GRW01o82/j1Z6YYXXiko4u1GMq7xlvWSdeQEkGpmUGoooP065biAxNqgk++gi
	hGJYBM+x6ogMf+N9M=
X-Received: by 2002:a05:622a:14c7:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-501397e83a3mr58231521cf.33.1768327080896;
        Tue, 13 Jan 2026 09:58:00 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d64563sm145400811cf.13.2026.01.13.09.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:58:00 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7 v4] python3: upgrade 3.13.11 -> 3.14.2
Date: Tue, 13 Jan 2026 12:57:51 -0500
Message-ID: <20260113175758.1409859-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 17:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229280

I know that there's a large backlog and bigger issues than taking an upgrade
patch series right now, but I wanted to make sure I had tested this properly and
submitted it with all of the necessary components before moving on.

Compared to v3
(https://lists.openembedded.org/g/openembedded-core/topic/117176199):

- Added compression module changes to python3-compression split in a new patch

One final set of tests:

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
|Total duration: 3 min 43 sec
|Total tests: run=46,462 skipped=2,384
|Total test files: run=483/491 skipped=28 resource_denied=8
|Result: SUCCESS
|DURATION: 224
|END: /usr/lib/python3/ptest
|2026-01-13T17:51
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

Reproducibility (gcc-doc failed, python3 did not):

|2026-01-13 12:42:25,446 - oe-selftest - INFO - ======================================================================
|2026-01-13 12:42:25,446 - oe-selftest - INFO - FAIL: test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
|2026-01-13 12:42:25,446 - oe-selftest - INFO - ----------------------------------------------------------------------
|2026-01-13 12:42:25,446 - oe-selftest - INFO - Traceback (most recent call last):
|  File "/home/tgamblin/workspace/yocto/openembedded-core/meta/lib/oeqa/selftest/cases/reproducible.py", line 406, in test_reproducible_builds
|    self.fail('\n'.join(fails))
|    ~~~~~~~~~^^^^^^^^^^^^^^^^^^
|AssertionError: The following deb packages are different and not in exclusion list:
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/gcc-doc_15.2.0-r0_amd64.deb
|The following ipk packages are different and not in exclusion list:
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/gcc-doc_15.2.0-r0_x86-64-v3.ipk
|The following rpm packages are different and not in exclusion list:
|/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/gcc-doc-15.2.0-r0.x86_64_v3.rpm
|
|2026-01-13 12:42:25,446 - oe-selftest - INFO - ----------------------------------------------------------------------
|2026-01-13 12:42:25,446 - oe-selftest - INFO - Ran 1 test in 1549.611s
|2026-01-13 12:42:25,446 - oe-selftest - INFO - FAILED
|2026-01-13 12:42:25,446 - oe-selftest - INFO -  (failures=1)
|2026-01-13 12:42:28,656 - oe-selftest - INFO - RESULTS:
|2026-01-13 12:42:28,656 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED (1549.36s)
|2026-01-13 12:42:31,461 - oe-selftest - INFO - SUMMARY:
|2026-01-13 12:42:31,461 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1549.611s
|2026-01-13 12:42:31,461 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)

buildall-qemu:

|BUILDALL-QEMU LOG FOR python3
|START TIME: 2026-01-13_11:25:54
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

v3 details below.

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

v2 details below.

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

Trevor Gamblin (7):
  python3: upgrade 3.13.11 -> 3.14.0
  python3targetconfig: export _PYTHON_PROJECT_BASE
  python_pep517: add --prefix to nativepython3 call
  python3: upgrade 3.14.0 -> 3.14.2
  python3: add _py_warnings, annotationlib to core
  python3: add _ast_unparse to core
  python3: add new files to compression

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
 .../python/python3/python3-manifest.json      |   14 +-
 .../{python3_3.13.11.bb => python3_3.14.2.bb} |   20 +-
 12 files changed, 195 insertions(+), 1488 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.14.2.bb} (95%)

-- 
2.52.0


