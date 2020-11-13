Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.5333.1605279192555509709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=y0FvYekK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id y7so7778953pfq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=o5lkOtBBQajAZLURY9I+N33f0DBOBUnC1F3bJpyWyF4=;
        b=y0FvYekKm9/2YlZis4Iw2oLqGa941Rqxos+Z3gYPBv90AgFA7b8Uvpr5gNhiKvVRl8
         mqmWIswS4XfA55C04KjvVo4L25L7XBf2D3YBy6ODLGuR6si5UGGLsBAsPyZcslbkN6nm
         nnzzBNglKflnsQXAzpAyN1SLn3Sgs39LliPjZXyKVvpxRp/RDTL5B6jspWjDuG0zM+Pr
         WEVEgtt94uEB4UXmA1LdpqSGlocvTYcz5e0vU2tEiqyRECnggsldJ16B4+ZrH0hlmgWR
         bhjZAM2kyk8IYZDEa6QLiMc+YHpNSOdC1OuQ9mu3ZnDVyWRl/FWd9kIibpuSJfwfZdWP
         hPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=o5lkOtBBQajAZLURY9I+N33f0DBOBUnC1F3bJpyWyF4=;
        b=K/J7q54ymurnaH2/cChfBK7BWrTBirKch2E4SREQ6QILZCcybsbWifdu1URa1Qmnx6
         cC6jNlm6x3caRXMonuPxYwg8lw/lvjfju7md5xkLdCqekQd9crjV2UkoSikcY8T1gWLi
         raSPX/zeGjHa1nb4KxJNe4RtRJpe4EXjD+UZd8cAuv/KjMZOQL3iPg3swQcJPNkwwxNa
         gg7UMkbrWDobJJxPHnXnQCbg/grA0Fz9pwUBAL1S1vRNJ0ZcIE1VJFERWgpFEh0ZEOgw
         Hh5gQ49EuaPLZiBA2lQ0atGbfUM9+N9squqlk1P49fUh4vHmb9DGho2D95OYZCDJ3QsQ
         tLqQ==
X-Gm-Message-State: AOAM533BwSNMtCc2QQKHcAApFhk53cR+h1Uzn1Az2+4Q4iidZxp8nnqG
	dqI9H+quErw1HKgc69gwEphYgRevpA8arwaX
X-Google-Smtp-Source: ABdhPJwROF/BgfNbaqLxzDk90h0qzixpUmX4r9SikEnqYGz8wvKJiW8H/nYhoAxPDlIK21lWFyCZog==
X-Received: by 2002:a17:90a:6445:: with SMTP id y5mr3724475pjm.64.1605279191675;
        Fri, 13 Nov 2020 06:53:11 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/18] binutils: reproducibility: reuse debug-prefix-map for stabs
Date: Fri, 13 Nov 2020 04:52:18 -1000
Message-Id: <b90799fd0f38cd013bebadbe5b9c50b4f93e84af.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Denys Zagorui <dzagorui@cisco.com>

powerpc 32bit Linux Kernel widely uses .stabs pseudo-op to
produce debugging information in stabs format. Faced an issue
that during Linux Kernel build with Yocto build system for 32bit
powerpc platform resulting vmlinux contains absolute path in
.stabstr section that cannot be remapped with -fdebug-prefix-map
option.

Yocto uses scripts/mkmakefile Linux Kernel build approach that
allows to store all generated files outside of kernel source
tree. With this approach each compilier invocation is performed
with an absolute path to a file that will be compiled and this
absolute path is recorded in init stab. There is no way to remap
this path.

Reuse remap_debug_filename api to make -fdebug-prefix-map flag
aplicable for init stab.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 ...oducibility-for-stabs-debugging-data.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index f65fdb7328..b5f5a1c69a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -43,5 +43,6 @@ SRC_URI = "\
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
      file://CVE-2020-0551.patch \
+     file://0001-gas-improve-reproducibility-for-stabs-debugging-data.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch b/meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch
new file mode 100644
index 0000000000..98dab1b41d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch
@@ -0,0 +1,32 @@
+From 96882eb9263b6b1c953e33a6764a83f4a87a9a41 Mon Sep 17 00:00:00 2001
+From: Denys Zagorui <dzagorui@cisco.com>
+Date: Mon, 9 Nov 2020 15:39:10 +0000
+Subject: [PATCH] gas: improve reproducibility for stabs debugging data format
+
+	* config/obj-elf (obj_elf_init_stab_section): Improve
+	reproducibility for stabs debugging data format
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0541201782c006c09d029d18a45c6e743cfea906]
+---
+ gas/config/obj-elf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gas/config/obj-elf.c b/gas/config/obj-elf.c
+index 7cf921c051..92b55e06c2 100644
+--- a/gas/config/obj-elf.c
++++ b/gas/config/obj-elf.c
+@@ -2186,12 +2186,13 @@ obj_elf_init_stab_section (segT seg)
+   p = frag_more (12);
+   /* Zero it out.  */
+   memset (p, 0, 12);
+-  file = as_where (NULL);
++  file = remap_debug_filename (as_where (NULL));
+   stabstr_name = concat (segment_name (seg), "str", (char *) NULL);
+   stroff = get_stab_string_offset (file, stabstr_name, TRUE);
+   know (stroff == 1 || (stroff == 0 && file[0] == '\0'));
+   md_number_to_chars (p, stroff, 4);
+   seg_info (seg)->stabu.p = p;
++  xfree ((char *) file);
+ }
+ 
+ #endif
-- 
2.17.1

