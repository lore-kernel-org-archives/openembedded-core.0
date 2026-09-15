Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCC8C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:37:55 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4671.1789498973417726165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=CMwJ5hMT;
 spf=pass (domain: baylibre.com, ip: 74.125.224.141, mailfrom: tgamblin@baylibre.com)
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43da99ddso1051917b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789498972; x=1790103772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1oODODeUANnYduBcsJozrzZEltx5AgSmju83kErrHM=;
        b=CMwJ5hMT1yMIONLbREBUnUDQBd1WunyrI8ZVX2JU3KddG/wsFC9HGpB0EzIRYt2lVF
         Ol9qC/E/0YMcpDFvl9vhK7FKNeDIG6ZrNffj3e5/F5g0uryvKwGYjgr2MDe7scLxnxMA
         9rxKIouM4XHrO+GFbWRHWhFxJGLI635KVF053NNeJEL13ewmjn7c2oCqxyL8R7bmQjHv
         vxoyO2Ui4KImyFUg7/nPsLZF50hv3xQYfP9Asx3edaWP7qn7xoRKmhP1WxWd3LPKGNyd
         PB2X84FX0YNZ/G5kYtUq4S2NAdvr6kDkTDJI+eDZa0EreLpb4rFNZ8Y8pRkU5yvBIIP9
         Zv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498972; x=1790103772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1oODODeUANnYduBcsJozrzZEltx5AgSmju83kErrHM=;
        b=Dff/TwpIer6LAD9Qbz9fsonKDa1fMaYL0sAHcKBzec7oGKBR1AdSvZ18NUFNeus1Ls
         okYbFsksOFcDvxgo6CzKRGH5zD4UOwYBykepfP/Uu4AbV2IKXKnUwl58fZyOGZXyqtUq
         oNUDbejnLPtvLlPAJ4AgwKjH46pSP3dIutM0bKZKwyWN5OFOHC9jUBcELeCJiIv4wyPj
         /KRj06/mRELVRzJq5khdts3QBVC7Nlfpi0TYp+0miaBxGez3HuV/XVqaYCRVFqRS8yfb
         MqrZI8oiQMcgvJF92514SncUjp7xYoVS8NO7lEl+RQqpcnn6I66F1CtoItpa8akcgnSy
         /gXQ==
X-Gm-Message-State: AFuF++mY+TIj0NhOXpRpwHTYporMts0jxvVPP1T71JZ1R5/SG1avMzHU
	VQkFw7Iuj1pvny+/4D0dal9k32/DqvEy2fG8Yb6XZ5lWWuVPxV7aGZtadP9nxjTphk2zY+XSm6X
	6zrAw
X-Gm-Gg: AYBFou0wgoJzExMkTs502ye3HDEydKWuG4aMu54BkD8u+Af2//91pkXtolFVl8l9ULk
	F4FT0/qTrY7DMth1rBsvCBhvWzN+1wgSKqL51toqvaTuhz3SPKUQG5n3z4wg2XsJPcbWain96RM
	ChGXhjShviSRUuLsPRDo6y7Jdv60QPzh4KYoHUHYz4mTsufyHjkU2j0w+4yTYtTcY/13y4ykXyl
	XM+dHTOlX23CiF6/xvYYpZdAqzrbKawK1qxAifgOSs8xlNrJ/PJ1aYc02TLCCYJCeUvOtvbv02A
	rFWUUh5g9gUildzRQ70/cCVfU72oQVmjuz4CD59NWdUXUHslQSb4gT/RazU9mSzUpzKr4U2uyoH
	xJlg7x8jGJRZpcNcPJcfviDpGAUz8mHf86uhiznBSta0M7SbdjTCaYZb4RDZuprU3OVg9ZzN2od
	bQDZqbsnKgYQh1pj9GVnT8A2o4FCNs+3hDBPLSI5q/c280agUrHAJNRqF7WNhEJWhIjmY9WZD5r
	az6cVyEBY6SsXG87Cu3h0nRfXRrP63HvQ==
X-Received: by 2002:a05:690c:e3e4:b0:873:5bd1:98b5 with SMTP id 00721157ae682-88d22edf660mr32656767b3.39.1789498972018;
        Tue, 15 Sep 2026 12:02:52 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81cefa3bsm25434585a.34.2026.09.15.12.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:02:46 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 00/14] riscv: add new ISA extensions and profile support
Date: Tue, 15 Sep 2026 15:02:30 -0400
Message-ID: <20260915190244.2983746-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245875

# Overview

