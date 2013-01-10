Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TtPIt-0001uQ-HM
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 22:04:54 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0AKnV8w013888;
	Thu, 10 Jan 2013 12:49:31 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 10 Jan 2013 15:49:16 -0500
Message-Id: <0a1e805fc5bda5253453fe65b8a8947b4f5082ca.1357850854.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357850854.git.bruce.ashfield@windriver.com>
References: <cover.1357850854.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1357850854.git.bruce.ashfield@windriver.com>
References: <cover.1357850854.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-libc-headers: fix headers install in long path name environments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 21:04:56 -0000

If a build is started in a deep directory structure, or in a path with
long directory names the installation of linux-libc-headers will fail
with:

  | make[2]: execvp: /bin/sh: Argument list too long
  | make[2]: ***

From within the kernel Makefiles themselves.

The solution is to patch the kernel build rules with the following
change:

[
    scripts/Makefile.headersinst: install headers from scratch file

    If headers_install is executed from a deep/long directory structure, the
    shell's maximum argument length can be execeeded, which breaks the operation
    with:

    | make[2]: execvp: /bin/sh: Argument list too long
    | make[2]: ***

    By dumping the input files to a scratch file and using xargs to read the
    input list from the scratch file, we can avoid blowing out the maximum
    argument size and install headers in a long path name environment.
]

Until this change, or a similar one, is merged into the mainline kernel, this
change should be applied to any 3.7 or greater libc-headers build.

Upstream-status: Pending

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...efile.headersinst-install-headers-from-sc.patch |   47 ++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.7.bb   |    4 ++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
new file mode 100644
index 0000000..be1ef25
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
@@ -0,0 +1,47 @@
+From e60cc1b011bf0f1acdb7e5168b7bed4ebb78c91f Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Wed, 9 Jan 2013 16:24:39 -0500
+Subject: [PATCH] scripts/Makefile.headersinst: install headers from scratch file
+
+If headers_install is executed from a deep/long directory structure, the
+shell's maximum argument length can be execeeded, which breaks the operation
+with:
+
+| make[2]: execvp: /bin/sh: Argument list too long
+| make[2]: ***
+
+By dumping the input files to a scratch file and using xargs to read the
+input list from the scratch file, we can avoid blowing out the maximum
+argument size and install headers in a long path name environment.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ scripts/Makefile.headersinst |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
+index 06ba4a7..536d722 100644
+--- a/scripts/Makefile.headersinst
++++ b/scripts/Makefile.headersinst
+@@ -71,7 +71,7 @@ printdir = $(patsubst $(INSTALL_HDR_PATH)/%/,%,$(dir $@))
+ quiet_cmd_install = INSTALL $(printdir) ($(words $(all-files))\
+                             file$(if $(word 2, $(all-files)),s))
+       cmd_install = \
+-        $(PERL) $< $(installdir) $(SRCARCH) $(input-files); \
++        xargs $(PERL) $< $(installdir) $(SRCARCH) < $(INSTALL_HDR_PATH)/.input-files; \
+         for F in $(wrapper-files); do                                   \
+                 echo "\#include <asm-generic/$$F>" > $(installdir)/$$F;    \
+         done;                                                           \
+@@ -100,7 +100,9 @@ targets += $(install-file)
+ $(install-file): scripts/headers_install.pl $(input-files) FORCE
+ 	$(if $(unwanted),$(call cmd,remove),)
+ 	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
++	@echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files
+ 	$(call if_changed,install)
++	@rm $(INSTALL_HDR_PATH)/.input-files
+ 
+ else
+ __headerscheck: $(subdirs) $(check-file)
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb
index 3d688b7..a363289 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb
@@ -1,4 +1,8 @@
 require linux-libc-headers.inc
 
+SRC_URI += "file://scripts-Makefile.headersinst-install-headers-from-sc.patch"
+
+PR = "r1"
+
 SRC_URI[md5sum] = "5323f3faadd051e83af605a63be5ea2e"
 SRC_URI[sha256sum] = "dc08d87a579fe2918362e6666e503a95a76296419195cb499aa9dd4dbe171a9e"
-- 
1.7.10.4



