Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601CBC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:20:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.731.1753374058303092455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 09:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ADF71A00
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:20:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 797833F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:20:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] ccache: move environment variables to the configuration file
Date: Thu, 24 Jul 2025 17:20:53 +0100
Message-ID: <20250724162054.2265319-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220849

Move some environment variables to the configuration file, so there's
less happening in the class.

Max_size was removed so that the per-recipe caches don't grown without
limit. The default cache is 5GB.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/ccache.bbclass | 10 ----------
 meta/conf/ccache.conf       | 11 +++++++++--
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 262db6672cf..7c42e66bdf4 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -44,16 +44,6 @@ export CCACHE_CONFIGPATH ?=3D "${COREBASE}/meta/conf/c=
cache.conf"
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
index 499e5327b8c..377eb421969 100644
--- a/meta/conf/ccache.conf
+++ b/meta/conf/ccache.conf
@@ -1,7 +1,14 @@
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
+# We need to stop ccache considering the current directory or the
+# debug-prefix-map target directory to be significant when calculating
+# its hash. Without this the cache would be invalidated every time
+# ${PV} or ${PR} change.
+hash_dir =3D false
+
+# If ccache runs under pseudo it will try to create files in /run/user/0=
/ccache-tmp
+temporary_dir =3D $CCACHE_DIR/tmp
--=20
2.43.0


