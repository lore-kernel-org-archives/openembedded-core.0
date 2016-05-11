Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E6F887317D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:02 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r187so5033056pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=l3jJymM/FvOFZDNThNkvBJ/ThpuVJvynl0hORqWo878=;
	b=HtpSKIDwKXAqsP5/vA8yEpbyrE4FWFGohMQWZX6zWMsMlA5iNPQl2zPf0RbmhzkaI+
	kqaI9OHM/VzJ8pO0B2bEssiqioWbyWZi3D4ETwYwcBjem3BbN/A9KvlQPytWiGtTg+4P
	cvWF+cKghnzOuPbE89uoBIp1zUxzH97Kr90vlKox6evJVEETByRFYJErw9+NEYbbV1q6
	OsOWxpQL8VI8yhAr9xmeF1XS+J7nEjjk0X38GmbOvwgWaT852uYUJz9F1li+Vryf6P6i
	RXy86SWH/hyBOoMi6O1rTRuvQnTTY+Y+mpNf6MrQXU18qWgpm/ntwtzi8ugvFZ9arigD
	9qTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=l3jJymM/FvOFZDNThNkvBJ/ThpuVJvynl0hORqWo878=;
	b=C/1caSnbX6ICgYPeuzGT6y78Lwyf8H4FdxFsNAAScEkU76447H4b6RegvOwQA1SQa+
	JIvnkZsf79DdXTHKf+AhlIIORHdifgFFZXtLK8xRC8aOIU+1zdRXh61StbHHb6dNoLel
	M3tFEEEbdU4QfA6LbwXeT6dusiGNybcycq+9OTrbJ9W5ibCMEvLbBHWnqyNSf04mYZ4Q
	XTmiMtMbFTok+N1mXZYPM/Itcpny/HMtsgmoIN2ZfSP/nMy7MJETBDAyXO51G6uf2ude
	w+3xXNhxjNpJHHdMQ/Zk5GU3XN5CEEff0xDy7belnusrhUj0LI4vqMcRk6jbsprDiBpl
	I/mw==
X-Gm-Message-State: AOPr4FWJyNjN8r+u59Um2d/TWYuEpVB6xo6dWmucnT1pIXhtXuyURMYTfr8mLm/DJzTPhA==
X-Received: by 10.98.67.7 with SMTP id q7mr6779769pfa.70.1462988163693;
	Wed, 11 May 2016 10:36:03 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:12 -0700
Message-Id: <f11aa3646ec9480dea3247215539f8a2ff919227.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 09/42] oprofile: Fix with gcc6
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
X-List-Received-Date: Wed, 11 May 2016 17:36:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |  4 +-
 .../0001-Fix-FTBFS-problem-with-GCC-6.patch        | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index cf3ad43..96ef43d 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -24,7 +24,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://oprofile-cross-compile-tests.patch \
            file://run-ptest \
            file://root-home-dir.patch \
-           file://0001-Add-rmb-definition-for-NIOS2-architecture.patch"
+           file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
+           file://0001-Fix-FTBFS-problem-with-GCC-6.patch \
+"
 
 SRC_URI_append_libc-musl = " file://musl.patch"
 
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
new file mode 100644
index 0000000..d372fd5
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
@@ -0,0 +1,51 @@
+From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
+From: William Cohen <wcohen@redhat.com>
+Date: Fri, 5 Feb 2016 17:30:19 -0500
+Subject: [PATCH] Fix FTBFS problem with GCC-6
+
+GCC-6 is pickier about some of the type conversions causing the Fedora
+24 mass rebuild the build of oprofile failed with:
+
+make[3]: Entering directory '/builddir/build/BUILD/oprofile-1.1.0/libutil++'
+g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m32 -march=i686 -mtune=atom -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp
+op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_index_t, long long unsigned int&, long long unsigned int&) const':
+op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka std::basic_ostream<char>}' to 'const bool' in initialization
+  bool const verbose = cverb << (vbfd & vlevel1);
+                                               ^
+op_bfd.cpp:546:7: error: in argument to unary !
+  if (!verbose)
+       ^~~~~~~
+
+Avoid the intermediate bool type to make GCC-6 happy.
+
+Signed-off-by: William Cohen <wcohen@redhat.com>
+---
+Upstream-Status: Backport
+
+ libutil++/op_bfd.cpp | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
+index 389c920..f2eb42b 100644
+--- a/libutil++/op_bfd.cpp
++++ b/libutil++/op_bfd.cpp
+@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t sym_idx,
+ {
+ 	op_bfd_symbol const & sym = syms[sym_idx];
+ 
+-	bool const verbose = cverb << (vbfd & vlevel1);
+-
+ 	if (anon_obj)
+ 		start = sym.vma();
+ 	else
+ 		start = sym.filepos();
+ 	end = start + sym.size();
+ 
+-	if (!verbose)
++	if (!(cverb << (vbfd & vlevel1)))
+ 		return;
+ 
+ 	io_state state(cverb << (vbfd & vlevel1));
+-- 
+1.9.1
+
-- 
2.8.2


