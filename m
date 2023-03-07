Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73544C74A44
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.8693.1678229304978679545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TVxo+UPq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id nn12so45090pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+sGYa05aYSvbnXIiUsoRnRNrxZfFrXHsqdkkSm2SW8=;
        b=TVxo+UPqvStyZHvBkx4blm+Zq5R3ZFdKxmxqCPY+18bWjykmipKFdrrbvTVLW2Deen
         xFGxoIYV8JDN//eJ7D11sAxP7IvAqIc6AQTr7aaCorwABwc/kIZiixdr/0haca8njvvE
         r4ikPSTkY5HIEMMPSogNqD4SUI5ImcXxg8vffDm8YwqtsLkQfWVJiJUN/u3A+wt2yWRZ
         CAjbimSfoZG0la8XSWkIXjVA6lFN5HAD5igTijIfTs7PqOJoJj/nMJbtV2W08FuSVprQ
         CJMceoq8PBUY3q8DJPh4VBM5uxXFXJREmFmc5tfQWMe5UXUf4GJBGaE2vu3yLfALy7BX
         Q1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+sGYa05aYSvbnXIiUsoRnRNrxZfFrXHsqdkkSm2SW8=;
        b=FD/bbD/Bz0VkZm5mfhO38fXFmXheyxexkRK1NZMfS6HF1U3JJYCrnCVMQFGidYKaJQ
         WyH21KfYFjoRl+fJk/GIDifYUIVObQfEPpuZuGH7Z2ggunm7A6pMwbhFfsE25l1baRTa
         JV7ia6kx3eHAf0gW3cuqP2VVTSID+iJn/wRGkwdscmliPQxpnDODqFZkB/bbkldk5T67
         JclJ7CQueUSPGxzDAWAg74rsMOX9yXHVrX5M02cbI5yvd46NCYZnqvAO6r23tylXXq5C
         5Zpt0RPxL6JTpw8kN8Q3KObHkMbU029M70wP8X7JpyuYKBkh1M6XqmWwrQPdJNFm6o6/
         kxRw==
X-Gm-Message-State: AO0yUKWL2zR7tyUdtTGNcGha0hkUbLx0Mte1k7W72OvrX3FfVBtv48Zi
	t/lofJRS1oYn4wGWAxT8DQhgvdiRTLJDFAdUbRc=
X-Google-Smtp-Source: AK7set9cCAOPCcxztnznnkJpq0d3XpwFWH41WjxxET5DPlA8wtVjq43YAOZOdsqw6HN27aE7xEmqMA==
X-Received: by 2002:a05:6a20:3d24:b0:cd:5334:e261 with SMTP id y36-20020a056a203d2400b000cd5334e261mr17679555pzi.12.1678229302909;
        Tue, 07 Mar 2023 14:48:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/23] git: Security fix for CVE-2022-41903
Date: Tue,  7 Mar 2023 12:47:37 -1000
Message-Id: <d591ac4dfeff7b69086a47c7e88a8127f1d31299.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178125

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/git/git/commit/a244dc5b & https://github.com/git/git/commit/81dc898d &
			       https://github.com/git/git/commit/b49f309a & https://github.com/git/git/commit/f6e0b9f3 &
			       https://github.com/git/git/commit/1de69c0c & https://github.com/git/git/commit/48050c42 &
			       https://github.com/git/git/commit/522cc87f & https://github.com/git/git/commit/17d23e8a &
			       https://github.com/git/git/commit/937b71cc & https://github.com/git/git/commit/81c2d4c3 &
			       https://github.com/git/git/commit/f930a239 & https://github.com/git/git/commit/304a50ad

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/files/CVE-2022-41903-01.patch         |  39 ++++
 .../git/files/CVE-2022-41903-02.patch         | 187 ++++++++++++++++++
 .../git/files/CVE-2022-41903-03.patch         | 146 ++++++++++++++
 .../git/files/CVE-2022-41903-04.patch         | 150 ++++++++++++++
 .../git/files/CVE-2022-41903-05.patch         |  98 +++++++++
 .../git/files/CVE-2022-41903-06.patch         |  90 +++++++++
 .../git/files/CVE-2022-41903-07.patch         | 123 ++++++++++++
 .../git/files/CVE-2022-41903-08.patch         |  67 +++++++
 .../git/files/CVE-2022-41903-09.patch         | 162 +++++++++++++++
 .../git/files/CVE-2022-41903-10.patch         |  99 ++++++++++
 .../git/files/CVE-2022-41903-11.patch         |  90 +++++++++
 .../git/files/CVE-2022-41903-12.patch         | 124 ++++++++++++
 meta/recipes-devtools/git/git.inc             |  12 ++
 13 files changed, 1387 insertions(+)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-01.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-02.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-03.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-04.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-05.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-06.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-07.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-08.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-09.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-10.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-11.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-12.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-01.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-01.patch
