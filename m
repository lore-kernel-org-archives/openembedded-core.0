Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697AAC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:58:34 +0000 (UTC)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2994.1790190264712186713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=CLMKPQLA;
 spf=pass (domain: baylibre.com, ip: 74.125.226.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe9so464602241.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190263; x=1790795063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgCipVHD8xz6WPztzOTJWwcIXfULUhZe67Bnqm/hv3M=;
        b=CLMKPQLA474Bbs3Y1f3Xr11ekUMU9Xv93Mx4f+ITykF8TgKoc64ZfKy59ZLoD/7N/g
         NOLJBzq8rXgqe5zPygXlGEjZnpcyNFXBcj5IdS9w+Pr1ZrNrwZxF2UjYPsbfZvp+d7W/
         0BrjX8jolM5o6o3gssx6+F5ZR9j7N/pJyvcuNmLVxWtC9gELALlZdF2MQRpU3/43GRIl
         idQsEveChAHlMp+ocZ2lRlUK5JDFWkmFa6aFquBpdkRs33HphwWg0MVsoAW922cDCLbO
         vlywxdVf8zaQERlu9oXiS5xtvV7lyWHswobUAIP1r1Vsqu1ytFrsadVADQqhgjKGIIqc
         uUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190263; x=1790795063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fgCipVHD8xz6WPztzOTJWwcIXfULUhZe67Bnqm/hv3M=;
        b=Sun1HQiTQwVWQKngUOLF5sJPBL9c71duDQtukjW7wbNo0orb4o4rKmTJRu3O/tyXMP
         oZXTGLH+DtPfNcJA8a/6BMMUqjWJvimmFIOO9xam5coDkn2vFvcJq72SS/dmSULjNf02
         oLX3Iq2ZtHd8fCY//cmKGoZeByeLvPJdXwGUy9j4IZJPqdF+y6fVLSLA+fftgJNW7+Vo
         YcFL66iI1lZsuAOEWFUWo6LdyuwiuebopI64VRwgc723CKhBE1OxD+EMxWOeltxhDMeJ
         dPv4zJ9n8gCtmEXafHjwYWu6qX+OA3x8r+Xy9c3OsbVte9ceitemVucc9qnUjClc/WZ6
         sLQA==
X-Gm-Message-State: AFuF++loyrvI+Ynttb43BqZrRKpLJVYV8PmY61rkjq7jjlzm1Ak3Cd7C
	PZ4EI43L6GRp63NNCieplUDQbgCvY7Dzdh8QEvGtguP32+VNGbuyj5tb+dap39AO7MK1+91UhCa
	ZbMII
X-Gm-Gg: AYBFou11CzrDtAl5w0jDVwU5Rg8IGzCC3Vqv4SGoBxomxL05UKwcD+wz1Ju8uvdRls0
	TBvjBv1ITOhFO8mXsxjexPmEHyqpspOy1C4vXO5w6GH7gjaTVuU9zUZMASwqMtnjLemEBeD2FUX
	jKYh89dOaa0bnx8xjPEI3KbNwDA/De4Efit4YF+PMuTW64/e72203mNtX0391ZGi1QMYzrqXjuz
	dXUFmlSgQxqYPYnCHWIidwPNmpmO8VbUhudQ1DzytUWG+Xcdgnz+RiUXfzEjSryeQOrplCIqpgp
	BqEUT6yGrbgjiUdmAh6T1IS/InVtMtbxr5bqhy7hMET5w4WDOGjOgwIeYBABwuT2xjDTAeZBJ0v
	qNj/WJ1SPGp8kpL5FUxCtMr8Ce+m6LO4pHD4e/2a0QmHKaz7EsOEiOJMb4lAswRUTX0d4wVQoaO
	4cVCqHbFQuz/o/um+vGkW7KLBxXiJhdJLRh62GuftT1SwYQyNw8WcxozmpnzlM9mIc7dTlsO0kK
	dgsE3JwPhZNt9DS7CI+9h+a3i/Zg770StGKbb7n/Cyj
X-Received: by 2002:a05:6102:1489:b0:7a7:ad9f:53c7 with SMTP id ada2fe7eead31-7af1cb95fdcmr147106137.11.1790190263198;
        Wed, 23 Sep 2026 12:04:23 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516acaad8sm4310095241.13.2026.09.23.12.04.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:22 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 00/13] resulttool: add 'durations' subcommand and selftests
