Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17424C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12399.1668951089776424167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UH83ov2B;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d9so16197945wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7h7XRgcsiDCm3AG8zHMkXpWlhuTaRA/R4xZKez3JMMM=;
        b=UH83ov2BQX+gOAU76vvIAJpr+L4NtlKRzvmoWQXG8IYhs+MgyKE5DvIoPbRS/FCujm
         xvqzpPzYXaOe8SaHAVL30/ln7oQHAnIvO9IRhDiOWHnTxmrbqNCTPiZdfI43D5bpDy7e
         598SgkJyIT9QFK5PMKDPcD/EA/w6qBYT6aE2jTeL1o99l9yZZM85sqLcL2bLTGIsEu5x
         h92NY1SfQZYmBnGHQSyxI4sV9F1HPWiyUnMjS1YaGTnhibrjlyBWOLeXYNegoW73tFNb
         /QigNTtfF10l3c8n6DpTz3XJsXf12M3XmN6UeEgGdKUfr2FsVVlCJeP0djYeiCPcU+K9
         SCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h7XRgcsiDCm3AG8zHMkXpWlhuTaRA/R4xZKez3JMMM=;
        b=ibEsPD+z9JdI2sViFmgujmoinv3S715VZx1efke3kLANxJQSUdZ8Y8KW71x7KaPBHf
         MIY4Ey3p44+nVpFy3uSl1r78yMYxyYHnVrmen0O6WOvXomKXoeO56z7ZpHAPt9doZXeC
         VbqgVfZODHH7+52xw8fcKLfDDE27sw/c0Qad3WxRYm284cuiYV6NPs2keJOgPMg+JFTY
         7mgW4SA8O5uz5uaXAX3x6lnD2bkmQCTJdPh1+X+3/qH6lbXu1ifnb7VYZ78OB+SO0sae
         GPkiPzwJhxGdk7EwYDscho9GLtYBxQ5V0AJHahKXK7wgLak8wKYFQ73ByPla0vfoVhh+
         o2CA==
X-Gm-Message-State: ANoB5pkcJAcVmdoh8KbZKCcX1TufLblcClzVtJDKaQCNKhMGQUOjNh7E
	6tKQFHzRC4Emm4x2ZPo53GW/WAGAY1E=
X-Google-Smtp-Source: AA0mqf7iCqynVg9eoFAmgZ43pOp0XmqiR4pLEPp+Jar6wxDi4jj9wKkR++ml2yuhhPD7LhrQytSM8g==
X-Received: by 2002:adf:d085:0:b0:241:b3d6:d6a0 with SMTP id y5-20020adfd085000000b00241b3d6d6a0mr8832626wrh.617.1668951087926;
        Sun, 20 Nov 2022 05:31:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/17] elfutils: update 0.187 -> 0.188
