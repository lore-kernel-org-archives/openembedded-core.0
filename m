Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64343C6FD1C
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.18077.1678709754344914061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BHJbTa46;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id ek18so16708487edb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OUPyio6A1nxSKtYoQndymLvNqvl7An1E6Lxg7zNSBhQ=;
        b=BHJbTa46VRDlXRBcbULW1QhoOT+UQPFJhn3m5arGBiCu/H/5fbyCbq6exg7PGMev/b
         TeLrtZs13wcp2iXIr8aVJPoM1eD5sJ+OmD90YdyI53x8uEUGV4OH+0fTn9gmHY1CpEI0
         tlGttiVkwz163/DI0MsqbGI9UUb7rZhmVvupQkVTNNW8WH8YJxv7g+JVjjBfWB4h5Sxc
         hPmmkn1SdaNsWOJlqKRPee0Y6PMuvayc7WSRrFEUkgrkaBqGYxZMASPyZ97L9mCOEHdx
         NcukUFdcDe0D1S9uV8fueMP7tO6Z9sqT2sT9iklPkaN3YIhsSs5ZYTE23dXHcsymWwda
         umxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUPyio6A1nxSKtYoQndymLvNqvl7An1E6Lxg7zNSBhQ=;
        b=iNaipT/FhWZGSPqojrXsHRCn4xUsNAJHcqdWq6xOuaGOsSVIR4tsEjuHtpSKVI8aI3
         jDTGYR5+UH/jh+Zj+c36YnOQVqJPoKOubiCjCfX1hRSM1exM8/+q2n4CuI5cQozYOR/J
         nlLIHLmJCW7waBYH0hxfXsRmUS29CnzK8vUyMAQPQFVw2VKgm4cSd/vFasP2ffYoe94B
         iRuMAUJ++x6JiWyE9JJlkrl4MCq6MEB+jQTy0nlgE91LsJ9WdUNDb4UHq0GbmJsRsen+
         2VezEHIxqbsHtdr7UGoANvHR2lFD1e+sHSk47UKE73mMW4VpRCHzMAKcujQb7HB/UGex
         rPgw==
X-Gm-Message-State: AO0yUKWlr/wRw/2GO/MeZQXk78pHEUCgUBdse0msPSBkCgn2iuRxKZOF
	A/ggpr1utUPnsUzCb1jmO1U5Ff/Cr4A=
X-Google-Smtp-Source: AK7set/KIikZdz1DYOQ49rUjIFMPHTQT5oK+02n1T5npPOt5G8Hb1lSaBnOtPw94Pp7aaqpBwgt+jw==
X-Received: by 2002:aa7:c6c6:0:b0:4bf:1989:9e87 with SMTP id b6-20020aa7c6c6000000b004bf19899e87mr35401530eds.20.1678709752475;
        Mon, 13 Mar 2023 05:15:52 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hz15-20020a1709072cef00b00929fc8d264dsm1059795ejc.17.2023.03.13.05.15.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/14] selftest improvements to respect IMAGE_LINK_NAME
Date: Mon, 13 Mar 2023 13:15:27 +0100
Message-Id: <cover.1678705654.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178432

These changes are preparation for the actual changes from [YOCTO #12937],
but without changing anything in current artifacts naming schema.

Only change outside selftest was moving of INITRAMFS_IMAGE_NAME variable
and adding IMAGE_MACHINE_SUFFIX variable to make it easier to change both.

I've run complete selftest with my other changes for [YOCTO #12937] which
highlighted where the issues are and then again with only these changes
to make sure I didn't break it for current mickledore.

The most dangerous is probably:
git-submodule-test: disable upstream version check
because I cannot explain why distrodata.Distrodata.test_checkpkg isn't failing on AB

but maybe it's just because many (maybe all AB runs disable this check?), e.g.
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4948/steps/14/logs/stdio
shows it skipped:
ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc; OEQA_DEBUGGING_SAVED_OUTPUT=/srv/autobuilder/autobuilder.yocto.io/pub/repro-fail/ DISPLAY=:1 oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg buildoptions.SourceMirroring.test_yocto_source_mirror reproducible -T machine -T toolchain-user -T toolchain-system -j 15 failed with exit code 1, see errors above. (1678628531.8: 4253.0)

There were some tests which were skipped (even without --skip-tests) or failed in my oe-selftest -a run:

== SKIPPED ==
A) INFO -  ... skipped 'Test needs meta-oe for nodejs'
  due to testing without meta-oe
  2023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS - devtool.DevtoolAddTests.test_devtool_add_npm: SKIPPED (2.22s)
  2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolCreateTests.test_recipetool_create_npm: SKIPPED (2.83s)