Date: Wed, 23 Sep 2026 15:04:06 -0400
Message-ID: <20260923190419.353493-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246540

This series is motivated by the need to compare durations for various test
results (originally, ptest) as reported by the Autobuilder. In particular, I've
been looking at the intermittent ptest issues seen on the AB for the
qemuriscv64-ptest builders, but we needed a good way to compare per-package
durations before and after commit 6d6aaf4204be ("qemu: backport RISC-V TLB page
flushing patches"). I tested this change locally with coreutils (which showed
roughly 38% improvement on my workstation) and other tests (e.g. libpng, which
showed no meaningful change), and review on the upstream QEMU list confirmed it
helped with boot and runtime performance for qemuriscv64.

This resulttool durations feature provides a means to quantify changes in
duration across more packages at a scale beyond what my machines can handle, and
might be useful to compare before and after other changes (e.g. toolchain tests)
over time. I've also added a variety of test cases for oeqa selftests, covering
everything from basic results parsing to making sure the tool respects
thresholds. Each of those tests is added as a separate commit to make review
easier.

I used Claude Code to help build this out. Design took some refinement,
especially with:

- Comparing delta results for very short tests (i.e. those running for 5-10
  seconds or less) were mostly noise, especially when fractional runtimes were
  calculated under the hood and ended up reporting "0" for both runtimes but
  large (68%, 350%, etc.) deltas. I don't think we have much use for tracking
  differences in such short tests, but I did provide a '-m/--min-duration' to
  tweak this (defaulting to 10) if we want to be able to look at those.
- Durations can vary small amounts (5-10 seconds) across consecutive tests even
  under little or no load, and higher when the host system is under heavy load
  (like the AB workers), so a '-t/--threshold' option is available to filter out
  any tests whose deltas are under a certain percentage. I didn't set a default
  here, but 10% is probably a reasonable one for people to use.
- A sort option '-s/--sort-by-delta' was an obvious add so that it can be used
  to check what the biggest changes are from run to run.
- Importantly, resulttool durations can compare more than two sources. This will
  be critical for tracking how results trend over time, but reporting deltas in
  this case seemed more debatable. For now I've left it at only reporting deltas
  between consecutive runs (so RUN1->RUN2 and RUN2->RUN3, but not RUN1->RUN3).
  If we need the overall delta then that should be an easy follow-up.

This has already been useful/promising for inspecting the AB experience with
qemuriscv64-ptest since the aforementioned QEMU patch backport. For example, I
ran the following yesterday to get the top 25 largest deltas for
qemuriscv64-ptest: 

1. resulttool report https://valkyrie.yocto.io/pub/non-release/20260922-113/testresults/qemuriscv64-ptest/testresults.json > 113.log
2. resulttool report https://valkyrie.yocto.io/pub/non-release/20260922-114/testresults/qemuriscv64-ptest/testresults.json > 114.log
3. resulttool durations -s -l 25 114.log 113.log

And here's what it showed:

|diffstat              96          34           -62      -65
|xz                    14           5            -9      -64
|diffutils             44          16           -28      -64
|quilt                836         307          -529      -63
|busybox               94          35           -59      -63
|coreutils           2997        1166         -1831      -61
|dpkg                 647         256          -391      -60
|gettext             1910         762         -1148      -60
|findutils            110          44           -66      -60
|m4                   680         281          -399      -59
|util-linux          1522         643          -879      -58
|gawk                 171          74           -97      -57
|elfutils             459         213          -246      -54
|bluez5               115          54           -61      -53
|libssh2               94          48           -46      -49
|logrotate            186          95           -91      -49
|sed                  142          73           -69      -49
|opkg                 199         113           -86      -43
|openssh             2846        1662         -1184      -42
|gdbm                  27          17           -10      -37
|bzip2                300         409           109       36
|parted               473         311          -162      -34
|wayland               12           8            -4      -33

