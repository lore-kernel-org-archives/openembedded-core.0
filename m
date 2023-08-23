Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B7BEE49B4
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 06:10:45 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.5801.1692771037503588991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 23:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4c-004KW1-1W;
	Wed, 23 Aug 2023 09:10:34 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4c-00Gad1-7U; Wed, 23 Aug 2023 09:10:34 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/9] testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS
Date: Wed, 23 Aug 2023 09:10:18 +0300
Message-Id: <20230823061025.3952909-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230823061025.3952909-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186547

Also set target and server IP addresses correctly to 127.0.0.1
so that TEST_TARGET_IP and TEST_SERVER_IP don't
need to be set manually with slirp.

Users run qemu images with slirp networking like this:

$ bitbake core-image-minimal
$ ../poky/scripts/runqemu slirp

slirp networking means that only one TCP port is forwarded from host
system to the qemu machine so that ssh into the machine works. ping
and other low level networking from host to target machine do not work,
but networking from target via host does work. This is much more easy to
setup than the bridge networking used by default, which I've never
managed to get running on various host machines.

To use slirp networking wita qemu and core-image-minimal to run testimage.bbclass tests, add
these to local.conf:

IMAGE_CLASSES += "testimage"
IMAGE_FEATURES += "ssh-server-dropbear"
TEST_RUNQEMUPARAMS += "slirp"

Then image can be compiled and tested with:

$ bitbake core-image-minimal
$ bitbake -c testimage core-image-minimal

Note that only few of the current oeqa runtime tests work against
core-image-minimal, but test results look like:

RESULTS:
RESULTS - date.DateTest.test_date: PASSED (3.64s)
RESULTS - df.DfTest.test_df: PASSED (0.55s)
RESULTS - oe_syslog.SyslogTest.test_syslog_running: PASSED (0.56s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (1.88s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (0.93s)
RESULTS - pam.PamBasicTest.test_pam: PASSED (2.20s)
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.98s)
RESULTS - ping.PingTest.test_ping: PASSED (0.05s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (1.28s)
RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.56s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.10s)
RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (0.92s)
RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.56s)
RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.54s)
RESULTS - apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
RESULTS - buildcpio.BuildCpioTest.test_cpio: SKIPPED (0.00s)
RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
RESULTS - buildlzip.BuildLzipTest.test_lzip: SKIPPED (0.00s)
RESULTS - connman.ConnmanTest.test_connmand_help: SKIPPED (0.00s)
RESULTS - connman.ConnmanTest.test_connmand_running: SKIPPED (0.00s)
RESULTS - dnf.DnfBasicTest.test_dnf_help: SKIPPED (0.00s)
RESULTS - dnf.DnfBasicTest.test_dnf_history: SKIPPED (0.00s)
RESULTS - dnf.DnfBasicTest.test_dnf_info: SKIPPED (0.00s)
RESULTS - dnf.DnfBasicTest.test_dnf_search: SKIPPED (0.00s)
RESULTS - dnf.DnfBasicTest.test_dnf_version: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_exclude: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_install: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_dependency: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_from_disk: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_from_http: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_installroot: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_installroot_usrmerge: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_makecache: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_reinstall: SKIPPED (0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_repoinfo: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_gcc_compile: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_gpp2_compile: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_gpp_compile: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_make: SKIPPED (0.00s)
RESULTS - gi.GObjectIntrospectionTest.test_python: SKIPPED (0.00s)
RESULTS - go.GoHelloworldTest.test_gohelloworld: SKIPPED (0.00s)
RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: SKIPPED (0.00s)
RESULTS - ldd.LddTest.test_ldd: SKIPPED (0.00s)
RESULTS - logrotate.LogrotateTest.test_logrotate_newlog: SKIPPED (0.00s)
RESULTS - logrotate.LogrotateTest.test_logrotate_wtmp: SKIPPED (0.00s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config: SKIPPED (0.00s)
RESULTS - opkg.OpkgRepoTest.test_opkg_install_from_repo: SKIPPED (0.00s)
RESULTS - perl.PerlTest.test_perl_works: SKIPPED (0.00s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED (0.00s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
RESULTS - python.PythonTest.test_python3: SKIPPED (0.00s)
RESULTS - rpm.RpmBasicTest.test_rpm_help: SKIPPED (0.00s)
RESULTS - rpm.RpmBasicTest.test_rpm_query: SKIPPED (0.00s)
RESULTS - rpm.RpmBasicTest.test_rpm_query_nonroot: SKIPPED (0.00s)
RESULTS - rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size: SKIPPED (0.00s)
RESULTS - rpm.RpmInstallRemoveTest.test_rpm_install: SKIPPED (0.00s)
RESULTS - rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (0.00s)
RESULTS - rust.RustCompileTest.test_cargo_compile: SKIPPED (0.00s)
RESULTS - rust.RustCompileTest.test_rust_compile: SKIPPED (0.00s)
RESULTS - scp.ScpTest.test_scp_file: SKIPPED (0.00s)
RESULTS - stap.StapTest.test_stap: SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED (0.00s)
RESULTS - weston.WestonTest.test_wayland_info: SKIPPED (0.00s)
RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compositor: SKIPPED (0.00s)
RESULTS - weston.WestonTest.test_weston_running: SKIPPED (0.00s)
RESULTS - weston.WestonTest.test_weston_supports_xwayland: SKIPPED (0.00s)
RESULTS - xorg.XorgTest.test_xorg_running: SKIPPED (0.00s)
SUMMARY:
core-image-minimal () - Ran 70 tests in 22.173s
core-image-minimal - OK - All required tests passed (successes=14, skipped=56, failures=0, errors=0)
NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Succeeded
NOTE: Tasks Summary: Attempted 1305 tasks of which 1304 didn't need to be rerun and all succeeded.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testimage.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

v2: set TEST_SERVER_IP correctly to default qemu dhcp server IP 10.0.2.2
so that testimage selftests pass

v1: https://lists.openembedded.org/g/openembedded-core/message/186424

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index e3068348ff..7340996788 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -322,7 +322,7 @@ def testimage_main(d):
     ovmf = d.getVar("QEMU_USE_OVMF")
 
     slirp = False
-    if d.getVar("QEMU_USE_SLIRP"):
+    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPARAMS', 'slirp', True, False, d):
         slirp = True
 
     # TODO: We use the current implementation of qemu runner because of
@@ -369,10 +369,18 @@ def testimage_main(d):
     # runtime use network for download projects for build
     export_proxies(d)
 
+    if slirp:
+        target_ip = "127.0.0.1"
+        # from qemu target to host with default DHCP server
+        server_ip = "10.0.2.2"
+    else:
+        target_ip = d.getVar("TEST_TARGET_IP")
+        server_ip = d.getVar("TEST_SERVER_IP")
+
     # the robot dance
     target = OERuntimeTestContextExecutor.getTarget(
-        d.getVar("TEST_TARGET"), logger, d.getVar("TEST_TARGET_IP"),
-        d.getVar("TEST_SERVER_IP"), **target_kwargs)
+        d.getVar("TEST_TARGET"), logger, target_ip,
+        server_ip, **target_kwargs)
 
     # test context
     tc = OERuntimeTestContext(td, logger, target, image_packages, extract_dir)
-- 
2.34.1


