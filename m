Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70114CD98E3
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:27 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.5196.1696982540370986661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jSRnjqZa;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3af8b498d31so4785807b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982539; x=1697587339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpvDPDSWHJH6e50O68yVQVx7laM1nW4jmTMxpZlNpoY=;
        b=jSRnjqZaRk3LbtBc9dFDxcM8g8F3Mwahb1gtcqjMk/ONd7My219iI1U3n/f70oLhAD
         DePhvAlUSYZmsGUNPMgB5BotdEyet6VFhC5UdPNvZuGOALtfMSmWo2QgC1buTK3pPr4J
         PvJMK1kPJZbYW1OCO/oT6Cgul86wB4+tefctZUElUXKiRFkQMPYn7odqSU8BETZqv4b1
         6NI4ppI/pQbcj+8AFrV0Qa8MHYAmY2OEjmYZzoIB9JehJ0p0AdO7Fo5TtjAtNeH7xsZv
         qvW1NjtOc64YiDZY4Rs1ujxe/h/IC7t49Tw8J4EV0gI6ozf4qU2yBs/qOKYkqZ1ucLqO
         E/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982539; x=1697587339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpvDPDSWHJH6e50O68yVQVx7laM1nW4jmTMxpZlNpoY=;
        b=AwPaF321MJmohnRPFMF+ltCk+0+NfUm0NykkWV55Qe9NHzdmtaebaVKYAqKnu2sxxl
         1yo5UOCfjxjKTl4C3Va+xhSGWRNpew6LbJca+0tbypIE6T+Kq8uVVIShHey81rLFuHJ7
         lZfZ42Q+/CbID1RRBQsRvoFeCrRHuzqrMaW75aaR7XfG5s6n0NhxeoKh78vscmFlAE4m
         IyJx76qJU+YVH3NWRsAdmutEJ/6hppo+ST6n9xDbsc3YzIXfEGcjpGI6kmVWg9BZJKwJ
         LzYc5ryrDFQKI9FnavKySiJFptf001gg5oWHM1HO4+mldT4bA0Z4mAxNV4X5ZM8ZdEBo
         P+7A==
X-Gm-Message-State: AOJu0Yy3rAlwiarxMHsecRDr3VBaPxAu9Wx9UmG6XApy09lV/jbcnHSr
	BKWARmtMJ0iwXk35LChUqUJ2xA1Rc0HJEmbYnTY=
X-Google-Smtp-Source: AGHT+IHSg7NCn0VepJYZ7tDp8xt2278y+LpcLagvsAfnino8xUV2Eb9cG7YRmo38cMllwlQYZbwX0Q==
X-Received: by 2002:a05:6358:94a6:b0:135:73b0:cc6c with SMTP id i38-20020a05635894a600b0013573b0cc6cmr22905064rwb.28.1696982539220;
        Tue, 10 Oct 2023 17:02:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/20] busybox: remove coreutils dependency in busybox-ptest
Date: Tue, 10 Oct 2023 14:01:32 -1000
Message-Id: <0aa56e54e504d5bfd64ec31347fd5112840c05ec.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188937

From: Ross Burton <ross.burton@arm.com>

A dependency on coreutils was added to busybox-ptest in oe-core 658c5ed
to fix a test failure.

The failure is because one of the start-stop-daemon tests is known to
fail if /bin/false is busybox. Instead of failing, we can check if
/bin/false is a symlink to busybox and skip the test if so.

[ YOCTO #15068 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37482e404cf4dcf9360c29986ced8db78baf249b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc         |  2 +-
 .../busybox/busybox/start-stop-false.patch    | 35 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/start-stop-false.patch

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 582d87949e..f5d7c3f9c8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -56,7 +56,7 @@ RDEPENDS:${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_man
 inherit cml1 systemd update-rc.d ptest
 
 # busybox's unzip test case needs zip command, which busybox itself does not provide
-RDEPENDS:${PN}-ptest = "zip coreutils"
+RDEPENDS:${PN}-ptest = "zip"
 
 # internal helper
 def busybox_cfg(feature, tokens, cnf, rem):
diff --git a/meta/recipes-core/busybox/busybox/start-stop-false.patch b/meta/recipes-core/busybox/busybox/start-stop-false.patch
new file mode 100644
index 0000000000..3aef68329c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/start-stop-false.patch
@@ -0,0 +1,35 @@
+It's known that the final start-stop-daemon test fails if /bin/false is
+actually a busybox symlink.  Instead of failing, check if false is
+busybox and adapt the expected output to match.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2023-August/090416.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/testsuite/start-stop-daemon.tests b/testsuite/start-stop-daemon.tests
+index 0757b1288..aa6e9cc41 100755
+--- a/testsuite/start-stop-daemon.tests
++++ b/testsuite/start-stop-daemon.tests
+@@ -27,10 +27,18 @@ testing "start-stop-daemon without -x and -a" \
+ # but at least it checks that pathname to exec() is correct
+ #
+ # NB: this fails if /bin/false is a busybox symlink:
+-# busybox looks at argv[0] and says "qwerty: applet not found"
+-testing "start-stop-daemon with both -x and -a" \
+-	'start-stop-daemon -S -x /bin/false -a qwerty false 2>&1; echo $?' \
+-	"1\n" \
+-	"" ""
++# busybox looks at argv[0] and says "qwerty: applet not found", so
++# skip the test if false is busybox.
++case $(readlink /bin/false) in
++    *busybox*)
++        echo "SKIPPED: start-stop-daemon with both -x and -a (need non-busybox false)"
++        ;;
++    *)
++		testing "start-stop-daemon with both -x and -a" \
++			'start-stop-daemon -S -x /bin/false -a qwerty false 2>&1; echo $?' \
++			"1\n" \
++			"" ""
++        ;;
++esac
+ 
+ exit $FAILCOUNT
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 968dce65e4..06eb9eb999 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
+           file://start-stop-false.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.34.1


