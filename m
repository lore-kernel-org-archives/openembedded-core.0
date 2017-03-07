Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4D6071ACF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 16:00:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v27G0UGA014418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Mar 2017 08:00:30 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 08:00:29 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Mar 2017 10:00:24 -0600
Message-ID: <1488902424-9496-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1488902424-9496-1-git-send-email-mark.hatle@windriver.com>
References: <1488902424-9496-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] gpgme: Fix issue building for the target
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
X-List-Received-Date: Tue, 07 Mar 2017 16:00:36 -0000
Content-Type: text/plain

gpgme failed when configuring since you can only configure for one python
system at a time (via the inherits).  So we need to have a PACKAGECONFIG
that defines which one [or neither] you want to use.

The prior pkgconfig patch introduced the usage of the variable PKG_CONFIG,
which is not defined anywhere.  Define this.

When building the python module, we can not call gpg-error-config, so we
need to find an alternative way of finding the information the setup.py.in
requires.  (In this case, it's easy to just use the environment
STAGING_INCDIR.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../gpgme/gpgme/python-lang-config.patch           | 50 ++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.8.0.bb          | 28 +++++++++++-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/python-lang-config.patch

diff --git a/meta/recipes-support/gpgme/gpgme/python-lang-config.patch b/meta/recipes-support/gpgme/gpgme/python-lang-config.patch
new file mode 100644
index 0000000..a289c62
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/python-lang-config.patch
@@ -0,0 +1,50 @@
+gpgme/lang/python: gpg-error-config should not be used.
+
+gpg-error-config was modified by OE to always return an error.  So we want
+to find an alternative way to retrieve whatever it is we need.  It turns
+out that the system is just trying to find the path to the gpg-error.h, which
+we can pull in from the STAGING_INC environment.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: gpgme-1.8.0/lang/python/setup.py.in
+===================================================================
+--- gpgme-1.8.0.orig/lang/python/setup.py.in
++++ gpgme-1.8.0/lang/python/setup.py.in
+@@ -24,7 +24,6 @@ import glob
+ import subprocess
+ 
+ # Out-of-tree build of the gpg bindings.
+-gpg_error_config = ["gpg-error-config"]
+ gpgme_config_flags = ["--thread=pthread"]
+ gpgme_config = ["gpgme-config"] + gpgme_config_flags
+ gpgme_h = ""
+@@ -52,13 +51,6 @@ else:
+     devnull = open(os.devnull, "w")
+ 
+ try:
+-    subprocess.check_call(gpg_error_config + ['--version'],
+-                          stdout=devnull)
+-except:
+-    sys.exit("Could not find gpg-error-config.  " +
+-             "Please install the libgpg-error development package.")
+-
+-try:
+     subprocess.check_call(gpgme_config + ['--version'],
+                           stdout=devnull)
+ except:
+@@ -81,12 +73,9 @@ if not (major > 1 or (major == 1 and min
+ if not gpgme_h:
+     gpgme_h = os.path.join(getconfig("prefix")[0], "include", "gpgme.h")
+ 
+-gpg_error_prefix = getconfig("prefix", config=gpg_error_config)[0]
+-gpg_error_h = os.path.join(gpg_error_prefix, "include", "gpg-error.h")
++gpg_error_h = os.path.join(os.getenv('STAGING_INCDIR'), "gpg-error.h")
+ if not os.path.exists(gpg_error_h):
+-    gpg_error_h = \
+-        glob.glob(os.path.join(gpg_error_prefix, "include",
+-                               "*", "gpg-error.h"))[0]
++    sys.exit("gpg_error_h not found: %s" % gpg_error_h)
+ 
+ print("Building python gpg module using {} and {}.".format(gpgme_h, gpg_error_h))
+ 
diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
index 3e74b6f..7d249b3 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://pkgconfig.patch \
+           file://python-lang-config.patch \
           "
 
 SRC_URI[md5sum] = "722a4153904b9b5dc15485a22d29263b"
@@ -22,12 +23,37 @@ RDEPENDS_${PN}-cpp += "libstdc++"
 
 BINCONFIG = "${bindir}/gpgme-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig
+# Note select python2 or python3, but you can't select both at the same time
+PACKAGECONFIG ??= "python3"
+PACKAGECONFIG[python2] = ",,python,"
+PACKAGECONFIG[python3] = ",,python3,"
+
+# Default in configure.ac: "cl cpp python qt"
+# Supported: "cl cpp python python2 python3 qt"
+# python says 'search and find python2 or python3'
+
+LANGUAGES ?= "cpp"
+LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
+LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
+
+PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
+
+EXTRA_OECONF += '--enable-languages="${LANGUAGES}"'
+
+inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT}
+
+export PKG_CONFIG='pkg-config'
 
 BBCLASSEXTEND = "native"
 
 PACKAGES =+ "${PN}-cpp"
+PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python2-gpg ', '', d)}"
+PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-gpg ', '', d)}"
+
 FILES_${PN}-cpp = "${libdir}/libgpgmepp.so.*"
+FILES_python2-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_python3-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/* \
                     ${libdir}/cmake/* \
 "
-- 
1.8.3.1


