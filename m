Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0436BC04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:23:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8D8Nvq5001533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:23:57 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 01:23:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 04:23:52 -0400
Message-ID: <76daa47ae32a04d0bc4bea8a04b7ef240ee6e599.1379054099.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379054099.git.liezhi.yang@windriver.com>
References: <cover.1379054099.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Fri, 13 Sep 2013 08:23:55 -0000
Content-Type: text/plain

There would be an "Argument list too long" error when the TMPDIR is in a deep
dir, for example, when "len(readlink -f TMPDIR) >= 350 (our supported value is
410)". Use "$(foreach ,,$(shell echo))" to fix it.

[YOCTO #5138]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...cripts-Makefile.headersinst-args-too-long.patch |   36 ++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.10.bb  |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch
new file mode 100644
index 0000000..c0e1a06
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch
@@ -0,0 +1,36 @@
+Makefile.headersinst: fix "Argument list too long" error
+
+There would be an "Argument list too long" error when the src is in a
+deep dir, for example, when "len(readlink -f src_dir) >= 400", use
+"$(foreach ,,$(shell echo))" to fix it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ scripts/Makefile.headersinst |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
+--- a/scripts/Makefile.headersinst
++++ b/scripts/Makefile.headersinst
+@@ -98,10 +98,15 @@ __headersinst: $(subdirs) $(install-file)
+ 	@:
+ 
+ targets += $(install-file)
++# Use the $(foreach ,,$(shell echo)) to avoid the "Argument list too
++# long" error, and use the "$(shell echo)" rather than "echo" to keep
++# the order.
+ $(install-file): scripts/headers_install.sh $(input-files) FORCE
+ 	$(if $(unwanted),$(call cmd,remove),)
+ 	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
+-	@echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files
++	$(shell echo -n > $(INSTALL_HDR_PATH)/.input-files)
++	$(foreach f,$(input-files),$(shell echo -n "$(f) " >> \
++			$(INSTALL_HDR_PATH)/.input-files))
+ 	$(call if_changed,install)
+ 	@rm $(INSTALL_HDR_PATH)/.input-files
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
index 65df230..d056e7c 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
@@ -2,6 +2,7 @@ require linux-libc-headers.inc
 
 SRC_URI += "file://0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch"
 SRC_URI += "file://scripts-Makefile.headersinst-install-headers-from-sc.patch"
+SRC_URI += "file://scripts-Makefile.headersinst-args-too-long.patch"
 
 SRC_URI[md5sum] = "72d0a9b3e60cd86fabcd3f24b1708944"
 SRC_URI[sha256sum] = "46c9e55e1fddf40813b8d697d5645037a8e2af5c1a8dff52b3fe82b5021582b8"
-- 
1.7.10.4


