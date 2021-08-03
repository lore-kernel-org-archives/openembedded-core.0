Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.2314.1627978316618567954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 01:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1738BtR8015880
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Aug 2021 01:11:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1738Bs41018393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Aug 2021 01:11:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 3 Aug 2021 01:11:54 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 3 Aug 2021 01:11:54 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] iputils: fix do_configure failure of missing ip command
Date: Tue, 3 Aug 2021 01:11:54 -0700
Message-ID: <20210803081154.22516-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If 'testimage' and 'testsdk' are not inherited, the 'ip'
comamnd will not be in HOSTTOOLS. This results in do_configure
failure of iputils. Backport a patch and skipping building
tests to fix the problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-meson-Make-tests-optional.patch      | 220 ++++++++++++++++++
 .../iputils/iputils_20210722.bb               |   3 +-
 2 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
new file mode 100644
index 0000000000..9f17cbdb87
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
@@ -0,0 +1,220 @@
+From d8048d60d30a2efe7883b36626123630ce69b9fc Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Fri, 23 Jul 2021 16:32:46 +0200
+Subject: [PATCH] meson: Make tests optional
+
+Now can be disabled with -DSKIP_TESTS=true.
+
+It allows to avoid meson error during build when ip isn't installed.
+
+Closes: #359
+
+Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Heiko Becker <heirecka@exherbo.org>
+[ pvorel: Rename variable TEST => SKIP_TESTS, default false, adjust
+the description ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
+Upstream-Status: Backport [3163c49f9f4ad473a00d8a345ee334a028376011]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson_options.txt     |  3 ++
+ ping/meson.build      | 84 ++-----------------------------------------
+ ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 86 insertions(+), 82 deletions(-)
+ create mode 100644 ping/test/meson.build
+
+diff --git a/meson_options.txt b/meson_options.txt
+index ac5f5d9..517667f 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
+ 
+ option('USE_GETTEXT', type: 'boolean', value: true,
+ 	description: 'Enable I18N')
++
++option('SKIP_TESTS', type: 'boolean', value: false,
++	description: 'Skip tests during build')
+diff --git a/ping/meson.build b/ping/meson.build
+index 1e678ec..83ea353 100644
+--- a/ping/meson.build
++++ b/ping/meson.build
+@@ -27,86 +27,6 @@ if (setcap_ping)
+ 	)
+ endif
+ 
+-##### TESTS #####
+-
+-# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
+-
+-# GitHub CI does not have working IPv6
+-# https://github.com/actions/virtual-environments/issues/668
+-ipv6_dst = []
+-ipv6_switch = []
+-r = run_command('ip', '-6', 'a')
+-if r.stdout().strip().contains('::1')
+-  message('IPv6 enabled')
+-  ipv6_dst = [ '::1' ]
+-  ipv6_switch = [ '-6' ]
+-else
+-  message('WARNING: IPv6 disabled')
++if not get_option('SKIP_TESTS')
++	subdir('test')
+ endif
+-
+-run_as_root = false
+-r = run_command('id', '-u')
+-if r.stdout().strip().to_int() == 0
+-  message('running as root')
+-  run_as_root = true
+-else
+-  message('running as normal user')
+-endif
+-
+-foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
+-  foreach switch : [ '', '-4' ] + ipv6_switch
+-	args = [ '-c1', dst ]
+-	should_fail = false
+-
+-	if switch != ''
+-	  args = [switch] + args
+-	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
+-		 should_fail = true
+-	  endif
+-	endif
+-
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : should_fail)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt = [
+-  [ '-c1' ],
+-  [ '-c5', '-i0.1' ],
+-  [ '-c1', '-I', 'lo' ],
+-  [ '-c1', '-w1' ],
+-  [ '-c1', '-W1' ],
+-  [ '-c1', '-W1.1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt_fail = [
+-  [ '-c1.1' ],
+-  [ '-I', 'nonexisting' ],
+-  [ '-w0.1' ],
+-  [ '-w0,1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : true)
+-  endforeach
+-endforeach
+-
+-ping_tests_user_fail = [
+-  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_user_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : not run_as_root)
+-  endforeach
+-endforeach
+diff --git a/ping/test/meson.build b/ping/test/meson.build
+new file mode 100644
+index 0000000..43aed75
+--- /dev/null
++++ b/ping/test/meson.build
+@@ -0,0 +1,81 @@
++# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
++
++# GitHub CI does not have working IPv6
++# https://github.com/actions/virtual-environments/issues/668
++ipv6_dst = []
++ipv6_switch = []
++r = run_command('ip', '-6', 'a')
++if r.stdout().strip().contains('::1')
++  message('IPv6 enabled')
++  ipv6_dst = [ '::1' ]
++  ipv6_switch = [ '-6' ]
++else
++  message('WARNING: IPv6 disabled')
++endif
++
++run_as_root = false
++r = run_command('id', '-u')
++if r.stdout().strip().to_int() == 0
++  message('running as root')
++  run_as_root = true
++else
++  message('running as normal user')
++endif
++
++foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
++  foreach switch : [ '', '-4' ] + ipv6_switch
++	args = [ '-c1', dst ]
++	should_fail = false
++
++	if switch != ''
++	  args = [switch] + args
++	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
++		 should_fail = true
++	  endif
++	endif
++
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : should_fail)
++  endforeach
++endforeach
++
++ping_tests_opt = [
++  [ '-c1' ],
++  [ '-c5', '-i0.1' ],
++  [ '-c1', '-I', 'lo' ],
++  [ '-c1', '-w1' ],
++  [ '-c1', '-W1' ],
++  [ '-c1', '-W1.1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args)
++  endforeach
++endforeach
++
++ping_tests_opt_fail = [
++  [ '-c1.1' ],
++  [ '-I', 'nonexisting' ],
++  [ '-w0.1' ],
++  [ '-w0,1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : true)
++  endforeach
++endforeach
++
++ping_tests_user_fail = [
++  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_user_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : not run_as_root)
++  endforeach
++endforeach
+-- 
+2.30.2
+
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index c2a5bf44ea..2e8d9032e4 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://0001-meson-Make-tests-optional.patch \
            "
 SRCREV = "71bb2a6c72e9f658e90ac618c73d873a76bbaa81"
 
@@ -38,7 +39,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-EXTRA_OEMESON += "--prefix=${root_prefix}/"
+EXTRA_OEMESON += "--prefix=${root_prefix}/ -DSKIP_TESTS=true"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.30.2