Date: Sun, 20 Nov 2022 14:31:06 +0100
Message-Id: <20221120133122.2464634-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173582

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{elfutils_0.187.bb => elfutils_0.188.bb}  |   5 +-
 ...Add-libeu-to-tests-needing-error-API.patch | 147 ------------------
 ...m-compile-test_nlist-with-standard-C.patch |   8 +-
 3 files changed, 6 insertions(+), 154 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.187.bb => elfutils_0.188.bb} (98%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.187.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.187.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.188.bb
index 40c51c8814..43f5b2e56c 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.187.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
@@ -11,6 +11,7 @@ DEPENDS:append:libc-musl = " argp-standalone fts musl-obstack "
 # The Debian patches below are from:
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
+           file://run-ptest \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
@@ -18,16 +19,14 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
-           file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-tests-Add-libeu-to-tests-needing-error-API.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "e70b0dfbe610f90c4d1fe0d71af142a4e25c3c4ef9ebab8d2d72b65159d454c8"
+SRC_URI[sha256sum] = "fb8b0e8d0802005b9a309c60c1d8de32dd2951b56f0c3a3cb56d21ce01595dff"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch
deleted file mode 100644
index 7c1bc87cbf..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From c05c787070a390a2061bfcb845e1e35e8b1373b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 13 Sep 2022 09:33:00 -0700
-Subject: [PATCH] tests: Add libeu to tests needing error() API
-
-A local error() impelmentation is used when libc does not provide it,
-therefore link in libeu.a which contains this function in tests needing
-error() API
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2022q3/005375.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/Makefile.am | 60 +++++++++++++++++++++++------------------------
- 1 file changed, 30 insertions(+), 30 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3943e17..1acc49b 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -638,17 +638,17 @@ libeu = ../lib/libeu.a
- arextract_LDADD = $(libelf)
- arsymtest_LDADD = $(libelf)
- newfile_LDADD = $(libelf)
--saridx_LDADD = $(libelf)
-+saridx_LDADD = $(libeu) $(libelf)
- scnnames_LDADD = $(libelf)
--sectiondump_LDADD = $(libelf)
-+sectiondump_LDADD = $(libeu) $(libelf)
- showptable_LDADD = $(libelf)
- hash_LDADD = $(libelf)
- test_nlist_CFLAGS =-g -O0 $(EXTRA_NLIST_CFLAGS)
- test_nlist_LDADD = $(libelf)
- msg_tst_LDADD = $(libelf)
- newscn_LDADD = $(libelf)
--early_offscn_LDADD = $(libelf)
--ecp_LDADD = $(libelf)
-+early_offscn_LDADD = $(libeu) $(libelf)
-+ecp_LDADD = $(libeu) $(libelf)
- update1_LDADD = $(libelf)
- update2_LDADD = $(libelf)
- update3_LDADD = $(libdw) $(libelf)
-@@ -662,12 +662,12 @@ get_files_LDADD = $(libdw) $(libelf)
- next_files_LDADD = $(libdw) $(libelf)
- get_aranges_LDADD = $(libdw) $(libelf)
- allfcts_LDADD = $(libdw) $(libelf)
--line2addr_LDADD = $(libdw) $(argp_LDADD)
--addrscopes_LDADD = $(libdw) $(argp_LDADD)
--funcscopes_LDADD = $(libdw) $(argp_LDADD)
--funcretval_LDADD = $(libdw) $(argp_LDADD)
--allregs_LDADD = $(libdw) $(argp_LDADD)
--find_prologues_LDADD = $(libdw) $(argp_LDADD)
-+line2addr_LDADD = $(libeu) $(libdw) $(argp_LDADD)
-+addrscopes_LDADD = $(libeu) $(libdw) $(argp_LDADD)
-+funcscopes_LDADD = $(libeu) $(libdw) $(argp_LDADD)
-+funcretval_LDADD = $(libeu) $(libdw) $(argp_LDADD)
-+allregs_LDADD = $(libeu) $(libdw) $(argp_LDADD)
-+find_prologues_LDADD = $(libeu) $(libdw) $(argp_LDADD)
- #show_ciefde_LDADD = ../libdwarf/libdwarf.so $(libelf)
- asm_tst1_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
- asm_tst2_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
-@@ -678,19 +678,19 @@ asm_tst6_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
- asm_tst7_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
- asm_tst8_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
- asm_tst9_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
--dwflmodtest_LDADD = $(libdw) $(libebl) $(libelf) $(argp_LDADD)
--rdwrmmap_LDADD = $(libelf)
-+dwflmodtest_LDADD = $(libeu) $(libdw) $(libebl) $(libelf) $(argp_LDADD)
-+rdwrmmap_LDADD = $(libeu) $(libelf)
- dwfl_bug_addr_overflow_LDADD = $(libdw) $(libebl) $(libelf)
- arls_LDADD = $(libelf)
--dwfl_bug_fd_leak_LDADD = $(libdw) $(libebl) $(libelf)
-+dwfl_bug_fd_leak_LDADD = $(libeu) $(libdw) $(libebl) $(libelf)
- dwfl_bug_report_LDADD = $(libdw) $(libebl) $(libelf)
--dwfl_bug_getmodules_LDADD = $(libdw) $(libebl) $(libelf)
--dwfl_addr_sect_LDADD = $(libdw) $(libebl) $(libelf) $(argp_LDADD)
-+dwfl_bug_getmodules_LDADD = $(libeu) $(libdw) $(libebl) $(libelf)
-+dwfl_addr_sect_LDADD = $(libeu) $(libdw) $(libebl) $(libelf) $(argp_LDADD)
- dwarf_getmacros_LDADD = $(libdw)
- dwarf_ranges_LDADD = $(libdw)
- dwarf_getstring_LDADD = $(libdw)
- addrcfi_LDADD = $(libdw) $(libebl) $(libelf) $(argp_LDADD)
--dwarfcfi_LDADD = $(libdw) $(libelf)
-+dwarfcfi_LDADD = $(libeu) $(libdw) $(libelf)
- test_flag_nobits_LDADD = $(libelf)
- rerequest_tag_LDADD = $(libdw)
- alldts_LDADD = $(libdw) $(libelf)
-@@ -699,35 +699,35 @@ typeiter2_LDADD = $(libdw) $(libelf)
- low_high_pc_LDADD = $(libdw) $(libelf) $(argp_LDADD)
- test_elf_cntl_gelf_getshdr_LDADD = $(libelf)
- dwflsyms_LDADD = $(libdw) $(libelf) $(argp_LDADD)
--dwfllines_LDADD = $(libdw) $(libelf) $(argp_LDADD)
--dwfl_report_elf_align_LDADD = $(libdw)
-+dwfllines_LDADD = $(libeu) $(libdw) $(libelf) $(argp_LDADD)
-+dwfl_report_elf_align_LDADD = $(libeu) $(libdw)
- dwfl_report_segment_contiguous_LDADD = $(libdw) $(libebl) $(libelf)
--varlocs_LDADD = $(libdw) $(libelf) $(argp_LDADD)
--backtrace_LDADD = $(libdw) $(libelf) $(argp_LDADD)
-+varlocs_LDADD = $(libeu) $(libdw) $(libelf) $(argp_LDADD)
-+backtrace_LDADD = $(libeu) $(libdw) $(libelf) $(argp_LDADD)
- # backtrace-child-biarch also uses those *_CFLAGS and *_LDLAGS variables:
- backtrace_child_CFLAGS = $(fpie_CFLAGS)
- backtrace_child_LDFLAGS = -pie -pthread
- backtrace_child_biarch_SOURCES = backtrace-child.c
--backtrace_data_LDADD = $(libdw) $(libelf)
-+backtrace_data_LDADD = $(libeu) $(libdw) $(libelf)
- backtrace_dwarf_CFLAGS = -Wno-unused-parameter
--backtrace_dwarf_LDADD = $(libdw) $(libelf)
--debuglink_LDADD = $(libdw) $(libelf)
--debugaltlink_LDADD = $(libdw) $(libelf)
--buildid_LDADD = $(libdw) $(libelf)
-+backtrace_dwarf_LDADD = $(libeu) $(libdw) $(libelf)
-+debuglink_LDADD = $(libeu) $(libdw) $(libelf)
-+debugaltlink_LDADD = $(libeu) $(libdw) $(libelf)
-+buildid_LDADD = $(libeu) $(libdw) $(libelf)
- deleted_LDADD = ./deleted-lib.so
- deleted_lib_so_LDFLAGS = -shared
- deleted_lib_so_CFLAGS = $(fpic_CFLAGS) -fasynchronous-unwind-tables
- aggregate_size_LDADD = $(libdw) $(libelf) $(argp_LDADD)
- peel_type_LDADD = $(libdw) $(libelf) $(argp_LDADD)
--vdsosyms_LDADD = $(libdw) $(libelf)
--getsrc_die_LDADD = $(libdw) $(libelf)
-+vdsosyms_LDADD = $(libeu) $(libdw) $(libelf)
-+getsrc_die_LDADD = $(libeu) $(libdw) $(libelf)
- strptr_LDADD = $(libelf)
- newdata_LDADD = $(libelf)
- elfstrtab_LDADD = $(libelf)
--dwfl_proc_attach_LDADD = $(libdw)
-+dwfl_proc_attach_LDADD = $(libeu) $(libdw)
- dwfl_proc_attach_LDFLAGS = -pthread -rdynamic $(AM_LDFLAGS)
- elfshphehdr_LDADD =$(libelf)
--elfstrmerge_LDADD = $(libdw) $(libelf)
-+elfstrmerge_LDADD = $(libeu) $(libdw) $(libelf)
- dwelfgnucompressed_LDADD = $(libelf) $(libdw)
- elfgetchdr_LDADD = $(libelf) $(libdw)
- elfgetzdata_LDADD = $(libelf)
-@@ -743,7 +743,7 @@ get_units_split_LDADD = $(libdw)
- attr_integrate_skel_LDADD = $(libdw)
- all_dwarf_ranges_LDADD = $(libdw)
- unit_info_LDADD = $(libdw)
--next_cfi_LDADD = $(libelf) $(libdw)
-+next_cfi_LDADD = $(libeu) $(libelf) $(libdw)
- elfcopy_LDADD = $(libelf)
- addsections_LDADD = $(libelf)
- debuginfod_build_id_find_LDADD = $(libelf) $(libdw)
--- 
-2.37.3
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index c494d7f2e5..a2c0b90227 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From 22e0e1c01ec680a2970f4d5ca9e47f90259cbdcf Mon Sep 17 00:00:00 2001
+From e355ca3b8ddcc6e73ee140f53d25634afdaec0da Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index a2dfd43..40a0228 100644
+index 2ade5d9..f85cdba 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -90,7 +90,7 @@ endif
+@@ -98,7 +98,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
@@ -25,4 +25,4 @@ index a2dfd43..40a0228 100644
 +	  $(CFLAGS) $(GCOV_FLAGS) -o $@ $< $(test_nlist_LDADD)
  
  TESTS = run-arextract.sh run-arsymtest.sh run-ar.sh newfile test-nlist \
- 	update1 update2 update3 update4 \
+ 	run-ar-N.sh \
-- 
2.30.2