new file mode 100644
index 0000000000..87091abd47
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-01.patch
@@ -0,0 +1,39 @@
+From a244dc5b0a629290881641467c7a545de7508ab2 Mon Sep 17 00:00:00 2001
+From: Carlo Marcelo Arenas Belón <carenas@gmail.com>
+Date: Tue, 2 Nov 2021 15:46:06 +0000
+Subject: [PATCH 01/12] test-lib: add prerequisite for 64-bit platforms
+
+Allow tests that assume a 64-bit `size_t` to be skipped in 32-bit
+platforms and regardless of the size of `long`.
+
+This imitates the `LONG_IS_64BIT` prerequisite.
+
+Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/a244dc5b0a629290881641467c7a545de7508ab2]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ t/test-lib.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/t/test-lib.sh b/t/test-lib.sh
+index e06fa02..db5ec2f 100644
+--- a/t/test-lib.sh
++++ b/t/test-lib.sh
+@@ -1613,6 +1613,10 @@ build_option () {
+ 	sed -ne "s/^$1: //p"
+ }
+ 
++test_lazy_prereq SIZE_T_IS_64BIT '
++	test 8 -eq "$(build_option sizeof-size_t)"
++'
++
+ test_lazy_prereq LONG_IS_64BIT '
+ 	test 8 -le "$(build_option sizeof-long)"
+ '
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-02.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-02.patch
new file mode 100644
index 0000000000..f35e55b585
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-02.patch
@@ -0,0 +1,187 @@
+From 81dc898df9b4b4035534a927f3234a3839b698bf Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:46:25 +0100
+Subject: [PATCH 02/12] pretty: fix out-of-bounds write caused by integer overflow
+
+When using a padding specifier in the pretty format passed to git-log(1)
+we need to calculate the string length in several places. These string
+lengths are stored in `int`s though, which means that these can easily
+overflow when the input lengths exceeds 2GB. This can ultimately lead to
+an out-of-bounds write when these are used in a call to memcpy(3P):
+
+        ==8340==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7f1ec62f97fe at pc 0x7f2127e5f427 bp 0x7ffd3bd63de0 sp 0x7ffd3bd63588
+    WRITE of size 1 at 0x7f1ec62f97fe thread T0
+        #0 0x7f2127e5f426 in __interceptor_memcpy /usr/src/debug/gcc/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:827
+        #1 0x5628e96aa605 in format_and_pad_commit pretty.c:1762
+        #2 0x5628e96aa7f4 in format_commit_item pretty.c:1801
+        #3 0x5628e97cdb24 in strbuf_expand strbuf.c:429
+        #4 0x5628e96ab060 in repo_format_commit_message pretty.c:1869
+        #5 0x5628e96acd0f in pretty_print_commit pretty.c:2161
+        #6 0x5628e95a44c8 in show_log log-tree.c:781
+        #7 0x5628e95a76ba in log_tree_commit log-tree.c:1117
+        #8 0x5628e922bed5 in cmd_log_walk_no_free builtin/log.c:508
+        #9 0x5628e922c35b in cmd_log_walk builtin/log.c:549
+        #10 0x5628e922f1a2 in cmd_log builtin/log.c:883
+        #11 0x5628e9106993 in run_builtin git.c:466
+        #12 0x5628e9107397 in handle_builtin git.c:721
+        #13 0x5628e9107b07 in run_argv git.c:788
+        #14 0x5628e91088a7 in cmd_main git.c:923
+        #15 0x5628e939d682 in main common-main.c:57
+        #16 0x7f2127c3c28f  (/usr/lib/libc.so.6+0x2328f)
+        #17 0x7f2127c3c349 in __libc_start_main (/usr/lib/libc.so.6+0x23349)
+        #18 0x5628e91020e4 in _start ../sysdeps/x86_64/start.S:115
+
+    0x7f1ec62f97fe is located 2 bytes to the left of 4831838265-byte region [0x7f1ec62f9800,0x7f1fe62f9839)
+    allocated by thread T0 here:
+        #0 0x7f2127ebe7ea in __interceptor_realloc /usr/src/debug/gcc/libsanitizer/asan/asan_malloc_linux.cpp:85
+        #1 0x5628e98774d4 in xrealloc wrapper.c:136
+        #2 0x5628e97cb01c in strbuf_grow strbuf.c:99
+        #3 0x5628e97ccd42 in strbuf_addchars strbuf.c:327
+        #4 0x5628e96aa55c in format_and_pad_commit pretty.c:1761
+        #5 0x5628e96aa7f4 in format_commit_item pretty.c:1801
+        #6 0x5628e97cdb24 in strbuf_expand strbuf.c:429
+        #7 0x5628e96ab060 in repo_format_commit_message pretty.c:1869
+        #8 0x5628e96acd0f in pretty_print_commit pretty.c:2161
+        #9 0x5628e95a44c8 in show_log log-tree.c:781
+        #10 0x5628e95a76ba in log_tree_commit log-tree.c:1117
+        #11 0x5628e922bed5 in cmd_log_walk_no_free builtin/log.c:508
+        #12 0x5628e922c35b in cmd_log_walk builtin/log.c:549
+        #13 0x5628e922f1a2 in cmd_log builtin/log.c:883
+        #14 0x5628e9106993 in run_builtin git.c:466
+        #15 0x5628e9107397 in handle_builtin git.c:721
+        #16 0x5628e9107b07 in run_argv git.c:788
+        #17 0x5628e91088a7 in cmd_main git.c:923
+        #18 0x5628e939d682 in main common-main.c:57
+        #19 0x7f2127c3c28f  (/usr/lib/libc.so.6+0x2328f)
+        #20 0x7f2127c3c349 in __libc_start_main (/usr/lib/libc.so.6+0x23349)
+        #21 0x5628e91020e4 in _start ../sysdeps/x86_64/start.S:115
+
+    SUMMARY: AddressSanitizer: heap-buffer-overflow /usr/src/debug/gcc/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:827 in __interceptor_memcpy
+    Shadow bytes around the buggy address:
+      0x0fe458c572a0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0fe458c572b0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0fe458c572c0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0fe458c572d0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0fe458c572e0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    =>0x0fe458c572f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa[fa]
+      0x0fe458c57300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+      0x0fe458c57310: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+      0x0fe458c57320: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+      0x0fe458c57330: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+      0x0fe458c57340: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    Shadow byte legend (one shadow byte represents 8 application bytes):
+      Addressable:           00
+      Partially addressable: 01 02 03 04 05 06 07
+      Heap left redzone:       fa
+      Freed heap region:       fd
+      Stack left redzone:      f1
+      Stack mid redzone:       f2
+      Stack right redzone:     f3
+      Stack after return:      f5
+      Stack use after scope:   f8
+      Global redzone:          f9
+      Global init order:       f6
+      Poisoned by user:        f7
+      Container overflow:      fc
+      Array cookie:            ac
+      Intra object redzone:    bb
+      ASan internal:           fe
+      Left alloca redzone:     ca
+      Right alloca redzone:    cb
+    ==8340==ABORTING
+
+The pretty format can also be used in `git archive` operations via the
+`export-subst` attribute. So this is what in our opinion makes this a
+critical issue in the context of Git forges which allow to download an
+archive of user supplied Git repositories.
+
+Fix this vulnerability by using `size_t` instead of `int` to track the
+string lengths. Add tests which detect this vulnerability when Git is
+compiled with the address sanitizer.
+
+Reported-by: Joern Schneeweisz <jschneeweisz@gitlab.com>
+Original-patch-by: Joern Schneeweisz <jschneeweisz@gitlab.com>
+Modified-by: Taylor  Blau <me@ttalorr.com>
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/81dc898df9b4b4035534a927f3234a3839b698bf]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pretty.c                      | 11 ++++++-----
+ t/t4205-log-pretty-formats.sh | 17 +++++++++++++++++
+ 2 files changed, 23 insertions(+), 5 deletions(-)
+
+diff --git a/pretty.c b/pretty.c
+index b32f036..637e344 100644
+--- a/pretty.c
++++ b/pretty.c
+@@ -1427,7 +1427,9 @@ static size_t format_and_pad_commit(struct strbuf *sb, /* in UTF-8 */
+ 				    struct format_commit_context *c)
+ {
+ 	struct strbuf local_sb = STRBUF_INIT;
+-	int total_consumed = 0, len, padding = c->padding;
++	size_t total_consumed = 0;
++	int len, padding = c->padding;
++
+ 	if (padding < 0) {
+ 		const char *start = strrchr(sb->buf, '\n');
+ 		int occupied;
+@@ -1439,7 +1441,7 @@ static size_t format_and_pad_commit(struct strbuf *sb, /* in UTF-8 */
+ 	}
+ 	while (1) {
+ 		int modifier = *placeholder == 'C';
+-		int consumed = format_commit_one(&local_sb, placeholder, c);
++		size_t consumed = format_commit_one(&local_sb, placeholder, c);
+ 		total_consumed += consumed;
+ 
+ 		if (!modifier)
+@@ -1505,7 +1507,7 @@ static size_t format_and_pad_commit(struct strbuf *sb, /* in UTF-8 */
+ 		}
+ 		strbuf_addbuf(sb, &local_sb);
+ 	} else {
+-		int sb_len = sb->len, offset = 0;
++		size_t sb_len = sb->len, offset = 0;
+ 		if (c->flush_type == flush_left)
+ 			offset = padding - len;
+ 		else if (c->flush_type == flush_both)
+@@ -1528,8 +1530,7 @@ static size_t format_commit_item(struct strbuf *sb, /* in UTF-8 */
+ 				 const char *placeholder,
+ 				 void *context)
+ {
+-	int consumed;
+-	size_t orig_len;
++	size_t consumed, orig_len;
+ 	enum {
+ 		NO_MAGIC,
+ 		ADD_LF_BEFORE_NON_EMPTY,
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index f42a69f..a2acee1 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -788,4 +788,21 @@ test_expect_success '%S in git log --format works with other placeholders (part
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
++	# We only assert that this command does not crash. This needs to be
++	# executed with the address sanitizer to demonstrate failure.
++	git log -1 --pretty="format:%>(2147483646)%x41%41%>(2147483646)%x41" >/dev/null
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'set up huge commit' '
++	test-tool genzeros 2147483649 | tr "\000" "1" >expect &&
++	huge_commit=$(git commit-tree -F expect HEAD^{tree})
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
++	git log -1 --format="%B%<(1)%x30" $huge_commit >actual &&
++	echo 0 >>expect &&
++	test_cmp expect actual
++'
++
+ test_done
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-03.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-03.patch
new file mode 100644
index 0000000000..d83d77eaf7
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-03.patch
@@ -0,0 +1,146 @@
+From b49f309aa16febeddb65e82526640a91bbba3be3 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:46:30 +0100
+Subject: [PATCH 03/12] pretty: fix out-of-bounds read when left-flushing with stealing
+
+With the `%>>(<N>)` pretty formatter, you can ask git-log(1) et al to
+steal spaces. To do so we need to look ahead of the next token to see
+whether there are spaces there. This loop takes into account ANSI
+sequences that end with an `m`, and if it finds any it will skip them
+until it finds the first space. While doing so it does not take into
+account the buffer's limits though and easily does an out-of-bounds
+read.
+
+Add a test that hits this behaviour. While we don't have an easy way to
+verify this, the test causes the following failure when run with
+`SANITIZE=address`:
+
+    ==37941==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x603000000baf at pc 0x55ba6f88e0d0 bp 0x7ffc84c50d20 sp 0x7ffc84c50d10
+    READ of size 1 at 0x603000000baf thread T0
+        #0 0x55ba6f88e0cf in format_and_pad_commit pretty.c:1712
+        #1 0x55ba6f88e7b4 in format_commit_item pretty.c:1801
+        #2 0x55ba6f9b1ae4 in strbuf_expand strbuf.c:429
+        #3 0x55ba6f88f020 in repo_format_commit_message pretty.c:1869
+        #4 0x55ba6f890ccf in pretty_print_commit pretty.c:2161
+        #5 0x55ba6f7884c8 in show_log log-tree.c:781
+        #6 0x55ba6f78b6ba in log_tree_commit log-tree.c:1117
+        #7 0x55ba6f40fed5 in cmd_log_walk_no_free builtin/log.c:508
+        #8 0x55ba6f41035b in cmd_log_walk builtin/log.c:549
+        #9 0x55ba6f4131a2 in cmd_log builtin/log.c:883
+        #10 0x55ba6f2ea993 in run_builtin git.c:466
+        #11 0x55ba6f2eb397 in handle_builtin git.c:721
+        #12 0x55ba6f2ebb07 in run_argv git.c:788
+        #13 0x55ba6f2ec8a7 in cmd_main git.c:923
+        #14 0x55ba6f581682 in main common-main.c:57
+        #15 0x7f2d08c3c28f  (/usr/lib/libc.so.6+0x2328f)
+        #16 0x7f2d08c3c349 in __libc_start_main (/usr/lib/libc.so.6+0x23349)
+        #17 0x55ba6f2e60e4 in _start ../sysdeps/x86_64/start.S:115
+
+    0x603000000baf is located 1 bytes to the left of 24-byte region [0x603000000bb0,0x603000000bc8)
+    allocated by thread T0 here:
+        #0 0x7f2d08ebe7ea in __interceptor_realloc /usr/src/debug/gcc/libsanitizer/asan/asan_malloc_linux.cpp:85
+        #1 0x55ba6fa5b494 in xrealloc wrapper.c:136
+        #2 0x55ba6f9aefdc in strbuf_grow strbuf.c:99
+        #3 0x55ba6f9b0a06 in strbuf_add strbuf.c:298
+        #4 0x55ba6f9b1a25 in strbuf_expand strbuf.c:418
+        #5 0x55ba6f88f020 in repo_format_commit_message pretty.c:1869
+        #6 0x55ba6f890ccf in pretty_print_commit pretty.c:2161
+        #7 0x55ba6f7884c8 in show_log log-tree.c:781
+        #8 0x55ba6f78b6ba in log_tree_commit log-tree.c:1117
+        #9 0x55ba6f40fed5 in cmd_log_walk_no_free builtin/log.c:508
+        #10 0x55ba6f41035b in cmd_log_walk builtin/log.c:549
+        #11 0x55ba6f4131a2 in cmd_log builtin/log.c:883
+        #12 0x55ba6f2ea993 in run_builtin git.c:466
+        #13 0x55ba6f2eb397 in handle_builtin git.c:721
+        #14 0x55ba6f2ebb07 in run_argv git.c:788
+        #15 0x55ba6f2ec8a7 in cmd_main git.c:923
+        #16 0x55ba6f581682 in main common-main.c:57
+        #17 0x7f2d08c3c28f  (/usr/lib/libc.so.6+0x2328f)
+        #18 0x7f2d08c3c349 in __libc_start_main (/usr/lib/libc.so.6+0x23349)
+        #19 0x55ba6f2e60e4 in _start ../sysdeps/x86_64/start.S:115
+
+    SUMMARY: AddressSanitizer: heap-buffer-overflow pretty.c:1712 in format_and_pad_commit
+    Shadow bytes around the buggy address:
+      0x0c067fff8120: fa fa fd fd fd fa fa fa fd fd fd fa fa fa fd fd
+      0x0c067fff8130: fd fd fa fa fd fd fd fd fa fa fd fd fd fa fa fa
+      0x0c067fff8140: fd fd fd fa fa fa fd fd fd fa fa fa fd fd fd fa
+      0x0c067fff8150: fa fa fd fd fd fd fa fa 00 00 00 fa fa fa fd fd
+      0x0c067fff8160: fd fa fa fa fd fd fd fa fa fa fd fd fd fa fa fa
+    =>0x0c067fff8170: fd fd fd fa fa[fa]00 00 00 fa fa fa 00 00 00 fa
+      0x0c067fff8180: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff8190: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff81a0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff81b0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff81c0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    Shadow byte legend (one shadow byte represents 8 application bytes):
+      Addressable:           00
+      Partially addressable: 01 02 03 04 05 06 07
+      Heap left redzone:       fa
+      Freed heap region:       fd
+      Stack left redzone:      f1
+      Stack mid redzone:       f2
+      Stack right redzone:     f3
+      Stack after return:      f5
+      Stack use after scope:   f8
+      Global redzone:          f9
+      Global init order:       f6
+      Poisoned by user:        f7
+      Container overflow:      fc
+      Array cookie:            ac
+      Intra object redzone:    bb
+      ASan internal:           fe
+      Left alloca redzone:     ca
+      Right alloca redzone:    cb
+
+Luckily enough, this would only cause us to copy the out-of-bounds data
+into the formatted commit in case we really had an ANSI sequence
+preceding our buffer. So this bug likely has no security consequences.
+
+Fix it regardless by not traversing past the buffer's start.
+
+Reported-by: Patrick Steinhardt <ps@pks.im>
+Reported-by: Eric Sesterhenn <eric.sesterhenn@x41-dsec.de>
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/b49f309aa16febeddb65e82526640a91bbba3be3]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pretty.c                      | 2 +-
+ t/t4205-log-pretty-formats.sh | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/pretty.c b/pretty.c
+index 637e344..4348a82 100644
+--- a/pretty.c
++++ b/pretty.c
+@@ -1468,7 +1468,7 @@ static size_t format_and_pad_commit(struct strbuf *sb, /* in UTF-8 */
+ 			if (*ch != 'm')
+ 				break;
+ 			p = ch - 1;
+-			while (ch - p < 10 && *p != '\033')
++			while (p > sb->buf && ch - p < 10 && *p != '\033')
+ 				p--;
+ 			if (*p != '\033' ||
+ 			    ch + 1 - p != display_mode_esc_sequence_len(p))
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index a2acee1..e69caba 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -788,6 +788,12 @@ test_expect_success '%S in git log --format works with other placeholders (part
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success 'log --pretty with space stealing' '
++	printf mm0 >expect &&
++	git log -1 --pretty="format:mm%>>|(1)%x30" >actual &&
++	test_cmp expect actual
++'
++
+ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
+ 	# We only assert that this command does not crash. This needs to be
+ 	# executed with the address sanitizer to demonstrate failure.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-04.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-04.patch
new file mode 100644
index 0000000000..9e3c74ff67
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-04.patch
@@ -0,0 +1,150 @@
+From f6e0b9f38987ad5e47bab551f8760b70689a5905 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:46:34 +0100
+Subject: [PATCH 04/12] pretty: fix out-of-bounds read when parsing invalid padding format
+
+An out-of-bounds read can be triggered when parsing an incomplete
+padding format string passed via `--pretty=format` or in Git archives
+when files are marked with the `export-subst` gitattribute.
+
+This bug exists since we have introduced support for truncating output
+via the `trunc` keyword a7f01c6 (pretty: support truncating in %>, %<
+and %><, 2013-04-19). Before this commit, we used to find the end of the
+formatting string by using strchr(3P). This function returns a `NULL`
+pointer in case the character in question wasn't found. The subsequent
+check whether any character was found thus simply checked the returned
+pointer. After the commit we switched to strcspn(3P) though, which only
+returns the offset to the first found character or to the trailing NUL
+byte. As the end pointer is now computed by adding the offset to the
+start pointer it won't be `NULL` anymore, and as a consequence the check
+doesn't do anything anymore.
+
+The out-of-bounds data that is being read can in fact end up in the
+formatted string. As a consequence, it is possible to leak memory
+contents either by calling git-log(1) or via git-archive(1) when any of
+the archived files is marked with the `export-subst` gitattribute.
+
+    ==10888==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x602000000398 at pc 0x7f0356047cb2 bp 0x7fff3ffb95d0 sp 0x7fff3ffb8d78
+    READ of size 1 at 0x602000000398 thread T0
+        #0 0x7f0356047cb1 in __interceptor_strchrnul /usr/src/debug/gcc/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:725
+        #1 0x563b7cec9a43 in strbuf_expand strbuf.c:417
+        #2 0x563b7cda7060 in repo_format_commit_message pretty.c:1869
+        #3 0x563b7cda8d0f in pretty_print_commit pretty.c:2161
+        #4 0x563b7cca04c8 in show_log log-tree.c:781
+        #5 0x563b7cca36ba in log_tree_commit log-tree.c:1117
+        #6 0x563b7c927ed5 in cmd_log_walk_no_free builtin/log.c:508
+        #7 0x563b7c92835b in cmd_log_walk builtin/log.c:549
+        #8 0x563b7c92b1a2 in cmd_log builtin/log.c:883
+        #9 0x563b7c802993 in run_builtin git.c:466
+        #10 0x563b7c803397 in handle_builtin git.c:721
+        #11 0x563b7c803b07 in run_argv git.c:788
+        #12 0x563b7c8048a7 in cmd_main git.c:923
+        #13 0x563b7ca99682 in main common-main.c:57
+        #14 0x7f0355e3c28f  (/usr/lib/libc.so.6+0x2328f)
+        #15 0x7f0355e3c349 in __libc_start_main (/usr/lib/libc.so.6+0x23349)
+        #16 0x563b7c7fe0e4 in _start ../sysdeps/x86_64/start.S:115
+
+    0x602000000398 is located 0 bytes to the right of 8-byte region [0x602000000390,0x602000000398)
+    allocated by thread T0 here:
+        #0 0x7f0356072faa in __interceptor_strdup /usr/src/debug/gcc/libsanitizer/asan/asan_interceptors.cpp:439
+        #1 0x563b7cf7317c in xstrdup wrapper.c:39
+        #2 0x563b7cd9a06a in save_user_format pretty.c:40
+        #3 0x563b7cd9b3e5 in get_commit_format pretty.c:173
+        #4 0x563b7ce54ea0 in handle_revision_opt revision.c:2456
+        #5 0x563b7ce597c9 in setup_revisions revision.c:2850
+        #6 0x563b7c9269e0 in cmd_log_init_finish builtin/log.c:269
+        #7 0x563b7c927362 in cmd_log_init builtin/log.c:348
+        #8 0x563b7c92b193 in cmd_log builtin/log.c:882
+        #9 0x563b7c802993 in run_builtin git.c:466
+        #10 0x563b7c803397 in handle_builtin git.c:721
+        #11 0x563b7c803b07 in run_argv git.c:788
+        #12 0x563b7c8048a7 in cmd_main git.c:923
+        #13 0x563b7ca99682 in main common-main.c:57
+        #14 0x7f0355e3c28f  (/usr/lib/libc.so.6+0x2328f)
+        #15 0x7f0355e3c349 in __libc_start_main (/usr/lib/libc.so.6+0x23349)
+        #16 0x563b7c7fe0e4 in _start ../sysdeps/x86_64/start.S:115
+
+    SUMMARY: AddressSanitizer: heap-buffer-overflow /usr/src/debug/gcc/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:725 in __interceptor_strchrnul
+    Shadow bytes around the buggy address:
+      0x0c047fff8020: fa fa fd fd fa fa 00 06 fa fa 05 fa fa fa fd fd
+      0x0c047fff8030: fa fa 00 02 fa fa 06 fa fa fa 05 fa fa fa fd fd
+      0x0c047fff8040: fa fa 00 07 fa fa 03 fa fa fa fd fd fa fa 00 00
+      0x0c047fff8050: fa fa 00 01 fa fa fd fd fa fa 00 00 fa fa 00 01
+      0x0c047fff8060: fa fa 00 06 fa fa 00 06 fa fa 05 fa fa fa 05 fa
+    =>0x0c047fff8070: fa fa 00[fa]fa fa fd fa fa fa fd fd fa fa fd fd
+      0x0c047fff8080: fa fa fd fd fa fa 00 00 fa fa 00 fa fa fa fd fa
+      0x0c047fff8090: fa fa fd fd fa fa 00 00 fa fa fa fa fa fa fa fa
+      0x0c047fff80a0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c047fff80b0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c047fff80c0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    Shadow byte legend (one shadow byte represents 8 application bytes):
+      Addressable:           00
+      Partially addressable: 01 02 03 04 05 06 07
+      Heap left redzone:       fa
+      Freed heap region:       fd
+      Stack left redzone:      f1
+      Stack mid redzone:       f2
+      Stack right redzone:     f3
+      Stack after return:      f5
+      Stack use after scope:   f8
+      Global redzone:          f9
+      Global init order:       f6
+      Poisoned by user:        f7
+      Container overflow:      fc
+      Array cookie:            ac
+      Intra object redzone:    bb
+      ASan internal:           fe
+      Left alloca redzone:     ca
+      Right alloca redzone:    cb
+    ==10888==ABORTING
+
+Fix this bug by checking whether `end` points at the trailing NUL byte.
+Add a test which catches this out-of-bounds read and which demonstrates
+that we used to write out-of-bounds data into the formatted message.
+
+Reported-by: Markus Vervier <markus.vervier@x41-dsec.de>
+Original-patch-by: Markus Vervier <markus.vervier@x41-dsec.de>
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/f6e0b9f38987ad5e47bab551f8760b70689a5905]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pretty.c                      | 2 +-
+ t/t4205-log-pretty-formats.sh | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/pretty.c b/pretty.c
+index 4348a82..c49e818 100644
+--- a/pretty.c
++++ b/pretty.c
+@@ -1024,7 +1024,7 @@ static size_t parse_padding_placeholder(const char *placeholder,
+ 		const char *end = start + strcspn(start, ",)");
+ 		char *next;
+ 		int width;
+-		if (!end || end == start)
++		if (!*end || end == start)
+ 			return 0;
+ 		width = strtol(start, &next, 10);
+ 		if (next == start || width == 0)
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index e69caba..8a349df 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -794,6 +794,12 @@ test_expect_success 'log --pretty with space stealing' '
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success 'log --pretty with invalid padding format' '
++	printf "%s%%<(20" "$(git rev-parse HEAD)" >expect &&
++	git log -1 --pretty="format:%H%<(20" >actual &&
++	test_cmp expect actual
++'
++
+ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
+ 	# We only assert that this command does not crash. This needs to be
+ 	# executed with the address sanitizer to demonstrate failure.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-05.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-05.patch
new file mode 100644
index 0000000000..994f7a55b1
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-05.patch
@@ -0,0 +1,98 @@
+From 1de69c0cdd388b0a5b7bdde0bfa0bda514a354b0 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:46:39 +0100
+Subject: [PATCH 05/12] pretty: fix adding linefeed when placeholder is not expanded
+
+When a formatting directive has a `+` or ` ` after the `%`, then we add
+either a line feed or space if the placeholder expands to a non-empty
+string. In specific cases though this logic doesn't work as expected,
+and we try to add the character even in the case where the formatting
+directive is empty.
+
+One such pattern is `%w(1)%+d%+w(2)`. `%+d` expands to reference names
+pointing to a certain commit, like in `git log --decorate`. For a tagged
+commit this would for example expand to `\n (tag: v1.0.0)`, which has a
+leading newline due to the `+` modifier and a space added by `%d`. Now
+the second wrapping directive will cause us to rewrap the text to
+`\n(tag:\nv1.0.0)`, which is one byte shorter due to the missing leading
+space. The code that handles the `+` magic now notices that the length
+has changed and will thus try to insert a leading line feed at the
+original posititon. But as the string was shortened, the original
+position is past the buffer's boundary and thus we die with an error.
+
+Now there are two issues here:
+
+    1. We check whether the buffer length has changed, not whether it
+       has been extended. This causes us to try and add the character
+       past the string boundary.
+
+    2. The current logic does not make any sense whatsoever. When the
+       string got expanded due to the rewrap, putting the separator into
+       the original position is likely to put it somewhere into the
+       middle of the rewrapped contents.
+
+It is debatable whether `%+w()` makes any sense in the first place.
+Strictly speaking, the placeholder never expands to a non-empty string,
+and consequentially we shouldn't ever accept this combination. We thus
+fix the bug by simply refusing `%+w()`.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/1de69c0cdd388b0a5b7bdde0bfa0bda514a354b0]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pretty.c                      | 14 +++++++++++++-
+ t/t4205-log-pretty-formats.sh |  8 ++++++++
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/pretty.c b/pretty.c
+index c49e818..195d005 100644
+--- a/pretty.c
++++ b/pretty.c
+@@ -1551,9 +1551,21 @@ static size_t format_commit_item(struct strbuf *sb, /* in UTF-8 */
+ 	default:
+ 		break;
+ 	}
+-	if (magic != NO_MAGIC)
++	if (magic != NO_MAGIC) {
+ 		placeholder++;
+ 
++		switch (placeholder[0]) {
++		case 'w':
++			/*
++			 * `%+w()` cannot ever expand to a non-empty string,
++			 * and it potentially changes the layout of preceding
++			 * contents. We're thus not able to handle the magic in
++			 * this combination and refuse the pattern.
++			 */
++			return 0;
++		};
++	}
++
+ 	orig_len = sb->len;
+ 	if (((struct format_commit_context *)context)->flush_type != no_flush)
+ 		consumed = format_and_pad_commit(sb, placeholder, context);
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index 8a349df..fa1bc2b 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -800,6 +800,14 @@ test_expect_success 'log --pretty with invalid padding format' '
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success 'log --pretty with magical wrapping directives' '
++	commit_id=$(git commit-tree HEAD^{tree} -m "describe me") &&
++	git tag describe-me $commit_id &&
++	printf "\n(tag:\ndescribe-me)%%+w(2)" >expect &&
++	git log -1 --pretty="format:%w(1)%+d%+w(2)" $commit_id >actual &&
++	test_cmp expect actual
++'
++
+ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
+ 	# We only assert that this command does not crash. This needs to be
+ 	# executed with the address sanitizer to demonstrate failure.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-06.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-06.patch
new file mode 100644
index 0000000000..93fbe5c7fe
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-06.patch
@@ -0,0 +1,90 @@
+From 48050c42c73c28b0c001d63d11dffac7e116847b Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:46:49 +0100
+Subject: [PATCH 06/12] pretty: fix integer overflow in wrapping format
+
+The `%w(width,indent1,indent2)` formatting directive can be used to
+rewrap text to a specific width and is designed after git-shortlog(1)'s
+`-w` parameter. While the three parameters are all stored as `size_t`
+internally, `strbuf_add_wrapped_text()` accepts integers as input. As a
+result, the casted integers may overflow. As these now-negative integers
+are later on passed to `strbuf_addchars()`, we will ultimately run into
+implementation-defined behaviour due to casting a negative number back
+to `size_t` again. On my platform, this results in trying to allocate
+9000 petabyte of memory.
+
+Fix this overflow by using `cast_size_t_to_int()` so that we reject
+inputs that cannot be represented as an integer.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/48050c42c73c28b0c001d63d11dffac7e116847b]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ git-compat-util.h             |  8 ++++++++
+ pretty.c                      |  4 +++-
+ t/t4205-log-pretty-formats.sh | 12 ++++++++++++
+ 3 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/git-compat-util.h b/git-compat-util.h
+index a1ecfd3..b0f3890 100644
+--- a/git-compat-util.h
++++ b/git-compat-util.h
+@@ -854,6 +854,14 @@ static inline size_t st_sub(size_t a, size_t b)
+ 	return a - b;
+ }
+ 
++static inline int cast_size_t_to_int(size_t a)
++{
++	if (a > INT_MAX)
++		die("number too large to represent as int on this platform: %"PRIuMAX,
++		    (uintmax_t)a);
++	return (int)a;
++}
++
+ #ifdef HAVE_ALLOCA_H
+ # include <alloca.h>
+ # define xalloca(size)      (alloca(size))
+diff --git a/pretty.c b/pretty.c
+index 195d005..ff9fc97 100644
+--- a/pretty.c
++++ b/pretty.c
+@@ -898,7 +898,9 @@ static void strbuf_wrap(struct strbuf *sb, size_t pos,
+ 	if (pos)
+ 		strbuf_add(&tmp, sb->buf, pos);
+ 	strbuf_add_wrapped_text(&tmp, sb->buf + pos,
+-				(int) indent1, (int) indent2, (int) width);
++				cast_size_t_to_int(indent1),
++				cast_size_t_to_int(indent2),
++				cast_size_t_to_int(width));
+ 	strbuf_swap(&tmp, sb);
+ 	strbuf_release(&tmp);
+ }
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index fa1bc2b..23ac508 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -808,6 +808,18 @@ test_expect_success 'log --pretty with magical wrapping directives' '
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success SIZE_T_IS_64BIT 'log --pretty with overflowing wrapping directive' '
++	cat >expect <<-EOF &&
++	fatal: number too large to represent as int on this platform: 2147483649
++	EOF
++	test_must_fail git log -1 --pretty="format:%w(2147483649,1,1)%d" 2>error &&
++	test_cmp expect error &&
++	test_must_fail git log -1 --pretty="format:%w(1,2147483649,1)%d" 2>error &&
++	test_cmp expect error &&
++	test_must_fail git log -1 --pretty="format:%w(1,1,2147483649)%d" 2>error &&
++	test_cmp expect error
++'
++
+ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
+ 	# We only assert that this command does not crash. This needs to be
+ 	# executed with the address sanitizer to demonstrate failure.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-07.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-07.patch
new file mode 100644
index 0000000000..ec248ad6c2
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-07.patch
@@ -0,0 +1,123 @@
+From 522cc87fdc25449222a5894a428eebf4b8d5eaa9 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:46:53 +0100
+Subject: [PATCH 07/12] utf8: fix truncated string lengths in utf8_strnwidth()
+
+The `utf8_strnwidth()` function accepts an optional string length as
+input parameter. This parameter can either be set to `-1`, in which case
+we call `strlen()` on the input. Or it can be set to a positive integer
+that indicates a precomputed length, which callers typically compute by
+calling `strlen()` at some point themselves.
+
+The input parameter is an `int` though, whereas `strlen()` returns a
+`size_t`. This can lead to implementation-defined behaviour though when
+the `size_t` cannot be represented by the `int`. In the general case
+though this leads to wrap-around and thus to negative string sizes,
+which is sure enough to not lead to well-defined behaviour.
+
+Fix this by accepting a `size_t` instead of an `int` as string length.
+While this takes away the ability of callers to simply pass in `-1` as
+string length, it really is trivial enough to convert them to instead
+pass in `strlen()` instead.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/522cc87fdc25449222a5894a428eebf4b8d5eaa9]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ column.c | 2 +-
+ pretty.c | 4 ++--
+ utf8.c   | 8 +++-----
+ utf8.h   | 2 +-
+ 4 files changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/column.c b/column.c
+index 4a38eed..0c79850 100644
+--- a/column.c
++++ b/column.c
+@@ -23,7 +23,7 @@ struct column_data {
+ /* return length of 's' in letters, ANSI escapes stripped */
+ static int item_length(const char *s)
+ {
+-	return utf8_strnwidth(s, -1, 1);
++	return utf8_strnwidth(s, strlen(s), 1);
+ }
+ 
+ /*
+diff --git a/pretty.c b/pretty.c
+index ff9fc97..c3c1443 100644
+--- a/pretty.c
++++ b/pretty.c
+@@ -1437,7 +1437,7 @@ static size_t format_and_pad_commit(struct strbuf *sb, /* in UTF-8 */
+ 		int occupied;
+ 		if (!start)
+ 			start = sb->buf;
+-		occupied = utf8_strnwidth(start, -1, 1);
++		occupied = utf8_strnwidth(start, strlen(start), 1);
+ 		occupied += c->pretty_ctx->graph_width;
+ 		padding = (-padding) - occupied;
+ 	}
+@@ -1455,7 +1455,7 @@ static size_t format_and_pad_commit(struct strbuf *sb, /* in UTF-8 */
+ 		placeholder++;
+ 		total_consumed++;
+ 	}
+-	len = utf8_strnwidth(local_sb.buf, -1, 1);
++	len = utf8_strnwidth(local_sb.buf, local_sb.len, 1);
+ 
+ 	if (c->flush_type == flush_left_and_steal) {
+ 		const char *ch = sb->buf + sb->len - 1;
+diff --git a/utf8.c b/utf8.c
+index 5c8f151..a66984b 100644
+--- a/utf8.c
++++ b/utf8.c
+@@ -206,13 +206,11 @@ int utf8_width(const char **start, size_t *remainder_p)
+  * string, assuming that the string is utf8.  Returns strlen() instead
+  * if the string does not look like a valid utf8 string.
+  */
+-int utf8_strnwidth(const char *string, int len, int skip_ansi)
++int utf8_strnwidth(const char *string, size_t len, int skip_ansi)
+ {
+ 	int width = 0;
+ 	const char *orig = string;
+ 
+-	if (len == -1)
+-		len = strlen(string);
+ 	while (string && string < orig + len) {
+ 		int skip;
+ 		while (skip_ansi &&
+@@ -225,7 +223,7 @@ int utf8_strnwidth(const char *string, int len, int skip_ansi)
+ 
+ int utf8_strwidth(const char *string)
+ {
+-	return utf8_strnwidth(string, -1, 0);
++	return utf8_strnwidth(string, strlen(string), 0);
+ }
+ 
+ int is_utf8(const char *text)
+@@ -792,7 +790,7 @@ int skip_utf8_bom(char **text, size_t len)
+ void strbuf_utf8_align(struct strbuf *buf, align_type position, unsigned int width,
+ 		       const char *s)
+ {
+-	int slen = strlen(s);
++	size_t slen = strlen(s);
+ 	int display_len = utf8_strnwidth(s, slen, 0);
+ 	int utf8_compensation = slen - display_len;
+ 
+diff --git a/utf8.h b/utf8.h
+index fcd5167..6da1b6d 100644
+--- a/utf8.h
++++ b/utf8.h
+@@ -7,7 +7,7 @@ typedef unsigned int ucs_char_t;  /* assuming 32bit int */
+ 
+ size_t display_mode_esc_sequence_len(const char *s);
+ int utf8_width(const char **start, size_t *remainder_p);
+-int utf8_strnwidth(const char *string, int len, int skip_ansi);
++int utf8_strnwidth(const char *string, size_t len, int skip_ansi);
+ int utf8_strwidth(const char *string);
+ int is_utf8(const char *text);
+ int is_encoding_utf8(const char *name);
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-08.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-08.patch
new file mode 100644
index 0000000000..3de6a5ba6a
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-08.patch
@@ -0,0 +1,67 @@
+From 17d23e8a3812a5ca3dd6564e74d5250f22e5d76d Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:47:00 +0100
+Subject: [PATCH 08/12] utf8: fix returning negative string width
+
+The `utf8_strnwidth()` function calls `utf8_width()` in a loop and adds
+its returned width to the end result. `utf8_width()` can return `-1`
+though in case it reads a control character, which means that the
+computed string width is going to be wrong. In the worst case where
+there are more control characters than non-control characters, we may
+even return a negative string width.
+
+Fix this bug by treating control characters as having zero width.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/17d23e8a3812a5ca3dd6564e74d5250f22e5d76d]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ t/t4205-log-pretty-formats.sh | 6 ++++++
+ utf8.c                        | 8 ++++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index 23ac508..261a6f0 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -820,6 +820,12 @@ test_expect_success SIZE_T_IS_64BIT 'log --pretty with overflowing wrapping dire
+ 	test_cmp expect error
+ '
+ 
++test_expect_success 'log --pretty with padding and preceding control chars' '
++	printf "\20\20   0" >expect &&
++	git log -1 --pretty="format:%x10%x10%>|(4)%x30" >actual &&
++	test_cmp expect actual
++'
++
+ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
+ 	# We only assert that this command does not crash. This needs to be
+ 	# executed with the address sanitizer to demonstrate failure.
+diff --git a/utf8.c b/utf8.c
+index a66984b..6632bd2 100644
+--- a/utf8.c
++++ b/utf8.c
+@@ -212,11 +212,15 @@ int utf8_strnwidth(const char *string, size_t len, int skip_ansi)
+ 	const char *orig = string;
+ 
+ 	while (string && string < orig + len) {
+-		int skip;
++		int glyph_width, skip;
++
+ 		while (skip_ansi &&
+ 		       (skip = display_mode_esc_sequence_len(string)) != 0)
+ 			string += skip;
+-		width += utf8_width(&string, NULL);
++
++		glyph_width = utf8_width(&string, NULL);
++		if (glyph_width > 0)
++			width += glyph_width;
+ 	}
+ 	return string ? width : len;
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-09.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-09.patch
new file mode 100644
index 0000000000..761d4c6a9f
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-09.patch
@@ -0,0 +1,162 @@
+From 937b71cc8b5b998963a7f9a33312ba3549d55510 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:47:04 +0100
+Subject: [PATCH 09/12] utf8: fix overflow when returning string width
+
+The return type of both `utf8_strwidth()` and `utf8_strnwidth()` is
+`int`, but we operate on string lengths which are typically of type
+`size_t`. This means that when the string is longer than `INT_MAX`, we
+will overflow and thus return a negative result.
+
+This can lead to an out-of-bounds write with `--pretty=format:%<1)%B`
+and a commit message that is 2^31+1 bytes long:
+
+    =================================================================
+    ==26009==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x603000001168 at pc 0x7f95c4e5f427 bp 0x7ffd8541c900 sp 0x7ffd8541c0a8
+    WRITE of size 2147483649 at 0x603000001168 thread T0
+        #0 0x7f95c4e5f426 in __interceptor_memcpy /usr/src/debug/gcc/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:827
+        #1 0x5612bbb1068c in format_and_pad_commit pretty.c:1763
+        #2 0x5612bbb1087a in format_commit_item pretty.c:1801
+        #3 0x5612bbc33bab in strbuf_expand strbuf.c:429
+        #4 0x5612bbb110e7 in repo_format_commit_message pretty.c:1869
+        #5 0x5612bbb12d96 in pretty_print_commit pretty.c:2161
+        #6 0x5612bba0a4d5 in show_log log-tree.c:781
+        #7 0x5612bba0d6c7 in log_tree_commit log-tree.c:1117
+        #8 0x5612bb691ed5 in cmd_log_walk_no_free builtin/log.c:508
+        #9 0x5612bb69235b in cmd_log_walk builtin/log.c:549
+        #10 0x5612bb6951a2 in cmd_log builtin/log.c:883
+        #11 0x5612bb56c993 in run_builtin git.c:466
+        #12 0x5612bb56d397 in handle_builtin git.c:721
+        #13 0x5612bb56db07 in run_argv git.c:788
+        #14 0x5612bb56e8a7 in cmd_main git.c:923
+        #15 0x5612bb803682 in main common-main.c:57
+        #16 0x7f95c4c3c28f  (/usr/lib/libc.so.6+0x2328f)
+        #17 0x7f95c4c3c349 in __libc_start_main (/usr/lib/libc.so.6+0x23349)
+        #18 0x5612bb5680e4 in _start ../sysdeps/x86_64/start.S:115
+
+    0x603000001168 is located 0 bytes to the right of 24-byte region [0x603000001150,0x603000001168)
+    allocated by thread T0 here:
+        #0 0x7f95c4ebe7ea in __interceptor_realloc /usr/src/debug/gcc/libsanitizer/asan/asan_malloc_linux.cpp:85
+        #1 0x5612bbcdd556 in xrealloc wrapper.c:136
+        #2 0x5612bbc310a3 in strbuf_grow strbuf.c:99
+        #3 0x5612bbc32acd in strbuf_add strbuf.c:298
+        #4 0x5612bbc33aec in strbuf_expand strbuf.c:418
+        #5 0x5612bbb110e7 in repo_format_commit_message pretty.c:1869
+        #6 0x5612bbb12d96 in pretty_print_commit pretty.c:2161
+        #7 0x5612bba0a4d5 in show_log log-tree.c:781
+        #8 0x5612bba0d6c7 in log_tree_commit log-tree.c:1117
+        #9 0x5612bb691ed5 in cmd_log_walk_no_free builtin/log.c:508
+        #10 0x5612bb69235b in cmd_log_walk builtin/log.c:549
+        #11 0x5612bb6951a2 in cmd_log builtin/log.c:883
+        #12 0x5612bb56c993 in run_builtin git.c:466
+        #13 0x5612bb56d397 in handle_builtin git.c:721
+        #14 0x5612bb56db07 in run_argv git.c:788
+        #15 0x5612bb56e8a7 in cmd_main git.c:923
+        #16 0x5612bb803682 in main common-main.c:57
+        #17 0x7f95c4c3c28f  (/usr/lib/libc.so.6+0x2328f)
+
+    SUMMARY: AddressSanitizer: heap-buffer-overflow /usr/src/debug/gcc/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:827 in __interceptor_memcpy
+    Shadow bytes around the buggy address:
+      0x0c067fff81d0: fd fd fd fa fa fa fd fd fd fa fa fa fd fd fd fa
+      0x0c067fff81e0: fa fa fd fd fd fd fa fa fd fd fd fd fa fa fd fd
+      0x0c067fff81f0: fd fa fa fa fd fd fd fa fa fa fd fd fd fa fa fa
+      0x0c067fff8200: fd fd fd fa fa fa fd fd fd fd fa fa 00 00 00 fa
+      0x0c067fff8210: fa fa fd fd fd fa fa fa fd fd fd fa fa fa fd fd
+    =>0x0c067fff8220: fd fa fa fa fd fd fd fa fa fa 00 00 00[fa]fa fa
+      0x0c067fff8230: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff8240: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff8250: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff8260: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+      0x0c067fff8270: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    Shadow byte legend (one shadow byte represents 8 application bytes):
+      Addressable:           00
+      Partially addressable: 01 02 03 04 05 06 07
+      Heap left redzone:       fa
+      Freed heap region:       fd
+      Stack left redzone:      f1
+      Stack mid redzone:       f2
+      Stack right redzone:     f3
+      Stack after return:      f5
+      Stack use after scope:   f8
+      Global redzone:          f9
+      Global init order:       f6
+      Poisoned by user:        f7
+      Container overflow:      fc
+      Array cookie:            ac
+      Intra object redzone:    bb
+      ASan internal:           fe
+      Left alloca redzone:     ca
+      Right alloca redzone:    cb
+    ==26009==ABORTING
+
+Now the proper fix for this would be to convert both functions to return
+an `size_t` instead of an `int`. But given that this commit may be part
+of a security release, let's instead do the minimal viable fix and die
+in case we see an overflow.
+
+Add a test that would have previously caused us to crash.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/937b71cc8b5b998963a7f9a33312ba3549d55510]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ t/t4205-log-pretty-formats.sh |  8 ++++++++
+ utf8.c                        | 12 +++++++++---
+ 2 files changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index 261a6f0..de15007 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -843,4 +843,12 @@ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit mes
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message does not cause allocation failure' '
++	test_must_fail git log -1 --format="%<(1)%B" $huge_commit 2>error &&
++	cat >expect <<-EOF &&
++	fatal: number too large to represent as int on this platform: 2147483649
++	EOF
++	test_cmp expect error
++'
++
+ test_done
+diff --git a/utf8.c b/utf8.c
+index 6632bd2..03be475 100644
+--- a/utf8.c
++++ b/utf8.c
+@@ -208,11 +208,12 @@ int utf8_width(const char **start, size_t *remainder_p)
+  */
+ int utf8_strnwidth(const char *string, size_t len, int skip_ansi)
+ {
+-	int width = 0;
+ 	const char *orig = string;
++	size_t width = 0;
+ 
+ 	while (string && string < orig + len) {
+-		int glyph_width, skip;
++		int glyph_width;
++		size_t skip;
+ 
+ 		while (skip_ansi &&
+ 		       (skip = display_mode_esc_sequence_len(string)) != 0)
+@@ -222,7 +223,12 @@ int utf8_strnwidth(const char *string, size_t len, int skip_ansi)
+ 		if (glyph_width > 0)
+ 			width += glyph_width;
+ 	}
+-	return string ? width : len;
++
++	/*
++	 * TODO: fix the interface of this function and `utf8_strwidth()` to
++	 * return `size_t` instead of `int`.
++	 */
++	return cast_size_t_to_int(string ? width : len);
+ }
+ 
+ int utf8_strwidth(const char *string)
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-10.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-10.patch
new file mode 100644
index 0000000000..bbfc6e758f
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-10.patch
@@ -0,0 +1,99 @@
+From 81c2d4c3a5ba0e6ab8c348708441fed170e63a82 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:47:10 +0100
+Subject: [PATCH 10/12] utf8: fix checking for glyph width in strbuf_utf8_replace()
+
+In `strbuf_utf8_replace()`, we call `utf8_width()` to compute the width
+of the current glyph. If the glyph is a control character though it can
+be that `utf8_width()` returns `-1`, but because we assign this value to
+a `size_t` the conversion will cause us to underflow. This bug can
+easily be triggered with the following command:
+
+    $ git log --pretty='format:xxx%<|(1,trunc)%x10'
+
+>From all I can see though this seems to be a benign underflow that has
+no security-related consequences.
+
+Fix the bug by using an `int` instead. When we see a control character,
+we now copy it into the target buffer but don't advance the current
+width of the string.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/81c2d4c3a5ba0e6ab8c348708441fed170e63a82]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ t/t4205-log-pretty-formats.sh |  7 +++++++
+ utf8.c                        | 19 ++++++++++++++-----
+ 2 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index de15007..52c8bc8 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -826,6 +826,13 @@ test_expect_success 'log --pretty with padding and preceding control chars' '
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success 'log --pretty truncation with control chars' '
++	test_commit "$(printf "\20\20\20\20xxxx")" file contents commit-with-control-chars &&
++	printf "\20\20\20\20x.." >expect &&
++	git log -1 --pretty="format:%<(3,trunc)%s" commit-with-control-chars >actual &&
++	test_cmp expect actual
++'
++
+ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT 'log --pretty with huge commit message' '
+ 	# We only assert that this command does not crash. This needs to be
+ 	# executed with the address sanitizer to demonstrate failure.
+diff --git a/utf8.c b/utf8.c
+index 03be475..ec03e69 100644
+--- a/utf8.c
++++ b/utf8.c
+@@ -377,6 +377,7 @@ void strbuf_utf8_replace(struct strbuf *sb_src, int pos, int width,
+ 	dst = sb_dst.buf;
+ 
+ 	while (src < end) {
++		int glyph_width;
+ 		char *old;
+ 		size_t n;
+ 
+@@ -390,21 +391,29 @@ void strbuf_utf8_replace(struct strbuf *sb_src, int pos, int width,
+ 			break;
+ 
+ 		old = src;
+-		n = utf8_width((const char**)&src, NULL);
+-		if (!src) 	/* broken utf-8, do nothing */
++		glyph_width = utf8_width((const char**)&src, NULL);
++		if (!src) /* broken utf-8, do nothing */
+ 			goto out;
+-		if (n && w >= pos && w < pos + width) {
++
++		/*
++		 * In case we see a control character we copy it into the
++		 * buffer, but don't add it to the width.
++		 */
++		if (glyph_width < 0)
++			glyph_width = 0;
++
++		if (glyph_width && w >= pos && w < pos + width) {
+ 			if (subst) {
+ 				memcpy(dst, subst, subst_len);
+ 				dst += subst_len;
+ 				subst = NULL;
+ 			}
+-			w += n;
++			w += glyph_width;
+ 			continue;
+ 		}
+ 		memcpy(dst, old, src - old);
+ 		dst += src - old;
+-		w += n;
++		w += glyph_width;
+ 	}
+ 	strbuf_setlen(&sb_dst, dst - sb_dst.buf);
+ 	strbuf_swap(sb_src, &sb_dst);
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-11.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-11.patch
new file mode 100644
index 0000000000..f339edfc8a
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-11.patch
@@ -0,0 +1,90 @@
+From f930a2394303b902e2973f4308f96529f736b8bc Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:47:15 +0100
+Subject: [PATCH 11/12] utf8: refactor strbuf_utf8_replace to not rely on preallocated buffer
+
+In `strbuf_utf8_replace`, we preallocate the destination buffer and then
+use `memcpy` to copy bytes into it at computed offsets. This feels
+rather fragile and is hard to understand at times. Refactor the code to
+instead use `strbuf_add` and `strbuf_addstr` so that we can be sure that
+there is no possibility to perform an out-of-bounds write.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/f930a2394303b902e2973f4308f96529f736b8bc]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ utf8.c | 34 +++++++++++++---------------------
+ 1 file changed, 13 insertions(+), 21 deletions(-)
+
+diff --git a/utf8.c b/utf8.c
+index ec03e69..a13f5e3 100644
+--- a/utf8.c
++++ b/utf8.c
+@@ -365,26 +365,20 @@ void strbuf_add_wrapped_bytes(struct strbuf *buf, const char *data, int len,
+ void strbuf_utf8_replace(struct strbuf *sb_src, int pos, int width,
+ 			 const char *subst)
+ {
+-	struct strbuf sb_dst = STRBUF_INIT;
+-	char *src = sb_src->buf;
+-	char *end = src + sb_src->len;
+-	char *dst;
+-	int w = 0, subst_len = 0;
++	const char *src = sb_src->buf, *end = sb_src->buf + sb_src->len;
++	struct strbuf dst;
++	int w = 0;
+ 
+-	if (subst)
+-		subst_len = strlen(subst);
+-	strbuf_grow(&sb_dst, sb_src->len + subst_len);
+-	dst = sb_dst.buf;
++	strbuf_init(&dst, sb_src->len);
+ 
+ 	while (src < end) {
++		const char *old;
+ 		int glyph_width;
+-		char *old;
+ 		size_t n;
+ 
+ 		while ((n = display_mode_esc_sequence_len(src))) {
+-			memcpy(dst, src, n);
++			strbuf_add(&dst, src, n);
+ 			src += n;
+-			dst += n;
+ 		}
+ 
+ 		if (src >= end)
+@@ -404,21 +398,19 @@ void strbuf_utf8_replace(struct strbuf *sb_src, int pos, int width,
+ 
+ 		if (glyph_width && w >= pos && w < pos + width) {
+ 			if (subst) {
+-				memcpy(dst, subst, subst_len);
+-				dst += subst_len;
++				strbuf_addstr(&dst, subst);
+ 				subst = NULL;
+ 			}
+-			w += glyph_width;
+-			continue;
++		} else {
++			strbuf_add(&dst, old, src - old);
+ 		}
+-		memcpy(dst, old, src - old);
+-		dst += src - old;
++
+ 		w += glyph_width;
+ 	}
+-	strbuf_setlen(&sb_dst, dst - sb_dst.buf);
+-	strbuf_swap(sb_src, &sb_dst);
++
++	strbuf_swap(sb_src, &dst);
+ out:
+-	strbuf_release(&sb_dst);
++	strbuf_release(&dst);
+ }
+ 
+ /*
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/files/CVE-2022-41903-12.patch b/meta/recipes-devtools/git/files/CVE-2022-41903-12.patch
new file mode 100644
index 0000000000..978865978d
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-41903-12.patch
@@ -0,0 +1,124 @@
+From 304a50adff6480ede46b68f7545baab542cbfb46 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:47:23 +0100
+Subject: [PATCH 12/12] pretty: restrict input lengths for padding and wrapping formats
+
+Both the padding and wrapping formatting directives allow the caller to
+specify an integer that ultimately leads to us adding this many chars to
+the result buffer. As a consequence, it is trivial to e.g. allocate 2GB
+of RAM via a single formatting directive and cause resource exhaustion
+on the machine executing this logic. Furthermore, it is debatable
+whether there are any sane usecases that require the user to pad data to
+2GB boundaries or to indent wrapped data by 2GB.
+
+Restrict the input sizes to 16 kilobytes at a maximum to limit the
+amount of bytes that can be requested by the user. This is not meant
+as a fix because there are ways to trivially amplify the amount of
+data we generate via formatting directives; the real protection is
+achieved by the changes in previous steps to catch and avoid integer
+wraparound that causes us to under-allocate and access beyond the
+end of allocated memory reagions. But having such a limit
+significantly helps fuzzing the pretty format, because the fuzzer is
+otherwise quite fast to run out-of-memory as it discovers these
+formatters.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/304a50adff6480ede46b68f7545baab542cbfb46]
+CVE: CVE-2022-41903
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pretty.c                      | 26 ++++++++++++++++++++++++++
+ t/t4205-log-pretty-formats.sh | 24 +++++++++++++++---------
+ 2 files changed, 41 insertions(+), 9 deletions(-)
+
+diff --git a/pretty.c b/pretty.c
+index c3c1443..e9687f0 100644
+--- a/pretty.c
++++ b/pretty.c
+@@ -13,6 +13,13 @@
+ #include "gpg-interface.h"
+ #include "trailer.h"
+ 
++/*
++ * The limit for formatting directives, which enable the caller to append
++ * arbitrarily many bytes to the formatted buffer. This includes padding
++ * and wrapping formatters.
++ */
++#define FORMATTING_LIMIT (16 * 1024)
++
+ static char *user_format;
+ static struct cmt_fmt_map {
+ 	const char *name;
+@@ -1029,6 +1036,15 @@ static size_t parse_padding_placeholder(const char *placeholder,
+ 		if (!*end || end == start)
+ 			return 0;
+ 		width = strtol(start, &next, 10);
++
++		/*
++		 * We need to limit the amount of padding, or otherwise this
++		 * would allow the user to pad the buffer by arbitrarily many
++		 * bytes and thus cause resource exhaustion.
++		 */
++		if (width < -FORMATTING_LIMIT || width > FORMATTING_LIMIT)
++			return 0;
++
+ 		if (next == start || width == 0)
+ 			return 0;
+ 		if (width < 0) {
+@@ -1188,6 +1204,16 @@ static size_t format_commit_one(struct strbuf *sb, /* in UTF-8 */
+ 				if (*next != ')')
+ 					return 0;
+ 			}
++
++			/*
++			 * We need to limit the format here as it allows the
++			 * user to prepend arbitrarily many bytes to the buffer
++			 * when rewrapping.
++			 */
++			if (width > FORMATTING_LIMIT ||
++			    indent1 > FORMATTING_LIMIT ||
++			    indent2 > FORMATTING_LIMIT)
++				return 0;
+ 			rewrap_message_tail(sb, c, width, indent1, indent2);
+ 			return end - placeholder + 1;
+ 		} else
+diff --git a/t/t4205-log-pretty-formats.sh b/t/t4205-log-pretty-formats.sh
+index 52c8bc8..572d02f 100755
+--- a/t/t4205-log-pretty-formats.sh
++++ b/t/t4205-log-pretty-formats.sh
+@@ -809,15 +809,21 @@ test_expect_success 'log --pretty with magical wrapping directives' '
+ '
+ 
+ test_expect_success SIZE_T_IS_64BIT 'log --pretty with overflowing wrapping directive' '
+-	cat >expect <<-EOF &&
+-	fatal: number too large to represent as int on this platform: 2147483649
+-	EOF
+-	test_must_fail git log -1 --pretty="format:%w(2147483649,1,1)%d" 2>error &&
+-	test_cmp expect error &&
+-	test_must_fail git log -1 --pretty="format:%w(1,2147483649,1)%d" 2>error &&
+-	test_cmp expect error &&
+-	test_must_fail git log -1 --pretty="format:%w(1,1,2147483649)%d" 2>error &&
+-	test_cmp expect error
++	printf "%%w(2147483649,1,1)0" >expect &&
++	git log -1 --pretty="format:%w(2147483649,1,1)%x30" >actual &&
++	test_cmp expect actual &&
++	printf "%%w(1,2147483649,1)0" >expect &&
++	git log -1 --pretty="format:%w(1,2147483649,1)%x30" >actual &&
++	test_cmp expect actual &&
++	printf "%%w(1,1,2147483649)0" >expect &&
++	git log -1 --pretty="format:%w(1,1,2147483649)%x30" >actual &&
++	test_cmp expect actual
++'
++
++test_expect_success SIZE_T_IS_64BIT 'log --pretty with overflowing padding directive' '
++	printf "%%<(2147483649)0" >expect &&
++	git log -1 --pretty="format:%<(2147483649)%x30" >actual &&
++	test_cmp expect actual
+ '
+ 
+ test_expect_success 'log --pretty with padding and preceding control chars' '
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ed6308ea2d..3c4c0fd37b 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -12,6 +12,18 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://CVE-2021-40330.patch \
            file://CVE-2022-23521.patch \
+           file://CVE-2022-41903-01.patch \
+           file://CVE-2022-41903-02.patch \
+           file://CVE-2022-41903-03.patch \
+           file://CVE-2022-41903-04.patch \
+           file://CVE-2022-41903-05.patch \
+           file://CVE-2022-41903-06.patch \
+           file://CVE-2022-41903-07.patch \
+           file://CVE-2022-41903-08.patch \
+           file://CVE-2022-41903-09.patch \
+           file://CVE-2022-41903-10.patch \
+           file://CVE-2022-41903-11.patch \
+           file://CVE-2022-41903-12.patch \
            "
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.34.1


