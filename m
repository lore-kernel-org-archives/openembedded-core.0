Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE445C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 20:56:38 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.454.1663102589035638400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 13:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P7LiXLIo;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id q63so12433545pga.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=wFO6CbGK4guXENX6we3jL2Wj6bsIUwLRZDcpjmQ5gXI=;
        b=P7LiXLIo5hXh06r9Y5sUswkno+N5y/Qrb5kQoH+wgyarm9LqrzBAqRClvyqGFsxDr7
         VDK2fZdIXqWs4C9Kci26giEYNx98TJguhcJQaZ97IXH7WrB7HOmE0IVSepVuzC3AShAB
         7L7QeK3gTVsezy+3wRbCV2U3RiIsL7Qih3iIcVNe3cScBXQLviKORV/MJ4D2U6PUBBDg
         h/qcOJONpJ3womkGsNO/Y9111slylKM8PL8bQAsHA/78ffjp5+rIiOFsfvzNf+FPJDTf
         FU7pXAbFUKrlCzmr56hUjJBJTTomm88YRg09FkDSXNRwB1/N89lYogiZzSGqbSzpZI6b
         OhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=wFO6CbGK4guXENX6we3jL2Wj6bsIUwLRZDcpjmQ5gXI=;
        b=qr9k1bGsC07PACJyJ8chS/zpGvOMko8lHXleVOLr903RbNqx5Kaebvj/DTXHo08IS0
         Qv2GOb5XLYcGgZq5v2pLJcRVjLlQomYUmQ5xBpNcvuhmD7Xiuev3o0LxUHkZsmzEY4nS
         jkXON4jKQQ33LorNq0PGoUbSRayANQPeI3Ket0zppa2e61dVVVx5EwTKYYp1Qd7SJxIO
         psEVr45sb/nJmsI9Re9bBm8QU4+4A03jP8dQq6KqxFFLOTA+7hX7G1XD865nSJEN67Xv
         jp7PErSkfjluNmzozfO3ykoWNSjNW8eGm28kyJLR04hoF168P7jE6FkWgGyIFwUWCWvL
         UwTQ==
X-Gm-Message-State: ACgBeo0ro71OITQhQHKnSTBYsN9oMlx7fLILfByRs3qRWZt+H1z8huDz
	B0fNO9WfXBTMQVgSs8IAK4bmxwtbtfakvQ==
X-Google-Smtp-Source: 
 AA6agR5dg99ACv3GYh+waJ5WsR2xd56w1U7a9cQdhKCJ0vukxcPo0pEKCS5D3NFNG9JXL0LaB3/zqw==
X-Received: by 2002:a05:6a00:174f:b0:537:6845:8b1a with SMTP id
 j15-20020a056a00174f00b0053768458b1amr35344920pfc.68.1663102588143;
        Tue, 13 Sep 2022 13:56:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a6546ce000000b00429ffc18e5csm8103979pgr.59.2022.09.13.13.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 13:56:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] elfutils: Enable ptests on musl targets
Date: Tue, 13 Sep 2022 13:56:25 -0700
Message-Id: <20220913205625.1073723-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 20:56:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170612

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Install libeu.a into ptest package

 .../elfutils/elfutils_0.187.bb                |   4 +-
 ...Add-libeu-to-tests-needing-error-API.patch | 147 ++++++++++++++++++
 2 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-tests-Add-libeu-to-tests-needing-error-API.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.187.bb b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
index 561112c580..40c51c8814 100644
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
 
@@ -66,6 +66,7 @@ do_install_ptest() {
 		# copy the files which needed by the cases
 		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip"
 		install -d -m 755                       ${D}${PTEST_PATH}/src
+		install -d -m 755                       ${D}${PTEST_PATH}/lib
 		install -d -m 755                       ${D}${PTEST_PATH}/libelf
 		install -d -m 755                       ${D}${PTEST_PATH}/libdw
 		install -d -m 755                       ${D}${PTEST_PATH}/libdwfl
@@ -83,6 +84,7 @@ do_install_ptest() {
 		cp ${D}${libdir}/libasm-${PV}.so ${D}${PTEST_PATH}/libasm/libasm.so
 		cp ${B}/libcpu/libcpu.a ${D}${PTEST_PATH}/libcpu/
 		cp ${B}/libebl/libebl.a ${D}${PTEST_PATH}/libebl/
+		cp ${B}/lib/libeu.a ${D}${PTEST_PATH}/lib/
 		cp ${S}/libelf/*.h             ${D}${PTEST_PATH}/libelf/
 		cp ${S}/libdw/*.h              ${D}${PTEST_PATH}/libdw/
 		cp ${S}/libdwfl/*.h            ${D}${PTEST_PATH}/libdwfl/
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


