Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AC0EE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 08:53:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.4038.1692694418250838168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 01:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f1E2RRG5;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ffa94a7a47so5114340e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692694416; x=1693299216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4MUKxPZLrdQrNZOwtHBWNFTaHAYrPyxbLYfn6FGcC14=;
        b=f1E2RRG5Ty641hdzoTtUg9IU4I3Bfqz5skWFJ/zLBihAtx7MQDXg9GRxa0irACskE5
         4cYbsKaY1pmhU10u+Lgh/tQdoJ6B5TZCOWBAGs/YKkAm/oR84pTO86rux8U2gXRUo7Mz
         c7Ca7dKd129jeWL6Yd4GQD8iV+1rPviMyZ0zXVAodBbXKzE6ZmZqNvc6TEADfe6/IOAa
         CUkTpA3KCCCkitKRfpeS1sfZVJeYjwl7tuvA2fMcGAZFppme19Pce/Mwr/zKzamrX6Mj
         eCsu++/wxO2gx17oCRZS2mnWHjJam3AbLeAUWa62PdEU8KRHg4ZZm0gHjfKot1GyGIr/
         hm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692694416; x=1693299216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MUKxPZLrdQrNZOwtHBWNFTaHAYrPyxbLYfn6FGcC14=;
        b=TzLfTsAQtDPU3pFy8KcTiiWEDBi4ekB56nFfqkIYK2jwpNMWzERvsaEJhMUMgPPrxM
         BpTJ23Pc94MJPA0LAqohFEJ04WGX83NmEwmksqUeMWwpPIHVXmWX6HpvBM8eWGBUsl2D
         7M1O/9k1FZhtGQKYbvYOeqkNb9ErXt9UDutpqQBCLzqeShFc7pSi21iJ3xx3SsSNhUo0
         KYNYTaszlrLJPGFmiyzV0X4lrUICX2sU2a7NJvgzB84IZOY+Zw/gqu5A1OCzGh6NNHYu
         IBG15ijJ3tsA4v+DyZSYJo/UuuwVwbIxqEv0cdQQNSNBFdaZB4VfQY/agmogBniX87Pe
         5fnA==
X-Gm-Message-State: AOJu0YzJtAh7uCXXurH3d5G3f8xRyMUTM0f8f+Vm6t4fRlv3qqpciYp1
	51VTx6dYuwe9oSwJ2sJf/+6T0g5SvezHiRPTpFw=
X-Google-Smtp-Source: AGHT+IGqf+cs26tLtB3GU+gRUHOsY1h5z0QNfTRNd3SwIskAxHLoEAukRiDNE2mogV4NYnCohZhPxw==
X-Received: by 2002:a05:6512:1088:b0:4fb:89b3:3373 with SMTP id j8-20020a056512108800b004fb89b33373mr7436122lfg.43.1692694416119;
        Tue, 22 Aug 2023 01:53:36 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id j15-20020ac253af000000b004ff9afdee8dsm2135463lfh.76.2023.08.22.01.53.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:53:35 -0700 (PDT)
Date: Tue, 22 Aug 2023 11:53:33 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZOR3jf9JSNjOUaqL@nuoska>
References: <20230821100052.2924726-1-mikko.rapeli@linaro.org>
 <20230821100052.2924726-2-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821100052.2924726-2-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 08:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186496

Hi,

