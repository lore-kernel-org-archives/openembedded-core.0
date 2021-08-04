Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.6122.1628064402983755536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 01:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uKztfBkG;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id m12so1173277wru.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 01:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VWCd7c5QCr9KBpbEegPo/5E029IVR4Sz6WFcDJ4hhuU=;
        b=uKztfBkGQLiniT6OykSoq/SdoMNWVdarqGR+VXBLk9Hidqunjq9rZNGjeJg8syI9TS
         ufqbZL2RuPjGhgg6ehJ6Pl0dEQXKdM/fHvB20p//rlm/zAiOW1qZC1HAiZ1YHdgfD5xC
         fvaQRfkqRD07MT2ilgoS+zVozVh45fITOQZ/owG6CLR4PDvo66qFCqfFU2xhHOQdV3ds
         PQVeq6TUURctQtp2uBvdQQERnkDt1veWtodO6r28ZAB+2V0rg4+43MtYEIomzFTKB2q4
         +lGX7M3tiPHhlc86QyhuIg0Kcmm8+yyfIVA2y1gN5wBGGkBG6bVOB5DsbLF9zi6d4Lhx
         /XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWCd7c5QCr9KBpbEegPo/5E029IVR4Sz6WFcDJ4hhuU=;
        b=oYX8VPLMuLVdDs/B51WeHPfqYplw00k4YlEJsYcIBL/319pvm2nWArKT7Abo2D97cy
         AH407xQ1p6l0uDFQ+JQSDlEjAdS3pbmVqK9KMnLDobQ5a0YQQyN5AoWZikqfXNPGa1i5
         +IjA4F32Ybm22XklBP+NPREVhSlWbzc5wWAC7heIQsKapTb+51HpMgsyq95IJgyqqByn
         ubER1fLh/qATrtdZIQ0N3/MkcNXHRMoEzcWs1z08bezIR+eQre/luOgXFObCjs3aPlde
         0LBmxZrWOZvkg045qQ0WLjTWmij6FIbEsy48QWVHpf5q9hJ43zA672WcKYEB8gIKQ1Zk
         ZlXw==
X-Gm-Message-State: AOAM532vkZWy21eWg13v3OPrkKQ1crIDTvSHvkgT1/Xx3G/Kge77VpcF
	NjvxXjnCT98l8CO+B/yZc9KcA1SBWtyYVw==
X-Google-Smtp-Source: ABdhPJzYx1r09F6KcKd+0H60D61HjNjMtAgD1GAQ185WWoj8MH2EHX7MA7qIXNuCNhDqjKvyZxS3Ig==
X-Received: by 2002:a05:6000:1ce:: with SMTP id t14mr17463950wrx.83.1628064401479;
        Wed, 04 Aug 2021 01:06:41 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q17sm1512463wre.3.2021.08.04.01.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:06:41 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] iputils: backport a fix for building on hosts without ip installed
Date: Wed,  4 Aug 2021 10:06:37 +0200
Message-Id: <20210804080637.5869-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1697EB16E97488E4.1963@lists.openembedded.org>
References: <1697EB16E97488E4.1963@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* otherwise fails with:
  ../git/ping/meson.build:38:0: ERROR: Program or command 'ip' not found or not executable
  on hosts without ip command

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-meson-Make-tests-optional.patch      | 217 ++++++++++++++++++
 .../iputils/iputils_20210722.bb               |   8 +-
 2 files changed, 222 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
new file mode 100644
index 0000000000..0e47a8f047
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
@@ -0,0 +1,217 @@
+From c50aa971b9f7bf3212c48cb271ab2b1e804aef7f Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index c2a5bf44ea..2e4ff2e826 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils \
-           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
-           "
+    file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+    file://0001-meson-Make-tests-optional.patch \
+"
 SRCREV = "71bb2a6c72e9f658e90ac618c73d873a76bbaa81"
 
 S = "${WORKDIR}/git"
@@ -38,7 +39,8 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-EXTRA_OEMESON += "--prefix=${root_prefix}/"
+# skip tests as they require ip to be installed on host
+EXTRA_OEMESON += "--prefix=${root_prefix}/ -DSKIP_TESTS=true"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.30.2

