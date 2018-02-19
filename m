Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 18A5E77811
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 22:30:24 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id d10so10988112itj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 14:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DymuccWj8ZJwvin0q/tQ2eGWxhUtfwzmc4F1+stMFQk=;
	b=uPP8damcY3Go78UcHXhBYxeWHGPUWwoOFaIhk6Z1trA2uo/zpkrjC4P+hN+ZF2lnmI
	J6tBBNjPNT2AO7alM6QgDeo55RvIFPGHjgXLDwlotyIxKfpcFHuG/Nj3bqe76ebtS00q
	BLm3GkeKkSIFMCVnfGIrLGn8bTFhb4sUuNteg3iog6i3wKoCTSmdWg732eAvMBF9El6C
	mHut6+c2GTSRPVjHDTud32B0FCq5IdiwDBX5DKXDJv57kXGqXS7iF0phMWYhUO+D1unh
	TVlOYBNrkLEDtpKitSIuOvLQu7FincYI7czEceokx9PojPyT3VoG8wH9UTcXF6prU0l5
	Q1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DymuccWj8ZJwvin0q/tQ2eGWxhUtfwzmc4F1+stMFQk=;
	b=Y41ucUJMXrvB8v8vrZbnFp7YdSuYb2MRYIvwsJZgjC16Z0E5nhwOfp5rVnuDFvpT7v
	ufjJyv2qsxVmRRz3AvgzyzeWHq1/oXIWliUz4C9GnKjEfNxsFdMWt31wRhzB4jE+2L8/
	se6NQe0zz+Jreg7WcGpRD39kX34cbMfquaUfluVX5Jbjqhj1bXfOOmXfLrtJLymFZjEz
	2YW/e9MjxNoFo8HAFohK1FbtnmGPeZhvTuP3Nb7ihcvs9+NPlTa1kiWhb59qd4tcAtVT
	WUQLW8wuL67cgUJCWG6uA7gRYnZtx7Mw2DndpyL0QF6XOyzJEi/sQX/8iHsjdY1lAPVT
	0Iiw==
X-Gm-Message-State: APf1xPB2nrIjrwn2vfnd63Xp06hUa7tE/yPYYGu2rRBNDSdvtbufRHsW
	zUhH5OK2Li6NljZ4ys8UV3XsWyuV
X-Google-Smtp-Source: AH8x226m/MeVLG0NFF5ECNzpTYjcrfkFL+E0QlGe+VfHoj+0elaAMRipKzAj72EgtqoV+AgdvICGgg==
X-Received: by 10.36.203.70 with SMTP id u67mr20880694itg.48.1519079425406;
	Mon, 19 Feb 2018 14:30:25 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	87sm4464230ioq.36.2018.02.19.14.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Feb 2018 14:30:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 16:30:20 -0600
Message-Id: <20180219223022.17833-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 1/3] icecc.bbclass: Fix combining with ccache
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
X-List-Received-Date: Mon, 19 Feb 2018 22:30:25 -0000

Fixes the case where ccache is enabled along with Icecream. In these
cases, there is the danger that Icecream will accidentally add the
ccache executable to the toolchain, which prevents it from working. In
particular, Fedora enables ccache by default via symbolic links in PATH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e8f7eab1bc1..2bf6cdb003d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -224,13 +224,31 @@ def icecc_get_external_tool(bb, d, tool):
     target_prefix = d.expand('${TARGET_PREFIX}')
     return os.path.join(external_toolchain_bindir, '%s%s' % (target_prefix, tool))
 
+def icecc_get_tool_link(tool, d):
+    import subprocess
+    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
+
+def icecc_get_path_tool(tool, d):
+    # This is a little ugly, but we want to make sure we add an actual
+    # compiler to the toolchain, not ccache. Some distros (e.g. Fedora)
+    # have ccache enabled by default using symlinks PATH, meaning ccache
+    # would be found first when looking for the compiler.
+    paths = os.getenv("PATH").split(':')
+    while True:
+        p, hist = bb.utils.which(':'.join(paths), tool, history=True)
+        if not p or os.path.basename(icecc_get_tool_link(p, d)) != 'ccache':
+            return p
+        paths = paths[len(hist):]
+
+    return ""
+
 # Don't pollute native signatures with target TUNE_PKGARCH through STAGING_BINDIR_TOOLCHAIN
 icecc_get_tool[vardepsexclude] += "STAGING_BINDIR_TOOLCHAIN"
 def icecc_get_tool(bb, d, tool):
     if icecc_is_native(bb, d):
-        return bb.utils.which(os.getenv("PATH"), tool)
+        return icecc_get_path_tool(tool, d)
     elif icecc_is_kernel(bb, d):
-        return bb.utils.which(os.getenv("PATH"), get_cross_kernel_cc(bb, d))
+        return icecc_get_path_tool(get_cross_kernel_cc(bb, d), d)
     else:
         ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
         target_sys = d.expand('${TARGET_SYS}')
@@ -249,8 +267,7 @@ def icecc_get_and_check_tool(bb, d, tool):
     # compiler environment package.
     t = icecc_get_tool(bb, d, tool)
     if t:
-        import subprocess
-        link_path = subprocess.check_output("readlink -f %s" % t, shell=True).decode("utf-8")[:-1]
+        link_path = icecc_get_tool_link(tool, d)
         if link_path == get_icecc(d):
             bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
             return ""
@@ -342,9 +359,13 @@ set_icecc_env() {
         fi
     fi
 
+    # Don't let ccache find the icecream compiler links that have been created, otherwise
+    # it can end up invoking icecream recursively.
+    export CCACHE_PATH="$PATH"
+    export CCACHE_DISBALE="1"
+
     export ICECC_VERSION ICECC_CC ICECC_CXX
     export PATH="$ICE_PATH:$PATH"
-    export CCACHE_PATH="$PATH"
 
     bbnote "Using icecc"
 }
-- 
2.14.3


