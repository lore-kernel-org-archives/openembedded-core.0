Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id BE70678287
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 19:40:56 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id k80so7194484ioe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 11:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CmYiGvOp/IVMxwavsMOX+4DnCjld6hzhHJQ9LrqiBTI=;
	b=H921z8LGwMZOZQX3e8e2mr4gBwvIJcge9akRPLOtW/U4kOviuFqxxUrkF972ohEqjC
	ruWVv5mxmdroRGSFAX+0Ah9rbhxcRe6OCvmXA3G3Vv6ftj5ZxkVJkdALFLHfA1S+hBS5
	UOaygvtQJakhxoPPZhWOP97foONCeCYMo8yV7lWM8WzOt/PsEp3df9M9XGP+m6p40JoO
	BNcAqMKcGUC6nIZ/I1zutvO6ZIEWEvYlMUhfASdsLXEZMT9LxHLnF5s9EKqFksFWIDEJ
	AmKBCIFmy4iUbiHjhwBJSJRuHpdKs74rtE9vW+UxwF/WDy9PFwKHQnc/8wTD365rrs1U
	9gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CmYiGvOp/IVMxwavsMOX+4DnCjld6hzhHJQ9LrqiBTI=;
	b=IcqZkm9L2UITczbwOQr2n0M9t+EU3i05rIljARBQQuLYL/C/j+4OS6cGu6Je5uo010
	ImVkRsVIHDGyzjBZv72ivNzoE02tzLJ54p87usCHD2Gcv252rkzpCZfoylJea/QUXyFe
	HGGi411POUkvYt/Frz2U3wtCMKsdL018f17zyZDPlnN2UVkwPnq5Avtr+Ee9WRTurrb4
	AH+Vd9yTM3Nhq6fPd/Seigkuh3ULwgvdoi5lbFduETXUfnQ3GcFwrPyGUTnxxi0VXys7
	1++NrdbAeQyepdpQDY/zMoelhv46NV6w97HG9aX0Vm28DDVroBAni98dfLelWVfixoD2
	/gIg==
X-Gm-Message-State: APf1xPAq1EHs5/SgA7enL+8nMrLAUsrId0joJkU2aYGIdA1jRTphb2G3
	v07bWv8XodebL1H0tgalBQDz1Nfj
X-Google-Smtp-Source: AH8x224/89BRYOip2/j3d2BO3PZtOGnSzWjkuIJNuE2LdXAneLdj2raD3e9uFPTDHKSpvNI1A0A1Og==
X-Received: by 10.107.129.12 with SMTP id c12mr14959185iod.303.1518464457546; 
	Mon, 12 Feb 2018 11:40:57 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	z75sm8335918ita.3.2018.02.12.11.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 11:40:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 13:39:58 -0600
Message-Id: <20180212193958.19804-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] utils.py: add parallel make helpers
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
X-List-Received-Date: Mon, 12 Feb 2018 19:40:57 -0000

The code to extract the integer number of parallel build threads and
construct a new argument from them has started to be copied in multiple
locations, so create two new helper utilities to aid recipes.

The first helper (parallel_make()) extracts the integer number of
parallel build threads from PARALLEL_MAKE. The second
(parallel_make_argument()) does the same and then puts the result back
into a format string, optionally clamping it to some maximum value.

Additionally, rework the oe-core recipes that were manually doing this
to use the new helper utilities.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/go.bbclass              | 19 +---------------
 meta/classes/waf.bbclass             | 24 +-------------------
 meta/lib/oe/utils.py                 | 43 ++++++++++++++++++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb   |  2 +-
 meta/recipes-support/boost/boost.inc | 24 +-------------------
 5 files changed, 47 insertions(+), 65 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 09b01a84c37..7ecd8c92541 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,23 +1,6 @@
 inherit goarch ptest
 
