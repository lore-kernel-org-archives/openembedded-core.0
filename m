Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5C06156F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 02:48:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8E2mBuB001338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 19:48:11 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 19:48:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 22:48:06 -0400
Message-ID: <94042aa46413ecd993cb715e55a003d985cc0d8c.1379126654.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379126654.git.liezhi.yang@windriver.com>
References: <cover.1379126654.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] linux-libc-headers: do_install: fix "Argument list too long" error
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
X-List-Received-Date: Sat, 14 Sep 2013 02:48:11 -0000
Content-Type: text/plain

There would be an "Argument list too long" error when the TMPDIR is in a
deep dir, for example, when "len(readlink -f TMPDIR) >= 350 (our
supported value is 410)". Use "$(foreach ,,$(shell echo))" to fix it.

There was already a patch which tried to fix this issue, so squash the
current change into the previous one as Bruce suggested.

[YOCTO #5138]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...efile.headersinst-install-headers-from-sc.patch |   39 +++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
index 9bc5982..7eb7def 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
@@ -1,6 +1,6 @@
-From e60cc1b011bf0f1acdb7e5168b7bed4ebb78c91f Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Wed, 9 Jan 2013 16:24:39 -0500
+From b200d4bcffc86bb08fd3898bc7cde00f0686f62d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 13 Sep 2013 22:01:02 -0400
 Subject: [PATCH] scripts/Makefile.headersinst: install headers from scratch file
 
 If headers_install is executed from a deep/long directory structure, the
@@ -14,18 +14,23 @@ By dumping the input files to a scratch file and using xargs to read the
 input list from the scratch file, we can avoid blowing out the maximum
 argument size and install headers in a long path name environment.
 
+Robert:
+Use "$(foreach ,,$(shell echo))" rather than "echo" to make it work when
+len(TMPDIR) <= 410.
+
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
 RP: Refreshed for 3.10 as the problem still exists there on the autobuilders
+ scripts/Makefile.headersinst |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
 
- scripts/Makefile.headersinst |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
-
-Index: linux-3.10/scripts/Makefile.headersinst
-===================================================================
---- linux-3.10.orig/scripts/Makefile.headersinst
-+++ linux-3.10/scripts/Makefile.headersinst
-@@ -72,7 +72,7 @@ printdir = $(patsubst $(INSTALL_HDR_PATH
+diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
+--- a/scripts/Makefile.headersinst
++++ b/scripts/Makefile.headersinst
+@@ -72,7 +72,7 @@ printdir = $(patsubst $(INSTALL_HDR_PATH)/%/,%,$(dir $@))
  quiet_cmd_install = INSTALL $(printdir) ($(words $(all-files))\
                              file$(if $(word 2, $(all-files)),s))
        cmd_install = \
@@ -34,11 +39,19 @@ Index: linux-3.10/scripts/Makefile.headersinst
          for F in $(wrapper-files); do                                   \
                  echo "\#include <asm-generic/$$F>" > $(installdir)/$$F;    \
          done;                                                           \
-@@ -101,7 +101,9 @@ targets += $(install-file)
+@@ -98,10 +98,17 @@ __headersinst: $(subdirs) $(install-file)
+ 	@:
+ 
+ targets += $(install-file)
++# Use the $(foreach ,,$(shell echo)) to avoid the "Argument list too
++# long" error, and use the "$(shell echo)" rather than "echo" to keep
++# the order.
  $(install-file): scripts/headers_install.sh $(input-files) FORCE
  	$(if $(unwanted),$(call cmd,remove),)
  	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
-+	@echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files
++	$(shell echo -n > $(INSTALL_HDR_PATH)/.input-files)
++	$(foreach f,$(input-files),$(shell echo -n "$(f) " >> \
++			$(INSTALL_HDR_PATH)/.input-files))
  	$(call if_changed,install)
 +	@rm $(INSTALL_HDR_PATH)/.input-files
  
-- 
1.7.10.4


