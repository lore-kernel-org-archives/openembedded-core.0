Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166FED26D9B
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 19:59:02 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18784.1767988740856376297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 11:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=TmOptGTF;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b25dd7ab33so351089985a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 11:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767988739; x=1768593539; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TXPLl9cGAUqFpfzsbST/THNC3rWlh8YzoB8EF0wL4Jo=;
        b=TmOptGTFuLC/rMTR3oWlHI9sMAxc5WuFihRbNm5WXMuN7A2YN3naZpDy2Hg4NlNMz8
         H4zUgL2A3Q7ENJTM9gCuszsbdljeZx1WBAtyiPB8wMfVmHhHUyC+rFzU2VAk7O3dQXHm
         vbeIVNOH0Vc00huMm/l3c7dCgo7ERcS3QPuxvfrTALhUwqSNVID07oqjxY+dRKa3W9cm
         Gulk4+X+U/8MdMquka+c9bcJOtb/prmtKHDbSkPXZh6e/f3agc8Mp4xZouHpo09hPqei
         Rz+F8a6b3lHiGehupPP7IJYSkrXw2QH/iDsuBamcG9dAvxUnVV1tLNZauyLx+F8oIgA4
         m34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767988739; x=1768593539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXPLl9cGAUqFpfzsbST/THNC3rWlh8YzoB8EF0wL4Jo=;
        b=Y9gYLVSsSsAURTpZgAUrqR1kR4WackJ1kCvdAT9Or1iFVVEYdNq2UW50OiPDbSCq3Q
         oNnQ/tl/GNCEQAxr7DsYpi3yPWHsoKNZzTFyn36eXXx53s5HeBnut24Hh0NSHadlpoyq
         sDW+DE07GLIYCs+npJhu4UrKuIm0sDh20LTzCKfNJnxl2l7sJSGt17YkGE6McxTQWIeU
         B1m5wb9lR8OHmn0nV5UFtOJO7SU6F/WCOmH5g/LGhynDtZzwwp48w/Su/IosUH8t7g9B
         v7w//ru0qDqjT62B53VqOKn7Fi2ZVTogGlteN6hsRYwqgdcwifT3+HKzAy1eaX/Dx2eO
         EQOQ==
X-Gm-Message-State: AOJu0YyT+FjjYGEeJ8+4yE7X8Q7rKDpoZSeJofk8CBTLR2/OJYwzVaus
	TKM6QPm9PGMxHtmluPGHv1duifVgdOtSQfq68q+108dNKF9N/h6csF77vGgYbea3HxL+hYmZmNI
	yy66Nqbs=
X-Gm-Gg: AY/fxX58vHtfagGt7lvegjkRqW69FcajLW3Hgt3tlHChNnv5p01OOl1zL93OHV92bhJ
	IhUgEzwzA93MjXwHfpy9uP5LXIPlO31wJBW+maIc20H5db8dFA3KPZzVZ4DONafLo0ea1K5/o1Y
	yc38AVAMsIZDIVaUciBkvwmKagi8qfW3l9ocsQLXCgntyKeIUpWTTvN5gD2egps/WunyaNj7S3a
	Ya2ZJoiFoyZ0INBFUbpR/QogzoZ23FlteFgCnrCeN+GkgI0vEDJNioOxczLsKjOJ/MTgBOxTibn
	tGYjEDcCZpkzePE0hRWV4sRlS/tmPUdA1A4ztBc0qq+BCGmmEusvom6s4UTj5H7UGNnx6meb6gK
	suJClKPXj1rJQiJSifxPJZYzMtuMXVDsOFdvOYyFRCWe1ScezQC45JYMIaopKqDIQ7ghPgHcnOO
	FitdIhrGdo8bmNUjalT1dj9by4ovJAaXF/VkZ5FsBLFlc1ZIcW2t7bJ/JPCdCXHQOv
X-Google-Smtp-Source: AGHT+IFeBuQq/NRIF+bn+290PdoVdeXiatI+MjsH+TEuw2EW7Im36kVygEPS05zoecD2plIKL7jITA==
X-Received: by 2002:a05:620a:26e5:b0:8b2:9aba:e887 with SMTP id af79cd13be357-8c38936ef06mr993320085a.24.1767988738480;
        Fri, 09 Jan 2026 11:58:58 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a794bsm898707485a.9.2026.01.09.11.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 11:58:57 -0800 (PST)
Message-ID: <14d13878-7c11-43e2-8128-d4c1d317a24a@baylibre.com>
Date: Fri, 9 Jan 2026 14:58:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 0/6 v3] python3: upgrade 3.13.11 -> 3.14.2
To: openembedded-core@lists.openembedded.org
References: <188918745128404E.2783356@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <188918745128404E.2783356@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 19:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229144

I seem to have missed a module import issue this time around. Will send 
a response to this or a v4 depending on how complicated the fix becomes.

- Trevor