-def get_go_parallel_make(d):
-    pm = (d.getVar('PARALLEL_MAKE') or '').split()
-    # look for '-j' and throw other options (e.g. '-l') away
-    # because they might have a different meaning in golang
-    while pm:
-        opt = pm.pop(0)
-        if opt == '-j':
-            v = pm.pop(0)
-        elif opt.startswith('-j'):
-            v = opt[2:].strip()
-        else:
-            continue
-
-        return '-p %d' % int(v)
-
-    return ""
-
-GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
+GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index bdbdc56767c..f9a851d0759 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -3,28 +3,6 @@ DISABLE_STATIC = ""
 
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
-def get_waf_parallel_make(d):
-    pm = d.getVar('PARALLEL_MAKE')
-    if pm:
-        # look for '-j' and throw other options (e.g. '-l') away
-        # because they might have different meaning in bjam
-        pm = pm.split()
-        while pm:
-            v = None
-            opt = pm.pop(0)
-            if opt == '-j':
-                v = pm.pop(0)
-            elif opt.startswith('-j'):
-                v = opt[2:].strip()
-            else:
-                v = None
-
-            if v:
-                v = min(64, int(v))
-                return '-j' + str(v)
-
-    return ""
-
 python waf_preconfigure() {
     import subprocess
     from distutils.version import StrictVersion
@@ -47,7 +25,7 @@ waf_do_configure() {
 
 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	${S}/waf build ${@get_waf_parallel_make(d)}
+	${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
 }
 
 waf_do_install() {
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 7a79d752b69..ec91927233a 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -156,6 +156,49 @@ def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
+def parallel_make(d):
+    """
+    Return the integer value for the number of parallel threads to use when
+    building, scraped out of PARALLEL_MAKE. If no parallelization option is
+    found, returns None
+
+    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
+    """
+    pm = (d.getVar('PARALLEL_MAKE') or '').split()
+    # look for '-j' and throw other options (e.g. '-l') away
+    while pm:
+        opt = pm.pop(0)
+        if opt == '-j':
+            v = pm.pop(0)
+        elif opt.startswith('-j'):
+            v = opt[2:].strip()
+        else:
+            continue
+
+        return int(v)
+
+    return None
+
+def parallel_make_argument(d, fmt, limit=None):
+    """
+    Helper utility to construct a parallel make argument from the number of
+    parallel threads specified in PARALLEL_MAKE.
+
+    Returns the input format string `fmt` where a single '%d' will be expanded
+    with the number of parallel threads to use. If `limit` is specified, the
+    number of parallel threads will be no larger than it. If no parallelization
+    option is found in PARALLEL_MAKE, returns an empty string
+
+    e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n %d") will return
+    "-n 10"
+    """
+    v = parallel_make(d)
+    if v:
+        if limit:
+            v = max(limit, v)
+        return fmt % v
+    return ''
+
 def packages_filter_out_system(d):
     """
     Return a list of packages from PACKAGES with the "system" packages such as
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index fa0d66291d1..8750b3c528d 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -151,7 +151,7 @@ do_compile_class-native() {
 
 do_compile_class-target() {
     export LFLAGS="${LDFLAGS}"
-    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n ')}"
+    PARALLEL_JOBS="${@oe.utils.parallel_make_argument(d, '-n %d')}"
     OVMF_ARCH="X64"
     if [ "${TARGET_ARCH}" != "x86_64" ] ; then
         OVMF_ARCH="IA32"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 41fc90fb211..0461ec6fcf1 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -135,29 +135,7 @@ BJAM_TOOLS   = "--ignore-site-config \
 
 # use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater parallelism causes bjam to segfault or to ignore -j
 # https://svn.boost.org/trac/boost/ticket/7634
-def get_boost_parallel_make(d):
-    pm = d.getVar('PARALLEL_MAKE')
-    if pm:
-        # look for '-j' and throw other options (e.g. '-l') away
-        # because they might have different meaning in bjam
-        pm = pm.split()
-        while pm:
-            v = None
-            opt = pm.pop(0)
-            if opt == '-j':
-                v = pm.pop(0)
-            elif opt.startswith('-j'):
-                v = opt[2:].strip()
-            else:
-                v = None
-
-            if v:
-                v = min(64, int(v))
-                return '-j' + str(v)
-
-    return ""
-
-BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
+BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
-- 
2.14.3


