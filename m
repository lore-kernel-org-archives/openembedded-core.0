Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TimAe-00027F-6A
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 14:16:20 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so318826bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 05:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=eoGErXA8Zvb9mB8D4dflabwgVp5uHP3QHGJcYjE9SLs=;
	b=GLPWVlkHyFg7j98IcsMF57rFGRoYDeTWA2GkBXS0oLXdKcBe2v2UZCAu0ZMhsjmWDw
	uLtuevmRFvvUNb6GEIrU1HczShK3tlxLPMND04oOCpEz8FuSVNgj/uLZ9sjyySED04MJ
	BzefBYaILmCNk+yEsqT+p7N4toLx1EGWZfj1C7+MVIOlGOfFMm7gi2OtUKJOslBbjZAt
	eNYYWXWJSQB6KpziGyK2ixa1O6Hz9Z/aKo/LVUKK1ViQFe8HnOdnNdDkjCIg0ru0Zfb/
	O3WMEXw8RCNoaZfSKHI/vVT2aBCBHA02F7NklUKsBXZfg4YFG4x3yAMMP54i7SnInQr4
	t4RQ==
Received: by 10.204.129.202 with SMTP id p10mr496438bks.56.1355317306742;
	Wed, 12 Dec 2012 05:01:46 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id m20sm20069236bkw.4.2012.12.12.05.01.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 05:01:45 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:01:32 +0500
Message-Id: <1355317292-25318-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] tar: apply fedora patch for fortify sources sigabort
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
X-List-Received-Date: Wed, 12 Dec 2012 13:16:20 -0000

See https://qa.mandriva.com/show_bug.cgi?id=61419 for details.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
333d2e0510a1e052cb83a6f8beed6d8bcea59b2c

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../tar-1.26/tar-1.26-fortifysourcessigabrt.patch  |   36 ++++++++++++++++++++
 meta/recipes-extended/tar/tar_1.26.bb              |    3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch

diff --git a/meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch b/meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch
new file mode 100644
index 0000000..6aef096
--- /dev/null
+++ b/meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch
@@ -0,0 +1,36 @@
+port fedora patch for fortify sources sigabort. See 
+https://qa.mandriva.com/show_bug.cgi?id=61419 for details.
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
+
+---
+ src/create.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+--- tar-1.26.orig/src/create.c
++++ tar-1.26/src/create.c
+@@ -562,8 +562,8 @@ write_gnu_long_link (struct tar_stat_inf
+   GNAME_TO_CHARS (tmpname, header->header.gname);
+   free (tmpname);
+
+-  strcpy (header->buffer + offsetof (struct posix_header, magic),
+-	  OLDGNU_MAGIC);
++  strncpy (header->buffer + offsetof (struct posix_header, magic),
++	  OLDGNU_MAGIC, sizeof(header->header.magic));
+   header->header.typeflag = type;
+   finish_header (st, header, -1);
+
+@@ -900,8 +900,8 @@ start_header (struct tar_stat_info *st)
+     case OLDGNU_FORMAT:
+     case GNU_FORMAT:   /*FIXME?*/
+       /* Overwrite header->header.magic and header.version in one blow.  */
+-      strcpy (header->buffer + offsetof (struct posix_header, magic),
+-	      OLDGNU_MAGIC);
++      strncpy (header->buffer + offsetof (struct posix_header, magic),
++	      OLDGNU_MAGIC, sizeof(header->header.magic));
+       break;
+
+     case POSIX_FORMAT:
diff --git a/meta/recipes-extended/tar/tar_1.26.bb b/meta/recipes-extended/tar/tar_1.26.bb
index 03a35c3..d45c2b1 100644
--- a/meta/recipes-extended/tar/tar_1.26.bb
+++ b/meta/recipes-extended/tar/tar_1.26.bb
@@ -3,9 +3,10 @@ require tar.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://remove-gets.patch \
+           file://tar-1.26-fortifysourcessigabrt.patch\
            "
 
 SRC_URI[md5sum] = "2cee42a2ff4f1cd4f9298eeeb2264519"
-- 
1.7.9.5



