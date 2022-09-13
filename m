Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02146ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 16:49:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.7208.1663087743133375102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 09:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HBv9AWC0;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id fv3so11935681pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=1xqOaqsd4AJruylBrAALDn1FF1oXRGE4cw28nMEH2Lw=;
        b=HBv9AWC0Ey61D1BnhsC68Be4aP81rCW5wYEruRiSjgjog+JzB7ahBVa6Pc57JKSwDZ
         NrRTtuGwqY42QRS+FiO9U6KOfXf1VFX6Pu+L9PD7qUvPYfrM/L+TG+L8C5CrHbLhYbJK
         TUy30fPcsjIHz7BzpCKd2vCQR7G2XFBt0wixGeAObLLHdNRRGJ8YbH6lNly+9nwUi1ei
         aEg6rbUNSCMeR3m5pLgXXLiVsbJHZ8VmJvgD9Y7W3xzhRpKoh3xsyVUjnwaAz9fgfD9x
         MjkMY9rHokjND0tBGZHGQ81cPgcdw0P49dJCR08Inqfp1GCPqmregJgXsmZfuHPQGMc5
         rlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=1xqOaqsd4AJruylBrAALDn1FF1oXRGE4cw28nMEH2Lw=;
        b=l3PPf472+Ih4/ilXriG9x53ljDBTOHGEYAqkUYNuyBbOMlKZ6ThlzmuwTgTgjAhmOU
         OHuKaaWAa4+w/7lRZQFtGu3hsQpK+X02ELDseA3G8uHotcGC4cqRMD9deV1AT0LeHEHg
         zzTv60cl++L7Fsj8ATRhSBI3ol8YJLVtFWH1v7+QGWciNo2hDcx97Fnxe/yPKZ1FhaB8
         rkqkACY3kV0X0MMPEgZUJ6cK2li53Voh6AWYbNy4CMaVNEgS9PBtZj4mJnapQc18xP5m
         g/iok75xN/cYNA/FEYxPy+TMFFyH1DIe0EnKChr3xUTPbQQK2cq4CiVy9rXaD727tE3D
         4dbA==
X-Gm-Message-State: ACgBeo3TWr0riguWYIFkHk+1w+2X+h6GBD9QORe+q8pb9hjpi78rfWUp
	kQzQ7HhDVksdUmuYhv/7IRziRkG0xPgPtw==
X-Google-Smtp-Source: 
 AA6agR4fhX3GM/bUMJd9V/53CHnL7lQGE6vtT/HOzogHf9+/i50dlV7le0O1bZi25MpvAKyhX610sQ==
X-Received: by 2002:a17:902:d491:b0:178:2cc3:a4c6 with SMTP id
 c17-20020a170902d49100b001782cc3a4c6mr11670400plg.46.1663087742071;
        Tue, 13 Sep 2022 09:49:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 k14-20020a17090a590e00b001f216407204sm7393588pji.36.2022.09.13.09.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 09:49:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] elfutils: Enable ptests on musl targets
Date: Tue, 13 Sep 2022 09:48:59 -0700
Message-Id: <20220913164859.2688850-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 16:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170602

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils_0.187.bb                |   2 +-
 ...Add-libeu-to-tests-needing-error-API.patch | 147 ++++++++++++++++++
 2 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.187.bb b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
index 561112c580..aadff1a03c 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.187.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://0001-tests-Add-libeu-to-tests-needing-error-API.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
@@ -29,7 +30,6 @@ SRC_URI:append:libc-musl = " \
 SRC_URI[sha256sum] = "e70b0dfbe610f90c4d1fe0d71af142a4e25c3c4ef9ebab8d2d72b65159d454c8"
 
 inherit autotools gettext ptest pkgconfig
