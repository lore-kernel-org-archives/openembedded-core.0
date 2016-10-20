Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A891C60620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 01:00:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 128so3840242pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=daYo5yUgwt2Z6mvzbawjS1mNcl8mS+9q3/0gXtqqpuY=;
	b=YPKHu1WgpavRu4z2E9pS0UxiN5liuNJNXYmW6ExnfR8qcyqj5zazANIn+dKaQnSHxU
	Baad8pYkAbogbYyScu2jkzgP6mFfEM3lNvM4qQGX22AhcgAre8unCkTpdwnVea5QFDCW
	/UVl0kdCpu+d06BYysw44iz9mKzYWGRQUYNYdpdz3j+009uf9akTWSVv8bx+aNumZEEh
	yIaxZAlQUVw8v5CKKUZslHoVZxGDBHQYp8j10drwnvzigkLfjDXMfaIPKrq4If6Nvx5R
	wzHzv6Md/aZ80uSkL+zIQTwqxuqqSLZxSdkMNJoEKzhCtqMzv6wF82OkLwqEe4Pl5UzH
	DFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=daYo5yUgwt2Z6mvzbawjS1mNcl8mS+9q3/0gXtqqpuY=;
	b=VJewziSt9jJzQAPmunwj0U8+29GK23F8uaOGB+s6X5BduDnAzdSZPOiprcZWEjTGvl
	olWm7IGl4ptDDdO9OcPvbwuOkXM56t7SpQARGDdt0aa90kJTVjKFOEWPm/x5cX8R9qij
	ehhGCvmV6Tew1H5Dw3hRPsHYmtv8USxWakjW5KA65uoJU60TXaof/QNM0Ex0eG+Ofq42
	vlBOE4S/za8eJD2HyBz821YuO3HUG7xzIrpGvG7RNWAxLd2cOESAgp1l8d4ayAJqMvdS
	QVFLcnjn2MCep1TkJmUQzRYqA72My0h6nhHovmAJQFy7kYXYA34absbayiv5ty8slEns
	CAxw==
X-Gm-Message-State: AA6/9RkoP/ISOk3DDRTNVRj0xvihyxdCaNNEpttlbfWAkj+hqE1Uw5fB8saCJ5iV2sH3Rg==
X-Received: by 10.98.80.2 with SMTP id e2mr16432687pfb.183.1476925248363;
	Wed, 19 Oct 2016 18:00:48 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	a23sm66507591pfc.59.2016.10.19.18.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Oct 2016 18:00:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Wed, 19 Oct 2016 18:00:46 -0700
Message-Id: <1476925246-21514-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][morty][krogoth][PATCH] musl: Security fix CVE-2016-8859
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
X-List-Received-Date: Thu, 20 Oct 2016 01:00:47 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-8859: TRE & musl libc regex integer overflows in buffer size computations

Affects musl <= 1.1.15

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/musl/files/CVE-2016-8859.patch | 79 ++++++++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb               |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/musl/files/CVE-2016-8859.patch

diff --git a/meta/recipes-core/musl/files/CVE-2016-8859.patch b/meta/recipes-core/musl/files/CVE-2016-8859.patch
new file mode 100644
index 0000000..82da86f
--- /dev/null
+++ b/meta/recipes-core/musl/files/CVE-2016-8859.patch
@@ -0,0 +1,79 @@
+From c3edc06d1e1360f3570db9155d6b318ae0d0f0f7 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Thu, 6 Oct 2016 18:34:58 -0400
+Subject: [PATCH] fix missing integer overflow checks in regexec buffer size
+ computations
+
+most of the possible overflows were already ruled out in practice by
+regcomp having already succeeded performing larger allocations.
+however at least the num_states*num_tags multiplication can clearly
+overflow in practice. for safety, check them all, and use the proper
+type, size_t, rather than int.
+
+also improve comments, use calloc in place of malloc+memset, and
+remove bogus casts.
+
+Upstream-Status: Backport
+CVE: CVE-2016-8859
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/regex/regexec.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/src/regex/regexec.c b/src/regex/regexec.c
+index 16c5d0a..dd52319 100644
+--- a/src/regex/regexec.c
++++ b/src/regex/regexec.c
+@@ -34,6 +34,7 @@
+ #include <wchar.h>
+ #include <wctype.h>
+ #include <limits.h>
++#include <stdint.h>
+ 
+ #include <regex.h>
+ 
+@@ -206,11 +207,24 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
+ 
+   /* Allocate memory for temporary data required for matching.	This needs to
+      be done for every matching operation to be thread safe.  This allocates
+-     everything in a single large block from the stack frame using alloca()
+-     or with malloc() if alloca is unavailable. */
++     everything in a single large block with calloc(). */
+   {
+-    int tbytes, rbytes, pbytes, xbytes, total_bytes;
++    size_t tbytes, rbytes, pbytes, xbytes, total_bytes;
+     char *tmp_buf;
++
++    /* Ensure that tbytes and xbytes*num_states cannot overflow, and that
++     * they don't contribute more than 1/8 of SIZE_MAX to total_bytes. */
++    if (num_tags > SIZE_MAX/(8 * sizeof(int) * tnfa->num_states))
++      goto error_exit;
++
++    /* Likewise check rbytes. */
++    if (tnfa->num_states+1 > SIZE_MAX/(8 * sizeof(*reach_next)))
++      goto error_exit;
++
++    /* Likewise check pbytes. */
++    if (tnfa->num_states > SIZE_MAX/(8 * sizeof(*reach_pos)))
++      goto error_exit;
++
+     /* Compute the length of the block we need. */
+     tbytes = sizeof(*tmp_tags) * num_tags;
+     rbytes = sizeof(*reach_next) * (tnfa->num_states + 1);
+@@ -221,10 +235,9 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
+       + (rbytes + xbytes * tnfa->num_states) * 2 + tbytes + pbytes;
+ 
+     /* Allocate the memory. */
+-    buf = xmalloc((unsigned)total_bytes);
++    buf = calloc(total_bytes, 1);
+     if (buf == NULL)
+       return REG_ESPACE;
+-    memset(buf, 0, (size_t)total_bytes);
+ 
+     /* Get the various pointers within tmp_buf (properly aligned). */
+     tmp_tags = (void *)buf;
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index c07101b..1ee56b6 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -11,6 +11,7 @@ PV = "1.1.15+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
+           file://CVE-2016-8859.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


