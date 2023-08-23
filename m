Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65113EE49AB
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 06:48:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.6206.1692773297585160290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 23:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iofOk/fl;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4ffa248263cso8224726e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 23:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692773296; x=1693378096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=on4r6z3tfG++bpoiQZUeSD4qOdUgwyL2ogBqDFN/vE8=;
        b=iofOk/flZtCSTzG+q1lHdvY2i79dJy030sh5b1F+wtx3I4zNAs8xI3lQVS3mc+fbQt
         I1381WDPIoA6AstAQx6RBKGIC3hQF0A4qAgvsnm7xynj4nLZDZMU3PYlpspjw4wNc5pN
         tXDv2BFHyDoeJQNsh2BZ3uyj3L2zwLpbGmlYBp21ndS0VZ3te253YWN2sbkv3ErHIg5p
         D2CAYRDBjTPELOQVsCjAOLOHHH5sJ5X9l1P1z62ef0uuRy8kbdxTKaehLvyj1WPCk1Fa
         cEsHpimwAj78XPgqw4OAIylQuxlYKBstiJR+RcQx/KNAxPVoq/Y7gtpWkjyK8ZElrzJO
         Z19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692773296; x=1693378096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=on4r6z3tfG++bpoiQZUeSD4qOdUgwyL2ogBqDFN/vE8=;
        b=mCQ6Jy8w2LwzjW3TzFQ4dRmoI5YoJnkHlxnKBL7paNrQtCi/WfJi5FPUJuHf3awZ6R
         46BXN2p4VokZr//kJWQGTWrILSd8drr4tnFDq8MfB0ObDZ/W/8Y23IBa8FwzBfNf/bfv
         YfFjyzXQfSwRIn6eXXXjUmT4F/nzP+94Rh5fi5X0z3U00q5J7FK0jCVBv4Nv7dQuJppB
         Cso3/chz2TinUQrglOYFDmP1ffFAqnbVnB22cLrl9x5/w023ODT6+NSpCaaX26lez20i
         ugbhKO2Xd9IAYbXJsJ7aOBrITTvs5qAAhwFru+sOlPzQbF/+yvuHYL2Loo8yF7kLxPtW
         U9uw==
X-Gm-Message-State: AOJu0YwFu/7KPibRAwHHdMaqoltCzC4zSL2OLJT0RpSQkBVWYmIp8mUx
	ASi6X4hpGOxbjGRZoveqwD/xUA==
X-Google-Smtp-Source: AGHT+IE77A2yDBoZn/hnKijxlA67lABIVyhIbxt2goiPlSzJFhOSK71HQUphMgsQkm02l0nkorudDA==
X-Received: by 2002:a05:6512:104e:b0:4ff:990a:5d2e with SMTP id c14-20020a056512104e00b004ff990a5d2emr9372841lfb.20.1692773295623;
        Tue, 22 Aug 2023 23:48:15 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id v17-20020a056512049100b005008248b6acsm1234469lfq.205.2023.08.22.23.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 23:48:15 -0700 (PDT)
Date: Wed, 23 Aug 2023 09:48:12 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZOWrrK+woCwxhu0W@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186556

Hi,