Support for the RISC-V architecture and a basic set of extensions has been
available in oe-core for a long time now, and as of late 2025, QEMU defaults to
the RVA23S64 profile when booting qemuriscv64 images. However, at the userspace
level, we currently support only the standard "riscv64gc" profile (behind a
generic "riscv64" identifier), which is common across the wider open-source
ecosystem, but lacks many of the features which are starting to become necessary
for more advanced experimentation and testing on RISC-V platforms. This series
aims to remedy that by introducing several distinct changes across a few files.
I've broken it up on a per-profile basis for easier review, but the final
version could probably feature some squashed commits. It could also go the route
of breaking tunings up more in the style of those in conf/machine/include/arm/,
but I'll leave them as-is for now to avoid even more rework that needs
reviewing.

A list of changes, by group:

1. Basic clarification changes and extra tunings:
    a. tune-riscv: be explicit about riscv64gc default
    b. tune-riscv.inc: add 'riscv64gcv' tune
2. Adding official RVA20 profile extensions, and supporting the explicit choice
of 'rva20u64' as a tuning option for builds:
    a. arch-riscv.inc: add missing RVA20 extensions
    b. meta/lib/oe/tune.py: support profile strings, add rva20u64
    c. tune-riscv.inc: add rva20u64 to AVAILTUNES
3. Adding RVA22 profile support:
    a. arch-riscv.inc: add rva22u64 extensions
    b. meta/lib/oe/tune.py: add rva22u64 profile
    c. tune-riscv.inc: add rva22u64 to AVAILTUNES
4. Adding RVA23 profile support:
    a. arch-riscv.inc: add rva23u64 extensions
    b. meta/lib/oe/tune.py: add rva23u64 profile
    c. tune-riscv.inc: add rva23u64 to AVAILTUNES
5. Quality-of-life fixups after 1-4:
    a. meta/lib/oe/tune.py: add riscv_pkgarch()
    b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EXACT
       in assignments
    c. tune-riscv.inc: append zifencei extension to profiles

These changes are also in my contrib branch[1]. The main sources of truth used
were gcc's '-march' options list[2], the official RISC-V International
documentation[3], and the RISC-V ISA Explorer[4], with the gcc specifics as the
preferred source. When comparing against gcc's output, commands like the
following were run:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$ riscv64-linux-gnu-gcc -march=rva23u64 -mabi=lp64d -Q --help=target | grep rv64
|  -march=                               rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_z

However, as is visible above, the extension list became so long for the RVA23
case that it was truncated, and so a more verbose output from the following was
checked instead:

|riscv64-linux-gnu-gcc -march=rva23u64 -mabi=lp64d -v -xc /dev/null -c -o /dev/null

For now, the default tuning remains riscv64gc (with the naming rework in 1a),
despite the presence of the other profiles. It is critical to note that not all
combinations of the RISC-V extensions may be valid or useful to use for
projects, and whenever possible a ratified profile's corresponding tune (e.g.
"RVA22" -> "rva22u64") should be extended rather than picking and choosing each
feature. There are also several extensions which are depended on by others (e.g.
'zkt' is needed by 'b'), and other known examples which aren't strictly part
of the official profiles but must be included for the Yocto/OE case, such as
'zifencei' being necessary to build the Linux Kernel (which already had been
addressed before, but this series handles slightly differently). This series
makes no attempts to add extensions which are not part of these profiles - those
could be added in future series, but these changes are significant enough for
now. It might be worth adding some more documentation about how all of this
works - I'd be happy to hear what people think about that too.

One significant change to the way profile strings are processed with
these patches shows up in sstate/build path naming, and is part of the reason
for patch 5a and 5b above - before, a build directory might have a path in it
like:

|build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/

This was fine when the extension list was short (for riscv64gc), but with the
full RVA profiles, the paths started to get so long that bitbake would produce
this error:

|ERROR: Unable to reduce sstate name to less than 255 chararacters

To solve this problem, meta/lib/oe/tune.py now supports a very short list of
profile names, and includes a new function riscv_pkgarch() designed to compare
selected extensions against known profiles and determine if once has implicitly
been selected. As an example, if you set the following in local.conf:

|TUNE_FEATURES = "${@oe.tune.riscv_isa_to_tune('riscv64gc')} ziccamoa ziccif zicclsm ziccrse zicntr zicsr zmmul za128rs zaamo zalrsc zca zcd"

and then run 'bitbake -e opensbi', you will see:

|PACKAGE_EXTRA_ARCHS="rva20u64_zifencei"

With all of this combined, subdirectories in tmp/work/ look like:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls build/tmp/work
|all-poky-linux          riscv64imafdcv_zicsr_zifencei-poky-linux  rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux  rva22u64_zifencei-poky-linux  x86_64-linux
|qemuriscv64-poky-linux  riscv64imafdc_zicsr_zifencei-poky-linux   rva20u64_zifencei-poky-linux                               rva23u64_zifencei-poky-linux

