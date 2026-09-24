Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37D7C982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:09:56 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2660.1790216238318197913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 19:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=CRFp6W+Q;
 spf=pass (domain: baylibre.com, ip: 209.85.221.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so483551e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790216237; x=1790821037; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B04oWzWz1tc+ScO5louPNDyMaMoiFKUO1/FhmB1EvhI=;
        b=CRFp6W+QX8pfFuxGhKZHpGk1ySyimcHgBFdqvBzAsqTI3hUjjrXaaCGiYkBB94m+Jb
         bCRh2aab3AJ643s8Q4rhBbt6kiWXuCYRY622OQ7h/cqDCJp2XDlz4S49OCebyLChLGJr
         RYo4F0ZdOhRC20LkVnUprP/92fRGKMHKc1x5m51+ac+XTEhqegY1Y2tEW8x7g9G5Hf+s
         dUcT5gyTrZiPWGwOGBEQFPOp/kpNrH1X84CvCN8Ph0s0vMrLM0u/zfIyI9reZdZ8ukUL
         JnOQu2BX86VDbDLxBcqs5zoflS6Pp2W9z5NC+7bZ2CDFoai7H+lePqesAzX637ip7wnv
         2Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790216237; x=1790821037;
        h=in-reply-to:references:from:to:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B04oWzWz1tc+ScO5louPNDyMaMoiFKUO1/FhmB1EvhI=;
        b=KNta+rpsnPDwV4tvWKLr3SYTJwufEO9TeOCLw9GHAzejxkwk90vT9XukDkuVTFMRMV
         sgfENMguPD7vnPqErE9OsWr4kXstCKZAW8kgLzaNzhbs9FkwGxw6IdL3UBat8XnYsu0v
         bKoCSTpzXRM0mVGUF0hFH72PC4pbfmSmYs1McloqyQe/DQq6nlu4L5ZQ0oUECPKED5NU
         kJTSrTi+XDlloOQyuga527NSOqjVHshe0qT+78zAnJJkD9qrHB+l4hxw6XCbI8jxjFOd
         xBAuQBQhmGGfXHG87Nh5kR5ZA6fJqMlFTXcbD1uaOxUGKvajCGl0YPwoNwRHvrcfE3wE
         XlrQ==
X-Forwarded-Encrypted: i=1; AKwUvBySYCD7WP0MZkpuQm28zcM07170g6w6qMffYA2QL7xOHduxqZE3UKY+u0Hrn/QLET5xEL6njS7s/qqvYvuSqAfoDg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mUZqe8Z2Eeo4uZrBLYx86DV8fEJttyanxoeyIyhZW9qymp8xfW
	sgPeXcnAZMIKuaJZT1kyYKVOJsNt/DzUBwLAo2LB4xjIldyoa7dZQanjtL1sCq6WiCw=
X-Gm-Gg: AYBFou3AFpXM3TX38Um37F7ZMGbb/h+iTonSFWEDWOTKSaODbHvpKWwxtzXFPZYZRBn
	qF0dD/W8hYXqdVTj+53R96vSK0cfBnCJfPtEptpfBZdVkvzpjI/k9+m7aljBL/l/pCTrN3i7ldv
	BepQxWDpTg9+pE44splD6tcIrCpm2Kn+oQvzjVgsr9ruiXSzT+6f38tRSu3dNbGoxqSHUrTjaET
	vgRi53WzGAG3Qitc37Rs46kPvlBNCKdPQHfXkDqkK0I2MNsn1LjBZsbZg9FSrekfmI4sgeAgyTX
	DHHzdGBTszpF3KlAlzhkv48tXrzdl4WEn1tri8S6Jj8x67RtQiZWgUp2lXbLhRfqctxiaC1URes
	j0ab3sxIxGYU2qZRWdVX1ZJQOT03x745d/GKI3j5w856p8ZmrHZrUCPiCw9faAdI/2u1FkZA0K8
	OlZ05FTQemzbggDsmfdqVMDfYQAYuDRU83exjl75VdvFL0aJtTn7okBV9Vaq8B7saHUNw+BiLeS
	KBUnoqSguaNyQz+lswJYVIbHVAn+O5Auw==
X-Received: by 2002:a05:6122:a5c1:20b0:5c9:d6cc:1d06 with SMTP id 71dfb90a1353d-5cb099fd7d5mr493414e0c.5.1790216236898;
        Wed, 23 Sep 2026 19:17:16 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:4813:46a1:264d:9fac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f02bfsm5133090e0c.7.2026.09.23.19.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 19:17:15 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 23 Sep 2026 22:17:12 -0400
Message-Id: <DLN6OVV3M8PF.X7LYV49UGDUM@baylibre.com>
Subject: Re: [OE-core][PATCH 00/13] resulttool: add 'durations' subcommand and selftests
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260923190419.353493-1-tgamblin@baylibre.com>
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 05:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246559

On Wed Sep 23, 2026 at 3:04 PM EDT, Trevor Gamblin wrote:
> This series is motivated by the need to compare durations for various tes=
t
> results (originally, ptest) as reported by the Autobuilder. In particular=
, I've
> been looking at the intermittent ptest issues seen on the AB for the
> qemuriscv64-ptest builders, but we needed a good way to compare per-packa=
ge
> durations before and after commit 6d6aaf4204be ("qemu: backport RISC-V TL=
B page
> flushing patches"). I tested this change locally with coreutils (which sh=
owed
> roughly 38% improvement on my workstation) and other tests (e.g. libpng, =
which
> showed no meaningful change), and review on the upstream QEMU list confir=
med it
> helped with boot and runtime performance for qemuriscv64.
>
> This resulttool durations feature provides a means to quantify changes in
> duration across more packages at a scale beyond what my machines can hand=
le, and
> might be useful to compare before and after other changes (e.g. toolchain=
 tests)
> over time. I've also added a variety of test cases for oeqa selftests, co=
vering
> everything from basic results parsing to making sure the tool respects
> thresholds. Each of those tests is added as a separate commit to make rev=
iew
> easier.
>
> I used Claude Code to help build this out. Design took some refinement,
> especially with:
>
> - Comparing delta results for very short tests (i.e. those running for 5-=
10
>   seconds or less) were mostly noise, especially when fractional runtimes=
 were
>   calculated under the hood and ended up reporting "0" for both runtimes =
but
>   large (68%, 350%, etc.) deltas. I don't think we have much use for trac=
king
>   differences in such short tests, but I did provide a '-m/--min-duration=
' to
>   tweak this (defaulting to 10) if we want to be able to look at those.
> - Durations can vary small amounts (5-10 seconds) across consecutive test=
s even
>   under little or no load, and higher when the host system is under heavy=
 load
>   (like the AB workers), so a '-t/--threshold' option is available to fil=
ter out
>   any tests whose deltas are under a certain percentage. I didn't set a d=
efault
>   here, but 10% is probably a reasonable one for people to use.
> - A sort option '-s/--sort-by-delta' was an obvious add so that it can be=
 used
>   to check what the biggest changes are from run to run.
> - Importantly, resulttool durations can compare more than two sources. Th=
is will
>   be critical for tracking how results trend over time, but reporting del=
tas in
>   this case seemed more debatable. For now I've left it at only reporting=
 deltas
>   between consecutive runs (so RUN1->RUN2 and RUN2->RUN3, but not RUN1->R=
UN3).
>   If we need the overall delta then that should be an easy follow-up.
>
> This has already been useful/promising for inspecting the AB experience w=
ith
> qemuriscv64-ptest since the aforementioned QEMU patch backport. For examp=
le, I
> ran the following yesterday to get the top 25 largest deltas for
> qemuriscv64-ptest:=20
>
> 1. resulttool report https://valkyrie.yocto.io/pub/non-release/20260922-1=
13/testresults/qemuriscv64-ptest/testresults.json > 113.log
> 2. resulttool report https://valkyrie.yocto.io/pub/non-release/20260922-1=
14/testresults/qemuriscv64-ptest/testresults.json > 114.log
> 3. resulttool durations -s -l 25 114.log 113.log
>
> And here's what it showed:
>
> |diffstat              96          34           -62      -65
> |xz                    14           5            -9      -64
> |diffutils             44          16           -28      -64
> |quilt                836         307          -529      -63
> |busybox               94          35           -59      -63
> |coreutils           2997        1166         -1831      -61
> |dpkg                 647         256          -391      -60
> |gettext             1910         762         -1148      -60
> |findutils            110          44           -66      -60
> |m4                   680         281          -399      -59
> |util-linux          1522         643          -879      -58
> |gawk                 171          74           -97      -57
> |elfutils             459         213          -246      -54
> |bluez5               115          54           -61      -53
> |libssh2               94          48           -46      -49
> |logrotate            186          95           -91      -49
> |sed                  142          73           -69      -49
> |opkg                 199         113           -86      -43
> |openssh             2846        1662         -1184      -42
> |gdbm                  27          17           -10      -37
> |bzip2                300         409           109       36
> |parted               473         311          -162      -34
> |wayland               12           8            -4      -33
>
> Interestingly, bzip2's runtime actually increased (a lot!). A proper anal=
ysis
> would require averaging the results over several runs, but there seems to=
 be a
> trend with some compression and encryption packages that I'll be looking =
into.
> In the meantime, hopefully this feature for resulttools will prove useful=
 to
> others too, even if they'd like to see further improvements. Note that I'=
ve
> tested it for non-ptest cases, and it works there too.=20
>
> Using the following command and results:
>
> - resulttool durations -s -t 10
> - https://valkyrie.yocto.io/pub/non-release/20260923-8/testresults/qemux8=
6-64/testresults.json
> - https://valkyrie.yocto.io/pub/non-release/20260923-50/testresults/qemux=
86-64/testresults.json
>
> I see:
>
> |=3D=3D=3D runtime/poky/qemux86-64/core-image-sato-sdk =3D=3D=3D
> |TESTCASE                                                  RUN1        RU=
N2    RUN1->RUN2        %
> |stap.StapTest.test_stap                                      7          =
13             5       73
> |kernelmodule.KernelModuleTest.test_kernel_module            22          =
30             8       36
> |buildcpio.BuildCpioTest.test_cpio                           28          =
31             3       10
> |
> |=3D=3D=3D sdk/qemux86-64/i686/core-image-sato =3D=3D=3D
> |TESTCASE                             RUN1        RUN2    RUN1->RUN2     =
   %
> |cmake.CMakeTest.test_assimp            71          83            12     =
  17
> |
> |=3D=3D=3D sdk/qemux86-64/x86_64/core-image-sato =3D=3D=3D
> |TESTCASE                                           RUN1        RUN2    R=
UN1->RUN2        %
> |rust.RustHostCompileTest.test_cargo_build            13          18     =
        4       33
> |cmake.CMakeTest.test_assimp                          71          92     =
       22       31
> |autotools.AutotoolsTest.test_cpio                    24          27     =
        3       11
> |
> |=3D=3D=3D sdkext/qemux86-64/x86_64/core-image-minimal =3D=3D=3D
> |TESTCASE                                                           RUN1 =
       RUN2    RUN1->RUN2        %
> |maturin.MaturinTest.test_maturin_list_python                          4 =
         21            18      459
> |devtool.DevtoolTest.test_devtool_build_esdk_package                  28 =
        132           104      372
> |python.Python3Test.test_python3                                       5 =
         22            17      335
> |devtool.DevtoolTest.test_extend_autotools_recipe_creation            82 =
        319           238      291
> |devtool.DevtoolTest.test_recipes_for_nodejs                          15 =
         25             9       61
> |devtool.DevtoolTest.test_devtool_kernelmodule                       433 =
        580           147       34
> |cmake.CMakeTest.test_assimp                                          75 =
         95            21       27
> |devtool.DevtoolTest.test_devtool_add_reset                           12 =
         15             3       26
> |devtool.DevtoolTest.test_devtool_build_cmake                         29 =
         36             7       23
> |
> |=3D=3D=3D sdkext/qemux86-64/x86_64/core-image-sato =3D=3D=3D
> |TESTCASE                                                           RUN1 =
       RUN2    RUN1->RUN2        %
> |devtool.DevtoolTest.test_devtool_build_cmake                         30 =
        236           206      686
> |maturin.MaturinTest.test_maturin_list_python                          4 =
         22            18      469
> |python.Python3Test.test_python3                                       5 =
         22            17      377
> |devtool.DevtoolTest.test_devtool_kernelmodule                       429 =
       1394           965      225
> |devtool.DevtoolTest.test_devtool_add_reset                           13 =
         18             5       39
> |maturin.MaturinDevelopTest.test_maturin_develop                      24 =
         32             9       36
> |cmake.CMakeTest.test_assimp                                          73 =
         97            24       33
> |devtool.DevtoolTest.test_extend_autotools_recipe_creation            81 =
        105            24       30
> |devtool.DevtoolTest.test_recipes_for_nodejs                          15 =
         19             4       24
> |devtool.DevtoolTest.test_devtool_build_make                          33 =
         39             6       17
> |autotools.AutotoolsTest.test_cpio                                    24 =
         27             3       11
>
> Some other examples of use:
>
> First five results when comparing two reports from 'resulttool report':
>
> |tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/build $ resultto=
ol durations -l 5 tlb_before.log tlb_tweak.log
> |
> |=3D=3D=3D qemuriscv64 PTest Result Summary (Libc: glibc) =3D=3D=3D
> |TESTCASE             RUN1        RUN2    RUN1->RUN2        %
> |apr                    50          48            -2       -4
> |apr-util               13          11            -2      -15
> |babeltrace2          1302        1042          -260      -20
> |bc                     82          82             0        0
> |bluez5                115          71           -44      -38
>
> First five results from the same reports when sorted by highest change:
>
> |tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/build $ resultto=
ol durations -l 5 -s tlb_before.log tlb_tweak.log
> |
> |=3D=3D=3D qemuriscv64 PTest Result Summary (Libc: glibc) =3D=3D=3D
> |TESTCASE            RUN1        RUN2    RUN1->RUN2        %
> |libseccomp          3833        1686         -2147      -56
> |quilt                836         438          -398      -48
> |findutils            110          58           -52      -47
> |diffstat              96          52           -44      -46
> |diffutils             44          24           -20      -45
>
> Raw (and truncated) testresults.json comparison for two sources from the
> Autobuilder:
>
> |tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembed=
ded-core ((no branch, rebasing master))$ resulttool durations https://valky=
rie.yocto.io/pub/non-release/20260923-79/testresults/qemuriscv64-ptest/test=
results.json https://valkyrie.yocto.io/pub/non-release/20260923-78/testresu=
lts/qemuriscv64-ptest/testresults.json
> |
> |=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-apr =3D=3D=3D
> |TESTCASE                                                   RUN1        R=
UN2    RUN1->RUN2        %
> |ptest.PtestRunnerTest.test_ptestrunner_expectfail            48         =
 48             0        1
> |ptestresult.sections.apr                                     46         =
 47             1        2
> |
> |=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-apr-util =3D=3D=3D
> |TESTCASE                                                   RUN1        R=
UN2    RUN1->RUN2        %
> |ptest.PtestRunnerTest.test_ptestrunner_expectfail            12         =
 13             1        9
> |ptestresult.sections.apr-util                                11         =
 11             0        0
> |
> |=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-babeltrace2 =3D=3D=
=3D
> |TESTCASE                                                   RUN1        R=
UN2    RUN1->RUN2        %
> |ptest.PtestRunnerTest.test_ptestrunner_expectfail           981        1=
066            85        9
> |ptestresult.sections.babeltrace2                            973        1=
058            85        9
>
> The same results with '-l 1' (one line max):
>
> |tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembed=
ded-core ((no branch, rebasing master))$ resulttool durations -l 1 https://=
valkyrie.yocto.io/pub/non-release/20260923-79/testresults/qemuriscv64-ptest=
/testresults.json https://valkyrie.yocto.io/pub/non-release/20260923-78/tes=
tresults/qemuriscv64-ptest/testresults.json
> |
> |=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-apr =3D=3D=3D
> |TESTCASE                                                   RUN1        R=
UN2    RUN1->RUN2        %
> |ptest.PtestRunnerTest.test_ptestrunner_expectfail            48         =
 48             0        1
> |
> |=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-apr-util =3D=3D=3D
> |TESTCASE                                                   RUN1        R=
UN2    RUN1->RUN2        %
> |ptest.PtestRunnerTest.test_ptestrunner_expectfail            12         =
 13             1        9
> |
> |=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-babeltrace2 =3D=3D=
=3D
> |TESTCASE                                                   RUN1        R=
UN2    RUN1->RUN2        %
> |ptest.PtestRunnerTest.test_ptestrunner_expectfail           981        1=
066            85        9

Realizing I didn't provide an example of the three-sources case. This is wh=
at
the raw output looks like:

|TESTCASE                                                   RUN1        RUN=
2        RUN3    RUN1->RUN2        %    RUN2->RUN3        %
|ptestresult.sections.util-linux                            1522         64=
3         935          -879      -58           292       45
|ptest.PtestRunnerTest.test_ptestrunner_expectfail          1525         64=
5         937          -880      -58           292       45
|
|=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-wayland =3D=3D=3D
|TESTCASE                                                   RUN1        RUN=
2        RUN3    RUN1->RUN2        %    RUN2->RUN3        %
|ptestresult.sections.wayland                                 12           =
8          10            -4      -33             2       25
|ptest.PtestRunnerTest.test_ptestrunner_expectfail            14          1=
0          11            -5      -33             2       19
|
|=3D=3D=3D runtime/poky/qemuriscv64/core-image-ptest-xz =3D=3D=3D
|TESTCASE                                                   RUN1        RUN=
2        RUN3    RUN1->RUN2        %    RUN2->RUN3        %
|ptestresult.sections.xz                                      14           =
5           9            -9      -64             4       80
|ptest.PtestRunnerTest.test_ptestrunner_expectfail            16           =
7          10            -9      -57             3       41

And using reports:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedde=
d-core (tgamblin/resulttool-durations)$ resulttool durations -s -t 10 114.l=
og 113.log 64.log
|
|=3D=3D=3D qemuriscv64 PTest Result Summary (Libc: glibc) =3D=3D=3D
|TESTCASE                            RUN1        RUN2        RUN3    RUN1->=
RUN2        %    RUN2->RUN3        %
|xz                                    14           5           9          =
  -9      -64             4       80
|flex                                  33          11          19          =
 -22      -67             8       73
|libseccomp                          3833        1098        1766         -=
2735      -71           668       61
|busybox                               94          35          58          =
 -59      -63            23       66
|diffstat                              96          34          55          =
 -62      -65            21       62

Trevor

>
> Trevor Gamblin (13):
>   scripts: resulttool: add 'durations' option
>   selftest: resulttooltests.py: add basic durations test
>   selftest: resulttooltests.py: add report-log Time(s) column test
>   selftest: resulttooltests.py: add zero-round pct suppression test
>   selftest: resulttooltests.py: add consecutive-pair delta test
>   selftest: resulttooltests.py: add threshold filtering test
>   selftest: resulttooltests.py: add threshold-disabled test
>   selftest: resulttooltests.py: add multi-pair threshold test
>   selftest: resulttooltests.py: add None-pct threshold test
>   selftest: resulttooltests.py: add sort-by-delta test
>   selftest: resulttooltests.py: add limit-after-sort test
>   selftest: resulttooltests.py: add short-tables ordering test
>   selftest: resulttooltests.py: add min-duration default test
>
>  .../oeqa/selftest/cases/resulttooltests.py    | 201 ++++++++++++++++++
>  scripts/lib/resulttool/durations.py           | 187 ++++++++++++++++
>  scripts/resulttool                            |   2 +
>  3 files changed, 390 insertions(+)
>  create mode 100644 scripts/lib/resulttool/durations.py



