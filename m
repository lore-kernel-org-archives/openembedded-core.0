Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 91D2173200
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:06:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 144so6767963pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 19:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ef856c8S9thYqRjfqf+HVRC38YB94CP3mxy7CevO1Lo=;
	b=U4QUdR+WWPQT73odwgDF+FPTmdhdBraFWZ0ky0bViXQ85Gi/W0bHmHA6sy4smPK+ws
	BACDljW0KF4iYz8LCsyJsMlfwFJ1KmRxHXd7SEu6gxgyI3FPBbDeEgMy98p4JiuGPJk6
	80IvJEtDu90gbRONAsM6mMlo89RKou2AdZnfhce2OSBNfLjN/ESLFlSR6a3pduWoapJh
	REYDphsQC4W3T3nutxHTfnntJlJ5g6Jr1kNGEdj3ryNV9MeBKIVVqv1Ygxi3xer+fjPO
	XRZU6Rx9Yz0ew8KptflYGiM6CzIn57MTEttnjIbYZ20zHmmI5LldXoJBlqMwgS8iXBwc
	MVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ef856c8S9thYqRjfqf+HVRC38YB94CP3mxy7CevO1Lo=;
	b=ne2pnCo98A1I3l8hR1uY2uGuRXi5cRdcgzwDYwKjw0dbMQqNaH4gJaAHP9ZQeh6AV1
	4fYKUyskk4gc03J168hiBFjS0BVmkqX2E/Za6+XfklUxyTjw4E5hEwJXf9ywMcnOwakr
	HrMLWf1g4c6NTUqRjEHhqFgRTNgq29+Y6I8DCALknDWVAZNvYfVhcGArUhyUgB+6VIFY
	RD3roi5XwXw01zmG6GCqSA1n9z6L+qFNHepkeHsQCkkSnxGbwYToODHH2Wv5VAu+hQE9
	zoRGuRNbSN+IgBE7yuOGP/7daHrLQiNJN4mgRHKAVXdDTde98thCLHBqakJeJTkyEdt6
	p2YA==
X-Gm-Message-State: AKaTC007IPDHCyPA1ljlyQ0xkcvk+k1Th+Eb9OdopwrCe3c40gei4/+zXyHPhMxVbfKi0A==
X-Received: by 10.98.8.84 with SMTP id c81mr12969144pfd.114.1482116777616;
	Sun, 18 Dec 2016 19:06:17 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	65sm26830276pfn.12.2016.12.18.19.06.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 19:06:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 19:05:58 -0800
Message-Id: <20161219030600.1284-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219030600.1284-1-raj.khem@gmail.com>
References: <20161219030600.1284-1-raj.khem@gmail.com>
Subject: [PATCH 6/8] pax: Fix build with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 03:06:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-sysmacros.h-for-major-minor-definitions.patch | 71 ++++++++++++++++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch

diff --git a/meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch b/meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
new file mode 100644
index 0000000000..c9752e40fc
--- /dev/null
+++ b/meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
@@ -0,0 +1,71 @@
+From 7f4f379f8343c0ce92aa30f3f9037288a089a902 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Dec 2016 08:24:56 +0000
+Subject: [PATCH] include <sys/sysmacros.h> for major/minor definitions
+
+glibc 2.25 will error out if the applications are expecting
+this to come from sys/types.h, it is being removed from
+there.
+
+Fixes
+
+error: In the GNU C Library, "minor" is defined
+|  by <sys/sysmacros.h>. For historical compatibility, it is
+|  currently defined by <sys/types.h> as well, but we plan to
+|  remove this soon. To use "minor", include <sys/sysmacros.h>
+|  directly. If you did not intend to use a system-defined macro
+|  "minor", you should undefine it after including <sys/types.h>. [-Werror]
+|        ul_oct ((u_long) MINOR (arcn->sb.st_rdev), hd->devminor,
+|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/cpio.c     | 2 +-
+ src/gen_subs.c | 2 +-
+ src/tar.c      | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cpio.c b/src/cpio.c
+index ed4dc48..ba2f14a 100644
+--- a/src/cpio.c
++++ b/src/cpio.c
+@@ -36,7 +36,7 @@
+ #include "config.h"
+ #endif
+ 
+-#include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
+ #include <sys/param.h>
+diff --git a/src/gen_subs.c b/src/gen_subs.c
+index 1898125..f9acbce 100644
+--- a/src/gen_subs.c
++++ b/src/gen_subs.c
+@@ -37,7 +37,7 @@
+ #include "config.h"
+ #endif
+ 
+-#include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
+ #include <sys/param.h>
+diff --git a/src/tar.c b/src/tar.c
+index aa11cd2..24d2c4a 100644
+--- a/src/tar.c
++++ b/src/tar.c
+@@ -37,7 +37,7 @@
+ #include "config.h"
+ #endif
+ 
+-#include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
+ #include <sys/param.h>
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index 9d1abfbb54..9b4e17b3df 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -16,7 +16,9 @@ DEPENDS_append_libc-musl = " fts "
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.bz2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
 	file://fix_for_compile_with_gcc-4.6.0.patch \
-	file://pax-3.4_fix_for_x32.patch"
+	file://pax-3.4_fix_for_x32.patch \
+        file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
+"
 
 SRC_URI_append_libc-musl = " file://0001-Fix-build-with-musl.patch \
                              file://0001-use-strtoll-instead-of-strtoq.patch \
-- 
2.11.0


