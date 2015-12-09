Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2C860616
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 18:52:54 +0000 (UTC)
Received: by oixx65 with SMTP id x65so31824170oix.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 10:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=R56x/ge/Li5fCmbDjQxMC2hBFJuqiazC6TGy1JauQ+Y=;
	b=QKqOXu+PoZSbMQ+ichKON0w/OwdKZAYkZ043MpZNKWZQrzJX9m5hPX+sHppbbQOaxa
	LTRLKVjpzojtBjyDUMzt75FYDeO42iN8PQZjvqZ2Gj3tbxRvCagXpaTodI72Pg0R5MAX
	8UnHyc4klS8tTt+NCQ2pOzVzavgxGZvnWQJPgBVSrQbDBiVtvjXcXqAhyaaicqFBwZZG
	GX9zrsTnT1rmVBDI1LWSR1yDorBY7VUpf7M57XRJZtul13iGZjYjtSoLsoOf63x0dTqz
	FLOBUC3kHCPG/6QVa+FErkAuPPKPdOS8mfYRW/KJy2uprRNgmUsewBI7SU3S+41dWWEq
	G3Hw==
X-Received: by 10.202.80.205 with SMTP id e196mr5292768oib.122.1449687175559; 
	Wed, 09 Dec 2015 10:52:55 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	m10sm4112081oex.12.2015.12.09.10.52.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 10:52:54 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 10:52:48 -0800
Message-Id: <1449687168-27312-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] valgrind: import Debian link_tool patch for MIPS
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
X-List-Received-Date: Wed, 09 Dec 2015 18:52:59 -0000

Without this patch, valgrind 3.10.1 fails to run on MIPS:

 | root@bcm97425vms:~# valgrind /bin/ls
 | valgrind: mmap(0x400000, 700416) failed in UME with error 22 (Invalid argument).
 | valgrind: this can be caused by executables with very large text, data or bss segments.

Original Debian bug report:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=777704

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../valgrind/valgrind/11_mips-link-tool.patch      | 37 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch b/meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
new file mode 100644
index 0000000..ecb33b8
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
@@ -0,0 +1,37 @@
+Debian fix for MIPS: mmap(0x400000, 32768) failed in UME with error 22 (Invalid argument)
+
+  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=777704
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+
+Description: Disable the MIPS linker workarounds when using -Ttext-section
+Origin: vendor
+Bug-Debian: http://bugs.debian.org/777704
+Author: James Cowgill <james410@cowgill.org.uk>
+Last-Update: 2015-04-25
+
+--- a/coregrind/link_tool_exe_linux.in
++++ b/coregrind/link_tool_exe_linux.in
+@@ -76,12 +76,13 @@
+ my $arch = substr($x, 0, index($x, "'"));
+ 
+ my $extra_args;
+-if (($arch eq 'mips') || ($arch eq 'mipsel')
+-    || ($arch eq 'mipsisa32r2el')) {
+-   $extra_args = "-static -Wl,--section-start=.reginfo=$ala";
+-} elsif (($arch eq 'mips64') || ($arch eq 'mips64el') ||
+-         ($arch eq 'mipsisa64el')) {
+-   $extra_args = "-static -Wl,--section-start=.MIPS.options=$ala";
++if ($arch =~ /^mips/ && "@FLAG_T_TEXT@" eq '-Ttext') {
++   # We only need to use the special mips options when using -Ttext
++   if ($arch =~ /^mips(64|isa64)/) {
++      $extra_args = "-static -Wl,--section-start=.MIPS.options=$ala";
++   } else {
++      $extra_args = "-static -Wl,--section-start=.reginfo=$ala";
++   }
+ } else {
+    $extra_args = "-static -Wl,@FLAG_T_TEXT@=$ala";
+ }
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index 86ba979..c386a19 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://pass-maltivec-only-if-it-supported.patch \
            file://run-ptest \
            file://0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch \
+           file://11_mips-link-tool.patch \
           "
 
 SRC_URI[md5sum] = "60ddae962bc79e7c95cfc4667245707f"
-- 
1.9.1


