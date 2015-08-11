Return-Path: <reinette.chatre@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 37A5376978
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 21:11:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2015 14:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="623638534"
Received: from rchatre-builder.jf.intel.com ([10.54.39.14])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2015 14:10:34 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 11 Aug 2015 14:12:20 -0700
Message-Id: <ade88be26a428611d94fb7037a1dbc05793548f2.1439327181.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.4.3
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: fix build breakage on kernels after 4.1
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
X-List-Received-Date: Tue, 11 Aug 2015 21:11:13 -0000

A recent commit fixed perf build failures with a change that duplicates
a fix that can be found in kernels after 4.1. Unfortunately there is a
conflict between these two fixes and we see perf build failures when
building perf in kernels that contain the fix already. The problem is
that the fix from the recipe modifies the location of .config-detected
to $(OUTPUT).config-detected. In a 4.2 kernel the location will be
changed to $(OUTPUT)$(OUTPUT).config-detected.

We change the recipe to require a space in the pattern to only change
kernel sources that do not already place file in $(OUTPUT).

The recent commit that introduced the build failure is:

   commit ea9016b60b47138bc58d84a06954b44527b20a19
    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
    Date:   Sat Jul 25 14:37:58 2015 +0100

        perf: Fix config file conflict with 4.1 kernels

        If you setup mutlitlibs and then:

        bitbake perf libb32-perf
        bitbake perf libb32-perf -c cleansstate
        bitbake perf libb32-perf

        you will see races where the two builds get confused about which directory
        they should be using and they corrupt each other.

        The issue is that .config-detected is created in ${S}, not $(OUTPUT).
        We can fix this by moving the file to $(OUTPUT).

        [YCOTO #8043]

        (From OE-Core rev: 00608cffffb586e8d2a2075117e710113c471448)

        (From OE-Core rev: 57df1ebd910e42af47a0039830a60f41a3bd29b6)

        Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

The commit in the kernel source that fixes the problem from kernel side is:
    commit 642273795fa81da11290ffa90bce6ff242f2a7bb
    Author: Aaro Koskinen <aaro.koskinen@nokia.com>
    Date:   Wed Jul 1 14:54:42 2015 +0300

        perf tools: Create config.detected into OUTPUT directory

        Create config.detected into OUTPUT directory instead of source
        directory.

        This fixes parallel builds that share the same source directory.

        Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
        Acked-by: Jiri Olsa <jolsa@kernel.org>
        Cc: Paul Mackerras <paulus@samba.org>
        Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
        Link: http://lkml.kernel.org/r/1435751683-18500-1-git-send-email-aaro.koskinen@nokia.com
        Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index f8e80d0..e7ddfff 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -134,6 +134,7 @@ do_configure_prepend () {
     # config/Makefile.
     #
     # Also need to relocate .config-detected to $(OUTPUT)/config-detected
+    # for kernel sources that do not already do this
     # as two builds (e.g. perf and lib32-perf from mutlilib can conflict
     # with each other if its in the shared source directory
     #
@@ -141,15 +142,15 @@ do_configure_prepend () {
         # Match $(prefix)/$(lib) and $(prefix)/lib
         sed -i -e 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
                -e 's,^perfexecdir = \(.*\),perfexecdir ?= \1,' \
-               -e 's,\.config-detected,$(OUTPUT)/config-detected,g' \
+               -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/config/Makefile
     fi
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
-        sed -i -e 's,\.config-detected,$(OUTPUT)/config-detected,g' \
+        sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/Makefile.perf
     fi
     if [ -e "${S}/tools/build/Makefile.build" ]; then
-        sed -i -e 's,\.config-detected,$(OUTPUT)/config-detected,g' \
+        sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/build/Makefile.build
     fi
 
-- 
2.4.3


