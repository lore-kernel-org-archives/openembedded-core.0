Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id C530260F77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 17:49:14 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so6646896wes.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 10:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3SNX2UcSmCWA/8OCmGkTF4nfDwXSbhQ59fM2UbJ1BOs=;
	b=EyWoJuL/9CF6nNcv/uPg1q6WbGLVJRbmbxJlE0+JAaiKe0akBBpTkiGJW/2vEuqhwE
	DjltHW7Gg04mhgP5cx7Cvx0ut0ngEiQcmsyRwAYDZ4XNKsZyzHWbWH4ZZtAw6e7A7uws
	JV1go4llC995988XSbiCo4UoW9V20JwcuWdEhXpi0ZsJhCTRZkWs9ABo4wFtXHp1mygI
	XNzNwtmCeXkNPNWttshEyIWqz3MN9ftpjNU7W/pW+zKDFBc8Tr2wFF0a7gXt/gMOjVUF
	kMCv2f3HIPlgT2H5t76WlXHM3iYkN4XrktpHlEY5d9+NogS6ON02BQjFS6EC1RPkVq7/
	WVow==
X-Gm-Message-State: ALoCoQksOuB7nd3Ug5nOfBBNjRCe7YzuVVjWtYiyJhciR6DlqSTjCN9NQ5GaXd8oVnt/H1KEmY9D
X-Received: by 10.180.182.228 with SMTP id eh4mr19769215wic.45.1381168155763; 
	Mon, 07 Oct 2013 10:49:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jf2sm41481831wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 10:49:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 18:49:06 +0100
Message-Id: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/5] gnome-desktop-testing: add
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
X-List-Received-Date: Mon, 07 Oct 2013 17:49:15 -0000

gnome-desktop-testing is a test runner for GNOME-style Installed Tests, and will
be used by run-ptest to execute these unit test suites.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/no-introspection.patch                    |   19 +++++++++++++++++++
 .../gnome-desktop-testing_2013.1.bb                 |   18 ++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
 create mode 100644 meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb

diff --git a/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch b/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
new file mode 100644
index 0000000..67b64f2
--- /dev/null
+++ b/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
@@ -0,0 +1,19 @@
+Introspection is a hard requirement to build gnome-desktop-testing upstream, but
+it isn't needed anymore.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 7460c69..6249caf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,8 +27,6 @@ AC_SUBST(WARN_CFLAGS)
+ LT_PREREQ([2.2.4])
+ LT_INIT([disable-static])
+ 
+-GOBJECT_INTROSPECTION_REQUIRE([1.34.0])
+-
+ PKG_CHECK_MODULES(GIO_UNIX, [gio-unix-2.0 >= 2.34.0])
+ GIO_UNIX_CFLAGS="$GIO_UNIX_CFLAGS -DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_36 -DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_36"
+ 
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
new file mode 100644
index 0000000..36e13b1
--- /dev/null
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test runner for GNOME-style installed tests"
+HOMEPAGE = "https://wiki.gnome.org/GnomeGoals/InstalledTests"
+LICENSE = "LGPLv2+"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
+           file://no-introspection.patch"
+SRC_URI[md5sum] = "c6824f7bfac95bf0fcf6ed0c255979c1"
+SRC_URI[sha256sum] = "632e7224de8614a8e4b7cdf87fc32551531efa9290fba0da4dae56234c584b7b"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://src/gnome-desktop-testing-runner.c;endline=19;md5=ab86a2e00ab9cbb94f008d785004b181"
+
+DEPENDS = "glib-2.0"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[journald] = "--with-systemd-journal,--without-systemd-journal,systemd,systemd"
-- 
1.7.10.4


