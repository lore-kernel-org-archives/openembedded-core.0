Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C48C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:50:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18252.1752659428062940721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20D6212FC
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 02:50:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D8A53F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 02:50:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ccache: move environment variables to the configuration file
Date: Wed, 16 Jul 2025 10:49:54 +0100
Message-ID: <20250716094954.866783-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220443

Move some environment variables to the configuration file, so there's
less happening in the class.

Some changes were made as part of the move:
- max_size was removed so that the per-recipe caches don't grown without
  limit. The default cache is 5GB.
- compiler_check was extended to check both the specs and the version,
  so that a version change that doesn't affect the specs will still mean
  a recompile.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/ccache.bbclass | 13 -------------
 meta/conf/ccache.conf       | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 2d6a3ea7229..5ce23e50f34 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -42,23 +42,10 @@ CCACHE_NATIVE_RECIPES_ALLOWED ?=3D ""
 # in different builds.
 export CCACHE_BASEDIR ?=3D "${TMPDIR}"
=20
-# Used for sharing cache files after compiler is rebuilt
-export CCACHE_COMPILERCHECK ?=3D "%compiler% -dumpspecs"
-
 export CCACHE_CONFIGPATH ?=3D "${COREBASE}/meta/conf/ccache.conf"
=20
 export CCACHE_DIR ?=3D "${CCACHE_TOP_DIR}/${MULTIMACH_TARGET_SYS}/${PN}"
=20
-# Fixed errors:
-# ccache: error: Failed to create directory /run/user/0/ccache-tmp: Perm=
ission denied
-export CCACHE_TEMPDIR ?=3D "${CCACHE_DIR}/tmp"
-
-# We need to stop ccache considering the current directory or the
-# debug-prefix-map target directory to be significant when calculating
-# its hash. Without this the cache would be invalidated every time
-# ${PV} or ${PR} change.
-export CCACHE_NOHASHDIR ?=3D "1"
-
 python() {
     """
     Enable ccache for the recipe
diff --git a/meta/conf/ccache.conf b/meta/conf/ccache.conf
index 499e5327b8c..ea658708a1f 100644
--- a/meta/conf/ccache.conf
+++ b/meta/conf/ccache.conf
@@ -1,7 +1,18 @@
-max_size =3D 0
-
 # Avoid spurious cache misses caused by recipe sysroot creation: Creatin=
g a
 # recipe sysroot hardlinks all dependent files into place. Hardlinking u=
pdates
 # the file's ctime which in turn interferes with ccache's include_file_c=
time
 # check.
 sloppiness =3D include_file_ctime
+
+# Only rebuild if the compiler version or specs have changed, as we rebu=
ild
+# compilers more than is usual.
+compiler_check =3D %compiler% -dumpversion; %compiler% -dumpspecs
+
+# We need to stop ccache considering the current directory or the
+# debug-prefix-map target directory to be significant when calculating
+# its hash. Without this the cache would be invalidated every time
+# ${PV} or ${PR} change.
+hash_dir =3D false
+
+# If ccache runs under pseudo it will try to create files in /run/user/0=
/ccahe-tmp
+temporary_dir =3D $CCACHE_DIR/tmp
--=20
2.43.0


