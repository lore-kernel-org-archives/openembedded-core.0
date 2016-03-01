Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7F26018C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 14:58:26 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l68so37148327wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 06:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1IoqPHMFxdl9mHrZLdq9IRGzVDyAjXRVr+qDjlLXq0Q=;
	b=v3HhXhxKtEfdYc/LESmep/t00vDKmaqitUPQRvQM352jbV6IgY9JiX+QckLw1HFOJ+
	+wIphFPeqLwQtm4TdCnuKFIV3vKnlzc3en4/pyki+9aOQPCZ8EnbVlZCIQFBCHGStBhD
	e9+xx6TQBIS6Bf3stOV2UBoIaZ3zq/6bTjY6yjCi52cA5m4eGMhi/tK2uVmmZss99UWC
	z+1bz2mzsVFq3ONza8jvMteqDlOg7febCXq7DRH8n/uXCpczmgzQxoSTVb4EP+m++4V+
	Ngjx6KcGTiua3mgn9NcKkOsAXhsWPlkbB+g1Nfy7WHcl6WO0TjNIysTmulczQTZ//o8P
	Nvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1IoqPHMFxdl9mHrZLdq9IRGzVDyAjXRVr+qDjlLXq0Q=;
	b=TlM3+ZResnyCReCjYyxRwObyXkvrV5zo2D/YbloFg9UKUCWDCcLr6IoCOAQkZY5YtX
	wsMNKZcD9DkLc9W7GoK//XLtT/s3UBcGi7+VCM3F6rmCPg7+j0zhnOKGIP64XoJLUlrB
	a9qfvMvtcp21Rk2IWAGGj5UbXVaWH9wrrZSZUS0qqFa+tM5STBiDrMWpBr+egOQy3HKD
	ImhaZgv0mO+nbfk47JA55W/pRUtl7RZwAQdWMb9EpmI1e6C+fBpA0el5y7BcAQp06rW+
	HP4NgxYa5gyIJCpKyBuk3JdYMrvXXaojnY8kHEpGL3sP7F76hXm5pP2mXxO53Y2HdZ9x
	y4Fg==
X-Gm-Message-State: AD7BkJLoDA0XzydByKFWqM7W3HcXsp7ON5gl7bgSVmTLKCa0xtuqbJ0Blep4/tdm2dvH0+o4
X-Received: by 10.28.49.3 with SMTP id x3mr4170813wmx.4.1456844306815;
	Tue, 01 Mar 2016 06:58:26 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k4sm21707731wmc.12.2016.03.01.06.58.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 06:58:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 14:58:24 +0000
Message-Id: <1456844304-11647-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] rpm: disable stack protector in popt
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
X-List-Received-Date: Tue, 01 Mar 2016 14:58:29 -0000

The stack protector flags in the internal popt can cause link problems with rpm,
so disable them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../rpm/rpm/popt-no-stack-protector.patch          | 27 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/popt-no-stack-protector.patch

diff --git a/meta/recipes-devtools/rpm/rpm/popt-no-stack-protector.patch b/meta/recipes-devtools/rpm/rpm/popt-no-stack-protector.patch
new file mode 100644
index 0000000..10fc6b1
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/popt-no-stack-protector.patch
@@ -0,0 +1,27 @@
+Disable the stack protector in popt as it causes problems with rpm is built
+without the stack protector.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/popt/configure.ac b/popt/configure.ac
+index ba70368..cf9a44d 100755
+--- a/popt/configure.ac
++++ b/popt/configure.ac
+@@ -123,7 +123,6 @@ AS_IF([test "x$popt_gcc_warnings" = xyes],
+   popt_CFLAGS_ADD([-Wjump-misses-init],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-Wno-format-nonliteral],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-Wframe-larger-than=$MAX_STACK_SIZE],[POPT_CFLAGS])
+-  popt_CFLAGS_ADD([-fstack-protector-all],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-fasynchronous-unwind-tables],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-fdiagnostics-show-option],[POPT_CFLAGS])
+   popt_CFLAGS_ADD([-funit-at-a-time],[POPT_CFLAGS])
+@@ -203,7 +202,7 @@ AC_SUBST([POPT_LDFLAGS])
+ # -fno-delete-null-pointer as the kernel does http://patchwork.kernel.org/patch/36060/
+ # GNU GCC (usually "gcc")
+ AS_IF([test "x$GCC" != x],
+- [ for c in -fno-delete-null-pointer-checks -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector -fexceptions
++ [ for c in -fno-delete-null-pointer-checks -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
+    do
+   	popt_CFLAGS_ADD([$c], [POPT_CFLAGS])
+    done
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 4ca0997..7065c0f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -129,6 +129,7 @@ SRC_URI += " \
 	   file://rpm-syck-fix-gram.patch \
 	   file://rpm-rpmdb-grammar.patch \
 	   file://rpm-disable-blaketest.patch \
+           file://popt-no-stack-protector.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.7.0