Interestingly, bzip2's runtime actually increased (a lot!). A proper analysis
would require averaging the results over several runs, but there seems to be a
trend with some compression and encryption packages that I'll be looking into.
In the meantime, hopefully this feature for resulttools will prove useful to
others too, even if they'd like to see further improvements. Note that I've
tested it for non-ptest cases, and it works there too. 

Using the following command and results:

- resulttool durations -s -t 10
- https://valkyrie.yocto.io/pub/non-release/20260923-8/testresults/qemux86-64/testresults.json
- https://valkyrie.yocto.io/pub/non-release/20260923-50/testresults/qemux86-64/testresults.json

I see:

|=== runtime/poky/qemux86-64/core-image-sato-sdk ===
|TESTCASE                                                  RUN1        RUN2    RUN1->RUN2        %
|stap.StapTest.test_stap                                      7          13             5       73
|kernelmodule.KernelModuleTest.test_kernel_module            22          30             8       36
|buildcpio.BuildCpioTest.test_cpio                           28          31             3       10
|
|=== sdk/qemux86-64/i686/core-image-sato ===
|TESTCASE                             RUN1        RUN2    RUN1->RUN2        %
|cmake.CMakeTest.test_assimp            71          83            12       17
|
|=== sdk/qemux86-64/x86_64/core-image-sato ===
|TESTCASE                                           RUN1        RUN2    RUN1->RUN2        %
|rust.RustHostCompileTest.test_cargo_build            13          18             4       33
|cmake.CMakeTest.test_assimp                          71          92            22       31
|autotools.AutotoolsTest.test_cpio                    24          27             3       11
|
|=== sdkext/qemux86-64/x86_64/core-image-minimal ===
|TESTCASE                                                           RUN1        RUN2    RUN1->RUN2        %
|maturin.MaturinTest.test_maturin_list_python                          4          21            18      459
|devtool.DevtoolTest.test_devtool_build_esdk_package                  28         132           104      372
|python.Python3Test.test_python3                                       5          22            17      335
|devtool.DevtoolTest.test_extend_autotools_recipe_creation            82         319           238      291
|devtool.DevtoolTest.test_recipes_for_nodejs                          15          25             9       61
|devtool.DevtoolTest.test_devtool_kernelmodule                       433         580           147       34
|cmake.CMakeTest.test_assimp                                          75          95            21       27
|devtool.DevtoolTest.test_devtool_add_reset                           12          15             3       26
|devtool.DevtoolTest.test_devtool_build_cmake                         29          36             7       23
|
|=== sdkext/qemux86-64/x86_64/core-image-sato ===
|TESTCASE                                                           RUN1        RUN2    RUN1->RUN2        %
|devtool.DevtoolTest.test_devtool_build_cmake                         30         236           206      686
|maturin.MaturinTest.test_maturin_list_python                          4          22            18      469
|python.Python3Test.test_python3                                       5          22            17      377
|devtool.DevtoolTest.test_devtool_kernelmodule                       429        1394           965      225
|devtool.DevtoolTest.test_devtool_add_reset                           13          18             5       39
|maturin.MaturinDevelopTest.test_maturin_develop                      24          32             9       36
|cmake.CMakeTest.test_assimp                                          73          97            24       33
|devtool.DevtoolTest.test_extend_autotools_recipe_creation            81         105            24       30
|devtool.DevtoolTest.test_recipes_for_nodejs                          15          19             4       24
|devtool.DevtoolTest.test_devtool_build_make                          33          39             6       17
|autotools.AutotoolsTest.test_cpio                                    24          27             3       11

Some other examples of use:

First five results when comparing two reports from 'resulttool report':

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/build $ resulttool durations -l 5 tlb_before.log tlb_tweak.log
|
|=== qemuriscv64 PTest Result Summary (Libc: glibc) ===
|TESTCASE             RUN1        RUN2    RUN1->RUN2        %
|apr                    50          48            -2       -4
|apr-util               13          11            -2      -15
|babeltrace2          1302        1042          -260      -20
|bc                     82          82             0        0
|bluez5                115          71           -44      -38

