Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9A8EE49AF
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 06:26:35 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.5897.1692771986084531340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 23:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RxKPyunw;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-570f6c17c55so831787eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692771985; x=1693376785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MKa9ctx/981+7XaYnVdshnwMvWGgUKLx6ThexxIj7A=;
        b=RxKPyunwXey685zVykuEyv67zPDaxUEjlG98Pks4m0NGzzbqkeDKBzL0URHYWyiHpV
         982JtKgk9Hi6PDo+QGmOq8VtVoAKe+2hCT7popJqyHlC9uYKBwn5JqdydZDUi/lATmJI
         qG1uZ9qv4+wV+TcXOThUbSSz8KUd7MaEH2YkIqKXHbF2nDgEfW0RnrR6DLoNCgikcgku
         SFdpOWmM6gmzA/WVfPgMaBb9A8feeLkUgf2rrjf/O5mQxcur/lKMs1lWqoHdttUclNJw
         ugL9bFQLoAsBt8kO9Vu/+E/fyGL43KtL0r8xQeUe9cv8JKQrI+uY7Tr+tNntSyPDsmVz
         riQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692771985; x=1693376785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MKa9ctx/981+7XaYnVdshnwMvWGgUKLx6ThexxIj7A=;
        b=VM9a/0mZpTd4yiUnyqSO/0lQ5p8AX+CGA9E4/acnpJCGMpVKcJN8hnCQAfz5man+GY
         z96RNKgrMZ6wiKnFLC+tt7/gw9rJYE0gJsu17fXoVkOBiBuRmoe9cWwLCdfkFy+snV3b
         iy2U4kkUeC6zQMt1uV7w01TprOKwTJcLMeUQtkOF1/lv7izVkfY2A9QqY4pGPYLqXYfz
         Oop/n5wPkSCsZU1o2bKLjaZUUqrCNEe4GvNIEIPN36H8P0QFz7dfwv6EBXEUFeV25h4q
         CadTxodK1GwwV6kj6xVzBGu3A8+d/YymRJEF2V5W8wbhFNxxiMenZJNb3LxnRP2NU10N
         NwBw==
X-Gm-Message-State: AOJu0YwtOxqdO0ST2rfHHFuZD+8eCDxR9Y3FFMS9HgjxQYXeBDCsBpEz
	OPBFLVgGAdnuAV17sktnzWThaF5MOSZ1VORNe1M=
X-Google-Smtp-Source: AGHT+IHMZG2TU362aYhtOr888CXW2Aphwmnqs5PKrTLMvR1w6gA5IE+dH9K0qSLiwnVcccDIY8x7O1Xh1bnaadCdzHQ=
X-Received: by 2002:a4a:654e:0:b0:56d:2e02:565 with SMTP id
 z14-20020a4a654e000000b0056d2e020565mr10540802oog.4.1692771985027; Tue, 22
 Aug 2023 23:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org> <20230823061025.3952909-2-mikko.rapeli@linaro.org>
In-Reply-To: <20230823061025.3952909-2-mikko.rapeli@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2023 23:25:58 -0700
Message-ID: <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186555