-PTEST_ENABLED:libc-musl = "0"
 
 EXTRA_OECONF = "--program-prefix=eu-"
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch
new file mode 100644
index 0000000000..7c1bc87cbf
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch
@@ -0,0 +1,147 @@
+From c05c787070a390a2061bfcb845e1e35e8b1373b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 13 Sep 2022 09:33:00 -0700
+Subject: [PATCH] tests: Add libeu to tests needing error() API
+
+A local error() impelmentation is used when libc does not provide it,
+therefore link in libeu.a which contains this function in tests needing
+error() API
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2022q3/005375.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/Makefile.am | 60 +++++++++++++++++++++++------------------------
+ 1 file changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 3943e17..1acc49b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -638,17 +638,17 @@ libeu = ../lib/libeu.a
+ arextract_LDADD = $(libelf)
+ arsymtest_LDADD = $(libelf)
+ newfile_LDADD = $(libelf)
+-saridx_LDADD = $(libelf)
++saridx_LDADD = $(libeu) $(libelf)
+ scnnames_LDADD = $(libelf)
+-sectiondump_LDADD = $(libelf)
++sectiondump_LDADD = $(libeu) $(libelf)
+ showptable_LDADD = $(libelf)
+ hash_LDADD = $(libelf)
+ test_nlist_CFLAGS =-g -O0 $(EXTRA_NLIST_CFLAGS)
+ test_nlist_LDADD = $(libelf)
+ msg_tst_LDADD = $(libelf)
+ newscn_LDADD = $(libelf)
+-early_offscn_LDADD = $(libelf)
+-ecp_LDADD = $(libelf)
++early_offscn_LDADD = $(libeu) $(libelf)
++ecp_LDADD = $(libeu) $(libelf)
+ update1_LDADD = $(libelf)
+ update2_LDADD = $(libelf)
+ update3_LDADD = $(libdw) $(libelf)
+@@ -662,12 +662,12 @@ get_files_LDADD = $(libdw) $(libelf)
+ next_files_LDADD = $(libdw) $(libelf)
+ get_aranges_LDADD = $(libdw) $(libelf)
+ allfcts_LDADD = $(libdw) $(libelf)
+-line2addr_LDADD = $(libdw) $(argp_LDADD)
+-addrscopes_LDADD = $(libdw) $(argp_LDADD)
+-funcscopes_LDADD = $(libdw) $(argp_LDADD)
+-funcretval_LDADD = $(libdw) $(argp_LDADD)
+-allregs_LDADD = $(libdw) $(argp_LDADD)
+-find_prologues_LDADD = $(libdw) $(argp_LDADD)
++line2addr_LDADD = $(libeu) $(libdw) $(argp_LDADD)
++addrscopes_LDADD = $(libeu) $(libdw) $(argp_LDADD)
++funcscopes_LDADD = $(libeu) $(libdw) $(argp_LDADD)
++funcretval_LDADD = $(libeu) $(libdw) $(argp_LDADD)
++allregs_LDADD = $(libeu) $(libdw) $(argp_LDADD)
++find_prologues_LDADD = $(libeu) $(libdw) $(argp_LDADD)
+ #show_ciefde_LDADD = ../libdwarf/libdwarf.so $(libelf)
+ asm_tst1_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
+ asm_tst2_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
+@@ -678,19 +678,19 @@ asm_tst6_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
+ asm_tst7_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
+ asm_tst8_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
+ asm_tst9_LDADD = $(libasm) $(libebl) $(libelf) $(libdw)
+-dwflmodtest_LDADD = $(libdw) $(libebl) $(libelf) $(argp_LDADD)
+-rdwrmmap_LDADD = $(libelf)
++dwflmodtest_LDADD = $(libeu) $(libdw) $(libebl) $(libelf) $(argp_LDADD)
++rdwrmmap_LDADD = $(libeu) $(libelf)
+ dwfl_bug_addr_overflow_LDADD = $(libdw) $(libebl) $(libelf)
+ arls_LDADD = $(libelf)
+-dwfl_bug_fd_leak_LDADD = $(libdw) $(libebl) $(libelf)
++dwfl_bug_fd_leak_LDADD = $(libeu) $(libdw) $(libebl) $(libelf)
+ dwfl_bug_report_LDADD = $(libdw) $(libebl) $(libelf)
+-dwfl_bug_getmodules_LDADD = $(libdw) $(libebl) $(libelf)
+-dwfl_addr_sect_LDADD = $(libdw) $(libebl) $(libelf) $(argp_LDADD)
++dwfl_bug_getmodules_LDADD = $(libeu) $(libdw) $(libebl) $(libelf)
++dwfl_addr_sect_LDADD = $(libeu) $(libdw) $(libebl) $(libelf) $(argp_LDADD)
+ dwarf_getmacros_LDADD = $(libdw)
+ dwarf_ranges_LDADD = $(libdw)
+ dwarf_getstring_LDADD = $(libdw)
+ addrcfi_LDADD = $(libdw) $(libebl) $(libelf) $(argp_LDADD)
+-dwarfcfi_LDADD = $(libdw) $(libelf)
++dwarfcfi_LDADD = $(libeu) $(libdw) $(libelf)
+ test_flag_nobits_LDADD = $(libelf)
+ rerequest_tag_LDADD = $(libdw)
+ alldts_LDADD = $(libdw) $(libelf)
+@@ -699,35 +699,35 @@ typeiter2_LDADD = $(libdw) $(libelf)
+ low_high_pc_LDADD = $(libdw) $(libelf) $(argp_LDADD)
+ test_elf_cntl_gelf_getshdr_LDADD = $(libelf)
+ dwflsyms_LDADD = $(libdw) $(libelf) $(argp_LDADD)
+-dwfllines_LDADD = $(libdw) $(libelf) $(argp_LDADD)
+-dwfl_report_elf_align_LDADD = $(libdw)
++dwfllines_LDADD = $(libeu) $(libdw) $(libelf) $(argp_LDADD)
++dwfl_report_elf_align_LDADD = $(libeu) $(libdw)
+ dwfl_report_segment_contiguous_LDADD = $(libdw) $(libebl) $(libelf)
+-varlocs_LDADD = $(libdw) $(libelf) $(argp_LDADD)
+-backtrace_LDADD = $(libdw) $(libelf) $(argp_LDADD)
++varlocs_LDADD = $(libeu) $(libdw) $(libelf) $(argp_LDADD)
++backtrace_LDADD = $(libeu) $(libdw) $(libelf) $(argp_LDADD)
+ # backtrace-child-biarch also uses those *_CFLAGS and *_LDLAGS variables:
+ backtrace_child_CFLAGS = $(fpie_CFLAGS)
+ backtrace_child_LDFLAGS = -pie -pthread
+ backtrace_child_biarch_SOURCES = backtrace-child.c
+-backtrace_data_LDADD = $(libdw) $(libelf)
++backtrace_data_LDADD = $(libeu) $(libdw) $(libelf)
+ backtrace_dwarf_CFLAGS = -Wno-unused-parameter
+-backtrace_dwarf_LDADD = $(libdw) $(libelf)
+-debuglink_LDADD = $(libdw) $(libelf)
+-debugaltlink_LDADD = $(libdw) $(libelf)
+-buildid_LDADD = $(libdw) $(libelf)
++backtrace_dwarf_LDADD = $(libeu) $(libdw) $(libelf)
++debuglink_LDADD = $(libeu) $(libdw) $(libelf)
++debugaltlink_LDADD = $(libeu) $(libdw) $(libelf)
++buildid_LDADD = $(libeu) $(libdw) $(libelf)
+ deleted_LDADD = ./deleted-lib.so
+ deleted_lib_so_LDFLAGS = -shared
+ deleted_lib_so_CFLAGS = $(fpic_CFLAGS) -fasynchronous-unwind-tables
+ aggregate_size_LDADD = $(libdw) $(libelf) $(argp_LDADD)
+ peel_type_LDADD = $(libdw) $(libelf) $(argp_LDADD)
+-vdsosyms_LDADD = $(libdw) $(libelf)
+-getsrc_die_LDADD = $(libdw) $(libelf)
++vdsosyms_LDADD = $(libeu) $(libdw) $(libelf)
++getsrc_die_LDADD = $(libeu) $(libdw) $(libelf)
+ strptr_LDADD = $(libelf)
+ newdata_LDADD = $(libelf)
+ elfstrtab_LDADD = $(libelf)
+-dwfl_proc_attach_LDADD = $(libdw)
++dwfl_proc_attach_LDADD = $(libeu) $(libdw)
+ dwfl_proc_attach_LDFLAGS = -pthread -rdynamic $(AM_LDFLAGS)
+ elfshphehdr_LDADD =$(libelf)
+-elfstrmerge_LDADD = $(libdw) $(libelf)
++elfstrmerge_LDADD = $(libeu) $(libdw) $(libelf)
+ dwelfgnucompressed_LDADD = $(libelf) $(libdw)
+ elfgetchdr_LDADD = $(libelf) $(libdw)
+ elfgetzdata_LDADD = $(libelf)
+@@ -743,7 +743,7 @@ get_units_split_LDADD = $(libdw)
+ attr_integrate_skel_LDADD = $(libdw)
+ all_dwarf_ranges_LDADD = $(libdw)
+ unit_info_LDADD = $(libdw)
+-next_cfi_LDADD = $(libelf) $(libdw)
++next_cfi_LDADD = $(libeu) $(libelf) $(libdw)
+ elfcopy_LDADD = $(libelf)
+ addsections_LDADD = $(libelf)
+ debuginfod_build_id_find_LDADD = $(libelf) $(libdw)
+-- 
+2.37.3
+
-- 
2.37.3