On Tue, Aug 22, 2023 at 11:25:58PM -0700, Khem Raj wrote:
> On Tue, Aug 22, 2023 at 11:10 PM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > Also set target and server IP addresses correctly to 127.0.0.1
> > so that TEST_TARGET_IP and TEST_SERVER_IP don't
> > need to be set manually with slirp.
> >
> > Users run qemu images with slirp networking like this:
> >
> > $ bitbake core-image-minimal
> > $ ../poky/scripts/runqemu slirp
> >
> > slirp networking means that only one TCP port is forwarded from host
> > system to the qemu machine so that ssh into the machine works. ping
> > and other low level networking from host to target machine do not work,
> > but networking from target via host does work. This is much more easy to
> > setup than the bridge networking used by default, which I've never
> > managed to get running on various host machines.
> >
> > To use slirp networking wita qemu and core-image-minimal to run testimage.bbclass tests, add
> > these to local.conf:
> >
> > IMAGE_CLASSES += "testimage"
> > IMAGE_FEATURES += "ssh-server-dropbear"
> > TEST_RUNQEMUPARAMS += "slirp"
> >
> > Then image can be compiled and tested with:
> >
> > $ bitbake core-image-minimal
> > $ bitbake -c testimage core-image-minimal
> >
> > Note that only few of the current oeqa runtime tests work against
> > core-image-minimal, but test results look like:
> >
> > RESULTS:
> > RESULTS - date.DateTest.test_date: PASSED (3.64s)
> > RESULTS - df.DfTest.test_df: PASSED (0.55s)
> > RESULTS - oe_syslog.SyslogTest.test_syslog_running: PASSED (0.56s)
> > RESULTS - oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (1.88s)
> > RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (0.93s)
> > RESULTS - pam.PamBasicTest.test_pam: PASSED (2.20s)
> > RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.98s)
> > RESULTS - ping.PingTest.test_ping: PASSED (0.05s)
> > RESULTS - ssh.SSHTest.test_ssh: PASSED (1.28s)
> > RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.56s)
> > RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.10s)
> > RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (0.92s)
> > RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.56s)
> > RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.54s)
> > RESULTS - apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
> > RESULTS - buildcpio.BuildCpioTest.test_cpio: SKIPPED (0.00s)
> > RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> > RESULTS - buildlzip.BuildLzipTest.test_lzip: SKIPPED (0.00s)
> > RESULTS - connman.ConnmanTest.test_connmand_help: SKIPPED (0.00s)
> > RESULTS - connman.ConnmanTest.test_connmand_running: SKIPPED (0.00s)
> > RESULTS - dnf.DnfBasicTest.test_dnf_help: SKIPPED (0.00s)
> > RESULTS - dnf.DnfBasicTest.test_dnf_history: SKIPPED (0.00s)
> > RESULTS - dnf.DnfBasicTest.test_dnf_info: SKIPPED (0.00s)
> > RESULTS - dnf.DnfBasicTest.test_dnf_search: SKIPPED (0.00s)
> > RESULTS - dnf.DnfBasicTest.test_dnf_version: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_exclude: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_install: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_install_dependency: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_install_from_disk: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_install_from_http: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_installroot: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_installroot_usrmerge: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_makecache: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_reinstall: SKIPPED (0.00s)
> > RESULTS - dnf.DnfRepoTest.test_dnf_repoinfo: SKIPPED (0.00s)
> > RESULTS - gcc.GccCompileTest.test_gcc_compile: SKIPPED (0.00s)
> > RESULTS - gcc.GccCompileTest.test_gpp2_compile: SKIPPED (0.00s)
> > RESULTS - gcc.GccCompileTest.test_gpp_compile: SKIPPED (0.00s)
> > RESULTS - gcc.GccCompileTest.test_make: SKIPPED (0.00s)
> > RESULTS - gi.GObjectIntrospectionTest.test_python: SKIPPED (0.00s)
> > RESULTS - go.GoHelloworldTest.test_gohelloworld: SKIPPED (0.00s)
> > RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: SKIPPED (0.00s)
> > RESULTS - ldd.LddTest.test_ldd: SKIPPED (0.00s)
> > RESULTS - logrotate.LogrotateTest.test_logrotate_newlog: SKIPPED (0.00s)
> > RESULTS - logrotate.LogrotateTest.test_logrotate_wtmp: SKIPPED (0.00s)
> > RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config: SKIPPED (0.00s)
> > RESULTS - opkg.OpkgRepoTest.test_opkg_install_from_repo: SKIPPED (0.00s)
> > RESULTS - perl.PerlTest.test_perl_works: SKIPPED (0.00s)
> > RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED (0.00s)
> > RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
> > RESULTS - python.PythonTest.test_python3: SKIPPED (0.00s)
> > RESULTS - rpm.RpmBasicTest.test_rpm_help: SKIPPED (0.00s)
> > RESULTS - rpm.RpmBasicTest.test_rpm_query: SKIPPED (0.00s)
> > RESULTS - rpm.RpmBasicTest.test_rpm_query_nonroot: SKIPPED (0.00s)
> > RESULTS - rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size: SKIPPED (0.00s)
> > RESULTS - rpm.RpmInstallRemoveTest.test_rpm_install: SKIPPED (0.00s)
> > RESULTS - rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (0.00s)
> > RESULTS - rust.RustCompileTest.test_cargo_compile: SKIPPED (0.00s)
> > RESULTS - rust.RustCompileTest.test_rust_compile: SKIPPED (0.00s)
> > RESULTS - scp.ScpTest.test_scp_file: SKIPPED (0.00s)
> > RESULTS - stap.StapTest.test_stap: SKIPPED (0.00s)
> > RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPED (0.00s)
> > RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKIPPED (0.00s)
> > RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s)
> > RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED (0.00s)
> > RESULTS - weston.WestonTest.test_wayland_info: SKIPPED (0.00s)
> > RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compositor: SKIPPED (0.00s)
> > RESULTS - weston.WestonTest.test_weston_running: SKIPPED (0.00s)
> > RESULTS - weston.WestonTest.test_weston_supports_xwayland: SKIPPED (0.00s)
> > RESULTS - xorg.XorgTest.test_xorg_running: SKIPPED (0.00s)
> > SUMMARY:
> > core-image-minimal () - Ran 70 tests in 22.173s
> > core-image-minimal - OK - All required tests passed (successes=14, skipped=56, failures=0, errors=0)
> > NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Succeeded
> > NOTE: Tasks Summary: Attempted 1305 tasks of which 1304 didn't need to be rerun and all succeeded.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/classes-recipe/testimage.bbclass | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > v2: set TEST_SERVER_IP correctly to default qemu dhcp server IP 10.0.2.2
> > so that testimage selftests pass
> >
> > v1: https://lists.openembedded.org/g/openembedded-core/message/186424
> >
> > diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
> > index e3068348ff..7340996788 100644
> > --- a/meta/classes-recipe/testimage.bbclass
> > +++ b/meta/classes-recipe/testimage.bbclass
> > @@ -322,7 +322,7 @@ def testimage_main(d):
> >      ovmf = d.getVar("QEMU_USE_OVMF")
> >
> >      slirp = False
> > -    if d.getVar("QEMU_USE_SLIRP"):
> > +    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPARAMS', 'slirp', True, False, d):
> >          slirp = True
> >
> >      # TODO: We use the current implementation of qemu runner because of
> > @@ -369,10 +369,18 @@ def testimage_main(d):
> >      # runtime use network for download projects for build
> >      export_proxies(d)
> >
> > +    if slirp:
> > +        target_ip = "127.0.0.1"
> 
> will this work when running multiple instances of qemu ?
> e.g.  try bitbake core-image-ptest-all

