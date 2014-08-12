Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2740060DF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:10:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7CBAJh3017915
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:10:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 04:10:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Aug 2014 04:10:19 -0700
Message-ID: <cf27f471a5feb7deaaa24694028d7b4dc34fea02.1407836032.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407836032.git.liezhi.yang@windriver.com>
References: <cover.1407836032.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perf.bb: fix multilib build
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
X-List-Received-Date: Tue, 12 Aug 2014 11:10:19 -0000
Content-Type: text/plain

Fixed:
$ bitbake perf lib32-perf
ERROR: QA Issue: lib32-perf: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/traceevent
  /usr/lib64/traceevent/plugins
  /usr/lib64/traceevent/plugins/plugin_function.so
  /usr/lib64/traceevent/plugins/plugin_scsi.so
  /usr/lib64/traceevent/plugins/plugin_hrtimer.so
  /usr/lib64/traceevent/plugins/plugin_kmem.so
  /usr/lib64/traceevent/plugins/plugin_jbd2.so
  /usr/lib64/traceevent/plugins/plugin_xen.so
  /usr/lib64/traceevent/plugins/plugin_mac80211.so
  /usr/lib64/traceevent/plugins/plugin_cfg80211.so
  /usr/lib64/traceevent/plugins/plugin_sched_switch.so
  /usr/lib64/traceevent/plugins/plugin_kvm.so [installed-vs-shipped]

The perf.do_configure edits kernel's
${STAGING_KERNEL_DIR}/tools/perf/config/Makefile, there would be
problems since kernel doesn't have multilib, and the build result is
undetermined.

Previously, the sed command changed libdir to /usr/lib64 (or 32) in the
Makefile, so the build result was different if we build perf (64) first
or lib32-perf first.

Use the weak assignment "libdir ?=" to instead of "libdir =" will fix
the problem since the multilib builds are in different processes, and
they won't affect each other any more.

The sed command will match both $(prefix)/$(lib) and $(prefix)/lib since
the Makefile may has been modified before this patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index bfd210c..ebfedb9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -121,10 +121,12 @@ do_configure_prepend () {
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
     # build, with a 64 bit multilib, the arch won't match and the detection of a 
     # 64 bit build (and library) are not exected. To ensure that libraries are
-    # installed to the correct location, we can make the substitution in the 
-    # config/Makefile. For non multilib builds, this has no impact.
+    # installed to the correct location, we can use the weak assignment in the
+    # config/Makefile.
     if [ -e "${S}/tools/perf/config/Makefile" ]; then
-        sed -i 's,libdir = $(prefix)/$(lib),libdir = $(prefix)/${baselib},' ${S}/tools/perf/config/Makefile
+        # Match $(prefix)/$(lib) and $(prefix)/lib
+        sed -i 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
+            ${S}/tools/perf/config/Makefile
     fi
     # We need to ensure the --sysroot option in CC is preserved
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
-- 
1.7.9.5


