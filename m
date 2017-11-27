Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 49AF377BD2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:22 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id o17so7598485pli.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O33JcFdBXKhUt8J3uTTvE9ypPLnDiYcYIubP0WBoS0I=;
	b=tYJx4LHFSoKvlXiCOfsZbjKBTd3IExzMQZndgxKkLY81Lu/HPpWc5pE5DrLGnc2lxw
	s6/313iThmjHpaPpATuqM/hyGjAj6NIBuk8XB7O90rCd4Jf1Kt2vDta8TDogicQIFIBJ
	JaxmG3H78s9PW3SKLjI3rxhS3b3P3Lv8/vZwJcVvg0knVYEk4TcGD8D5h8F1jmWar9pK
	7LyHWmz45CgUowSifsv3Y0C2lgzyu9kDtqkwliD5cqNvwTWuVwNdNpx/p2gRzuuuZv3m
	JRdu+zuKbgbczmCJNY6+LSM9/P8yj0jW3mewnS+x2nkovhx4GnrYELP4UW/hpsbM6j8c
	yWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O33JcFdBXKhUt8J3uTTvE9ypPLnDiYcYIubP0WBoS0I=;
	b=o8Gjrfp99LAHRiaTc92dv1GyupbRUU0149jnFtlXclRloELhbOaZQnADjj99rmPXPO
	jVUfbMoU8ueO59oih1+H7jfpYI6SIq+0VTiuL53FwulfIj3y0BnzxoUSr+iI54U51f47
	HEJwWEUv7n3JgYV6q4uO2wlDXzW8+dyRsyOxqZ6JdtjP1xZvQgHetRqZPK5KbpARQj6w
	8z56YQ4fN6e/pRk6AYGZ0fgP8aUH0tVZ8tKEV/ZsOOZ9NSBmXhzA9qqj1VRCY2lRv3PA
	rXtb2MuGhF40O6R9yqCB8Z3b1VattkkYLd8HUcljIgCGlc39epryRdcujFlbjsaeGorY
	VjMw==
X-Gm-Message-State: AJaThX6wpemM2SM1QSkP3G8O+T8yBaG26elKvEK1691AlLHqbRZ2N9Kf
	hzs0sxj7bepTQn+dddpUMeTRTQ==
X-Google-Smtp-Source: AGs4zMZwpP1Zq9MS+9+tXtEpqLdNgeEu4xYtPGnTqYkFv/kimNRTzRKzV5bDO7olPvTgKHBK8LhmbA==
X-Received: by 10.159.255.70 with SMTP id u6mr36428030pls.372.1511750123932;
	Sun, 26 Nov 2017 18:35:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:57 -0800
Message-Id: <1511750112-2263-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 11/26] binutils: Security fix for CVE-2017-9040 and CVE-2017-9042
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:22 -0000

Affects: <= 2.28
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9040_9042.patch     | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9040_9042.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index b8199a4..c376433 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -53,6 +53,7 @@ SRC_URI = "\
      file://CVE-2017-8421.patch \
      file://CVE-2017-9038_9044.patch \
      file://CVE-2017-9039.patch \
+     file://CVE-2017-9040_9042.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9040_9042.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9040_9042.patch
new file mode 100644
index 0000000..79c6a7d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9040_9042.patch
@@ -0,0 +1,57 @@
+From 7296a62a2a237f6b1ad8db8c38b090e9f592c8cf Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 13 Apr 2017 16:06:30 +0100
+Subject: [PATCH] readelf: fix out of range subtraction, seg fault from a NULL
+ pointer and memory exhaustion, all from parsing corrupt binaries.
+
+	PR binutils/21379
+	* readelf.c (process_dynamic_section): Detect over large section
+	offsets in the DT_SYMTAB entry.
+
+	PR binutils/21345
+	* readelf.c (process_mips_specific): Catch an unfeasible memory
+	allocation before it happens and print a suitable error message.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9040
+CVE: CVE-2017-9042
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 12 ++++++++++++
+ binutils/readelf.c | 26 +++++++++++++++++++++-----
+ 2 files changed, 33 insertions(+), 5 deletions(-)
+
+Index: git/binutils/readelf.c
+===================================================================
+--- git.orig/binutils/readelf.c
++++ git/binutils/readelf.c
+@@ -9306,6 +9306,12 @@ process_dynamic_section (FILE * file)
+ 	     processing that.  This is overkill, I know, but it
+ 	     should work.  */
+ 	  section.sh_offset = offset_from_vma (file, entry->d_un.d_val, 0);
++	  if ((bfd_size_type) section.sh_offset > current_file_size)
++	    {
++	      /* See PR 21379 for a reproducer.  */
++	      error (_("Invalid DT_SYMTAB entry: %lx"), (long) section.sh_offset);
++	      return FALSE;
++	    }
+ 
+ 	  if (archive_file_offset != 0)
+ 	    section.sh_size = archive_file_size - section.sh_offset;
+@@ -15175,6 +15181,15 @@ process_mips_specific (FILE * file)
+ 	  return 0;
+ 	}
+ 
++      /* PR 21345 - print a slightly more helpful error message
++	 if we are sure that the cmalloc will fail.  */
++      if (conflictsno * sizeof (* iconf) > current_file_size)
++	{
++	  error (_("Overlarge number of conflicts detected: %lx\n"),
++		 (long) conflictsno);
++	  return FALSE;
++	}
++
+       iconf = (Elf32_Conflict *) cmalloc (conflictsno, sizeof (* iconf));
+       if (iconf == NULL)
+ 	{
-- 
2.7.4


