Return-Path: <vinay.m.engg@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1997A7F899
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 13:32:51 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k13so1932pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 05:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ihq9u2/f3HUFaT2XK0e+n66QKiWFxbNsNu+RTs3J3Qk=;
	b=ieDqTQdkwlN3fS7KD4TcAZHS7Ik/l5fKOfLeORiYnOB7gxpiueVLOjB3cIZJnmqUul
	EpDY7wswIFO0wWmPea4D+62RUGJH1xDAnqAHfAAE2PAA1+xW58zHiXtpu8SvPePhVpC7
	+vRZ06C9iiBcvHVYLF0ihGh5IiKVpEyx+mlmiUOsTTbPSH9DsUqFrfp/kvC9rzcx+hTt
	wkXtwYNqZTsorpxJPTf5lNm0hWIUycXc3g9UX5Xpe6oQYtjqU8SsxSmbCmgBCnt0qfv4
	oPH+FPQwfkNB9t3jRi9QoswmPkWtP5dga+mQQTZT7uxc5z7gHfwcFnbob2Y0Oke4AQJY
	56mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ihq9u2/f3HUFaT2XK0e+n66QKiWFxbNsNu+RTs3J3Qk=;
	b=aAwgXfHQTbDuFZaFRZdDhMikY+AvX6GFYjb8YbHv905g7SMdwoXfGZWG/YCLxkiyMT
	YkWdtzrzQpyTGhtirkvGJbABtcQKkjW2VD0g4k8gVn7NOgtyLs0TYAnlT58eS/h9U7WG
	Agi2MyyjGeet3eVUdjuGiEg0VufbtieaIV1duC0ELVZUWmZhIc2GjjQZrTYT3m2opqZX
	HsdIF+5t/ei1rA6WJrlPZFndgIDLBICLUyct5hPKeE1tMo/CB6bFVxhRZqn+Qs/FXlYl
	nYOFqy+9o/6wJCauWI0YIowm0e6zW3mjggjNVsFoNSLS5QeY0q1Kj53z3hB9a5uXxPOQ
	fL6Q==
X-Gm-Message-State: APjAAAWMtWjld4Qc5uiJCOZV4YyJD/CIBZltN2dF1CZSjVct1lIM/SQV
	QnkHnyE9+ZdZMoC+wqJ6wN3QspqJfVfFSQ==
X-Google-Smtp-Source: APXvYqywb6RAKakS/AET+idX8yA2lrJUd9/xoi2zwFHDQRDCVdxqK5bCWVv7wvLcS1fAjxNGNwwdbQ==
X-Received: by 2002:a17:90a:2e85:: with SMTP id
	r5mr35690233pjd.53.1572874372732; 
	Mon, 04 Nov 2019 05:32:52 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
	by smtp.gmail.com with ESMTPSA id h5sm21177818pjc.9.2019.11.04.05.32.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Nov 2019 05:32:51 -0800 (PST)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 19:02:38 +0530
Message-Id: <1572874358-21616-1-git-send-email-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gdb: Discard sections whose size is greater than the file size.
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
X-List-Received-Date: Mon, 04 Nov 2019 13:32:52 -0000

Backport the upstream fix. that was not present in master.

CVE: CVE-2019-1010180
Upstream-Status: Backport

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-8.3.1.inc              |  1 +
 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.3.1.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
index 39f1c48..aec913f 100644
--- a/meta/recipes-devtools/gdb/gdb-8.3.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
+           file://CVE-2019-1010180.patch \
            "
 SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
 SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
new file mode 100644
index 0000000..2e4e842
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
@@ -0,0 +1,20 @@
+diff --git a/gdb/dwarf2read.c b/gdb/dwarf2read.c
+index 4251ed0..fafdb89 100644
+--- a/gdb/dwarf2read.c
++++ b/gdb/dwarf2read.c
+@@ -2378,6 +2378,15 @@ dwarf2_per_objfile::locate_sections (bfd *abfd, asection *sectp,
+   if ((aflag & SEC_HAS_CONTENTS) == 0)
+     {
+     }
++  else if (elf_section_data (sectp)->this_hdr.sh_size
++	   > bfd_get_file_size (abfd))
++    {
++      bfd_size_type size = elf_section_data (sectp)->this_hdr.sh_size;
++      warning (_("Discarding section %s which has a section size (%s"
++		 ") larger than the file size [in module %s]"),
++	       bfd_section_name (abfd, sectp), phex_nz (size, sizeof (size)),
++	       bfd_get_filename (abfd));
++    }
+   else if (section_is_p (sectp->name, &names.info))
+     {
+       this->info.s.section = sectp;
-- 
2.7.4


