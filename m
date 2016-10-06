Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id C03F7719E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 06:22:45 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id l13so1223512itl.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 23:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KD+bbANGxrZ0M0jCBfl3jHcwXnyS7RB4hRVgtPRR7cs=;
	b=jzul0keair7nVeXHMbt7yOeTJMU+F0LCJAQUD5bF/Ox5H9ImmKDhE3jHekQFlYIlVg
	XynjIXbiIRhoe3hxZlkfYxqWWrj2r+ZkUJ0TwoPyhf4Bpafgcv48tyAlZq3MDVF9PnDW
	7T1urdFjo1PBs/8LC5IaiqmWvtEe722ZgqBE0QH3OlJQBkfqOYLAuMK8dhar7Ozuc7Hy
	YlTGNgnmYGLA/MrPB9LYZMZGRnCR7X6TywkBskYFlDnE1Knk7gmeple76aDcVlju6Ch8
	70aVzyCCoJsPctiJC7U4Q1OB/12MXGCKcU1c+MYub7cPExdH9b5iKNSY90FqM7uY5z0i
	t+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KD+bbANGxrZ0M0jCBfl3jHcwXnyS7RB4hRVgtPRR7cs=;
	b=MmERT/VGs7xpo2OPNmzG9JsdHUxrPrw5P0ivXVw3XMErVNYbJ37klqlfa3XNzC5Kvc
	WYASnQny+P+ZA1DLuRhbjOsuybTyegBpLupAHNuhKX2FkCKxsi/wPoFDSudWHl7SzgeQ
	RsSdvDvgfqraVqQZOUZMdZwnLCjSe01YiT6T+WK4rxf2FShMJjIyvuRQtV5sMUIZbZqL
	oJknvmIStJ7GLq30RE032di56p+d83InDKuQY//JfrXyK/u05D2D4EpDR4PoI71jgXgQ
	C7eBwjyHQP6QgY/CTq3czY31EdXukl5nhKBmbxaCXRk2ASmKmYpXk/De57/XVoc+PG28
	3XCQ==
X-Gm-Message-State: AA6/9RkZr07gc5x/O1nXmeg92J3tQ7KFeZOTWML9h3aIo5lXv+J3irAc4NE3keg9nZckjg==
X-Received: by 10.36.46.203 with SMTP id i194mr32576740ita.69.1475734966853;
	Wed, 05 Oct 2016 23:22:46 -0700 (PDT)
Received: from rama.arnolds.bogus (gatekeeper.gentoogeek.org. [66.159.242.209])
	by smtp.gmail.com with ESMTPSA id
	w185sm5119199iod.13.2016.10.05.23.22.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Oct 2016 23:22:46 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 23:22:39 -0700
Message-Id: <20161006062239.30097-1-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [krogoth][meta-python]][PATCH v2] python-evdev: add setup.py patch
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
X-List-Received-Date: Thu, 06 Oct 2016 06:22:45 -0000

From: Steve Arnold <stephen.arnold42@gmail.com>

This currently works (randomly) when BUILD_HOST headers are a close
enough match, but fails as soon as they differ, due to static header
include paths in setup.py.  This patch adds a path check for the
STAGING_INC dir and makes it use the right headers.

Upstream-Status: Inappropriate, bitbake configuration-specific (upstream
needs a generic cross-compile fix).

Also includes DEPENDS/RDEPENDS from Tim and small doc package instead of
empty dev package.

Signed-off-by: Steve Arnold <stephen.arnold42@gmail.com>
---
 .../python/python-evdev/use-sysroot-headers.patch  | 24 +++++++++++++++++++
 .../recipes-devtools/python/python-evdev_0.6.0.bb  | 28 ++++++++++++++++++----
 2 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-evdev/use-sysroot-headers.patch

diff --git a/meta-python/recipes-devtools/python/python-evdev/use-sysroot-headers.patch b/meta-python/recipes-devtools/python/python-evdev/use-sysroot-headers.patch
new file mode 100644
index 0000000..ce62bfc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-evdev/use-sysroot-headers.patch
@@ -0,0 +1,24 @@
+--- a/setup.py	2016-10-01 10:00:11.491758891 -0700
++++ b/setup.py	2016-10-01 10:01:45.045089476 -0700
+@@ -65,10 +65,17 @@
+ 
+ #-----------------------------------------------------------------------------
+ def create_ecodes():
+-    headers = [
+-        '/usr/include/linux/input.h',
+-        '/usr/include/linux/input-event-codes.h',
+-    ]
++
++    if not os.path.lexists(os.path.expandvars('$STAGING_INCDIR')):
++        headers = [
++            '/usr/include/linux/input.h',
++            '/usr/include/linux/input-event-codes.h',
++        ]
++    else:
++        headers = [
++            os.path.expandvars('$STAGING_INCDIR/linux/input.h'),
++            os.path.expandvars('$STAGING_INCDIR/linux/input-event-codes.h'),   
++        ]
+ 
+     headers = [header for header in headers if os.path.isfile(header)]
+     if not headers:
diff --git a/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb b/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
index e555552..152206a 100644
--- a/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
@@ -4,9 +4,29 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-SRC_URI = "https://github.com/gvalkov/python-evdev/archive/v${PV}.zip"
+SRC_URI = "file://use-sysroot-headers.patch"
 
-SRC_URI[md5sum] = "24e4ffa98e338b535eae44d91d609005"
-SRC_URI[sha256sum] = "61f6893d80da87a995e5781c74d22a39448b1b32004ffac2f31817017709be04"
+SRC_URI[md5sum] = "294ac2997bd419d56b9451511536f9f4"
+SRC_URI[sha256sum] = "c0e1410cc88eaa6a016baeafb2acb1274d36a057944143b59e94f36bb4aaaa82"
 
-inherit setuptools
+inherit pypi setuptools
+
+DEPENDS_${PN} += "\
+    ${PYTHON_PN}-ctypes \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+"
+
+do_install_append() {
+    # note the full docs require Sphinx to build them
+    install -d ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${S}/README.rst ${D}${datadir}/doc/${PN}/
+}
+
+PACKAGES = "${PN}-doc ${PN} ${PN}-dbg"
-- 
2.9.3


