Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6443C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 16:34:27 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.26041.1637944466430089744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zfaqv9LN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id v11so19779123wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PRk6meAQos+JBum84LhNXpkjXcCLjfzq0RazraBKOWs=;
        b=Zfaqv9LNBiGEB2UTcwyZiCIJGlaMFZ5l/ImXXLLSaD2TBrHN8m95TkbycakBspRrsT
         5J2z0Z6/oGLLdwgdEB68MVIej/LE2Ld6c9ucJ5QvpYwXGsPrfcUW+hNVUMsQm4DWGG/I
         7ooymXeH8NqevtN0gfRo+J+zggz5MypT/FXcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PRk6meAQos+JBum84LhNXpkjXcCLjfzq0RazraBKOWs=;
        b=zUU0/qIjV3R1AFZ/QerbSKOpRBZDJLysmiO0UKs7ljCRos0zmOAGtj+ypmFnhJrlZF
         evHGptsAXrmDIZYyTFv1UK3DBRKtdX6qTRUN4MjsxX/nOoKXxkWIAhnAqq33iDyWCPvN
         Eo5wgCZUIcW+gg3YXDP3tsLyqYClWVlvzt/mJMUh3UnT0NaCsBjNFwN1NKXj68B+QhcM
         sqctNs4R6XeTM/1/dk/2yoXgyPsGGYI1fN0s6E09hoIymWD1x/IBiL+2M1uGoVLagvtQ
         JnB/B+h5p2b7CI5NkyeEty3Jj+YFS0YFoqB+jRqK4xB4j/vkztkENS5A9cYhEzD3kVOi
         aA+Q==
X-Gm-Message-State: AOAM531/rEkUHQ4/m1idGcGSvZZJOB4rbEFDHww4IFjQjbBrD6KRDjK+
	LLyT9bRNyaRNtxf0eFXz/fh8V3dmCquK3Q==
X-Google-Smtp-Source: 
 ABdhPJxar77vHv1DVUpAxt7iyqMaqS848n7NEsylTjH9GpS2biSRVKR2aQYVOKtHRxIpHzZZgMj6aw==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
 i3mr14855585wrx.426.1637944464312;
        Fri, 26 Nov 2021 08:34:24 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f21b:9c01:debb:ef34])
        by smtp.gmail.com with ESMTPSA id
 g13sm8708682wrd.57.2021.11.26.08.34.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:34:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity/lib: Replace usage if LooseVersion with
 bb.utils.vercmp_string_op
Date: Fri, 26 Nov 2021 16:34:23 +0000
Message-Id: <20211126163423.166644-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 16:34:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158838

distutils is going away and we have functionality in bitbake which can
handle these comparisions so switch to the bb.utils function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 18 ++++++------------
 meta/lib/oe/distro_check.py |  2 +-
 meta/lib/oe/terminal.py     |  7 +++----
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9fbc9c18e7c..0e20589b22d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -462,13 +462,12 @@ def check_sanity_validmachine(sanity_data):
 # Patch before 2.7 can't handle all the features in git-style diffs.  Some
 # patches may incorrectly apply, and others won't apply at all.
 def check_patch_version(sanity_data):
