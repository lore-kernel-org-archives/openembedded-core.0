Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D679731C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:43 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id y89so1752647qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=v7x85m0fBc5pbUq4bB9DKcXeFoQWfJSNkPxYHA5btBk=;
	b=psy1x98rpaoiD35o/y/L5hqIWw9GOYWV6OmLIgiDrvX/0uXRRzFAYhZoRxrDB2Byn7
	dtg/NjcTEN3Z1EtwhkLhyzz76WnzKq3NAuNI/gMrkli8tO5S7/tbRR8LZWTW4He2lEEq
	be6CKzsm4o945bnAyYU/NrrNF14dquhas4Cj26O9bObuAXX4ifPv44W0TQo4SaOSyfP8
	nFIYYJjmKObAcTXzEttk7Zstgue20Mc5l6gYyxHpimly0ijrrMT/szuQCRdD5XqwyVnc
	OPudY9tIb1lsNOdt0uZMHRgiA4kj+nHeymOkQjxwyN3bJJAoYpV9Uqf408BckGUBZKtL
	Irpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=v7x85m0fBc5pbUq4bB9DKcXeFoQWfJSNkPxYHA5btBk=;
	b=dvVxoaDfdsd15IBr0wbkb7xO0cN+9lvZoRbbFmNGuiC6VzLh2JFvycZv5+9YCAcFZ3
	kwxvKYtnjXZhdOHVPBbHU42hSAc7EJyhLzkSHvk3BVbXRbHYW7S+v5YpkrXDa34HGvSz
	Dj+jWQ9Cr1mt6sH7Vu+sY/xho9xAwogEMEFQ+ZgEZM27aRPcLqSzlwJmJQRrY3qKpiSn
	c45AytL3oWb2xBXOAEWrzgxSkeE8sWhJDpc4U3+uuxhFi029xWMwhPtKy9heIl1jiax4
	UreR2z+4ENUHENhd4H+5oOuvFfjqPnawn/yvR3kv9X5HYMEQImmuYypbBftNIc7YmD09
	6xeg==
X-Gm-Message-State: AG10YORrprPvkrfjO4oo1VhOcT4jMxyGYlhn5muxXFD4uSaPKbQ2WlMN8YkuGva7QmKQYg==
X-Received: by 10.140.27.139 with SMTP id 11mr50004946qgx.62.1455126224440;
	Wed, 10 Feb 2016 09:43:44 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:34 +0000
Message-Id: <e6d0c2b95f97dfa71815b31fb831d0875eacacbc.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 7/9] gdb: build fix for MIPS + musl libc
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:44 -0000

From: Andre McCurdy <armccurdy@gmail.com>

The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
but not by musl. Regardless of the libc, the kernel headers provide
<asm/sgidefs.h> which provides the same definitions, so use that
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 .../gdb/gdb/0001-use-asm-sgidefs.h.patch           | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 4ea14c1..1dd6551 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -6,6 +6,7 @@ SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
             file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
             file://0001-include-sys-types.h-for-mode_t.patch \
+            file://0001-use-asm-sgidefs.h.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000..eaec390
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
@@ -0,0 +1,35 @@
+From 677b5b56135141c0d259e370aacd0e11c810aa15 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 5 Feb 2016 14:00:00 -0800
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index a36bb63..fd5c705 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -31,7 +31,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include <sys/ptrace.h>
+ #include <asm/ptrace.h>
+ 
+-- 
+1.9.1
+
-- 
2.7.1


