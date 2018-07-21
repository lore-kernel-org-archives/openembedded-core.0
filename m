Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 576 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 21 Jul 2018 03:48:43 UTC
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id 775487451E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 03:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3319; q=dns/txt; s=iport;
	t=1532144925; x=1533354525;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kcGc5ehjG6ndTa+nmFZyyHnxw2EyeXo+HsZvdcDGwAs=;
	b=MwyNQCTbScehff9hHzIRcGzDpqHU94Z89lLYf789P9Ilfrw2xkisANYw
	2hA3ztvz+0PQmskd8XeHFDjcjjgTiPWu1RqvSULKaIe8HHiDr77tFzJvG
	slGbmmi76lFAyQJMaoQi8QYTplq7gRcisV8WSuqgm4HKOR2ArKi1LgT/c M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DhAADIqVJb/4cNJK1cGgEBAQEBAgE?=
	=?us-ascii?q?BAQEIAQEBAYNNY38ojAJfi1OCDJEDhDmBegsbhFECgwwhNBgBAgEBAgEBAm0?=
	=?us-ascii?q?cDIU2AQaBCRwDAQIvTwgZgyABgX+uE4RdhXSJAoIWiGaGDQKHSYV+jCUJhhG?=
	=?us-ascii?q?JHwKCBotqK5FPAhEUgUE4gVJNIxWDJAmCRIhIhV4fMIsAgkkBAQ?=
X-IronPort-AV: E=Sophos;i="5.51,382,1526342400"; d="scan'208";a="145616868"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2018 03:39:07 +0000
Received: from kamensky-w541.cisco.com (rtp-vpn3-1263.cisco.com
	[10.82.220.244]) (authenticated bits=0)
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id w6L3crgJ013872
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 03:39:06 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 20:38:53 -0700
Message-Id: <1532144333-19873-2-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532144333-19873-1-git-send-email-kamensky@cisco.com>
References: <1532144333-19873-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.82.220.244, rtp-vpn3-1263.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
Subject: [PATCH 2/2] systemtap: fix unintialized memory accesses in dwflpp::function_entrypc
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
X-List-Received-Date: Sat, 21 Jul 2018 03:48:43 -0000

Observed failure in SystemTap v3.3 unit testing, It was tracked down
to unintialized memory access in dwflpp::function_entrypc method.

Upstream-Status: Backport
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 ...entrypc-avoid-usage-of-uninitialized.patch | 46 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch b/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
new file mode 100644
index 0000000000..d0082a1094
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
@@ -0,0 +1,46 @@
+From 8466fca2a074323a235ef38d425f994a2ff7e64f Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Mon, 9 Jul 2018 09:31:19 -0700
+Subject: [PATCH] dwflpp::function_entrypc avoid usage of uninitialized memory
+
+Failure on 3.3 release was observed. Failure was elusive and
+disappeared after seemingly random configure option change, or when
+code was compiled with -O1 or -O0 (vs default -O2). Running failing
+test case under valgrind memcheck pointed to couple places where
+'Conditional jump or move depends on uninitialised value(s)' occured.
+
+After addressing these in two places in dwflpp::function_entrypc,
+valgrind memcheck run is clean and original issue got fixed.
+
+Upstream-Status: Backport
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ dwflpp.cxx | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/dwflpp.cxx b/dwflpp.cxx
+index bfbb6b096..2172e705a 100644
+--- a/dwflpp.cxx
++++ b/dwflpp.cxx
+@@ -2465,13 +2465,17 @@ bool
+ dwflpp::function_entrypc (Dwarf_Addr * addr)
+ {
+   assert (function);
++
++  // assign default value
++  *addr = 0;
++
+   // PR10574: reject 0, which tends to be eliminated COMDAT
+   if (dwarf_entrypc (function, addr) == 0 && *addr != 0)
+     return true;
+ 
+   /* Assume the entry pc is the base address, or (if zero)
+      the first address of the ranges covering this DIE.  */
+-  Dwarf_Addr start, end;
++  Dwarf_Addr start = 0, end;
+   if (dwarf_ranges (function, 0, addr, &start, &end) >= 0)
+     {
+       if (*addr == 0)
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a1e05579e6..06924fc240 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -11,6 +11,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.17.1