-    from distutils.version import LooseVersion
     import re, subprocess
 
     try:
         result = subprocess.check_output(["patch", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
         version = re.search(r"[0-9.]+", result.splitlines()[0]).group()
-        if LooseVersion(version) < LooseVersion("2.7"):
+        if bb.utils.vercmp_string_op(version, "2.7", "<"):
             return "Your version of patch is older than 2.7 and has bugs which will break builds. Please install a newer version of patch.\n"
         else:
             return None
@@ -478,7 +477,6 @@ def check_patch_version(sanity_data):
 # Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
 # Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
 def check_make_version(sanity_data):
-    from distutils.version import LooseVersion
     import subprocess
 
     try:
@@ -486,7 +484,7 @@ def check_make_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute make --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
-    if LooseVersion(version) == LooseVersion("3.82"):
+    if bb.utils.vercmp_string_op(version, "3.82", "=="):
         # Construct a test file
         f = open("makefile_test", "w")
         f.write("makefile_test.a: makefile_test_a.c makefile_test_b.c makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
@@ -539,12 +537,11 @@ def check_wsl(d):
 # built buildtools-extended-tarball)
 #
 def check_gcc_version(sanity_data):
-    from distutils.version import LooseVersion
     import subprocess
     
     build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
     if build_cc.strip() == "gcc":
-        if LooseVersion(version) < LooseVersion("7.5"):
+        if bb.utils.vercmp_string_op(version, "7.5", "<"):
             return "Your version of gcc is older than 7.5 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
     return None
 
@@ -552,14 +549,13 @@ def check_gcc_version(sanity_data):
 # but earlier versions do not; this needs to work properly for sstate
 # Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
 def check_tar_version(sanity_data):
-    from distutils.version import LooseVersion
     import subprocess
     try:
         result = subprocess.check_output(["tar", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
     except subprocess.CalledProcessError as e:
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
-    if LooseVersion(version) < LooseVersion("1.28"):
+    if bb.utils.vercmp_string_op(version, "1.28", "<"):
         return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
     return None
 
@@ -567,14 +563,13 @@ def check_tar_version(sanity_data):
 # The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162 
 # The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
 def check_git_version(sanity_data):
-    from distutils.version import LooseVersion
     import subprocess
     try:
         result = subprocess.check_output(["git", "--version"], stderr=subprocess.DEVNULL).decode('utf-8')
     except subprocess.CalledProcessError as e:
         return "Unable to execute git --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
-    if LooseVersion(version) < LooseVersion("1.8.3.1"):
+    if bb.utils.vercmp_string_op(version, "1.8.3.1", "<"):
         return "Your version of git is older than 1.8.3.1 and has bugs which will break builds. Please install a newer version of git.\n"
     return None
 
@@ -796,9 +791,8 @@ def check_sanity_everybuild(status, d):
         status.addresult('The system requires at least Python 3.6 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
-    from distutils.version import LooseVersion
     minversion = d.getVar('BB_MIN_VERSION')
-    if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
+    if bb.utils.vercmp_string_op(bb.__version__, minversion, "<"):
         status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
 
     sanity_check_locale(d)
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 88e46c354d2..4b2a9bec01b 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -26,7 +26,7 @@ def find_latest_numeric_release(url, d):
     maxstr=""
     for link in get_links_from_url(url, d):
         try:
-            # TODO use LooseVersion
+            # TODO use bb.utils.vercmp_string_op()
             release = float(link)
         except:
             release = 0
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 59aa80de669..53186c4a3ed 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -5,7 +5,6 @@ import logging
 import oe.classutils
 import shlex
 from bb.process import Popen, ExecutionError
-from distutils.version import LooseVersion
 
 logger = logging.getLogger('BitBake.OE.Terminal')
 
@@ -86,10 +85,10 @@ class Konsole(XTerminal):
     def __init__(self, sh_cmd, title=None, env=None, d=None):
         # Check version
         vernum = check_terminal_version("konsole")
-        if vernum and LooseVersion(vernum) < '2.0.0':
+        if vernum and bb.utils.vercmp_string_op(vernum, "2.0.0", "<"):
             # Konsole from KDE 3.x
             self.command = 'konsole -T "{title}" -e {command}'
-        elif vernum and LooseVersion(vernum) < '16.08.1':
+        elif vernum and bb.utils.vercmp_string_op(vernum, "16.08.1", "<"):
             # Konsole pre 16.08.01 Has nofork
             self.command = 'konsole --nofork --workdir . -p tabtitle="{title}" -e {command}'
         XTerminal.__init__(self, sh_cmd, title, env, d)
@@ -260,7 +259,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
 
 def check_tmux_version(desired):
     vernum = check_terminal_version("tmux")
-    if vernum and LooseVersion(vernum) < desired:
+    if vernum and bb.utils.vercmp_string_op(vernum, desired, "<"):
         return False
     return vernum
 
-- 
2.32.0