B) INFO -  ... skipped 'No "dash" found on test system.'
  no dash on gentoo
  2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: SKIPPED (0.00s)

C) INFO -  ... skipped 'Target does not use libssp'
  not testing on mingw32 with libssp:
  2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - gcc.GccLibSspSelfTest.test_libssp: SKIPPED (3.47s)
  2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (4.23s)

D) INFO -  ... skipped 'You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test'
  even when the tapdevs were correctly configured with runqemu-gen-tapdevs before oe-selftest was started
  later resolved by "touch /etc/runqemu-nosudo" and it PASSED,
  https://git.openembedded.org/openembedded-core/commit/?id=2258345e19efff7717fe19a5026ec55f1b6f90b6
  looks suspicious and will try to improve it (to also ignore
  skipped taps like /tmp/qemu-tap-locks/tap0.skip which I'm using
  because tap0 is already used by openvpn running on my builder)
  2023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS - devtool.DevtoolExtractTests.test_devtool_deploy_target: SKIPPED (2.33s)

== FAILED ==
1) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - distrodata.Distrodata.test_checkpkg: FAILED (146.68s)

  2023-03-13 08:57:10,817 - oe-selftest - INFO - Traceback (most recent call last):
    File "/OE/build/poky/meta/lib/oeqa/selftest/cases/distrodata.py", line 40, in test_checkpkg
      self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
  AssertionError: False is not true :
  The following packages failed upstream version checks. Please fix them using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
  (when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git). If an upstream version check cannot be performed
  (for example, if upstream does not use git tags), you can set UPSTREAM_VERSION_UNKNOWN to '1' in the recipe to acknowledge
  that the check cannot be performed.
  binutils

  used to show git-submodule-test as well (without the first patch here)
  I have no explanation why this isn't triggered on AB, when I've added
  more debug in this text, the binutils disappeared as well (so I was
  assuming it was just temporary network glitch, but today it returned
  again - with debug already removed).

2) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - fetch.Fetch.test_git_mirrors: FAILED (24.34s)

  This is a limitation of current selftest as discussed with RP on IRC.

  easy to explain, but more difficult to fix, it sets (PRE)MIRRORS:forcevariable = ""
  and expects to trigger fetch failure from dbus-wait, but PREMIRRORS:prepend in my 
  local.conf defeats it and dbus-wait is fetched successfully.

  I can switch from prepend to =+ in my local.conf but that will solve it only in my environment.

  RP suggested to change selftest to ignore user's local.conf
  or pick only some specific key things from it, but current
  state is what it is and after removing PREMIRRORS:prepend
  this test PASSED as well.

3) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - incompatible_lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston: FAILED (2043.13s)

  2023-03-13 09:01:25,976 - oe-selftest - INFO -  ... FAIL
  2023-03-13 09:01:25,977 - oe-selftest - INFO - Traceback (most recent call last):
    File "/OE/build/poky/meta/lib/oeqa/selftest/cases/incompatible_lic.py", line 161, in test_core_image_full_cmdline_weston
      bitbake('-c testimage core-image-full-cmdline core-image-weston')
    File "/OE/build/poky/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
      return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/OE/build/poky/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
      raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
  AssertionError: Command 'bitbake  -c testimage core-image-full-cmdline core-image-weston' returned non-zero exit status 1:

  seems to run many tests succesfully with the test image:

  core-image-weston () - Ran 71 tests in 34.038s
  core-image-weston - OK - All required tests passed (successes=14, skipped=57, failures=0, errors=0)
  NOTE: recipe core-image-weston-1.0-r0: task do_testimage: Succeeded
  NOTE: Tasks Summary: Attempted 1141 tasks of which 1139 didn't need to be rerun and 1 failed.

  Summary: 1 task failed:
    /OE/build/poky/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimage
  Summary: There were 2 WARNING messages.
  Summary: There were 3 ERROR messages, returning a non-zero exit code.

  but there is also:
  runqemu - INFO - Found /tmp/qemu-tap-locks/tap0.skip, skipping tap0
  runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap1.lock failed: [Errno 11] Resource temporarily unavailable

  I need to debug it a bit more, probably outside selftest as well, will try
  to run it when I don't need tap0 for openvpn.
  But it fails the same with current master without any of my changes as well.

