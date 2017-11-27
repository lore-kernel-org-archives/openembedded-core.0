Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B0E1077E18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:20 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id s75so18045922pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FIgYdZ9oqIouNLOhUjdz8HjwTSQjiyZTTO9utXGxC40=;
	b=F3HyIPIOQiLShLzk4CkmCNZzjGWRHfxIrf7kOgi6oiZRYF6xwKJDDoYplJgstppmCK
	RgDsxOv1+t+iQZbNvK0JWj3BS15SyBF+0O6Ia8tdVBs8WWqV1wjqEimcZcqV0pkZ48bU
	JO4auuk4M3/GHdzkXuP5vCG47HtfQV2apuUp9ZHg1d62+5JUrHsjMZBWOxTe2qI8o9N9
	Oj+tooJnMX8Fqb0D3vg/sfLiuUNzoq/da2yZ2t3tSyE4lRUPWj0h3VwhyU153kpLQFJd
	dofaeo0nu/8Te8w7Mfw+70QmVYWNjX4DsQBg+MzjfDinTN49y9wXa6I0Li1OEMAPQfml
	G5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FIgYdZ9oqIouNLOhUjdz8HjwTSQjiyZTTO9utXGxC40=;
	b=ilblyiEsLDU8yWhMxu/FsS7bOSLcGJNz2BROLUBsDRoC3l1AxVzfYbv120Oen2tjCW
	nPjlVXUd/UcotbDckdPAmfuzmldDtnuyJRPdeCIa5If8sN/YBql3TnBXPyzqFAtfLdEt
	MfWgu/KTEwS1T/XGvXrXO4Wgmf+sf2aRbe0wxwuF8kLiieWqLwNn+V3vVc7lEdYYgbhr
	yCRHotnDkZZgY9h4GXnc1PKRKYKyuemc+17VO8bVjAq13jYw1xXgNuylujyEzp2l78C5
	w8nG6cs+I8TTR5ysF7ssNC0OtuoRgRZqNeRdxwMrj5jnp9+1lr5BFZSBYe3FXYFVPQ/5
	ih9g==
X-Gm-Message-State: AJaThX4t03OSindquYHlVwwmYta30qHpg++x/GU/nT/YiPPgbbebf4rY
	l5/069eMCSKzHL8rK2iolekGJA==
X-Google-Smtp-Source: AGs4zMbeQNzeRXNWvRYPhDS3yfbkitI8YnYL4Okw/miUrvysf4K8z+WGy0Eh0vWP97IQMVSEvFsXmA==
X-Received: by 10.98.178.17 with SMTP id x17mr32454191pfe.239.1511750122180;
	Sun, 26 Nov 2017 18:35:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:55 -0800
Message-Id: <1511750112-2263-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 09/26] binutils: Security fix for CVE-2017-9038 and CVE-2017-9044
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:20 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9038_9044.patch     | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9038_9044.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 5b6270a..377165a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -51,6 +51,7 @@ SRC_URI = "\
      file://CVE-2017-8396_8397.patch \
      file://CVE-2017-8398.patch \
      file://CVE-2017-8421.patch \
+     file://CVE-2017-9038_9044.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9038_9044.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9038_9044.patch
new file mode 100644
index 0000000..535efc3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9038_9044.patch
@@ -0,0 +1,51 @@
+From f32ba72991d2406b21ab17edc234a2f3fa7fb23d Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Apr 2017 11:01:45 +0100
+Subject: [PATCH] readelf: Update check for invalid word offsets in ARM unwind
+ information.
+
+	PR binutils/21343
+	* readelf.c (get_unwind_section_word): Fix snafu checking for
+	invalid word offsets in ARM unwind information.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9038
+CVE: CVE-2017-9044
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 6 ++++++
+ binutils/readelf.c | 6 +++---
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+Index: git/binutils/readelf.c
+===================================================================
+--- git.orig/binutils/readelf.c
++++ git/binutils/readelf.c
+@@ -7972,9 +7972,9 @@ get_unwind_section_word (struct arm_unw_
+     return FALSE;
+ 
+   /* If the offset is invalid then fail.  */
+-  if (word_offset > (sec->sh_size - 4)
+-      /* PR 18879 */
+-      || (sec->sh_size < 5 && word_offset >= sec->sh_size)
++  if (/* PR 21343 *//* PR 18879 */
++      sec->sh_size < 4
++      || word_offset > (sec->sh_size - 4)
+       || ((bfd_signed_vma) word_offset) < 0)
+     return FALSE;
+ 
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2017-04-03  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21343
++       * readelf.c (get_unwind_section_word): Fix snafu checking for
++       invalid word offsets in ARM unwind information.
++
+ 2017-05-02  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 21440
-- 
2.7.4