On Tue, Aug 22, 2023 at 11:10=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.=
org> wrote:
>
> Also set target and server IP addresses correctly to 127.0.0.1
> so that TEST_TARGET_IP and TEST_SERVER_IP don't
> need to be set manually with slirp.
>
> Users run qemu images with slirp networking like this:
>
> $ bitbake core-image-minimal
> $ ../poky/scripts/runqemu slirp
>
> slirp networking means that only one TCP port is forwarded from host
> system to the qemu machine so that ssh into the machine works. ping
> and other low level networking from host to target machine do not work,
> but networking from target via host does work. This is much more easy to
> setup than the bridge networking used by default, which I've never
> managed to get running on various host machines.
>
> To use slirp networking wita qemu and core-image-minimal to run testimage=
.bbclass tests, add
> these to local.conf:
>
> IMAGE_CLASSES +=3D "testimage"
> IMAGE_FEATURES +=3D "ssh-server-dropbear"
> TEST_RUNQEMUPARAMS +=3D "slirp"
>
> Then image can be compiled and tested with:
>
> $ bitbake core-image-minimal
> $ bitbake -c testimage core-image-minimal
>
> Note that only few of the current oeqa runtime tests work against
> core-image-minimal, but test results look like:
>
> RESULTS:
> RESULTS - date.DateTest.test_date: PASSED (3.64s)
> RESULTS - df.DfTest.test_df: PASSED (0.55s)
> RESULTS - oe_syslog.SyslogTest.test_syslog_running: PASSED (0.56s)
> RESULTS - oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (1.88s)
> RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (0.93s)
> RESULTS - pam.PamBasicTest.test_pam: PASSED (2.20s)
> RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.98s)
> RESULTS - ping.PingTest.test_ping: PASSED (0.05s)
> RESULTS - ssh.SSHTest.test_ssh: PASSED (1.28s)
> RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.56s)
> RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.10s)
> RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (0.92s)
> RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.5=
6s)
> RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.54s=
)
> RESULTS - apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
> RESULTS - buildcpio.BuildCpioTest.test_cpio: SKIPPED (0.00s)
> RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> RESULTS - buildlzip.BuildLzipTest.test_lzip: SKIPPED (0.00s)
> RESULTS - connman.ConnmanTest.test_connmand_help: SKIPPED (0.00s)
> RESULTS - connman.ConnmanTest.test_connmand_running: SKIPPED (0.00s)
> RESULTS - dnf.DnfBasicTest.test_dnf_help: SKIPPED (0.00s)
> RESULTS - dnf.DnfBasicTest.test_dnf_history: SKIPPED (0.00s)
> RESULTS - dnf.DnfBasicTest.test_dnf_info: SKIPPED (0.00s)
> RESULTS - dnf.DnfBasicTest.test_dnf_search: SKIPPED (0.00s)
> RESULTS - dnf.DnfBasicTest.test_dnf_version: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_exclude: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_install: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_install_dependency: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_install_from_disk: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_install_from_http: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_installroot: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_installroot_usrmerge: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_makecache: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_reinstall: SKIPPED (0.00s)
> RESULTS - dnf.DnfRepoTest.test_dnf_repoinfo: SKIPPED (0.00s)
> RESULTS - gcc.GccCompileTest.test_gcc_compile: SKIPPED (0.00s)
> RESULTS - gcc.GccCompileTest.test_gpp2_compile: SKIPPED (0.00s)
> RESULTS - gcc.GccCompileTest.test_gpp_compile: SKIPPED (0.00s)
> RESULTS - gcc.GccCompileTest.test_make: SKIPPED (0.00s)
> RESULTS - gi.GObjectIntrospectionTest.test_python: SKIPPED (0.00s)
> RESULTS - go.GoHelloworldTest.test_gohelloworld: SKIPPED (0.00s)
> RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: SKIPPED (0.00=
s)
> RESULTS - ldd.LddTest.test_ldd: SKIPPED (0.00s)
> RESULTS - logrotate.LogrotateTest.test_logrotate_newlog: SKIPPED (0.00s)
> RESULTS - logrotate.LogrotateTest.test_logrotate_wtmp: SKIPPED (0.00s)
> RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config: SKIPPED =
(0.00s)
> RESULTS - opkg.OpkgRepoTest.test_opkg_install_from_repo: SKIPPED (0.00s)
> RESULTS - perl.PerlTest.test_perl_works: SKIPPED (0.00s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED (0.0=
0s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (=
0.00s)
> RESULTS - python.PythonTest.test_python3: SKIPPED (0.00s)
> RESULTS - rpm.RpmBasicTest.test_rpm_help: SKIPPED (0.00s)
> RESULTS - rpm.RpmBasicTest.test_rpm_query: SKIPPED (0.00s)
> RESULTS - rpm.RpmBasicTest.test_rpm_query_nonroot: SKIPPED (0.00s)
> RESULTS - rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_fil=
e_size: SKIPPED (0.00s)
> RESULTS - rpm.RpmInstallRemoveTest.test_rpm_install: SKIPPED (0.00s)
> RESULTS - rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (0.00s)
> RESULTS - rust.RustCompileTest.test_cargo_compile: SKIPPED (0.00s)
> RESULTS - rust.RustCompileTest.test_rust_compile: SKIPPED (0.00s)
> RESULTS - scp.ScpTest.test_scp_file: SKIPPED (0.00s)
> RESULTS - stap.StapTest.test_stap: SKIPPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPE=
D (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKI=
PPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s=
)
> RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED (0=
.00s)
> RESULTS - weston.WestonTest.test_wayland_info: SKIPPED (0.00s)
> RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compos=
itor: SKIPPED (0.00s)
> RESULTS - weston.WestonTest.test_weston_running: SKIPPED (0.00s)
> RESULTS - weston.WestonTest.test_weston_supports_xwayland: SKIPPED (0.00s=
)
> RESULTS - xorg.XorgTest.test_xorg_running: SKIPPED (0.00s)
> SUMMARY:
> core-image-minimal () - Ran 70 tests in 22.173s
> core-image-minimal - OK - All required tests passed (successes=3D14, skip=
ped=3D56, failures=3D0, errors=3D0)
> NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Succeeded
> NOTE: Tasks Summary: Attempted 1305 tasks of which 1304 didn't need to be=
 rerun and all succeeded.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/testimage.bbclass | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> v2: set TEST_SERVER_IP correctly to default qemu dhcp server IP 10.0.2.2
> so that testimage selftests pass
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/186424
>
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index e3068348ff..7340996788 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -322,7 +322,7 @@ def testimage_main(d):
>      ovmf =3D d.getVar("QEMU_USE_OVMF")
>
>      slirp =3D False
> -    if d.getVar("QEMU_USE_SLIRP"):
> +    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPARA=
MS', 'slirp', True, False, d):
>          slirp =3D True
>
>      # TODO: We use the current implementation of qemu runner because of
> @@ -369,10 +369,18 @@ def testimage_main(d):
>      # runtime use network for download projects for build
>      export_proxies(d)
>
> +    if slirp:
> +        target_ip =3D "127.0.0.1"

will this work when running multiple instances of qemu ?
e.g.  try bitbake core-image-ptest-all

> +        # from qemu target to host with default DHCP server
> +        server_ip =3D "10.0.2.2"
> +    else:
> +        target_ip =3D d.getVar("TEST_TARGET_IP")
> +        server_ip =3D d.getVar("TEST_SERVER_IP")
> +
>      # the robot dance
>      target =3D OERuntimeTestContextExecutor.getTarget(
> -        d.getVar("TEST_TARGET"), logger, d.getVar("TEST_TARGET_IP"),
> -        d.getVar("TEST_SERVER_IP"), **target_kwargs)
> +        d.getVar("TEST_TARGET"), logger, target_ip,
> +        server_ip, **target_kwargs)
>
>      # test context
>      tc =3D OERuntimeTestContext(td, logger, target, image_packages, extr=
act_dir)
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186547): https://lists.openembedded.org/g/openembedde=
d-core/message/186547
> Mute This Topic: https://lists.openembedded.org/mt/100910036/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

