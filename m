Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 99A346C131
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:32:22 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g131so5364661wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XNthz9ZCpIy8EWC9YQkx7on54a6ZxfLrWJOqQ3UXcs4=;
	b=WBV6+hrQ6agaXuuw1TVGHsHw6+Ka39/400UXOV38ouoG26EaLM7uTvs7qYRKfyB/6u
	XucBYLhca0nwrifbqZg5yfU3pDZRcxDYGDhqQV+lWBj13V5G1+m/ptxk2WDkgIfsvXBe
	hie9khYJQwUjTZN8rIQEEi8eSAgS5F3uGwccs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XNthz9ZCpIy8EWC9YQkx7on54a6ZxfLrWJOqQ3UXcs4=;
	b=HXqdIpFtQVXBNEzBCHTzHHTRMhsSx3asN3SctPOD5dOu7NvFlnz5b4KlsNO6bW0Ci6
	l5UmMJGMy180sRHHwM9tlKlhJgShg+RedmUwbz+G+QXxn+N3B4eXTiMBZfTqDaWEBh6X
	UvY0WmzMSTdghqdmkADsVs77vHw2UHZI68ve/URR+jtUFKUJTBjxWDu604zD4y0k0ZNW
	129Lwe9+xVYGFImzsvgl6d8Mm/yXi9G7oq6hyrQP6ipr9FNP7JQINL8n/HCeFYXSHs+2
	/RbVMw29imIMTNdjxVlEQJqX+tV9xHoBS85a2Q2GRvTAIJ4wqSQlcrOIYUpinnZCHqfW
	kV6Q==
X-Gm-Message-State: AGRZ1gJQs7HOHQOKd8XaL2x11SKMSi3oeT1lfxJ16+yEJzpCpJ+HCVU/
	Bm1ZyDsFJxQQrAARLJR27pfywRfYWEw=
X-Google-Smtp-Source: AJdET5dwZ+vDGrD1k1W8T5QfZYOoDAhH2X9bkoODTr6ggu9QWMBu0jMM0jsg5TAS7GUAV+WDDrFCJA==
X-Received: by 2002:a1c:af89:: with SMTP id y131mr7412660wme.137.1542641542710;
	Mon, 19 Nov 2018 07:32:22 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x81sm409180wmg.17.2018.11.19.07.32.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:32:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 15:32:18 +0000
Message-Id: <20181119153219.21850-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119153219.21850-1-richard.purdie@linuxfoundation.org>
References: <20181119153219.21850-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] lttng-tools: Upgrade 2.9.5 -> 2.10.5 and improve ptest
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
X-List-Received-Date: Mon, 19 Nov 2018 15:32:22 -0000

A backported patch was removed.

The kmod option changed format in the new version so was adjusted accordingly.

The ptest package was improved to resolve failures in the tests/unit/
directory but disabling attempts to rebuild the binaries on target.

Various ptest libtool script wrappers are now replaced with real binaries
and since the test suite knows about these paths for dymanic libraries,
we put links in place for those.

A data file needed by one of the tests is also copied in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ltiple-attempts-to-connect-to-relayd.patch | 43 -------------------
 ...g-tools_2.9.5.bb => lttng-tools_2.10.5.bb} | 30 +++++++++++--
 2 files changed, 26 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.9.5.bb => lttng-tools_2.10.5.bb} (81%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
deleted file mode 100644
index 62a0978592d..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 70eff899104b86bae02862927c76caaef5de5d3c Mon Sep 17 00:00:00 2001
-From: Mikael Beckius <mikael.beckius@windriver.com>
-Date: Thu, 7 May 2015 16:14:25 +0200
-Subject: [PATCH] Allow multiple attempts to connect to relayd.
-
-It is unclear why a session needs to be made
-unusable after a failure to connect to relayd
-since a check for a relayd connection is
-always made before a session can be configured.
-
-The behaviour was introduced in:
-d9078d0c000d04d49c599a72c1a725026b636ec0
-
-Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
-[ The context has moved, adjust the hunk accordingly ]
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Upstream-Status: Pending
----
- src/bin/lttng-sessiond/cmd.c |    8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/src/bin/lttng-sessiond/cmd.c b/src/bin/lttng-sessiond/cmd.c
-index 73b4ce3..36f62ee 100644
---- a/src/bin/lttng-sessiond/cmd.c
-+++ b/src/bin/lttng-sessiond/cmd.c
-@@ -689,14 +689,6 @@ close_sock:
- 	free(rsock);
- 
- error:
--	if (ret != LTTNG_OK) {
--		/*
--		 * The consumer output for this session should not be used anymore
--		 * since the relayd connection failed thus making any tracing or/and
--		 * streaming not usable.
--		 */
--		consumer->enabled = 0;
--	}
- 	return ret;
- }
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
similarity index 81%
rename from meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
index 0314b536376..11d7db68482 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
@@ -22,7 +22,7 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
 PACKAGECONFIG ??= "lttng-ust"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
-PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
+PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 PACKAGECONFIG_remove_riscv64 = "lttng-ust"
@@ -30,12 +30,11 @@ PACKAGECONFIG_remove_riscv64 = "lttng-ust"
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
            file://run-ptest \
-           file://0001-Allow-multiple-attempts-to-connect-to-relayd.patch \
            file://lttng-sessiond.service \
            "
 
-SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
-SRC_URI[sha256sum] = "77839eb6fc6c652125f08acfd9369701c2516eb05cc2084160e7efc7a3fb731c"
+SRC_URI[md5sum] = "50e07676d5eb5d6cf4ece804863a6f74"
+SRC_URI[sha256sum] = "a4868078ef961e83dc236c4f24fd848161bfa755344b064dece62c4c81a07411"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -91,6 +90,20 @@ do_install_ptest () {
             install -t "${D}${PTEST_PATH}/tests/$d" "${B}/tests/$d/Makefile"
     done
 
+    for d in $(find "${B}/tests" -type d -name .libs -printf '%P ') ; do
+        for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
+            cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
+            case $f in
+                *.so)
+                    install -d ${D}${PTEST_PATH}/tests/$d/
+                    ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
+                    ;;
+            esac
+        done
+    done
+
+    install ${B}/tests/unit/ini_config/sample.ini ${D}${PTEST_PATH}/tests/unit/ini_config/
+
     # We shouldn't need to build anything in tests/regression/tools
     sed -i -e 's!^SUBDIRS = tools !SUBDIRS = !' \
         "${D}${PTEST_PATH}/tests/regression/Makefile"
@@ -118,6 +131,15 @@ do_install_ptest () {
     find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
         touch -r "${B}/Makefile" {} +
 
+    #
+    # Need to stop generated binaries from rebuilding by removing their source dependencies
+    #
+    sed -e 's#\(^test.*OBJECTS.=\)#disable\1#g' \
+        -e 's#\(^test.*DEPENDENCIES.=\)#disable\1#g' \
+        -e 's#\(^test.*SOURCES.=\)#disable\1#g' \
+        -e 's#\(^test.*LDADD.=\)#disable\1#g' \
+        -i ${D}${PTEST_PATH}/tests/unit/Makefile
+
     # Substitute links to installed binaries.
     for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd ; do
         exedir="${D}${PTEST_PATH}/src/bin/${prog}"
-- 
2.17.1


