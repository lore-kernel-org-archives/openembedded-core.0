Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC73A6D1E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9LBbRU9016095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 04:37:27 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 21 Oct 2013 04:37:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 19:37:22 +0800
Message-ID: <1da1a7eb2f85eb43b52e05f4cce72858e1fd6402.1382355293.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382355293.git.hongxu.jia@windriver.com>
References: <cover.1382355293.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] debugedit: fix segment fault while file's bss offset have a large number
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
X-List-Received-Date: Mon, 21 Oct 2013 11:37:25 -0000
Content-Type: text/plain

While ELF_C_RDWR_MMAP was used, elf_begin invoked mmap() to map file
into memory. While the file's bss Offset has a large number, elf_update
caculated file size by __elf64_updatenull_wrlock and the size was
enlarged.

In this situation, elf_update invoked ftruncate to enlarge the file,
and memory size (elf->maximum_size) also was incorrectly updated.
There was segment fault in elf_end which invoked munmap with the
length is the enlarged file size, not the mmap's length.

Before the above operations, invoke elf_begin/elf_update/elf_end
with ELF_C_RDWR and ELF_F_LAYOUT set to enlarge the above file, it
could make sure the file is safe for the following elf operations.

[YOCTO #5356]
https://bugzilla.redhat.com/show_bug.cgi?id=1019707
https://bugzilla.redhat.com/show_bug.cgi?id=1020842

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...debugedit-valid-file-to-fix-segment-fault.patch | 67 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch

diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch b/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
new file mode 100644
index 0000000..2696cd3
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
@@ -0,0 +1,67 @@
+debugedit: fix segment fault while file's bss offset have a large number
+
+While ELF_C_RDWR_MMAP was used, elf_begin invoked mmap() to map file
+into memory. While the file's bss Offset has a large number, elf_update
+caculated file size by __elf64_updatenull_wrlock and the size was
+enlarged.
+
+In this situation, elf_update invoked ftruncate to enlarge the file,
+and memory size (elf->maximum_size) also was incorrectly updated.
+There was segment fault in elf_end which invoked munmap with the
+length is the enlarged file size, not the mmap's length.
+
+Before the above operations, invoke elf_begin/elf_update/elf_end
+with ELF_C_RDWR and ELF_F_LAYOUT set to enlarge the above file, it
+could make sure the file is safe for the following elf operations.
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tools/debugedit.c | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -1512,6 +1512,28 @@ handle_build_id (DSO *dso, Elf_Data *build_id,
+   }
+ }
+ 
++/* It avoided the segment fault while file's bss offset have a large number.
++   See https://bugzilla.redhat.com/show_bug.cgi?id=1019707
++       https://bugzilla.redhat.com/show_bug.cgi?id=1020842 for detail. */
++void valid_file(int fd)
++{
++  Elf *elf = elf_begin (fd, ELF_C_RDWR, NULL);
++  if (elf == NULL)
++  {
++    error (1, 0, "elf_begin: %s", elf_errmsg (-1));
++    return;
++  }
++
++  elf_flagelf (elf, ELF_C_SET, ELF_F_LAYOUT);
++
++  if (elf_update (elf, ELF_C_WRITE) < 0)
++    error (1, 0, "elf_update: %s", elf_errmsg (-1));
++
++  elf_end (elf);
++
++  return;
++}
++
+ int
+ main (int argc, char *argv[])
+ {
+@@ -1608,6 +1630,9 @@ main (int argc, char *argv[])
+       exit (1);
+     }
+ 
++  /* Make sure the file is valid. */
++  valid_file(fd);
++
+   dso = fdopen_dso (fd, file);
+   if (dso == NULL)
+     exit (1);
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 3c7e03b..c2f2279 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -86,6 +86,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-platform2.patch \
 	   file://rpm-remove-sykcparse-decl.patch \
 	   file://debugedit-segv.patch \
+	   file://debugedit-valid-file-to-fix-segment-fault.patch \
 	   file://rpm-platform-file-fix.patch \
 	   file://rpm-lsb-compatibility.patch \
 	  "
-- 
1.8.1.2


