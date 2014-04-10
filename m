Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F199665E4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:29:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A1TfxQ024620
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Apr 2014 18:29:41 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 9 Apr 2014 18:29:41 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2014 09:29:37 +0800
Message-ID: <0d447777f4ce0bac18e1c8e937d61aeffbed57d7.1397093236.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397093236.git.Chong.Lu@windriver.com>
References: <cover.1397093236.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] kernelshark/trace-cmd: fix syntax error of shell
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
X-List-Received-Date: Thu, 10 Apr 2014 01:29:43 -0000
Content-Type: text/plain

Delete "<<<" syntax of bash in Makefile, else we would get following error:

        Syntax error: redirection unexpected

[YOCTO #6112]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |  3 ++-
 .../kernelshark-fix-syntax-error-of-shell.patch    | 28 ++++++++++++++++++++++
 .../trace-cmd-fix-syntax-error-of-shell.patch      | 28 ++++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |  1 +
 4 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index 9268a50..d61097d 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -15,7 +15,8 @@ inherit pkgconfig pythonnative
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
            file://addldflags.patch \
            file://make-docs-optional.patch \
-           file://blktrace-api-compatibility.patch"
+           file://blktrace-api-compatibility.patch \
+           file://kernelshark-fix-syntax-error-of-shell.patch"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
new file mode 100644
index 0000000..a3059f4
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
@@ -0,0 +1,28 @@
+kernelshark: fix syntax error of shell
+
+Delete "<<<" syntax of bash in Makefile, else we would get following error:
+
+	Syntax error: redirection unexpected
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ Makefile |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c1fa906..be84415 100644
+--- a/Makefile
++++ b/Makefile
+@@ -89,8 +89,7 @@ endif
+ 
+ # $(call test-build, snippet, ret) -> ret if snippet compiles
+ #                                  -> empty otherwise
+-test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
+-	                  <<<'$1' && echo y), $2)
++test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
+ 
+ # have udis86 disassembler library?
+ udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
new file mode 100644
index 0000000..c071e82
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
@@ -0,0 +1,28 @@
+trace-cmd: fix syntax error of shell
+
+Delete "<<<" syntax of bash in Makefile, else we would get following error:
+
+       Syntax error: redirection unexpected
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ Makefile |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c1fa906..7973c53 100644
+--- a/Makefile
++++ b/Makefile
+@@ -89,8 +89,7 @@ endif
+ 
+ # $(call test-build, snippet, ret) -> ret if snippet compiles
+ #                                  -> empty otherwise
+-test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
+-	                  <<<'$1' && echo y), $2)
++test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
+ 
+ # have udis86 disassembler library?
+ udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index 74eafbb..a0c823b 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
            file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
            file://trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch \
            file://trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch \
+           file://trace-cmd-fix-syntax-error-of-shell.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
1.8.1.2