On 2026-01-09 10:06, Trevor Gamblin via lists.openembedded.org wrote:
> Compared to v2
> (https://lists.openembedded.org/g/openembedded-core/message/228232):
>
> - rebase on top of the 3.13.11 python3 recipe in master;
> - add a patch to include the _ast_unparse module in the core split, fixing some
>    import issues for annotationlib
>
> I've kept the original ptest, reproducibility, and buildall checks in the
> respective patches, but here is another set of runs for completeness:
>
> ptests:
>
> |== Tests result: SUCCESS ==
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
> |Total tests: run=46,462 skipped=2,384
> |Total test files: run=483/491 skipped=28 resource_denied=8
> |Result: SUCCESS
> |DURATION: 224
> |END: /usr/lib/python3/ptest
> |2026-01-08T14:58
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
>
> Reproducibility OK (saw issue with gcc-doc, but not python3):
>
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/gcc-doc_15.2.0-r0_amd64.deb
> |The following ipk packages are different and not in exclusion list:
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/gcc-doc_15.2.0-r0_x86-64-v3.ipk
> |The following rpm packages are different and not in exclusion list:
> |/home/tgamblin/workspace/yocto/openembedded-core/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/gcc-doc-15.2.0-r0.x86_64_v3.rpm
> |
> |2026-01-08 13:18:28,640 - oe-selftest - INFO - ----------------------------------------------------------------------
> |2026-01-08 13:18:28,640 - oe-selftest - INFO - Ran 1 test in 1285.587s
> |2026-01-08 13:18:28,640 - oe-selftest - INFO - FAILED
> |2026-01-08 13:18:28,640 - oe-selftest - INFO -  (failures=1)
> |2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS:
> |2026-01-08 13:18:31,656 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED (1285.41s)
> |2026-01-08 13:18:31,660 - oe-selftest - INFO - SUMMARY:
> |2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1285.588s
> |2026-01-08 13:18:31,660 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)
>
> buildall-qemu:
>
> |BUILDALL-QEMU LOG FOR python3
> |START TIME: 2026-01-08_13:27:10
> |HOSTNAME: megalith
> |HOST OS: Fedora Linux 43 (Server Edition)
> |HOST KERNEL: 6.17.12-300.fc43.x86_64
> |===============
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
> |===============
> |PASSED: 23
> |FAILED: 1
>
> Previous iteration details below.
>
> Compared to v1
> (https://lists.openembedded.org/g/openembedded-core/message/227955):
>
> - Drop python3-bcrypt upgrade, as someone else has submitted that;
> - Drop rpm patch to manually override Python3_SITEARCH with a patch, as that was
>    masking the real issue (see below);
> - Add a new patch to fix python3targetconfig by exporting _PYTHON_PROJECT_BASE,
>    which Python's sysconfig looks for (as of 3.14.0) when doing
>    cross-compilation. The absence of this was resulting in packages like rpm
>    finding paths for the native interpreter when making use of sysconfig, when
>    they needed the host values.
>
> Note that I've dropped my own version of the python3-bcrypt upgrade, but I
> tested this patch series on top of the other one that was submitted, as
> otherwise the ptest images would break during build (version mismatch errors
> around PyO3, which is fixed with the bcrypt upgrade).
>
> v1 details below.
>
> This supersedes a previous series sent, which only did the 3.14.0 upgrade.
>
> Compared to the first series
> (https://lists.openembedded.org/g/openembedded-core/message/227310), I've
> done the following:
>
> - Added a commit for including the '_py_warnings' and 'annotationlib' modules in
>    python3-core;
> - Adds the python 3.14.2 upgrade;
> - Removed commits for adding python3-misc to RDEPENDS for python3-pytest and
>    python3-jsonpointer, as these are now solved by a new patch to add new modules
>    to python3-core in the manifest. Doing it this way was fragile in the sense
>    that there were many other recipes needing this same fix that testing didn't
>    easily catch, and it doesn't make sense to add python3-misc to recipe RDEPENDS
>    just because (for example) python3-logging (another package split) is trying
>    to make use of warnings, but can't find the right module;
> - Modified the rpm commit to apply a patch (submitted upstream) to fix
>    CMakeLists.txt, rather than a do_configure prepend;
> - Fixed the Python 3.14.0 upgrade commit so that one of the patches we carry to
>    skip tests doesn't include duplicate calls to the relevant skip functions.
>
> I've kept the upgrades from 3.13.11 to 3.14.0 and 3.14.0 to 3.14.2 separate to
> reflect separate testing and let people review those changelogs individually if
> desired.
>
> Trevor Gamblin (6):
>    python3: upgrade 3.13.11 -> 3.14.0
>    python3targetconfig: export _PYTHON_PROJECT_BASE
>    python_pep517: add --prefix to nativepython3 call
>    python3: upgrade 3.14.0 -> 3.14.2
>    python3: add _py_warnings, annotationlib to core
>    python3: add _ast_unparse to core
>
>   meta/classes-recipe/python3-dir.bbclass       |    2 +-
>   .../python3targetconfig.bbclass               |    1 +
>   meta/classes-recipe/python_pep517.bbclass     |    2 +-
>   ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
>   ...-use-prefix-value-from-build-configu.patch |   35 +-
>   ...sts-due-to-load-variability-on-YP-AB.patch |   31 +-
>   ...ctive_children-skip-problematic-test.patch |   17 +-
>   ...1-test_cmd-skip-bang-completion-test.patch |   31 +
>   ...-test_unix_console.test_cursor_back_.patch |   46 +
>   ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
>   .../python/python3/python3-manifest.json      |    6 +-
>   .../{python3_3.13.11.bb => python3_3.14.2.bb} |   20 +-
>   12 files changed, 188 insertions(+), 1487 deletions(-)
>   delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
>   rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.14.2.bb} (95%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229126): https://lists.openembedded.org/g/openembedded-core/message/229126
> Mute This Topic: https://lists.openembedded.org/mt/117176199/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

