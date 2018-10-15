Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Oct 2018 18:31:28 UTC
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id AB352796EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4590; q=dns/txt; s=iport;
	t=1539628290; x=1540837890;
	h=from:to:cc:subject:date:message-id;
	bh=KVqIjnyRO+btpHDBSdeWdecPuiFQjPN7/7yp2HNP8sY=;
	b=mC2GncAKD9HmQFSSrIL0FiwQA9rsRdEEYtpTMpKv3NbfNdbjw2OIw2ta
	mOrR/V165SZqlAdE9PZgC6K4U5HnZE+LVAhaFJXjCCauFKS3dUJgXEDFr
	rldkdaO6tCxdvuHN1CbVMVFmxIRzxsscS6jY8J5SUNayuCwDOctPK1TSz A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AEAABW2cRb/5ldJa1jGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUQUBAQEBCwGCA2Z/KIwLX4tMgSVojhOIdBSBZgsBASOESYR?=
	=?us-ascii?q?fITQNDQEDAQECAQECbRwMhTkBAQQoUgUnAwECfiGDIAGBeQgPp3wzhHeEXoc?=
	=?us-ascii?q?qhCIXggCBEoYtBBiBEB+FcgKIRBkLLYYajnsJhlWJewsXghuOAgGMQ4lDAgQ?=
	=?us-ascii?q?GBQIUgUM4gVVNIxWDJwmCHQEWg0eFFIVeHzABiRqCTQEB?=
X-IronPort-AV: E=Sophos;i="5.54,385,1534809600"; d="scan'208";a="185669615"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
	by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 18:21:54 +0000
Received: from kamensky-w541.cisco.com (rtp-vpn1-298.cisco.com [10.82.225.42])
	(authenticated bits=0)
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id w9FILfZV021526
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Mon, 15 Oct 2018 18:21:53 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 11:21:28 -0700
Message-Id: <20181015182128.13115-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.17.2
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.82.225.42, rtp-vpn1-298.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
Subject: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Mon, 15 Oct 2018 18:31:28 -0000

Upgrade systemtap from 3.3 to 4.0: Removed backported patch.

Very short summary of major changes from SystemTap 4.0
announcement by Frank Ch. Eigler <fche@redhat.com>:

> prometheus exporter network service; ebpf support extensions including
> strings and implementation of traditional log(), sprintf() functions;
> rebuilt rich tapset coverage for 4.17+ syscalls and for
> tracepoint-based syscalls; script language tweaks for supporting
> machine-generated scripts

Fixes [YOCTO #12950]

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
Hi Guys,

I'll let you to decide whether you want to accept
it for 2.6 at this point or push it for the next release.
On one hand after move to 4.18 kernel SystemTap 3.3
fails to trace any system call on x86_64 - it is major
functionality breakage. Look at:

https://bugzilla.redhat.com/show_bug.cgi?id=1596456

On other hand it is quite late to do major version
updates.

I did go through limitted set of tests on all
supported QEMU targets. As far as these tests
concerned proposed 4.0 matches 3.3 results.

Thanks,
Victor

 ...entrypc-avoid-usage-of-uninitialized.patch | 46 -------------------
 .../systemtap/systemtap_git.inc               |  5 +-
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch b/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
deleted file mode 100644
index d0082a1094..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8466fca2a074323a235ef38d425f994a2ff7e64f Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Mon, 9 Jul 2018 09:31:19 -0700
-Subject: [PATCH] dwflpp::function_entrypc avoid usage of uninitialized memory
-
-Failure on 3.3 release was observed. Failure was elusive and
-disappeared after seemingly random configure option change, or when
-code was compiled with -O1 or -O0 (vs default -O2). Running failing
-test case under valgrind memcheck pointed to couple places where
-'Conditional jump or move depends on uninitialised value(s)' occured.
-
-After addressing these in two places in dwflpp::function_entrypc,
-valgrind memcheck run is clean and original issue got fixed.
-
-Upstream-Status: Backport
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- dwflpp.cxx | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/dwflpp.cxx b/dwflpp.cxx
-index bfbb6b096..2172e705a 100644
---- a/dwflpp.cxx
-+++ b/dwflpp.cxx
-@@ -2465,13 +2465,17 @@ bool
- dwflpp::function_entrypc (Dwarf_Addr * addr)
- {
-   assert (function);
-+
-+  // assign default value
-+  *addr = 0;
-+
-   // PR10574: reject 0, which tends to be eliminated COMDAT
-   if (dwarf_entrypc (function, addr) == 0 && *addr != 0)
-     return true;
- 
-   /* Assume the entry pc is the base address, or (if zero)
-      the first address of the ranges covering this DIE.  */
--  Dwarf_Addr start, end;
-+  Dwarf_Addr start = 0, end;
-   if (dwarf_ranges (function, 0, addr, &start, &end) >= 0)
-     {
-       if (*addr == 0)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 06924fc240..274fcde5c1 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "48867d1cface9445d58e3c6e14497770b7eb77e1"
-PV = "3.3"
+SRCREV = "428f84e9e656bce71018e8902e4edb8aacafcc0e"
+PV = "4.0"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://configure-allow-to-disable-libvirt.patch \
@@ -11,7 +11,6 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.17.1