The port forwarding settings are same for each of the qemu virtual machine instances
currently.

So one instance reserves the 127.0.0.1 and TCP port 2222, by default.
Another instance will fail to reserve the port 2222 and qemu startup fails.

So I don't think "slirp" works with multiple qemu instances on a single machine.

This could be changed if the hostfwd port number selection was changed to be dynamic.
runqemu currently hard codes this as:

ostfwd = ",hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23"

A retry with different, increasing port numbers could be added.

Then qemurunner.py could be changed to detect the effective port from qemu startup logs,
as it already now partially does as a fallback, or maybe the current code would even work
with dynamic port numbers.

Cheers,

-Mikko

> 
> > +        # from qemu target to host with default DHCP server
> > +        server_ip = "10.0.2.2"
> > +    else:
> > +        target_ip = d.getVar("TEST_TARGET_IP")
> > +        server_ip = d.getVar("TEST_SERVER_IP")
> > +
> >      # the robot dance
> >      target = OERuntimeTestContextExecutor.getTarget(
> > -        d.getVar("TEST_TARGET"), logger, d.getVar("TEST_TARGET_IP"),
> > -        d.getVar("TEST_SERVER_IP"), **target_kwargs)
> > +        d.getVar("TEST_TARGET"), logger, target_ip,
> > +        server_ip, **target_kwargs)
> >
> >      # test context
> >      tc = OERuntimeTestContext(td, logger, target, image_packages, extract_dir)
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186547): https://lists.openembedded.org/g/openembedded-core/message/186547
> > Mute This Topic: https://lists.openembedded.org/mt/100910036/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

