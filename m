Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
 by mx.groups.io with SMTP id smtpd.web12.37037.1624215126109057436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 11:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@synopsys.com header.s=mail header.b=bSbO0PHY;
 spf=pass (domain: synopsys.com, ip: 149.117.73.133, mailfrom: alexey.brodkin@synopsys.com)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14C0140147;
	Sun, 20 Jun 2021 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1624215125; bh=g6JYob7t3KyaB5iRlV98FC+BwMZy0KnLvUiOy6w/Z6c=;
	h=From:To:Cc:Subject:Date:From;
	b=bSbO0PHYyoPTSdQA2oPZAnf4vX2HSeu6ovE4Rrv86wfuTbkZj6xU8t4VpnUVSRrtR
	 JrHzXDw5W4ums+HuqRktHeEYYtJRJlHn8vFZ1FDsNSaFtFbx/l9L1dXXAQP2BJ5oiy
	 kcz4uWPq3nOkHCxKun9y4gac7J9CSGdOZ7p/XtJaMSrTUMp3gdMKZOIPaHqxs4Y75R
	 HcT8YPf+KE2+mYH5pY16TezuyGuE3zqFn2JojcG414RsSYD1giWyVAK2RmjXS+PZTJ
	 4ssS9mKH+KF2QnUJ13jQZRXdy5GSwTIPPEF6z/iRpYs96uo/vdlrpqkpTWaCRPml17
	 2R8XwRfQCpIsA==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
	by mailhost.synopsys.com (Postfix) with ESMTP id AA174A0071;
	Sun, 20 Jun 2021 18:52:01 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Alexey Brodkin" <abrodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
	Khem Raj <raj.khem@gmail.com>,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] gcc: Apply multilib fix to ARC as well
Date: Sun, 20 Jun 2021 11:51:56 -0700
Message-Id: <20210620185156.10634-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2

W/o that hack target GCC assume existence of per-mcpu folders,
which are missing.

In particular G++ failed to find "bits/c++config.h":
------------------>8------------------
 root@hsdk:~# cat test.cc
 #include <cstdlib>

 int myfunc(void)
 {
 }

 root@hsdk:~# g++ -c test.cc -v
 Using built-in specs.
 COLLECT_GCC=g++
 Target: arc-oe-linux
 Configured with: ../../../../../../work-shared/gcc-11.1.0-r0/gcc-11.1.0/configure --build=x86_64-linux --host=arc-oe-linux --target=arc-oe-linux --prefix=/usr --exec_prefix=/usr -x
 Thread model: posix
 Supported LTO compression algorithms: zlib
 gcc version 11.1.1 20210523 (GCC)
 COLLECT_GCC_OPTIONS='-c' '-v' '-shared-libgcc' '-mcpu=hs38_linux'
  /usr/libexec/gcc/arc-oe-linux/11.1.1/cc1plus -quiet -v -imultilib hs38_linux -D_GNU_SOURCE test.cc -quiet -dumpbase test.cc -dumpbase-ext .cc -mcpu=hs38_linux -version -o /tmp/ccs
 GNU C++17 (GCC) version 11.1.1 20210523 (arc-oe-linux)
         compiled by GNU C version 11.1.1 20210523, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version none
 GGC heuristics: --param ggc-min-expand=99 --param ggc-min-heapsize=129242
 ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux/hs38_linux"
 ignoring nonexistent directory "/usr/lib/arc-oe-linux/11.1.1/include"
 ignoring nonexistent directory "/usr/local/include"
 ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../arc-oe-linux/include"
 #include "..." search starts here:
 #include <...> search starts here:
  /usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1
  /usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/backward
  /usr/lib/gcc/arc-oe-linux/11.1.1/include
  /usr/lib/gcc/arc-oe-linux/11.1.1/include-fixed
  /usr/include
 End of search list.
 GNU C++17 (GCC) version 11.1.1 20210523 (arc-oe-linux)
         compiled by GNU C version 11.1.1 20210523, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version none
 GGC heuristics: --param ggc-min-expand=99 --param ggc-min-heapsize=129242
 Compiler executable checksum: 6df2f07a822bfbbb80a61414b712b75d
 In file included from test.cc:1:
 /usr/include/c++/11.1.1/cstdlib:41:10: fatal error: bits/c++config.h: No such file or directory
    41 | #include <bits/c++config.h>
       |          ^~~~~~~~~~~~~~~~~~
 compilation terminated.
------------------>8------------------

Note "ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux/hs38_linux"
message which is being used by GCC due to the fact of implicit "-mcpu=hs38_linux".

In fact this header "bits/c++config.h" is located in "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux"
on target.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 .../gcc/gcc/0004-64-bit-multilib-hack.patch        | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
index 789f57343b..8184e68743 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 28e7c312b1292ca216d4b54ec9f6b7ac055907a8 Mon Sep 17 00:00:00 2001
+From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack.
@@ -19,7 +19,7 @@ and be able to patch these entries with a complete set of correct paths but this
 don't have such code at this point. This is something the target gcc recipe should do
 and override these platform defaults in its build config.
 
-Do same for riscv64 and aarch64
+Do same for riscv64, aarch64 & arc
 
 RP 15/8/11
 
@@ -30,11 +30,12 @@ Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 ---
  gcc/config/aarch64/t-aarch64-linux |  8 ++++----
+ gcc/config/arc/t-multilib-linux    |  4 ++--
  gcc/config/i386/t-linux64          |  6 ++----
  gcc/config/mips/t-linux64          | 10 +++-------
  gcc/config/riscv/t-linux           |  6 ++++--
  gcc/config/rs6000/t-linux64        |  5 ++---
- 5 files changed, 15 insertions(+), 20 deletions(-)
+ 6 files changed, 17 insertions(+), 22 deletions(-)
 
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
 index 241b0ef20b6..a7dadb2d64f 100644
@@ -53,6 +54,22 @@ index 241b0ef20b6..a7dadb2d64f 100644
  
 -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
+diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib-linux
+index fc3fff640a2..d58e28f6df8 100644
+--- a/gcc/config/arc/t-multilib-linux
++++ b/gcc/config/arc/t-multilib-linux
+@@ -16,9 +16,9 @@
+ # along with GCC; see the file COPYING3.  If not see
+ # <http://www.gnu.org/licenses/>.
+ 
+-MULTILIB_OPTIONS = mcpu=hs/mcpu=archs/mcpu=hs38/mcpu=hs38_linux/mcpu=arc700/mcpu=nps400
++#MULTILIB_OPTIONS = mcpu=hs/mcpu=archs/mcpu=hs38/mcpu=hs38_linux/mcpu=arc700/mcpu=nps400
+ 
+-MULTILIB_DIRNAMES = hs archs hs38 hs38_linux arc700 nps400
++#MULTILIB_DIRNAMES = hs archs hs38 hs38_linux arc700 nps400
+ 
+ # Aliases:
+ MULTILIB_MATCHES += mcpu?arc700=mA7
 diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
 index d288b093522..7b5980a9d21 100644
 --- a/gcc/config/i386/t-linux64
-- 
2.16.2