On Mon, Aug 21, 2023 at 01:00:51PM +0300, Mikko Rapeli wrote:
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
> To use slirp networking wita qemu and core-image-minimal to run testimage.bbclass tests, add
> these to local.conf:
> 
> IMAGE_CLASSES += "testimage"
> IMAGE_FEATURES += "ssh-server-dropbear"
> TEST_RUNQEMUPARAMS += "slirp"
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
> RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.56s)
> RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.54s)
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
> RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: SKIPPED (0.00s)
> RESULTS - ldd.LddTest.test_ldd: SKIPPED (0.00s)
> RESULTS - logrotate.LogrotateTest.test_logrotate_newlog: SKIPPED (0.00s)
> RESULTS - logrotate.LogrotateTest.test_logrotate_wtmp: SKIPPED (0.00s)
> RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config: SKIPPED (0.00s)
> RESULTS - opkg.OpkgRepoTest.test_opkg_install_from_repo: SKIPPED (0.00s)
> RESULTS - perl.PerlTest.test_perl_works: SKIPPED (0.00s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED (0.00s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
> RESULTS - python.PythonTest.test_python3: SKIPPED (0.00s)
> RESULTS - rpm.RpmBasicTest.test_rpm_help: SKIPPED (0.00s)
> RESULTS - rpm.RpmBasicTest.test_rpm_query: SKIPPED (0.00s)
> RESULTS - rpm.RpmBasicTest.test_rpm_query_nonroot: SKIPPED (0.00s)
> RESULTS - rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size: SKIPPED (0.00s)
> RESULTS - rpm.RpmInstallRemoveTest.test_rpm_install: SKIPPED (0.00s)
> RESULTS - rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (0.00s)
> RESULTS - rust.RustCompileTest.test_cargo_compile: SKIPPED (0.00s)
> RESULTS - rust.RustCompileTest.test_rust_compile: SKIPPED (0.00s)
> RESULTS - scp.ScpTest.test_scp_file: SKIPPED (0.00s)
> RESULTS - stap.StapTest.test_stap: SKIPPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKIPPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED (0.00s)
> RESULTS - weston.WestonTest.test_wayland_info: SKIPPED (0.00s)
> RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compositor: SKIPPED (0.00s)
> RESULTS - weston.WestonTest.test_weston_running: SKIPPED (0.00s)
> RESULTS - weston.WestonTest.test_weston_supports_xwayland: SKIPPED (0.00s)
> RESULTS - xorg.XorgTest.test_xorg_running: SKIPPED (0.00s)
> SUMMARY:
> core-image-minimal () - Ran 70 tests in 22.173s
> core-image-minimal - OK - All required tests passed (successes=14, skipped=56, failures=0, errors=0)
> NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Succeeded
> NOTE: Tasks Summary: Attempted 1305 tasks of which 1304 didn't need to be rerun and all succeeded.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/testimage.bbclass | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
> index e3068348ff..ad3adceca9 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -322,7 +322,7 @@ def testimage_main(d):
>      ovmf = d.getVar("QEMU_USE_OVMF")
>  
>      slirp = False
> -    if d.getVar("QEMU_USE_SLIRP"):
> +    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPARAMS', 'slirp', True, False, d):
>          slirp = True
>  
>      # TODO: We use the current implementation of qemu runner because of
> @@ -369,10 +369,17 @@ def testimage_main(d):
>      # runtime use network for download projects for build
>      export_proxies(d)
>  
> +    if slirp:
> +        target_ip = "127.0.0.1"
> +        server_ip = target_ip

Sorry, this is wrong. server_ip is the IP address used to address the test host from target, and
with slirp and runqemu this seems to be 10.0.2.2 from the internal DHCP server.
runqemu uses the same for nfs server.

I'll send a v2 and also fix testimage dnf test to correctly use these like apt does.

Cheers,

-Mikko

> +    else:
> +        target_ip = d.getVar("TEST_TARGET_IP")
> +        server_ip = d.getVar("TEST_SERVER_IP")
> +
>      # the robot dance
>      target = OERuntimeTestContextExecutor.getTarget(
> -        d.getVar("TEST_TARGET"), logger, d.getVar("TEST_TARGET_IP"),
> -        d.getVar("TEST_SERVER_IP"), **target_kwargs)
> +        d.getVar("TEST_TARGET"), logger, target_ip,
> +        server_ip, **target_kwargs)
>  
>      # test context
>      tc = OERuntimeTestContext(td, logger, target, image_packages, extract_dir)
> -- 
> 2.34.1
> 

