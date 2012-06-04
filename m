Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sbfpk-00014q-KW
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:33:08 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so6811292pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YzcINJ1+laAsSifoK6Xi76VLGbrLgdeOzEdFuBnTD0I=;
	b=MeF+ZCIpYYusnVRXcShFAbztc8InvmoWZoku82p30DYzEoz7URS4yKEH7vkcBzJ+tj
	tkwuzadftS61J7vcxiNXzN/s64VlVroiPzeckURKfEIg+kTLs+C6D9JwA53OZlQHhvdw
	Ji7cwNYY+XbG335IZ7Q1uQiQZ/fWw72EmxS6H/D1ReWWCgk9/wdGQkCk+4bve84iFHC0
	+DRO9JXf0OMub4NdTdZplamjT5jvTdfqi7EIEFKAuly674I4kOo8ps/628ViExqKhobO
	rbR3lODVF1K8zMajgWkE2GNjaKMSXAHzd9POy5otfo2RiLs5FsnAXyzE+6kUrHKTn6VS
	gQgg==
Received: by 10.68.219.41 with SMTP id pl9mr40379819pbc.61.1338848565262;
	Mon, 04 Jun 2012 15:22:45 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id we10sm34017pbc.13.2012.06.04.15.22.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 15:22:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2012 15:21:43 -0700
Message-Id: <6c9b8591f07266576494b7bb396d7a5c79dd0f68.1338848379.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
References: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
In-Reply-To: <cover.1338848379.git.raj.khem@gmail.com>
References: <cover.1338848379.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] libtool: Let -fstack-protector passed to link step
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jun 2012 22:33:08 -0000

linker should add -lssp to linker cmdline when
-fstack-protector therefore add this knowledge to libtool
otherwise packages will fail to link

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    3 +-
 .../libtool/libtool/respect-fstack-protector.patch |   53 ++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index c1ef7c4..05a2e6d 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://fix-final-rpath.patch \
            file://avoid_absolute_paths_for_general_utils.patch \
            file://fix-rpath.patch \
+	   file://respect-fstack-protector.patch \
           "
 
 SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
diff --git a/meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch b/meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
new file mode 100644
index 0000000..a82b2ec
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
@@ -0,0 +1,53 @@
+Source: http://permalink.gmane.org/gmane.comp.gnu.libtool.bugs/7341
+
+Bug confirmed.  When code is compiled with -fstack-protector{,-all},
+GCC "emits extra code to check for buffer overflows, such as stack
+smashing attacks".  This extra code uses symbols from libssp, and
+therefore (at least) Cygwin's GCC specs contain:
+
+*link_ssp:
+%{fstack-protector|fstack-protector-all:-lssp_nonshared -lssp}
+
+Therefore, when libtool fails to pass -fstack-protector{,-all} at link
+stage, the link fails.
+
+Patch attached.  (Yes, I have a copyright assignment on file.)
+
+Yaakov
+Cygwin/X
+
+From b79f4e117b6f73cc461a2e232063e08481d33300 Mon Sep 17 00:00:00 2001
+From: Yaakov Selkowitz <yselkowitz <at> users.sourceforge.net>
+Date: Tue, 1 Jun 2010 22:18:51 -0500
+Subject: [PATCH] Fix linking with -fstack-protector
+
+* libltdl/config/ltmain.m4sh (func_mode_link): Pass -fstack-protector*
+to the linker as it is required at link time to resolve libssp symbols.
+
+Signed-off-by: Yaakov Selkowitz <yselkowitz <at> users.sourceforge.net>
+---
+ libltdl/config/ltmain.m4sh |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh	2012-06-01 12:35:44.089638130 -0700
++++ libtool-2.4.2/libltdl/config/ltmain.m4sh	2012-06-01 12:37:25.789643055 -0700
+@@ -5067,13 +5067,14 @@
+       # -m*, -t[45]*, -txscale* architecture-specific flags for GCC
+       # -F/path              path to uninstalled frameworks, gcc on darwin
+       # -p, -pg, --coverage, -fprofile-*  profiling flags for GCC
++      # -fstack-protector*   stack protector flags for GCC
+       # @file                GCC response files
+       # -tp=*                Portland pgcc target processor selection
+       # --sysroot=*          for sysroot support
+       # -O*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
+       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
+       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
+-      -O*|-flto*|-fwhopr*|-fuse-linker-plugin)
++      -O*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*)
+         func_quote_for_eval "$arg"
+ 	arg="$func_quote_for_eval_result"
+         func_append compile_command " $arg"
-- 
1.7.5.4



