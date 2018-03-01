Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id B345F71C71
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 16:24:46 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id m12so7167772wrm.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 08:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=x6sU5Napo8nTvm/bwM3ag7sL4AQr/9e4Sp6zb04AW4w=;
	b=Vm0MnHQvZfEBka3nyh2yZsR/BFWfizY6VvEWnOH2wxm5QmAPQXLRMl5Caetb2eALuf
	5FTXPfepcj3ADS82MOxDqYdLbXrsoxbUvd6GTKuVCrMEjwkIG2E2Z/lcT7yVvfB1Swwa
	jVzail6nKb1wvCQlwxjwLO+Atn9de/Z3smHT2KjxLAKD9y/h0LFgQArgwjdVm1RS9Rj/
	k/99cWgLrwM5+YOe8GAcdENEcbCbKOKlQ8pi3pcCcwmRZ9GDw/1EsU3TJz1ZDrgBbJSc
	0VQ9Jl+YFuhUBo4w0Q6SScqYump7/JwcTH9QH9QRHCR6flh4W28C/fWz0rNebGdtPbc/
	4gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x6sU5Napo8nTvm/bwM3ag7sL4AQr/9e4Sp6zb04AW4w=;
	b=hNyej7TDFDVOWAV1QiWbGfch9mwxadorQ7UpoJMnM6OvV8YQ92aSuyoXfL3cznOVHK
	e0rBkSJ18oodSpZ+skFD4cJk7MohC5KOuoJF5BlZ14gWoMWG1jb0HVRfrmqFfKDek4mz
	oL2U1lcNUf6avyYe+Leq2/sCzgXJMaAYqgRVpIKIwCPfjLgZQoDVtDVaPeycukio5ULj
	y/OPPKSw/jQwhKYCxPmMsZHGeDzj/N3mLapLCpzu6B1MNIXR432dR8w48AUMo4suTjn2
	JNYNtSL/P4JVYnkUVG09YU+CzREuMwDHUR+AzRiXQtImdLRXulFWMpXQGvpkLbI7GM8j
	G3rg==
X-Gm-Message-State: APf1xPCpt4Dz/ofB32hyzT8pLr+wxh5/LKo410jxcsi7ccAHMrVa5aA2
	sS2Sc4W5EkIkMSWRikWAvjKNDt7x
X-Google-Smtp-Source: AG47ELujmTqKPJAxccI8FxufYga+mzaHZvddAUjC3zc1t8NrDDnQSB/5AevPam4KwoI0nKkJz2PTrg==
X-Received: by 10.223.183.75 with SMTP id n11mr2323221wre.162.1519921487015;
	Thu, 01 Mar 2018 08:24:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4408971wmt.16.2018.03.01.08.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 08:24:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:24:42 +0000
Message-Id: <20180301162442.32506-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] dbus-test_1.12.2: various fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 16:24:46 -0000

From: Juro Bystricky <juro.bystricky@intel.com>

The result of running dbus-test-ptest was a series of
various segfaults, interpreted as FAILs. This was a direct consequence
of the test suite loading the installed shared library libdbus-1.so, not the
one built along the test suite.

While we normally want to test against the installed libraries, we cannot
do this in this case as the test suite expects a library that is configured/compiled
differently from the installed one. We could configure the installed library
identically as the test suite expects, (and there should be no issues), however
this is not desirable for performance reasons.

Hence we need to use the library built along with the test suite.
Of course, running the test suite against its own library does not
test the installed library, however they are both built from the same
sources so that can give us some kind of indication.

The following changes were made:

1. Configure the test library as close as possible to the installed one,
   with some additional configuration options that are needed for testing.
   (Use dbus_1.12.2.bb recipe as a template)
2. Include the shared libraries in the package, use LD_LIBRARY_PATH during
   testing to load them instead of the installed ones.
3. Add a few more tests. (There are still some additional tests built that
   are not used, but they would have to be special-cased).
4. When evaluating the test results, differentiate between "FAIL" and "SKIP"

[YOCTO #10841]
[YOCTO #12277]

(From OE-Core rev: 5d148aa9c3c338fabab1e60e2ca64d09c9b8477f)

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.2.bb | 32 ++++++++++++++++++++++++++----
 meta/recipes-core/dbus/dbus/run-ptest      | 20 ++++++++++++++++---
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.2.bb b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
index c3891a33701..26556ed2468 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.2.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
@@ -34,25 +34,49 @@ EXTRA_OECONF = "--enable-tests \
                 --enable-checks \
                 --enable-asserts \
                 --enable-verbose-mode \
+                --enable-largefile \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-                --disable-systemd \
-                --without-systemdsystemunitdir \
                 --with-dbus-test-dir=${PTEST_PATH} \
                 ${EXTRA_OECONF_X}"
 
+EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
+
 do_install() {
     :
 }
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
-	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
+	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay \
+	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass "
 	for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
+
 	l="bus bus-system bus-launch-helper"
 	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
-	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
+
 	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
+
+	install -d ${D}${PTEST_PATH}/test/.libs
+	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
+
+	# Remove build host references...
+	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf \) -type f -exec \
+		sed -i \
+		 -e 's:${B}:${PTEST_PATH}:g' \
+		 {} +
 }
+
 RDEPENDS_${PN}-ptest += "bash"
+
+PRIVATE_LIBS_${PN}-ptest = "libdbus-1.so.3"
diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index c72d083a917..8a8970ee208 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -1,10 +1,24 @@
 #!/bin/sh
 
 output() {
-  if [ $? -eq 0 ]
+  retcode=$?
+  if [ $retcode -eq 0 ]
     then echo "PASS: $i"
-    else echo "FAIL: $i"
+  elif [ $retcode -eq 77 ]
+    then echo "SKIP: $i"
+  else echo "FAIL: $i"
   fi
 }
 
-for i in `ls test/test-*`; do ./$i ./test/data DBUS_TEST_HOMEDIR=./test >/dev/null; output; done
+export DBUS_TEST_HOMEDIR=./test
+export XDG_RUNTIME_DIR=./test
+export LD_LIBRARY_PATH=/usr/lib/dbus-test/ptest/test/.libs
+
+files=`ls test/test-*`
+
+for i in $files
+	do
+		./$i ./test/data >/dev/null
+		output
+	done
+
-- 
2.11.0


