Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id A7A9B77E44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:16 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id f6so7588618pln.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+7i6SLl5LWUf//fK/aXHpVdewdj5Idoymg97+16hkjg=;
	b=E2FAulOM6Z1sNF/RIzbB3T2v2lj40tzWqlNmyqyvuHoqYn6HG2CpQCAUmFmjqGMETb
	w/4WOOnEPuuEuKQKK+ZVuvkfOmgK3EbONqDiozi3SFesAa4eZxUEXjZ/k24JkvSlUIIo
	ntzICiuDLKbiPet0N4kKmkHAk/nIv1zexpiYRASJ/KQz6fPQNV9z1pV6DuYsF1wfMK1O
	F5BI73YQNg8unZs7VzHOwkccEb8LkIlZK0HxzSuraNcTaDHfckXDK0lG4AneYgIfedVw
	LdPpj82H2tND5tyxuLsq2hzR2gntSltr9q1E+bOxOfdyUg432zKezsjAYE9CbDH+2CEt
	Bouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+7i6SLl5LWUf//fK/aXHpVdewdj5Idoymg97+16hkjg=;
	b=ln8Lm6psMLsSOGKELMQmYzFsZ0KKO9VuL0rTlaCKvhepfWhWaqmxNxiYQgpMDw5bxZ
	Q+qnTUo/RsWbj5yu2QVdvtvlyGAKee74yYrlr7VfqmU93jB4VX3WWi/LXaqdsHkakNjR
	IBDkbyyuYgQ4OYm1bLdUeFcGAFof0E4oFTucYpByevjojJZXCGlPnTCr6bavWVlxgYE3
	PE2B8gMLBUxgCtzURlZ84/34UNAnPawFVO3o1TJIhDOrZKqKQpSvL8cyu45/jmYFXL+D
	08FQLXJJ/CZpm3DQYQwJXoUH42Kg7vYxvJz6w/c595cDLEiJaueqFuZkeqTQEjcw+EHU
	rHrg==
X-Gm-Message-State: AJaThX7rLf8Pt+s2/SrKm//AnlW2I5gYz8ZZg5CsArw1LzXc9a5MGPzT
	Yme4a2gNz0RxEmSuA1dtrYI=
X-Google-Smtp-Source: AGs4zMaMOVf14FSBOL41WVO3HTiPDuW+xL+CXiUBmLA6gWEPncNBvjeoCV8KczAyTQUF+zIKLUBivQ==
X-Received: by 10.84.172.1 with SMTP id m1mr37112455plb.345.1511750118322;
	Sun, 26 Nov 2017 18:35:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:51 -0800
Message-Id: <1511750112-2263-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 05/26] binutls: Security fix CVE-2017-8395
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:17 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-8395.patch          | 72 ++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8395.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 8334a4c..8c91f4c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -47,6 +47,7 @@ SRC_URI = "\
      file://CVE-2017-7614.patch \
      file://CVE-2017-8393.patch \
      file://CVE-2017-8394.patch \
+     file://CVE-2017-8395.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-8395.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-8395.patch
new file mode 100644
index 0000000..0a9bce3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-8395.patch
@@ -0,0 +1,72 @@
+From e63d123268f23a4cbc45ee55fb6dbc7d84729da3 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 26 Apr 2017 13:07:49 +0100
+Subject: [PATCH] Fix seg-fault attempting to compress a debug section in a
+ corrupt binary.
+
+	PR binutils/21431
+	* compress.c (bfd_init_section_compress_status): Check the return
+	value from bfd_malloc.
+
+Upstream-Status: Backport
+CVE: CVE-2017-8395
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog  |  6 ++++++
+ bfd/compress.c | 19 +++++++++----------
+ 2 files changed, 15 insertions(+), 10 deletions(-)
+
+Index: git/bfd/compress.c
+===================================================================
+--- git.orig/bfd/compress.c
++++ git/bfd/compress.c
+@@ -542,7 +542,6 @@ bfd_init_section_compress_status (bfd *a
+ {
+   bfd_size_type uncompressed_size;
+   bfd_byte *uncompressed_buffer;
+-  bfd_boolean ret;
+ 
+   /* Error if not opened for read.  */
+   if (abfd->direction != read_direction
+@@ -558,18 +557,18 @@ bfd_init_section_compress_status (bfd *a
+   /* Read in the full section contents and compress it.  */
+   uncompressed_size = sec->size;
+   uncompressed_buffer = (bfd_byte *) bfd_malloc (uncompressed_size);
++  /* PR 21431 */
++  if (uncompressed_buffer == NULL)
++    return FALSE;
++
+   if (!bfd_get_section_contents (abfd, sec, uncompressed_buffer,
+ 				 0, uncompressed_size))
+-    ret = FALSE;
+-  else
+-    {
+-      uncompressed_size = bfd_compress_section_contents (abfd, sec,
+-							 uncompressed_buffer,
+-							 uncompressed_size);
+-      ret = uncompressed_size != 0;
+-    }
++    return FALSE;
+ 
+-  return ret;
++  uncompressed_size = bfd_compress_section_contents (abfd, sec,
++						     uncompressed_buffer,
++						     uncompressed_size);
++  return uncompressed_size != 0;
+ }
+ 
+ /*
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2017-04-26  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21431
++       * compress.c (bfd_init_section_compress_status): Check the return
++       value from bfd_malloc.
+ 
+ 2017-04-23  Alan Modra  <amodra@gmail.com>
+        PR 21414
-- 
2.7.4