4) runqemu.RunqemuTests still fail with my other [YOCTO #12937] changes
  but work fine with this pull request, I have some WIP changes locally
  but the testimage+runqemu interaction is far from simple and will need
  more time to debug to cover all possible use-cases for runqemu

runqemu.RunqemuTests.test_boot_machine_ext4.log:2023-03-13 09:03:12,008 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_machine_ext4: FAILED (63.37s)
runqemu.RunqemuTests.test_boot_recipe_image.log:2023-03-13 08:31:06,400 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_image: ERROR (47.56s)
runqemu.RunqemuTests.test_boot_recipe_image_vdi.log:2023-03-13 08:32:06,489 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_image_vdi: ERROR (46.82s)
runqemu.RunqemuTests.test_boot_recipe_image_vmdk.log:2023-03-13 08:33:07,020 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_image_vmdk: ERROR (47.30s)

The following changes since commit 65ca2c4b7349a4f7dcfcc580d926a99c673deb60:

  dhcpcd: Fix install conflict when enable multilib. (2023-03-11 00:08:38 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (14):
  git-submodule-test: disable upstream version check
  selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting
    SSTATE_MIRROR
  selftest: wic: respect IMAGE_LINK_NAME
  selftest: wic: respect IMAGE_LINK_NAME also in
    test_rawcopy_plugin_qemu
  selftest: runqemu: respect IMAGE_LINK_NAME
  selftest: multiconfig-image-packager: try to respect IMAGE_LINK_NAME
  image-artifact-names.bbclass: add INITRAMFS_IMAGE_NAME from
    kernel.bbclass
  selftest: fitimage.py: respect INITRAMFS_IMAGE_NAME and
    KERNEL_FIT_LINK_NAME
  image-artifact-names: add IMAGE_MACHINE_SUFFIX variable
  selftest: gdbserver.py: respect IMAGE_LINK_NAME
  selftest: minidebuginfo.py respect IMAGE_LINK_NAME
  selftest: efibootpartition.py: fix QEMU_USE_KVM usage
  runqemu: get_first_file() rename cmd* to glob*
  selftest: imagefeatures.py: respect IMAGE_LINK_NAME for debugfs and
    manifest as well

 .../git-submodule-test/git-submodule-test.bb  |  2 +
 .../multiconfig-image-packager_0.1.bb         | 18 +++-
 meta-selftest/wic/test_rawcopy_plugin.wks.in  |  2 +-
 .../image-artifact-names.bbclass              | 16 +++-
 .../kernel-artifact-names.bbclass             |  2 +-
 meta/classes-recipe/kernel.bbclass            |  1 -
 meta/lib/oeqa/selftest/cases/devtool.py       |  1 +
 .../oeqa/selftest/cases/efibootpartition.py   |  4 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 34 ++++----
 meta/lib/oeqa/selftest/cases/gdbserver.py     |  9 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 82 +++++++++----------
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 15 ++--
 meta/lib/oeqa/selftest/cases/runqemu.py       | 10 ++-
 meta/lib/oeqa/selftest/cases/wic.py           | 44 +++++-----
 scripts/runqemu                               | 36 ++++----
 15 files changed, 155 insertions(+), 121 deletions(-)

-- 
2.39.2


