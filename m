Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TYeaa-0007fq-Mq
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:09:16 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so200800dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=txZCAzRuDo3QArAz9rUGZyok3mAQMM2wA6L5zGcKMOM=;
	b=ppKrO/atM9K2T0oD/4vTiBIIxCgtTav0gvaVlJMAE4mp2JWjbUJUBXhEazrjXBvhMF
	y51WSFXha14D35KxBbVmSbzNnm4+2OdoeEW9OjVZfOVDoHVUGxxQRSkjTR2tU+c7+WhA
	uqH4zyHGLnLFOfA+3qAJz3s+7g92CBtecoXK6RAEnnESYUJE2StSCXxUUNJC8V/+C9ZV
	Cl1XUH1oFkRUVIVNyUNdMIdh1yKD5Vs7Bl6t/sjX90f+wTr2sbf7MTv4+Ty6ObNBhi2q
	SKkrsMnxRD/21eCGKjtxqUidRK7a3Kl5xpN8vbGddN/bz1F+WYdGPM7x4DFH83rPJxHO
	9YCQ==
Received: by 10.68.235.2 with SMTP id ui2mr71982872pbc.163.1352904920398;
	Wed, 14 Nov 2012 06:55:20 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id ue7sm7842719pbc.53.2012.11.14.06.55.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 06:55:19 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 07:55:09 -0700
Message-Id: <1352904909-28460-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] bash: fix mkbuiltins build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 15:09:17 -0000

From: Christopher Larson <chris_larson@mentor.com>

On hosts with FORTIFY_SOURCES, stringize support is required, as it's used by
the macros to wrap functions (e.g. read and open in unistd.h). Those wrappers
use the STRING() macro from unistd.h. A header in the bash sources overrides
the unistd.h macro to 'x' when HAVE_STRINGIZE is not defined, causing the
wrappers to generate calls to 'xread' and 'xopen', which do not exist,
resulting in a failure to link.

Assume we have stringize support when cross-compiling, which works around the
issue.

It may be best for upstream to either give up on supporting compilers without
stringize support, or to not define STRING() at all when FORTIFY_SOURCES is
defined, letting the unistd.h one be used, instead.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../bash/bash-4.2/mkbuiltins_have_stringize.patch  | 26 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.2.bb             |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/mkbuiltins_have_stringize.patch

diff --git a/meta/recipes-extended/bash/bash-4.2/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash-4.2/mkbuiltins_have_stringize.patch
new file mode 100644
index 0000000..a9391d6
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/mkbuiltins_have_stringize.patch
@@ -0,0 +1,26 @@
+On hosts with FORTIFY_SOURCES, stringize support is required, as it's used by
+the macros to wrap functions (e.g. read and open in unistd.h). Those wrappers
+use the STRING() macro from unistd.h. A header in the bash sources overrides
+the unistd.h macro to 'x' when HAVE_STRINGIZE is not defined, causing the
+wrappers to generate calls to 'xread' and 'xopen', which do not exist,
+resulting in a failure to link.
+
+Assume we have stringize support when cross-compiling, which works around the
+issue.
+
+It may be best for upstream to either give up on supporting compilers without
+stringize support, or to not define STRING() at all when FORTIFY_SOURCES is
+defined, letting the unistd.h one be used, instead.
+
+Upstream-Status: Pending
+
+--- bash-4.2.orig/builtins/mkbuiltins.c
++++ bash-4.2/builtins/mkbuiltins.c
+@@ -28,6 +28,7 @@
+ #  define HAVE_STDLIB_H
+
+ #  define HAVE_RENAME
++#  define HAVE_STRINGIZE
+ #endif /* CROSS_COMPILING */
+
+ #if defined (HAVE_UNISTD_H)
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 5a0f015..07dda09 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -4,7 +4,7 @@ require bash.inc
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-009;apply=yes;striplevel=0;name=patch009 \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=yes;striplevel=0;name=patch010 \
            file://execute_cmd.patch;striplevel=0 \
+           file://mkbuiltins_have_stringize.patch \
            "
 
 SRC_URI[tarball.md5sum] = "3fb927c7c33022f1c327f14a81c0d4b0"
-- 
1.7.12.4