First five results from the same reports when sorted by highest change:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/build $ resulttool durations -l 5 -s tlb_before.log tlb_tweak.log
|
|=== qemuriscv64 PTest Result Summary (Libc: glibc) ===
|TESTCASE            RUN1        RUN2    RUN1->RUN2        %
|libseccomp          3833        1686         -2147      -56
|quilt                836         438          -398      -48
|findutils            110          58           -52      -47
|diffstat              96          52           -44      -46
|diffutils             44          24           -20      -45

Raw (and truncated) testresults.json comparison for two sources from the
Autobuilder:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core ((no branch, rebasing master))$ resulttool durations https://valkyrie.yocto.io/pub/non-release/20260923-79/testresults/qemuriscv64-ptest/testresults.json https://valkyrie.yocto.io/pub/non-release/20260923-78/testresults/qemuriscv64-ptest/testresults.json
|
|=== runtime/poky/qemuriscv64/core-image-ptest-apr ===
|TESTCASE                                                   RUN1        RUN2    RUN1->RUN2        %
|ptest.PtestRunnerTest.test_ptestrunner_expectfail            48          48             0        1
|ptestresult.sections.apr                                     46          47             1        2
|
|=== runtime/poky/qemuriscv64/core-image-ptest-apr-util ===
|TESTCASE                                                   RUN1        RUN2    RUN1->RUN2        %
|ptest.PtestRunnerTest.test_ptestrunner_expectfail            12          13             1        9
|ptestresult.sections.apr-util                                11          11             0        0
|
|=== runtime/poky/qemuriscv64/core-image-ptest-babeltrace2 ===
|TESTCASE                                                   RUN1        RUN2    RUN1->RUN2        %
|ptest.PtestRunnerTest.test_ptestrunner_expectfail           981        1066            85        9
|ptestresult.sections.babeltrace2                            973        1058            85        9

The same results with '-l 1' (one line max):

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core ((no branch, rebasing master))$ resulttool durations -l 1 https://valkyrie.yocto.io/pub/non-release/20260923-79/testresults/qemuriscv64-ptest/testresults.json https://valkyrie.yocto.io/pub/non-release/20260923-78/testresults/qemuriscv64-ptest/testresults.json
|
|=== runtime/poky/qemuriscv64/core-image-ptest-apr ===
|TESTCASE                                                   RUN1        RUN2    RUN1->RUN2        %
|ptest.PtestRunnerTest.test_ptestrunner_expectfail            48          48             0        1
|
|=== runtime/poky/qemuriscv64/core-image-ptest-apr-util ===
|TESTCASE                                                   RUN1        RUN2    RUN1->RUN2        %
|ptest.PtestRunnerTest.test_ptestrunner_expectfail            12          13             1        9
|
|=== runtime/poky/qemuriscv64/core-image-ptest-babeltrace2 ===
|TESTCASE                                                   RUN1        RUN2    RUN1->RUN2        %
|ptest.PtestRunnerTest.test_ptestrunner_expectfail           981        1066            85        9

Trevor Gamblin (13):
  scripts: resulttool: add 'durations' option
  selftest: resulttooltests.py: add basic durations test
  selftest: resulttooltests.py: add report-log Time(s) column test
  selftest: resulttooltests.py: add zero-round pct suppression test
  selftest: resulttooltests.py: add consecutive-pair delta test
  selftest: resulttooltests.py: add threshold filtering test
  selftest: resulttooltests.py: add threshold-disabled test
  selftest: resulttooltests.py: add multi-pair threshold test
  selftest: resulttooltests.py: add None-pct threshold test
  selftest: resulttooltests.py: add sort-by-delta test
  selftest: resulttooltests.py: add limit-after-sort test
  selftest: resulttooltests.py: add short-tables ordering test
  selftest: resulttooltests.py: add min-duration default test

 .../oeqa/selftest/cases/resulttooltests.py    | 201 ++++++++++++++++++
 scripts/lib/resulttool/durations.py           | 187 ++++++++++++++++
 scripts/resulttool                            |   2 +
 3 files changed, 390 insertions(+)
 create mode 100644 scripts/lib/resulttool/durations.py

-- 
2.55.0


