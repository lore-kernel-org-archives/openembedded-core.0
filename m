Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C101CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:41:54 +0000 (UTC)
Received: from mail-qv2-f20.google.com (mail-qv2-f20.google.com [74.125.230.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18020.1790786297295833757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=A/cgJd3k;
 spf=pass (domain: baylibre.com, ip: 74.125.230.148, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f20.google.com with SMTP id 6a1803df08f44-9178b9b7ecfso20716896d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786296; x=1791391096; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J6EqT8+oP1XDNDc61KA+7/poaMh8Hr2CJRkCTQFHJUk=;
        b=A/cgJd3kwghLrj2A2O+wZbTx7wMtxWRKeV9k/4w2WFM+dQyjn3BBXKsnCHZhk2hZa+
         1f/LD+xnB/BruUu5O9p3E1cmJfnPCuQcJm8z5HRIu6qjn2B91YU7cSrYoGRUD8c0vN80
         pJxmpUyGZMB9UOHOPBoRaz2VL21/dKChccvWAbN4e49m+RKGWGN+jdHuu1VZ7DiQ2PMM
         8hXrbgIC14ML+ZgG+44DpgizWhB+pXP7f1QbSf6VueTZC+DkmpLWj5gw6AX3I5wLloup
         euU+lRn2aKg7HczQ2rWbg0MnrxHUWpXdunNuH+KqtjyGzopGSabYWQ1BPRk3hKQ225do
         wE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786296; x=1791391096;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J6EqT8+oP1XDNDc61KA+7/poaMh8Hr2CJRkCTQFHJUk=;
        b=Pf/1/0AzrS0TEEjtxihwz4FW6dnHYwtJMsAluPXWfcnr/oAbkpg0pCKImMIFHsNQzG
         YNDj/cAkrElcA7C1GLXs4O8nMZ/+FOBu/IjjZ0WfZ1J0vg2WpNJ1MnttrHUmouf3zNFn
         gK2TSgFysBZ5NeIQuXzfrqCuPesInIsWfdbsEc2ZPb7cpAoMeZoK27iAGg3OSU44WBQA
         xCYRbGIitZkE1cr5OOi2UKe4pzeJawObHM4APhus4RjoCFZOjX71gubfPmqzdiWxzhnb
         MBavVMfBdqHhPZ94lUrZ9NBYv7ucu2CIh/0osDNQ9wInrL5kn8qSeckgC6qd0rOG7pd5
         1j/Q==
X-Gm-Message-State: AFuF++mR3hBQRmRU7glkRGf/iP5fgXDYjLphiID8dXYSgf8cGWefudyr
	IqWuj0P4LJm41F7r3uikCE6sREwwKyBYzyMCp/J+TJv/t6XrzKbGdQQ0CBi15wgHVh8x9joArNg
	mNXvV
X-Gm-Gg: AYBFou3/Wc3FBLIYkDOqIumYxlPL0CaPygiLHrCfWWMFCl4lc6S73nXsHOtZrKh8MOH
	YstVOkr7r6AeTq6+DZYVTguhE3zyRM0ExJiPOO4VmetZu6TrIeZInHBiKuoN7msuU460AdMHuwK
	aX28mdVqMdePAzdet6//TOgOY1k2UE9YC62Y29kjrlQVJteeUTEGJ5WesMqx8GEBvIq8LWrQW4f
	AgeE2btOOj1mbSSIXd9emCEVnqFXNAVk9Z01VoWd+C5hHGghs0sUKJVUjqMS1JQyCMt2UcW4oOA
	ksaBhm3ThMrBObfhcwKXhyUl0Hx3g1evZfyNSAledMhWesLc4hdvbSfwXzrcQnDbY+FZyBuwRqR
	/5pEMzr94Bb175gk1HJ7a/D4xM2qWiT1x6OO8YhhR+N+J8TOcD2qH+mL2TqtSRAHIIZwomj+nx/
	CITatolNrmj8MYDWiYxXMj9fdUYfNL5wL23FQJRKr8eNegG5tEKjGRWpwoLKaToPpZZSpNbBYIl
	lHBJ6mRNac6wFwjOG/7Aq8slC93lD5MqLE25KUVgQg=
X-Received: by 2002:a05:6214:4346:b0:917:8ea8:cf48 with SMTP id 6a1803df08f44-917a0b26b7emr33547896d6.11.1790786295787;
        Wed, 30 Sep 2026 09:38:15 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:15 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: [OE-core][PATCH RFC v2 00/19] riscv: add new ISA extensions and profile support
Date: Wed, 30 Sep 2026 12:38:04 -0400
Message-Id: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NsQ6CQBBEf8Vs7RLuROCsTIy2JrbGAs4FV+XO7
 CFqDP8uaGP5JjNv3hBImAIsJm8Q6jiwdwPo6QTsqXA1IR8HBh3rNDbaoHCwHbZ3x65GoYeXCyY
 qq9JcaV2ZGIblTaji59e6h91mBYdfGO7lmWw7+vbbNVovdBj7lfgG25NQ8fel5srEOkkibfJZl
 qSosK2LpryyW5bF68qlUGR9A33/ASUii6jGAAAA
X-Change-ID: 20260929-riscv-tuning-rework-417f68122f90
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246980

Changes since v1:

- Fixed broken riscv32 changes
- Squashed zifencei changes into new profiles to avoid broken commits
- Kept legacy "riscv64" and "riscv32" as aliases to avoid breaking
  dependent layers
- Replaced use of 'contains()' with 'contains_any()' for
  TUNE_RISCV_MARCH lines in arch-riscv.inc where extensions implied
  others, e.g. 'm' and 'zmmul'. This means that existing riscv64gc
  builds will be rebuilt from scratch because TUNE_CCARGS is different.
  It could also cause issues with older toolchains - I haven't tested
  this.
- Fixed incorrect b -> zkt implied relationship
- Fixed missing extensions in rva23u64 commit message
- Fixed za64rs and za128rs ordering in arch-riscv.inc
- PACKAGE_EXTRA_ARCHS for the profile tunes now lists compatible lower
  archs (gc, then rva20, then rva22, and gcv under rva23)
- RISCV_PROFILES is now documented as a fixed ABI definition that cites
  the Profiles spec
- Implied extensions are dropped from package arch names, and existing
  names stay unchanged
- Added new riscv_implied() function, and a 'RISCV_IMPLIED' table to
  check against
- Added selftests for tune.py Python code in oelib/tune.py
- Added selftests checking integration of default and 'unusual' tunes
  against build system, using libgcc-initial as a build target
- Updated cover letter with new info, removed coreutils test results
  which were not helpful

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
    a. tune-riscv: be explicit about riscv32gc, riscv64gc defaults
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
    c. tune.py: add implied tuning logic
    d. tune.py: add vector extensions to RISCV_IMPLIED
    e. tune-riscv.inc: add RISCV_PKGARCH vars, set PACKAGE_EXTRA_ARCHS
    f. tune-riscv.inc: clarify zifencei comment
6. Selftests:
    a. selftest: oelib: add tune.py
    b. selftest: cases: add riscvtune.py

These changes are also in my contrib branch[1]. The main sources of
truth used were gcc's '-march' options list[2], the official RISC-V
International documentation[3], and the RISC-V ISA Explorer[4], with the
gcc output used to cross-check the results. When comparing against gcc's
output, commands like the following were run:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$ riscv64-linux-gnu-gcc -march=rva23u64 -mabi=lp64d -Q --help=target | grep rv64
|  -march=                               rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_z

However, as is visible above, the extension list became so long for the RVA23
case that it was truncated, and so a more verbose output from the following was
checked instead:

|riscv64-linux-gnu-gcc -march=rva23u64 -mabi=lp64d -v -xc /dev/null -c -o /dev/null

For now, the default tuning remains riscv64gc (with the naming rework in
1a), despite the presence of the other profiles. There are also several
extensions which are depended on by others, and other known examples
which aren't strictly part of the official profiles but must be included
for the Yocto/OE case, such as 'zifencei' being necessary to build the
Linux Kernel (which already had been addressed before, but this series
handles slightly differently). No attempts are made to add extensions
which are not part of these profiles - those could be added in the
future, but these changes are significant enough for now. It might be
worth adding some more documentation about how all of this works - I'd
be happy to hear what people think about that too.

One significant change to the way profile strings are processed with
these patches shows up in sstate/build path naming, and is part of the
reason for patch 5a-5d above. Before, a build directory
might have a path in it like:

|build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/

This was fine when the extension list was short (for riscv64gc), but with the
full RVA profiles, the paths started to get so long that bitbake would produce
this error:

|ERROR: Unable to reduce sstate name to less than 255 chararacters

To solve this problem, meta/lib/oe/tune.py now supports a very short
list of profile names, and includes new functions (riscv_pkgarch() and
riscv_implied()) designed to compare selected extensions against
dependencies (profile and otherwise), and shorten path names
appropriately. As an example, if you set the following in local.conf:

|AVAILTUNES += "my-rva20-tune"
|TUNE_FEATURES:tune-my-rva20-tune = "${@oe.tune.riscv_isa_to_tune('rv64gc')} ziccamoa ziccif zicclsm ziccrse zicntr za128rs"
|PACKAGE_EXTRA_ARCHS:tune-my-rva20-tune = "${TUNE_RISCV_PKGARCH}"
|DEFAULTTUNE = "my-rva20-tune"

then 'bitbake-getvar --value TUNE_PKGARCH' shows that it is recognized
as the RVA20 profile:

|rva20u64_zifencei

Extensions implied by others (e.g. 'zmmul', implied by 'm') don't need
to be listed, but if they are the same result is obtained.

With all of this combined, subdirectories in tmp/work/ look like:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls build/tmp/work/
|all-poky-linux          qemuriscv64-poky-linux                   rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux  rva23u64_zifencei-poky-linux
|qemuriscv32-poky-linux  riscv32imafdc_zicsr_zifencei-poky-linux  rva20u64_zifencei-poky-linux                               x86_64-linux

Note that 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux' is
a custom configuration that I set in local.conf only for testing
purposes. Custom tunings still run the ris(c|k) of exceeding the naming
length, which we may need some extra hashing logic (maybe a bitmask?) to
handle if we want to enable freely customizing build tunings. 

# Testing

Testing different profiles' validity against the compiler involved
setting (for example) DEFAULTTUNE = "rva23u64" and then running 'bitbake
opensbi' (which also results in a kernel rebuild) as a quick smoke test.
I've also opted to do full image builds to make sure that the new
profiles fully boot and run without any obvious errors. I've also run a
series of boot tests (including ptests for packages like coreutils).
Note that when the vector extension is enabled (riscv64gcv, rva23u64),
test durations will generally be higher.

As of v2, I've added some selftests to help:

1. The 'oelib.tune' suite at meta/lib/oeqa/selftest/cases/oelib/tune.py,
   for testing the riscv_pkgarch(), riscv_isa_to_tune(), and
   riscv_implied() functions
2. The 'riscvtune' suite at meta/lib/oeqa/selftest/cases/riscvtune.py,
   for parsing and building against defined and unusual custom tunes to
   ensure they each yield a usable package arch

These can be run with:

oe-selftest --run-tests oelib.tune
oe-selftest --run-tests riscvtune

Results from each:

oe-selftest --run-tests oelib.tune:

|2026-09-30 11:29:04,157 - oe-selftest - INFO - ----------------------------------------------------------------------
|2026-09-30 11:29:04,157 - oe-selftest - INFO - Ran 14 tests in 5.131s
|2026-09-30 11:29:04,157 - oe-selftest - INFO - OK
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS:
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvImplied.test_implied: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvImplied.test_profiles_nest: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvImplied.test_zicsr_kept: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_abbreviation: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_explicit: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_not_riscv: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvIsaToTune.test_profile: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvPkgarch.test_exact_drops_implied: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvPkgarch.test_exact_keeps_bitmanip: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvPkgarch.test_existing_names_unchanged: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvPkgarch.test_implied_not_listed: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvPkgarch.test_most_specific_profile: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvPkgarch.test_no_features: PASSED (0.00s)
|2026-09-30 11:29:06,594 - oe-selftest - INFO - RESULTS - oelib.tune.TestRiscvPkgarch.test_profiles: PASSED (0.00s)
|2026-09-30 11:29:06,595 - oe-selftest - INFO - SUMMARY:
|2026-09-30 11:29:06,595 - oe-selftest - INFO - oe-selftest () - Ran 14 tests in 5.131s
|2026-09-30 11:29:06,595 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=14, skipped=0, failures=0, errors=0)

oe-selftest --run-tests riscvtune:

|2026-09-30 11:29:53,910 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/tgamblin/workspace/ypbuilds/poky-qemuriscv64/build-st/conf/local.conf
|2026-09-30 11:29:53,910 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
|2026-09-30 11:29:54,568 - oe-selftest - INFO - test_riscv_default_tunes (riscvtune.RiscvTuneTests.test_riscv_default_tunes)
|2026-09-30 11:30:23,372 - oe-selftest - INFO -  ... ok
|2026-09-30 11:30:23,372 - oe-selftest - INFO - test_riscv_unusual_tunes (riscvtune.RiscvTuneTests.test_riscv_unusual_tunes)
|2026-09-30 11:31:34,612 - oe-selftest - INFO -  ... ok
|2026-09-30 11:31:39,676 - oe-selftest - INFO - ----------------------------------------------------------------------
|2026-09-30 11:31:39,676 - oe-selftest - INFO - Ran 2 tests in 105.884s
|2026-09-30 11:31:39,676 - oe-selftest - INFO - OK
|2026-09-30 11:31:42,109 - oe-selftest - INFO - RESULTS:
|2026-09-30 11:31:42,109 - oe-selftest - INFO - RESULTS - riscvtune.RiscvTuneTests.test_riscv_default_tunes: PASSED (28.80s)
|2026-09-30 11:31:42,109 - oe-selftest - INFO - RESULTS - riscvtune.RiscvTuneTests.test_riscv_unusual_tunes: PASSED (71.24s)
|2026-09-30 11:31:42,109 - oe-selftest - INFO - SUMMARY:
|2026-09-30 11:31:42,110 - oe-selftest - INFO - oe-selftest () - Ran 2 tests in 105.885s
|2026-09-30 11:31:42,110 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=2, skipped=0, failures=0, errors=0)

[1]: https://git.openembedded.org/openembedded-core-contrib/log/?h=tgamblin/riscv-tuning-rework
[2]: https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
[3]: https://docs.riscv.org/reference/home/index.html
[4]: https://riscv.github.io/riscv-isa-explorer/

---
Trevor Gamblin (19):
      tune-riscv: be explicit about riscv32gc, riscv64gc defaults
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
      arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EXACT in assignments
      tune.py: add implied tuning logic
      tune.py: add vector extensions to RISCV_IMPLIED
      tune-riscv.inc: add RISCV_PKGARCH vars, set PACKAGE_EXTRA_ARCHS
      tune-riscv.inc: clarify zifencei comment
      selftest: oelib: add tune.py
      selftest: cases: add riscvtune.py

 meta/conf/machine/include/riscv/arch-riscv.inc | 198 ++++++++++++++++++++++---
 meta/conf/machine/include/riscv/tune-riscv.inc |  43 +++++-
 meta/conf/machine/qemuriscv32.conf             |   2 +-
 meta/lib/oe/tune.py                            | 102 ++++++++++++-
 meta/lib/oeqa/selftest/cases/oelib/tune.py     |  88 +++++++++++
 meta/lib/oeqa/selftest/cases/riscvtune.py      |  96 ++++++++++++
 6 files changed, 503 insertions(+), 26 deletions(-)
---
base-commit: 187f1a5b8e61b0a09c617cd3ccc2e3fd1f6c42bd
change-id: 20260929-riscv-tuning-rework-417f68122f90

Best regards,
--  
Trevor Gamblin <tgamblin@baylibre.com>


