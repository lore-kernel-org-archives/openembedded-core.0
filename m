Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CBD6C76102
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:26 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id uo6so404040698pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=A71wkhRb/KdKJN5ettIY2JJf70cQv6JDjEVfp/oPbvU=;
	b=m9Kj0dnjMXd3uQAw7Ic2s1pmznTBjaG5Av28pZn72AmSEXrImwP1mIJhby5UrPRtGY
	rSZnxhcdpiMBZG943JUAsYXeC2bleReib0SvITVSw48a3+Awy1Ai3DdKmy9vg49G6Ap+
	YsaLCQOIiIL030dtX9NpXTmmmsFYvw2oLieeSas3goMdokpiJAFduskx/JbdF5oWDPEh
	hgGhgk9DoQRINblQLTT1ldLw03NiDyhniQvhtPTPCzfVhcMuZ6FKBzBjW7brt0uTSQjj
	b6FqWPRLJALb/WlPa9Fi8DWsJsD37OsANmmhPqXg++5LeELgEejKnWZLcECngltso2ny
	cleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=A71wkhRb/KdKJN5ettIY2JJf70cQv6JDjEVfp/oPbvU=;
	b=AMNEwEzgnuVH8Ee3jsuO8vPdQwMJFrZCr0uvV/2Ap0vamyyCNQWVfO1lkJ173TTceG
	3BNJuqMHKIZpGWIzKMnFTnTuys5uiGkhfVSmqJJ6ArvOmWCiOcoMO+SFJPtDRVsH9L6Y
	UidVqR0lPzGZjBUqastJNzsFHHyFVQI3xPHGEDbILhbzM/hDNgnu3HgC0RGDpxaxlaQg
	B4d6QYMLRBCH7e8I4g63vpo/GxXmfgTt/5BVUqoX8yWk+dtNN5TRW5xwB/epTEnOkV0N
	sNNK8feRs5sUhIQMPEnN5dvFJd6LHjjX4/6Y9be6IZ+TPOVJWYFmqe/GTF322dNY+Tj/
	ZnBg==
X-Gm-Message-State: ALoCoQnpHUW/ndjuSeSOg4WITlqltCtZqqQ7UDapuS1BCl7RoWAV+uEc0KN/4ggUoj7S0z8JTOvYyrQQQpZKYzuVZwXc4SS7kQ==
X-Received: by 10.66.252.136 with SMTP id zs8mr28367821pac.110.1453030647886; 
	Sun, 17 Jan 2016 03:37:27 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:03 -0800
Message-Id: <37bb7f5fd749848a0540ea5d3a0d2b8ec8c3f7e7.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 30/73] libunwind: backtrace APIs are glibc specific
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:27 -0000

Make backtrace() API's use conditional on glibc
this helps make libunwind compile on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-backtrace-Use-only-with-glibc-and-uclibc.patch | 45 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch
new file mode 100644
index 0000000..9aed419
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch
@@ -0,0 +1,45 @@
+From 04437142399662b576bd55a85485c6dcc14d0812 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2015 06:44:07 +0000
+Subject: [PATCH] backtrace: Use only with glibc and uclibc
+
+backtrace API is glibc specific not linux specific
+so make it behave so.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ tests/test-coredump-unwind.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test-coredump-unwind.c b/tests/test-coredump-unwind.c
+index 5254708..8767b42 100644
+--- a/tests/test-coredump-unwind.c
++++ b/tests/test-coredump-unwind.c
+@@ -57,7 +57,9 @@
+ #include <grp.h>
+ 
+ /* For SIGSEGV handler code */
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <sys/ucontext.h>
+ 
+ #include <libunwind-coredump.h>
+@@ -238,11 +240,11 @@ void handle_sigsegv(int sig, siginfo_t *info, void *ucontext)
+ 			ip);
+ 
+   {
++#ifdef __GLIBC__
+     /* glibc extension */
+     void *array[50];
+     int size;
+     size = backtrace(array, 50);
+-#ifdef __linux__
+     backtrace_symbols_fd(array, size, 2);
+ #endif
+   }
+-- 
+2.6.4
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index aa62bcc..7df9f5e 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -7,6 +7,7 @@ SRC_URI += "\
     file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
     file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
     file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
+    file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
 "
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
2.7.0


