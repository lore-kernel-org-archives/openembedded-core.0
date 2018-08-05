Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 91573783DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:07:18 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id u11-v6so4164598plq.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 19:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TrlrUg2UowJvSfZnehB4rlVnIG8bwI/heFpJZ6gnXZg=;
	b=YJBUJ/WAZPFrmhCB9sEtxBPvF4dUHIH+3KM5xV9iJHskNmaeNXtbvLKQ85LpiFF9y7
	ZouEwmYJ3DoDGR6mlCyUtfoWW+l4zmC29WIrk28NRzFpJUTW5GWK9EZ9R6J/3wE32uOz
	5boam5Eqw37CmbFedmXFcMjl7YcSPKPic5pftnE9CSxIDGjBdWSndrzmivba39Y6BwgD
	ic2bh7thtOXONlflN6unQpV+bcXcmJs0FzGH9PvPh0N12Mkfy9EuDYLXzMgIx9dQQQ8I
	FPRF9ACk6j7uyhNXxGJpf2CAx8BFWEzOKZmnn0OmKXYVpN+ZBFPTNv3ax8Dpv5fhLigz
	cfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TrlrUg2UowJvSfZnehB4rlVnIG8bwI/heFpJZ6gnXZg=;
	b=D6a1xdNG1UVKS4m/2T+E/+Kz5UgeZnElZ/jqAF/TKU3R1SnzpN4CHeWyAeU9Zubk3a
	liuwSa+CiN82rW5qxOoPGyj8gaGT9xo+WZD9uChejWYI8bpuExDNJ3AcXH6iPjIvf5KB
	AFZNYsrg7CAOLYAC9tXh9d+EeRUCSvHVfGLoFUuKL7nTMPe2wtydRIa1uGSfHTLE0uNW
	TGi8rq97t49jC7Nxk5JqFvHu/TxMb5v2ksjZutY32fP+iIzFpOkB+ZDpivGwYA2q5A8p
	lKjh7hXyN7sF+YtfaZLnyOD3g9WkOvJfTv/PA343CKrPOieqbsmYBX7FBgPRObPomrau
	x5Xg==
X-Gm-Message-State: AOUpUlEfSfmGn4HIbIpFecrBwjRGr7pDnd7qUajsLiY7H4BaK2oayiGn
	MA0bdkbQaMOgwz+l3/kyT9YIjcZe
X-Google-Smtp-Source: AAOMgpdSb8kAvjaW4UVkMXcGPxgsOJMVV2gJHIkYtiDvtZ0rh8+FTU5bPyvkJVje3l+Q5CggsYLd8A==
X-Received: by 2002:a17:902:b609:: with SMTP id
	b9-v6mr8899534pls.321.1533434839190; 
	Sat, 04 Aug 2018 19:07:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	b195-v6sm4486021pfb.2.2018.08.04.19.07.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 19:07:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Aug 2018 19:07:00 -0700
Message-Id: <3257c4ab40a5ed8f6df7fa7273c02939fb27ac75.1533434674.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] strace: Fix build with glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 02:07:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-tests-Include-linux-stat.h.patch     | 76 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.23.bb   |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch b/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
new file mode 100644
index 0000000000..cbb9c60de7
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
@@ -0,0 +1,76 @@
+From 264889246fcdd486867e8ca923094afa1689126c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 4 Aug 2018 13:18:03 -0700
+Subject: [PATCH] tests: Include linux/stat.h
+
+Starting with glibc 2.28, sys/stat.h header will have the
+definition for struct statx, in which case including  linux/stat.h should be
+avoided, in order to prevent a duplicate definition.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2018-August/008329.html]
+ tests-m32/statx.c  | 7 +++++++
+ tests-mx32/statx.c | 8 +++++++-
+ tests/statx.c      | 8 +++++++-
+ 3 files changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/tests-m32/statx.c b/tests-m32/statx.c
+index 816b7eb..7364a02 100644
+--- a/tests-m32/statx.c
++++ b/tests-m32/statx.c
+@@ -30,6 +30,13 @@
+ 
+ #ifdef __NR_statx
+ 
++# if defined(__GLIBC__)
++#  if !__GLIBC_PREREQ(2,28)
++#   include <linux/stat.h>
++#  endif
++# else
++#  include <linux/stat.h>
++# endif
+ # include <linux/stat.h>
+ # include "xlat.h"
+ # include "xlat/statx_masks.h"
+diff --git a/tests-mx32/statx.c b/tests-mx32/statx.c
+index 816b7eb..e9f9993 100644
+--- a/tests-mx32/statx.c
++++ b/tests-mx32/statx.c
+@@ -30,7 +30,13 @@
+ 
+ #ifdef __NR_statx
+ 
+-# include <linux/stat.h>
++# if defined(__GLIBC__)
++#  if !__GLIBC_PREREQ(2,28)
++#   include <linux/stat.h>
++#  endif
++# else
++#  include <linux/stat.h>
++# endif
+ # include "xlat.h"
+ # include "xlat/statx_masks.h"
+ # include "xlat/statx_attrs.h"
+diff --git a/tests/statx.c b/tests/statx.c
+index 816b7eb..e9f9993 100644
+--- a/tests/statx.c
++++ b/tests/statx.c
+@@ -30,7 +30,13 @@
+ 
+ #ifdef __NR_statx
+ 
+-# include <linux/stat.h>
++# if defined(__GLIBC__)
++#  if !__GLIBC_PREREQ(2,28)
++#   include <linux/stat.h>
++#  endif
++# else
++#  include <linux/stat.h>
++# endif
+ # include "xlat.h"
+ # include "xlat/statx_masks.h"
+ # include "xlat/statx_attrs.h"
+-- 
+2.18.0
+
diff --git a/meta/recipes-devtools/strace/strace_4.23.bb b/meta/recipes-devtools/strace/strace_4.23.bb
index 0c159fc6f6..d966a77b89 100644
--- a/meta/recipes-devtools/strace/strace_4.23.bb
+++ b/meta/recipes-devtools/strace/strace_4.23.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
+           file://0001-tests-Include-linux-stat.h.patch \
            "
 SRC_URI[md5sum] = "fad4bba0947553cef34d46a9fd78f039"
 SRC_URI[sha256sum] = "7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad"
-- 
2.18.0


