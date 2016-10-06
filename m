Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 35426719C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 06:05:25 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id o19so1182230ito.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wiEaXDegm6sBOUJn3TAjVMwbFc2tHDS+Vkw2iVwetHQ=;
	b=GBpQHpCRSimCcX7oNqZTCmGhatYJ6LpgzC6DbPMgik0D3ug32/kaZh9LH7fWgNsEZ+
	C5427rJOQFpBhjVt4viU3QB0aJUsBaMtruJ4i6mY2kLnvfWS6K2uON/RuRS1JpO5hzwu
	vnKcJ2//jo+/lMau8BxtMfs4+ZTB41e2WAOLpzFP2sCGnFSO+j4gNcYK8E7e34N3rbNw
	LJXBcbFCWAs1cvaX6VtxDlUcmS2xFMxpk52Vh7tzuHpcpq5qmcZoFEmsT8ziKAYehVu6
	YvbjXXrKxUhgV6Jx6zIV1LXwBg0I++hoORLNxnbSU9G+M+XSzvIcjKfoCnthlpbHrfYz
	D11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wiEaXDegm6sBOUJn3TAjVMwbFc2tHDS+Vkw2iVwetHQ=;
	b=i5aMFfDwLst4qUrf7020ERFSU0OT1x6F5xZYfZZLtEexevWb1K4QRcrjnYVR21+Yl1
	ku+WrrrqLRsdKesEP3tB0/X2gMXtL/Kn51Flq5417MhooRcD7VA1eWE8qOG9ngGrOCr2
	jIez7Hu1V0ut+/V2v9jYvaNAioHPIkji56ptAD3Sez4+dqiFevqH0g1fMKUk/QPAipCm
	T+tclw500jc3kC/0pLTiz8p6hQnHs/t/ypS+LxD0IxpbxC85YfWfpDR4CpDNuFv8CZ4l
	Hv1eI3GQutw0yuqqPkQSDLxjDZKQZrkhRtinfcLJYrpuuiYw76HhwaC9QOw1mEAyfjrj
	DV8A==
X-Gm-Message-State: AA6/9RlwVMITU98nUkhCexvRf4Dole9GKDOsRcp7Ac3Dc85DyRrZ5MxT+z33CL8PvHgGdw==
X-Received: by 10.36.238.134 with SMTP id b128mr13742733iti.72.1475733926537; 
	Wed, 05 Oct 2016 23:05:26 -0700 (PDT)
Received: from rama.arnolds.bogus (gatekeeper.gentoogeek.org. [66.159.242.209])
	by smtp.gmail.com with ESMTPSA id
	w185sm5098628iod.13.2016.10.05.23.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Oct 2016 23:05:26 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 23:05:14 -0700
Message-Id: <20161006060514.29293-1-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [krogoth][meta-python]][PATCH] python-evdev: add setup.py patch to make sure it uses sysroot headers
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
X-List-Received-Date: Thu, 06 Oct 2016 06:05:27 -0000

From: Steve Arnold <stephen.arnold42@gmail.com>

This currently works (randomly) when BUILD_HOST headers are a close
enough match, but fails as soon as they differ, due to static header
include paths in setup.py.  This patch adds a path check for the
STAGING_INC dir and makes it use the right headers.

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