Note that the 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux'
configuration is a custom one I set in local.conf only for testing purposes.
Custom tunings still run the ris(c|k) of exceeding the naming length, which we
may need some extra logic to handle (or, again, find a way to make it behave
more like arm) if we want to enable freely customizing build tunings. This is an
area where I'm hoping there will be some suggestions, as the way to do this in
local.conf seems fairly ugly (but maybe that's a good thing?):

|DEFAULTTUNE = "rva20u64"
|TUNE_FEATURES = "${@oe.tune.riscv_isa_to_tune('rva20u64')} zihintpause zvbb zimop zcmop zifencei"

A consequence of doing this is that a lot of other variables related to the
tuning features get "polluted":

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ bitbake -e opensbi | grep PACKAGE_EXTRA_ARCHS
|#     "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
|#   "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
|# $PACKAGE_EXTRA_ARCHS [11 operations]
|#     [_defaultval] "${PACKAGE_EXTRA_ARCHS:tune-${DEFAULTTUNE}}"
|#   "${PACKAGE_EXTRA_ARCHS:tune-${DEFAULTTUNE}}"
|PACKAGE_EXTRA_ARCHS="rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb"
|# $PACKAGE_EXTRA_ARCHS:tune-riscv32gc
|PACKAGE_EXTRA_ARCHS:tune-riscv32gc="rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb"
|# $PACKAGE_EXTRA_ARCHS:tune-riscv32nf
|PACKAGE_EXTRA_ARCHS:tune-riscv32nf="rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb"
|# $PACKAGE_EXTRA_ARCHS:tune-riscv64gc
|PACKAGE_EXTRA_ARCHS:tune-riscv64gc="rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb"

# Testing

Testing different profiles' validity against the compiler involved setting (for
example) DEFAULTTUNE = "rva23u64" and then running 'bitbake opensbi' (which also
results in a kernel rebuild) as a quick smoke test. I've also opted to do full
image builds to make sure that the new profiles fully boot and run without any
obvious errors. Because I've been playing with coreutils on qemuriscv64 a lot
lately, here are example results with each profile (plus riscv64gc and
riscv64gcv, for completeness) enabled on a build and test of
core-image-ptest-coreutils. Note that when the vector extension is enabled
(riscv64gcv, rva23u64), the test duration is significantly higher:

riscv64gc:

|============================================================================
|Testsuite summary for GNU coreutils 9.11
|============================================================================
|# TOTAL: 733
|# PASS:  561
|# SKIP:  172
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 671
|END: /usr/lib/coreutils/ptest
|2026-09-15T15:45
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

riscv64gcv:

|============================================================================
|Testsuite summary for GNU coreutils 9.11
|============================================================================
|# TOTAL: 733
|# PASS:  561
|# SKIP:  172
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 940
|END: /usr/lib/coreutils/ptest
|2026-09-15T16:39
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

rva20u64:

|============================================================================
|Testsuite summary for GNU coreutils 9.11
|============================================================================
|# TOTAL: 733
|# PASS:  561
|# SKIP:  172
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 660
|END: /usr/lib/coreutils/ptest
|2026-09-15T15:02
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

rva22u64:

|============================================================================
|Testsuite summary for GNU coreutils 9.11
|============================================================================
|# TOTAL: 733
|# PASS:  561
|# SKIP:  172
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 615
|END: /usr/lib/coreutils/ptest
|2026-09-15T13:48
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

rva23u64:

|============================================================================
|Testsuite summary for GNU coreutils 9.11
|============================================================================
|# TOTAL: 733
|# PASS:  561
|# SKIP:  172
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 966
|END: /usr/lib/coreutils/ptest
|2026-09-15T12:18
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

[1]: https://git.openembedded.org/openembedded-core-contrib/log/?h=tgamblin/riscv64-tuning-rework
[2]: https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
[3]: https://docs.riscv.org/reference/home/index.html
[4]: https://riscv.github.io/riscv-isa-explorer/

Trevor Gamblin (14):
  tune-riscv: be explicit about riscv64gc default
  tune-riscv.inc: add 'riscv64gcv' tune
  arch-riscv.inc: add missing RVA20 extensions
  meta/lib/oe/tune.py: support profile strings, add rva20u64
  tune-riscv.inc: add rva20u64 to AVAILTUNES
  arch-riscv.inc: add rva22u64 extensions
  meta/lib/oe/tune.py: add rva22u64 profile
  tune-riscv.inc: add rva22u64 to AVAILTUNES
  arch-riscv.inc: add rva23u64 extensions
  meta/lib/oe/tune.py: add rva23u64 profile
  tune-riscv.inc: add rva23u64 to AVAILTUNES
  meta/lib/oe/tune.py: add riscv_pkgarch()
  arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EXACT
    in assignments
  tune-riscv.inc: append zifencei extension to profiles

 .../conf/machine/include/riscv/arch-riscv.inc | 198 ++++++++++++++++--
 .../conf/machine/include/riscv/tune-riscv.inc |  24 ++-
 meta/lib/oe/tune.py                           |  42 +++-
 3 files changed, 240 insertions(+), 24 deletions(-)

-- 
2.55.0


