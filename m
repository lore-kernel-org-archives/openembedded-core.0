Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57158C88E6A
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:06:45 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5903.1789329997495403710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=N18mmgyX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260913200634ef288fbe2a000207e8-5f_lvn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260913200634ef288fbe2a000207e8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7IhbK6eTQjXdrq7lWPI6bUK50005iPDbDGncAxYd8jY=;
 b=N18mmgyXKACAzd3H7pWw6wzX5hH2cFFBM3LxBF/nlBN9QBLCJaCcOLN04bad1MJbWDH42F
 7ty8UiJnv5uLNfB6coaNE5PJetQKgaPJ8p0hQfAi4jraixAcDmgECaOeulBZChBJyr4QeX1h
 J0yioXOj4GTksvntwPV2pma+qQST7II/pIlMaeM8akXzWwRIBd4WfjgauxEm3cOy0ztTu/c2
 bFSCOC8KwpR5xZ1dM0LZUtyhEjKf1p5/622n37HE6153eC07mrnlDTK8P6NIRk2P51qHBXU1
 ulnBzcByALdwfwpUhcozf+kLM0zOPN8sedzoRONkjO5PjDIN2pMtl5yg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/6] devtool: ide-sdk: trim _add_broken_srctree_prefix_map docstring
Date: Sun, 13 Sep 2026 22:05:55 +0200
Message-ID: <20260913200624.331753-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260913200624.331753-1-adrian.freihofer@siemens.com>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245725

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The docstring referenced test_devtool_ide_sdk_none_qemu and
test_devtool_ide_sdk_{code,none}_meson_clang, which no longer exist
since the previous commit merged the --ide=code/--ide=none tests. Point
at the current DevtoolIdeSdkGccTests/DevtoolIdeSdkClangTests classes
instead and shorten the docstring to the essentials.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 70 +++++++++-------------------------
 1 file changed, 19 insertions(+), 51 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 44e11ce517..8f2e768a62 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1169,61 +1169,29 @@ class RecipeModified:
         return mappings
 
     def _add_broken_srctree_prefix_map(self, mappings):
-        """Work around a -f*-prefix-map / DWARF path resolution issue affecting
-        out-of-tree devtool workspaces (e.g. meson recipes built via 'devtool modify'
-        with the clang toolchain).
+        """Work around broken DWARF paths for out-of-tree meson+clang workspaces.
 
-        meson/ninja may invoke the compiler with a *relative* source file path
-        when the build directory B (under WORKDIR) and the source directory S
-        (relocated outside WORKDIR by 'devtool modify') only share a distant
-        common ancestor. -fdebug-prefix-map/-ffile-prefix-map only rewrite
-        paths that literally start with the mapped host prefix, so a relative
-        path argument is never rewritten: only DW_AT_comp_dir (which is
-        absolute) gets rewritten, DW_AT_name stays relative and unrewritten.
-
-        This has only been observed to actually happen with the clang
-        toolchain: clang's meson/ninja invocation embeds a relative DW_AT_name
-        for out-of-tree sources, while gcc, even via meson/ninja, embeds an
-        absolute (and correctly -fdebug-prefix-map-rewritten) DW_AT_name, so
-        no underflow can happen there - confirmed empirically:
-        oe-selftest's test_devtool_ide_sdk_none_qemu (gcc toolchain, covering
-        both cmake-example and meson-example) fails when this workaround is
-        applied unconditionally to meson, while the dedicated clang tests
-        (test_devtool_ide_sdk_{code,none}_meson_clang) require it. cmake
-        (with the Ninja or Makefiles generators used here) always passes
-        absolute source paths to the compiler regardless of toolchain, so it
-        never needs this workaround either. Applying this workaround outside
-        of the meson+clang combination would incorrectly discard the correct
-        (and, for gcc/cmake, already working) comp_dir-based mapping - see the
-        'del mappings[target_path]' below - falling back to the generic
-        '/usr/src/debug' mapping to the image's (stale, whole-image-build-time)
-        rootfs-dbg instead of the live source tree.
+        meson/ninja invoke clang with a *relative* source path when B (under
+        WORKDIR) and S (relocated by 'devtool modify') only share a distant
+        common ancestor. -f*-prefix-map only rewrites paths starting with the
+        mapped host prefix, so only DW_AT_comp_dir (absolute) gets rewritten;
+        DW_AT_name stays relative. gcc always emits an absolute DW_AT_name
+        here, and cmake always passes absolute source paths regardless of
+        toolchain, so neither needs this workaround (verified by
+        oe-selftest's DevtoolIdeSdkGccTests/DevtoolIdeSdkClangTests).
 
         Debuggers resolve the compile unit path by joining DW_AT_comp_dir with
-        the relative DW_AT_name, popping one path component per leading "..".
-        If DW_AT_name contains more ".." components than DW_AT_comp_dir has
-        path components, the extra ".." are no-ops once the root is reached
-        (they can't go above "/"), so the final resolved path becomes "/"
-        followed by the leftover (non-"..") components of DW_AT_name - i.e. a
-        suffix of the real, absolute source directory rather than the
-        "/usr/src/debug/<pn>/<pv>" prefix that DEBUG_PREFIX_MAP and the
-        generated sourceMap/sourceFileMap assume.
+        DW_AT_name, popping one path component per leading "..". Once DW_AT_name
+        has more ".." than DW_AT_comp_dir has components, the extra ".." are
+        no-ops at "/", leaving a suffix of the real source directory instead of
+        the expected "/usr/src/debug/<pn>/<pv>" prefix.
 
-        This computes that resolved suffix for the recipe's own source
-        directory (S) and replaces the (now dead, since every file under S is
-        affected the same way) comp_dir-based mapping with it, so debuggers
-        relying on prefix matching (e.g. CodeLLDB, GDB) can still locate the
-        sources.
-
-        Note: the original comp_dir-based target_path is removed rather than
-        kept alongside the new one. Keeping both would mean two different
-        target paths map to the same host path (S), which is ambiguous when a
-        debugger needs to go the other way round: translating a local file
-        (opened from the host/workspace) back into a debug-info path in order
-        to resolve a source breakpoint. CodeLLDB in particular appears to
-        pick the first-registered ("normal", comp_dir-based) mapping in that
-        case, which never matches any real compile unit here, leaving the
-        breakpoint pending with 0 locations.
+        This computes that resolved suffix for S and replaces the (now dead)
+        comp_dir-based mapping with it, so prefix-matching debuggers (CodeLLDB,
+        GDB) can still find the sources. The old target_path is removed rather
+        than kept alongside: keeping both would let a debugger's reverse
+        lookup (host file -> debug-info path, e.g. to resolve a breakpoint)
+        pick the comp_dir-based one, which never matches any compile unit.
         """
         if self.build_tool is not BuildTool.MESON or self.toolchain != "clang":
             return
-- 
2.55.0


